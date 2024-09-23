@implementation GKGame(UI)

- (uint64_t)isInstalled
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 0;
  objc_msgSend(MEMORY[0x1E0D25270], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "applicationIsInstalled:", v5);

  return v6;
}

- (id)utilityService
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D25298], "daemonProxy");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "utilityService");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)networkImageSourceWithName:()UI imageBrush:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0D25B10];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithName:imageBrush:", v7, v6);

  return v8;
}

- (id)localImageSourceWithName:()UI imageBrush:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0D25AF8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithName:imageBrush:", v7, v6);

  return v8;
}

+ (double)serverImageSizeForIconStyle:()UI
{
  double result;
  void *v4;
  uint64_t v5;
  void *v8;
  uint64_t v9;

  result = 128.0;
  switch(a3)
  {
    case 2:
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 128.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceIdiom");

      if (v5 != 1)
        return 128.0;
      if (*MEMORY[0x1E0D253F8] && *MEMORY[0x1E0D25B68] == 0)
        return 128.0;
      return 256.0;
    case 4:
    case 5:
    case 6:
    case 7:
      return result;
    case 8:
    case 10:
      return 64.0;
    case 9:
      return 256.0;
    default:
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 128.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceIdiom");

      if (v9 != 1)
        return 64.0;
      if (*MEMORY[0x1E0D253F8] && *MEMORY[0x1E0D25B68] == 0)
        return 64.0;
      else
        return 128.0;
  }
}

- (id)_imageURLForIconStyle:()UI
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "serverImageSizeForIconStyle:", a3);
  v5 = v4;
  objc_msgSend(a1, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "greatestScreenScale");
  objc_msgSend(v7, "_gkImageURLForSize:scale:", (uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)imageSourceForiOSIconStyle:()UI
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD block[5];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0D25B58], "brush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 > 9)
    goto LABEL_14;
  if (((1 << a3) & 0x6C) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_3;
    block[3] = &unk_1E59C4708;
    block[4] = a1;
    v12 = v5;
    if (imageSourceForiOSIconStyle__onceToken_11 != -1)
      dispatch_once(&imageSourceForiOSIconStyle__onceToken_11, block);
    v7 = (id)imageSourceForiOSIconStyle__sImageSource_10;
    v8 = v12;
LABEL_17:

    goto LABEL_18;
  }
  if (a3 == 7)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke;
    v15[3] = &unk_1E59C4708;
    v16 = v5;
    v17 = a1;
    if (imageSourceForiOSIconStyle__onceToken != -1)
      dispatch_once(&imageSourceForiOSIconStyle__onceToken, v15);
    v7 = (id)imageSourceForiOSIconStyle__sharingImageSource;
    v8 = v16;
    goto LABEL_17;
  }
  if (a3 != 9)
  {
LABEL_14:
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_2;
    v13[3] = &unk_1E59C4708;
    v13[4] = a1;
    v14 = v5;
    if (imageSourceForiOSIconStyle__onceToken_7 != -1)
      dispatch_once(&imageSourceForiOSIconStyle__onceToken_7, v13);
    v7 = (id)imageSourceForiOSIconStyle__sImageSource;
    v8 = v14;
    goto LABEL_17;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_4;
  v10[3] = &unk_1E59C4148;
  v10[4] = a1;
  if (imageSourceForiOSIconStyle__onceToken_15 != -1)
    dispatch_once(&imageSourceForiOSIconStyle__onceToken_15, v10);
  v7 = (id)imageSourceForiOSIconStyle__sImageSource_14;
LABEL_18:

  return v7;
}

- (id)macBrushForIconStyle:()UI
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D25B08], "brush");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serverImageSizeForIconStyle:", a3);
  objc_msgSend(v4, "setOutputSize:");
  return v4;
}

