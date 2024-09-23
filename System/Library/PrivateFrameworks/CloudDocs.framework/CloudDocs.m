uint64_t BRIsEntitledForAnyiCloudService(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("com.apple.developer.icloud-services"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("com.apple.developer.ubiquity-kvstore-identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v3 = 0;
      isKindOfClass = 1;
    }
    else
    {
      objc_msgSend(v1, "objectForKey:", CFSTR("com.apple.developer.ubiquity-container-identifiers"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

      }
      else
      {
        isKindOfClass = 0;
      }
    }
    goto LABEL_13;
  }
  v3 = (void *)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
LABEL_13:

    goto LABEL_14;
  }
  isKindOfClass = 0;
LABEL_14:

  return isKindOfClass & 1;
}

id BRCopyDisplayNameForContainerAtURL(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  BRMangledID *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1A1AD841C]();
  objc_msgSend(a1, "br_containerIDIfIsDocumentsContainerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_25;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CloudDocs")))
  {
    +[BRContainer localizedNameForDefaultCloudDocsContainer](BRContainer, "localizedNameForDefaultCloudDocsContainer");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Desktop")))
  {
    +[BRContainer localizedNameForDesktopContainer](BRContainer, "localizedNameForDesktopContainer");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Documents")))
  {
    v10 = -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", v6);
    +[BRContainerCache containerCache](BRContainerCache, "containerCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerByID:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (a2)
      {
        v18[0] = a2;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "isEqualToArray:", v15);

      if (v16)
      {

      }
      else if (v13)
      {
        objc_msgSend(v12, "localizedNameWithPreferredLanguages:", v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      objc_msgSend(v12, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("."), 4);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v6, "substringFromIndex:", v14 + 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!objc_msgSend(v8, "length"))
      {

        v8 = 0;
      }
    }
LABEL_24:

    if (v8)
      goto LABEL_9;
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  +[BRContainer localizedNameForDocumentsContainer](BRContainer, "localizedNameForDocumentsContainer");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v8 = (void *)v7;
  if (!v7)
    goto LABEL_25;
LABEL_9:
  v9 = v8;

LABEL_26:
  objc_autoreleasePoolPop(v4);
  return v9;
}

id _BRLocalizedStringWithFormat(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = (objc_class *)MEMORY[0x1E0CB3940];
  v12 = a3;
  v13 = a2;
  v14 = a1;
  v15 = [v11 alloc];
  _BRLocalizedString(v14, v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithFormat:locale:arguments:", v16, v17, &a9);

  return v18;
}

__CFString *_BRLocalizedString(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
  {
    brc_bread_crumbs((uint64_t)"_BRLocalizedString", 33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      _BRLocalizedString_cold_1((uint64_t)v13, v14);

  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v5, CFSTR("BRC_LOCALIZED_STRING_UNAVAILABLE"), v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8 == CFSTR("BRC_LOCALIZED_STRING_UNAVAILABLE"))
  {
    brc_bread_crumbs((uint64_t)"_BRLocalizedString", 39);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v7, "bundlePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v9;
      _os_log_fault_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Could not find localized string value for key \"%@\" in %@ at %@%@", (uint8_t *)&v15, 0x2Au);

    }
  }

  return v8;
}

void sub_19CBF2DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *BRAccountTokenChangedNotification()
{
  return CFSTR("com.apple.librarian.account-token-changed");
}

const char *extensionInFilename(char *a1)
{
  return _extensionInFilename(a1, 0);
}

const char *_extensionInFilename(char *a1, uint64_t a2)
{
  char *v4;
  const char *v5;
  char v7;
  const char *i;
  int v9;
  char *v10;
  uint64_t v11;

  if (!a1)
    return 0;
  v4 = strrchr(a1, 46);
  v5 = 0;
  if (v4 && v4 != a1)
  {
    v5 = v4 + 1;
    if (strlen(v4 + 1) > 0x32)
      return 0;
    if (!a2 && (!strcmp(v5, "gz") || !strcmp(v5, "bz2") || !strcmp(v5, "Z") || !strcmp(v5, "xz")))
    {
      v10 = strdup(a1);
      v5[~(unint64_t)a1 + (_QWORD)v10] = 0;
      v11 = _extensionInFilename();
      if (v11)
        v5 = &a1[v11 - (_QWORD)v10];
      free(v10);
    }
    else
    {
      v7 = 0;
      for (i = v5; ; ++i)
      {
        v9 = *(unsigned __int8 *)i;
        if (!*i)
          break;
        if (v9 == 32 || v9 == 47)
          return 0;
        v7 |= (v9 - 58) < 0xFFFFFFF6;
      }
      if ((v7 & 1) == 0)
        return 0;
    }
  }
  return v5;
}

void ___preComputeURLSForPersona_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 40)
    && (+[BRContainerCache isPersonalProvider](BRContainerCache, "isPersonalProvider")
     || +[BRContainerCache isManagedProvider](BRContainerCache, "isManagedProvider")))
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentHomeDir");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 339);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      ___preComputeURLSForPersona_block_invoke_cold_2();

    v9 = v6 != 0;
    if (v6)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
LABEL_10:
      objc_msgSend((id)g_homeDirectoryURLForPersona, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
      brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 360);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v30 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v30;
        v38 = 2112;
        v39 = v26;
        v40 = 2112;
        v41 = v15;
        _os_log_debug_impl(&dword_19CBF0000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] homeDirectory for persona %@: %@%@", buf, 0x20u);

      }
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Application Support/CloudDocs"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)g_cloudDocsAppSupportURLForPersona, "setObject:forKeyedSubscript:", v17, *(_QWORD *)(a1 + 32));
      brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 364);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v28 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v17, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v28;
        v38 = 2112;
        v39 = v31;
        v40 = 2112;
        v41 = v18;
        _os_log_debug_impl(&dword_19CBF0000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] cloudDocsAppSupport for persona %@: %@%@", buf, 0x20u);

      }
      objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches/com.apple.bird"), 1);
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)g_cloudDocsCachesURLForPersona, "setObject:forKeyedSubscript:", v20, *(_QWORD *)(a1 + 32));
      brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 368);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v29 = *(_QWORD *)(a1 + 32);
        -[NSObject path](v20, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v29;
        v38 = 2112;
        v39 = v32;
        v40 = 2112;
        v41 = v21;
        _os_log_debug_impl(&dword_19CBF0000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] cloudDocsCaches for persona %@: %@%@", buf, 0x20u);

      }
      if (!v9)
      {
        objc_msgSend((id)g_mobileDocumentsURLForPersona, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 32));
        brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 380);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v33 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v10, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v37 = v33;
          v38 = 2112;
          v39 = v27;
          v40 = 2112;
          v41 = v23;
          _os_log_debug_impl(&dword_19CBF0000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] mobileDocuments for persona %@: %@%@", buf, 0x20u);

        }
        if (v10)
        {
          v35 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)g_syncedRootURLsForPersona, "setObject:forKeyedSubscript:", v25, *(_QWORD *)(a1 + 32));

        }
        else
        {
          objc_msgSend((id)g_syncedRootURLsForPersona, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
        }
      }
      goto LABEL_24;
    }
  }
  else
  {
    v9 = 0;
  }
  +[BRCloudDocsHelperProvider cloudDocsHelper](BRCloudDocsHelperProvider, "cloudDocsHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v34 = 0;
  objc_msgSend(v13, "queryPathsForPersona:withError:", v14, &v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v34;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("home"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Mobile Documents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_10;
  brc_bread_crumbs((uint64_t)"_preComputeURLSForPersona_block_invoke", 353);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    ___preComputeURLSForPersona_block_invoke_cold_1();
LABEL_24:

}

__CFString *brc_bread_crumbs(uint64_t a1, uint64_t a2)
{
  __CFString *v4;

  if (os_variant_has_internal_content())
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" [Bread Crumb: %s %lu | %s]"), a1, a2, dispatch_queue_get_label(0));
  else
    v4 = &stru_1E3DA8AC8;
  return v4;
}

void sub_19CBF3A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id brc_default_log(int a1)
{
  int v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  int *v8;
  uint64_t *v9;
  id v10;

  v2 = *__error();
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isDataSeparatedPersona");
  if (a1)
  {
    if (+[BRContainerCache isPersonalProvider](BRContainerCache, "isPersonalProvider"))
    {
      if (!v5)
        goto LABEL_7;
      brc_bread_crumbs((uint64_t)"brc_default_log", 51);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        brc_default_log_cold_1();
    }
    else
    {
      if (((!+[BRContainerCache isManagedProvider](BRContainerCache, "isManagedProvider") | v5) & 1) != 0)
        goto LABEL_7;
      brc_bread_crumbs((uint64_t)"brc_default_log", 53);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        brc_default_log_cold_2();
    }

  }
LABEL_7:
  if (brc_default_log_once != -1)
    dispatch_once(&brc_default_log_once, &__block_literal_global_7);
  v8 = __error();
  v9 = &brc_default_log_loggerEnterprise;
  *v8 = v2;
  if (!v5)
    v9 = &brc_default_log_loggerPersonal;
  v10 = (id)*v9;

  return v10;
}

void BRCSetupGenericOperations(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_method_description *v15;
  objc_method_description *v16;
  unint64_t v17;
  SEL *p_name;
  const char *Name;
  Protocol *v20;
  unsigned int outCount;

  v20 = a1;
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3B50]);
  v5 = objc_alloc_init(MEMORY[0x1E0CB3B50]);
  objc_msgSend(v4, "setProtocol:", &unk_1EE436A48);
  objc_msgSend(v5, "setProtocol:", &unk_1EE436998);
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v6, "arrayWithObjects:", v7, v8, v9, v10, v11, getCKShareClass(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_setRemoteOperationProxy_userInfo_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_setRemoteOperationProxy_userInfo_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_progressCallbackWithTopic_userInfo_, 1, 0);

  outCount = 0;
  v15 = protocol_copyMethodDescriptionList(v20, 1, 1, &outCount);
  v16 = v15;
  if (outCount)
  {
    v17 = 0;
    p_name = &v15->name;
    do
    {
      Name = sel_getName(*p_name);
      if (!strncmp(Name, "startOperation:", 0xFuLL))
        objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v4, *p_name, 0, 0);
      ++v17;
      p_name += 2;
    }
    while (v17 < outCount);
  }
  free(v16);

}

id CKShareFunction()
{
  return (id)classCKShare;
}

id CKRecordIDFunction()
{
  return (id)classCKRecordID;
}

Class initCKUserIdentityLookupInfo()
{
  Class result;

  CloudKitLibrary_0();
  result = objc_getClass("CKUserIdentityLookupInfo");
  classCKUserIdentityLookupInfo = (uint64_t)result;
  getCKUserIdentityLookupInfoClass = (uint64_t (*)())CKUserIdentityLookupInfoFunction;
  return result;
}

Class initCKShareParticipant()
{
  Class result;

  CloudKitLibrary_0();
  result = objc_getClass("CKShareParticipant");
  classCKShareParticipant = (uint64_t)result;
  getCKShareParticipantClass = (uint64_t (*)())CKShareParticipantFunction;
  return result;
}

Class initCKShare()
{
  Class result;

  CloudKitLibrary_0();
  result = objc_getClass("CKShare");
  classCKShare = (uint64_t)result;
  getCKShareClass = (uint64_t (*)())CKShareFunction;
  return result;
}

void *CloudKitLibrary()
{
  void *result;

  result = (void *)CloudKitLibrary_frameworkLibrary;
  if (!CloudKitLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
    CloudKitLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
      CloudKitLibrary_cold_1();
  }
  return result;
}

void CloudKitLibrary_0()
{
  void *v0;
  NSObject *v1;
  int v2;
  char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!CloudKitLibrary_frameworkLibrary_1)
  {
    CloudKitLibrary_frameworkLibrary_1 = (uint64_t)dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
    if (!CloudKitLibrary_frameworkLibrary_1)
    {
      brc_bread_crumbs((uint64_t)"CloudKitLibrary", 37);
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        v2 = 136315394;
        v3 = dlerror();
        v4 = 2112;
        v5 = v0;
        _os_log_impl(&dword_19CBF0000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open CloudKit : %s%@", (uint8_t *)&v2, 0x16u);
      }

    }
  }
}

Class initCKRecordID()
{
  Class result;

  CloudKitLibrary_0();
  result = objc_getClass("CKRecordID");
  classCKRecordID = (uint64_t)result;
  getCKRecordIDClass = (uint64_t (*)())CKRecordIDFunction;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id BREntitledApplicationIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("application-identifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    BRAppIdentifierFromTeamAppTuple(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t BRCopyEntitlementsForSelf()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)xpc_copy_entitlements_for_self();
  if (v0)
  {
    v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v2 = objc_msgSend(v1, "mutableCopy");

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t BRCopyEntitlementsForAuditToken()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)xpc_copy_entitlement_for_token();
  if (v0)
  {
    v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v2 = objc_msgSend(v1, "mutableCopy");

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id BREntitledContainerIdentifiers(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CA58F8], "propertyListWithDictionary:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BREntitledContainerIdentifiersForPropertyList(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id BREntitledContainerIdentifiersForPropertyList(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("application-identifier"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v4 = 0;
LABEL_9:
    v7 = 0;
    goto LABEL_19;
  }
  BRAppIdentifierFromTeamAppTuple(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v3 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("com.apple.developer.icloud-services"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "containsObject:", CFSTR("CloudDocuments")))
    {
      v6 = objc_opt_class();
      objc_msgSend(v1, "objectForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.icloud-container-identifiers"), v6, objc_opt_class());
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(CFSTR("iCloud."), "stringByAppendingString:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v9 = objc_opt_class();
    objc_msgSend(v1, "objectForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.ubiquity-container-identifiers"), v9, objc_opt_class());
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "count"))
  {
    if ((objc_msgSend(v7, "containsObject:", CFSTR("com.apple.CloudDocs")) & 1) == 0
      && (objc_msgSend(v7, "containsObject:", CFSTR("com.apple.Desktop")) & 1) == 0
      && !objc_msgSend(v7, "containsObject:", CFSTR("com.apple.Documents")))
    {
      v7 = v7;
      v12 = v7;
      goto LABEL_20;
    }
    brc_bread_crumbs((uint64_t)"BREntitledContainerIdentifiersForPropertyList", 1103);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412802;
      v15 = v4;
      v16 = 2112;
      v17 = v3;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ has prohibited identifiers in its list of entitled container identifiers: %@%@", (uint8_t *)&v14, 0x20u);
    }

  }
LABEL_19:
  v12 = 0;
LABEL_20:

  return v12;
}

id BRAppIdentifierFromTeamAppTuple(void *a1)
{
  id v1;
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t i;
  int v6;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  _BYTE v14[32];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.")))
  {
    v2 = v1;
  }
  else if ((unint64_t)objc_msgSend(v1, "length") > 0xA)
  {
    MEMORY[0x1E0C80A78]();
    objc_msgSend(v1, "getCharacters:range:", v14, 0, 10);
    for (i = 0; i != 20; i += 2)
    {
      v6 = *(unsigned __int16 *)&v14[i];
      if ((v6 - 65) >= 0x1A && (v6 - 48) >= 0xA)
      {
        brc_bread_crumbs((uint64_t)"BRAppIdentifierFromTeamAppTuple", 1032);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        *(_DWORD *)buf = 138412546;
        v16 = v1;
        v17 = 2112;
        v18 = v8;
        v10 = "[WARNING] team prefix must only contain characters in [0-9,A-Z] (%@)%@";
        v11 = v9;
        v12 = 22;
        goto LABEL_19;
      }
    }
    if (objc_msgSend(v1, "characterAtIndex:", 10) == 46)
    {
      objc_msgSend(v1, "substringFromIndex:", 11);
      v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    brc_bread_crumbs((uint64_t)"BRAppIdentifierFromTeamAppTuple", 1037);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      v10 = "[WARNING] team prefix must be followed by a dot.%@";
      v11 = v9;
      v12 = 12;
LABEL_19:
      _os_log_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
LABEL_20:

    v2 = 0;
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRAppIdentifierFromTeamAppTuple", 1022);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v1;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] can't extract application ID from '%@'%@", buf, 0x16u);
    }

    v2 = 0;
  }
LABEL_21:

  return v2;
}

uint64_t __brc_monotonic_time_diff_to_interval_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&brc_monotonic_time_diff_to_interval_info);
}

void sub_19CBF6B10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void BRGetCloudDocsRootURL(void *a1)
{
  void *v1;
  void *v2;
  void (**v3)(id, void *, void *);

  v3 = a1;
  +[BRDaemonConnection mobileDocumentsURL](BRDaemonConnection, "mobileDocumentsURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3[2](v3, v1, v2);

}

void _preComputeURLSForPersona(char a1, void *a2, int a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  BRAccountTokenWillChangeObserver *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  char v16;

  v5 = a2;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = ___preComputeURLSForPersona_block_invoke;
  v14 = &unk_1E3DA74E8;
  v16 = a1;
  v6 = v5;
  v15 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AD85E4](&v11);
  v8 = (id)g_accountTokenDidChangeObserverForPersona;
  objc_sync_enter(v8);
  objc_msgSend((id)g_accountTokenDidChangeObserverForPersona, "objectForKeyedSubscript:", v6, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = -[BRAccountTokenWillChangeObserver initWithPersonaID:]([BRAccountTokenWillChangeObserver alloc], "initWithPersonaID:", v6);
    objc_msgSend((id)g_accountTokenDidChangeObserverForPersona, "setObject:forKeyedSubscript:", v10, v6);

  }
  objc_sync_exit(v8);

  if (a3)
    BRPerformWithPersonaAndError(v6, v7);
  else
    v7[2](v7, 0);

}

void sub_19CBF6DDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void BRGetProcessMobileContainerForID(void *a1, _OWORD *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  BRMangledID *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *, void *, void *);
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  uint64_t v35;
  _OWORD *v36;
  __int128 v37;
  uint64_t v38;
  _QWORD v39[3];
  _BYTE buf[32];
  __int16 v41;
  _OWORD *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AD841C]();
  memset(v39, 0, sizeof(v39));
  __brc_create_section(0, (uint64_t)"BRGetProcessMobileContainerForID", 345, v39);
  brc_bread_crumbs((uint64_t)"BRGetProcessMobileContainerForID", 345);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v39[0];
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "BRGetProcessMobileContainerForID";
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v5;
    v41 = 2048;
    v42 = a2;
    v43 = 2112;
    v44 = v8;
    _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s: container:%@ audit-token:%p%@", buf, 0x34u);
  }

  +[BRAccount startAccountTokenChangeObserverIfNeeded](BRAccount, "startAccountTokenChangeObserverIfNeeded");
  if (_BRLoadUbiquityEntitlements_once == -1)
  {
    if (a2)
      goto LABEL_5;
LABEL_14:
    if ((_xpc_runtime_is_app_sandboxed() & 1) == 0)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.CloudDocs")))
      {
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "currentPersona");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isDataSeparatedPersona");

        if ((v22 & 1) == 0)
        {
          +[BRDaemonConnection mobileDocumentsURL](BRDaemonConnection, "mobileDocumentsURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.CloudDocs"));
          -[BRMangledID mangledIDString](v25, "mangledIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "URLByAppendingPathComponent:isDirectory:", v26, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v6[2](v6, v27, 0);
          goto LABEL_21;
        }
      }
    }
    if (currentProcessIsContainerProxy || currentProcessUbiquityContainerEntitlements)
      goto LABEL_6;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v23);

    goto LABEL_21;
  }
  dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_168);
  if (!a2)
    goto LABEL_14;
LABEL_5:
  if (!currentProcessIsContainerProxy)
    goto LABEL_19;
LABEL_6:
  memset(buf, 0, 24);
  __brc_create_section(0, (uint64_t)"BRGetProcessMobileContainerForID", 374, buf);
  brc_bread_crumbs((uint64_t)"BRGetProcessMobileContainerForID", 374);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    BRGetProcessMobileContainerForID_cold_1();

  v37 = *(_OWORD *)buf;
  v38 = *(_QWORD *)&buf[16];
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newSyncProxy");

  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __BRGetProcessMobileContainerForID_block_invoke;
  v31 = &unk_1E3DA4F70;
  v34 = v37;
  v35 = v38;
  v14 = v13;
  v32 = v14;
  v15 = v5;
  v33 = v15;
  v36 = a2;
  v16 = (void *)MEMORY[0x1A1AD85E4](&v28);
  if (a2)
  {
    v17 = a2[1];
    *(_OWORD *)buf = *a2;
    *(_OWORD *)&buf[16] = v17;
    objc_msgSend(v14, "getContainerURLForID:forProcess:reply:", v15, buf, v16, v28, v29, v30, v31, v32);
  }
  else
  {
    objc_msgSend(v14, "getContainerURLForID:reply:", v15, v16, v28, v29, v30, v31, v32);
  }
  objc_msgSend(v14, "result");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v6)[2](v6, v18, v19);

LABEL_21:
  __brc_leave_section((uint64_t)v39);
  objc_autoreleasePoolPop(v7);

}

void sub_19CBF7384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void __brc_create_section(char a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  _QWORD v8[5];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (__brc_create_section_once != -1)
    dispatch_once(&__brc_create_section_once, &__block_literal_global_1);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ____brc_create_section_block_invoke_2;
  v8[3] = &unk_1E3DA4A20;
  v8[4] = &v10;
  v9 = a1;
  dispatch_sync((dispatch_queue_t)__brc_create_section_queue, v8);
  a4[1] = a2;
  a4[2] = 0;
  *a4 = v11[3];
  *((_DWORD *)a4 + 4) = a3;
  _Block_object_dispose(&v10, 8);
}

BOOL LBCopyUbiquityAccountToken(uint64_t *a1, _QWORD *a2)
{
  void *v4;
  id v5;
  id v7;

  v7 = 0;
  +[BRAccount currentCachedLoggedInAccountWithError:](BRAccount, "currentCachedLoggedInAccountWithError:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (LBCopyUbiquityAccountToken_once != -1)
    dispatch_once(&LBCopyUbiquityAccountToken_once, &__block_literal_global_21);
  objc_msgSend(v4, "perAppAccountIdentifier");
  *a1 = objc_claimAutoreleasedReturnValue();
  if (a2 && v5)
    *a2 = v5;

  return v5 == 0;
}

double brc_monotonic_time_diff_to_interval(uint64_t a1)
{
  if (brc_monotonic_time_diff_to_interval_onceToken != -1)
    dispatch_once(&brc_monotonic_time_diff_to_interval_onceToken, &__block_literal_global_4);
  return (double)((unint64_t)brc_monotonic_time_diff_to_interval_info
                * a1
                / *(unsigned int *)algn_1ECF8661C)
       / 1000000000.0;
}

void sub_19CBF7D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19CBF80C4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id BRCXPCInterface()
{
  if (BRCXPCInterface_once != -1)
    dispatch_once(&BRCXPCInterface_once, &__block_literal_global_16);
  return (id)BRCXPCInterface_iface;
}

id BRCXPCTokenInterface()
{
  if (BRCXPCTokenInterface_once != -1)
    dispatch_once(&BRCXPCTokenInterface_once, &__block_literal_global_518);
  return (id)BRCXPCTokenInterface_iface;
}

void sub_19CBF82C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_19CBF8BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  void *v11;

  objc_sync_exit(v11);
  __brc_leave_section((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void __brc_leave_section(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
      brc_bread_crumbs(*(_QWORD *)(a1 + 8), *(int *)(a1 + 16));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if ((v1 & 1) != 0)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
          __brc_leave_section_cold_1((uint64_t)v2, v1, v4);
      }
      else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v5 = 134218242;
        v6 = v1;
        v7 = 2112;
        v8 = v2;
        _os_log_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_INFO, "[INFO] ┗%llx %@", (uint8_t *)&v5, 0x16u);
      }

    }
  }
}

uint64_t BRCurrentProcessIsOwningContainerWithID(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (_BRLoadUbiquityEntitlements_once != -1)
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_168);
  if (!v1)
  {
    if (!objc_msgSend((id)currentProcessUbiquityContainerEntitlements, "count"))
      goto LABEL_5;
LABEL_7:
    v2 = 1;
    goto LABEL_8;
  }
  if ((objc_msgSend((id)currentProcessUbiquityContainerEntitlements, "containsObject:", v1) & 1) != 0)
    goto LABEL_7;
LABEL_5:
  v2 = 0;
LABEL_8:

  return v2;
}

void sub_19CBF9438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BRPerformWithPersonaAndError(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *);
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    v5 = 0;
  else
    v5 = v3;
  v6 = v5;
  v7 = v3;
  if (!v6)
  {
    if (BRPerformWithPersonaAndError___personaOnceToken != -1)
      dispatch_once(&BRPerformWithPersonaAndError___personaOnceToken, &__block_literal_global_12);
    v7 = (id)BRPerformWithPersonaAndError___personalPersona;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  objc_msgSend(v9, "userPersonaUniqueString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v7 || (objc_msgSend(v10, "isEqualToString:", v7) & 1) != 0)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v33 = 0;
    v12 = (void *)objc_msgSend(v9, "copyCurrentPersonaContextWithError:", &v33);
    v14 = v33;
    v34 = v12;
    if (v14)
    {
      brc_bread_crumbs((uint64_t)"BRPerformWithPersonaAndError", 33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        BRPerformWithPersonaAndError_cold_1((uint64_t)v14, (uint64_t)v15, v16);

    }
    objc_msgSend(v9, "generateAndRestorePersonaContextWithPersonaUniqueString:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      brc_bread_crumbs((uint64_t)"BRPerformWithPersonaAndError", 33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v36 = v3;
        v37 = 2112;
        v38 = v13;
        v39 = 2112;
        v40 = v17;
        _os_log_error_impl(&dword_19CBF0000, v18, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_28:

    }
  }
  else
  {
    if (!v6 && (objc_msgSend(v9, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"BRPerformWithPersonaAndError", 33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        BRPerformWithPersonaAndError_cold_3((uint64_t)v17, v18, v27, v28, v29, v30, v31, v32);
      v12 = 0;
      v13 = 0;
      goto LABEL_28;
    }
    brc_bread_crumbs((uint64_t)"BRPerformWithPersonaAndError", 33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      BRPerformWithPersonaAndError_cold_2((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }
LABEL_11:
  v4[2](v4, v13);

  _BRRestorePersona(&v34);
}

void sub_19CBF9AF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void _BRRestorePersona(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  if (*a1)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentPersona");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v3 = (id)objc_msgSend(v4, "restorePersonaWithSavedPersonaContext:", *a1);
  }
}

uint64_t ____brc_create_section_block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = __brc_create_section_lastSectionID + 1;
  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(_QWORD *)(v1 + 24);
  if (*(_BYTE *)(result + 40) != ((v2 & 1) == 0))
  {
    *(_QWORD *)(v1 + 24) = v2 + 1;
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  }
  __brc_create_section_lastSectionID = v2;
  return result;
}

void __brc_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.clouddocs", "default personal");
  v1 = (void *)brc_default_log_loggerPersonal;
  brc_default_log_loggerPersonal = (uint64_t)v0;

  v2 = os_log_create("com.apple.clouddocs", "default enterprise");
  v3 = (void *)brc_default_log_loggerEnterprise;
  brc_default_log_loggerEnterprise = (uint64_t)v2;

}

BOOL BRCurrentProcessHasUbiquityContainer()
{
  BOOL v0;

  if (_BRLoadUbiquityEntitlements_once != -1)
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_168);
  if (currentProcessUbiquityContainerEntitlements)
    v0 = 0;
  else
    v0 = currentProcessIsContainerProxy == 0;
  return !v0;
}

void ____brc_create_section_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("create-log-section", v0);

  v2 = (void *)__brc_create_section_queue;
  __brc_create_section_queue = (uint64_t)v1;

}

void LBGetMobileContainerForID(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __LBGetMobileContainerForID_block_invoke;
  v9[3] = &unk_1E3DA6508;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  BRGetProcessMobileContainerForID(a1, 0, v9);

}

uint64_t brc_notify_register_check(const char *a1, int *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = notify_register_check(a1, a2);
  if ((_DWORD)v3)
  {
    brc_bread_crumbs((uint64_t)"brc_notify_register_check", 79);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v7 = 136315906;
      v8 = a1;
      v9 = 2080;
      v10 = brc_prettyprint_notify_status(v3);
      v11 = 1024;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_19CBF0000, v5, (os_log_type_t)0x90u, "[ERROR] notify_register_check(%s) failed with %s (%d)%@", (uint8_t *)&v7, 0x26u);
    }

  }
  return v3;
}

