@implementation HKLineSeries

- (HKLineSeries)init
{
  char *v2;
  void *v3;
  void *v4;
  HKLineSeriesPresentationStyle *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HKLineSeries;
  v2 = -[HKGraphSeries init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v3, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(HKLineSeriesPresentationStyle);
    -[HKLineSeriesPresentationStyle setStrokeStyle:](v5, "setStrokeStyle:", v4);
    -[HKLineSeriesPresentationStyle setWaveForm:](v5, "setWaveForm:", 0);
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 27);
    *((_QWORD *)v2 + 27) = v6;

    v2[208] = 0;
    *(_WORD *)(v2 + 209) = 1;
    v8 = (void *)*((_QWORD *)v2 + 32);
    *((_QWORD *)v2 + 32) = 0;

  }
  return (HKLineSeries *)v2;
}

- (id)_currentPresentationStyles
{
  NSArray *highlightedPresentationStyles;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
  {
    if (-[HKGraphSeries isHighlighted](self, "isHighlighted"))
    {
      highlightedPresentationStyles = self->_highlightedPresentationStyles;
      if (!highlightedPresentationStyles)
      {
        v4 = 216;
LABEL_9:
        highlightedPresentationStyles = *(NSArray **)((char *)&self->super.super.isa + v4);
      }
    }
    else
    {
      highlightedPresentationStyles = self->_unhighlightedPresentationStyles;
      if (!highlightedPresentationStyles)
      {
        v4 = 224;
        goto LABEL_9;
      }
    }
    return highlightedPresentationStyles;
  }
  -[HKLineSeries inactivePresentationStyle](self, "inactivePresentationStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[HKLineSeries inactivePresentationStyle](self, "inactivePresentationStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_enumerateCoordinateList:(id)a3 withTransform:(CGAffineTransform *)a4 presentationStyle:(id)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7 block:(id)a8
{
  id v10;
  __int128 v11;
  id v12;
  _OWORD v13[3];
  _QWORD v14[4];
  id v15;

  v10 = a8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__HKLineSeries__enumerateCoordinateList_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke;
  v14[3] = &unk_1E9C40A38;
  v15 = v10;
  v11 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a4->tx;
  v12 = v10;
  objc_msgSend(a3, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v13, 1, v14);

}

void __111__HKLineSeries__enumerateCoordinateList_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v5 = *(_QWORD *)(a1 + 32);
  v12 = a4;
  objc_msgSend(a2, "coordinate");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v12, "coordinate");
  (*(void (**)(uint64_t, id, double, double, double, double))(v5 + 16))(v5, v12, v7, v9, v10, v11);

}

- (void)_enumerateCoordinateListByRemovingOffscreenPoints:(id)a3 withTransform:(CGAffineTransform *)a4 presentationStyle:(id)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7 block:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  id v19;
  CGFloat MinX;
  CGFloat MaxX;
  uint64_t v22;
  void **v23;
  uint64_t v24;
  id v25;
  void (**v26)(_QWORD);
  id v27;
  __int128 v28;
  _OWORD v30[3];
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  CGFloat v36;
  void **v37;
  CGFloat v38;
  uint64_t v39;
  _QWORD aBlock[4];
  id v41;
  _QWORD *v42;
  void **v43;
  _QWORD v44[3];
  char v45;
  _QWORD v46[4];
  _QWORD v47[5];
  CGRect v48;
  CGRect v49;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MinX = CGRectGetMinX(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  MaxX = CGRectGetMaxX(v49);
  v22 = objc_msgSend(v16, "numCoordinates");
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  v23 = (void **)HKCircularBufferCreate(2, 40);
  v24 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__HKLineSeries__enumerateCoordinateListByRemovingOffscreenPoints_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke;
  aBlock[3] = &unk_1E9C40A60;
  v42 = v44;
  v43 = v23;
  v25 = v19;
  v41 = v25;
  v31[0] = v24;
  v31[1] = 3221225472;
  v31[2] = __136__HKLineSeries__enumerateCoordinateListByRemovingOffscreenPoints_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke_2;
  v31[3] = &unk_1E9C40A88;
  v34 = v47;
  v36 = MinX;
  v37 = v23;
  v38 = MaxX;
  v26 = _Block_copy(aBlock);
  v32 = v26;
  v27 = v25;
  v39 = v22;
  v33 = v27;
  v35 = v46;
  v28 = *(_OWORD *)&a4->c;
  v30[0] = *(_OWORD *)&a4->a;
  v30[1] = v28;
  v30[2] = *(_OWORD *)&a4->tx;
  -[HKLineSeries _enumerateCoordinateList:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateList:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v16, v30, v17, v18, v31, x, y, width, height);
  v26[2](v26);
  HKCircularBufferRelease(v23);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v47, 8);

}

BOOL __136__HKLineSeries__enumerateCoordinateListByRemovingOffscreenPoints_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke(_BOOL8 result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = (_QWORD *)result;
    v3 = HKCircularBufferIteratorMake();
    for (result = HKCircularBufferIteratorHasNext(v1[6], v3); result; result = HKCircularBufferIteratorHasNext(v1[6], v3))
    {
      v2 = HKCircularBufferIteratorNext((uint64_t *)v1[6], &v3);
      (*(void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))(v1[4] + 16))(v1[4], 0, *(_QWORD *)(v2 + 32), *(double *)v2, *(double *)(v2 + 8), *(double *)(v2 + 16), *(double *)(v2 + 24));
    }
    *(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) = 1;
  }
  return result;
}

void __136__HKLineSeries__enumerateCoordinateListByRemovingOffscreenPoints_withTransform_presentationStyle_zoomLevelConfiguration_axisRect_block___block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  _QWORD __src[4];
  id v14;

  v11 = a2;
  v12 = v11;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (a3 >= *(double *)(a1 + 64))
  {
    if (a3 <= *(double *)(a1 + 80))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      (*(void (**)(_QWORD, BOOL, void *, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *(_QWORD *)(a1 + 88), v12, a3, a4, a5, a6);
    }
    else if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= 2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(a3, a4, a5, a6);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
  }
  else
  {
    *(double *)__src = a3;
    *(double *)&__src[1] = a4;
    *(double *)&__src[2] = a5;
    *(double *)&__src[3] = a6;
    v14 = v11;
    HKCircularBufferAddItem(*(uint64_t **)(a1 + 72), __src);

  }
}

- (void)_enumeratePathsFromBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 transform:(CGAffineTransform *)a6 presentationStyle:(id)a7 caresAboutSelection:(BOOL)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10 handler:(id)a11
{
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v11 = a8;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a7;
  v25 = a5;
  v26 = a3;
  if (objc_msgSend(v24, "waveForm"))
  {
    v27 = *(_OWORD *)&a6->c;
    v29 = *(_OWORD *)&a6->a;
    v30 = v27;
    v31 = *(_OWORD *)&a6->tx;
    -[HKLineSeries _enumerateSinePathsFromBlockCoordinates:transfrom:zoomLevelConfiguration:presentationStyle:axisRect:handler:](self, "_enumerateSinePathsFromBlockCoordinates:transfrom:zoomLevelConfiguration:presentationStyle:axisRect:handler:", v26, &v29, v25, v24, v23, x, y, width, height);
  }
  else
  {
    v28 = *(_OWORD *)&a6->c;
    v29 = *(_OWORD *)&a6->a;
    v30 = v28;
    v31 = *(_OWORD *)&a6->tx;
    -[HKLineSeries _enumerateSawToothPathsFromBlockCoordinates:transform:zoomLevelConfiguration:presentationStyle:caresAboutSelection:axisRect:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:handler:](self, "_enumerateSawToothPathsFromBlockCoordinates:transform:zoomLevelConfiguration:presentationStyle:caresAboutSelection:axisRect:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:handler:", v26, &v29, v25, v24, v11, v21, x, y, width, height, v22, v23);
  }

}

