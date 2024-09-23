@implementation HSDatabasesRequest

- (HSDatabasesRequest)init
{
  return -[HSRequest initWithAction:](self, "initWithAction:", CFSTR("databases"));
}

- (id)canonicalResponseForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[HSResponse responseWithResponse:](HSDatabasesResponse, "responseWithResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDatabases:", v5);
  return v3;
}

@end
