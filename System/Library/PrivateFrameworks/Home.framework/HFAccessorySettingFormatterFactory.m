@implementation HFAccessorySettingFormatterFactory

+ (id)defaultFactory
{
  if (_MergedGlobals_328 != -1)
    dispatch_once(&_MergedGlobals_328, &__block_literal_global_55_1);
  return (id)qword_1ED379EB8;
}

void __52__HFAccessorySettingFormatterFactory_defaultFactory__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED379EB8;
  qword_1ED379EB8 = v0;

}

- (HFAccessorySettingFormatterFactory)init
{
  HFAccessorySettingFormatterFactory *v2;
  uint64_t v3;
  NSMutableDictionary *formattersForKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFAccessorySettingFormatterFactory;
  v2 = -[HFAccessorySettingFormatterFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    formattersForKey = v2->_formattersForKey;
    v2->_formattersForKey = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)formatterForKey:(id)a3 copy:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a4;
  -[HFAccessorySettingFormatterFactory formatterForKey:](self, "formatterForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "copy");

    v6 = (void *)v7;
  }
  return v6;
}

- (id)formatterForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  HFAccessorySettingFormatterFactory *v13;
  id v14;

  v4 = a3;
  -[HFAccessorySettingFormatterFactory formattersForKey](self, "formattersForKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __54__HFAccessorySettingFormatterFactory_formatterForKey___block_invoke;
  v12 = &unk_1EA740F58;
  v13 = self;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("Requested nil formatter! Bad things could happen! People are assuming this returns something."), v9, v10, v11, v12, v13, v14);

  return v7;
}

uint64_t __54__HFAccessorySettingFormatterFactory_formatterForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_buildFormatterForKey:", *(_QWORD *)(a1 + 40));
}

- (id)_buildFormatterForKey:(id)a3
{
  id v4;
  HFSimpleFormatter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HFSimpleFormatter *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HFSimpleFormatter *v14;
  void *v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("AccessorySettingsDefaultFormatter")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("AccessorySettingsAccessibilitySecondsFormatter")))
    {
      v5 = [HFSimpleFormatter alloc];
      v6 = &__block_literal_global_75_1;
      goto LABEL_5;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("SiriFormatter")))
    {
      objc_msgSend((id)objc_opt_class(), "_siriFormatter");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("SiriRecognitionLanguageFormatter")))
    {
      objc_msgSend((id)objc_opt_class(), "_siriRecognitionLanguageFormatter");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("SiriOutputVoiceFormatter")))
    {
      objc_msgSend((id)objc_opt_class(), "_siriOutputVoiceFormatter");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("SiriPersonalRequestsFormatter")))
    {
      objc_msgSend((id)objc_opt_class(), "_siriPersonalRequestsFormatter");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("AnnounceEnabledFormatter")))
    {
      objc_msgSend((id)objc_opt_class(), "_announceEnabledFormatter");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("AnnounceFooterTitleFormatter")))
    {
      v10 = [HFSimpleFormatter alloc];
      v11 = &__block_literal_global_80_1;
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("AudioAnalysisEnabledFormatter")))
      {
        objc_msgSend((id)objc_opt_class(), "_audioAnalysisEnabledFormatter");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("AudioAnalysisFooterTitleFormatter")))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("HFHomePodAnalyticImproveSiriDictationFooter")))
        {
          v14 = [HFSimpleFormatter alloc];
          v15 = &__block_literal_global_356;
        }
        else
        {
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("DoorbellChimeEnabledFormatter")))
          {
            objc_msgSend((id)objc_opt_class(), "_doorbellChimeEnabledFormatter");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_6;
          }
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("AccessorySettingsProfileCountFormatter")))
          {
            v12 = objc_opt_new();
            goto LABEL_25;
          }
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("PrimaryUserAccountFormatterKey")))
          {
            __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_6();
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("AllowExplicitContentFormatter")))
          {
            v10 = [HFSimpleFormatter alloc];
            v11 = &__block_literal_global_372_1;
            goto LABEL_24;
          }
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("PlaybackInfluencesFormatter")))
          {
            __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_2_375();
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("SiriFooterTitleFormatter")))
          {
            v14 = [HFSimpleFormatter alloc];
            v15 = &__block_literal_global_382;
          }
          else
          {
            if (!objc_msgSend(v4, "isEqualToString:", CFSTR("LocationFooterTitleFormatter")))
            {
              if (objc_msgSend(v4, "isEqualToString:", CFSTR("AirPlayFooterTitleFormatter")))
              {
                v10 = [HFSimpleFormatter alloc];
                v11 = &__block_literal_global_394_0;
              }
              else if (objc_msgSend(v4, "isEqualToString:", CFSTR("VoiceFeedbackHeaderTitleFormatter")))
              {
                v10 = [HFSimpleFormatter alloc];
                v11 = &__block_literal_global_398;
              }
              else if (objc_msgSend(v4, "isEqualToString:", CFSTR("VoiceFeedbackFooterTitleFormatter")))
              {
                v10 = [HFSimpleFormatter alloc];
                v11 = &__block_literal_global_401_0;
              }
              else
              {
                if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SiriTriggerPhraseSettingFormatter")))
                {
                  v8 = 0;
                  goto LABEL_7;
                }
                v10 = [HFSimpleFormatter alloc];
                v11 = &__block_literal_global_404_0;
              }
              goto LABEL_24;
            }
            v14 = [HFSimpleFormatter alloc];
            v15 = &__block_literal_global_388;
          }
        }
        v12 = -[HFSimpleFormatter initWithAttributedFormatterBlock:](v14, "initWithAttributedFormatterBlock:", v15);
        goto LABEL_25;
      }
      v10 = [HFSimpleFormatter alloc];
      v11 = &__block_literal_global_352_0;
    }