- (void)addAxisAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = a4;
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeries yAxis](self, "yAxis");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v26 = v7;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[HKLineSeries _currentPresentationStyles](self, "_currentPresentationStyles");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v12, "axisAnnotationStyle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "numberFormatter");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (v15)
              {
                v17 = v15;
              }
              else
              {
                HKDecimalFormatter(0);
                v17 = (id)objc_claimAutoreleasedReturnValue();
              }
              v18 = v17;

              if ((objc_msgSend(v12, "shouldNegateAnnotationValue") & 1) != 0)
              {
                v19 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v6, "floatValue");
                *(float *)&v21 = -v20;
                objc_msgSend(v19, "numberWithFloat:", v21);
                v22 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v22 = v6;
              }
              v23 = v22;
              objc_msgSend(v18, "stringFromNumber:displayType:unitController:", v22, 0, 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[HKLineSeries _attributedAnnotationWithString:labelStyle:](self, "_attributedAnnotationWithString:labelStyle:", v24, v14);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addAxisAnnotation:forSeries:modelCoordinate:", v25, self, v6);

            }
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v9);
      }

      v7 = v26;
    }

  }
}

- (void)addAxisAnnotationForString:(id)a3 modelCoordinate:(double)a4 axisAnnotationDelegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeries yAxis](self, "yAxis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v19 = v11;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[HKLineSeries _currentPresentationStyles](self, "_currentPresentationStyles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "axisAnnotationStyle");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[HKLineSeries _attributedAnnotationWithString:labelStyle:](self, "_attributedAnnotationWithString:labelStyle:", v8, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v9, "addAxisAnnotation:forSeries:modelCoordinate:", v18, self, v10);

            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }

      v11 = v19;
    }

  }
}

- (BOOL)connectPoint:(id)a3 toPoint:(id)a4
{
  return 1;
}

- (id)_attributedAnnotationWithString:(id)a3 labelStyle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = *MEMORY[0x1E0DC1140];
  v5 = a3;
  objc_msgSend(a4, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v8);
  return v9;
}

- (void)_enumerateSawToothPathsFromBlockCoordinates:(id)a3 transform:(CGAffineTransform *)a4 zoomLevelConfiguration:(id)a5 presentationStyle:(id)a6 caresAboutSelection:(BOOL)a7 axisRect:(CGRect)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10 handler:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  void *v26;
  void *v27;
  __int128 v28;
  id v29;
  id v31;
  id v32;
  id v33;
  _OWORD v34[3];
  _QWORD v35[4];
  id v36;
  HKLineSeries *v37;
  id v38;
  id v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  _QWORD v67[6];
  _QWORD v68[5];
  id v69;
  _QWORD v70[4];
  __int128 v71;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v33 = a3;
  v32 = a5;
  v31 = a6;
  v20 = a9;
  v21 = a10;
  v29 = a11;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3010000000;
  v70[3] = &unk_1D7BC951A;
  v71 = *MEMORY[0x1E0C9D538];
  v28 = v71;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__4;
  v68[4] = __Block_byref_object_dispose__4;
  v69 = (id)objc_opt_new();
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3010000000;
  v67[4] = 0;
  v67[5] = 0;
  v67[3] = &unk_1D7BC951A;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v58 = 0;
  v59 = (double *)&v58;
  v60 = 0x3010000000;
  v61 = &unk_1D7BC951A;
  v62 = v28;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__4;
  v52[4] = __Block_byref_object_dispose__4;
  v53 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __207__HKLineSeries__enumerateSawToothPathsFromBlockCoordinates_transform_zoomLevelConfiguration_presentationStyle_caresAboutSelection_axisRect_seriesRenderingDelegate_forceGapBetweenUntransformedPoints_handler___block_invoke;
  v35[3] = &unk_1E9C40AB0;
  v22 = v20;
  v47 = x;
  v48 = y;
  v49 = width;
  v50 = height;
  v36 = v22;
  v37 = self;
  v40 = v68;
  v41 = &v63;
  v42 = &v58;
  v23 = v21;
  v38 = v23;
  v43 = v52;
  v44 = v70;
  v24 = v29;
  v39 = v24;
  v45 = v67;
  v46 = &v54;
  v51 = a7;
  v25 = *(_OWORD *)&a4->c;
  v34[0] = *(_OWORD *)&a4->a;
  v34[1] = v25;
  v34[2] = *(_OWORD *)&a4->tx;
  -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v33, v34, v31, v32, v35, x, y, width, height);
  if (*((_BYTE *)v64 + 24))
  {
    objc_msgSend(v22, "axisAnnotationDelegateForSeries:", self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (self->_extendLastValue || *((_BYTE *)v55 + 24))
      -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v26, v59[5], v28);
    else
      objc_msgSend(v26, "clearAxisAnnotations");

  }
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v68, 8);

  _Block_object_dispose(v70, 8);
}

void __207__HKLineSeries__enumerateSawToothPathsFromBlockCoordinates_transform_zoomLevelConfiguration_presentationStyle_caresAboutSelection_axisRect_seriesRenderingDelegate_forceGapBetweenUntransformedPoints_handler___block_invoke(uint64_t a1, int a2, void *a3, double a4, double a5, double a6, double a7)
{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  void *v38;
  int v39;
  void *v40;
  float v41;
  double v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  float v50;
  double v51;
  void *v52;
  void *v53;
  float v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  double v71;
  id v72;

  v72 = a3;
  objc_msgSend(*(id *)(a1 + 32), "virtualMarginInsets");
  v16 = v14;
  v17 = *(double *)(a1 + 120);
  v18 = v17 + *(double *)(a1 + 136) - v15;
  v19 = a4 <= v18 && a4 >= v17 + v14;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 209)
    || (v20 = v15, (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isEmpty") & 1) != 0))
  {
    v21 = 0;
  }
  else
  {
    v71 = a7;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "currentPoint");
    v33 = vabdd_f64(a4, v32);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 208))
      v34 = 1.0;
    else
      v34 = 1.4;
    objc_msgSend(*(id *)(a1 + 32), "screenRectForSeries:");
    v36 = v34 * (v35 - v16 - v20);
    v37 = vabdd_f64(v33, v36) >= 0.01;
    v21 = v33 > v36 && v37;
    objc_msgSend(*(id *)(a1 + 40), "maximumConnectionDistance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 && (v39 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v38, v39))
    {
      objc_msgSend(*(id *)(a1 + 40), "maximumConnectionDistance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      v42 = v41;

      v43 = vabdd_f64(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32), a6) <= v42;
      a7 = v71;
      if (!v43)
        goto LABEL_10;
    }
    else
    {
      a7 = v71;
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) && (v21 & 1) == 0)
  {
    if (((*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a6, a7) & 1) != 0)
    {
LABEL_10:
      v21 = 1;
      goto LABEL_12;
    }
    v21 = objc_msgSend(*(id *)(a1 + 40), "connectPoint:toPoint:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v72) ^ 1;
  }
LABEL_12:
  v22 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 208);
  v23 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isEmpty");
  if (v22)
  {
    if (v23)
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      *(double *)(v24 + 32) = a4;
      *(double *)(v24 + 40) = a5;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 210) && v19)
      {
        v25 = *(double *)(a1 + 120);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "moveToPoint:", v25, a5);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addLineToPoint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
        (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(v25, a5, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
        v26 = objc_opt_new();
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

      }
      v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    else
    {
      v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!v21)
      {
        objc_msgSend(v29, "addLineToPoint:", a4, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addLineToPoint:", a4, a5);
        goto LABEL_35;
      }
    }
    objc_msgSend(v29, "moveToPoint:", a4, a5);
LABEL_35:
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    *(double *)(v44 + 32) = a4;
    *(double *)(v44 + 40) = a5;
    goto LABEL_36;
  }
  if (v23)
  {
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    *(double *)(v30 + 32) = a4;
    *(double *)(v30 + 40) = a5;
    v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
LABEL_33:
    objc_msgSend(v31, "moveToPoint:", a4, a5);
    goto LABEL_36;
  }
  v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v21)
    goto LABEL_33;
  objc_msgSend(v31, "addLineToPoint:", a4, a5);
