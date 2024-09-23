@implementation ECRawMessageHeaders

- (ECRawMessageHeaders)initWithHeaderString:(id)a3
{
  id v4;
  ECRawMessageHeaders *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *headers;
  uint64_t v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  NSMutableArray *orderedHeaders;
  uint64_t v25;
  NSMutableArray *v26;
  ECRawMessageHeader *v28;
  void *v29;
  unint64_t v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ECRawMessageHeaders;
  v5 = -[ECRawMessageHeaders init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "ef_rfc6376WhitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = 0;
LABEL_3:
    for (i = v8; i < objc_msgSend(v4, "length"); ++i)
    {
      if (objc_msgSend(v4, "characterAtIndex:", i) == 13
        && i + 1 < objc_msgSend(v4, "length")
        && objc_msgSend(v4, "characterAtIndex:", i + 1) == 10
        && (i + 2 >= objc_msgSend(v4, "length")
         || (objc_msgSend(v6, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:")) & 1) == 0))
      {
        objc_msgSend(v4, "substringWithRange:", v7, i - v7 + 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        v8 = i + 1;
        v30 = i + 2;
        while (1)
        {
          if (v11 >= objc_msgSend(v10, "length"))
          {
            v12 = 0;
            v13 = 0;
            goto LABEL_26;
          }
          if (objc_msgSend(v10, "characterAtIndex:", v11) == 58)
            break;
          ++v11;
        }
        objc_msgSend(v10, "substringToIndex:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "substringFromIndex:", v11 + 1);
        v14 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v14;
        if (v13 && v14)
        {
          v28 = -[ECRawMessageHeader initWithHeaderFieldName:body:]([ECRawMessageHeader alloc], "initWithHeaderFieldName:body:", v13, v14);
          headers = v5->_headers;
          if (!headers)
          {
            v16 = objc_opt_new();
            v17 = v5->_headers;
            v5->_headers = (NSMutableDictionary *)v16;

            headers = v5->_headers;
          }
          -[ECRawMessageHeader name](v28, "name", v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](headers, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = v5->_headers;
            objc_msgSend(v29, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v29);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v5->_headers;
            objc_msgSend(v29, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v21, v22);
          }

          orderedHeaders = v5->_orderedHeaders;
          if (!orderedHeaders)
          {
            v25 = objc_opt_new();
            v26 = v5->_orderedHeaders;
            v5->_orderedHeaders = (NSMutableArray *)v25;

            orderedHeaders = v5->_orderedHeaders;
          }
          -[NSMutableArray addObject:](orderedHeaders, "addObject:", v29);

        }
LABEL_26:

        v7 = v30;
        goto LABEL_3;
      }
    }

  }
  return v5;
}

- (id)allHeaders
{
  return self->_orderedHeaders;
}

- (id)allHeaderKeys
{
  return (id)-[NSMutableDictionary allKeys](self->_headers, "allKeys");
}

- (id)headersForKey:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_headers, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)firstHeaderForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_headers, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedHeaders, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end
