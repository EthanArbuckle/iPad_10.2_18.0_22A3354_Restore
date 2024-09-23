@implementation CoreDAVPutStreamTask

- (id)requestBodyStream
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE90];
  -[CoreDAVPostOrPutTask requestDataPayload](self, "requestDataPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputStreamWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)requestBody
{
  return 0;
}

@end
