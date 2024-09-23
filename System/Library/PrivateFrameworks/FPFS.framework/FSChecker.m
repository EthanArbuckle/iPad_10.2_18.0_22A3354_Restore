@implementation FSChecker

- (BOOL)isDataProtectedFileAtPath:(id)a3 handle:(fpfs_item_handle *)a4
{
  NSObject *v6;
  _OWORD v7[3];
  __int128 v8;
  uint64_t v9;

  v9 = 0;
  v8 = xmmword_23B1CA538;
  memset(v7, 0, 40);
  if (getattrlist((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation", 0), &v8, v7, 0x28uLL, 0x21u) < 0)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FSChecker isDataProtectedFileAtPath:handle:].cold.1(v6);

  }
  else if (DWORD2(v7[0]) == 1 && (DWORD1(v7[2]) - 3) >= 0xFFFFFFFE)
  {
    a4->var5 = DWORD1(v7[0]);
    *(_OWORD *)&a4->var0 = *(_OWORD *)((char *)&v7[1] + 4);
    *(int32x2_t *)&a4->var2 = vrev64_s32(*(int32x2_t *)((char *)v7 + 12));
    a4->var4 = 0;
    return 1;
  }
  return 0;
}

- (void)enumerateItemsOnDiskAtURL:(id)a3 detachedRoots:(id)a4 usingFPFS:(BOOL)a5 ioContext:(id *)a6 delegate:(id)a7
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  char *const *v24;
  FSChecker *v25;
  FTS *v26;
  NSObject *v27;
  __int128 v28;
  FTSENT *v29;
  void *v30;
  void *v31;
  int v32;
  char v33;
  NSObject *v34;
  void *v35;
  ino_t fts_ino;
  int v37;
  int *v38;
  _QWORD v39[2];
  char *const *v40;
  _BOOL4 v41;
  const $6AAE9F320854132F5562CA372881902E *v42;
  id v43;
  id v44;
  FSChecker *v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  FSChecker *v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  FTSENT *v59;
  const $6AAE9F320854132F5562CA372881902E *v60;
  BOOL v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  void *v73;
  __int16 v74;
  ino_t v75;
  __int16 v76;
  int v77;
  uint8_t v78[32];
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;

  v42 = a6;
  v41 = a5;
  v45 = self;
  v81 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v44 = a7;
  v11 = objc_msgSend(v10, "count");
  v39[1] = v39;
  v12 = (_QWORD *)((char *)v39 - ((8 * v11 + 31) & 0xFFFFFFFFFFFFFFF0));
  bzero(v12, 8 * v11 + 16);
  v43 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v43, "fileSystemRepresentation");
  v40 = (char *const *)v12;
  *v12 = v13;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v15)
  {
    v16 = 0;
    v17 = *(_QWORD *)v69;
    *(_QWORD *)&v46 = v40 + 1;
    do
    {
      v18 = 0;
      v19 = (int)v16;
      v20 = (v16 << 32) + 0x100000000;
      v21 = v46 + 8 * (int)v16;
      do
      {
        if (*(_QWORD *)v69 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v18), "physicalLocation");
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_QWORD *)(v21 + 8 * v18) = objc_msgSend(v22, "fileSystemRepresentation");

        ++v18;
        v20 += 0x100000000;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      v16 = v19 + v18;
    }
    while (v15);
    v23 = v20 >> 32;
  }
  else
  {
    v23 = 1;
  }

  v24 = v40;
  v40[v23] = 0;
  v25 = v45;
  *(_WORD *)&v45->_itemIsInsideAPackage = 0;
  v25->_itemIsInsideAnIgnoredFolder = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy_;
  v66[4] = __Block_byref_object_dispose_;
  v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy_;
  v64[4] = __Block_byref_object_dispose_;
  v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy_;
  v62[4] = __Block_byref_object_dispose_;
  v63 = 0;
  v26 = fts_open(v24, 16, 0);
  if (v26)
  {
    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    *(_QWORD *)&v28 = 138543874;
    v46 = v28;
    while (1)
    {
      v29 = fts_read(v26);
      if (!v29)
      {
LABEL_28:
        fts_close(v26);
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v29->fts_path);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0;
      memset(v78, 0, sizeof(v78));
      v31 = (void *)MEMORY[0x23B860C70]();
      if (v29->fts_info == 8 && errorInjectionPointEnabled())
      {
        *__error() = 1;
      }
      else
      {
        v47 = MEMORY[0x24BDAC760];
        v48 = 3221225472;
        v49 = __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke;
        v50 = &unk_250BDBB00;
        v59 = v29;
        v60 = v42;
        v51 = v45;
        v56 = v64;
        v61 = v41;
        v52 = v14;
        v53 = v43;
        v54 = v44;
        v55 = v27;
        v57 = v66;
        v58 = v62;
        v32 = fpfs_open();

        if (!v32)
          goto LABEL_26;
      }
      if (*__error() != 4)
      {
        if (*__error() != 1
          || !-[FSChecker isDataProtectedFileAtPath:handle:](v45, "isDataProtectedFileAtPath:handle:", v30, v78))
        {
          fp_current_or_default_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v30, "fp_obfuscatedPath");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            fts_ino = v29->fts_ino;
            v37 = *__error();
            v72 = v46;
            v73 = v35;
            v74 = 2048;
            v75 = fts_ino;
            v76 = 1024;
            v77 = v37;
            _os_log_impl(&dword_23AA66000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] FPCK checking %{public}@ (fileID=%llu) failed with %{errno}d", (uint8_t *)&v72, 0x1Cu);

          }
LABEL_26:
          v33 = 1;
          goto LABEL_27;
        }
        if ((objc_msgSend(v44, "checker:handleLockedItemAtPath:handle:", v45, v30, v78) & 1) != 0)
          goto LABEL_26;
      }
      v33 = 0;
