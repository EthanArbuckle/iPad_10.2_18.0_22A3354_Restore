@implementation HMFCache

+ (HMFCache)defaultCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__HMFCache_defaultCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0131C8 != -1)
    dispatch_once(&qword_1ED0131C8, block);
  return (HMFCache *)(id)_MergedGlobals_67;
}

void __24__HMFCache_defaultCache__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "initWithName:", v2);
  v4 = (void *)_MergedGlobals_67;
  _MergedGlobals_67 = v3;

}

- (HMFCache)init
{
  void *v3;
  void *v4;
  HMFCache *v5;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFCache initWithName:](self, "initWithName:", v4);

  return v5;
}

- (HMFCache)initWithName:(id)a3
{
  id v4;
  HMFCache *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSURL *URL;
  void *v31;
  HMFCache *v32;
  id v33;
  id v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 buf;
  const __CFString *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HMFCache;
  v5 = -[HMFCache init](&v35, sel_init);
  if (v5)
  {
    v34 = v4;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLsForDirectory:inDomains:", 13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v10)
    {
      v11 = v10;
      v31 = v8;
      v32 = v5;
      v33 = v4;
      v12 = *(_QWORD *)v37;
      do
      {
        v13 = v9;
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(v13);
          v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          LOBYTE(buf) = 0;
          objc_msgSend(v15, "URLByAppendingPathComponent:", v34, v31);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v18, &buf);
          v20 = buf;

          if (v19)
            v21 = v20 == 0;
          else
            v21 = 1;
          if (!v21)
          {
            v8 = v15;

            v5 = v32;
            v4 = v33;
            v9 = v13;
            goto LABEL_15;
          }

        }
        v9 = v13;
        v11 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v11);
      v5 = v32;
      v4 = v33;
      v8 = v31;
    }
LABEL_15:

    if (!v8)
    {
      v22 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier(0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_19B546000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to determine preferred cache directory", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      v25 = (void *)MEMORY[0x1E0C99E98];
      NSHomeDirectory();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = v26;
      *((_QWORD *)&buf + 1) = CFSTR("Library");
      v41 = CFSTR("Caches");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "fileURLWithPathComponents:", v27);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "URLByAppendingPathComponent:", v34);
    v28 = objc_claimAutoreleasedReturnValue();

    URL = v5->_URL;
    v5->_URL = (NSURL *)v28;

  }
  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isExists
{
  return self->_exists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
