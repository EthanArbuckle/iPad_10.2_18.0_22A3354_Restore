@implementation WFFileWebResource

- (WFFileWebResource)initWithFile:(id)a3
{
  id v5;
  WFFileWebResource *v6;
  WFFileWebResource *v7;
  WFFileWebResource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFileWebResource;
  v6 = -[WFFileWebResource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_file, a3);
    v8 = v7;
  }

  return v7;
}

- (id)loadInWKWebView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFFileWebResource file](self, "file");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "loadFileURL:allowingReadAccessToURL:", v6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)data
{
  void *v2;
  void *v3;

  -[WFFileWebResource file](self, "file");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mappedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)MIMEType
{
  void *v2;
  void *v3;
  void *v4;

  -[WFFileWebResource file](self, "file");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wfType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MIMEType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WFFileWebResource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFFileWebResource *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFFileWebResource initWithFile:](self, "initWithFile:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFFileWebResource;
  v4 = a3;
  -[WFWebResource encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFFileWebResource file](self, "file", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("file"));

}

- (WFFileRepresentation)file
{
  return self->_file;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
