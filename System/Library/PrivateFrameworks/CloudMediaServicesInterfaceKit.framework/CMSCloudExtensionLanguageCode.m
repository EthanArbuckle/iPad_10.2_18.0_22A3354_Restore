@implementation CMSCloudExtensionLanguageCode

void __CMSCloudExtensionLanguageCode_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@-%@"), v1, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)CMSCloudExtensionLanguageCode_languageCode;
  CMSCloudExtensionLanguageCode_languageCode = v3;

}

@end
