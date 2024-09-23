@implementation LiveFSFPEnumeratorDataContainer

- (id)initForExtension:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  LiveFSFPEnumeratorDataContainer *v9;
  LiveFSFPEnumeratorDataContainer *v10;
  void *v11;
  LiveFSFPEnumeratorDataContainer *v12;
  uint64_t v13;
  NSPointerArray *ourEnumerators;
  void *v15;
  id v16;
  const char *v17;
  id v18;
  uint64_t v19;
  const char *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *updateQueue;
  char *label;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)LiveFSFPEnumeratorDataContainer;
  v9 = -[LiveFSFPEnumeratorDataContainer init](&v25, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_15:
    v10 = v10;
    v12 = v10;
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v9->ext, a3);
  objc_storeStrong((id *)&v10->_enumeratedItem, a4);
  -[LiveFSFPItemHelper container](v10->_enumeratedItem, "container");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[LiveFSFPItemHelper setContainer:](v10->_enumeratedItem, "setContainer:", v10);
    v10->_state = 0;
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v13 = objc_claimAutoreleasedReturnValue();
    ourEnumerators = v10->ourEnumerators;
    v10->ourEnumerators = (NSPointerArray *)v13;

    v10->_hasPersistentIDs = objc_msgSend(v7, "idsPersist");
    v10->_isDir = 0;
    v10->_isVolumeWide = 0;
    *(_WORD *)&v10->historyReset = 0;
    v10->_addParent = -[LiveFSFPExtensionHelper fetchRoot](v10->ext, "fetchRoot");
    label = 0;
    objc_msgSend(v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend(v16, "UTF8String");

    if (!v17)
      v17 = "Mystery domain to be named never";
    objc_msgSend(v8, "fh");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "UTF8String");

    v20 = "<root>";
    if (v19)
      v20 = (const char *)v19;
    asprintf(&label, "LiveFSFPEnumeratorDataContainer/%s/%s", v17, v20);
    if (label)
    {
      v21 = dispatch_queue_create(label, 0);
      updateQueue = v10->updateQueue;
      v10->updateQueue = (OS_dispatch_queue *)v21;

      free(label);
    }
    if (!v10->updateQueue || !v10->ourEnumerators)
    {

      v10 = 0;
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[LiveFSFPEnumeratorDataContainer initForExtension:item:].cold.1();
  v12 = 0;
LABEL_16:

  return v12;
}

- (LiveFSFPEnumeratorDataContainer)initWithEnumeratedItem:(id)a3 fileHandle:(id)a4 extension:(id)a5
{
  id v8;
  id v9;
  LiveFSFPEnumeratorDataContainer *v10;
  NSObject *v11;
  int v12;

  v8 = a3;
  v9 = a4;
  v10 = -[LiveFSFPEnumeratorDataContainer initForExtension:item:](self, "initForExtension:item:", a5, v8);
  if (v10)
  {
    livefs_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[LiveFSFPEnumeratorDataContainer initWithEnumeratedItem:fileHandle:extension:].cold.1((uint64_t)v10, v8, v11);

    objc_storeStrong((id *)&v10->_containerID, a4);
    v12 = objc_msgSend(v8, "liType");
    v10->_isDir = v12 == +[LiveFSFPItemHelper dt_dir](LiveFSFPItemHelper, "dt_dir");
  }

  return v10;
}

- (void)dropInterestForEnumeratedItem:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  LiveFSFPExtensionHelper *ext;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _BYTE v18[16];
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "fh");
    v6 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[LiveFSFPEnumeratorDataContainer dropInterestForEnumeratedItem:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    v20 = v6;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_INFO, "%s started item %@ fh %@", buf, 0x20u);

  }
  ext = self->ext;
  if (ext)
  {
    -[LiveFSFPExtensionHelper serviceClient](ext, "serviceClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "fh");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "LISCDropUpdateHandlerForInterestedItem:", v9);

    }
  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[LiveFSFPExtensionHelper conn](self->ext, "conn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__LiveFSFPEnumeratorDataContainer_dropInterestForEnumeratedItem___block_invoke;
  v17[3] = &unk_24E46B180;
  v17[4] = buf;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fh");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __65__LiveFSFPEnumeratorDataContainer_dropInterestForEnumeratedItem___block_invoke_2;
  v16[3] = &unk_24E46B180;
  v16[4] = buf;
  objc_msgSend(v12, "setUpdateInterest:interest:requestID:reply:", v13, 0, -1, v16);

  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    livefs_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "fh");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[LiveFSFPEnumeratorDataContainer dropInterestForEnumeratedItem:].cold.1(v15, (uint64_t)v18, v14);
    }

  }
  _Block_object_dispose(buf, 8);

}

