@implementation CNDExtensionContext

void __55___CNDExtensionContext__extensionAuxiliaryHostProtocol__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeHostProtocol");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_extensionAuxiliaryHostProtocol_cn_once_object_1;
  _extensionAuxiliaryHostProtocol_cn_once_object_1 = v1;

}

void __57___CNDExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeVendorProtocol");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_extensionAuxiliaryVendorProtocol_cn_once_object_2;
  _extensionAuxiliaryVendorProtocol_cn_once_object_2 = v1;

}

@end
