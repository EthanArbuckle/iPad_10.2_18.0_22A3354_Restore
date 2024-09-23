@implementation NSURL(FPFSHelpers)

- (id)fp_isDatalessWithError:()FPFSHelpers
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  int v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v23 = 0;
  v24 = &v23;
  v25 = 0xB010000000;
  v26 = &unk_1A0B85191;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = objc_retainAutorelease(a1);
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  if ((lstat(v5, (stat *)(v24 + 4)) & 0x80000000) == 0)
    goto LABEL_2;
  if (*__error() == 63 && fpfs_supports_long_paths())
  {
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v8);
    v12 = fpfs_open_longpath((char *)objc_msgSend(v11, "fileSystemRepresentation"), 0x100000, 0);
    if (v12 < 0)
    {

    }
    else
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __45__NSURL_FPFSHelpers__fp_isDatalessWithError___block_invoke;
      v20 = &unk_1E444AD38;
      v13 = v10;
      v21 = v13;
      v22 = &v23;
      v14 = fpfs_fchdir(v12, (uint64_t)&v17);
      v15 = *__error();
      close(v12);
      *__error() = v15;

      if ((v14 & 0x80000000) == 0)
      {
LABEL_2:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*((_DWORD *)v24 + 37) >> 30) & 1, v17, v18, v19, v20);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
LABEL_12:
  _Block_object_dispose(&v23, 8);
  return v6;
}

- (void)fp_defaultMoverBlock
{
  return &__block_literal_global_6;
}

- (uint64_t)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:
{
  return objc_msgSend(a1, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", a3, a4, 0, 0, 0);
}

- (id)_fp_lookupURLOfChildWithName:()FPFSHelpers notMatchingFileID:
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  id v17;
  id v18;

  v6 = a4;
  objc_msgSend(a1, "URLByAppendingPathComponent:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v8 = *MEMORY[0x1E0C99948];
  v9 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v18, *MEMORY[0x1E0C99948], 0);
  v10 = v18;
  v11 = v10;
  if (v9)
  {
    if (v6 && v10 && (objc_msgSend(v6, "isEqual:", v10) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v12 = v7;
      v7 = v12;
    }
  }
  else
  {
    v13 = (void *)_CFURLPromiseCopyPhysicalURL();

    if (v13)
    {
      v17 = 0;
      v14 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v17, v8, 0);
      v15 = v17;

      if (!v14 || v6 && v15 && (objc_msgSend(v6, "isEqual:", v15) & 1) != 0)
      {
        v12 = 0;
        v7 = v13;
      }
      else
      {
        v12 = v13;
        v7 = v12;
      }
      v11 = v15;
    }
    else
    {
      v12 = 0;
      v7 = 0;
    }
  }

  return v12;
}

