@implementation JXHTTPFileBody

- (JXHTTPFileBody)initWithFilePath:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  JXHTTPFileBody *v8;
  JXHTTPFileBody *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)JXHTTPFileBody;
  v8 = -[JXHTTPFileBody init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[JXHTTPFileBody setFilePath:](v8, "setFilePath:", v6);
    -[JXHTTPFileBody setHttpContentType:](v9, "setHttpContentType:", v7);
  }

  return v9;
}

- (id)httpInputStream
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDBCE90]);
  -[JXHTTPFileBody filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFileAtPath:", v4);

  return v5;
}

- (int64_t)httpContentLength
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  id v16;

  -[JXHTTPFileBody filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return -1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JXHTTPFileBody filePath](self, "filePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPFileBody.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ (%d) ERROR: %@"), v10, 41, v11);

  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDD0D08]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "longLongValue");
  else
    v14 = -1;

  return v14;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)httpContentType
{
  return self->_httpContentType;
}

- (void)setHttpContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpContentType, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

+ (id)withFilePath:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilePath:contentType:", v7, v6);

  return v8;
}

+ (id)withFilePath:(id)a3
{
  return (id)objc_msgSend(a1, "withFilePath:contentType:", a3, 0);
}

@end
