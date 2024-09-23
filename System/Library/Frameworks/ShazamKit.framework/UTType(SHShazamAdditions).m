@implementation UTType(SHShazamAdditions)

+ (id)SHSignatureContentType
{
  if (SHSignatureContentType_onceToken != -1)
    dispatch_once(&SHSignatureContentType_onceToken, &__block_literal_global_1);
  return (id)SHSignatureContentType_signatureType;
}

+ (id)SHCustomCatalogContentType
{
  if (SHCustomCatalogContentType_onceToken != -1)
    dispatch_once(&SHCustomCatalogContentType_onceToken, &__block_literal_global_2);
  return (id)SHCustomCatalogContentType_catalogType;
}

@end
