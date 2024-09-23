@implementation BEWebAppManifest

- (BEWebAppManifest)initWithJSONData:(id)a3 manifestURL:(id)a4
{
  id v7;
  id v8;
  BEWebAppManifest *v9;
  void *v10;
  BEWebAppManifest *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BEWebAppManifest;
  v9 = -[BEWebAppManifest init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_storeStrong((id *)&v9->_jsonData, a3);
      objc_storeStrong((id *)&v9->_manifestURL, a4);
      v11 = v9;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSData)jsonData
{
  return self->_jsonData;
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_jsonData, 0);
}

@end