LABEL_36:
  if (a4 <= v18)
  {
    v45 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    *(double *)(v45 + 32) = a6;
    *(double *)(v45 + 40) = a7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v19;
  }
  if (*(_BYTE *)(a1 + 152))
  {
    objc_msgSend(*(id *)(a1 + 40), "closestXCoordinateRange");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = HKUIFloorCGPointToScreenScale(a4, a5);
      objc_msgSend(*(id *)(a1 + 40), "closestXCoordinateRange");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "minValue");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "floatValue");
      v51 = HKUIFloorToScreenScale(v50);

      objc_msgSend(*(id *)(a1 + 40), "closestXCoordinateRange");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "maxValue");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "floatValue");
      v55 = HKUIFloorToScreenScale(v54);

      v56 = vabdd_f64(v51, v47);
      v57 = HKUIOnePixel();
      v58 = HKUIOnePixel();
      if (v56 <= v57 || vabdd_f64(v55, v47) <= v58)
      {
        (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), a4, a5);
        v59 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        *(double *)(v59 + 32) = a4;
        *(double *)(v59 + 40) = a5;
        v60 = objc_opt_new();
        v61 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v62 = *(void **)(v61 + 40);
        *(_QWORD *)(v61 + 40) = v60;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "moveToPoint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
      }
    }
  }
  if (a2)
  {
    v63 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v63 + 208) && *(_BYTE *)(v63 + 209) && v19)
    {
      (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), a4, a5);
      v64 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      *(double *)(v64 + 32) = a4;
      *(double *)(v64 + 40) = a5;
      a4 = *(double *)(a1 + 120) + *(double *)(a1 + 136);
      v65 = objc_opt_new();
      v66 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v67 = *(void **)(v66 + 40);
      *(_QWORD *)(v66 + 40) = v65;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "moveToPoint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addLineToPoint:", a4, a5);
    }
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), a4, a5);
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32) = *MEMORY[0x1E0C9D538];
    v68 = objc_opt_new();
    v69 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v70 = *(void **)(v69 + 40);
    *(_QWORD *)(v69 + 40) = v68;

  }
}

- (void)_enumerateSinePathsFromBlockCoordinates:(id)a3 transfrom:(CGAffineTransform *)a4 zoomLevelConfiguration:(id)a5 presentationStyle:(id)a6 axisRect:(CGRect)a7 handler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  id v28;
  id v29;
  _OWORD v31[3];
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD v42[4];
  _QWORD v43[4];
  __int128 v44;
  _QWORD v45[4];
  __int128 v46;
  _QWORD v47[4];
  __int128 v48;
  _QWORD v49[4];
  __int128 v50;
  _QWORD v51[4];
  __int128 v52;
  _QWORD aBlock[4];
  id v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD v57[6];

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v29 = a3;
  v28 = a5;
  v16 = a6;
  v17 = a8;
  objc_msgSend(v16, "sineWaveSmoothingFactor");
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v21 = MEMORY[0x1E0C809B0];
  v57[3] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__HKLineSeries__enumerateSinePathsFromBlockCoordinates_transfrom_zoomLevelConfiguration_presentationStyle_axisRect_handler___block_invoke;
  aBlock[3] = &unk_1E9C40AD8;
  v55 = v57;
  v22 = v20;
  v54 = v22;
  v56 = v19;
  v23 = _Block_copy(aBlock);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3010000000;
  v51[3] = &unk_1D7BC951A;
  v52 = *MEMORY[0x1E0C9D538];
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3010000000;
  v49[3] = &unk_1D7BC951A;
  v50 = v52;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3010000000;
  v47[3] = &unk_1D7BC951A;
  v48 = v52;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3010000000;
  v45[3] = &unk_1D7BC951A;
  v46 = v52;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3010000000;
  v43[3] = &unk_1D7BC951A;
  v44 = v52;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __124__HKLineSeries__enumerateSinePathsFromBlockCoordinates_transfrom_zoomLevelConfiguration_presentationStyle_axisRect_handler___block_invoke_2;
  v32[3] = &unk_1E9C40B00;
  v36 = v42;
  v37 = v45;
  v24 = v22;
  v33 = v24;
  v38 = v51;
  v39 = v49;
  v40 = v47;
  v25 = v23;
  v34 = v25;
  v41 = v43;
  v26 = v17;
  v35 = v26;
  v27 = *(_OWORD *)&a4->c;
  v31[0] = *(_OWORD *)&a4->a;
  v31[1] = v27;
  v31[2] = *(_OWORD *)&a4->tx;
  -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v29, v31, v16, v28, v32, x, y, width, height);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(v57, 8);
}

uint64_t __124__HKLineSeries__enumerateSinePathsFromBlockCoordinates_transfrom_zoomLevelConfiguration_presentationStyle_axisRect_handler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", a2, a3);
  v14 = a5 - a3;
  v15 = a7 - a5;
  v16 = vabdd_f64(a4, a2);
  v17 = vabdd_f64(a6, a4);
  v18 = 0.1;
  if (v16 >= 0.00000011920929 && v17 >= 0.00000011920929)
  {
    v20 = fmax(fabs(v14 / v16), fabs(v15 / v17));
    if (v20 <= 5.0)
    {
      if (v20 <= 3.0)
      {
        v18 = 0.5;
        if (v20 <= 1.5)
        {
          v18 = 1.0;
          if (v20 < 0.5)
            v18 = 2.0;
        }
      }
      else
      {
        v18 = 0.2;
      }
    }
  }
  v21 = *(double *)(a1 + 48) * v18;
  v22 = a4 + (a6 - a4) * v21;
  v23 = a5 + v15 * v21;
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a4 - (a4 - a2) * v21, a5 - v14 * v21);
  result = objc_msgSend(*(id *)(a1 + 32), "addQuadCurveToPoint:controlPoint:", v22, v23, a4, a5);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __124__HKLineSeries__enumerateSinePathsFromBlockCoordinates_transfrom_zoomLevelConfiguration_presentationStyle_axisRect_handler___block_invoke_2(uint64_t a1, int a2, void *a3, double a4, double a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  id v16;

  v16 = a3;
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v9 != 2)
  {
    if (v9 == 1)
    {
      v11 = *(_QWORD *)(a1 + 80);
      goto LABEL_6;
    }
    if (!v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      *(double *)(v10 + 32) = a4;
      *(double *)(v10 + 40) = a5;
      objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", a4, a5);
      v11 = *(_QWORD *)(a1 + 72);
LABEL_6:
      v12 = *(_QWORD *)(v11 + 8);
      *(double *)(v12 + 32) = a4;
      *(double *)(v12 + 40) = a5;
      goto LABEL_9;
    }
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                            + 32);
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 32);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  *(double *)(v13 + 32) = a4;
  *(double *)(v13 + 40) = a5;
  (*(void (**)(double, double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
LABEL_9:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  *(double *)(v14 + 32) = a4;
  *(double *)(v14 + 40) = a5;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    v15 = *MEMORY[0x1E0C9D538];
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = *MEMORY[0x1E0C9D538];
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = v15;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 32) = v15;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = v15;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 32) = v15;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  __int128 v9;
  _OWORD v10[3];

  v9 = *(_OWORD *)&a6->c;
  v10[0] = *(_OWORD *)&a6->a;
  v10[1] = v9;
  v10[2] = *(_OWORD *)&a6->tx;
  -[HKLineSeries drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:](self, "drawSeriesWithBlockCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:", a3, a5, v10, a7, a8, a9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, &__block_literal_global_12);
}

