@implementation UIImage

void __54__UIImage_GKAchievementProgress___gkQuestionMarkImage__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "achievementsNotStartedIcon");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_gkQuestionMarkImage_sImage;
  _gkQuestionMarkImage_sImage = v0;

}

uint64_t __68__UIImage_GKAchievementProgress___gkMaskImageWithProgress_isDetail___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_gkMaskImageWithProgress_isDetail__sMaskCache;
  _gkMaskImageWithProgress_isDetail__sMaskCache = (uint64_t)v0;

  objc_msgSend((id)_gkMaskImageWithProgress_isDetail__sMaskCache, "setName:", CFSTR("com.apple.gamekit.achievement-progress-mask.cache"));
  return objc_msgSend((id)_gkMaskImageWithProgress_isDetail__sMaskCache, "setCountLimit:", 20);
}

void __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_2;
  v9[3] = &unk_1E59C8BF8;
  v10 = *(id *)(a1 + 48);
  v14 = v3;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v15 = v7;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v8 = v3;
  objc_msgSend(v4, "cachedImageFromGamedWithSubdirectory:handler:", v5, v9);

}

void __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_3;
    v6[3] = &unk_1E59C8060;
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 72);
    v7 = v4;
    v12 = v5;
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 64);
    dispatch_async(v3, v6);

  }
}

void __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  _QWORD v11[2];
  CGSize v12;

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMSPIGetGroupPhotosForChatsWithGroupIDs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_gkImageWithCheckedData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (double)*(uint64_t *)(a1 + 72);
      objc_msgSend(v5, "scale");
      v9 = v8;
      v12.width = v7;
      v12.height = v7;
      UIGraphicsBeginImageContextWithOptions(v12, 0, v9);
      objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v7, v7);
      UIGraphicsGetImageFromCurrentImageContext();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 40), "setResult:", v10);
        objc_msgSend(*(id *)(a1 + 48), "cacheImageUsingGamed:cacheSubdirectory:withHandler:", v10, *(_QWORD *)(a1 + 56), 0);

      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
