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
  id v15;
  NSObject *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DSTextFile;
  v7 = -[DSTextFile init](&v18, "init");
  if (!v7)
    goto LABEL_4;
  v8 = objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v6));
  fileHandle = v7->_fileHandle;
  v7->_fileHandle = (NSFileHandle *)v8;

  if (v7->_fileHandle)
  {
    v7->_bufferSize = a4;
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", &off_1C050));
    linePositions = v7->_linePositions;
    v7->_linePositions = (NSMutableArray *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &kDALineBreak, 1));
    lineBreak = v7->_lineBreak;
    v7->_lineBreak = (NSData *)v12;

    v7->_isEnumerating = 0;
    v7->_skipCount = 0;
    v7->_currentLineIndex = 0;
LABEL_4:
    v14 = v7;
    goto LABEL_8;
  }
  v15 = DiagnosticLogHandleForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[DSTextFile initWithFilePath:withBufferSize:].cold.1((uint64_t)v6, v16);

  v14 = 0;
LABEL_8:

  return v14;
}

- (void)enumerateUsingBlock:(id)a3
{
  void (**v4)(id, id, id, unint64_t);
  unsigned int v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location;

  v4 = (void (**)(id, id, id, unint64_t))a3;
  objc_initWeak(&location, self);
  -[DSTextFile setIsEnumerating:](self, "setIsEnumerating:", 1);
  do
  {
    if (-[DSTextFile skipCount](self, "skipCount"))
    {
      v5 = -[DSTextFile advanceToNextLine:](self, "advanceToNextLine:", 0);
      -[DSTextFile setSkipCount:](self, "setSkipCount:", (char *)-[DSTextFile skipCount](self, "skipCount") - 1);
    }
    else
    {
      v6 = objc_autoreleasePoolPush();
      v10 = 0;
      v5 = -[DSTextFile advanceToNextLine:](self, "advanceToNextLine:", &v10);
      v7 = v10;
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);

      objc_autoreleasePoolPop(v6);
      v9 = objc_loadWeakRetained(&location);
      v4[2](v4, v8, v9, -[DSTextFile currentLineIndex](self, "currentLineIndex"));

    }
  }
  while ((-[DSTextFile isEnumerating](self, "isEnumerating") & v5 & 1) != 0);
  -[DSTextFile resetEnumerator](self, "resetEnumerator");
  objc_destroyWeak(&location);

}

+ (id)textFileWithPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithFilePath:", v4);

  return v5;
}

- (id)readDataOfLength:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DSTextFile fileHandle](self, "fileHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readDataOfLength:", a3));

  return v5;
}

- (unint64_t)currentOffset
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DSTextFile fileHandle](self, "fileHandle"));
  v3 = objc_msgSend(v2, "offsetInFile");

  return (unint64_t)v3;
}

- (void)seekToBeginning
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DSTextFile fileHandle](self, "fileHandle"));
  objc_msgSend(v2, "seekToFileOffset:", 0);

}

- (void)seekToOffset:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DSTextFile fileHandle](self, "fileHandle"));
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
  id v6;
  unint64_t v7;
  void *v8;
  char *v9;
  char *v10;
  BOOL v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSTextFile linePositions](self, "linePositions"));
  v6 = objc_msgSend(v5, "count");
  v7 = -[DSTextFile currentLineIndex](self, "currentLineIndex");

  if ((unint64_t)v6 > v7)
    -[DSTextFile seekToOffset:](self, "seekToOffset:", -[DSTextFile getOffsetAtLineIndex:](self, "getOffsetAtLineIndex:", -[DSTextFile currentLineIndex](self, "currentLineIndex")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DSTextFile linePositions](self, "linePositions"));
  v9 = (char *)objc_msgSend(v8, "count");
  v10 = (char *)-[DSTextFile currentLineIndex](self, "currentLineIndex") + 1;

  if (v9 <= v10)
  {
    v11 = -[DSTextFile searchForNextLineFromCurrentPosition:](self, "searchForNextLineFromCurrentPosition:", a3);
  }
  else
  {
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[DSTextFile extractLine:](self, "extractLine:", -[DSTextFile currentLineIndex](self, "currentLineIndex")));
    v11 = 1;
  }
  -[DSTextFile setCurrentLineIndex:](self, "setCurrentLineIndex:", (char *)-[DSTextFile currentLineIndex](self, "currentLineIndex") + 1);
  return v11;
}

- (unint64_t)getOffsetAtLineIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DSTextFile linePositions](self, "linePositions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", a3));
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  return (unint64_t)v6;
}

- (id)extractLine:(unint64_t)a3
{
  return -[DSTextFile readDataOfLength:](self, "readDataOfLength:", (char *)-[DSTextFile getOffsetAtLineIndex:](self, "getOffsetAtLineIndex:", a3 + 1)+ ~-[DSTextFile getOffsetAtLineIndex:](self, "getOffsetAtLineIndex:"));
}

- (BOOL)searchForNextLineFromCurrentPosition:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _BYTE *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  if (a3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", -[DSTextFile bufferSize](self, "bufferSize")));
  else
    v5 = 0;
  v6 = objc_autoreleasePoolPush();
  v7 = 0;
  while (1)
  {
    v8 = v7;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSTextFile readDataOfLength:](self, "readDataOfLength:", -[DSTextFile bufferSize](self, "bufferSize")));

    v9 = objc_msgSend(v7, "length");
    if (!v9)
      break;
    v10 = objc_msgSend(v7, "length");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DSTextFile lineBreak](self, "lineBreak"));
    v12 = objc_msgSend(v7, "rangeOfData:options:range:", v11, 0, 0, v10);

    if (v5 && v12 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "appendData:", v7);
    if (v12 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = -[DSTextFile currentOffset](self, "currentOffset");
      v14 = &v12[v13] - (_BYTE *)objc_msgSend(v7, "length") + 1;
      if (a3 && v12)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subdataWithRange:", 0, v12));
        objc_msgSend(v5, "appendData:", v15);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DSTextFile linePositions](self, "linePositions"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14));
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

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to init handle for file at path %@", (uint8_t *)&v2, 0xCu);
}

@end
