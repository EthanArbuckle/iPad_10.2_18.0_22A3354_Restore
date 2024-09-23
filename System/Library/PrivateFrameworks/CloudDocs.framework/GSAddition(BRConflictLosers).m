@implementation GSAddition(BRConflictLosers)

- (BOOL)_br_markResolvedWithError:()BRConflictLosers
{
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;
  NSObject *v7;
  _BOOL8 v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  NSObject *v27;
  _BYTE *v28;
  uint8_t v29[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  void *v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (BRIsFPFSEnabled(a1, a2))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel__br_markResolvedWithError_);
    v5 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) _br_markResolvedWithError:]", 35);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[GSAddition(BRConflictLosers) _br_markResolvedWithError:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a3)
          v21 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2112;
        v39 = v5;
        LOWORD(v40) = 2112;
        *(_QWORD *)((char *)&v40 + 2) = v6;
        _os_log_error_impl(&dword_19CBF0000, v7, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v5);

    return 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy__7;
    *(_QWORD *)&v40 = __Block_byref_object_dispose__7;
    *((_QWORD *)&v40 + 1) = 0;
    v9 = dispatch_semaphore_create(0);
    objc_msgSend(a1, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = a1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __58__GSAddition_BRConflictLosers___br_markResolvedWithError___block_invoke;
    v26 = &unk_1E3DA6588;
    v28 = buf;
    v12 = v9;
    v27 = v12;
    objc_msgSend(v10, "removeAdditions:completionHandler:", v11, &v23);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v8 = v13 == 0;
    if (v13)
    {
      v14 = v13;
      brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) _br_markResolvedWithError:]", 49);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        *(_DWORD *)v29 = 136315906;
        v30 = "-[GSAddition(BRConflictLosers) _br_markResolvedWithError:]";
        v31 = 2080;
        if (!a3)
          v22 = "(ignored by caller)";
        v32 = v22;
        v33 = 2112;
        v34 = v14;
        v35 = 2112;
        v36 = v15;
        _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v29, 0x2Au);
      }

      if (a3)
        *a3 = objc_retainAutorelease(v14);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB3600];
      objc_msgSend(a1, "storage", v23, v24, v25, v26);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "__itemAtURL:didResolveConflictVersionWithClientID:name:purposeID:", v18, *MEMORY[0x1E0D25D30], v19, 0);

    }
    _Block_object_dispose(buf, 8);

  }
  return v8;
}

- (uint64_t)br_markResolvedWithError:()BRConflictLosers
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v20;
  const char *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (BRIsFPFSEnabled(a1, a2))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_resolveConflictWithName_atURL_reply_);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_markResolvedWithError:]", 73);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[GSAddition(BRConflictLosers) br_markResolvedWithError:]";
        v26 = 2080;
        if (!a3)
          v20 = "(ignored by caller)";
        v27 = v20;
        v28 = 2112;
        v29 = v5;
        v30 = 2112;
        v31 = v6;
        _os_log_error_impl(&dword_19CBF0000, v7, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a3)
    {
      v5 = objc_retainAutorelease(v5);
      v8 = 0;
      *a3 = v5;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newLegacySyncProxy");

    objc_msgSend(a1, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "storage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "documentURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__GSAddition_BRConflictLosers__br_markResolvedWithError___block_invoke;
    v22[3] = &unk_1E3DA47F0;
    v5 = v10;
    v23 = v5;
    objc_msgSend(v5, "resolveConflictWithName:atURL:reply:", v11, v13, v22);

    v14 = (id)objc_msgSend(v5, "result");
    objc_msgSend(v5, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_markResolvedWithError:]", 82);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[GSAddition(BRConflictLosers) br_markResolvedWithError:]";
        v26 = 2080;
        if (!a3)
          v21 = "(ignored by caller)";
        v27 = v21;
        v28 = 2112;
        v29 = v15;
        v30 = 2112;
        v31 = v16;
        _os_log_error_impl(&dword_19CBF0000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v15);

    objc_msgSend(v5, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      v8 = 0;
    else
      v8 = objc_msgSend(a1, "_br_markResolvedWithError:", a3);

  }
  return v8;
}

- (id)br_lastEditorDeviceName
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  if (BRIsFPFSEnabled(a1, a2))
  {
    brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_lastEditorDeviceName]", 97);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      -[GSAddition(BRConflictLosers) br_lastEditorDeviceName].cold.1();

    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("BRConflictLosersLastEditorDeviceNameKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)br_lastEditorName
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  if (BRIsFPFSEnabled(a1, a2))
  {
    brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_lastEditorName]", 107);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      -[GSAddition(BRConflictLosers) br_lastEditorName].cold.1();

    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "br_lastEditorNameComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "br_formattedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)br_lastEditorNameComponents
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;

  if (BRIsFPFSEnabled(a1, a2))
  {
    brc_bread_crumbs((uint64_t)"-[GSAddition(BRConflictLosers) br_lastEditorNameComponents]", 117);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      -[GSAddition(BRConflictLosers) br_lastEditorNameComponents].cold.1();

    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("BRConflictLosersLastEditorNameComponentsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = (objc_class *)MEMORY[0x1E0CB3710];
      v9 = v7;
      v10 = (void *)objc_msgSend([v8 alloc], "initForReadingFromData:error:", v9, 0);

      objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)br_lastEditorDeviceName
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromSelector(sel_br_lastEditorDeviceName);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_2(&dword_19CBF0000, v1, v2, "[ERROR] method not implemented: %@%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)br_lastEditorName
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromSelector(sel_br_lastEditorName);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_2(&dword_19CBF0000, v1, v2, "[ERROR] method not implemented: %@%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)br_lastEditorNameComponents
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  NSStringFromSelector(sel_br_lastEditorNameComponents);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_2(&dword_19CBF0000, v1, v2, "[ERROR] method not implemented: %@%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

@end