- (id)imageSourceForIconStyle:()UI
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "imageSourceForiOSIconStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "platform") == 2)
  {
    objc_msgSend(a1, "macBrushForIconStyle:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "macGameIconSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "subsourceWithBrush:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)iconForStyle:()UI
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_imageURLForIconStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageSourceForIconStyle:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedImageForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cachedIconForStyle:()UI
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_imageURLForIconStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageSourceForIconStyle:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fastCachedOrDefaultImageForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)URLStringForImageWithShineIfNeeded
{
  return objc_msgSend(a1, "_imageURLForIconStyle:", 0);
}

- (id)_imageSourceForIconSize:()UI
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  uint64_t *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[5];
  id v23;

  if (a2 != a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKGame+UI.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (size.width == size.height)\n[%s (%s:%d)]"), v6, "-[GKGame(UI) _imageSourceForIconSize:]", objc_msgSend(v8, "UTF8String"), 241);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  objc_msgSend(MEMORY[0x1E0D25B50], "brush");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a2 <= 64.0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__GKGame_UI___imageSourceForIconSize___block_invoke;
    block[3] = &unk_1E59C4708;
    block[4] = a1;
    v12 = &v23;
    v23 = v10;
    if (_imageSourceForIconSize__onceToken != -1)
      dispatch_once(&_imageSourceForIconSize__onceToken, block);
    v13 = &_imageSourceForIconSize__source64;
  }
  else if (a2 <= 128.0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __38__GKGame_UI___imageSourceForIconSize___block_invoke_2;
    v20[3] = &unk_1E59C4708;
    v20[4] = a1;
    v12 = &v21;
    v21 = v10;
    if (_imageSourceForIconSize__onceToken_35 != -1)
      dispatch_once(&_imageSourceForIconSize__onceToken_35, v20);
    v13 = &_imageSourceForIconSize__source128;
  }
  else if (a2 <= 256.0)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __38__GKGame_UI___imageSourceForIconSize___block_invoke_3;
    v18[3] = &unk_1E59C4708;
    v18[4] = a1;
    v12 = &v19;
    v19 = v10;
    if (_imageSourceForIconSize__onceToken_38 != -1)
      dispatch_once(&_imageSourceForIconSize__onceToken_38, v18);
    v13 = &_imageSourceForIconSize__source256;
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__GKGame_UI___imageSourceForIconSize___block_invoke_4;
    v16[3] = &unk_1E59C4708;
    v16[4] = a1;
    v12 = &v17;
    v17 = v10;
    if (_imageSourceForIconSize__onceToken_41 != -1)
      dispatch_once(&_imageSourceForIconSize__onceToken_41, v16);
    v13 = &_imageSourceForIconSize__source512;
  }
  v14 = (id)*v13;

  return v14;
}

