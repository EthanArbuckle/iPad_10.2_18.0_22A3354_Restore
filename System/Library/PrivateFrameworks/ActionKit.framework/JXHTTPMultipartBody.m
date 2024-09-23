@implementation JXHTTPMultipartBody

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "close");

  v5.receiver = self;
  v5.super_class = (Class)JXHTTPMultipartBody;
  -[JXHTTPMultipartBody dealloc](&v5, sel_dealloc);
}

- (JXHTTPMultipartBody)init
{
  JXHTTPMultipartBody *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)JXHTTPMultipartBody;
  v2 = -[JXHTTPMultipartBody init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    v4 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%.0f"), v5);

    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "globallyUniqueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("JXHTTP-%@-%@"), v9, v6);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("--%@"), v10);
    -[JXHTTPMultipartBody setBoundaryString:](v2, "setBoundaryString:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("--%@--\r\n"), v10);
    objc_msgSend(v12, "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[JXHTTPMultipartBody setFinalBoundaryData:](v2, "setFinalBoundaryData:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("multipart/form-data; charset=utf-8; boundary=%@"),
                    v10);
    -[JXHTTPMultipartBody setHttpContentType:](v2, "setHttpContentType:", v14);

    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[JXHTTPMultipartBody setPartsArray:](v2, "setPartsArray:", v15);

    -[JXHTTPMultipartBody setStreamBufferLength:](v2, "setStreamBufferLength:", 0x10000);
  }
  return v2;
}

- (JXHTTPMultipartBody)initWithDictionary:(id)a3
{
  id v4;
  JXHTTPMultipartBody *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[JXHTTPMultipartBody init](self, "init");
  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[JXHTTPMultipartBody addString:forKey:](v5, "addString:forKey:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (int64_t)httpContentLength
{
  int64_t result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = self->_httpContentLength;
  if (result == -1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[JXHTTPMultipartBody partsArray](self, "partsArray", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v4);
          v7 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "dataLength");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);

      if (v7 < 1)
        goto LABEL_13;
      -[JXHTTPMultipartBody finalBoundaryData](self, "finalBoundaryData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 += objc_msgSend(v4, "length");
    }
    else
    {
      v7 = 0;
    }

LABEL_13:
    -[JXHTTPMultipartBody setHttpContentLength:](self, "setHttpContentLength:", v7);
    return self->_httpContentLength;
  }
  return result;
}

- (void)httpOperationDidFinishLoading:(id)a3
{
  id v3;

  -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

}

- (void)httpOperationDidFail:(id)a3
{
  id v3;

  -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

}

- (void)recreateStreamsForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CFTypeRef v8;
  CFReadStreamRef v9;
  void *v10;
  void *v11;
  void *v12;
  CFTypeRef cf;
  CFReadStreamRef readStream;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", -[JXHTTPMultipartBody streamBufferLength](self, "streamBufferLength"));
  -[JXHTTPMultipartBody setBodyDataBuffer:](self, "setBodyDataBuffer:", v5);

  -[JXHTTPMultipartBody setHttpContentLength:](self, "setHttpContentLength:", -1);
  -[JXHTTPMultipartBody setBytesWritten:](self, "setBytesWritten:", 0);
  -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "close");

  -[JXHTTPMultipartBody setHttpInputStream:](self, "setHttpInputStream:", 0);
  -[JXHTTPMultipartBody setHttpOutputStream:](self, "setHttpOutputStream:", 0);
  cf = 0;
  readStream = 0;
  CFStreamCreateBoundPair((CFAllocatorRef)*MEMORY[0x24BDBD240], &readStream, (CFWriteStreamRef *)&cf, -[JXHTTPMultipartBody streamBufferLength](self, "streamBufferLength"));
  v8 = cf;
  v9 = readStream;
  if (readStream && cf)
  {
    -[JXHTTPMultipartBody setHttpInputStream:](self, "setHttpInputStream:", readStream);

    v10 = (void *)cf;
    -[JXHTTPMultipartBody setHttpOutputStream:](self, "setHttpOutputStream:", cf);

    -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    objc_msgSend((id)objc_opt_class(), "networkThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[JXHTTPMultipartBody scheduleOutputStreamOnThread:](self, "scheduleOutputStreamOnThread:", v12);

  }
  else
  {
    if (readStream)
    {
      CFRelease(readStream);
      v8 = cf;
    }
    if (v8)
      CFRelease(v8);
  }

}

- (void)scheduleOutputStreamOnThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8
    || (objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"),
        v4 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 == v8))
  {
    -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleInRunLoop:forMode:", v6, *MEMORY[0x24BDBCB80]);

    -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "open");

  }
  else
  {
    -[JXHTTPMultipartBody performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_scheduleOutputStreamOnThread_, v8, v8, 1);
  }

}

- (void)setPartWithType:(int)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6 data:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v27 = a5;
  v25 = a6;
  v24 = a7;
  v12 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[JXHTTPMultipartBody partsArray](self, "partsArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[JXHTTPMultipartBody partsArray](self, "partsArray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v20, "key", v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v11);

        if (v22)
          objc_msgSend(v14, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

  -[JXHTTPMultipartBody partsArray](self, "partsArray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeObjectsInArray:", v14);

  -[JXHTTPMultipartBody addPartWithType:forKey:contentType:fileName:data:](self, "addPartWithType:forKey:contentType:fileName:data:", a3, v11, v27, v25, v24);
}

- (void)addPartWithType:(int)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6 data:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[JXHTTPMultipartBody boundaryString](self, "boundaryString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[JXHTTPMultipartPart withMultipartType:key:data:contentType:fileName:boundary:](JXHTTPMultipartPart, "withMultipartType:key:data:contentType:fileName:boundary:", v10, v15, v12, v14, v13, v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[JXHTTPMultipartBody partsArray](self, "partsArray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  -[JXHTTPMultipartBody setHttpContentLength:](self, "setHttpContentLength:", -1);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v22;
  if (v6 == v22)
  {
    if (a4 == 4)
    {
      v13 = -[JXHTTPMultipartBody bytesWritten](self, "bytesWritten");
      if (v13 != -[JXHTTPMultipartBody httpContentLength](self, "httpContentLength"))
      {
        v14 = -[JXHTTPMultipartBody httpContentLength](self, "httpContentLength");
        v15 = v14 - -[JXHTTPMultipartBody bytesWritten](self, "bytesWritten");
        if (v15 >= -[JXHTTPMultipartBody streamBufferLength](self, "streamBufferLength"))
          v15 = -[JXHTTPMultipartBody streamBufferLength](self, "streamBufferLength");
        -[JXHTTPMultipartBody bodyDataBuffer](self, "bodyDataBuffer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[JXHTTPMultipartBody loadMutableData:withDataInRange:](self, "loadMutableData:withDataInRange:", v16, -[JXHTTPMultipartBody bytesWritten](self, "bytesWritten"), v15);

        if (v17)
        {
          -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[JXHTTPMultipartBody bodyDataBuffer](self, "bodyDataBuffer");
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v20 = objc_msgSend(v18, "write:maxLength:", objc_msgSend(v19, "bytes"), v17);

          if (v20 >= 1)
          {
            -[JXHTTPMultipartBody setBytesWritten:](self, "setBytesWritten:", -[JXHTTPMultipartBody bytesWritten](self, "bytesWritten") + v20);
LABEL_13:
            v7 = v22;
            goto LABEL_14;
          }
        }
      }
LABEL_12:
      -[JXHTTPMultipartBody httpOutputStream](self, "httpOutputStream");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "close");

      goto LABEL_13;
    }
    if (a4 == 8)
    {
      objc_msgSend(v22, "streamError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPMultipartBody.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "streamError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%@ (%d) ERROR: %@"), v10, 305, v12);

      }
      goto LABEL_12;
    }
  }
LABEL_14:

}

