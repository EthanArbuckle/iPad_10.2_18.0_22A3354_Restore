@implementation FPDHybridIterator

- (FPDHybridIterator)initWithItem:(id)a3 domain:(id)a4 enforceFPItem:(BOOL)a5
{
  id v9;
  id v10;
  FPDHybridIterator *v11;
  FPDHybridIterator *v12;
  id *p_domain;
  id *p_rootItem;
  uint64_t v15;
  NSURL *rootURL;
  FPDDiskIterator *v17;
  void *v18;
  uint64_t v19;
  FPDDiskIterator *diskIterator;
  void *v21;
  void *v22;
  uint64_t v23;
  FPDIterator *datalessFolderIterator;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)FPDHybridIterator;
  v11 = -[FPDHybridIterator init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    p_domain = (id *)&v11->_domain;
    objc_storeStrong((id *)&v11->_domain, a4);
    p_rootItem = (id *)&v12->_rootItem;
    objc_storeStrong((id *)&v12->_rootItem, a3);
    -[FPItem fileURL](v12->_rootItem, "fileURL");
    v15 = objc_claimAutoreleasedReturnValue();
    rootURL = v12->_rootURL;
    v12->_rootURL = (NSURL *)v15;

    v12->_insideADatalessFolder = 0;
    v12->_enforceFPItem = a5;
    if ((-[FPItem isPackage](v12->_rootItem, "isPackage") & 1) != 0
      || objc_msgSend(*p_rootItem, "isFolder")
      && (!objc_msgSend(*p_rootItem, "isDownloaded")
       || (objc_msgSend(*p_domain, "supportsPickingFolders") & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:", *p_rootItem);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_domain, "provider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDIterator iteratorForLocator:provider:](FPDIterator, "iteratorForLocator:provider:", v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      datalessFolderIterator = v12->_datalessFolderIterator;
      v12->_datalessFolderIterator = (FPDIterator *)v23;

      -[FPDIterator setShouldDecorateItems:](v12->_datalessFolderIterator, "setShouldDecorateItems:", 1);
      v12->_insideADatalessFolder = 1;
    }
    else
    {
      v17 = [FPDDiskIterator alloc];
      objc_msgSend(*p_rootItem, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[FPDDiskIterator initWithURL:isDirectory:](v17, "initWithURL:isDirectory:", v18, 1);
      diskIterator = v12->_diskIterator;
      v12->_diskIterator = (FPDDiskIterator *)v19;

    }
  }

  return v12;
}

- (id)nextWithError:(id *)a3
{
  void *v5;
  id v6;
  FPDDiskIterator *diskIterator;
  void *v8;
  id v9;
  id v10;
  FPDIterator *datalessFolderIterator;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  FPDDiskIterator *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int is_dataless_fault_at;
  NSObject *v22;
  unint64_t v23;
  FPDIterator *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, void *, void *);
  void *v44;
  FPDHybridIterator *v45;
  NSObject *v46;
  uint64_t *v47;
  char v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  v56 = 0;
  if (!self->_insideADatalessFolder)
    goto LABEL_5;
  -[FPDIterator error](self->_datalessFolderIterator, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    datalessFolderIterator = self->_datalessFolderIterator;
    v50 = 0;
    -[FPDIterator nextWithError:](datalessFolderIterator, "nextWithError:", &v50);
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = v50;
    v13 = (void *)v52[5];
    v52[5] = v12;

    if (v52[5])
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[FPDHybridIterator nextWithError:].cold.6();

LABEL_15:
      v10 = (id)v52[5];
      goto LABEL_56;
    }
    if (v9 || !-[FPDIterator done](self->_datalessFolderIterator, "done"))
    {
      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v9, "fp_prettyDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPDHybridIterator nextWithError:].cold.5(v26, buf, v25);
      }

      if (!a3)
        goto LABEL_17;
      v6 = objc_retainAutorelease(v9);
      goto LABEL_35;
    }
    self->_insideADatalessFolder = 0;
    v23 = self->_totalDatalessFoldersPopped
        + -[FPDIterator numFoldersPopped](self->_datalessFolderIterator, "numFoldersPopped");
    self->_totalDatalessFoldersPopped = v23;
    if (self->_diskIterator)
      self->_totalDatalessFoldersPopped = v23 - 1;
    v24 = self->_datalessFolderIterator;
    self->_datalessFolderIterator = 0;

LABEL_5:
    diskIterator = self->_diskIterator;
    if (diskIterator)
    {
      -[FPDDiskIterator error](diskIterator, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (a3)
        {
          -[FPDDiskIterator error](self->_diskIterator, "error");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
        goto LABEL_16;
      }
      v15 = self->_diskIterator;
      v49 = 0;
      -[FPDDiskIterator nextWithError:](v15, "nextWithError:", &v49);
      v16 = objc_claimAutoreleasedReturnValue();
      v9 = v49;
      v17 = (void *)v52[5];
      v52[5] = v16;

      v18 = (void *)v52[5];
      if (v18)
      {
        v48 = 0;
        objc_msgSend(v18, "asURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "path");
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v20, "fileSystemRepresentation");
        is_dataless_fault_at = fpfs_is_dataless_fault_at();

        if (is_dataless_fault_at < 0)
        {
          fp_current_or_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)v52[5], "asURL");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v58 = v39;
            v59 = 2112;
            v60 = v40;
            _os_log_error_impl(&dword_1CF55F000, v27, OS_LOG_TYPE_ERROR, "[ERROR] FPDHybridIterator: encountered error during fpfs_is_dataless_fault_at for url: %@, %@", buf, 0x16u);

          }
          v48 = 1;
        }
        else if (!self->_enforceFPItem)
        {
          fp_current_or_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[FPDHybridIterator nextWithError:].cold.4();

          goto LABEL_15;
        }
        fp_current_or_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[FPDHybridIterator nextWithError:].cold.3();

        v29 = dispatch_group_create();
        dispatch_group_enter(v29);
        -[FPDDomain defaultBackend](self->_domain, "defaultBackend");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v52[5], "asURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = MEMORY[0x1E0C809B0];
        v42 = 3221225472;
        v43 = __35__FPDHybridIterator_nextWithError___block_invoke;
        v44 = &unk_1E8C75468;
        v47 = &v51;
        v45 = self;
        v33 = v29;
        v46 = v33;
        objc_msgSend(v30, "itemForURL:request:completionHandler:", v31, v32, &v41);

        dispatch_group_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
        if (self->_insideADatalessFolder)
        {
          fp_current_or_default_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            -[FPDHybridIterator nextWithError:].cold.2(v34);

          -[FPDDiskIterator skipDescendants](self->_diskIterator, "skipDescendants", v41, v42, v43, v44, v45);
          -[FPDIterator error](self->_datalessFolderIterator, "error");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            if (a3)
            {
              -[FPDIterator error](self->_datalessFolderIterator, "error");
              v10 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v10 = 0;
            }
            goto LABEL_55;
          }
          -[FPDIterator nextWithError:](self->_datalessFolderIterator, "nextWithError:", a3);
          v37 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          fp_current_or_default_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            -[FPDHybridIterator nextWithError:].cold.1();

          v37 = (id)v52[5];
        }
        v10 = v37;
