@implementation SUUIURLResolverDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  SUUIURLResolverResponse *v9;

  v6 = a3;
  v7 = a4;
  SSVProtocolRedirectURLForResponse();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 0;
  else
    v9 = -[SUUIURLResolverResponse initWithData:URLResponse:]([SUUIURLResolverResponse alloc], "initWithData:URLResponse:", v6, v7);

  return v9;
}

@end
