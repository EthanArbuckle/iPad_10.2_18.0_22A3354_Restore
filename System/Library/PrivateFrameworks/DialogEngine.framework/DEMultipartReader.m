@implementation DEMultipartReader

- (DEMultipartReader)initWithReader:(id)a3
{
  id v5;
  DEMultipartReader *v6;
  DEMultipartReader *v7;
  id *p_reader;
  NSMutableData *searchBuffer;
  NSData *nextPartData;
  uint64_t v11;
  NSData *endOfPartData;
  uint64_t v13;
  NSData *endOfMessageData;
  DERewindableReader *reader;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DEMultipartReader;
  v6 = -[DEMultipartReader init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5 && (objc_msgSend(v5, "isRewindable") & 1) != 0)
    {
      p_reader = (id *)&v6->_reader;
      objc_storeStrong(p_reader, a3);
      searchBuffer = v7->_searchBuffer;
      v7->_searchBuffer = 0;

      nextPartData = v7->_nextPartData;
      v7->_nextPartData = 0;

      *(_WORD *)&v7->_endOfPart = 0;
      +[DEMultipartReader getEndOfPartData](DEMultipartReader, "getEndOfPartData");
      v11 = objc_claimAutoreleasedReturnValue();
      endOfPartData = v7->_endOfPartData;
      v7->_endOfPartData = (NSData *)v11;

      +[DEMultipartReader getEndOfMessageData](DEMultipartReader, "getEndOfMessageData");
      v13 = objc_claimAutoreleasedReturnValue();
      endOfMessageData = v7->_endOfMessageData;
      v7->_endOfMessageData = (NSData *)v13;

      v7->_maxEndSize = 0;
      reader = v7->_reader;
      +[DEMultipartUtil getBoundaryData](DEMultipartUtil, "getBoundaryData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DERewindableReader readDataOfLength:](reader, "readDataOfLength:", objc_msgSend(v16, "length"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[DEMultipartUtil getBoundaryData](DEMultipartUtil, "getBoundaryData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToData:", v17);

      v20 = *p_reader;
      if ((v19 & 1) != 0)
      {
        objc_msgSend(v20, "disableRewind");
        v21 = -[NSData length](v7->_endOfPartData, "length");
        v7->_maxEndSize = v21;
        if (v21 < -[NSData length](v7->_endOfMessageData, "length"))
          v7->_maxEndSize = -[NSData length](v7->_endOfMessageData, "length");
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", getpagesize());
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v7->_searchBuffer;
        v7->_searchBuffer = (NSMutableData *)v22;
      }
      else
      {
        objc_msgSend(v20, "rewind");
        v24 = *p_reader;
        *p_reader = 0;

        v23 = v7;
        v7 = 0;
      }

    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Unsuitable rewindable reader used in Multipart Reader"));
      v17 = v6;
      v7 = 0;
    }

  }
  return v7;
}

- (DEMultipartReader)init
{
  return -[DEMultipartReader initWithReader:](self, "initWithReader:", 0);
}

- (void)dealloc
{
  DERewindableReader *reader;
  DERewindableReader *v4;
  objc_super v5;

  reader = self->_reader;
  if (reader)
  {
    -[DERewindableReader close](reader, "close");
    v4 = self->_reader;
    self->_reader = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)DEMultipartReader;
  -[DEMultipartReader dealloc](&v5, sel_dealloc);
}

- (void)close
{
  DERewindableReader *reader;
  DERewindableReader *v4;

  reader = self->_reader;
  if (reader)
  {
    -[DERewindableReader close](reader, "close");
    v4 = self->_reader;
    self->_reader = 0;

  }
}

- (void)searchForEnd
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  NSData *v7;
  NSData *nextPartData;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v3 = -[NSMutableData rangeOfData:options:range:](self->_searchBuffer, "rangeOfData:options:range:", self->_endOfPartData, 0, 0, -[NSMutableData length](self->_searchBuffer, "length"));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL || v4 != 0)
  {
    v6 = v3;
    self->_endOfPart = 1;
    -[NSMutableData subdataWithRange:](self->_searchBuffer, "subdataWithRange:", v3 + v4, -[NSMutableData length](self->_searchBuffer, "length") - (v3 + v4));
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    nextPartData = self->_nextPartData;
    self->_nextPartData = v7;

    -[NSMutableData subdataWithRange:](self->_searchBuffer, "subdataWithRange:", 0, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableData setData:](self->_searchBuffer, "setData:");
LABEL_11:

    return;
  }
  v9 = -[NSMutableData rangeOfData:options:range:](self->_searchBuffer, "rangeOfData:options:range:", self->_endOfMessageData, 0, 0, -[NSMutableData length](self->_searchBuffer, "length"));
  if (v9 != 0x7FFFFFFFFFFFFFFFLL || v10 != 0)
  {
    *(_WORD *)&self->_endOfPart = 257;
    -[NSMutableData subdataWithRange:](self->_searchBuffer, "subdataWithRange:", 0, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableData setData:](self->_searchBuffer, "setData:");
    goto LABEL_11;
  }
}

