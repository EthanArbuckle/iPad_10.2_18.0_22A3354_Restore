@implementation _SFRequestDesktopSiteQuirksSnapshot

- (_SFRequestDesktopSiteQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6;
  _SFRequestDesktopSiteQuirksSnapshot *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFRequestDesktopSiteQuirksSnapshot *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  objc_super v41;

  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_SFRequestDesktopSiteQuirksSnapshot;
  v7 = -[_SFRequestDesktopSiteQuirksSnapshot init](&v41, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithPropertyListData:options:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "safari_dictionaryForKey:", CFSTR("RequestDesktopSiteQuirks"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v37 = 0;
        v38 = &v37;
        v39 = 0x2020000000;
        v40 = 1;
        v31 = 0;
        v32 = &v31;
        v33 = 0x3032000000;
        v34 = __Block_byref_object_copy__6;
        v35 = __Block_byref_object_dispose__6;
        v36 = 0;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke;
        v30[3] = &unk_1E4AC56C8;
        v30[4] = &v31;
        v30[5] = &v37;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v30);
        if (*((_BYTE *)v38 + 24))
        {
          objc_storeStrong((id *)&v7->_requestDesktopSiteQuirks, v11);
          v12 = v7;
        }
        else
        {
          v12 = 0;
          if (a4)
            *a4 = objc_retainAutorelease((id)v32[5]);
        }
        _Block_object_dispose(&v31, 8);

        _Block_object_dispose(&v37, 8);
        goto LABEL_16;
      }
      v21 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[_SFRequestDesktopSiteQuirksSnapshot initWithSnapshotData:error:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
        if (a4)
          goto LABEL_12;
      }
      else if (a4)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_17;
      }
      v12 = 0;
      goto LABEL_16;
    }
    v13 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[_SFRequestDesktopSiteQuirksSnapshot initWithSnapshotData:error:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      if (a4)
        goto LABEL_9;
    }
    else if (a4)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    v12 = 0;
    goto LABEL_17;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (id)requestDesktopSiteSettingForDomain:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_requestDesktopSiteQuirks, "objectForKeyedSubscript:", a3);
}

- (id)allRequestDesktopSiteQuirks
{
  return self->_requestDesktopSiteQuirks;
}

- (id)snapshotData
{
  NSDictionary *requestDesktopSiteQuirks;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  requestDesktopSiteQuirks = self->_requestDesktopSiteQuirks;
  v6[0] = CFSTR("RequestDesktopSiteQuirks");
  v6[1] = CFSTR("Version");
  v7[0] = requestDesktopSiteQuirks;
  v7[1] = &unk_1E4B25DC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDesktopSiteQuirks, 0);
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to load request desktop site quirks", a5, a6, a7, a8, 0);
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to find RequestDesktopSiteQuirksKey array in quirks", a5, a6, a7, a8, 0);
}

@end
