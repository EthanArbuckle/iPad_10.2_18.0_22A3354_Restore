@implementation CDRichComplicationSegmentedView

+ (BOOL)isXL
{
  return 0;
}

- (void)setProgress:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDRichComplicationSegmentedView;
  -[CDRichComplicationShapeView setProgress:](&v4, sel_setProgress_, a3);
  -[CDRichComplicationSegmentedView _updateSegmentsWithColors:](self, "_updateSegmentsWithColors:", 0);
}

- (void)_updateSegmentsWithColors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *v7;
  NSMutableArray *segments;
  double v9;
  float v10;
  NSMutableArray *v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = v4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = MEMORY[0x24BDAC760];
  if (v4)
  {
    if (!objc_msgSend(v4, "count"))
      goto LABEL_6;
    *((_BYTE *)v16 + 24) = 1;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    segments = self->_segments;
    self->_segments = v7;

    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __61__CDRichComplicationSegmentedView__updateSegmentsWithColors___block_invoke;
    v14[3] = &unk_24CF21540;
    v14[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  }
  -[CDRichComplicationShapeView progress](self, "progress");
  v10 = v9 * (double)(unint64_t)-[NSMutableArray count](self->_segments, "count");
  v11 = self->_segments;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __61__CDRichComplicationSegmentedView__updateSegmentsWithColors___block_invoke_2;
  v13[3] = &unk_24CF21568;
  v13[4] = &v15;
  v13[5] = vcvtas_u32_f32(v10);
  -[NSMutableArray enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v13);
  if (*((_BYTE *)v16 + 24))
  {
    -[CDRichComplicationShapeView shapeLayer](self, "shapeLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationSegmentedView _addSegmentsToLayer:](self, "_addSegmentsToLayer:", v12);

  }
LABEL_6:
  _Block_object_dispose(&v15, 8);

}

void __61__CDRichComplicationSegmentedView__updateSegmentsWithColors___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  objc_class *v5;
  id v6;
  id v7;

  if (a3 < 9)
  {
    v5 = (objc_class *)MEMORY[0x24BDB8768];
    v6 = a2;
    v7 = (id)objc_msgSend([v5 alloc], "initWithColor:state:", v6, 1);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "addObject:", v7);
  }
  else
  {
    *a4 = 1;
  }
}

void __61__CDRichComplicationSegmentedView__updateSegmentsWithColors___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40) <= a3;
  v7 = v5;
  if (objc_msgSend(v5, "state") != v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    objc_msgSend(v7, "setState:", v6);
  }

}

