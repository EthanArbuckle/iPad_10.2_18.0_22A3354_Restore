@implementation IKCSSParseDeclaration

- (IKCSSParseDeclaration)init
{
  IKCSSParseDeclaration *v2;
  IKCSSParseDeclaration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseDeclaration;
  v2 = -[IKCSSParseObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IKCSSParseObject setType:](v2, "setType:", 8);
    -[IKCSSParseDeclaration setImportant:](v3, "setImportant:", 0);
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  NSRange v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.location = -[IKCSSParseObject range](self, "range");
  NSStringFromRange(v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseDeclaration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseObject cssValue](self, "cssValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toNSArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IKCSSParseDeclaration important](self, "important");
  v10 = CFSTR("false");
  if (v9)
    v10 = CFSTR("true");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"IKCSSParseDeclaration(%@)\": {\"name\":\"%@\", \"value\":%@, \"important\":%@}"), v4, v5, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_NSRange)nameRange
{
  _NSRange *p_nameRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_nameRange = &self->_nameRange;
  location = self->_nameRange.location;
  length = p_nameRange->length;
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
  _NSRange *p_valueRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_valueRange = &self->_valueRange;
  location = self->_valueRange.location;
  length = p_valueRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setValueRange:(_NSRange)a3
{
  self->_valueRange = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)important
{
  return self->_important;
}

- (void)setImportant:(BOOL)a3
{
  self->_important = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