uint64_t brc_notify_get_state(int a1, uint64_t *a2, uint64_t a3)
{
  uint64_t state;
  void *v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1 == -1)
    return 2;
  state = notify_get_state(a1, a2);
  if ((_DWORD)state)
  {
    brc_bread_crumbs((uint64_t)"brc_notify_get_state", 69);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      v9[0] = 67110146;
      v9[1] = a1;
      v10 = 2080;
      v11 = brc_prettyprint_notify_status(state);
      v12 = 1024;
      v13 = state;
      v14 = 2080;
      v15 = a3;
      v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_19CBF0000, v7, (os_log_type_t)0x90u, "[ERROR] notify_get_state(%d) failed with %s (%d) for '%s'%@", (uint8_t *)v9, 0x2Cu);
    }

  }
  return state;
}

uint64_t brc_notify_set_state_and_post(int a1, uint64_t a2, char *a3)
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  int v14;
  _BYTE v15[14];
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  _BYTE v19[14];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"brc_notify_set_state_and_post", 46);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315906;
    *(_QWORD *)v15 = a3;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = a1;
    v16 = 2048;
    v17 = a2;
    v18 = 2112;
    *(_QWORD *)v19 = v6;
    _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] notifying '%s' on token %d with state %llu%@", (uint8_t *)&v14, 0x26u);
  }

  if (a1 == -1)
    return 2;
  v8 = notify_set_state(a1, a2);
  if (!(_DWORD)v8)
    return brc_notify_post(a3);
  v9 = v8;
  brc_bread_crumbs((uint64_t)"brc_notify_set_state_and_post", 54);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    v13 = brc_prettyprint_notify_status(v9);
    v14 = 67110402;
    *(_DWORD *)v15 = a1;
    *(_WORD *)&v15[4] = 2048;
    *(_QWORD *)&v15[6] = a2;
    v16 = 2080;
    v17 = (uint64_t)v13;
    v18 = 1024;
    *(_DWORD *)v19 = v9;
    *(_WORD *)&v19[4] = 2080;
    *(_QWORD *)&v19[6] = a3;
    v20 = 2112;
    v21 = v10;
    _os_log_error_impl(&dword_19CBF0000, v11, (os_log_type_t)0x90u, "[ERROR] notify_set_state(%d, %llu) failed with %s (%d) for '%s'%@", (uint8_t *)&v14, 0x36u);
  }

  return v9;
}

uint64_t brc_notify_post(char *name)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v6;
  NSObject *v7;
  int v8;
  char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!name)
  {
    brc_bread_crumbs((uint64_t)"brc_notify_post", 35);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      brc_notify_post_cold_1((uint64_t)v6, v7);

  }
  v2 = notify_post(name);
  if ((_DWORD)v2)
  {
    brc_bread_crumbs((uint64_t)"brc_notify_post", 39);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    {
      v8 = 136315906;
      v9 = name;
      v10 = 2080;
      v11 = brc_prettyprint_notify_status(v2);
      v12 = 1024;
      v13 = v2;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_19CBF0000, v4, (os_log_type_t)0x90u, "[ERROR] notify_post(%s) failed with %s (%d)%@", (uint8_t *)&v8, 0x26u);
    }

  }
  return v2;
}

uint64_t brc_interval_to_nsec(double a1)
{
  return (uint64_t)(a1 * 1000000000.0);
}

void br_pacer_set_event_handler(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v8 = a1;
  v3 = a2;
  v4 = v3;
  if (brc_block_remember_persona)
  {
    brc_block_remember_persona(v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = MEMORY[0x1A1AD85E4](v4);
  v7 = (void *)v8[4];
  v8[4] = v6;

}

void br_pacer_resume(unsigned __int8 *a1)
{
  dispatch_object_t *obj;

  atomic_store(1u, a1 + 56);
  obj = a1;
  objc_sync_enter(obj);
  dispatch_resume(obj[1]);
  objc_sync_exit(obj);

}

br_pacer *br_pacer_create(const char *a1, void *a2, double a3)
{
  id v5;
  br_pacer *v6;
  OS_dispatch_queue *v7;
  NSObject *queue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *v11;

  v5 = a2;
  v6 = objc_alloc_init(br_pacer);
  v6->min_fire_interval = a3;
  if (v5)
  {
    v7 = (OS_dispatch_queue *)v5;
    queue = v6->queue;
    v6->queue = v7;
  }
  else
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    queue = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(queue, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(a1, v9);

    v11 = v6->queue;
    v6->queue = (OS_dispatch_queue *)v10;

  }
  _br_pacer_create_source(v6);

  return v6;
}

void _br_pacer_create_source(void *a1)
{
  dispatch_object_t *v1;
  dispatch_source_t v2;
  dispatch_object_t v3;
  dispatch_object_t v4;
  unsigned __int8 *v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  dispatch_block_t v10;
  unsigned __int8 v11;
  _QWORD v12[4];
  unsigned __int8 *v13;

  v1 = a1;
  v2 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, v1[3]);
  v3 = v1[1];
  v1[1] = v2;

  v4 = v1[1];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___br_pacer_create_source_block_invoke;
  v12[3] = &unk_1E3DA4738;
  v5 = v1;
  v13 = v5;
  v6 = v4;
  v7 = v12;
  v8 = v7;
  v9 = v7;
  if (brc_block_remember_persona)
  {
    brc_block_remember_persona(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v9);
  dispatch_source_set_event_handler(v6, v10);

  v11 = atomic_load(v5 + 56);
  if ((v11 & 1) != 0)
    dispatch_resume(v1[1]);

}

void __br_notify_register_dispatch_block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v2 = *(id *)(a1 + 32)) == 0)
  {
    if (BRPreserveUploadedDataXattrKey_block_invoke___personaOnceToken != -1)
      dispatch_once(&BRPreserveUploadedDataXattrKey_block_invoke___personaOnceToken, &__block_literal_global_179);
    v3 = (id)BRPreserveUploadedDataXattrKey_block_invoke___personalPersona;
    v4 = 1;
  }
  else
  {
    v3 = v2;
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == v3 || (objc_msgSend(v7, "isEqualToString:", v3) & 1) != 0)
    goto LABEL_9;
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && (objc_msgSend(v6, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();

    }
    else
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_25;
    }
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  v24 = 0;
  v9 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v24);
  v10 = v24;
  v11 = v25;
  v25 = v9;

  if (v10)
  {
    brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      -[BRAccount containerWithPendingChanges].cold.3();

  }
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_9;
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v27 = v23;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    __br_notify_register_dispatch_block_invoke_cold_1(a1);

LABEL_10:
  _BRRestorePersona(&v25);

}

void sub_19CBFBF10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_0(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v2 = *(id *)(a1 + 32)) == 0)
  {
    if (ICDErrorRetryAfterKey_block_invoke___personaOnceToken != -1)
      dispatch_once(&ICDErrorRetryAfterKey_block_invoke___personaOnceToken, &__block_literal_global_184);
    v3 = (id)ICDErrorRetryAfterKey_block_invoke___personalPersona;
    v4 = 1;
  }
  else
  {
    v3 = v2;
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == v3 || (objc_msgSend(v7, "isEqualToString:", v3) & 1) != 0)
    goto LABEL_9;
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && (objc_msgSend(v6, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();

    }
    else
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_25;
    }
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  v24 = 0;
  v9 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v24);
  v10 = v24;
  v11 = v25;
  v25 = v9;

  if (v10)
  {
    brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      __br_notify_register_dispatch_block_invoke_cold_2();

  }
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_9;
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v27 = v23;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    __br_notify_register_dispatch_block_invoke_cold_1(a1);

LABEL_10:
  _BRRestorePersona(&v25);

}

void sub_19CBFC300(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_1(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v2 = *(id *)(a1 + 32)) == 0)
  {
    if (_block_invoke___personaOnceToken != -1)
      dispatch_once(&_block_invoke___personaOnceToken, &__block_literal_global_11);
    v3 = (id)_block_invoke___personalPersona;
    v4 = 1;
  }
  else
  {
    v3 = v2;
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == v3 || (objc_msgSend(v7, "isEqualToString:", v3) & 1) != 0)
    goto LABEL_9;
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && (objc_msgSend(v6, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();

    }
    else
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_25;
    }
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  v24 = 0;
  v9 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v24);
  v10 = v24;
  v11 = v25;
  v25 = v9;

  if (v10)
  {
    brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      __br_notify_register_dispatch_block_invoke_cold_2_0();

  }
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_9;
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v27 = v23;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    __br_notify_register_dispatch_block_invoke_cold_1_0(a1, (uint64_t)v19, v20);

LABEL_10:
  _BRRestorePersona(&v25);

}

void sub_19CBFC6F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v2 = *(id *)(a1 + 32)) == 0)
  {
    if (_block_invoke_2___personaOnceToken != -1)
      dispatch_once(&_block_invoke_2___personaOnceToken, &__block_literal_global_168_0);
    v3 = (id)_block_invoke_2___personalPersona;
    v4 = 1;
  }
  else
  {
    v3 = v2;
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == v3 || (objc_msgSend(v7, "isEqualToString:", v3) & 1) != 0)
    goto LABEL_9;
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && (objc_msgSend(v6, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();

    }
    else
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_25;
    }
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  v24 = 0;
  v9 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v24);
  v10 = v24;
  v11 = v25;
  v25 = v9;

  if (v10)
  {
    brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      -[BRAccount containerWithPendingChanges].cold.3();

  }
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_9;
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v27 = v23;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    __br_notify_register_dispatch_block_invoke_cold_1_1();

LABEL_10:
  _BRRestorePersona(&v25);

}

void sub_19CBFCAE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("__defaultPersonaID__")) & 1) != 0
    || (v2 = *(id *)(a1 + 32)) == 0)
  {
    if (softLinkUIImagePNGRepresentation_block_invoke___personaOnceToken != -1)
      dispatch_once(&softLinkUIImagePNGRepresentation_block_invoke___personaOnceToken, &__block_literal_global_602);
    v3 = (id)softLinkUIImagePNGRepresentation_block_invoke___personalPersona;
    v4 = 1;
  }
  else
  {
    v3 = v2;
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v6, "userPersonaUniqueString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 == v3 || (objc_msgSend(v7, "isEqualToString:", v3) & 1) != 0)
    goto LABEL_9;
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && (objc_msgSend(v6, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();

    }
    else
    {
      brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        goto LABEL_25;
    }
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  v24 = 0;
  v9 = (void *)objc_msgSend(v6, "copyCurrentPersonaContextWithError:", &v24);
  v10 = v24;
  v11 = v25;
  v25 = v9;

  if (v10)
  {
    brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      -[BRContainerCache _accountWillChange].cold.2((uint64_t)v10);

  }
  objc_msgSend(v6, "generateAndRestorePersonaContextWithPersonaUniqueString:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_9;
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 134);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v27 = v23;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  brc_bread_crumbs((uint64_t)"br_notify_register_dispatch_block_invoke", 136);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    __br_notify_register_dispatch_block_invoke_cold_1_2(a1);

LABEL_10:
  _BRRestorePersona(&v25);

}

void sub_19CBFCED0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19CBFD298(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id BRPersonaSpecificName(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a1;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("-%@"), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id BRNotifyNameForForegroundChangeWithContainerID(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByAppendingString:", CFSTR(".foreground"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "br_libnotifyPerUserNotificationName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t BRCurrentPersonaMatchesID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_currentPersonaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isEqualToString:", v1);
  if ((v4 & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"BRCurrentPersonaMatchesID", 109);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412802;
      v9 = v3;
      v10 = 2112;
      v11 = v1;
      v12 = 2112;
      v13 = v5;
      _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] current persona (%@) and persona (%@) don't match%@", (uint8_t *)&v8, 0x20u);
    }

  }
  return v4;
}

void sub_19CBFD98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CBFDD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CBFEB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, id *a15)
{
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)(v16 - 184));
  _Unwind_Resume(a1);
}

void sub_19CBFEDA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CBFF468(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CBFF528(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CBFF5D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CBFFBB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CBFFC58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CBFFD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC00574(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC01B44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC022B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC024E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void br_pacer_pretend_event_handler_fired(void *a1)
{
  CFAbsoluteTime *v1;
  dispatch_source_t *v2;
  dispatch_source_t v3;
  NSObject *v4;

  v1 = a1;
  if (v1)
  {
    v1[5] = CFAbsoluteTimeGetCurrent();
    v2 = v1;
    objc_sync_enter(v2);
    dispatch_source_cancel(v2[1]);
    v3 = v2[1];
    v2[1] = 0;

    _br_pacer_create_source(v2);
    objc_sync_exit(v2);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"br_pacer_pretend_event_handler_fired", 177);
    v2 = (dispatch_source_t *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      br_pacer_pretend_event_handler_fired_cold_1((uint64_t)v2, v4);

  }
}

void sub_19CC0282C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

intptr_t br_pacer_test_cancel(uint64_t a1)
{
  return dispatch_source_testcancel(*(dispatch_source_t *)(a1 + 8));
}

void br_pacer_cancel(void *a1)
{
  NSObject *v1;
  NSObject *v2;
  dispatch_object_t *obj;

  obj = a1;
  objc_sync_enter(obj);
  v1 = obj[1];
  if (v1)
  {
    dispatch_source_cancel(v1);
    dispatch_activate(obj[1]);
  }
  v2 = obj[2];
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_activate(obj[2]);
  }
  objc_sync_exit(obj);

}

void br_pacer_signal(void *a1)
{
  dispatch_source_t *obj;

  obj = a1;
  objc_sync_enter(obj);
  dispatch_source_merge_data(obj[1], 1uLL);
  objc_sync_exit(obj);

}

void br_pacer_suspend(void *a1)
{
  dispatch_object_t *obj;

  obj = a1;
  objc_sync_enter(obj);
  dispatch_suspend(obj[1]);
  objc_sync_exit(obj);

}

void br_pacer_signal_at_most_after_min_interval(void *a1)
{
  double *obj;

  obj = a1;
  objc_sync_enter(obj);
  if (!*((_QWORD *)obj + 2))
    schedule_fire_after_delay(obj, obj[6]);
  objc_sync_exit(obj);

}

void sub_19CC02988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void schedule_fire_after_delay(void *a1, double a2)
{
  dispatch_source_t *v3;
  dispatch_source_t v4;
  dispatch_source_t v5;
  dispatch_source_t v6;
  dispatch_source_t v7;
  dispatch_source_t *v8;
  NSObject *v9;
  _QWORD *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  dispatch_block_t v15;
  dispatch_time_t v16;
  _QWORD v17[4];
  dispatch_source_t *v18;

  v3 = a1;
  objc_sync_enter(v3);
  if (v3[2])
  {
    dispatch_assert_queue_V2(v3[3]);
    dispatch_source_cancel(v3[2]);
    v4 = v3[2];
    v3[2] = 0;

  }
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3[3]);
  v6 = v3[2];
  v3[2] = v5;

  v7 = v3[2];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __schedule_fire_after_delay_block_invoke;
  v17[3] = &unk_1E3DA4738;
  v8 = v3;
  v18 = v8;
  v9 = v7;
  v10 = v17;
  v11 = v9;
  v12 = v10;
  v13 = v12;
  v14 = v12;
  if (brc_block_remember_persona)
  {
    brc_block_remember_persona(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v14);
  dispatch_source_set_event_handler(v11, v15);

  v16 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  dispatch_source_set_timer(v3[2], v16, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(a2 * 1000000000.0));
  dispatch_resume(v3[2]);

  objc_sync_exit(v8);
}

void sub_19CC02B40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___br_pacer_create_source_block_invoke(uint64_t a1)
{
  dispatch_queue_t *v1;
  double Current;
  double v3;
  double v4;
  double v5;
  double v6;
  double *v7;

  v1 = (dispatch_queue_t *)*(id *)(a1 + 32);
  dispatch_assert_queue_V2(v1[3]);
  v7 = v1;
  Current = CFAbsoluteTimeGetCurrent();
  v3 = v7[5];
  if (v3 == 0.0 || (v4 = Current - v3, v5 = v7[6], v4 >= v5))
  {

    goto LABEL_6;
  }
  v6 = v5 - v4;

  if (v6 <= 0.0)
  {
LABEL_6:
    fire(v7);
    goto LABEL_7;
  }
  schedule_fire_after_delay(v7, v6);
LABEL_7:

}

void fire(void *a1)
{
  void *v1;
  dispatch_queue_t *v2;

  v2 = a1;
  dispatch_assert_queue_V2(v2[3]);
  *((CFAbsoluteTime *)v2 + 5) = CFAbsoluteTimeGetCurrent();
  if (v2[4])
  {
    v1 = (void *)MEMORY[0x1A1AD841C]();
    ((void (*)(void))v2[4][2].isa)();
    objc_autoreleasePoolPop(v1);
  }

}

void __schedule_fire_after_delay_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id obj;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24));
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16));
  fire(*(void **)(a1 + 32));
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_sync_exit(obj);
}

uint64_t BRServerInfoRecordInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_35;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_35;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_35;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 72) |= 1u;
          break;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_35;
        case 6u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_35;
        case 7u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_35;
        case 8u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
LABEL_35:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          break;
        v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
        *(_QWORD *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0)
          goto LABEL_39;
        v20 += 7;
        v14 = v21++ >= 9;
        if (v14)
        {
          v22 = 0;
          goto LABEL_41;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_41:
      *(_QWORD *)(a1 + 8) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const char *brc_prettyprint_notify_status(int a1)
{
  int v1;
  const char *result;

  v1 = a1 - 1;
  result = "'invalid_name'";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = "'invalid_token'";
      break;
    case 2:
      result = "'invalid_port'";
      break;
    case 3:
      result = "'invalid_file'";
      break;
    case 4:
      result = "'invalid_signal'";
      break;
    case 5:
      result = "'invalid_request'";
      break;
    case 6:
      result = "'not_authorized'";
      break;
    default:
      if ("'invalid_name'" == 1000000)
        result = "'failed'";
      else
        result = "unknown status";
      break;
  }
  return result;
}

void sub_19CC03D38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_19CC042AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _BRRestorePersona(va);
  _Unwind_Resume(a1);
}

void sub_19CC04770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19CC04E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19CC05400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18)
{
  _BRRestorePersona(&a18);
  _Unwind_Resume(a1);
}

void sub_19CC05A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19CC05F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19CC06318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19CC06DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19CC06F38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void BRPerformWithAccountDescriptor(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __BRPerformWithAccountDescriptor_block_invoke;
  v5[3] = &unk_1E3DA48F8;
  v6 = v3;
  v4 = v3;
  BRPerformWithAccountDescriptorAndError(a1, v5);

}

void BRPerformWithAccountDescriptorAndError(void *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(a1, "personaIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  BRPerformWithPersonaAndError(v4, v3);

}

void __br_notify_register_dispatch_block_invoke_2_0()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BRPreserveUploadedDataXattrKey_block_invoke___personalPersona;
  BRPreserveUploadedDataXattrKey_block_invoke___personalPersona = v0;

}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, (os_log_type_t)0x90u, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id _getCloudDocsAppSupportURL()
{
  unsigned int v0;
  void *v1;
  BOOL v2;

  v0 = 0;
  do
  {
    +[BRDaemonConnection cloudDocsAppSupportURL](BRDaemonConnection, "cloudDocsAppSupportURL");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
      v2 = 1;
    else
      v2 = v0 >= 2;
    ++v0;
  }
  while (!v2);
  return v1;
}

void sub_19CC09334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC097C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC0A09C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void __dispatch_async_with_logs_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *label;
  __int128 v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs((uint64_t)"dispatch_async_with_logs_block_invoke", 264);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32));
    *(_DWORD *)buf = 134218498;
    v8 = v5;
    v9 = 2080;
    v10 = label;
    v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx continuing on %s%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __brc_leave_section((uint64_t)&v5);
}

void sub_19CC0A4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __brc_leave_section((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_19CC0B30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  __brc_leave_section((uint64_t)&a30);
  _Unwind_Resume(a1);
}

void _reportPosixWriteError(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = a2;
  objc_msgSend(v10, "br_errorFromErrno");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, &a9);

  if (a1)
  {
    v14 = *MEMORY[0x1E0C9AFB0];
    v26[0] = *MEMORY[0x1E0CB3388];
    v26[1] = v14;
    v27[0] = v12;
    v27[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, v15);
    *a1 = (id)objc_claimAutoreleasedReturnValue();

  }
  brc_bread_crumbs((uint64_t)"_reportPosixWriteError", 84);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 138413058;
    v19 = v13;
    v20 = 2080;
    v21 = strerror(objc_msgSend(v12, "code"));
    v22 = 1024;
    v23 = objc_msgSend(v12, "code");
    v24 = 2112;
    v25 = v16;
    _os_log_error_impl(&dword_19CBF0000, v17, (os_log_type_t)0x90u, "[ERROR] %@: %s(%d)%@", buf, 0x26u);
  }

}

uint64_t brc_xattr_set_string(int fd, char *name, void *a3)
{
  void *v5;
  NSObject *v6;
  size_t v7;
  char __s[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return fremovexattr(fd, name, 0);
  if ((objc_msgSend(a3, "getCString:maxLength:encoding:", __s, 1024, 4) & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"brc_xattr_set_string", 44);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      brc_xattr_set_string_cold_1();

  }
  v7 = strlen(__s);
  return fsetxattr(fd, name, __s, v7 + 1, 0, 0);
}

id brc_xattr_get_fs_string(const char *a1, const char *a2)
{
  ssize_t v2;
  void *v3;
  void *v4;
  char value[765];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = getxattr(a1, a2, value, 0x2FDuLL, 0, 1);
  if (v2 < 0)
    return 0;
  value[v2 - 1] = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", value, strlen(value));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_19CC0C480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 176), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC0C95C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id OSVersion()
{
  if (OSVersion_pred != -1)
    dispatch_once(&OSVersion_pred, &__block_literal_global_3);
  return (id)OSVersion_OSVersion;
}

const __CFString *BRVersion()
{
  return CFSTR("3097.2.2");
}

const __CFString *BRPlatform()
{
  return CFSTR("ios");
}

void BRTelemetryReportShareInvitation(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  if (v9)
    objc_msgSend(v13, "setValue:forKey:", v9, CFSTR("access"));
  if (v10)
    objc_msgSend(v14, "setValue:forKey:", v10, CFSTR("transport"));
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v11);
    v17 = v16;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v18, CFSTR("timeTakenToSaveShare"));

  }
  else
  {
    v17 = -1.0;
  }
  v19 = CFSTR("unknown");
  v20 = CFSTR("none");
  switch(a4)
  {
    case 0:
      goto LABEL_13;
    case 1:
      goto LABEL_12;
    case 2:
      v20 = CFSTR("readOnly");
      goto LABEL_12;
    case 3:
      v20 = CFSTR("readWrite");
      goto LABEL_12;
    default:
      v20 = CFSTR("unknown");
LABEL_12:
      objc_msgSend(v14, "setValue:forKey:", v20, CFSTR("permission"));
      v19 = v20;
LABEL_13:
      if (v12)
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.%ld"), v22, objc_msgSend(v12, "code"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setValue:forKey:", v23, CFSTR("error"));
      }
      brc_bread_crumbs((uint64_t)"BRTelemetryReportShareInvitation", 74);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413570;
        v27 = v9;
        v28 = 2112;
        v29 = v10;
        v30 = 2112;
        v31 = v19;
        v32 = 2048;
        v33 = v17;
        v34 = 2112;
        v35 = v12;
        v36 = 2112;
        v37 = v24;
        _os_log_debug_impl(&dword_19CBF0000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] BRTelemetry sending new share invitation report with access = %@, transport = %@, permission = %@, duration = %f, error = %@%@", buf, 0x3Eu);
      }

      BRTelemetrySendEventToCoreAnalytics(CFSTR("com.apple.clouddocsUI.shareInvitation"), v14);
      return;
  }
}

void BRTelemetrySendEventToCoreAnalytics(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  AnalyticsIsEventUsed();
  v6 = v3;
  v5 = v3;
  AnalyticsSendEventLazy();

}

void BRTelemetryReportAddPeopleDisplayed(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  v3 = v2;
  if (v1)
    objc_msgSend(v2, "setValue:forKey:", v1, CFSTR("access"));
  brc_bread_crumbs((uint64_t)"BRTelemetryReportAddPeopleDisplayed", 83);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    BRTelemetryReportAddPeopleDisplayed_cold_1((uint64_t)v1, (uint64_t)v4, v5);

  BRTelemetrySendEventToCoreAnalytics(CFSTR("com.apple.clouddocsUI.addPeopleDisplayed"), v3);
}

void BRTelemetryReportSettingUpiCloudDriveDisplay(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v1);
    v5 = v4;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("duration"));

    v7 = *(_QWORD *)&v5;
  }
  else
  {
    v7 = 0xBFF0000000000000;
  }
  brc_bread_crumbs((uint64_t)"BRTelemetryReportSettingUpiCloudDriveDisplay", 94);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    BRTelemetryReportSettingUpiCloudDriveDisplay_cold_1((uint64_t)v8, v7, v9);

  BRTelemetrySendEventToCoreAnalytics(CFSTR("com.apple.clouddocsUI.settingUpiCloudDrive"), v2);
}

__darwin_time_t brc_current_date_nsec()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return 1000000000 * v1.tv_sec + 1000 * v1.tv_usec;
}

double brc_interval_from_nsec(uint64_t a1)
{
  return (double)a1 / 1000000000.0;
}

BOOL brc_is_before_deadline(unint64_t a1, unint64_t a2)
{
  return a1 <= a2;
}

id br_shareCopyWithAttributesStripped(void *a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "copy");
  br_setShareAssociatedURL(v1, 0);
  return v1;
}

