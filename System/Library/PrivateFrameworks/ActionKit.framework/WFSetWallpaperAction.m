@implementation WFSetWallpaperAction

- (BOOL)inputPassthrough
{
  return !-[WFSetWallpaperAction supportsPosters](self, "supportsPosters");
}

- (BOOL)showPreview
{
  void *v2;
  char v3;

  -[WFSetWallpaperAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWallpaperShowPreview"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)supportsPosters
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCapability:", *MEMORY[0x24BEC1868]);

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[WFSetWallpaperAction supportsPosters](self, "supportsPosters"))
  {
    getWFActionsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]";
      _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_DEFAULT, "%s Device supports posters, going down modern wallpaper path (v4)", buf, 0xCu);
    }

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke;
    v6[3] = &unk_24F8B9510;
    v6[4] = self;
    -[WFSetWallpaperAction buildWallpaperConfigurationFromCollection:completionHandler:](self, "buildWallpaperConfigurationFromCollection:completionHandler:", v4, v6);
  }
  else
  {
    -[WFSetWallpaperAction runLegacySetWallpaperWithInput:](self, "runLegacySetWallpaperWithInput:", v4);
  }

}

- (void)cancel
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFSetWallpaperAction;
  -[WFSetWallpaperAction cancel](&v10, sel_cancel);
  if (-[WFSetWallpaperAction supportsPosters](self, "supportsPosters"))
  {
    -[WFSetWallpaperAction createdPosterConfigurationUUID](self, "createdPosterConfigurationUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = dispatch_semaphore_create(0);
      -[WFSetWallpaperAction createdPosterConfigurationUUID](self, "createdPosterConfigurationUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __30__WFSetWallpaperAction_cancel__block_invoke;
      v8[3] = &unk_24F8BB370;
      v9 = v4;
      v6 = v4;
      -[WFSetWallpaperAction deletePosterWithUUID:completionHandler:](self, "deletePosterWithUUID:completionHandler:", v5, v8);

      v7 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v6, v7);

    }
  }
}

- (void)buildWallpaperConfigurationFromCollection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __84__WFSetWallpaperAction_buildWallpaperConfigurationFromCollection_completionHandler___block_invoke;
    v15[3] = &unk_24F8B9560;
    v15[4] = self;
    v16 = v7;
    objc_msgSend(v6, "generateCollectionByCoercingToItemClasses:completionHandler:", v8, v15);

    v9 = v16;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BEC4270];
    v18[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Unable to Set Wallpaper Photo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v18[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please provide an image to set as a wallpaper."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
}

- (void)preparePosterWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  void (**v18)(_QWORD);
  _QWORD aBlock[5];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFSetWallpaperAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSelectedPoster"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    getWFActionsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]";
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_DEFAULT, "%s Using user selected, non-default poster (%@) as the target", buf, 0x16u);
    }

    (*((void (**)(id, void *, _QWORD, _QWORD))v4 + 2))(v4, v5, 0, 0);
  }
  else
  {
    v7 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_24F8BB5E0;
    aBlock[4] = self;
    v8 = v4;
    v20 = v8;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x24BDBCF50], "systemShortcutsUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BEC46B0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x24BEC3F88], "posterWithSerializedRepresentation:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(MEMORY[0x24BEC3F90]);
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke_2;
      v15[3] = &unk_24F8B95B0;
      v16 = v12;
      v17 = v8;
      v18 = v9;
      v14 = v12;
      objc_msgSend(v13, "fetchEligiblePostersWithCompletionHandler:", v15);

    }
    else
    {

      v9[2](v9);
    }

  }
}

