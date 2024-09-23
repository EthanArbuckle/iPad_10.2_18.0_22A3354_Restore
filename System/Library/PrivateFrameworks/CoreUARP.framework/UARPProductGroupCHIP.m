@implementation UARPProductGroupCHIP

- (UARPProductGroupCHIP)initWithVendorID:(unsigned __int16)a3
{
  void *v4;
  UARPProductGroupCHIP *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)UARPProductGroupCHIP;
  v5 = -[UARPProductGroup initWithIdentifier:](&v7, sel_initWithIdentifier_, v4);

  return v5;
}

@end