void __65__LiveFSFPEnumeratorDataContainer_dropInterestForEnumeratedItem___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__LiveFSFPEnumeratorDataContainer_dropInterestForEnumeratedItem___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)doShutdown
{
  NSObject *v3;
  _BOOL4 isActive;
  _BOOL4 addedToExtension;
  NSString *enumeratedItemID;
  LiveFSFPItemHelper *enumeratedItem;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  LiveFSFPItemHelper *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    isActive = self->isActive;
    addedToExtension = self->_addedToExtension;
    enumeratedItem = self->_enumeratedItem;
    enumeratedItemID = self->_enumeratedItemID;
    v8[0] = 67109890;
    v8[1] = isActive;
    v9 = 1024;
    v10 = addedToExtension;
    v11 = 2112;
    v12 = enumeratedItemID;
    v13 = 2112;
    v14 = enumeratedItem;
    _os_log_impl(&dword_21F8A5000, v3, OS_LOG_TYPE_INFO, "dc doShutdown, isActive %d isAdded %d addedID %@ item %@", (uint8_t *)v8, 0x22u);
  }

  if (self->isActive)
  {
    -[LiveFSFPEnumeratorDataContainer dropInterestForEnumeratedItem:](self, "dropInterestForEnumeratedItem:", self->_enumeratedItem);
    self->isActive = 0;
  }
  if (self->_addedToExtension)
  {
    -[LiveFSFPExtensionHelper removeEnumeratorForContainer:](self->ext, "removeEnumeratorForContainer:", self->_enumeratedItemID);
    self->_addedToExtension = 0;
  }
}

- (void)doShutdownOnEnumeratorHelperQueue
{
  LiveFSFPExtensionHelper *ext;
  id v4;

  if (self->isActive)
  {
    -[LiveFSFPEnumeratorDataContainer dropInterestForEnumeratedItem:](self, "dropInterestForEnumeratedItem:", self->_enumeratedItem);
    self->isActive = 0;
  }
  if (self->_addedToExtension)
  {
    ext = self->ext;
    -[LiveFSFPItemHelper itemIdentifier](self->_enumeratedItem, "itemIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[LiveFSFPExtensionHelper removeEnumeratorForContainerLocked:](ext, "removeEnumeratorForContainerLocked:", v4);

  }
}

- (void)dealloc
{
  LiveFSFPItemHelper *enumeratedItem;
  objc_super v4;

  -[LiveFSFPEnumeratorDataContainer doShutdown](self, "doShutdown");
  enumeratedItem = self->_enumeratedItem;
  if (enumeratedItem)
    -[LiveFSFPItemHelper setContainer:](enumeratedItem, "setContainer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)LiveFSFPEnumeratorDataContainer;
  -[LiveFSFPEnumeratorDataContainer dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  LiveFSRBTree *contentsSortedByDate;
  LiveFSRBTree *contentsSortedByName;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  LiveFSFPEnumeratorDataContainer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  contentsSortedByDate = self->_contentsSortedByDate;
  self->_contentsSortedByDate = 0;

  contentsSortedByName = self->_contentsSortedByName;
  self->_contentsSortedByName = 0;

  -[LiveFSFPEnumeratorDataContainer doShutdown](self, "doShutdown");
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[LiveFSFPEnumeratorDataContainer invalidate]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s: marking state as DEAD on %p", (uint8_t *)&v6, 0x16u);
  }

  self->_state = 3;
}

- (void)addEnumerator:(id)a3
{
  LiveFSFPEnumeratorDataContainer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSPointerArray addPointer:](v4->ourEnumerators, "addPointer:", v5);
  objc_sync_exit(v4);

}

- (void)dropEnumerator:(id)a3
{
  LiveFSFPEnumeratorDataContainer *v4;
  unint64_t i;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSPointerArray compact](v4->ourEnumerators, "compact");
  for (i = 0; i < -[NSPointerArray count](v4->ourEnumerators, "count"); ++i)
  {
    if (-[NSPointerArray pointerAtIndex:](v4->ourEnumerators, "pointerAtIndex:", i) == v6)
    {
      -[NSPointerArray removePointerAtIndex:](v4->ourEnumerators, "removePointerAtIndex:", i);
      break;
    }
  }
  objc_sync_exit(v4);

}

- (void)dispatchOntoUpdateQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->updateQueue, a3);
}

- (id)readDirBuffersForBufferBlock:(id)a3 andEntryBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  int v33;
  uint8_t buf[16];
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;

  v6 = a3;
  v7 = a4;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__3;
  v55 = __Block_byref_object_dispose__3;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LiveFSFPEnumeratorDataContainer readDirBuffersForBufferBlock:andEntryBlock:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  v16 = 0;
  v17 = 1;
  v18 = MEMORY[0x24BDAC760];