- (void)finishAndSetCurrentPosterIfNecessary:(id)a3 isNewPoster:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WFSetWallpaperAction *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    -[WFSetWallpaperAction output](self, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

  }
  if (a4)
  {
    getWFActionsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[WFSetWallpaperAction finishAndSetCurrentPosterIfNecessary:isNewPoster:]";
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_DEFAULT, "%s Setting poster as current because criteria was met (migration case)...", buf, 0xCu);
    }

    v9 = objc_alloc_init((Class)getPRSServiceClass());
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke;
    v11[3] = &unk_24F8BB348;
    v12 = v6;
    v13 = self;
    v14 = v9;
    v10 = v9;
    objc_msgSend(v10, "fetchPosterConfigurations:", v11);

  }
  else
  {
    -[WFSetWallpaperAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (void)deletePosterWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[WFSetWallpaperAction deletePosterWithUUID:completionHandler:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting poster configuration matching UUID: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = objc_alloc_init((Class)getPRSServiceClass());
  objc_msgSend(v8, "deletePosterConfigurationsMatchingUUID:completion:", v5, v6);

}

- (void)runLegacySetWallpaperWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFActionsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[WFSetWallpaperAction currentParallaxFactor](self, "currentParallaxFactor");
    *(_DWORD *)buf = 136315650;
    v10 = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]";
    v11 = 2048;
    v12 = v6;
    v13 = 1024;
    v14 = -[WFSetWallpaperAction showPreview](self, "showPreview");
    _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_DEFAULT, "%s Setting wallpaper with options: parallaxFactor: %f, showPreview: %i", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__WFSetWallpaperAction_runLegacySetWallpaperWithInput___block_invoke;
  v8[3] = &unk_24F8B96D8;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getFileRepresentation:forType:", v8, v7);

}

- (void)setLegacyWallpaperWithImage:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  WFSetWallpaperAction *v25;
  int64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    -[WFSetWallpaperAction missingImageError](self, "missingImageError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetWallpaperAction finishRunningWithError:](self, "finishRunningWithError:", v11);
LABEL_12:

    goto LABEL_17;
  }
  v5 = -[WFSetWallpaperAction sbf_wallpaperLocationFromLocationParameter](self, "sbf_wallpaperLocationFromLocationParameter");
  if (!v5)
  {
    -[WFSetWallpaperAction readableLocationParameterValues](self, "readableLocationParameterValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetWallpaperAction invalidLocationErrorWithProvidedLocation:](self, "invalidLocationErrorWithProvidedLocation:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetWallpaperAction finishRunningWithError:](self, "finishRunningWithError:", v12);

    goto LABEL_12;
  }
  v6 = v5;
  v31 = 0;
  v32 = (uint64_t)&v31;
  v33 = 0x2020000000;
  v7 = getSBFStringForWallpaperModeSymbolLoc_ptr;
  v34 = getSBFStringForWallpaperModeSymbolLoc_ptr;
  if (!getSBFStringForWallpaperModeSymbolLoc_ptr)
  {
    v8 = SpringBoardFoundationLibrary();
    v7 = dlsym(v8, "SBFStringForWallpaperMode");
    *(_QWORD *)(v32 + 24) = v7;
    getSBFStringForWallpaperModeSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v31, 8);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *WFSBFStringForWallpaperMode(SBFWallpaperMode)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("WFSetWallpaperAction.m"), 37, CFSTR("%s"), dlerror());

    __break(1u);
  }
  ((void (*)(_QWORD))v7)(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = !-[WFSetWallpaperAction showPreview](self, "showPreview");
  if ((v6 & 0xFFFFFFFFFFFFFFFDLL) != 1)
    LOBYTE(v10) = 1;
  if ((v10 & 1) != 0)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v13 = (void *)getSBFWallpaperOptionsClass_softClass;
    v39 = getSBFWallpaperOptionsClass_softClass;
    v14 = MEMORY[0x24BDAC760];
    if (!getSBFWallpaperOptionsClass_softClass)
    {
      v31 = MEMORY[0x24BDAC760];
      v32 = 3221225472;
      v33 = (uint64_t)__getSBFWallpaperOptionsClass_block_invoke;
      v34 = &unk_24F8BB430;
      v35 = &v36;
      __getSBFWallpaperOptionsClass_block_invoke((uint64_t)&v31);
      v13 = (void *)v37[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v36, 8);
    v16 = objc_alloc_init(v15);
    objc_msgSend(v16, "setSupportsCropping:", 1);
    objc_msgSend(v16, "setPortrait:", 1);
    objc_msgSend(v16, "setHasVideo:", 0);
    -[WFSetWallpaperAction currentParallaxFactor](self, "currentParallaxFactor");
    objc_msgSend(v16, "setParallaxFactor:");
    v42 = v9;
    v43[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v9;
    v41 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_4;
    block[3] = &unk_24F8BAAB8;
    v23 = v17;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = self;
    v26 = v6;
    v18 = v24;
    v19 = v17;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke;
    v27[3] = &unk_24F8B9600;
    v27[4] = self;
    v28 = v4;
    v29 = v9;
    v30 = v6;
    -[WFSetWallpaperAction requestUnlock:](self, "requestUnlock:", v27);

  }
LABEL_17:

}

- (double)maximumSizeInPixels
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double result;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE buf[24];
  double v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)getSBFWallpaperParallaxSettingsClass_softClass;
  v23 = getSBFWallpaperParallaxSettingsClass_softClass;
  if (!getSBFWallpaperParallaxSettingsClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getSBFWallpaperParallaxSettingsClass_block_invoke;
    v25 = COERCE_DOUBLE(&unk_24F8BB430);
    v26[0] = &v20;
    __getSBFWallpaperParallaxSettingsClass_block_invoke((uint64_t)buf);
    v3 = (void *)v21[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  -[WFSetWallpaperAction currentParallaxFactor](self, "currentParallaxFactor");
  objc_msgSend(v4, "bestWallpaperSizeForParallaxFactor:");
  v6 = v5;
  v8 = v7;
  getWFActionsLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[WFSetWallpaperAction currentParallaxFactor](self, "currentParallaxFactor");
    v11 = v10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("w: %f, h: %f"), *(_QWORD *)&v6, *(_QWORD *)&v8, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[WFSetWallpaperAction maximumSizeInPixels]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    v25 = *(double *)&v12;
    _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_DEFAULT, "%s Best wallpaper size for parallax factor (%f): %{public}@", buf, 0x20u);

  }
  if (v6 == 0.0 || v8 == 0.0)
  {
    getWFActionsLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      -[WFSetWallpaperAction currentParallaxFactor](self, "currentParallaxFactor");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[WFSetWallpaperAction maximumSizeInPixels]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2048;
      v25 = v8;
      LOWORD(v26[0]) = 2048;
      *(_QWORD *)((char *)v26 + 2) = v19;
      _os_log_impl(&dword_22D353000, v18, OS_LOG_TYPE_FAULT, "%s Set Wallpaper: unexpected canvasSize (%f, %f, parallax factor: %f) encountered when getting maximum size, using default maximum size instead", buf, 0x2Au);
    }

    return 4000.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "screenScale");
    v15 = v14;

    if (v6 >= v8)
      v16 = v6;
    else
      v16 = v8;
    result = v16 * v15;
    if (result > 4000.0)
      return 4000.0;
  }
  return result;
}

