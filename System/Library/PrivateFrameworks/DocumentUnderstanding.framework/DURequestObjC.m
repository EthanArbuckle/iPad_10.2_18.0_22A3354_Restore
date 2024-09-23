@implementation DURequestObjC

- (DURequestObjC)initWithClient:(id)a3 contentType:(id)a4 strategies:(id)a5
{
  id v8;
  id v9;
  id v10;
  DURequestObjC *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _TtC21DocumentUnderstanding9DURequest *v19;
  _TtC21DocumentUnderstanding9DURequest *underlyingRequest;
  DURequestObjC *v21;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)DURequestObjC;
  v11 = -[DURequestObjC init](&v30, sel_init);
  if (v11)
  {
    v25 = v8;
    +[DUObjCCompatibilityUtils clientForObjCClient:](DUObjCCompatibilityUtils, "clientForObjCClient:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[DUObjCCompatibilityUtils typeForObjCType:](DUObjCCompatibilityUtils, "typeForObjCType:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          +[DUObjCCompatibilityUtils strategyForObjCStrategy:](DUObjCCompatibilityUtils, "strategyForObjCStrategy:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v15);
    }

    v19 = -[DURequest initWithClient:contentType:strategies:]([_TtC21DocumentUnderstanding9DURequest alloc], "initWithClient:contentType:strategies:", v24, v23, v12);
    underlyingRequest = v11->_underlyingRequest;
    v11->_underlyingRequest = v19;

    v21 = v11;
    v8 = v25;
  }

  return v11;
}

- (void)executeWithDocument:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _TtC21DocumentUnderstanding9DURequest *underlyingRequest;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  +[DUObjCCompatibilityUtils documentForObjCDocument:](DUObjCCompatibilityUtils, "documentForObjCDocument:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  underlyingRequest = self->_underlyingRequest;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__DURequestObjC_executeWithDocument_completion___block_invoke;
  v10[3] = &unk_24F0F3F98;
  v11 = v6;
  v9 = v6;
  -[DURequest executeWithDocument:completion:](underlyingRequest, "executeWithDocument:completion:", v7, v10);

}

void __48__DURequestObjC_executeWithDocument_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  +[DUObjCCompatibilityUtils objcForResponse:](DUObjCCompatibilityUtils, "objcForResponse:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

@end