LABEL_24:
    v12 = -[HFSimpleFormatter initWithFormatterBlock:](v10, "initWithFormatterBlock:", v11);
LABEL_25:
    v8 = (void *)v12;
    -[HFAccessorySettingFormatterFactory formattersForKey](self, "formattersForKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v8, v4);

    goto LABEL_7;
  }
  v5 = [HFSimpleFormatter alloc];
  v6 = &__block_literal_global_64_3;
LABEL_5:
  v7 = -[HFSimpleFormatter initWithFormatterBlock:](v5, "initWithFormatterBlock:", v6);
LABEL_6:
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;

  v2 = a2;
  if (!v2)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    NSLog(CFSTR("You're attempting to use a BOOL formatter for a value that doesn't respond to -[NSObject BOOLValue]"), 0);
    goto LABEL_8;
  }
  if (!objc_msgSend(v2, "BOOLValue"))
  {
LABEL_8:
    v3 = CFSTR("HFAccessorySettingGroupItemOff");
    goto LABEL_9;
  }
  v3 = CFSTR("HFAccessorySettingGroupItemOn");
LABEL_9:
  _HFLocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  AXFormatNumberWithOptions();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFAccessibilitySecondsFormatString"), CFSTR("%@"), v1, v2, v3, v4, v5, v6, (uint64_t)v0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F0449888))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v2;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F03F0E10))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    objc_msgSend(v4, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v9 = v13;
  }
  objc_msgSend(v9, "hf_userFriendlyLocalizedLowercaseDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFAnnounceFooterText"), CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F0449888))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v2;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F03F0E10))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    objc_msgSend(v4, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v9 = v13;
  }
  objc_msgSend(v9, "hf_userFriendlyLocalizedLowercaseDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFAudioAnalysisFooterText"), CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFHomePodAnalyticImproveSiriDictationFooter"), CFSTR("HFHomePodAnalyticImproveSiriDictationFooter"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFHomePodAnalyticImproveSiriDictationFooterLink"), CFSTR("HFHomePodAnalyticImproveSiriDictationFooterLink"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v14 = *MEMORY[0x1E0CEA0C0];
  +[HFURLComponents aboutImproveSiriAndDictationURL](HFURLComponents, "aboutImproveSiriAndDictationURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v5, v11);
  objc_msgSend(v8, "appendAttributedString:", v12);

  objc_msgSend(v8, "addAttributes:range:", v3, 0, objc_msgSend(v8, "length"));
  return v8;
}

HFSimpleFormatter *__60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_6()
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_368_0);
}