- (id)fp_scanForURLOfChildWithName:()FPFSHelpers isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  FPNSURLBitVectorForBounce *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  unint64_t v35;
  int v36;
  id v37;
  char v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id obj;
  uint64_t v73;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  uint8_t v83[4];
  uint64_t v84;
  _BYTE v85[128];
  _QWORD v86[5];

  v86[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9AC50];
  v73 = *MEMORY[0x1E0C99A90];
  v86[0] = *MEMORY[0x1E0C99A90];
  v86[1] = v13;
  v14 = *MEMORY[0x1E0C99948];
  v86[2] = *MEMORY[0x1E0C99948];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = a1;
  objc_msgSend(v12, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", a1, v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0;
  v70 = v10;
  objc_msgSend(v10, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v82, 0, a4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v82;
  v18 = objc_alloc_init(FPNSURLBitVectorForBounce);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v19 = v16;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  if (!v20)
  {
    v22 = 0;
    v42 = 0;
    v43 = v19;
    goto LABEL_56;
  }
  v21 = v20;
  v63 = v14;
  obj = v19;
  v65 = v17;
  v66 = 0;
  v67 = v11;
  v22 = 0;
  v23 = 0;
  v24 = *(_QWORD *)v79;
LABEL_3:
  v25 = 0;
  v64 = v23 + v21;
  while (1)
  {
    if (*(_QWORD *)v79 != v24)
      objc_enumerationMutation(obj);
    v26 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v25);
    v27 = (void *)MEMORY[0x1A1B00664]();
    if (v23 + v25 > a5
      || -[FPNSURLBitVectorForBounce foundAllAvailableBounceNumbers](v18, "foundAllAvailableBounceNumbers"))
    {
      break;
    }
    v77 = 0;
    v28 = objc_msgSend(v26, "getResourceValue:forKey:error:", &v77, v73, 0);
    v29 = v77;
    v30 = v29;
    if (v28)
      v31 = v29 == 0;
    else
      v31 = 1;
    if (v31)
      goto LABEL_25;
    if (_CFURLIsPromiseName())
    {
      v32 = _CFURLCopyLogicalNameOfPromiseAtURL();

      v30 = (void *)v32;
      if (!v32)
        goto LABEL_25;
    }
    if (!v22 && !objc_msgSend(v70, "compare:options:", v30, 1))
    {
      if (v67)
      {
        v76 = 0;
        v38 = objc_msgSend(v26, "getResourceValue:forKey:error:", &v76, v63, 0);
        v34 = v76;
        if ((v38 & 1) == 0)
        {
          fp_current_or_default_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            -[NSURL(FPFSHelpers) fp_scanForURLOfChildWithName:isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:].cold.1(v83, v26, &v84, v39);

        }
        if (v34 && (objc_msgSend(v67, "isEqual:", v34) & 1) != 0)
        {
          v22 = 0;
          v33 = (uint64_t)v30;
          goto LABEL_24;
        }
      }
      else
      {
        v34 = 0;
      }
      v40 = v26;
      v22 = v40;
      if (!a7)
      {
        v53 = v40;

        v42 = v66;
        v11 = v67;
        v17 = v65;
        v19 = obj;
        goto LABEL_74;
      }

LABEL_17:
      v75 = 0;
      objc_msgSend(v30, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v75, 0, objc_msgSend(v26, "fp_isFolder"));
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v75;

      if (v34 && !objc_msgSend(v69, "compare:options:", v33, 1))
      {
        v35 = objc_msgSend(v34, "unsignedIntegerValue");
        if (v35 <= objc_msgSend(MEMORY[0x1E0CB3940], "fp_maximumBounceLevel"))
          -[FPNSURLBitVectorForBounce markBounceNumberAsFound:](v18, "markBounceNumberAsFound:", v34);
        if (!v66 || (v36 = objc_msgSend(v66, "intValue"), v36 < (int)objc_msgSend(v34, "intValue")))
        {
          v37 = v34;

          v66 = v37;
        }
      }
LABEL_24:

      v30 = (void *)v33;
      goto LABEL_25;
    }
    if (a7)
      goto LABEL_17;
LABEL_25:

    objc_autoreleasePoolPop(v27);
    if (v21 == ++v25)
    {
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      v21 = v41;
      v23 = v64;
      if (!v41)
      {
        v19 = obj;

        if (a7)
        {
          v42 = v66;
          v11 = v67;
          v17 = v65;
          if (v22)
          {
            -[FPNSURLBitVectorForBounce findNextAvailableBounceNumber](v18, "findNextAvailableBounceNumber");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "intValue");
            if (v44 < (int)objc_msgSend(v66, "intValue"))
            {
              v45 = v43;

              v42 = v45;
            }
            v42 = objc_retainAutorelease(v42);
            *a7 = v42;
LABEL_56:

          }
        }
        else
        {
          v42 = v66;
          v11 = v67;
          v17 = v65;
        }
        v53 = v22;
        goto LABEL_75;
      }
      goto LABEL_3;
    }
  }
  if (!v22)
  {
    objc_msgSend(v68, "_fp_lookupURLOfChildWithName:notMatchingFileID:", v70, v67);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v65;
  v19 = obj;
  if (!a7 || !v22)
  {
    v48 = v66;
    v11 = v67;
    goto LABEL_73;
  }
  if (-[FPNSURLBitVectorForBounce bitCount](v18, "bitCount") < 2)
  {
    v48 = v66;
    goto LABEL_62;
  }
  v46 = v22;
  v47 = 1;
  while (2)
  {
    -[FPNSURLBitVectorForBounce findNextAvailableBounceNumberFromIndex:](v18, "findNextAvailableBounceNumberFromIndex:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "intValue");
    v50 = objc_msgSend(v48, "intValue") + 1;
    if (v50 >= (int)objc_msgSend(v66, "intValue"))
    {
LABEL_53:
      v47 = (v49 + 1);

      if ((int)v47 >= -[FPNSURLBitVectorForBounce bitCount](v18, "bitCount"))
      {
        v48 = v66;
        goto LABEL_61;
      }
      continue;
    }
    break;
  }
  objc_msgSend(v46, "fp_bouncedNameWithIndex:", objc_msgSend(v48, "longValue") + 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "_fp_lookupURLOfChildWithName:notMatchingFileID:", v51, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {

    goto LABEL_53;
  }

LABEL_61:
  v22 = v46;
LABEL_62:
  v11 = v67;
  if (v65 && v48)
  {
    v54 = v22;
    v55 = (void *)MEMORY[0x1E0CB37E8];
    v56 = objc_msgSend(v65, "longValue");
    v57 = objc_msgSend(v48, "longValue");
    if (v56 <= v57)
      v58 = v57;
    else
      v58 = v56;
    v59 = v55;
    v22 = v54;
    objc_msgSend(v59, "numberWithLong:", v58);
    v60 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v65)
      v61 = v65;
    else
      v61 = v48;
    v60 = objc_retainAutorelease(v61);
  }
  *a7 = v60;
LABEL_73:
  v53 = v22;
  v42 = v48;
LABEL_74:
  objc_autoreleasePoolPop(v27);

LABEL_75:
  return v53;
}

- (uint64_t)getMaxChildrenCount
{
  if (os_variant_has_internal_content() && getMaxChildrenCount_once != -1)
    dispatch_once(&getMaxChildrenCount_once, &__block_literal_global_32);
  return getMaxChildrenCount_maxChildrenCount;
}

- (id)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v21;

  v12 = a3;
  v13 = a5;
  if (v12)
  {
    if ((a7 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      v21 = 0;
      v16 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v21, *MEMORY[0x1E0C99C70], 0);
      v14 = v21;
      if ((v16 & 1) == 0)
      {
        fp_current_or_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[NSURL(FPFSHelpers) fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:].cold.2(a1, v17);

      }
      if (v14 && (objc_msgSend(v14, "BOOLValue") & 1) == 0)
      {
        objc_msgSend(a1, "_fp_lookupURLOfChildWithName:notMatchingFileID:", v12, v13);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[NSURL(FPFSHelpers) fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:].cold.1(a1, v18);

    }
    objc_msgSend(a1, "fp_scanForURLOfChildWithName:isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:", v12, a4, objc_msgSend(a1, "getMaxChildrenCount"), v13, a6);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v15 = (void *)v19;

    goto LABEL_16;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:allowBounce:allowCoordination:completionHandler:
{
  return objc_msgSend(a1, "fp_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:completionHandler:", a3, a4, 2, a5, a6, a7);
}

- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:allowBounce:allowCoordination:moveHandler:completionHandler:
{
  return objc_msgSend(a1, "fp_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:", a3, a4, 2, a5, a6, a7, a8);
}

- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:completionHandler:
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;

  v14 = a8;
  v15 = a4;
  v16 = a3;
  objc_msgSend(a1, "fp_defaultMoverBlock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:", v16, v15, a5, a6, a7, v17, v14);

  return v18;
}

- (uint64_t)fp_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:
{
  id v15;
  id v16;
  id v17;
  id v18;
  qos_class_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  dispatch_block_t v24;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  char v32;
  char v33;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  if (fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__onceToken != -1)
    dispatch_once(&fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__onceToken, &__block_literal_global_38);
  v19 = qos_class_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__NSURL_FPFSHelpers__fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_2;
  block[3] = &unk_1E444ADA0;
  block[4] = a1;
  v27 = v15;
  v32 = a6;
  v33 = a7;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = a5;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v19, 0, block);
  dispatch_async((dispatch_queue_t)fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__workQueue, v24);

  return 1;
}

- (BOOL)fp_queued_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:
{
  id v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  char v22;
  NSObject *v23;
  int v24;
  id *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  int v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  char v54;
  NSObject *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  int v69;
  void (**v70)(id, _QWORD);
  id v71;
  id v72;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  id *v78;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  _BYTE *v90;
  _BYTE *v91;
  uint64_t *v92;
  char v93;
  id v94;
  id v95;
  id v96;
  id v97;
  uint64_t section;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  id v105;
  id v106;
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  void *v110;
  _BYTE v111[24];
  id v112;
  _BYTE v113[24];
  uint64_t (*v114)(uint64_t, uint64_t);
  __int128 v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v84 = a3;
  v13 = a4;
  v74 = a8;
  v70 = a9;
  v105 = 0;
  v106 = 0;
  v71 = v13;
  objc_msgSend(v71, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v106, &v105, objc_msgSend(a1, "fp_isFolder"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v106;
  v72 = v105;
  v83 = a1;
  v99 = 0;
  v100 = &v99;
  v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__1;
  v103 = __Block_byref_object_dispose__1;
  v104 = 0;
  if (!objc_msgSend(v14, "intValue"))
  {

    v14 = &unk_1E448E8A8;
  }
  section = __fp_create_section();
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v83, "fp_shortDescription");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "fp_shortDescription");
    v62 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v113 = 134218754;
    *(_QWORD *)&v113[4] = section;
    *(_WORD *)&v113[12] = 2112;
    *(_QWORD *)&v113[14] = v61;
    *(_WORD *)&v113[22] = 2112;
    v114 = v62;
    LOWORD(v115) = 2112;
    *(_QWORD *)((char *)&v115 + 2) = v71;
    _os_log_debug_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx moving %@ to %@ as %@", v113, 0x2Au);

  }
  *(_QWORD *)v113 = 0;
  *(_QWORD *)&v113[8] = v113;
  *(_QWORD *)&v113[16] = 0x3032000000;
  v114 = __Block_byref_object_copy__1;
  *(_QWORD *)&v115 = __Block_byref_object_dispose__1;
  *((_QWORD *)&v115 + 1) = 0;
  objc_msgSend(MEMORY[0x1E0CB3600], "fp_fileCoordinatorForCurrentProcess:", 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v83, "startAccessingSecurityScopedResource");
  v17 = (id)_CFURLPromiseCopyPhysicalURL();
  if (!v17)
    v17 = v83;
  v69 = v16;
  if ((a5 & 1) != 0)
  {
    v97 = 0;
    v19 = *MEMORY[0x1E0C998D8];
    v96 = 0;
    v20 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v97, v19, &v96);
    v75 = v97;
    v18 = v96;
    if ((v20 & 1) == 0)
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v83, "path");
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fp_prettyDescription");
        objc_claimAutoreleasedReturnValue();
        -[NSURL(FPFSHelpers) fp_queued_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:].cold.2();
      }

    }
  }
  else
  {
    v75 = 0;
    v18 = 0;
  }
  v95 = 0;
  v22 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v95, *MEMORY[0x1E0C99948], 0);
  v67 = v17;
  v68 = v18;
  v82 = v95;
  if ((v22 & 1) == 0)
  {
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[NSURL(FPFSHelpers) fp_queued_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:].cold.1();

  }
  v24 = 0;
  v80 = 0;
  v25 = &v94;
  if (!a6)
    v25 = 0;
  v78 = v25;
  v77 = *MEMORY[0x1E0CB28A8];
  v26 = 1;
  v27 = v71;
  do
  {
    *(_QWORD *)v111 = 0;
    *(_QWORD *)&v111[8] = v111;
    *(_QWORD *)&v111[16] = 0x2020000000;
    LOBYTE(v112) = 0;
    if ((v26 & 1) != 0)
    {
      v28 = objc_msgSend(v83, "fp_isFolder");
      if (a6)
        v94 = 0;
      objc_msgSend(v84, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v27, v28, v82, v78, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        v30 = v94;
        if (v30)
        {
          v31 = objc_msgSend(v14, "intValue");
          if (v31 < (int)objc_msgSend(v30, "intValue"))
          {
            v30 = v30;

            v14 = v30;
          }
        }
      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      objc_msgSend(v84, "_fp_lookupURLOfChildWithName:notMatchingFileID:", v27, v82);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v29)
    {
      fp_current_or_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v84, "fp_shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v108 = v27;
        v109 = 2112;
        v110 = v33;
        _os_log_impl(&dword_1A0A34000, v32, OS_LOG_TYPE_INFO, "[INFO] won't create '%@' because it already exists under %@", buf, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)&v111[8] + 24) = 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorForCollisionWithURL:", v29);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = *(void **)(*(_QWORD *)&v113[8] + 40);
      *(_QWORD *)(*(_QWORD *)&v113[8] + 40) = v34;
    }
    else
    {
      objc_msgSend(v83, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "URLByAppendingPathComponent:isDirectory:", v27, objc_msgSend(v37, "hasSuffix:", CFSTR("/")));
      v38 = objc_claimAutoreleasedReturnValue();

      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke;
      v86[3] = &unk_1E444ADC8;
      v87 = v75;
      v90 = v113;
      v93 = a7;
      v39 = v76;
      v88 = v39;
      v91 = v111;
      v89 = v74;
      v92 = &v99;
      v40 = MEMORY[0x1A1B00850](v86);
      v41 = (void *)v40;
      if (a7)
      {
        v85 = 0;
        objc_msgSend(v39, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v83, a5, v38, 4, &v85, v40);
        v35 = v85;
      }
      else
      {
        (*(void (**)(uint64_t, id, uint64_t))(v40 + 16))(v40, v83, v38);
        v35 = 0;
      }

      v24 = 0;
      v36 = v87;
      v80 = (void *)v38;
    }

    if (!*(_BYTE *)(*(_QWORD *)&v111[8] + 24) && a6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)&v113[8] + 40), "domain");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "isEqualToString:", v77))
      {
        v43 = objc_msgSend(*(id *)(*(_QWORD *)&v113[8] + 40), "code") == 516;

        if (!v43)
          goto LABEL_48;
        v44 = *(void **)(*(_QWORD *)&v113[8] + 40);
        *(_QWORD *)(*(_QWORD *)&v113[8] + 40) = 0;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = objc_msgSend(v45, "unsignedIntegerValue");
        if (v46 > objc_msgSend(MEMORY[0x1E0CB3940], "fp_maximumBounceLevel"))
        {
          v42 = (void *)objc_opt_new();
          objc_msgSend(v42, "setDateStyle:", 1);
          objc_msgSend(v42, "setTimeStyle:", 2);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringFromDate:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v48, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("'"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v81, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72)
          {
            objc_msgSend(v51, "stringByAppendingPathExtension:", v72);
            v52 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v52 = v51;
          }
          v53 = (uint64_t)v52;

          v24 = 1;
          v45 = &unk_1E448E8A8;
          goto LABEL_47;
        }
        objc_msgSend(v81, "fp_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v45, v72, 0);
        v53 = objc_claimAutoreleasedReturnValue();
        v24 = 1;
        v42 = v27;
      }
      else
      {
        v45 = v14;
        v53 = (uint64_t)v27;
      }
      v51 = v81;
LABEL_47:

      v27 = (void *)v53;
      v81 = v51;
      v14 = v45;
    }
