@implementation NSURLRequest(RemoteQuery)

- (uint64_t)rq_protocolVersion
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "valueForHTTPHeaderField:", 0x24E0ABEE0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (uint64_t)rq_timeout
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "valueForHTTPHeaderField:", 0x24E0ABF00);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

@end