LABEL_27:
      objc_autoreleasePoolPop(v31);

      if ((v33 & 1) == 0)
        goto LABEL_28;
    }
  }
  fp_current_or_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v38 = __error();
    -[FSChecker enumerateItemsOnDiskAtURL:detachedRoots:usingFPFS:ioContext:delegate:].cold.1(v38, v78, v27);
  }
LABEL_31:

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
}

uint64_t __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke(uint64_t a1)
{
  int v2;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[4];

  v2 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 96) + 88);
  if (v2 == 6)
  {
    objc_msgSend(*(id *)(a1 + 64), "removeLastObject");
    v3 = *(_BYTE **)(a1 + 32);
    if (v3[8])
    {
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 96) + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = objc_msgSend(v4, "isEqualToString:", v5);

      v3 = *(_BYTE **)(a1 + 32);
      if ((_DWORD)v4)
      {
        v3[8] = 0;
        v3 = *(_BYTE **)(a1 + 32);
      }
    }
    if (v3[9])
    {
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 96) + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

      v3 = *(_BYTE **)(a1 + 32);
      if ((_DWORD)v6)
      {
        v3[9] = 0;
        v3 = *(_BYTE **)(a1 + 32);
      }
    }
    if (v3[10])
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 96) + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v8, "isEqualToString:", v9);

      if ((_DWORD)v8)
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
    }
  }
  else
  {
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    v10 = fpfs_fgetfileattrs();
    if ((v10 & 0x80000000) == 0)
    {
      if (*((_BYTE *)v32 + 24))
      {
        v11 = *(_QWORD *)(a1 + 32);
        if (!*(_BYTE *)(v11 + 8))
        {
          *(_BYTE *)(v11 + 8) = 1;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 96) + 48));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

        }
      }
      if (v2 == 1)
      {
        if (*((_BYTE *)v28 + 24))
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 96) + 48));
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;

        }
        v18 = *(void **)(a1 + 64);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 96) + 72));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

      }
    }

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(v35, 8);
    if (v10 < 0)
      return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _TtC9libfssync16FPCKDetachedRoot *v22;
  void *v23;
  void *v24;
  void *v25;
  _TtC9libfssync16FPCKDetachedRoot *v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[2];
  __int16 v39;
  char v40;
  char v41;
  char v42;
  _BYTE v43[17];
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (*(_DWORD *)(a2 + 44) & 0x200) != 0;
  v4 = *(_BYTE *)(a1 + 132);
  if (v4)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      v4 = 0;
    else
      v4 = *(_BYTE *)(a2 + 45) & 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_DWORD *)(a2 + 40) == 3;
  if (*(_BYTE *)(a1 + 132))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v5 + 9) && (*(_BYTE *)(a2 + 44) & 0x80) != 0)
    {
      *(_BYTE *)(v5 + 9) = 1;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 112) + 48));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
  v44 = 0u;
  *(_OWORD *)&v43[1] = 0u;
  v38[0] = *(_BYTE *)(a1 + 133);
  v9 = *(_QWORD *)(a1 + 32);
  v38[1] = *(_BYTE *)(v9 + 8);
  v39 = *(_WORD *)(v9 + 9);
  v10 = *(_QWORD *)(a1 + 80);
  v40 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v41 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  v42 = *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24);
  *(_WORD *)v43 = 0;
  v43[2] = 0;
  *(_QWORD *)&v43[9] = a2;
  v11 = *(_QWORD *)(a1 + 112);
  DWORD2(v44) = *(_DWORD *)(*(_QWORD *)(a1 + 120) + 8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11 + 104);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 112);
  v14 = *(_QWORD *)(v13 + 96);
  if (v14)
    v15 = (*(_BYTE *)(v14 + 116) & 0x40) == 0;
  else
    v15 = 1;
  if (!*(_DWORD *)(a2 + 256))
    v15 = 0;
  v43[3] = v15;
  *(_QWORD *)&v44 = v14;
  if ((*(_DWORD *)(a2 + 40) & 0xFFFFFFFE) == 2 && (*(_BYTE *)(a2 + 45) & 0x40) != 0)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = *(id *)(a1 + 40);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