LABEL_48:

    _Block_object_dispose(v111, 8);
    if (v35)
      v54 = 1;
    else
      v54 = a6 ^ 1;
    if ((v54 & 1) != 0)
      break;
    v26 = 0;
  }
  while (((v24 ^ 1) & 1) == 0);
  if (v69)
    objc_msgSend(v83, "stopAccessingSecurityScopedResource");
  if (v35 || *(_QWORD *)(*(_QWORD *)&v113[8] + 40))
  {
    fp_current_or_default_log();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v83, "fp_shortDescription");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "fp_shortDescription");
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v64;
      v66 = v35;
      if (!v35)
        v66 = *(id *)(*(_QWORD *)&v113[8] + 40);
      *(_DWORD *)v111 = 138412802;
      *(_QWORD *)&v111[4] = v63;
      *(_WORD *)&v111[12] = 2112;
      *(_QWORD *)&v111[14] = v64;
      *(_WORD *)&v111[22] = 2112;
      v112 = v66;
      _os_log_error_impl(&dword_1A0A34000, v55, OS_LOG_TYPE_ERROR, "[ERROR] couldn't move %@ to %@: %@", v111, 0x20u);

    }
    v56 = v35;
    if (!v35)
      v56 = *(void **)(*(_QWORD *)&v113[8] + 40);
    v57 = v56;

    v58 = v57;
  }
  else
  {
    v58 = v68;
  }
  v59 = v58;
  v70[2](v70, v100[5]);

  _Block_object_dispose(v113, 8);
  __fp_leave_section_Debug((uint64_t)&section);
  _Block_object_dispose(&v99, 8);

  return v59 == 0;
}

