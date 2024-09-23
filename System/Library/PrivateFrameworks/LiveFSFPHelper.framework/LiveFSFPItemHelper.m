@implementation LiveFSFPItemHelper

+ (int)dt_dir
{
  return 2;
}

+ (int)dt_reg
{
  return 1;
}

+ (int)dt_lnk
{
  return 3;
}

+ (int)dt_examine
{
  return -1;
}

- (NSString)fullPath
{
  NSString *fullPath;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSObject *v8;

  fullPath = self->_fullPath;
  if (!fullPath)
  {
    -[LiveFSFPExtensionHelper mountPath](self->_extension, "mountPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", self->_path);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_fullPath;
    self->_fullPath = v6;

    fullPath = self->_fullPath;
    if (!fullPath)
    {
      livefs_std_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[LiveFSFPItemHelper fullPath].cold.1();

      fullPath = self->_fullPath;
    }
  }
  return fullPath;
}

- (id)initItemForFH:(id)a3 withReference:(int)a4 name:(id)a5 parent:(id)a6 type:(int)a7 attrs:(id)a8 extension:(id)a9
{
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  LiveFSFPItemHelper *v26;
  void *v27;
  NSObject *v28;
  LiveFSFPItemHelper *v29;
  void *v30;
  NSString *fullPath;
  void *v32;
  void *v33;
  void *path;
  uint64_t v35;
  NSString *v36;
  NSObject *v37;
  int v38;
  NSString *v39;
  NSString *v40;
  NSString *itemIdentifier;
  NSString *v42;
  NSString *filename;
  NSString *v44;
  id v45;
  const void *v46;
  unint64_t v47;
  size_t v48;
  NSObject *v49;
  int liType;
  uint64_t v51;
  NSMapTable *itemNameCache;
  int v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;
  uint8_t buf[4];
  NSString *v60;
  __int16 v61;
  NSString *v62;
  __int16 v63;
  NSString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v55 = a5;
  v56 = a6;
  v16 = a8;
  v17 = a9;
  livefs_std_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);

  v58.receiver = self;
  v58.super_class = (Class)LiveFSFPItemHelper;
  v26 = -[LiveFSFPItemHelper init](&v58, sel_init);
  v27 = v17;
  if (!v26)
    goto LABEL_38;
  if (a7 != -1 || v16)
  {
    v54 = objc_msgSend(v17, "idsPersist");
    objc_storeStrong((id *)&v26->_extension, a9);
    if (a4)
      v30 = v57;
    else
      v30 = 0;
    objc_storeStrong((id *)&v26->_fh, v30);
    v26->_liType = a7;
    objc_storeStrong((id *)&v26->_parent, a6);
    v26->numChildren = -1;
    fullPath = v26->_fullPath;
    v26->_fullPath = 0;

    if (v56)
    {
      objc_storeStrong((id *)&v26->_filename, a5);
      objc_msgSend(v56, "itemIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)*MEMORY[0x24BDC8228];

      if (v32 == v33)
      {
        v39 = (NSString *)v55;
        path = v26->_path;
        v26->_path = v39;
      }
      else
      {
        objc_msgSend(v56, "path");
        path = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(path, "stringByAppendingPathComponent:", v55);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v26->_path;
        v26->_path = (NSString *)v35;

      }
      v38 = v54;

      if (v54)
      {
        objc_msgSend(MEMORY[0x24BE60438], "identifierForItem:name:parentID:", 0, v55, objc_msgSend(v56, "inodeNum"));
        v40 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = v26->_path;
      }
      itemIdentifier = v26->_itemIdentifier;
      v26->_itemIdentifier = v40;

      livefs_std_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        filename = v26->_filename;
        v42 = v26->_itemIdentifier;
        v44 = v26->_path;
        *(_DWORD *)buf = 138412802;
        v60 = v42;
        v61 = 2112;
        v62 = filename;
        v63 = 2112;
        v64 = v44;
        _os_log_impl(&dword_21F8A5000, v37, OS_LOG_TYPE_DEFAULT, "Created Item ID %@ name '%@', path '%@'", buf, 0x20u);
      }
    }
    else
    {
      objc_storeStrong((id *)&v26->_itemIdentifier, (id)*MEMORY[0x24BDC8228]);
      objc_storeStrong((id *)&v26->_fh, a3);
      objc_storeStrong((id *)&v26->_filename, a5);
      v37 = v26->_path;
      v26->_path = (NSString *)&stru_24E46BB18;
      v38 = v54;
    }

    objc_msgSend(v17, "addItem:identifier:fileHandle:", v26, v26->_itemIdentifier, v26->_fh);
    if (v16)
    {
      v26->_attr_load = time(0);
      v45 = objc_retainAutorelease(v16);
      v46 = (const void *)objc_msgSend(v45, "bytes");
      v47 = objc_msgSend(v45, "length");
      if (v47 >= 0xB8)
        v48 = 184;
      else
        v48 = v47;
      memcpy(&v26->attributes, v46, v48);
      if (v38)
      {
        if ((v26->attributes.fa_validmask & 0x100) != 0)
        {
          v26->_inodeNum = v26->attributes.fa_fileid;
        }
        else
        {
          livefs_std_log();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
            -[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:].cold.2();

        }
      }
      liType = v26->_liType;
      v27 = v17;
      if (liType == -1)
      {
        liType = v26->attributes.fa_type;
        if ((liType - 1) > 2)
          goto LABEL_37;
        v26->_liType = liType;
      }
    }
    else
    {
      v26->_attr_load = -1;
      liType = v26->_liType;
    }
    if ((liType | 2) == 3)
    {
LABEL_38:
      v29 = v26;
      goto LABEL_39;
    }
LABEL_37:
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v51 = objc_claimAutoreleasedReturnValue();
    itemNameCache = v26->_itemNameCache;
    v26->_itemNameCache = (NSMapTable *)v51;

    goto LABEL_38;
  }
  livefs_std_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:].cold.1(v28);

  v29 = 0;
LABEL_39:

  return v29;
}

