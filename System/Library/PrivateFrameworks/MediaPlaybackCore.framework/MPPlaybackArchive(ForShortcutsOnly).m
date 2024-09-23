@implementation MPPlaybackArchive(ForShortcutsOnly)

- (uint64_t)containsAppleMusicRadioContent
{
  __CFString *v2;
  __CFString *v3;
  int v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "type") != 1)
    goto LABEL_4;
  objc_msgSend(a1, "playbackSessionType");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack");
  if (v2 == CFSTR("com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"))
  {

  }
  else
  {
    v4 = -[__CFString isEqual:](v2, "isEqual:", CFSTR("com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"));

    if (!v4)
    {
LABEL_4:
      isKindOfClass = 0;
      return isKindOfClass & 1;
    }
  }
  v6 = (void *)MEMORY[0x24BE65C70];
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "playbackSessionData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v6, "decodedObjectOfClasses:fromData:error:", v10, v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  if (v13)
  {
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = a1;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "MPPlaybackArchive containsAppleMusicRadioContent failed [decode failure] archive=%{public}@ error=%{public}@", buf, 0x16u);
    }
    isKindOfClass = 0;
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("original"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

@end
