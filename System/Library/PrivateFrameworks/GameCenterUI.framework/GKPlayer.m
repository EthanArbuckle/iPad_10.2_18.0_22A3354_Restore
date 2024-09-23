@implementation GKPlayer

void __53__GKPlayer_UIPrivate__showAlertWithTitle_andMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3F20], "_gkKeyWindowRootViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "_gkPresentAlertWithTitle:message:buttonTitle:", v3, v2, v5);

}

void __93__GKPlayer_UIPrivate__showConfirmationAlertWithTitle_message_buttonTitle_block_cancelAction___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3F20], "_gkKeyWindowRootViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "_gkPresentConfirmationAlertWithTitle:message:buttonTitle:block:cancelAction:", a1[4], a1[5], a1[6], a1[7], a1[8]);

}

void __61__GKPlayer_UIPrivate__renderingScopeForPhotoSize_colorIndex___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  _QWORD v26[4];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(MEMORY[0x1E0D70A78], "availableColors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v0)
  {
    v1 = v0;
    v2 = *(_QWORD *)v22;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v22 != v2)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v3);
        objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "greatestScreenScale");
        v7 = v6;

        v8 = GKShouldLayoutRTL();
        v9 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", 0);
        objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:color:", v8, 0, v4, (double)v9, (double)v9, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", 1);
        objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:color:", v8, 0, v4, (double)v11, (double)v11, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", 0x10000);
        objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:color:", v8, 0, v4, (double)v13, (double)v13, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", 65537);
        objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:color:", v8, 0, v4, (double)v15, (double)v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = &unk_1E5A5E5C8;
        v25[1] = &unk_1E5A5E5E0;
        v26[0] = v10;
        v26[1] = v12;
        v25[2] = &unk_1E5A5E5F8;
        v25[3] = &unk_1E5A5E610;
        v26[2] = v14;
        v26[3] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v17);

        ++v3;
      }
      while (v1 != v3);
      v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v1);
  }

  v18 = (void *)renderingScopeForPhotoSize_colorIndex__sAvatarImageRenderingScopes;
  renderingScopeForPhotoSize_colorIndex__sAvatarImageRenderingScopes = (uint64_t)v20;

}

void __50__GKPlayer_UIPrivate__renderingScopeForPhotoSize___block_invoke()
{
  void *v0;
  double v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "greatestScreenScale");
  v2 = v1;

  v3 = GKShouldLayoutRTL();
  v4 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", 0);
  objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v3, 0, (double)v4, (double)v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", 1);
  objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v3, 0, (double)v6, (double)v6, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", 0x10000);
  objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v3, 0, (double)v8, (double)v8, v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", 65537);
  objc_msgSend(MEMORY[0x1E0C97460], "scopeWithPointSize:scale:rightToLeft:style:", v3, 0, (double)v10, (double)v10, v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = &unk_1E5A5E5C8;
  v14[1] = &unk_1E5A5E5E0;
  v15[0] = v5;
  v15[1] = v7;
  v14[2] = &unk_1E5A5E5F8;
  v14[3] = &unk_1E5A5E610;
  v15[2] = v9;
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)renderingScopeForPhotoSize__sAvatarImageRenderingScopes;
  renderingScopeForPhotoSize__sAvatarImageRenderingScopes = v12;

}

void __42__GKPlayer_UIPrivate__avatarImageRenderer__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C97450]);
  objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithSettings:", v3);
  v2 = (void *)avatarImageRenderer_sImageRenderer;
  avatarImageRenderer_sImageRenderer = v1;

}

void __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "monogramColorIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "renderingScopeForPhotoSize:colorIndex:", *(_QWORD *)(a1 + 56), objc_msgSend(v4, "integerValue"));
  else
    objc_msgSend(*(id *)(a1 + 32), "renderingScopeForPhotoSize:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avatarImageRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke_2;
  v11[3] = &unk_1E59C5CB0;
  v8 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = v3;
  v9 = v3;
  v10 = (id)objc_msgSend(v7, "renderMonogramForString:scope:imageHandler:", v8, v6, v11);

}

uint64_t __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __36__GKPlayer_UIPrivate__monogramQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.gamecenter.monogramqueue", MEMORY[0x1E0C80D50]);
  v1 = (void *)monogramQueue_sMonogramQueue;
  monogramQueue_sMonogramQueue = (uint64_t)v0;

}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "monogramQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_2;
  v9[3] = &unk_1E59C8C20;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v7 = *(_QWORD *)(a1 + 64);
  v14 = v3;
  v15 = v7;
  v8 = v3;
  dispatch_async(v4, v9);

}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_3;
  v6[3] = &unk_1E59C8BF8;
  v7 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v11 = v4;
  v12 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "cachedImageFromGamedWithSubdirectory:handler:", v3, v6);

}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "stringForMonogram");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 72);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_4;
    v6[3] = &unk_1E59C8BD0;
    v5 = *(void **)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v5, "renderMonogramImageWithPhotoSize:monogramString:handler:", v4, v3, v6);

  }
}

