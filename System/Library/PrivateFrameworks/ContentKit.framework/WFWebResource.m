@implementation WFWebResource

+ (WFWebResource)webResourceWithData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  WFWebResource *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[WFWebResource initWithData:URL:MIMEType:textEncodingName:frameName:]([WFWebResource alloc], "initWithData:URL:MIMEType:textEncodingName:frameName:", v12, v9, v11, v10, 0);

  return v13;
}

+ (WFWebResource)webResourceWithURL:(id)a3
{
  id v3;
  WFURLWebResource *v4;

  v3 = a3;
  v4 = -[WFURLWebResource initWithURL:]([WFURLWebResource alloc], "initWithURL:", v3);

  return (WFWebResource *)v4;
}

+ (WFWebResource)webResourceWithHTMLString:(id)a3 baseURL:(id)a4
{
  id v5;
  id v6;
  WFHTMLStringWebResource *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WFHTMLStringWebResource initWithHTMLString:baseURL:]([WFHTMLStringWebResource alloc], "initWithHTMLString:baseURL:", v6, v5);

  return (WFWebResource *)v7;
}

+ (WFWebResource)webResourceWithFile:(id)a3
{
  id v3;
  WFFileWebResource *v4;

  v3 = a3;
  v4 = -[WFFileWebResource initWithFile:]([WFFileWebResource alloc], "initWithFile:", v3);

  return (WFWebResource *)v4;
}

- (WFWebResource)initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WFWebResource *v17;
  uint64_t v18;
  NSData *data;
  uint64_t v20;
  NSString *MIMEType;
  uint64_t v22;
  NSString *textEncodingName;
  uint64_t v24;
  NSString *frameName;
  WFWebResource *v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[WFWebResource init](self, "init");
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    data = v17->_data;
    v17->_data = (NSData *)v18;

    objc_storeStrong((id *)&v17->_URL, a4);
    v20 = objc_msgSend(v14, "copy");
    MIMEType = v17->_MIMEType;
    v17->_MIMEType = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    textEncodingName = v17->_textEncodingName;
    v17->_textEncodingName = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    frameName = v17->_frameName;
    v17->_frameName = (NSString *)v24;

    v26 = v17;
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)WFWebResource;
  -[WFWebResource description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResource URL](self, "URL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFWebResource MIMEType](self, "MIMEType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (WFWebResource)initWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFWebResource *v10;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceMIMEType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceTextEncodingName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceFrameName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFWebResource initWithData:URL:MIMEType:textEncodingName:frameName:](self, "initWithData:URL:MIMEType:textEncodingName:frameName:", v5, v6, v7, v8, v9);
  return v10;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WFWebResource data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResource URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResource MIMEType](self, "MIMEType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResource textEncodingName](self, "textEncodingName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResource frameName](self, "frameName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = v8;
  if (v3)
    objc_msgSend(v8, "setObject:forKey:", v3, CFSTR("WebResourceData"));
  if (v4)
  {
    objc_msgSend(v4, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("WebResourceURL"));

  }
  if (v5)
    objc_msgSend(v9, "setObject:forKey:", v5, CFSTR("WebResourceMIMEType"));
  if (v6)
    objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("WebResourceTextEncodingName"));
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("WebResourceFrameName"));

  return v9;
}

- (WFWebResource)initWithCoder:(id)a3
{
  id v4;
  WFWebResource *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSURL *URL;
  uint64_t v10;
  NSString *MIMEType;
  uint64_t v12;
  NSString *textEncodingName;
  uint64_t v14;
  NSString *frameName;
  WFWebResource *v16;

  v4 = a3;
  v5 = -[WFWebResource init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceData"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    textEncodingName = v5->_textEncodingName;
    v5->_textEncodingName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebResourceURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    frameName = v5->_frameName;
    v5->_frameName = (NSString *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFWebResource data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WebResourceData"));

  -[WFWebResource URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WebResourceURL"));

  -[WFWebResource MIMEType](self, "MIMEType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WebResourceMIMEType"));

  -[WFWebResource textEncodingName](self, "textEncodingName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WebResourceTextEncodingName"));

  -[WFWebResource frameName](self, "frameName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WebResourceFrameName"));

}

- (NSData)data
{
  return self->_data;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (NSString)textEncodingName
{
  return self->_textEncodingName;
}

- (NSString)frameName
{
  return self->_frameName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameName, 0);
  objc_storeStrong((id *)&self->_textEncodingName, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)loadInWKWebView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFWebResource data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResource MIMEType](self, "MIMEType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResource textEncodingName](self, "textEncodingName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebResource URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadData:MIMEType:characterEncodingName:baseURL:", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)containedImageFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BEC14A0];
  -[WFWebResource MIMEType](self, "MIMEType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "typeFromMIMEType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToUTType:", *MEMORY[0x24BDF8410])
    && (objc_msgSend(v5, "conformsToUTType:", *MEMORY[0x24BDF8580]) & 1) == 0)
  {
    -[WFWebResource data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWebResource URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v7, v5, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
