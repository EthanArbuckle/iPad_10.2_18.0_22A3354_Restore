@implementation LPFetcherAccessibilityEnabledAudioResponse

+ (id)audioPropertiesForFetcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___LPFetcherAccessibilityEnabledAudioResponse;
  objc_msgSendSuper2(&v9, sel_audioPropertiesForFetcher_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityText:", v7);

  return v5;
}

@end
