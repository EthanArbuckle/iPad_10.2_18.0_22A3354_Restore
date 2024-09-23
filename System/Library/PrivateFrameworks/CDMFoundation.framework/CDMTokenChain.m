@implementation CDMTokenChain

- (CDMTokenChain)initWithString:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  CDMTokenChain *v8;
  uint64_t v9;
  NSString *string;
  uint64_t v11;
  NSString *locale;
  uint64_t v13;
  NSMutableArray *tokens;
  uint64_t v15;
  NSMutableArray *characterToTokenIndexMapping;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDMTokenChain;
  v8 = -[CDMTokenChain init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    string = v8->_string;
    v8->_string = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    locale = v8->_locale;
    v8->_locale = (NSString *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
    tokens = v8->_tokens;
    v8->_tokens = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    characterToTokenIndexMapping = v8->_characterToTokenIndexMapping;
    v8->_characterToTokenIndexMapping = (NSMutableArray *)v15;

  }
  return v8;
}

- (CDMTokenChain)initWithString:(id)a3 locale:(id)a4 tokens:(id)a5
{
  id v8;
  CDMTokenChain *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = -[CDMTokenChain initWithString:locale:](self, "initWithString:locale:", a3, a4);
  if (v9)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v10);
          -[CDMTokenChain addToken:](v9, "addToken:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  return v9;
}

- (CDMTokenChain)initWithProtoTokenChain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CDMTokenChain *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CDMToken *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDMTokenChain initWithString:locale:](self, "initWithString:locale:", v5, v6);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "tokens", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = -[CDMToken initWithProtoToken:]([CDMToken alloc], "initWithProtoToken:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
        -[CDMTokenChain addToken:](v7, "addToken:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:locale:", self->_string, self->_locale);
  if (v4)
  {
    v5 = -[NSMutableArray copy](self->_tokens, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = -[NSMutableArray copy](self->_characterToTokenIndexMapping, "copy");
    v8 = (void *)v4[2];
    v4[2] = v7;

  }
  return v4;
}

- (void)addToken:(id)a3
{
  uint64_t i;
  NSMutableArray *characterToTokenIndexMapping;
  void *v6;
  uint64_t j;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NSMutableArray addObject:](self->_tokens, "addObject:");
  if (objc_msgSend(v10, "isWhiteSpace"))
  {
    for (i = objc_msgSend(v10, "begin"); i < objc_msgSend(v10, "end"); ++i)
    {
      characterToTokenIndexMapping = self->_characterToTokenIndexMapping;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](characterToTokenIndexMapping, "addObject:", v6);

    }
  }
  else
  {
    for (j = objc_msgSend(v10, "begin"); j < objc_msgSend(v10, "end"); ++j)
    {
      v8 = self->_characterToTokenIndexMapping;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "tokenIndex"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v8, "addObject:", v9);

    }
  }

}

- (id)normalizedString
{
  return -[CDMTokenChain cleanStringFromToken:toToken:](self, "cleanStringFromToken:toToken:", 0, -[NSMutableArray count](self->_tokens, "count") - 1);
}

- (id)cleanStringFromToken:(int64_t)a3 toToken:(int64_t)a4
{
  void *v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_tokens, "count") > (unint64_t)a3 && a3 <= a4)
  {
    do
    {
      if (a3 >= (unint64_t)-[NSMutableArray count](self->_tokens, "count"))
        break;
      -[NSMutableArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "getHasCleanValues");

      if (v10)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        -[NSMutableArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cleanValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v12);
              objc_msgSend(v7, "appendString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v13);
        }
      }
      else
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v16);

      }
    }
    while (a3++ != a4);
  }
  return v7;
}

- (unsigned)nonWhiteSpaceCountFromToken:(int64_t)a3 toToken:(int64_t)a4
{
  unint64_t v7;
  unsigned int v8;
  void *v10;
  int v11;

  v7 = -[NSMutableArray count](self->_tokens, "count");
  v8 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v7 > a3 && a3 < a4)
  {
    v8 = 0;
    do
    {
      if (a3 >= (unint64_t)-[NSMutableArray count](self->_tokens, "count"))
        break;
      -[NSMutableArray objectAtIndexedSubscript:](self->_tokens, "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isWhiteSpace");

      v8 += v11 ^ 1;
      ++a3;
    }
    while (a4 != a3);
  }
  return v8;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("{ string:%@ locale:%@ tokens: ["), self->_string, self->_locale);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_tokens;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "appendString:", CFSTR("]}"));
  return v3;
}

