@implementation NSFileManager

uint64_t __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", 0, a2);
}

id __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_12(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  const char *v6;
  size_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v16;
  char __s[765];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  v4 = objc_msgSend(v2, "writeToURL:options:error:", v3, 0, &v16);
  v5 = v16;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "getCString:maxLength:encoding:", __s, 765, 4);
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation");
    v7 = strlen(__s);
    if (!setxattr(v6, "com.apple.icloud.itemName", __s, v7, 0, 1))
    {
      v14 = 0;
      goto LABEL_10;
    }
    v8 = *__error();
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]_block_invoke", 236);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_12_cold_1((uint64_t)v9, v8, v10);

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]_block_invoke", 228);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_12_cold_2();

    objc_msgSend(v5, "br_underlyingPOSIXError");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_10:

  return v14;
}

id __59__NSFileManager_BRAdditions__br_setPutBackInfoOnItemAtURL___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  void *v6;

  brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setPutBackInfoOnItemAtURL:]_block_invoke", 314);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __59__NSFileManager_BRAdditions__br_setPutBackInfoOnItemAtURL___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  if ((brc_xattr_set_string(a2, "com.apple.trash.put-back.path#PS", *(void **)(a1 + 32)) & 0x80000000) != 0
    || (brc_xattr_set_string(a2, "com.apple.trash.put-back.icloud-parent-id#PS", *(void **)(a1 + 40)) & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void __67__NSFileManager_BRAdditions__br_trashItemAtURL_resultingURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

uint64_t __67__NSFileManager_BRAdditions__br_trashItemAtURL_resultingURL_error___block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

void __76__NSFileManager_BRAdditions__br_putBackTrashedItemAtURL_resultingURL_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]_block_invoke", 426);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fp_obfuscatedPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to untrash item at %@ - %@%@", (uint8_t *)&v11, 0x20u);

    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v4;

}

id __61__NSFileManager_BRAdditions__br_setLastOpenDate_onItemAtURL___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  id v9;
  int UsedDate;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
  v3 = (uint64_t)v2;
  v19 = 0;
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 40), "br_physicalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "br_fileSystemRepresentation");

  if (BRGetLastUsedDate(0xFFFFFFFFLL, v6, (uint64_t)&v19))
    v7 = 1;
  else
    v7 = v19 <= v3;
  if (!v7)
  {
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setLastOpenDate:onItemAtURL:]_block_invoke", 464);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 40), "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fp_obfuscatedPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v13;
    v23 = 2048;
    v24 = v19;
    v25 = 2048;
    v26 = v3;
    v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring setting last open date on %@ because it's going back in time from %ld to %ld%@", buf, 0x2Au);
    goto LABEL_11;
  }
  v19 = v3;
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 40), "br_physicalURL", v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  UsedDate = BRSetLastUsedDate(0xFFFFFFFFLL, objc_msgSend(v9, "br_fileSystemRepresentation"), (uint64_t)&v19);

  if ((UsedDate & 0x80000000) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setLastOpenDate:onItemAtURL:]_block_invoke", 479);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:
      v17 = 0;
      goto LABEL_13;
    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fp_obfuscatedPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v11;
    v23 = 2112;
    v24 = (uint64_t)v13;
    v25 = 2112;
    v26 = (uint64_t)v14;
    _os_log_debug_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Set last used date %@ on %@%@", buf, 0x20u);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setLastOpenDate:onItemAtURL:]_block_invoke", 476);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    __61__NSFileManager_BRAdditions__br_setLastOpenDate_onItemAtURL___block_invoke_cold_1((uint64_t)v14, v15);
LABEL_13:

  return v17;
}

id __61__NSFileManager_BRAdditions__br_setFavoriteRank_onItemAtURL___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = brc_xattr_set_string(a2, "com.apple.favorite-rank.number#PS", v3);

  if (v4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_12_cold_1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to write xattr:  %{errno}d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_12_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] failed to writeToURL: %@%@");
  OUTLINED_FUNCTION_1();
}

void __59__NSFileManager_BRAdditions__br_setPutBackInfoOnItemAtURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] setting put back info path:%@ item:%@%@", (uint8_t *)&v5, 0x20u);
}

void __61__NSFileManager_BRAdditions__br_setLastOpenDate_onItemAtURL___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5[0] = 67109378;
  v5[1] = v4;
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_19CBF0000, a2, (os_log_type_t)0x90u, "[ERROR] can't to set Spotlight last-used date xattrs %{errno}d%@", (uint8_t *)v5, 0x12u);
}

@end
