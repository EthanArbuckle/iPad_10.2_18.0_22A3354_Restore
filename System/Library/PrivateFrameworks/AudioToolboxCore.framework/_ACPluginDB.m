@implementation _ACPluginDB

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)path
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.audio.components"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_ACPluginDB)init
{
  NSMutableDictionary *v3;
  NSMutableDictionary *mSearchDirectories;

  v3 = (NSMutableDictionary *)objc_opt_new();
  mSearchDirectories = self->mSearchDirectories;
  self->mSearchDirectories = v3;

  return self;
}

- (_ACPluginDB)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mSearchDirectories;
  _ACPluginDB *v10;

  v4 = a3;
  if (objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version")) == 3)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("directories"));
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    mSearchDirectories = self->mSearchDirectories;
    self->mSearchDirectories = v8;

  }
  else
  {
    self = -[_ACPluginDB init](self, "init");
  }
  v10 = self;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", 3, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->mSearchDirectories, CFSTR("directories"));

}

- (AudioComponentVector)postInit:(SEL)a3
{
  OS_dispatch_queue *v7;
  OS_dispatch_queue *mDispatchQueue;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_log_t v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  AudioComponentVector *result;
  BOOL v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _QWORD v49[4];
  char __str[4];
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = (OS_dispatch_queue *)dispatch_queue_create("AudioComponentPluginScanner", 0);
  mDispatchQueue = self->mDispatchQueue;
  self->mDispatchQueue = v7;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->mSorted = 1;
  v33 = a4;
  if (!a4)
  {
    v9 = getenv("HOME");
    v49[0] = v9;
    v49[1] = "";
    v49[2] = "/AppleInternal";
    v49[3] = 0;
    if (v9)
    {
      v10 = 40;
      v11 = 1;
      do
      {
        snprintf(__str, 0x400uLL, "%s/Library/Audio/Plug-Ins/Components", v9);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __str);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ACPluginDB initialScanDirectory:priority:components:](self, "initialScanDirectory:priority:components:", v12, v10, retstr);

        v10 = (v10 - 1);
        v9 = (char *)v49[v11++];
      }
      while (v9);
    }
  }
  if (gAudioComponentLogCategory)
  {
    v13 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v14 = (_QWORD *)operator new();
    v14[1] = 0;
    v13 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v14 = v13;
    gAudioComponentLogCategory = (uint64_t)v14;
  }
  v15 = objc_retainAutorelease(v13);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__str = 136315394;
    v51 = "AudioComponentPluginScanner.mm";
    v52 = 1024;
    v53 = 608;
    _os_log_impl(&dword_18EE07000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d ACPL: loading complete", (uint8_t *)__str, 0x12u);
  }
  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[NSMutableDictionary allKeys](self->mSearchDirectories, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->mSearchDirectories, "objectForKeyedSubscript:", v22);
        v23 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v23[1])
          objc_msgSend(v17, "addObject:", v23);
        else
          objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v19);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = v16;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v24);
        -[NSMutableDictionary removeObjectForKey:](self->mSearchDirectories, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
        self->mDirty = 1;
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v25);
  }

  -[_ACPluginDB writeIfDirty](self, "writeIfDirty");
  if (!v33)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v28 = v17;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "monitorDirectory");
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v29);
    }

  }
  return result;
}

- (void)initialScanDirectory:(id)a3 priority:(int)a4 components:(void *)a5
{
  uint64_t v6;
  id v8;
  const char *v9;
  os_log_t v10;
  uint64_t v11;
  double *v12;
  _QWORD *v13;
  NSObject *v14;
  _ACPluginDBDirectory *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  if (!access(v9, 5))
  {

    -[NSMutableDictionary objectForKeyedSubscript:](self->mSearchDirectories, "objectForKeyedSubscript:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (double *)v11;
    if (v11)
    {
      objc_storeStrong((id *)(v11 + 8), self);
      if (v12[3] == v12[7])
      {
        objc_msgSend(v12, "loadAllComponents:", a5);
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v15 = -[_ACPluginDBDirectory initWithPath:priority:]([_ACPluginDBDirectory alloc], "initWithPath:priority:", v8, v6);
      objc_storeStrong((id *)&v15->mDB, self);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->mSearchDirectories, "setObject:forKeyedSubscript:", v15, v8);
      self->mDirty = 1;
      v12 = (double *)v15;
    }
    objc_msgSend(v12, "scanDirectory");
    objc_msgSend(v12, "loadAllComponents:", a5);
    goto LABEL_13;
  }
  if (gAudioComponentLogCategory)
  {
    v10 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v13 = (_QWORD *)operator new();
    v13[1] = 0;
    v10 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v13 = v10;
    gAudioComponentLogCategory = (uint64_t)v13;
  }
  v14 = objc_retainAutorelease(v10);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315650;
    v17 = "AudioComponentPluginScanner.mm";
    v18 = 1024;
    v19 = 647;
    v20 = 2080;
    v21 = v9;
    _os_log_impl(&dword_18EE07000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d ACPL: can't access %s", (uint8_t *)&v16, 0x1Cu);
  }

LABEL_14:
}

- (void).cxx_destruct
{
  _ACPluginDB *f;
  uint64_t v4;
  _ACPluginDB *p_mNotificationCallback;
  uint64_t v6;

  objc_storeStrong((id *)&self->mCarbonComponentHash, 0);
  f = (_ACPluginDB *)self->mScanHashCallback.__f_.__f_;
  if (f == (_ACPluginDB *)&self->mScanHashCallback)
  {
    v4 = 4;
    f = (_ACPluginDB *)&self->mScanHashCallback;
  }
  else
  {
    if (!f)
      goto LABEL_6;
    v4 = 5;
  }
  (*((void (**)(void))f->super.isa + v4))();
LABEL_6:
  p_mNotificationCallback = (_ACPluginDB *)self->mNotificationCallback.__f_.__f_;
  if (p_mNotificationCallback == (_ACPluginDB *)&self->mNotificationCallback)
  {
    v6 = 4;
    p_mNotificationCallback = (_ACPluginDB *)&self->mNotificationCallback;
    goto LABEL_10;
  }
  if (p_mNotificationCallback)
  {
    v6 = 5;
LABEL_10:
    (*((void (**)(void))p_mNotificationCallback->super.isa + v6))();
  }
  objc_storeStrong((id *)&self->mDispatchQueue, 0);
  objc_storeStrong((id *)&self->mSearchDirectories, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
