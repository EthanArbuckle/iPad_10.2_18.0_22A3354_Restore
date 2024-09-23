@implementation NSURL(MSVAdditions)

- (BOOL)msv_isValidMediaAssetURL
{
  return objc_msgSend(a1, "msv_mediaAssetPersistentID") != 0;
}

- (uint64_t)msv_mediaAssetPersistentID
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("ipod-library")) & 1) == 0)
  {

    return 0;
  }
  objc_msgSend(a1, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("item"));

  if (!v4)
    return 0;
  objc_msgSend(a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          objc_msgSend(v12, "objectAtIndex:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("id")))
          {
            objc_msgSend(v12, "objectAtIndex:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "scanLongLong:", &v22);

            v16 = v22;
            if (v16)
            {

              goto LABEL_18;
            }
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_18:

  return v22;
}

+ (id)msv_urlForMediaAssetWithPersistentID:()MSVAdditions pathExtension:
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@/%@.%@?%@=%lli"), CFSTR("ipod-library"), CFSTR("item"), CFSTR("item"), a4, CFSTR("id"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