void br_setShareAssociatedURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x1E0CAACC0], "wrapperWithURL:readonly:error:", v4, 1, &v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v14;
      if (v6)
      {
        v13 = v7;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v13;

        if (v8)
        {
          objc_msgSend(v3, "setTrackChanges:", 0);
          objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("BRAssociatedURLWrapperDataKey"));
          objc_msgSend(v3, "setTrackChanges:", 1);
        }
        else
        {
          brc_bread_crumbs((uint64_t)"br_setShareAssociatedURL", 154);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v16 = v6;
            v17 = 2112;
            v18 = v9;
            v19 = 2112;
            v20 = v11;
            _os_log_fault_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_FAULT, "[CRIT] failed to encode wrapper %@: %@%@", buf, 0x20u);
          }

        }
        v7 = v9;
      }
      else
      {
        brc_bread_crumbs((uint64_t)"br_setShareAssociatedURL", 149);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v16 = v5;
          v17 = 2112;
          v18 = v7;
          v19 = 2112;
          v20 = v8;
          _os_log_fault_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_FAULT, "[CRIT] failed to create wrapper for URL %@: %@%@", buf, 0x20u);
        }

      }
    }
    else
    {
      objc_msgSend(v3, "setTrackChanges:", 0);
      objc_msgSend(v3, "setValue:forKey:", 0, CFSTR("BRAssociatedURLWrapperDataKey"));
      objc_msgSend(v3, "setTrackChanges:", 1);
    }
  }

}

id br_shareAssociatedURL(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1
    && (objc_msgSend(v1, "valueForKey:", CFSTR("BRAssociatedURLWrapperDataKey")),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (!v5)
    {
      brc_bread_crumbs((uint64_t)"br_shareAssociatedURL", 176);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v13 = v4;
        v14 = 2112;
        v15 = v2;
        v16 = 2112;
        v17 = v7;
        _os_log_fault_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_FAULT, "[CRIT] failed to unarchive url wrapper %@ from share %@%@", buf, 0x20u);
      }

    }
    objc_msgSend(v5, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t BRShareProcessShouldUseDirectConnection()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

  return v2;
}

id initCKErrorDomain()
{
  void *v0;
  id *v1;

  v0 = CloudKitLibrary();
  v1 = (id *)dlsym(v0, "CKErrorDomain");
  if (!v1)
    initCKErrorDomain_cold_1();
  objc_storeStrong((id *)&constantCKErrorDomain, *v1);
  getCKErrorDomain = (uint64_t (*)())CKErrorDomainFunction;
  return (id)constantCKErrorDomain;
}

id CKErrorDomainFunction()
{
  return (id)constantCKErrorDomain;
}

id initCKPartialErrorsByItemIDKey()
{
  void *v0;
  id *v1;

  v0 = CloudKitLibrary();
  v1 = (id *)dlsym(v0, "CKPartialErrorsByItemIDKey");
  if (!v1)
    initCKPartialErrorsByItemIDKey_cold_1();
  objc_storeStrong((id *)&constantCKPartialErrorsByItemIDKey, *v1);
  getCKPartialErrorsByItemIDKey = (uint64_t (*)())CKPartialErrorsByItemIDKeyFunction;
  return (id)constantCKPartialErrorsByItemIDKey;
}

id CKPartialErrorsByItemIDKeyFunction()
{
  return (id)constantCKPartialErrorsByItemIDKey;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, (os_log_type_t)0x90u, a4, &a9, 0xCu);
}

__CFString *BRFileCoordinatorReadingOptionsPrettyPrint(uint64_t a1)
{
  return BRCPrettyPrintBitmap(a1, brc_file_coordination_reading_options);
}

id _fetchSynchronousAutomaticErrorProxyFromURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___fetchSynchronousAutomaticErrorProxyFromURL_block_invoke;
  v12[3] = &unk_1E3DA4EF8;
  v15 = &v16;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  _fetchServiceAutomaticErrorProxyFromURL(v5, v8, v9, 1, v12);
  objc_msgSend((id)v17[5], "synchronousRemoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v10;
}

void sub_19CC14990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _fetchServiceAutomaticErrorProxyFromURL(void *a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  char v27;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  v13 = objc_msgSend(v9, "startAccessingSecurityScopedResource");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = ___fetchServiceAutomaticErrorProxyFromURL_block_invoke;
  v21[3] = &unk_1E3DA4F48;
  v26 = v13;
  v14 = v9;
  v22 = v14;
  v23 = v10;
  v27 = a4;
  v24 = v11;
  v25 = v12;
  v15 = (void *)MEMORY[0x1E0CB3620];
  v16 = v11;
  v17 = v10;
  v18 = v12;
  objc_msgSend(v15, "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a4)
    objc_msgSend(v19, "synchronouslyGetFileProviderServicesForItemAtURL:completionHandler:", v14, v21);
  else
    objc_msgSend(v19, "getFileProviderServicesForItemAtURL:completionHandler:", v14, v21);

}

void ___fetchSynchronousAutomaticErrorProxyFromURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  BRXPCAutomaticErrorProxy *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (v14)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = v14;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("broken %@ proxy"), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [BRXPCAutomaticErrorProxy alloc];
    objc_msgSend(*(id *)(a1 + 40), "protocol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:](v9, "initWithConnection:protocol:orError:name:requestPid:", 0, v10, v5, v8, 0);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

void ___fetchServiceAutomaticErrorProxyFromURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;
  _BYTE buf[12];
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(unsigned __int8 *)(a1 + 65);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v27 = ___fetchServiceAutomaticErrorProxyFromURL_block_invoke_7;
      v28 = &unk_1E3DA4F20;
      v29 = *(id *)(a1 + 40);
      v32 = *(id *)(a1 + 56);
      v9 = v7;
      v30 = v9;
      v31 = *(id *)(a1 + 48);
      v33 = *(_BYTE *)(a1 + 65);
      if (v8)
      {
        *(_QWORD *)buf = 0;
        objc_msgSend(v9, "fetchFileProviderConnectionAndReturnError:", buf);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(id *)buf;
        v27((uint64_t)v26, v10, v11);

      }
      else
      {
        v11 = v26;
        objc_msgSend(v9, "getFileProviderConnectionWithCompletionHandler:", v11);
      }

      v24 = v29;
    }
    else
    {
      brc_bread_crumbs((uint64_t)"_fetchServiceAutomaticErrorProxyFromURL_block_invoke", 76);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v21;
        v35 = 2112;
        v36 = v22;
        v37 = 2112;
        v38 = v5;
        v39 = 2112;
        v40 = v19;
        _os_log_impl(&dword_19CBF0000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find service named %@ on %@ in %@%@", buf, 0x2Au);

      }
      v23 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorNoBRItemService");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);
    }

  }
  else
  {
    if (objc_msgSend(v6, "br_isFileProviderErrorCode:", -1005))
    {
      objc_msgSend(v6, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CAAB60]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(*(id *)(a1 + 32), "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "brc_errorNotInCloud:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v16;
      }
    }
    brc_bread_crumbs((uint64_t)"_fetchServiceAutomaticErrorProxyFromURL_block_invoke", 70);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v25;
      v35 = 2112;
      v36 = v6;
      v37 = 2112;
      v38 = v17;
      _os_log_error_impl(&dword_19CBF0000, v18, (os_log_type_t)0x90u, "[ERROR] Can't find services for %@: %@%@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void ___fetchServiceAutomaticErrorProxyFromURL_block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  BRXPCAutomaticErrorProxy *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs((uint64_t)"_fetchServiceAutomaticErrorProxyFromURL_block_invoke", 85);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v16 = v12;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] Can't get connection for %@: %@%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = -[BRXPCAutomaticErrorProxy initWithConnection:service:interface:]([BRXPCAutomaticErrorProxy alloc], "initWithConnection:service:interface:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___fetchServiceAutomaticErrorProxyFromURL_block_invoke_8;
    block[3] = &unk_1E3DA4738;
    v14 = *(id *)(a1 + 32);
    if (_block_invoke_onceToken != -1)
      dispatch_once(&_block_invoke_onceToken, block);
    objc_msgSend(v5, "_setQueue:", _block_invoke_queue);
    objc_msgSend(v5, "resume");
    v10 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(a1 + 64))
      -[FPXPCAutomaticErrorProxy synchronousRemoteObjectProxy](v9, "synchronousRemoteObjectProxy");
    else
      -[FPXPCAutomaticErrorProxy remoteObjectProxy](v9, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

  }
}

void ___fetchServiceAutomaticErrorProxyFromURL_block_invoke_8(uint64_t a1)
{
  const char *v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("-queue"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v6, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v2, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(v1, v3);

  v5 = (void *)_block_invoke_queue;
  _block_invoke_queue = (uint64_t)v4;

}

const __CFString *BRLogsAbsolutePath()
{
  return CFSTR("/var/log/com.apple.clouddocs.asl");
}

uint64_t BRPostAccountTokenChangedNotification()
{
  return brc_notify_post((char *)objc_msgSend(CFSTR("com.apple.librarian.account-token-changed"), "UTF8String"));
}

id _BRPromiseURLCombine(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v7)
  {
    if (v8)
      MEMORY[0x1A1AD7D20](v7, v8);
    if (v9 && v10)
      MEMORY[0x1A1AD7D20](v9, v10);
    _CFURLPromiseSetPhysicalURL();
  }

  return v7;
}

void BRCurrentProcessIsNotAppSandboxed()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  void *v3;
  const char *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  abc_report_panic_with_signature(CFSTR("BRCurrentProcessIsNotAppSandboxed is not supported on iOS"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BRCurrentProcessIsNotAppSandboxed is not supported on iOS"));
  v0 = objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs((uint64_t)"BRCurrentProcessIsNotAppSandboxed", 236);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message(v0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v1;
    _os_log_fault_impl(&dword_19CBF0000, v2, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v5, 0x16u);

  }
  brc_append_system_info_to_message(v0);
  v4 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("BRCurrentProcessIsNotAppSandboxed", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/CloudDocs.m", 236, v4);
}

void BRCurrentProcessIsNotAppSandboxedAndHasContainers()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  void *v3;
  const char *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  abc_report_panic_with_signature(CFSTR("BRCurrentProcessIsNotAppSandboxedAndHasContainers is not supported on iOS"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BRCurrentProcessIsNotAppSandboxedAndHasContainers is not supported on iOS"));
  v0 = objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs((uint64_t)"BRCurrentProcessIsNotAppSandboxedAndHasContainers", 242);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message(v0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v1;
    _os_log_fault_impl(&dword_19CBF0000, v2, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v5, 0x16u);

  }
  brc_append_system_info_to_message(v0);
  v4 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("BRCurrentProcessIsNotAppSandboxedAndHasContainers", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/CloudDocs.m", 242, v4);
}

uint64_t BRCurrentProcessIsContainerProxy()
{
  if (_BRLoadUbiquityEntitlements_once != -1)
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_168);
  return currentProcessIsContainerProxy;
}

uint64_t BRCurrentProcessHasAccessToCloudDocsGroupContainers()
{
  if (_BRLoadUbiquityEntitlements_once != -1)
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_168);
  return currentProcessHasAccessToGroupContainers;
}

id BRCopyUbiquityContainerIdentifiersForCurrentProcess()
{
  void *v0;
  NSObject *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[3];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"BRCopyUbiquityContainerIdentifiersForCurrentProcess", 273, v15);
  brc_bread_crumbs((uint64_t)"BRCopyUbiquityContainerIdentifiersForCurrentProcess", 273);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    BRCopyUbiquityContainerIdentifiersForCurrentProcess_cold_2();

  if (_BRLoadUbiquityEntitlements_once != -1)
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_168);
  if (currentProcessUbiquityContainerEntitlements)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (id)currentProcessUbiquityContainerEntitlements;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(v7, "hasSuffix:", CFSTR(".*"), (_QWORD)v11) & 1) == 0)
            objc_msgSend(v2, "addObject:", v7);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v4);
    }

  }
  else
  {
    v2 = 0;
  }
  brc_bread_crumbs((uint64_t)"BRCopyUbiquityContainerIdentifiersForCurrentProcess", 292);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    BRCopyUbiquityContainerIdentifiersForCurrentProcess_cold_1();

  __brc_leave_section((uint64_t)v15);
  return v2;
}

void sub_19CC15E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BRForceSyncOnAllContainers(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newSyncProxy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __BRForceSyncOnAllContainers_block_invoke;
  v8[3] = &unk_1E3DA47F0;
  v4 = v3;
  v9 = v4;
  objc_msgSend(v4, "forceSyncContainerID:reply:", 0, v8);
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (a1 && (v6 & 1) == 0)
  {
    objc_msgSend(v4, "error");
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t BRiWorkSyncContainer(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;

  v5 = a1;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newSyncProxy");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __BRiWorkSyncContainer_block_invoke;
  v12[3] = &unk_1E3DA47F0;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v8, "iWorkForceSyncContainerID:ownedByMe:reply:", v5, a2, v12);

  objc_msgSend(v8, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (a3 && (v10 & 1) == 0)
  {
    objc_msgSend(v8, "error");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void BRGetURLForPublishedItem(void *a1, void *a2)
{
  BRGetURLForPublishedItemWithOptions(a1, 0, 0, a2);
}

void BRGetURLForPublishedItemWithOptions(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v7 = a1;
  v8 = a4;
  v9 = (void *)MEMORY[0x1A1AD841C]();
  if ((objc_msgSend(v7, "br_isInSyncedLocation") & 1) != 0)
  {
    v28 = 0uLL;
    v29 = 0;
    __brc_create_section(0, (uint64_t)"BRGetURLForPublishedItemWithOptions", 457, &v28);
    brc_bread_crumbs((uint64_t)"BRGetURLForPublishedItemWithOptions", 457);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      BRGetProcessMobileContainerForID_cold_1();

    v30 = v28;
    v31 = v29;
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __BRGetURLForPublishedItemWithOptions_block_invoke;
      v22[3] = &unk_1E3DA4FC0;
      v24 = v30;
      v25 = v31;
      v12 = &v23;
      v13 = v8;
      v27 = a2;
      v23 = v13;
      v26 = a3;
      objc_msgSend(v7, "_br_fetchItemServiceSyncProxy:", v22);
    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __BRGetURLForPublishedItemWithOptions_block_invoke_2;
      v18[3] = &unk_1E3DA4FE8;
      v20 = v30;
      v21 = v31;
      v12 = &v19;
      v16 = v8;
      v19 = v16;
      objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "getPublishedURLForItemAtURL:forStreaming:requestedTTL:reply:", v7, a2, a3, v16);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v14);

  }
  objc_autoreleasePoolPop(v9);

}

void sub_19CC1644C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC165A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __brc_leave_section((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void BRRegisterInitialSyncHandlerForContainer(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1A1AD841C]();
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"BRRegisterInitialSyncHandlerForContainer", 485, v10);
  brc_bread_crumbs((uint64_t)"BRRegisterInitialSyncHandlerForContainer", 485);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v12 = v10[0];
    v13 = 2080;
    v14 = "BRRegisterInitialSyncHandlerForContainer";
    v15 = 2112;
    v16 = v3;
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s: container:%@%@", buf, 0x2Au);
  }

  if (_BRLoadUbiquityEntitlements_once != -1)
    dispatch_once(&_BRLoadUbiquityEntitlements_once, &__block_literal_global_168);
  if (currentProcessUbiquityContainerEntitlements)
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "registerInitialSyncBarrierForID:reply:", v3, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);
  }

  __brc_leave_section((uint64_t)v10);
  objc_autoreleasePoolPop(v5);

}

void sub_19CC167C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void BREvictItemAtURL(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, id);
  void *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = objc_msgSend(v5, "evictUbiquitousItemAtURL:error:", v3, &v10);
    v7 = v10;

    if ((v6 & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"BREvictItemAtURL", 505);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v12 = v3;
        v13 = 2112;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed evicting url %@ - %@%@", buf, 0x20u);
      }

    }
    v4[2](v4, v7);

  }
  else
  {
    BREvictItemAtURLWithOptions(v3, 1, v4);
  }

}

void BREvictItemAtURLWithOptions(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AD841C]();
  if ((objc_msgSend(v5, "br_isInSyncedLocation") & 1) != 0)
  {
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      if ((a2 & 4) != 0)
      {
        brc_bread_crumbs((uint64_t)"BREvictItemAtURLWithOptions", 523);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412290;
          v14 = v8;
          _os_log_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] We shouldn't be evicting thumbnails in FPFS - only content%@", (uint8_t *)&v13, 0xCu);
        }

      }
      BREvictItemAtURL(v5, v6);
    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "evictItemAtURL:options:reply:", v5, a2, v6);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);

  }
  objc_autoreleasePoolPop(v7);

}

void BRSynchronousEvictItemAtURLWithOptions(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  _QWORD v15[4];
  void (**v16)(id, _QWORD, void *);
  _QWORD v17[4];
  id v18;

  v5 = a1;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AD841C]();
  if ((objc_msgSend(v5, "br_isInSyncedLocation") & 1) != 0)
  {
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      brc_bread_crumbs((uint64_t)"BRSynchronousEvictItemAtURLWithOptions", 542);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        BRSynchronousEvictItemAtURLWithOptions_cold_1();

      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_evictItemAtURL_options_reply_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v10);

    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __BRSynchronousEvictItemAtURLWithOptions_block_invoke;
      v17[3] = &unk_1E3DA48F8;
      v13 = v6;
      v18 = v13;
      objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __BRSynchronousEvictItemAtURLWithOptions_block_invoke_2;
      v15[3] = &unk_1E3DA48F8;
      v16 = v13;
      objc_msgSend(v14, "evictItemAtURL:options:reply:", v5, a2, v15);

    }
  }
  else
  {
    v6[2](v6, 0, 0);
  }
  objc_autoreleasePoolPop(v7);

}

void BRThumbnailChangedAtURL(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1A1AD841C]();
  if ((objc_msgSend(v3, "br_isInSyncedLocation") & 1) != 0)
  {
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      brc_bread_crumbs((uint64_t)"BRThumbnailChangedAtURL", 564);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        BRThumbnailChangedAtURL_cold_1();

      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_thumbnailChangedForItemAtURL_reply_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8);

    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "thumbnailChangedForItemAtURL:reply:", v3, v4);
    }
  }
  else
  {
    v4[2](v4, 0);
  }
  objc_autoreleasePoolPop(v5);

}

void BRStartDownloadForItemsWithOptions(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AD841C]();
  if ((objc_msgSend(v5, "br_any_of:", &__block_literal_global_6) & 1) == 0)
  {
    if (objc_msgSend(v5, "count"))
    {
      v27 = 0;
      +[BRAccount currentCachedLoggedInAccountWithError:](BRAccount, "currentCachedLoggedInAccountWithError:", &v27);
      v8 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB35C8];
      if (v8 | v27)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v20);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOut");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v17);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("urls"), v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v6[2](v6, (void *)v8);
    }
LABEL_21:

    goto LABEL_22;
  }
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13);
          v22 = 0;
          objc_msgSend((id)v8, "startDownloadingUbiquitousItemAtURL:error:", v14, &v22);
          v15 = v22;
          if (v15)
          {
            v21 = v15;
            v6[2](v6, v15);

            goto LABEL_21;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v11)
          continue;
        break;
      }
    }

    v6[2](v6, 0);
    goto LABEL_21;
  }
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "startDownloadItemsAtURLs:options:reply:", v5, a2, v6);
LABEL_22:
  objc_autoreleasePoolPop(v7);

}

void BRStartDownloadForItems(void *a1, void *a2)
{
  BRStartDownloadForItemsWithOptions(a1, 0, a2);
}

void BRDumpDatabaseToFileHandle(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1A1AD841C]();
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __BRDumpDatabaseToFileHandle_block_invoke;
  v11[3] = &unk_1E3DA48F8;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "br_currentPersonaID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:", v3, 0, v10, 0, 0, v7);
  objc_autoreleasePoolPop(v5);

}

uint64_t BRRemoveItemAtURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_removeItemFromDisk_reply_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      brc_bread_crumbs((uint64_t)"BRRemoveItemAtURL", 635);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "BRRemoveItemAtURL";
        v23 = 2080;
        if (!a2)
          v17 = "(ignored by caller)";
        v24 = v17;
        v25 = 2112;
        v26 = v4;
        v27 = 2112;
        v28 = v5;
        _os_log_error_impl(&dword_19CBF0000, v6, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a2)
      *a2 = objc_retainAutorelease(v4);

    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AD841C]();
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newLegacySyncProxy");

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __BRRemoveItemAtURL_block_invoke;
    v19[3] = &unk_1E3DA47F0;
    v11 = v10;
    v20 = v11;
    objc_msgSend(v11, "removeItemFromDisk:reply:", v3, v19);
    objc_msgSend(v11, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v11, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      brc_bread_crumbs((uint64_t)"BRRemoveItemAtURL", 646);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "BRRemoveItemAtURL";
        v23 = 2080;
        if (!a2)
          v18 = "(ignored by caller)";
        v24 = v18;
        v25 = 2112;
        v26 = v13;
        v27 = 2112;
        v28 = v14;
        _os_log_error_impl(&dword_19CBF0000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a2)
      *a2 = objc_retainAutorelease(v13);

    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

id BRGetAttributeValuesForItem(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v5 = a1;
  v6 = a2;
  if (!objc_msgSend(v5, "br_isInSyncedLocation"))
  {
    v14 = 0;
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB2DD8];
  if ((objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CB2DD8]) & 1) != 0
    || objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C99AD8]))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "br_cloudDocsContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (objc_msgSend(v6, "containsObject:", v8))
      {
        objc_msgSend(v9, "removeObject:", v8);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v11, v8);

      }
      v12 = *MEMORY[0x1E0C99AD8];
      if (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0C99AD8]))
      {
        objc_msgSend(v9, "removeObject:", v12);
        objc_msgSend(v10, "localizedName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v13, v12);

      }
    }

  }
  else
  {
    v9 = v6;
  }
  v15 = *MEMORY[0x1E0C99A38];
  if (objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0C99A38]))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v15);

    if ((objc_msgSend(v5, "checkPromisedItemIsReachableAndReturnError:", 0) & 1) == 0)
    {
      objc_msgSend(v5, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "br_sideFaultName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "URLByDeletingLastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLByAppendingPathComponent:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v19, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
      {
        brc_bread_crumbs((uint64_t)"BRGetAttributeValuesForItem", 720);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          BRGetAttributeValuesForItem_cold_2();

        goto LABEL_27;
      }

    }
    objc_msgSend(v5, "br_pathRelativeToMobileDocuments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    if (v20)
      v21 = v20;

    v22 = objc_msgSend(v17, "br_isExcludedWithMaximumDepth:", 60);
    if (v22)
    {
      brc_bread_crumbs((uint64_t)"BRGetAttributeValuesForItem", 730);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        BRGetAttributeValuesForItem_cold_1();

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22 ^ 1u);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v19, v15);
LABEL_27:

    goto LABEL_28;
  }
  v6 = v9;
LABEL_28:
  if (objc_msgSend(v6, "count"))
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__3;
    v49 = __Block_byref_object_dispose__3;
    v50 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__3;
    v43 = __Block_byref_object_dispose__3;
    v44 = 0;
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      objc_msgSend(v5, "_br_itemServiceSyncProxy");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __BRGetAttributeValuesForItem_block_invoke;
      v38[3] = &unk_1E3DA5030;
      v38[4] = &v39;
      v38[5] = &v45;
      objc_msgSend(v27, "getAttributeValues:reply:", v6, v38);
    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "newLegacySyncProxy");

      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __BRGetAttributeValuesForItem_block_invoke_2;
      v36[3] = &unk_1E3DA5058;
      v27 = v29;
      v37 = v27;
      objc_msgSend(v27, "getAttributeValues:forItemAtURL:reply:", v6, v5, v36);
      objc_msgSend(v27, "result");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v40[5];
      v40[5] = v30;

      objc_msgSend(v27, "error");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v46[5];
      v46[5] = v32;

    }
    objc_msgSend(v7, "addEntriesFromDictionary:", v40[5]);
    v34 = (void *)v46[5];
    if (v34)
    {
      v14 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v34);
    }
    else
    {
      v14 = v7;
    }
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v14 = v7;
  }

LABEL_39:
  return v14;
}

void sub_19CC17A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id BRGetAttributeValueForItem(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v14[0] = v5;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a1;
  objc_msgSend(v6, "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  BRGetAttributeValuesForItem(v7, v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (uint64_t)v13;
  objc_msgSend(v9, "objectForKey:", v5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!(v11 | v10))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1002, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  if (a3 && v10)
    *a3 = objc_retainAutorelease((id)v10);

  return (id)v11;
}

void BRGetTotalApplicationDocumentUsage(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __BRGetTotalApplicationDocumentUsage_block_invoke;
  v5[3] = &unk_1E3DA48F8;
  v6 = v1;
  v3 = v1;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "getTotalApplicationDocumentUsageWithReply:", v3);
}

void BRGetApplicationDocumentUsageInformation(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = a1;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __BRGetApplicationDocumentUsageInformation_block_invoke;
  v8[3] = &unk_1E3DA48F8;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getApplicationDocumentUsageInfoForBundleID:withReply:", v4, v6);
}

uint64_t _BRFaultCopyPropertiesOfFaultAtURL()
{
  return _CFURLCopyPropertiesOfPromiseAtURL();
}

id BRPushTopicGetContainerID(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("clouddocs."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "rangeOfString:", v2))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v1, "substringFromIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id BRAddNetworkReachabilityObserverWithCallbackQueue(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  const char *v9;
  int *v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  uint32_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v25;
  _QWORD block[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  int v38;
  _BYTE handler[24];
  void *v40;
  id v41;
  id v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v25 = a1;
  v3 = a2;
  if (v3)
  {
    objc_msgSend(CFSTR("BRNotificationServerAvailabilityChanges"), "br_libnotifyPerUserNotificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = (int *)&v35;
    v37 = 0x2020000000;
    v5 = MEMORY[0x1E0C809B0];
    v38 = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke;
    v31[3] = &unk_1E3DA5090;
    v34 = &v35;
    v6 = v4;
    v32 = v6;
    v33 = v3;
    v7 = (void *)MEMORY[0x1A1AD85E4](v31);
    v8 = objc_retainAutorelease(v6);
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    v10 = v36;
    v28[0] = v5;
    v28[1] = 3221225472;
    v28[2] = __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke_2;
    v28[3] = &unk_1E3DA50B8;
    v30 = &v35;
    v11 = v7;
    v29 = v11;
    v12 = v25;
    v13 = v28;
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "br_currentPersonaID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)handler = v5;
    *(_QWORD *)&handler[8] = 3221225472;
    *(_QWORD *)&handler[16] = __br_notify_register_dispatch_block_invoke_0;
    v40 = &unk_1E3DA49A8;
    v16 = v15;
    v41 = v16;
    v43 = v9;
    v17 = v13;
    v42 = v17;
    v18 = notify_register_dispatch(v9, v10 + 6, v12, handler);

    if (v18)
    {
      brc_bread_crumbs((uint64_t)"BRAddNetworkReachabilityObserverWithCallbackQueue", 881);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)handler = 67109378;
        *(_DWORD *)&handler[4] = v18;
        *(_WORD *)&handler[8] = 2112;
        *(_QWORD *)&handler[10] = v19;
        _os_log_impl(&dword_19CBF0000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't add observer: error code %d%@", handler, 0x12u);
      }

    }
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke_45;
    block[3] = &unk_1E3DA50E0;
    v21 = v11;
    v27 = v21;
    dispatch_async(v12, block);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v36[6]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRAddNetworkReachabilityObserverWithCallbackQueue", 858);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 138412290;
      *(_QWORD *)&handler[4] = v8;
      _os_log_impl(&dword_19CBF0000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't add observer: no block specified%@", handler, 0xCu);
    }

    v22 = 0;
  }

  return v22;
}

