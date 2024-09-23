id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17)
    v19 = objc_msgSend(v17, "mutableCopy");
  else
    v19 = objc_opt_new();
  v20 = (void *)v19;
  if (v18)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v18, a8);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB2D50]);

  }
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D3ACB8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D3AD00]);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v15, a4, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v15 = a5;
  _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v15, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "code");
      objc_msgSend(v15, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D3ACC0];
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D3ACC0]) && objc_msgSend(v1, "code") == 12)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v1, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v3) && objc_msgSend(v1, "code") == 11)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v1, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v3))
        v4 = objc_msgSend(v1, "code") == 35;
      else
        v4 = 0;

    }
  }

  return v4;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0;
  void *v1;
  __CFString *v2;

  v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v1);
  }
  else
  {
    v2 = CFSTR("(container_error_copy_unlocalized_description returned NULL)");
  }
  return v2;
}

void sub_1B0768AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

uint64_t immutable_open(int a1, char *a2, int a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int *v7;
  int *v8;
  char *v10;
  char *v11;

  v4 = open(a2, a3, a4);
  v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    if (fcntl(v4, 68, 1) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v6 = __error();
      v10 = strerror(*v6);
      MOLogWrite();
    }
    if (fcntl(v5, 48, 1, v10) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v7 = __error();
      v11 = strerror(*v7);
      MOLogWrite();
    }
    if (fcntl(v5, 76, 1, v11) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v8 = __error();
      strerror(*v8);
      MOLogWrite();
    }
  }
  return v5;
}

uint64_t bom_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;

  v4 = BOMCopierUserData();
  if (v4)
  {
    *(_DWORD *)v4 = a3;
    *(_BYTE *)(v4 + 4) = 1;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    MOLogWrite();
  }
  return 2;
}

uint64_t bom_fatal_error_handler()
{
  uint64_t v0;
  uint64_t result;

  v0 = BOMCopierUserData();
  if (v0)
    *(_BYTE *)(v0 + 4) = 1;
  result = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    return MOLogWrite();
  return result;
}

uint64_t bom_fatal_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = BOMCopierUserData();
  if (result)
  {
    *(_DWORD *)result = a3;
    *(_BYTE *)(result + 4) = 1;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    return MOLogWrite();
  }
  return result;
}

uint64_t bom_copier_copy_file_finished_handler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = BOMCopierUserData();
  if (result)
    *(_QWORD *)(result + 16) += a4;
  return result;
}

unint64_t *bom_copier_copy_file_update_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t *result;

  result = (unint64_t *)BOMCopierUserData();
  if (result)
    return (unint64_t *)(*(uint64_t (**)(unint64_t, double))(result[3] + 16))(result[3], (double)(result[2] + a3) / (double)result[1] * 100.0);
  return result;
}

void sub_1B0768F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B07691B0(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _ShouldContinueAfterIncrementingFreed(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1] + a2;
  a1[1] = v3;
  v4 = v2 < 0 || v3 < v2;
  v5 = v4;
  if (v4)
  {
    if (a2 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      goto LABEL_15;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
LABEL_15:
    MOLogWrite();
  }
  return v5;
}

uint64_t _PurgeDirectory(void *a1)
{
  id v1;
  void *v2;
  char v3;
  id v4;
  void *v5;
  _removefile_state *v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v1 = a1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v3 = objc_msgSend(v2, "itemExistsAtURL:error:", v1, &v16);
  v4 = v16;
  v5 = v4;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v4, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v12 = objc_msgSend(v5, "code");

      if (v12 == 2)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          goto LABEL_16;
        goto LABEL_15;
      }
    }
    else
    {

    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
      goto LABEL_16;
LABEL_15:
    objc_msgSend(v1, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v6 = removefile_state_alloc();
  removefile_state_set(v6, 3u, _RemovefileErrorCallback);
  v7 = objc_retainAutorelease(v1);
  objc_msgSend(v7, "fileSystemRepresentation");
  v8 = TraverseDirectoryWithPostTraversal();
  v9 = v5;

  if ((v8 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    objc_msgSend(v7, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  removefile_state_free(v6);
  v10 = v18[3];
  v5 = v9;
LABEL_17:

  _Block_object_dispose(&v17, 8);
  return v10;
}

void sub_1B076C188(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t _RemovefileErrorCallback(_removefile_state *a1)
{
  int dst;

  dst = 0;
  removefile_state_get(a1, 5u, &dst);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(dst);
    MOLogWrite();
  }
  return 0;
}

uint64_t _ProcessDataContainer(void *a1, void *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int ShouldContinueAfterIncrementingFreed;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a1;
  objc_msgSend(v5, "rootURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    objc_msgSend(v6, "path");
    v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (uint64_t)a2;
    MOLogWrite();

  }
  if (a2 == (void *)7 || a2 == (void *)13)
    goto LABEL_11;
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _PurgeDirectory(v8);
  if (v9 >= 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
  {
    v16 = a2;
    v17 = v7;
    v15 = v9;
    MOLogWrite();
  }
  ShouldContinueAfterIncrementingFreed = _ShouldContinueAfterIncrementingFreed(a3, v9);

  if (ShouldContinueAfterIncrementingFreed)
  {
LABEL_11:
    objc_msgSend(v6, "MI_URLByAppendingPathComponents:lastIsDirectory:", &unk_1E6169098, 1, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _PurgeDirectory(v11);
    if (v12 >= 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
      MOLogWrite();
    v13 = _ShouldContinueAfterIncrementingFreed(a3, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t _AppURLContainsEmbeddedMobileProvisionFile(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("embedded.mobileprovision"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemExistsAtURL:", v1);

  return v3;
}

BOOL _AppContainsNetworkExtension(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "firstNetworkExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
  {
    objc_msgSend(v2, "bundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return v3 != 0;
}

id _FirstBuildInSeriesForBuildNumber(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  id v8;
  unsigned int v9;

  v1 = a1;
  if (_FirstBuildInSeriesForBuildNumber_onceToken != -1)
    dispatch_once(&_FirstBuildInSeriesForBuildNumber_onceToken, &__block_literal_global);
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (objc_msgSend(v2, "scanInt:", &v9) && v9 - 100 >= 0xFFFFFF9D)
  {
    v8 = 0;
    v4 = objc_msgSend(v2, "scanCharactersFromSet:intoString:", _FirstBuildInSeriesForBuildNumber_uppercaseEnglishCharacterSet, &v8);
    v5 = v8;
    v6 = v5;
    v3 = 0;
    if (v4)
    {
      if (objc_msgSend(v5, "length") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d%@1"), v9, v6);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t MIPurgeExpendableAppsAndDataForRestore(__CFString *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  unint64_t v11;
  __CFString *v12;
  id v13;
  void *v14;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __CFString *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  id v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  char v35;
  void *v36;
  char v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  __CFString *v43;
  __CFString *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  id v51;
  id v52;
  __CFString *v53;
  char v54;
  __CFString *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  __CFString *v70;
  const __CFString *v71;
  __CFString *v72;
  uint64_t v73;
  id v74;
  id v75;
  void *context;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __CFString *v88;
  _QWORD v89[4];
  id v90;
  id v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97[18];

  v4 = a3;
  v97[16] = *(id *)MEMORY[0x1E0C80C00];
  v78 = a4;
  v79 = 0;
  v7 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v72 = (__CFString *)a3;
    v73 = a4;
    v8 = 78;
    if (a2)
      v8 = 89;
    v70 = a1;
    v71 = (const __CFString *)v8;
    v7 = MOLogWrite();
  }
  context = (void *)MEMORY[0x1B5E0ACCC](v7);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a1, 1, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a2)
    goto LABEL_29;
  v9 = v77;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  v10 = 0;
  v11 = 0;
  v74 = v9;
  while (1)
  {
    v12 = (__CFString *)qword_1B0789FA0[v11];
    v13 = v9;
    v14 = (void *)objc_opt_new();
    *(_QWORD *)&v84 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v84 + 1) = 3221225472;
    *(_QWORD *)&v85 = ___PurgeExpendableDataContainerContentForContainerClass_block_invoke;
    *((_QWORD *)&v85 + 1) = &unk_1E61636B8;
    v15 = v14;
    *(_QWORD *)&v86 = v15;
    MIEnumerateContainersOfClass(v13, (uint64_t)v12, &v84);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v16 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v70 = v12;
      v71 = v16;
      MOLogWrite();
    }
    if (!objc_msgSend(v15, "count", v70, v71, v72, v73))
    {

      goto LABEL_26;
    }
    v17 = (id)objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_58);
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
    v20 = v4;
    if (v19)
      break;
LABEL_24:

    v4 = v20;
    v9 = v74;

LABEL_26:
    v10 = v11++ > 1;
    if (v11 == 3)
    {

      goto LABEL_29;
    }
  }
  v21 = *(_QWORD *)v94;
LABEL_18:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v94 != v21)
      objc_enumerationMutation(v18);
    if (!_ProcessDataContainer(*(void **)(*((_QWORD *)&v93 + 1) + 8 * v22), v12, &v78))
      break;
    if (v19 == ++v22)
    {
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
      if (v19)
        goto LABEL_18;
      goto LABEL_24;
    }
  }

  v4 = v20;
  if (!v10)
    goto LABEL_136;
LABEL_29:
  v23 = v77;
  MICopyCurrentBuildVersion();
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "MI_URLByAppendingPathComponents:lastIsDirectory:", &unk_1E61690B0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v97[0] = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "MI_dictionaryWithContentsOfURL:options:error:", v25, 1, v97);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (__CFString *)v97[0];
    v28 = v27;
    if (v26)
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("LastSystemVersion"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v30 = v29;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = (__CFString *)v30;
      else
        v31 = 0;

      if (v31)
      {
        if ((-[__CFString isEqualToString:](v24, "isEqualToString:", v31) & 1) != 0)
        {
          _FirstBuildInSeriesForBuildNumber(v24);
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v71 = v31;
              v72 = v34;
              v70 = CFSTR("LastSystemVersion");
              MOLogWrite();
            }
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, CFSTR("LastSystemVersion"), v70, v71, v72);
          }
          else
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v70 = v24;
              v71 = CFSTR("LastSystemVersion");
              MOLogWrite();
            }
            objc_msgSend(v26, "removeObjectForKey:", CFSTR("LastSystemVersion"), v70, v71);
          }

          goto LABEL_61;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v71 = v31;
          v72 = v24;
          v70 = CFSTR("LastSystemVersion");
          MOLogWrite();
        }
        goto LABEL_74;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v70 = CFSTR("LastSystemVersion");
        MOLogWrite();
      }
      objc_msgSend(v26, "removeObjectForKey:", CFSTR("LastSystemVersion"), v70);
LABEL_61:
      *(_QWORD *)&v93 = v28;
      v35 = objc_msgSend(v26, "MI_writeAtomicallyToURLMatchingCurrentFileMetadata:format:error:", v25, 200, &v93);
      v32 = (__CFString *)(id)v93;

      if ((v35 & 1) != 0)
      {
        v28 = v32;
        goto LABEL_74;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v25, "path");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v70 = v33;
        v71 = v32;
        MOLogWrite();
LABEL_66:

      }
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v25, "path", v70);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v70 = v33;
        v71 = v28;
        MOLogWrite();
        v26 = 0;
        v31 = 0;
        v32 = v28;
        goto LABEL_66;
      }
      v26 = 0;
      v31 = 0;
      v32 = v27;
    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v32 = 0;
    v26 = 0;
    v31 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager", v70, v71);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v84 = v32;
  v37 = objc_msgSend(v36, "removeItemAtURL:error:", v25, &v84);
  v28 = (__CFString *)(id)v84;

  v38 = gLogHandle;
  if ((v37 & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_74;
    objc_msgSend(v25, "path");
    v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v71 = v28;
    MOLogWrite();

    v38 = gLogHandle;
  }
  if (!v38 || *(int *)(v38 + 44) >= 5)
    MOLogWrite();
LABEL_74:

  v39 = v23;
  v40 = (void *)objc_opt_new();
  *(_QWORD *)&v84 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v84 + 1) = 3221225472;
  *(_QWORD *)&v85 = ___ResetLaunchServicesDatabase_block_invoke;
  *((_QWORD *)&v85 + 1) = &unk_1E61636B8;
  v41 = v40;
  *(_QWORD *)&v86 = v41;
  v42 = (void *)MEMORY[0x1B5E0AE64](&v84);
  MIEnumerateContainersOfClass(v39, 12, v42);
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v43 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v70 = CFSTR("com.apple.lsd");
    v71 = v43;
    MOLogWrite();
  }
  MIEnumerateContainersOfClass(v39, 10, v42);
  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v44 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v70 = CFSTR("com.apple.lsd");
    v71 = v44;
    MOLogWrite();
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v45 = v41;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v94 != v47)
          objc_enumerationMutation(v45);
        _ProcessDataContainer(*(void **)(*((_QWORD *)&v93 + 1) + 8 * i), (void *)0xC, &v78);
      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
    }
    while (v46);
  }

  if (objc_msgSend(v45, "count"))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();

    v75 = v39;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    v49 = (void *)objc_opt_new();
    v50 = (void *)objc_opt_new();
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = ___OffloadApps_block_invoke;
    v89[3] = &unk_1E6163720;
    v51 = v50;
    v90 = v51;
    v92 = v4;
    v52 = v49;
    v91 = v52;
    MIEnumerateContainersOfClass(v75, 1, v89);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v53 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v70 = v53;
      MOLogWrite();
    }
    if (objc_msgSend(v51, "count", v70, v71, v72) || objc_msgSend(v52, "count"))
    {
      objc_msgSend(v51, "sortUsingComparator:", &__block_literal_global_101);
      v88 = v53;
      v54 = MIAssumeIdentityOfUsername();
      v55 = v88;

      v53 = v55;
      if ((v54 & 1) != 0)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
          MOLogWrite();
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v56 = v51;
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
        if (v57)
        {
          v58 = *(_QWORD *)v85;
LABEL_108:
          v59 = 0;
          while (1)
          {
            if (*(_QWORD *)v85 != v58)
              objc_enumerationMutation(v56);
            v60 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v59);
            v61 = (void *)MEMORY[0x1B5E0ACCC]();
            LODWORD(v60) = _ProcessBundleContainer(v4, v60, &v78);
            objc_autoreleasePoolPop(v61);
            if (!(_DWORD)v60)
              break;
            if (v57 == ++v59)
            {
              v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
              if (v57)
                goto LABEL_108;
              goto LABEL_114;
            }
          }
LABEL_127:

        }
        else
        {
LABEL_114:

          v62 = objc_msgSend(v52, "count");
          if (v4 && v62)
          {
            objc_msgSend(v52, "sortUsingComparator:", &__block_literal_global_101);
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
              MOLogWrite();
            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            v56 = v52;
            v63 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v80, &v93, 16);
            if (v63)
            {
              v64 = *(_QWORD *)v81;
LABEL_121:
              v65 = 0;
              while (1)
              {
                if (*(_QWORD *)v81 != v64)
                  objc_enumerationMutation(v56);
                v66 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v65);
                v67 = (void *)MEMORY[0x1B5E0ACCC]();
                LODWORD(v66) = _ProcessBundleContainer(v4, v66, &v78);
                objc_autoreleasePoolPop(v67);
                if (!(_DWORD)v66)
                  break;
                if (v63 == ++v65)
                {
                  v63 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v80, &v93, 16);
                  if (v63)
                    goto LABEL_121;
                  goto LABEL_127;
                }
              }
            }
            goto LABEL_127;
          }
        }
        MIRestoreIdentity();
      }
      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        MOLogWrite();
      }
    }

  }
  else
  {

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
LABEL_136:

  objc_autoreleasePoolPop(context);
  v68 = v79;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  return v68;
}