- (void)_addSegmentsToLayer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  const char *v12;
  double v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  NSMutableArray *segments;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  double v32;
  long double v33;
  double v34;
  double v35;
  double v36;
  uint8_t buf[8];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NSMutableArray count](self->_segments, "count"))
  {
    _CDLoggingObjectForDomain(1, (uint64_t)"CDLoggingDomainView");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v12 = "Cannot add segments to gauge shape layer when there are no segments.";
LABEL_9:
    _os_log_impl(&dword_213031000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    goto LABEL_19;
  }
  if (!v4)
  {
    _CDLoggingObjectForDomain(1, (uint64_t)"CDLoggingDomainView");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v12 = "Cannot add segments to gauge shape layer when the layer is nil.";
    goto LABEL_9;
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)objc_opt_class(), "isXL");
  _LayoutConstants___constants_0_3 = 0x3FFC000000000000;
  _LayoutConstants___constants_1_3 = 0x3FF4000000000000;
  if (v7)
  {
    CLKComplicationGraphicExtraLargeCircularScalingFactor();
    v9 = v8 * *(double *)&_LayoutConstants___constants_0_3;
    *(double *)&_LayoutConstants___constants_0_3 = v8 * *(double *)&_LayoutConstants___constants_0_3;
    v10 = v8 * *(double *)&_LayoutConstants___constants_1_3;
    *(double *)&_LayoutConstants___constants_1_3 = v8 * *(double *)&_LayoutConstants___constants_1_3;
  }
  else
  {
    v9 = 1.75;
    v10 = 1.25;
  }
  -[CDRichComplicationCurveView _outerRadius](self, "_outerRadius");
  v14 = v13;
  -[CDRichComplicationCurveView _shapeLineWidth](self, "_shapeLineWidth");
  v16 = v14 - v15;
  v17 = atan2(v9, v14);
  -[CDRichComplicationSegmentedView _arcAngleWithOuterRadius:segmentGapAngle:numberOfSegments:](self, "_arcAngleWithOuterRadius:segmentGapAngle:numberOfSegments:", -[NSMutableArray count](self->_segments, "count"), (double)v14, v17);
  segments = self->_segments;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __55__CDRichComplicationSegmentedView__addSegmentsToLayer___block_invoke;
  v29[3] = &unk_24CF21590;
  v29[4] = self;
  v31 = v19;
  v32 = v16;
  v33 = v14;
  v34 = v9;
  v35 = v10;
  v36 = v17;
  v20 = v5;
  v30 = v20;
  -[NSMutableArray enumerateObjectsUsingBlock:](segments, "enumerateObjectsUsingBlock:", v29);
  objc_msgSend(v4, "setSublayers:", 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v20;
  v21 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v11);
        objc_msgSend(v4, "addSublayer:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
      }
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
    }
    while (v22);
  }

LABEL_19:
}

void __55__CDRichComplicationSegmentedView__addSegmentsToLayer___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CDCurvedRoundedRectShapeLayer *v12;
  void *v13;
  id v14;
  CGAffineTransform v15;

  v5 = (double)a3 + 1.0;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 608);
  v7 = a2;
  v8 = v5 / (double)(unint64_t)objc_msgSend(v6, "count");
  v9 = v8 + 1.0 / (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "count") * -0.5;
  *(float *)&v9 = v9;
  objc_msgSend(*(id *)(a1 + 32), "_angleAtProgress:", v9);
  v11 = v10;
  v12 = -[CDCurvedRoundedRectShapeLayer initWithAngularWidth:innerRadius:outerRadius:cornerRadius:style:gapAngle:]([CDCurvedRoundedRectShapeLayer alloc], "initWithAngularWidth:innerRadius:outerRadius:cornerRadius:style:gapAngle:", objc_msgSend(*(id *)(a1 + 32), "_segmentShapeStyleForIndex:angle:", a3), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "_centerPoint");
  -[CDCurvedRoundedRectShapeLayer setPosition:](v12, "setPosition:");
  CGAffineTransformMakeRotation(&v15, v11);
  -[CDCurvedRoundedRectShapeLayer setAffineTransform:](v12, "setAffineTransform:", &v15);
  objc_msgSend(*(id *)(a1 + 32), "_colorForSegment:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  -[CDCurvedRoundedRectShapeLayer setFillColor:](v12, "setFillColor:", objc_msgSend(v14, "CGColor"));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
}

- (id)_colorForSegment:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "state");

  if (v5 == 1)
  {
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (int64_t)_segmentShapeStyleForIndex:(unint64_t)a3 angle:(double)a4
{
  if (-[NSMutableArray count](self->_segments, "count", a4) == 1)
    return 3;
  if (a3)
    return 2 * (-[NSMutableArray count](self->_segments, "count") - 1 == a3);
  return 1;
}

- (double)_arcAngleWithOuterRadius:(double)a3 segmentGapAngle:(double)a4 numberOfSegments:(unint64_t)a5
{
  double v6;
  double v7;

  v6 = (double)(a5 - 1) * a4;
  -[CDRichComplicationCurveView _totalDrawableAngle](self, "_totalDrawableAngle");
  return (fabs(v7) - v6) / (double)a5;
}

- (id)_shapeStrokeColor
{
  return 0;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_storeStrong((id *)&self->_segments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
