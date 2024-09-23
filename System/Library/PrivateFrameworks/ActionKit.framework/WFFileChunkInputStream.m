@implementation WFFileChunkInputStream

- (WFFileChunkInputStream)initWithURL:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  id v9;
  WFFileChunkInputStream *v10;
  uint64_t v11;
  NSInputStream *inputStream;
  WFFileChunkInputStream *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v22;
  objc_super v23;

  v9 = a3;
  if ((objc_msgSend(v9, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileChunkInputStream.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL.fileURL"));

  }
  v23.receiver = self;
  v23.super_class = (Class)WFFileChunkInputStream;
  v10 = -[WFFileChunkInputStream init](&v23, sel_init);
  if (!v10)
    goto LABEL_10;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithURL:", v9);
  inputStream = v10->_inputStream;
  v10->_inputStream = (NSInputStream *)v11;

  v13 = (WFFileChunkInputStream *)v10->_inputStream;
  if (!v13)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFFileChunkInputStream setProperty:forKey:](v13, "setProperty:forKey:", v14, *MEMORY[0x24BDBCB90]);

  if (!v15)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributesOfItemAtPath:error:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileSize");

  v13 = 0;
  v20 = v19 - a4;
  if (v19 >= a4)
  {
    v10->_offset = a4;
    if (v20 >= a5)
      v20 = a5;
    v10->_length = v20;
    v13 = v10;
  }
LABEL_11:

  return v13;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;

  if (-[WFFileChunkInputStream streamStatus](self, "streamStatus") > 4)
    return 0;
  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BDBCB90]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  v11 = -[WFFileChunkInputStream length](self, "length");
  v12 = -[WFFileChunkInputStream offset](self, "offset");
  if (v11 - v12 - v10 >= a4)
    v13 = a4;
  else
    v13 = v11 - v12 - v10;
  v14 = objc_msgSend(v8, "read:maxLength:", a3, v13);

  return v14;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return -[WFFileChunkInputStream streamStatus](self, "streamStatus") == 2;
}

- (id)streamError
{
  void *v2;
  void *v3;

  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)streamStatus
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BDBCB90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  v6 = -[WFFileChunkInputStream offset](self, "offset");
  if (v5 >= -[WFFileChunkInputStream length](self, "length") + v6)
  {
    v8 = 5;
  }
  else
  {
    -[WFFileChunkInputStream inputStream](self, "inputStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "streamStatus");

  }
  return v8;
}

- (void)open
{
  id v2;

  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "open");

}

- (void)close
{
  id v2;

  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "close");

}

- (id)propertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "setProperty:forKey:", v7, v6);

  return v9;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheduleInRunLoop:forMode:", v7, v6);

}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFFileChunkInputStream inputStream](self, "inputStream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromRunLoop:forMode:", v7, v6);

}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return 0;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end