- (BOOL)perspectiveZoom
{
  void *v2;
  char v3;

  -[WFSetWallpaperAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWallpaperPerspectiveZoom"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (double)currentParallaxFactor
{
  _BOOL4 v2;
  double result;

  v2 = -[WFSetWallpaperAction perspectiveZoom](self, "perspectiveZoom");
  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

- (id)locationParameterValues
{
  return (id)-[WFSetWallpaperAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWallpaperLocation"), objc_opt_class());
}

- (id)readableLocationParameterValues
{
  void *v2;
  void *v3;

  -[WFSetWallpaperAction locationParameterValues](self, "locationParameterValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)wf_wallpaperLocationFromLocationParameter
{
  void *v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  int64_t v6;

  -[WFSetWallpaperAction locationParameterValues](self, "locationParameterValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("Home Screen"));
  v4 = objc_msgSend(v2, "containsObject:", CFSTR("Lock Screen"));
  v5 = 1;
  if ((v3 & v4) != 0)
    v5 = 2;
  if (v3)
    v6 = v5;
  else
    v6 = v4 - 1;

  return v6;
}

- (int64_t)sbf_wallpaperLocationFromLocationParameter
{
  void *v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  int64_t v6;

  -[WFSetWallpaperAction locationParameterValues](self, "locationParameterValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("Home Screen"));
  v4 = objc_msgSend(v2, "containsObject:", CFSTR("Lock Screen"));
  v5 = 2;
  if ((v3 & v4) != 0)
    v5 = 3;
  if (v3)
    v6 = v5;
  else
    v6 = v4;

  return v6;
}

- (id)noPosterHomeError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Set Wallpaper Photo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Please select a wallpaper and try again."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)invalidLocationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Set Wallpaper Photo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Please select a valid destination for your photo."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageTooLargeError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Set Wallpaper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("The image provided was too large."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)invalidLocationErrorWithProvidedLocation:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEC4270];
  v13 = *MEMORY[0x24BDD0FD8];
  v5 = a3;
  WFLocalizedString(CFSTR("Invalid Wallpaper Location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14 = *MEMORY[0x24BDD0FC8];
  v7 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("“%@” is not a valid wallpaper location, please provide a valid location."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v5, v13, v14, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)missingImageError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Set Wallpaper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Please provide an image to set as a wallpaper."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)setWallpaperFailedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Set Wallpaper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("An unknown error occurred while setting the wallpaper."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSetWallpaperAction;
  -[WFSetWallpaperAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "wallpaperLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to set a wallpaper with %2$@?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to set a wallpaper?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSUUID)createdPosterConfigurationUUID
{
  return self->_createdPosterConfigurationUUID;
}

- (void)setCreatedPosterConfigurationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_createdPosterConfigurationUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdPosterConfigurationUUID, 0);
}

void __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_2;
    v7[3] = &unk_24F8B95D8;
    v7[4] = v2;
    v8 = *(id *)(a1 + 40);
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v9 = v4;
    v10 = v5;
    objc_msgSend(v2, "requestInterfacePresentationWithCompletionHandler:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceLockedError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v6);

  }
}

void __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 buf;
  void *v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22E315218]();
  getWFActionsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFSetWallpaperAction setLegacyWallpaperWithImage:]_block_invoke_4";
    _os_log_impl(&dword_22D353000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating wallpaper preview view...", (uint8_t *)&buf, 0xCu);
  }

  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v4 = (void *)getSBSUIWallpaperPreviewViewControllerClass_softClass;
  v27 = getSBSUIWallpaperPreviewViewControllerClass_softClass;
  v5 = MEMORY[0x24BDAC760];
  if (!getSBSUIWallpaperPreviewViewControllerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v29 = __getSBSUIWallpaperPreviewViewControllerClass_block_invoke;
    v30 = &unk_24F8BB430;
    v31 = &v24;
    __getSBSUIWallpaperPreviewViewControllerClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v25[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v24, 8);
  v7 = [v6 alloc];
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  BYTE1(v22) = objc_msgSend(*(id *)(a1 + 48), "perspectiveZoom") ^ 1;
  LOBYTE(v22) = 0;
  v10 = (void *)objc_msgSend(v7, "initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:", v9, 0, -1, v8, 0, 1, v22);
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screenBounds");
  v13 = v12;
  v15 = v14;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v16 = (void *)getUIViewClass_softClass;
  v27 = getUIViewClass_softClass;
  if (!getUIViewClass_softClass)
  {
    *(_QWORD *)&buf = v5;
    *((_QWORD *)&buf + 1) = 3221225472;
    v29 = __getUIViewClass_block_invoke;
    v30 = &unk_24F8BB430;
    v31 = &v24;
    __getUIViewClass_block_invoke((uint64_t)&buf);
    v16 = (void *)v25[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v24, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithFrame:", 0.0, 0.0, v13, v15);
  objc_msgSend(v10, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  getWFActionsLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFSetWallpaperAction setLegacyWallpaperWithImage:]_block_invoke";
    _os_log_impl(&dword_22D353000, v20, OS_LOG_TYPE_DEFAULT, "%s Setting wallpaper...", (uint8_t *)&buf, 0xCu);
  }

  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_221;
  v23[3] = &unk_24F8BB638;
  v21 = *(_QWORD *)(a1 + 56);
  v23[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v10, "setWallpaperForLocations:completionHandler:", v21, v23);

  objc_autoreleasePoolPop(v2);
}

uint64_t __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_221(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  getWFActionsLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[WFSetWallpaperAction setLegacyWallpaperWithImage:]_block_invoke";
    _os_log_impl(&dword_22D353000, v2, OS_LOG_TYPE_DEFAULT, "%s Setting wallpaper finished", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v5 = a2;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE19438]);
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDD1618], "wf_securelyArchivedDataWithRootObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_3;
    v10[3] = &unk_24F8BB370;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "showPreviewWithInput:key:wallpaperLocation:completionHandler:", v7, v8, v9, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

uint64_t __52__WFSetWallpaperAction_setLegacyWallpaperWithImage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

void __55__WFSetWallpaperAction_runLegacySetWallpaperWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE buf[24];
  void *v46;
  uint64_t *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x22E315218]();
    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v8 = (void *)getUIScreenClass_softClass;
    v44 = getUIScreenClass_softClass;
    if (!getUIScreenClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getUIScreenClass_block_invoke;
      v46 = &unk_24F8BB430;
      v47 = &v41;
      __getUIScreenClass_block_invoke((uint64_t)buf);
      v8 = (void *)v42[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v41, 8);
    objc_msgSend(v9, "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    if (v12 == 0.0 || v14 == 0.0)
    {
      getWFActionsLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]_block_invoke";
        _os_log_impl(&dword_22D353000, v15, OS_LOG_TYPE_FAULT, "%s UIScreen is reporting a zero height/width screen size, we are not going to be able to size wallpaper properly. We are likely not able to access the CA render server or something else in our process accessed mainScreen before we had access to the render server.", buf, 0xCu);
      }

    }
    v16 = v5;
    WFImageSizeFromFile();
    v18 = v17;
    v20 = v19;
    getWFActionsLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "maximumSizeInPixels");
      v23 = v22;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("w: %f, h: %f"), *(_QWORD *)&v18, *(_QWORD *)&v20, v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]_block_invoke";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      v46 = v24;
      _os_log_impl(&dword_22D353000, v21, OS_LOG_TYPE_DEFAULT, "%s Maximum size: %f, imageSize: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "maximumSizeInPixels");
    if (v18 > v25 || (objc_msgSend(*(id *)(a1 + 32), "maximumSizeInPixels"), v20 > v26))
    {
      getWFActionsLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("w: %f, h: %f"), *(_QWORD *)&v18, *(_QWORD *)&v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v28;
        _os_log_impl(&dword_22D353000, v27, OS_LOG_TYPE_DEFAULT, "%s Scaling image from size: %{public}@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "maximumSizeInPixels");
      objc_msgSend(v16, "wfType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      WFResizedImageFromImageFile();
      v30 = objc_claimAutoreleasedReturnValue();

      getWFActionsLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFSetWallpaperAction runLegacySetWallpaperWithInput:]_block_invoke";
        _os_log_impl(&dword_22D353000, v31, OS_LOG_TYPE_DEFAULT, "%s Image scaling complete", buf, 0xCu);
      }

      v16 = (id)v30;
    }
    v32 = objc_msgSend(v16, "representationType");
    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v33 = (void *)getUIImageClass_softClass;
    v44 = getUIImageClass_softClass;
    if (!getUIImageClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getUIImageClass_block_invoke;
      v46 = &unk_24F8BB430;
      v47 = &v41;
      __getUIImageClass_block_invoke((uint64_t)buf);
      v33 = (void *)v42[3];
    }
    v34 = v33;
    _Block_object_dispose(&v41, 8);
    v35 = v34;
    if (v32)
    {
      objc_msgSend(v16, "fileURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "imageWithContentsOfFile:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v16, "data");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "imageWithData:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(*(id *)(a1 + 32), "setLegacyWallpaperWithImage:", v38);
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v39 = *(void **)(a1 + 32);
    objc_msgSend(v39, "missingImageError");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "finishRunningWithError:", v40);

  }
}

void __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;

  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke_2;
  v10[3] = &unk_24F8BAD40;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(a2, "if_firstObjectPassingTest:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke_3;
    v9[3] = &unk_24F8BB370;
    v6 = *(void **)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "updateToSelectedConfiguration:completion:", v5, v9);
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "invalidPosterError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishRunningWithError:", v8);

  }
}

