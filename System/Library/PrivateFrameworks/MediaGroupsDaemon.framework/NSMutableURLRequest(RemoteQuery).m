@implementation NSMutableURLRequest(RemoteQuery)

- (void)rq_setProtocolVersion:()RemoteQuery
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, 0x24E0ABEE0);

}

- (void)rq_setTimeout:()RemoteQuery
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, 0x24E0ABF00);

}

@end
