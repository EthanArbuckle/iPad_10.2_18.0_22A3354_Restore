@implementation CEKLightingFrameCache

- (CEKLightingFrameCache)init
{
  CEKLightingFrameCache *v2;
  void *v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  NSIndexSet *availableAbsoluteAngles;
  uint64_t v8;
  NSMutableDictionary *foregroundFramesByAvailableAngle;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *backgroundFrameMapsByLightingType;
  objc_super v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)CEKLightingFrameCache;
  v2 = -[CEKLightingFrameCache init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 20; ++i)
      objc_msgSend(v3, "addIndex:", CEKLightingFrameAbsoluteAngles[i]);
    v5 = -[CEKLightingFrameCache angleCount](v2, "angleCount");
    v6 = objc_msgSend(v3, "copy");
    availableAbsoluteAngles = v2->__availableAbsoluteAngles;
    v2->__availableAbsoluteAngles = (NSIndexSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    foregroundFramesByAvailableAngle = v2->__foregroundFramesByAvailableAngle;
    v2->__foregroundFramesByAvailableAngle = (NSMutableDictionary *)v8;

    v20[0] = &unk_1E70B3EF0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v20[1] = &unk_1E70B3F08;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    v20[2] = &unk_1E70B3F20;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v12;
    v20[3] = &unk_1E70B3F38;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v13;
    v20[4] = &unk_1E70B3F50;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v14;
    v20[5] = &unk_1E70B3F68;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[5] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
    v16 = objc_claimAutoreleasedReturnValue();
    backgroundFrameMapsByLightingType = v2->__backgroundFrameMapsByLightingType;
    v2->__backgroundFrameMapsByLightingType = (NSDictionary *)v16;

  }
  return v2;
}

- (unint64_t)angleCount
{
  return 39;
}

