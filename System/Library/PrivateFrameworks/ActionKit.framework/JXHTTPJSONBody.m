@implementation JXHTTPJSONBody

- (JXHTTPJSONBody)initWithData:(id)a3
{
  id v4;
  JXHTTPJSONBody *v5;
  JXHTTPJSONBody *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JXHTTPJSONBody;
  v5 = -[JXHTTPJSONBody init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[JXHTTPJSONBody setRequestData:](v5, "setRequestData:", v4);

  return v6;
}

- (id)httpInputStream
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDBCE90]);
  -[JXHTTPJSONBody requestData](self, "requestData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:", v4);

  return v5;
}

- (id)httpContentType
{
  return CFSTR("application/json; charset=utf-8");
}

- (int64_t)httpContentLength
{
  void *v2;
  int64_t v3;

  -[JXHTTPJSONBody requestData](self, "requestData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (void)httpOperationDidFinishLoading:(id)a3
{
  -[JXHTTPJSONBody setRequestData:](self, "setRequestData:", 0);
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
}

+ (id)withData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v4);

  return v5;
}

+ (id)withString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "withData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)withJSONObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 0, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPJSONBody.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ (%d) ERROR: %@"), v7, 34, v8);

  }
  objc_msgSend(a1, "withData:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