LABEL_4:
  v33 = v17;
  v62[3] = 0;
  v58[3] = 0;
  -[LiveFSFPExtensionHelper conn](self->ext, "conn");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v18;
  v46[1] = 3221225472;
  v46[2] = __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke;
  v46[3] = &unk_24E46B180;
  v46[4] = &v51;
  objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", v46);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  while (!*((_DWORD *)v48 + 6) && !v52[5])
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    -[LiveFSFPItemHelper fh](self->_enumeratedItem, "fh");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v58[3];
    v23 = v62[3];
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke_2;
    v35[3] = &unk_24E46B870;
    v38 = &v42;
    v39 = &v47;
    v36 = v6;
    v37 = v7;
    v40 = &v57;
    v41 = &v61;
    objc_msgSend(v20, "readDirectory:amount:requestedAttributes:cookie:verifier:requestID:reply:", v21, 0x10000, 0, v22, v23, -1, v35);

    v24 = *((_DWORD *)v43 + 6);
    if (v24)
    {
      if (v24 == -1002)
      {
        *((_DWORD *)v43 + 6) = 70;
LABEL_18:
        +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v52[5];
        v52[5] = v30;

        v29 = (id)v52[5];
        _Block_object_dispose(&v42, 8);
        goto LABEL_20;
      }
      if (v24 != -1000)
        goto LABEL_18;
      livefs_std_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F8A5000, v25, OS_LOG_TYPE_INFO, "Restarting lookup", buf, 2u);
      }

      _Block_object_dispose(&v42, 8);
      v17 = v33 + 1;
      v16 = v20;
      if (v33 == 6)
      {
        +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 11);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v52[5];
        v52[5] = v26;

        v28 = (void *)v52[5];
LABEL_16:
        v29 = v28;
        goto LABEL_20;
      }
      goto LABEL_4;
    }

    _Block_object_dispose(&v42, 8);
  }
  v28 = (void *)v52[5];
  if (v28)
    goto LABEL_16;
  v29 = 0;
LABEL_20:
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v29;
}

void __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke_2(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  NSObject *v16;

  v9 = a5;
  v10 = v9;
  if (a2 != -1001 && a2)
  {
    livefs_std_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke_2_cold_1(a2, a3, v16);

    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  }
  else if (a2 == -1001 || !a3)
  {
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    v11 = objc_msgSend(objc_retainAutorelease(v9), "bytes");
    if (a3 >= 1)
    {
      v12 = v11;
      LODWORD(v13) = 0;
      v14 = 0;
      while (1)
      {
        if (*(_BYTE *)(v12 + *(unsigned __int16 *)(v12 + 10)) != 46)
        {
          if ((v14 & 1) == 0)
            (*(void (**)(void))(a1[4] + 16))();
          (*(void (**)(void))(a1[5] + 16))();
          v14 = 1;
        }
        if (*(_QWORD *)v12 == -1)
          break;
        v15 = *(unsigned __int16 *)(v12 + 8);
        if (*(_WORD *)(v12 + 8))
        {
          v13 = (v13 + v15);
          *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = *(_QWORD *)v12;
          v12 += v15;
          if (v13 < a3)
            continue;
        }
        goto LABEL_20;
      }
      *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    }
LABEL_20:
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = a4;
  }

}

- (id)loadContents
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  LiveFSFPEnumeratorDataContainer *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BE60458], "newWithComparitor:", &__block_literal_global_1);
  v4 = (void *)objc_msgSend(MEMORY[0x24BE60458], "newWithComparitor:", &__block_literal_global_11);
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[LiveFSFPItemHelper fh](self->_enumeratedItem, "fh");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_DEFAULT, "Reading dir with fh %@", buf, 0xCu);

  }
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_12;
  v18[3] = &unk_24E46B8F8;
  v19 = v3;
  v20 = v4;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_2_14;
  v15[3] = &unk_24E46B920;
  v8 = v19;
  v16 = v8;
  v9 = v20;
  v17 = v9;
  -[LiveFSFPEnumeratorDataContainer readDirBuffersForBufferBlock:andEntryBlock:](self, "readDirBuffersForBufferBlock:andEntryBlock:", v18, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = self;
    objc_sync_enter(v13);
    objc_storeStrong((id *)&v13->_contentsSortedByName, v3);
    objc_storeStrong((id *)&v13->_contentsSortedByDate, v4);
    objc_sync_exit(v13);

  }
  return v11;
}

uint64_t __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcmp((const char *)(a2 + *(unsigned __int16 *)(a2 + 10)), (const char *)(a3 + *(unsigned __int16 *)(a3 + 10)));
}

uint64_t __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 112);
  v4 = *(_QWORD *)(a3 + 112);
  v5 = v3 <= v4;
  if (v3 == v4)
  {
    v6 = *(_QWORD *)(a2 + 120);
    v7 = *(_QWORD *)(a3 + 120);
    v5 = v6 <= v7;
    if (v6 == v7)
      return strcmp((const char *)(a2 + *(unsigned __int16 *)(a2 + 10)), (const char *)(a3 + *(unsigned __int16 *)(a3 + 10)));
  }
  if (v5)
    return 1;
  return -1;
}

void __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addDataBuffer:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addDataBuffer:", v4);

}

void __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_2_14(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "addEntry:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addEntry:", a2);
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = a2;
    _os_log_impl(&dword_21F8A5000, v4, OS_LOG_TYPE_DEFAULT, "Done adding %p", (uint8_t *)&v5, 0xCu);
  }

}

