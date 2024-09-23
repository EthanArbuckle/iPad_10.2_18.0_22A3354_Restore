@implementation IFPlatformInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_9);
  return (id)sharedInstance_sharedInstance_1;
}

void __32__IFPlatformInfo_sharedInstance__block_invoke()
{
  IFPlatformInfo *v0;
  void *v1;

  v0 = objc_alloc_init(IFPlatformInfo);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (unint64_t)nativePlatform
{
  return 4;
}

- (unint64_t)platformFromPlatformStrings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "compare:", CFSTR("MacOSX"), (_QWORD)v13))
        {
          if (objc_msgSend(v10, "compare:", CFSTR("iPhoneOS")))
          {
            if (objc_msgSend(v10, "compare:", CFSTR("WatchOS")))
            {
              if (objc_msgSend(v10, "compare:", CFSTR("XROS")))
                v11 = 32 * (objc_msgSend(v10, "compare:", CFSTR("AppleTVOS")) == 0);
              else
                v11 = 16;
            }
            else
            {
              v11 = 8;
            }
          }
          else
          {
            v11 = 4;
          }
        }
        else
        {
          v11 = 1;
        }
        if (v11 == -[IFPlatformInfo nativePlatform](self, "nativePlatform"))
        {
          v7 = v11;
          goto LABEL_23;
        }
        if (!v7)
          v7 = v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_23:

  return v7;
}

@end