- (void)doDealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10(&dword_21F8A5000, v0, v1, "%s starting in ID %@ fh %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)dealloc
{
  objc_super v3;

  -[LiveFSFPItemHelper doDealloc](self, "doDealloc");
  v3.receiver = self;
  v3.super_class = (Class)LiveFSFPItemHelper;
  -[LiveFSFPItemHelper dealloc](&v3, sel_dealloc);
}

+ (id)newItemForFH:(id)a3 withReference:(int)a4 name:(id)a5 parent:(id)a6 type:(int)a7 attrs:(id)a8 extension:(id)a9
{
  uint64_t v10;
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  v10 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a4;
  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initItemForFH:withReference:name:parent:type:attrs:extension:", v20, v13, v19, v18, v10, v17, v16);

  return v21;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)LiveFSFPItemHelper;
  -[LiveFSFPItemHelper description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ID '%@' name '%@' fh '%@'"), v4, self->_itemIdentifier, self->_filename, self->_fh);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *itemIdentifier;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    itemIdentifier = self->_itemIdentifier;
    objc_msgSend(v4, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](itemIdentifier, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)ensureFileHandleOrError:(id *)a3
{
  NSObject *v3;
  BOOL v4;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSString *filename;
  id v16;
  LiveFSFPExtensionHelper *v17;
  NSString *fh;
  NSObject *v20;
  _QWORD v21[6];
  _QWORD v22[5];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[5];
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!self->_fh)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__2;
    v29 = __Block_byref_object_dispose__2;
    v30 = 0;
    if (self->_itemIdentifier == (NSString *)*MEMORY[0x24BDC8228])
    {
      -[LiveFSFPExtensionHelper conn](self->_extension, "conn");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x24BDAC760];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke;
      v25[3] = &unk_24E46B180;
      v25[4] = &buf;
      objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2;
      v24[3] = &unk_24E46B678;
      v24[4] = self;
      v24[5] = &buf;
      objc_msgSend(v10, "getRootFileHandleWithError:", v24);
      v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v11)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v11);
        v4 = 1;
        goto LABEL_21;
      }
      fh = self->_fh;
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_3;
      v23[3] = &unk_24E46B6A0;
      v23[4] = self;
      v23[5] = &buf;
      objc_msgSend(v10, "fileAttributes:requestID:reply:", fh, -1, v23);
      if (!a3)
      {
        if (-[LiveFSFPExtensionHelper idsPersist](self->_extension, "idsPersist"))
        {
          if ((self->attributes.fa_validmask & 0x100) != 0)
          {
            self->_inodeNum = self->attributes.fa_fileid;
          }
          else
          {
            livefs_std_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              -[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:].cold.2();

          }
        }
        goto LABEL_20;
      }
      v16 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    }
    else
    {
      -[LiveFSFPItemHelper fh](self->_parent, "fh");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

      }
      else if (-[LiveFSFPItemHelper ensureFileHandleOrError:](self->_parent, "ensureFileHandleOrError:", a3))
      {
        v4 = 1;
LABEL_22:
        _Block_object_dispose(&buf, 8);

        return v4;
      }
      -[LiveFSFPExtensionHelper conn](self->_extension, "conn");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_14;
      v22[3] = &unk_24E46B180;
      v22[4] = &buf;
      objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[LiveFSFPItemHelper fh](self->_parent, "fh");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      filename = self->_filename;
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2_15;
      v21[3] = &unk_24E46B6C8;
      v21[4] = self;
      v21[5] = &buf;
      objc_msgSend(v10, "lookupIn:name:usingFlags:requestID:reply:", v14, filename, 0, -1, v21);

      if (!a3)
      {
        v17 = self->_extension;
        objc_sync_enter(v17);
        -[LiveFSFPExtensionHelper addFileHandle:toItem:](self->_extension, "addFileHandle:toItem:", self->_fh, self);
        objc_sync_exit(v17);

LABEL_20:
        v4 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) != 0;
LABEL_21:

        goto LABEL_22;
      }
      v16 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    }
    *a3 = v16;
    goto LABEL_20;
  }
  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[LiveFSFPItemHelper ensureFileHandleOrError:]";
    _os_log_impl(&dword_21F8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s: exiting as already have the filehandle", (uint8_t *)&buf, 0xCu);
  }

  return 0;
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v5;

}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  if ((_DWORD)a2)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = time(0);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(objc_retainAutorelease(v19), "bytes");
    v10 = *(_OWORD *)(v9 + 32);
    v11 = *(_OWORD *)(v9 + 48);
    v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)(v8 + 8) = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 56) = v11;
    *(_OWORD *)(v8 + 40) = v10;
    *(_OWORD *)(v8 + 24) = v12;
    v13 = *(_OWORD *)(v9 + 96);
    v14 = *(_OWORD *)(v9 + 112);
    v15 = *(_OWORD *)(v9 + 80);
    *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 64);
    *(_OWORD *)(v8 + 120) = v14;
    *(_OWORD *)(v8 + 104) = v13;
    *(_OWORD *)(v8 + 88) = v15;
    v17 = *(_OWORD *)(v9 + 144);
    v16 = *(_OWORD *)(v9 + 160);
    v18 = *(_QWORD *)(v9 + 176);
    *(_OWORD *)(v8 + 136) = *(_OWORD *)(v9 + 128);
    *(_QWORD *)(v8 + 184) = v18;
    *(_OWORD *)(v8 + 168) = v16;
    *(_OWORD *)(v8 + 152) = v17;
  }

}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_14(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2_15(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  if ((_DWORD)a2)
  {
    v24 = a2;
LABEL_9:
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", v24);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v39 = *(void **)(v38 + 40);
    *(_QWORD *)(v38 + 40) = v37;

    goto LABEL_10;
  }
  if (!v17 || !v18)
  {
    livefs_std_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2_15_cold_1((uint64_t)v17, (uint64_t)v18, v36);

    v24 = 14;
    goto LABEL_9;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), a4);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = time(0);
  v25 = *(_QWORD *)(a1 + 32);
  v26 = objc_msgSend(objc_retainAutorelease(v18), "bytes");
  v27 = *(_OWORD *)(v26 + 32);
  v28 = *(_OWORD *)(v26 + 48);
  v29 = *(_OWORD *)(v26 + 16);
  *(_OWORD *)(v25 + 8) = *(_OWORD *)v26;
  *(_OWORD *)(v25 + 56) = v28;
  *(_OWORD *)(v25 + 40) = v27;
  *(_OWORD *)(v25 + 24) = v29;
  v30 = *(_OWORD *)(v26 + 96);
  v31 = *(_OWORD *)(v26 + 112);
  v32 = *(_OWORD *)(v26 + 80);
  *(_OWORD *)(v25 + 72) = *(_OWORD *)(v26 + 64);
  *(_OWORD *)(v25 + 120) = v31;
  *(_OWORD *)(v25 + 104) = v30;
  *(_OWORD *)(v25 + 88) = v32;
  v34 = *(_OWORD *)(v26 + 144);
  v33 = *(_OWORD *)(v26 + 160);
  v35 = *(_QWORD *)(v26 + 176);
  *(_OWORD *)(v25 + 136) = *(_OWORD *)(v26 + 128);
  *(_QWORD *)(v25 + 184) = v35;
  *(_OWORD *)(v25 + 168) = v33;
  *(_OWORD *)(v25 + 152) = v34;
LABEL_10:

}

- (void)resetFileHandle
{
  NSString *fh;

  fh = self->_fh;
  self->_fh = 0;

}

- (void)setAttributesLocked:(id)a3 time:(int64_t)a4
{
  id v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  timespec v12;
  timespec v13;
  timespec v14;
  timespec v15;
  timespec v16;
  id v17;

  v6 = a3;
  if (!a4)
    a4 = time(0);
  self->_attr_load = a4;
  v17 = objc_retainAutorelease(v6);
  v7 = objc_msgSend(v17, "bytes");
  v8 = *(_OWORD *)v7;
  v9 = *(_OWORD *)(v7 + 16);
  v10 = *(_OWORD *)(v7 + 32);
  *(_OWORD *)&self->attributes.fa_size = *(_OWORD *)(v7 + 48);
  *(_OWORD *)&self->attributes.fa_nlink = v10;
  *(_OWORD *)&self->attributes.fa_seqno = v9;
  *(_OWORD *)&self->attributes.__fa_rsvd0 = v8;
  v11 = *(_OWORD *)(v7 + 64);
  v12 = *(timespec *)(v7 + 80);
  v13 = *(timespec *)(v7 + 96);
  self->attributes.fa_ctime = *(timespec *)(v7 + 112);
  self->attributes.fa_mtime = v13;
  self->attributes.fa_atime = v12;
  *(_OWORD *)&self->attributes.fa_fileid = v11;
  v14 = *(timespec *)(v7 + 128);
  v15 = *(timespec *)(v7 + 144);
  v16 = *(timespec *)(v7 + 160);
  *(_QWORD *)&self->attributes.fa_int_flags = *(_QWORD *)(v7 + 176);
  self->attributes.fa_addedtime = v16;
  self->attributes.fa_backuptime = v15;
  self->attributes.fa_birthtime = v14;
  self->numChildren = -1;

}

