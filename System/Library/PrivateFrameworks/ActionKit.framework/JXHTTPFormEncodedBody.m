@implementation JXHTTPFormEncodedBody

- (JXHTTPFormEncodedBody)init
{
  JXHTTPFormEncodedBody *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JXHTTPFormEncodedBody;
  v2 = -[JXHTTPFormEncodedBody init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[JXHTTPFormEncodedBody setDictionary:](v2, "setDictionary:", v3);

  }
  return v2;
}

- (JXHTTPFormEncodedBody)initWithDictionary:(id)a3
{
  id v4;
  JXHTTPFormEncodedBody *v5;
  void *v6;

  v4 = a3;
  v5 = -[JXHTTPFormEncodedBody init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v4);
    -[JXHTTPFormEncodedBody setDictionary:](v5, "setDictionary:", v6);

  }
  return v5;
}

- (id)requestData
{
  void *v2;
  void *v3;
  void *v4;

  -[JXHTTPFormEncodedBody dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[JXURLEncoding formEncodedDictionary:](JXURLEncoding, "formEncodedDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)httpInputStream
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDBCE90]);
  -[JXHTTPFormEncodedBody requestData](self, "requestData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:", v4);

  return v5;
}

- (id)httpContentType
{
  return CFSTR("application/x-www-form-urlencoded; charset=utf-8");
}

- (int64_t)httpContentLength
{
  void *v2;
  int64_t v3;

  -[JXHTTPFormEncodedBody requestData](self, "requestData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
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