void sub_19CC181C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t BRNotificationNameForServerAvailabilityChanges()
{
  return objc_msgSend(CFSTR("BRNotificationServerAvailabilityChanges"), "br_libnotifyPerUserNotificationName");
}

id BRAddNetworkReachabilityObserver(void *a1)
{
  void *v2;
  void *v3;

  dispatch_get_global_queue(9, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BRAddNetworkReachabilityObserverWithCallbackQueue(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void BRRemoveNetworkReachabilityObserver(void *a1)
{
  id v1;
  uint32_t v2;
  uint32_t v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  id v9;
  int v10;
  _BYTE v11[18];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    brc_bread_crumbs((uint64_t)"BRRemoveNetworkReachabilityObserver", 899);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      *(_QWORD *)v11 = v4;
      v6 = "[WARNING] Can't remove observer: given observer is nil%@";
      v7 = v5;
      v8 = 12;
      goto LABEL_8;
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"BRRemoveNetworkReachabilityObserver", 903);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      *(_QWORD *)v11 = objc_opt_class();
      *(_WORD *)&v11[8] = 2112;
      *(_QWORD *)&v11[10] = v4;
      v9 = *(id *)v11;
      _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't remove observer: unexpected kind of class (expected: NSNumber, actual: %@)%@", (uint8_t *)&v10, 0x16u);

    }
    goto LABEL_11;
  }
  v2 = notify_cancel(objc_msgSend(v1, "intValue"));
  if (v2)
  {
    v3 = v2;
    brc_bread_crumbs((uint64_t)"BRRemoveNetworkReachabilityObserver", 911);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 67109378;
      *(_DWORD *)v11 = v3;
      *(_WORD *)&v11[4] = 2112;
      *(_QWORD *)&v11[6] = v4;
      v6 = "[WARNING] Can't remove observer: error code %d%@";
      v7 = v5;
      v8 = 18;
LABEL_8:
      _os_log_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_12:

}

id BREntitledContainerIdentifiersForProxy(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "entitlements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BREntitledContainerIdentifiers((uint64_t)v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

BOOL BRSyncedDocumentIDForDocumentAtURL(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  const char *v21;
  const char *v22;
  const char *v23;
  _QWORD v24[4];
  NSObject *v25;
  _BYTE *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  _BYTE v49[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("fileURL"), 0);
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      brc_bread_crumbs((uint64_t)"BRSyncedDocumentIDForDocumentAtURL", 1207);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        *(_DWORD *)v49 = 136315906;
        *(_QWORD *)&v49[4] = "BRSyncedDocumentIDForDocumentAtURL";
        *(_WORD *)&v49[12] = 2080;
        if (!a4)
          v22 = "(ignored by caller)";
        *(_QWORD *)&v49[14] = v22;
        *(_WORD *)&v49[22] = 2112;
        v50 = v15;
        LOWORD(v51) = 2112;
        *(_QWORD *)((char *)&v51 + 2) = v16;
        _os_log_error_impl(&dword_19CBF0000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v49, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    goto LABEL_19;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("syncedDocumentID"), 0);
    v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      brc_bread_crumbs((uint64_t)"BRSyncedDocumentIDForDocumentAtURL", 1211);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        v23 = "(passed to caller)";
        *(_DWORD *)v49 = 136315906;
        *(_QWORD *)&v49[4] = "BRSyncedDocumentIDForDocumentAtURL";
        *(_WORD *)&v49[12] = 2080;
        if (!a4)
          v23 = "(ignored by caller)";
        *(_QWORD *)&v49[14] = v23;
        *(_WORD *)&v49[22] = 2112;
        v50 = v15;
        LOWORD(v51) = 2112;
        *(_QWORD *)((char *)&v51 + 2) = v18;
        _os_log_error_impl(&dword_19CBF0000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v49, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v15);
LABEL_19:

    v11 = 0;
    goto LABEL_23;
  }
  *(_QWORD *)v49 = 0;
  *(_QWORD *)&v49[8] = v49;
  *(_QWORD *)&v49[16] = 0x3032000000;
  v50 = __Block_byref_object_copy__3;
  *(_QWORD *)&v51 = __Block_byref_object_dispose__3;
  *((_QWORD *)&v51 + 1) = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__3;
  v39 = __Block_byref_object_dispose__3;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  v34 = 0;
  v8 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __BRSyncedDocumentIDForDocumentAtURL_block_invoke;
  v24[3] = &unk_1E3DA5128;
  v26 = v49;
  v27 = &v35;
  v28 = &v29;
  v9 = v8;
  v25 = v9;
  objc_msgSend(v7, "br_bookmarkableStringWithEtag:completion:", a3 != 0, v24);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (void *)v30[5];
  v11 = v10 == 0;
  if (v10)
  {
    v12 = v10;
    brc_bread_crumbs((uint64_t)"BRSyncedDocumentIDForDocumentAtURL", 1235);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      v21 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v42 = "BRSyncedDocumentIDForDocumentAtURL";
      v43 = 2080;
      if (!a4)
        v21 = "(ignored by caller)";
      v44 = v21;
      v45 = 2112;
      v46 = v12;
      v47 = 2112;
      v48 = v13;
      _os_log_error_impl(&dword_19CBF0000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v12);

  }
  else
  {
    *a2 = objc_retainAutorelease(*(id *)(*(_QWORD *)&v49[8] + 40));
    if (a3)
      *a3 = objc_retainAutorelease((id)v36[5]);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(v49, 8);
LABEL_23:

  return v11;
}

void sub_19CC189A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Unwind_Resume(a1);
}

BOOL BRLocateDocumentForSyncedDocumentID(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v14 = 0;
    *a2 = (id)BRCopyDocumentURLForUbiquitousBookmarkData(a1, &v14);
    v5 = v14;
    if (v14)
    {
      brc_bread_crumbs((uint64_t)"BRLocateDocumentForSyncedDocumentID", 1248);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        v12 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v16 = "BRLocateDocumentForSyncedDocumentID";
        v17 = 2080;
        if (!a3)
          v12 = "(ignored by caller)";
        v18 = v12;
        v19 = 2112;
        v20 = v5;
        v21 = 2112;
        v22 = v6;
        _os_log_error_impl(&dword_19CBF0000, v7, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v5);

    return *a2 != 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("fileURL"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs((uint64_t)"BRLocateDocumentForSyncedDocumentID", 1243);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        v13 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v16 = "BRLocateDocumentForSyncedDocumentID";
        v17 = 2080;
        if (!a3)
          v13 = "(ignored by caller)";
        v18 = v13;
        v19 = 2112;
        v20 = v9;
        v21 = 2112;
        v22 = v10;
        _os_log_error_impl(&dword_19CBF0000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v9);

    return 0;
  }
}

uint64_t BRPrepareDocumentForForcedConflict(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (!FPIsCloudDocsWithFPFSEnabled())
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("fileURL"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1262);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        {
          v29 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v36 = "BRPrepareDocumentForForcedConflict";
          v37 = 2080;
          if (!a4)
            v29 = "(ignored by caller)";
          v38 = v29;
          v39 = 2112;
          v40 = v10;
          v41 = 2112;
          v42 = v21;
          _os_log_error_impl(&dword_19CBF0000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        goto LABEL_6;
LABEL_20:
      v13 = 0;
      goto LABEL_32;
    }
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 2)
    {
      if (v9)
      {
        +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "newLegacySyncProxy");

        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __BRPrepareDocumentForForcedConflict_block_invoke;
        v33[3] = &unk_1E3DA47F0;
        v16 = v15;
        v34 = v16;
        objc_msgSend(v16, "forceConflictForURL:bookmarkData:forcedEtag:reply:", v7, v8, v9, v33);
        objc_msgSend(v16, "result");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "BOOLValue");

        objc_msgSend(v16, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1281);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
          {
            v31 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v36 = "BRPrepareDocumentForForcedConflict";
            v37 = 2080;
            if (!a4)
              v31 = "(ignored by caller)";
            v38 = v31;
            v39 = 2112;
            v40 = v18;
            v41 = 2112;
            v42 = v19;
            _os_log_error_impl(&dword_19CBF0000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (a4)
          *a4 = objc_retainAutorelease(v18);

        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("syncedChangeTag"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1271);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          v32 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v36 = "BRPrepareDocumentForForcedConflict";
          v37 = 2080;
          if (!a4)
            v32 = "(ignored by caller)";
          v38 = v32;
          v39 = 2112;
          v40 = v16;
          v41 = 2112;
          v42 = v25;
          _os_log_error_impl(&dword_19CBF0000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (!a4)
        goto LABEL_30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("syncedDocumentID"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1267);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        {
          v30 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v36 = "BRPrepareDocumentForForcedConflict";
          v37 = 2080;
          if (!a4)
            v30 = "(ignored by caller)";
          v38 = v30;
          v39 = 2112;
          v40 = v16;
          v41 = 2112;
          v42 = v23;
          _os_log_error_impl(&dword_19CBF0000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (!a4)
      {
LABEL_30:
        v13 = 0;
        goto LABEL_31;
      }
    }
    v16 = objc_retainAutorelease(v16);
    v13 = 0;
    *a4 = v16;
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_forceConflictForURL_bookmarkData_forcedEtag_reply_);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    brc_bread_crumbs((uint64_t)"BRPrepareDocumentForForcedConflict", 1257);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      v28 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v36 = "BRPrepareDocumentForForcedConflict";
      v37 = 2080;
      if (!a4)
        v28 = "(ignored by caller)";
      v38 = v28;
      v39 = 2112;
      v40 = v10;
      v41 = 2112;
      v42 = v11;
      _os_log_error_impl(&dword_19CBF0000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (!a4)
    goto LABEL_20;
LABEL_6:
  v10 = objc_retainAutorelease(v10);
  v13 = 0;
  *a4 = v10;
LABEL_32:

  return v13;
}

void BRiWorkSharingSetSharingState(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  NSObject *v31;
  id v32;
  _QWORD block[4];
  id v34;

  v9 = a1;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10 && v11)
  {
    if (v9)
    {
      if (FPIsCloudDocsWithFPFSEnabled())
      {
        objc_msgSend(v9, "_br_itemServiceSyncProxy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __BRiWorkSharingSetSharingState_block_invoke_2;
        v29[3] = &unk_1E3DA5178;
        v30 = v9;
        v31 = v10;
        v32 = v12;
        objc_msgSend(v13, "setiWorkPublishingInfo:readonly:reply:", a2, a3, v29);

      }
      else
      {
        +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __BRiWorkSharingSetSharingState_block_invoke_2_73;
        v26[3] = &unk_1E3DA51A0;
        v19 = v10;
        v27 = v19;
        v20 = v12;
        v28 = v20;
        objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v18;
        v22[1] = 3221225472;
        v22[2] = __BRiWorkSharingSetSharingState_block_invoke_4;
        v22[3] = &unk_1E3DA5178;
        v23 = v9;
        v24 = v19;
        v25 = v20;
        objc_msgSend(v21, "setiWorkPublishingInfoAtURL:publish:readonly:reply:", v23, a2, a3, v22);

        v13 = v27;
      }
    }
    else
    {
      brc_bread_crumbs((uint64_t)"BRiWorkSharingSetSharingState", 1293);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        BRiWorkSharingSetSharingState_cold_1();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __BRiWorkSharingSetSharingState_block_invoke;
      block[3] = &unk_1E3DA50E0;
      v34 = v12;
      dispatch_async(v10, block);
      v13 = v34;
    }
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRiWorkSharingSetSharingState", 1289);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      BRiWorkSharingSetSharingState_cold_2();

  }
}

BOOL BRiWorkSharingGetBadgingSharingState(void *a1, _BYTE *a2, BOOL *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  NSObject *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  const char *v24;
  const char *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t v35[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  if (v7)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy__3;
    *(_QWORD *)&v45 = __Block_byref_object_dispose__3;
    *((_QWORD *)&v45 + 1) = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      objc_msgSend(v7, "_br_itemServiceSyncProxy");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __BRiWorkSharingGetBadgingSharingState_block_invoke;
      v28[3] = &unk_1E3DA51C8;
      v28[4] = buf;
      v28[5] = &v29;
      objc_msgSend(v8, "getiWorkPublishingBadgingStatus:", v28);
    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "newLegacySyncProxy");

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __BRiWorkSharingGetBadgingSharingState_block_invoke_2;
      v26[3] = &unk_1E3DA51F0;
      v8 = v14;
      v27 = v8;
      objc_msgSend(v8, "getiWorkPublishingBadgingStatusAtURL:reply:", v7, v26);
      objc_msgSend(v8, "result");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v15;

      objc_msgSend(v8, "error");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v30[5];
      v30[5] = v17;

    }
    v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v12 = v19 != 0;
    if (v19)
    {
      if (a2)
        *a2 = objc_msgSend(v19, "intValue") & 1;
      if (a3)
        *a3 = (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "intValue") & 2) != 0;
    }
    else
    {
      v20 = (id)v30[5];
      if (v20)
      {
        brc_bread_crumbs((uint64_t)"BRiWorkSharingGetBadgingSharingState", 1355);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        {
          v25 = "(passed to caller)";
          *(_DWORD *)v35 = 136315906;
          v36 = "BRiWorkSharingGetBadgingSharingState";
          v37 = 2080;
          if (!a4)
            v25 = "(ignored by caller)";
          v38 = v25;
          v39 = 2112;
          v40 = v20;
          v41 = 2112;
          v42 = v21;
          _os_log_error_impl(&dword_19CBF0000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v35, 0x2Au);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v20);

    }
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("fileURL"), 0);
    v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs((uint64_t)"BRiWorkSharingGetBadgingSharingState", 1333);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "BRiWorkSharingGetBadgingSharingState";
        *(_WORD *)&buf[12] = 2080;
        if (!a4)
          v24 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        v44 = v9;
        LOWORD(v45) = 2112;
        *(_QWORD *)((char *)&v45 + 2) = v10;
        _os_log_error_impl(&dword_19CBF0000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);

    v12 = 0;
  }

  return v12;
}

void sub_19CC19D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

BOOL BRiWorkSharingGetNeedsMigrateAtURL(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;
  NSObject *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  const char *v19;
  const char *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  _BYTE v36[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    *(_QWORD *)v36 = 0;
    *(_QWORD *)&v36[8] = v36;
    *(_QWORD *)&v36[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__3;
    *(_QWORD *)&v38 = __Block_byref_object_dispose__3;
    *((_QWORD *)&v38 + 1) = 0;
    if (FPIsCloudDocsWithFPFSEnabled())
    {
      objc_msgSend(v3, "_br_itemServiceSyncProxy");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __BRiWorkSharingGetNeedsMigrateAtURL_block_invoke;
      v23[3] = &unk_1E3DA5218;
      v23[4] = &v24;
      v23[5] = v36;
      objc_msgSend(v4, "getiWorkNeedsShareMigrate:", v23);
    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "newLegacySyncProxy");

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __BRiWorkSharingGetNeedsMigrateAtURL_block_invoke_2;
      v21[3] = &unk_1E3DA4880;
      v4 = v10;
      v22 = v4;
      objc_msgSend(v4, "getiWorkNeedsShareMigrateAtURL:reply:", v3, v21);
      objc_msgSend(v4, "result");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");
      *((_BYTE *)v25 + 24) = v12;

      objc_msgSend(v4, "error");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(*(_QWORD *)&v36[8] + 40);
      *(_QWORD *)(*(_QWORD *)&v36[8] + 40) = v13;

    }
    v15 = *(id *)(*(_QWORD *)&v36[8] + 40);
    if (v15)
    {
      brc_bread_crumbs((uint64_t)"BRiWorkSharingGetNeedsMigrateAtURL", 1395);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v29 = "BRiWorkSharingGetNeedsMigrateAtURL";
        v30 = 2080;
        if (!a2)
          v19 = "(ignored by caller)";
        v31 = v19;
        v32 = 2112;
        v33 = v15;
        v34 = 2112;
        v35 = v16;
        _os_log_error_impl(&dword_19CBF0000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a2)
      *a2 = objc_retainAutorelease(v15);

    v8 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(v36, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("fileURL"), 0);
    v5 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      brc_bread_crumbs((uint64_t)"BRiWorkSharingGetNeedsMigrateAtURL", 1372);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)v36 = 136315906;
        *(_QWORD *)&v36[4] = "BRiWorkSharingGetNeedsMigrateAtURL";
        *(_WORD *)&v36[12] = 2080;
        if (!a2)
          v20 = "(ignored by caller)";
        *(_QWORD *)&v36[14] = v20;
        *(_WORD *)&v36[22] = 2112;
        v37 = v5;
        LOWORD(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 2) = v6;
        _os_log_error_impl(&dword_19CBF0000, v7, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v36, 0x2Au);
      }

    }
    if (a2)
      *a2 = objc_retainAutorelease(v5);

    v8 = 0;
  }

  return v8;
}

void sub_19CC1A24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BRiWorkSharingGetFullSharingInfo(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  _QWORD block[4];
  id v28;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6 && v7)
  {
    if (v5)
    {
      if (FPIsCloudDocsWithFPFSEnabled())
      {
        objc_msgSend(v5, "_br_itemServiceSyncProxy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_2;
        v24[3] = &unk_1E3DA5268;
        v25 = v6;
        v26 = v8;
        objc_msgSend(v9, "getiWorkPublishingInfo:", v24);

      }
      else
      {
        +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_4;
        v21[3] = &unk_1E3DA51A0;
        v15 = v6;
        v22 = v15;
        v16 = v8;
        v23 = v16;
        objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18[0] = v14;
        v18[1] = 3221225472;
        v18[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke_6;
        v18[3] = &unk_1E3DA5268;
        v19 = v15;
        v20 = v16;
        objc_msgSend(v17, "getiWorkPublishingInfoAtURL:reply:", v5, v18);

        v9 = v22;
      }
    }
    else
    {
      brc_bread_crumbs((uint64_t)"BRiWorkSharingGetFullSharingInfo", 1410);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        BRiWorkSharingSetSharingState_cold_1();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __BRiWorkSharingGetFullSharingInfo_block_invoke;
      block[3] = &unk_1E3DA50E0;
      v28 = v8;
      dispatch_async(v6, block);
      v9 = v28;
    }
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRiWorkSharingGetFullSharingInfo", 1405);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      BRiWorkSharingSetSharingState_cold_2();

  }
}

void BRSharingCopyCurrentUserIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __BRSharingCopyCurrentUserIdentifier_block_invoke;
    v16[3] = &unk_1E3DA51A0;
    v8 = v3;
    v17 = v8;
    v9 = v5;
    v18 = v9;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __BRSharingCopyCurrentUserIdentifier_block_invoke_3;
    v13[3] = &unk_1E3DA52B8;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v10, "copyCurrentUserIdentifierWithReply:", v13);

    v11 = v17;
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRSharingCopyCurrentUserIdentifier", 1444);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      BRSharingCopyCurrentUserIdentifier_cold_1();

  }
}

void BRSharingCopyCurrentUserNameAndDisplayHandle(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke;
    v16[3] = &unk_1E3DA51A0;
    v8 = v3;
    v17 = v8;
    v9 = v5;
    v18 = v9;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __BRSharingCopyCurrentUserNameAndDisplayHandle_block_invoke_3;
    v13[3] = &unk_1E3DA5308;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v10, "copyCurrentUserNameAndDisplayHandleWithReply:", v13);

    v11 = v17;
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRSharingCopyCurrentUserNameAndDisplayHandle", 1462);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      BRSharingCopyCurrentUserIdentifier_cold_1();

  }
}

void BRSharingCopyCurrentUserNameAndDisplayHandleForURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  BRShareCopyCurrentUserNameAndDisplayHandleOperation *v6;

  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = -[BRShareOperation initWithURL:]([BRShareCopyCurrentUserNameAndDisplayHandleOperation alloc], "initWithURL:", v3);
    -[BRShareCopyCurrentUserNameAndDisplayHandleOperation setShareUserNameCompletionBlock:](v6, "setShareUserNameCompletionBlock:", v4);
    objc_msgSend(v5, "addOperation:", v6);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRSharingCopyCurrentUserNameAndDisplayHandleForURL", 1480);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = (BRShareCopyCurrentUserNameAndDisplayHandleOperation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super.super.super.super, (os_log_type_t)0x90u))
      BRSharingCopyCurrentUserNameAndDisplayHandleForURL_cold_1();
  }

}

id BRSharingCreateShareForItemAtURL(void *a1, BRShareCreateShareOperation **a2)
{
  id v3;
  BRShareCreateShareOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v15;
  const char *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  BRShareCreateShareOperation *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    v4 = -[BRShareOperation initWithURL:]([BRShareCreateShareOperation alloc], "initWithURL:", v3);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__3;
    *(_QWORD *)&v35 = __Block_byref_object_dispose__3;
    *((_QWORD *)&v35 + 1) = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__3;
    v22 = __Block_byref_object_dispose__3;
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __BRSharingCreateShareForItemAtURL_block_invoke;
    v17[3] = &unk_1E3DA5330;
    v17[4] = buf;
    v17[5] = &v18;
    -[BRShareCreateShareOperation setShareCreateCompletionBlock:](v4, "setShareCreateCompletionBlock:", v17);
    v5 = (void *)objc_opt_new();
    v32 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperations:waitUntilFinished:", v6, 1);

    v7 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (!v7)
    {
      v8 = (id)v19[5];
      if (v8)
      {
        brc_bread_crumbs((uint64_t)"BRSharingCreateShareForItemAtURL", 1512);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        {
          v16 = "(passed to caller)";
          *(_DWORD *)v24 = 136315906;
          v25 = "BRSharingCreateShareForItemAtURL";
          v26 = 2080;
          if (!a2)
            v16 = "(ignored by caller)";
          v27 = v16;
          v28 = 2112;
          v29 = v8;
          v30 = 2112;
          v31 = v9;
          _os_log_error_impl(&dword_19CBF0000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v24, 0x2Au);
        }

      }
      if (a2)
        *a2 = (BRShareCreateShareOperation *)objc_retainAutorelease(v8);

      v7 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    v11 = v7;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("fileURL"), 0);
    v4 = (BRShareCreateShareOperation *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      brc_bread_crumbs((uint64_t)"BRSharingCreateShareForItemAtURL", 1494);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        v15 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "BRSharingCreateShareForItemAtURL";
        *(_WORD *)&buf[12] = 2080;
        if (!a2)
          v15 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        v34 = (uint64_t (*)(uint64_t, uint64_t))v4;
        LOWORD(v35) = 2112;
        *(_QWORD *)((char *)&v35 + 2) = v12;
        _os_log_error_impl(&dword_19CBF0000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a2)
    {
      v4 = objc_retainAutorelease(v4);
      v11 = 0;
      *a2 = v4;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

void sub_19CC1B298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 144), 8);
  _Unwind_Resume(a1);
}

id BRSharingCreateShareForItemWithIdentifier(void *a1, BRShareCreateShareOperation **a2)
{
  id v3;
  BRShareCreateShareOperation *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v15;
  const char *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  BRShareCreateShareOperation *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    v4 = -[BRShareOperation initWithItemIdentifier:]([BRShareCreateShareOperation alloc], "initWithItemIdentifier:", v3);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__3;
    *(_QWORD *)&v35 = __Block_byref_object_dispose__3;
    *((_QWORD *)&v35 + 1) = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__3;
    v22 = __Block_byref_object_dispose__3;
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __BRSharingCreateShareForItemWithIdentifier_block_invoke;
    v17[3] = &unk_1E3DA5330;
    v17[4] = buf;
    v17[5] = &v18;
    -[BRShareCreateShareOperation setShareCreateCompletionBlock:](v4, "setShareCreateCompletionBlock:", v17);
    v5 = (void *)objc_opt_new();
    v32 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperations:waitUntilFinished:", v6, 1);

    v7 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (!v7)
    {
      v8 = (id)v19[5];
      if (v8)
      {
        brc_bread_crumbs((uint64_t)"BRSharingCreateShareForItemWithIdentifier", 1540);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        {
          v16 = "(passed to caller)";
          *(_DWORD *)v24 = 136315906;
          v25 = "BRSharingCreateShareForItemWithIdentifier";
          v26 = 2080;
          if (!a2)
            v16 = "(ignored by caller)";
          v27 = v16;
          v28 = 2112;
          v29 = v8;
          v30 = 2112;
          v31 = v9;
          _os_log_error_impl(&dword_19CBF0000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v24, 0x2Au);
        }

      }
      if (a2)
        *a2 = (BRShareCreateShareOperation *)objc_retainAutorelease(v8);

      v7 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    v11 = v7;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("itemID"), 0);
    v4 = (BRShareCreateShareOperation *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      brc_bread_crumbs((uint64_t)"BRSharingCreateShareForItemWithIdentifier", 1522);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        v15 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "BRSharingCreateShareForItemWithIdentifier";
        *(_WORD *)&buf[12] = 2080;
        if (!a2)
          v15 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        v34 = (uint64_t (*)(uint64_t, uint64_t))v4;
        LOWORD(v35) = 2112;
        *(_QWORD *)((char *)&v35 + 2) = v12;
        _os_log_error_impl(&dword_19CBF0000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a2)
    {
      v4 = objc_retainAutorelease(v4);
      v11 = 0;
      *a2 = v4;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

void sub_19CC1B6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 144), 8);
  _Unwind_Resume(a1);
}

void BRSharingBulkCopyShareID(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_queue_t queue;
  id obj;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  _QWORD block[4];
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[7];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v23 = v5;
  queue = v6;
  v22 = v7;
  if (v6 && (v8 = v7) != 0)
  {
    if (objc_msgSend(v5, "count"))
    {
      if (FPIsCloudDocsWithFPFSEnabled())
      {
        v43[0] = 0;
        v43[1] = v43;
        v43[2] = 0x3032000000;
        v43[3] = __Block_byref_object_copy__3;
        v43[4] = __Block_byref_object_dispose__3;
        v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
        v41[0] = 0;
        v41[1] = v41;
        v41[2] = 0x3032000000;
        v41[3] = __Block_byref_object_copy__3;
        v41[4] = __Block_byref_object_dispose__3;
        v42 = 0;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        obj = v5;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v38;
          v11 = MEMORY[0x1E0C809B0];
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v38 != v10)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v13, "_br_itemServiceSyncProxy", v22);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v36[0] = v11;
              v36[1] = 3221225472;
              v36[2] = __BRSharingBulkCopyShareID_block_invoke_2;
              v36[3] = &unk_1E3DA5358;
              v36[4] = v13;
              v36[5] = v41;
              v36[6] = v43;
              objc_msgSend(v14, "copyShareIDWithReply:", v36);

            }
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
          }
          while (v9);
        }

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __BRSharingBulkCopyShareID_block_invoke_3;
        block[3] = &unk_1E3DA5380;
        v33 = v22;
        v34 = v43;
        v35 = v41;
        dispatch_async(v6, block);

        _Block_object_dispose(v41, 8);
        _Block_object_dispose(v43, 8);

      }
      else
      {
        +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __BRSharingBulkCopyShareID_block_invoke_4;
        v29[3] = &unk_1E3DA51A0;
        v19 = queue;
        v30 = v19;
        v20 = v22;
        v31 = v20;
        objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v26[0] = v18;
        v26[1] = 3221225472;
        v26[2] = __BRSharingBulkCopyShareID_block_invoke_6;
        v26[3] = &unk_1E3DA53A8;
        v27 = v19;
        v28 = v20;
        objc_msgSend(v21, "copyBulkShareIDsAtURLs:reply:", v23, v26);

      }
    }
    else
    {
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __BRSharingBulkCopyShareID_block_invoke;
      v45[3] = &unk_1E3DA5150;
      v47 = v8;
      v46 = v5;
      dispatch_async(v6, v45);

    }
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRSharingBulkCopyShareID", 1550);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      BRSharingCopyCurrentUserIdentifier_cold_1();

  }
}

