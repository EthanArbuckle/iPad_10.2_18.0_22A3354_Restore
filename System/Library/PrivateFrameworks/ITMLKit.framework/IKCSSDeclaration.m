@implementation IKCSSDeclaration

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

}

- (void)setAliasedName:(id)a3
{
  NSString *v4;
  NSString *aliasedName;

  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  aliasedName = self->_aliasedName;
  self->_aliasedName = v4;

}

- (NSString)stringValue
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%@ has not implemented stringValue)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)description
{
  return CFSTR("\"base declaration\");
}

+ (id)typeString:(unint64_t)a3
{
  if (a3 > 8)
    return CFSTR("UNDEFINED");
  else
    return off_1E9F4D100[a3];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)aliasedName
{
  return self->_aliasedName;
}

- (BOOL)important
{
  return self->_important;
}

- (void)setImportant:(BOOL)a3
{
  self->_important = a3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)nameRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_nameRange.length;
  location = self->_nameRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setNameRange:(_NSRange)a3
{
  self->_nameRange = a3;
}

- (_NSRange)valueRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_valueRange.length;
  location = self->_valueRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setValueRange:(_NSRange)a3
{
  self->_valueRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliasedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
