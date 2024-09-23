@implementation CDMToken

- (CDMToken)initWithValue:(id)a3
{
  id v4;
  CDMToken *v5;

  v4 = a3;
  v5 = -[CDMToken initWithValue:begin:end:significant:](self, "initWithValue:begin:end:significant:", v4, 0, objc_msgSend(v4, "length"), 1);

  return v5;
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5
{
  return -[CDMToken initWithValue:begin:end:significant:](self, "initWithValue:begin:end:significant:", a3, a4, a5, 1);
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  CDMToken *v15;

  v6 = a6;
  v10 = (void *)MEMORY[0x24BDD14A8];
  v11 = a3;
  objc_msgSend(v10, "whitespaceCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length") == 0;

  v15 = -[CDMToken initWithValue:begin:end:significant:whitespace:](self, "initWithValue:begin:end:significant:whitespace:", v11, a4, a5, v6, v14);
  return v15;
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7
{
  return -[CDMToken initWithValue:begin:end:significant:whitespace:cleanValue:](self, "initWithValue:begin:end:significant:whitespace:cleanValue:", a3, a4, a5, a6, a7, a3);
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8
{
  return -[CDMToken initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:](self, "initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:", a3, a4, a5, a6, a7, a8, -1, -1);
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8 tokenIndex:(int64_t)a9 nonWhitespaceTokenIndex:(int64_t)a10
{
  id v17;
  id v18;
  CDMToken *v19;
  CDMToken *v20;
  uint64_t v21;
  NSMutableArray *normalizedValues;
  objc_super v24;

  v17 = a3;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CDMToken;
  v19 = -[CDMToken init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_value, a3);
    v20->_begin = a4;
    v20->_end = a5;
    v20->_isSignificant = a6;
    v20->_isWhiteSpace = a7;
    v20->_tokenIndex = a9;
    v20->_nonWhitespaceTokenIndex = a10;
    objc_storeStrong((id *)&v20->_cleanValue, a8);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v21 = objc_claimAutoreleasedReturnValue();
    normalizedValues = v20->_normalizedValues;
    v20->_normalizedValues = (NSMutableArray *)v21;

  }
  return v20;
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8 tokenIndex:(int64_t)a9 nonWhitespaceTokenIndex:(int64_t)a10 normalizedValues:(id)a11
{
  id v17;
  id v18;
  id v19;
  CDMToken *v20;
  CDMToken *v21;
  objc_super v24;

  v17 = a3;
  v18 = a8;
  v19 = a11;
  v24.receiver = self;
  v24.super_class = (Class)CDMToken;
  v20 = -[CDMToken init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_value, a3);
    v21->_begin = a4;
    v21->_end = a5;
    v21->_isSignificant = a6;
    v21->_isWhiteSpace = a7;
    v21->_tokenIndex = a9;
    v21->_nonWhitespaceTokenIndex = a10;
    objc_storeStrong((id *)&v21->_cleanValue, a8);
    objc_storeStrong((id *)&v21->_normalizedValues, a11);
  }

  return v21;
}

- (CDMToken)initWithProtoToken:(id)a3
{
  id v4;
  CDMToken *v5;
  uint64_t v6;
  NSString *value;
  uint64_t v8;
  NSString *cleanValue;
  void *v10;
  uint64_t v11;
  NSMutableArray *normalizedValues;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDMToken;
  v5 = -[CDMToken init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v6;

    v5->_begin = (int)objc_msgSend(v4, "begin");
    v5->_end = (int)objc_msgSend(v4, "end");
    v5->_isSignificant = objc_msgSend(v4, "isSignificant");
    v5->_isWhiteSpace = objc_msgSend(v4, "isWhitespace");
    v5->_tokenIndex = (int)objc_msgSend(v4, "tokenIndex");
    v5->_nonWhitespaceTokenIndex = (int)objc_msgSend(v4, "nonWhitespaceTokenIndex");
    objc_msgSend(v4, "cleanValue");
    v8 = objc_claimAutoreleasedReturnValue();
    cleanValue = v5->_cleanValue;
    v5->_cleanValue = (NSString *)v8;

    objc_msgSend(v4, "normalizedValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    normalizedValues = v5->_normalizedValues;
    v5->_normalizedValues = (NSMutableArray *)v11;

  }
  return v5;
}

- (BOOL)hasValue:(id)a3 from:(int64_t)a4 to:(int64_t)a5
{
  id v8;
  char v9;
  void *v10;

  v8 = a3;
  if (-[CDMToken begin](self, "begin") <= a4 && -[CDMToken end](self, "end") >= a5)
  {
    -[CDMToken value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)addNormalizedValue:(id)a3
{
  -[NSMutableArray addObject:](self->_normalizedValues, "addObject:", a3);
}

- (BOOL)getHasCleanValues
{
  void *v2;
  BOOL v3;

  if (!self->_cleanValue)
    return 0;
  -[CDMToken cleanValues](self, "cleanValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)cleanValues
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (self->_cleanValue)
  {
    v4[0] = self->_cleanValue;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_isSignificant)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_isWhiteSpace)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{ value: %@, begin: %td, end: %td, significant: %@, whitespace: %@, cleanValue: %@, normalizedValues: %@}"), *(_OWORD *)&self->_value, self->_end, v3, v2, self->_cleanValue, self->_normalizedValues);
}

- (id)dictionaryRepresentation
{
  int64_t begin;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  NSString *cleanValue;
  NSMutableArray *normalizedValues;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  begin = self->_begin;
  v13[0] = self->_value;
  v12[0] = CFSTR("value");
  v12[1] = CFSTR("begin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", begin);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("end");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_end);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("NO");
  if (self->_isSignificant)
    v7 = CFSTR("YES");
  v13[2] = v5;
  v13[3] = v7;
  v12[3] = CFSTR("significant");
  v12[4] = CFSTR("cleanValue");
  cleanValue = self->_cleanValue;
  v12[5] = CFSTR("normalizedValues");
  normalizedValues = self->_normalizedValues;
  v13[4] = cleanValue;
  v13[5] = normalizedValues;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)begin
{
  return self->_begin;
}

- (int64_t)end
{
  return self->_end;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (BOOL)isWhiteSpace
{
  return self->_isWhiteSpace;
}

- (NSString)cleanValue
{
  return self->_cleanValue;
}

- (int64_t)tokenIndex
{
  return self->_tokenIndex;
}

- (int64_t)nonWhitespaceTokenIndex
{
  return self->_nonWhitespaceTokenIndex;
}

- (NSArray)normalizedValues
{
  return &self->_normalizedValues->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_normalizedValues, 0);
}

+ (id)getTokenWith:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 isSignificant:(BOOL)a6 isWhitespace:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a7;
  v8 = a6;
  v11 = (objc_class *)MEMORY[0x24BE9E2F8];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v11);
  objc_msgSend(v15, "setValue:", v14);

  objc_msgSend(v15, "setCleanValue:", v13);
  objc_msgSend(v15, "setNormalizedValues:", v12);

  objc_msgSend(v15, "setIsSignificant:", v8);
  objc_msgSend(v15, "setIsWhitespace:", v7);
  return v15;
}

@end