uint64_t __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "serverUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __73__WFSetWallpaperAction_finishAndSetCurrentPosterIfNecessary_isNewPoster___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localizedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WFSanitizedPostersError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "finishRunningWithError:", v4);
}

void __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "wf_wallpaperLocationFromLocationParameter");
  getWFActionsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == 1)
  {
    if (v4)
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_22D353000, v3, OS_LOG_TYPE_DEFAULT, "%s Failing the action because user doesn't have a selected poster and we can't set only home to a new poster", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "noPosterHomeError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v5 + 16))(v5, 0, 0, v6);
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_22D353000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating a new poster as a default poster", buf, 0xCu);
    }

    v6 = objc_alloc_init((Class)getPRSServiceClass());
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v6, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:completion:");

  }
}

uint64_t __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = a1[4];
      v12 = 136315394;
      v13 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]_block_invoke_2";
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEFAULT, "%s Using serialized default poster (%@) as the target", (uint8_t *)&v12, 0x16u);
    }

    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (v8)
    {
      v12 = 136315138;
      v13 = "-[WFSetWallpaperAction preparePosterWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEFAULT, "%s Serialized default poster no longer exists or valid, going to create a new one", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCF50], "systemShortcutsUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", *MEMORY[0x24BEC46B0]);

    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

void __59__WFSetWallpaperAction_preparePosterWithCompletionHandler___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v11 = v3;
  if (v3)
  {
    objc_msgSend(v3, "serverUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCreatedPosterConfigurationUUID:", v4);

    v5 = objc_alloc(MEMORY[0x24BEC3F88]);
    objc_msgSend(v11, "serverUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Default Wallpaper"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithUUID:name:providerBundleIdentifier:", v6, v7, *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x24BDBCF50], "systemShortcutsUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serializedRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x24BEC46B0]);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __84__WFSetWallpaperAction_buildWallpaperConfigurationFromCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFWallpaperLegibilityBlur"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFWallpaperSmartCrop"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFWallpaperShowPreview"), objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 32), "wf_wallpaperLocationFromLocationParameter");
    if (v12 == -1)
    {
      v19 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "invalidLocationError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

LABEL_21:
      goto LABEL_22;
    }
    v13 = v12;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__43107;
    v43 = __Block_byref_object_dispose__43108;
    v44 = 0;
    objc_msgSend(v7, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;
      v29 = v8;
      v30 = v11;
      if (v16)
      {
        objc_opt_class();
        v17 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v16;
        else
          v18 = 0;
      }
      else
      {
        v17 = v10;
        v18 = 0;
      }
      v23 = v18;

      objc_msgSend(v23, "asset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x24BEC1658]);
      objc_msgSend(v24, "localIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "initWithLocalIdentifier:location:legibilityBlur:smartCrop:usePreview:", v26, v13, v17, v30, v31);
      v28 = (void *)v40[5];
      v40[5] = v27;

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_20:

        _Block_object_dispose(&v39, 8);
        goto LABEL_21;
      }
      v21 = v15;
      v29 = v8;
      v30 = v11;
      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v23 = v22;

      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __84__WFSetWallpaperAction_buildWallpaperConfigurationFromCollection_completionHandler___block_invoke_201;
      v32[3] = &unk_24F8B9538;
      v36 = *(id *)(a1 + 40);
      v37 = &v39;
      v38 = v13;
      v17 = v10;
      v33 = v10;
      v34 = v30;
      v35 = v31;
      objc_msgSend(v23, "getFileRepresentation:forType:", v32, 0);

      v24 = v36;
    }

    v10 = v17;
    v8 = v29;
    v11 = v30;
    goto LABEL_20;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_22:

}

void __84__WFSetWallpaperAction_buildWallpaperConfigurationFromCollection_completionHandler___block_invoke_201(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = objc_alloc(MEMORY[0x24BEC1658]);
    objc_msgSend(v8, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithURL:location:legibilityBlur:smartCrop:usePreview:", v4, a1[9], a1[4], a1[5], a1[6]);
    v6 = *(_QWORD *)(a1[8] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  (*(void (**)(void))(a1[7] + 16))();

}

void __30__WFSetWallpaperAction_cancel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
  {
    getWFActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[WFSetWallpaperAction cancel]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_ERROR, "%s Failed to delete new default poster during cancellation with error: %@", (uint8_t *)&v5, 0x16u);
    }

  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_24F8B94E8;
    v8[4] = v7;
    v9 = v5;
    objc_msgSend(v7, "preparePosterWithCompletionHandler:", v8);

  }
  else
  {
    objc_msgSend(v7, "finishRunningWithError:", a3);
  }

}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (v7)
  {
    getWFActionsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v29 = v7;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_DEFAULT, "%s Setting configuration: %@ on poster: %@", buf, 0x20u);
    }

    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v11 = (void *)getPRSExternalSystemServiceClass_softClass;
    v27 = getPRSExternalSystemServiceClass_softClass;
    v12 = MEMORY[0x24BDAC760];
    if (!getPRSExternalSystemServiceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getPRSExternalSystemServiceClass_block_invoke;
      v29 = &unk_24F8BB430;
      v30 = &v24;
      __getPRSExternalSystemServiceClass_block_invoke((uint64_t)buf);
      v11 = (void *)v25[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v24, 8);
    v14 = objc_alloc_init(v13);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_176;
    v19[3] = &unk_24F8B94C0;
    v19[4] = *(_QWORD *)(a1 + 32);
    v23 = a3;
    v20 = v7;
    v21 = *(id *)(a1 + 40);
    v22 = v14;
    v15 = v14;
    objc_msgSend(v15, "fetchEligibleConfigurationsWithCompletion:", v19);

  }
  else
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WFSanitizedPostersError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishRunningWithError:", v18);

  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_176(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  char v26;
  _QWORD v27[5];
  id v28;
  id v29;
  char v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]_block_invoke";
    v33 = 2112;
    v34 = v5;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEFAULT, "%s Found eligible posters: %@, error: %@", buf, 0x20u);
  }

  if (!v5)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFSanitizedPostersError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishRunningWithError:", v13);