uint64_t __155__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke()
{
  return 0;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9 forceGapBetweenUntransformedPoints:(id)a10
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  double v45;
  __int128 v46;
  void *v47;
  __int128 v48;
  void *v49;
  BOOL v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  void *v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id obj;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  CGContextRef c;
  HKLineSeries *v80;
  void *v81;
  _QWORD v82[7];
  char v83;
  _QWORD v84[3];
  char v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  double *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[5];
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  double v107;
  double v108;
  double v109;
  double v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  uint64_t v116;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v116 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v72 = a5;
  v65 = a8;
  v70 = a9;
  v68 = a10;
  c = a7;
  CGContextSaveGState(a7);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v80 = self;
  -[HKLineSeries _currentPresentationStyles](self, "_currentPresentationStyles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
  if (v69)
  {
    v67 = *(_QWORD *)v112;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v112 != v67)
        {
          v21 = v20;
          objc_enumerationMutation(obj);
          v20 = v21;
        }
        v71 = v20;
        v81 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v20);
        objc_msgSend(v81, "strokeStyle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "fillStyle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray firstObject](v80->_selectedPresentationStyles, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "strokeStyle");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSArray firstObject](v80->_selectedPresentationStyles, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fillStyle");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "isEqual:", v77))
          v26 = objc_msgSend(v22, "isEqual:", v75);
        else
          v26 = 0;
        objc_msgSend(v81, "endCapStyle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLineSeries pointMarkerImageForPointMarkerStyle:](v80, "pointMarkerImageForPointMarkerStyle:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)objc_opt_new();
        v30 = (void *)objc_opt_new();
        v31 = (void *)objc_opt_new();
        v32 = (void *)objc_opt_new();
        v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __190__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints___block_invoke;
        v98[3] = &unk_1E9C40B68;
        v98[4] = v80;
        v34 = v22;
        v99 = v34;
        v35 = v31;
        v36 = v34;
        v37 = v35;
        v100 = v35;
        v76 = v29;
        v101 = v76;
        v38 = v23;
        v102 = v38;
        v107 = x;
        v108 = y;
        v109 = width;
        v110 = height;
        v73 = v32;
        v103 = v73;
        v39 = v30;
        v104 = v39;
        v40 = v28;
        v105 = v40;
        v74 = v33;
        v106 = v74;
        v41 = *(_OWORD *)&a6->c;
        v95 = *(_OWORD *)&a6->a;
        v96 = v41;
        v97 = *(_OWORD *)&a6->tx;
        -[HKLineSeries _enumeratePathsFromBlockCoordinates:axisRect:zoomLevelConfiguration:transform:presentationStyle:caresAboutSelection:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:handler:](v80, "_enumeratePathsFromBlockCoordinates:axisRect:zoomLevelConfiguration:transform:presentationStyle:caresAboutSelection:seriesRenderingDelegate:forceGapBetweenUntransformedPoints:handler:", v78, v72, &v95, v81, v26, v70, x, y, width, height, v68, v98);
        if (v36)
        {
          if ((objc_msgSend(v76, "isEmpty") & 1) == 0)
          {
            objc_msgSend(v36, "applyToContext:", c);
            CGContextAddPath(c, (CGPathRef)objc_msgSend(objc_retainAutorelease(v76), "CGPath"));
            CGContextStrokePath(c);
          }
          if ((objc_msgSend(v37, "isEmpty") & 1) == 0)
          {
            objc_msgSend(v75, "applyToContext:", c);
            CGContextAddPath(c, (CGPathRef)objc_msgSend(objc_retainAutorelease(v37), "CGPath"));
            CGContextStrokePath(c);
          }
        }
        if (v38)
        {
          if ((objc_msgSend(v39, "isEmpty") & 1) == 0)
          {
            v42 = objc_msgSend(objc_retainAutorelease(v39), "CGPath");
            -[HKGraphSeries alpha](v80, "alpha");
            objc_msgSend(v38, "renderPath:context:axisRect:alpha:", v42, c, x, y, width, height, v43);
          }
          if ((objc_msgSend(v37, "isEmpty") & 1) == 0)
          {
            v44 = objc_msgSend(objc_retainAutorelease(v73), "CGPath");
            -[HKGraphSeries alpha](v80, "alpha");
            objc_msgSend(v77, "renderPath:context:axisRect:alpha:", v44, c, x, y, width, height, v45);
          }
        }
        if (v40)
          -[HKLineSeries _renderLineEndCapsInContext:endCaps:endCapImage:](v80, "_renderLineEndCapsInContext:endCaps:endCapImage:", c, v74, v40);
        v46 = *(_OWORD *)&a6->c;
        v95 = *(_OWORD *)&a6->a;
        v96 = v46;
        v97 = *(_OWORD *)&a6->tx;
        -[HKLineSeries _renderPointMarkersInContext:blockCoordinates:pointTransform:presentationStyle:](v80, "_renderPointMarkersInContext:blockCoordinates:pointTransform:presentationStyle:", c, v78, &v95, v81);
        objc_msgSend(v81, "annotationStyle");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          v48 = *(_OWORD *)&a6->c;
          v95 = *(_OWORD *)&a6->a;
          v96 = v48;
          v97 = *(_OWORD *)&a6->tx;
          -[HKLineSeries _renderPointLabelsInContext:blockCoordinates:axisRect:pointTransform:presentationStyle:zoomLevelConfiguration:seriesRenderingDelegate:](v80, "_renderPointLabelsInContext:blockCoordinates:axisRect:pointTransform:presentationStyle:zoomLevelConfiguration:seriesRenderingDelegate:", c, v78, &v95, v81, v72, v70, x, y, width, height);
        }
        objc_msgSend(v81, "legendAnnotationStyle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49 == 0;

        if (!v50)
        {
          objc_msgSend(v81, "legendAnnotationStyle");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "leftOfSeries");

          *(_QWORD *)&v95 = 0;
          *((_QWORD *)&v95 + 1) = &v95;
          *(_QWORD *)&v96 = 0x3010000000;
          *((_QWORD *)&v96 + 1) = &unk_1D7BC951A;
          v97 = 0uLL;
          v89 = 0;
          v90 = (double *)&v89;
          v91 = 0x3010000000;
          v92 = &unk_1D7BC951A;
          v93 = 0;
          v94 = 0;
          v53 = *(_OWORD *)&a6->c;
          v86 = *(_OWORD *)&a6->a;
          v87 = v53;
          v88 = *(_OWORD *)&a6->tx;
          if ((_DWORD)v52)
            objc_msgSend(v78, "firstCoordinateWithTransform:roundToViewScale:", &v86, 1);
          else
            objc_msgSend(v78, "lastCoordinateWithTransform:roundToViewScale:", &v86, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "coordinate");
          v55 = *((_QWORD *)&v95 + 1);
          *(_QWORD *)(*((_QWORD *)&v95 + 1) + 32) = v56;
          *(_QWORD *)(v55 + 40) = v57;
          v58 = *(_OWORD *)&a6->c;
          v86 = *(_OWORD *)&a6->a;
          v87 = v58;
          v88 = *(_OWORD *)&a6->tx;
          v59 = (void *)objc_msgSend(v54, "copyWithTransform:roundToViewScale:", &v86, 1);
          objc_msgSend(v59, "coordinate");
          v60 = v90;
          *((_QWORD *)v90 + 4) = v61;
          *((_QWORD *)v60 + 5) = v62;

          v84[0] = 0;
          v84[1] = v84;
          v84[2] = 0x2020000000;
          v85 = 1;
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __190__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints___block_invoke_2;
          v82[3] = &unk_1E9C40B90;
          v83 = v52;
          v82[4] = v84;
          v82[5] = &v89;
          v82[6] = &v95;
          v63 = *(_OWORD *)&a6->c;
          v86 = *(_OWORD *)&a6->a;
          v87 = v63;
          v88 = *(_OWORD *)&a6->tx;
          -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](v80, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v78, &v86, v81, v72, v82, x, y, width, height);
          -[HKLineSeries drawLegendPointLabelInContext:point:untransformedPoint:axisRect:presentationStyle:leftOfPoint:](v80, "drawLegendPointLabelInContext:point:untransformedPoint:axisRect:presentationStyle:leftOfPoint:", c, v81, v52, v90[4], v90[5], *(double *)(*((_QWORD *)&v95 + 1) + 32), *(double *)(*((_QWORD *)&v95 + 1) + 40), x, y, width, height);
          _Block_object_dispose(v84, 8);
          _Block_object_dispose(&v89, 8);
          _Block_object_dispose(&v95, 8);
        }

        v20 = v71 + 1;
      }
      while (v69 != v71 + 1);
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
    }
    while (v69);
  }

  CGContextRestoreGState(c);
  v64 = *(_OWORD *)&a6->c;
  v95 = *(_OWORD *)&a6->a;
  v96 = v64;
  v97 = *(_OWORD *)&a6->tx;
  -[HKLineSeries _updateSecondaryRenderContextWithBlockCoordinates:secondaryRenderContext:pointTransform:zoomLevelConfiguration:axisRect:](v80, "_updateSecondaryRenderContextWithBlockCoordinates:secondaryRenderContext:pointTransform:zoomLevelConfiguration:axisRect:", v78, v65, &v95, v72, x, y, width, height);

}

