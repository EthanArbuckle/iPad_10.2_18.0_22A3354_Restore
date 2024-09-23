@implementation MCUISettingsWatchManager

+ (BOOL)hasAnyYorktownEnrolledWatches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!MCUIIsiPhone())
    return 0;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D51838], "setupCompletedDevicesSelectorBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllDevicesWithArchivedDevicesMatching:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(a1, "_isWatchYorktownEnrolled:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
          {
            v11 = 1;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_14:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_isWatchYorktownEnrolled:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "valueForProperty:", *MEMORY[0x1E0D51718]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (~objc_msgSend(v3, "unsignedIntegerValue") & 3) == 0;
  else
    v5 = 0;

  return v5;
}

@end
