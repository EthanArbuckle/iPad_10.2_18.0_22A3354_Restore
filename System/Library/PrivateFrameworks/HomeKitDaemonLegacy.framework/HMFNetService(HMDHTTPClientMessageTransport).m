@implementation HMFNetService(HMDHTTPClientMessageTransport)

- (id)hmd_sessionIdentifier
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "TXTRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("si"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);
    v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