LABEL_20:
    goto LABEL_21;
  }
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "containsObject:", v8);

    if ((v9 & 1) == 0)
    {
      v23 = *(void **)(a1 + 32);
      objc_msgSend((id)objc_opt_class(), "invalidPosterError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "finishRunningWithError:", v12);
      goto LABEL_20;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "location"))
    v10 = objc_msgSend(*(id *)(a1 + 48), "location") != 2;
  else
    v10 = 0;
  v14 = objc_msgSend(*(id *)(a1 + 32), "showPreview");
  getWFActionsLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v14 || v10)
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]_block_invoke_5";
      _os_log_impl(&dword_22D353000, v15, OS_LOG_TYPE_DEFAULT, "%s Updating poster...", buf, 0xCu);
    }

    v19 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_183;
    v24[3] = &unk_24F8B9498;
    v21 = *(void **)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 48);
    v24[4] = *(_QWORD *)(a1 + 32);
    v25 = v21;
    v26 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v19, "updatePosterMatchingUUID:withConfiguration:completion:", v20, v22, v24);

    v18 = v25;
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[WFSetWallpaperAction runAsynchronouslyWithInput:]_block_invoke";
      _os_log_impl(&dword_22D353000, v15, OS_LOG_TYPE_DEFAULT, "%s Showing wallpaper editing UI...", buf, 0xCu);
    }

    v17 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_177;
    v27[3] = &unk_24F8B9470;
    v27[4] = v17;
    v28 = *(id *)(a1 + 48);
    v29 = *(id *)(a1 + 40);
    v30 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v17, "requestUnlock:", v27);

    v18 = v28;
  }

