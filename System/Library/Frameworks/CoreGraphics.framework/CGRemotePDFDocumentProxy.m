@implementation CGRemotePDFDocumentProxy

- (CGRemotePDFDocumentProxy)initWithRemoteDocument:(id)a3
{
  id v5;
  CGRemotePDFDocumentProxy *v6;
  CGRemotePDFDocumentProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CGRemotePDFDocumentProxy;
  v6 = -[CGRemotePDFDocumentProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_documentProxy, a3);

  return v7;
}

- (NSDictionary)infoDictionary
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18565;
  v10 = __Block_byref_object_dispose__18566;
  v11 = 0;
  -[CGRemotePDFDocumentProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_documentProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_18575);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CGRemotePDFDocumentProxy_infoDictionary__block_invoke_2;
  v5[3] = &unk_1E16616B8;
  v5[4] = &v6;
  objc_msgSend(v2, "getInfo:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)getVersionMajor:(int64_t *)a3 andMinor:(int64_t *)a4
{
  void *v6;
  _QWORD v7[6];

  *a4 = 0;
  *a3 = 0;
  -[CGRemotePDFDocumentProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_documentProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3_18572);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CGRemotePDFDocumentProxy_getVersionMajor_andMinor___block_invoke_2;
  v7[3] = &__block_descriptor_48_e11_v24__0q8q16l;
  v7[4] = a3;
  v7[5] = a4;
  objc_msgSend(v6, "getVersion:", v7);

}

- (BOOL)isUnlocked
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[CGRemotePDFDocumentProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_documentProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_5_18571);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__CGRemotePDFDocumentProxy_isUnlocked__block_invoke_2;
  v4[3] = &unk_1E1661740;
  v4[4] = &v5;
  objc_msgSend(v2, "getIsUnlocked:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (BOOL)isEncrypted
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[CGRemotePDFDocumentProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_documentProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_7_18569);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__CGRemotePDFDocumentProxy_isEncrypted__block_invoke_2;
  v4[3] = &unk_1E1661740;
  v4[4] = &v5;
  objc_msgSend(v2, "getIsEncrypted:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (unint64_t)pageCount
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CGRemotePDFDocumentProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_documentProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8_18568);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CGRemotePDFDocumentProxy_pageCount__block_invoke_2;
  v5[3] = &unk_1E16617A8;
  v5[4] = &v6;
  objc_msgSend(v2, "getPageCount:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)sync_pageAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__18565;
  v13 = __Block_byref_object_dispose__18566;
  v14 = 0;
  -[CGRemotePDFDocumentProtocol synchronousRemoteObjectProxyWithErrorHandler:](self->_documentProxy, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10_18567);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__CGRemotePDFDocumentProxy_sync_pageAtIndex___block_invoke_2;
  v8[3] = &unk_1E16617F0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "getPageAtIndex:completion:", a3, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)getPageAtIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  CGRemotePDFDocumentProtocol *documentProxy;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  documentProxy = self->_documentProxy;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__CGRemotePDFDocumentProxy_getPageAtIndex_completion___block_invoke;
  v14[3] = &unk_1E1661818;
  v9 = v6;
  v15 = v9;
  -[CGRemotePDFDocumentProtocol remoteObjectProxyWithErrorHandler:](documentProxy, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __54__CGRemotePDFDocumentProxy_getPageAtIndex_completion___block_invoke_2;
  v12[3] = &unk_1E1661840;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "getPageAtIndex:completion:", a3, v12);

}

- (id)pageProxyForRemotePage:(id)a3
{
  id v3;
  CGRemotePDFPageProxy *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[CGRemotePDFPageProxy initWithRemotePage:]([CGRemotePDFPageProxy alloc], "initWithRemotePage:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProxy, 0);
}

uint64_t __54__CGRemotePDFDocumentProxy_getPageAtIndex_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFDocumentProxy getPageAtIndex:completion:]_block_invoke", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__CGRemotePDFDocumentProxy_getPageAtIndex_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pageProxyForRemotePage:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __45__CGRemotePDFDocumentProxy_sync_pageAtIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "pageProxyForRemotePage:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __45__CGRemotePDFDocumentProxy_sync_pageAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFDocumentProxy sync_pageAtIndex:]_block_invoke", a2);
}

uint64_t __37__CGRemotePDFDocumentProxy_pageCount__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __37__CGRemotePDFDocumentProxy_pageCount__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFDocumentProxy pageCount]_block_invoke", a2);
}

uint64_t __39__CGRemotePDFDocumentProxy_isEncrypted__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __39__CGRemotePDFDocumentProxy_isEncrypted__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFDocumentProxy isEncrypted]_block_invoke", a2);
}

uint64_t __38__CGRemotePDFDocumentProxy_isUnlocked__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __38__CGRemotePDFDocumentProxy_isUnlocked__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFDocumentProxy isUnlocked]_block_invoke", a2);
}

uint64_t __53__CGRemotePDFDocumentProxy_getVersionMajor_andMinor___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(result + 40);
  **(_QWORD **)(result + 32) = a2;
  *v3 = a3;
  return result;
}

void __53__CGRemotePDFDocumentProxy_getVersionMajor_andMinor___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFDocumentProxy getVersionMajor:andMinor:]_block_invoke", a2);
}

void __42__CGRemotePDFDocumentProxy_infoDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __42__CGRemotePDFDocumentProxy_infoDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: error: %@"), "-[CGRemotePDFDocumentProxy infoDictionary]_block_invoke", a2);
}

@end
