@implementation GKPlayer(UIPrivate)

- (void)showAlertWithTitle:()UIPrivate andMessage:
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__GKPlayer_UIPrivate__showAlertWithTitle_andMessage___block_invoke;
  v9[3] = &unk_1E59C4708;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

- (void)showConfirmationAlertWithTitle:()UIPrivate message:buttonTitle:block:cancelAction:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__GKPlayer_UIPrivate__showConfirmationAlertWithTitle_message_buttonTitle_block_cancelAction___block_invoke;
  block[3] = &unk_1E59C8B68;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

+ (uint64_t)sizeForPhotoSize:()UIPrivate
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (a3)
  {
    if (a3 != 1)
    {
      if (a3 == 0x10000)
        return 64;
      else
        return 128;
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    v6 = v10 == 1;
    v7 = 256;
    v8 = 512;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v6 = v5 == 1;
    v7 = 128;
    v8 = 256;
  }
  if (v6)
    return v8;
  else
    return v7;
}

- (id)photoURLForSize:()UIPrivate
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", a3);
  objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "greatestScreenScale");
  objc_msgSend(v5, "_gkImageURLForSize:scale:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (__CFString)stringForMonogram
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;

  v2 = objc_msgSend(a1, "isAutomatchPlayer");
  objc_msgSend(a1, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v2)
  {
    objc_msgSend(v3, "alias");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(a1, "internal");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alias");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_firstGrapheme");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    v4 = (void *)objc_opt_new();
    objc_msgSend(a1, "internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGivenName:", v13);

    objc_msgSend(a1, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFamilyName:", v15);

    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setStyle:", 4);
    objc_msgSend(v7, "stringFromPersonNameComponents:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length") && (unint64_t)objc_msgSend(v16, "length") <= 2)
    {
      v17 = v16;
    }
    else
    {
      if (!objc_msgSend(v16, "length"))
      {
        objc_msgSend(a1, "internal");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "compositeName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          objc_msgSend(a1, "internal");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "compositeName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_firstGrapheme");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (!*MEMORY[0x1E0D25460])
            v23 = (id)GKOSLoggers();
          v24 = *MEMORY[0x1E0D25450];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
            -[GKPlayer(UIPrivate) stringForMonogram].cold.1(v24);
          v10 = CFSTR(" ");
        }
        goto LABEL_13;
      }
      objc_msgSend(v16, "_firstGrapheme");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v17;
LABEL_13:

    goto LABEL_6;
  }
  v5 = objc_msgSend(v3, "automatchPosition");
  v6 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromNumber:numberStyle:", v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v10 = (__CFString *)v8;
LABEL_6:

  return v10;
}

- (id)placeholderImageWithPhotoSize:()UIPrivate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  id v14;

  v3 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", a3);
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderSourceWithDimension:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cachedImageForIdentifier:", CFSTR("placeholders"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C97450]);
    objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSettings:", v8);

    objc_msgSend(v9, "placeholderImageProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)v3;
    objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "greatestScreenScale");
    objc_msgSend(v10, "imageForSize:scale:style:", 0, v11, v11, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (id)objc_msgSend(v5, "processAndCacheImage:forIdentifier:", v6, CFSTR("placeholders"));
  }

  return v6;
}

- (id)renderingScopeForPhotoSize:()UIPrivate colorIndex:
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__GKPlayer_UIPrivate__renderingScopeForPhotoSize_colorIndex___block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = a1;
  if (renderingScopeForPhotoSize_colorIndex__onceToken != -1)
    dispatch_once(&renderingScopeForPhotoSize_colorIndex__onceToken, block);
  objc_msgSend((id)renderingScopeForPhotoSize_colorIndex__sAvatarImageRenderingScopes, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)renderingScopeForPhotoSize:()UIPrivate
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__GKPlayer_UIPrivate__renderingScopeForPhotoSize___block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = a1;
  if (renderingScopeForPhotoSize__onceToken != -1)
    dispatch_once(&renderingScopeForPhotoSize__onceToken, block);
  v4 = (void *)renderingScopeForPhotoSize__sAvatarImageRenderingScopes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)avatarImageRenderer
{
  if (avatarImageRenderer_onceToken != -1)
    dispatch_once(&avatarImageRenderer_onceToken, &__block_literal_global_53);
  return (id)avatarImageRenderer_sImageRenderer;
}

