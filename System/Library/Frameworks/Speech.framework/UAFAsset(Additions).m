@implementation UAFAsset(Additions)

- (BOOL)_assetMetadataAvailable
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (id)_assetId
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0DC5E10]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_preferOverServer
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("PreferOverServer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)_supportsContinuousListening
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SupportsContinuousListening"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)_supportsOnDeviceSearch
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SupportsOnDeviceSearch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)_supportsAutoPunctuation
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SupportsAutoPunctuation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)_supportsEmojiRecognition
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SupportsEmojiRecognition"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (uint64_t)_supportsVoiceCommands
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SupportsVoiceCommands"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

@end
