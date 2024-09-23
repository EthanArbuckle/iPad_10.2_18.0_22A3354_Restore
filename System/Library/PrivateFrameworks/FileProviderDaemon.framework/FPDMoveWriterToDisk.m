@implementation FPDMoveWriterToDisk

- (FPDMoveWriterToDisk)initWithWriter:(id)a3
{
  id v4;
  FPDMoveWriterToDisk *v5;
  FPDMoveWriterToDisk *v6;
  uint64_t v7;
  NSFileManager *fileManager;
  void *v9;
  void *v10;
  uint64_t v11;
  FPActionLocatorAccess *stopAccessingToken;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FPDMoveWriterToDisk;
  v5 = -[FPDMoveWriterToDisk init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_writer, v4);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = objc_claimAutoreleasedReturnValue();
    fileManager = v6->_fileManager;
    v6->_fileManager = (NSFileManager *)v7;

    objc_msgSend(v4, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetFolder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startAccessingLocator");
    v11 = objc_claimAutoreleasedReturnValue();
    stopAccessingToken = v6->_stopAccessingToken;
    v6->_stopAccessingToken = (FPActionLocatorAccess *)v11;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[FPActionLocatorAccess stopAccessing](self->_stopAccessingToken, "stopAccessing");
  v3.receiver = self;
  v3.super_class = (Class)FPDMoveWriterToDisk;
  -[FPDMoveWriterToDisk dealloc](&v3, sel_dealloc);
}

- (void)_respectLastUsageDatePolicyForDestinationURL:(id)a3 withSource:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lastUsedDatePolicy");

  if (v10 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v10 != 1)
    goto LABEL_9;
  FPFileMetadataCopyLastUsedDateAtURL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (!v12)
  {
LABEL_8:
    FPSetLastUsedDateAtURL();

    goto LABEL_9;
  }
  v13 = v12;
  fp_current_or_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[FPDMoveWriterToDisk _respectLastUsageDatePolicyForDestinationURL:withSource:].cold.1();

LABEL_9:
}

- (void)_touchModificationDateForURL:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "fileSystemRepresentation");
  v4 = v3;
  if ((fpfs_open() & 0x80000000) != 0)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FPDMoveWriterToDisk _touchModificationDateForURL:].cold.1(v4);

  }
}

uint64_t __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  NSObject *v4;
  NSObject *v5;
  timeval v6;

  v6.tv_sec = 0;
  *(_QWORD *)&v6.tv_usec = 0;
  if (gettimeofday(&v6, 0) < 0)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_cold_1(v5);

  }
  else
  {
    v2 = fpfs_fset_metadata();
    result = 0;
    if ((v2 & 0x80000000) == 0)
      return result;
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_cold_2(a1);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_4()
{
  return 0;
}

- (void)_performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 bounceNumber:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  id WeakRetained;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  unint64_t v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  v28 = a6 == 2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "coordinator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(v19, "operation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke;
  v31[3] = &unk_1E8C766A0;
  v31[4] = self;
  v32 = v15;
  v33 = v16;
  v34 = v17;
  v35 = v14;
  v36 = v18;
  v37 = a6;
  v38 = a7;
  v22 = v14;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v18;
  objc_msgSend(v27, "resolveItemOrURL:recursively:request:andCoordinateWithHandler:", v22, v28, v21, v31);

}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;

  v7 = a2;
  v8 = a4;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "coordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v12, "operation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2;
    v17[3] = &unk_1E8C76678;
    v24 = v8;
    v25 = *(id *)(a1 + 72);
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    v15 = v7;
    v16 = *(_QWORD *)(a1 + 32);
    v20 = v15;
    v21 = v16;
    v22 = *(id *)(a1 + 64);
    v23 = *(id *)(a1 + 40);
    v26 = *(_OWORD *)(a1 + 80);
    objc_msgSend(v10, "resolveItemOrURL:recursively:coordinateIfExport:request:handler:", v11, 0, 0, v14, v17);

  }
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  int8x16_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  int8x16_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
  else
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_3;
    v40[3] = &unk_1E8C76548;
    v41 = *(id *)(a1 + 80);
    v10 = v9;
    v42 = v10;
    v43 = *(id *)(a1 + 88);
    v11 = (void *)MEMORY[0x1D17D1C84](v40);
    v12 = *(id *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v13, "longValue"), objc_msgSend(*(id *)(a1 + 48), "fp_isFolder"));
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v14;
    }
    v26 = v12;
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v12, objc_msgSend(*(id *)(a1 + 48), "fp_isFolder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 8));
    objc_msgSend(WeakRetained, "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(*(id *)(a1 + 64), "size");
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_4;
    v27[3] = &unk_1E8C76650;
    v28 = *(id *)(a1 + 72);
    v24 = *(int8x16_t *)(a1 + 48);
    v19 = (id)v24.i64[0];
    v29 = vextq_s8(v24, v24, 8uLL);
    v30 = v7;
    v31 = *(id *)(a1 + 40);
    v35 = *(id *)(a1 + 80);
    v36 = v10;
    v32 = *(id *)(a1 + 64);
    v33 = *(id *)(a1 + 32);
    v39 = *(_OWORD *)(a1 + 96);
    v37 = *(id *)(a1 + 88);
    v38 = v11;
    v34 = v15;
    v20 = v11;
    v21 = v15;
    objc_msgSend(v25, "fp_copyToURL:queue:precomputedItemSize:replacePlaceholder:completion:", v21, v17, v18, 0, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 8));
    objc_msgSend(v23, "setProgress:forRoot:", v22, *(_QWORD *)(a1 + 64));

  }
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = a1[4];
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[6] + 16))();

}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  int v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  _QWORD block[4];
  id v48;
  id v49;
  _QWORD *v50;
  _BYTE *v51;
  _QWORD v52[5];
  id v53;
  NSObject *v54;
  _BYTE *v55;
  _QWORD *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _BYTE buf[24];
  _BYTE v64[30];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isProviderItem"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "operation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "asFPItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "domainFromItemID:reason:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
