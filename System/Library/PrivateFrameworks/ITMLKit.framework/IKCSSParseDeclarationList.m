@implementation IKCSSParseDeclarationList

- (IKCSSParseDeclarationList)init
{
  IKCSSParseDeclarationList *v2;
  IKCSSParseDeclarationList *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseDeclarationList;
  v2 = -[IKCSSParseBlock init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IKCSSParseObject setType:](v2, "setType:", 9);
  return v3;
}

- (void)setRange:(_NSRange)a3
{
  self->__range = a3;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->__range;
  location = self->__range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSRange v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.location = -[IKCSSParseDeclarationList range](self, "range");
  NSStringFromRange(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseObject cssValue](self, "cssValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toNSArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"IKCSSParseDeclarationList(%@)\": {\"value\":%@}"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
