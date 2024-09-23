@implementation BCSLineReader

- (BCSLineReader)initWithFileURL:(id)a3
{
  return -[BCSLineReader initWithFileURL:bufferSize:maxLineSize:](self, "initWithFileURL:bufferSize:maxLineSize:", a3, 2048, 0x80000);
}

- (BCSLineReader)initWithFileURL:(id)a3 bufferSize:(unint64_t)a4 maxLineSize:(unint64_t)a5
{
  id v9;
  BCSLineReader *v10;
  BCSLineReader *v11;
  uint64_t v12;
  NSMutableData *readBuffer;
  uint64_t v14;
  NSMutableData *lineBuffer;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCSLineReader;
  v10 = -[BCSLineReader init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_URL, a3);
    v11->_bufferSize = a4;
    v11->_maxLineSize = a5;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a4);
    v12 = objc_claimAutoreleasedReturnValue();
    readBuffer = v11->_readBuffer;
    v11->_readBuffer = (NSMutableData *)v12;

    v11->_beginLine = (char *)-[NSMutableData mutableBytes](v11->_readBuffer, "mutableBytes");
    v11->_endLine = (char *)-[NSMutableData mutableBytes](v11->_readBuffer, "mutableBytes");
    v11->_endBuffer = (char *)-[NSMutableData mutableBytes](v11->_readBuffer, "mutableBytes");
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v14 = objc_claimAutoreleasedReturnValue();
    lineBuffer = v11->_lineBuffer;
    v11->_lineBuffer = (NSMutableData *)v14;

  }
  return v11;
}

- (id)readLine
{
  __int128 v2;
  BOOL v4;
  char *v5;
  void *v6;
  int v7;
  char *i;
  char *v9;
  void *v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  char *v17;
  void *v18;
  char *v19;
  void *v20;
  char v21;
  unint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v4 = 0;
  v36 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2 = 136315394;
  v31 = v2;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v5 = -[BCSLineReader beginLine](self, "beginLine", v31);
        if (v5 == -[BCSLineReader endBuffer](self, "endBuffer"))
        {
          -[BCSLineReader inputStream](self, "inputStream");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "hasBytesAvailable");

          if (!v7)
            return 0;
        }
        for (i = -[BCSLineReader beginLine](self, "beginLine"); ; i = -[BCSLineReader endLine](self, "endLine") + 1)
        {
          -[BCSLineReader setEndLine:](self, "setEndLine:", i);
          v9 = -[BCSLineReader endLine](self, "endLine");
          if (v9 >= -[BCSLineReader endBuffer](self, "endBuffer") || *-[BCSLineReader endLine](self, "endLine") == 10)
            break;
        }
        if (!v4)
          break;
        if (*-[BCSLineReader endLine](self, "endLine") == 10)
        {
          -[BCSLineReader setBeginLine:](self, "setBeginLine:", -[BCSLineReader endLine](self, "endLine") + 1);
          v4 = 0;
        }
        else
        {
          -[BCSLineReader refillReadBuffer](self, "refillReadBuffer");
          v4 = 1;
        }
      }
      -[BCSLineReader lineBuffer](self, "lineBuffer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
      v12 = -[BCSLineReader endLine](self, "endLine");
      v13 = (unint64_t)&v12[v11 - (unint64_t)-[BCSLineReader beginLine](self, "beginLine")];
      v14 = -[BCSLineReader maxLineSize](self, "maxLineSize");

      if (v13 <= v14)
        break;
      -[BCSLineReader lineBuffer](self, "lineBuffer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLength:", 0);

      ABSLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v23 = -[BCSLineReader maxLineSize](self, "maxLineSize");
        *(_DWORD *)buf = v31;
        v33 = "-[BCSLineReader readLine]";
        v34 = 2048;
        v35 = v23;
        _os_log_error_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_ERROR, "%s Dropping line since it exceeds max size limit of %ld", buf, 0x16u);
      }

      -[BCSLineReader setBeginLine:](self, "setBeginLine:", -[BCSLineReader endLine](self, "endLine") + 1);
      v4 = *-[BCSLineReader endLine](self, "endLine") != 10;
    }
    v17 = -[BCSLineReader endLine](self, "endLine");
    if ((uint64_t)&v17[-(uint64_t)-[BCSLineReader beginLine](self, "beginLine")] >= 1)
    {
      -[BCSLineReader lineBuffer](self, "lineBuffer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendBytes:length:", -[BCSLineReader beginLine](self, "beginLine"), -[BCSLineReader endLine](self, "endLine") - -[BCSLineReader beginLine](self, "beginLine"));

    }
    v19 = -[BCSLineReader endLine](self, "endLine");
    if (v19 != -[BCSLineReader endBuffer](self, "endBuffer"))
      break;
    -[BCSLineReader refillReadBuffer](self, "refillReadBuffer");
    -[BCSLineReader inputStream](self, "inputStream");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasBytesAvailable");

    v4 = 0;
    if ((v21 & 1) == 0)
    {
      v28 = objc_alloc(MEMORY[0x24BDD17C8]);
      -[BCSLineReader lineBuffer](self, "lineBuffer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithData:encoding:", v29, 4);

      return v30;
    }
  }
  v24 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[BCSLineReader lineBuffer](self, "lineBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithData:encoding:", v25, 4);

  -[BCSLineReader lineBuffer](self, "lineBuffer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLength:", 0);

  -[BCSLineReader setBeginLine:](self, "setBeginLine:", -[BCSLineReader endLine](self, "endLine") + 1);
  return v26;
}