- (uint64_t)fp_importUnderFolder:()FPFSHelpers allowCoordination:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "fp_defaultMoverBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "fp_importUnderFolder:allowCoordination:usingBlock:completionHandler:", v9, a4, v10, v8);

  return v11;
}

- (uint64_t)fp_importUnderFolder:()FPFSHelpers completionHandler:
{
  return objc_msgSend(a1, "fp_importUnderFolder:allowCoordination:completionHandler:", a3, 1, a4);
}

- (uint64_t)fp_importUnderFolder:()FPFSHelpers usingBlock:completionHandler:
{
  return objc_msgSend(a1, "fp_importUnderFolder:allowCoordination:usingBlock:completionHandler:", a3, 1, a4, a5);
}

- (uint64_t)fp_importUnderFolder:()FPFSHelpers allowCoordination:usingBlock:completionHandler:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a1, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__NSURL_FPFSHelpers__fp_importUnderFolder_allowCoordination_usingBlock_completionHandler___block_invoke;
  v17[3] = &unk_1E444ADF0;
  v18 = v10;
  v14 = v10;
  v15 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:moveHandler:completionHandler:", v12, v13, 0, a4, v11, v17);

  return v15;
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowCoordination:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:completionHandler:", v9, v10, 0, a4, v8);

  return v11;
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers withNewName:allowCoordination:completionHandler:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(a1, "lastPathComponent");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:completionHandler:", v10, v11, 0, a5, v12);

  return v13;
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers withNewName:completionHandler:
{
  return objc_msgSend(a1, "fp_reparentUnderFolder:withNewName:allowCoordination:completionHandler:", a3, a4, 1, a5);
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowBouncing:allowCoordination:completionHandler:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;

  v10 = a6;
  v11 = a3;
  objc_msgSend(a1, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:completionHandler:", v11, v12, a4, a5, v10);

  return v13;
}

- (uint64_t)fp_reparentUnderFolder:()FPFSHelpers allowBouncing:completionHandler:
{
  return objc_msgSend(a1, "fp_reparentUnderFolder:allowBouncing:allowCoordination:completionHandler:", a3, a4, 1, a5);
}

- (uint64_t)fp_trashUnderFolder:()FPFSHelpers allowCoordination:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:completionHandler:", v9, v10, 1, 1, a4, v8);

  return v11;
}