void sub_19CC1BBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t BRIsProcessForcingUbiquity()
{
  return 0;
}

void BRDaemonConnectionInvalidate()
{
  void *v0;
  id v1;

  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invalidate");

  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

uint64_t BRGetMigrationStatusForDSID(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  void *v4;
  NSObject *v5;
  char AppIntegerValue;
  char v7;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)MEMORY[0x1A1AD841C]();
  if (v1)
  {
    objc_msgSend(CFSTR("icloud-drive.account-migration-status."), "stringByAppendingString:", v1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    keyExistsAndHasValidFormat = 0;
    if (!CFPreferencesAppSynchronize((CFStringRef)BRDefaultsDomain))
    {
      brc_bread_crumbs((uint64_t)"BRGetMigrationStatusForDSID", 1665);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v11 = BRDefaultsDomain;
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to synchronize user defaults for %@%@", buf, 0x16u);
      }

    }
    AppIntegerValue = CFPreferencesGetAppIntegerValue(v3, (CFStringRef)BRDefaultsDomain, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      v7 = AppIntegerValue;
      if ((AppIntegerValue + 1) < 3)
      {
LABEL_14:

        goto LABEL_15;
      }
      if ((AppIntegerValue - 2) < 2)
      {
        v7 = 2;
        goto LABEL_14;
      }
      if (AppIntegerValue == 4)
      {
        v7 = 3;
        goto LABEL_14;
      }
    }
    v7 = 0;
    goto LABEL_14;
  }
  v7 = -1;
LABEL_15:
  objc_autoreleasePoolPop(v2);

  return v7;
}

uint64_t BRSetMigrationStatusForDSID(void *a1, uint64_t a2)
{
  return BRSetMigrationStatusForDSIDAndUpdateAccount(a1, a2, 1);
}

uint64_t BRSetMigrationStatusForDSIDAndUpdateAccount(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[3];
  uint8_t buf[4];
  _BYTE v22[14];
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if ((int)BRGetMigrationStatusForDSID(v5) >= (int)a2)
  {
    v12 = 1;
  }
  else
  {
    memset(v20, 0, sizeof(v20));
    __brc_create_section(0, (uint64_t)"BRSetMigrationStatusForDSIDAndUpdateAccount", 1688, v20);
    brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDAndUpdateAccount", 1688);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)v22 = v20[0];
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = a2;
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v6;
      _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx setting migration status %d for %@%@", buf, 0x26u);
    }

    +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "newSyncProxy");

    objc_initWeak(&location, v9);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __BRSetMigrationStatusForDSIDAndUpdateAccount_block_invoke;
    v17[3] = &unk_1E3DA48A8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v9, "setMigrationStatus:forDSID:shouldUpdateAccount:reply:", a2, v5, a3, v17);
    objc_msgSend(v9, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDAndUpdateAccount", 1696);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        objc_msgSend(v9, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v22 = a2;
        *(_WORD *)&v22[4] = 2112;
        *(_QWORD *)&v22[6] = v5;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v13;
        _os_log_error_impl(&dword_19CBF0000, v14, (os_log_type_t)0x90u, "[ERROR] can't set migration status %d for %@: %@%@", buf, 0x26u);

      }
      v12 = 0;
    }
    else
    {
      v12 = 1;
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    __brc_leave_section((uint64_t)v20);
  }

  return v12;
}

void sub_19CC1C2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, char a16)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  __brc_leave_section((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void BRUnsetMigrationStatusForDSIDInPref(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[3];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"BRUnsetMigrationStatusForDSIDInPref", 1705, v9);
  brc_bread_crumbs((uint64_t)"BRUnsetMigrationStatusForDSIDInPref", 1705);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v11 = v9[0];
    v12 = 2112;
    v13 = v1;
    v14 = 2112;
    v15 = v2;
    _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx deleting migration status for dsid %@%@", buf, 0x20u);
  }

  if (v1)
  {
    brc_bread_crumbs((uint64_t)"BRUnsetMigrationStatusForDSIDInPref", 1709);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = (uint64_t)v1;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_19CBF0000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] removing migration status for %@%@", buf, 0x16u);
    }

    objc_msgSend(CFSTR("icloud-drive.account-migration-status."), "stringByAppendingString:", v1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(v6, 0, (CFStringRef)BRDefaultsDomain);
    if (!CFPreferencesAppSynchronize((CFStringRef)BRDefaultsDomain))
    {
      brc_bread_crumbs((uint64_t)"BRUnsetMigrationStatusForDSIDInPref", 1714);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v11 = BRDefaultsDomain;
        v12 = 2112;
        v13 = v7;
        _os_log_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to delete user defaults for %@%@", buf, 0x16u);
      }

    }
  }
  __brc_leave_section((uint64_t)v9);

}

void sub_19CC1C5E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BRSetMigrationStatusForDSIDInPref(void *a1, unsigned int a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[4];
  _BYTE v24[30];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (a2 != 1)
  {
    if (!v3)
    {
      brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1728);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        BRSetMigrationStatusForDSIDInPref_cold_3();

      brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1730);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
        BRSetMigrationStatusForDSIDInPref_cold_2();
      goto LABEL_4;
    }
    v8 = (void *)MEMORY[0x1A1AD841C]();
    objc_msgSend(CFSTR("icloud-drive.account-migration-status."), "stringByAppendingString:", v4);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (a2 == 3)
      v10 = 4;
    else
      v10 = 0;
    if (a2 + 1 >= 4)
      v11 = v10;
    else
      v11 = a2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = BRGetMigrationStatusForDSID(v4);
    if (v13 == a2)
    {
      brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1740);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v24 = a2;
        *(_WORD *)&v24[4] = 2112;
        *(_QWORD *)&v24[6] = v4;
        *(_WORD *)&v24[14] = 2112;
        *(_QWORD *)&v24[16] = v14;
        _os_log_debug_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] not setting status to %d for %@ because that's the current value of the default%@", buf, 0x1Cu);
      }
    }
    else
    {
      if (v13 <= (int)a2)
      {
        brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1746);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v24 = v4;
          *(_WORD *)&v24[8] = 1024;
          *(_DWORD *)&v24[10] = a2;
          *(_WORD *)&v24[14] = 2112;
          *(_QWORD *)&v24[16] = v18;
          _os_log_impl(&dword_19CBF0000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] migration update for %@; status is now %d%@",
            buf,
            0x1Cu);
        }

        objc_msgSend(v4, "description");
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        syslog(5, "migration update for %s; status is now %d", (const char *)objc_msgSend(v20, "UTF8String"), a2);

        CFPreferencesSetAppValue(v9, v12, (CFStringRef)BRDefaultsDomain);
        if (CFPreferencesAppSynchronize((CFStringRef)BRDefaultsDomain))
        {
          v7 = 1;
          goto LABEL_20;
        }
        brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1752);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 1;
        brc_default_log(1);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v24 = BRDefaultsDomain;
          *(_WORD *)&v24[8] = 2112;
          *(_QWORD *)&v24[10] = v14;
          _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to synchronize user defaults for %@%@", buf, 0x16u);
        }
LABEL_19:

LABEL_20:
        objc_autoreleasePoolPop(v8);
        goto LABEL_21;
      }
      v16 = v13;
      brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1743);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v24 = a2;
        *(_WORD *)&v24[4] = 2112;
        *(_QWORD *)&v24[6] = v4;
        *(_WORD *)&v24[14] = 1024;
        *(_DWORD *)&v24[16] = v16;
        *(_WORD *)&v24[20] = 2112;
        *(_QWORD *)&v24[22] = v14;
        _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] not setting status to %d for %@, because it's going backward (old:%d)%@", buf, 0x22u);
      }
    }
    v7 = 0;
    goto LABEL_19;
  }
  brc_bread_crumbs((uint64_t)"BRSetMigrationStatusForDSIDInPref", 1723);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    BRSetMigrationStatusForDSIDInPref_cold_1();
LABEL_4:

  v7 = 0;
LABEL_21:

  return v7;
}

id BRPrimaryiCloudAccountCopyStatus(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  _QWORD v20[3];
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"BRPrimaryiCloudAccountCopyStatus", 1770, v20);
  brc_bread_crumbs((uint64_t)"BRPrimaryiCloudAccountCopyStatus", 1770);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    BRPrimaryiCloudAccountCopyStatus_cold_3();

  v4 = -[BRDaemonConnection initUsingUserLocalDaemonTokenService]([BRDaemonConnection alloc], "initUsingUserLocalDaemonTokenService");
  v5 = (void *)objc_msgSend(v4, "newSyncTokenProxy");
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __BRPrimaryiCloudAccountCopyStatus_block_invoke;
  v18 = &unk_1E3DA5410;
  v6 = v5;
  v19 = v6;
  objc_msgSend(v6, "getPrimaryiCloudAccountStatus:", &v15);
  objc_msgSend(v6, "result", v15, v16, v17, v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs((uint64_t)"BRPrimaryiCloudAccountCopyStatus", 1778);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    BRPrimaryiCloudAccountCopyStatus_cold_2();

  objc_msgSend(v6, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    brc_bread_crumbs((uint64_t)"BRPrimaryiCloudAccountCopyStatus", 1780);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      objc_msgSend(v6, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      BRPrimaryiCloudAccountCopyStatus_cold_1(v13, (uint64_t)v11, (uint64_t)v21, v12);
    }

    if (a1)
    {
      objc_msgSend(v6, "error");
      *a1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v4, "invalidate");

  __brc_leave_section((uint64_t)v20);
  return v7;
}

void sub_19CC1CCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BRGetCloudEnabledStatusForAuditToken(_OWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v14;
  _QWORD v15[4];
  id v16;
  _BYTE buf[32];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newSyncProxy");

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __BRGetCloudEnabledStatusForAuditToken_block_invoke;
  v15[3] = &unk_1E3DA5438;
  v6 = v5;
  v16 = v6;
  v7 = a1[1];
  *(_OWORD *)buf = *a1;
  *(_OWORD *)&buf[16] = v7;
  objc_msgSend(v6, "getApplicationStatusForProcess:reply:", buf, v15);
  objc_msgSend(v6, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    brc_bread_crumbs((uint64_t)"BRGetCloudEnabledStatusForAuditToken", 1811);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      v14 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "BRGetCloudEnabledStatusForAuditToken";
      *(_WORD *)&buf[12] = 2080;
      if (!a2)
        v14 = "(ignored by caller)";
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_19CBF0000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a2)
    *a2 = objc_retainAutorelease(v9);

  v12 = objc_msgSend(v8, "charValue");
  return v12;
}

uint64_t BRGetCloudEnabledStatus(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newSyncProxy");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __BRGetCloudEnabledStatus_block_invoke;
  v12[3] = &unk_1E3DA5438;
  v4 = v3;
  v13 = v4;
  objc_msgSend(v4, "getApplicationStatus:", v12);
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    brc_bread_crumbs((uint64_t)"BRGetCloudEnabledStatus", 1823);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v11 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v15 = "BRGetCloudEnabledStatus";
      v16 = 2080;
      if (!a1)
        v11 = "(ignored by caller)";
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a1)
    *a1 = objc_retainAutorelease(v6);

  v9 = objc_msgSend(v5, "charValue");
  return v9;
}

uint64_t BRCloudDocsCanBeEnabledForCurrentUser()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[3];

  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"BRCloudDocsCanBeEnabledForCurrentUser", 1897, v4);
  brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledForCurrentUser", 1897);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    BRCloudDocsCanBeEnabledForCurrentUser_cold_1();

  if (BRCloudDocsCanBeEnabledForCurrentUser_onceToken != -1)
    dispatch_once(&BRCloudDocsCanBeEnabledForCurrentUser_onceToken, &__block_literal_global_110);
  v2 = BRCloudDocsCanBeEnabledForCurrentUser_canBeEnabled;
  __brc_leave_section((uint64_t)v4);
  return v2;
}

void sub_19CC1D254(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BRHandoffDidReceiveApplicationContinuity(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a1;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newSyncProxy");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __BRHandoffDidReceiveApplicationContinuity_block_invoke;
  v10[3] = &unk_1E3DA47F0;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "didReceiveHandoffRequestForBundleID:reply:", v3, v10);

  objc_msgSend(v6, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (a2 && (v8 & 1) == 0)
  {
    objc_msgSend(v6, "error");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id BRLoggedInUserAccountProperties(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a1;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newSyncProxy");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __BRLoggedInUserAccountProperties_block_invoke;
  v9[3] = &unk_1E3DA5410;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v6, "getLoggedInUserPropertyValuesForKeys:reply:", v3, v9);

  objc_msgSend(v6, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(v6, "error");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

BOOL BRCopyLoggedInUserFirstAndLastName(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("BRLoggedInUserFirstNameKey");
  v9[1] = CFSTR("BRLoggedInUserLastNameKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BRLoggedInUserAccountProperties(v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BRLoggedInUserFirstNameKey"));
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a2)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BRLoggedInUserLastNameKey"));
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 != 0;
}

BOOL BRLoggedInUserHasManagedAppleID(_BYTE *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("BRLoggedInUserHasManagedAppleIDKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BRLoggedInUserAccountProperties(v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BRLoggedInUserHasManagedAppleIDKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *a1 = objc_msgSend(v6, "BOOLValue");

  }
  return v5 != 0;
}

id BRGetLastSyncDateWithError(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newSyncProxy");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __BRGetLastSyncDateWithError_block_invoke;
  v11[3] = &unk_1E3DA5480;
  v4 = v3;
  v12 = v4;
  objc_msgSend(v4, "getLastSyncDateWithReply:", v11);
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    brc_bread_crumbs((uint64_t)"BRGetLastSyncDateWithError", 2028);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v10 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v14 = "BRGetLastSyncDateWithError";
      v15 = 2080;
      if (!a1)
        v10 = "(ignored by caller)";
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a1)
    *a1 = objc_retainAutorelease(v6);

  return v5;
}

id BRGetLocalizedLastSyncWithError(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newSyncProxy");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __BRGetLocalizedLastSyncWithError_block_invoke;
  v11[3] = &unk_1E3DA4D38;
  v4 = v3;
  v12 = v4;
  objc_msgSend(v4, "getLocalizedLastSyncWithReply:", v11);
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    brc_bread_crumbs((uint64_t)"BRGetLocalizedLastSyncWithError", 2041);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v10 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v14 = "BRGetLocalizedLastSyncWithError";
      v15 = 2080;
      if (!a1)
        v10 = "(ignored by caller)";
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a1)
    *a1 = objc_retainAutorelease(v6);

  return v5;
}

uint64_t BRAllowDocumentSharing()
{
  return 1;
}

uint64_t BRAllowFolderSharing()
{
  return 1;
}

id getSharingServiceInterface()
{
  if (getSharingServiceInterface_onceToken != -1)
    dispatch_once(&getSharingServiceInterface_onceToken, &__block_literal_global_114);
  return (id)getSharingServiceInterface_interface;
}

void __getSharingServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE457240);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getSharingServiceInterface_interface;
  getSharingServiceInterface_interface = v0;

}

uint64_t BRIsDefaultDomain(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CAAB40]);

    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

void __br_notify_register_dispatch_block_invoke_2_1()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ICDErrorRetryAfterKey_block_invoke___personalPersona;
  ICDErrorRetryAfterKey_block_invoke___personalPersona = v0;

}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id brc_trace_log()
{
  int v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  uint64_t *v6;

  v0 = *__error();
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentPersona");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDataSeparatedPersona");

  if (+[BRContainerCache isPersonalProvider](BRContainerCache, "isPersonalProvider"))
  {
    if (!v3)
      goto LABEL_6;
    brc_bread_crumbs((uint64_t)"brc_trace_log", 75);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      brc_default_log_cold_1();
  }
  else
  {
    if (((!+[BRContainerCache isManagedProvider](BRContainerCache, "isManagedProvider") | v3) & 1) != 0)
      goto LABEL_6;
    brc_bread_crumbs((uint64_t)"brc_trace_log", 77);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      brc_default_log_cold_2();
  }

LABEL_6:
  if (brc_trace_log_once != -1)
    dispatch_once(&brc_trace_log_once, &__block_literal_global_10);
  *__error() = v0;
  v6 = &brc_trace_log_loggerEnterprise;
  if (!v3)
    v6 = &brc_trace_log_loggerPersonal;
  return (id)*v6;
}

void __brc_trace_log_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.clouddocs", "trace personal");
  v1 = (void *)brc_trace_log_loggerPersonal;
  brc_trace_log_loggerPersonal = (uint64_t)v0;

  v2 = os_log_create("com.apple.clouddocs", "trace enterprise");
  v3 = (void *)brc_trace_log_loggerEnterprise;
  brc_trace_log_loggerEnterprise = (uint64_t)v2;

}

id brc_notifications_log()
{
  int v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  uint64_t *v6;

  v0 = *__error();
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentPersona");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDataSeparatedPersona");

  if (+[BRContainerCache isPersonalProvider](BRContainerCache, "isPersonalProvider"))
  {
    if (!v3)
      goto LABEL_6;
    brc_bread_crumbs((uint64_t)"brc_notifications_log", 97);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      brc_default_log_cold_1();
  }
  else
  {
    if (((!+[BRContainerCache isManagedProvider](BRContainerCache, "isManagedProvider") | v3) & 1) != 0)
      goto LABEL_6;
    brc_bread_crumbs((uint64_t)"brc_notifications_log", 99);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      brc_default_log_cold_2();
  }

LABEL_6:
  if (brc_notifications_log_once != -1)
    dispatch_once(&brc_notifications_log_once, &__block_literal_global_13);
  *__error() = v0;
  v6 = &brc_notifications_log_loggerEnterprise;
  if (!v3)
    v6 = &brc_notifications_log_loggerPersonal;
  return (id)*v6;
}

void __brc_notifications_log_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.clouddocs", "notifications personal");
  v1 = (void *)brc_notifications_log_loggerPersonal;
  brc_notifications_log_loggerPersonal = (uint64_t)v0;

  v2 = os_log_create("com.apple.clouddocs", "notifications enterprise");
  v3 = (void *)brc_notifications_log_loggerEnterprise;
  brc_notifications_log_loggerEnterprise = (uint64_t)v2;

}

uint64_t _brc_log_is_internal_install()
{
  if (_brc_log_is_internal_install_once != -1)
    dispatch_once(&_brc_log_is_internal_install_once, &__block_literal_global_16);
  return _brc_log_is_internal_install_isAppleInternalInstall;
}

uint64_t ___brc_log_is_internal_install_block_invoke()
{
  const void *v0;
  const void *v1;
  BOOL v2;
  uint64_t result;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFEqual(v0, CFSTR("Internal")) != 0;
    CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  result = access("/AppleInternal", 0);
  _brc_log_is_internal_install_isAppleInternalInstall = v2;
  return result;
}

uint64_t _brc_create_simulate_crash_message()
{
  if (_brc_log_is_internal_install_once != -1)
    dispatch_once(&_brc_log_is_internal_install_once, &__block_literal_global_16);
  return 0;
}

void _brc_assert_failure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  int v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  id v18;
  void (__cdecl *v19)(int);
  void *v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BYTE *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[8192];
  uint64_t v32;

  v9 = MEMORY[0x1E0C80A78]();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v9;
  v32 = *MEMORY[0x1E0C80C00];
  v18 = v17;
  v19 = signal(6, 0);
  MEMORY[0x1A1AD841C](v19);
  brc_backtrace_detailed_snprint(v31, 0x2000, 3);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v18, &a9);
  brc_bread_crumbs((uint64_t)v15, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 136315906;
    v24 = v16;
    v25 = 2112;
    v26 = v20;
    v27 = 2080;
    v28 = v31;
    v29 = 2112;
    v30 = v21;
    _os_log_error_impl(&dword_19CBF0000, v22, (os_log_type_t)0x90u, "[ERROR] %s%@\n%s%@", buf, 0x2Au);
  }

  __assert_rtn(v15, v13, v11, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
}

void abc_report_assert_with_signature(unint64_t *a1, void *a2)
{
  id v3;
  time_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = time(0);
    v5 = atomic_load(a1);
    v6 = v4 - v5;
    v7 = a1 + 1;
    if (v6 <= 3599)
    {
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 + 1, v7));
      if (v8 > 5)
        goto LABEL_18;
    }
    else
    {
      atomic_store(1uLL, v7);
    }
    atomic_store(v4, a1);
  }
  signature_from_format_and_subtype(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_brc_log_is_internal_install_once != -1)
    dispatch_once(&_brc_log_is_internal_install_once, &__block_literal_global_16);
  if (_brc_log_is_internal_install_isAppleInternalInstall)
    brc_backtrace();
  else
    brc_backtrace_non_detailed_but_fast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  get_sd_reporter();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("backtrace");
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "snapshotWithSignature:duration:event:payload:reply:", v9, v12, 0, &__block_literal_global_28_0, 15.0);

  if ((v13 & 1) != 0)
  {
    brc_bread_crumbs((uint64_t)"abc_report_assert_with_signature", 242);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      abc_report_assert_with_signature_cold_1();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"abc_report_assert_with_signature", 240);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      abc_report_assert_with_signature_cold_2();
  }

LABEL_18:
}

id signature_from_format_and_subtype(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") >= 0x65)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":0x%lx"), objc_msgSend(v1, "hash"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "substringToIndex:", 100 - objc_msgSend(v2, "length"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v2);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v4;
  }
  get_sd_reporter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("Application"), CFSTR("Functional"), CFSTR("AssertionFailed"), CFSTR("bird"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0DB00F0]);
  return v6;
}

id get_sd_reporter()
{
  if (get_sd_reporter_onceToken != -1)
    dispatch_once(&get_sd_reporter_onceToken, &__block_literal_global_53);
  return (id)get_sd_reporter__diagnosticReporter;
}

void __abc_report_assert_with_signature_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  brc_bread_crumbs((uint64_t)"abc_report_assert_with_signature_block_invoke", 238);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __abc_report_assert_with_signature_block_invoke_cold_1();

}

void abc_report_panic_with_signature(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  signature_from_format_and_subtype(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_backtrace();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  get_sd_reporter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("backtrace");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "snapshotWithSignature:duration:event:payload:reply:", v2, v5, 0, 0, 1.0);

  if ((v6 & 1) != 0)
  {
    brc_bread_crumbs((uint64_t)"abc_report_panic_with_signature", 255);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      abc_report_panic_with_signature_cold_1();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"abc_report_panic_with_signature", 253);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      abc_report_panic_with_signature_cold_2();
  }

}

__CFString *BRCPrettyPrintBitmap(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 255);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a2[1];
  if (v5)
  {
    v6 = a2;
    do
    {
      v8 = *v6;
      v6 += 2;
      v7 = v8;
      if ((v8 & ~a1) == 0)
      {
        if (v7)
          v9 = 1;
        else
          v9 = a1 == 0;
        if (v9)
        {
          objc_msgSend(v4, "appendFormat:", CFSTR("%s|"), v5);
          a1 ^= v7;
        }
      }
      v5 = a2[3];
      a2 = v6;
    }
    while (v5);
  }
  if (a1)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("0x%llx"), a1);
  }
  else
  {
    if (!objc_msgSend(v4, "length"))
    {
      v10 = &stru_1E3DA8AC8;
      goto LABEL_16;
    }
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  }
  v10 = v4;
LABEL_16:

  return v10;
}

const char *BRCPrettyPrintEnum(uint64_t a1, _QWORD *a2)
{
  const char *result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  result = (const char *)a2[1];
  if (!result)
    return "<unknown>";
  if (*a2 != a1)
  {
    v4 = a2 + 3;
    result = "<unknown>";
    while (1)
    {
      v5 = *v4;
      if (!*v4)
        break;
      v6 = *(v4 - 1);
      v4 += 2;
      if (v6 == a1)
        return (const char *)v5;
    }
  }
  return result;
}

id brc_append_system_info_to_message(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  int v7;
  char *v8;
  int *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  rlimit v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:", CFSTR("\n\n"));
  v2 = v1;
  v38.rlim_cur = 0;
  v38.rlim_max = 0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR(" LIMITS "), "stringByPaddingToLength:withString:startingAtIndex:", 80, CFSTR("-"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n%@\n\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "appendString:", v5);
  for (i = 0; i != 8; ++i)
  {
    v7 = getrlimit(dword_19CC7D9EC[i], &v38);
    v8 = off_1E3DA55F8[i];
    if (v7)
    {
      v9 = __error();
      objc_msgSend(v2, "appendFormat:", CFSTR("%s(%s)\n"), v8, strerror(*v9));
    }
    else
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("%s\t\t\t"), off_1E3DA55F8[i]);
      if (v38.rlim_cur == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v2, "appendString:", CFSTR("    infinity"));
      else
        objc_msgSend(v2, "appendFormat:", CFSTR("%12llu"), v38.rlim_cur);
      if (v38.rlim_max == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v2, "appendString:", CFSTR("    infinity"));
      else
        objc_msgSend(v2, "appendFormat:", CFSTR("%12llu"), v38.rlim_max);
      objc_msgSend(v2, "appendString:", CFSTR("\n"));
    }
  }

  NSHomeDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("Library/Mobile Documents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v2;
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" DISK  (%@)"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByPaddingToLength:withString:startingAtIndex:", 80, CFSTR("-"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("\n%@\n\n"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v17, "attributesOfFileSystemForPath:error:", v11, &v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v37;

  objc_msgSend(v12, "appendString:", v16);
  if (v18)
  {
    v29 = v19;
    v30 = v16;
    v31 = v11;
    v32 = v10;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, &v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v25, "stringByPaddingToLength:withString:startingAtIndex:", 21, CFSTR(" "), 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendFormat:", CFSTR("%@\t%12llu\n"), v26, objc_msgSend(v27, "unsignedLongLongValue"));

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, &v38, 16);
      }
      while (v22);
    }

    v11 = v31;
    v10 = v32;
    v19 = v29;
    v16 = v30;
  }
  else
  {
    objc_msgSend(v12, "appendFormat:", CFSTR("%@\n"), v19);
  }

  return v12;
}