- (unint64_t)getAvailableLength
{
  unint64_t result;
  unint64_t maxEndSize;
  BOOL v5;
  unint64_t v6;

  result = -[NSMutableData length](self->_searchBuffer, "length");
  if (!self->_endOfPart)
  {
    maxEndSize = self->_maxEndSize;
    v5 = result >= maxEndSize;
    v6 = result - maxEndSize;
    if (v5)
      return v6;
    else
      return 0;
  }
  return result;
}

- (id)internalReadDataOfLength:(unint64_t)a3
{
  DEMultipartReader *i;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  for (i = self; !-[DEMultipartReader getAvailableLength](self, "getAvailableLength") && !i->_endOfPart; self = i)
  {
    -[DERewindableReader readDataOfLength:](i->_reader, "readDataOfLength:", getpagesize() - -[NSMutableData length](i->_searchBuffer, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = 0;
LABEL_14:
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to read from multipart file"));
      v9 = 0;
      goto LABEL_11;
    }
    v6 = v5;
    if (!objc_msgSend(v5, "length"))
    {
      v10 = v6;
      goto LABEL_14;
    }
    -[NSMutableData appendData:](i->_searchBuffer, "appendData:", v6);
    -[DEMultipartReader searchForEnd](i, "searchForEnd");

  }
  v7 = -[DEMultipartReader getAvailableLength](i, "getAvailableLength");
  if (v7 >= a3)
    v8 = a3;
  else
    v8 = v7;
  -[NSMutableData subdataWithRange:](i->_searchBuffer, "subdataWithRange:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableData subdataWithRange:](i->_searchBuffer, "subdataWithRange:", objc_msgSend(v9, "length"), -[NSMutableData length](i->_searchBuffer, "length") - objc_msgSend(v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableData setData:](i->_searchBuffer, "setData:", v10);
LABEL_11:

  return v9;
}

- (id)readDataOfLength:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEMultipartReader internalReadDataOfLength:](self, "internalReadDataOfLength:", a3 - objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    while (objc_msgSend(v6, "length") && objc_msgSend(v5, "length") < a3)
    {
      objc_msgSend(v5, "appendData:", v6);
      -[DEMultipartReader internalReadDataOfLength:](self, "internalReadDataOfLength:", a3 - objc_msgSend(v5, "length"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
      if (!v7)
        goto LABEL_5;
    }
    v8 = v5;

  }
  else
  {
LABEL_5:
    v8 = 0;
  }

  return v8;
}

- (id)readData
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)objc_opt_new();
  v4 = getpagesize();
  -[DEMultipartReader readDataOfLength:](self, "readDataOfLength:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    while (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v3, "appendData:", v5);
      -[DEMultipartReader readDataOfLength:](self, "readDataOfLength:", v4);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_4;
    }
    v7 = v3;

  }
  else
  {
LABEL_4:
    v7 = 0;
  }

  return v7;
}

- (BOOL)nextPart
{
  NSData *nextPartData;

  if (!self->_endOfPart || self->_endOfMessage)
    return 0;
  -[NSMutableData setData:](self->_searchBuffer, "setData:", self->_nextPartData);
  nextPartData = self->_nextPartData;
  self->_nextPartData = 0;

  self->_endOfPart = 0;
  -[DEMultipartReader searchForEnd](self, "searchForEnd");
  return 1;
}

- (DERewindableReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
  objc_storeStrong((id *)&self->_reader, a3);
}

- (NSMutableData)searchBuffer
{
  return self->_searchBuffer;
}

- (void)setSearchBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_searchBuffer, a3);
}

- (NSData)nextPartData
{
  return self->_nextPartData;
}

- (void)setNextPartData:(id)a3
{
  objc_storeStrong((id *)&self->_nextPartData, a3);
}

- (BOOL)endOfPart
{
  return self->_endOfPart;
}

- (void)setEndOfPart:(BOOL)a3
{
  self->_endOfPart = a3;
}

- (BOOL)endOfMessage
{
  return self->_endOfMessage;
}

- (void)setEndOfMessage:(BOOL)a3
{
  self->_endOfMessage = a3;
}

- (NSData)endOfPartData
{
  return self->_endOfPartData;
}

- (void)setEndOfPartData:(id)a3
{
  objc_storeStrong((id *)&self->_endOfPartData, a3);
}

- (NSData)endOfMessageData
{
  return self->_endOfMessageData;
}

- (void)setEndOfMessageData:(id)a3
{
  objc_storeStrong((id *)&self->_endOfMessageData, a3);
}

- (unint64_t)maxEndSize
{
  return self->_maxEndSize;
}

- (void)setMaxEndSize:(unint64_t)a3
{
  self->_maxEndSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endOfMessageData, 0);
  objc_storeStrong((id *)&self->_endOfPartData, 0);
  objc_storeStrong((id *)&self->_nextPartData, 0);
  objc_storeStrong((id *)&self->_searchBuffer, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)getEndOfPartData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[DEMultipartUtil getBoundary](DEMultipartUtil, "getBoundary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), CFSTR("\r\n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getEndOfMessageData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[DEMultipartUtil getMessageEnd](DEMultipartUtil, "getMessageEnd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), CFSTR("\r\n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
