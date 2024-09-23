@implementation BLM3U8Parser

- (BLM3U8Parser)initWithURL:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSError *v9;
  NSError *error;
  BLM3U8Parser *v11;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", a3, 8, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (!v4)
  {
    BLDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_ERROR, "Error reading playlist:  %@", buf, 0xCu);
    }

    v7 = objc_alloc(MEMORY[0x24BDD1540]);
    v14 = *MEMORY[0x24BDD1398];
    v15 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSError *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("BLErrorDomain"), 26, v8);
    error = self->_error;
    self->_error = v9;

  }
  v11 = -[BLM3U8Parser initWithData:](self, "initWithData:", v4);

  return v11;
}

- (BLM3U8Parser)initWithData:(id)a3
{
  id v5;
  BLM3U8Parser *v6;
  BLM3U8Parser *v7;
  uint64_t v8;
  NSMutableData *bytes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLM3U8Parser;
  v6 = -[BLM3U8Parser init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v8 = objc_claimAutoreleasedReturnValue();
    bytes = v7->_bytes;
    v7->_bytes = (NSMutableData *)v8;

  }
  return v7;
}

- (BOOL)parseWithError:(id *)a3
{
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[5];

  -[BLM3U8Parser error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BLM3U8Parser error](self, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;
    if (a3 && v6)
    {
      v6 = objc_retainAutorelease(v6);
      *a3 = v6;
      v7 = 1;
    }
  }
  else
  {
    -[BLM3U8Parser data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_212CC3928;
    v13[3] = &unk_24CE8CA68;
    v13[4] = self;
    objc_msgSend(v8, "enumerateByteRangesUsingBlock:", v13);

    -[BLM3U8Parser bytes](self, "bytes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
      -[BLM3U8Parser processLine](self, "processLine");
    v7 = 0;
    v6 = 0;
  }
  v11 = !v7;

  return v11;
}

- (unint64_t)consumeBytes:(const void *)a3 length:(unint64_t)a4
{
  unint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (a4)
  {
    v7 = 0;
    while (1)
    {
      v8 = *((unsigned __int8 *)a3 + v7);
      if (v8 == 10)
      {
        v10 = 1;
LABEL_11:
        -[BLM3U8Parser bytes](self, "bytes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendBytes:length:", a3, v7);

        -[BLM3U8Parser processLine](self, "processLine");
        v7 += v10;
        return v7;
      }
      if (v8 == 13)
        break;
      if (a4 == ++v7)
        goto LABEL_6;
    }
    if (v7 + 1 < a4 && *((_BYTE *)a3 + v7 + 1) == 10)
    {
      v10 = 2;
      goto LABEL_11;
    }
    -[BLM3U8Parser bytes](self, "bytes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendBytes:length:", a3, v7 - 1);

  }
  else
  {
LABEL_6:
    -[BLM3U8Parser bytes](self, "bytes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendBytes:length:", a3, a4);

    return a4;
  }
  return v7;
}

- (id)parseAttributeList:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    while (1)
    {
      v6 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("="), 0, v5, objc_msgSend(v3, "length") - v5);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_20;
      v7 = v6;
      objc_msgSend(v3, "substringWithRange:", v5, v6 - v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 + 1;
      v10 = ~v7;
      v11 = objc_msgSend(v3, "length") + ~v7;
      v12 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("\"), 0, v7 + 1, v11);
      v13 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR(","), 0, v9, v11);
      v14 = v13;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL && v13 <= v12)
        goto LABEL_9;
      v16 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("\"), 0, v12 + 1, objc_msgSend(v3, "length") - (v12 + 1));
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v3, "substringFromIndex:", v12 + 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = v16;
        objc_msgSend(v3, "substringWithRange:", v12 + 1, v16 + ~v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v3, "rangeOfString:options:range:", CFSTR(","), 0, v17 + 1, objc_msgSend(v3, "length") - (v17 + 1));
      }
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_18;
LABEL_10:
      v5 = v14 + 1;
      if (v8)
        goto LABEL_11;
LABEL_12:

      if (v5 >= objc_msgSend(v3, "length"))
        goto LABEL_20;
    }
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "substringFromIndex:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v5 = objc_msgSend(v3, "length");
      if (!v8)
        goto LABEL_12;
LABEL_11:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v8);
      goto LABEL_12;
    }