- (uint64_t)fp_trashUnderFolder:()FPFSHelpers completionHandler:
{
  return objc_msgSend(a1, "fp_trashUnderFolder:allowCoordination:completionHandler:", a3, 1, a4);
}

- (uint64_t)fp_renameWithNewName:()FPFSHelpers allowCoordination:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "fp_moveUnderFolder:withNewName:allowBounce:allowCoordination:completionHandler:", v10, v9, 0, a4, v8);

  return v11;
}

- (uint64_t)fp_renameWithNewName:()FPFSHelpers completionHandler:
{
  return objc_msgSend(a1, "fp_renameWithNewName:allowCoordination:completionHandler:", a3, 1, a4);
}

- (uint64_t)fp_createSubFolder:()FPFSHelpers completionHandler:
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "fp_existingURLOfChildWithName:isFolder:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v24 = 0;
    objc_msgSend(a1, "fp_uniqueTempFolderWithError:", &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;
    v23 = v14;
    objc_msgSend(v13, "fp_addDocumentTrackingWithError:", &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v23;

    if (!v15)
    {
      v7[2](v7, 0, v11);
      v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", v6, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v11;
    v12 = objc_msgSend(v17, "moveItemAtURL:toURL:error:", v13, v16, &v22);
    v18 = v22;

    if ((_DWORD)v12)
    {
      ((void (**)(id, void *, id))v7)[2](v7, v16, 0);
LABEL_14:

      v11 = v18;
      goto LABEL_15;
    }
    objc_msgSend(v18, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v20 = objc_msgSend(v18, "code");

      if (v20 != 516)
      {
LABEL_13:
        v7[2](v7, 0, v18);
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorForCollisionWithURL:", v16);
      v19 = v18;
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_13;
  }
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "fp_shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_INFO, "[INFO] won't create '%@' because it already exists under %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorForCollisionWithURL:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v11);
  v12 = 0;
LABEL_16:

  return v12;
}

- (uint64_t)fp_deleteStaleBusyFileWithFileDescriptor:()FPFSHelpers coordinatorPurposeIdentifier:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3600], "fp_fileCoordinatorForCurrentProcess:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke;
  v13[3] = &unk_1E444AE40;
  v8 = v7;
  v17 = a3;
  v14 = v8;
  v15 = a1;
  v16 = &v19;
  objc_msgSend(v8, "coordinateReadingItemAtURL:options:error:byAccessor:", a1, 0x80000, &v18, v13);
  v9 = v18;
  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[NSURL(FPFSHelpers) fp_deleteStaleBusyFileWithFileDescriptor:coordinatorPurposeIdentifier:].cold.1();

  }
  v11 = *((unsigned __int8 *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (void)fp_coordinatedDeleteWithHandler:()FPFSHelpers
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3600], "fp_fileCoordinatorForCurrentProcess:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v6 = *MEMORY[0x1E0C998D8];
  v19 = 0;
  v7 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v20, v6, &v19);
  v8 = v20;
  v9 = v19;
  if ((v7 & 1) == 0)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "path");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fp_prettyDescription");
      objc_claimAutoreleasedReturnValue();
      -[NSURL(FPFSHelpers) fp_queued_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:].cold.2();
    }

  }
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__NSURL_FPFSHelpers__fp_coordinatedDeleteWithHandler___block_invoke;
  v14[3] = &unk_1E444AE68;
  v11 = v8;
  v15 = v11;
  v17 = v21;
  v12 = v4;
  v16 = v12;
  objc_msgSend(v5, "coordinateWritingItemAtURL:options:error:byAccessor:", a1, 1, &v18, v14);
  v13 = v18;
  if (v13)
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v13);

  _Block_object_dispose(v21, 8);
}

