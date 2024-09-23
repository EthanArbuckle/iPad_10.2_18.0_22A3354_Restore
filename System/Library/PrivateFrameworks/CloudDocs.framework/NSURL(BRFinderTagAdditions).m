@implementation NSURL(BRFinderTagAdditions)

- (uint64_t)br_getTagNames:()BRFinderTagAdditions error:
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  ssize_t v22;
  id v23;
  const char *v24;
  ssize_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  const char *v47;
  const char *v48;
  const char *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "br_physicalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (BRIsFPFSEnabled(v7, v8))
  {
    objc_msgSend(MEMORY[0x1E0CAAC78], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemForURL:error:", a1, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v10, "tags");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v10, "tags");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v51 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "label");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v18);

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        }
        while (v15);
      }

      v19 = objc_retainAutorelease(v13);
      *a3 = v19;

    }
LABEL_11:
    v20 = 1;
LABEL_37:

    goto LABEL_38;
  }
  *a3 = 0;
  objc_msgSend(v7, "path");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = getxattr((const char *)objc_msgSend(v21, "fileSystemRepresentation"), "com.apple.metadata:_kMDItemUserTags", 0, 0, 0, 1);

  if ((v22 & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v22);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "path");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = (const char *)objc_msgSend(v23, "fileSystemRepresentation");
      v10 = objc_retainAutorelease(v10);
      v25 = getxattr(v24, "com.apple.metadata:_kMDItemUserTags", (void *)objc_msgSend(v10, "mutableBytes"), v22, 0, 1);

      if ((v25 & 0x8000000000000000) == 0)
      {
        v26 = (void *)MEMORY[0x1E0CB3710];
        v27 = (void *)MEMORY[0x1E0C99E60];
        v28 = objc_opt_class();
        objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "unarchivedObjectOfClasses:fromData:error:", v29, v10, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(*a3, "count"))
          *a3 = 0;
        goto LABEL_11;
      }
      v41 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *__error();
      objc_msgSend(v7, "path");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "br_errorWithPOSIXCode:description:", v42, CFSTR("couldn't copy %llu-byte xattr %s at '%@'"), v22, "com.apple.metadata:_kMDItemUserTags", v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        brc_bread_crumbs((uint64_t)"-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]", 78);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          v49 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v55 = "-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]";
          v56 = 2080;
          if (!a4)
            v49 = "(ignored by caller)";
          v57 = v49;
          v58 = 2112;
          v59 = v33;
          v60 = 2112;
          v61 = v44;
          _os_log_debug_impl(&dword_19CBF0000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v33);
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *__error();
      objc_msgSend(v7, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "br_errorWithPOSIXCode:description:", v31, CFSTR("couldn't allocate %llu-byte buffer for xattr %s at '%@'"), v22, "com.apple.metadata:_kMDItemUserTags", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        brc_bread_crumbs((uint64_t)"-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]", 73);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v47 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v55 = "-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]";
          v56 = 2080;
          if (!a4)
            v47 = "(ignored by caller)";
          v57 = v47;
          v58 = 2112;
          v59 = v33;
          v60 = 2112;
          v61 = v34;
          _os_log_debug_impl(&dword_19CBF0000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v33);
    }

LABEL_36:
    v20 = 0;
    goto LABEL_37;
  }
  if (*__error() != 93)
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *__error();
    objc_msgSend(v7, "path");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "br_errorWithPOSIXCode:description:", v37, CFSTR("couldn't get xattr %s at '%@'"), "com.apple.metadata:_kMDItemUserTags", v38);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      brc_bread_crumbs((uint64_t)"-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]", 62);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v48 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v55 = "-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]";
        v56 = 2080;
        if (!a4)
          v48 = "(ignored by caller)";
        v57 = v48;
        v58 = 2112;
        v59 = v10;
        v60 = 2112;
        v61 = v39;
        _os_log_debug_impl(&dword_19CBF0000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v20 = 0;
      *a4 = v10;
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  v20 = 1;
LABEL_38:

  return v20;
}

- (BOOL)br_setTagNames:()BRFinderTagAdditions error:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  const char *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "br_physicalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__NSURL_BRFinderTagAdditions__br_setTagNames_error___block_invoke;
  v14[3] = &unk_1E3DA4B88;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "fp_withReadWriteAccess:", v14);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    brc_bread_crumbs((uint64_t)"-[NSURL(BRFinderTagAdditions) br_setTagNames:error:]", 132);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      v13 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v17 = "-[NSURL(BRFinderTagAdditions) br_setTagNames:error:]";
      v18 = 2080;
      if (!a4)
        v13 = "(ignored by caller)";
      v19 = v13;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_error_impl(&dword_19CBF0000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v9 == 0;
}

@end
