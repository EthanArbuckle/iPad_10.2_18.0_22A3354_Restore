@implementation WFWordPressBlog

- (WFWordPressBlog)initWithEndpointURL:(id)a3
{
  id v4;
  WFWordPressBlog *v5;
  uint64_t v6;
  NSURL *endpointURL;
  WFWordPressBlog *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWordPressBlog;
  v5 = -[MTLModel init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    endpointURL = v5->_endpointURL;
    v5->_endpointURL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (NSNumber)blogId
{
  return self->_blogId;
}

- (NSString)blogName
{
  return self->_blogName;
}

- (BOOL)isAdmin
{
  return self->_isAdmin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blogName, 0);
  objc_storeStrong((id *)&self->_blogId, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("url");
  v3[1] = CFSTR("endpointURL");
  v4[0] = CFSTR("url");
  v4[1] = CFSTR("xmlrpc");
  v3[2] = CFSTR("blogId");
  v3[3] = CFSTR("blogName");
  v4[2] = CFSTR("blogid");
  v4[3] = CFSTR("blogName");
  v3[4] = CFSTR("isAdmin");
  v4[4] = CFSTR("isAdmin");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)urlJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BDD1970], "mtl_URLValueTransformer");
}

+ (id)endpointURLJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BDD1970], "mtl_URLValueTransformer");
}

+ (id)blogIdJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BEC3A10], "transformerUsingForwardBlock:reverseBlock:", &__block_literal_global_3558, &__block_literal_global_20);
}

+ (id)isAdminJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BDD1970], "mtl_BOOLeanValueTransformer");
}

+ (id)blogWithEndpointURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEndpointURL:", v4);

  return v5;
}

id __40__WFWordPressBlog_blogIdJSONTransformer__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *a3 = 1;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%li"), objc_msgSend(v4, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __40__WFWordPressBlog_blogIdJSONTransformer__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *a3 = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
