@implementation SFDownloadIconCache

void __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke_2;
  v4[3] = &unk_1E4AC7420;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_copyWeak(&v6, (id *)(a1 + 56));
  objc_msgSend(v2, "_generateThumbnailForURL:completionHandler:", v3, v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke_3;
  block[3] = &unk_1E4AC73F8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __75___SFDownloadIconCache__startThumbnailRequestForSource_reportGenericIcons___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v3)
      objc_msgSend(v4, "_didGenerateThumbnail:forSource:", *(_QWORD *)(a1 + 32), v3);

    WeakRetained = v4;
  }

}

void __67___SFDownloadIconCache__generateThumbnailForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67___SFDownloadIconCache__generateThumbnailForURL_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4AC1338;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __67___SFDownloadIconCache__generateThumbnailForURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "UIImage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