void sub_1B076D57C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;

  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(exc_buf);
      JUMPOUT(0x1B076D434);
    }
    v9 = objc_begin_catch(exc_buf);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    objc_exception_throw(objc_retainAutorelease(v9));
  }
  _Unwind_Resume(exc_buf);
}

void sub_1B076D664(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1B076D5F4);
  }
  JUMPOUT(0x1B076D72CLL);
}

void sub_1B076D678(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  JUMPOUT(0x1B076D698);
}

void sub_1B076D68C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;

  if (a2)
  {
    if (a2 == 2)
    {
      v9 = objc_begin_catch(exception_object);
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();

      objc_end_catch();
      JUMPOUT(0x1B076D4F8);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1B076D6F8(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1B076D704);
  }
  _Unwind_Resume(a1);
}

void sub_1B076D714(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _ProcessBundleContainer(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t ShouldContinueAfterIncrementingFreed;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  MIPlaceholderConstructor *v21;
  MIPlaceholderConstructor *v22;
  id v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t *v34;
  id v35;
  const char *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char *v61;
  char v62;
  id v63;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  MIPlaceholderConstructor *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t *v72;
  uint64_t *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83[2];

  v5 = a2;
  objc_msgSend(v5, "rootURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 != 1)
  {
LABEL_4:
    objc_msgSend(v5, "appURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_12;
LABEL_11:
      objc_msgSend(v6, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

LABEL_12:
      ShouldContinueAfterIncrementingFreed = 1;
LABEL_112:

      goto LABEL_113;
    }
    if (objc_msgSend(v5, "isPlaceholder"))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_12;
      goto LABEL_11;
    }
    v72 = a3;
    v18 = v5;
    objc_msgSend(v18, "identifier");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appURL");
    v20 = objc_claimAutoreleasedReturnValue();
    MICopyCurrentBuildVersion();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [MIPlaceholderConstructor alloc];
    v83[0] = 0;
    v78 = (id)v20;
    v22 = -[MIPlaceholderConstructor initWithSource:byPreservingFullInfoPlist:error:](v21, "initWithSource:byPreservingFullInfoPlist:error:", v20, 0, v83);
    v23 = v83[0];
    v70 = (void *)v19;
    v67 = v9;
    v68 = v22;
    if (v22)
    {
      if (a1 == 2)
      {
LABEL_22:
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          objc_msgSend(v78, "path");
          v56 = v19;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        objc_msgSend(v18, "rootURL", v56, v59);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.emergencyoffload.temp"), 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[MIPlaceholderConstructor setPerformPlaceholderInstallActions:](v22, "setPerformPlaceholderInstallActions:", 1);
        v82 = v23;
        v26 = -[MIPlaceholderConstructor materializeIntoBundleDirectory:error:](v22, "materializeIntoBundleDirectory:error:", v25, &v82);
        v27 = v82;

        v76 = v6;
        if (v26)
        {
          objc_msgSend(v18, "rootURL");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "URLByAppendingPathComponent:isDirectory:", CFSTR("BundleMetadata.plist"), 0);
          v29 = objc_claimAutoreleasedReturnValue();

          v30 = (void *)v29;
          v81 = v27;
          objc_msgSend(MEMORY[0x1E0D3AD50], "metadataFromURL:error:", v29, &v81);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v81;

          v66 = v30;
          if (!v31)
          {
            v39 = 0;
            v27 = v32;
            goto LABEL_72;
          }
          v64 = v32;
          objc_msgSend(v31, "setInstallType:", 9);
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setInstallDate:", v33);

          v34 = v72;
          if (v69)
            objc_msgSend(v31, "setInstallBuildVersion:");
          v35 = objc_retainAutorelease(v25);
          v36 = (const char *)objc_msgSend(v35, "fileSystemRepresentation");
          v63 = objc_retainAutorelease(v78);
          if (renamex_np(v36, (const char *)objc_msgSend(v63, "fileSystemRepresentation"), 2u))
          {
            v37 = *__error();
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              objc_msgSend(v35, "path");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "path");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = strerror(v37);
              v57 = v38;
              MOLogWrite();

              v34 = v72;
            }
            v39 = 0;
            v27 = v64;
            goto LABEL_73;
          }
          v80 = v64;
          v62 = objc_msgSend(v31, "serializeToURL:error:", v66, &v80);
          v27 = v80;

          if ((v62 & 1) != 0)
          {
            v39 = _PurgeDirectory(v35);
            objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v53, "diskUsageForURL:", v63);

            if (v39 <= v65)
            {
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
                v60 = (void *)v65;
                v61 = (char *)v39;
                v57 = v70;
                MOLogWrite();
              }
            }
            else
            {
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
              {
                v60 = (void *)v39;
                v61 = (char *)v65;
                v57 = v70;
                MOLogWrite();
              }
              v39 -= v65;
            }
            goto LABEL_72;
          }
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            objc_msgSend(v66, "path");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v27;
            MOLogWrite();

          }
        }
        else
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            objc_msgSend(v25, "path");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v27;
            MOLogWrite();

          }
          v31 = 0;
          v66 = 0;
        }
        v39 = 0;