- (void)setAttributes:(id)a3 time:(int64_t)a4
{
  LiveFSFPItemHelper *v6;
  id v7;

  v7 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[LiveFSFPItemHelper setAttributesLocked:time:](v6, "setAttributesLocked:time:", v7, a4);
  objc_sync_exit(v6);

}

- (void)setAttributesStale
{
  NSDate *lastXattrValuesFetchDate;
  LiveFSFPItemHelper *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_attr_load = -1;
  lastXattrValuesFetchDate = obj->_lastXattrValuesFetchDate;
  obj->_lastXattrValuesFetchDate = 0;

  objc_sync_exit(obj);
}

- (void)setItemDeleted
{
  NSString *path;
  NSString *fullPath;
  LiveFSFPItemHelper *parent;
  NSString *fh;
  LiveFSFPItemHelper *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_parent && obj->_filename)
    -[LiveFSFPExtensionHelper removeItem:parent:name:fileHandle:](obj->_extension, "removeItem:parent:name:fileHandle:", obj->_itemIdentifier);
  path = obj->_path;
  obj->_path = (NSString *)&stru_24E46BB18;

  fullPath = obj->_fullPath;
  obj->_fullPath = (NSString *)&stru_24E46BB18;

  parent = obj->_parent;
  obj->_parent = 0;

  -[LiveFSFPItemHelper doDealloc](obj, "doDealloc");
  fh = obj->_fh;
  obj->_fh = 0;

  obj->_attr_load = -1;
  objc_sync_exit(obj);

}

- (void)recursivelySetChildrenDeleted
{
  int liType;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  liType = self->_liType;
  if (liType == +[LiveFSFPItemHelper dt_dir](LiveFSFPItemHelper, "dt_dir"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = 0;
      v7 = v16;
      do
      {
        v8 = v6;
        objc_msgSend(v7, "removeObjectAtIndex:", 0);
        objc_msgSend(v5, "itemNameCache");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectEnumerator");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(v6, "nextObject");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            do
            {
              v12 = v11;
              objc_sync_enter(v12);
              v13 = *((_DWORD *)v12 + 66);
              if (v13 == +[LiveFSFPItemHelper dt_dir](LiveFSFPItemHelper, "dt_dir"))
                objc_msgSend(v16, "insertObject:atIndex:", v12, 0);
              if (*((_QWORD *)v12 + 40) && *((_QWORD *)v12 + 34))
                -[LiveFSFPExtensionHelper removeItem:parent:name:fileHandle:](self->_extension, "removeItem:parent:name:fileHandle:", *((_QWORD *)v12 + 35));
              v14 = (void *)*((_QWORD *)v12 + 34);
              *((_QWORD *)v12 + 34) = 0;

              objc_sync_exit(v12);
              objc_msgSend(v6, "nextObject");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

            }
            while (v11);
          }
        }

        objc_msgSend(v16, "lastObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v16;
      }
      while (v5);

    }
    v15 = v16;
  }
  else
  {
    v15 = 0;
  }

}

- (void)recursivelyReparentChildren
{
  int liType;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;

  liType = self->_liType;
  if (liType == +[LiveFSFPItemHelper dt_dir](LiveFSFPItemHelper, "dt_dir"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", self);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (_QWORD *)v4;
      v6 = 0;
      v7 = 0;
      v8 = (void *)*MEMORY[0x24BDC8228];
      v9 = v27;
      do
      {
        v10 = v7;
        objc_msgSend(v9, "removeObjectAtIndex:", 0);
        objc_msgSend(v5, "itemNameCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectEnumerator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v7, "nextObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            v14 = v6;
            do
            {
              v15 = v13;
              objc_sync_enter(v15);
              v16 = *((_DWORD *)v15 + 66);
              if (v16 == +[LiveFSFPItemHelper dt_dir](LiveFSFPItemHelper, "dt_dir"))
                objc_msgSend(v27, "insertObject:atIndex:", v15, 0);
              objc_msgSend(v5, "itemIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17 == v8)
              {
                v21 = v15[34];
                v18 = v15[37];
                v15[37] = v21;
              }
              else
              {
                objc_msgSend(v5, "path");
                v18 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "stringByAppendingPathComponent:", v15[34]);
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = v15[37];
                v15[37] = (id)v19;

              }
              v22 = v15[25];
              v15[25] = 0;

              v6 = v15[35];
              if (-[LiveFSFPExtensionHelper idsPersist](self->_extension, "idsPersist"))
              {
                objc_msgSend(MEMORY[0x24BE60438], "identifierForItem:name:parentID:", 0, v15[34], v5[43]);
                v23 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v23 = v15[37];
              }
              v24 = v15[35];
              v15[35] = v23;

              -[LiveFSFPExtensionHelper reIDItem:oldID:](self->_extension, "reIDItem:oldID:", v15, v6);
              objc_sync_exit(v15);

              objc_msgSend(v7, "nextObject");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = v6;
            }
            while (v13);
          }
        }
        objc_msgSend(v27, "lastObject");
        v25 = objc_claimAutoreleasedReturnValue();

        v9 = v27;
        v5 = (_QWORD *)v25;
      }
      while (v25);

    }
    v26 = v27;
  }
  else
  {
    v26 = 0;
  }

}

