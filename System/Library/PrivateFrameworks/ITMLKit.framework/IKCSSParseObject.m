@implementation IKCSSParseObject

- (IKCSSParseObject)init
{
  IKCSSParseObject *v2;
  IKCSSParseObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKCSSParseObject;
  v2 = -[IKCSSParseObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IKCSSParseObject setType:](v2, "setType:", 0);
  return v3;
}

- (id)description
{
  return CFSTR("\"BASE_CLASS_PARSE_OBJECT\");
}

+ (id)stringifyList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = CFSTR("[");
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("{%@}, "), v10);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v7 = CFSTR("[");
  }
  if ((unint64_t)-[__CFString length](v7, "length") >= 2)
  {
    -[__CFString substringWithRange:](v7, "substringWithRange:", 0, -[__CFString length](v7, "length") - 2);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v11;
  }
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (IKArray)cssValue
{
  return self->_cssValue;
}

- (void)setCssValue:(id)a3
{
  objc_storeStrong((id *)&self->_cssValue, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cssValue, 0);
}

@end
