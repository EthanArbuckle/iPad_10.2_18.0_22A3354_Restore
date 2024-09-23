@implementation NSURL(BRAdditions)

- (uint64_t)_br_isParentOfURL:()BRAdditions strictly:ignoreHomeDirectoryCheck:
{
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!objc_msgSend(v8, "isFileURL"))
    goto LABEL_15;
  if ((a5 & 1) == 0)
  {
    if ((objc_msgSend(a1, "br_isInLocalHomeDirectory") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) _br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:]", 110);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[NSURL(BRAdditions) _br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:].cold.1();

    }
    if (!objc_msgSend(v8, "br_isInLocalHomeDirectory"))
    {
LABEL_15:
      v18 = 0;
      goto LABEL_14;
    }
  }
  v29 = 0;
  v9 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v29, *MEMORY[0x1E0C999B8], 0);
  v10 = v29;
  v11 = v10;
  if (v9 && objc_msgSend(v10, "BOOLValue"))
  {
    objc_msgSend(a1, "removeAllCachedResourceValues");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    v22 = objc_msgSend(v16, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v28, a1, v8, &v27);
    v23 = v27;
    if (v22)
    {
      if (v28)
        v18 = (v28 == 1) & ~a4;
      else
        v18 = 1;

      goto LABEL_13;
    }
    v24 = v23;
    brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) _br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:]", 134);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413058;
      v31 = a1;
      v32 = 2112;
      v33 = v8;
      v34 = 2112;
      v35 = v24;
      v36 = 2112;
      v37 = v25;
      _os_log_error_impl(&dword_19CBF0000, v26, (os_log_type_t)0x90u, "[ERROR] can't tell if '%@'\n  is parent of alias '%@'\n  error %@%@", buf, 0x2Au);
    }

  }
  objc_msgSend(v8, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "br_realpath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "br_realpath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "br_pathRelativeToPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    v17 = objc_msgSend(v16, "length") == 0;
  else
    v17 = v16 == 0;
  v18 = !v17;
LABEL_13:

LABEL_14:
  return v18;
}

- (id)br_realpathURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v1, "br_realpath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (__CFString)br_containerIDIfIsDocumentsContainerURL
{
  id v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  id v13;
  int v14;
  id v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v26;
  int v27;
  __CFString **v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  if (objc_msgSend(a1, "isFileURL"))
  {
    v2 = a1;
    v46 = 0;
    v3 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v46, *MEMORY[0x1E0C999D0], 0);
    v4 = v46;
    v5 = v4;
    if (v3)
    {
      if (objc_msgSend(v4, "BOOLValue"))
      {
        v45 = 0;
        v6 = *MEMORY[0x1E0C99A90];
        v7 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v45, *MEMORY[0x1E0C99A90], 0);
        v8 = v45;
        v9 = v8;
        if (v7)
        {
          v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("Desktop"));
          v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("Documents"));
          if ((v11 & 1) != 0 || v10)
          {
            v44 = 0;
            v26 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v44, *MEMORY[0x1E0C99AA0], 0);
            v13 = v44;

            if (!v26)
            {
              v17 = 0;
              v12 = v9;
              goto LABEL_20;
            }
            v43 = 0;
            v27 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v43, v6, 0);
            v12 = v43;

            if (!v27)
              goto LABEL_16;
            if (objc_msgSend(v12, "isEqualToString:", CFSTR("com~apple~CloudDocs")))
            {
              v28 = BRUbiquitousDocumentsContainerID;
              if (!v11)
                v28 = BRUbiquitousDesktopContainerID;
              v17 = *v28;
              goto LABEL_20;
            }
            if ((v10 & 1) != 0)
              goto LABEL_16;
          }
          else
          {
            v12 = v9;
            v13 = v2;
          }
          if (objc_msgSend(v12, "rangeOfString:", CFSTR("~")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v42 = 0;
            v14 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v42, *MEMORY[0x1E0C9AD30], 0);
            v15 = v42;
            v16 = v15;
            v17 = 0;
            if (v14 && v15)
            {
              v18 = MEMORY[0x1E0C809B0];
              v39[0] = MEMORY[0x1E0C809B0];
              v39[1] = 3221225472;
              v39[2] = __61__NSURL_BRAdditions__br_containerIDIfIsDocumentsContainerURL__block_invoke;
              v39[3] = &unk_1E3DA67D0;
              v19 = v15;
              v40 = v19;
              v41 = v12;
              v20 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AD85E4](v39);
              v33 = 0;
              v34 = &v33;
              v35 = 0x3032000000;
              v36 = __Block_byref_object_copy__8;
              v37 = __Block_byref_object_dispose__8;
              v38 = 0;
              objc_msgSend(MEMORY[0x1E0C99E98], "fp_lmdURL");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21
                && (((void (**)(_QWORD, id, void *))v20)[2](v20, v19, v21),
                    v22 = objc_claimAutoreleasedReturnValue(),
                    v23 = (void *)v34[5],
                    v34[5] = v22,
                    v23,
                    (v24 = (void *)v34[5]) != 0))
              {
                v17 = v24;
              }
              else
              {
                v29[0] = v18;
                v29[1] = 3221225472;
                v29[2] = __61__NSURL_BRAdditions__br_containerIDIfIsDocumentsContainerURL__block_invoke_2;
                v29[3] = &unk_1E3DA67F8;
                v32 = &v33;
                v31 = v20;
                v30 = v19;
                BRPerformWithPersonaAndErrorForURLIfAble(v2, v29);
                v17 = (__CFString *)(id)v34[5];

              }
              _Block_object_dispose(&v33, 8);

            }
            goto LABEL_20;
          }