- (void)setNewParent:(id)a3 andName:(id)a4
{
  _QWORD *v7;
  id v8;
  LiveFSFPItemHelper *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *path;
  uint64_t v14;
  NSString *v15;
  NSString *v16;
  NSString *fullPath;
  NSString *v18;
  NSString *v19;
  NSString *itemIdentifier;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (-[NSString isEqualToString:](v9->_filename, "isEqualToString:", v8)
    && -[LiveFSFPItemHelper isEqual:](v9->_parent, "isEqual:", v7))
  {
    livefs_std_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[LiveFSFPItemHelper setNewParent:andName:]";
      _os_log_impl(&dword_21F8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s: reparenting to current values", (uint8_t *)&v21, 0xCu);
    }

    objc_sync_exit(v9);
  }
  else
  {
    objc_msgSend(v7, "itemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x24BDC8228];

    if (v11 == v12)
    {
      v16 = (NSString *)v8;
      path = v9->_path;
      v9->_path = v16;
    }
    else
    {
      objc_msgSend(v7, "path");
      path = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(path, "stringByAppendingPathComponent:", v8);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v9->_path;
      v9->_path = (NSString *)v14;

    }
    fullPath = v9->_fullPath;
    v9->_fullPath = 0;

    v18 = v9->_itemIdentifier;
    if (-[LiveFSFPExtensionHelper idsPersist](v9->_extension, "idsPersist"))
    {
      objc_msgSend(MEMORY[0x24BE60438], "identifierForItem:name:parentID:", 0, v8, v7[43]);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = v9->_path;
    }
    itemIdentifier = v9->_itemIdentifier;
    v9->_itemIdentifier = v19;

    -[LiveFSFPExtensionHelper reparentItem:oldID:oldParent:oldName:newParent:newName:](v9->_extension, "reparentItem:oldID:oldParent:oldName:newParent:newName:", v9, v18, v9->_parent, v9->_filename, v7, v8);
    objc_storeStrong((id *)&v9->_filename, a4);
    objc_storeStrong((id *)&v9->_parent, a3);
    objc_sync_exit(v9);

    -[LiveFSFPItemHelper recursivelyReparentChildren](v9, "recursivelyReparentChildren");
  }

}

- (void)afterRename:(id)a3 performBlock:(id)a4
{
  id v6;
  LiveFSFPItemHelper *v7;
  NSMutableDictionary *pendingRenameCompletionBlocks;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  pendingRenameCompletionBlocks = v7->_pendingRenameCompletionBlocks;
  if (!pendingRenameCompletionBlocks)
  {
    v9 = objc_opt_new();
    v10 = v7->_pendingRenameCompletionBlocks;
    v7->_pendingRenameCompletionBlocks = (NSMutableDictionary *)v9;

    pendingRenameCompletionBlocks = v7->_pendingRenameCompletionBlocks;
  }
  v11 = (void *)MEMORY[0x2207CD064](v6);
  -[NSMutableDictionary setObject:forKey:](pendingRenameCompletionBlocks, "setObject:forKey:", v11, v12);

  objc_sync_exit(v7);
}

- (void)dropAfterRenameBlockForName:(id)a3
{
  LiveFSFPItemHelper *v4;
  NSMutableDictionary *pendingRenameCompletionBlocks;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  pendingRenameCompletionBlocks = v4->_pendingRenameCompletionBlocks;
  if (pendingRenameCompletionBlocks)
    -[NSMutableDictionary setValue:forKey:](pendingRenameCompletionBlocks, "setValue:forKey:", 0, v6);
  objc_sync_exit(v4);

}

- (void)performBlocksForRename:(id)a3 onEHQueue:(BOOL)a4
{
  LiveFSFPItemHelper *v6;
  NSMutableDictionary *pendingRenameCompletionBlocks;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  LiveFSFPItemHelper *v13;
  BOOL v14;

  v10 = a3;
  v6 = self;
  objc_sync_enter(v6);
  pendingRenameCompletionBlocks = v6->_pendingRenameCompletionBlocks;
  if (pendingRenameCompletionBlocks)
  {
    if (v10)
    {
      v8 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](pendingRenameCompletionBlocks, "mutableCopy");
    }
    else
    {
      v8 = pendingRenameCompletionBlocks;
      v9 = v6->_pendingRenameCompletionBlocks;
      v6->_pendingRenameCompletionBlocks = 0;

    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__LiveFSFPItemHelper_performBlocksForRename_onEHQueue___block_invoke;
    v11[3] = &unk_24E46B6F0;
    v14 = a4;
    v12 = v10;
    v13 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v6);

}

void __55__LiveFSFPItemHelper_performBlocksForRename_onEHQueue___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = *(void **)(a1 + 32);
  if (!v8 || objc_msgSend(v8, "isEqualToString:", v10))
  {
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207CD064](v7);
    v9[2](v9, *(unsigned __int8 *)(a1 + 48));
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "setValue:forKey:", 0);
      *a4 = 1;
    }

  }
}

- (void)setTagData:(id)a3
{
  NSData *v4;
  NSData *tagData;
  id v6;

  v6 = a3;
  if (v6 && -[LiveFSFPExtensionHelper supportsTagging](self->_extension, "supportsTagging"))
  {
    v4 = (NSData *)objc_msgSend(v6, "copy");
    tagData = self->_tagData;
    self->_tagData = v4;
  }
  else
  {
    tagData = self->_tagData;
    self->_tagData = 0;
  }

}

- (void)setFavoriteRank:(id)a3
{
  NSNumber *v4;
  NSNumber *favoriteRank;

  if (a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    favoriteRank = self->_favoriteRank;
    self->_favoriteRank = v4;
  }
  else
  {
    favoriteRank = self->_favoriteRank;
    self->_favoriteRank = 0;
  }

}

- (void)setLastUsedDate:(id)a3
{
  NSDate *v4;
  NSDate *lastUsedDate;

  if (a3)
  {
    v4 = (NSDate *)objc_msgSend(a3, "copy");
    lastUsedDate = self->_lastUsedDate;
    self->_lastUsedDate = v4;
  }
  else
  {
    lastUsedDate = self->_lastUsedDate;
    self->_lastUsedDate = 0;
  }

}

- (int)refreshAttrsHasAProblem:(id *)a3
{
  NSObject *v5;
  int v6;
  LiveFSFPItemHelper *v7;
  time_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *fh;
  uint64_t v13;
  id *v14;
  _BOOL4 v15;
  id v16;
  NSObject *v17;
  _QWORD v19[6];
  id obj;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper refreshAttrsHasAProblem:].cold.3();

  if (!-[LiveFSFPExtensionHelper _isLoggedInOrError:](self->_extension, "_isLoggedInOrError:", a3))
    return 1;
  if (a3)
    *a3 = 0;
  if (!-[LiveFSFPExtensionHelper isClusterMaster](self->_extension, "isClusterMaster"))
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = time(0);
    if (v7->_attr_load + 3600 > v8)
    {
      v6 = 0;
LABEL_27:
      objc_sync_exit(v7);

      return v6;
    }
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__2;
    v32 = __Block_byref_object_dispose__2;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    v27 = 0;
    -[LiveFSFPExtensionHelper conn](self->_extension, "conn");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __46__LiveFSFPItemHelper_refreshAttrsHasAProblem___block_invoke;
    v21[3] = &unk_24E46B180;
    v21[4] = &v22;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    fh = v7->_fh;
    if (fh)
    {
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __46__LiveFSFPItemHelper_refreshAttrsHasAProblem___block_invoke_23;
      v19[3] = &unk_24E46B298;
      v19[4] = &v22;
      v19[5] = &v28;
      objc_msgSend(v11, "fileAttributes:requestID:reply:", fh, -1, v19);
      v13 = v29[5];
      if (v13)
      {
        -[LiveFSFPItemHelper setAttributesLocked:time:](v7, "setAttributesLocked:time:", v13, v8);
LABEL_18:
        v6 = 0;
LABEL_26:

        _Block_object_dispose(&v22, 8);
        _Block_object_dispose(&v28, 8);

        goto LABEL_27;
      }
      v16 = (id)v23[5];
      if (v16)
      {
        livefs_std_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[LiveFSFPItemHelper refreshAttrsHasAProblem:].cold.1();
LABEL_22:

      }
    }
    else
    {
      v14 = (id *)(v23 + 5);
      obj = (id)v23[5];
      v15 = -[LiveFSFPItemHelper ensureFileHandleOrError:](v7, "ensureFileHandleOrError:", &obj);
      objc_storeStrong(v14, obj);
      if (!v15)
        goto LABEL_18;
      v16 = (id)v23[5];
      if (v16)
      {
        livefs_std_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[LiveFSFPItemHelper refreshAttrsHasAProblem:].cold.1();
        goto LABEL_22;
      }
    }
    if (a3)
    {
      v16 = objc_retainAutorelease(v16);
      *a3 = v16;
    }

    v6 = 1;
    goto LABEL_26;
  }
  return 0;
}

