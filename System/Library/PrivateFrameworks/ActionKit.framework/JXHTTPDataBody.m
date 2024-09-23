@implementation JXHTTPDataBody

- (JXHTTPDataBody)initWithData:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  JXHTTPDataBody *v8;
  JXHTTPDataBody *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)JXHTTPDataBody;
  v8 = -[JXHTTPDataBody init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[JXHTTPDataBody setData:](v8, "setData:", v6);
    -[JXHTTPDataBody setHttpContentType:](v9, "setHttpContentType:", v7);
  }

  return v9;
}

- (id)httpInputStream
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDBCE90]);
  -[JXHTTPDataBody data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:", v4);

  return v5;
}

- (int64_t)httpContentLength
{
  void *v2;
  int64_t v3;

  -[JXHTTPDataBody data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
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
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)withData:(id)a3 contentType:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:contentType:", v7, v6);

  return v8;
}

+ (id)withData:(id)a3
{
  return (id)objc_msgSend(a1, "withData:contentType:", a3, 0);
}

@end
