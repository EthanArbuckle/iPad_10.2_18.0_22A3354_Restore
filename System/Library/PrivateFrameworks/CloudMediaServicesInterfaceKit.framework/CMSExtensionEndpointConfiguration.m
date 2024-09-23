@implementation CMSExtensionEndpointConfiguration

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<CMSExtensionEndpointConfiguration: endpointURL:%@ groupHeaders:%@ headers:%@>"), self->_endpointURL, self->_groupHeaders, self->_headers);
}

- (CMSExtensionEndpointConfiguration)init
{
  void *v3;
  CMSExtensionEndpointConfiguration *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24E1CDD40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CMSExtensionEndpointConfiguration initWithDictionary:endpoint:baseURL:groupHeaders:](self, "initWithDictionary:endpoint:baseURL:groupHeaders:", MEMORY[0x24BDBD1B8], CFSTR("/"), v3, MEMORY[0x24BDBD1B8]);

  return v4;
}

- (CMSExtensionEndpointConfiguration)initWithDictionary:(id)a3 endpoint:(id)a4 baseURL:(id)a5 groupHeaders:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CMSExtensionEndpointConfiguration *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSURL *endpointURL;
  NSURL *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSURL *v24;
  uint64_t v25;
  NSDictionary *headers;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CMSExtensionEndpointConfiguration;
  v14 = -[CMSExtensionEndpointConfiguration init](&v28, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "cmsOptionalStringForKey:", CFSTR("url"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if (!objc_msgSend(v15, "length"))
        goto LABEL_9;
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      endpointURL = v14->_endpointURL;
      v14->_endpointURL = (NSURL *)v17;

      v19 = v14->_endpointURL;
      if (!v19)
        goto LABEL_9;
      -[NSURL baseURL](v19, "baseURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        goto LABEL_9;
      v21 = (void *)MEMORY[0x24BDBCF48];
      v22 = v16;
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDBCF48];
      v22 = v11;
    }
    objc_msgSend(v21, "URLWithString:relativeToURL:", v22, v12);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v14->_endpointURL;
    v14->_endpointURL = (NSURL *)v23;

LABEL_9:
    objc_storeStrong((id *)&v14->_groupHeaders, a6);
    objc_msgSend(v10, "cmsOptionalDictionaryForKey:", CFSTR("hdr"));
    v25 = objc_claimAutoreleasedReturnValue();
    headers = v14->_headers;
    v14->_headers = (NSDictionary *)v25;

  }
  return v14;
}

- (NSMutableURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)setEndpointURL:(id)a3
{
  objc_storeStrong((id *)&self->_endpointURL, a3);
}

- (NSDictionary)groupHeaders
{
  return self->_groupHeaders;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_groupHeaders, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