LABEL_72:
        v34 = v72;
LABEL_73:

        if (v25)
        {
          objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = 0;
          v46 = objc_msgSend(v45, "removeItemAtURL:error:", v25, &v79);
          v47 = v79;

          v48 = v7;
          if ((v46 & 1) != 0 || gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            v49 = v25;
          }
          else
          {
            v49 = v25;
            objc_msgSend(v25, "path", v57, v60, v61);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();

          }
          v34 = v72;
          v6 = v76;
        }
        else
        {
          v48 = v7;
          v49 = 0;
          v47 = 0;
          v6 = v76;
        }
        v50 = v31;
        v51 = v18;
        if (v39 >= 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
          MOLogWrite();
        v52 = v66;
        goto LABEL_111;
      }
      -[MIPlaceholderConstructor entitlements](v22, "entitlements");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (MIHasBetaReportsActiveEntitlement(v42))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          goto LABEL_109;
      }
      else if (MIHasMarketplaceEntitlement(v42))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          goto LABEL_109;
      }
      else if (_AppContainsNetworkExtension(v22))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          goto LABEL_109;
      }
      else if (-[MIPlaceholderConstructor isLaunchProhibited](v22, "isLaunchProhibited"))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          goto LABEL_109;
      }
      else
      {
        if (!_AppURLContainsEmbeddedMobileProvisionFile(v78))
        {

          goto LABEL_22;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          goto LABEL_109;
      }
      objc_msgSend(v78, "path");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_110;
      objc_msgSend(v78, "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
LABEL_109:

LABEL_110:
    v48 = v7;
    v51 = v18;

    v47 = 0;
    v50 = 0;
    v52 = 0;
    v49 = 0;
    v39 = 0;
    v34 = v72;
LABEL_111:
    ShouldContinueAfterIncrementingFreed = _ShouldContinueAfterIncrementingFreed(v34, v39);

    v7 = v48;
    v9 = v67;
    goto LABEL_112;
  }
  v8 = v5;
  if (objc_msgSend(v8, "isAppleApp"))
  {

    goto LABEL_4;
  }
  v75 = v6;
  objc_msgSend(v8, "rootURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("iTunesMetadata.plist"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = 0;
  objc_msgSend(MEMORY[0x1E0D3AD68], "metadataFromPlistAtURL:error:", v14, v83);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v83[0];
  if (!v15)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
      goto LABEL_41;
    objc_msgSend(v14, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v77;
    MOLogWrite();
LABEL_103:

    goto LABEL_104;
  }
  objc_msgSend(v15, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16 || !objc_msgSend(v16, "unsignedLongLongValue"))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      goto LABEL_36;
    goto LABEL_102;
  }
  if (!objc_msgSend(v15, "sideLoadedDeviceBasedVPP"))
  {
    if (objc_msgSend(v15, "deviceBasedVPP"))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        goto LABEL_36;
      goto LABEL_102;
    }
    v73 = a3;
    objc_msgSend(v15, "appleID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        goto LABEL_36;
      goto LABEL_102;
    }
    objc_msgSend(v15, "purchaserID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v44;
    if (v44 && objc_msgSend(v44, "unsignedLongLongValue"))
    {
      objc_msgSend(v15, "altDSID");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {

        a3 = v73;
        v6 = v75;
        goto LABEL_4;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
        goto LABEL_37;
    }
    else if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
    {
      goto LABEL_37;
    }
    objc_msgSend(v12, "path");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

    goto LABEL_37;
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
  {
LABEL_102:
    v41 = v77;
    goto LABEL_103;
  }
LABEL_36:
  objc_msgSend(v12, "path");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  MOLogWrite();
LABEL_37:

LABEL_41:
LABEL_104:

  ShouldContinueAfterIncrementingFreed = 1;
  v6 = v75;
LABEL_113:

  return ShouldContinueAfterIncrementingFreed;
}

void sub_1B076E834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id MobileInstallationHelperServiceProtocolInterface()
{
  void *WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&MobileInstallationHelperServiceProtocolInterface_lock);
  WeakRetained = objc_loadWeakRetained(&MobileInstallationHelperServiceProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEBD590);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&MobileInstallationHelperServiceProtocolInterface_weakInterface, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallationHelperServiceProtocolInterface_lock);
  return WeakRetained;
}

