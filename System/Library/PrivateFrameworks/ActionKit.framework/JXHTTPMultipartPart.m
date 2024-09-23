@implementation JXHTTPMultipartPart

- (id)filePath
{
  id v3;
  void *v4;
  void *v5;

  if (-[JXHTTPMultipartPart multipartType](self, "multipartType") == 1)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[JXHTTPMultipartPart contentData](self, "contentData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)dataLength
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  int64_t v7;

  -[JXHTTPMultipartPart preData](self, "preData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = -[JXHTTPMultipartPart contentLength](self, "contentLength") + v4;
  -[JXHTTPMultipartPart postData](self, "postData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 + objc_msgSend(v6, "length");

  return v7;
}

- (int64_t)contentLength
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  int64_t v14;
  id v16;

  if (-[JXHTTPMultipartPart multipartType](self, "multipartType"))
  {
    if (-[JXHTTPMultipartPart multipartType](self, "multipartType") != 1)
      return 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[JXHTTPMultipartPart filePath](self, "filePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPMultipartBody.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ (%d) ERROR: %@"), v8, 78, v9);

    }
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD0D08]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "longLongValue");
    else
      v12 = 0;

    return v12;
  }
  else
  {
    -[JXHTTPMultipartPart contentData](self, "contentData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    return v14;
  }
}

- (unint64_t)loadMutableData:(id)a3 withDataInRange:(_NSRange)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  NSUInteger v16;
  NSRange v17;
  NSUInteger v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id obj;
  unint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[3];
  _BYTE v38[128];
  uint64_t v39;
  NSRange v40;

  v39 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[JXHTTPMultipartPart preData](self, "preData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v5;
  -[JXHTTPMultipartPart contentData](self, "contentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v6;
  -[JXHTTPMultipartPart postData](self, "postData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v30 = 0;
    v31 = *(_QWORD *)v34;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[JXHTTPMultipartPart contentData](self, "contentData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == v14)
          v15 = -[JXHTTPMultipartPart contentLength](self, "contentLength");
        else
          v15 = objc_msgSend(v13, "length");
        v16 = v15;

        v40.location = v11;
        v40.length = v16;
        v17 = NSIntersectionRange(v40, a4);
        if (v17.length)
        {
          v18 = v17.location - v11;
          -[JXHTTPMultipartPart preData](self, "preData");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v13 == (void *)v19)
          {

LABEL_19:
            objc_msgSend(v13, "subdataWithRange:", v18, v17.length);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v26)
              goto LABEL_21;
LABEL_20:
            objc_msgSend(v28, "appendData:", v26);
            v30 += objc_msgSend(v26, "length");

            goto LABEL_21;
          }
          v20 = (void *)v19;
          -[JXHTTPMultipartPart postData](self, "postData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v21)
            goto LABEL_19;
          -[JXHTTPMultipartPart contentData](self, "contentData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 != v22)
            goto LABEL_21;
          if (!-[JXHTTPMultipartPart multipartType](self, "multipartType"))
            goto LABEL_19;
          if (-[JXHTTPMultipartPart multipartType](self, "multipartType") == 1)
          {
            v23 = (void *)MEMORY[0x24BDD1578];
            -[JXHTTPMultipartPart filePath](self, "filePath");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "fileHandleForReadingAtPath:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25)
              goto LABEL_25;
            objc_msgSend(v25, "seekToFileOffset:", v18);
            objc_msgSend(v25, "readDataOfLength:", v17.length);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "closeFile");

            if (v26)
              goto LABEL_20;
          }
        }
LABEL_21:
        v11 += v16;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (!v10)
        goto LABEL_25;
    }
  }
  v30 = 0;
LABEL_25:

  return v30;
}

- (int)multipartType
{
  return self->_multipartType;
}

- (void)setMultipartType:(int)a3
{
  self->_multipartType = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)preData
{
  return self->_preData;
}

- (void)setPreData:(id)a3
{
  objc_storeStrong((id *)&self->_preData, a3);
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
  objc_storeStrong((id *)&self->_contentData, a3);
}

- (NSData)postData
{
  return self->_postData;
}

- (void)setPostData:(id)a3
{
  objc_storeStrong((id *)&self->_postData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postData, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->_preData, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)withMultipartType:(int)a3 key:(id)a4 data:(id)a5 contentType:(id)a6 fileName:(id)a7 boundary:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  JXHTTPMultipartPart *v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = *(_QWORD *)&a3;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  v16 = a5;
  v17 = a4;
  v18 = objc_alloc_init(JXHTTPMultipartPart);
  -[JXHTTPMultipartPart setMultipartType:](v18, "setMultipartType:", v12);
  -[JXHTTPMultipartPart setKey:](v18, "setKey:", v17);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%@\r\n"), v15);

  objc_msgSend(v19, "appendFormat:", CFSTR("Content-Disposition: form-data; name=\"%@\"), v17);
  if (objc_msgSend(v14, "length"))
    objc_msgSend(v19, "appendFormat:", CFSTR("; filename=\"%@\"), v14);
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v19, "appendFormat:", CFSTR("\r\nContent-Type: %@"), v13);
  }
  else if (-[JXHTTPMultipartPart multipartType](v18, "multipartType") == 1)
  {
    objc_msgSend(v19, "appendString:", CFSTR("\r\nContent-Type: application/octet-stream"));
  }
  objc_msgSend(v19, "appendString:", CFSTR("\r\n\r\n"));
  objc_msgSend(v19, "dataUsingEncoding:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[JXHTTPMultipartPart setPreData:](v18, "setPreData:", v20);

  -[JXHTTPMultipartPart setContentData:](v18, "setContentData:", v16);
  objc_msgSend(CFSTR("\r\n"), "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[JXHTTPMultipartPart setPostData:](v18, "setPostData:", v21);

  return v18;
}

@end
