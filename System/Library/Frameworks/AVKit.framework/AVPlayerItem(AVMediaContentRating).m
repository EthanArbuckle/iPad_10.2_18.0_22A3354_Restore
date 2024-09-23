@implementation AVPlayerItem(AVMediaContentRating)

- (id)mediaContentRating
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  double Seconds;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id obj;
  CMTime time;
  CMTime v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = MEMORY[0x1E0C9AA60];
  if (v3)
    v6 = (void *)v3;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  objc_msgSend(a1, "externalMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = v5;
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C8A990], *MEMORY[0x1E0C8A928], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v12, "containsObject:", v18);

        if (v19)
        {
          objc_msgSend(v17, "locale");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "countryCode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "stringValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&v34, 0, sizeof(v34));
          objc_msgSend(a1, "duration");
          Seconds = 0.0;
          if ((~v34.flags & 0x11) != 0)
          {
            time = v34;
            Seconds = CMTimeGetSeconds(&time);
          }
          v24 = Seconds < 4200.0 && Seconds > 0.0;
          v25 = objc_msgSend(a1, "avkitMediaType");
          if (v25 == 5)
            v26 = 1;
          else
            v26 = 2 * (v25 == 6);
          +[AVRatingProviders shared](AVRatingProviders, "shared");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "findRatingString:domain:country:shouldPreferTVDomain:", v22, v26, v21, v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            objc_msgSend(v31, "addObject:", v28);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v14);
  }

  objc_msgSend(v31, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

@end
