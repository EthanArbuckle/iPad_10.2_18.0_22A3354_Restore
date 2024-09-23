@implementation QLItemViewController

void __92__QLItemViewController_SupportedContentTypesCommonMethods__supportedAudiovisualContentTypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDB26C8], "audiovisualTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedAudiovisualContentTypes_supportedContentTypes;
  supportedAudiovisualContentTypes_supportedContentTypes = v1;

}

@end
