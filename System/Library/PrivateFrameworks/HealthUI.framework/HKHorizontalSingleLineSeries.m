@implementation HKHorizontalSingleLineSeries

- (HKHorizontalSingleLineSeries)init
{
  HKHorizontalSingleLineSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  uint64_t v5;
  UIColor *baseColorStorage;
  UIImage *selectedPointMarkerImageStorage;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKHorizontalSingleLineSeries;
  v2 = -[HKGraphSeries init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKHorizontalSingleLineSeriesLock"));
    v2->_topInsetPercentageStorage = 0.5;
    v2->_shouldConnectPointsStorage = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = objc_claimAutoreleasedReturnValue();
    baseColorStorage = v2->_baseColorStorage;
    v2->_baseColorStorage = (UIColor *)v5;

    v2->_lineWidthStorage = 3.0;
    v2->_selectedLineWidthStorage = 7.0;
    v2->_markRadiusStorage = 3.5;
    selectedPointMarkerImageStorage = v2->_selectedPointMarkerImageStorage;
    v2->_selectedPointMarkerImageStorage = 0;

  }
  return v2;
}

- (double)topInsetPercentage
{
  void *v3;
  double topInsetPercentageStorage;
  void *v5;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  topInsetPercentageStorage = self->_topInsetPercentageStorage;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return topInsetPercentageStorage;
}

