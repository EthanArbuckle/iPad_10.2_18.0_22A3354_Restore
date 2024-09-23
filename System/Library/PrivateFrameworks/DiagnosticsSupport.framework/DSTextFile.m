@implementation DSTextFile

- (DSTextFile)initWithFilePath:(id)a3
{
  return -[DSTextFile initWithFilePath:withBufferSize:](self, "initWithFilePath:withBufferSize:", a3, 1024);
}

- (DSTextFile)initWithFilePath:(id)a3 withBufferSize:(unint64_t)a4
{
  id v6;
  DSTextFile *v7;
  uint64_t v8;
  NSFileHandle *fileHandle;
  uint64_t v10;
  NSMutableArray *linePositions;
  uint64_t v12;
  NSData *lineBreak;
  DSTextFile *v14;
  NSObject *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DSTextFile;
  v7 = -[DSTextFile init](&v17, sel_init);
  if (!v7)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingAtPath:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  fileHandle = v7->_fileHandle;
  v7->_fileHandle = (NSFileHandle *)v8;

  if (v7->_fileHandle)
  {
    v7->_bufferSize = a4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", &unk_24E44DC30);
    v10 = objc_claimAutoreleasedReturnValue();
    linePositions = v7->_linePositions;
    v7->_linePositions = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &kDALineBreak, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    lineBreak = v7->_lineBreak;
    v7->_lineBreak = (NSData *)v12;

    v7->_isEnumerating = 0;
    v7->_skipCount = 0;
    v7->_currentLineIndex = 0;
LABEL_4:
    v14 = v7;
    goto LABEL_8;
  }
  DiagnosticLogHandleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[DSTextFile initWithFilePath:withBufferSize:].cold.1((uint64_t)v6, v15);

  v14 = 0;
LABEL_8:

  return v14;
}

- (void)enumerateUsingBlock:(id)a3
{
  void (**v4)(id, void *, id, unint64_t);
  _BOOL4 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id location;

  v4 = (void (**)(id, void *, id, unint64_t))a3;
  objc_initWeak(&location, self);
  -[DSTextFile setIsEnumerating:](self, "setIsEnumerating:", 1);
  do
  {
    if (-[DSTextFile skipCount](self, "skipCount"))
    {
      v5 = -[DSTextFile advanceToNextLine:](self, "advanceToNextLine:", 0);
      -[DSTextFile setSkipCount:](self, "setSkipCount:", -[DSTextFile skipCount](self, "skipCount") - 1);
    }
    else
    {
      v6 = (void *)MEMORY[0x2207CA484]();
      v10 = 0;
      v5 = -[DSTextFile advanceToNextLine:](self, "advanceToNextLine:", &v10);
      v7 = v10;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);

      objc_autoreleasePoolPop(v6);
      v9 = objc_loadWeakRetained(&location);
      v4[2](v4, v8, v9, -[DSTextFile currentLineIndex](self, "currentLineIndex"));

    }
  }
  while (-[DSTextFile isEnumerating](self, "isEnumerating") && v5);
  -[DSTextFile resetEnumerator](self, "resetEnumerator");
  objc_destroyWeak(&location);

}

+ (id)textFileWithPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilePath:", v4);

  return v5;
}

