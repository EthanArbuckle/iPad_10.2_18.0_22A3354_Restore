@implementation IKCSSParseRule

- (IKCSSParseRule)init
{
  IKCSSParseRule *v2;
  IKCSSParseRule *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseRule;
  v2 = -[IKCSSParseObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IKCSSParseObject setType:](v2, "setType:", 3);
    v3->__endRange = (_NSRange)xmmword_1D96A7A30;
  }
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
  uint64_t location;
  NSUInteger v10;
  NSUInteger length;
  NSUInteger v12;
  NSRange v13;
  NSUInteger v14;
  NSUInteger v15;
  NSRange v16;
  NSRange v17;
  NSRange v18;
  _NSRange result;
  NSRange v20;
  NSRange v21;

  -[IKCSSParseRule prelude](self, "prelude");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "range");
  v7 = v6;

  -[IKCSSParseRule block](self, "block");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  location = objc_msgSend(v8, "range");
  length = v10;

  if (-[IKCSSParseRule _endRange](self, "_endRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20.location = -[IKCSSParseRule _endRange](self, "_endRange");
    v20.length = v12;
    v17.location = location;
    v17.length = length;
    v13 = NSUnionRange(v17, v20);
    location = v13.location;
    length = v13.length;
  }
  v18.location = v5;
  v18.length = v7;
  v21.location = location;
  v21.length = length;
  v16 = NSUnionRange(v18, v21);
  v15 = v16.length;
  v14 = v16.location;
  result.length = v15;
  result.location = v14;
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
  NSRange v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.location = -[IKCSSParseRule range](self, "range");
  NSStringFromRange(v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseRule prelude](self, "prelude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toNSArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKCSSParseObject stringifyList:](IKCSSParseObject, "stringifyList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKCSSParseRule block](self, "block");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\"IKCSSParseRule(%@)\": {\"prelude\":%@, \"block\":{%@}}"), v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (IKArray)prelude
{
  return self->_prelude;
}

- (void)setPrelude:(id)a3
{
  objc_storeStrong((id *)&self->_prelude, a3);
}

- (IKCSSParseBlock)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_storeStrong((id *)&self->_block, a3);
}

- (_NSRange)_endRange
{
  _NSRange *p_endRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_endRange = &self->__endRange;
  location = self->__endRange.location;
  length = p_endRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)_setEndRange:(_NSRange)a3
{
  self->__endRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_block, 0);
  objc_storeStrong((id *)&self->_prelude, 0);
}

@end