id BRLocalizedFileSizeDescription(uint64_t a1)
{
  void *v1;
  void *v2;

  if (a1 < 0)
  {
    NSLocalizedFileSizeDescription();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("-"), "stringByAppendingString:", v2);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSLocalizedFileSizeDescription();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id BRLocalizedFileSizeDescriptionWithExactCount(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (a1 < 1000)
  {
    BRLocalizedFileSizeDescription(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    BRLocalizedFileSizeDescription(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%lld)"), v3, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __get_sd_reporter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  v1 = (void *)get_sd_reporter__diagnosticReporter;
  get_sd_reporter__diagnosticReporter = (uint64_t)v0;

}

uint64_t BRMakeiWorkSharingOptions(int a1, int a2)
{
  unsigned int v2;

  if (a2)
    v2 = 3;
  else
    v2 = 1;
  if (a1)
    return v2;
  else
    return 0;
}

void sub_19CC1F830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19CC1FA24(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t offsetOfPackageRootFilenameInPath(void *a1, _QWORD *a2)
{
  id v3;
  char *v4;
  char *v5;
  _BYTE *v6;
  uint64_t v7;
  size_t v8;
  const char *v9;
  unint64_t v10;
  char *v11;
  const char *v12;
  const char *v13;
  void *v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  const char *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  size_t v39;
  uint64_t v40;
  _BYTE *v42;
  id v43;
  _QWORD *v44;
  uint64_t v45;
  char *v46;
  id v47;
  id v48;
  char *__stringp;
  char v50;
  _BYTE v51[7];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (objc_msgSend(v3, "length"))
  {
    v44 = a2;
    v4 = &v50;
    v5 = v51;
    v6 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
    v50 = 47;
    v7 = __strlcpy_chk();
    v42 = v6;
    v43 = v3;
    if ((unint64_t)(v7 + 2) >= 0x400)
    {
      v8 = v7 + 1;
      v4 = (char *)malloc_type_malloc(v7 + 2, 0xF93F926CuLL);
      *v4 = 47;
      v5 = v4 + 1;
      memcpy(v4 + 1, v6, v8);
    }
    v9 = "/";
    __stringp = v5;
    v10 = 0x1E0CB3000uLL;
    v45 = *MEMORY[0x1E0C99A00];
    v46 = v4;
    do
    {
      v11 = strsep(&__stringp, v9);
      *(v11 - 1) = 47;
      v12 = extensionInFilename(v11);
      if (v12)
      {
        v13 = v12;
        objc_msgSend(*(id *)(v10 + 2368), "stringWithUTF8String:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "brc_isBlacklistedPackageExtension") & 1) == 0)
        {
          if ((objc_msgSend(v14, "brc_isForcedPackageExtension") & 1) != 0
            || !strcasecmp(v13, "key")
            || !strcasecmp(v13, "key-tef")
            || !strcasecmp(v13, "pages")
            || !strcasecmp(v13, "pages-tef")
            || !strcasecmp(v13, "numbers")
            || !strcasecmp(v13, "numbers-tef")
            || !strcasecmp(v13, "band")
            || !strcasecmp(v13, "rtfd")
            || !strcasecmp(v13, "app")
            || !strcasecmp(v13, "bundle")
            || !strcasecmp(v13, "pkg")
            || !strcasecmp(v13, "logarchive"))
          {
            goto LABEL_46;
          }
          v15 = atomic_load((unsigned int *)&packageRootFilenameInPath_root_fd);
          if (v15 < 0)
          {
            v16 = open(v9, 33028);
            if ((v16 & 0x80000000) == 0)
            {
              v17 = v16;
              do
                v18 = __ldaxr((unsigned int *)&packageRootFilenameInPath_root_fd);
              while (__stlxr(v17, (unsigned int *)&packageRootFilenameInPath_root_fd));
              if ((v18 & 0x80000000) == 0)
                close(v18);
            }
            v15 = atomic_load((unsigned int *)&packageRootFilenameInPath_root_fd);
          }
          if ((fcntl(v15, 52, v11 - 1) & 0x80000000) == 0)
          {
            v32 = v10;
            brc_bread_crumbs((uint64_t)"packageRootFilenameInPath", 412);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              offsetOfPackageRootFilenameInPath_cold_1();

            v10 = v32;
            v35 = *(void **)(v32 + 2368);
            objc_msgSend(v35, "stringWithUTF8String:", v13);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "brc_addForcedPackageExtension:", v23);
            goto LABEL_45;
          }
          v19 = v9;
          v20 = (void *)MEMORY[0x1E0C99E98];
          v21 = v10;
          objc_msgSend(*(id *)(v10 + 2368), "stringWithUTF8String:", v4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "fileURLWithPath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = 0;
          v48 = 0;
          v24 = objc_msgSend(v23, "getResourceValue:forKey:error:", &v48, v45, &v47);
          v25 = v48;
          v26 = v47;
          v27 = v26;
          if ((v24 & 1) != 0)
          {
            if ((objc_msgSend(v25, "BOOLValue") & 1) != 0)
            {
              v36 = v21;
              v37 = *(void **)(v21 + 2368);
              objc_msgSend(v37, "stringWithUTF8String:", v13);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "brc_addForcedPackageExtension:", v38);

              v10 = v36;
LABEL_45:

              v4 = v46;
LABEL_46:

              v39 = strlen(v11);
              v40 = &v11[v39] - (v4 + 1);
              if (v44)
              {
                *(_WORD *)&v11[v39] = 47;
                objc_msgSend(*(id *)(v10 + 2368), "br_pathWithFileSystemRepresentation:");
                *v44 = (id)objc_claimAutoreleasedReturnValue();
              }
              if (v42[v40] == 47)
                v31 = v40 + 1;
              else
                v31 = v40;
              goto LABEL_51;
            }
          }
          else if ((objc_msgSend(v26, "br_isCocoaErrorCode:", 260) & 1) == 0)
          {
            brc_bread_crumbs((uint64_t)"packageRootFilenameInPath", 424);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v23, "path");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v53 = v30;
              v54 = 2112;
              v55 = v27;
              v56 = 2112;
              v57 = v28;
              _os_log_impl(&dword_19CBF0000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] can't get whether %@ is a package: %@%@", buf, 0x20u);

            }
          }

          v10 = v21;
          v9 = v19;
          v4 = v46;
        }

      }
    }
    while (__stringp);
    if (v44)
      *v44 = 0;
    v31 = -1;
LABEL_51:
    v3 = v43;
    if (v4 != &v50)
      free(v4);
  }
  else
  {
    v31 = -1;
  }

  return v31;
}

void sub_19CC212E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, __int128 a10, uint64_t a11)
{
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  if (a2 == 1)
  {
    v12 = objc_begin_catch(exception_object);
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C99778]);

    if (v14)
    {
      brc_bread_crumbs((uint64_t)"-[NSString(BRPathAdditions) _br_safeFileSystemRepresentationWithDefaultValue:]", 600);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "reason");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        a9 = 138412802;
        WORD2(a10) = 2112;
        *(_QWORD *)((char *)&a10 + 6) = v17;
        HIWORD(a10) = 2112;
        a11 = (uint64_t)v15;
        _os_log_debug_impl(&dword_19CBF0000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Could not convert %@ to fileSystemRepresentation for reason: %@ --> use bad filename alternative name instead%@", (uint8_t *)&a9, 0x20u);

      }
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");

      objc_end_catch();
      JUMPOUT(0x19CC212ACLL);
    }
    brc_bread_crumbs((uint64_t)"-[NSString(BRPathAdditions) _br_safeFileSystemRepresentationWithDefaultValue:]", 603);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[NSString(BRPathAdditions) _br_safeFileSystemRepresentationWithDefaultValue:].cold.1();

    objc_exception_throw(objc_retainAutorelease(v12));
  }
  _Unwind_Resume(exception_object);
}

void sub_19CC22708(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC22F98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getHomeDirectoryForUser(uid_t a1)
{
  uint64_t v2;
  size_t v3;
  BOOL v4;
  int v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  passwd *v13;
  passwd v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (sysconf(71) == -1)
  {
    v8 = *__error();
    brc_bread_crumbs((uint64_t)"getHomeDirectoryForUser", 1071);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      getHomeDirectoryForUser_cold_1(v8);

    return 0;
  }
  v2 = MEMORY[0x1E0C80A78]();
  memset(&v14, 0, sizeof(v14));
  v13 = 0;
  if (getpwuid_r(a1, &v14, (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3, &v13))
    v4 = 1;
  else
    v4 = v13 == 0;
  if (v4)
  {
    v5 = *__error();
    brc_bread_crumbs((uint64_t)"getHomeDirectoryForUser", 1079);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      getHomeDirectoryForUser_cold_2(v5);

    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v14.pw_dir);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t _br_parseUUIDString(void *a1, unsigned __int8 *a2)
{
  uint64_t result;
  char __s[256];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1, "getCString:maxLength:encoding:", __s, 256, 4);
  if ((_DWORD)result)
    return strlen(__s) == 36 && uuid_parse(__s, a2) == 0;
  return result;
}

uint64_t __fileSystemSizeForDirectoryAtPath_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  brc_bread_crumbs((uint64_t)"fileSystemSizeForDirectoryAtPath_block_invoke", 230);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138413058;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v7;
    _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] error enumerating %@: error %@ at %@%@", (uint8_t *)&v11, 0x2Au);
  }

  return 1;
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_19CC2362C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BRNotifyNameForAccountDidUpgradeToCloudDriveNotification()
{
  return objc_msgSend(CFSTR("CloudDocs.AccountDidUpgradeToCloudDrive"), "br_libnotifyPerUserNotificationName");
}

uint64_t BRNotifyNameForAccountDidStartUsingUbiquityNotification()
{
  return objc_msgSend(CFSTR("CloudDocs.AccountUseUbiquity"), "br_libnotifyPerUserNotificationName");
}

void sub_19CC23E00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC2407C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC244AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  void *v24;

  objc_sync_exit(v24);
  __brc_leave_section((uint64_t)&a24);
  _Unwind_Resume(a1);
}

id notifyNameWithPrefixedContainerID(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.clouddocs.")) & 1) != 0)
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.clouddocs."), "length"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRUnprefixedContainerID", 39);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      notifyNameWithPrefixedContainerID_cold_1();

    v2 = 0;
  }

  BRNotifyNameForForegroundChangeWithContainerID(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_19CC246FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_2_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke___personalPersona;
  _block_invoke___personalPersona = v0;

}

void sub_19CC25098(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC25374(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC256FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

id BRGetFileNameFromServerInfoBlob(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  BRServerInfoRecordInfo *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v20;
  const char *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("serverInfoBase64Blob"), v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      brc_bread_crumbs((uint64_t)"BRGetFileNameFromServerInfoBlob", 28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v23 = "BRGetFileNameFromServerInfoBlob";
        v24 = 2080;
        if (!a2)
          v20 = "(ignored by caller)";
        v25 = v20;
        v26 = 2112;
        v27 = v6;
        v28 = 2112;
        v29 = v14;
        _os_log_error_impl(&dword_19CBF0000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a2)
    {
      v6 = objc_retainAutorelease(v6);
      v13 = 0;
      *a2 = v6;
      goto LABEL_16;
    }
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v5 = -[BRServerInfoRecordInfo initWithData:]([BRServerInfoRecordInfo alloc], "initWithData:", v4);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("serverInfoBase64Blob"), v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      brc_bread_crumbs((uint64_t)"BRGetFileNameFromServerInfoBlob", 33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v23 = "BRGetFileNameFromServerInfoBlob";
        v24 = 2080;
        if (!a2)
          v21 = "(ignored by caller)";
        v25 = v21;
        v26 = 2112;
        v27 = v16;
        v28 = 2112;
        v29 = v17;
        _os_log_error_impl(&dword_19CBF0000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a2)
      *a2 = objc_retainAutorelease(v16);

    goto LABEL_15;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[BRServerInfoRecordInfo zoneName](v5, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@/BRGetFileNameFromServerInfoBlob"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "br_documentURLFromBookmarkableString:error:", v11, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v13;
}

void BRPerformWithPersonaAndErrorForURLIfAble(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, void *, uint64_t, uint64_t, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, void *, uint64_t, uint64_t, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (+[BRAccountDescriptor mightHaveDataSeparatedAccountDescriptor](BRAccountDescriptor, "mightHaveDataSeparatedAccountDescriptor"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_currentPersonaIDWithIsDataSeparated:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v5, 0)
      || objc_msgSend(v5, "isEqualToString:", CFSTR("__defaultPersonaID__"))
      && (objc_msgSend(v3, "br_mightBeOnDataSeparatedVolume") & 1) == 0)
    {
      v4[2](v4, v5, 1, 1, 0);
    }
    else
    {
      +[BRAccountDescriptor allLoggedInAccountDescriptors](BRAccountDescriptor, "allLoggedInAccountDescriptors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v6, "count") > 1
        || (objc_msgSend(v6, "firstObject"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "isDataSeparated"),
            v7,
            v8))
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v20 = v6;
        v9 = v6;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v14, "personaIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v5, "isEqualToString:", v15);

              if ((v16 & 1) == 0)
              {
                objc_msgSend(v14, "personaIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v3, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v17, 1);

                if (v18)
                {
                  v21[0] = MEMORY[0x1E0C809B0];
                  v21[1] = 3221225472;
                  v21[2] = __BRPerformWithPersonaAndErrorForURLIfAble_block_invoke;
                  v21[3] = &unk_1E3DA57F8;
                  v21[4] = v14;
                  v22 = v4;
                  BRPerformWithAccountDescriptorAndError(v14, v21);

                  v6 = v20;
                  goto LABEL_22;
                }
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v11)
              continue;
            break;
          }
        }

        v19 = 1;
        v6 = v20;
      }
      else
      {
        v19 = 0;
      }
      v4[2](v4, v5, v19, 0, 0);
LABEL_22:

    }
  }
  else
  {
    v4[2](v4, CFSTR("__defaultPersonaID__"), 0, 0, 0);
  }

}

uint64_t BRCurrentPersonaIsDataSeparated()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentPersona");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isDataSeparatedPersona");

  return v2;
}

uint64_t BRCurrentPersonaIdentifierLoggingString()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentPersona");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "userPersonaUniqueString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isDataSeparatedPersona"))
    v3 = CFSTR("-enterprise");
  else
    v3 = CFSTR("-personal");
  objc_msgSend(v2, "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "UTF8String");

  return v6;
}

id initCKCurrentUserDefaultName()
{
  void *v0;
  void *v1;
  NSObject *v2;
  id *v3;
  int v5;
  char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)CloudKitLibrary_frameworkLibrary_0;
  if (!CloudKitLibrary_frameworkLibrary_0)
  {
    v0 = dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
    CloudKitLibrary_frameworkLibrary_0 = (uint64_t)v0;
    if (!v0)
    {
      brc_bread_crumbs((uint64_t)"CloudKitLibrary", 17);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315394;
        v6 = dlerror();
        v7 = 2112;
        v8 = v1;
        _os_log_impl(&dword_19CBF0000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open CloudKit : %s%@", (uint8_t *)&v5, 0x16u);
      }

      v0 = (void *)CloudKitLibrary_frameworkLibrary_0;
    }
  }
  v3 = (id *)dlsym(v0, "CKCurrentUserDefaultName");
  if (!v3)
    initCKCurrentUserDefaultName_cold_1();
  objc_storeStrong((id *)&constantCKCurrentUserDefaultName, *v3);
  getCKCurrentUserDefaultName = (uint64_t (*)())CKCurrentUserDefaultNameFunction;
  return (id)constantCKCurrentUserDefaultName;
}

id CKCurrentUserDefaultNameFunction()
{
  return (id)constantCKCurrentUserDefaultName;
}

void BRFetchCollaborationIdentifierForItemWithIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v3 = a1;
  v4 = a2;
  if ((FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"BRFetchCollaborationIdentifierForItemWithIdentifier", 23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      BRFetchCollaborationIdentifierForItemWithIdentifier_cold_2((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

  }
  brc_bread_crumbs((uint64_t)"BRFetchCollaborationIdentifierForItemWithIdentifier", 24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    BRFetchCollaborationIdentifierForItemWithIdentifier_cold_1();

  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __BRFetchCollaborationIdentifierForItemWithIdentifier_block_invoke;
  v23[3] = &unk_1E3DA48F8;
  v9 = v4;
  v24 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRFileObjectID fileObjectIDWithString:](BRFileObjectID, "fileObjectIDWithString:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __BRFetchCollaborationIdentifierForItemWithIdentifier_block_invoke_2;
  v21[3] = &unk_1E3DA5820;
  v22 = v9;
  v12 = v9;
  objc_msgSend(v10, "copyCollaborationIdentifierForFileObjectID:reply:", v11, v21);

}

void BRFetchCollaborationIdentifierForItemAtURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v3 = a1;
  v4 = a2;
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    brc_bread_crumbs((uint64_t)"BRFetchCollaborationIdentifierForItemAtURL", 36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      BRFetchCollaborationIdentifierForItemAtURL_cold_2((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

  }
  brc_bread_crumbs((uint64_t)"BRFetchCollaborationIdentifierForItemAtURL", 37);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    BRFetchCollaborationIdentifierForItemAtURL_cold_1(v3, (uint64_t)v5, v6);

  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __BRFetchCollaborationIdentifierForItemAtURL_block_invoke;
  v22[3] = &unk_1E3DA48F8;
  v9 = v4;
  v23 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __BRFetchCollaborationIdentifierForItemAtURL_block_invoke_2;
  v20[3] = &unk_1E3DA5820;
  v21 = v9;
  v11 = v9;
  objc_msgSend(v10, "copyCollaborationIdentifierForItemAtURL:reply:", v3, v20);

}

void BRFetchCKShareForItemAtURL(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  BRShareCopyOperation *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__4;
  v16[4] = __Block_byref_object_dispose__4;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__4;
  v14[4] = __Block_byref_object_dispose__4;
  v15 = 0;
  brc_bread_crumbs((uint64_t)"BRFetchCKShareForItemAtURL", 53);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    BRFetchCKShareForItemAtURL_cold_1();

  v8 = -[BRShareCopyOperation initWithURL:]([BRShareCopyOperation alloc], "initWithURL:", v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __BRFetchCKShareForItemAtURL_block_invoke;
  v10[3] = &unk_1E3DA5848;
  v12 = v14;
  v13 = v16;
  v9 = v4;
  v11 = v9;
  -[BRShareCopyOperation setRootShareCopyCompletionBlock:](v8, "setRootShareCopyCompletionBlock:", v10);
  objc_msgSend(v5, "addOperation:", v8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

}

void sub_19CC27E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19CC28338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19CC285D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC28EAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC292AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19CC29EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

void sub_19CC2AD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC2B248(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC2B884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void dispatch_async_with_logs(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  const char *label;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _BYTE buf[24];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1A1AD841C]();
  v17 = 0uLL;
  v18 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v17);
  brc_bread_crumbs((uint64_t)"dispatch_async_with_logs", 262);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = v17;
    label = dispatch_queue_get_label(v3);
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = label;
    *(_WORD *)&buf[22] = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", buf, 0x20u);
  }

  *(_QWORD *)&buf[16] = v18;
  *(_OWORD *)buf = v17;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __dispatch_async_with_logs_block_invoke_0;
  v12[3] = &unk_1E3DA4A98;
  v15 = v17;
  v16 = v18;
  v8 = v3;
  v13 = v8;
  v9 = v4;
  v14 = v9;
  dispatch_async(v8, v12);

  objc_autoreleasePoolPop(v5);
}

void sub_19CC2BEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC2C334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void __br_notify_register_dispatch_block_invoke_2_3()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_2___personalPersona;
  _block_invoke_2___personalPersona = v0;

}

void __dispatch_async_with_logs_block_invoke_0(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *label;
  __int128 v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs((uint64_t)"dispatch_async_with_logs_block_invoke", 264);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32));
    *(_DWORD *)buf = 134218498;
    v8 = v5;
    v9 = 2080;
    v10 = label;
    v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx continuing on %s%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __brc_leave_section((uint64_t)&v5);
}

void sub_19CC2C66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __brc_leave_section((uint64_t)&a9);
  _Unwind_Resume(a1);
}