LABEL_18:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
        if (objc_msgSend(v21, "inode") == *(_QWORD *)(v14 + 8))
          break;
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
          if (v18)
            goto LABEL_18;
          goto LABEL_24;
        }
      }
      v22 = v21;
      v43[0] = 1;

      if (v22)
        goto LABEL_32;
    }
    else
    {
LABEL_24:

    }
    v23 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(*(_QWORD *)(a1 + 112) + 48));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fileURLWithPath:isDirectory:", v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = [_TtC9libfssync16FPCKDetachedRoot alloc];
    v27 = *(_QWORD *)(a1 + 48);
    v33 = 0;
    v22 = -[FPCKDetachedRoot initWithPhysicalLocation:rootURL:error:](v26, "initWithPhysicalLocation:rootURL:error:", v25, v27, &v33);
    v28 = v33;
    if (v22)
    {
      v43[2] = -[FPCKDetachedRoot shouldRefreshBookmark](v22, "shouldRefreshBookmark");
      -[FPCKDetachedRoot logicalLocation](v22, "logicalLocation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v29 == 0;

    }
    else
    {
      fp_current_or_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke_2_cold_1(v25, v28, v30);

      v43[1] = 1;
    }

LABEL_32:
    v13 = *(_QWORD *)(a1 + 112);
  }
  if ((checkInvariants(v13, *(unsigned int *)(a1 + 128), *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24, (uint64_t)v38) & 0x80000000) != 0)
    goto LABEL_37;
  if ((objc_msgSend(*(id *)(a1 + 56), "checker:handleItem:itemStatus:under:brokenInvariants:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 128), v38, *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)) & 1) == 0)
  {
    *__error() = 4;
LABEL_37:
    v31 = 0xFFFFFFFFLL;
    goto LABEL_38;
  }
  v31 = 0;
LABEL_38:

  return v31;
}

- (BOOL)itemIsInsideAPackage
{
  return self->_itemIsInsideAPackage;
}

- (void)setItemIsInsideAPackage:(BOOL)a3
{
  self->_itemIsInsideAPackage = a3;
}

- (BOOL)itemIsInsideAPinnedFolder
{
  return self->_itemIsInsideAPinnedFolder;
}

- (void)setItemIsInsideAPinnedFolder:(BOOL)a3
{
  self->_itemIsInsideAPinnedFolder = a3;
}

- (BOOL)itemIsInsideAnIgnoredFolder
{
  return self->_itemIsInsideAnIgnoredFolder;
}

- (void)setItemIsInsideAnIgnoredFolder:(BOOL)a3
{
  self->_itemIsInsideAnIgnoredFolder = a3;
}

- (void)isDataProtectedFileAtPath:(NSObject *)a1 handle:.cold.1(NSObject *a1)
{
  int *v2;
  char *v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  v3 = strerror(*v2);
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_23AA66000, a1, OS_LOG_TYPE_ERROR, "[ERROR] Unable to getattrlist: %s", (uint8_t *)&v4, 0xCu);
}

- (void)enumerateItemsOnDiskAtURL:(os_log_t)log detachedRoots:usingFPFS:ioContext:delegate:.cold.1(int *a1, uint8_t *buf, os_log_t log)
{
  int v3;

  v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_23AA66000, log, OS_LOG_TYPE_ERROR, "[ERROR] Couldn't open stream: %{errno}d", buf, 8u);
}

void __82__FSChecker_enumerateItemsOnDiskAtURL_detachedRoots_usingFPFS_ioContext_delegate___block_invoke_2_cold_1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_23AA66000, a3, OS_LOG_TYPE_ERROR, "[ERROR] cannot build descriptor for detached item %@: %@", (uint8_t *)&v7, 0x16u);

}

@end