void __46__LiveFSFPItemHelper_refreshAttrsHasAProblem___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__LiveFSFPItemHelper_refreshAttrsHasAProblem___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if ((_DWORD)a2)
  {
    v6 = a2;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v5, "length") > 0xB7)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = v12;
      v9 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v11;
      goto LABEL_7;
    }
    v6 = 22;
  }
  +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;
LABEL_7:

}

- (BOOL)isDirectory
{
  LiveFSFPItemHelper *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_liType == 2;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSymlink
{
  LiveFSFPItemHelper *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_liType == 3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isDocument
{
  LiveFSFPItemHelper *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_liType == 1;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isHidden
{
  NSObject *v3;
  _BOOL4 v4;

  if (!-[LiveFSFPExtensionHelper isClusterMaster](self->_extension, "isClusterMaster"))
  {
    if (!-[LiveFSFPItemHelper refreshAttrsHasAProblem:](self, "refreshAttrsHasAProblem:", 0)
      && (self->attributes.fa_validmask & 2) != 0)
    {
      if (-[NSString hasPrefix:](self->_filename, "hasPrefix:", CFSTR(".")))
      {
        LOBYTE(v4) = 1;
        return v4;
      }
      if ((self->attributes.fa_validmask & 0x20) != 0)
        return BYTE1(self->attributes.fa_bsd_flags) >> 7;
    }
    else
    {
      livefs_std_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[LiveFSFPItemHelper isHidden].cold.1(self, v3);

    }
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (NSString)parentItemIdentifier
{
  NSObject *v3;
  void *v4;
  id v5;

  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper parentItemIdentifier].cold.1((uint64_t)self, v3);

  v4 = (void *)*MEMORY[0x24BDC8228];
  if (-[NSString isEqualToString:](self->_itemIdentifier, "isEqualToString:", *MEMORY[0x24BDC8228]))
  {
    v5 = v4;
  }
  else
  {
    -[LiveFSFPItemHelper itemIdentifier](self->_parent, "itemIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)fp_domainIdentifier
{
  void *v2;
  void *v3;

  -[NSFileProviderExtension domain](self->_extension, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fp_parentDomainIdentifier
{
  void *v3;
  void *v4;

  if (-[LiveFSFPExtensionHelper isClusterDomain](self->_extension, "isClusterDomain")
    && !-[LiveFSFPExtensionHelper isClusterMaster](self->_extension, "isClusterMaster")
    && -[NSString isEqualToString:](self->_itemIdentifier, "isEqualToString:", *MEMORY[0x24BDC8228]))
  {
    -[LiveFSFPExtensionHelper clusterMasterID](self->_extension, "clusterMasterID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSFileProviderExtension domain](self->_extension, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (unint64_t)capabilities
{
  unint64_t v3;
  NSObject *v4;
  unint64_t fa_mode;
  void *v7;
  int v8;
  LiveFSFPItemHelper *parent;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (-[LiveFSFPExtensionHelper isClusterMaster](self->_extension, "isClusterMaster"))
    return 1;
  if (!-[LiveFSFPItemHelper refreshAttrsHasAProblem:](self, "refreshAttrsHasAProblem:", 0)
    && (self->attributes.fa_validmask & 2) != 0)
  {
    fa_mode = self->attributes.fa_mode;
    -[LiveFSFPItemHelper isDirectory](self, "isDirectory");
    -[LiveFSFPItemHelper extension](self, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "idsPersist") ^ 1;
    parent = self->_parent;
    -[LiveFSFPItemHelper extension](self, "extension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsTrash");
    -[LiveFSFPItemHelper extension](self, "extension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportsTagging");
    -[LiveFSFPItemHelper extension](self, "extension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isReadOnlyVolume");
    if (parent)
      v16 = v15;
    else
      v16 = 1;
    if ((fa_mode & 0x80) != 0)
    {
      v17 = 0;
    }
    else
    {
      v16 = 1;
      v17 = v8;
    }
    if ((fa_mode & 0x80) != 0)
      v18 = v15;
    else
      v18 = 1;
    v19 = v17 | v15;
    if (!parent)
      v19 = 1;
    if (v16)
      v20 = (fa_mode >> 8) & 1;
    else
      v20 = (fa_mode >> 8) & 1 | 0xC;
    v21 = v20 | 0x10;
    if (!v11)
      v21 = v20;
    v22 = v21 | 0x20;
    if (!v19)
      v20 = v22;
    if (!v18)
      v20 |= 2uLL;
    if (v15 | v13 ^ 1)
      v23 = 0;
    else
      v23 = *MEMORY[0x24BDC8210];
    v3 = v20 | v23;

  }
  else
  {
    livefs_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[LiveFSFPItemHelper capabilities].cold.1(self, v4);

    return 0;
  }
  return v3;
}

- (id)br_pathExtension
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char *v12;
  size_t v13;
  size_t v14;
  void *v15;

  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper br_pathExtension].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  -[LiveFSFPItemHelper filename](self, "filename");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (char *)_extensionInFilename((char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);

  if (v12)
  {
    v13 = strlen(v12);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFileSystemRepresentation:length:", v12, v14);
      v12 = (char *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
  }
  return v12;
}

+ (id)UTIForExtension:(id)a3 liType:(int)a4
{
  uint64_t v5;
  __CFString *v6;
  CFStringRef *v7;
  __CFString *PreferredIdentifierForTag;

  v5 = UTIForExtension_liType__onceToken;
  v6 = (__CFString *)a3;
  if (v5 != -1)
    dispatch_once(&UTIForExtension_liType__onceToken, &__block_literal_global_28);
  v7 = (CFStringRef *)MEMORY[0x24BDC1750];
  if (a4 != 2)
    v7 = (CFStringRef *)MEMORY[0x24BDC1748];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], v6, *v7);

  return PreferredIdentifierForTag;
}

uint64_t __45__LiveFSFPItemHelper_UTIForExtension_liType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)UTIForExtension_liType__utiCache;
  UTIForExtension_liType__utiCache = v0;

  return objc_msgSend((id)UTIForExtension_liType__utiCache, "setCountLimit:", 200);
}

- (NSString)typeIdentifier
{
  NSObject *v3;
  uint64_t v4;
  id *v5;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  int liType;
  NSString *filename;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper typeIdentifier].cold.1((uint64_t)self, v3, v4);

  if (self->_liType == 3)
  {
    v5 = (id *)MEMORY[0x24BDC1878];
    return (NSString *)*v5;
  }
  -[LiveFSFPItemHelper br_pathExtension](self, "br_pathExtension");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (self->_liType == 2)
    {
      v5 = (id *)MEMORY[0x24BDC1770];
      return (NSString *)*v5;
    }
    v7 = &stru_24E46BB18;
  }
  objc_msgSend((id)objc_opt_class(), "UTIForExtension:liType:", v7, self->_liType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hasPrefix:", CFSTR("dyn."));
  livefs_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    liType = self->_liType;
    filename = self->_filename;
    v12 = 138412802;
    v13 = v8;
    v14 = 1024;
    v15 = liType;
    v16 = 2112;
    v17 = filename;
    _os_log_debug_impl(&dword_21F8A5000, v9, OS_LOG_TYPE_DEBUG, "typeIdentifier: returning %@ for type %d name %@", (uint8_t *)&v12, 0x1Cu);
  }

  return (NSString *)v8;
}

- (BOOL)isTrashed
{
  void *v3;
  BOOL v4;

  -[LiveFSFPItemHelper extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsTrash"))
    v4 = -[NSString hasPrefix:](self->_path, "hasPrefix:", CFSTR(".Trashes/"));
  else
    v4 = 0;

  return v4;
}

- (NSNumber)documentSize
{
  void *v3;
  LiveFSFPItemHelper *v4;

  v3 = 0;
  if (!-[LiveFSFPItemHelper refreshAttrsHasAProblem:](self, "refreshAttrsHasAProblem:", 0))
  {
    v4 = self;
    objc_sync_enter(v4);
    if (v4->attributes.fa_type == 2)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v4->attributes.fa_size);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_sync_exit(v4);

  }
  return (NSNumber *)v3;
}

- (BOOL)calcNumberOfChildren:(id *)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *fh;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  int v25;
  _QWORD v27[9];
  _QWORD v28[5];
  uint64_t v29;
  _QWORD v30[2];
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 buf;
  uint64_t v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x2020000000;
  v31 = 0;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[LiveFSFPItemHelper calcNumberOfChildren:]";
    _os_log_impl(&dword_21F8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s starting -H-", (uint8_t *)&buf, 0xCu);
  }

  v5 = 0;
  v6 = 1;
  v7 = MEMORY[0x24BDAC760];
LABEL_4:
  v25 = v6;
  v47[3] = 0;
  v43[3] = 0;
  *(_DWORD *)(v30[0] + 24) = 0;
  -[LiveFSFPExtensionHelper conn](self->_extension, "conn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __43__LiveFSFPItemHelper_calcNumberOfChildren___block_invoke;
  v28[3] = &unk_24E46B180;
  v28[4] = &v36;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  while (!*((_DWORD *)v33 + 6) && !v37[5])
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v51 = 0x2020000000;
    v52 = 0;
    fh = self->_fh;
    v11 = v43[3];
    v12 = v47[3];
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __43__LiveFSFPItemHelper_calcNumberOfChildren___block_invoke_2;
    v27[3] = &unk_24E46B758;
    v27[4] = &buf;
    v27[5] = &v32;
    v27[6] = &v29;
    v27[7] = &v42;
    v27[8] = &v46;
    objc_msgSend(v9, "readDirectory:amount:cookie:verifier:requestID:reply:", fh, 0x10000, v11, v12, -1, v27);
    v13 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
    if (v13)
    {
      if (v13 == -1002)
      {
        *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = 70;
      }
      else if (v13 == -1000)
      {
        _Block_object_dispose(&buf, 8);
        v6 = v25 + 1;
        v5 = v9;
        if (v25 != 6)
          goto LABEL_4;
        +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 11);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v37[5];
        v37[5] = v14;

        v16 = (id)v37[5];
        if (v16)
        {
          livefs_std_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[LiveFSFPItemHelper calcNumberOfChildren:].cold.1();

        }
        if (a3)
          *a3 = objc_retainAutorelease(v16);

        goto LABEL_30;
      }
      +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v37[5];
      v37[5] = v20;

      v22 = (id)v37[5];
      if (v22)
      {
        livefs_std_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[LiveFSFPItemHelper calcNumberOfChildren:].cold.1();

      }
      if (a3)
        *a3 = objc_retainAutorelease(v22);

      _Block_object_dispose(&buf, 8);
LABEL_30:
      v19 = 1;
      goto LABEL_31;
    }
    _Block_object_dispose(&buf, 8);
  }
  livefs_std_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper calcNumberOfChildren:].cold.2((uint64_t)self, (uint64_t)v30, v18);

  v19 = 0;
  self->numChildren = *(_DWORD *)(v30[0] + 24);
LABEL_31:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  return v19;
}

void __43__LiveFSFPItemHelper_calcNumberOfChildren___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__LiveFSFPItemHelper_calcNumberOfChildren___block_invoke_2(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  livefs_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "-[LiveFSFPItemHelper calcNumberOfChildren:]_block_invoke_2";
    v18 = 1024;
    v19 = a2;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_21F8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s: ReadDir got result %d, bytes %zd", (uint8_t *)&v16, 0x1Cu);
  }

  if (a2 != -1001 && a2)
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  }
  else if (a2 == -1001 || !a3)
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    v11 = objc_msgSend(objc_retainAutorelease(v9), "bytes");
    if (a3 >= 1)
    {
      LODWORD(v12) = 0;
      while (1)
      {
        if (*(_BYTE *)(v11 + 21) != 46)
          ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        v13 = *(_QWORD *)(v11 + 8);
        if (v13 == -1)
          break;
        v14 = *(unsigned __int16 *)(v11 + 16);
        v12 = (v12 + v14);
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v13;
        v11 += v14;
        if (v14)
          v15 = v12 < a3;
        else
          v15 = 0;
        if (!v15)
          goto LABEL_20;
      }
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }
LABEL_20:
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a4;
  }

}