uint64_t __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "setResult:", v4);
    objc_msgSend(*(id *)(a1 + 40), "cacheImageUsingGamed:cacheSubdirectory:withHandler:", v4, *(_QWORD *)(a1 + 48), 0);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __66__GKPlayer_UIPrivate__playerAvatarDataWithSize_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  objc_msgSend(a2, "imageData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v8, a3, v7);

}

void __67__GKPlayer_UIPrivate__playerAvatarImageWithSize_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  objc_msgSend(a2, "image");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v8, a3, v7);

}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  NSObject **v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(_QWORD);
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "photoURLForSize:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSObject **)MEMORY[0x1E0D25460];
  v6 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v7 = (id)GKOSLoggers();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_cold_1((uint64_t)v4, v6);
    if (v4)
      goto LABEL_5;
  }
  else if (v4)
  {
LABEL_5:
    v8 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKAvatarSubdirectoryNameForPlayerID();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "avatarSourceWithDimension:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(33, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_44;
    v22[3] = &unk_1E59C8C98;
    v15 = *(_QWORD *)(a1 + 32);
    v23 = *(id *)(a1 + 40);
    v24 = v3;
    objc_msgSend(v13, "loadAndCacheAvatarFromGamedForURLString:useUIImage:cacheSubdirectory:reference:queue:handler:", v4, 1, v11, v15, v14, v22);

    goto LABEL_12;
  }
  v16 = *v5;
  if (!*v5)
  {
    v17 = (id)GKOSLoggers();
    v16 = *v5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = *(void **)(a1 + 32);
    v19 = v16;
    objc_msgSend(v18, "alias");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v20;
    v27 = 2112;
    v28 = v21;
    _os_log_impl(&dword_1AB361000, v19, OS_LOG_TYPE_INFO, "%@ has no photo url for photo size: %@", buf, 0x16u);

  }
  v3[2](v3);
LABEL_12:

}

uint64_t __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_44(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_48(_QWORD *a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v3 = a2;
  v4 = (NSObject **)MEMORY[0x1E0D25460];
  v5 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v6 = (id)GKOSLoggers();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_48_cold_1(v5, v7, v8, v9, v10, v11, v12, v13);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_49;
  v17[3] = &unk_1E59C8CC0;
  v14 = (void *)a1[5];
  v15 = a1[6];
  v18 = (id)a1[4];
  v21 = v15;
  v19 = v14;
  v20 = v3;
  v16 = v3;
  objc_msgSend(v18, "monogramImageWithPhotoSize:handler:", v15, v17);

}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  UIImage *image;
  UIImage *imagea;

  image = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0D25AD8]);
  v4 = (uint64_t)image;
  v5 = v3;
  if (!image)
  {
    objc_msgSend(*(id *)(a1 + 32), "placeholderImageWithPhotoSize:", *(_QWORD *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  imagea = (UIImage *)v4;
  objc_msgSend(v5, "setImage:", v4);
  UIImagePNGRepresentation(imagea);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageData:", v6);

  objc_msgSend(*(id *)(a1 + 40), "setResult:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "avatarType");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("reference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, void *))(v2 + 16))(v2, v5, v3, v4);

}

uint64_t __52__GKPlayer_UIPrivate__preloadImagesForPlayers_size___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "playerAvatarImageWithSize:completionHandler:", *(_QWORD *)(a1 + 32), &__block_literal_global_51);
}

void __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_2;
  v7[3] = &unk_1E59C8D48;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "_playerAvatarWithSize:completionHandler:", v5, v7);

}

void __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  UIImage *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v7, "imageData");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v4);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v7, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "image");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v6);

    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGivenName:", v5);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, CFSTR("contact"));
  v3[2](v3);

}

void __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("contact"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageData:", v2);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __55__GKPlayer_UI__loadPhotoForSize_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__GKPlayer_UI__loadPhotoForSize_withCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E59C4D80;
    v6 = *(id *)(a1 + 40);
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_loadPhotoForSize:withCompletionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

uint64_t __55__GKPlayer_UI__loadPhotoForSize_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E59C8D98;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = *(_QWORD *)(a1 + 48);
  v13 = v3;
  v14 = v8;
  v9 = v3;
  objc_msgSend(v4, "playerAvatarImageWithSize:completionHandler:", v5, v10);

}

void __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_3;
    v5[3] = &unk_1E59C5CB0;
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "monogramImageWithPhotoSize:handler:", v3, v5);

  }
}

uint64_t __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 26, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v4, v5);

}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AB361000, a2, OS_LOG_TYPE_DEBUG, "_playerAvatarWithSize: Player has an avatar image (%@), thus load that image", (uint8_t *)&v2, 0xCu);
}

void __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_48_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, a1, a3, "_playerAvatarWithSize: Fall back to monogram if no image to load for player", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
