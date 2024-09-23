@implementation NSDictionary(MRAdditions)

- (BOOL)MR_isEqualToNowPlayingInfo:()MRAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL IsEqual;
  _BOOL8 v18;
  char v19;
  char v20;
  char v21;
  char v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *, _BYTE *);
  void *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == a1)
    {
      v18 = 1;
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(a1, "count");
      if (v6 == objc_msgSend(v5, "count"))
      {
        v35[0] = CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp");
        v35[1] = CFSTR("kMRMediaRemoteNowPlayingInfoElapsedTime");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v32 = &v31;
        v33 = 0x2020000000;
        v34 = 1;
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __56__NSDictionary_MRAdditions__MR_isEqualToNowPlayingInfo___block_invoke;
        v27 = &unk_1E30CA720;
        v8 = v7;
        v28 = v8;
        v9 = v5;
        v29 = v9;
        v30 = &v31;
        objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v24);
        if (!*((_BYTE *)v32 + 24))
        {
          v18 = 0;
LABEL_25:

          _Block_object_dispose(&v31, 8);
          goto LABEL_26;
        }
        objc_msgSend(a1, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"), v24, v25, v26, v27, v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoTimestamp"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoElapsedTime"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("kMRMediaRemoteNowPlayingInfoElapsedTime"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v10 && v11)
        {
          if (v12 && v13)
          {
            _MRCreateTemporalContentItemFromNowPlayingInfo(a1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            _MRCreateTemporalContentItemFromNowPlayingInfo(v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            IsEqual = MRContentItemCalculatedPlaybackPositionIsEqual(v15, v16);
            *((_BYTE *)v32 + 24) = IsEqual;

LABEL_24:
            v18 = *((_BYTE *)v32 + 24) != 0;
            goto LABEL_25;
          }
        }
        else if (!v10)
        {
          goto LABEL_19;
        }
        v19 = _MRNowPlayingValuesAreEqual(v10, v11);
        if (*((_BYTE *)v32 + 24))
          v20 = v19;
        else
          v20 = 0;
        *((_BYTE *)v32 + 24) = v20;
LABEL_19:
        if (v12)
        {
          v21 = _MRNowPlayingValuesAreEqual(v12, v14);
          if (*((_BYTE *)v32 + 24))
            v22 = v21;
          else
            v22 = 0;
          *((_BYTE *)v32 + 24) = v22;
        }
        goto LABEL_24;
      }
    }
  }
  v18 = 0;
LABEL_26:

  return v18;
}

@end
