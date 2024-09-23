@implementation NTKHeartRateRichComplicationRectangularView

- (NTKHeartRateRichComplicationRectangularView)init
{
  NTKHeartRateRichComplicationRectangularView *v2;
  NTKHeartRateRichComplicationRectangularView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKHeartRateRichComplicationRectangularView;
  v2 = -[NTKRichComplicationRectangularDailyGraphView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cornerRadius = 1.0;
    -[NTKHeartRateRichComplicationRectangularView setOpaque:](v2, "setOpaque:", 0);
  }
  return v3;
}

- (void)drawGraph:(CGContext *)a3 rect:(CGRect)a4
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  _QWORD v27[11];
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[NTKHeartRateRichComplicationRectangularView chartPoints](self, "chartPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[NTKHeartRateRichComplicationRectangularView cornerRadius](self, "cornerRadius");
    v13 = y + v12;
    -[NTKHeartRateRichComplicationRectangularView cornerRadius](self, "cornerRadius");
    v15 = height + v14 * -2.0;
    -[NTKHeartRateRichComplicationRectangularView highBPM](self, "highBPM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    -[NTKHeartRateRichComplicationRectangularView lowBPM](self, "lowBPM");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v28.origin.x = x;
    v28.origin.y = v13;
    v28.size.width = width;
    v28.size.height = v15;
    v22 = CGRectGetHeight(v28);
    v23 = 0.0;
    if (v22 > 2.22044605e-16)
    {
      -[NTKHeartRateRichComplicationRectangularView cornerRadius](self, "cornerRadius");
      v23 = (v18 - v21) * (v24 * 3.0 / v22);
    }
    -[NTKHeartRateRichComplicationRectangularView chartPoints](self, "chartPoints");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __62__NTKHeartRateRichComplicationRectangularView_drawGraph_rect___block_invoke;
    v27[3] = &unk_1E6BD3968;
    v27[4] = self;
    *(CGFloat *)&v27[5] = x;
    *(double *)&v27[6] = v13;
    *(CGFloat *)&v27[7] = width;
    *(double *)&v27[8] = v15;
    *(double *)&v27[9] = v23;
    v27[10] = a3;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v27);

    -[NTKRichComplicationRectangularDailyGraphView accentColor](self, "accentColor");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v26, "CGColor"));

    CGContextDrawPath(a3, kCGPathFill);
  }
}

void __62__NTKHeartRateRichComplicationRectangularView_drawGraph_rect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  const CGPath *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_xValueForPointFromChartPoint:inRect:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v5 = v4;
  if (v4 >= CGRectGetMinX(*(CGRect *)(a1 + 40)) && v5 <= CGRectGetMaxX(*(CGRect *)(a1 + 40)))
  {
    v39 = v3;
    objc_msgSend(v3, "yValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __62__NTKHeartRateRichComplicationRectangularView_drawGraph_rect___block_invoke_2;
    v45[3] = &unk_1E6BD3940;
    v8 = v7;
    v46 = v8;
    v47 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v6, "enumerateRangesUsingBlock:", v45);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      v12 = v5 + -0.5;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(obj);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "rangeValue");
          v15 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16 + v14 - 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "highBPM");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "lowBPM");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_yValueForPointFromChartPointValue:betweenHigh:andLow:inRect:", v17, v18, v19, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
          v21 = v20;

          v22 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "highBPM");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "lowBPM");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_yValueForPointFromChartPointValue:betweenHigh:andLow:inRect:", v23, v24, v25, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
          v27 = v26 - v21;

          objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
          v29 = v21 - v28;
          objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
          v31 = v30 + v30;
          objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
          v33 = v27 + v32 * 2.0;
          objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
          v35 = v34;
          objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
          v37 = v36;
          v50.origin.x = v12;
          v50.origin.y = v29;
          v50.size.width = v31;
          v50.size.height = v33;
          v38 = CGPathCreateWithRoundedRect(v50, v35, v37, 0);
          CGContextAddPath(*(CGContextRef *)(a1 + 80), v38);
          CGPathRelease(v38);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v10);
    }

    v3 = v39;
  }

}

void __62__NTKHeartRateRichComplicationRectangularView_drawGraph_rect___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v7;
LABEL_6:
    v18 = (id)v15;
    objc_msgSend(v16, "addObject:");
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeValue");
  v11 = v10;

  if (*(double *)(a1 + 40) <= (double)(unint64_t)(a2 - (v11 + v9) + 1))
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v17;
    goto LABEL_6;
  }
  v12 = a2 + a3 - v9;
  v13 = *(void **)(a1 + 32);
  v14 = objc_msgSend(v13, "count") - 1;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v9, v12);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v14);
