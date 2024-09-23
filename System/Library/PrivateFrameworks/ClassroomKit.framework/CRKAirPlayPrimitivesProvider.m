@implementation CRKAirPlayPrimitivesProvider

- (id)makePrimitives
{
  void *v2;
  void *v3;
  CRKConcreteAirPlayPrimitives *v4;
  void *v5;
  CRKConcreteAirPlayPrimitives *v6;

  objc_msgSend(MEMORY[0x24BDB25D8], "sharedSystemScreenContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setApplicationProcessID:", objc_msgSend(v3, "processIdentifier"));

  v4 = [CRKConcreteAirPlayPrimitives alloc];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKConcreteAirPlayPrimitives initWithOutputContext:notificationCenter:](v4, "initWithOutputContext:notificationCenter:", v2, v5);

  return v6;
}

@end
