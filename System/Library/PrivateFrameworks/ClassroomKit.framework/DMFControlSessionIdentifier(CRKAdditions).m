@implementation DMFControlSessionIdentifier(CRKAdditions)

- (CRKRemoteEndpoint)crk_endpoint
{
  CRKRemoteEndpoint *v2;
  void *v3;
  CRKRemoteEndpoint *v4;

  v2 = [CRKRemoteEndpoint alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "crk_stringWithIPAddress:", objc_msgSend(a1, "leaderIP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRKRemoteEndpoint initWithIPAddress:port:](v2, "initWithIPAddress:port:", v3, objc_msgSend(a1, "port"));

  return v4;
}

@end