LABEL_7:

}

- (void)loadWithMetadata:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NTKHeartRateRichComplicationMetadataKeyIsLocked"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
      -[NTKHeartRateRichComplicationRectangularView _loadLockedState](self, "_loadLockedState");
    else
      -[NTKHeartRateRichComplicationRectangularView _loadWithMetadata:](self, "_loadWithMetadata:", v6);
  }
  else
  {
    -[NTKHeartRateRichComplicationRectangularView _loadNoDataState](self, "_loadNoDataState");
  }
  -[NTKHeartRateRichComplicationRectangularView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)_loadLockedState
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: Load locked state.", v8, 2u);
  }

  NTKClockFaceLocalizedString(CFSTR("HEART_RATE_SIGNATURE_LARGE_LOCKED"), CFSTR("Unlock to View"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseStringWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView resetToNoDataState:](self, "resetToNoDataState:", v7);

  -[NTKHeartRateRichComplicationRectangularView setHighBPM:](self, "setHighBPM:", &unk_1E6C9EC80);
  -[NTKHeartRateRichComplicationRectangularView setLowBPM:](self, "setLowBPM:", &unk_1E6C9EC80);
  -[NTKHeartRateRichComplicationRectangularView setChartPoints:](self, "setChartPoints:", 0);
}

- (void)_loadNoDataState
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: Load no data state.", v8, 2u);
  }

  NTKClockFaceLocalizedString(CFSTR("HEART_RATE_SIGNATURE_LARGE_NO_DATA"), CFSTR("No Heart Rate Data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseStringWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationRectangularDailyGraphView resetToNoDataState:](self, "resetToNoDataState:", v7);

  -[NTKHeartRateRichComplicationRectangularView setHighBPM:](self, "setHighBPM:", &unk_1E6C9EC80);
  -[NTKHeartRateRichComplicationRectangularView setLowBPM:](self, "setLowBPM:", &unk_1E6C9EC80);
  -[NTKHeartRateRichComplicationRectangularView setChartPoints:](self, "setChartPoints:", 0);
}

- (void)_loadWithMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NTKHeartRateRichComplicationMetadataKeyDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NTKHeartRateRichComplicationRectangularView setMeasurementDate:](self, "setMeasurementDate:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKHeartRateRichComplicationRectangularView setMeasurementDate:](self, "setMeasurementDate:", v6);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NTKHeartRateRichComplicationMetadataKeyBPM"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_READING"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v13);

    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v64 = v7;
      v65 = 2112;
      v66 = (uint64_t)v12;
      _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: loadWithMetadata with bpm:%{public}@ bpmTextProvider:%@", buf, 0x16u);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NTKHeartRateRichComplicationMetadataKeyIsNow"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      v62 = v11;
      v17 = v8;
      v18 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("HEART_RATE_TIME_NOW"), CFSTR("Now"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredLocale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uppercaseStringWithLocale:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textProviderWithText:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v23;
        _os_log_impl(&dword_1B72A3000, v24, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: isNowReading with dateTextProvider:%@", buf, 0xCu);
      }

      v8 = v17;
      v11 = v62;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NTKHeartRateRichComplicationMetadataKeyFutureEntry"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

      if (v31)
        v32 = 48;
      else
        v32 = 112;
      v33 = NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings();
      v34 = (uint64_t *)MEMORY[0x1E0C94068];
      if (!v33)
        v34 = (uint64_t *)MEMORY[0x1E0C94060];
      v35 = *v34;
      v36 = (void *)MEMORY[0x1E0C94508];
      -[NTKHeartRateRichComplicationRectangularView measurementDate](self, "measurementDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "textProviderWithDate:style:units:", v37, v35, v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRelativeToDate:", v38);

      objc_msgSend(v23, "setTimeTravelUpdateFrequency:", 0);
      objc_msgSend(v23, "setDisableOffsetPrefix:", 1);
    }
    +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTintColor:", v39);

    v40 = (void *)MEMORY[0x1E0C94540];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_SIGNATURE_LARGE_CURRENT_READING_FORMAT"), CFSTR("%1$@ %2$@"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "textProviderWithFormat:", v41, v12, v23);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTintColor:", v43);

    -[NTKRichComplicationRectangularDailyGraphView titleLabel](self, "titleLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTextProvider:", v42);

  }
  else
  {
    v25 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_TITLE"), CFSTR("Heart Rate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "textProviderWithText:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTintColor:", v28);

    -[NTKRichComplicationRectangularDailyGraphView titleLabel](self, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTextProvider:", v27);

  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateRichComplicationRectangularView measurementDate](self, "measurementDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "startOfDayForDate:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKHeartRateRichComplicationRectangularView measurementDate](self, "measurementDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "hk_startOfDateByAddingDays:toDate:", 1, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v47, v49);
  -[NTKHeartRateRichComplicationRectangularView setMeasurementDateDayInterval:](self, "setMeasurementDateDayInterval:", v50);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NTKHeartRateRichComplicationMetadataKeyDailyHighBPM"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateRichComplicationRectangularView setHighBPM:](self, "setHighBPM:", v51);

  -[NTKRichComplicationRectangularDailyGraphView dailyHighLabel](self, "dailyHighLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateRichComplicationRectangularView highBPM](self, "highBPM");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateRichComplicationRectangularView _updateDailyLabel:withBPM:](self, "_updateDailyLabel:withBPM:", v52, v53);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NTKHeartRateRichComplicationMetadataKeyDailyLowBPM"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateRichComplicationRectangularView setLowBPM:](self, "setLowBPM:", v54);

  -[NTKRichComplicationRectangularDailyGraphView dailyLowLabel](self, "dailyLowLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateRichComplicationRectangularView lowBPM](self, "lowBPM");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateRichComplicationRectangularView _updateDailyLabel:withBPM:](self, "_updateDailyLabel:withBPM:", v55, v56);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NTKHeartRateRichComplicationMetadataKeyChartPoints"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateRichComplicationRectangularView setChartPoints:](self, "setChartPoints:", v57);

  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKHeartRateRichComplicationRectangularView measurementDate](self, "measurementDate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKHeartRateRichComplicationRectangularView chartPoints](self, "chartPoints");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "count");
    *(_DWORD *)buf = 138543618;
    v64 = v59;
    v65 = 2048;
    v66 = v61;
    _os_log_impl(&dword_1B72A3000, v58, OS_LOG_TYPE_DEFAULT, "NTKHeartRateRichComplicationRectangularView: Load with metadata. measurementDate? %{public}@, chartPointCount? %lu", buf, 0x16u);

  }
}