LABEL_9:
    objc_msgSend(v3, "substringWithRange:", v9, v13 + v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_20:
  v18 = (void *)objc_msgSend(v4, "copy");

  return v18;
}

- (void)processLine
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[BLM3U8Parser delegate](self, "delegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[BLM3U8Parser bytes](self, "bytes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[BLM3U8Parser bytes](self, "bytes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithData:encoding:", v6, 4);

    if (objc_msgSend(v7, "length"))
    {
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("#EXT")))
      {
        v8 = v7;
        v9 = objc_msgSend(v8, "rangeOfString:", CFSTR(":"));
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = 0;
          v11 = &stru_24CE8D258;
          v12 = v8;
        }
        else
        {
          v13 = v9;
          objc_msgSend(v8, "substringToIndex:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "substringFromIndex:", v13 + 1);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString length](v11, "length"))
          {
            -[BLM3U8Parser parseAttributeList:](self, "parseAttributeList:", v11);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = 0;
          }
        }
        objc_msgSend(v17, "parser:lineIsTag:value:attributeList:", self, v12, v11, v10);
        if (-[BLM3U8Parser collectForRewrite](self, "collectForRewrite")
          && objc_msgSend(v17, "parserShouldCollectLine:", self))
        {
          -[BLM3U8Parser saveLine:](self, "saveLine:", v8);
        }

      }
      else if (objc_msgSend(v7, "hasPrefix:", CFSTR("#")))
      {
        objc_msgSend(v17, "parser:lineIsComment:", self, v7);
        if (-[BLM3U8Parser collectForRewrite](self, "collectForRewrite")
          && objc_msgSend(v17, "parserShouldCollectLine:", self))
        {
          -[BLM3U8Parser saveLine:](self, "saveLine:", v7);
        }
      }
      else
      {
        if (-[BLM3U8Parser collectForRewrite](self, "collectForRewrite")
          && objc_msgSend(v17, "parserShouldCollectLine:", self))
        {
          -[BLM3U8Parser saveLine:](self, "saveLine:", v7);
        }
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "parser:lineIsURL:", self, v14);

      }
    }
    -[BLM3U8Parser bytes](self, "bytes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLM3U8Parser bytes](self, "bytes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(v16, "length"), 0, 0);

  }
  else if (-[BLM3U8Parser collectForRewrite](self, "collectForRewrite"))
  {
    -[BLM3U8Parser saveLine:](self, "saveLine:", &stru_24CE8D258);
  }

}

- (void)saveLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  const char *v11;
  id v12;

  v4 = a3;
  -[BLM3U8Parser collectedData](self, "collectedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLM3U8Parser setCollectedData:](self, "setCollectedData:", v6);

  }
  -[BLM3U8Parser collectedData](self, "collectedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v4);
  v9 = objc_msgSend(v8, "UTF8String");
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  objc_msgSend(v7, "appendBytes:length:", v9, strlen(v11));
  -[BLM3U8Parser collectedData](self, "collectedData");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendBytes:length:", "\n", 1);

}

- (BOOL)rewriteWithURL:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BLM3U8Parser collectedData](self, "collectedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "writeToURL:atomically:", v4, 1);

  return v6;
}

- (BLM3U8ParserDelegate)delegate
{
  return (BLM3U8ParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)collectForRewrite
{
  return self->_collectForRewrite;
}

- (void)setCollectForRewrite:(BOOL)a3
{
  self->_collectForRewrite = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSMutableData)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
  objc_storeStrong((id *)&self->_bytes, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableData)collectedData
{
  return self->_collectedData;
}

- (void)setCollectedData:(id)a3
{
  objc_storeStrong((id *)&self->_collectedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