LABEL_3:
      objc_msgSend(*(id *)(a1 + 40), "_respectLastUsageDatePolicyForDestinationURL:withSource:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 40), "_touchModificationDateForURL:", *(_QWORD *)(a1 + 56));
      v12 = dispatch_group_create();
      v13 = v12;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)v64 = __Block_byref_object_copy__3;
      *(_QWORD *)&v64[8] = __Block_byref_object_dispose__3;
      *(_QWORD *)&v64[16] = 0;
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x3032000000;
      v57[3] = __Block_byref_object_copy__3;
      v57[4] = __Block_byref_object_dispose__3;
      v58 = 0;
      if (v11)
      {
        dispatch_group_enter(v12);
        objc_msgSend(v11, "defaultBackend");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 88);
        +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_12;
        v52[3] = &unk_1E8C765C0;
        v52[4] = *(_QWORD *)(a1 + 40);
        v53 = *(id *)(a1 + 88);
        v54 = v13;
        v55 = buf;
        v56 = v57;
        objc_msgSend(v14, "itemForURL:request:completionHandler:", v15, v16, v52);

      }
      v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v17, "queue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_15;
      block[3] = &unk_1E8C765E8;
      v50 = v57;
      v51 = buf;
      v49 = *(id *)(a1 + 120);
      v48 = *(id *)(a1 + 88);
      dispatch_group_notify(v13, v18, block);

      objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 88)), "fileSystemRepresentation");
      fpfs_open();

      _Block_object_dispose(v57, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_27;
    }
  }
  else
  {
    v11 = 0;
    if (!v5)
      goto LABEL_3;
  }
  if (objc_msgSend(v5, "fp_isPOSIXErrorCode:", 17) && !a2
    || objc_msgSend(v5, "fp_isPOSIXErrorCode:", 66))
  {
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v44 = *(_QWORD *)(a1 + 48);
      v45 = *(_QWORD *)(a1 + 56);
      v46 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v46, "info");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "shouldBounce");
      v38 = objc_msgSend(*(id *)(a1 + 32), "isProviderItem");
      v39 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v5, "fp_prettyDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v64 = v37;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v38;
      *(_WORD *)&v64[10] = 2114;
      *(_QWORD *)&v64[12] = v39;
      *(_WORD *)&v64[20] = 2112;
      *(_QWORD *)&v64[22] = v40;
      _os_log_error_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_ERROR, "[ERROR] move-writer: collision when copying item at %@ to %@ (shouldBounce: %{BOOL}d, moveToProvider: %{BOOL}d, bounceNumber: %{public}@): %@", buf, 0x36u);

    }
    v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v20, "info");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "shouldBounce");

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0CB37E8];
      v24 = objc_msgSend(*(id *)(a1 + 64), "longValue");
      if (v24 <= 1)
        v25 = 1;
      else
        v25 = v24;
      objc_msgSend(v23, "numberWithLong:", v25 + 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
      (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
      objc_msgSend(*(id *)(a1 + 40), "_performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:bounceNumber:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), v26, *(_QWORD *)(a1 + 112));

    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isProviderItem"))
    {
      objc_msgSend(v11, "defaultBackend");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(a1 + 88);
      +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_9;
      v60[3] = &unk_1E8C76570;
      v62 = *(id *)(a1 + 120);
      v61 = v5;
      objc_msgSend(v27, "itemForURL:request:completionHandler:", v28, v29, v60);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1 + 88);
    v59 = 0;
    v32 = objc_msgSend(v30, "removeItemAtURL:error:", v31, &v59);
    v33 = v59;

    if ((v32 & 1) == 0)
    {
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_4_cold_1((id *)(a1 + 88));

    }
    fp_current_or_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 88), "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fp_prettyDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)v64 = v43;
      _os_log_error_impl(&dword_1CF55F000, v35, OS_LOG_TYPE_ERROR, "[ERROR] couldn't copy item at %@ to %@: %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
  }
LABEL_27:

}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForCollisionWithItem:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    if (!a3)
      a3 = *(_QWORD *)(a1 + 32);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 40), 0, a3);
  }
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13;
  v11[3] = &unk_1E8C76598;
  v12 = v6;
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v16 = *(_OWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_2();

  }
  v3 = *(_QWORD *)(a1 + 48);
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] move-writer: couldn't have item for URL %@", (uint8_t *)&v8, 0xCu);

  }
  v7 = *(id *)(a1 + 56);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
  objc_sync_exit(v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_15(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_15_cold_1();

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v3 = a1[5];
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:");
    else
      objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForURL:", a1[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

uint64_t __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_17()
{
  return fpfs_make_fsevent();
}

- (void)performCopyOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id WeakRetained;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  id v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "info");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldBounce");

  if (v20)
  {
    v23 = 0;
    objc_msgSend(v16, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v23, 0, objc_msgSend(v14, "isFolder"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v23;

    v16 = (id)v21;
  }
  else
  {
    v22 = 0;
  }
  -[FPDMoveWriterToDisk _performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:bounceNumber:completion:](self, "_performCopyOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:bounceNumber:completion:", v14, v15, v16, a6, a7, v22, v17);

}

- (void)_resolveLocator:(id)a3 completion:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "isExternalURL");
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "asURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startAccessingURLForAtomDuration:", v10);

    objc_msgSend(v7, "asURL");
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();

    v6[2](v6, WeakRetained, 0);
  }
  else
  {
    objc_msgSend(v7, "asFPItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "resolveItem:completion:", v11, v6);
    v6 = (void (**)(id, id, _QWORD))v9;
  }

}

