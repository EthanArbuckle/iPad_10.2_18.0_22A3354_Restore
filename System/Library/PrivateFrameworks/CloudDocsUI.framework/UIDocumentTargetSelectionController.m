@implementation UIDocumentTargetSelectionController

uint64_t __55___UIDocumentTargetSelectionController_viewWillAppear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupPalette");
  return objc_msgSend(*(id *)(a1 + 32), "_setupNavigationItem");
}

uint64_t __48___UIDocumentTargetSelectionController_dismiss___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "finishObserving");
}

id __54___UIDocumentTargetSelectionController__updatePalette__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  objc_msgSend(a2, "ui_resolveOnDiskBookmarkAndPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "getPromisedItemResourceValue:forKey:error:", &v9, *MEMORY[0x24BDBCCC0], 0);
  v4 = v9;
  v5 = v4;
  if (v3)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "lastPathComponent");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

void __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = *MEMORY[0x24BDF65F8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithAttributes:", v5);
  v7 = v6;
  v8 = *(double *)(a1 + 40);

  if (v7 < v8)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setText:", v3);

}

void __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_4;
  block[3] = &unk_24E43AFE8;
  v4 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v5);
}

void __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  _QWORD block[5];
  id v6;
  char v7;
  __int16 v8;

  v8 = 0;
  +[_UIDocumentTargetSelectionController _loadThumbnailForURL:size:scale:wantsBorder:generatedThumbnail:](_UIDocumentTargetSelectionController, "_loadThumbnailForURL:size:scale:wantsBorder:generatedThumbnail:", *(_QWORD *)(a1 + 32), (char *)&v8 + 1, &v8, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && (_BYTE)v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_5;
    block[3] = &unk_24E43AFC0;
    block[4] = WeakRetained;
    v6 = v2;
    v7 = HIBYTE(v8);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __54___UIDocumentTargetSelectionController__updatePalette__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setIconViewImage:border:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

@end
