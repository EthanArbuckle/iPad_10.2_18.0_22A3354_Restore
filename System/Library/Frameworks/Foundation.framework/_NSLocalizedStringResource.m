@implementation _NSLocalizedStringResource

- (void)encodeWithCoder:(id)a3
{
  void *v5;

  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be encoded by non-keyed archivers"), objc_opt_class()), 0);
    objc_exception_throw(v5);
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_resource, CFSTR("NSResource"));
}

- (_NSLocalizedStringResource)initWithCoder:(id)a3
{
  uint64_t v6;
  void *v8;

  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be encoded by non-keyed archivers"), objc_opt_class()), 0);
    objc_exception_throw(v8);
  }
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSResource"));
  if (objc_msgSend(a3, "error"))
    return 0;
  if (!v6)
  {
    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("%@: null value for key NSResource"), _NSMethodExceptionProem((objc_class *)self, a2)));
    return 0;
  }
  return -[_NSLocalizedStringResource initWithResource:](self, "initWithResource:", v6);
}

- (NSString)table
{
  return (NSString *)(id)-[NSString copy](-[_NSLocalizedStringResourceSwiftWrapper table](self->_resource, "table"), "copy");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLocale:(id)a3
{
  -[_NSLocalizedStringResourceSwiftWrapper setLocale:](self->_resource, "setLocale:", a3);
}

- (id)localize
{
  return -[_NSLocalizedStringResourceSwiftWrapper localize](self->_resource, "localize");
}

- (NSString)defaultValue
{
  return (NSString *)(id)-[NSString copy](-[_NSLocalizedStringResourceSwiftWrapper defaultValue](self->_resource, "defaultValue"), "copy");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSLocalizedStringResource;
  -[_NSLocalizedStringResource dealloc](&v3, sel_dealloc);
}

- (NSString)key
{
  return (NSString *)(id)-[NSString copy](-[_NSLocalizedStringResourceSwiftWrapper key](self->_resource, "key"), "copy");
}

- (id)resource
{
  return (id)-[_NSLocalizedStringResourceSwiftWrapper copy](self->_resource, "copy");
}

- (_NSLocalizedStringResource)initWithResource:(id)a3
{
  _NSLocalizedStringResource *v6;
  NSString *v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid argument"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0));
  }
  v9.receiver = self;
  v9.super_class = (Class)_NSLocalizedStringResource;
  v6 = -[_NSLocalizedStringResource init](&v9, sel_init);
  if (v6)
    v6->_resource = (_NSLocalizedStringResourceSwiftWrapper *)objc_msgSend(a3, "copy");
  return v6;
}

- (id)localizeWithOptions:(id)a3
{
  return -[_NSLocalizedStringResourceSwiftWrapper localizeWithOptions:](self->_resource, "localizeWithOptions:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_NSLocalizedStringResource initWithResource:]([_NSLocalizedStringResource alloc], "initWithResource:", self->_resource);
}

- (NSURL)bundleURL
{
  return (NSURL *)(id)-[NSURL copy](-[_NSLocalizedStringResourceSwiftWrapper bundleURL](self->_resource, "bundleURL"), "copy");
}

- (_NSLocalizedStringResource)initWithKey:(id)a3 table:(id)a4 locale:(id)a5 bundleURL:(id)a6
{
  return -[_NSLocalizedStringResource initWithKey:defaultValue:table:locale:bundleURL:](self, "initWithKey:defaultValue:table:locale:bundleURL:", a3, 0, a4, a5, a6);
}

- (_NSLocalizedStringResource)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 locale:(id)a6 bundleURL:(id)a7
{
  _NSLocalizedStringResource *v12;
  void *v14;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a6 || !a7)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)_NSLocalizedStringResource;
  v12 = -[_NSLocalizedStringResource init](&v15, sel_init);
  if (v12)
    v12->_resource = -[_NSLocalizedStringResourceSwiftWrapper initWithKey:defaultValue:table:locale:bundleURL:]([_NSLocalizedStringResourceSwiftWrapper alloc], "initWithKey:defaultValue:table:locale:bundleURL:", a3, a4, a5, a6, a7);
  return v12;
}

- (NSLocale)locale
{
  return (NSLocale *)(id)-[NSLocale copy](-[_NSLocalizedStringResourceSwiftWrapper locale](self->_resource, "locale"), "copy");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<_NSStringLocalizationResource: %p>(%@)"), self, -[_NSLocalizedStringResourceSwiftWrapper description](self->_resource, "description"));
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  return -[_NSLocalizedStringResourceSwiftWrapper hash](self->_resource, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[_NSLocalizedStringResourceSwiftWrapper isEqual:](self->_resource, "isEqual:", *((_QWORD *)a3 + 1));
}

@end