__CFString *BRQueryItemFieldsPrettyPrint(unsigned int a1)
{
  if (a1 == 0xFFFF)
    return CFSTR("all");
  BRCPrettyPrintBitmap(a1, br_notifs_fields_entries);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id _getContentTypeValue(void *a1, char a2)
{
  id v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *PreferredIdentifierForTag;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;

  v3 = a1;
  if (objc_msgSend(v3, "isDirectory"))
  {
    v4 = (id *)MEMORY[0x1E0CEC4F0];
LABEL_7:
    objc_msgSend(*v4, "identifier");
    PreferredIdentifierForTag = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isFinderBookmark"))
  {
    v4 = (id *)MEMORY[0x1E0CEC428];
    goto LABEL_7;
  }
  v5 = objc_msgSend(v3, "isSymlink");
  if ((_DWORD)v5)
  {
    v4 = (id *)MEMORY[0x1E0CEC5F8];
    goto LABEL_7;
  }
  if (BRIsFPFSEnabled(v5, v6) && (a2 & 1) == 0)
  {
    if (objc_msgSend(v3, "isPackage"))
    {
      v4 = (id *)MEMORY[0x1E0CEC588];
    }
    else
    {
      objc_msgSend(v3, "isDocument");
      v4 = (id *)MEMORY[0x1E0CEC4A0];
    }
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isPackage"))
  {
    v9 = (const __CFString *)*MEMORY[0x1E0CA5C18];
  }
  else
  {
    v9 = (const __CFString *)*MEMORY[0x1E0CA5BA0];
    if (objc_msgSend(v3, "isDocument"))
      v9 = (const __CFString *)*MEMORY[0x1E0CA5B20];
  }
  objc_msgSend(v3, "logicalName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "br_pathExtension");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E3DA8AC8;
  if (v11)
    v13 = (__CFString *)v11;
  v14 = v13;

  if (-[__CFString rangeOfString:](v14, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("tar.gz")) & 1) != 0)
    {
      v15 = CFSTR("tgz");
    }
    else
    {
      -[__CFString pathExtension](v14, "pathExtension");
      v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }

    v14 = (__CFString *)v15;
  }
  PreferredIdentifierForTag = (void *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v14, v9);

LABEL_8:
  return PreferredIdentifierForTag;
}

uint64_t _getIsDownloading(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;

  v1 = a1;
  if ((objc_msgSend(v1, "isNetworkOffline") & 1) != 0)
    goto LABEL_4;
  v2 = objc_msgSend(v1, "br_downloadStatus");
  if (!v2)
  {
    v3 = 0;
    goto LABEL_9;
  }
  if (v2 == 3)
  {
LABEL_4:
    v3 = MEMORY[0x1E0C9AAA0];
  }
  else
  {
    objc_msgSend(v1, "isDownloadRequested");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    v3 = MEMORY[0x1E0C9AAA0];
    if (v5)
    {
      objc_msgSend(v1, "attributeForKey:", CFSTR("dlErr"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        v3 = MEMORY[0x1E0C9AAB0];
    }
  }
LABEL_9:

  return v3;
}

uint64_t _getIsUploading(void *a1)
{
  id v1;
  char v2;
  uint64_t v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v1 = a1;
  v2 = objc_msgSend(v1, "isNetworkOffline");
  v3 = MEMORY[0x1E0C9AAA0];
  if ((v2 & 1) == 0)
  {
    v4 = objc_msgSend(v1, "br_uploadStatus");
    if ((v4 - 1) < 2)
    {
      objc_msgSend(v1, "attributeForKey:", CFSTR("ulErr"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        v3 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      if (!v4)
      {
LABEL_8:
        v3 = 0;
        goto LABEL_11;
      }
      if (v4 != 3)
      {
        brc_bread_crumbs((uint64_t)"_getIsUploading", 402);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          __25__BRQueryItem_initialize__block_invoke_18_cold_1();

        goto LABEL_8;
      }
    }
  }
LABEL_11:

  return v3;
}

void sub_19CC2DA00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC2E2FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC2E3AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC2E440(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC2ECBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC2F1FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC2F360(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC2F750(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC30A8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC30D38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC30F2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC31F6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC31FFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC32148(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC324F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC32EF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC32FC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3310C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC332C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC33BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC33D44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC33ED4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t BRGetLastUsedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLink_SIGetLastUsedDate[0])(a1, a2, a3);
}

uint64_t BRSetLastUsedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return softLink_SISetLastUsedDate(a1, a2, a3);
}

uint64_t BRActivityDump(uint64_t a1, uint64_t a2)
{
  return softLink_SIActivityDump(a1, a2);
}

uint64_t init_SIGetLastUsedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t (*v7)();
  void *v9;
  NSObject *v10;

  v6 = MobileSpotlightIndexLibrary();
  v7 = (uint64_t (*)())dlsym(v6, "_SIGetLastUsedDate");
  softLink_SIGetLastUsedDate[0] = v7;
  if (!v7)
  {
    brc_bread_crumbs((uint64_t)"init_SIGetLastUsedDate", 22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      init_SIGetLastUsedDate_cold_1();

    __assert_rtn("init_SIGetLastUsedDate", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/SpotlightIndex_SoftLinking.m", 22, "Can't find _SIGetLastUsedDate in MobileSpotlightIndex framework");
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, a3);
}

void *MobileSpotlightIndexLibrary()
{
  void *result;

  result = (void *)MobileSpotlightIndexLibrary_frameworkLibrary;
  if (!MobileSpotlightIndexLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/MobileSpotlightIndex.framework/MobileSpotlightIndex", 2);
    MobileSpotlightIndexLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
      MobileSpotlightIndexLibrary_cold_1();
  }
  return result;
}

uint64_t init_SISetLastUsedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t (*v7)();
  void *v9;
  NSObject *v10;

  v6 = MobileSpotlightIndexLibrary();
  v7 = (uint64_t (*)())dlsym(v6, "_SISetLastUsedDate");
  softLink_SISetLastUsedDate = v7;
  if (!v7)
  {
    brc_bread_crumbs((uint64_t)"init_SISetLastUsedDate", 23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      init_SISetLastUsedDate_cold_1();

    __assert_rtn("init_SISetLastUsedDate", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/SpotlightIndex_SoftLinking.m", 23, "Can't find _SISetLastUsedDate in MobileSpotlightIndex framework");
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, a3);
}

uint64_t init_SIActivityDump(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t (*v5)();
  void *v7;
  NSObject *v8;

  v4 = MobileSpotlightIndexLibrary();
  v5 = (uint64_t (*)())dlsym(v4, "_SIActivityDump");
  softLink_SIActivityDump = v5;
  if (!v5)
  {
    brc_bread_crumbs((uint64_t)"init_SIActivityDump", 24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      init_SIActivityDump_cold_1();

    __assert_rtn("init_SIActivityDump", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/SpotlightIndex_SoftLinking.m", 24, "Can't find _SIActivityDump in MobileSpotlightIndex framework");
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v5)(a1, a2);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

char *OUTLINED_FUNCTION_3_2()
{
  return dlerror();
}

id BRCXPCBRItemServiceProtocolInterface()
{
  if (BRCXPCBRItemServiceProtocolInterface_once != -1)
    dispatch_once(&BRCXPCBRItemServiceProtocolInterface_once, &__block_literal_global_529);
  return (id)BRCXPCBRItemServiceProtocolInterface_iface;
}

id BRCXPCICDFileProviderClientSideCollaborationProtocolInterface()
{
  if (BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_once != -1)
    dispatch_once(&BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_once, &__block_literal_global_562);
  return (id)BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface;
}

id BRCXPCSharingOperationInterface()
{
  if (BRCXPCSharingOperationInterface_once != -1)
    dispatch_once(&BRCXPCSharingOperationInterface_once, &__block_literal_global_575);
  return (id)BRCXPCSharingOperationInterface_iface;
}

Class initCKRecordZoneID()
{
  Class result;

  CloudKitLibrary_0();
  result = objc_getClass("CKRecordZoneID");
  classCKRecordZoneID = (uint64_t)result;
  getCKRecordZoneIDClass = (uint64_t (*)())CKRecordZoneIDFunction;
  return result;
}

id CKRecordZoneIDFunction()
{
  return (id)classCKRecordZoneID;
}

id CKUserIdentityLookupInfoFunction()
{
  return (id)classCKUserIdentityLookupInfo;
}

id CKShareParticipantFunction()
{
  return (id)classCKShareParticipant;
}

NSObject *BRCopyBundleIdentifierForURLInContainer(NSObject *a1)
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  id v11;
  char *v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v29;
  char *v30;
  char *v31;
  char *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[3];
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = _CFURLPromiseCopyPhysicalURL();
  v3 = (const void *)v2;
  if (v2)
    v4 = v2;
  else
    v4 = a1;
  if (!-[NSObject br_isInSyncedLocation](v4, "br_isInSyncedLocation"))
  {
    v17 = 0;
    goto LABEL_33;
  }
  memset(v36, 0, sizeof(v36));
  __brc_create_section(0, (uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 41, v36);
  brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 41);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v38 = v36[0];
    v39 = 2080;
    v40 = "_BRCopyBundleIdentifierForURLInContainer";
    v41 = 2112;
    v42 = v4;
    v43 = 2112;
    v44 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s %@%@", buf, 0x2Au);
  }

  v7 = (void *)MEMORY[0x1A1AD841C]();
  v8 = v4;
  -[NSObject br_addPhysicalProperty](v8, "br_addPhysicalProperty");
  v35 = 0;
  v9 = *MEMORY[0x1E0C999D0];
  v34 = 0;
  v10 = -[NSObject getPromisedItemResourceValue:forKey:error:](v8, "getPromisedItemResourceValue:forKey:error:", &v35, v9, &v34);
  v11 = v35;
  v12 = (char *)v34;
  if ((v10 & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 84);
    v15 = objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject path](v8, "path");
      v19 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v38 = v19;
      v39 = 2112;
      v40 = v12;
      v41 = 2112;
      v42 = v15;
      _os_log_impl(&dword_19CBF0000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to get NSURLIsDirectoryKey on '%@': %@%@", buf, 0x20u);

    }
    v17 = 0;
    goto LABEL_32;
  }
  if (objc_msgSend(v11, "BOOLValue"))
  {
    v33 = 0;
    v13 = *MEMORY[0x1E0C99A00];
    v32 = v12;
    v14 = -[NSObject getPromisedItemResourceValue:forKey:error:](v8, "getPromisedItemResourceValue:forKey:error:", &v33, v13, &v32);
    v15 = v33;
    v16 = v32;

    if ((v14 & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 91);
      v18 = objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject path](v8, "path");
        v26 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = v26;
        v39 = 2112;
        v40 = v16;
        v41 = 2112;
        v42 = v18;
        _os_log_impl(&dword_19CBF0000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to get NSURLIsPackageKey on dir at '%@': %@%@", buf, 0x20u);

      }
      goto LABEL_29;
    }
    if ((-[NSObject BOOLValue](v15, "BOOLValue") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 95);
      v18 = objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject path](v8, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        BRCopyBundleIdentifierForURLInContainer_cold_1(v27, (uint64_t)v18, buf, v22);
      }
      goto LABEL_29;
    }

  }
  else
  {
    v16 = v12;
  }
  -[NSObject br_cloudDocsContainer](v8, "br_cloudDocsContainer");
  v15 = objc_claimAutoreleasedReturnValue();
  -[NSObject identifier](v15, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.CloudDocs"));

  if (v21)
  {
    brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 104);
    v18 = objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject identifier](v15, "identifier");
      v29 = objc_claimAutoreleasedReturnValue();
      -[NSObject path](v8, "path");
      v30 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v38 = v29;
      v39 = 2112;
      v40 = v30;
      v41 = 2112;
      v42 = v18;
      _os_log_debug_impl(&dword_19CBF0000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] path in container %@ at '%@'%@", buf, 0x20u);

    }
LABEL_29:

    goto LABEL_30;
  }
  -[NSObject bundleIdentifiers](v15, "bundleIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "anyObject");
  v18 = objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    brc_bread_crumbs((uint64_t)"_BRCopyBundleIdentifierForURLInContainer", 161);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject path](v8, "path");
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v38 = v18;
      v39 = 2112;
      v40 = v31;
      v41 = 2112;
      v42 = v15;
      v43 = 2112;
      v44 = v24;
      _os_log_debug_impl(&dword_19CBF0000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] bundle %@ can open '%@' in container %@%@", buf, 0x2Au);

    }
    v18 = v18;
    v17 = v18;
    goto LABEL_31;
  }
LABEL_30:
  v17 = 0;
LABEL_31:
  v12 = (char *)v16;
LABEL_32:

  objc_autoreleasePoolPop(v7);
  __brc_leave_section((uint64_t)v36);
LABEL_33:
  if (v3)
    CFRelease(v3);
  return v17;
}

void sub_19CC37DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

NSObject *BRIsURLInCloudDocsContainer(NSObject *result, NSObject **a2)
{
  NSObject *v3;

  if (result)
  {
    v3 = BRCopyBundleIdentifierForURLInContainer(result);
    *a2 = v3;
    return (v3 != 0);
  }
  return result;
}

uint64_t BRCopyUbiquitousBookmarkDataForDocumentAtURL(void *a1, uint64_t a2)
{
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v4 = (void *)MEMORY[0x1A1AD841C]();
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __BRCopyUbiquitousBookmarkDataForDocumentAtURL_block_invoke;
  v9[3] = &unk_1E3DA62C8;
  v11 = &v13;
  v12 = a2;
  v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "br_bookmarkableStringWithEtag:completion:", 0, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v4);
  v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v7;
}

void sub_19CC37F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BRCopyDocumentURLForUbiquitousBookmarkData(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v4 = (void *)MEMORY[0x1A1AD841C]();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "br_documentURLFromBookmarkableString:error:", a1, &v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (a2 && v6)
    *a2 = v6;

  objc_autoreleasePoolPop(v4);
  return v5;
}

uint64_t BRIsURLExternalDocumentReference(void *a1)
{
  return objc_msgSend(a1, "br_isExternalDocumentReference");
}

uint64_t BRCopyResolvedURLForExternalDocumentReferenceAtURL(void *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  v4 = (void *)MEMORY[0x1A1AD841C]();
  v9 = 0;
  objc_msgSend(a1, "br_URLByResolvingExternalDocumentReferenceWithError:", &v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (a2 && !v5)
    *a2 = v6;

  objc_autoreleasePoolPop(v4);
  return v5;
}

uint64_t BRCopyRepresentedFileNameForFaultFileURL(void *a1)
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  const __CFAllocator *v6;
  CFRange v8;

  if (!_CFURLIsItemPromiseAtURL())
    return 0;
  v2 = _CFURLCopyLogicalNameOfPromiseAtURL();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1A1AD841C]();
    objc_msgSend(a1, "lastPathComponent");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && (unint64_t)-[__CFString length](v4, "length") >= 9)
    {
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v8.length = -[__CFString length](v5, "length") - 8;
      v8.location = 1;
      v2 = (uint64_t)CFStringCreateWithSubstring(v6, v5, v8);
    }
    else
    {
      v2 = 0;
    }

    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

uint64_t BRIsURLInMobileDocuments(void *a1)
{
  return objc_msgSend(a1, "br_isInSyncedLocation");
}

uint64_t BRTrashExternalDocumentReference(void *a1, void *a2, uint64_t a3, CFErrorRef *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  id v14;
  CFErrorRef v15;
  uint64_t v16;
  char v17;
  CFErrorRef v18;
  void *v19;
  NSObject *v20;
  char v21;
  __CFError *v22;
  CFErrorRef v23;
  uint64_t v24;
  char v26;
  char v27;
  void *v28;
  NSObject *v29;
  char v30;
  __CFError *v31;
  id v32;
  CFErrorRef v33;
  CFErrorRef v34;
  __CFError *v35;
  CFErrorRef v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[3];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (BRTrashExternalDocumentReference_onceToken != -1)
    dispatch_once(&BRTrashExternalDocumentReference_onceToken, &__block_literal_global_17);
  v7 = (void *)MEMORY[0x1A1AD841C]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v41, 0, sizeof(v41));
  __brc_create_section(0, (uint64_t)"BRTrashExternalDocumentReference", 335, v41);
  brc_bread_crumbs((uint64_t)"BRTrashExternalDocumentReference", 335);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v43 = v41[0];
    v44 = 2080;
    v45 = "BRTrashExternalDocumentReference";
    v46 = 2112;
    v47 = v9;
    v48 = 2112;
    v49 = v10;
    _os_log_debug_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s: %@%@", buf, 0x2Au);
  }

  v40 = 0;
  v12 = *MEMORY[0x1E0C999B8];
  v39 = 0;
  v13 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v40, v12, &v39);
  v14 = v40;
  v15 = (CFErrorRef)v39;
  if ((v13 & 1) != 0)
  {
    if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
    {
      v38 = 0;
      v16 = *MEMORY[0x1E0C99A90];
      v37 = 0;
      v17 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v38, v16, &v37);
      v32 = v38;

      v18 = (CFErrorRef)v37;
      if ((v17 & 1) != 0)
      {
        if (objc_msgSend(v32, "hasPrefix:", CFSTR("."))
          && (objc_msgSend(v32, "hasSuffix:", CFSTR(".alias")) & 1) != 0)
        {
          if (!v9)
          {
            a2 = (void *)objc_msgSend(a1, "br_URLByResolvingExternalDocumentReferenceWithError:", 0);
            objc_msgSend(a2, "path");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (!objc_msgSend(v9, "containsString:", BRTrashExternalDocumentReference_sharedDocsContainerPartialPath, v32))goto LABEL_33;
          brc_bread_crumbs((uint64_t)"BRTrashExternalDocumentReference", 363);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            BRTrashExternalDocumentReference_cold_2();

          v36 = v18;
          v21 = objc_msgSend(v8, "removeItemAtPath:error:", v9, &v36);
          v22 = v36;

          if ((v21 & 1) != 0)
          {
            v18 = v22;
LABEL_33:
            v34 = v18;
            v27 = objc_msgSend(v8, "removeItemAtURL:error:", a1, &v34);
            v15 = v34;

            if ((v27 & 1) != 0)
            {
              v24 = 1;
LABEL_35:
              v14 = v32;
              goto LABEL_27;
            }
            brc_bread_crumbs((uint64_t)"BRTrashExternalDocumentReference", 373);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              BRTrashExternalDocumentReference_cold_1();

            v33 = v15;
            v30 = BRRemoveItemAtURL(a1, &v33);
            v31 = v33;

            if ((v30 & 1) != 0)
            {
              v24 = 1;
LABEL_45:
              v14 = v32;
              v15 = v31;
              goto LABEL_27;
            }
            if (!a4)
            {
              v24 = 0;
              goto LABEL_45;
            }
            v15 = v31;
            goto LABEL_24;
          }
          v35 = v22;
          v26 = BRRemoveItemAtURL(a2, &v35);
          v15 = v35;

          if ((v26 & 1) != 0)
          {
            v18 = v15;
            goto LABEL_33;
          }
          if (!a4)
          {
            v24 = 0;
            goto LABEL_35;
          }
LABEL_24:
          v14 = v32;
          goto LABEL_25;
        }
        if (a4)
        {
          v23 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 259, 0);
          v14 = v32;
          v15 = v18;
          goto LABEL_26;
        }
      }
      else if (a4)
      {
        v15 = v18;
        goto LABEL_24;
      }
      v24 = 0;
      v14 = v32;
      v15 = v18;
      goto LABEL_27;
    }
    if (a4)
    {
      v23 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFB8], 259, 0);
LABEL_26:
      v24 = 0;
      *a4 = v23;
      goto LABEL_27;
    }
  }
  else if (a4)
  {
LABEL_25:
    v23 = v15;
    v15 = v23;
    goto LABEL_26;
  }
  v24 = 0;
LABEL_27:
  __brc_leave_section((uint64_t)v41);

  objc_autoreleasePoolPop(v7);
  return v24;
}

void sub_19CC38680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC3885C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSDBuildInfoClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!SeedingLibraryCore_frameworkLibrary)
    SeedingLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("SDBuildInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSDBuildInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19CC3B224(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3B2E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3B338(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3B5C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3B678(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3B85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19CC3B95C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3BA1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3BADC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3BB90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3BC68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3BDB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3C000(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3C0C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC3C7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;

  __brc_leave_section((uint64_t)&a64);
  _Unwind_Resume(a1);
}

void sub_19CC3C9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __brc_leave_section((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_19CC3CFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a46, 8);
  _Unwind_Resume(a1);
}

void sub_19CC3D378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC3D6BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  __brc_leave_section(v1 - 64);
  _Unwind_Resume(a1);
}

void sub_19CC3D7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __brc_leave_section((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void __dispatch_group_async_with_logs_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *label;
  __int128 v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs((uint64_t)"dispatch_group_async_with_logs_block_invoke", 295);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32));
    *(_DWORD *)buf = 134218498;
    v8 = v5;
    v9 = 2080;
    v10 = label;
    v11 = 2112;
    v12 = v2;
    _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx continuing on %s%@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __brc_leave_section((uint64_t)&v5);
}

void sub_19CC3DC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __brc_leave_section((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_19CC3DE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19CC3E4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t LBItemCopyLastEditorPeerNameForURL()
{
  return 0;
}

uint64_t LBRevisionCopyForURL()
{
  return 0;
}

uint64_t LBRevisionHasUnsavedConflictForURL()
{
  return 0;
}

uint64_t LBRevisionMarkSavedForURL()
{
  return 1;
}

uint64_t LBRevisionRestoreForURL()
{
  return 1;
}

void LBDeleteItemAtURL(uint64_t a1, NSObject *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __LBDeleteItemAtURL_block_invoke;
  block[3] = &unk_1E3DA50E0;
  v7 = v4;
  v5 = v4;
  dispatch_async(a2, block);

}

void LBEvictItemAtURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __LBEvictItemAtURL_block_invoke;
  v9[3] = &unk_1E3DA51A0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  BREvictItemAtURL(a1, v9);

}

void LBStartSyncForItem(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v8[0] = a1;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  }
  else
  {
    v7 = 0;
  }
  LBStartDownloadForItems(v7, v5, v6);

}

void LBStartDownloadForItems(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int active_platform;
  unsigned int v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 11 || active_platform == 1)
  {
    v8 = dyld_program_sdk_at_least();
  }
  else
  {
    syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
    v8 = 1;
  }
  v9 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __LBStartDownloadForItems_block_invoke;
  v12[3] = &unk_1E3DA51A0;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  BRStartDownloadForItemsWithOptions(a1, v9, v12);

}

void LBSetSyncEnabledForItem(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD block[4];
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (a1 && a3)
  {
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __LBSetSyncEnabledForItem_block_invoke_2;
    v14[3] = &unk_1E3DA64E0;
    v19 = a2;
    v17 = a1;
    v18 = a3;
    v13 = (id *)&v15;
    v15 = v9;
    v16 = v11;
    dispatch_async(v12, v14);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __LBSetSyncEnabledForItem_block_invoke;
    block[3] = &unk_1E3DA50E0;
    v13 = &v21;
    v21 = v10;
    dispatch_async(v9, block);
  }

}