- (id)ensureConnectedForUpdates
{
  LiveFSFPEnumeratorDataContainer *v2;
  NSObject *v3;
  NSString *containerID;
  void *v5;
  _BOOL4 isActive;
  id v7;
  LiveFSFPExtensionHelper *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  LiveFSFPExtensionHelper *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _BYTE buf[24];
  __int128 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    containerID = v2->_containerID;
    -[LiveFSFPItemHelper fh](v2->_enumeratedItem, "fh");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isActive = v2->isActive;
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = containerID;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v27) = isActive;
    WORD2(v27) = 2112;
    *(_QWORD *)((char *)&v27 + 6) = v2;
    _os_log_impl(&dword_21F8A5000, v3, OS_LOG_TYPE_INFO, "Setting up for updates on %@ fh %@ active %d dc %@", buf, 0x26u);

  }
  if (v2->isActive)
  {
    v7 = 0;
  }
  else
  {
    v8 = v2->ext;
    objc_sync_enter(v8);
    -[LiveFSFPExtensionHelper serviceClient](v2->ext, "serviceClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LiveFSFPItemHelper fh](v2->_enumeratedItem, "fh");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "LISCAddUpdateHandler:forInterestedItem:", v2, v10);

    objc_sync_exit(v8);
    if (v11 == 17)
    {
      livefs_std_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        -[LiveFSFPItemHelper fh](v2->_enumeratedItem, "fh");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[LiveFSFPEnumeratorDataContainer ensureConnectedForUpdates].cold.1(v13, buf, v12);
      }
      v7 = 0;
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&v27 = __Block_byref_object_copy__3;
      *((_QWORD *)&v27 + 1) = __Block_byref_object_dispose__3;
      v28 = 0;
      -[LiveFSFPExtensionHelper conn](v2->ext, "conn");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x24BDAC760];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __60__LiveFSFPEnumeratorDataContainer_ensureConnectedForUpdates__block_invoke;
      v25[3] = &unk_24E46B180;
      v25[4] = buf;
      objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
      v12 = objc_claimAutoreleasedReturnValue();

      -[LiveFSFPItemHelper fh](v2->_enumeratedItem, "fh");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __60__LiveFSFPEnumeratorDataContainer_ensureConnectedForUpdates__block_invoke_2;
      v24[3] = &unk_24E46B180;
      v24[4] = buf;
      -[NSObject setUpdateInterest:interest:requestID:reply:](v12, "setUpdateInterest:interest:requestID:reply:", v16, 1, -1, v24);

      v17 = *(_QWORD *)&buf[8];
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        livefs_std_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[LiveFSFPEnumeratorDataContainer ensureConnectedForUpdates].cold.2((uint64_t)v2, v18, v19);

        v20 = v2->ext;
        objc_sync_enter(v20);
        -[LiveFSFPExtensionHelper serviceClient](v2->ext, "serviceClient");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[LiveFSFPItemHelper fh](v2->_enumeratedItem, "fh");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "LISCDropUpdateHandlerForInterestedItem:", v22);

        objc_sync_exit(v20);
        v17 = *(_QWORD *)&buf[8];
      }
      else
      {
        v2->isActive = 1;
      }
      v7 = *(id *)(v17 + 40);
      _Block_object_dispose(buf, 8);

    }
  }
  objc_sync_exit(v2);

  return v7;
}

void __60__LiveFSFPEnumeratorDataContainer_ensureConnectedForUpdates__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__LiveFSFPEnumeratorDataContainer_ensureConnectedForUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)doProcessItemDeleted:(id)a3
{
  LiveFSFPExtensionHelper *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self->ext;
  objc_sync_enter(v4);
  -[LiveFSFPExtensionHelper getItemForFileHandle:](self->ext, "getItemForFileHandle:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setItemDeleted");
  objc_sync_exit(v4);

}

- (void)doProcessItemUpdated:(id)a3
{
  void *v3;
  id v4;

  -[LiveFSFPExtensionHelper itemForIdentifier:error:](self->ext, "itemForIdentifier:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAttributesStale");
    v3 = v4;
  }

}

- (void)applyAddAcrossEnumerators:(id)a3 newName:(id)a4 forSelf:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  LiveFSFPEnumeratorDataContainer *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  v11 = (void *)-[NSPointerArray copy](v10->ourEnumerators, "copy");
  objc_sync_exit(v10);

  objc_msgSend(v11, "compact");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      v17 = v14;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v14 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v16);

        objc_msgSend(v14, "addInterestedItem:newName:forSelf:", v8, v9, v5, (_QWORD)v18);
        ++v16;
        v17 = v14;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);

  }
}

- (void)applyDeleteAcrossEnumerators:(id)a3 newTombstone:(id)a4 toSelf:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  LiveFSFPEnumeratorDataContainer *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  v11 = (void *)-[NSPointerArray copy](v10->ourEnumerators, "copy");
  objc_sync_exit(v10);

  objc_msgSend(v11, "compact");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      v17 = v14;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v14 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v16);

        objc_msgSend(v14, "applyDelete:newTombstone:toSelf:", v8, v9, v5, (_QWORD)v18);
        ++v16;
        v17 = v14;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);

  }
}

