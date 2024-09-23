@implementation AAUIQuotaResponse

- (NSArray)iCloudMediaUsage
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AAUIiCloudMediaUsageInfo *v17;
  double v18;
  AAUIiCloudMediaUsageInfo *v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAQuotaInfoResponse usage](self, "usage");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", CFSTR("media_key"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("usage_in_bytes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        v12 = v11;

        v13 = (void *)MEMORY[0x1E0DC3658];
        objc_msgSend(v8, "objectForKey:", CFSTR("display_color"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "aaui_colorWithHexString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKey:", CFSTR("display_label"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [AAUIiCloudMediaUsageInfo alloc];
        LODWORD(v18) = v12;
        v19 = -[AAUIiCloudMediaUsageInfo initWithMediaType:representativeColor:bytesUsed:](v17, "initWithMediaType:representativeColor:bytesUsed:", v9, v15, v18);
        -[AAUIiCloudMediaUsageInfo setDisplayLabel:](v19, "setDisplayLabel:", v16);
        objc_msgSend(v3, "addObject:", v19);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }
  v20 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v20;
}

@end