void LBIsSyncEnabledForItem(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  void (**v5)(id, uint64_t, id);
  void *v6;
  id v7;
  id v8;

  v4 = (void *)*MEMORY[0x1E0C99A38];
  v8 = 0;
  v5 = a3;
  BRGetAttributeValueForItem(a1, v4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  v5[2](v5, objc_msgSend(v6, "BOOLValue"), v7);

}

void LBGetURLForPublishedItem(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __LBGetURLForPublishedItem_block_invoke;
  v9[3] = &unk_1E3DA6530;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  BRGetURLForPublishedItem(a1, v9);

}

void LBCalculateSpaceReclaimableByEviction(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __LBCalculateSpaceReclaimableByEviction_block_invoke;
  block[3] = &unk_1E3DA50E0;
  v6 = v3;
  v4 = v3;
  dispatch_async(a1, block);

}

void LBEvictItemsToReclaimSpace(uint64_t a1, NSObject *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __LBEvictItemsToReclaimSpace_block_invoke;
  block[3] = &unk_1E3DA50E0;
  v7 = v4;
  v5 = v4;
  dispatch_async(a2, block);

}

void LBEvictItemsToReclaimSpaceWithUrgency(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __LBEvictItemsToReclaimSpaceWithUrgency_block_invoke;
  block[3] = &unk_1E3DA50E0;
  v8 = v5;
  v6 = v5;
  dispatch_async(a3, block);

}

void LBGetTotalApplicationDocumentUsage(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __LBGetTotalApplicationDocumentUsage_block_invoke;
  v7[3] = &unk_1E3DA53A8;
  v8 = v3;
  v9 = v4;
  v5 = v4;
  v6 = v3;
  BRGetTotalApplicationDocumentUsage(v7);

}

void LBNoteConfigurationProfileUpdate(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __LBNoteConfigurationProfileUpdate_block_invoke;
  block[3] = &unk_1E3DA50E0;
  v6 = v3;
  v4 = v3;
  dispatch_async(a1, block);

}

void LBGetApplicationDocumentUsageInformation(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __LBGetApplicationDocumentUsageInformation_block_invoke;
  v9[3] = &unk_1E3DA53A8;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  BRGetApplicationDocumentUsageInformation(a1, v9);

}

uint64_t LBRefreshUbiquityAccountToken()
{
  BOOL v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v0 = +[BRAccount refreshCurrentLoggedInAccount](BRAccount, "refreshCurrentLoggedInAccount");
  +[BRAccount currentCachedLoggedInAccountWithError:](BRAccount, "currentCachedLoggedInAccountWithError:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "perAppAccountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0 || (objc_msgSend((id)LBRefreshUbiquityAccountToken_lastReturnedAccountToken, "isEqualToData:", v2) & 1) == 0)
  {
    objc_storeStrong((id *)&LBRefreshUbiquityAccountToken_lastReturnedAccountToken, v2);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void LBRegisterInitialSyncHandlerForURL(uint64_t a1, NSObject *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __LBRegisterInitialSyncHandlerForURL_block_invoke;
  block[3] = &unk_1E3DA50E0;
  v7 = v4;
  v5 = v4;
  dispatch_async(a2, block);

}

void LBNoteAccountUpdate(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __LBNoteAccountUpdate_block_invoke;
  block[3] = &unk_1E3DA50E0;
  v6 = v3;
  v4 = v3;
  dispatch_async(a1, block);

}

void sub_19CC3FD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC40880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x16u);
}

void sub_19CC419F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC42ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19CC42EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC42FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC43438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC43538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC43770(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_19CC43850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC439D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC43C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC43E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC44AF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC45584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19CC458B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

int *OUTLINED_FUNCTION_11()
{
  return __error();
}

void sub_19CC46814(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id fileProgressSubscribeQueue()
{
  if (fileProgressSubscribeQueue_onceToken != -1)
    dispatch_once(&fileProgressSubscribeQueue_onceToken, &__block_literal_global_24);
  return (id)fileProgressSubscribeQueue_fileProgressSubscribeQueue;
}

void sub_19CC46F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __fileProgressSubscribeQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.clouddocs.file-progresss-registration", v0);

  v2 = (void *)fileProgressSubscribeQueue_fileProgressSubscribeQueue;
  fileProgressSubscribeQueue_fileProgressSubscribeQueue = (uint64_t)v1;

}

void sub_19CC47A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t _mkstempWrapper(void *a1, void *a2, void *a3, _DWORD *a4, _QWORD *a5)
{
  id v9;
  id v10;
  int v11;
  int v12;
  uint64_t v13;
  char __s[1024];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a3;
  v11 = open((const char *)objc_msgSend(objc_retainAutorelease(a2), "fileSystemRepresentation"), 33028);
  if (v11 < 0)
  {
    v13 = 0xFFFFFFFFLL;
    goto LABEL_14;
  }
  v12 = v11;
  if ((__pthread_fchdir() & 0x80000000) == 0)
  {
    if ((objc_msgSend(v10, "getFileSystemRepresentation:maxLength:", __s, 1024) & 1) != 0)
    {
      v13 = mkstemp(__s);
      if ((v13 & 0x80000000) == 0)
      {
        if (a5)
        {
          objc_msgSend(v9, "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          if (a4)
            goto LABEL_7;
        }
        else
        {
          unlink(__s);
          if (a4)
          {
LABEL_7:
            *a4 = v13;
            if (!v12)
              goto LABEL_14;
            goto LABEL_13;
          }
        }
        close(v13);
        if (!v12)
          goto LABEL_14;
LABEL_13:
        close(v12);
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    *__error() = 63;
  }
  v13 = 0xFFFFFFFFLL;
LABEL_12:
  if (v12)
    goto LABEL_13;
LABEL_14:

  return v13;
}

void less_exit_handler()
{
  int v0;

  v0 = 0;
  while (waitpid(-1, &v0, 1) > 0)
    ;
  exit(0);
}

uint64_t brc_backtrace_snprint(char *a1, size_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  const char *dli_sname;
  char *v8;
  const char *dli_fname;
  BOOL v10;
  Dl_info v11;
  void *v12[25];

  v12[24] = *(void **)MEMORY[0x1E0C80C00];
  result = backtrace(v12, 24);
  if ((_DWORD)result)
  {
    v5 = 0;
    v6 = result;
    do
    {
      memset(&v11, 0, sizeof(v11));
      if (v5)
      {
        if (dladdr(v12[v5], &v11))
        {
          dli_sname = v11.dli_sname;
          v8 = rindex(v11.dli_fname, 47);
          dli_fname = v11.dli_fname;
          if (v8)
            dli_fname = v8 + 1;
        }
        else
        {
          dli_sname = "";
          dli_fname = "";
        }
        result = snprintf(a1, a2, "frame %d: %lld %s in %s\n", v5, v12[v5], dli_sname, dli_fname);
        v10 = a2 > (int)result;
        a2 -= (int)result;
        if (!v10)
          return result;
        a1 += (int)result;
      }
      ++v5;
    }
    while (v6 != v5);
  }
  return result;
}

id brc_backtrace()
{
  char v1[8192];
  uint64_t v2;

  MEMORY[0x1E0C80A78]();
  v2 = *MEMORY[0x1E0C80C00];
  brc_backtrace_snprint(v1, 0x2000uLL);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id brc_backtrace_non_detailed_but_fast()
{
  char v1[8192];
  uint64_t v2;

  MEMORY[0x1E0C80A78]();
  v2 = *MEMORY[0x1E0C80C00];
  brc_backtrace_snprint(v1, 0x2000uLL);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void brc_backtrace_exception_snprint(char *a1, size_t a2, void *a3)
{
  id v5;
  id v6;

  objc_msgSend(a3, "callStackSymbols");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  snprintf(a1, a2, "%s", (const char *)objc_msgSend(v5, "UTF8String"));

}

void sub_19CC499C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC49D28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC49E20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC49F18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC4A010(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC4A108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC4A228(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC4A2C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC4ABAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC4B220(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC4B300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC4C52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC4C8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BRContainer *BRContainerIfDirectoryInHomeURLIsSynced(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  ssize_t v9;
  BRContainer *v10;
  void *v11;
  NSObject *v12;

  v5 = a3;
  objc_msgSend(a1, "URLByAppendingPathComponent:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = getxattr((const char *)objc_msgSend(v8, "fileSystemRepresentation"), (const char *)objc_msgSend(CFSTR("com.apple.icloud.desktop"), "UTF8String"), 0, 0, 0, 0);

  if (v9 < 0)
  {
    if (*__error() != 93 && *__error() != 2)
    {
      brc_bread_crumbs((uint64_t)"BRContainerIfDirectoryInHomeURLIsSynced", 1406);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        BRContainerIfDirectoryInHomeURLIsSynced_cold_1(v7, (uint64_t)v11, v12);

    }
    goto LABEL_9;
  }
  v10 = -[BRContainer initWithDocsOrDesktopContainerID:]([BRContainer alloc], "initWithDocsOrDesktopContainerID:", v5);
LABEL_10:

  return v10;
}

void sub_19CC4D76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_19CC4DDDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC4DE7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC4E150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19CC4E518(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC4FBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  uint64_t v60;

  _Block_object_dispose((const void *)(v60 - 160), 8);
  __brc_leave_section((uint64_t)&a60);
  _Unwind_Resume(a1);
}

void sub_19CC505A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  __brc_leave_section((uint64_t)&a28);
  _Unwind_Resume(a1);
}

void sub_19CC519F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a68;

  __brc_leave_section((uint64_t)&a68);
  _Unwind_Resume(a1);
}

void sub_19CC52C50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC52D2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC52ED4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC53090(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC53448(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _BRRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_19CC5353C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC5366C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;

  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_19CC5381C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC538AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19CC53A8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC53C78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC540B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC543A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19CC54774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __brc_block_perform_once_and_set_block_invoke(uint64_t result)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(result + 40);
  if (!*v1)
  {
    *v1 = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

uint64_t initCGImageSourceCreateWithURL(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t (*v5)();
  void *v7;
  NSObject *v8;

  v4 = ImageIOLibrary();
  v5 = (uint64_t (*)())dlsym(v4, "CGImageSourceCreateWithURL");
  softLinkCGImageSourceCreateWithURL = v5;
  if (!v5)
  {
    brc_bread_crumbs((uint64_t)"initCGImageSourceCreateWithURL", 58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      initCGImageSourceCreateWithURL_cold_1();

    __assert_rtn("initCGImageSourceCreateWithURL", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 58, "Can't find CGImageSourceCreateWithURL in ImageIO framework");
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v5)(a1, a2);
}

void *ImageIOLibrary()
{
  void *result;

  result = (void *)ImageIOLibrary_frameworkLibrary;
  if (!ImageIOLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 2);
    ImageIOLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
      ImageIOLibrary_cold_1();
  }
  return result;
}

id initkCGImageSourceShouldCache()
{
  void *v0;
  id *v1;

  v0 = ImageIOLibrary();
  v1 = (id *)dlsym(v0, "kCGImageSourceShouldCache");
  if (!v1)
    initkCGImageSourceShouldCache_cold_1();
  objc_storeStrong((id *)&constantkCGImageSourceShouldCache, *v1);
  getkCGImageSourceShouldCache = (uint64_t (*)())kCGImageSourceShouldCacheFunction;
  return (id)constantkCGImageSourceShouldCache;
}

id kCGImageSourceShouldCacheFunction()
{
  return (id)constantkCGImageSourceShouldCache;
}

id initkCGImageSourceSkipMetadata()
{
  void *v0;
  id *v1;

  v0 = ImageIOLibrary();
  v1 = (id *)dlsym(v0, "kCGImageSourceSkipMetadata");
  if (!v1)
    initkCGImageSourceSkipMetadata_cold_1();
  objc_storeStrong((id *)&constantkCGImageSourceSkipMetadata, *v1);
  getkCGImageSourceSkipMetadata = (uint64_t (*)())kCGImageSourceSkipMetadataFunction;
  return (id)constantkCGImageSourceSkipMetadata;
}

id kCGImageSourceSkipMetadataFunction()
{
  return (id)constantkCGImageSourceSkipMetadata;
}

uint64_t initCGImageSourceCreateImageAtIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t (*v7)();
  void *v9;
  NSObject *v10;

  v6 = ImageIOLibrary();
  v7 = (uint64_t (*)())dlsym(v6, "CGImageSourceCreateImageAtIndex");
  softLinkCGImageSourceCreateImageAtIndex = v7;
  if (!v7)
  {
    brc_bread_crumbs((uint64_t)"initCGImageSourceCreateImageAtIndex", 59);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      initCGImageSourceCreateImageAtIndex_cold_1();

    __assert_rtn("initCGImageSourceCreateImageAtIndex", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 59, "Can't find CGImageSourceCreateImageAtIndex in ImageIO framework");
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, a3);
}

uint64_t initCGImageGetWidth(uint64_t a1)
{
  void *v2;
  uint64_t (*v3)();
  void *v5;
  NSObject *v6;

  v2 = ImageIOLibrary();
  v3 = (uint64_t (*)())dlsym(v2, "CGImageGetWidth");
  softLinkCGImageGetWidth = v3;
  if (!v3)
  {
    brc_bread_crumbs((uint64_t)"initCGImageGetWidth", 60);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      initCGImageGetWidth_cold_1();

    __assert_rtn("initCGImageGetWidth", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 60, "Can't find CGImageGetWidth in ImageIO framework");
  }
  return ((uint64_t (*)(uint64_t))v3)(a1);
}

Class initUIImage()
{
  Class Class;

  UIKitLibrary();
  Class = objc_getClass("UIImage");
  classUIImage = (uint64_t)Class;
  if (!Class)
    initUIImage_cold_1();
  getUIImageClass = (uint64_t (*)())UIImageFunction;
  return Class;
}

void *UIKitLibrary()
{
  void *result;

  result = (void *)UIKitLibrary_frameworkLibrary;
  if (!UIKitLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
    UIKitLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
      UIKitLibrary_cold_1();
  }
  return result;
}

id UIImageFunction()
{
  return (id)classUIImage;
}

uint64_t initUIGraphicsBeginImageContextWithOptions(uint64_t a1, double a2, double a3, double a4)
{
  void *v8;
  uint64_t (*v9)();
  void *v11;
  NSObject *v12;

  v8 = UIKitLibrary();
  v9 = (uint64_t (*)())dlsym(v8, "UIGraphicsBeginImageContextWithOptions");
  softLinkUIGraphicsBeginImageContextWithOptions = v9;
  if (!v9)
  {
    brc_bread_crumbs((uint64_t)"initUIGraphicsBeginImageContextWithOptions", 81);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      initUIGraphicsBeginImageContextWithOptions_cold_1();

    __assert_rtn("initUIGraphicsBeginImageContextWithOptions", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 81, "Can't find UIGraphicsBeginImageContextWithOptions in UIKit framework");
  }
  return ((uint64_t (*)(uint64_t, double, double, double))v9)(a1, a2, a3, a4);
}

uint64_t initCGContextClipToMask(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  void *v12;
  uint64_t (*v13)();
  void *v15;
  NSObject *v16;

  v12 = (void *)CoreGraphicsLibrary_frameworkLibrary;
  if (!CoreGraphicsLibrary_frameworkLibrary)
  {
    v12 = dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", 2);
    CoreGraphicsLibrary_frameworkLibrary = (uint64_t)v12;
    if (!v12)
      initCGContextClipToMask_cold_1();
  }
  v13 = (uint64_t (*)())dlsym(v12, "CGContextClipToMask");
  softLinkCGContextClipToMask = v13;
  if (!v13)
  {
    brc_bread_crumbs((uint64_t)"initCGContextClipToMask", 69);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      initCGContextClipToMask_cold_2();

    __assert_rtn("initCGContextClipToMask", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 69, "Can't find CGContextClipToMask in CoreGraphics framework");
  }
  return ((uint64_t (*)(uint64_t, uint64_t, double, double, double, double))v13)(a1, a2, a3, a4, a5, a6);
}

uint64_t initUIGraphicsGetCurrentContext()
{
  void *v0;
  uint64_t (*v1)();
  void *v3;
  NSObject *v4;

  v0 = UIKitLibrary();
  v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetCurrentContext");
  softLinkUIGraphicsGetCurrentContext = v1;
  if (!v1)
  {
    brc_bread_crumbs((uint64_t)"initUIGraphicsGetCurrentContext", 80);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      initUIGraphicsGetCurrentContext_cold_1();

    __assert_rtn("initUIGraphicsGetCurrentContext", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 80, "Can't find UIGraphicsGetCurrentContext in UIKit framework");
  }
  return v1();
}

uint64_t initUIGraphicsGetImageFromCurrentImageContext()
{
  void *v0;
  uint64_t (*v1)();
  void *v3;
  NSObject *v4;

  v0 = UIKitLibrary();
  v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetImageFromCurrentImageContext");
  softLinkUIGraphicsGetImageFromCurrentImageContext = v1;
  if (!v1)
  {
    brc_bread_crumbs((uint64_t)"initUIGraphicsGetImageFromCurrentImageContext", 82);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      initUIGraphicsGetImageFromCurrentImageContext_cold_1();

    __assert_rtn("initUIGraphicsGetImageFromCurrentImageContext", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 82, "Can't find UIGraphicsGetImageFromCurrentImageContext in UIKit framework");
  }
  return v1();
}

uint64_t initUIGraphicsEndImageContext()
{
  void *v0;
  uint64_t (*v1)();
  void *v3;
  NSObject *v4;

  v0 = UIKitLibrary();
  v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsEndImageContext");
  softLinkUIGraphicsEndImageContext = v1;
  if (!v1)
  {
    brc_bread_crumbs((uint64_t)"initUIGraphicsEndImageContext", 83);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      initUIGraphicsEndImageContext_cold_1();

    __assert_rtn("initUIGraphicsEndImageContext", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 83, "Can't find UIGraphicsEndImageContext in UIKit framework");
  }
  return v1();
}

id initUIImagePNGRepresentation(void *a1)
{
  id v1;
  void *v2;
  uint64_t (*v3)();
  void *v4;
  void *v6;
  NSObject *v7;

  v1 = a1;
  v2 = UIKitLibrary();
  v3 = (uint64_t (*)())dlsym(v2, "UIImagePNGRepresentation");
  softLinkUIImagePNGRepresentation = v3;
  if (!v3)
  {
    brc_bread_crumbs((uint64_t)"initUIImagePNGRepresentation", 79);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      initUIImagePNGRepresentation_cold_1();

    __assert_rtn("initUIImagePNGRepresentation", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 79, "Can't find UIImagePNGRepresentation in UIKit framework");
  }
  ((void (*)(id))v3)(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __br_notify_register_dispatch_block_invoke_2_4()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)softLinkUIImagePNGRepresentation_block_invoke___personalPersona;
  softLinkUIImagePNGRepresentation_block_invoke___personalPersona = v0;

}

void OUTLINED_FUNCTION_9_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 0x16u);
}

BOOL OUTLINED_FUNCTION_15(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_19CC56428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19CC567E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19CC56D84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC56FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  objc_sync_exit(v9);
  __brc_leave_section((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_19CC57AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC57F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC58488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC5905C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC596D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,id location)
{
  __brc_leave_section((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void sub_19CC59E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC5A3BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL MLEqualCallback(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_19CC5B058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC5BDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC5C388(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC5C52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC5C744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC5C9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC5CD14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id initUIApplicationWillResignActiveNotification()
{
  void *v0;
  id *v1;

  v0 = UIKitLibrary_0();
  v1 = (id *)dlsym(v0, "UIApplicationWillResignActiveNotification");
  if (!v1)
    initUIApplicationWillResignActiveNotification_cold_1();
  objc_storeStrong((id *)&constantUIApplicationWillResignActiveNotification, *v1);
  getUIApplicationWillResignActiveNotification = (uint64_t (*)())UIApplicationWillResignActiveNotificationFunction;
  return (id)constantUIApplicationWillResignActiveNotification;
}

void *UIKitLibrary_0()
{
  void *result;

  result = (void *)UIKitLibrary_frameworkLibrary_0;
  if (!UIKitLibrary_frameworkLibrary_0)
  {
    result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
    UIKitLibrary_frameworkLibrary_0 = (uint64_t)result;
    if (!result)
      UIKitLibrary_cold_1_0();
  }
  return result;
}

id UIApplicationWillResignActiveNotificationFunction()
{
  return (id)constantUIApplicationWillResignActiveNotification;
}

id initUIApplicationDidBecomeActiveNotification()
{
  void *v0;
  id *v1;

  v0 = UIKitLibrary_0();
  v1 = (id *)dlsym(v0, "UIApplicationDidBecomeActiveNotification");
  if (!v1)
    initUIApplicationDidBecomeActiveNotification_cold_1();
  objc_storeStrong((id *)&constantUIApplicationDidBecomeActiveNotification, *v1);
  getUIApplicationDidBecomeActiveNotification[0] = (uint64_t (*)())UIApplicationDidBecomeActiveNotificationFunction;
  return (id)constantUIApplicationDidBecomeActiveNotification;
}

id UIApplicationDidBecomeActiveNotificationFunction()
{
  return (id)constantUIApplicationDidBecomeActiveNotification;
}

void sub_19CC60994(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC60D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  __brc_leave_section((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19CC63DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19CC66378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 176), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_19CC6776C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC677E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19CC67938(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC67A8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19CC686EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BRContainerIconCKAssetKeyForName(uint64_t a1)
{
  return objc_msgSend(CFSTR("icon"), "stringByAppendingString:", a1);
}

id BRContainerIconNameForCKAssetKey(void *a1)
{
  id v1;
  void *v2;
  char v3;
  void *v4;
  void *v6;
  NSObject *v7;

  v1 = a1;
  objc_msgSend(v1, "substringToIndex:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("icon"));

  if ((v3 & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"BRContainerIconNameForCKAssetKey", 31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      BRContainerIconNameForCKAssetKey_cold_1((uint64_t)v6, v7);

  }
  objc_msgSend(v1, "substringFromIndex:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id BRContainerIconNameForSizeAndScale(double a1, double a2, double a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[4];

  v20[2] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("iOS");
  v20[1] = CFSTR("OSX");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%dx%d_%@"), (int)(a1 * a3), (int)(a2 * a3), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _BRContainerIconSupportedNames();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v11);

      if ((v13 & 1) != 0)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

id _BRContainerIconSupportedNames()
{
  if (_BRContainerIconSupportedNames_once != -1)
    dispatch_once(&_BRContainerIconSupportedNames_once, &__block_literal_global_10_0);
  return (id)_BRContainerIconSupportedNames_iconNames;
}

double BRContainerIconSizeForName(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  NSObject *v5;
  char *v6;
  char *__endptr;

  __endptr = 0;
  v1 = strtoll((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), &__endptr, 0);
  if (__endptr && *__endptr == 120)
  {
    v2 = v1;
    v6 = 0;
    strtoll(__endptr + 1, &v6, 0);
    if (v6 && *v6 == 95)
      return (double)v2;
    brc_bread_crumbs((uint64_t)"BRContainerIconSizeForName", 89);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      BRContainerIconSizeForName_cold_1();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRContainerIconSizeForName", 84);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      BRContainerIconSizeForName_cold_1();
  }

  return 0.0;
}

double BRContainerIconScaleForName(void *a1)
{
  char *v1;

  v1 = strchr((char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), 64);
  if (v1)
    return (double)strtoll(v1 + 1, 0, 0);
  else
    return 1.0;
}

id BRContainerIconCKAssetKeys()
{
  if (BRContainerIconCKAssetKeys_once != -1)
    dispatch_once(&BRContainerIconCKAssetKeys_once, &__block_literal_global_34);
  return (id)BRContainerIconCKAssetKeys_iconKeys;
}

void sub_19CC69528(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x12u);
}

void br_pacer_pretend_event_handler_fired_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: nil pacer fired%@", (uint8_t *)&v2, 0xCu);
}

void brc_notify_post_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: name%@", (uint8_t *)&v2, 0xCu);
}

void __br_notify_register_dispatch_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 48);
  v3 = 136315394;
  v4 = v1;
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_19CBF0000, v2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for notification %s%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __brc_leave_section_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┗%llx %@", (uint8_t *)&v3, 0x16u);
}

void brc_xattr_set_string_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] can't set xattr \"%s\" [value is too long]%@");
  OUTLINED_FUNCTION_1();
}

void _BRLocalizedString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: key != nil%@", (uint8_t *)&v2, 0xCu);
}

void BRTelemetryReportAddPeopleDisplayed_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, a2, a3, "[DEBUG] BRTelemetry sending new Add People display with access = %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void BRTelemetryReportSettingUpiCloudDriveDisplay_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, a2, a3, "[DEBUG] BRTelemetry sending new Setting Up iCloud Drive display with duration = %f%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void initCKErrorDomain_cold_1()
{
  __assert_rtn("initCKErrorDomain", "BRShareOperations.m", 24, "constant");
}

void CloudKitLibrary_cold_1()
{
  void *v0;
  NSObject *v1;
  int v2;
  char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"CloudKitLibrary", 22);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = dlerror();
    v4 = 2112;
    v5 = v0;
    _os_log_impl(&dword_19CBF0000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open CloudKit : %s%@", (uint8_t *)&v2, 0x16u);
  }

  __assert_rtn("CloudKitLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/operations/BRShareOperations.m", 22, "Can't open CloudKit");
}

void initCKPartialErrorsByItemIDKey_cold_1()
{
  __assert_rtn("initCKPartialErrorsByItemIDKey", "BRShareOperations.m", 23, "constant");
}

void BRCopyUbiquityContainerIdentifiersForCurrentProcess_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] current process containers: %@%@");
  OUTLINED_FUNCTION_1();
}

void BRCopyUbiquityContainerIdentifiersForCurrentProcess_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_8_1(&dword_19CBF0000, v0, v1, "[DEBUG] ┏%llx %s%@");
}

void BRGetProcessMobileContainerForID_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] ┣%llx calling bird%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void BRSynchronousEvictItemAtURLWithOptions_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] BRSynchronousEvictItemAtURLWithOptions is deprecated in FPFS%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRThumbnailChangedAtURL_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] BRThumbnailChangedAtURL is deprecated in FPFS%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRGetAttributeValuesForItem_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] not ubiquitous because %@ is excluded%@");
  OUTLINED_FUNCTION_1();
}

void BRGetAttributeValuesForItem_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] not ubiquitous because %@ isn't reachable%@");
  OUTLINED_FUNCTION_1();
}

void BRiWorkSharingSetSharingState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] no file URL provided%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRiWorkSharingSetSharingState_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] Need a completion block and queue%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRSharingCopyCurrentUserIdentifier_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] No completion handler or queue provided%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRSharingCopyCurrentUserNameAndDisplayHandleForURL_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] No completion handler provided%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRSetMigrationStatusForDSIDInPref_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] ignoring status refused on iOS%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRSetMigrationStatusForDSIDInPref_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] BRSetMigrationStatusForDSIDInPref called with nil dsid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRSetMigrationStatusForDSIDInPref_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: dsid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BRPrimaryiCloudAccountCopyStatus_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_5(&dword_19CBF0000, a4, a3, "[ERROR] unable to get primary account status; %@%@", (uint8_t *)a3);

}

void BRPrimaryiCloudAccountCopyStatus_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] account status: %@%@");
  OUTLINED_FUNCTION_1();
}

void BRPrimaryiCloudAccountCopyStatus_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] ┏%llx getting primary iCloudAccount Status%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void BRCloudDocsCanBeEnabledForCurrentUser_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_8_1(&dword_19CBF0000, v0, v1, "[DEBUG] ┏%llx %s%@");
}

void __br_notify_register_dispatch_block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_19CBF0000, v0, (uint64_t)v0, "[ERROR] won't restore persona: %@%@", v1);
  OUTLINED_FUNCTION_1();
}

void brc_default_log_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !isDataSeparated%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void brc_default_log_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: isDataSeparated%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void abc_report_assert_with_signature_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] Sent snapshot for signature %@%@");
  OUTLINED_FUNCTION_1();
}

void abc_report_assert_with_signature_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] Failed to send snapshot for signature %@%@");
  OUTLINED_FUNCTION_1();
}

void __abc_report_assert_with_signature_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] got response from diagnosticReporter - %@%@");
  OUTLINED_FUNCTION_1();
}

void abc_report_panic_with_signature_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] Sent panic snapshot for signature %@%@");
  OUTLINED_FUNCTION_1();
}

void abc_report_panic_with_signature_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] Failed to send panic snapshot for signature %@%@");
  OUTLINED_FUNCTION_1();
}

void offsetOfPackageRootFilenameInPath_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] Adding %s to the list of force package extensions (according to F_PATHPKG)%@");
  OUTLINED_FUNCTION_1();
}

void getHomeDirectoryForUser_cold_1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  strerror(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_2(&dword_19CBF0000, v1, v2, "[ERROR] can't get home dir path size %s (%d)%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

void getHomeDirectoryForUser_cold_2(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  strerror(a1);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_2(&dword_19CBF0000, v1, v2, "[ERROR] can't get home dir path %s (%d)%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_1();
}

void notifyNameWithPrefixedContainerID_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: should be prefixed (%@)%@");
  OUTLINED_FUNCTION_1();
}

void __br_notify_register_dispatch_block_invoke_cold_1_0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315394;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, a2, a3, "[CRIT] UNREACHABLE: Failed to adopt persona for notification %s%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __br_notify_register_dispatch_block_invoke_cold_2_0()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_19CBF0000, v0, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void BRPerformWithPersonaAndError_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void BRPerformWithPersonaAndError_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_19CBF0000, a2, a3, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void BRPerformWithPersonaAndError_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_19CBF0000, a2, a3, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void initCKCurrentUserDefaultName_cold_1()
{
  __assert_rtn("initCKCurrentUserDefaultName", "BRMangledID.m", 18, "constant");
}

void BRFetchCollaborationIdentifierForItemWithIdentifier_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] group activity sharing item with %@%@");
  OUTLINED_FUNCTION_1();
}

void BRFetchCollaborationIdentifierForItemWithIdentifier_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: FPIsCloudDocsWithFPFSEnabled()%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void BRFetchCollaborationIdentifierForItemAtURL_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_obfuscatedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_19CBF0000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] group activity sharing item at %@%@", (uint8_t *)&v7, 0x16u);

}

void BRFetchCollaborationIdentifierForItemAtURL_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: !FPIsCloudDocsWithFPFSEnabled()%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void BRFetchCKShareForItemAtURL_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] group activity getting share at %@%@");
  OUTLINED_FUNCTION_1();
}

void __br_notify_register_dispatch_block_invoke_cold_1_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_19CBF0000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for notification %s%@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void init_SIGetLastUsedDate_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find _SIGetLastUsedDate in MobileSpotlightIndex framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void MobileSpotlightIndexLibrary_cold_1()
{
  void *v0;
  NSObject *v1;
  int v2;
  char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"MobileSpotlightIndexLibrary", 21);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = dlerror();
    v4 = 2112;
    v5 = v0;
    _os_log_impl(&dword_19CBF0000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open MobileSpotlightIndex : %s%@", (uint8_t *)&v2, 0x16u);
  }

  __assert_rtn("MobileSpotlightIndexLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/SpotlightIndex_SoftLinking.m", 21, "Can't open MobileSpotlightIndex");
}

void init_SISetLastUsedDate_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find _SISetLastUsedDate in MobileSpotlightIndex framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void init_SIActivityDump_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find _SIActivityDump in MobileSpotlightIndex framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void BRCopyBundleIdentifierForURLInContainer_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] non-package directory at '%@'%@", buf, 0x16u);

}

void BRTrashExternalDocumentReference_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] deleting alias at %@%@");
}

void BRTrashExternalDocumentReference_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] target path is within the sharedDocs container, deleting target at %@%@");
}

void BRContainerIfDirectoryInHomeURLIsSynced_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *__error();
  v7 = 138412802;
  v8 = v5;
  v9 = 1024;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_19CBF0000, a3, (os_log_type_t)0x90u, "[ERROR] can't get xattr on %@: %{errno}d%@", (uint8_t *)&v7, 0x1Cu);

}

void initCGImageSourceCreateWithURL_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find CGImageSourceCreateWithURL in ImageIO framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ImageIOLibrary_cold_1()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  brc_bread_crumbs((uint64_t)"ImageIOLibrary", 56);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_15(v2))
  {
    dlerror();
    OUTLINED_FUNCTION_12_0(&dword_19CBF0000, v3, v4, "[WARNING] Can't open ImageIO : %s%@", v5, v6, v7, v8, 2u);
  }

  __assert_rtn("ImageIOLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 56, "Can't open ImageIO");
}

void initkCGImageSourceShouldCache_cold_1()
{
  __assert_rtn("initkCGImageSourceShouldCache", "BRContainer.m", 62, "constant");
}

void initkCGImageSourceSkipMetadata_cold_1()
{
  __assert_rtn("initkCGImageSourceSkipMetadata", "BRContainer.m", 63, "constant");
}

void initCGImageSourceCreateImageAtIndex_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find CGImageSourceCreateImageAtIndex in ImageIO framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void initCGImageGetWidth_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find CGImageGetWidth in ImageIO framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void initUIImage_cold_1()
{
  __assert_rtn("initUIImage", "BRContainer.m", 77, "classUIImage");
}

void UIKitLibrary_cold_1()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  brc_bread_crumbs((uint64_t)"UIKitLibrary", 75);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_15(v2))
  {
    dlerror();
    OUTLINED_FUNCTION_12_0(&dword_19CBF0000, v3, v4, "[WARNING] Can't open UIKit : %s%@", v5, v6, v7, v8, 2u);
  }

  __assert_rtn("UIKitLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 75, "Can't open UIKit");
}

void initUIGraphicsBeginImageContextWithOptions_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find UIGraphicsBeginImageContextWithOptions in UIKit framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void initCGContextClipToMask_cold_1()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  brc_bread_crumbs((uint64_t)"CoreGraphicsLibrary", 67);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_15(v2))
  {
    dlerror();
    OUTLINED_FUNCTION_12_0(&dword_19CBF0000, v3, v4, "[WARNING] Can't open CoreGraphics : %s%@", v5, v6, v7, v8, 2u);
  }

  __assert_rtn("CoreGraphicsLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/BRContainer.m", 67, "Can't open CoreGraphics");
}

void initCGContextClipToMask_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find CGContextClipToMask in CoreGraphics framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void initUIGraphicsGetCurrentContext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find UIGraphicsGetCurrentContext in UIKit framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void initUIGraphicsGetImageFromCurrentImageContext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find UIGraphicsGetImageFromCurrentImageContext in UIKit framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void initUIGraphicsEndImageContext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find UIGraphicsEndImageContext in UIKit framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void initUIImagePNGRepresentation_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_1(&dword_19CBF0000, v0, v1, "[CRIT] Can't find UIImagePNGRepresentation in UIKit framework :%s%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __br_notify_register_dispatch_block_invoke_cold_1_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 48);
  v3 = 136315394;
  v4 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_3(&dword_19CBF0000, v2, (uint64_t)v2, "[CRIT] UNREACHABLE: Failed to adopt persona for notification %s%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void initUIApplicationWillResignActiveNotification_cold_1()
{
  __assert_rtn("initUIApplicationWillResignActiveNotification", "BRQuery.m", 44, "constant");
}

void UIKitLibrary_cold_1_0()
{
  void *v0;
  NSObject *v1;
  int v2;
  char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"UIKitLibrary", 43);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = dlerror();
    v4 = 2112;
    v5 = v0;
    _os_log_impl(&dword_19CBF0000, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open UIKit : %s%@", (uint8_t *)&v2, 0x16u);
  }

  __assert_rtn("UIKitLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs/framework/notifs/BRQuery.m", 43, "Can't open UIKit");
}

void initUIApplicationDidBecomeActiveNotification_cold_1()
{
  __assert_rtn("initUIApplicationDidBecomeActiveNotification", "BRQuery.m", 45, "constant");
}

void ___preComputeURLSForPersona_block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_19CBF0000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Cannot get home directory%@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void ___preComputeURLSForPersona_block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v0, (uint64_t)v0, "[DEBUG] Running in a ICD File Provider, optimizing flow for URL cache based on home directory. Home Directory: %@%@", v1);
  OUTLINED_FUNCTION_1();
}

void BRContainerIconNameForCKAssetKey_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [[assetKey substringToIndex:4] isEqualToString:@\"icon\"]%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void BRContainerIconSizeForName_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: invalid key '%s'%@");
  OUTLINED_FUNCTION_1();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C980B0](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

uint64_t FPGetTagsDataForTags()
{
  return MEMORY[0x1E0CAA9A0]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x1E0CAA9E0]();
}

uint64_t GSLibraryResolveDocumentId2()
{
  return MEMORY[0x1E0D25D20]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5980](inTagClass, inTag, inConformingToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFStringCompareForHFS()
{
  return MEMORY[0x1E0C9A4E0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLCStringIsPromiseName()
{
  return MEMORY[0x1E0C9A5C0]();
}

uint64_t _CFURLCopyLogicalNameOfPromiseAtURL()
{
  return MEMORY[0x1E0C9A620]();
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x1E0C9A628]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x1E0C9A640]();
}

uint64_t _CFURLCopyPropertiesOfPromiseAtURL()
{
  return MEMORY[0x1E0C9A648]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1E0C9A718]();
}

uint64_t _CFURLIsPromiseName()
{
  return MEMORY[0x1E0C9A720]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1E0C9A730]();
}

uint64_t _CFURLPromiseCopyResourcePropertyForKey()
{
  return MEMORY[0x1E0C9A738]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1E0C9A748]();
}

uint64_t _CFURLPromiseSetResourcePropertyForKey()
{
  return MEMORY[0x1E0C9A750]();
}

uint64_t _CFURLSetPermanentResourcePropertyForKey()
{
  return MEMORY[0x1E0C9A770]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _NSErrorWithFilePathAndErrno()
{
  return MEMORY[0x1E0CB3BD8]();
}

uint64_t _NSErrorWithFilePathErrnoAndVariant()
{
  return MEMORY[0x1E0CB3BE0]();
}

uint64_t _UTTypeCopyPedigreeSet()
{
  return MEMORY[0x1E0CA5A40]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __pthread_fchdir()
{
  return MEMORY[0x1E0C80BB8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x1E0C812A0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int atexit_b(void *a1)
{
  return MEMORY[0x1E0C81650](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1E0C82818]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E20](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1E0C83088](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C830A0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x1E0C83260](__file, __arg0);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1E0C832C8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83380](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

pid_t fork(void)
{
  return MEMORY[0x1E0C83468]();
}

uint64_t fpfs_path_is_safe_save_temp_file_ext()
{
  return MEMORY[0x1E0CAAE10]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1E0C834E0](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1E0C83550](a1, a2, a3, a4);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1E0C83568](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getiopolicy_np(int a1, int a2)
{
  return MEMORY[0x1E0C836D0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C837A8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1E0C837B8](*(_QWORD *)&a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C83A48](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1E0C83A50]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

BOOL nw_path_has_dns(nw_path_t path)
{
  return MEMORY[0x1E0CCFDF8](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE48](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE50]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1E0DE8030](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1E0C84B48](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return MEMORY[0x1E0C84B58](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B60](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B68](a1);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C84BB0](a1, a2, a3, a4, __argv, __envp);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

int putenv(char *a1)
{
  return MEMORY[0x1E0C84F58](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1E0C85118](a1, a2, *(_QWORD *)&a3);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C85130](a1, *(_QWORD *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85340](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1E0C85398](a1, a2, *(_QWORD *)&a3, a4);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C85508](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A68](a1, a2, a3);
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return MEMORY[0x1E0C85B70]();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C86120]();
}

uint64_t xpc_copy_entitlements_for_self()
{
  return MEMORY[0x1E0C86138]();
}

