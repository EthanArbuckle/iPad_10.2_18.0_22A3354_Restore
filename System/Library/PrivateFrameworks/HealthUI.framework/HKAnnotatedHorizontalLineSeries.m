@implementation HKAnnotatedHorizontalLineSeries

- (HKAnnotatedHorizontalLineSeries)init
{
  HKAnnotatedHorizontalLineSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  NSDictionary *horizontalLineStylesStorage;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKAnnotatedHorizontalLineSeries;
  v2 = -[HKGraphSeries init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKAnnotatedHorizontalLineSeriesLock"));
    horizontalLineStylesStorage = v2->_horizontalLineStylesStorage;
    v2->_horizontalLineStylesStorage = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v2->_valueOutlineWidthStorage = 0.0;
  }
  return v2;
}

- (NSDictionary)horizontalLineStyles
{
  void *v3;
  NSDictionary *v4;
  void *v5;

  -[HKAnnotatedHorizontalLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_horizontalLineStylesStorage;
  -[HKAnnotatedHorizontalLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setHorizontalLineStyles:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *horizontalLineStylesStorage;
  id v8;

  v4 = a3;
  -[HKAnnotatedHorizontalLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSDictionary *)objc_msgSend(v4, "copy");
  horizontalLineStylesStorage = self->_horizontalLineStylesStorage;
  self->_horizontalLineStylesStorage = v6;

  -[HKAnnotatedHorizontalLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (double)valueOutlineWidth
{
  void *v3;
  double valueOutlineWidthStorage;
  void *v5;

  -[HKAnnotatedHorizontalLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  valueOutlineWidthStorage = self->_valueOutlineWidthStorage;
  -[HKAnnotatedHorizontalLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return valueOutlineWidthStorage;
}

- (void)setValueOutlineWidth:(double)a3
{
  void *v5;
  id v6;

  -[HKAnnotatedHorizontalLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_valueOutlineWidthStorage = a3;
  -[HKAnnotatedHorizontalLineSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  HKAnnotatedHorizontalLineSeries *v57;
  void *v58;
  CGContext *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  id obj;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _OWORD v81[3];
  _QWORD v82[4];
  id v83;
  _QWORD v84[2];
  _QWORD v85[2];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v64 = a9;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __174__HKAnnotatedHorizontalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v82[3] = &unk_1E9C45010;
  v16 = v15;
  v83 = v16;
  v17 = *(_OWORD *)&a6->c;
  v81[0] = *(_OWORD *)&a6->a;
  v81[1] = v17;
  v81[2] = *(_OWORD *)&a6->tx;
  v65 = v13;
  objc_msgSend(v13, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v81, 1, v82);
  objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_73);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v16;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v78;
    v67 = *MEMORY[0x1E0DC1138];
    v66 = *MEMORY[0x1E0DC1140];
    v68 = *(_QWORD *)v78;
    v69 = v14;
    do
    {
      v21 = 0;
      v72 = v19;
      do
      {
        if (*(_QWORD *)v78 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v21);
        objc_msgSend(v22, "coordinate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "originalCoordinate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "containsObject:", v23) & 1) == 0)
        {
          objc_msgSend(v14, "addObject:", v23);
          CGContextSaveGState(a7);
          -[HKAnnotatedHorizontalLineSeries _horizontalLineSeriesStyleForBlockCoordinate:](self, "_horizontalLineSeriesStyleForBlockCoordinate:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v25;
          if (v25)
          {
            v26 = v25;
            objc_msgSend(v25, "lineStrokeStyle");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "valueStyle");
          }
          else
          {
            -[HKAnnotatedHorizontalLineSeries _defaultLineStyle](self, "_defaultLineStyle");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKAnnotatedHorizontalLineSeries _defaultLabelStyle](self, "_defaultLabelStyle");
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v28;
          v75 = v27;
          objc_msgSend(v27, "applyToContext:", a7);
          objc_msgSend(v27, "lineWidth");
          v30 = v29 * 0.5;
          objc_msgSend(v23, "startPoint");
          v32 = v31;
          objc_msgSend(v23, "endPoint");
          v34 = v32 + (v33 - v32) * 0.5;
          if (v34 >= v30 + v32)
            v35 = v30 + v32;
          else
            v35 = v32 + (v33 - v32) * 0.5;
          v36 = v33 - v30;
          if (v34 >= v36)
            v37 = v34;
          else
            v37 = v36;
          objc_msgSend(v23, "startPoint");
          CGContextMoveToPoint(a7, v35, v38);
          objc_msgSend(v23, "endPoint");
          CGContextAddLineToPoint(a7, v37, v39);
          CGContextStrokePath(a7);
          CGContextRestoreGState(a7);
          objc_msgSend(v23, "startPoint");
          v41 = v40;
          objc_msgSend(v23, "endPoint");
          if (v41 >= v42)
            v41 = v42;
          if (v35 >= v37)
            v43 = v37;
          else
            v43 = v35;
          if (v35 >= v37)
            v44 = v35;
          else
            v44 = v37;
          v45 = v44 - v43;
          objc_msgSend(v23, "startPoint");
          v47 = v46;
          objc_msgSend(v23, "endPoint");
          if (v47 >= v48)
            v49 = v47;
          else
            v49 = v48;
          objc_msgSend(v23, "startPoint");
          v51 = v50;
          objc_msgSend(v23, "endPoint");
          if (v51 >= v52)
            v53 = v52;
          else
            v53 = v51;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v43, v41, v45, v49 - v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "addObject:", v54);

          -[HKAnnotatedHorizontalLineSeries _stringValueForCoordinate:valueStyle:](self, "_stringValueForCoordinate:valueStyle:", v24, v28);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v84[0] = v67;
          objc_msgSend(v28, "font");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v84[1] = v66;
          v85[0] = v56;
          objc_msgSend(v28, "textColor");
          v57 = self;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v85[1] = v58;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
          v59 = a7;
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          self = v57;
          -[HKAnnotatedHorizontalLineSeries _boundsForString:coordinate:valueAttributes:rectsToAvoid:](v57, "_boundsForString:coordinate:valueAttributes:rectsToAvoid:", v55, v23, v60, v70);
          +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", v55, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v61);

          a7 = v59;
          v20 = v68;
          v14 = v69;
          v19 = v72;
        }

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    }
    while (v19);
  }

  if ((objc_msgSend(v64, "seriesDrawingDuringTiling") & 1) != 0
    || objc_msgSend(v64, "seriesDrawingDuringScrolling"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
    v62 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v62 = objc_claimAutoreleasedReturnValue();
  }
  v63 = (void *)v62;
  -[HKAnnotatedHorizontalLineSeries valueOutlineWidth](self, "valueOutlineWidth");
  +[HKStringDrawing drawStrings:outlineWidth:outlineColor:context:](HKStringDrawing, "drawStrings:outlineWidth:outlineColor:context:", v71, v63, a7);

}

void __174__HKAnnotatedHorizontalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  CoordinateTuple *v8;

  v6 = a4;
  v7 = a2;
  v8 = objc_alloc_init(CoordinateTuple);
  -[CoordinateTuple setCoordinate:](v8, "setCoordinate:", v7);

  -[CoordinateTuple setOriginalCoordinate:](v8, "setOriginalCoordinate:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

uint64_t __174__HKAnnotatedHorizontalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  objc_msgSend(a2, "coordinate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "endPoint");
  v8 = v7;
  objc_msgSend(v6, "endPoint");
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "endPoint");
    v12 = v11;
    objc_msgSend(v6, "endPoint");
    if (v12 >= v13)
      v10 = 1;
    else
      v10 = -1;
  }

  return v10;
}

- (id)_horizontalLineSeriesStyleForBlockCoordinate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HKAnnotatedHorizontalLineSeries horizontalLineStyles](self, "horizontalLineStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "styleIdentifier");

  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_defaultLineStyle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v2, 2.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_defaultLabelStyle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", v2, v3, 2, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_stringValueForCoordinate:(id)a3 valueStyle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(a4, "numberFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    HKDecimalFormatter(0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "startPoint");
  v12 = v11;

  objc_msgSend(v10, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:displayType:unitController:", v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CGRect)_boundsForString:(id)a3 coordinate:(id)a4 valueAttributes:(id)a5 rectsToAvoid:(id)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect result;
  CGRect v43;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  objc_msgSend(a3, "sizeWithAttributes:", a5);
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "endPoint");
  v16 = v15 + -4.0 - v14;
  if (v16 < 0.0)
  {
    objc_msgSend(v9, "endPoint");
    v16 = v17 + 4.0;
  }
  if (objc_msgSend(v9, "styleIdentifier") == 2)
  {
    objc_msgSend(v9, "startPoint");
    v19 = v18;
  }
  else
  {
    objc_msgSend(v9, "endPoint");
    v19 = v20 - v12;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "CGRectValue", (_QWORD)v35);
        v43.origin.x = v26;
        v43.origin.y = v27;
        v43.size.width = v28;
        v43.size.height = v29;
        v41.origin.x = v19;
        v41.origin.y = v16;
        v41.size.width = v12;
        v41.size.height = v14;
        if (CGRectIntersectsRect(v41, v43))
        {
          objc_msgSend(v9, "endPoint");
          v16 = v30 + 4.0;
          goto LABEL_16;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v23)
        continue;
      break;
    }
  }
LABEL_16:

  v31 = v19;
  v32 = v16;
  v33 = v12;
  v34 = v14;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  __int128 v23;
  int64_t resolution;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "chartPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAnnotatedHorizontalLineSeries.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__HKAnnotatedHorizontalLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C45078;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
  v23 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v17, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __77__HKAnnotatedHorizontalLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  _HKAnnotatedHorizontalLineBlockCoordinate *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v19, "minXValueAsGenericType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateForValue:", v5);
    v7 = v6;

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v19, "maxXValueAsGenericType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateForValue:", v9);
    v11 = v10;

    v12 = *(void **)(a1 + 40);
    objc_msgSend(v19, "yValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateForValue:", v13);
    v15 = v14;

    v16 = objc_msgSend(v19, "styleIdentifier");
    objc_msgSend(v19, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_HKAnnotatedHorizontalLineBlockCoordinate initWithStartPoint:endPoint:styleIdentifier:userInfo:]([_HKAnnotatedHorizontalLineBlockCoordinate alloc], "initWithStartPoint:endPoint:styleIdentifier:userInfo:", v16, v17, v7, v15, v11, v15);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);

  }
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
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a4;
  -[HKAnnotatedHorizontalLineSeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](self, "xAxisDistanceFromPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v14 = v13;
  -[HKAnnotatedHorizontalLineSeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](self, "yAxisDifferenceToPoint:blockCoordinate:chartRect:", v12, v10, v9, x, y, width, height);
  v16 = v15;

  return sqrt(v16 * v16 + v14 * v14);
}

