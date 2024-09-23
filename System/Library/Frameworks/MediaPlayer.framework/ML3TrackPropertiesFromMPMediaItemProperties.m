@implementation ML3TrackPropertiesFromMPMediaItemProperties

void ___ML3TrackPropertiesFromMPMediaItemProperties_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D512C8], "propertyForMPMediaEntityProperty:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "[MPCloudController] Failed to find ML3 equivalent for property: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
}

@end
