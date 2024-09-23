@implementation WFHTMLStringWebResource

- (WFHTMLStringWebResource)initWithHTMLString:(id)a3 baseURL:(id)a4
{
  id v7;
  id v8;
  WFHTMLStringWebResource *v9;
  WFHTMLStringWebResource *v10;
  WFHTMLStringWebResource *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFHTMLStringWebResource;
  v9 = -[WFHTMLStringWebResource init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_htmlString, a3);
    objc_storeStrong((id *)&v10->_baseURL, a4);
    v11 = v10;
  }

  return v10;
}

- (id)loadInWKWebView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFHTMLStringWebResource htmlString](self, "htmlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHTMLStringWebResource baseURL](self, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "loadHTMLString:baseURL:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("file:///"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadHTMLString:baseURL:", v5, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)data
{
  void *v2;
  void *v3;

  -[WFHTMLStringWebResource htmlString](self, "htmlString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)MIMEType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MIMEType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textEncodingName
{
  return CFSTR("UTF-8");
}

- (WFHTMLStringWebResource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFHTMLStringWebResource *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("htmlString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFHTMLStringWebResource initWithHTMLString:baseURL:](self, "initWithHTMLString:baseURL:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFHTMLStringWebResource;
  v4 = a3;
  -[WFWebResource encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFHTMLStringWebResource htmlString](self, "htmlString", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("htmlString"));

  -[WFHTMLStringWebResource baseURL](self, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("baseURL"));

}

- (NSString)htmlString
{
  return self->_htmlString;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_htmlString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
