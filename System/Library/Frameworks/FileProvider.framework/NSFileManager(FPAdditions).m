@implementation NSFileManager(FPAdditions)

- (uint64_t)fp_trashItemAtURL:()FPAdditions resultingItemURL:error:
{
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__NSFileManager_FPAdditions__fp_trashItemAtURL_resultingItemURL_error___block_invoke;
  v11[3] = &unk_1E444E120;
  v11[4] = &v24;
  v11[5] = &v18;
  v11[6] = &v12;
  objc_msgSend(v8, "trashItemAtURL:completionHandler:", v7, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v13[5]);
  v9 = *((unsigned __int8 *)v25 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v9;
}

- (void)fp_createPathIfNeeded:()FPAdditions
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  char v35;
  char v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  id v43;
  id v44;
  id v45;
  uint64_t section;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  section = __fp_create_section();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.7(&section, (uint64_t)v3, v4);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v45);
  v7 = v45;
  v8 = v7;
  if ((v6 & 1) != 0 || (objc_msgSend(v7, "fp_isCocoaErrorCode:", 516) & 1) != 0)
  {
    v44 = v8;
    objc_msgSend(v5, "attributesOfItemAtPath:error:", v3, &v44);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v44;

    v11 = v10 == 0;
    if (v10)
    {
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
        objc_msgSend(v10, "fp_prettyDescription");
        objc_claimAutoreleasedReturnValue();
        -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.5();
      }

    }
    objc_msgSend(v9, "fileOwnerAccountName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSUserName();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
      fp_current_or_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v9, "fileOwnerAccountName");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        NSUserName();
        objc_claimAutoreleasedReturnValue();
        -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.4();
      }

      v11 = 0;
    }
    if ((objc_msgSend(v9, "filePosixPermissions") & 0x180) == 0)
    {
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v42 = aPcDBLSW[(unsigned __int16)objc_msgSend(v9, "filePosixPermissions") >> 12];
        if ((objc_msgSend(v9, "filePosixPermissions") & 0x100) != 0)
          v28 = 114;
        else
          v28 = 45;
        v41 = v28;
        if ((objc_msgSend(v9, "filePosixPermissions") & 0x80) != 0)
          v29 = 119;
        else
          v29 = 45;
        HIDWORD(v39) = v29;
        if ((objc_msgSend(v9, "filePosixPermissions") & 0x40) != 0)
          v30 = 120;
        else
          v30 = 45;
        LODWORD(v39) = v30;
        if ((objc_msgSend(v9, "filePosixPermissions", v39) & 0x20) != 0)
          v31 = 114;
        else
          v31 = 45;
        if ((objc_msgSend(v9, "filePosixPermissions") & 0x10) != 0)
          v32 = 119;
        else
          v32 = 45;
        if ((objc_msgSend(v9, "filePosixPermissions") & 8) != 0)
          v33 = 120;
        else
          v33 = 45;
        if ((objc_msgSend(v9, "filePosixPermissions") & 4) != 0)
          v34 = 114;
        else
          v34 = 45;
        v35 = objc_msgSend(v9, "filePosixPermissions");
        v36 = objc_msgSend(v9, "filePosixPermissions");
        *(_DWORD *)buf = 67111424;
        if ((v35 & 2) != 0)
          v37 = 119;
        else
          v37 = 45;
        v50 = v42;
        v51 = 1024;
        if ((v36 & 1) != 0)
          v38 = 120;
        else
          v38 = 45;
        v52 = v41;
        v53 = 1024;
        v54 = HIDWORD(v40);
        v55 = 1024;
        v56 = v40;
        v57 = 1024;
        v58 = v31;
        v59 = 1024;
        v60 = v32;
        v61 = 1024;
        v62 = v33;
        v63 = 1024;
        v64 = v34;
        v65 = 1024;
        v66 = v37;
        v67 = 1024;
        v68 = v38;
        _os_log_fault_impl(&dword_1A0A34000, v18, OS_LOG_TYPE_FAULT, "[CRIT] created directory doesn't have read/write access for owner (permission: %c%c%c%c%c%c%c%c%c%c)", buf, 0x3Eu);
      }

      v11 = 0;
    }
    v19 = *MEMORY[0x1E0CB2AD8];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AD8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0CB2AC0];
    v22 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB2AC0]);

    if ((v22 & 1) != 0)
    {
      v8 = v10;
    }
    else
    {
      v47 = v19;
      v48 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v10;
      v24 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v23, v3, &v43);
      v8 = v43;

      if ((v24 & 1) == 0)
      {
        fp_current_or_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v8, "fp_prettyDescription");
          objc_claimAutoreleasedReturnValue();
          -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.3();
        }

      }
    }

    if (v11)
    {
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.1(v26);
      goto LABEL_30;
    }
  }
  else
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v8, "fp_prettyDescription");
      objc_claimAutoreleasedReturnValue();
      -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.6();
    }

  }
  fp_current_or_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[NSFileManager(FPAdditions) fp_createPathIfNeeded:].cold.2((uint64_t)v3, v26);