- (void)_performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 bounceNumber:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id WeakRetained;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  unint64_t v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  v21 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "setProgress:forRoot:", v21, v15);

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke;
  v27[3] = &unk_1E8C76740;
  v27[4] = self;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = v15;
  v32 = v19;
  v33 = a6;
  v34 = a7;
  v22 = v15;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v19;
  -[FPDMoveWriterToDisk _resolveLocator:completion:](self, "_resolveLocator:completion:", v22, v27);

}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_cold_1(v5);

    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_22;
    v12[3] = &unk_1E8C76718;
    v19 = *(id *)(a1 + 72);
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = *(id *)(a1 + 64);
    v20 = *(_OWORD *)(a1 + 80);
    objc_msgSend(v7, "_resolveLocator:completion:", v8, v12);

  }
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  void (**v50)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v51)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void (**v62)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  id v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_22_cold_1();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = v8;
    v11 = objc_msgSend(*(id *)(a1 + 48), "fp_isFolder");
    if (v9)
    {
      objc_msgSend(v10, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v9, "longValue"), v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v9, "unsignedLongValue");
      if (v13 >= objc_msgSend(MEMORY[0x1E0CB3940], "fp_maximumBounceLevel"))
      {
        v12 = v12;

        v53 = 0;
        v10 = v12;
      }
      else
      {
        v53 = v9;
      }
    }
    else
    {
      v53 = 0;
      v12 = v10;
    }
    objc_msgSend(v5, "URLByAppendingPathComponent:", v12);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 8));
    objc_msgSend(WeakRetained, "coordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startAccessingURLForAtomDuration:", v5);

    v16 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_24;
    v64[3] = &unk_1E8C766C8;
    v17 = *(void **)(a1 + 64);
    v64[4] = *(_QWORD *)(a1 + 56);
    v65 = v17;
    v66 = *(id *)(a1 + 72);
    v52 = v10;
    v67 = v52;
    v69 = *(_OWORD *)(a1 + 88);
    v68 = *(id *)(a1 + 80);
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17D1C84](v64);
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v54 = v12;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 48), "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "path");
      v50 = v18;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
      v37 = v16;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 96));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v71 = v35;
      v72 = 2112;
      v73 = v36;
      v74 = 2112;
      v75 = v38;
      v76 = 2112;
      v77 = v39;
      _os_log_debug_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: checking target existence before coordination to move on disk %@ to %@.                        sourceMaterializeOption %@ targetMaterializeOption %@", buf, 0x2Au);

      v12 = v54;
      v16 = v37;

      v18 = v50;
    }

    v63 = 0;
    objc_msgSend(v5, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v12, v11, 0, &v63, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v63;
    v22 = v21;
    if (v20)
    {
      if (v21)
        v23 = v21;
      else
        v23 = &unk_1E8C95E08;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v23, "longValue") + 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 516, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *, void *, void *))v18)[2](v18, v24, v20, v22, v25);
      v26 = v53;
      v27 = v55;
    }
    else
    {
      v28 = v16;
      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 48), "path");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "path");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
        v51 = v18;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 96));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v71 = v40;
        v72 = 2112;
        v73 = v41;
        v74 = 2112;
        v75 = v42;
        v76 = 2112;
        v77 = v43;
        _os_log_debug_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: starting coordination to move on disk %@ to %@.                        sourceMaterializeOption %@ targetMaterializeOption %@", buf, 0x2Au);

        v18 = v51;
      }

      v49 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 8));
      objc_msgSend(v49, "coordinator");
      v30 = objc_claimAutoreleasedReturnValue();
      v47 = *(_QWORD *)(a1 + 96);
      v45 = (void *)v30;
      v46 = *(_QWORD *)(a1 + 88);
      v44 = *(_QWORD *)(a1 + 48);
      v48 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 8));
      objc_msgSend(v48, "operation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "request");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v28;
      v56[1] = 3221225472;
      v56[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_28;
      v56[3] = &unk_1E8C766F0;
      v33 = *(id *)(a1 + 80);
      v34 = *(_QWORD *)(a1 + 56);
      v61 = v33;
      v56[4] = v34;
      v62 = v18;
      v26 = v53;
      v57 = v53;
      v27 = v55;
      v58 = v55;
      v59 = *(id *)(a1 + 48);
      v60 = *(id *)(a1 + 64);
      objc_msgSend(v45, "coordinateForMovingFromURL:toURL:toTargetFolderURL:targetMaterializeOption:sourceMaterializeOption:request:handler:", v44, v58, v5, v47, v46, v32, v56);

      v25 = v61;
      v20 = 0;
    }

  }
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  id WeakRetained;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "info");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "shouldBounce");
    v26 = objc_msgSend(*(id *)(a1 + 40), "isProviderItem");
    objc_msgSend(v12, "fp_prettyDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    v37 = 1024;
    v38 = v25;
    v39 = 2112;
    v40 = v11;
    v41 = 1024;
    v42 = v26;
    v43 = 2112;
    v44 = v27;
    _os_log_error_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_ERROR, "[ERROR] move-writer: collision when moving item at %@ to %@ (shouldBounce: %{BOOL}d, nextBounceNumber: %@, moveToProvider: %{BOOL}d): %@", buf, 0x36u);

  }
  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v14, "info");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldBounce");

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:bounceNumber:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v11, *(_QWORD *)(a1 + 64));
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isProviderItem"))
  {
    objc_msgSend(*(id *)(a1 + 40), "asFPItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v17, "operation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "manager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "itemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "domainFromItemID:reason:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "defaultBackend");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_25;
    v30[3] = &unk_1E8C76570;
    v32 = *(id *)(a1 + 64);
    v31 = v12;
    objc_msgSend(v22, "itemForURL:request:completionHandler:", v10, v23, v30);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForCollisionWithItem:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    if (!a3)
      a3 = *(_QWORD *)(a1 + 32);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 40), 0, a3);
  }
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id WeakRetained;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void *v45;
  NSObject *group;
  dispatch_group_t groupa;
  _QWORD block[4];
  id v49;
  id v50;
  _QWORD *v51;
  _BYTE *v52;
  _QWORD v53[5];
  id v54;
  NSObject *v55;
  _BYTE *v56;
  _QWORD *v57;
  _QWORD v58[5];
  id v59;
  id v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2112;
    v62 = v11;
    _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] move-writer: finished coordinateForMovingFromURL source %@ dest %@ destFolder %@", buf, 0x20u);

  }
  if (!v12)
  {
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v60 = 0;
    objc_msgSend(v14, "moveItemAtURL:toURL:error:", v9, v10, &v60);
    v15 = v60;
    v16 = v15;
    if (!v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "_respectLastUsageDatePolicyForDestinationURL:withSource:", *(_QWORD *)(a1 + 48), v9);
      v24 = v9;
      if (!v9)
        v24 = *(void **)(a1 + 56);
      objc_msgSend(v24, "URLByDeletingLastPathComponent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v44 = v11;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "URLByDeletingLastPathComponent");
        v44 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 32), "_touchModificationDateForURL:", v45);
      objc_msgSend(*(id *)(a1 + 32), "_touchModificationDateForURL:", v44);
      group = dispatch_group_create();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v62 = __Block_byref_object_copy__3;
      v63 = __Block_byref_object_dispose__3;
      v64 = 0;
      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x3032000000;
      v58[3] = __Block_byref_object_copy__3;
      v58[4] = __Block_byref_object_dispose__3;
      v59 = 0;
      if (objc_msgSend(*(id *)(a1 + 64), "isProviderItem"))
      {
        objc_msgSend(*(id *)(a1 + 64), "asFPItem");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(group);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(WeakRetained, "operation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "manager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "itemID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "domainFromItemID:reason:", v31, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        fp_current_or_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_28_cold_1();

        objc_msgSend(v43, "defaultBackend");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(a1 + 48);
        v34 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v34, "operation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "request");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_29;
        v53[3] = &unk_1E8C765C0;
        v53[4] = *(_QWORD *)(a1 + 32);
        v54 = *(id *)(a1 + 48);
        v55 = group;
        v56 = buf;
        v57 = v58;
        objc_msgSend(v33, "itemForURL:request:completionHandler:", v41, v36, v53);

        objc_msgSend(v43, "forceIngestionAtURL:", *(_QWORD *)(a1 + 48));
      }
      v37 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v37, "queue");
      v38 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_30;
      block[3] = &unk_1E8C765E8;
      v51 = v58;
      v52 = buf;
      v50 = *(id *)(a1 + 72);
      v49 = *(id *)(a1 + 48);
      dispatch_group_notify(group, v38, block);

      _Block_object_dispose(v58, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_26;
    }
    objc_msgSend(v15, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v18 = objc_msgSend(v16, "code") == 516;

      if (v18)
      {
        v19 = *(_QWORD *)(a1 + 80);
        v20 = (void *)MEMORY[0x1E0CB37E8];
        v21 = objc_msgSend(*(id *)(a1 + 40), "longValue");
        if (v21 <= 1)
          v22 = 1;
        else
          v22 = v21;
        objc_msgSend(v20, "numberWithLong:", v22 + 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, id, id, void *, void *))(v19 + 16))(v19, v9, v10, v23, v16);

