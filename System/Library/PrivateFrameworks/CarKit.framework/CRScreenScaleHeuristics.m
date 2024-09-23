@implementation CRScreenScaleHeuristics

+ (void)scaledDisplays:(id)a3 reply:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = (void (**)(id, id, _QWORD))a4;
    v7 = a3;
    v8 = (void *)objc_opt_new();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__CRScreenScaleHeuristics_scaledDisplays_reply___block_invoke;
    v11[3] = &unk_1E54286A0;
    v13 = a1;
    v9 = v8;
    v12 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

    CarGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1A83A2000, v10, OS_LOG_TYPE_DEFAULT, "CRScreenScaleHeuristics: displays: %@", buf, 0xCu);
    }

    v6[2](v6, v9, 0);
  }
}

void __48__CRScreenScaleHeuristics_scaledDisplays_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  const __CFDictionary *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  double height;
  double width;
  double v12;
  double v13;
  void *v14;
  signed int v15;
  int v16;
  BOOL v17;
  double v18;
  double v19;
  CFDictionaryRef DictionaryRepresentation;
  void *v21;
  char v22;
  double v23;
  void *v24;
  void *v25;
  CGSize v26;
  CGSize v27;
  _QWORD v28[3];
  _QWORD v29[4];
  CGSize v30;

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CA45C0];
  v6 = a2;
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CA45C8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CA45C8]);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v27.width = 0.0;
  v27.height = 0.0;
  v26.width = 0.0;
  v26.height = 0.0;
  CRSizeFromDictionary(v7, &v27);
  CRSizeFromDictionary(v9, &v26);
  width = v26.width;
  height = v26.height;
  v12 = 684.0;
  v13 = v27.width / v27.height;
  objc_msgSend(v6, "objectForKey:", CFSTR("ViewAreas"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27.height > 80.0 || v26.height < 600.0 || v26.height >= 684.0 || v13 < 1.6)
  {
    if (v27.height == 156.0 && v26.height == 1172.0 && v13 <= 1.0)
    {
      v15 = ((int)(v13 * 1380.0) + 1) & 0xFFFFFFFE;
      v16 = 1380;
    }
    else
    {
      v15 = (int)width;
      v16 = (int)height;
      if (v27.height == 91.0 && v26.height == 720.0)
      {
        v17 = v13 < 2.4 || v14 == 0;
        if (!v17 && objc_msgSend(*(id *)(a1 + 40), "viewAreas:containsSize:", v14, 1760.0, 660.0))
        {
          v15 = ((int)(v13 * 774.0) + 1) & 0xFFFFFFFE;
          v16 = 774;
          v12 = 660.0;
        }
      }
    }
  }
  else
  {
    v15 = ((int)(v13 * 720.0) + 1) & 0xFFFFFFFE;
    v16 = 720;
  }
  v18 = (double)v15;
  v19 = (double)v16;
  v30.width = (double)v15;
  v30.height = (double)v16;
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v30);
  if (a3)
  {
    +[CARPrototypePref force3xCluster](CARPrototypePref, "force3xCluster");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "valueBool");

    v23 = 3.0;
    if ((v22 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "getSecondaryDisplayScale:physicalSize:", v18, v19, v27.width, v27.height);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "getPrimaryDisplayScale:viewAreas:widthThreshold:heightThreshold:", v14, v18, (double)v16, 1122.0, v12);
  }
  v28[0] = v5;
  v28[1] = v8;
  v29[0] = v7;
  v29[1] = DictionaryRepresentation;
  v28[2] = CFSTR("preferredUIScale");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v25);
}

+ (double)getPrimaryDisplayScale:(CGSize)a3 viewAreas:(id)a4 widthThreshold:(double)a5 heightThreshold:(double)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  float v12;
  double v13;
  _QWORD v15[7];
  uint64_t v16;
  float *v17;
  uint64_t v18;
  float v19;

  height = a3.height;
  width = a3.width;
  v10 = a4;
  v11 = v10;
  v16 = 0;
  v17 = (float *)&v16;
  v18 = 0x2020000000;
  v12 = 2.0;
  if (width >= a5 && height >= a6)
    v12 = 3.0;
  v19 = v12;
  if (v10 && width >= a5 && height >= a6 && objc_msgSend(v10, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__CRScreenScaleHeuristics_getPrimaryDisplayScale_viewAreas_widthThreshold_heightThreshold___block_invoke;
    v15[3] = &unk_1E54286C8;
    *(double *)&v15[5] = a5;
    *(double *)&v15[6] = a6;
    v15[4] = &v16;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
  }
  v13 = v17[6];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __91__CRScreenScaleHeuristics_getPrimaryDisplayScale_viewAreas_widthThreshold_heightThreshold___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  float v10;
  double v11;
  double v12;

  v6 = a2;
  objc_msgSend(v6, "objectForKey:", CFSTR("safeArea"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("safeArea"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    v11 = 0.0;
    v12 = 0.0;
    CRSizeFromAirPlayDictionary(v8, &v11);
    if (v11 < *(double *)(a1 + 40))
      goto LABEL_8;
    v9 = 2.0;
    if (v12 >= *(double *)(a1 + 48))
      v9 = 3.0;
    v10 = v9;
    if (v10 < 3.0)
    {
LABEL_8:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0x40000000;
      *a4 = 1;
    }
  }

}

+ (double)getPrimaryDisplayScale:(CGSize)a3 viewAreas:(id)a4
{
  double result;

  objc_msgSend(a1, "getPrimaryDisplayScale:viewAreas:widthThreshold:heightThreshold:", a4, a3.width, a3.height, 1122.0, 684.0);
  return result;
}

+ (double)getSecondaryDisplayScale:(CGSize)a3 physicalSize:(CGSize)a4
{
  return 2.0;
}

+ (BOOL)viewAreas:(id)a3 containsSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v6;
  char v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__CRScreenScaleHeuristics_viewAreas_containsSize___block_invoke;
  v9[3] = &unk_1E54286C8;
  *(CGFloat *)&v9[5] = width;
  *(CGFloat *)&v9[6] = height;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __50__CRScreenScaleHeuristics_viewAreas_containsSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v9;
  double v10;

  v9 = 0.0;
  v10 = 0.0;
  result = CRSizeFromAirPlayDictionary(a2, &v9);
  if (v9 == *(double *)(a1 + 40)
    && v10 == *(double *)(a1 + 48)
    && (v9 != *MEMORY[0x1E0C9D820] || v10 != *(double *)(MEMORY[0x1E0C9D820] + 8)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
