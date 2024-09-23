@implementation PKStatisticsManager

void __46__PKStatisticsManager_sharedStatisticsManager__block_invoke()
{
  PKStatisticsManager *v0;
  void *v1;
  PKDrawingPaletteStatisticsEventLogger *v2;
  void *v3;

  v0 = objc_alloc_init(PKStatisticsManager);
  v1 = (void *)qword_1ECEE62E8;
  qword_1ECEE62E8 = (uint64_t)v0;

  v2 = objc_alloc_init(PKDrawingPaletteStatisticsEventLogger);
  v3 = *(void **)(qword_1ECEE62E8 + 64);
  *(_QWORD *)(qword_1ECEE62E8 + 64) = v2;

}

+ (id)sharedStatisticsManager
{
  objc_opt_self();
  if (qword_1ECEE62E0 != -1)
    dispatch_once(&qword_1ECEE62E0, &__block_literal_global_14_1);
  return (id)qword_1ECEE62E8;
}

+ (id)bundleIDCategory
{
  objc_opt_self();
  if (_MergedGlobals_138 != -1)
    dispatch_once(&_MergedGlobals_138, &__block_literal_global_54);
  return (id)qword_1ECEE62D8;
}

void __39__PKStatisticsManager_bundleIDCategory__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v0 = (void *)qword_1ECEE62F0;
  v10 = qword_1ECEE62F0;
  if (!qword_1ECEE62F0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getIAUtilityClass_block_invoke;
    v6[3] = &unk_1E7777068;
    v6[4] = &v7;
    __getIAUtilityClass_block_invoke((uint64_t)v6);
    v0 = (void *)v8[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lookupAppBundle:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECEE62D8;
  qword_1ECEE62D8 = v4;

}

- (void)recordDrawStroke:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  void *v26;
  __CFString *v27;

  v3 = a2;
  if (a1)
  {
    +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v4, (void *)*MEMORY[0x1E0D167C0]);

    v6 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v7 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    objc_msgSend(v3, "ink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("unknown");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    -[__CFString stringByReplacingOccurrencesOfString:withString:](v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.ink."), &stru_1E777DEE8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "ink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "weight");

    objc_msgSend(v3, "ink");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "ink");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "color");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGColorGetAlpha((CGColorRef)objc_msgSend(v18, "CGColor"));

    }
    v19 = v3;
    v20 = objc_msgSend(v19, "_inputType");
    if (v20)
    {
      if (v20 == 1)
      {
        v21 = CFSTR("pencil");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "_inputType"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringValue");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v21 = CFSTR("touch");
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("stroke.added"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v13;
    v27 = v21;
    v24 = v21;
    v25 = v13;
    AnalyticsSendEventLazy();

  }
}

id __40__PKStatisticsManager_recordDrawStroke___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = *(_QWORD *)(a1 + 32);
  v7[0] = CFSTR("tool");
  v7[1] = CFSTR("thickness");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  v7[2] = CFSTR("opacity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = CFSTR("input");
  v4 = *(_QWORD *)(a1 + 40);
  v8[2] = v3;
  v8[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recordBitmapEraseWithInputType:(uint64_t)a1
{
  __CFString *v2;
  void *v3;

  if (a1)
  {
    if ((unint64_t)(a2 - 1) > 2)
      v2 = CFSTR("direct");
    else
      v2 = off_1E777B810[a2 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("stroke.erase"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __54__PKStatisticsManager_recordBitmapEraseWithInputType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("input");
  v3[1] = CFSTR("type");
  v4[0] = v1;
  v4[1] = CFSTR("bitmap");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordObjectEraseWithInputType:(uint64_t)a1
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v5 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    if ((unint64_t)(a2 - 1) > 2)
      v6 = CFSTR("direct");
    else
      v6 = off_1E777B810[a2 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("stroke.erase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __54__PKStatisticsManager_recordObjectEraseWithInputType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("input");
  v3[1] = CFSTR("type");
  v4[0] = v1;
  v4[1] = CFSTR("object");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordLatency:(uint64_t)a1 mean:max:percentageOverLatencyThreshold:isInPDF:
{
  void *v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("stroke.latency"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __85__PKStatisticsManager_recordLatency_mean_max_percentageOverLatencyThreshold_isInPDF___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("frequency");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("mean");
  LODWORD(v4) = *(_DWORD *)(a1 + 36);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("max");
  LODWORD(v6) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("percentageOverThreshold");
  LODWORD(v8) = *(_DWORD *)(a1 + 44);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  v13[4] = CFSTR("isInPDF");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)recordPerceivedLatency:(uint64_t)a1 mean:max:isInPDF:
{
  void *v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("stroke.perceivedLatency"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __63__PKStatisticsManager_recordPerceivedLatency_mean_max_isInPDF___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("frequency");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("mean");
  LODWORD(v4) = *(_DWORD *)(a1 + 36);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("max");
  LODWORD(v6) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("isInPDF");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)recordHoverLatency:(uint64_t)a1 mean:max:shadowEnabled:isInPDF:
{
  void *v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("stroke.hoverLatency"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __73__PKStatisticsManager_recordHoverLatency_mean_max_shadowEnabled_isInPDF___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("frequency");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("mean");
  LODWORD(v4) = *(_DWORD *)(a1 + 36);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("max");
  LODWORD(v6) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("shadowEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  v12[4] = CFSTR("isInPDF");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 45));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)recordHoverDuration:(uint64_t)a1 onScreenDuration:hoverEdgeDuration:hoverExteriorDuration:sessionDuration:showEffectsEnabled:shadowEnabled:scribbleEnabled:doubleTapOnlyInHoverRangeEnabled:doubleTapsInRange:doubleTapsOutsideRange:deviceIsConnectedToCharger:intentionalHoverDuration:intentionalToolPreviewHoverDuration:countIntentionalHoverActions:maxIntentionalHoverDuration:meanIntentionalHoverDuration:minIntentionalHoverDuration:
{
  void *v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("hover"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __441__PKStatisticsManager_recordHoverDuration_onScreenDuration_hoverEdgeDuration_hoverExteriorDuration_sessionDuration_showEffectsEnabled_shadowEnabled_scribbleEnabled_doubleTapOnlyInHoverRangeEnabled_doubleTapsInRange_doubleTapsOutsideRange_deviceIsConnectedToCharger_intentionalHoverDuration_intentionalToolPreviewHoverDuration_countIntentionalHoverActions_maxIntentionalHoverDuration_meanIntentionalHoverDuration_minIntentionalHoverDuration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[19];
  _QWORD v24[21];

  v24[19] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("hoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("hoverExteriorDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("hoverEdgeDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("hoverInteriorDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("onScreenDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = CFSTR("sessionDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v17;
  v23[6] = CFSTR("settingShowEffectsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 144));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  v23[7] = CFSTR("settingScribbleEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 145));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  v23[8] = CFSTR("settingSystemShadowEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 146));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v14;
  v23[9] = CFSTR("settingDoubleTapInRangeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 147));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v13;
  v23[10] = CFSTR("doubleTapsInRange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v2;
  v23[11] = CFSTR("doubleTapsOutsideRange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v3;
  v23[12] = CFSTR("connectedToCharger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 148));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v4;
  v23[13] = CFSTR("intentionalHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 96));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v5;
  v23[14] = CFSTR("intentionalToolPreviewHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v6;
  v23[15] = CFSTR("countIntentionalHoverActions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 112));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v7;
  v23[16] = CFSTR("maxIntentionalHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 120));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[16] = v8;
  v23[17] = CFSTR("medianIntentionalHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 128));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[17] = v9;
  v23[18] = CFSTR("minIntentionalHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 136));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[18] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)recordHoverToolType:(uint64_t)a3 hoverDuration:(uint64_t)a4 intentionalToolPreviewHoverDuration:(uint64_t)a5 intentionalHoverDuration:(uint64_t)a6 maxIntentionalHoverDuration:(uint64_t)a7 meanIntentionalHoverDuration:(void *)a8 minIntentionalHoverDuration:countIntentionalHoverActions:activepencilminutes:onScreenDuration:settingShowEffectsEnabled:settingSystemShadowEnabled:settingScribbleEnabled:settingDoubleTapInRangeEnabled:bundleID:
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a2;
  v11 = a8;
  if (a1)
  {
    v12 = v10;
    v13 = v11;
    AnalyticsSendEventLazy();

  }
}

id __385__PKStatisticsManager_recordHoverToolType_hoverDuration_intentionalToolPreviewHoverDuration_intentionalHoverDuration_maxIntentionalHoverDuration_meanIntentionalHoverDuration_minIntentionalHoverDuration_countIntentionalHoverActions_activepencilminutes_onScreenDuration_settingShowEffectsEnabled_settingSystemShadowEnabled_settingScribbleEnabled_settingDoubleTapInRangeEnabled_bundleID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[15];
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  v19[0] = *(_QWORD *)(a1 + 32);
  v18[0] = CFSTR("toolType");
  v18[1] = CFSTR("hoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  v18[2] = CFSTR("intentionalToolPreviewHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  v18[3] = CFSTR("intentionalHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  v18[4] = CFSTR("maxIntentionalHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v14;
  v18[5] = CFSTR("meanIntentionalHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v2;
  v18[6] = CFSTR("minIntentionalHoverDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v3;
  v18[7] = CFSTR("countIntentionalHoverActions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 96));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v4;
  v18[8] = CFSTR("activepencilminutes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v5;
  v18[9] = CFSTR("onScreenDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 112));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v6;
  v18[10] = CFSTR("settingShowEffectsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 120));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v7;
  v18[11] = CFSTR("settingSystemShadowEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 121));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v8;
  v18[12] = CFSTR("settingScribbleEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 122));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v9;
  v18[13] = CFSTR("settingDoubleTapInRangeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 123));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[14] = CFSTR("bundleID");
  v11 = *(_QWORD *)(a1 + 40);
  v19[13] = v10;
  v19[14] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)recordDragSelection
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.drag"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__42__PKStatisticsManager_recordDragSelection__block_invoke()
{
  return &unk_1E77ED028;
}

- (void)recordDragAndDropSelection
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.drag"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__49__PKStatisticsManager_recordDragAndDropSelection__block_invoke()
{
  return &unk_1E77ED050;
}

- (void)recordInkPickerNoOp:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("inkpicker.noOp"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __43__PKStatisticsManager_recordInkPickerNoOp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("element");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordColorPanelInvoked:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("colorpicker.invoke"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __47__PKStatisticsManager_recordColorPanelInvoked___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("action");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordColorsChangedBeforeChosen:(uint64_t)a1
{
  void *v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("colorpicker.colors"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __55__PKStatisticsManager_recordColorsChangedBeforeChosen___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("intermediateColors");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)recordCollaboration:(uint64_t)a1
{
  __CFString *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  if (a1)
  {
    if (a2 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringValue");
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = off_1E777B828[a2];
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("drawing.didCollaborate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v2;
    v5 = v2;
    AnalyticsSendEventLazy();

  }
}

id __43__PKStatisticsManager_recordCollaboration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("merge");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordTool:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("stroke.tool"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __34__PKStatisticsManager_recordTool___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("tool");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordUndo:(void *)a3 forStrokes:(void *)a4 fallbackInkIdentifier:
{
  __CFString *v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "ink");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[__CFString isEqual:](v12, "isEqual:", v19);

            if ((v20 & 1) == 0)
            {

              v12 = CFSTR("mixed");
              goto LABEL_13;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_13:

      v9 = v12;
    }
    if (!v7)
    {
      v21 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v21, OS_LOG_TYPE_ERROR, "Action name was not set when recording undo", buf, 2u);
      }

      v7 = CFSTR("unknown");
    }
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("undoAction"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v7;
      v9 = v9;
      AnalyticsSendEventLazy();

    }
  }

}

id __67__PKStatisticsManager_recordUndo_forStrokes_fallbackInkIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("action");
  v3[1] = CFSTR("inkType");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordNumberOfUndos:(uint64_t)a3 numberOfStrokes:(uint64_t)a4 showEffectsEnabled:(uint64_t)a5 shadowEnabled:(void *)a6 bundleID:
{
  id v8;
  void *v9;
  id v10;

  v8 = a6;
  if (a1 && a3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("undo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    AnalyticsSendEventLazy();

  }
}

id __101__PKStatisticsManager_recordNumberOfUndos_numberOfStrokes_showEffectsEnabled_shadowEnabled_bundleID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("undoRatePerSession");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("countPencilStrokes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = *(const __CFString **)(a1 + 32);
  if (!v5)
    v5 = CFSTR("unknown");
  v11[1] = v3;
  v11[2] = v5;
  v10[2] = CFSTR("bundleID");
  v10[3] = CFSTR("settingShowEffectsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("settingSystemShadowEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)recordTextLineStraightening:(char)a3 withUndo:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a2;
  if (a1)
  {
    +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v7, (void *)*MEMORY[0x1E0D167C8]);

    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    if ((a3 & 1) != 0)
    {
      v10 = CFSTR("undo");
    }
    else
    {
      if (!*(_QWORD *)(a1 + 24))
        goto LABEL_11;
      if (*(double *)(a1 + 32) <= 0.0)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if (v11 - *(double *)(a1 + 32) >= 20.0)
        goto LABEL_11;
      v10 = CFSTR("repeat");
    }
    objc_msgSend(v9, "setValue:forKey:", MEMORY[0x1E0C9AAB0], v10);
LABEL_11:
    objc_storeStrong((id *)(a1 + 24), a2);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)(a1 + 32) = v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("textLineStraightening"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    AnalyticsSendEventLazy();

  }
}

id __60__PKStatisticsManager_recordTextLineStraightening_withUndo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)recordTextLineStraighteningUndoIfNecessary
{
  double v2;
  void *v3;

  if (a1 && *(_QWORD *)(a1 + 24) && *(double *)(a1 + 32) > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v2 - *(double *)(a1 + 32) < 10.0)
      -[PKStatisticsManager recordTextLineStraightening:withUndo:](a1, *(void **)(a1 + 24), 1);
    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    *(_QWORD *)(a1 + 32) = 0;
  }
}

- (void)recordTextLineStraighteningPerSession:(uint64_t)a1 Undos:
{
  void *v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("textLineStraighteningPerSession"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __67__PKStatisticsManager_recordTextLineStraighteningPerSession_Undos___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("sessionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("undoSessionCount");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)recordCopyAsTextWithLength:(uint64_t)a1 time:(uint64_t)a2 didShowHUD:(uint64_t)a3 invokedFromSmartSelection:(int)a4
{
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;

  if (a1)
  {
    +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v5, (void *)*MEMORY[0x1E0D16798]);

    v7 = CFSTR("lasso");
    if (a4)
      v7 = CFSTR("smartSelection");
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.copyAsText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    AnalyticsSendEventLazy();

  }
}

id __92__PKStatisticsManager_recordCopyAsTextWithLength_time_didShowHUD_invokedFromSmartSelection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("textLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("transcriptionDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("didShowHUD");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = CFSTR("invocationType");
  v5 = *(_QWORD *)(a1 + 32);
  v9[2] = v4;
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)recordSelectAllWithStrokeCount:(uint64_t)a1 externalElementsCount:
{
  void *v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.selectAll"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __76__PKStatisticsManager_recordSelectAllWithStrokeCount_externalElementsCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("strokeCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("externalElementsCount");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)recordInsertSpaceWithType:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;

  if (a1)
  {
    +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v3, (void *)*MEMORY[0x1E0D167A8]);

    if ((a2 - 1) > 2)
      v5 = CFSTR("fromLassoDrawAcross");
    else
      v5 = off_1E777B840[a2 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.insertSpace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __49__PKStatisticsManager_recordInsertSpaceWithType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("insertSpaceType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordInsertSpaceAddWhitespace:(uint64_t)a1
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  if (a1)
  {
    v2 = CFSTR("removeWhitespace");
    if (a2)
      v2 = CFSTR("addWhitespace");
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.insertSpace"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __54__PKStatisticsManager_recordInsertSpaceAddWhitespace___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = &unk_1E77EBD30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordJumpToSettings
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("palette.openPreferences"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__43__PKStatisticsManager_recordJumpToSettings__block_invoke()
{
  return &unk_1E77ED078;
}

- (void)recordDrawWithFingerToggle:(uint64_t)a1
{
  void *v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("palette.toggleDrawWithFinger"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

id __50__PKStatisticsManager_recordDrawWithFingerToggle___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("drawWithFingerEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)recordShowRuler
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("ruler.show"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__38__PKStatisticsManager_recordShowRuler__block_invoke()
{
  return &unk_1E77ED0A0;
}

- (void)recordRulerInteractionEndedWithType:(uint64_t)a1 angle:(uint64_t)a2
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  if (a1)
  {
    v2 = CFSTR("mask");
    if (!a2)
      v2 = CFSTR("snap");
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("ruler.interaction"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __65__PKStatisticsManager_recordRulerInteractionEndedWithType_angle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("angle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("type");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)recordPencilAction:(uint64_t)result doubleTap:
{
  if (result)
  {
    +[PKPencilDevice activePencil]();

    return AnalyticsSendEventLazy();
  }
  return result;
}

id __52__PKStatisticsManager_recordPencilAction_doubleTap___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("pencilVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("trigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("bundleId_category");
  +[PKStatisticsManager bundleIDCategory]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)recordPalettePositionChange:(uint64_t)a3 type:
{
  __CFString *v3;
  int v4;
  __CFString *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;

  if (a1)
  {
    switch(a2)
    {
      case 1:
        v3 = CFSTR("TopEdge");
        goto LABEL_12;
      case 2:
        v3 = CFSTR("RightEdge");
        goto LABEL_12;
      case 3:
        v3 = CFSTR("BottomEdge");
        goto LABEL_12;
      case 4:
        v3 = CFSTR("LeftEdge");
        goto LABEL_12;
      case 5:
        v3 = CFSTR("TopLeftCorner");
        goto LABEL_12;
      case 6:
        v3 = CFSTR("TopRightCorner");
        goto LABEL_12;
      case 7:
        v3 = CFSTR("BottomRightCorner");
        goto LABEL_12;
      case 8:
        v3 = CFSTR("BottomLeftCorner");
LABEL_12:
        v4 = 1;
        break;
      default:
        v4 = 0;
        v3 = 0;
        break;
    }
    v5 = CFSTR("drawing");
    v6 = a3 - 1;
    if (a3 != 1)
      v5 = 0;
    if (a3 == 2)
      v5 = CFSTR("ucb");
    v7 = v5;
    if (v6 <= 1)
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("palette.moved"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        AnalyticsSendEventLazy();

      }
    }

  }
}

id __56__PKStatisticsManager_recordPalettePositionChange_type___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("paletteType");
  v3[1] = CFSTR("position");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordAutoMinimizeEnabledDidChange:(uint64_t)a3 type:
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;

  if (a1)
  {
    v3 = CFSTR("drawing");
    if (a3 != 1)
      v3 = 0;
    if (a3 == 2)
      v3 = CFSTR("ucb");
    v4 = v3;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("palette.autominimize"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      AnalyticsSendEventLazy();

    }
  }
}

id __63__PKStatisticsManager_recordAutoMinimizeEnabledDidChange_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("paletteType");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)recordPixelObjectEraseModeChange:(uint64_t)a1
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  if (a1)
  {
    v2 = CFSTR("bitmap");
    if (a2 == 1)
      v2 = CFSTR("object");
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("palette.eraser.typeSelected"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

id __56__PKStatisticsManager_recordPixelObjectEraseModeChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("eraserType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordToolAttributePopoverAppearedForTool:(uint64_t)a1 hadInteraction:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("palette.attributePopover.appear"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    AnalyticsSendEventLazy();

  }
}

id __80__PKStatisticsManager_recordToolAttributePopoverAppearedForTool_hadInteraction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v5[1] = CFSTR("userInteraction");
  v6[0] = v1;
  v5[0] = CFSTR("toolName");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)recordShapeEventWithType:(void *)a1 modeString:(void *)a2
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("shape"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v4;
  AnalyticsSendEventLazy();

}

id __59__PKStatisticsManager_recordShapeEventWithType_modeString___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("shapeType");
  v3[1] = CFSTR("mode");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordCreateShapeWithType:(int)a3 fromMenu:(int)a4 multiple:
{
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  __CFString *v14;

  if (a1)
  {
    +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v8, (void *)*MEMORY[0x1E0D167B8]);

    if ((unint64_t)(a2 - 1) > 0xC)
      v10 = CFSTR("Undefined");
    else
      v10 = off_1E777B858[a2 - 1];
    v11 = *(void **)(a1 + 8);
    v12 = CFSTR("multiple");
    if (!a4)
      v12 = v10;
    *(_QWORD *)(a1 + 8) = v12;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)(a1 + 16) = v13;
    if (a3)
      v14 = CFSTR("fromMenu");
    else
      v14 = CFSTR("fromStroke");
    -[PKStatisticsManager recordShapeEventWithType:modeString:](v10, v14);
  }
}

- (void)recordShapeUndoIfNecessary
{
  double v2;
  void *v3;

  if (a1 && *(_QWORD *)(a1 + 8) && *(double *)(a1 + 16) > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v2 - *(double *)(a1 + 16) < 5.0)
      -[PKStatisticsManager recordShapeEventWithType:modeString:](*(void **)(a1 + 8), CFSTR("undo"));
    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    *(_QWORD *)(a1 + 16) = 0;
  }
}

- (void)recordUndoIfNecessary
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 40))
      *(_BYTE *)(a1 + 56) = 1;
    -[PKStatisticsManager recordShapeUndoIfNecessary](a1);
    -[PKStatisticsManager recordTextLineStraighteningUndoIfNecessary](a1);
  }
}

- (void)recordDataDetectorItemAdd:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;

  if (a1)
  {
    objc_msgSend(a2, "scannerResult");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "type");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = CFSTR("unknown");
    if (v3)
      v5 = (__CFString *)v3;
    v6 = v5;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("datadetector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    AnalyticsSendEventLazy();

  }
}

id __49__PKStatisticsManager_recordDataDetectorItemAdd___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("add");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordDataDetectorItemRemove:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;

  if (a1)
  {
    objc_msgSend(a2, "scannerResult");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "type");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = CFSTR("unknown");
    if (v3)
      v5 = (__CFString *)v3;
    v6 = v5;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("datadetector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    AnalyticsSendEventLazy();

  }
}

id __52__PKStatisticsManager_recordDataDetectorItemRemove___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("remove");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordDataDetectorItemDefaultAction:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;

  if (a1)
  {
    v2 = a2;
    +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v3, (void *)*MEMORY[0x1E0D167A0]);

    objc_msgSend(v2, "scannerResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "type");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("unknown");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("datadetector"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    AnalyticsSendEventLazy();

  }
}

id __59__PKStatisticsManager_recordDataDetectorItemDefaultAction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("action");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordDataDetectorItemMenuAction:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;

  if (a1)
  {
    v2 = a2;
    +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      -[PKCanvasSessionStatisticsManager logFeatureUsed:](v3, (void *)*MEMORY[0x1E0D167A0]);

    objc_msgSend(v2, "scannerResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "type");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("unknown");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("datadetector"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    AnalyticsSendEventLazy();

  }
}

id __56__PKStatisticsManager_recordDataDetectorItemMenuAction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("menu");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordHashtagItemAdd
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("hashtag"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__43__PKStatisticsManager_recordHashtagItemAdd__block_invoke()
{
  return &unk_1E77ED0C8;
}

- (void)recordHashtagItemRemove
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("hashtag"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__46__PKStatisticsManager_recordHashtagItemRemove__block_invoke()
{
  return &unk_1E77ED0F0;
}

- (void)recordHashtagItemActivate
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("hashtag"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__48__PKStatisticsManager_recordHashtagItemActivate__block_invoke()
{
  return &unk_1E77ED118;
}

- (void)recordHashtagItemDeactivate
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("hashtag"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__50__PKStatisticsManager_recordHashtagItemDeactivate__block_invoke()
{
  return &unk_1E77ED140;
}

- (void)recordMentionItemAdd
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("mention"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__43__PKStatisticsManager_recordMentionItemAdd__block_invoke()
{
  return &unk_1E77ED168;
}

- (void)recordMentionItemRemove
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("mention"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__46__PKStatisticsManager_recordMentionItemRemove__block_invoke()
{
  return &unk_1E77ED190;
}

- (void)recordMentionItemActivate
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("mention"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__48__PKStatisticsManager_recordMentionItemActivate__block_invoke()
{
  return &unk_1E77ED1B8;
}

- (void)recordMentionItemDeactivate
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("mention"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__50__PKStatisticsManager_recordMentionItemDeactivate__block_invoke()
{
  return &unk_1E77ED1E0;
}

- (void)submitRecentRollStroke
{
  PKInk *recentRollStrokeInk;
  PKInk *v4;

  recentRollStrokeInk = self->_recentRollStrokeInk;
  if (recentRollStrokeInk)
  {
    -[PKInk _isFountainPenInk](recentRollStrokeInk, "_isFountainPenInk");
    v4 = self->_recentRollStrokeInk;
    self->_recentRollStrokeInk = 0;

    AnalyticsSendEventLazy();
  }
}

id __45__PKStatisticsManager_submitRecentRollStroke__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("pencilStrokeUndone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("barrelRollMaxDegrees");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("toolSelected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("bundleId_category");
  +[PKStatisticsManager bundleIDCategory]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)recordStrokeWithInk:(double)a3 rollAngleDelta:
{
  id v5;
  void *v6;
  _QWORD block[5];
  id v8;
  double v9;

  v5 = a2;
  v6 = v5;
  if (a1
    && a3 > 0.0
    && ((objc_msgSend(v5, "_isFountainPenInkV2") & 1) != 0 || objc_msgSend(v6, "_isMarkerInk")))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PKStatisticsManager_recordStrokeWithInk_rollAngleDelta___block_invoke;
    block[3] = &unk_1E777B778;
    block[4] = a1;
    v8 = v6;
    v9 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __58__PKStatisticsManager_recordStrokeWithInk_rollAngleDelta___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = a1[4];
  v2 = (void *)a1[5];
  v3 = a1[6];
  v4 = v2;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v1, sel_submitRecentRollStroke, 0);
    objc_msgSend((id)v1, "submitRecentRollStroke");
    objc_storeStrong((id *)(v1 + 40), v2);
    *(_QWORD *)(v1 + 48) = v3;
    *(_BYTE *)(v1 + 56) = 0;
    objc_msgSend((id)v1, "performSelector:withObject:afterDelay:", sel_submitRecentRollStroke, 0, 3.0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingPaletteStatistics, 0);
  objc_storeStrong((id *)&self->_recentRollStrokeInk, 0);
  objc_storeStrong((id *)&self->_recentTextLinesStraightened, 0);
  objc_storeStrong((id *)&self->_recentShapeCreated, 0);
}

@end
