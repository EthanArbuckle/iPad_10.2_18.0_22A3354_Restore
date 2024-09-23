@implementation _CNDExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55___CNDExtensionContext__extensionAuxiliaryHostProtocol__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_extensionAuxiliaryHostProtocol_cn_once_token_1 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_cn_once_token_1, block);
  return (id)_extensionAuxiliaryHostProtocol_cn_once_object_1;
}

+ (id)makeHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545B0190);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57___CNDExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_extensionAuxiliaryVendorProtocol_cn_once_token_2 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_cn_once_token_2, block);
  return (id)_extensionAuxiliaryVendorProtocol_cn_once_object_2;
}

+ (id)makeVendorProtocol
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545B1960);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_renewExpirationDateForDonatedValue_acknowledgementHandler_, 0, 0);

  return v2;
}

@end