LABEL_16:
          v17 = 0;
LABEL_20:

          return v17;
        }
        v17 = 0;
        v12 = v8;
      }
      else
      {
        v12 = 0;
        v17 = 0;
      }
      v13 = v2;
      goto LABEL_20;
    }
    v12 = 0;
    v13 = v2;
    goto LABEL_16;
  }
  v17 = 0;
  return v17;
}

- (uint64_t)br_isParentOfURL:()BRAdditions ignoreHomeDirectoryCheck:
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a3;
  v8 = objc_msgSend(a1, "_br_isParentOfURL:strictly:withNonMateralizingIOPolicy:ignoreHomeDirectoryCheck:", v6, 0, BRIsFPFSEnabled(v6, v7), a4);

  return v8;
}

- (uint64_t)br_isExistWithNonMateralizingIOPolicy:()BRAdditions
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NSURL_BRAdditions__br_isExistWithNonMateralizingIOPolicy___block_invoke;
  v8[3] = &unk_1E3DA5708;
  v8[4] = a1;
  v8[5] = &v9;
  v4 = MEMORY[0x1A1AD85E4](v8);
  v5 = (void *)v4;
  if (a3)
    objc_msgSend(MEMORY[0x1E0C99E98], "br_datalessMaterializationOffForBlock:", v4);
  else
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  v6 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)br_getSyncRootWithError:()BRAdditions
{
  void *v5;
  int v6;
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  _QWORD *v25;
  id v26;
  id v27;
  char v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_lmdURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  if (v5)
  {
    v27 = 0;
    v6 = objc_msgSend(MEMORY[0x1E0C99E98], "br_isURL:syncRootOwnedByICloudDrive:withError:", v5, &v28, &v27);
    v7 = v27;
    if (v6)
      v8 = v28 == 0;
    else
      v8 = 1;
    if (!v8 && objc_msgSend(v5, "br_isParentOfURL:ignoreHomeDirectoryCheck:", a1, 1))
    {
      v9 = v5;
      goto LABEL_31;
    }
    if (v7)
    {
      if (a3)
      {
        v7 = objc_retainAutorelease(v7);
        v9 = 0;
        *a3 = v7;
        goto LABEL_31;
      }
LABEL_15:
      v9 = 0;
      goto LABEL_31;
    }
  }
  objc_msgSend(a1, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsString:", CFSTR("Mobile Documents"));

  if (!v11)
  {
    v7 = 0;
    goto LABEL_15;
  }
  objc_msgSend(a1, "pathComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_52_0);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
    v9 = 0;
  }
  else
  {
    v14 = v13;
    v25 = a3;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v15, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v16)
      {
        objc_msgSend(v16, "URLByAppendingPathComponent:", v18);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v16;
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0C99E98];
        v29[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fileURLWithPathComponents:", v21);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v20;

      if (objc_msgSend(v19, "isEqualToString:", CFSTR("Mobile Documents")))
      {
        v26 = v17;
        v23 = objc_msgSend(MEMORY[0x1E0C99E98], "br_isURL:syncRootOwnedByICloudDrive:withError:", v16, &v28, &v26);
        v7 = v26;

        if (v23 && v28)
        {
          v9 = v16;

          goto LABEL_29;
        }
        v17 = v7;
      }

      ++v15;
    }
    while (v15 <= v14);
    if (v25)
    {
      v7 = objc_retainAutorelease(v17);
      v9 = 0;
      *v25 = v7;
    }
    else
    {
      v9 = 0;
      v7 = v17;
    }
LABEL_29:

  }
LABEL_31:

  return v9;
}

- (uint64_t)_br_isParentOfURL:()BRAdditions strictly:withNonMateralizingIOPolicy:ignoreHomeDirectoryCheck:
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v11 = v10;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (a5)
  {
    v12 = (void *)MEMORY[0x1E0C99E98];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __102__NSURL_BRAdditions___br_isParentOfURL_strictly_withNonMateralizingIOPolicy_ignoreHomeDirectoryCheck___block_invoke;
    v15[3] = &unk_1E3DA6640;
    v17 = &v20;
    v15[4] = a1;
    v16 = v10;
    v18 = a4;
    v19 = a6;
    objc_msgSend(v12, "br_datalessMaterializationOffForBlock:", v15);

    v13 = *((_BYTE *)v21 + 24) != 0;
  }
  else
  {
    v13 = objc_msgSend(a1, "_br_isParentOfURL:strictly:ignoreHomeDirectoryCheck:", v10, a4, a6);
    *((_BYTE *)v21 + 24) = v13;
  }
  _Block_object_dispose(&v20, 8);

  return v13;
}

+ (void)br_setIOPolicy:()BRAdditions type:forBlock:
{
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  _BYTE v15[10];
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  getpid();
  if (sandbox_check())
  {
    brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_setIOPolicy:type:forBlock:]", 48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v15 = v8;
      _os_log_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] sandbox_check: current process does not allow iopolicy syscalls%@", buf, 0xCu);
    }

    goto LABEL_5;
  }
  v10 = getiopolicy_np(a4, 1);
  if (v10 == -1)
  {
    brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_setIOPolicy:type:forBlock:]", 54);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v15 = a3;
      *(_WORD *)&v15[4] = 1024;
      *(_DWORD *)&v15[6] = a4;
      v16 = 1024;
      v17 = 1;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] getiopolicy_np failed when setting policy: %d, type: %d, scope: %d%@", buf, 0x1Eu);
    }

    goto LABEL_5;
  }
  v11 = v10;
  if (v10 == a3)
  {
LABEL_5:
    v7[2](v7);
    goto LABEL_6;
  }
  setiopolicy_np(a4, 1, a3);
  v7[2](v7);
  if ((v11 & 0x80000000) == 0)
    setiopolicy_np(a4, 1, v11);
