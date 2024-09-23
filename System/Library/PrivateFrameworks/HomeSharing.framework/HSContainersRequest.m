@implementation HSContainersRequest

- (HSContainersRequest)initWithAction:(id)a3
{
  HSContainersRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSContainersRequest;
  result = -[HSRequest initWithAction:](&v4, sel_initWithAction_, a3);
  if (result)
    result->_shouldParseResponse = 1;
  return result;
}

- (HSContainersRequest)initWithDatabaseID:(unsigned int)a3
{
  void *v4;
  HSContainersRequest *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("databases/%u/containers"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HSContainersRequest initWithAction:](self, "initWithAction:", v4);

  return v5;
}

- (id)canonicalResponseForResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (self->_shouldParseResponse)
  {
    +[HSResponse responseWithResponse:](HSContainersResponse, "responseWithResponse:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "responseData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setContainers:", v7);
    v4 = v5;
  }
  return v4;
}

- (BOOL)shouldParseResponse
{
  return self->_shouldParseResponse;
}

- (void)setShouldParseResponse:(BOOL)a3
{
  self->_shouldParseResponse = a3;
}

+ (id)requestWithDatabaseID:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseID:", *(_QWORD *)&a3);
}

@end