- (NSNumber)childItemCount
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper childItemCount].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (NSDate)contentModificationDate
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  LiveFSFPItemHelper *v12;

  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper contentModificationDate].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = 0;
  if (!-[LiveFSFPItemHelper refreshAttrsHasAProblem:](self, "refreshAttrsHasAProblem:", 0))
  {
    if ((self->attributes.fa_validmask & 0x800) != 0)
    {
      v12 = self;
      objc_sync_enter(v12);
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v12->attributes.fa_mtime.tv_sec + (double)v12->attributes.fa_mtime.tv_nsec * 0.000000001);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v12);

    }
    else
    {
      v11 = 0;
    }
  }
  return (NSDate *)v11;
}

- (NSDate)creationDate
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  LiveFSFPItemHelper *v12;

  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPItemHelper creationDate].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = 0;
  if (!-[LiveFSFPItemHelper refreshAttrsHasAProblem:](self, "refreshAttrsHasAProblem:", 0))
  {
    if ((self->attributes.fa_validmask & 0x2000) != 0)
    {
      v12 = self;
      objc_sync_enter(v12);
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v12->attributes.fa_birthtime.tv_sec + (double)v12->attributes.fa_birthtime.tv_nsec * 0.000000001);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v12);

    }
    else
    {
      v11 = 0;
    }
  }
  return (NSDate *)v11;
}

- (id)lastUsedTime
{
  LiveFSFPItemHelper *v3;
  void *v4;
  uint64_t tv_sec;
  uint64_t tv_nsec;
  NSObject *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!-[LiveFSFPItemHelper refreshAttrsHasAProblem:](self, "refreshAttrsHasAProblem:", 0)
    && (self->attributes.fa_validmask & 0x800) != 0)
  {
    v3 = self;
    objc_sync_enter(v3);
    tv_sec = v3->attributes.fa_mtime.tv_sec;
    tv_nsec = v3->attributes.fa_mtime.tv_nsec;
    livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (double)tv_sec + (double)tv_nsec * 0.000000001;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPItemHelper lastUsedTime].cold.2(v8, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v3);
  }
  else
  {
    livefs_std_log();
    v3 = (LiveFSFPItemHelper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPItemHelper lastUsedTime].cold.1();
    v4 = 0;
  }

  return v4;
}