LABEL_6:

}

+ (uint64_t)br_datalessMaterializationOffForBlock:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "br_setIOPolicy:type:forBlock:", 1, 3, a3);
}

- (id)br_realpathURLWithIsDirectory:()BRAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "br_realpath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)br_isInLocalHomeDirectory
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__NSURL_BRAdditions__br_isInLocalHomeDirectory__block_invoke;
  v3[3] = &unk_1E3DA6618;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)br_isParentOfURL:()BRAdditions strictly:
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a3;
  v8 = objc_msgSend(a1, "_br_isParentOfURL:strictly:withNonMateralizingIOPolicy:ignoreHomeDirectoryCheck:", v6, a4, BRIsFPFSEnabled(v6, v7), 0);

  return v8;
}

- (uint64_t)br_isParentOfURL:()BRAdditions
{
  return objc_msgSend(a1, "br_isParentOfURL:strictly:", a3, 0);
}

- (void)br_preCacheBookmarkData:()BRAdditions versionEtag:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
    objc_msgSend(a1, "setTemporaryResourceValue:forKey:", v7, CFSTR("_BRBookmarkData"));
  if (v6)
    objc_msgSend(a1, "setTemporaryResourceValue:forKey:", v6, CFSTR("_BRBookmarkEtag"));

}

- (id)br_cachedBookmarkData
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, CFSTR("_BRBookmarkData"), 0);
  return v2;
}

+ (void)_br_bookmarkableStringForURL:()BRAdditions remoteOpeningAppWithBundleID:onlyAllowItemKnowByServer:completion:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((objc_msgSend(v9, "br_isInSyncedLocation") & 1) != 0)
  {
    v12 = objc_msgSend(v9, "isFileReferenceURL");
    if ((_DWORD)v12)
    {
      objc_msgSend(v9, "filePathURL");
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v14;
    }
    if (BRIsFPFSEnabled(v12, v13))
    {
      v39 = 0;
      v15 = *MEMORY[0x1E0C998F8];
      v38 = 0;
      objc_msgSend(v9, "getResourceValue:forKey:error:", &v39, v15, &v38);
      v16 = v39;
      v17 = v38;
      if (v17)
      {
        v18 = v17;
        (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v17);
      }
      else
      {
        v37 = 0;
        v23 = *MEMORY[0x1E0C999D0];
        v36 = 0;
        objc_msgSend(v9, "getResourceValue:forKey:error:", &v37, v23, &v36);
        v24 = v37;
        v18 = v36;
        if (v18)
        {
          (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v18);
        }
        else
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke;
          v30[3] = &unk_1E3DA6690;
          v34 = v11;
          v35 = a5;
          v31 = v10;
          v32 = v16;
          v33 = v24;
          objc_msgSend(v9, "_br_fetchItemServiceSyncProxy:", v30);

        }
      }

    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __117__NSURL_BRAdditions___br_bookmarkableStringForURL_remoteOpeningAppWithBundleID_onlyAllowItemKnowByServer_completion___block_invoke_3;
      v28 = &unk_1E3DA48F8;
      v21 = v11;
      v29 = v21;
      objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", &v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "getBookmarkDataForURL:onlyAllowItemKnowByServer:allowAccessByBundleID:reply:", v9, a5, v10, v21, v25, v26, v27, v28);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v19);

  }
}

- (uint64_t)br_bookmarkableStringWithEtag:()BRAdditions completion:
{
  return objc_msgSend(a1, "br_bookmarkableStringWithEtag:onlyAllowItemKnowByServer:completion:", a3, 0, a4);
}

- (uint64_t)br_bookmarkableStringWithEtag:()BRAdditions onlyAllowItemKnowByServer:completion:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "br_bookmarkableStringForURL:withEtag:onlyAllowItemKnowByServer:completion:", a1, a3, a4, a5);
}

+ (uint64_t)br_bookmarkableStringForURL:()BRAdditions withEtag:completion:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "br_bookmarkableStringForURL:withEtag:onlyAllowItemKnowByServer:completion:", a3, a4, 0, a5);
}

+ (void)br_bookmarkableStringForURL:()BRAdditions withEtag:onlyAllowItemKnowByServer:completion:
{
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a6;
  if ((objc_msgSend(v9, "br_isInSyncedLocation") & 1) != 0)
  {
    v23 = 0;
    objc_msgSend(v9, "getResourceValue:forKey:error:", &v23, CFSTR("_BRBookmarkData"), 0);
    v11 = v23;
    v12 = 0;
    if (a4)
    {
      v22 = 0;
      objc_msgSend(v9, "getResourceValue:forKey:error:", &v22, CFSTR("_BRBookmarkEtag"), 0);
      v12 = v22;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("invalid")))
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
    }
    else
    {
      if (v12)
        v13 = 0;
      else
        v13 = a4;
      if (!v11 || (v13 & 1) != 0)
      {
        v16 = MEMORY[0x1E0C809B0];
        v17 = 3221225472;
        v18 = __96__NSURL_BRAdditions__br_bookmarkableStringForURL_withEtag_onlyAllowItemKnowByServer_completion___block_invoke;
        v19 = &unk_1E3DA66B8;
        v21 = v10;
        v14 = v9;
        v20 = v14;
        v15 = (void *)MEMORY[0x1A1AD85E4](&v16);
        objc_msgSend(MEMORY[0x1E0C99E98], "_br_bookmarkableStringForURL:remoteOpeningAppWithBundleID:onlyAllowItemKnowByServer:completion:", v14, 0, a5, v15, v16, v17, v18, v19);

      }
      else
      {
        (*((void (**)(id, id, id, _QWORD))v10 + 2))(v10, v11, v12, 0);
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v11);
  }

}