- (id)readDataOfLength:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[DSTextFile fileHandle](self, "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readDataOfLength:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)currentOffset
{
  void *v2;
  unint64_t v3;

  -[DSTextFile fileHandle](self, "fileHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "offsetInFile");

  return v3;
}

- (void)seekToBeginning
{
  id v2;

  -[DSTextFile fileHandle](self, "fileHandle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seekToFileOffset:", 0);

}

- (void)seekToOffset:(unint64_t)a3
{
  id v4;

  -[DSTextFile fileHandle](self, "fileHandle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seekToFileOffset:", a3);

}

- (void)resetEnumerator
{
  -[DSTextFile setIsEnumerating:](self, "setIsEnumerating:", 0);
  -[DSTextFile setSkipCount:](self, "setSkipCount:", 0);
  -[DSTextFile setCurrentLineIndex:](self, "setCurrentLineIndex:", 0);
}

- (BOOL)advanceToNextLine:(id *)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;

  -[DSTextFile linePositions](self, "linePositions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = -[DSTextFile currentLineIndex](self, "currentLineIndex");

  if (v6 > v7)
    -[DSTextFile seekToOffset:](self, "seekToOffset:", -[DSTextFile getOffsetAtLineIndex:](self, "getOffsetAtLineIndex:", -[DSTextFile currentLineIndex](self, "currentLineIndex")));
  -[DSTextFile linePositions](self, "linePositions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = -[DSTextFile currentLineIndex](self, "currentLineIndex") + 1;

  if (v9 <= v10)
  {
    v11 = -[DSTextFile searchForNextLineFromCurrentPosition:](self, "searchForNextLineFromCurrentPosition:", a3);
  }
  else
  {
    if (a3)
    {
      -[DSTextFile extractLine:](self, "extractLine:", -[DSTextFile currentLineIndex](self, "currentLineIndex"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = 1;
  }
  -[DSTextFile setCurrentLineIndex:](self, "setCurrentLineIndex:", -[DSTextFile currentLineIndex](self, "currentLineIndex") + 1);
  return v11;
}

- (unint64_t)getOffsetAtLineIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[DSTextFile linePositions](self, "linePositions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  return v6;
}

- (id)extractLine:(unint64_t)a3
{
  return -[DSTextFile readDataOfLength:](self, "readDataOfLength:", -[DSTextFile getOffsetAtLineIndex:](self, "getOffsetAtLineIndex:", a3 + 1)+ ~-[DSTextFile getOffsetAtLineIndex:](self, "getOffsetAtLineIndex:"));
}

- (BOOL)searchForNextLineFromCurrentPosition:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", -[DSTextFile bufferSize](self, "bufferSize"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)MEMORY[0x2207CA484]();
  v7 = 0;
  while (1)
  {
    v8 = v7;
    -[DSTextFile readDataOfLength:](self, "readDataOfLength:", -[DSTextFile bufferSize](self, "bufferSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "length");
    if (!v9)
      break;
    v10 = objc_msgSend(v7, "length");
    -[DSTextFile lineBreak](self, "lineBreak");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "rangeOfData:options:range:", v11, 0, 0, v10);

    if (v5 && v12 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "appendData:", v7);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = -[DSTextFile currentOffset](self, "currentOffset");
      v14 = v12 + v13 - objc_msgSend(v7, "length") + 1;
      if (a3 && v12)
      {
        objc_msgSend(v7, "subdataWithRange:", 0, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendData:", v15);

      }
      -[DSTextFile linePositions](self, "linePositions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      goto LABEL_17;
    }
  }
  if (v5 && objc_msgSend(v7, "length"))
    objc_msgSend(v5, "appendData:", v7);
LABEL_17:

  objc_autoreleasePoolPop(v6);
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return v9 != 0;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandle, a3);
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (NSMutableArray)linePositions
{
  return self->_linePositions;
}

- (void)setLinePositions:(id)a3
{
  objc_storeStrong((id *)&self->_linePositions, a3);
}

- (NSData)lineBreak
{
  return self->_lineBreak;
}

- (void)setLineBreak:(id)a3
{
  objc_storeStrong((id *)&self->_lineBreak, a3);
}

- (BOOL)cancelEnumeration
{
  return self->_cancelEnumeration;
}

- (void)setCancelEnumeration:(BOOL)a3
{
  self->_cancelEnumeration = a3;
}

- (int64_t)skipCount
{
  return self->_skipCount;
}

- (void)setSkipCount:(int64_t)a3
{
  self->_skipCount = a3;
}

- (BOOL)isEnumerating
{
  return self->_isEnumerating;
}

- (void)setIsEnumerating:(BOOL)a3
{
  self->_isEnumerating = a3;
}

- (unint64_t)currentLineIndex
{
  return self->_currentLineIndex;
}

- (void)setCurrentLineIndex:(unint64_t)a3
{
  self->_currentLineIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineBreak, 0);
  objc_storeStrong((id *)&self->_linePositions, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

- (void)initWithFilePath:(uint64_t)a1 withBufferSize:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F54F000, a2, OS_LOG_TYPE_ERROR, "Failed to init handle for file at path %@", (uint8_t *)&v2, 0xCu);
}

@end
