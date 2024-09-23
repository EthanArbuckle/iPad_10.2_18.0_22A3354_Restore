@implementation AVPlayerItem(AVKitAdditionsPrivate)

- (id)interstitialTimeRanges
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "avkit_dataOrNil");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "customPropertyStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("interstitialTimeRanges"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];

  return v4;
}

- (id)avkit_dataOrNil
{
  void *v2;
  char isKindOfClass;
  void *v4;

  objc_msgSend(a1, "AVKitData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "AVKitData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)translatesPlayerInterstitialEvents
{
  return 1;
}

- (void)setExternalMetadata:()AVKitAdditionsPrivate
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "externalMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isEqualToArray:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(a1, "avkit_data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customPropertyStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("externalMetadata"));

    +[AVAirMessageDispatcher shared](AVAirMessageDispatcher, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "haveAirPlayService");

    if ((_DWORD)v7)
      objc_msgSend(a1, "avkit_airMessageSendExternalMetadata");
  }

}

- (id)externalMetadata
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "avkit_dataOrNil");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "customPropertyStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("externalMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)avkit_data
{
  AVPlayerItemAVKitData *v2;
  void *v3;

  objc_msgSend(a1, "avkit_dataOrNil");
  v2 = (AVPlayerItemAVKitData *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(AVPlayerItemAVKitData);
    objc_msgSend(a1, "setAVKitData:", v2);
  }
  objc_msgSend(a1, "AVKitData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)avkit_setValue:()AVKitAdditionsPrivate forAVKitProperty:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "willChangeValueForKey:", v6);
  objc_msgSend(a1, "avkit_data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customPropertyStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);

  objc_msgSend(a1, "didChangeValueForKey:", v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("AVPlayerItemAVKitDataDidChangeNotification"), a1);

}

- (id)avkit_valueForAVKitProperty:()AVKitAdditionsPrivate
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "avkit_dataOrNil");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customPropertyStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)avkit_airMessageSendExternalMetadata
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "externalMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "avkitACMIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVAirMessage messageWithExternalMetadata:itemIdentifier:](AVAirMessage, "messageWithExternalMetadata:itemIdentifier:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _avairlog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[AVPlayerItem(AVKitAdditionsPrivate) avkit_airMessageSendExternalMetadata]";
      v9 = 2048;
      v10 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending external metadata (%ld items)", (uint8_t *)&v7, 0x16u);
    }

    +[AVAirMessageDispatcher shared](AVAirMessageDispatcher, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:completion:", v4, &__block_literal_global_1823);

  }
}

- (void)avkit_airMessageSendToAppleTV
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[AVAirMessageDispatcher shared](AVAirMessageDispatcher, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "haveAirPlayService");

  if (v3)
  {
    _avairlog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[AVPlayerItem(AVKitAdditionsPrivate) avkit_airMessageSendToAppleTV]";
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s Sending all available information for this player item.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(a1, "externalMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      objc_msgSend(a1, "avkit_airMessageSendExternalMetadata");
  }
}

- (uint64_t)defaultInterstitialPolicyEnforcement
{
  return 3;
}

- (uint64_t)interstitialPolicyEnforcement
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "avkit_data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "interstitialPolicyEnforcement");

  return v2;
}

- (void)setInterstitialTimeRanges:()AVKitAdditionsPrivate
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "interstitialTimeRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqualToArray:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(a1, "avkit_data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customPropertyStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("interstitialTimeRanges"));

  }
}

- (id)contentTitle
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "avkit_dataOrNil");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "customPropertyStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contentTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContentTitle:()AVKitAdditionsPrivate
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "contentTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(a1, "avkit_data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customPropertyStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("contentTitle"));

  }
}

- (id)contentSubtitle
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "avkit_dataOrNil");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "customPropertyStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contentSubtitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContentSubtitle:()AVKitAdditionsPrivate
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "contentSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(a1, "avkit_data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customPropertyStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("contentSubtitle"));

  }
}

@end