- (void)br_bookmarkableStringForRemoteOpeningAppWithBundleID:()BRAdditions completion:
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E98];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__NSURL_BRAdditions__br_bookmarkableStringForRemoteOpeningAppWithBundleID_completion___block_invoke;
  v9[3] = &unk_1E3DA6668;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "_br_bookmarkableStringForURL:remoteOpeningAppWithBundleID:onlyAllowItemKnowByServer:completion:", a1, a3, 0, v9);

}

+ (id)br_documentURLFromFileObjectID:()BRAdditions error:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *, void *, void *, void *);
  void *v28;
  id v29;
  fsid_t v30;
  stat v31;
  char v32[1024];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentHomeDir");
  memset(&v31, 0, sizeof(v31));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (stat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v31))
  {
    brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 331);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:].cold.5();

  }
  br_documentURLFromFileObjectID_error__deviceID = v31.st_dev;
  v9 = objc_msgSend(v5, "isDocumentID");
  v10 = objc_msgSend(v5, "rawID");
  if (v9)
  {
    v11 = GSLibraryResolveDocumentId2();
    if (!v11)
    {
      if (*__error() != 35 && *__error() != 16 && *__error() != 70)
      {
        brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 340);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
          +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:].cold.3();

        goto LABEL_18;
      }
      brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 343);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:].cold.2((uint64_t)v12, v13);
      goto LABEL_17;
    }
LABEL_13:
    v30.val[0] = br_documentURLFromFileObjectID_error__deviceID;
    v30.val[1] = 0;
    if ((fsgetpath(v32, 0x400uLL, &v30, v11) & 0x8000000000000000) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v32);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "br_logicalURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_24;
    }
    brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 358);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:].cold.4();
LABEL_17:

    goto LABEL_18;
  }
  v11 = v10;
  if (v10)
    goto LABEL_13;
LABEL_18:
  brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:]", 361);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    +[NSURL(BRAdditions) br_documentURLFromFileObjectID:error:].cold.1((uint64_t)v5, (uint64_t)v17, v18);

  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "newLegacySyncProxy");

  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __59__NSURL_BRAdditions__br_documentURLFromFileObjectID_error___block_invoke;
  v28 = &unk_1E3DA66E0;
  v14 = v20;
  v29 = v14;
  objc_msgSend(v14, "resolveFileObjectIDToURL:reply:", v5, &v25);
  objc_msgSend(v14, "result", v25, v26, v27, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v21)
  {
    objc_msgSend(v14, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "result");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v16;
}

+ (void)br_documentURLFromBookmarkableString:()BRAdditions completion:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a3;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__NSURL_BRAdditions__br_documentURLFromBookmarkableString_completion___block_invoke;
  v14[3] = &unk_1E3DA48F8;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __70__NSURL_BRAdditions__br_documentURLFromBookmarkableString_completion___block_invoke_2;
  v12[3] = &unk_1E3DA6708;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "resolveBookmarkDataToURL:reply:", v6, v12);

}

+ (id)br_documentURLFromBookmarkableString:()BRAdditions error:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__NSURL_BRAdditions__br_documentURLFromBookmarkableString_error___block_invoke;
  v16[3] = &unk_1E3DA63C8;
  v16[4] = &v17;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __65__NSURL_BRAdditions__br_documentURLFromBookmarkableString_error___block_invoke_2;
  v15[3] = &unk_1E3DA6730;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v8, "resolveBookmarkDataToURL:reply:", v5, v15);
  v9 = (id)v18[5];
  if (v9)
  {
    brc_bread_crumbs((uint64_t)"+[NSURL(BRAdditions) br_documentURLFromBookmarkableString:error:]", 403);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      v14 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v30 = "+[NSURL(BRAdditions) br_documentURLFromBookmarkableString:error:]";
      v31 = 2080;
      if (!a4)
        v14 = "(ignored by caller)";
      v32 = v14;
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v10;
      _os_log_error_impl(&dword_19CBF0000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  v12 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

- (void)br_containerIDsWithExternalReferencesWithHandler:()BRAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E98];
  v10[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__NSURL_BRAdditions__br_containerIDsWithExternalReferencesWithHandler___block_invoke;
  v8[3] = &unk_1E3DA6758;
  v8[4] = a1;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "br_containerIDsWithExternalReferencesTo:completionHandler:", v6, v8);

}

+ (void)br_containerIDsWithExternalReferencesTo:()BRAdditions completionHandler:
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  if (BRIsFPFSEnabled(v6, v7))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_br_containerIDsWithExternalReferencesTo_completionHandler_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);

  }
  else
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__NSURL_BRAdditions__br_containerIDsWithExternalReferencesTo_completionHandler___block_invoke;
    v12[3] = &unk_1E3DA48F8;
    v10 = v6;
    v13 = v10;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "getBackReferencingContainerIDsForURLs:reply:", v5, v10);
  }

}