- (void)preloadForegroundFrames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[3];
  id location;

  if (-[CEKLightingFrameCache _needsForegroundFrames](self, "_needsForegroundFrames"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v5 = v4;

    -[CEKLightingFrameCache _availableAbsoluteAngles](self, "_availableAbsoluteAngles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v8 = v7;
    objc_initWeak(&location, self);
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__CEKLightingFrameCache_preloadForegroundFrames__block_invoke;
    block[3] = &unk_1E70A53A0;
    objc_copyWeak(v13, &location);
    v12 = v6;
    v13[1] = v5;
    v13[2] = v8;
    v10 = v6;
    dispatch_async(v9, block);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __48__CEKLightingFrameCache_preloadForegroundFrames__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8[2];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_renderForegroundFramesForAbsoluteAngles:scale:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CEKLightingFrameCache_preloadForegroundFrames__block_invoke_2;
  block[3] = &unk_1E70A4C98;
  v8[1] = *(id *)(a1 + 56);
  objc_copyWeak(v8, v2);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v8);
}

void __48__CEKLightingFrameCache_preloadForegroundFrames__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = *(double *)(a1 + 48);
  v5 = os_log_create("com.apple.camera", "CameraEditKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v3 - v4;
    _os_log_impl(&dword_1B9835000, v5, OS_LOG_TYPE_DEFAULT, "Loaded foreground frames for lighting cube in %.2f seconds", (uint8_t *)&v8, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "set_foregroundFramesByAvailableAngle:", v6);

}

- (void)preloadBackgroundFrames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[3];
  id location;

  if (-[CEKLightingFrameCache _needsForegroundFrames](self, "_needsForegroundFrames"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v5 = v4;

    -[CEKLightingFrameCache _availableAbsoluteAngles](self, "_availableAbsoluteAngles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v8 = v7;
    objc_initWeak(&location, self);
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__CEKLightingFrameCache_preloadBackgroundFrames__block_invoke;
    block[3] = &unk_1E70A53A0;
    objc_copyWeak(v13, &location);
    v12 = v6;
    v13[1] = v5;
    v13[2] = v8;
    v10 = v6;
    dispatch_async(v9, block);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __48__CEKLightingFrameCache_preloadBackgroundFrames__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(&unk_1E70B4620, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(&unk_1E70B4620, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(&unk_1E70B4620);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "unsignedIntegerValue");
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(WeakRetained, "_renderBackgroundFramesForAbsoluteAngles:lightingType:scale:", *(_QWORD *)(a1 + 32), v8, *(double *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v7);

      }
      v4 = objc_msgSend(&unk_1E70B4620, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__CEKLightingFrameCache_preloadBackgroundFrames__block_invoke_2;
  v12[3] = &unk_1E70A53C8;
  v15[1] = *(id *)(a1 + 56);
  v13 = &unk_1E70B4620;
  objc_copyWeak(v15, (id *)(a1 + 40));
  v14 = v2;
  v11 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(v15);
}

void __48__CEKLightingFrameCache_preloadBackgroundFrames__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = *(double *)(a1 + 56);
  v5 = os_log_create("com.apple.camera", "CameraEditKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = 134218240;
    v10 = v6;
    v11 = 2048;
    v12 = v3 - v4;
    _os_log_impl(&dword_1B9835000, v5, OS_LOG_TYPE_DEFAULT, "Loaded background frames for %lu lighting cubes in %.2f seconds", (uint8_t *)&v9, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "set_backgroundFrameMapsByLightingType:", v7);

}

- (int64_t)angleOfAvailableFrameForAngle:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;

  -[CEKLightingFrameCache _availableAbsoluteAngles](self, "_availableAbsoluteAngles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 >= 0)
    v6 = a3;
  else
    v6 = -a3;
  v7 = objc_msgSend(v4, "cek_indexNearestToIndex:", v6);
  if (a3 >= 0)
    v8 = v7;
  else
    v8 = -v7;

  return v8;
}

- (id)foregroundFrameForAngle:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[CEKLightingFrameCache angleOfAvailableFrameForAngle:](self, "angleOfAvailableFrameForAngle:");
  -[CEKLightingFrameCache _foregroundFramesByAvailableAngle](self, "_foregroundFramesByAvailableAngle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[CEKLightingFrameCache _appearanceForLightingType:](self, "_appearanceForLightingType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    -[CEKLightingFrameCache _renderFrameForAngle:scale:components:appearance:](self, "_renderFrameForAngle:scale:components:appearance:", a3, 48, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v11);

    }
  }

  return v8;
}

- (id)backgroundFrameForAngle:(int64_t)a3 lightingType:(int64_t)a4
{
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = -[CEKLightingFrameCache angleOfAvailableFrameForAngle:](self, "angleOfAvailableFrameForAngle:");
  -[CEKLightingFrameCache _backgroundFrameMapsByLightingType](self, "_backgroundFrameMapsByLightingType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[CEKLightingFrameCache _appearanceForLightingType:](self, "_appearanceForLightingType:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    -[CEKLightingFrameCache _renderFrameForAngle:scale:components:appearance:](self, "_renderFrameForAngle:scale:components:appearance:", a3, 15, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v15);

    }
  }

  return v12;
}

- (BOOL)_needsForegroundFrames
{
  CEKLightingFrameCache *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  -[CEKLightingFrameCache _foregroundFramesByAvailableAngle](self, "_foregroundFramesByAvailableAngle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v2) = v4 < -[CEKLightingFrameCache angleCount](v2, "angleCount");

  return (char)v2;
}

- (BOOL)_needsBackgroundFrame
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CEKLightingFrameCache _backgroundFrameMapsByLightingType](self, "_backgroundFrameMapsByLightingType");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "count", (_QWORD)v11);
        if (v8 < -[CEKLightingFrameCache angleCount](self, "angleCount"))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)_appearanceForLightingType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1:
      +[CEKLightingCubeStyleGlowing naturalAppearance](CEKLightingCubeStyleGlowing, "naturalAppearance", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[CEKLightingCubeStyleGlowing studioAppearance](CEKLightingCubeStyleGlowing, "studioAppearance", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[CEKLightingCubeStyleGlowing contourAppearance](CEKLightingCubeStyleGlowing, "contourAppearance", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[CEKLightingCubeStyleGlowing stageAppearance](CEKLightingCubeStyleGlowing, "stageAppearance", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[CEKLightingCubeStyleGlowing stageMonoAppearance](CEKLightingCubeStyleGlowing, "stageMonoAppearance", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[CEKLightingCubeStyleGlowing stageWhiteAppearance](CEKLightingCubeStyleGlowing, "stageWhiteAppearance", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_renderForegroundFramesForAbsoluteAngles:(id)a3 scale:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  double v18;
  uint64_t v19;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithCapacity:", 2 * objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingFrameCache _appearanceForLightingType:](self, "_appearanceForLightingType:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__CEKLightingFrameCache__renderForegroundFramesForAbsoluteAngles_scale___block_invoke;
  v15[3] = &unk_1E70A53F0;
  v18 = a4;
  v19 = 48;
  v15[4] = self;
  v16 = v9;
  v10 = v8;
  v17 = v10;
  v11 = v9;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

void __72__CEKLightingFrameCache__renderForegroundFramesForAbsoluteAngles_scale___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_renderFrameForAngle:scale:components:appearance:", a2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v5);

  objc_msgSend(v9, "imageWithHorizontallyFlippedOrientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

- (id)_renderBackgroundFramesForAbsoluteAngles:(id)a3 lightingType:(int64_t)a4 scale:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  CEKLightingFrameCache *v25;
  void *v26;
  double v27;
  uint64_t v28;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithCapacity:", 2 * objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingFrameCache _appearanceForLightingType:](self, "_appearanceForLightingType:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingFrameCache _appearanceForLightingType:](self, "_appearanceForLightingType:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKLightingFrameCache _appearanceForLightingType:](self, "_appearanceForLightingType:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85__CEKLightingFrameCache__renderBackgroundFramesForAbsoluteAngles_lightingType_scale___block_invoke;
  v21[3] = &unk_1E70A5418;
  v22 = v11;
  v23 = v13;
  v14 = v10;
  v24 = v14;
  v25 = self;
  v27 = a5;
  v28 = 15;
  v26 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v21);

  v18 = v26;
  v19 = v14;

  return v19;
}

void __85__CEKLightingFrameCache__renderBackgroundFramesForAbsoluteAngles_lightingType_scale___block_invoke(uint64_t a1, unint64_t a2)
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (float)a2 / 90.0;
  +[CEKLightingCubeAppearance appearanceFrom:to:progress:](CEKLightingCubeAppearance, "appearanceFrom:to:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_renderFrameForAngle:scale:components:appearance:", a2, *(_QWORD *)(a1 + 80), v5, *(double *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  v9 = -(uint64_t)a2;
  +[CEKLightingCubeAppearance appearanceFrom:to:progress:](CEKLightingCubeAppearance, "appearanceFrom:to:progress:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), -v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "_renderFrameForAngle:scale:components:appearance:", v9, *(_QWORD *)(a1 + 80), v13, *(double *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

}

- (id)_renderFrameForAngle:(int64_t)a3 scale:(double)a4 components:(int64_t)a5 appearance:(id)a6
{
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  id v12;
  CEKLightingCube *v13;
  CEKLightingCubeRenderer *v14;
  CGContext *CurrentContext;
  void *v16;
  CGSize v18;

  v8 = 49.0 - 1.0 / a4;
  v9 = 3.0 - 1.0 / a4;
  v10 = 1.0 / a4 + 1.0;
  v11 = (double)a3 * 3.14159265 / 180.0;
  v12 = a6;
  v13 = -[CEKLightingCube initWithRotationAngle:]([CEKLightingCube alloc], "initWithRotationAngle:", v11);
  v14 = -[CEKLightingCubeRenderer initWithCube:appearance:components:]([CEKLightingCubeRenderer alloc], "initWithCube:appearance:components:", v13, v12, a5);

  v18.width = v8;
  v18.height = v8;
  UIGraphicsBeginImageContextWithOptions(v18, 0, a4);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, v8 * 0.5, v8 * 0.5);
  -[CEKLightingCubeRenderer renderInContext:size:scale:cornerRadius:stroke:](v14, "renderInContext:size:scale:cornerRadius:stroke:", CurrentContext, v8, v8, a4, v9, v10);
  CGContextTranslateCTM(CurrentContext, v8 * -0.5, v8 * -0.5);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v16;
}

- (NSIndexSet)_availableAbsoluteAngles
{
  return self->__availableAbsoluteAngles;
}

- (NSMutableDictionary)_foregroundFramesByAvailableAngle
{
  return self->__foregroundFramesByAvailableAngle;
}

- (void)set_foregroundFramesByAvailableAngle:(id)a3
{
  objc_storeStrong((id *)&self->__foregroundFramesByAvailableAngle, a3);
}

- (NSDictionary)_backgroundFrameMapsByLightingType
{
  return self->__backgroundFrameMapsByLightingType;
}

- (void)set_backgroundFrameMapsByLightingType:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundFrameMapsByLightingType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundFrameMapsByLightingType, 0);
  objc_storeStrong((id *)&self->__foregroundFramesByAvailableAngle, 0);
  objc_storeStrong((id *)&self->__availableAbsoluteAngles, 0);
}

@end
