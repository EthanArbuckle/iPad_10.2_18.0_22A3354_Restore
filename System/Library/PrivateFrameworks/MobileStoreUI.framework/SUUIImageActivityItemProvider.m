@implementation SUUIImageActivityItemProvider

+ (id)placeholderItem
{
  return objc_alloc_init(MEMORY[0x24BEBD640]);
}

- (id)item
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__88;
  v17 = __Block_byref_object_dispose__88;
  v18 = 0;
  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDF67D8], "activityTypeShouldProvideImage:", v3))
  {
    -[SUUIDeferredActivityItemProvider productPageItem](self, "productPageItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artworksProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bestArtworkForScaledSize:", 100.0, 100.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v7);
      +[SUUIStyledImageDataConsumer shareSheetIconConsumer](SUUIStyledImageDataConsumer, "shareSheetIconConsumer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDataConsumer:", v9);

      objc_msgSend(v8, "setITunesStoreRequest:", 0);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __37__SUUIImageActivityItemProvider_item__block_invoke;
      v12[3] = &unk_2511F5178;
      v12[4] = &v13;
      objc_msgSend(v8, "setOutputBlock:", v12);
      objc_msgSend(v8, "main");

    }
  }
  v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __37__SUUIImageActivityItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
