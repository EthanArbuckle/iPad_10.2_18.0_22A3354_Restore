@implementation ANAnnouncement(AudioProcessing)

- (uint64_t)processAudioWithEffects:()AudioProcessing error:
{
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForDefault:", *MEMORY[0x1E0CF7BA0]);

  if ((v8 & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "dataItems", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "type") == 1 && (objc_msgSend(v14, "flags") & 1) != 0)
          {
            if (!objc_msgSend(v14, "processAudioWithEffects:error:", a3, a4))
            {
              v15 = 0;
              goto LABEL_20;
            }
            objc_msgSend(v14, "setFlags:", objc_msgSend(v14, "flags") & 0xFFFFFFFFFFFFFFFELL);
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
  }
  else
  {
    if (ANLogHandleAudioProcessing_once != -1)
      dispatch_once(&ANLogHandleAudioProcessing_once, &__block_literal_global_8);
    v9 = (id)ANLogHandleAudioProcessing_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@Audio Normalization is Disabled", buf, 0xCu);
    }
  }
  v15 = 1;
LABEL_20:

  return v15;
}

+ (uint64_t)defaultAudioEffects
{
  return 1;
}

@end