__CFString *__60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = &unk_1F0449888;
  v4 = v2;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (objc_msgSend(v4, "conformsToProtocol:", v3))
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v10);

LABEL_7:
    v7 = 0;
  }

  if (v7)
  {
    objc_msgSend(v7, "hf_appleMusicCurrentLoggedInAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "username");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hf_supportsPreferredMediaUser")
      && objc_msgSend(v7, "hf_preferredUserSelectionType") == 1)
    {
      objc_msgSend(v7, "hf_preferredMediaUser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v14;
    }
    HFLogForCategory(0x34uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Media account value:  %@", buf, 0xCu);
    }

  }
  else
  {
    v12 = &stru_1EA741FF8;
  }

  return v12;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_371()
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFAllowExplicitContentFooterText"), CFSTR("HFAllowExplicitContentFooterText"), 1);
}

HFSimpleFormatter *__60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_2_375()
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_378_0);
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_3_377(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;

  v2 = a2;
  v3 = &unk_1F0449888;
  v4 = v2;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", v3))
      v6 = v5;
    else
      v6 = 0;
    v7 = v5;
    if (v6)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v10);

  }
  v7 = 0;
LABEL_8:

  if (v7)
  {
    objc_msgSend(v7, "hf_settingsValueManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForSettingAtKeyPath:", CFSTR("root.music.playbackInfluencesForYou"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
      v14 = CFSTR("HFAccessorySettingGroupItemOn");
    else
      v14 = CFSTR("HFAccessorySettingGroupItemOff");
    _HFLocalizedStringWithDefaultValue(v14, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFPlaybackInfluencesSettingNever"), CFSTR("HFPlaybackInfluencesSettingNever"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_4_381(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFSiriFooterPrivacyText"), CFSTR("HFSiriFooterPrivacyText"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFPrivacyFooterSectionTypeSiri"), CFSTR("HFPrivacyFooterSectionTypeSiri"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v14 = *MEMORY[0x1E0CEA0C0];
  +[HFURLComponents siriPrivacyURL](HFURLComponents, "siriPrivacyURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v5, v11);
  objc_msgSend(v8, "appendAttributedString:", v12);

  objc_msgSend(v8, "addAttributes:range:", v3, 0, objc_msgSend(v8, "length"));
  return v8;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_5_387(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLocalizedWiFiString(CFSTR("HFLocationFooterPrivacyText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFPrivacyFooterSectionTypeLocationServices"), CFSTR("HFPrivacyFooterSectionTypeLocationServices"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v14 = *MEMORY[0x1E0CEA0C0];
  +[HFURLComponents locationPrivacyURL](HFURLComponents, "locationPrivacyURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v5, v11);
  objc_msgSend(v8, "appendAttributedString:", v12);

  objc_msgSend(v8, "addAttributes:range:", v3, 0, objc_msgSend(v8, "length"));
  return v8;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_6_393()
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFAirPlayFooterText"), CFSTR("HFAirPlayFooterText"), 1);
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_7_397()
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaCodexAccessibilityVoiceFeedbackHeader"), CFSTR("HFMediaCodexAccessibilityVoiceFeedbackHeader"), 1);
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_8()
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaCodexAccessibilityVoiceFeedbackFooter"), CFSTR("HFMediaCodexAccessibilityVoiceFeedbackFooter"), 1);
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_9(uint64_t a1, void *a2)
{
  __CFString *v2;

  if (objc_msgSend(a2, "BOOLValue"))
    v2 = CFSTR("HFAccessorySettingGroupItemOn");
  else
    v2 = CFSTR("HFAccessorySettingGroupItemOff");
  _HFLocalizedStringWithDefaultValue(v2, v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_siriFormatter
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_405_0);
}

id __52__HFAccessorySettingFormatterFactory__siriFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __CFString *v12;
  void *v13;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F0449888))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "mediaProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_mediaAccessoryCommonSettingsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "settingValueForKeyPath:", HFAllowHeySiriSettingKeyPath);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settingValueForKeyPath:", HFTapToAccessSiriSettingKeyPath);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11 && ((objc_msgSend(v8, "BOOLValue") & 1) != 0 || objc_msgSend(v10, "BOOLValue")))
    v12 = CFSTR("HFAccessorySettingGroupItemOn");
  else
    v12 = CFSTR("HFAccessorySettingGroupItemOff");
  _HFLocalizedStringWithDefaultValue(v12, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_siriRecognitionLanguageFormatter
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_406_0);
}

id __71__HFAccessorySettingFormatterFactory__siriRecognitionLanguageFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFSiriLanguageOption *v3;
  HFSiriLanguageOption *v4;
  HFSiriLanguageOption *v5;
  HFSiriLanguageOption *v6;
  HFSiriLanguageOption *v7;
  HFSiriLanguageOption *v8;
  HFSiriLanguageOption *v9;
  HFSiriLanguageOption *v10;
  HFSiriLanguageOption *v11;
  HFSiriLanguageOption *v12;
  HFSiriLanguageOption *v13;
  HFSiriLanguageOption *v14;
  HFSiriLanguageOption *v15;
  HFSiriLanguageOption *v16;
  void *v17;

  v2 = a2;
  objc_opt_class();
  v3 = (HFSiriLanguageOption *)v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = v3;
  if (!v5)
  {
    objc_opt_class();
    v7 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      -[HFSiriLanguageOption title](v9, "title");
      v10 = (HFSiriLanguageOption *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      v11 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v10 = v12;

    }
    v6 = -[HFSiriLanguageOption initWithSerializedRepresentation:]([HFSiriLanguageOption alloc], "initWithSerializedRepresentation:", v10);

  }
  objc_opt_class();
  v13 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v16 = -[HFSiriLanguageOption initWithHomeKitSettingLanguageValue:]([HFSiriLanguageOption alloc], "initWithHomeKitSettingLanguageValue:", v15);

    v6 = v16;
  }
  -[HFSiriLanguageOption localizedRecognitionLanguage](v6, "localizedRecognitionLanguage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_siriOutputVoiceFormatter
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_410);
}

id __63__HFAccessorySettingFormatterFactory__siriOutputVoiceFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFSiriLanguageOption *v3;
  HFSiriLanguageOption *v4;
  HFSiriLanguageOption *v5;
  HFSiriLanguageOption *v6;
  HFSiriLanguageOption *v7;
  HFSiriLanguageOption *v8;
  HFSiriLanguageOption *v9;
  HFSiriLanguageOption *v10;
  HFSiriLanguageOption *v11;
  HFSiriLanguageOption *v12;
  HFSiriLanguageOption *v13;
  HFSiriLanguageOption *v14;
  HFSiriLanguageOption *v15;
  HFSiriLanguageOption *v16;
  void *v17;

  v2 = a2;
  objc_opt_class();
  v3 = (HFSiriLanguageOption *)v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = v3;
  if (!v5)
  {
    objc_opt_class();
    v7 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      -[HFSiriLanguageOption title](v9, "title");
      v10 = (HFSiriLanguageOption *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      v11 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v10 = v12;

    }
    v6 = -[HFSiriLanguageOption initWithSerializedRepresentation:]([HFSiriLanguageOption alloc], "initWithSerializedRepresentation:", v10);

  }
  objc_opt_class();
  v13 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v16 = -[HFSiriLanguageOption initWithHomeKitSettingLanguageValue:]([HFSiriLanguageOption alloc], "initWithHomeKitSettingLanguageValue:", v15);

    v6 = v16;
  }
  -[HFSiriLanguageOption localizedOutputVoice](v6, "localizedOutputVoice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_siriPersonalRequestsFormatter
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_412_0);
}