void sub_1B076ED04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0776710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0776930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1B0776B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0776D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0776EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B07770B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B077720C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0777378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationInstallForInstallCoordinationWithError(void *a1, uint64_t a2, void *a3, void *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, void *a8)
{
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v15 = (objc_class *)MEMORY[0x1E0D3AD48];
  v16 = a8;
  v17 = a4;
  v18 = a3;
  v19 = a1;
  v20 = [v15 alloc];
  objc_msgSend(v18, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithBundleID:", v21);

  v27 = 0;
  v23 = MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError(v19, v22, a2, v18, v17, &v27, a6, a7, v16, 0);

  v24 = v27;
  if (a5 && (_DWORD)v23)
  {
    v28 = *MEMORY[0x1E0D3AD88];
    objc_msgSend(MEMORY[0x1E0D3AD18], "bundleRecordArrayToInfoDictionaryArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

uint64_t MobileInstallationInstallApplicationWithIdentityWithError(void *a1, void *a2, uint64_t a3, void *a4, void *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, void *a9)
{
  return MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}

uint64_t MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError(void *a1, void *a2, uint64_t a3, void *a4, void *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, void *a9, void *a10)
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v30;
  id v31;
  id v32;
  _QWORD v33[8];
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[3];
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v32 = a1;
  v31 = a2;
  v30 = a4;
  v14 = a5;
  v15 = a9;
  v16 = a10;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__0;
  v63 = __Block_byref_object_dispose__0;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  v58 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v17 = MEMORY[0x1E0C809B0];
  v44 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke;
  v37[3] = &unk_1E6163B40;
  v40 = v51;
  v18 = v15;
  v39 = v18;
  v19 = v14;
  v38 = v19;
  v20 = (void *)MEMORY[0x1B5E0AE64](v37);
  v34[0] = v17;
  v34[1] = 3221225472;
  v34[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3;
  v34[3] = &unk_1E6163B18;
  v21 = v16;
  v36 = v21;
  v22 = v19;
  v35 = v22;
  v23 = (void *)MEMORY[0x1B5E0AE64](v34);
  +[MIInstallerClient installerWithProgressBlock:releaseTerminationAssertionBlock:](MIInstallerClient, "installerWithProgressBlock:releaseTerminationAssertionBlock:", v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5;
  v33[3] = &unk_1E6163B90;
  v33[4] = &v45;
  v33[5] = &v53;
  v33[6] = &v59;
  v33[7] = &v41;
  objc_msgSend(v24, "installURL:identity:targetingDomain:withOptions:returningResultInfo:completion:", v32, v31, a3, v30, a6 != 0, v33);

  if (*((_BYTE *)v42 + 24))
  {
    if (a6)
      *a6 = objc_retainAutorelease((id)v60[5]);
  }
  else
  {
    if (a8)
    {
      *a8 = objc_retainAutorelease((id)v46[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
    _SendError(v20, (void *)v46[5]);
  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v54[5]);
  v25 = *((unsigned __int8 *)v42 + 24);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v25;
}

void sub_1B077799C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 232), 8);
  _Block_object_dispose((const void *)(v42 - 200), 8);
  _Block_object_dispose((const void *)(v42 - 152), 8);
  _Unwind_Resume(a1);
}

void _SendError(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(id, void *);

  v15 = a1;
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 != (void *)*MEMORY[0x1E0CB28A8])
    {

LABEL_4:
      objc_msgSend(v3, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LegacyErrorString"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v9 = v8;
      if (!v8)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          MOLogWrite();
        v9 = CFSTR("APIInternalError");
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("Error"));
      objc_msgSend(v3, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D3ACD0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("ErrorDetail"));

      goto LABEL_19;
    }
    if (objc_msgSend(v3, "code") == 4097)
    {

    }
    else
    {
      v12 = objc_msgSend(v3, "code");

      if (v12 != 4099)
        goto LABEL_4;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("ServiceConnectionInterrupted"), CFSTR("Error"));
LABEL_19:
    objc_msgSend(v3, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("ErrorDescription"));
    v15[2](v15, v4);

    goto LABEL_22;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
LABEL_22:

}

id MobileInstallationStageApplicationUpdateWithIdentityWithError(void *a1, void *a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a1;
  v10 = a2;
  v11 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v12 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __MobileInstallationStageApplicationUpdateWithIdentityWithError_block_invoke;
  v15[3] = &unk_1E6163BB8;
  v15[4] = &v16;
  v15[5] = &v22;
  objc_msgSend(v12, "stageInstallURL:identity:targetingDomain:withOptions:completion:", v9, v10, a3, v11, v15);

  if (!v17[5])
  {
    if (a5)
    {
      *a5 = objc_retainAutorelease((id)v23[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void sub_1B077802C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError(void *a1, void *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, void *a6, void *a7)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v26;
  _QWORD v27[8];
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[3];
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v26 = a1;
  v11 = a2;
  v12 = a6;
  v13 = a7;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v14 = MEMORY[0x1E0C809B0];
  v38 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke;
  v31[3] = &unk_1E6163B40;
  v34 = v45;
  v15 = v12;
  v33 = v15;
  v16 = v11;
  v32 = v16;
  v17 = (void *)MEMORY[0x1B5E0AE64](v31);
  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_3;
  v28[3] = &unk_1E6163B18;
  v18 = v13;
  v30 = v18;
  v19 = v16;
  v29 = v19;
  v20 = (void *)MEMORY[0x1B5E0AE64](v28);
  +[MIInstallerClient installerWithProgressBlock:releaseTerminationAssertionBlock:](MIInstallerClient, "installerWithProgressBlock:releaseTerminationAssertionBlock:", v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_5;
  v27[3] = &unk_1E6163B90;
  v27[4] = &v39;
  v27[5] = &v47;
  v27[6] = &v53;
  v27[7] = &v35;
  objc_msgSend(v21, "finalizeStagedInstallForUUID:returningResultInfo:completion:", v26, a3 != 0, v27);

  if (*((_BYTE *)v36 + 24))
  {
    if (a3)
      *a3 = objc_retainAutorelease((id)v54[5]);
    if (a4)
      *a4 = objc_retainAutorelease((id)v48[5]);
  }
  else
  {
    if (a5)
    {
      *a5 = objc_retainAutorelease((id)v40[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
    _SendError(v17, (void *)v40[5]);
  }
  v22 = *((unsigned __int8 *)v36 + 24);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v22;
}

void sub_1B07783FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationCancelStagedUpdateForUUIDWithError(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __MobileInstallationCancelStagedUpdateForUUIDWithError_block_invoke;
  v7[3] = &unk_1E6163BE0;
  v7[4] = &v8;
  v7[5] = &v12;
  objc_msgSend(v4, "cancelUpdateForStagedUUID:completion:", v3, v7);

  if (!*((_BYTE *)v9 + 24))
  {
    if (a2)
    {
      *a2 = objc_retainAutorelease((id)v13[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void sub_1B0778810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id MobileInstallationRegisterPlaceholderForReference(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __MobileInstallationRegisterPlaceholderForReference_block_invoke;
  v7[3] = &unk_1E6163C08;
  v7[4] = &v14;
  v7[5] = &v8;
  objc_msgSend(v4, "registerPlaceholderForReference:completion:", v3, v7);

  if (!v15[5])
  {
    if (a2)
    {
      *a2 = objc_retainAutorelease((id)v9[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_1B0778A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationRevertForInstallCoordinationWithError(void *a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5, void *a6)
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;

  v11 = (objc_class *)MEMORY[0x1E0D3AD48];
  v12 = a6;
  v13 = a3;
  v14 = a2;
  v15 = a1;
  v16 = (void *)objc_msgSend([v11 alloc], "initWithBundleID:", v15);

  v17 = MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(v16, v14, v13, a4, a5, v12, 0);
  return v17;
}

uint64_t MobileInstallationRevertApplicationWithIdentityWithError(void *a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5, void *a6)
{
  return MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(void *a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v30;
  id v32;
  _QWORD v33[8];
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[3];
  char v60;

  v12 = a1;
  v32 = a2;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__0;
  v57[4] = __Block_byref_object_dispose__0;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__0;
  v55 = __Block_byref_object_dispose__0;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  v16 = MEMORY[0x1E0C809B0];
  v46 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke;
  v37[3] = &unk_1E6163B40;
  v40 = v59;
  v17 = v14;
  v39 = v17;
  v18 = v13;
  v38 = v18;
  v19 = (void *)MEMORY[0x1B5E0AE64](v37);
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3;
  v34[3] = &unk_1E6163B18;
  v20 = v15;
  v36 = v20;
  v21 = v18;
  v35 = v21;
  v23 = (void *)MEMORY[0x1B5E0AE64](v34);
  if (v12)
  {
    v24 = (void *)MEMORY[0x1B5E0ACCC]();
    +[MIInstallerClient installerWithProgressBlock:releaseTerminationAssertionBlock:](MIInstallerClient, "installerWithProgressBlock:releaseTerminationAssertionBlock:", v19, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    v33[1] = 3221225472;
    v33[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5;
    v33[3] = &unk_1E6163B90;
    v33[4] = &v41;
    v33[5] = v57;
    v33[6] = &v51;
    v33[7] = &v47;
    objc_msgSend(v25, "revertIdentity:withOptions:completion:", v12, v32, v33);

    objc_autoreleasePoolPop(v24);
  }
  else
  {
    _CreateAndLogError((uint64_t)"MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError", 1674, (void *)*MEMORY[0x1E0D3ACC0], 25, 0, &unk_1E6169070, CFSTR("Bundle ID supplied to revert was nil."), v22, v30);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v42[5];
    v42[5] = v26;

  }
  if (a4 && *((_BYTE *)v48 + 24))
  {
    *a4 = objc_retainAutorelease((id)v52[5]);
  }
  else if (!*((_BYTE *)v48 + 24))
  {
    if (a5)
    {
      *a5 = objc_retainAutorelease((id)v42[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
    _SendError(v19, (void *)v42[5]);
  }
  v28 = *((unsigned __int8 *)v48 + 24);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);

  return v28;
}

void sub_1B0778F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v40;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 232), 8);
  _Block_object_dispose((const void *)(v40 - 184), 8);
  _Block_object_dispose((const void *)(v40 - 136), 8);
  _Unwind_Resume(a1);
}

id MobileInstallationUninstallForInstallCoordinationWithError(void *a1, void *a2, void *a3, _QWORD *a4, void *a5)
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0D3AD38];
  MobileInstallationICLRecordsUninstallForInstallCoordinationWithError(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uninstallRecordArrayToDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id MobileInstallationICLRecordsUninstallForInstallCoordinationWithError(void *a1, void *a2, void *a3, _QWORD *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
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
  _QWORD v41[3];
  char v42;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v13 = MEMORY[0x1E0C809B0];
  v34 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke;
  v25[3] = &unk_1E6163B40;
  v28 = v41;
  v14 = v12;
  v27 = v14;
  v15 = v11;
  v26 = v15;
  v16 = (void *)MEMORY[0x1B5E0AE64](v25);
  +[MIInstallerClient installerWithProgressBlock:](MIInstallerClient, "installerWithProgressBlock:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_3;
  v21[3] = &unk_1E6163C30;
  v23 = &v29;
  v18 = v16;
  v22 = v18;
  v24 = &v35;
  objc_msgSend(v17, "uninstallIdentifiers:withOptions:completion:", v9, v10, v21);

  if (!v36[5])
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease((id)v30[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v19 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(v41, 8);
  return v19;
}

void sub_1B0779454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationUninstallAppWithIdentity(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v5 = a1;
  v6 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __MobileInstallationUninstallAppWithIdentity_block_invoke;
  v10[3] = &unk_1E6163C58;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v7, "uninstallIdentity:withOptions:completion:", v5, v6, v10);

  if (!*((_BYTE *)v18 + 24))
  {
    if (a3)
    {
      *a3 = objc_retainAutorelease((id)v12[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v8 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void sub_1B077978C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id MIFinalizeReferenceForInstalledAppWithError(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __MIFinalizeReferenceForInstalledAppWithError_block_invoke;
  v7[3] = &unk_1E6163C08;
  v7[4] = &v8;
  v7[5] = &v14;
  objc_msgSend(v4, "finalizeReference:withCompletion:", v3, v7);

  if (!v9[5])
  {
    if (a2)
    {
      *a2 = objc_retainAutorelease((id)v15[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_1B077997C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id MIAcquireReferenceForInstalledAppWithError(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a1;
  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v9 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __MIAcquireReferenceForInstalledAppWithError_block_invoke;
  v12[3] = &unk_1E6163C80;
  v12[4] = &v13;
  v12[5] = &v19;
  objc_msgSend(v9, "acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:withCompletion:", v7, a2, v8, v12);

  if (!v14[5])
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease((id)v20[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_1B0779BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t MIInvalidateReferenceForInstalledAppWithError(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __MIInvalidateReferenceForInstalledAppWithError_block_invoke;
  v7[3] = &unk_1E6163C58;
  v7[4] = &v12;
  v7[5] = &v8;
  objc_msgSend(v4, "invalidateReference:withCompletion:", v3, v7);

  if (!*((_BYTE *)v9 + 24))
  {
    if (a2)
    {
      *a2 = objc_retainAutorelease((id)v13[5]);
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void sub_1B0779DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationLookupUninstalled(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1B5E0ACCC]();
  v3 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (!a1)
  {
    v4 = (void *)objc_opt_new();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __MobileInstallationLookupUninstalled_block_invoke;
    v6[3] = &unk_1E6163CA8;
    v6[4] = &v7;
    objc_msgSend(v4, "lookupUninstalledWithOptions:completion:", 0, v6);

    v3 = v8[3];
  }
  _Block_object_dispose(&v7, 8);
  objc_autoreleasePoolPop(v2);
  return v3;
}

void sub_1B0779EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationClearUninstalled(const __CFArray *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (a2)
  {
    v5 = 0xFFFFFFFFLL;
  }
  else if (CFArrayGetCount(a1))
  {
    v6 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __MobileInstallationClearUninstalled_block_invoke;
    v8[3] = &unk_1E6163AC8;
    v8[4] = &v9;
    objc_msgSend(v6, "clearUninstalledIdentifiers:withOptions:completion:", a1, 0, v8);

    v5 = *((unsigned int *)v10 + 6);
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_1B077A090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationLookupSystemAppState(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1B5E0ACCC]();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __MobileInstallationLookupSystemAppState_block_invoke;
  v6[3] = &unk_1E6163CA8;
  v6[4] = &v7;
  objc_msgSend(v3, "lookupSystemAppStateWithOptions:completion:", a1, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  objc_autoreleasePoolPop(v2);
  return v4;
}

void sub_1B077A1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationUpdateSystemAppState(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationUpdateSystemAppState_block_invoke;
  v8[3] = &unk_1E6163AC8;
  v8[4] = &v9;
  objc_msgSend(v5, "updateSystemAppStateForIdentifier:appState:completion:", a1, a2, v8);

  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  objc_autoreleasePoolPop(v4);
  return v6;
}

void sub_1B077A35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationCopyInstalledDeveloperAppsForLaunchServices()
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  return 0;
}

BOOL MobileInstallationRegisterContentsForDiskImageAtURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  _BOOL8 v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __MobileInstallationRegisterContentsForDiskImageAtURL_block_invoke;
  v9[3] = &unk_1E6163C58;
  v9[4] = &v14;
  v9[5] = &v10;
  objc_msgSend(v5, "registerContentsForDiskImageAtURL:completion:", v3, v9);

  objc_autoreleasePoolPop(v4);
  v6 = *((unsigned __int8 *)v11 + 24);
  if (a2 && !*((_BYTE *)v11 + 24))
  {
    *a2 = objc_retainAutorelease((id)v15[5]);
    v6 = *((unsigned __int8 *)v11 + 24);
  }
  v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_1B077A570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL MobileInstallationUnregisterContentsForDiskImageAtURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  _BOOL8 v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __MobileInstallationUnregisterContentsForDiskImageAtURL_block_invoke;
  v9[3] = &unk_1E6163C58;
  v9[4] = &v14;
  v9[5] = &v10;
  objc_msgSend(v5, "unregisterContentsForDiskImageAtURL:completion:", v3, v9);

  objc_autoreleasePoolPop(v4);
  v6 = *((unsigned __int8 *)v11 + 24);
  if (a2 && !*((_BYTE *)v11 + 24))
  {
    *a2 = objc_retainAutorelease((id)v15[5]);
    v6 = *((unsigned __int8 *)v11 + 24);
  }
  v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_1B077A764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id MobileInstallationEnumerateAllInstalledItemDictionaries(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a1;
  v4 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  +[MIInstallerClient installerWithAppDictionaryEnumerator:](MIInstallerClient, "installerWithAppDictionaryEnumerator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationEnumerateAllInstalledItemDictionaries_block_invoke;
  v8[3] = &unk_1E6163AC8;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateInstalledAppsWithOptions:completion:", v3, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1B077A910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MobileInstallationUpdatePlaceholderMetadata(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v9 = a1;
  v10 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v11 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __MobileInstallationUpdatePlaceholderMetadata_block_invoke;
  v14[3] = &unk_1E6163AC8;
  v14[4] = &v15;
  objc_msgSend(v11, "updatePlaceholderMetadataForApp:installType:failureReason:underlyingError:failureSource:completion:", v9, a2, a3, v10, a5, v14);

  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void sub_1B077AA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MobileInstallationCopyAppMetadata(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationCopyAppMetadata_block_invoke;
  v8[3] = &unk_1E6163CD0;
  v8[4] = &v9;
  v8[5] = &v15;
  objc_msgSend(v4, "getAppMetadataForApp:completion:", v3, v8);

  v5 = (void *)v10[5];
  if (a2 && !v5)
  {
    *a2 = objc_retainAutorelease((id)v16[5]);
    v5 = (void *)v10[5];
  }
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void sub_1B077ABA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id MobileInstallationCopyFrameworkInfoForLaunchServices(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
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

  v5 = a1;
  v6 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __MobileInstallationCopyFrameworkInfoForLaunchServices_block_invoke;
  v11[3] = &unk_1E6163CF8;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v7, "fetchInfoForFrameworkAtURL:options:completion:", v5, v6, v11);

  v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v13[5]);
    v8 = (void *)v19[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void sub_1B077AD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id MobileInstallationGetFrameworkBundleRecordsForLaunchServices(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
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

  v5 = a1;
  v6 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __MobileInstallationGetFrameworkBundleRecordsForLaunchServices_block_invoke;
  v11[3] = &unk_1E6163CF8;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v7, "fetchInfoForFrameworkAtURL:options:completion:", v5, v6, v11);

  v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = objc_retainAutorelease((id)v13[5]);
    v8 = (void *)v19[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void sub_1B077AF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id MobileInstallationCopyContainerizedAppInfoForLaunchServices(void *a1, void *a2, _QWORD *a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D3AD18];
  MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleRecordArrayToInfoDictionaryArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a1;
  v6 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v7 = (void *)MEMORY[0x1B5E0ACCC]();
  v8 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices_block_invoke;
  v12[3] = &unk_1E6163CF8;
  v12[4] = &v13;
  v12[5] = &v19;
  objc_msgSend(v8, "fetchInfoForContainerizedAppWithBundleID:options:completion:", v5, v6, v12);

  objc_autoreleasePoolPop(v7);
  v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v9 = (void *)v20[5];
  }
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_1B077B17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationCopyAppInfoForLaunchServicesWithWrapperURL(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;

  _CreateAndLogError((uint64_t)"MobileInstallationCopyAppInfoForLaunchServicesWithWrapperURL", 2140, (void *)*MEMORY[0x1E0D3ACC0], 161, 0, 0, CFSTR("%s is unavailable on this platform"), a8, (uint64_t)"MobileInstallationCopyAppInfoForLaunchServicesWithWrapperURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return 0;
}

uint64_t MobileInstallationUpdateSinfDataForInstallCoordinationWithWrapperURL(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;

  _CreateAndLogError((uint64_t)"MobileInstallationUpdateSinfDataForInstallCoordinationWithWrapperURL", 2170, (void *)*MEMORY[0x1E0D3ACC0], 161, 0, 0, CFSTR("%s is unavailable on this platform"), a8, (uint64_t)"MobileInstallationUpdateSinfDataForInstallCoordinationWithWrapperURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return 0;
}

BOOL MobileInstallationUpdateiTunesMetadataForInstallCoordinationWithWrapperURL(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;

  _CreateAndLogError((uint64_t)"MobileInstallationUpdateiTunesMetadataForInstallCoordinationWithWrapperURL", 2194, (void *)*MEMORY[0x1E0D3ACC0], 161, 0, 0, CFSTR("%s is unavailable on this platform"), a8, (uint64_t)"MobileInstallationUpdateiTunesMetadataForInstallCoordinationWithWrapperURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);

  return v10 == 0;
}

uint64_t MobileInstallationCopyDiskUsageForLaunchServices(void *a1, uint64_t a2)
{
  void *v4;
  CFTypeID v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  if (!a2)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_13;
    goto LABEL_12;
  }
  v5 = CFGetTypeID(a1);
  if (CFStringGetTypeID() != v5)
  {
    if (CFArrayGetTypeID() == v5)
    {
      v6 = a1;
      goto LABEL_9;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
LABEL_13:
      v9 = 0;
      goto LABEL_14;
    }
LABEL_12:
    MOLogWrite();
    goto LABEL_13;
  }
  v11[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D3AD40], "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diskUsageForLaunchServicesWithBundleIDs:options:withError:", v7, a2, 0);
  v9 = objc_claimAutoreleasedReturnValue();

LABEL_14:
  objc_autoreleasePoolPop(v4);
  return v9;
}

uint64_t MobileInstallationRegisterSafeHarbor(uint64_t a1, uint64_t a2, const char *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = (void *)MEMORY[0x1B5E0ACCC]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", a3, strlen(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3AD48]), "initWithBundleID:", a2);
    v8 = (MobileInstallationRegisterSafeHarborForContainerClassWithIdentity(v6, v7, 2, 0, 0) - 1);

  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v8 = 0xFFFFFFFFLL;
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

BOOL MobileInstallationRegisterSafeHarborForContainerClassWithIdentity(void *a1, void *a2, uint64_t a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  _BOOL8 v17;
  uint64_t v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v9 = a1;
  v10 = a2;
  v11 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v13 = (void *)MEMORY[0x1B5E0ACCC]();
  if (v11)
  {
    _CreateAndLogError((uint64_t)"MobileInstallationRegisterSafeHarborForContainerClassWithIdentity", 2276, (void *)*MEMORY[0x1E0D3ACC0], 25, 0, 0, CFSTR("The options parameter is currently unused and must be nil"), v12, v19[0]);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v21[5];
    v21[5] = v14;
  }
  else
  {
    v15 = (void *)objc_opt_new();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__MobileInstallationRegisterSafeHarborForContainerClassWithIdentity_block_invoke;
    v19[3] = (uint64_t)&unk_1E6163C58;
    v19[4] = (uint64_t)&v20;
    v19[5] = (uint64_t)&v26;
    objc_msgSend(v15, "registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:", v9, v10, a3, 0, v19);
  }

  objc_autoreleasePoolPop(v13);
  v16 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
  {
    *a5 = objc_retainAutorelease((id)v21[5]);
    v16 = *((unsigned __int8 *)v27 + 24);
  }
  v17 = v16 != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v17;
}

void sub_1B077B784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL MobileInstallationRegisterSafeHarborForContainerType(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;

  v6 = (void *)MEMORY[0x1B5E0ACCC]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3AD48]), "initWithBundleID:", a2);
  v8 = _ContainerTypeForMCMContainerType(a3);
  v9 = MobileInstallationRegisterSafeHarborForContainerClassWithIdentity(a1, v7, v8, 0, 0);

  objc_autoreleasePoolPop(v6);
  return v9;
}

uint64_t _ContainerTypeForMCMContainerType(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0xF)
    return 0;
  return result;
}

uint64_t MobileInstallationRemoveSafeHarbor(uint64_t a1, uint64_t a2)
{
  return (MobileInstallationRemoveSafeHarborForContainerType(a2, 2) - 1);
}

BOOL MobileInstallationRemoveSafeHarborForContainerType(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3AD48]), "initWithBundleID:", a1);
  v6 = _ContainerTypeForMCMContainerType(a2);
  v7 = MobileInstallationRemoveSafeHarborForContainerClassWithIdentity(v5, v6, 0, 0);

  objc_autoreleasePoolPop(v4);
  return v7;
}

BOOL MobileInstallationRemoveSafeHarborForContainerClassWithIdentity(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  _BOOL8 v14;
  uint64_t v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v7 = a1;
  v8 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v10 = (void *)MEMORY[0x1B5E0ACCC]();
  if (v8)
  {
    _CreateAndLogError((uint64_t)"MobileInstallationRemoveSafeHarborForContainerClassWithIdentity", 2336, (void *)*MEMORY[0x1E0D3ACC0], 25, 0, 0, CFSTR("The options parameter is currently unused and must be nil"), v9, v16[0]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v18[5];
    v18[5] = v11;
  }
  else
  {
    v12 = (void *)objc_opt_new();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)__MobileInstallationRemoveSafeHarborForContainerClassWithIdentity_block_invoke;
    v16[3] = (uint64_t)&unk_1E6163C58;
    v16[4] = (uint64_t)&v17;
    v16[5] = (uint64_t)&v23;
    objc_msgSend(v12, "removeSafeHarborForIdentity:ofType:withOptions:completion:", v7, a2, 0, v16);
  }

  objc_autoreleasePoolPop(v10);
  v13 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v13 = *((unsigned __int8 *)v24 + 24);
  }
  v14 = v13 != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void sub_1B077BB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationCopySafeHarbors()
{
  return MobileInstallationCopySafeHarborsForContainerType(2);
}

uint64_t MobileInstallationCopySafeHarborsForContainerType(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1B5E0ACCC]();
  v3 = _ContainerTypeForMCMContainerType(a1);
  objc_msgSend(MEMORY[0x1E0D3AD60], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryPersonaString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MobileInstallationCopySafeHarborsForContainerClass(v3, v5, 0, 0);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v6;
}

id MobileInstallationCopySafeHarborsForContainerClass(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  id v14;
  uint64_t v16[6];
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

  v7 = a2;
  v8 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v10 = (void *)MEMORY[0x1B5E0ACCC]();
  if (v8)
  {
    _CreateAndLogError((uint64_t)"MobileInstallationCopySafeHarborsForContainerClass", 2390, (void *)*MEMORY[0x1E0D3ACC0], 25, 0, 0, CFSTR("The options parameter is currently unused and must be nil"), v9, v16[0]);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v12 = (void *)objc_opt_new();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = (uint64_t)__MobileInstallationCopySafeHarborsForContainerClass_block_invoke;
      v16[3] = (uint64_t)&unk_1E6163D20;
      v16[4] = (uint64_t)&v17;
      v16[5] = (uint64_t)&v23;
      objc_msgSend(v12, "listSafeHarborsOfType:forPersona:withOptions:completion:", a1, v7, 0, v16);
      goto LABEL_6;
    }
    _CreateAndLogError((uint64_t)"MobileInstallationCopySafeHarborsForContainerClass", 2396, (void *)*MEMORY[0x1E0D3ACC0], 25, 0, 0, CFSTR("The persona parameter must be specified"), v9, v16[0]);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v18[5];
  v18[5] = v11;
LABEL_6:

  objc_autoreleasePoolPop(v10);
  v13 = v24;
  if (a4 && !v24[5])
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v13 = v24;
  }
  v14 = (id)v13[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void sub_1B077BE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationCheckCapabilitiesMatch(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationCheckCapabilitiesMatch_block_invoke;
  v8[3] = &unk_1E6163CA8;
  v8[4] = &v9;
  objc_msgSend(v5, "checkCapabilities:withOptions:completion:", a1, a2, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  objc_autoreleasePoolPop(v4);
  return v6;
}

void sub_1B077BFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MobileInstallationUpdateSinfDataForInstallCoordination(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v10 = (void *)MEMORY[0x1B5E0ACCC]();
  v11 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __MobileInstallationUpdateSinfDataForInstallCoordination_block_invoke;
  v15[3] = &unk_1E6163D48;
  v15[4] = &v16;
  v15[5] = &v22;
  objc_msgSend(v11, "updateSinfForIXWithIdentifier:withOptions:sinfData:completion:", v7, v8, v9, v15);

  objc_autoreleasePoolPop(v10);
  v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v12 = (void *)v23[5];
  }
  v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void sub_1B077C208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL MobileInstallationUpdateiTunesMetadataForInstallCoordination(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a1;
  v6 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v7 = (void *)MEMORY[0x1B5E0ACCC]();
  v8 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __MobileInstallationUpdateiTunesMetadataForInstallCoordination_block_invoke;
  v12[3] = &unk_1E6163AC8;
  v12[4] = &v13;
  objc_msgSend(v8, "updateiTunesMetadataForIXWithIdentifier:metadata:completion:", v5, v6, v12);

  objc_autoreleasePoolPop(v7);
  v9 = (void *)v14[5];
  if (a3 && v9)
  {
    *a3 = objc_retainAutorelease(v9);
    v9 = (void *)v14[5];
  }
  v10 = v9 == 0;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void sub_1B077C400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationAppLaunchEnabled()
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  return 0;
}

uint64_t MobileInstallationSetAppLaunchState(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;

  _CreateAndLogError((uint64_t)"MobileInstallationSetAppLaunchState", 2548, (void *)*MEMORY[0x1E0D3ACC0], 10, 0, 0, CFSTR("MobileInstallationSetAppLaunchState called on unsupported OS for %@"), a8, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4)
    *a4 = v9;

  return 0;
}

uint64_t MobileInstallationWatchKitInstallerSnapshotWKApp(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v8 = (void *)MEMORY[0x1B5E0ACCC]();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __MobileInstallationWatchKitInstallerSnapshotWKApp_block_invoke;
  v13[3] = &unk_1E6163D20;
  v13[4] = &v14;
  v13[5] = &v18;
  objc_msgSend(v9, "snapshotWKAppInCompanionAppID:toURL:options:completion:", a1, a2, a3, v13);

  if (a4 && !v19[3])
  {
    *a4 = v15[3];
  }
  else
  {
    v10 = (const void *)v15[3];
    if (v10)
      CFRelease(v10);
  }
  v11 = v19[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  objc_autoreleasePoolPop(v8);
  return v11;
}

void sub_1B077C66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL MobileInstallationSetSystemAppMigrationComplete(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t *v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v2 = (void *)MEMORY[0x1B5E0ACCC]();
  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MobileInstallationSetSystemAppMigrationComplete_block_invoke;
  v8[3] = &unk_1E6163AC8;
  v8[4] = &v9;
  objc_msgSend(v3, "setSystemAppMigrationComplete:", v8);

  objc_autoreleasePoolPop(v2);
  v4 = v10;
  if (a1)
  {
    v5 = (void *)v10[5];
    if (v5)
    {
      *a1 = objc_retainAutorelease(v5);
      v4 = v10;
    }
  }
  v6 = v4[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1B077C824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL MobileInstallationWaitForSystemAppMigrationToComplete(_QWORD *a1)
{
  void *v2;
  char HasCompleted;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v2 = (void *)MEMORY[0x1B5E0ACCC]();
  HasCompleted = MISystemAppMigrationHasCompleted();
  if ((HasCompleted & 1) == 0)
  {
    v4 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __MobileInstallationWaitForSystemAppMigrationToComplete_block_invoke;
    v8[3] = &unk_1E6163C58;
    v8[4] = &v9;
    v8[5] = &v13;
    objc_msgSend(v4, "waitForSystemAppMigratorToComplete:", v8);

  }
  objc_autoreleasePoolPop(v2);
  if ((HasCompleted & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (a1)
    {
      v6 = (void *)v14[5];
      if (v6)
        *a1 = objc_retainAutorelease(v6);
    }
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

void sub_1B077C988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void MobileInstallationWaitForSystemAppMigrationWithCompletion(void *a1)
{
  void (**v1)(id, _QWORD);
  void *v2;
  void *v3;
  _QWORD v4[4];
  void (**v5)(id, _QWORD);

  v1 = a1;
  v2 = (void *)MEMORY[0x1B5E0ACCC]();
  if (MISystemAppMigrationHasCompleted())
  {
    v1[2](v1, 0);
  }
  else
  {
    v3 = (void *)objc_opt_new();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __MobileInstallationWaitForSystemAppMigrationWithCompletion_block_invoke;
    v4[3] = &unk_1E6163D70;
    v5 = v1;
    objc_msgSend(v3, "waitForSystemAppMigratorWithCompletion:", v4);

  }
  objc_autoreleasePoolPop(v2);

}

uint64_t MobileInstallationGetSystemAppMigrationStatus(_BYTE *a1, _QWORD *a2)
{
  void *v4;
  int HasCompleted;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  HasCompleted = MISystemAppMigrationHasCompleted();
  v6 = HasCompleted;
  if (HasCompleted)
  {
    *a1 = 1;
  }
  else
  {
    v7 = (void *)objc_opt_new();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __MobileInstallationGetSystemAppMigrationStatus_block_invoke;
    v11[3] = &unk_1E6163D98;
    v11[4] = &v12;
    v11[5] = a1;
    objc_msgSend(v7, "systemAppMigratorHasCompleted:", v11);

  }
  objc_autoreleasePoolPop(v4);
  if ((v6 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v8 = 1;
    if (a2)
    {
      v9 = (void *)v13[5];
      if (v9)
      {
        v8 = 0;
        *a2 = objc_retainAutorelease(v9);
      }
    }
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void sub_1B077CBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationGetInstalldPid()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)MEMORY[0x1B5E0ACCC]();
  v1 = (void *)objc_opt_new();
  v2 = objc_msgSend(v1, "pidForTesting");

  objc_autoreleasePoolPop(v0);
  return v2;
}

void MobileInstallationKillInstalld()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1B5E0ACCC]();
  v1 = (void *)objc_opt_new();
  objc_msgSend(v1, "dieForTesting");

  objc_autoreleasePoolPop(v0);
}

id MobileInstallationSimulateExceptionInDaemon()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1B5E0ACCC]();
  v1 = (void *)objc_opt_new();
  objc_msgSend(v1, "raiseException");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v0);
  return v2;
}

uint64_t MobileInstallationGetHelperServicePid()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.MobileInstallationHelperService"));
  if (v0)
  {
    MobileInstallationHelperServiceProtocolInterface();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setRemoteObjectInterface:", v1);

    objc_msgSend(v0, "resume");
    v2 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __MobileInstallationGetHelperServicePid_block_invoke;
    v8[3] = &unk_1E6163DC0;
    v3 = v0;
    v9 = v3;
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __MobileInstallationGetHelperServicePid_block_invoke_2;
    v7[3] = &unk_1E6163A80;
    v7[4] = &v10;
    objc_msgSend(v4, "getPidForTestingWithCompletion:", v7);

    objc_msgSend(v3, "invalidate");
    v5 = *((unsigned int *)v11 + 6);

  }
  else
  {
    NSLog(CFSTR("Warning, couldn't initialize xpc connection to %@"), CFSTR("com.apple.MobileInstallationHelperService"));
    v5 = *((unsigned int *)v11 + 6);
  }

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1B077CE9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void MobileInstallationKillHelperService()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.MobileInstallationHelperService"));
  if (v0)
  {
    MobileInstallationHelperServiceProtocolInterface();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setRemoteObjectInterface:", v1);

    objc_msgSend(v0, "resume");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __MobileInstallationKillHelperService_block_invoke;
    v4[3] = &unk_1E6163DC0;
    v2 = v0;
    v5 = v2;
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dieForTesting");

    objc_msgSend(v2, "invalidate");
  }
  else
  {
    NSLog(CFSTR("Warning, couldn't initialize xpc connection to %@"), CFSTR("com.apple.MobileInstallationHelperService"));
  }

}

uint64_t MobileInstallationSetTestMode(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v7;

  v2 = (void *)MEMORY[0x1B5E0ACCC]();
  v3 = (void *)objc_opt_new();
  v7 = 0;
  v4 = objc_msgSend(v3, "setTestMode:", &v7);
  v5 = v7;

  objc_autoreleasePoolPop(v2);
  if (a1 && (v4 & 1) == 0)
    *a1 = objc_retainAutorelease(v5);

  return v4;
}

uint64_t MobileInstallationEndTestMode(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v7;

  v2 = (void *)MEMORY[0x1B5E0ACCC]();
  v3 = (void *)objc_opt_new();
  v7 = 0;
  v4 = objc_msgSend(v3, "endTestMode:", &v7);
  v5 = v7;

  objc_autoreleasePoolPop(v2);
  if (a1 && (v4 & 1) == 0)
    *a1 = objc_retainAutorelease(v5);

  return v4;
}

uint64_t MobileInstallationGetTestModeEnabled(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v9;

  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v5 = (void *)objc_opt_new();
  v9 = 0;
  v6 = objc_msgSend(v5, "getTestModeEnabled:outError:", a1, &v9);
  v7 = v9;

  objc_autoreleasePoolPop(v4);
  if (a2 && (v6 & 1) == 0)
    *a2 = objc_retainAutorelease(v7);

  return v6;
}

uint64_t MobileInstallationSetTestFlags(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v9;

  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v5 = (void *)objc_opt_new();
  v9 = 0;
  v6 = objc_msgSend(v5, "setTestFlags:withError:", a1, &v9);
  v7 = v9;

  objc_autoreleasePoolPop(v4);
  if (a2 && (v6 & 1) == 0)
    *a2 = objc_retainAutorelease(v7);

  return v6;
}

uint64_t MobileInstallationClearTestFlags(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v9;

  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v5 = (void *)objc_opt_new();
  v9 = 0;
  v6 = objc_msgSend(v5, "clearTestFlags:withError:", a1, &v9);
  v7 = v9;

  objc_autoreleasePoolPop(v4);
  if (a2 && (v6 & 1) == 0)
    *a2 = objc_retainAutorelease(v7);

  return v6;
}

uint64_t MobileInstallationSetEligibilityTestOverrides(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v9;

  v3 = a1;
  v4 = (void *)MEMORY[0x1B5E0ACCC]();
  v5 = (void *)objc_opt_new();
  v9 = 0;
  v6 = objc_msgSend(v5, "setEligibilityTestOverrides:withError:", v3, &v9);
  v7 = v9;

  objc_autoreleasePoolPop(v4);
  if (a2 && (v6 & 1) == 0)
    *a2 = objc_retainAutorelease(v7);

  return v6;
}

BOOL MICreateSerializedPlaceholderForInstalledApplication(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  int v14;
  _BOOL8 v15;
  _QWORD v17[6];
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id *)(v20 + 5);
  obj = (id)v20[5];
  v12 = objc_msgSend(v10, "deviceForURLOrFirstAvailableParent:error:", v9, &obj);
  objc_storeStrong(v11, obj);

  if ((_DWORD)v12 != -1)
  {
    v13 = (void *)objc_opt_new();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __MICreateSerializedPlaceholderForInstalledApplication_block_invoke;
    v17[3] = &unk_1E6163C58;
    v17[4] = &v19;
    v17[5] = &v25;
    objc_msgSend(v13, "createSerializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:withCompletion:", v7, v8, v9, v12, v17);

  }
  v14 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((_BYTE *)v26 + 24))
  {
    *a4 = objc_retainAutorelease((id)v20[5]);
    v14 = *((unsigned __int8 *)v26 + 24);
  }
  v15 = v14 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_1B077D588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL MISetLaunchWarning(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  _BOOL8 v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v10 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __MISetLaunchWarning_block_invoke;
  v14[3] = &unk_1E6163C58;
  v14[4] = &v15;
  v14[5] = &v21;
  objc_msgSend(v10, "setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:", v7, v8, v9, v14);

  v11 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((_BYTE *)v22 + 24))
  {
    *a4 = objc_retainAutorelease((id)v16[5]);
    v11 = *((unsigned __int8 *)v22 + 24);
  }
  v12 = v11 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void sub_1B077D764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id MIGetReferencesForBundleWithIdentifier(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v6 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __MIGetReferencesForBundleWithIdentifier_block_invoke;
  v10[3] = &unk_1E6163D20;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v6, "referencesForBundleWithIdentifier:inDomain:withCompletion:", v5, a2, v10);

  v7 = (void *)v18[5];
  if (a3 && !v7)
  {
    *a3 = objc_retainAutorelease((id)v12[5]);
    v7 = (void *)v18[5];
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void sub_1B077D91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileInstallationSetPersonaForDataSeparatedApps(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;

  _CreateAndLogError((uint64_t)"MobileInstallationSetPersonaForDataSeparatedApps", 2989, (void *)*MEMORY[0x1E0D3ACC0], 161, 0, 0, CFSTR("%s is unavailable on this platform"), a8, (uint64_t)"MobileInstallationSetPersonaForDataSeparatedApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return 0;
}

id MobileInstallationLinkedBundleIDsForIdentity(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Playgrounds")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mock.Playgrounds")) & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __MobileInstallationLinkedBundleIDsForIdentity_block_invoke;
    v10[3] = &unk_1E6163DE8;
    v10[4] = &v17;
    v10[5] = &v11;
    objc_msgSend(v5, "linkedBundleIDsForAppIdentity:withCompletion:", v3, v10);
  }
  else
  {
    v6 = objc_opt_new();
    v5 = (void *)v12[5];
    v12[5] = v6;
  }

  v7 = (void *)v12[5];
  if (a2 && !v7)
  {
    *a2 = objc_retainAutorelease((id)v18[5]);
    v7 = (void *)v12[5];
  }
  v8 = v7;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void sub_1B077DBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t MIGetBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a3 = objc_msgSend(v6, "BOOLValue");
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite();
      }
    }
    else
    {
      a3 = 0;
    }

  }
  else
  {
    a3 = 0;
  }

  return a3;
}

uint64_t MIGetFirstTrueBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
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
  v5 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a2;
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
        if ((MIGetBooleanEntitlement(v5, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10), a3) & 1) != 0)
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

uint64_t MIHasUpgradeEnabledEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.mobileinstall.upgrade-enabled"), 0);
}

uint64_t MIHasContainerRequiredEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.security.container-required"), 1);
}

uint64_t MIHasNoContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.security.no-container"), 0);
}

uint64_t MIHasNoSandboxEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.security.no-sandbox"), 0);
}

BOOL MIHasSeatbeltProfilesEntitlement(void *a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("seatbelt-profiles"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

uint64_t MIHasPlatformApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("platform-application"), 0);
}

uint64_t MIHasSystemContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.security.system-container"), 0);
}

uint64_t MIHasXPCServicesAllowedEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.mobileinstall.xpc-services-enabled"), 0);
}

uint64_t MIHasSystemApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.security.system-application"), 0);
}

uint64_t MIHasWebKitPushBundleEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.private.webkit.pushbundle"), 0);
}

uint64_t MIHasMarketplaceEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.marketplace.app-installation"), 0);
}

id MICopyPlaceholderEntitlements(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaceholderEntitlements.plist"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MIWritePlaceholderEntitlements(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaceholderEntitlements.plist"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id MICopyApplicationGroupEntitlement(void *a1)
{
  return _MICommonCopyGroupEntitlement(a1, CFSTR("com.apple.security.application-groups"));
}

id _MICommonCopyGroupEntitlement(void *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_14;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((isKindOfClass & 1) == 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_7;
LABEL_15:
      v8 = 0;
      goto LABEL_16;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
LABEL_14:
      v6 = 0;
      goto LABEL_15;
    }
LABEL_13:
    MOLogWrite();
    goto LABEL_14;
  }
  if ((MIArrayContainsOnlyClass(v4) & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_14;
    goto LABEL_13;
  }
  v6 = v4;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v8;
}

BOOL MIHasAnyApplicationGroupEntitlements(void *a1)
{
  void *v1;
  _BOOL8 v2;

  _MICommonCopyGroupEntitlement(a1, CFSTR("com.apple.security.application-groups"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

id MICopySystemGroupEntitlement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  _MICommonCopyGroupEntitlement(v1, CFSTR("com.apple.security.system-groups"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || !objc_msgSend(v2, "count"))
  {
    _MICommonCopyGroupEntitlement(v1, CFSTR("com.apple.security.system-group-containers"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }

  return v3;
}

BOOL MIHasAnySystemGroupEntitlements(void *a1)
{
  void *v1;
  _BOOL8 v2;

  MICopySystemGroupEntitlement(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

uint64_t MIHasOnDemandInstallCapableEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.on-demand-install-capable"), 0);
}

id MICopyParentIdentifiersEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.parent-application-identifiers"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id MICopyApplicationIdentifierEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("application-identifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id MICopyPreviousApplicationIdentifiersEntitlement(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("previous-application-identifiers"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  MIArrayifyThing(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MIHasBetaReportsActiveEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("beta-reports-active"), 0);
}

id MICopyKeychainAccessGroupEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("keychain-access-groups"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

uint64_t MIHasSwiftPlaygroundsAppEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.swift-playgrounds-app"), 0);
}

id MICopyAppManagementDomainEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.app-management-domain"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t MIClassifyAppManagementDomainValue(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "hasPrefix:", CFSTR("swift-playgrounds")) & 1) != 0)
    {
      v3 = 2;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.WebKit.PushBundles")))
    {
      v3 = 3;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainEntitlement(void *a1)
{
  void *v1;
  uint64_t v2;

  MICopyAppManagementDomainEntitlement(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MIClassifyAppManagementDomainValue(v1);

  return v2;
}

id MICopyNetworkExtensionEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.networking.networkextension"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id MICopyAssociatedAppClipsEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.associated-appclip-app-identifiers"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(), MIArrayContainsOnlyClass(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

uint64_t MIHasDriverKitEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.driverkit"), 0);
}

id MICopyDataProtectionClassEntitlement(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.default-data-protection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (!v4)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("data-protection-class"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = v5;
    v4 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;

    if (!v4)
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("DataProtectionClass"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v8 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v8;
      else
        v4 = 0;

    }
  }

  return v4;
}

id MICopyDataProtectionIfAvailableEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.default-data-protection-if-available"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3)
  {
    v4 = v2;
  }
  else
  {
    objc_opt_class();
    v5 = v2;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6)
    {
      v7 = v5;
      objc_opt_class();
      MIArrayFilteredToContainOnlyClass(v7);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

uint64_t MIHasBrowserEngineHostEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser-engine.host"), 0);
}

uint64_t MIHasEmbeddedBrowserEngineEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.embedded-web-browser-engine"), 0);
}

uint64_t MIHasBrowserEngineRenderingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser-engine.rendering"), 0);
}

uint64_t MIHasBrowserEngineNetworkingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser-engine.networking"), 0);
}

uint64_t MIHasBrowserEngineContentEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser-engine.webcontent"), 0);
}

id MICopyMemoryTransferAcceptEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.memory.transfer-accept"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id MICopyMemoryTransferSendEntitlement(void *a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.memory.transfer-send"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t MIHasDefaultBrowserEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.web-browser"), 0);
}

uint64_t MIHasBrowserAppInstallationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, CFSTR("com.apple.developer.browser.app-installation"), 0);
}

uint64_t MISystemAppMigrationHasCompleted()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0D3AD60], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "migrationPlistURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = MIIsBuildUpgrade() ^ 1;

  return v2;
}

uint64_t MIBooleanValue(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a2 = objc_msgSend(v3, "BOOLValue");

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v5 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MIDictionaryContainsOnlyClasses_block_invoke;
  v8[3] = &unk_1E6163E10;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1B077FDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MIStringifyObject(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v1);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (MIArrayContainsOnlyClass(v1))
    {
      v2 = v1;
LABEL_7:
      v3 = v2;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v1, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MIArrayContainsOnlyClass(v4))
    v3 = v4;
  else
    v3 = 0;

LABEL_12:
  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || objc_msgSend(v3, "isEqual:", v4));

  return v6;
}

id MIEnumerateContainersOfClass(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D3AD58], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v8;
  switch(a2)
  {
    case 1:
      v10 = &unk_1E61690C8;
      goto LABEL_14;
    case 2:
      v26[0] = CFSTR("mobile");
      v26[1] = CFSTR("Containers");
      v26[2] = CFSTR("Data");
      v26[3] = CFSTR("Application");
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v26;
      goto LABEL_12;
    case 4:
      v25[0] = CFSTR("mobile");
      v25[1] = CFSTR("Containers");
      v25[2] = CFSTR("Data");
      v25[3] = CFSTR("PluginKitPlugin");
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v25;
      goto LABEL_12;
    case 7:
      v24[0] = CFSTR("mobile");
      v24[1] = CFSTR("Containers");
      v24[2] = CFSTR("Shared");
      v24[3] = CFSTR("AppGroup");
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v24;
      goto LABEL_12;
    case 10:
      v23[0] = CFSTR("mobile");
      v23[1] = CFSTR("Containers");
      v23[2] = CFSTR("Data");
      v23[3] = CFSTR("InternalDaemon");
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = v23;
LABEL_12:
      objc_msgSend(v11, "arrayWithObjects:count:", v12, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MI_URLByAppendingPathComponents:lastIsDirectory:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 12:
      v10 = &unk_1E61690E0;
      goto LABEL_14;
    case 13:
      v10 = &unk_1E61690F8;
LABEL_14:
      objc_msgSend(v8, "MI_URLByAppendingPathComponents:lastIsDirectory:", v10, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      if (!v15)
        goto LABEL_18;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __MIEnumerateContainersOfClass_block_invoke;
      v21[3] = &unk_1E6163E38;
      v22 = v6;
      objc_msgSend(v7, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v15, 1, v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = v16;
        v18 = v17;
      }
      else
      {
        v18 = 0;
        v17 = 0;
      }
      break;
    default:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();

LABEL_18:
      _CreateAndLogError((uint64_t)"MIEnumerateContainersOfClass", 75, (void *)*MEMORY[0x1E0D3ACC0], 4, 0, 0, CFSTR("Failed to get the path to containers of class %llu in %@"), v13, a2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v18 = 0;
      break;
  }
  v19 = v17;

  return v19;
}

void _MILogTransactionStep(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  uint64_t v24;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  switch(a2)
  {
    case 1:
      v18 = "Start";
      if (!v16)
        goto LABEL_15;
      break;
    case 2:
      if (!v16)
      {
        v19 = "Fail";
        if ((_DWORD)a3)
          v19 = "Success";
        if ((unint64_t)(a1 - 1) > 0xD)
          v20 = "Unknown";
        else
          v20 = off_1E6163E58[a1 - 1];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s (%s) : %s"), v19, "End", v20, 0);
        goto LABEL_21;
      }
      break;
    case 3:
      v18 = "Start (Asynch)";
      if (!v16)
        goto LABEL_15;
      break;
    default:
      v18 = "Unknown Phase";
      if (!v16)
      {
LABEL_15:
        if ((unint64_t)(a1 - 1) > 0xD)
          v22 = "Unknown";
        else
          v22 = off_1E6163E58[a1 - 1];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s : %s"), v18, v22, v24, 0);
LABEL_21:
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      break;
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v16, &a9);
LABEL_22:
  v23 = (void *)v21;
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:persona:description:](AITransactionLog, "logStep:byParty:phase:success:forBundleID:persona:description:", a1, 7, a2, a3, v14, v15, v21);

}

void sub_1B07818A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1B0782794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _UUIDData()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = 0;
  v1[1] = 0;
  MEMORY[0x1B5E0B0B0](v1);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v1, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

id MobileInstallerDelegateProtocolInterface()
{
  void *WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&MobileInstallerDelegateProtocolInterface_lock);
  WeakRetained = objc_loadWeakRetained(&MobileInstallerDelegateProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEBA7A0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&MobileInstallerDelegateProtocolInterface_weakInterface, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerDelegateProtocolInterface_lock);
  return WeakRetained;
}

id MobileInstallerProtocolInterface()
{
  void *WeakRetained;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  os_unfair_lock_lock((os_unfair_lock_t)&MobileInstallerProtocolInterface_lock);
  WeakRetained = objc_loadWeakRetained(&MobileInstallerProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEEBD5F0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    ICLKnownBundleRecordClasses();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setByAddingObject:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_checkCapabilities_withOptions_completion_, 0, 0);

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_uninstallIdentifiers_withOptions_completion_, 0, 1);

    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_installURL_identity_targetingDomain_options_returningResultInfo_completion_, 1, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_, 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_fetchInfoForFrameworkAtURL_options_completion_, 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_cancelUpdateForStagedUUID_completion_, 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_finalizeStagedInstallForUUID_returningResultInfo_completion_, 1, 1);
    objc_storeWeak(&MobileInstallerProtocolInterface_weakInterface, WeakRetained);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerProtocolInterface_lock);
  return WeakRetained;
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1E0D034A8]();
}

uint64_t BOMCopierCountFilesInArchive()
{
  return MEMORY[0x1E0D034B0]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1E0D034B8]();
}

uint64_t BOMCopierNewWithSys()
{
  return MEMORY[0x1E0D034C8]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x1E0D034D0]();
}

uint64_t BOMCopierSetCopyFileUpdateHandler()
{
  return MEMORY[0x1E0D034E0]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x1E0D034E8]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x1E0D034F0]();
}

uint64_t BOMCopierSetFileErrorHandler()
{
  return MEMORY[0x1E0D03500]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1E0D03508]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x1E0D03510]();
}

uint64_t BomSys_free()
{
  return MEMORY[0x1E0D03518]();
}

uint64_t BomSys_init()
{
  return MEMORY[0x1E0D03520]();
}

uint64_t BomSys_set_open()
{
  return MEMORY[0x1E0D03528]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t ICLKnownBundleRecordClasses()
{
  return MEMORY[0x1E0D3AC90]();
}

uint64_t IFCaptureIconContent()
{
  return MEMORY[0x1E0D3A788]();
}

uint64_t IFTopLevelAppBundlePlistKeys()
{
  return MEMORY[0x1E0D3A790]();
}

uint64_t MIAssertHighResourceUsage()
{
  return MEMORY[0x1E0D3AC98]();
}

uint64_t MIAssumeIdentityOfUsername()
{
  return MEMORY[0x1E0D3ACA0]();
}

uint64_t MIClearResourceAssertion()
{
  return MEMORY[0x1E0D3ACA8]();
}

uint64_t MICopyCurrentBuildVersion()
{
  return MEMORY[0x1E0D3ACB0]();
}

uint64_t MIIsBuildUpgrade()
{
  return MEMORY[0x1E0D3ACC8]();
}

uint64_t MILoadInfoPlistWithError()
{
  return MEMORY[0x1E0D3ACD8]();
}

uint64_t MILoadRawInfoPlist()
{
  return MEMORY[0x1E0D3ACE0]();
}

uint64_t MIRestoreIdentity()
{
  return MEMORY[0x1E0D3ACF8]();
}

uint64_t MOLogWrite()
{
  return MEMORY[0x1E0D4F928]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x1E0CD61F0](code, *(_QWORD *)&flags, information);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1E0CD65D0](path, *(_QWORD *)&flags, staticCode);
}

uint64_t TraverseDirectoryWithPostTraversal()
{
  return MEMORY[0x1E0D3AD80]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1E0C850C8]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1E0C850D0](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1E0C850D8](state, *(_QWORD *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1E0C850E0](state, *(_QWORD *)&key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1E0C85118](a1, a2, *(_QWORD *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