- (BOOL)_fetchXattrValues
{
  BOOL isFetchingXattrValues;
  LiveFSFPItemHelper *v4;
  NSDate *lastXattrValuesFetchDate;
  double v6;
  uint64_t v7;
  NSDate *v8;
  dispatch_group_t v9;
  OS_dispatch_group *xattrFetchGroup;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[3];
  int v20;

  if (-[LiveFSFPExtensionHelper isClusterMaster](self->_extension, "isClusterMaster"))
    return 0;
  v4 = self;
  objc_sync_enter(v4);
  isFetchingXattrValues = v4->_isFetchingXattrValues;
  if (v4->_isFetchingXattrValues)
  {
LABEL_4:
    objc_sync_exit(v4);

    return isFetchingXattrValues;
  }
  lastXattrValuesFetchDate = v4->_lastXattrValuesFetchDate;
  if (lastXattrValuesFetchDate)
  {
    -[NSDate timeIntervalSinceNow](lastXattrValuesFetchDate, "timeIntervalSinceNow");
    if (v6 + 3600.0 > 0.0)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v4->_lastXattrValuesFetchDate;
    v4->_lastXattrValuesFetchDate = (NSDate *)v7;

  }
  -[LiveFSFPItemHelper ensureFileHandleOrError:](v4, "ensureFileHandleOrError:", 0);
  v4->_isFetchingXattrValues = 1;
  if (!v4->_xattrFetchGroup)
  {
    v9 = dispatch_group_create();
    xattrFetchGroup = v4->_xattrFetchGroup;
    v4->_xattrFetchGroup = (OS_dispatch_group *)v9;

  }
  v11 = 3;
  do
  {
    dispatch_group_enter((dispatch_group_t)v4->_xattrFetchGroup);
    --v11;
  }
  while (v11);
  objc_sync_exit(v4);

  -[LiveFSFPExtensionHelper conn](self->_extension, "conn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 3;
  v14 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke;
  v18[3] = &unk_24E46B780;
  v18[4] = v4;
  v18[5] = v19;
  -[LiveFSFPItemHelper _fetchLastUsedDateWithProxy:completionHandler:](v4, "_fetchLastUsedDateWithProxy:completionHandler:", v13, v18);
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke_2;
  v17[3] = &unk_24E46B7A8;
  v17[4] = v4;
  v17[5] = v19;
  -[LiveFSFPItemHelper _fetchTagDataWithProxy:completionHandler:](v4, "_fetchTagDataWithProxy:completionHandler:", v13, v17);
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke_3;
  v16[3] = &unk_24E46B7D0;
  v16[4] = v4;
  v16[5] = v19;
  -[LiveFSFPItemHelper _fetchFavoriteRank:completionHandler:](v4, "_fetchFavoriteRank:completionHandler:", v13, v16);
  _Block_object_dispose(v19, 8);

  return 1;
}

void __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), a2);
  if (!--*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 216);
    *(_QWORD *)(v9 + 216) = v8;

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 232));
  objc_sync_exit(v7);

}

void __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), a2);
  if (!--*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 216);
    *(_QWORD *)(v9 + 216) = v8;

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 232));
  objc_sync_exit(v7);

}

void __39__LiveFSFPItemHelper__fetchXattrValues__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 256), a2);
  if (!--*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 216);
    *(_QWORD *)(v9 + 216) = v8;

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 232));
  objc_sync_exit(v7);

}

- (void)_fetchXattrNamed:(id)a3 proxy:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSString *fh;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  LiveFSFPItemHelper *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  LiveFSFPItemHelper *v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke;
  v21[3] = &unk_24E46B7F8;
  v11 = v8;
  v22 = v11;
  v23 = self;
  v12 = v9;
  v24 = v12;
  objc_msgSend(a4, "remoteObjectProxyWithErrorHandler:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fh = self->_fh;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_40;
  v17[3] = &unk_24E46B820;
  v18 = v11;
  v19 = self;
  v20 = v12;
  v15 = v12;
  v16 = v11;
  objc_msgSend(v13, "xattrOf:named:requestID:reply:", fh, v16, -1, v17);

}

