@implementation PKPencilSqueezeAnalyticsController

- (id)initWithDelegate:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)PKPencilSqueezeAnalyticsController;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 3, v3);
  }

  return a1;
}

- (void)didShowMiniPaletteIsUndoRedoPalette:(uint64_t)a1
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 9))
  {
    PKPencilSqueezeAnalyticsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = a2;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "did show mini palette, isUndoRedoPalette: %{BOOL}d", (uint8_t *)v5, 8u);
    }

    *(_WORD *)(a1 + 9) = 1;
    *(_BYTE *)(a1 + 11) = 0;
    *(_BYTE *)(a1 + 8) = a2;
    *(CFTimeInterval *)(a1 + 16) = CACurrentMediaTime();
  }
}

- (void)didUseMiniPalette
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1 && *(_BYTE *)(a1 + 9) && !*(_BYTE *)(a1 + 10))
  {
    PKPencilSqueezeAnalyticsLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "did use mini palette", v3, 2u);
    }

    *(_BYTE *)(a1 + 10) = 1;
  }
}

- (void)didHideMiniPaletteByDrawing
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __65__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByDrawing__block_invoke;
    v1[3] = &unk_1E7778020;
    v1[4] = a1;
    -[PKPencilSqueezeAnalyticsController _didHideMiniPaletteWithBlock:](a1, v1);
  }
}

void __65__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByDrawing__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  PKPencilSqueezeAnalyticsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "did hide mini palette by drawing", v3, 2u);
  }

  -[PKPencilSqueezeAnalyticsController _logSqueezeCategory:](*(_QWORD *)(a1 + 32), 3);
}

- (void)_logSqueezeCategory:(uint64_t)a1
{
  unint64_t v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  id v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  int v15;
  uint64_t v16;
  unsigned __int8 v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  __int128 v36;
  id (*v37)(uint64_t);
  void *v38;
  id v39;
  _QWORD v40[6];
  __int128 buf;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredSqueezeAction");
    v5 = v4;
    if (v4 >= 5)
    {
      if (v4 == 6)
      {
        v5 = 8;
      }
      else if (v4 == 5)
      {
        if (*(_BYTE *)(a1 + 8))
          v5 = 10;
        else
          v5 = 9;
      }
      else
      {
        PKPencilSqueezeAnalyticsLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = v5;
          _os_log_error_impl(&dword_1BE213000, v35, OS_LOG_TYPE_ERROR, "Unable to map squeeze trigger action: %lu", (uint8_t *)&buf, 0xCu);
        }

        v5 = 0;
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v7 = objc_msgSend(WeakRetained, "pencilSqueezeAnalyticsControllerIsHovering:", a1);

    v8 = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(v8, "pencilSqueezeAnalyticsControllerHoverZOffset:", a1);
    v10 = v9;

    v11 = objc_loadWeakRetained((id *)(a1 + 24));
    v12 = v11;
    if (!v7 || (v10 >= 0.1 ? (v13 = v10 > 1.0) : (v13 = 1), v13))
    {
      v17 = objc_msgSend(v11, "pencilSqueezeAnalyticsControllerIsHovering:", a1);

      v18 = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(v18, "pencilSqueezeAnalyticsControllerHoverZOffset:", a1);
      v20 = v19;

      if ((v17 & (v20 == 0.0)) != 0)
        v16 = 2;
      else
        v16 = 0;
    }
    else
    {
      objc_msgSend(v11, "pencilSqueezeAnalyticsControllerHoverSettings:", a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend((id)objc_opt_class(), "allowDoubleTapOnlyWithPencilHover");

      if (v15)
        v16 = 3;
      else
        v16 = 1;
    }
    +[PKPencilDevice squeezeThreshold]();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = PKPencilSqueezeThresholdMap(v21);
    v23 = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(v23, "pencilSqueezeAnalyticsControllerHoverSettings:", a1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "toolPreviewActive");

    v40[0] = CFSTR("squeezeCategory");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v26;
    v40[1] = CFSTR("triggerAction");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&buf + 1) = v27;
    v40[2] = CFSTR("pencilLocation");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v28;
    v40[3] = CFSTR("squeezeThreshold");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v29;
    v40[4] = CFSTR("hoverSettingState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v30;
    v40[5] = CFSTR("bundleId_category");
    +[PKStatisticsManager bundleIDCategory]();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v40, 6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    PKPencilSqueezeAnalyticsLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v36) = 138477827;
      *(_QWORD *)((char *)&v36 + 4) = v32;
      _os_log_impl(&dword_1BE213000, v33, OS_LOG_TYPE_DEFAULT, "Send event: %{private}@", (uint8_t *)&v36, 0xCu);
    }

    *(_QWORD *)&v36 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v36 + 1) = 3221225472;
    v37 = __102__PKPencilSqueezeAnalyticsController__logSqueezeCategory_action_location_threshold_hoverSettingState___block_invoke;
    v38 = &unk_1E7779008;
    v39 = v32;
    v34 = v32;
    AnalyticsSendEventLazy();

  }
}