- (id)loadIconForSize:()UI scale:withCompletionHandler:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v10 = a6;
  objc_msgSend(a1, "_imageSourceForIconSize:", a2 * a4, a3 * a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "icons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a4 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "greatestScreenScale");
    objc_msgSend(v14, "_gkImageURLForSize:scale:", (uint64_t)a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v13, "_gkImageURLForSize:scale:", (uint64_t)a2, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__GKGame_UI__loadIconForSize_scale_withCompletionHandler___block_invoke;
  v20[3] = &unk_1E59C56B0;
  v21 = v10;
  v17 = v10;
  objc_msgSend(v11, "loadImageForURLString:reference:queue:handler:", v16, a1, MEMORY[0x1E0C80D38], v20);
  objc_msgSend(v11, "fastCachedImageForIdentifier:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)loadIconForStyle:()UI withCompletionHandler:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  objc_msgSend(a1, "imageSourceForIconStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageURLForIconStyle:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__GKGame_UI__loadIconForStyle_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E59C56B0;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v7, "loadImageForURLString:reference:queue:handler:", v8, a1, MEMORY[0x1E0C80D38], v12);
  objc_msgSend(v7, "fastCachedImageForIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)preloadIconsForGames:()UI style:handler:
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;

  v14 = a5;
  v8 = (void *)MEMORY[0x1E0D252A8];
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a3;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKGame+UI.m", 320, "+[GKGame(UI) preloadIconsForGames:style:handler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke;
  v15[3] = &unk_1E59C5700;
  v13 = v12;
  v16 = v13;
  v17 = a4;
  v18 = a1;
  objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 1, v15);

  if (v14)
    objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v14);

}

- (id)logoImageWithMaximumSize:()UI
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSObject **v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject **v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  double v47;
  double v48;
  _QWORD block[5];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__GKGame_UI__logoImageWithMaximumSize___block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = a1;
  if (logoImageWithMaximumSize__onceToken != -1)
    dispatch_once(&logoImageWithMaximumSize__onceToken, block);
  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-logo(%g,%g)"), v7, *(_QWORD *)&a2, *(_QWORD *)&a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)logoImageWithMaximumSize__sImageSource, "cachedImageForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D25270], "defaultWorkspace");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "applicationProxyForBundleID:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "infoDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("GKDashboardLogo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "pathForResource:ofType:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithContentsOfFile:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v9 = v15;
          objc_msgSend(v15, "size");
          if (v17 > a3)
          {
            v18 = v16 * (a3 / v17);
            v43 = (void *)MEMORY[0x1E0D25AF0];
            v45[0] = v5;
            v45[1] = 3221225472;
            v45[2] = __39__GKGame_UI__logoImageWithMaximumSize___block_invoke_59;
            v45[3] = &unk_1E59C5728;
            v46 = v9;
            v47 = v18;
            v48 = a3;
            objc_msgSend(v43, "contextDrawnWithSize:scale:options:usingBlock:", 4, v45, v18, a3, 1.0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)logoImageWithMaximumSize__sImageSource, "cacheImageFromContext:forIdentifier:", v19, v8);

          }
LABEL_24:

          goto LABEL_25;
        }
        v30 = (NSObject **)MEMORY[0x1E0D25460];
        v31 = *MEMORY[0x1E0D25460];
        if (!*MEMORY[0x1E0D25460])
        {
          v32 = (id)GKOSLoggers();
          v31 = *v30;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[GKGame(UI) logoImageWithMaximumSize:].cold.2((uint64_t)v14, v31, v33, v34, v35, v36, v37, v38);
      }
      else
      {
        v20 = (NSObject **)MEMORY[0x1E0D25460];
        v21 = *MEMORY[0x1E0D25460];
        if (!*MEMORY[0x1E0D25460])
        {
          v22 = (id)GKOSLoggers();
          v21 = *v20;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[GKGame(UI) logoImageWithMaximumSize:].cold.1(v21, v23, v24, v25, v26, v27, v28, v29);
      }

    }
    if (!*MEMORY[0x1E0D25460])
      v39 = (id)GKOSLoggers();
    v40 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v51 = v10;
      v52 = 2112;
      v53 = v11;
      v54 = 2048;
      v55 = v12;
      v56 = 2112;
      v57 = v13;
      _os_log_error_impl(&dword_1AB361000, v40, OS_LOG_TYPE_ERROR, "Logo image missing: proxy:%@ bundle:%@ dict:%p resourceName:%@", buf, 0x2Au);
    }
    v9 = 0;
    goto LABEL_24;
  }
LABEL_25:
  v41 = v9;

  return v41;
}

+ (__CFString)platformDisplayString:()UI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D25210])
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D25218]))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@, %@"), v6, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D251F8])
      && !objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D25200])
      && !objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D25208]))
    {
      v9 = &stru_1E59EB978;
      goto LABEL_10;
    }
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v9;
}

- (void)logoImageWithMaximumSize:()UI .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, a1, a3, "Logo image resource missing:%@", a5, a6, a7, a8, 2u);
}

- (void)logoImageWithMaximumSize:()UI .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AB361000, a2, a3, "Couldn't load image resource at path:%@", a5, a6, a7, a8, 2u);
}

@end