- (id)br_pathRelativeToSyncedRootURLForContainerID:()BRAdditions
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8;
  v12 = __Block_byref_object_dispose__8;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__NSURL_BRAdditions__br_pathRelativeToSyncedRootURLForContainerID___block_invoke;
  v7[3] = &unk_1E3DA6618;
  v7[4] = a1;
  v7[5] = &v8;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)br_pathRelativeToMobileDocuments
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__NSURL_BRAdditions__br_pathRelativeToMobileDocuments__block_invoke;
  v3[3] = &unk_1E3DA6618;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (id)br_debugDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  char v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  int v22;
  id v23;
  id v24;
  uint64_t v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("path: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v5 = *MEMORY[0x1E0C99948];
  v33 = 0;
  v6 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v34, v5, &v33);
  v7 = v34;
  v8 = v33;
  v9 = v8;
  if ((v6 & 1) == 0)
  {
    v10 = v8;

    v7 = v10;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("  id:%@\n"), v7);
  v32 = 0;
  v11 = *MEMORY[0x1E0C99BC8];
  v31 = 0;
  v12 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v32, v11, &v31);
  v13 = v32;

  v14 = v31;
  if ((v12 & 1) == 0)
  {
    v15 = v14;

    v13 = v15;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("  volume:%@\n"), v13);
  v30 = 0;
  v16 = *MEMORY[0x1E0C999D0];
  v29 = 0;
  v17 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v30, v16, &v29);
  v18 = v30;

  v19 = v29;
  if ((v17 & 1) == 0)
  {
    v20 = v19;

    v18 = v20;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("  directory:%@\n"), v18);
  v28 = 0;
  v21 = *MEMORY[0x1E0C99AA0];
  v27 = 0;
  v22 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v28, v21, &v27);
  v23 = v28;

  v24 = v27;
  if (v22)
  {
    objc_msgSend(v23, "br_debugDescription");
    v25 = objc_claimAutoreleasedReturnValue();

    v23 = (id)v25;
  }
  else
  {
    v25 = (uint64_t)v24;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("  parent:%@\n"), v25);

  return v4;
}

- (uint64_t)br_isInTrash
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (BRIsFPFSEnabled(a1, a2))
  {
    if (br_isInTrash_once != -1)
      dispatch_once(&br_isInTrash_once, &__block_literal_global_23);
    objc_msgSend(a1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsString:", br_isInTrash_centralizedTrashSubStr);
  }
  else
  {
    objc_msgSend(a1, "br_cloudDocsContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trashURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "br_isParentOfURL:strictly:", a1, 1);

  }
  return v4;
}

- (uint64_t)br_isInSyncedDesktop
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__NSURL_BRAdditions__br_isInSyncedDesktop__block_invoke;
  v3[3] = &unk_1E3DA6618;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)br_isInSyncedDocuments
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__NSURL_BRAdditions__br_isInSyncedDocuments__block_invoke;
  v3[3] = &unk_1E3DA6618;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)br_isInSyncedLocation
{
  return objc_msgSend(a1, "_br_isInSyncedLocationStrictly:", 0);
}

- (uint64_t)br_isStrictlyInSyncedLocation
{
  return objc_msgSend(a1, "_br_isInSyncedLocationStrictly:", 1);
}

- (uint64_t)_br_mightBeInSyncedLocationUnderCurrentPersonaID:()BRAdditions strictly:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  +[BRDaemonConnection syncedRootURLsForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "syncedRootURLsForPersonaID:needsPersonaSwitch:", a3, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "br_isParentOfURL:strictly:", a1, a4) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (uint64_t)_br_isInSyncedLocationStrictly:()BRAdditions
{
  uint64_t v3;
  _QWORD v5[6];
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__NSURL_BRAdditions___br_isInSyncedLocationStrictly___block_invoke;
  v5[3] = &unk_1E3DA6780;
  v5[4] = a1;
  v5[5] = &v7;
  v6 = a3;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v5);
  v3 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (uint64_t)br_isInCloudDocsPrivateStorages
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__NSURL_BRAdditions__br_isInCloudDocsPrivateStorages__block_invoke;
  v3[3] = &unk_1E3DA6618;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)br_isInCloudDocsPrivateStoragesForRemoteDocumentVersions
{
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__NSURL_BRAdditions__br_isInCloudDocsPrivateStoragesForRemoteDocumentVersions__block_invoke;
  v4[3] = &unk_1E3DA67A8;
  v4[4] = &v5;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v4);
  v2 = objc_msgSend((id)v6[5], "br_isParentOfURL:", a1);
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)br_isConflictedWithHandler:()BRAdditions
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  if ((objc_msgSend(a1, "br_isInSyncedLocation") & 1) != 0)
  {
    v7 = 0;
    objc_msgSend(a1, "_br_getAttributeValue:withSecondaryConnection:withError:", CFSTR("BRURLUbiquitousItemIsConflictedKey"), 1, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    v4[2](v4, objc_msgSend(v5, "BOOLValue"), v6);

  }
  else
  {
    v4[2](v4, 0, 0);
  }

}

- (uint64_t)br_isInSharedDocsContainer
{
  return 0;
}

- (id)br_containerID
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__NSURL_BRAdditions__br_containerID__block_invoke;
  v3[3] = &unk_1E3DA6618;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)br_containerIDIfIsDesktopOrDocumentsURL
{
  return 0;
}