- (unint64_t)loadMutableData:(id)a3 withDataInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSUInteger v15;
  NSRange v16;
  void *v17;
  NSUInteger v18;
  NSRange v19;
  NSUInteger v20;
  void *v21;
  void *v22;
  JXHTTPMultipartBody *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  NSRange v32;
  NSRange v33;
  NSRange v34;
  NSRange v35;

  length = a4.length;
  location = a4.location;
  v31 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  objc_msgSend(v25, "setLength:", 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = self;
  -[JXHTTPMultipartBody partsArray](self, "partsArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "dataLength");
        v32.location = v11;
        v32.length = v15;
        v34.location = location;
        v34.length = length;
        v16 = NSIntersectionRange(v32, v34);
        if (v16.length)
          v10 += objc_msgSend(v14, "loadMutableData:withDataInRange:", v25, v16.location - v11, v16.length);
        v11 += v15;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  -[JXHTTPMultipartBody finalBoundaryData](v24, "finalBoundaryData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  v33.location = v11;
  v33.length = v18;
  v35.location = location;
  v35.length = length;
  v19 = NSIntersectionRange(v33, v35);
  if (v19.length)
  {
    v20 = v19.location - v11;
    -[JXHTTPMultipartBody finalBoundaryData](v24, "finalBoundaryData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "subdataWithRange:", v20, v19.length);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v25, "appendData:", v22);
      v10 += objc_msgSend(v22, "length");
    }

  }
  return v10;
}

- (void)addString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[JXHTTPMultipartBody addData:forKey:contentType:fileName:](self, "addData:forKey:contentType:fileName:", v7, v6, CFSTR("text/plain; charset=utf-8"),
    0);

}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[JXHTTPMultipartBody setData:forKey:contentType:fileName:](self, "setData:forKey:contentType:fileName:", v7, v6, CFSTR("text/plain; charset=utf-8"),
    0);

}

- (void)addData:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6
{
  -[JXHTTPMultipartBody addPartWithType:forKey:contentType:fileName:data:](self, "addPartWithType:forKey:contentType:fileName:data:", 0, a4, a5, a6, a3);
}

- (void)setData:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6
{
  -[JXHTTPMultipartBody setPartWithType:forKey:contentType:fileName:data:](self, "setPartWithType:forKey:contentType:fileName:data:", 0, a4, a5, a6, a3);
}

- (void)addFile:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[JXHTTPMultipartBody addPartWithType:forKey:contentType:fileName:data:](self, "addPartWithType:forKey:contentType:fileName:data:", 1, v12, v11, v10, v13);

}

- (void)setFile:(id)a3 forKey:(id)a4 contentType:(id)a5 fileName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[JXHTTPMultipartBody setPartWithType:forKey:contentType:fileName:data:](self, "setPartWithType:forKey:contentType:fileName:data:", 1, v12, v11, v10, v13);

}

- (unint64_t)streamBufferLength
{
  return self->_streamBufferLength;
}

- (void)setStreamBufferLength:(unint64_t)a3
{
  self->_streamBufferLength = a3;
}

- (NSMutableArray)partsArray
{
  return self->_partsArray;
}

- (void)setPartsArray:(id)a3
{
  objc_storeStrong((id *)&self->_partsArray, a3);
}

- (NSString)boundaryString
{
  return self->_boundaryString;
}

- (void)setBoundaryString:(id)a3
{
  objc_storeStrong((id *)&self->_boundaryString, a3);
}

- (NSData)finalBoundaryData
{
  return self->_finalBoundaryData;
}

- (void)setFinalBoundaryData:(id)a3
{
  objc_storeStrong((id *)&self->_finalBoundaryData, a3);
}

- (NSString)httpContentType
{
  return self->_httpContentType;
}

- (void)setHttpContentType:(id)a3
{
  objc_storeStrong((id *)&self->_httpContentType, a3);
}

- (NSInputStream)httpInputStream
{
  return self->_httpInputStream;
}

- (void)setHttpInputStream:(id)a3
{
  objc_storeStrong((id *)&self->_httpInputStream, a3);
}

- (NSOutputStream)httpOutputStream
{
  return self->_httpOutputStream;
}

- (void)setHttpOutputStream:(id)a3
{
  objc_storeStrong((id *)&self->_httpOutputStream, a3);
}

- (NSMutableData)bodyDataBuffer
{
  return self->_bodyDataBuffer;
}

- (void)setBodyDataBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_bodyDataBuffer, a3);
}

- (void)setHttpContentLength:(int64_t)a3
{
  self->_httpContentLength = a3;
}

- (int64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(int64_t)a3
{
  self->_bytesWritten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyDataBuffer, 0);
  objc_storeStrong((id *)&self->_httpOutputStream, 0);
  objc_storeStrong((id *)&self->_httpInputStream, 0);
  objc_storeStrong((id *)&self->_httpContentType, 0);
  objc_storeStrong((id *)&self->_finalBoundaryData, 0);
  objc_storeStrong((id *)&self->_boundaryString, 0);
  objc_storeStrong((id *)&self->_partsArray, 0);
}

+ (id)withDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

@end