- (void)applyParentUpdateAcrossEnumerators
{
  LiveFSFPEnumeratorDataContainer *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSPointerArray copy](v2->ourEnumerators, "copy");
  objc_sync_exit(v2);

  objc_msgSend(v3, "compact");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v6 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v8);

        objc_msgSend(v6, "setAddParent:", 1, (_QWORD)v10);
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);

  }
  if (!objc_msgSend(v4, "count"))
    v2->_addParent = 1;

}

- (void)resetAllEnumerators
{
  LiveFSFPEnumeratorDataContainer *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSPointerArray copy](v2->ourEnumerators, "copy");
  objc_sync_exit(v2);

  objc_msgSend(v3, "compact");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v6 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v8);

        objc_msgSend(v6, "resetHistory", (_QWORD)v10);
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);

  }
}

- (void)makeAllEnumeratorsDead
{
  NSObject *v3;
  LiveFSFPItemHelper *enumeratedItem;
  __CFString *v5;
  LiveFSFPEnumeratorDataContainer *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    enumeratedItem = self->_enumeratedItem;
    if (enumeratedItem)
    {
      -[LiveFSFPItemHelper filename](self->_enumeratedItem, "filename");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("<no_enumerated_item>");
    }
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_21F8A5000, v3, OS_LOG_TYPE_INFO, "About to bulk-deaden enumerators for name '%@'", buf, 0xCu);
    if (enumeratedItem)

  }
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)-[NSPointerArray copy](v6->ourEnumerators, "copy");
  objc_sync_exit(v6);

  objc_msgSend(v7, "compact");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);

        v10 = v13;
        objc_sync_enter(v10);
        objc_msgSend(v10, "setState:", 3, (_QWORD)v14);
        objc_sync_exit(v10);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);

  }
}

- (void)handleEnumeratedItemChanged
{
  LiveFSFPEnumeratorDataContainer *v2;
  LiveFSRBTree *contentsSortedByDate;
  LiveFSRBTree *contentsSortedByName;
  NSObject *v5;
  NSString *containerID;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  contentsSortedByDate = v2->_contentsSortedByDate;
  v2->_contentsSortedByDate = 0;

  contentsSortedByName = v2->_contentsSortedByName;
  v2->_contentsSortedByName = 0;

  objc_sync_exit(v2);
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    containerID = v2->_containerID;
    *(_DWORD *)buf = 136315394;
    v13 = "-[LiveFSFPEnumeratorDataContainer handleEnumeratedItemChanged]";
    v14 = 2112;
    v15 = containerID;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s: blasted dir contents for %@", buf, 0x16u);
  }

  -[LiveFSFPItemHelper setAttributesStale](v2->_enumeratedItem, "setAttributesStale");
  v7 = (void *)MEMORY[0x24BDC83F0];
  -[NSFileProviderExtension domain](v2->ext, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managerForDomain:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v2->_containerID;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__LiveFSFPEnumeratorDataContainer_handleEnumeratedItemChanged__block_invoke;
  v11[3] = &unk_24E46B5D0;
  v11[4] = v2;
  objc_msgSend(v9, "signalEnumeratorForContainerItemIdentifier:completionHandler:", v10, v11);

}

void __62__LiveFSFPEnumeratorDataContainer_handleEnumeratedItemChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    livefs_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__LiveFSFPEnumeratorDataContainer_handleEnumeratedItemChanged__block_invoke_cold_1();

  }
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = 136315394;
    v8 = "-[LiveFSFPEnumeratorDataContainer handleEnumeratedItemChanged]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s: posted for container %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)deletedItem:(id)a3 name:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *updateQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  LiveFSFPEnumeratorDataContainer *v21;
  int v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  updateQueue = self->updateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__LiveFSFPEnumeratorDataContainer_deletedItem_name_how_interestedItem___block_invoke;
  block[3] = &unk_24E46B0E0;
  v18 = v11;
  v19 = v10;
  v22 = a5;
  v20 = v12;
  v21 = self;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(updateQueue, block);

}

uint64_t __71__LiveFSFPEnumeratorDataContainer_deletedItem_name_how_interestedItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_DWORD *)(a1 + 64);
    v7 = 136315906;
    v8 = "-[LiveFSFPEnumeratorDataContainer deletedItem:name:how:interestedItem:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_21F8A5000, v2, OS_LOG_TYPE_INFO, "%s: starting for name %@ item %@ how %d", (uint8_t *)&v7, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 56), "applyDeleteAcrossEnumerators:newTombstone:toSelf:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 64), objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(*(id *)(a1 + 56), "doProcessItemDeleted:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "handleEnumeratedItemChanged");
}

