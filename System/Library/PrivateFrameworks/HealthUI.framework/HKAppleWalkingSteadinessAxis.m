@implementation HKAppleWalkingSteadinessAxis

+ (id)standardAxisWithDisplayType:(id)a3
{
  id v3;
  HKAppleWalkingSteadinessAxis *v4;

  v3 = a3;
  v4 = -[HKAppleWalkingSteadinessAxis initWithDisplayType:]([HKAppleWalkingSteadinessAxis alloc], "initWithDisplayType:", v3);

  return v4;
}

- (HKAppleWalkingSteadinessAxis)initWithDisplayType:(id)a3
{
  id v5;
  HKNumericAxisConfiguration *v6;
  void *v7;
  HKAppleWalkingSteadinessAxis *v8;
  HKAppleWalkingSteadinessAxis *v9;
  uint64_t v10;
  NSArray *cachedAxisLabels;
  objc_super v13;

  v5 = a3;
  v6 = objc_alloc_init(HKNumericAxisConfiguration);
  +[HKNumericAxis preferredAxisStyle](HKNumericAxis, "preferredAxisStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisConfiguration setPreferredStyle:](v6, "setPreferredStyle:", v7);

  -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](v6, "setTopVerticalLabelPadding:", 5.0);
  -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](v6, "setBottomVerticalLabelPadding:", 5.0);
  v13.receiver = self;
  v13.super_class = (Class)HKAppleWalkingSteadinessAxis;
  v8 = -[HKNumericAxis initWithConfiguration:](&v13, sel_initWithConfiguration_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayType, a3);
    -[HKAppleWalkingSteadinessAxis _axisLabelsForClassificationsWithDisplayType:](v9, "_axisLabelsForClassificationsWithDisplayType:", v9->_displayType);
    v10 = objc_claimAutoreleasedReturnValue();
    cachedAxisLabels = v9->_cachedAxisLabels;
    v9->_cachedAxisLabels = (NSArray *)v10;

  }
  return v9;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSArray *v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;

  v5 = a3;
  objc_msgSend(v5, "minValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v5, "maxValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = 0;
  if (fabs(v8) != INFINITY && fabs(v11) != INFINITY)
  {
    v13 = fabs(v11 - v8);
    v14 = (unint64_t)(*(_QWORD *)&v13 - 1) < 0xFFFFFFFFFFFFFLL;
    v15 = (unint64_t)(*(_QWORD *)&v13 - 0x10000000000000) >> 53 < 0x3FF;
    if (COERCE__INT64(v11 - v8) >= 0)
    {
      v15 = 0;
      v14 = 0;
    }
    v16 = fabs(v11 - v8);
    if (!v16)
      v14 = 1;
    v17 = v16 == 0x7FF0000000000000 || v14;
    if (v16 > 0x7FF0000000000000)
      v17 = 1;
    if (((v17 | v15) & 1) != 0)
      return 0;
    v12 = self->_cachedAxisLabels;
  }
  return v12;
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  double v9;
  double v10;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint result;

  v11.receiver = self;
  v11.super_class = (Class)HKAppleWalkingSteadinessAxis;
  -[HKAxis renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:](&v11, sel_renderPositionForLabelLocation_rect_zoomScale_contentOffset_constantOffset_isHorizontal_optionalOffset_, a3, a8, *(_QWORD *)&a9.x, *(_QWORD *)&a9.y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5, a6.x, a6.y, a7, v12, v13);
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)_axisLabelsForClassificationsWithDisplayType:(id)a3
{
  id v3;
  id v4;
  void (**v5)(void *, uint64_t, uint64_t, _QWORD);
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__22;
  v15 = __Block_byref_object_dispose__22;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__HKAppleWalkingSteadinessAxis__axisLabelsForClassificationsWithDisplayType___block_invoke;
  v8[3] = &unk_1E9C452B8;
  v4 = v3;
  v9 = v4;
  v10 = &v11;
  v5 = (void (**)(void *, uint64_t, uint64_t, _QWORD))_Block_copy(v8);
  v5[2](v5, 3, 1, 0);
  v5[2](v5, 2, 1, 0);
  v5[2](v5, 1, 1, 1);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __77__HKAppleWalkingSteadinessAxis__axisLabelsForClassificationsWithDisplayType___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  HKAxisLabel *v13;
  void *v14;
  void *v15;
  void *v16;
  HKAxisLabel *v17;
  void *v18;
  void *v19;
  void *v20;
  HKAxisLabel *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  hk_minWalkingSteadinessValueForClassification();
  v9 = v8;
  hk_maxWalkingSteadinessValueForClassification();
  v11 = v10;
  v12 = v9 + (v10 - v9) * 0.5;
  +[HKMobilityUtilities localizedAxisLabelStringForClassification:](HKMobilityUtilities, "localizedAxisLabelStringForClassification:", a2);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v13 = objc_alloc_init(HKAxisLabel);
    -[HKAxisLabel setLabelType:](v13, "setLabelType:", 1);
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "presentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "adjustedDoubleForDaemonDouble:", v9);
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisLabel setLocation:](v13, "setLocation:", v16);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v13);
  }
  v17 = objc_alloc_init(HKAxisLabel);
  -[HKAxisLabel setLabelType:](v17, "setLabelType:", 0);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "presentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "adjustedDoubleForDaemonDouble:", v12);
  objc_msgSend(v18, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisLabel setLocation:](v17, "setLocation:", v20);

  -[HKAxisLabel setText:](v17, "setText:", v25);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v17);
  if (a4)
  {
    v21 = objc_alloc_init(HKAxisLabel);
    -[HKAxisLabel setLabelType:](v21, "setLabelType:", 1);
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "presentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "adjustedDoubleForDaemonDouble:", v11);
    objc_msgSend(v22, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisLabel setLocation:](v21, "setLocation:", v24);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v21);
  }

}

- (NSArray)cachedAxisLabels
{
  return self->_cachedAxisLabels;
}

- (void)setCachedAxisLabels:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAxisLabels, a3);
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_cachedAxisLabels, 0);
}

@end
