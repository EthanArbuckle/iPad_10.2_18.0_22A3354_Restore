@implementation GKGame

uint64_t __91__GKGame_GKSpringboardSupport__removeHistoryForGameWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setOutputSize:", 87.0, 87.0);
  objc_msgSend(*(id *)(a1 + 40), "networkImageSourceWithName:imageBrush:", CFSTR("DWIconsSharing"), *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)imageSourceForiOSIconStyle__sharingImageSource;
  imageSourceForiOSIconStyle__sharingImageSource = v2;

}

void __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("DWIconsList"), *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)imageSourceForiOSIconStyle__sImageSource;
  imageSourceForiOSIconStyle__sImageSource = v1;

}

void __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("DWIconsDetail"), *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)imageSourceForiOSIconStyle__sImageSource_10;
  imageSourceForiOSIconStyle__sImageSource_10 = v1;

}

void __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D25AE8], "brush");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("DWIconsMessage"), v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)imageSourceForiOSIconStyle__sImageSource_14;
  imageSourceForiOSIconStyle__sImageSource_14 = v2;

}

void __38__GKGame_UI___imageSourceForIconSize___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("app-icon-64"), *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_imageSourceForIconSize__source64;
  _imageSourceForIconSize__source64 = v1;

}

void __38__GKGame_UI___imageSourceForIconSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("app-icon-128"), *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_imageSourceForIconSize__source128;
  _imageSourceForIconSize__source128 = v1;

}

void __38__GKGame_UI___imageSourceForIconSize___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("app-icon-256"), *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_imageSourceForIconSize__source256;
  _imageSourceForIconSize__source256 = v1;

}

void __38__GKGame_UI___imageSourceForIconSize___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("app-icon-512"), *(_QWORD *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_imageSourceForIconSize__source512;
  _imageSourceForIconSize__source512 = v1;

}

uint64_t __58__GKGame_UI__loadIconForSize_scale_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, a3, 0);
  return result;
}

uint64_t __53__GKGame_UI__loadIconForStyle_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, a3, 0);
  return result;
}

void __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke_2;
  v7[3] = &unk_1E59C56D8;
  v5 = (void *)a1[4];
  v4 = a1[5];
  v8 = v3;
  v9 = v4;
  v10 = a1[6];
  v6 = v3;
  objc_msgSend(v5, "perform:", v7);

}

void __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "imageSourceForIconStyle:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_imageURLForIconStyle:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0D252A8], "backgroundConcurrentQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke_3;
  v9[3] = &unk_1E59C56B0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "loadImageForURLString:reference:queue:handler:", v5, v6, v7, v9);

}

uint64_t __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__GKGame_UI__logoImageWithMaximumSize___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "localImageSourceWithName:imageBrush:", CFSTR("logo"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)logoImageWithMaximumSize__sImageSource;
  logoImageWithMaximumSize__sImageSource = v1;

}

uint64_t __39__GKGame_UI__logoImageWithMaximumSize___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end
