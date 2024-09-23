@implementation SAVoice(SiriTTSServiceAddition)

- (void)initWithSiriVoice:()SiriTTSServiceAddition
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "init");
  objc_msgSend(v4, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLanguageString:", v6);

  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v7);

  objc_msgSend(v4, "SAVoiceGender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGender:", v8);

  objc_msgSend(v4, "SAVoiceQuality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQuality:", v9);

  objc_msgSend(v4, "SAVoiceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVoiceType:", v10);

  v11 = objc_msgSend(v4, "version");
  objc_msgSend(v5, "setVoiceContentVersion:", v11);
  return v5;
}

@end