- (double)xAxisSelectedCoordinate:(double)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAnnotatedHorizontalLineSeries.m"), 319, CFSTR("xAxisSelectedCoordinate type class failure"));

  }
  v9 = v8;
  -[HKGraphSeries delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HKGraphSeries delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "snapScreenCoordinateToXAxisResolution:", a3);
    a3 = v12;

  }
  objc_msgSend(v9, "startXValue");
  if (a3 >= v13)
    v14 = a3;
  else
    v14 = v13;
  objc_msgSend(v9, "endXValue");
  v16 = v15;

  if (v14 < v16)
    v16 = v14;

  return v16;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;

  x = a3.x;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAnnotatedHorizontalLineSeries.m"), 333, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  v9 = v8;
  objc_msgSend(v9, "startXValue");
  v11 = v10 - x;
  objc_msgSend(v9, "endXValue");
  v13 = v12;

  v14 = fmax(v11, 0.0);
  if (x - v13 <= 0.0)
    v15 = v14;
  else
    v15 = x - v13;

  return v15;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  id v8;
  double v9;
  double v10;
  void *v12;

  y = a3.y;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAnnotatedHorizontalLineSeries.m"), 348, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  objc_msgSend(v8, "startPoint");
  v10 = v9 - y;

  return v10;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAnnotatedHorizontalLineSeries.m"), 356, CFSTR("blockCoordinate:lessThan: class type failure"));

  }
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAnnotatedHorizontalLineSeries.m"), 359, CFSTR("blockCoordinate:lessThan: class type failure"));

  }
  v10 = v8;
  objc_msgSend(v9, "startPoint");
  v12 = v11;
  objc_msgSend(v10, "startPoint");
  v14 = v13;

  return v12 < v14;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAnnotatedHorizontalLineSeries.m"), 368, CFSTR("blockCoordinate:lessThan: class type failure"));

  }
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAnnotatedHorizontalLineSeries.m"), 371, CFSTR("blockCoordinate:lessThan: class type failure"));

  }
  v10 = v8;
  objc_msgSend(v9, "startPoint");
  v12 = v11;
  objc_msgSend(v10, "startPoint");
  v14 = v13;

  return v12 > v14;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSDictionary)horizontalLineStylesStorage
{
  return self->_horizontalLineStylesStorage;
}

- (void)setHorizontalLineStylesStorage:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalLineStylesStorage, a3);
}

- (double)valueOutlineWidthStorage
{
  return self->_valueOutlineWidthStorage;
}

- (void)setValueOutlineWidthStorage:(double)a3
{
  self->_valueOutlineWidthStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalLineStylesStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