void __190__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints___block_invoke(uint64_t a1, void *a2, double a3, CGFloat a4, double a5, CGFloat MaxY)
{
  void *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a2;
  objc_msgSend(*(id *)(a1 + 32), "closestXCoordinateRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_3;
  objc_msgSend(*(id *)(a1 + 32), "closestXCoordinateRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = HKUIFloorToScreenScale(v14);

  objc_msgSend(*(id *)(a1 + 32), "closestXCoordinateRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "maxValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = HKUIFloorToScreenScale(v18);

  v20 = vabdd_f64(v15, HKUIFloorToScreenScale(a3));
  if (v20 <= HKUIOnePixel())
  {
    v22 = vabdd_f64(v19, HKUIFloorToScreenScale(a5));
    v21 = v22 <= HKUIOnePixel();
  }
  else
  {
LABEL_3:
    v21 = 0;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v23 = 56;
    if (v21)
      v23 = 48;
    objc_msgSend(*(id *)(a1 + v23), "appendPath:", v30);
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v24 = (void *)objc_msgSend(v30, "copy");
    MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 104));
    a4 = CGRectGetMaxY(*(CGRect *)(a1 + 104));
    objc_msgSend(v24, "addLineToPoint:", a5, MaxY);
    objc_msgSend(v24, "addLineToPoint:", a3, a4);
    objc_msgSend(v24, "closePath");
    v25 = 80;
    if (v21)
      v25 = 72;
    objc_msgSend(*(id *)(a1 + v25), "appendPath:", v24);

  }
  if (*(_QWORD *)(a1 + 88))
  {
    v26 = *(void **)(a1 + 96);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a3, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v27);

    if (a3 != a5 || a4 != MaxY)
    {
      v28 = *(void **)(a1 + 96);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a5, MaxY);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v29);

    }
  }

}

uint64_t __190__HKLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate_forceGapBetweenUntransformedPoints___block_invoke_2(uint64_t result, int a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) && *(_BYTE *)(result + 56))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    *(double *)(v6 + 32) = a3;
    *(double *)(v6 + 40) = a4;
    v7 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
    *(double *)(v7 + 32) = a5;
    *(double *)(v7 + 40) = a6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  }
  if (a2)
  {
    if (!*(_BYTE *)(result + 56))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
      *(double *)(v8 + 32) = a3;
      *(double *)(v8 + 40) = a4;
      v9 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
      *(double *)(v9 + 32) = a5;
      *(double *)(v9 + 40) = a6;
    }
  }
  return result;
}

- (id)pointMarkerImageForPointMarkerStyle:(id)a3
{
  return +[HKChartSeriesPointMarker chartPointWithLineSeriesPresentationStyle:](HKChartSeriesPointMarker, "chartPointWithLineSeriesPresentationStyle:", a3);
}

- (void)drawLegendPointLabelInContext:(CGContext *)a3 point:(CGPoint)a4 untransformedPoint:(CGPoint)a5 axisRect:(CGRect)a6 presentationStyle:(id)a7 leftOfPoint:(BOOL)a8
{
  _BOOL4 v8;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  _QWORD v32[2];
  _QWORD v33[3];

  v8 = a8;
  y = a4.y;
  x = a4.x;
  v33[2] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  objc_msgSend(v11, "legendAnnotationStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "labelStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC1140];
  v32[0] = *MEMORY[0x1E0DC1138];
  v32[1] = v16;
  v33[0] = v15;
  v33[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legendAnnotationStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedLabelKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "sizeWithAttributes:", v17);
  v23 = v22;
  v25 = v24;
  if (v8)
  {
    v26 = x + v22 * -0.5 * 2.0 + -3.0;
    objc_msgSend(v11, "pointMarkerStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "radius");
    v29 = v26 - v28;
  }
  else
  {
    objc_msgSend(v11, "pointMarkerStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "radius");
    v29 = x + 3.0 + v30;
  }

  -[HKLineSeries _renderPointLegendLabelWithText:drawRect:labelAttributes:](self, "_renderPointLegendLabelWithText:drawRect:labelAttributes:", v21, v17, v29, y + v25 * -0.5, v23, v25);
}

- (void)_updateSecondaryRenderContextWithBlockCoordinates:(id)a3 secondaryRenderContext:(id)a4 pointTransform:(CGAffineTransform *)a5 zoomLevelConfiguration:(id)a6 axisRect:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  CGFloat MinY;
  CGFloat MaxY;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  __int128 v24;
  _OWORD v25[3];
  _QWORD v26[4];
  id v27;
  HKLineSeries *v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  CGFloat v33;
  CGFloat v34;
  _QWORD aBlock[4];
  id v36;
  HKLineSeries *v37;
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  CGFloat v41;
  CGFloat v42;
  _QWORD v43[4];
  _QWORD v44[4];
  int64x2_t v45;
  CGRect v46;
  CGRect v47;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3010000000;
  v44[3] = &unk_1D7BC951A;
  v45 = vdupq_n_s64(0x10000000000000uLL);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0x10000000000000;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  MinY = CGRectGetMinY(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MaxY = CGRectGetMaxY(v47);
  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke_2;
  aBlock[3] = &unk_1E9C40BF8;
  v41 = MinY;
  v42 = MaxY;
  v38 = &__block_literal_global_219;
  v39 = v43;
  v40 = v44;
  v21 = v16;
  v36 = v21;
  v37 = self;
  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke_3;
  v26[3] = &unk_1E9C40C20;
  v33 = MinY;
  v34 = MaxY;
  v31 = v44;
  v32 = v43;
  v22 = _Block_copy(aBlock);
  v29 = v22;
  v30 = &__block_literal_global_219;
  v23 = v21;
  v27 = v23;
  v28 = self;
  v24 = *(_OWORD *)&a5->c;
  v25[0] = *(_OWORD *)&a5->a;
  v25[1] = v24;
  v25[2] = *(_OWORD *)&a5->tx;
  -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v15, v25, 0, v17, v26, x, y, width, height);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);

}

