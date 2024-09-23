@implementation IKCSSAtParseRule

- (IKCSSAtParseRule)init
{
  IKCSSAtParseRule *v2;
  IKCSSAtParseRule *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSAtParseRule;
  v2 = -[IKCSSParseRule init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IKCSSParseObject setType:](v2, "setType:", 5);
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
  uint64_t location;
  NSUInteger v11;
  NSUInteger length;
  NSUInteger v13;
  NSRange v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  NSRange v18;
  NSRange v19;
  _NSRange result;
  NSRange v21;
  NSRange v22;

  -[IKCSSParseRule prelude](self, "prelude");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "range");
  v7 = v6;

  -[IKCSSParseObject cssValue](self, "cssValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  location = objc_msgSend(v9, "range");
  length = v11;

  if (-[IKCSSParseRule _endRange](self, "_endRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v21.location = -[IKCSSParseRule _endRange](self, "_endRange");
    v21.length = v13;
    v18.location = location;
    v18.length = length;
    v14 = NSUnionRange(v18, v21);
    location = v14.location;
    length = v14.length;
  }
  v19.location = v5;
  v19.length = v7;
  v22.location = location;
  v22.length = length;
  v17 = NSUnionRange(v19, v22);
  v16 = v17.length;
  v15 = v17.location;
  result.length = v16;
  result.location = v15;
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
  void *v9;
  void *v10;
  NSRange v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.location = -[IKCSSAtParseRule range](self, "range");
  NSStringFromRange(v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSAtParseRule name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseRule prelude](self, "prelude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toNSArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseRule block](self, "block");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"IKCSSAtParseRule(%@)\": {\"name\":{%@}, \"prelude\":%@, \"block\":{%@}}"), v4, v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