LABEL_30:

  __fp_leave_section_Debug((uint64_t)&section);
}

- (id)fp_trashURLForItemAtURL:()FPAdditions error:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[FPFrameworkOverridesIterator allOverrides](FPFrameworkOverridesIterator, "allOverrides");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
    goto LABEL_16;
  v8 = *(_QWORD *)v17;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v15 = 0;
        objc_msgSend(v10, "FPTrashURLForItemAtURL:error:", v5, &v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v15;
        v13 = v12;
        if (v12)
        {
          v7 = 0;
          if (a4)
            *a4 = objc_retainAutorelease(v12);
        }
        else
        {
          if (!v11)
            continue;
          v7 = v11;
        }

        goto LABEL_16;
      }
    }
    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
      continue;
    break;
  }
LABEL_16:

  return v7;
}

- (id)fp_putBackURLForTrashedItemAtURL:()FPAdditions error:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__18;
  v20 = __Block_byref_object_dispose__18;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__18;
  v14 = __Block_byref_object_dispose__18;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__NSFileManager_FPAdditions__fp_putBackURLForTrashedItemAtURL_error___block_invoke;
  v9[3] = &unk_1E444E148;
  v9[4] = &v16;
  v9[5] = &v10;
  objc_msgSend(v6, "putBackURLForTrashedItemAtURL:completionHandler:", v5, v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v11[5]);
  v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (void)fp_setPutBackInfoOnItemAtURL:()FPAdditions
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__NSFileManager_FPAdditions__fp_setPutBackInfoOnItemAtURL___block_invoke;
  v6[3] = &unk_1E444A598;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "setPutBackInfoOnItemAtURL:completionHandler:", v5, v6);

}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] permissions checked", v1, 2u);
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Errors where encountered while setting up %@ as expected. You may experience troubles.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_16_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1A0A34000, "[CRIT] can't protect directory at '%@': %@", v4, v5);

  OUTLINED_FUNCTION_27();
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.4()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_25();
  v2 = (void *)v1;
  OUTLINED_FUNCTION_16_0(v1, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1A0A34000, "[CRIT] created directory has a wrong owner (value: %@, expected: %@)", v5, v6);

  OUTLINED_FUNCTION_27();
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_16_0(v1, v2, v3, 4.8151e-34);
  OUTLINED_FUNCTION_1_6(&dword_1A0A34000, "[CRIT] can't retrieve attributes of item at '%s': %@", v4, v5);

  OUTLINED_FUNCTION_27();
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_16_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_1A0A34000, "[CRIT] can't create directory at '%@': %@", v4, v5);

  OUTLINED_FUNCTION_27();
}

- (void)fp_createPathIfNeeded:()FPAdditions .cold.7(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating '%@'", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