LABEL_26:
        goto LABEL_27;
      }
    }
    else
    {

    }
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "path");
      groupa = (dispatch_group_t)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fp_prettyDescription");
      v40 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = groupa;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      v62 = v40;
      _os_log_error_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_ERROR, "[ERROR] move-writer: couldn't move item at %@ to %@: %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_26;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_27:

}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2;
  v11[3] = &unk_1E8C76598;
  v12 = v6;
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v16 = *(_OWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_2();

  }
  v3 = *(_QWORD *)(a1 + 48);
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] move-writer: couldn't have item for URL %@", (uint8_t *)&v8, 0xCu);

  }
  v7 = *(id *)(a1 + 56);
  objc_sync_enter(v7);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
  objc_sync_exit(v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_30(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_30_cold_1();

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v3 = a1[5];
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:");
    else
      objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForURL:", a1[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

- (void)performMoveOfItem:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id WeakRetained;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  id v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
  objc_msgSend(WeakRetained, "info");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldBounce");

  if (v20)
  {
    v23 = 0;
    objc_msgSend(v16, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", &v23, 0, objc_msgSend(v14, "isFolder"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v23;

    v16 = (id)v21;
  }
  else
  {
    v22 = 0;
  }
  -[FPDMoveWriterToDisk _performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:bounceNumber:completion:](self, "_performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:bounceNumber:completion:", v14, v15, v16, a6, a7, v22, v17);

}

- (void)performMoveOfFolder:(id)a3 to:(id)a4 as:(id)a5 sourceMaterializeOption:(unint64_t)a6 targetMaterializeOption:(unint64_t)a7 atomically:(BOOL)a8 completion:(id)a9
{
  if (a8)
    -[FPDMoveWriterToDisk performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:](self, "performMoveOfItem:to:as:sourceMaterializeOption:targetMaterializeOption:completion:", a3, a4, a5, a6, a7, a9);
  else
    -[FPDMoveWriterToDisk performCreateFolder:inside:as:completion:](self, "performCreateFolder:inside:as:completion:", a3, a4, a5, a9, a7);
}

- (void)performCreateFolder:(id)a3 inside:(id)a4 as:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke;
  v18[3] = &unk_1E8C767D8;
  v21 = v11;
  v22 = v13;
  v18[4] = self;
  v19 = v12;
  v20 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  v17 = v13;
  -[FPDMoveWriterToDisk _resolveLocator:completion:](self, "_resolveLocator:completion:", v14, v18);

}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52[2];

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startAccessingURLForAtomDuration:", v5);

    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *MEMORY[0x1E0CB28A8];
    while (1)
    {
      v12 = *(id *)(a1 + 40);
      if (v9)
      {
        if (v9 == 1)
          v13 = 2;
        else
          v13 = v9;
        objc_msgSend(*(id *)(a1 + 40), "fp_bouncedNameWithIndex:isDir:", v13, 1);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v14;
      }
      else
      {
        v13 = 0;
      }

      objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v12, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v52[0] = 0;
      v17 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 0, 0, v52);
      v18 = v52[0];
      v8 = v18;
      if ((v17 & 1) != 0)
      {

        v24 = *(_QWORD *)(a1 + 48);
        if (v24)
        {
          v25 = *(void **)(a1 + 32);
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2;
          v50[3] = &unk_1E8C76768;
          v51 = v15;
          objc_msgSend(v25, "_resolveLocator:completion:", v24, v50);

        }
        if (objc_msgSend(*(id *)(a1 + 56), "isProviderItem"))
        {
          v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
          objc_msgSend(v26, "operation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "manager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "domainForURL:reason:", v15, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "defaultBackend");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_33;
          v47[3] = &unk_1E8C758B8;
          v47[4] = *(_QWORD *)(a1 + 32);
          v48 = v15;
          v49 = *(id *)(a1 + 64);
          objc_msgSend(v30, "itemForURL:request:completionHandler:", v48, v31, v47);

        }
        else
        {
          v43 = *(_QWORD *)(a1 + 64);
          objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForURL:", v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD))(v43 + 16))(v43, v29, 0);
        }

        objc_msgSend(objc_retainAutorelease(v15), "fileSystemRepresentation");
        fpfs_open();
        goto LABEL_32;
      }
      objc_msgSend(v18, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", v11) & 1) == 0)
        break;
      v20 = objc_msgSend(v8, "code");

      if (v20 != 516)
        goto LABEL_21;
      v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v21, "info");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "shouldBounce");

      if (v23)
      {
        v9 = v13 + 1;
        v10 = v15;
        if (v13 < 0xFF)
          continue;
      }
      goto LABEL_22;
    }

