@implementation WFURLWebResource

- (WFURLWebResource)initWithURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFURLWebResource;
  return -[WFWebResource initWithData:URL:MIMEType:textEncodingName:frameName:](&v4, sel_initWithData_URL_MIMEType_textEncodingName_frameName_, 0, a3, 0, 0, 0);
}

- (id)request
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16B0];
  -[WFWebResource URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_setNonAppInitiated:", 1);
  return v4;
}

- (id)loadInWKWebView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFURLWebResource request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
