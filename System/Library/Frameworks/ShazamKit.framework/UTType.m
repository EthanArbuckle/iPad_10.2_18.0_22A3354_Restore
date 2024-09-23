@implementation UTType

void __51__UTType_SHShazamAdditions__SHSignatureContentType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.shazamsignature"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SHSignatureContentType_signatureType;
  SHSignatureContentType_signatureType = v0;

}

void __55__UTType_SHShazamAdditions__SHCustomCatalogContentType__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.shazamcatalog"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SHCustomCatalogContentType_catalogType;
  SHCustomCatalogContentType_catalogType = v0;

}

@end
