@implementation AXLanguageSupportedBySynthesizer

void __AXLanguageSupportedBySynthesizer_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allAvailableLanguages");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXLanguageSupportedBySynthesizer_Languages;
  AXLanguageSupportedBySynthesizer_Languages = v0;

}

@end