- (void)deletedName:(id)a3 item:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  id v9;
  id v10;
  NSObject *updateQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  LiveFSFPEnumeratorDataContainer *v17;
  int v18;

  v9 = a3;
  v10 = a4;
  updateQueue = self->updateQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__LiveFSFPEnumeratorDataContainer_deletedName_item_how_interestedItem___block_invoke;
  v14[3] = &unk_24E46B948;
  v15 = v9;
  v16 = v10;
  v18 = a5;
  v17 = self;
  v12 = v10;
  v13 = v9;
  dispatch_async(updateQueue, v14);

}

uint64_t __71__LiveFSFPEnumeratorDataContainer_deletedName_item_how_interestedItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_DWORD *)(a1 + 56);
    v7 = 136315906;
    v8 = "-[LiveFSFPEnumeratorDataContainer deletedName:item:how:interestedItem:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_21F8A5000, v2, OS_LOG_TYPE_INFO, "%s: starting for name %@ item %@ how %d", (uint8_t *)&v7, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 48), "applyDeleteAcrossEnumerators:newTombstone:toSelf:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 48), "doProcessItemDeleted:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "handleEnumeratedItemChanged");
}

- (void)updatesDoneFor:(id)a3
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->updateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__LiveFSFPEnumeratorDataContainer_updatesDoneFor___block_invoke;
  block[3] = &unk_24E46B2C0;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

uint64_t __50__LiveFSFPEnumeratorDataContainer_updatesDoneFor___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[LiveFSFPEnumeratorDataContainer updatesDoneFor:]_block_invoke";
    _os_log_impl(&dword_21F8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s: about to deaden", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "makeAllEnumeratorsDead");
}

- (void)historyResetItem:(id)a3 interestedItem:(id)a4
{
  LiveFSFPEnumeratorDataContainer *v4;
  NSObject *updateQueue;
  _QWORD block[5];

  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_isVolumeWide)
    v4->historyReset = 1;
  objc_sync_exit(v4);

  updateQueue = v4->updateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__LiveFSFPEnumeratorDataContainer_historyResetItem_interestedItem___block_invoke;
  block[3] = &unk_24E46B2C0;
  block[4] = v4;
  dispatch_async(updateQueue, block);
}

uint64_t __67__LiveFSFPEnumeratorDataContainer_historyResetItem_interestedItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resetAllEnumerators");
  return objc_msgSend(*(id *)(a1 + 32), "handleEnumeratedItemChanged");
}

- (void)historyResetName:(id)a3 interestedItem:(id)a4
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->updateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__LiveFSFPEnumeratorDataContainer_historyResetName_interestedItem___block_invoke;
  block[3] = &unk_24E46B2C0;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

uint64_t __67__LiveFSFPEnumeratorDataContainer_historyResetName_interestedItem___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_sync_exit(v2);

  return objc_msgSend(*(id *)(a1 + 32), "handleEnumeratedItemChanged");
}

- (void)renamedItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *updateQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  updateQueue = self->updateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke;
  block[3] = &unk_24E46B970;
  block[4] = self;
  v28 = v14;
  v29 = v16;
  v30 = v17;
  v31 = v19;
  v32 = v18;
  v33 = v15;
  v21 = v15;
  v22 = v18;
  v23 = v19;
  v24 = v17;
  v25 = v16;
  v26 = v14;
  dispatch_async(updateQueue, block);

}

void __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorHelperQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke_2;
  block[3] = &unk_24E46B970;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v11 = *(id *)(a1 + 80);
  dispatch_sync(v3, block);

}