- (void)setTopInsetPercentage:(double)a3
{
  void *v5;
  id v6;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_topInsetPercentageStorage = a3;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (BOOL)shouldConnectPoints
{
  void *v3;
  void *v4;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_shouldConnectPointsStorage;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setShouldConnectPoints:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_shouldConnectPointsStorage = a3;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (UIColor)baseColor
{
  void *v3;
  UIColor *v4;
  void *v5;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_baseColorStorage;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setBaseColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *baseColorStorage;
  id v7;

  v4 = (UIColor *)a3;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  baseColorStorage = self->_baseColorStorage;
  self->_baseColorStorage = v4;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (double)lineWidth
{
  void *v3;
  double lineWidthStorage;
  void *v5;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  lineWidthStorage = self->_lineWidthStorage;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return lineWidthStorage;
}

- (void)setLineWidth:(double)a3
{
  void *v5;
  id v6;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_lineWidthStorage = a3;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (double)selectedLineWidth
{
  void *v3;
  double selectedLineWidthStorage;
  void *v5;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  selectedLineWidthStorage = self->_selectedLineWidthStorage;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return selectedLineWidthStorage;
}

- (void)setSelectedLineWidth:(double)a3
{
  void *v5;
  id v6;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_selectedLineWidthStorage = a3;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (double)markRadius
{
  void *v3;
  double markRadiusStorage;
  void *v5;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  markRadiusStorage = self->_markRadiusStorage;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return markRadiusStorage;
}

- (void)setMarkRadius:(double)a3
{
  void *v5;
  id v6;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_markRadiusStorage = a3;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (UIImage)selectedPointMarkerImage
{
  void *v3;
  UIImage *v4;
  void *v5;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_selectedPointMarkerImageStorage;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSelectedPointMarkerImage:(id)a3
{
  UIImage *v4;
  void *v5;
  UIImage *selectedPointMarkerImageStorage;
  id v7;

  v4 = (UIImage *)a3;
  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  selectedPointMarkerImageStorage = self->_selectedPointMarkerImageStorage;
  self->_selectedPointMarkerImageStorage = v4;

  -[HKHorizontalSingleLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  double v20;
  CGFloat v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  CGColor *v26;
  CGColor *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  __int128 v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  id v53;
  CGImage *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[3];
  _QWORD v67[18];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char v72;
  char v73;
  uint64_t v74;
  CGFloat *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  CGFloat *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  CGFloat *v87;
  uint64_t v88;
  unint64_t v89;
  _QWORD v90[3];
  char v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint64_t v103;
  CGRect v104;
  CGRect v105;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v103 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v59 = a5;
  v60 = a8;
  v61 = a9;
  -[HKHorizontalSingleLineSeries yCoordinateForLevel:chartRect:](self, "yCoordinateForLevel:chartRect:", 0, x, y, width, height);
  v21 = v20;
  v22 = -[HKGraphSeries isHighlighted](self, "isHighlighted");
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  if (objc_msgSend(v19, "numCoordinates") >= 1)
  {
    CGContextSaveGState(a7);
    -[HKHorizontalSingleLineSeries baseColor](self, "baseColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "colorWithAlphaComponent:", 0.55);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_retainAutorelease(v23);
    v26 = (CGColor *)objc_msgSend(v58, "CGColor");
    v57 = objc_retainAutorelease(v24);
    v27 = (CGColor *)objc_msgSend(v57, "CGColor");
    v56 = objc_retainAutorelease(v25);
    v28 = objc_msgSend(v56, "CGColor");
    -[HKHorizontalSingleLineSeries markRadius](self, "markRadius");
    v30 = v29;
    -[HKHorizontalSingleLineSeries lineWidth](self, "lineWidth");
    v32 = v31;
    -[HKHorizontalSingleLineSeries selectedLineWidth](self, "selectedLineWidth");
    v34 = v33;
    LOBYTE(v23) = -[HKHorizontalSingleLineSeries shouldConnectPoints](self, "shouldConnectPoints");
    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = __Block_byref_object_copy__3;
    v96 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v97 = (id)objc_claimAutoreleasedReturnValue();
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x2020000000;
    v91 = 1;
    v86 = 0;
    v87 = (CGFloat *)&v86;
    v88 = 0x2020000000;
    v89 = 0xFFEFFFFFFFFFFFFFLL;
    v82 = 0;
    v83 = (CGFloat *)&v82;
    v84 = 0x2020000000;
    v85 = 0xFFEFFFFFFFFFFFFFLL;
    v78 = 0;
    v79 = &v78;
    v80 = 0x2020000000;
    v81 = 0;
    v74 = 0;
    v75 = (CGFloat *)&v74;
    v76 = 0x2020000000;
    v77 = 0xFFEFFFFFFFFFFFFFLL;
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __171__HKHorizontalSingleLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
    v67[3] = &unk_1E9C40A10;
    v72 = (char)v23;
    v67[4] = &v82;
    v67[5] = v90;
    v73 = v22;
    v67[10] = a7;
    v67[11] = v26;
    *(CGFloat *)&v67[12] = v32;
    v67[13] = v27;
    *(CGFloat *)&v67[14] = v34;
    v67[15] = v28;
    *(double *)&v67[16] = v30;
    *(CGFloat *)&v67[17] = v21;
    v67[6] = &v86;
    v67[7] = &v92;
    v70 = v100;
    v71 = v101;
    v68 = v98;
    v69 = v99;
    v67[8] = &v78;
    v67[9] = &v74;
    v35 = *(_OWORD *)&a6->c;
    v66[0] = *(_OWORD *)&a6->a;
    v66[1] = v35;
    v66[2] = *(_OWORD *)&a6->tx;
    objc_msgSend(v19, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v66, 1, v67);
    _drawSeriesGroup(a7, v22, v26, v27, (uint64_t)v26, v32, v34, v30, v87[3], v83[3], v21);
    v55 = v19;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v36 = (id)v93[5];
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, v102, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v63 != v38)
            objc_enumerationMutation(v36);
          v40 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v40, "xCoord");
          v42 = v41;
          v43 = objc_msgSend(v40, "markStyle");
          if (v43 == 1)
          {
            +[HKGraphSeries drawInnerDotMarkerInContext:outColor:inColor:x:y:radius:](HKGraphSeries, "drawInnerDotMarkerInContext:outColor:inColor:x:y:radius:", a7, v26, v28, v42, v21, v30);
          }
          else if (v43 == 2)
          {
            +[HKGraphSeries drawFilledMarkerInContext:color:x:y:radius:](HKGraphSeries, "drawFilledMarkerInContext:color:x:y:radius:", a7, v26, v42, v21, v30);
          }
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, v102, 16);
      }
      while (v37);
    }

    v19 = v55;
    if (*((_BYTE *)v79 + 24))
    {
      -[HKHorizontalSingleLineSeries selectedPointMarkerImage](self, "selectedPointMarkerImage");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        -[HKHorizontalSingleLineSeries selectedPointMarkerImage](self, "selectedPointMarkerImage");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = HKChartSeriesPointMarkerBaseRect(v45);
        v48 = v47;
        v50 = v49;
        v52 = v51;

        -[HKHorizontalSingleLineSeries selectedPointMarkerImage](self, "selectedPointMarkerImage");
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v54 = (CGImage *)objc_msgSend(v53, "CGImage");

        v104.origin.x = v46;
        v104.origin.y = v48;
        v104.size.width = v50;
        v104.size.height = v52;
        v105 = CGRectOffset(v104, v75[3], v21);
        CGContextDrawImage(a7, v105, v54);
      }

    }
    CGContextRestoreGState(a7);
    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(v90, 8);
    _Block_object_dispose(&v92, 8);

  }
}

void __171__HKHorizontalSingleLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5;
  char v6;
  double v7;
  double v8;
  uint64_t v9;
  _HKHorizontalSingleLineSeriesMarkEntry *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _HKHorizontalSingleLineSeriesMarkEntry *v14;
  _OWORD v15[4];
  _OWORD v16[2];

  v5 = a2;
  v6 = objc_msgSend(v5, "groupToPrevious");
  objc_msgSend(v5, "xValue");
  v8 = v7;
  v9 = objc_msgSend(v5, "markStyle");

  if (*(_BYTE *)(a1 + 208))
  {
    if ((v6 & 1) == 0)
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        _drawSeriesGroup(*(CGContext **)(a1 + 80), *(unsigned __int8 *)(a1 + 209), *(CGColor **)(a1 + 88), *(CGColor **)(a1 + 104), *(_QWORD *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 112), *(double *)(a1 + 128), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(CGFloat *)(a1 + 136));
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
    if (*(_BYTE *)(a1 + 209))
    {
      v10 = -[_HKHorizontalSingleLineSeriesMarkEntry initWithXCoord:markStyle:]([_HKHorizontalSingleLineSeriesMarkEntry alloc], "initWithXCoord:markStyle:", 2, v8);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v10);

    }
  }
  else
  {
    _drawSeriesGroup(*(CGContext **)(a1 + 80), *(unsigned __int8 *)(a1 + 209), *(CGColor **)(a1 + 88), *(CGColor **)(a1 + 104), *(_QWORD *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 112), *(double *)(a1 + 128), v8, v8, *(CGFloat *)(a1 + 136));
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(a1 + 209))
  {
    v11 = a3[1];
    v16[0] = *a3;
    v16[1] = v11;
    v12 = *(_OWORD *)(a1 + 160);
    v15[0] = *(_OWORD *)(a1 + 144);
    v15[1] = v12;
    v13 = *(_OWORD *)(a1 + 192);
    v15[2] = *(_OWORD *)(a1 + 176);
    v15[3] = v13;
    if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v16, (uint64_t *)v15))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;
    }
  }
  if (v9)
  {
    v14 = -[_HKHorizontalSingleLineSeriesMarkEntry initWithXCoord:markStyle:]([_HKHorizontalSingleLineSeriesMarkEntry alloc], "initWithXCoord:markStyle:", v9, v8);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v14);

  }
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _HKHorizontalSingleLineSeriesCoordinate *v25;
  void *v26;
  void *v28;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  int64_t resolution;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  objc_msgSend(a3, "chartPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalSingleLineSeries.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  v30 = v9;
  objc_msgSend(v9, "transform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v16, "xValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinateForValue:", v17);
        v19 = v18;
        objc_msgSend(v16, "yValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "integerValue");
        LODWORD(v22) = objc_msgSend(v16, "groupToPrevious");
        v23 = objc_msgSend(v16, "markStyle");
        objc_msgSend(v16, "userInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 != 3)
        {
          if (v23 == 1)
            v22 = 0;
          else
            v22 = v22;
          v25 = -[_HKHorizontalSingleLineSeriesCoordinate initWithXValue:yValue:groupToPrevious:markStyle:userInfo:]([_HKHorizontalSingleLineSeriesCoordinate alloc], "initWithXValue:yValue:groupToPrevious:markStyle:userInfo:", v21, v22, v23, v24, v19);
          objc_msgSend(v31, "addObject:", v25);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v13);
  }

  v33 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v31, &v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (double)yCoordinateForLevel:(int64_t)a3 chartRect:(CGRect)a4
{
  double height;
  double v5;

  height = a4.size.height;
  -[HKHorizontalSingleLineSeries topInsetPercentage](self, "topInsetPercentage", a3, a4.origin.x, a4.origin.y, a4.size.width);
  return HKUIFloorToScreenScale(height * v5);
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalSingleLineSeries.m"), 405, CFSTR("distanceFromPoint type class failure"));

  }
  v14 = v13;
  objc_msgSend(v14, "xValue");
  v16 = v15;
  v17 = objc_msgSend(v14, "yValue");

  -[HKHorizontalSingleLineSeries yCoordinateForLevel:chartRect:](self, "yCoordinateForLevel:chartRect:", v17, x, y, width, height);
  v19 = sqrt((v18 - v9) * (v18 - v9) + (v16 - v10) * (v16 - v10));

  return v19;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  id v8;
  double v9;
  double v10;
  void *v12;

  x = a3.x;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalSingleLineSeries.m"), 422, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  objc_msgSend(v8, "xValue");
  v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  id v12;
  double v13;
  double v14;
  void *v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.y;
  v12 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalSingleLineSeries.m"), 430, CFSTR("yAxisDistanceFromPoint type class failure"));

  }
  -[HKHorizontalSingleLineSeries yCoordinateForLevel:chartRect:](self, "yCoordinateForLevel:chartRect:", objc_msgSend(v12, "yValue"), x, y, width, height);
  v14 = v13 - v9;

  return v14;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalSingleLineSeries.m"), 439, CFSTR("comparison type class failure"));

  }
  v9 = v8;
  v10 = objc_msgSend(v7, "yValue");
  v11 = objc_msgSend(v9, "yValue");

  return v10 < v11;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalSingleLineSeries.m"), 447, CFSTR("comparison type class failure"));

  }
  v9 = v8;
  v10 = objc_msgSend(v7, "yValue");
  v11 = objc_msgSend(v9, "yValue");

  return v10 > v11;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  void *v11;
  double v12;
  double v13;
  CGPoint result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a8, *(_QWORD *)&a9.x, *(_QWORD *)&a9.y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5, a6.x, a6.y, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHorizontalSingleLineSeries.m"), 473, CFSTR("Not implemented"));

  v12 = 0.0;
  v13 = 0.0;
  result.y = v13;
  result.x = v12;
  return result;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (double)topInsetPercentageStorage
{
  return self->_topInsetPercentageStorage;
}

