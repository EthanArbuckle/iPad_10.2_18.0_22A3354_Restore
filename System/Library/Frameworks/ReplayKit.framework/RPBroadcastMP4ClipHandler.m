@implementation RPBroadcastMP4ClipHandler

- (void)finishedProcessingMP4ClipWithUpdatedBroadcastConfiguration:(RPBroadcastConfiguration *)broadcastConfiguration error:(NSError *)error
{
  RPBroadcastConfiguration *v6;
  NSError *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;
  void *v18;
  uint8_t buf[4];
  RPBroadcastConfiguration *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = broadcastConfiguration;
  v7 = error;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = v6;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "broadcast configuration = %p", buf, 0xCu);
  }
  if (v7)
  {
    -[RPBroadcastHandler extensionContext](self, "extensionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelRequestWithError:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x24BDD1560]);
      v11 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(MEMORY[0x24BDD17C8], "_rpLocalizationNotNeeded:", CFSTR("RPBroadcastExtensionKeyBroadcastConfiguration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithString:", v12);
      objc_msgSend(v10, "setAttributedTitle:", v13);

      v14 = objc_alloc(MEMORY[0x24BDD15F0]);
      v15 = (void *)objc_msgSend(v14, "initWithItem:typeIdentifier:", v9, *MEMORY[0x24BDC1748]);
      v18 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttachments:", v16);

      objc_msgSend(v8, "addObject:", v10);
    }
    v17.receiver = self;
    v17.super_class = (Class)RPBroadcastMP4ClipHandler;
    -[RPBroadcastHandler _completeRequestWithReturnItems:](&v17, sel__completeRequestWithReturnItems_, v8);
  }

}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  RPBroadcastMP4ClipHandler *v14;
  uint8_t *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v22[5];
  id v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "beginRequestWithExtensionContext", buf, 2u);
  }
  -[RPBroadcastHandler setExtensionContext:](self, "setExtensionContext:", v4);
  v5 = (id)*MEMORY[0x24BDC1748];
  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = 0;
  -[RPBroadcastHandler extensionContext](self, "extensionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  -[RPBroadcastHandler extensionContext](self, "extensionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke;
  v12[3] = &unk_24D15D508;
  v11 = v5;
  v15 = buf;
  v16 = v26;
  v17 = v24;
  v18 = v22;
  v19 = v21;
  v20 = v8;
  v13 = v11;
  v14 = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(buf, 8);
}

void __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasItemConformingToTypeIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke_2;
    v7[3] = &unk_24D15D4E0;
    v8 = v3;
    v10 = *(_OWORD *)(a1 + 56);
    v11 = *(_OWORD *)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 88);
    v9 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v5, "loadItemForTypeIdentifier:options:completionHandler:", v6, 0, v7);

  }
}

void __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke_2_cold_1();
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 32), "attributedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("RPBroadcastExtensionKeyMovieClipURL"));

  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "received movie clip URL", (uint8_t *)&v24, 2u);
    }
    v11 = *(_QWORD *)(a1 + 48);
LABEL_20:
    objc_storeStrong((id *)(*(_QWORD *)(v11 + 8) + 40), a2);
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "attributedTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("RPBroadcastExtensionKeyExtensionUserInfo"));

  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "received user info", (uint8_t *)&v24, 2u);
    }
    v11 = *(_QWORD *)(a1 + 56);
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 32), "attributedTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("RPBroadcastExtensionKeyRequestedFinish"));

  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "received request finished", (uint8_t *)&v24, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v6, "BOOLValue");
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "attributedTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("RPBroadcastExtensionKeyExtensionSandboxToken"));

  if (v20)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "received sandbox token", (uint8_t *)&v24, 2u);
    }
    v11 = *(_QWORD *)(a1 + 72);
    goto LABEL_20;
  }
LABEL_21:
  if (*(_QWORD *)(a1 + 88) == ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)), "UTF8String");
    v21 = sandbox_extension_consume();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = v21;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "received all data, consumed sandbox token ret=%llu", (uint8_t *)&v24, 0xCu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "calling subclass method", (uint8_t *)&v24, 2u);
    }
    v22 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "processMP4ClipWithURL:setupInfo:finished:", v23, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));

  }
LABEL_27:

}

void __62__RPBroadcastMP4ClipHandler_beginRequestWithExtensionContext___block_invoke_2_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error loading input item for type", v0, 2u);
}

@end