- (BOOL)br_isDocumentsContainer
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "br_containerIDIfIsDocumentsContainerURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)br_mightBeBRAlias
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "br_pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("alias")))
    v3 = objc_msgSend(v1, "characterAtIndex:", 0) == 46;
  else
    v3 = 0;

  return v3;
}

- (id)br_cloudDocsContainer
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NSURL_BRAdditions__br_cloudDocsContainer__block_invoke;
  v3[3] = &unk_1E3DA6820;
  v3[4] = a1;
  v3[5] = &v4;
  BRPerformWithPersonaAndErrorForURLIfAble(a1, v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)br_isExternalDocumentReference
{
  int v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v10;

  v10 = 0;
  v2 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v10, *MEMORY[0x1E0C999B8], 0);
  v3 = v10;
  v4 = v3;
  if (v2
    && objc_msgSend(v3, "BOOLValue")
    && (v5 = objc_retainAutorelease(a1),
        getxattr((const char *)objc_msgSend(v5, "fileSystemRepresentation"), "com.apple.clouddocs.security", 0, 0, 0, 1) >= 1))
  {
    brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_isExternalDocumentReference]", 793);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[NSURL(BRAdditions) br_isExternalDocumentReference].cold.1(v5, (uint64_t)v6, v7);

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)br_externalDocumentPropertiesWithError:()BRAdditions
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C9B3C8];
  v13[0] = *MEMORY[0x1E0C998F8];
  v13[1] = v5;
  v6 = *MEMORY[0x1E0C9AD30];
  v13[2] = *MEMORY[0x1E0C9AC50];
  v13[3] = v6;
  v13[4] = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "bookmarkDataWithContentsOfURL:error:", a1, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "resourceValuesForKeys:fromBookmarkData:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_externalDocumentPropertiesWithError:]", 805);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[NSURL(BRAdditions) br_externalDocumentPropertiesWithError:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (id)br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:()BRAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  int v24;
  const __CFString *v25;
  void *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C998F8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C998F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v33 = 0;
    objc_msgSend(a1, "getResourceValue:forKey:error:", &v33, *MEMORY[0x1E0C9AD70], 0);
    v7 = v33;
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C99A90]);
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AC50]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "brc_fileURLWithVolumeDeviceID:fileID:isDirectory:", v8, v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        v11 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v32, v5, 0);
        v12 = v32;
        v13 = v12;
        if (v11 && objc_msgSend(v12, "br_isEqualToNumber:", v6))
        {
          if ((objc_msgSend(v10, "br_isInSyncedLocation") & 1) != 0)
          {
            objc_msgSend(v10, "br_logicalURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:]", 838);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v28 = v15;
              if (v10 == v14)
                v17 = &stru_1E3DA8AC8;
              else
                v17 = CFSTR("promise, returning logical URL ");
              objc_msgSend(v14, "path");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v35 = v17;
              v15 = v28;
              v36 = 2112;
              v37 = v18;
              v38 = 2112;
              v39 = v28;
              _os_log_debug_impl(&dword_19CBF0000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved by fileID to %@%@%@", buf, 0x20u);

            }
          }
          else
          {
            brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:]", 832);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              -[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:].cold.2(v10, (uint64_t)v15, v16);
            v14 = 0;
          }
          goto LABEL_38;
        }
        v19 = v13;
      }
      else
      {
        v19 = 0;
        v10 = 0;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AD30]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)v30;
      if (v20)
        v22 = v30 == 0;
      else
        v22 = 1;
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "brc_fileURLWithVolumeDeviceID:fileID:isDirectory:", v8, v20, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v30, 0, v23);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = 0;
          v24 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v31, v5, 0);
          v13 = v31;

          if (!v24 || !objc_msgSend(v13, "br_isEqualToNumber:", v6))
          {
            v14 = 0;
            v19 = v13;
LABEL_39:
            v21 = (void *)v30;
            goto LABEL_40;
          }
          if ((objc_msgSend(v10, "br_isInSyncedLocation") & 1) != 0)
          {
            objc_msgSend(v10, "br_logicalURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:]", 856);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v29 = v15;
              if (v10 == v14)
                v25 = &stru_1E3DA8AC8;
              else
                v25 = CFSTR("promise, returning logical URL ");
              objc_msgSend(v14, "path");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v35 = v25;
              v15 = v29;
              v36 = 2112;
              v37 = v26;
              v38 = 2112;
              v39 = v29;
              _os_log_debug_impl(&dword_19CBF0000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved by parent ID and name to %@%@%@", buf, 0x20u);

            }
          }
          else
          {
            brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:]", 850);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              -[NSURL(BRAdditions) br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:].cold.1(v10, (uint64_t)v15, v16);
            v14 = 0;
          }
          v9 = v20;
LABEL_38:

          v19 = v13;
          v20 = v9;
          goto LABEL_39;
        }
        v10 = 0;
      }
      v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
  }
  v14 = 0;
LABEL_41:

  return v14;
}