- (void)setTopInsetPercentageStorage:(double)a3
{
  self->_topInsetPercentageStorage = a3;
}

- (BOOL)shouldConnectPointsStorage
{
  return self->_shouldConnectPointsStorage;
}

- (void)setShouldConnectPointsStorage:(BOOL)a3
{
  self->_shouldConnectPointsStorage = a3;
}

- (UIColor)baseColorStorage
{
  return self->_baseColorStorage;
}

- (void)setBaseColorStorage:(id)a3
{
  objc_storeStrong((id *)&self->_baseColorStorage, a3);
}

- (double)lineWidthStorage
{
  return self->_lineWidthStorage;
}

- (void)setLineWidthStorage:(double)a3
{
  self->_lineWidthStorage = a3;
}

- (double)selectedLineWidthStorage
{
  return self->_selectedLineWidthStorage;
}

- (void)setSelectedLineWidthStorage:(double)a3
{
  self->_selectedLineWidthStorage = a3;
}

- (double)markRadiusStorage
{
  return self->_markRadiusStorage;
}

- (void)setMarkRadiusStorage:(double)a3
{
  self->_markRadiusStorage = a3;
}

- (UIImage)selectedPointMarkerImageStorage
{
  return self->_selectedPointMarkerImageStorage;
}

- (void)setSelectedPointMarkerImageStorage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPointMarkerImageStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPointMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_baseColorStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
