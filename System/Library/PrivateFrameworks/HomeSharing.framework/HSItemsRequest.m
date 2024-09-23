@implementation HSItemsRequest

- (HSItemsRequest)initWithAction:(id)a3
{
  HSItemsRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSItemsRequest;
  result = -[HSRequest initWithAction:](&v4, sel_initWithAction_, a3);
  if (result)
  {
    result->_shouldParseResponse = 1;
    result->_includeHiddenItems = 0;
  }
  return result;
}

- (HSItemsRequest)initWithDatabaseID:(unsigned int)a3
{
  void *v4;
  HSItemsRequest *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("databases/%u/items"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HSItemsRequest initWithAction:](self, "initWithAction:", v4);

  return v5;
}

- (HSItemsRequest)initWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4
{
  void *v5;
  HSItemsRequest *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("databases/%u/containers/%u/items"), *(_QWORD *)&a3, *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HSItemsRequest initWithAction:](self, "initWithAction:", v5);

  return v6;
}

- (double)timeoutInterval
{
  return 120.0;
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
    +[HSResponse responseWithResponse:](HSItemsResponse, "responseWithResponse:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "responseData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setItems:", v7);
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

- (BOOL)includeHiddenItems
{
  return self->_includeHiddenItems;
}

- (void)setIncludeHiddenItems:(BOOL)a3
{
  self->_includeHiddenItems = a3;
}

+ (id)requestWithDatabaseID:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseID:", *(_QWORD *)&a3);
}

+ (id)requestWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseID:containerID:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

@end
