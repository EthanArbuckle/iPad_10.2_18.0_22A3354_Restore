@implementation SUUIApplicationLicenseDataConsumer

- (id)applicationLicenseWithDictionary:(id)a3
{
  id v3;
  SUUIApplicationLicensePage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(SUUIApplicationLicensePage);
  objc_msgSend(v3, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUUIApplicationLicensePage setTitle:](v4, "setTitle:", v5);
  objc_msgSend(v3, "objectForKey:", CFSTR("item-metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("type"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v8 = 0;
      }
      v9 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fontName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("body { padding: 10px; background: white; font-family: '%@'; font-size: 13px; color: black; line-height: 18px; }p { margin-top: 0; padding-top: 0 }"),
                      v11);

      if (objc_msgSend(v8, "isEqualToString:", CFSTR("markup")))
      {
        v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<html><head><style type=\"text/css\">%@</style></head><body><div>%@</div></body></html>"), v12, v7);
      }
      else
      {
        SUCreateHTMLForPlainText();
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v13;
      -[SUUIApplicationLicensePage setLicenseAgreementHTML:](v4, "setLicenseAgreementHTML:", v13);

    }
  }

  return v4;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIApplicationLicenseDataConsumer;
  -[SSVURLProtocolConsumer objectForData:response:error:](&v9, sel_objectForData_response_error_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUIApplicationLicenseDataConsumer applicationLicenseWithDictionary:](self, "applicationLicenseWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