BOOL __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke(double a1, double a2, double a3, double a4)
{
  return HKUIEqualCGFloats(a4, a2);
}

void __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, __n128 a5, __n128 a6)
{
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  a6.n128_f64[0] = a4;
  a5.n128_f64[0] = a3;
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 2.22507386e-308)
  {
    v8 = 80;
    if ((_DWORD)a2)
      v8 = 72;
    v9 = (*(double (**)(double, double, __n128, __n128, double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a5, a6, *(double *)(a1 + v8));
    v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "offScreenIndicatorColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOffScreenRegionWithStartLocation:endLocation:color:aboveScreen:", v12, a2, v10, v9);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0x10000000000000;
  }
}

void __136__HKLineSeries__updateSecondaryRenderContextWithBlockCoordinates_secondaryRenderContext_pointTransform_zoomLevelConfiguration_axisRect___block_invoke_3(uint64_t a1, int a2, void *a3, double a4, double a5)
{
  id v9;
  __n128 v10;
  __n128 v11;
  double v12;
  _BOOL4 v13;
  uint64_t v14;
  __n128 v15;
  BOOL v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;

  v9 = a3;
  v12 = *(double *)(a1 + 80);
  v11.n128_u64[0] = *(_QWORD *)(a1 + 88);
  v13 = a5 < v12;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15.n128_u64[0] = *(_QWORD *)(v14 + 32);
  if (a5 > v11.n128_f64[0])
    v13 = 1;
  if (v13 && v15.n128_f64[0] == 2.22507386e-308)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a4;
  }
  else
  {
    v10.n128_u64[0] = *(_QWORD *)(v14 + 40);
    if (a5 < v12 && v10.n128_f64[0] >= v12)
    {
      v24 = v9;
      v18 = v10.n128_f64[0] <= v11.n128_f64[0];
      v11.n128_u64[0] = *(_QWORD *)(a1 + 80);
      if (!v18)
      {
        (*(void (**)(double, double))(*(_QWORD *)(a1 + 48) + 16))(a4, a5);
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v11.n128_u64[0] = *(_QWORD *)(a1 + 80);
LABEL_25:
        v15.n128_u64[0] = *(_QWORD *)(v19 + 32);
        v10.n128_u64[0] = *(_QWORD *)(v19 + 40);
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    v18 = a5 > v11.n128_f64[0] && v10.n128_f64[0] <= v11.n128_f64[0];
    if (v18)
    {
      v24 = v9;
      if (v10.n128_f64[0] < v12)
      {
        (*(void (**)(double, double))(*(_QWORD *)(a1 + 48) + 16))(a4, a5);
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v11.n128_u64[0] = *(_QWORD *)(a1 + 88);
        goto LABEL_25;
      }
LABEL_26:
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (*(double (**)(__n128, __n128, double, double, __n128))(*(_QWORD *)(a1 + 56) + 16))(v15, v10, a4, a5, v11);
LABEL_27:
      v9 = v24;
      if (!a2)
        goto LABEL_30;
      goto LABEL_28;
    }
    if (!v13)
    {
      v24 = v9;
      (*(void (**)(double, double))(*(_QWORD *)(a1 + 48) + 16))(a4, a5);
      goto LABEL_27;
    }
  }
  if (!a2)
    goto LABEL_30;
LABEL_28:
  v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v20 != 2.22507386e-308)
  {
    v25 = v9;
    v21 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "offScreenIndicatorColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addOffScreenRegionWithStartLocation:endLocation:color:aboveScreen:", v22, a5 < v12, v20, a4);

    v9 = v25;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0x10000000000000;
  }
LABEL_30:
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  *(double *)(v23 + 32) = a4;
  *(double *)(v23 + 40) = a5;

}

- (void)_renderLineEndCapsInContext:(CGContext *)a3 endCaps:(id)a4 endCapImage:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  CGImage *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  CGContextSaveGState(a3);
  v9 = HKChartSeriesPointMarkerBaseRect(v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = objc_retainAutorelease(v8);
  v17 = (CGImage *)objc_msgSend(v16, "CGImage");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v22), "CGPointValue", (_QWORD)v27);
        v24 = v23;
        v26 = v25;
        v33.origin.x = v9;
        v33.origin.y = v11;
        v33.size.width = v13;
        v33.size.height = v15;
        v34 = CGRectOffset(v33, v24, v26);
        CGContextDrawImage(a3, v34, v17);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v20);
  }

  CGContextRestoreGState(a3);
}