- (BOOL)fp_deleteAllowingCoordination:()FPFSHelpers completionHandler:
{
  void (**v6)(id, _QWORD);
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke;
  v11[3] = &unk_1E444AE90;
  v11[4] = &v12;
  v7 = MEMORY[0x1A1B00850](v11);
  v8 = (void *)v7;
  if (a3)
    objc_msgSend(a1, "fp_coordinatedDeleteWithHandler:", v7);
  else
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, a1, 0);
  v6[2](v6, v13[5]);
  v9 = v13[5] == 0;

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (uint64_t)fp_deleteWithCompletionHandler:()FPFSHelpers
{
  return objc_msgSend(a1, "fp_deleteAllowingCoordination:completionHandler:", 1, a3);
}

- (id)fp_withReadWriteAccess:()FPFSHelpers
{
  void (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  NSObject *v16;
  __CFFileSecurity *v17;
  NSObject *v18;
  char v19;
  mode_t st_mode;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  char v31;
  NSObject *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  stat v38;

  v4 = a3;
  v5 = objc_retainAutorelease(a1);
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 260);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = v6;
    v4[2](v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != (void *)*MEMORY[0x1E0CB2FE0] || objc_msgSend(v9, "code") == 13)
      {

        goto LABEL_6;
      }
      v26 = objc_msgSend(v9, "code");

      if (v26 == 1)
      {
LABEL_6:
        fp_current_or_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke_cold_1();

        memset(&v38, 0, sizeof(v38));
        if (fstat(v7, &v38) < 0)
        {
          fp_current_or_default_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.2();

          close(v7);
          objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
          v22 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_56;
        }
        v37 = 0;
        v12 = *MEMORY[0x1E0C99990];
        v36 = 0;
        v13 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v37, v12, &v36);
        v14 = v37;
        v15 = v36;

        if ((v13 & 1) == 0)
        {
          fp_current_or_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.10();

        }
        if (v14)
        {
          v17 = (__CFFileSecurity *)objc_alloc_init(MEMORY[0x1E0C99DA8]);
          if (!CFFileSecuritySetAccessControlList(v17, (acl_t)1))
          {
            fp_current_or_default_log();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.9();

          }
          v35 = v15;
          v19 = objc_msgSend(v5, "setResourceValue:forKey:error:", v17, v12, &v35);
          v9 = v35;

          if ((v19 & 1) == 0)
          {
            fp_current_or_default_log();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.8();

            close(v7);
            v22 = v9;

            v9 = v22;
            goto LABEL_55;
          }

          st_mode = v38.st_mode;
        }
        else
        {
          st_mode = v38.st_mode;
          if ((v38.st_mode & 0x80) != 0)
          {
            fp_current_or_default_log();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.7(&v38.st_mode, v28);

            close(v7);
LABEL_42:
            v29 = v15;
LABEL_54:
            v22 = v29;
            v9 = v29;
            goto LABEL_55;
          }
          v9 = v15;
        }
        if (fchmod(v7, st_mode | 0x80) < 0)
        {
          fp_current_or_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.3();
        }
        else
        {
          v4[2](v4, v7);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          v24 = objc_retainAutorelease(v5);
          if (access((const char *)objc_msgSend(v24, "fileSystemRepresentation"), 0))
          {
            close(v7);
            if (*__error() != 2)
            {
              fp_current_or_default_log();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.6();

              objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
              v22 = (id)objc_claimAutoreleasedReturnValue();
              v9 = v15;
              goto LABEL_55;
            }
            goto LABEL_42;
          }
          if (v14)
          {
            v34 = v15;
            v31 = objc_msgSend(v24, "setResourceValue:forKey:error:", v14, v12, &v34);
            v9 = v34;

            if ((v31 & 1) == 0)
            {
              fp_current_or_default_log();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.5();

              goto LABEL_53;
            }
          }
          else
          {
            v9 = v15;
          }
          if ((fchmod(v7, v38.st_mode) & 0x80000000) == 0)
          {
LABEL_53:
            close(v7);
            v29 = v9;
            goto LABEL_54;
          }
          fp_current_or_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.4();
        }

        close(v7);
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
        v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:

        goto LABEL_56;
      }
    }
    close(v7);
    v22 = v9;
    v9 = v22;