- (int)tokenIndexFromCharacterIndex:(int64_t)a3
{
  void *v3;
  int v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_characterToTokenIndexMapping, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (id)dropWhitespaceTokens
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:locale:", self->_string, self->_locale);
  v4 = (void *)-[NSMutableArray copy](self->_tokens, "copy");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isWhiteSpace", (_QWORD)v11) & 1) == 0)
          objc_msgSend(v3, "addToken:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)dropInsignificantTokens
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:locale:", self->_string, self->_locale);
  v4 = (void *)-[NSMutableArray copy](self->_tokens, "copy");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSignificant", (_QWORD)v11))
          objc_msgSend(v3, "addToken:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)extractTokens
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  CFIndex Length;
  std::basic_string<char16_t>::value_type v9;
  std::basic_string<char16_t> *v10;
  std::basic_string<char16_t>::size_type size;
  char v12;
  CDMToken *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::basic_string<char16_t> *p_p;
  std::basic_string<char16_t>::size_type v20;
  void *v21;
  CDMToken *v22;
  void *v23;
  NSMutableArray *obj;
  id v26;
  uint64_t v27;
  uint64_t v28;
  std::basic_string<char16_t> v29;
  std::basic_string<char16_t> __p;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CFRange v37;

  v36 = *MEMORY[0x24BDAC8D0];
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->_tokens;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v3)
  {
    v27 = *(_QWORD *)v32;
    do
    {
      v4 = 0;
      v28 = v3;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v4);
        memset(&__p, 0, sizeof(__p));
        if ((objc_msgSend(v5, "isWhiteSpace") & 1) == 0)
        {
          objc_msgSend(v5, "cleanValue");
          v6 = (const __CFString *)(id)objc_claimAutoreleasedReturnValue();
          v7 = (__CFString *)v6;
          memset(&v29, 0, sizeof(v29));
          if (v6)
          {
            Length = CFStringGetLength(v6);
            std::basic_string<char16_t>::resize(&v29, Length, v9);
            if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v10 = &v29;
            else
              v10 = (std::basic_string<char16_t> *)v29.__r_.__value_.__r.__words[0];
            v37.location = 0;
            v37.length = Length;
            CFStringGetCharacters(v7, v37, (UniChar *)v10);
          }

          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          __p = v29;
          *((_BYTE *)&v29.__r_.__value_.__s + 23) = 0;
          v29.__r_.__value_.__s.__data_[0] = 0;

        }
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          size = __p.__r_.__value_.__l.__size_;
        if (size)
        {
          v13 = [CDMToken alloc];
          objc_msgSend(v5, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v5, "begin");
          v16 = objc_msgSend(v5, "end");
          v17 = objc_msgSend(v5, "isSignificant");
          v18 = objc_msgSend(v5, "isWhiteSpace");
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (std::basic_string<char16_t> *)__p.__r_.__value_.__r.__words[0];
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          else
            v20 = __p.__r_.__value_.__l.__size_;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", p_p, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[CDMToken initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:](v13, "initWithValue:begin:end:significant:whitespace:cleanValue:tokenIndex:nonWhitespaceTokenIndex:", v14, v15, v16, v17, v18, v21, objc_msgSend(v5, "tokenIndex"), objc_msgSend(v5, "nonWhitespaceTokenIndex"));

          objc_msgSend(v26, "addObject:", v22);
          v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        if (v12 < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        ++v4;
      }
      while (v28 != v4);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v3);
  }

  v23 = (void *)objc_msgSend(v26, "copy");
  return v23;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSArray)tokens
{
  return &self->_tokens->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_characterToTokenIndexMapping, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

+ (id)convertCDMTokenChainToProtoTokenChain:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE9E300]);
  if (v3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v3;
    objc_msgSend(v3, "tokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
          v10 = objc_alloc_init(MEMORY[0x24BE9E2F8]);
          objc_msgSend(v10, "setBegin:", objc_msgSend(v9, "begin"));
          objc_msgSend(v10, "setEnd:", objc_msgSend(v9, "end"));
          objc_msgSend(v9, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:", v11);

          objc_msgSend(v10, "setIsSignificant:", objc_msgSend(v9, "isSignificant"));
          objc_msgSend(v10, "setIsWhitespace:", objc_msgSend(v9, "isWhiteSpace"));
          objc_msgSend(v9, "cleanValues");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v10, "setCleanValues:", v13);

          objc_msgSend(v9, "cleanValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCleanValue:", v14);

          objc_msgSend(v10, "setTokenIndex:", objc_msgSend(v9, "tokenIndex"));
          objc_msgSend(v10, "setNonWhitespaceTokenIndex:", objc_msgSend(v9, "nonWhitespaceTokenIndex"));
          objc_msgSend(v9, "normalizedValues");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "copy");
          objc_msgSend(v10, "setNormalizedValues:", v16);

          objc_msgSend(v4, "addTokens:", v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);
    }

    objc_msgSend(v20, "locale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v17);

    objc_msgSend(v20, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStringValue:", v18);

    v3 = v20;
  }

  return v4;
}

@end