- (void)_renderPointMarkersInContext:(CGContext *)a3 blockCoordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 presentationStyle:(id)a6
{
  id v10;
  void *v11;
  HKLineSeriesPointMarkerStyle *selectedPointMarkerStyle;
  void *v13;
  void *v14;
  __int128 v15;
  _OWORD v16[3];

  v10 = a4;
  objc_msgSend(a6, "pointMarkerStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  selectedPointMarkerStyle = self->_selectedPointMarkerStyle;
  -[NSArray firstObject](self->_selectedPresentationStyles, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pointMarkerStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&a5->c;
  v16[0] = *(_OWORD *)&a5->a;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a5->tx;
  -[HKLineSeries renderPointMarkersInContext:blockCoordinates:pointTransform:pointMarkerStyle:selectedBoundsMarkerStyle:selectedPointMarkerStyle:](self, "renderPointMarkersInContext:blockCoordinates:pointTransform:pointMarkerStyle:selectedBoundsMarkerStyle:selectedPointMarkerStyle:", a3, v10, v16, v11, selectedPointMarkerStyle, v14);

}

- (void)renderPointMarkersInContext:(CGContext *)a3 blockCoordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 pointMarkerStyle:(id)a6 selectedBoundsMarkerStyle:(id)a7 selectedPointMarkerStyle:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  id v40;
  _OWORD v41[3];
  _QWORD v42[9];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  CGContext *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  v14 = a4;
  v15 = a7;
  v16 = a8;
  -[HKLineSeries pointMarkerImageForPointMarkerStyle:](self, "pointMarkerImageForPointMarkerStyle:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    CGContextSaveGState(a3);
    v18 = HKChartSeriesPointMarkerBaseRect(v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v39 = objc_msgSend(objc_retainAutorelease(v17), "CGImage");
    -[HKLineSeries pointMarkerImageForPointMarkerStyle:](self, "pointMarkerImageForPointMarkerStyle:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = HKChartSeriesPointMarkerBaseRect(v25);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = objc_retainAutorelease(v25);
    v34 = v14;
    v35 = objc_msgSend(v33, "CGImage");
    -[HKLineSeries pointMarkerImageForPointMarkerStyle:](self, "pointMarkerImageForPointMarkerStyle:", v16);
    v40 = v16;
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = objc_msgSend(v36, "CGImage");
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __144__HKLineSeries_renderPointMarkersInContext_blockCoordinates_pointTransform_pointMarkerStyle_selectedBoundsMarkerStyle_selectedPointMarkerStyle___block_invoke;
    v42[3] = &__block_descriptor_192_e114_v64__0___HKLineSeriesBlockCoordinate_8____HKGraphSeriesDataBlockPath_qqq_q_16___HKLineSeriesBlockCoordinate_48_B56l;
    v42[4] = v39;
    *(double *)&v42[5] = v18;
    v42[6] = v20;
    v42[7] = v22;
    v42[8] = v24;
    v43 = v54;
    v44 = v55;
    v45 = v56;
    v46 = v57;
    v47 = v35;
    v14 = v34;
    v48 = v26;
    v49 = v28;
    v50 = v30;
    v51 = v32;
    v52 = v37;
    v53 = a3;
    v38 = *(_OWORD *)&a5->c;
    v41[0] = *(_OWORD *)&a5->a;
    v41[1] = v38;
    v41[2] = *(_OWORD *)&a5->tx;
    objc_msgSend(v34, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v41, 1, v42);
    CGContextRestoreGState(a3);

    v16 = v40;
  }

}

void __144__HKLineSeries_renderPointMarkersInContext_blockCoordinates_pointTransform_pointMarkerStyle_selectedBoundsMarkerStyle_selectedPointMarkerStyle___block_invoke(uint64_t a1, void *a2, __int128 *a3)
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGImage *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGContext *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGRect v28;
  CGRect v29;

  objc_msgSend(a2, "coordinate");
  v6 = v5;
  v8 = v7;
  v9 = *(CGImage **)(a1 + 32);
  v10 = *(double *)(a1 + 40);
  v11 = *(double *)(a1 + 48);
  v12 = *(double *)(a1 + 56);
  v13 = *(double *)(a1 + 64);
  v14 = a3[1];
  v22 = *a3;
  v23 = v14;
  v15 = *(_OWORD *)(a1 + 88);
  v26 = *(_OWORD *)(a1 + 72);
  v27 = v15;
  if (HKGraphSeriesDataPointPathEqualToPath(&v22, &v26)
    || (v16 = a3[1],
        v22 = *a3,
        v23 = v16,
        v17 = *(_OWORD *)(a1 + 120),
        v26 = *(_OWORD *)(a1 + 104),
        v27 = v17,
        HKGraphSeriesDataPointPathEqualToPath(&v22, &v26)))
  {
    v9 = *(CGImage **)(a1 + 136);
    v10 = *(double *)(a1 + 144);
    v11 = *(double *)(a1 + 152);
    v12 = *(double *)(a1 + 160);
    v13 = *(double *)(a1 + 168);
  }
  v18 = a3[1];
  v26 = *a3;
  v27 = v18;
  v19 = *(_OWORD *)(a1 + 88);
  v22 = *(_OWORD *)(a1 + 72);
  v23 = v19;
  v20 = *(_OWORD *)(a1 + 120);
  v24 = *(_OWORD *)(a1 + 104);
  v25 = v20;
  if (HKGraphSeriesDataPointPathInRange((uint64_t *)&v26, (uint64_t *)&v22))
  {
    v9 = *(CGImage **)(a1 + 176);
    v10 = *(double *)(a1 + 40);
    v11 = *(double *)(a1 + 48);
    v12 = *(double *)(a1 + 56);
    v13 = *(double *)(a1 + 64);
  }
  v21 = *(CGContext **)(a1 + 184);
  v28.origin.x = v10;
  v28.origin.y = v11;
  v28.size.width = v12;
  v28.size.height = v13;
  v29 = CGRectOffset(v28, v6, v8);
  CGContextDrawImage(v21, v29, v9);
}

- (void)_renderPointLabelsInContext:(CGContext *)a3 blockCoordinates:(id)a4 axisRect:(CGRect)a5 pointTransform:(CGAffineTransform *)a6 presentationStyle:(id)a7 zoomLevelConfiguration:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HKPointLabelEngine *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  HKPointLabelEngine *v35;
  CGContext *v36;
  HKPointLabelEngine *v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v47;
  void *v48;
  _OWORD v49[3];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  HKPointLabelEngine *v54;
  HKLineSeries *v55;
  id v56;
  id v57;
  id v58;
  CGContext *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[4];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v64[2] = *MEMORY[0x1E0C80C00];
  v18 = a9;
  v45 = a8;
  v19 = a7;
  v44 = a4;
  objc_msgSend(v19, "annotationStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textColor");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "font");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0DC1140];
  v63[0] = *MEMORY[0x1E0DC1138];
  v63[1] = v23;
  v47 = (void *)v22;
  v48 = (void *)v21;
  v64[0] = v22;
  v64[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v20;
  objc_msgSend(v20, "numberFormatter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    HKIntegerFormatter();
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;

  v29 = [HKPointLabelEngine alloc];
  v30 = v18;
  v31 = objc_msgSend(v18, "seriesDrawingDuringTiling") ^ 1;
  v32 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __150__HKLineSeries__renderPointLabelsInContext_blockCoordinates_axisRect_pointTransform_presentationStyle_zoomLevelConfiguration_seriesRenderingDelegate___block_invoke;
  v60[3] = &unk_1E9C40C68;
  v33 = v28;
  v61 = v33;
  v34 = v24;
  v62 = v34;
  v35 = -[HKPointLabelEngine initWithBoundingRegion:isLabelShiftingEnabled:labelSizeBlock:](v29, "initWithBoundingRegion:isLabelShiftingEnabled:labelSizeBlock:", v31, v60, x, y, width, height);
  v36 = a3;
  CGContextSaveGState(a3);
  v53[0] = v32;
  v53[1] = 3221225472;
  v53[2] = __150__HKLineSeries__renderPointLabelsInContext_blockCoordinates_axisRect_pointTransform_presentationStyle_zoomLevelConfiguration_seriesRenderingDelegate___block_invoke_2;
  v53[3] = &unk_1E9C40C90;
  v37 = v35;
  v54 = v37;
  v55 = self;
  v59 = a3;
  v38 = v33;
  v56 = v38;
  v39 = v34;
  v57 = v39;
  v40 = v30;
  v58 = v40;
  v41 = *(_OWORD *)&a6->c;
  v50 = *(_OWORD *)&a6->a;
  v51 = v41;
  v52 = *(_OWORD *)&a6->tx;
  -[HKLineSeries _enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:](self, "_enumerateCoordinateListByRemovingOffscreenPoints:withTransform:presentationStyle:zoomLevelConfiguration:axisRect:block:", v44, &v50, v19, v45, v53, x, y, width, height);

  if (-[HKPointLabelEngine processLastPoint](v37, "processLastPoint"))
  {
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    if (v37)
    {
      -[HKPointLabelEngine renderingData](v37, "renderingData");
      v42 = *((_QWORD *)&v52 + 1) | 2;
    }
    else
    {
      *(_QWORD *)&v52 = 0;
      v42 = 2;
      v50 = 0uLL;
      v51 = 0uLL;
    }
    *((_QWORD *)&v52 + 1) = v42;
    v49[0] = v50;
    v49[1] = v51;
    v49[2] = v52;
    -[HKLineSeries _renderPointLabelInContext:renderingData:numberFormatter:labelAttributes:seriesRenderingDelegate:](self, "_renderPointLabelInContext:renderingData:numberFormatter:labelAttributes:seriesRenderingDelegate:", v36, v49, v38, v39, v40);
  }
  CGContextRestoreGState(v36);

}

double __150__HKLineSeries__renderPointLabelsInContext_blockCoordinates_axisRect_pointTransform_presentationStyle_zoomLevelConfiguration_seriesRenderingDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:displayType:unitController:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sizeWithAttributes:", *(_QWORD *)(a1 + 40));
  v6 = v5;

  return v6;
}