LABEL_56:

    goto LABEL_57;
  }
  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
  v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

  return v22;
}

- (id)fp_physicalURL
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = _CFURLPromiseCopyPhysicalURL();
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = a1;
  v5 = v4;

  return v5;
}

- (void)fp_scanForURLOfChildWithName:()FPFSHelpers isFolder:maxChildrenCount:notMatchingFileID:nextAvailableBounceNumber:.cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A0A34000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] can't get fileID of '%@'", a1, 0xCu);

}

- (void)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] performing case-insensitive lookup on top of case sensitive file-system at %@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)fp_existingURLOfChildWithName:()FPFSHelpers isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] cannot get case sensitivity for %@", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)fp_queued_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, v0, v1, "[DEBUG] can't retrieve fileID for %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)fp_queued_moveUnderFolder:()FPFSHelpers withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_16_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v7, v5, "[DEBUG] Can't read mtime from %@: %@", v6);

}

- (void)fp_deleteStaleBusyFileWithFileDescriptor:()FPFSHelpers coordinatorPurposeIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, v0, v1, "[DEBUG] Coordination for reading failed with error: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1A0A34000, v0, v1, "[ERROR] can't open file at \"%s\" %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1A0A34000, v0, v1, "[ERROR] can't stat file at \"%s\" %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1A0A34000, v0, v1, "[ERROR] can't fixup permissions of \"%s\" for write operation %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1A0A34000, v0, v1, "[ERROR] can't restore permissions of \"%s\" %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.5()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_21_0();
  objc_msgSend((id)OUTLINED_FUNCTION_24_0(v0, v1), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] can't restore ACL of \"%s\"; %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1A0A34000, v0, v1, "[ERROR] can't access file at \"%s\" %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.7(unsigned __int16 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] user already has write access (m:%{darwin.mode}d)", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_30();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_21_0();
  objc_msgSend((id)OUTLINED_FUNCTION_24_0(v0, v1), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] can't remove ACL from \"%s\"; %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] can't set no ACL on provided file security", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)fp_withReadWriteAccess:()FPFSHelpers .cold.10()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_21_0();
  objc_msgSend((id)OUTLINED_FUNCTION_24_0(v0, v1), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] can't fetch file security info from \"%s\"; %@",
    v5,
    v6,
    v7,
    v8,
    2u);

  OUTLINED_FUNCTION_7();
}

@end
