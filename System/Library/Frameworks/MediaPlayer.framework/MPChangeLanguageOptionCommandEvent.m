@implementation MPChangeLanguageOptionCommandEvent

- (MPChangeLanguageOptionCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPChangeLanguageOptionCommandEvent *v9;
  void *v10;
  uint64_t v11;
  const void *v12;
  MPNowPlayingInfoLanguageOption *v13;
  MPNowPlayingInfoLanguageOption *languageOption;
  void *v15;
  int v16;
  uint64_t v17;
  objc_super v19;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPChangeLanguageOptionCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v19, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CC20]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = MRLanguageOptionCreateFromExternalRepresentation();
      if (v11)
      {
        v12 = (const void *)v11;
        v13 = -[MPNowPlayingInfoLanguageOption initWithMRLanguageOption:]([MPNowPlayingInfoLanguageOption alloc], "initWithMRLanguageOption:", v11);
        languageOption = v9->_languageOption;
        v9->_languageOption = v13;

        CFRelease(v12);
      }
    }
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D4CBA8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");

    v17 = 2 * (v16 == 2);
    if (v16 == 1)
      v17 = 1;
    v9->_setting = v17;

  }
  return v9;
}

- (MPNowPlayingInfoLanguageOption)languageOption
{
  return self->_languageOption;
}

- (MPChangeLanguageOptionSetting)setting
{
  return self->_setting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageOption, 0);
}

@end