void __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke_2(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  id *v7;
  id *v8;
  id *v9;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  id v23;
  char v24;
  id *v25;
  id v26;
  id v27;
  id v28;
  id obj;
  id *v30;
  void *v31;
  uint8_t buf[4];
  id *v33;
  __int16 v34;
  id *v35;
  __int16 v36;
  id *v37;
  __int16 v38;
  id *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 56), "extension");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  objc_msgSend(v2, "getItemForFileHandle:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getItemForFileHandle:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getItemForFileHandle:", a1[7]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[8])
  {
    objc_msgSend(v2, "getItemForFileHandle:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "container");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "container");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "container");
  v30 = (id *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "container");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v2);

  v9 = (id *)a1[4];
  v13 = v9 == v6 || v9 == v7 || v9 == v30 || v9 == v8;
  livefs_std_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v33 = v6;
      v34 = 2112;
      v35 = v7;
      v36 = 2112;
      v37 = v30;
      v38 = 2112;
      v39 = v8;
      _os_log_impl(&dword_21F8A5000, v15, OS_LOG_TYPE_DEFAULT, "Containers 1 %@, 2 %@, 3 %@, 4 %@", buf, 0x2Au);
    }

    if (!v4 || v6 || v7)
    {
      if (v7)
      {
        if (v8)
        {
          obj = v2;
          objc_sync_enter(obj);
          v18 = v8[7];
          v28 = v18;
          objc_storeStrong(v8 + 7, v7[7]);
          objc_storeStrong(v7 + 7, v18);
          objc_msgSend(obj, "serviceClient");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "LISCDropUpdateHandlerForInterestedItem:", a1[6]);

          objc_msgSend(obj, "serviceClient");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "LISCDropUpdateHandlerForInterestedItem:", a1[8]);

          objc_msgSend(obj, "serviceClient");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "LISCAddUpdateHandler:forInterestedItem:", v8, a1[6]);

          objc_msgSend(v7[7], "setContainer:", v7);
          objc_msgSend(v8[7], "setContainer:", v8);
          objc_sync_exit(obj);

        }
        v22 = v7;
        objc_sync_enter(v22);
        objc_msgSend(v22, "doShutdownOnEnumeratorHelperQueue");
        objc_sync_exit(v22);

        objc_msgSend(v22, "applyDeleteAcrossEnumerators:newTombstone:toSelf:", CFSTR("not needed as this is a self delete"), v22[8], 1);
        objc_msgSend(v22, "makeAllEnumeratorsDead");
        goto LABEL_38;
      }
    }
    else
    {
      objc_msgSend(v4, "setAttributesStale");
    }
    if (v8)
    {
      if (v4)
      {
        v23 = v2;
        objc_sync_enter(v23);
        if (v5)
        {
          objc_msgSend(v5, "setItemDeleted");

        }
        objc_msgSend(v4, "setNewParent:andName:", v31, a1[9]);
        objc_sync_exit(v23);

        v5 = 0;
      }
      else
      {
        objc_msgSend(v2, "itemAtPath:parent:", a1[9], v31);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v25 = v8;
      objc_sync_enter(v25);
      objc_msgSend(v25, "doShutdownOnEnumeratorHelperQueue");
      objc_sync_exit(v25);

      objc_storeStrong(v25 + 7, v4);
      objc_msgSend(v4, "setContainer:", v25);
      v26 = (id)objc_msgSend(v25, "ensureConnectedForUpdates");
      v24 = 1;
      if (!v6)
        goto LABEL_43;
LABEL_42:
      objc_msgSend(v6, "applyDeleteAcrossEnumerators:newTombstone:toSelf:", a1[10], a1[10], 0);
LABEL_43:
      if (v30)
        objc_msgSend(v30, "applyAddAcrossEnumerators:newName:forSelf:", a1[9], a1[9], 0);
      if (v3)
        objc_msgSend(v3, "setAttributesStale");
      if (v31 && v3 != v31)
        objc_msgSend(v31, "setAttributesStale");
      v27 = v2;
      objc_sync_enter(v27);
      if (v5)
      {
        objc_msgSend(v5, "recursivelySetChildrenDeleted");
        objc_msgSend(v5, "setItemDeleted");
      }
      if (v31 && v4)
      {
        if ((v24 & 1) == 0)
          objc_msgSend(v4, "setNewParent:andName:", v31, a1[9]);
      }
      else if (v4)
      {
        objc_msgSend(v4, "recursivelySetChildrenDeleted");
        objc_msgSend(v4, "setItemDeleted");
      }
      objc_sync_exit(v27);

      if (v3)
        objc_msgSend(v3, "performBlocksForRename:onEHQueue:", a1[10], 1);
      if (v6)
        objc_msgSend(v6, "handleEnumeratedItemChanged");
      if (v7)
        objc_msgSend(v7, "handleEnumeratedItemChanged");
      if (v30)
        objc_msgSend(v30, "handleEnumeratedItemChanged");
      if (v8)
        objc_msgSend(v8, "handleEnumeratedItemChanged");
      goto LABEL_68;
    }
LABEL_38:
    v24 = 0;
    if (!v6)
      goto LABEL_43;
    goto LABEL_42;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke_2_cold_1(v15, v16, v17);

LABEL_68:
}

- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *updateQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  LiveFSFPEnumeratorDataContainer *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  updateQueue = self->updateQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__LiveFSFPEnumeratorDataContainer_updatedItem_name_interestedItem___block_invoke;
  v15[3] = &unk_24E46B998;
  v16 = v8;
  v17 = v10;
  v18 = self;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(updateQueue, v15);

}

void __67__LiveFSFPEnumeratorDataContainer_updatedItem_name_interestedItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__LiveFSFPEnumeratorDataContainer_updatedItem_name_interestedItem___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "applyAddAcrossEnumerators:newName:forSelf:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v10);
  v11 = *(_QWORD *)(a1 + 48);
  if ((_DWORD)v10)
  {
    v12 = *(id *)(v11 + 56);
  }
  else
  {
    objc_msgSend(*(id *)(v11 + 8), "itemAtPath:parent:", *(_QWORD *)(a1 + 56), *(_QWORD *)(v11 + 56));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "setAttributesStale");
  objc_msgSend(*(id *)(a1 + 48), "handleEnumeratedItemChanged");

}

- (void)updatedName:(id)a3 interestedItem:(id)a4
{
  id v5;
  NSObject *updateQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  LiveFSFPEnumeratorDataContainer *v10;

  v5 = a3;
  updateQueue = self->updateQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__LiveFSFPEnumeratorDataContainer_updatedName_interestedItem___block_invoke;
  v8[3] = &unk_24E46B338;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(updateQueue, v8);

}