id __68__HFAccessorySettingFormatterFactory__siriPersonalRequestsFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assistantAccessControlForHome:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v7, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__HFAccessorySettingFormatterFactory__siriPersonalRequestsFormatter__block_invoke_2;
  v16[3] = &unk_1EA727840;
  v17 = v10;
  v11 = v10;
  if (!objc_msgSend(v3, "na_all:", v16))
  {
LABEL_7:
    v12 = CFSTR("HFSiriPersonalRequestsValueOff");
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "allowUnauthenticatedRequests") & 1) == 0)
  {
    HFLogForCategory(0x45uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v2;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Forcing PR OFF for %@ because the user previously had allowUnauthenticatedRequests set to NO", buf, 0xCu);
    }

    goto LABEL_7;
  }
  v12 = CFSTR("HFSiriPersonalRequestsValueOn");
LABEL_8:
  _HFLocalizedStringWithDefaultValue(v12, v12, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __68__HFAccessorySettingFormatterFactory__siriPersonalRequestsFormatter__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

+ (id)_announceEnabledFormatter
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_419);
}

id __63__HFAccessorySettingFormatterFactory__announceEnabledFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F0449888))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "hf_settingsValueManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_accessorySettingAtKeyPath:", CFSTR("root.announce.enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if (v7)
  {
    objc_msgSend(v5, "valueForSetting:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v2;
  }
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = CFSTR("HFAnnounceEnabledValueOff");
  if (v11 && objc_msgSend(v11, "BOOLValue"))
    v12 = CFSTR("HFAnnounceEnabledValueOn");
  _HFLocalizedStringWithDefaultValue(v12, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_audioAnalysisEnabledFormatter
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_424);
}

id __68__HFAccessorySettingFormatterFactory__audioAnalysisEnabledFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F0449888))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "hf_settingsValueManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_accessorySettingAtKeyPath:", CFSTR("root.audioAnalysis.enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if (v7)
  {
    objc_msgSend(v5, "valueForSetting:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v2;
  }
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = CFSTR("HFAudioAnalysisEnabledValueOff");
    if (objc_msgSend(v11, "BOOLValue"))
    {
      objc_msgSend(v4, "hf_home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "audioAnalysisClassifierOptions");

      if (v14)
        v12 = CFSTR("HFAudioAnalysisEnabledValueOn");
    }
  }
  else
  {
    v12 = CFSTR("HFAudioAnalysisEnabledValueOff");
  }
  _HFLocalizedStringWithDefaultValue(v12, v12, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_doorbellChimeEnabledFormatter
{
  return -[HFSimpleFormatter initWithFormatterBlock:]([HFSimpleFormatter alloc], "initWithFormatterBlock:", &__block_literal_global_429);
}

id __68__HFAccessorySettingFormatterFactory__doorbellChimeEnabledFormatter__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a2, "hf_home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_allHomePodsOrStereoPairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(v2, "hf_allHomePodsOrStereoPairsThatWillChime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v2, "hf_allSiriEndPointProfileContainersThatWillChime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") + v6;

  objc_msgSend(v2, "hf_allSiriEndPointProfileContainers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8)
  {
    if (v8 != v10 + v4)
    {
      v13 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v14, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v11 = CFSTR("HFChimeOnAccessories_ValueAll");
  }
  else
  {
    v11 = CFSTR("HFChimeOnAccessories_ValueOff");
  }
  _HFLocalizedStringWithDefaultValue(v11, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v12;
}

- (NSMutableDictionary)formattersForKey
{
  return self->_formattersForKey;
}

- (void)setFormattersForKey:(id)a3
{
  objc_storeStrong((id *)&self->_formattersForKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattersForKey, 0);
}

@end
