@implementation ENWebResource

- (ENWebResource)initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ENWebResource *v17;
  ENWebResource *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ENWebResource;
  v17 = -[ENWebResource init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[ENWebResource setData:](v17, "setData:", v12);
    -[ENWebResource setURL:](v18, "setURL:", v13);
    -[ENWebResource setMIMEType:](v18, "setMIMEType:", v14);
    -[ENWebResource setTextEncodingName:](v18, "setTextEncodingName:", v15);
    -[ENWebResource setFrameName:](v18, "setFrameName:", v16);
  }

  return v18;
}

- (id)propertyList
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ENWebResource data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ENWebResource data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("WebResourceData"));

  }
  -[ENWebResource URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ENWebResource URL](self, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("WebResourceURL"));

  }
  -[ENWebResource MIMEType](self, "MIMEType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ENWebResource MIMEType](self, "MIMEType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("WebResourceMIMEType"));

  }
  -[ENWebResource textEncodingName](self, "textEncodingName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ENWebResource textEncodingName](self, "textEncodingName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("WebResourceTextEncodingName"));

  }
  -[ENWebResource frameName](self, "frameName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ENWebResource frameName](self, "frameName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("WebResourceFrameName"));

  }
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

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void)setMIMEType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)textEncodingName
{
  return self->_textEncodingName;
}

- (void)setTextEncodingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)frameName
{
  return self->_frameName;
}

- (void)setFrameName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameName, 0);
  objc_storeStrong((id *)&self->_textEncodingName, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)webResourceWithDictionary:(id)a3
{
  id v3;
  ENWebResource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ENWebResource *v12;

  v3 = a3;
  v4 = [ENWebResource alloc];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebResourceData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebResourceURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebResourceMIMEType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebResourceTextEncodingName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebResourceFrameName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ENWebResource initWithData:URL:MIMEType:textEncodingName:frameName:](v4, "initWithData:URL:MIMEType:textEncodingName:frameName:", v5, v8, v9, v10, v11);
  return v12;
}

@end