LABEL_55:

        goto LABEL_56;
      }
      if (!-[FPDDiskIterator done](self->_diskIterator, "done"))
      {
        if (!a3)
          goto LABEL_17;
        v6 = objc_retainAutorelease(v9);
LABEL_35:
        v9 = v6;
        goto LABEL_10;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = 0;
    self->_done = 1;
    goto LABEL_56;
  }
  if (!a3)
  {
LABEL_16:
    v9 = 0;
LABEL_17:
    v10 = 0;
    goto LABEL_56;
  }
  -[FPDIterator error](self->_datalessFolderIterator, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v9 = 0;
LABEL_10:
  v10 = 0;
  *a3 = v6;
LABEL_56:
  _Block_object_dispose(&v51, 8);

  return v10;
}

void __35__FPDHybridIterator_nextWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if ((objc_msgSend(v5, "isDownloaded") & 1) == 0
      && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isFolder"))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "provider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDIterator iteratorForLocator:provider:](FPDIterator, "iteratorForLocator:provider:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 72);
      *(_QWORD *)(v13 + 72) = v12;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setShouldDecorateItems:", 1);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
    }
  }
  else
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __35__FPDHybridIterator_nextWithError___block_invoke_cold_1(a1, v6, v15);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)error
{
  FPDDiskIterator *datalessFolderIterator;

  if (!self->_diskIterator)
  {
    if (!self->_insideADatalessFolder)
      return 0;
    goto LABEL_5;
  }
  if (self->_insideADatalessFolder)
  {
LABEL_5:
    datalessFolderIterator = (FPDDiskIterator *)self->_datalessFolderIterator;
    goto LABEL_6;
  }
  datalessFolderIterator = self->_diskIterator;
LABEL_6:
  -[FPDDiskIterator error](datalessFolderIterator, "error");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)done
{
  return self->_done;
}

- (unint64_t)numFoldersPopped
{
  FPDDiskIterator *diskIterator;
  uint64_t v4;
  FPDIterator *datalessFolderIterator;

  diskIterator = self->_diskIterator;
  if (diskIterator)
    v4 = -[FPDDiskIterator numFoldersPopped](diskIterator, "numFoldersPopped");
  else
    v4 = 0;
  datalessFolderIterator = self->_datalessFolderIterator;
  if (datalessFolderIterator)
    v4 += -[FPDIterator numFoldersPopped](datalessFolderIterator, "numFoldersPopped");
  return self->_totalDatalessFoldersPopped + v4;
}

- (void)dealloc
{
  FPDDiskIterator *diskIterator;
  FPDIterator *datalessFolderIterator;
  objc_super v5;

  diskIterator = self->_diskIterator;
  self->_diskIterator = 0;

  datalessFolderIterator = self->_datalessFolderIterator;
  self->_datalessFolderIterator = 0;

  v5.receiver = self;
  v5.super_class = (Class)FPDHybridIterator;
  -[FPDHybridIterator dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskIterator, 0);
  objc_storeStrong((id *)&self->_datalessFolderIterator, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_rootItem, 0);
}

- (void)nextWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] FPDHybridIterator: fetched FPItem %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)nextWithError:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDHybridIterator: stepping in dataless folder iterator", v1, 2u);
}

- (void)nextWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] FPDHybridIterator: fetching item enumerator for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)nextWithError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] FPDHybridIterator: enumerated item from disk: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)nextWithError:(os_log_t)log .cold.5(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDHybridIterator: error while enuemrating the provider %@", buf, 0xCu);

}

- (void)nextWithError:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] FPDHybridIterator: enumerating provider item %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __35__FPDHybridIterator_nextWithError___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "asURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDHybridIterator: failed to fetchItemForURL:%@ - %@", (uint8_t *)&v7, 0x16u);

}

@end