- (double)_xValueForPointFromChartPoint:(id)a3 inRect:(CGRect)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double result;

  objc_msgSend(a3, "xValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCA75D0]();

  -[NTKHeartRateRichComplicationRectangularView measurementDateDayInterval](self, "measurementDateDayInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCA75D0]();

  -[NTKHeartRateRichComplicationRectangularView measurementDateDayInterval](self, "measurementDateDayInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCA75D0]();

  FIUIChartRelativePositionForXPlaneValue();
  FIUIChartAbsolutePositionForXPlaneValue();
  return result;
}

- (double)_yValueForPointFromChartPointValue:(id)a3 betweenHigh:(id)a4 andLow:(id)a5 inRect:(CGRect)a6
{
  id v8;
  id v9;
  double result;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v8, "doubleValue");

  objc_msgSend(v9, "doubleValue");
  FIUIChartRelativePositionForYPlaneValue();
  FIUIChartAbsolutePositionForYPlaneValue();
  return result;
}

- (void)_updateDailyLabel:(id)a3 withBPM:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
    objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", a4, 0);
  else
    +[NTKRichComplicationRectangularDailyGraphView dailyFormattedNoData](NTKRichComplicationRectangularDailyGraphView, "dailyFormattedNoData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  -[NTKRichComplicationRectangularDailyGraphView accentColor](self, "accentColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (NSArray)chartPoints
{
  return self->_chartPoints;
}

- (void)setChartPoints:(id)a3
{
  objc_storeStrong((id *)&self->_chartPoints, a3);
}

- (NSNumber)highBPM
{
  return self->_highBPM;
}

- (void)setHighBPM:(id)a3
{
  self->_highBPM = (NSNumber *)a3;
}

- (NSNumber)lowBPM
{
  return self->_lowBPM;
}

- (void)setLowBPM:(id)a3
{
  self->_lowBPM = (NSNumber *)a3;
}

- (NSDate)measurementDate
{
  return self->_measurementDate;
}

- (void)setMeasurementDate:(id)a3
{
  objc_storeStrong((id *)&self->_measurementDate, a3);
}

- (NSDateInterval)measurementDateDayInterval
{
  return self->_measurementDateDayInterval;
}

- (void)setMeasurementDateDayInterval:(id)a3
{
  objc_storeStrong((id *)&self->_measurementDateDayInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementDateDayInterval, 0);
  objc_storeStrong((id *)&self->_measurementDate, 0);
  objc_storeStrong((id *)&self->_chartPoints, 0);
}

@end
