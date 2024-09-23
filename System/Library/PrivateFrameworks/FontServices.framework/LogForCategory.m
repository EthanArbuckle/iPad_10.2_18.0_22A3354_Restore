@implementation LogForCategory

void __LogForCategory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  os_log_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v1 = (void *)gLogsDict;
  gLogsDict = v0;

  v14[0] = CFSTR("FontServices");
  v14[1] = CFSTR("UserFontManager");
  v14[2] = CFSTR("FSUserFontManager");
  v14[3] = CFSTR("FontProvider");
  v14[4] = CFSTR("FontProviderManager");
  v14[5] = CFSTR("FontProviderLoader");
  v14[6] = CFSTR("fontservicesd");
  v14[7] = CFSTR("ServicesDaemonManager");
  v14[8] = CFSTR("FontPickerSupport");
  v14[9] = CFSTR("FontInstallViewService");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6));
        v8 = os_log_create("com.apple.FontServices", (const char *)objc_msgSend(v7, "UTF8String", (_QWORD)v9));
        objc_msgSend((id)gLogsDict, "setObject:forKey:", v8, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

@end