uint64_t __150__HKLineSeries__renderPointLabelsInContext_blockCoordinates_axisRect_pointTransform_presentationStyle_zoomLevelConfiguration_seriesRenderingDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  result = objc_msgSend(*(id *)(a1 + 32), "processTransformedPoint:untransformedPoint:");
  if ((_DWORD)result)
  {
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v3, "renderingData");
      v4 = *((_QWORD *)&v13 + 1) | 2;
    }
    else
    {
      *(_QWORD *)&v13 = 0;
      v4 = 2;
      v11 = 0uLL;
      v12 = 0uLL;
    }
    *((_QWORD *)&v13 + 1) = v4;
    v6 = *(_QWORD *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    return objc_msgSend(v7, "_renderPointLabelInContext:renderingData:numberFormatter:labelAttributes:seriesRenderingDelegate:", v5, v10, v8, v9, v6);
  }
  return result;
}

- (void)_renderPointLabelInContext:(CGContext *)a3 renderingData:(id *)a4 numberFormatter:(id)a5 labelAttributes:(id)a6 seriesRenderingDelegate:(id)a7
{
  id v11;
  void *v12;
  double var1;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a6;
  v11 = a7;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  var1 = a4->var1;
  v14 = a5;
  objc_msgSend(v12, "numberWithDouble:", var1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromNumber:displayType:unitController:", v15, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a4->var2 & 2) != 0)
  {
    if ((objc_msgSend(v11, "seriesDrawingDuringTiling") & 1) != 0
      || objc_msgSend(v11, "seriesDrawingDuringScrolling"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
    objc_msgSend(v16, "hk_drawInRect:withAttributes:outlineWidth:outlineColor:context:", v19, v17, a3, a4->var0.origin.x, a4->var0.origin.y, a4->var0.size.width, a4->var0.size.height, 8.0);

  }
  else
  {
    objc_msgSend(v16, "drawInRect:withAttributes:", v19, a4->var0.origin.x, a4->var0.origin.y, a4->var0.size.width, a4->var0.size.height);
  }

}

- (void)_renderPointLegendLabelWithText:(id)a3 drawRect:(CGRect)a4 labelAttributes:(id)a5
{
  objc_msgSend(a3, "drawInRect:withAttributes:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKLineSeries.m"), 1018, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __58__HKLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C40CB8;
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

void __58__HKLineSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(_QWORD *a1, void *a2)
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
  _HKLineSeriesBlockCoordinate *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)a1[4];
    objc_msgSend(v15, "xValueAsGenericType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateForValue:", v5);
    v7 = v6;

    v8 = (void *)a1[5];
    objc_msgSend(v15, "yValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinateForValue:", v9);
    v11 = v10;

    objc_msgSend(v15, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)a1[6];
    v14 = -[_HKLineSeriesBlockCoordinate initWithCoordinate:userInfo:]([_HKLineSeriesBlockCoordinate alloc], "initWithCoordinate:userInfo:", v12, v7, v11);
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HKLineSeries unhighlightedPresentationStyles](self, "unhighlightedPresentationStyles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "annotationStyle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 != 0;

        v9 |= v13;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (a4 == 1)
    return (a3 == 5) & v9;
  else
    return 0;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  id v7;
  double v8;
  double v9;
  void *v11;

  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKLineSeries.m"), 1063, CFSTR("distanceFromPoint type class failure"));

  }
  objc_msgSend(v7, "coordinate");
  UIDistanceBetweenPoints();
  v9 = v8;

  return v9;
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKLineSeries.m"), 1071, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  objc_msgSend(v8, "coordinate");
  v10 = vabdd_f64(v9, x);

  return v10;
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKLineSeries.m"), 1080, CFSTR("yAxisDiffToPoint type class failure"));

  }
  objc_msgSend(v8, "coordinate");
  v10 = v9 - y;

  return v10;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGPoint v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "coordinate");
  v11.x = v8;
  v11.y = v9;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return CGRectContainsPoint(v12, v11);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "coordinate");
  v7 = v6;
  objc_msgSend(v5, "coordinate");
  v9 = v8;

  return v7 < v9;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "coordinate");
  v7 = v6;
  objc_msgSend(v5, "coordinate");
  v9 = v8;

  return v7 > v9;
}

- (NSArray)unhighlightedPresentationStyles
{
  return self->_unhighlightedPresentationStyles;
}

- (void)setUnhighlightedPresentationStyles:(id)a3
{
  objc_storeStrong((id *)&self->_unhighlightedPresentationStyles, a3);
}

- (NSArray)highlightedPresentationStyles
{
  return self->_highlightedPresentationStyles;
}

- (void)setHighlightedPresentationStyles:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedPresentationStyles, a3);
}

- (NSArray)selectedPresentationStyles
{
  return self->_selectedPresentationStyles;
}

- (void)setSelectedPresentationStyles:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPresentationStyles, a3);
}

- (HKLineSeriesPointMarkerStyle)selectedPointMarkerStyle
{
  return self->_selectedPointMarkerStyle;
}

- (void)setSelectedPointMarkerStyle:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPointMarkerStyle, a3);
}

- (HKLineSeriesPresentationStyle)inactivePresentationStyle
{
  return self->_inactivePresentationStyle;
}

- (void)setInactivePresentationStyle:(id)a3
{
  objc_storeStrong((id *)&self->_inactivePresentationStyle, a3);
}

- (BOOL)flatLastValue
{
  return self->_flatLastValue;
}

- (void)setFlatLastValue:(BOOL)a3
{
  self->_flatLastValue = a3;
}

- (BOOL)extendLastValue
{
  return self->_extendLastValue;
}

- (void)setExtendLastValue:(BOOL)a3
{
  self->_extendLastValue = a3;
}

- (BOOL)extendFirstValue
{
  return self->_extendFirstValue;
}

- (void)setExtendFirstValue:(BOOL)a3
{
  self->_extendFirstValue = a3;
}

- (NSNumber)maximumConnectionDistance
{
  return self->_maximumConnectionDistance;
}

- (void)setMaximumConnectionDistance:(id)a3
{
  objc_storeStrong((id *)&self->_maximumConnectionDistance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumConnectionDistance, 0);
  objc_storeStrong((id *)&self->_inactivePresentationStyle, 0);
  objc_storeStrong((id *)&self->_selectedPointMarkerStyle, 0);
  objc_storeStrong((id *)&self->_selectedPresentationStyles, 0);
  objc_storeStrong((id *)&self->_highlightedPresentationStyles, 0);
  objc_storeStrong((id *)&self->_unhighlightedPresentationStyles, 0);
}

@end