LABEL_21:
LABEL_22:
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_cold_1((uint64_t)v15, v8);

    objc_msgSend(v8, "domain");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isEqualToString:", v11))
    {
      v34 = objc_msgSend(v8, "code");

      if (v34 == 516 && objc_msgSend(*(id *)(a1 + 56), "isProviderItem"))
      {
        v35 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v35, "operation");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "manager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "asFPItem");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "itemID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "domainFromItemID:reason:", v39, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "defaultBackend");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForSelf](FPDRequest, "requestForSelf");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_37;
        v44[3] = &unk_1E8C76570;
        v46 = *(id *)(a1 + 64);
        v45 = v8;
        objc_msgSend(v41, "itemForURL:request:completionHandler:", v15, v42, v44);

        goto LABEL_32;
      }
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_32:

  }
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;

  objc_msgSend(a2, "path");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "fileSystemRepresentation");
  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "fileSystemRepresentation");
  v7 = fpfs_copy_xattrs();

  if (v7)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_cold_1(v4, v8);

  }
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_34;
  v12[3] = &unk_1E8C76790;
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, v12);

}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_34(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a1[4])
  {
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_2();

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v3 = a1[6];
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
        __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_1();

      v6 = a1[7];
      objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForItem:", a1[6]);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5)
        __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_34_cold_1((uint64_t)a1, v4);

      v6 = a1[7];
      objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForURL:", a1[5]);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, v7, 0);

  }
}

