@implementation WFGetPasteboardRepresentationFromWKWebView

void __WFGetPasteboardRepresentationFromWKWebView_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  -[objc_class generalPasteboard](getUIPasteboardClass(), "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItems:", MEMORY[0x24BDBD1A8]);
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __WFGetPasteboardRepresentationFromWKWebView_block_invoke_2;
  v7[3] = &unk_24C4DF8D0;
  v8 = v4;
  v9 = v2;
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = *(id *)(a1 + 48);
  v5 = v3;
  v6 = v2;
  objc_msgSend(v8, "_executeEditCommand:argument:completion:", CFSTR("copy"), 0, v7);

}

void __WFGetPasteboardRepresentationFromWKWebView_block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __WFGetPasteboardRepresentationFromWKWebView_block_invoke_3;
  v3[3] = &unk_24C4DF8A8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_doAfterNextPresentationUpdateWithoutWaitingForPainting:", v3);

}

void __WFGetPasteboardRepresentationFromWKWebView_block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForPasteboardType:inItemSet:", v3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setItems:", *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v6, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

@end