- (void)renderMonogramImageWithPhotoSize:()UIPrivate monogramString:handler:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKPlayer+UI.m", 347, "-[GKPlayer(UIPrivate) renderMonogramImageWithPhotoSize:monogramString:handler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke;
    v17[3] = &unk_1E59C7BF0;
    v17[4] = a1;
    v20 = a3;
    v18 = v8;
    v19 = v12;
    objc_msgSend(v19, "perform:", v17);

  }
  if (v9)
  {
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __79__GKPlayer_UIPrivate__renderMonogramImageWithPhotoSize_monogramString_handler___block_invoke_3;
    v14[3] = &unk_1E59C4D80;
    v16 = v9;
    v15 = v12;
    objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v14);

  }
}

- (id)monogramColorIndex
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  objc_msgSend(a1, "internal");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "playerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("G")))
    {

LABEL_6:
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");
      objc_msgSend(MEMORY[0x1E0D70A78], "availableColors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", v10 % objc_msgSend(v11, "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("U"));

    v5 = 0;
    if (v7)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
  }
LABEL_7:

  return v5;
}

+ (id)monogramQueue
{
  if (monogramQueue_onceToken != -1)
    dispatch_once(&monogramQueue_onceToken, &__block_literal_global_35_0);
  return (id)monogramQueue_sMonogramQueue;
}

- (void)monogramImageWithPhotoSize:()UIPrivate handler:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  uint64_t v38;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKPlayer+UI.m", 412, "-[GKPlayer(UIPrivate) monogramImageWithPhotoSize:handler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchGroupWithName:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", a3);
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "monogramSourceWithDimension:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "isAutomatchPlayer"))
  {
    objc_msgSend(a1, "internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "automatchPosition");
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("-%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingString:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v19;
  }
  GKAvatarSubdirectoryNameForPlayerID();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "internal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "alias");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v23, "hash"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("_%@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke;
  v34[3] = &unk_1E59C8C48;
  v34[4] = a1;
  v27 = v11;
  v35 = v27;
  v28 = v25;
  v36 = v28;
  v29 = v30;
  v37 = v29;
  v38 = a3;
  objc_msgSend(v29, "perform:", v34);
  if (v6)
  {
    v31[0] = v26;
    v31[1] = 3221225472;
    v31[2] = __58__GKPlayer_UIPrivate__monogramImageWithPhotoSize_handler___block_invoke_5;
    v31[3] = &unk_1E59C4D80;
    v33 = v6;
    v32 = v29;
    objc_msgSend(v32, "notifyOnMainQueueWithBlock:", v31);

  }
}

- (void)playerAvatarDataWithSize:()UIPrivate completionHandler:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__GKPlayer_UIPrivate__playerAvatarDataWithSize_completionHandler___block_invoke;
  v8[3] = &unk_1E59C8C70;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_playerAvatarWithSize:completionHandler:", a3, v8);

}

- (void)playerAvatarImageWithSize:()UIPrivate completionHandler:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__GKPlayer_UIPrivate__playerAvatarImageWithSize_completionHandler___block_invoke;
  v8[3] = &unk_1E59C8C70;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_playerAvatarWithSize:completionHandler:", a3, v8);

}

- (void)_playerAvatarWithSize:()UIPrivate completionHandler:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  UIImage *v23;
  NSObject *v24;
  NSObject **v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  _QWORD v44[5];
  id v45;
  uint64_t v46;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKPlayer+UI.m", 479, "-[GKPlayer(UIPrivate) _playerAvatarWithSize:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", a1, CFSTR("reference"));
  objc_msgSend(a1, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(a1, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contact");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playerID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    if (objc_msgSend(a1, "hasPhoto"))
    {
      v44[0] = v16;
      v44[1] = 3221225472;
      v44[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke;
      v44[3] = &unk_1E59C6038;
      v44[4] = a1;
      v46 = a3;
      v45 = v9;
      objc_msgSend(v45, "perform:", v44);
      v17 = v45;
LABEL_11:

      goto LABEL_18;
    }
    objc_msgSend(v12, "thumbnailImageData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v41[0] = v16;
      v41[1] = 3221225472;
      v41[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_48;
      v41[3] = &unk_1E59C6038;
      v41[4] = a1;
      v43 = a3;
      v42 = v9;
      objc_msgSend(v42, "perform:", v41);
      v17 = v42;
      goto LABEL_11;
    }
    v19 = objc_alloc_init(MEMORY[0x1E0D25AD8]);
    v20 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v12, "thumbnailImageData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_gkImageWithCheckedData:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v19, "setImage:", v22);
      objc_msgSend(v12, "thumbnailImageData");
      v23 = (UIImage *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImageData:", v23);
    }
    else
    {
      v24 = *MEMORY[0x1E0D25460];
      if (!*MEMORY[0x1E0D25460])
      {
        v25 = (NSObject **)MEMORY[0x1E0D25460];
        v26 = (id)GKOSLoggers();
        v24 = *v25;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[GKPlayer(UIPrivate) _playerAvatarWithSize:completionHandler:].cold.1(v24, v27, v28, v29, v30, v31, v32, v33);
      objc_msgSend(a1, "placeholderImageWithPhotoSize:", a3);
      v23 = (UIImage *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImage:", v23);
      UIImagePNGRepresentation(v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImageData:", v34);

    }
    objc_msgSend(v9, "setResult:", v19);

  }
LABEL_18:
  v37[0] = v16;
  v37[1] = 3221225472;
  v37[2] = __63__GKPlayer_UIPrivate___playerAvatarWithSize_completionHandler___block_invoke_2;
  v37[3] = &unk_1E59C4620;
  v39 = a1;
  v40 = v6;
  v38 = v9;
  v35 = v9;
  v36 = v6;
  objc_msgSend(v35, "notifyOnMainQueueWithBlock:", v37);

}

- (void)clearInMemoryCachedAvatars
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "internal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKAvatarSubdirectoryNameForPlayerID();
    v10 = (id)objc_claimAutoreleasedReturnValue();

    for (i = 0; i != 4; ++i)
    {
      v7 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", qword_1AB7F8550[i]);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "avatarSourceWithDimension:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "clearCachedImageForIdentifier:", v10);
    }

  }
}

+ (uint64_t)preloadImagesForPlayers:()UIPrivate size:
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__GKPlayer_UIPrivate__preloadImagesForPlayers_size___block_invoke;
  v5[3] = &__block_descriptor_40_e25_v32__0__GKPlayer_8Q16_B24l;
  v5[4] = a4;
  return objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);
}

- (void)loadPlayerContactForAvatarControllerWithImageSize:()UIPrivate completion:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKPlayer+UI.m", 580, "-[GKPlayer(UIPrivate) loadPlayerContactForAvatarControllerWithImageSize:completion:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke;
  v21[3] = &unk_1E59C6038;
  v21[4] = a1;
  v23 = a3;
  v11 = v9;
  v22 = v11;
  objc_msgSend(v11, "perform:", v21);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_3;
  v19[3] = &unk_1E59C41C0;
  v19[4] = a1;
  v12 = v11;
  v20 = v12;
  objc_msgSend(v12, "perform:", v19);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __84__GKPlayer_UIPrivate__loadPlayerContactForAvatarControllerWithImageSize_completion___block_invoke_4;
  v15[3] = &unk_1E59C41E8;
  v17 = a1;
  v18 = v6;
  v16 = v12;
  v13 = v6;
  v14 = v12;
  objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v15);

}

- (void)stringForMonogram
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "stringForMonogram - No usable monogram string for the player", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_playerAvatarWithSize:()UIPrivate completionHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, a1, a3, "_playerAvatarWithSize: Failed to create image with thumbnailImageData, fall back to monogram", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