uint64_t __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_35()
{
  return fpfs_make_fsevent();
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_37(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fileProviderErrorForCollisionWithItem:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    if (!a3)
      a3 = *(_QWORD *)(a1 + 32);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 40), 0, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopAccessingToken, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_destroyWeak((id *)&self->_writer);
}

- (void)_respectLastUsageDatePolicyForDestinationURL:withSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] failed to preserve last used date: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)_touchModificationDateForURL:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = __error();
  OUTLINED_FUNCTION_4_0(v2);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v3, v4, "[ERROR] Can't bump mtime on %@: %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_cold_1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  OUTLINED_FUNCTION_4_0(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a1, v3, "[DEBUG] gettimeofday failed to get time of %s", v4);
  OUTLINED_FUNCTION_1_0();
}

void __52__FPDMoveWriterToDisk__touchModificationDateForURL___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = __error();
  OUTLINED_FUNCTION_4_0(v2);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v3, v4, "[DEBUG] fpfs_fset_metadata failed to bump mtime %@: %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_4_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v2, v3, "[ERROR] couldn't remove the empty file/partial copy at %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_7_2(v0), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] move-writer: resolved item for URL %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_2_13_cold_2()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_7_2(v1), "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v4, v5, "[ERROR] move-writer: resolving item at URL %@ failed: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __120__FPDMoveWriterToDisk__performCopyOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_15_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v1, v2, "[DEBUG] move-writer: Finished copy with dest item %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8_0();
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] move-writer: finishing resolving source locator: %@, err %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_22_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend(v0, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] move-writer: finishing resolving destination locator: %@ err %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] move-writer: starting ingestion of dest item %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __120__FPDMoveWriterToDisk__performMoveOfItem_to_as_sourceMaterializeOption_targetMaterializeOption_bounceNumber_completion___block_invoke_30_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v1, v2, "[DEBUG] move-writer: Finished move with dest item %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8_0();
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "fp_prettyDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v2, v3, "[ERROR] couldn't create directory at %@: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] failed to copy xattrs ofr directory %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __64__FPDMoveWriterToDisk_performCreateFolder_inside_as_completion___block_invoke_2_34_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_7_2(a1), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] move-writer: couldn't resolve item for URL %@, but no error; assuming delayed ingestion",
    v5);

  OUTLINED_FUNCTION_1_0();
}

@end
