@implementation WFContentCollectionFromStorageServiceResult

void __WFContentCollectionFromStorageServiceResult_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a2;
  objc_msgSend(v7, "wrappedURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(v7, "wrappedURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileWithURL:options:", v11, 8);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE19450], "itemWithFile:origin:disclosureLevel:", v14, *(_QWORD *)(a1 + 32), 1);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BE19450];
    objc_msgSend(v7, "metadataObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "itemWithObject:origin:disclosureLevel:", v14, *(_QWORD *)(a1 + 32), 1);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v13, 0);

}

void __WFContentCollectionFromStorageServiceResult_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19438], "collectionWithItems:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

  }
}

@end
