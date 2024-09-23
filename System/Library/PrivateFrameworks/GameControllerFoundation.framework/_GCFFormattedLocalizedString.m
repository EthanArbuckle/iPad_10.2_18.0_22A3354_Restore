@implementation _GCFFormattedLocalizedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCFFormattedLocalizedString)initWithFormat:(id)a3 arg:(id)a4
{
  _GCFFormattedLocalizedString *v5;

  if (!a3)
    return 0;
  v5 = self;
  self->_format = (GCFLocalizedString *)objc_msgSend(a3, "copy");
  v5->_arg = (GCFLocalizedString *)objc_msgSend(a4, "copy");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCFFormattedLocalizedString;
  -[_GCFFormattedLocalizedString dealloc](&v3, sel_dealloc);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (_GCFFormattedLocalizedString)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arg"));
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "decodeObject");
    v6 = objc_msgSend(a3, "decodeObject");
  }
  v7 = (void *)v6;
  self->_format = (GCFLocalizedString *)objc_msgSend(v5, "copy");
  self->_arg = (GCFLocalizedString *)objc_msgSend(v7, "copy");
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int v5;
  GCFLocalizedString *format;

  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  format = self->_format;
  if (v5)
  {
    objc_msgSend(a3, "encodeObject:forKey:", format, CFSTR("format"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_arg, CFSTR("arg"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", format);
    objc_msgSend(a3, "encodeObject:", self->_arg);
  }
}

- (id)key
{
  return self->_format;
}

- (id)bundle
{
  return -[GCFLocalizedString bundle](self->_format, "bundle");
}

- (id)table
{
  return -[GCFLocalizedString table](self->_format, "table");
}

- (id)_realizedString
{
  GCFLocalizedString *realizedString;
  unint64_t v5;
  NSString *v6;

  realizedString = (GCFLocalizedString *)self->__realizedString;
  if (!realizedString)
  {
    objc_sync_enter(self);
    realizedString = (GCFLocalizedString *)self->__realizedString;
    if (!realizedString)
    {
      v5 = -[GCFLocalizedString length](self->_format, "length");
      realizedString = self->_format;
      if (v5)
      {
        if (-[NSString gc_countOfOccurrencesOfString:options:](self->_format, "gc_countOfOccurrencesOfString:options:", CFSTR("%@"), 0) != 1)
        {
          v6 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid resolved format string '%@'."), self->_format);
          objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
        }
        if (!self->_arg)
          objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Missing argument string."), 0));
        realizedString = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", self->_format, self->_arg);
      }
      self->__realizedString = (NSString *)-[GCFLocalizedString copy](realizedString, "copy");
    }
    objc_sync_exit(self);
  }
  return realizedString;
}

@end