- (void)refillReadBuffer
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[BCSLineReader readBuffer](self, "readBuffer");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "mutableBytes");

  -[BCSLineReader inputStream](self, "inputStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "read:maxLength:", v4, -[BCSLineReader bufferSize](self, "bufferSize") - 1);

  -[BCSLineReader setEndBuffer:](self, "setEndBuffer:", v4 + v6);
  -[BCSLineReader setBeginLine:](self, "setBeginLine:", v4);
}

- (NSInputStream)inputStream
{
  void *v3;
  void *v4;
  NSInputStream *v5;
  NSInputStream *inputStream;

  if (!self->_inputStream && -[BCSLineReader hasValidURL](self, "hasValidURL"))
  {
    v3 = (void *)MEMORY[0x24BDBCE90];
    -[BCSLineReader URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputStreamWithURL:", v4);
    v5 = (NSInputStream *)objc_claimAutoreleasedReturnValue();
    inputStream = self->_inputStream;
    self->_inputStream = v5;

    -[NSInputStream open](self->_inputStream, "open");
  }
  return self->_inputStream;
}

- (BOOL)hasValidURL
{
  void *v2;
  char v3;

  -[BCSLineReader URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFileURL");

  return v3;
}

- (void)dealloc
{
  NSInputStream *inputStream;
  objc_super v4;

  -[NSInputStream close](self->_inputStream, "close");
  inputStream = self->_inputStream;
  self->_inputStream = 0;

  v4.receiver = self;
  v4.super_class = (Class)BCSLineReader;
  -[BCSLineReader dealloc](&v4, sel_dealloc);
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (unint64_t)maxLineSize
{
  return self->_maxLineSize;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setInputStream:(id)a3
{
  objc_storeStrong((id *)&self->_inputStream, a3);
}

- (NSMutableData)readBuffer
{
  return self->_readBuffer;
}

- (void)setReadBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_readBuffer, a3);
}

- (char)endBuffer
{
  return self->_endBuffer;
}

- (void)setEndBuffer:(char *)a3
{
  self->_endBuffer = a3;
}

- (char)beginLine
{
  return self->_beginLine;
}

- (void)setBeginLine:(char *)a3
{
  self->_beginLine = a3;
}

- (char)endLine
{
  return self->_endLine;
}

- (void)setEndLine:(char *)a3
{
  self->_endLine = a3;
}

- (NSMutableData)lineBuffer
{
  return self->_lineBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineBuffer, 0);
  objc_storeStrong((id *)&self->_readBuffer, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