void __62__LiveFSFPEnumeratorDataContainer_updatedName_interestedItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[LiveFSFPEnumeratorDataContainer updatedName:interestedItem:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_21F8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s: starting for name %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "itemAtPath:parent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setAttributesStale");
  objc_msgSend(*(id *)(a1 + 40), "applyAddAcrossEnumerators:newName:forSelf:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 40), "handleEnumeratedItemChanged");

}

- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4
{
  id v5;
  NSObject *updateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  updateQueue = self->updateQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__LiveFSFPEnumeratorDataContainer_volumeWideDeletedName_interestedItem___block_invoke;
  v8[3] = &unk_24E46B338;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(updateQueue, v8);

}

uint64_t __72__LiveFSFPEnumeratorDataContainer_volumeWideDeletedName_interestedItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "applyDeleteAcrossEnumerators:newTombstone:toSelf:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(a1 + 32), "handleEnumeratedItemChanged");
}

- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4
{
  id v5;
  NSObject *updateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  updateQueue = self->updateQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__LiveFSFPEnumeratorDataContainer_volumeWideUpdatedName_interestedItem___block_invoke;
  v8[3] = &unk_24E46B338;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(updateQueue, v8);

}

uint64_t __72__LiveFSFPEnumeratorDataContainer_volumeWideUpdatedName_interestedItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "applyAddAcrossEnumerators:newName:forSelf:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(a1 + 32), "handleEnumeratedItemChanged");
}

- (BOOL)hasPersistentIDs
{
  return self->_hasPersistentIDs;
}

- (BOOL)isDir
{
  return self->_isDir;
}

- (BOOL)addedToExtension
{
  return self->_addedToExtension;
}

- (void)setAddedToExtension:(BOOL)a3
{
  self->_addedToExtension = a3;
}

- (BOOL)addParent
{
  return self->_addParent;
}

- (void)setAddParent:(BOOL)a3
{
  self->_addParent = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)isVolumeWide
{
  return self->_isVolumeWide;
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (LiveFSFPItemHelper)enumeratedItem
{
  return (LiveFSFPItemHelper *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)enumeratedItemID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEnumeratedItemID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (LiveFSRBTree)contentsSortedByDate
{
  return (LiveFSRBTree *)objc_getProperty(self, a2, 72, 1);
}

- (LiveFSRBTree)contentsSortedByName
{
  return (LiveFSRBTree *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsSortedByName, 0);
  objc_storeStrong((id *)&self->_contentsSortedByDate, 0);
  objc_storeStrong((id *)&self->_enumeratedItemID, 0);
  objc_storeStrong((id *)&self->_enumeratedItem, 0);
  objc_storeStrong((id *)&self->updateQueue, 0);
  objc_storeStrong((id *)&self->ourEnumerators, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->ext, 0);
}

- (void)initForExtension:item:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F8A5000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "initForExtension: _enumeratedItem.container != nil", v0, 2u);
}

- (void)initWithEnumeratedItem:(uint64_t)a1 fileHandle:(void *)a2 extension:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 134218754;
  v11 = a1;
  OUTLINED_FUNCTION_5_1();
  v12 = v6;
  v13 = 2048;
  v14 = a2;
  v15 = v8;
  v16 = v9;
  _os_log_debug_impl(&dword_21F8A5000, a3, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: Creating enumerator for %@[%p] id %@", (uint8_t *)&v10, 0x2Au);

}

- (void)dropInterestForEnumeratedItem:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0(&dword_21F8A5000, a3, (uint64_t)a3, "Error clearing interest in updates on enumerator for %@", (uint8_t *)a2);

}

- (void)readDirBuffersForBufferBlock:(uint64_t)a3 andEntryBlock:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, a1, a3, "%s starting -B-", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke_2_cold_1(int a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[LiveFSFPEnumeratorDataContainer readDirBuffersForBufferBlock:andEntryBlock:]_block_invoke_2";
  v5 = 1024;
  v6 = a1;
  v7 = 2048;
  v8 = a2;
  OUTLINED_FUNCTION_16_0(&dword_21F8A5000, a3, (uint64_t)a3, "%s: ReadDir got result %d, bytes %zd", (uint8_t *)&v3);
}

- (void)ensureConnectedForUpdates
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 16);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_4_0(&dword_21F8A5000, a2, a3, "Error setting interest in updates on enumerator for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_0();
}

void __62__LiveFSFPEnumeratorDataContainer_handleEnumeratedItemChanged__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_21F8A5000, v0, v1, "Error posting update: %@", v2);
  OUTLINED_FUNCTION_0();
}

void __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[LiveFSFPEnumeratorDataContainer renamedItem:named:fromDirectory:intoDirectory:newName:atopItem:]_block_invoke_2";
  OUTLINED_FUNCTION_4_0(&dword_21F8A5000, a1, a3, "%s: Lost race condition handling rename updates. Exiting.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void __67__LiveFSFPEnumeratorDataContainer_updatedItem_name_interestedItem___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_21F8A5000, a1, a3, "%s: starting", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

@end