void __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  if ((_DWORD)a2 != 93 && (_DWORD)a2)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    livefs_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_40_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_fetchLastUsedDateWithProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[LiveFSFPItemHelper isDocument](self, "isDocument"))
  {
    v8 = *MEMORY[0x24BDC8118];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__LiveFSFPItemHelper__fetchLastUsedDateWithProxy_completionHandler___block_invoke;
    v9[3] = &unk_24E46B848;
    v10 = v7;
    -[LiveFSFPItemHelper _fetchXattrNamed:proxy:completionHandler:](self, "_fetchXattrNamed:proxy:completionHandler:", v8, v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __68__LiveFSFPItemHelper__fetchLastUsedDateWithProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "fp_lastUsedDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)_fetchTagDataWithProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = *MEMORY[0x24BDC8170];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__LiveFSFPItemHelper__fetchTagDataWithProxy_completionHandler___block_invoke;
  v9[3] = &unk_24E46B848;
  v10 = v6;
  v8 = v6;
  -[LiveFSFPItemHelper _fetchXattrNamed:proxy:completionHandler:](self, "_fetchXattrNamed:proxy:completionHandler:", v7, a3, v9);

}

uint64_t __63__LiveFSFPItemHelper__fetchTagDataWithProxy_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchFavoriteRank:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[LiveFSFPItemHelper isDirectory](self, "isDirectory")
    && !-[LiveFSFPExtensionHelper isClusterMaster](self->_extension, "isClusterMaster"))
  {
    v8 = *MEMORY[0x24BDC8070];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__LiveFSFPItemHelper__fetchFavoriteRank_completionHandler___block_invoke;
    v9[3] = &unk_24E46B848;
    v10 = v7;
    -[LiveFSFPItemHelper _fetchXattrNamed:proxy:completionHandler:](self, "_fetchXattrNamed:proxy:completionHandler:", v8, v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __59__LiveFSFPItemHelper__fetchFavoriteRank_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "fp_favoriteRank");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (NSDate)lastUsedDate
{
  LiveFSFPItemHelper *v3;
  NSDate *v4;

  if (-[LiveFSFPItemHelper _fetchXattrValues](self, "_fetchXattrValues"))
    dispatch_group_wait((dispatch_group_t)self->_xattrFetchGroup, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self;
  objc_sync_enter(v3);
  v4 = v3->_lastUsedDate;
  objc_sync_exit(v3);

  return v4;
}

- (NSData)tagData
{
  LiveFSFPItemHelper *v3;
  NSData *v4;

  if (-[LiveFSFPItemHelper _fetchXattrValues](self, "_fetchXattrValues"))
    dispatch_group_wait((dispatch_group_t)self->_xattrFetchGroup, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self;
  objc_sync_enter(v3);
  v4 = v3->_tagData;
  objc_sync_exit(v3);

  return v4;
}

- (NSNumber)favoriteRank
{
  LiveFSFPItemHelper *v3;
  NSNumber *v4;

  if (-[LiveFSFPItemHelper _fetchXattrValues](self, "_fetchXattrValues"))
    dispatch_group_wait((dispatch_group_t)self->_xattrFetchGroup, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self;
  objc_sync_enter(v3);
  v4 = v3->_favoriteRank;
  objc_sync_exit(v3);

  return v4;
}

- (NSData)versionIdentifier
{
  LiveFSFPItemHelper *v3;
  void *v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;

  if (!-[LiveFSFPItemHelper refreshAttrsHasAProblem:](self, "refreshAttrsHasAProblem:", 0)
    && (self->attributes.fa_validmask & 0x800) != 0)
  {
    v3 = self;
    objc_sync_enter(v3);
    v14 = (double)v3->attributes.fa_mtime.tv_sec + (double)v3->attributes.fa_mtime.tv_nsec * 0.000000001;
    livefs_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPItemHelper lastUsedTime].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v14, 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v3);
  }
  else
  {
    livefs_std_log();
    v3 = (LiveFSFPItemHelper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPItemHelper lastUsedTime].cold.1();
    v4 = 0;
  }

  return (NSData *)v4;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)attr_load
{
  return self->_attr_load;
}

- (void)setAttr_load:(int64_t)a3
{
  self->_attr_load = a3;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)fh
{
  return self->_fh;
}

- (LiveFSFPExtensionHelper)extension
{
  return (LiveFSFPExtensionHelper *)objc_getProperty(self, a2, 312, 1);
}

- (void)setExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (LiveFSFPItemHelper)parent
{
  return (LiveFSFPItemHelper *)objc_getProperty(self, a2, 320, 1);
}

- (void)setParent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (LiveFSFPEnumeratorDataContainer)container
{
  return (LiveFSFPEnumeratorDataContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (int)liType
{
  return self->_liType;
}

- (void)setLiType:(int)a3
{
  self->_liType = a3;
}

- (NSMapTable)itemNameCache
{
  return (NSMapTable *)objc_getProperty(self, a2, 336, 1);
}

- (void)setItemNameCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (unint64_t)inodeNum
{
  return self->_inodeNum;
}

- (void)setInodeNum:(unint64_t)a3
{
  self->_inodeNum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemNameCache, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_fh, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_favoriteRank, 0);
  objc_storeStrong((id *)&self->_tagData, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_xattrFetchGroup, 0);
  objc_storeStrong((id *)&self->_pendingRenameCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_lastXattrValuesFetchDate, 0);
  objc_storeStrong((id *)&self->_fullPath, 0);
}

- (void)fullPath
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13_0();
  _os_log_error_impl(&dword_21F8A5000, v0, OS_LOG_TYPE_ERROR, "Error fixing _fullPath. ID %@ Path %@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)initItemForFH:(os_log_t)log withReference:name:parent:type:attrs:extension:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[LiveFSFPItemHelper initItemForFH:withReference:name:parent:type:attrs:extension:]";
  _os_log_error_impl(&dword_21F8A5000, log, OS_LOG_TYPE_ERROR, "%s: type == -1 invalid without attributes", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)initItemForFH:withReference:name:parent:type:attrs:extension:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_18(&dword_21F8A5000, v0, v1, "Given persistent inode attributes w/o a valid inode number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

- (void)initItemForFH:(uint64_t)a3 withReference:(uint64_t)a4 name:(uint64_t)a5 parent:(uint64_t)a6 type:(uint64_t)a7 attrs:(uint64_t)a8 extension:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, a1, a3, "%s starting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __46__LiveFSFPItemHelper_ensureFileHandleOrError___block_invoke_2_15_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_21F8A5000, log, OS_LOG_TYPE_FAULT, "Got success from LILookup but some out parameters are null: %@, %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)refreshAttrsHasAProblem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;

  *(_QWORD *)((char *)&v2 + 4) = "-[LiveFSFPItemHelper refreshAttrsHasAProblem:]";
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@", (_QWORD)v2, DWORD2(v2));
  OUTLINED_FUNCTION_7_0();
}

- (void)refreshAttrsHasAProblem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10(&dword_21F8A5000, v0, v1, "%s starting in ID %@ fh %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)isHidden
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_0(&dword_21F8A5000, a2, v4, "%s: attribute problem for '%@' (validmask=0x%llx)", (uint8_t *)v5);

  OUTLINED_FUNCTION_9();
}

- (void)parentItemIdentifier
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 280);
  v5 = *(void **)(a1 + 320);
  objc_msgSend(v5, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 320), "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136316162;
  v9 = "-[LiveFSFPItemHelper parentItemIdentifier]";
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v5;
  v14 = 2112;
  v15 = v6;
  v16 = 2112;
  v17 = v7;
  _os_log_debug_impl(&dword_21F8A5000, a2, OS_LOG_TYPE_DEBUG, "%s: Item %@ parent %@ parent ID %@ parent name %@", (uint8_t *)&v8, 0x34u);

}

- (void)capabilities
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_0(&dword_21F8A5000, a2, v4, "%s: attribute problem for '%@' (validmask=0x%llx)", (uint8_t *)v5);

  OUTLINED_FUNCTION_9();
}

- (void)br_pathExtension
{
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, a1, a3, "%s starting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)typeIdentifier
{
  int v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 264);
  v4 = *(_QWORD *)(a1 + 272);
  v5 = 136315650;
  v6 = "-[LiveFSFPItemHelper typeIdentifier]";
  v7 = 1024;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  OUTLINED_FUNCTION_16_0(&dword_21F8A5000, a2, a3, "%s starting, type %d name %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_7_0();
}

- (void)calcNumberOfChildren:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;

  *(_QWORD *)((char *)&v2 + 4) = "-[LiveFSFPItemHelper calcNumberOfChildren:]";
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "%s: %s error: %@", (_QWORD)v2, DWORD2(v2));
  OUTLINED_FUNCTION_7_0();
}

- (void)calcNumberOfChildren:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 272);
  v4 = *(_DWORD *)(*(_QWORD *)a2 + 24);
  v5 = 136315650;
  v6 = "-[LiveFSFPItemHelper calcNumberOfChildren:]";
  v7 = 2112;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  OUTLINED_FUNCTION_16_0(&dword_21F8A5000, a3, (uint64_t)a3, "%s: Item %@ caclulated %d total entries", (uint8_t *)&v5);
  OUTLINED_FUNCTION_7_0();
}

- (void)childItemCount
{
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, a1, a3, "%s starting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)contentModificationDate
{
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, a1, a3, "%s starting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)creationDate
{
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, a1, a3, "%s starting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)lastUsedTime
{
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, a1, a3, "lastUsedTime: returning %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_0(&dword_21F8A5000, v0, v1, "error fetching xattr %@ for item %@: %@");
  OUTLINED_FUNCTION_7_0();
}

void __63__LiveFSFPItemHelper__fetchXattrNamed_proxy_completionHandler___block_invoke_40_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13_0();
  _os_log_debug_impl(&dword_21F8A5000, v0, OS_LOG_TYPE_DEBUG, "fetched xattr %@ for item %@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
