@implementation HMDSKPresenceProvider

- (id)createPresenceWithChannelName:(id)a3 serviceIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BEB1068];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithServiceIdentifier:", v6);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1048]), "initWithPresenceIdentifier:options:", v7, v8);
  return v9;
}

@end