- (id)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v28;
  NSObject *v29;
  id v30;
  _QWORD v31[3];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 867, v31);
  brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 867);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v21 = (const char *)v31[0];
    objc_msgSend(a1, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v33 = v21;
    v34 = 2080;
    v35 = "-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]";
    v36 = 2112;
    v37 = v22;
    v38 = 2112;
    v39 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s: %@%@", buf, 0x2Au);

  }
  objc_msgSend(a1, "br_externalDocumentPropertiesWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C9B3C8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "hasPrefix:", CFSTR("docs.icloud.com:")) & 1) == 0)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 10, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 880);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[NSURL(BRAdditions) br_externalDocumentPropertiesWithError:].cold.1();

      v10 = 0;
      v12 = v11;
      goto LABEL_32;
    }
    objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("docs.icloud.com:"), "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0;
    v13 = (void *)BRCopyDocumentURLForUbiquitousBookmarkData((uint64_t)v12, &v30);
    if (!v13)
    {
      brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 904);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:].cold.1((uint64_t *)&v30, (uint64_t)v23, v24);

      v17 = v30;
      if (v30)
      {
        brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 905);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          v28 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v33 = "-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]";
          v34 = 2080;
          if (!a3)
            v28 = "(ignored by caller)";
          v35 = v28;
          v36 = 2112;
          v37 = v17;
          v38 = 2112;
          v39 = v25;
          _os_log_error_impl(&dword_19CBF0000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      v10 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v17);
      goto LABEL_29;
    }
    brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 889);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:].cold.4(v16, (uint64_t)v14, (uint64_t)buf, v15);
    }

    if ((objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
    {
      v10 = (id)_CFURLPromiseCopyPhysicalURL();
      if (v10)
      {
        CFRelease(v13);
        if (!objc_msgSend(v10, "br_isInCloudDocsPrivateStorages"))
        {
LABEL_32:

          goto LABEL_33;
        }
        brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 896);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:].cold.3();

LABEL_29:
        goto LABEL_32;
      }
      if (objc_msgSend(v13, "br_isInCloudDocsPrivateStorages"))
      {
        brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:]", 899);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[NSURL(BRAdditions) br_URLByResolvingExternalDocumentReferenceWithError:].cold.2();

        v10 = v13;
        goto LABEL_29;
      }
    }
    v10 = v13;
    goto LABEL_32;
  }
  v10 = 0;
LABEL_34:

  __brc_leave_section((uint64_t)v31);
  return v10;
}

- (id)br_itemID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[BRContainerCache containerHelper](BRContainerCache, "containerHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "itemIDForURL:error:", a1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (!v3)
  {
    brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_itemID]", 914);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v10 = a1;
      v11 = 2112;
      v12 = v4;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_19CBF0000, v6, (os_log_type_t)0x90u, "[ERROR] error getting itemID for item at URL %@: %@%@", buf, 0x20u);
    }

  }
  return v3;
}

- (uint64_t)br_documentRecordIDWithError:()BRAdditions
{
  return objc_msgSend(a1, "_br_getAttributeValue:withSecondaryConnection:withError:", CFSTR("BRURLUbiquitousDocumentRecordIDKey"), 0, a3);
}

- (id)br_logicalURL
{
  id v2;

  if (_CFURLIsItemPromiseAtURL())
  {
    v2 = (id)_CFURLCopyLogicalURLOfPromiseAtURL();
    objc_msgSend(v2, "br_addPhysicalProperty");
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (BOOL)br_isPromiseURL
{
  return _CFURLIsItemPromiseAtURL() != 0;
}

- (void)br_addPhysicalProperty
{
  id v3;

  if ((BRIsFPFSEnabled(a1, a2) & 1) == 0)
  {
    if (objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", 0))
    {
      _CFURLPromiseSetPhysicalURL();
    }
    else
    {
      v3 = (id)_CFURLCopyPromiseURLOfLogicalURL();
      if (objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0))
        _CFURLPromiseSetPhysicalURL();

    }
  }
}

- (BOOL)br_setAccessTime:()BRAdditions error:
{
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (BRIsFPFSEnabled(a1, a2))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_overwriteAccessTimeForItemAtURL_atime_reply_);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_setAccessTime:error:]", 959);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v15 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v19 = "-[NSURL(BRAdditions) br_setAccessTime:error:]";
        v20 = 2080;
        if (!a4)
          v15 = "(ignored by caller)";
        v21 = v15;
        v22 = 2112;
        v23 = v7;
        v24 = 2112;
        v25 = v8;
        _os_log_error_impl(&dword_19CBF0000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
    {
      v7 = objc_retainAutorelease(v7);
      v10 = 0;
      *a4 = v7;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "newLegacySyncProxy");

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __45__NSURL_BRAdditions__br_setAccessTime_error___block_invoke;
    v16[3] = &unk_1E3DA47F0;
    v7 = v12;
    v17 = v7;
    objc_msgSend(v7, "overwriteAccessTimeForItemAtURL:atime:reply:", a1, a3, v16);
    if (a4)
    {
      objc_msgSend(v7, "error");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13 == 0;

  }
  return v10;
}

- (id)br_typeIdentifierWithError:()BRAdditions
{
  id v6;

  objc_msgSend(a1, "br_addPhysicalProperty");
  v6 = 0;
  objc_msgSend(a1, "getPromisedItemResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C99AD0], a3);
  return v6;
}

- (uint64_t)br_wouldBeExcludedFromSync
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "br_isExcludedWithMaximumDepth:", 100);

  return v2;
}

- (BOOL)br_isSymLink
{
  id v1;
  _BOOL8 v2;
  id v4;

  v4 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v4, *MEMORY[0x1E0C99A28], 0);
  v1 = v4;
  objc_opt_class();
  v2 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v1, "intValue") != 0;

  return v2;
}

