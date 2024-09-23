@implementation IKCSSToken

- (IKCSSToken)initWithType:(int64_t)a3
{
  IKCSSToken *v4;
  IKCSSToken *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IKCSSToken;
  v4 = -[IKCSSToken init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[IKCSSToken setType:](v4, "setType:", a3);
  return v5;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = -[IKCSSToken type](self, "type");
  if (v3 > 0x20)
    v4 = CFSTR("DEFAULT_TYPE");
  else
    v4 = off_1E9F4E078[v3];
  -[IKCSSToken properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v31 = v5;
    v32 = v4;
    -[IKCSSToken properties](self, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      v12 = CFSTR(", \"properties\": {");
      do
      {
        v13 = 0;
        v14 = v12;
        do
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v13);
          -[IKCSSToken properties](self, "properties");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "valueForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR("\"%@\": \"%@\", "), v15, v17);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v13;
          v14 = v12;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v10);
    }
    else
    {
      v12 = CFSTR(", \"properties\": {");
    }

    if (objc_msgSend(v8, "count"))
    {
      -[__CFString substringWithRange:](v12, "substringWithRange:", 0, -[__CFString length](v12, "length") - 2);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v19;
    }
    v5 = v31;
    v4 = v32;
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("}"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = CFSTR(", \"properties\": {");
  }
  if (-[IKCSSToken type](self, "type") == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", \"value\": \"%i (%C)\"), -[IKCSSToken charValue](self, "charValue"), -[IKCSSToken charValue](self, "charValue"));
LABEL_22:
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v20 = -[IKCSSToken type](self, "type");
  v21 = (void *)MEMORY[0x1E0CB3940];
  if (v20 == 13)
  {
    -[IKCSSToken doubleValue](self, "doubleValue");
    objc_msgSend(v21, "stringWithFormat:", CFSTR(", \"value\": \"%.2f\"), v22, v30);
    goto LABEL_22;
  }
  -[IKCSSToken stringValue](self, "stringValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR(", \"value\": \"%@\"), v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"token\": {\"type\": \"%@\"%@"), v4, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v5)
  {
    objc_msgSend(v25, "stringByAppendingString:", v18);
    v27 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v27;
  }
  objc_msgSend(v26, "stringByAppendingString:", CFSTR("}"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unsigned)charValue
{
  return self->_charValue;
}

- (void)setCharValue:(unsigned __int16)a3
{
  self->_charValue = a3;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
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

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
