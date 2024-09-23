@implementation _HKAudioVisibleRangeQuantityContextDelegate

- (_HKAudioVisibleRangeQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4
{
  _HKAudioVisibleRangeQuantityContextDelegate *v4;
  _HKAudioVisibleRangeOverlaySeries *v5;
  HKLineSeries *audioOverlayLineSeries;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_HKAudioVisibleRangeQuantityContextDelegate;
  v4 = -[_HKAudioStandardQuantityContextDelegate initWithCustomDataSource:primaryDisplayType:](&v8, sel_initWithCustomDataSource_primaryDisplayType_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(_HKAudioVisibleRangeOverlaySeries);
    audioOverlayLineSeries = v4->_audioOverlayLineSeries;
    v4->_audioOverlayLineSeries = &v5->super;

  }
  return v4;
}

- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102___HKAudioVisibleRangeQuantityContextDelegate_valueString_applicationItems_representativeDisplayType___block_invoke;
  v19[3] = &unk_1E9C41A80;
  v19[4] = &v20;
  -[_HKAudioVisibleRangeQuantityContextDelegate _enumerateAudioExposureChartPoints:withBlock:](self, "_enumerateAudioExposureChartPoints:withBlock:", v8, v19);
  objc_msgSend(MEMORY[0x1E0CB62F8], "computeLEQFromAudioExposureValues:", v21[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "unitController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unitForDisplayType:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "doubleValueForUnit:", v13);
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unitController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormattedStringFromValue(v15, v10, v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v20, 8);
  return v17;
}

- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109___HKAudioVisibleRangeQuantityContextDelegate_valueContextString_applicationItems_representativeDisplayType___block_invoke;
  v14[3] = &unk_1E9C41A80;
  v14[4] = &v15;
  -[_HKAudioVisibleRangeQuantityContextDelegate _enumerateAudioExposureChartPoints:withBlock:](self, "_enumerateAudioExposureChartPoints:withBlock:", v8, v14);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16[3]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKTimePeriodString(v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void)_enumerateAudioExposureChartPoints:(id)a3 withBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D829F904](v8);
        objc_msgSend(v12, "userInfo", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6[2](v6, v14);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 = v8;
    }
    while (v8);
  }

}

- (id)formatterForTimescope:(int64_t)a3
{
  return 0;
}

- (HKLineSeries)audioOverlayLineSeries
{
  return self->_audioOverlayLineSeries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioOverlayLineSeries, 0);
}

@end