- (void)_didHideMiniPaletteWithBlock:(uint64_t)a1
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 9) && !*(_BYTE *)(a1 + 11))
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
    *(_DWORD *)(a1 + 8) = 0x1000000;
  }

}

- (void)didHideMiniPaletteBySqueezingAgain
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __72__PKPencilSqueezeAnalyticsController_didHideMiniPaletteBySqueezingAgain__block_invoke;
    v1[3] = &unk_1E7778020;
    v1[4] = a1;
    -[PKPencilSqueezeAnalyticsController _didHideMiniPaletteWithBlock:](a1, v1);
  }
}

void __72__PKPencilSqueezeAnalyticsController_didHideMiniPaletteBySqueezingAgain__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  int v7;
  double v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 10))
  {
    -[PKPencilSqueezeAnalyticsController _logSqueezeCategory:](v2, 6);
  }
  else
  {
    v3 = CACurrentMediaTime() - *(double *)(*(_QWORD *)(a1 + 32) + 16);
    PKPencilSqueezeAnalyticsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = 134218240;
      v8 = v3;
      v9 = 1024;
      v10 = v5;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "did hide mini palette after %.2f seconds, isUndoRedoPalette: %{BOOL}d", (uint8_t *)&v7, 0x12u);
    }

    if (v3 >= 0.5)
      v6 = 12;
    else
      v6 = 8;
    -[PKPencilSqueezeAnalyticsController _logSqueezeCategory:](*(_QWORD *)(a1 + 32), v6);
  }
}

- (void)didHideMiniPaletteByTappingOutsideOnScreen
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __80__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByTappingOutsideOnScreen__block_invoke;
    v1[3] = &unk_1E7778020;
    v1[4] = a1;
    -[PKPencilSqueezeAnalyticsController _didHideMiniPaletteWithBlock:](a1, v1);
  }
}

void __80__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByTappingOutsideOnScreen__block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController _logSqueezeCategory:](*(_QWORD *)(a1 + 32), 11);
}

- (void)didHideMiniPaletteByChangingContext
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __73__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByChangingContext__block_invoke;
    v1[3] = &unk_1E7778020;
    v1[4] = a1;
    -[PKPencilSqueezeAnalyticsController _didHideMiniPaletteWithBlock:](a1, v1);
  }
}

void __73__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByChangingContext__block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController _logSqueezeCategory:](*(_QWORD *)(a1 + 32), 13);
}

id __102__PKPencilSqueezeAnalyticsController__logSqueezeCategory_action_location_threshold_hoverSettingState___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (uint64_t)currentSqueezeThresholdIndex
{
  void *v0;
  uint64_t v1;

  objc_opt_self();
  +[PKPencilDevice squeezeThreshold]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = PKPencilSqueezeThresholdMap(v0);

  return v1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