- (uint64_t)br_capabilityToMoveToURL:()BRAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;

  v6 = a3;
  objc_msgSend(a1, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "br_realpath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "br_realpath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = 64;
  }
  else
  {
    objc_msgSend(v6, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "br_isExcludedWithMaximumDepth:", 1024);

    if ((v16 & 1) != 0)
    {
      v14 = 8;
    }
    else
    {
      +[BRContainerCache containerHelper](BRContainerCache, "containerHelper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v17, "br_capabilityToMoveFromURL:toNewParent:error:", a1, v8, a4);

    }
  }

  return v14;
}

- (uint64_t)br_isTopLevelSharedItem
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "br_isInSyncedLocation");
  if ((_DWORD)result)
  {
    BRGetAttributeValueForItem(a1, CFSTR("BRURLUbiquitousIsTopLevelSharedItemKey"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    return v4;
  }
  return result;
}

- (uint64_t)br_isModifiedSinceShared
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "br_isInSyncedLocation");
  if ((_DWORD)result)
  {
    BRGetAttributeValueForItem(a1, CFSTR("BRModifiedSinceSharedKey"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    return v4;
  }
  return result;
}

- (id)br_creatorNameComponentsWithError:()BRAdditions
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "br_isInSyncedLocation");
  if (!(_DWORD)v5)
    return 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  v29 = 0;
  if (BRIsFPFSEnabled(v5, v6))
  {
    objc_msgSend(a1, "_br_itemServiceSyncProxy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __56__NSURL_BRAdditions__br_creatorNameComponentsWithError___block_invoke;
    v23[3] = &unk_1E3DA6848;
    v23[4] = &v24;
    v23[5] = &v30;
    objc_msgSend(v7, "getCreatorNameComponents:", v23);
  }
  else
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newLegacySyncProxy");

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__NSURL_BRAdditions__br_creatorNameComponentsWithError___block_invoke_2;
    v21[3] = &unk_1E3DA6870;
    v7 = v10;
    v22 = v7;
    objc_msgSend(v7, "getCreatorNameComponentsForURL:reply:", a1, v21);
    objc_msgSend(v7, "result");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v31[5];
    v31[5] = v11;

    objc_msgSend(v7, "error");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v25[5];
    v25[5] = v13;

  }
  v15 = (void *)v31[5];
  if (!v15)
  {
    v16 = (id)v25[5];
    if (v16)
    {
      brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions) br_creatorNameComponentsWithError:]", 1056);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v37 = "-[NSURL(BRAdditions) br_creatorNameComponentsWithError:]";
        v38 = 2080;
        if (!a3)
          v20 = "(ignored by caller)";
        v39 = v20;
        v40 = 2112;
        v41 = v16;
        v42 = 2112;
        v43 = v17;
        _os_log_error_impl(&dword_19CBF0000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v16);

    v15 = (void *)v31[5];
  }
  v19 = v15;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v19;
}

- (void)_br_isParentOfURL:()BRAdditions strictly:ignoreHomeDirectoryCheck:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: self.br_isInLocalHomeDirectory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a3, (uint64_t)a3, "[DEBUG] can't find file ID for %@, falling back to bird%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.2(uint64_t a1, NSObject *a2)
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
  _os_log_debug_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] doc ID resolution failed with errno(%d)%@", (uint8_t *)v5, 0x12u);
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  char *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  uint64_t v10;

  OUTLINED_FUNCTION_9_2();
  v3 = OUTLINED_FUNCTION_11();
  v4 = strerror(*v3);
  v5 = 134218498;
  v6 = v1;
  v7 = 2080;
  v8 = v4;
  v9 = 2112;
  v10 = v2;
  _os_log_error_impl(&dword_19CBF0000, v0, (os_log_type_t)0x90u, "[ERROR] can't resolve doc ID \"%lld\"; %s%@",
    (uint8_t *)&v5,
    0x20u);
  OUTLINED_FUNCTION_3_1();
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8_2(&dword_19CBF0000, v0, v1, "[ERROR] can't find url for file object id %@:  %{errno}d%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

+ (void)br_documentURLFromFileObjectID:()BRAdditions error:.cold.5()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_1();
  _os_log_fault_impl(&dword_19CBF0000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't stat %@, failed with errno(%d)%@", v1, 0x1Cu);
  OUTLINED_FUNCTION_3_1();
}

- (void)br_isExternalDocumentReference
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "-[NSURL(BRAdditions) br_isExternalDocumentReference]";
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_19CBF0000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: external document '%@'%@", (uint8_t *)&v6, 0x20u);

  OUTLINED_FUNCTION_3_1();
}

- (void)br_externalDocumentPropertiesWithError:()BRAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] no bookmark data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:()BRAdditions .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a3, v5, "[DEBUG] Resolved by parent ID and name, but target is outside of iCloud Drive: %@%@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)br_URLByResolvingInProcessExternalDocumentReferenceWithProperties:()BRAdditions .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a3, v5, "[DEBUG] Resolved by fileID target is outside of iCloud Drive: %@%@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions .cold.1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a3, (uint64_t)a3, "[DEBUG] can't resolve bookmark data: %@%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !((__bridge NSURL *)logicalURL).br_isInCloudDocsPrivateStorages%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !((__bridge NSURL *)physicalURL).br_isInCloudDocsPrivateStorages%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)br_URLByResolvingExternalDocumentReferenceWithError:()BRAdditions .cold.4(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a4, a3, "[DEBUG] resolved through bookmark data string using bird to logical %@%@", (uint8_t *)a3);

}

@end
