@implementation IKCSSParseBlock

- (IKCSSParseBlock)init
{
  IKCSSParseBlock *v2;
  IKCSSParseBlock *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseBlock;
  v2 = -[IKCSSParseObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IKCSSParseObject setType:](v2, "setType:", 2);
  return v3;
}

- (_NSRange)range
{
  void *v3;
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger location;
  NSUInteger length;
  NSRange v15;
  NSRange v16;
  _NSRange result;
  NSRange v18;

  -[IKCSSParseObject cssValue](self, "cssValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "range");
  v7 = v6;

  -[IKCSSParseObject cssValue](self, "cssValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "range");
  v12 = v11;

  v16.location = v5;
  v16.length = v7;
  v18.location = v10;
  v18.length = v12;
  v15 = NSUnionRange(v16, v18);
  length = v15.length;
  location = v15.location;
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
  v10.location = -[IKCSSParseBlock range](self, "range");
  NSStringFromRange(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseObject cssValue](self, "cssValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toNSArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"IKCSSParseBlock(%@)\": {\"value\":%@}"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