LABEL_21:
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_177(uint64_t a1, char a2)
{
  void *v2;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_2_178;
    v5[3] = &unk_24F8B9448;
    v5[4] = v2;
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v2, "requestInterfacePresentationWithCompletionHandler:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceLockedError");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v4);

  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_183(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishAndSetCurrentPosterIfNecessary:isNewPoster:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WFSanitizedPostersError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishRunningWithError:", v7);

  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_2_178(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  char v8;

  if (a2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_3;
    v6[3] = &unk_24F8B9420;
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = *(_BYTE *)(a1 + 56);
    objc_msgSend(a2, "showPreviewForConfiguration:selectedPoster:completionHandler:", v5, v7, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "wf_isUserCancelledError")
    && (objc_msgSend(*(id *)(a1 + 32), "createdPosterConfigurationUUID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "createdPosterConfigurationUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_4;
    v10[3] = &unk_24F8BB540;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v3;
    objc_msgSend(v5, "deletePosterWithUUID:completionHandler:", v6, v10);

  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WFSanitizedPostersError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishRunningWithError:", v9);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishAndSetCurrentPosterIfNecessary:isNewPoster:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    }
  }

}

void __51__WFSetWallpaperAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localizedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WFSanitizedPostersError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "finishRunningWithError:", v4);
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFDE48;
}

+ (id)invalidPosterError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Set Wallpaper Photo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Photos cannot be set on the selected wallpaper. Please select a different wallpaper."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)unableToGetImageError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Set Wallpaper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Unable to fetch the image provided."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
