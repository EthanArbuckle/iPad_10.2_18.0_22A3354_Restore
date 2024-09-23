@implementation HKBloodPressureSeries

- (HKBloodPressureSeries)init
{
  HKBloodPressureSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  HKBloodPressureSeriesPresentationStyle *selectedPresentationStyleStorage;
  HKBloodPressureSeriesPresentationStyle *unselectedPresentationStyleStorage;
  HKBloodPressureSeriesPresentationStyle *inactivePresentationStyleStorage;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKBloodPressureSeries;
  v2 = -[HKGraphSeries init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKBloodPressureSeriesLock"));
    selectedPresentationStyleStorage = v2->_selectedPresentationStyleStorage;
    v2->_selectedPresentationStyleStorage = 0;

    unselectedPresentationStyleStorage = v2->_unselectedPresentationStyleStorage;
    v2->_unselectedPresentationStyleStorage = 0;

    inactivePresentationStyleStorage = v2->_inactivePresentationStyleStorage;
    v2->_inactivePresentationStyleStorage = 0;

    objc_storeWeak((id *)&v2->_seriesHighlightDelegateStorage, 0);
  }
  return v2;
}

+ (id)_bloodPressurePresentationStyleWithSystolicColor:(id)a3 diastolicColor:(id)a4
{
  id v5;
  id v6;
  HKBloodPressureSeriesPresentationStyle *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKBloodPressureSeriesPresentationStyle);
  -[HKBloodPressureSeriesPresentationStyle setWidth:](v7, "setWidth:", 8.0);
  -[HKBloodPressureSeriesPresentationStyle setSystolicSymbolColor:](v7, "setSystolicSymbolColor:", v6);

  -[HKBloodPressureSeriesPresentationStyle systolicSymbolColor](v7, "systolicSymbolColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBloodPressureSeriesPresentationStyle setSystolicFillColor:](v7, "setSystolicFillColor:", v9);

  -[HKBloodPressureSeriesPresentationStyle setDiastolicSymbolColor:](v7, "setDiastolicSymbolColor:", v5);
  -[HKBloodPressureSeriesPresentationStyle diastolicSymbolColor](v7, "diastolicSymbolColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBloodPressureSeriesPresentationStyle setDiastolicFillColor:](v7, "setDiastolicFillColor:", v11);

  return v7;
}

+ (id)_bloodPressureInactivePresentationStyle
{
  HKBloodPressureSeriesPresentationStyle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(HKBloodPressureSeriesPresentationStyle);
  -[HKBloodPressureSeriesPresentationStyle setWidth:](v2, "setWidth:", 8.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKBloodPressureSeriesPresentationStyle setSystolicSymbolColor:](v2, "setSystolicSymbolColor:", v3);
  -[HKBloodPressureSeriesPresentationStyle setSystolicFillColor:](v2, "setSystolicFillColor:", v5);
  -[HKBloodPressureSeriesPresentationStyle setDiastolicSymbolColor:](v2, "setDiastolicSymbolColor:", v3);
  -[HKBloodPressureSeriesPresentationStyle setDiastolicFillColor:](v2, "setDiastolicFillColor:", v5);

  return v2;
}

+ (id)defaultSeriesWithDiastolicColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bloodPressurePresentationStyleWithSystolicColor:diastolicColor:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_bloodPressureInactivePresentationStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init((Class)a1);
  objc_msgSend(v9, "setUnselectedPresentationStyle:", v7);
  objc_msgSend(v9, "setInactivePresentationStyle:", v8);

  return v9;
}

- (HKBloodPressureSeriesPresentationStyle)selectedPresentationStyle
{
  void *v3;
  HKBloodPressureSeriesPresentationStyle *v4;
  void *v5;

  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_selectedPresentationStyleStorage;
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSelectedPresentationStyle:(id)a3
{
  HKBloodPressureSeriesPresentationStyle *v4;
  void *v5;
  HKBloodPressureSeriesPresentationStyle *selectedPresentationStyleStorage;
  id v7;

  v4 = (HKBloodPressureSeriesPresentationStyle *)a3;
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  selectedPresentationStyleStorage = self->_selectedPresentationStyleStorage;
  self->_selectedPresentationStyleStorage = v4;

  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKBloodPressureSeriesPresentationStyle)unselectedPresentationStyle
{
  void *v3;
  HKBloodPressureSeriesPresentationStyle *v4;
  void *v5;

  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_unselectedPresentationStyleStorage;
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setUnselectedPresentationStyle:(id)a3
{
  HKBloodPressureSeriesPresentationStyle *v4;
  void *v5;
  HKBloodPressureSeriesPresentationStyle *unselectedPresentationStyleStorage;
  id v7;

  v4 = (HKBloodPressureSeriesPresentationStyle *)a3;
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  unselectedPresentationStyleStorage = self->_unselectedPresentationStyleStorage;
  self->_unselectedPresentationStyleStorage = v4;

  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKBloodPressureSeriesPresentationStyle)inactivePresentationStyle
{
  void *v3;
  HKBloodPressureSeriesPresentationStyle *v4;
  void *v5;

  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_inactivePresentationStyleStorage;
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setInactivePresentationStyle:(id)a3
{
  HKBloodPressureSeriesPresentationStyle *v4;
  void *v5;
  HKBloodPressureSeriesPresentationStyle *inactivePresentationStyleStorage;
  id v7;

  v4 = (HKBloodPressureSeriesPresentationStyle *)a3;
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  inactivePresentationStyleStorage = self->_inactivePresentationStyleStorage;
  self->_inactivePresentationStyleStorage = v4;

  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKBloodPressureSeriesHighlightDelegate)seriesHighlightDelegate
{
  void *v3;
  id WeakRetained;
  void *v5;

  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  WeakRetained = objc_loadWeakRetained((id *)&self->_seriesHighlightDelegateStorage);
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return (HKBloodPressureSeriesHighlightDelegate *)WeakRetained;
}

- (void)setSeriesHighlightDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_storeWeak((id *)&self->_seriesHighlightDelegateStorage, v4);
  -[HKBloodPressureSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  id v12;
  __int128 v13;
  _OWORD v14[3];
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGContext *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v12 = a3;
  CGContextSaveGState(a7);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __164__HKBloodPressureSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v15[3] = &unk_1E9C43D40;
  v16 = v21;
  v17 = v22;
  v18 = v23;
  v19 = v24;
  v15[4] = self;
  v20 = a7;
  v13 = *(_OWORD *)&a6->c;
  v14[0] = *(_OWORD *)&a6->a;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&a6->tx;
  objc_msgSend(v12, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v14, 1, v15);

  CGContextRestoreGState(a7);
}

void __164__HKBloodPressureSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  char v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  _OWORD v96[4];
  _OWORD v97[3];

  v7 = a2;
  v8 = a4;
  v9 = a3[1];
  v97[0] = *a3;
  v97[1] = v9;
  v10 = *(_OWORD *)(a1 + 56);
  v96[0] = *(_OWORD *)(a1 + 40);
  v96[1] = v10;
  v11 = *(_OWORD *)(a1 + 88);
  v96[2] = *(_OWORD *)(a1 + 72);
  v96[3] = v11;
  v12 = HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v97, (uint64_t *)v96);
  v13 = *(void **)(a1 + 32);
  if (v12)
  {
    objc_msgSend(v13, "selectedPresentationStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "unselectedPresentationStyle");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v95 = v16;

  }
  else
  {
    objc_msgSend(v13, "unselectedPresentationStyle");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "allowsSelection")
    && (objc_msgSend(*(id *)(a1 + 32), "seriesHighlightDelegate"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "highlightEnabled"),
        v17,
        !v18))
  {
    v19 = v95;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "inactivePresentationStyle");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;
  objc_msgSend(v7, "systolicCoordinate");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "diastolicCoordinate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "seriesHighlightDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "highlightEnabled");

  v89 = v8;
  v90 = v7;
  if ((v23 & 1) == 0)
  {
    v38 = v21;
    v27 = v20;
    v91 = 0;
    v39 = 1;
    v40 = v27;
LABEL_18:
    v31 = v92;
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 32), "seriesHighlightDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "highlightedBloodPressureCoordinateWithCoordinate:originalCoordinate:", v7, v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v20;
  v27 = v26;
  if (!v25)
  {
    v38 = v21;
    v91 = 0;
    v39 = 1;
    v40 = v26;
    goto LABEL_18;
  }
  objc_msgSend(v21, "min");
  v29 = v28;
  objc_msgSend(v25, "diastolicCoordinate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "min");
  v31 = v92;
  if (v29 == v32)
  {
    objc_msgSend(v21, "max");
    v34 = v33;
    objc_msgSend(v25, "diastolicCoordinate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "max");
    v37 = v36;

    v93 = v27;
    if (v34 != v37)
      goto LABEL_21;
    v93 = v95;
    v30 = v27;
  }
  else
  {
    v93 = v27;
  }

LABEL_21:
  objc_msgSend(v92, "min");
  v42 = v41;
  objc_msgSend(v25, "systolicCoordinate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "min");
  v91 = v25;
  v38 = v21;
  if (v42 != v44)
  {

    goto LABEL_25;
  }
  objc_msgSend(v92, "max");
  v46 = v45;
  objc_msgSend(v25, "systolicCoordinate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "max");
  v49 = v48;

  if (v46 != v49)
  {
LABEL_25:
    v39 = 0;
    goto LABEL_26;
  }
  v50 = v95;

  v39 = 0;
  v27 = v50;
LABEL_26:
  v40 = v93;
LABEL_27:
  v94 = v40;
  v51 = *(void **)(a1 + 32);
  v52 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v40, "width");
  v54 = v53;
  objc_msgSend(v40, "diastolicSymbolColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "diastolicFillColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_drawRangeBackgroundInContext:coordinate:width:symbolType:symbolColor:fillColor:", v52, v38, 1, v55, v56, v54);

  v57 = *(void **)(a1 + 32);
  v58 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v27, "width");
  v60 = v59;
  objc_msgSend(v27, "systolicSymbolColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "systolicFillColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "_drawRangeBackgroundInContext:coordinate:width:symbolType:symbolColor:fillColor:", v58, v31, 0, v61, v62, v60);

  CGContextSaveGState(*(CGContextRef *)(a1 + 104));
  v63 = *(void **)(a1 + 32);
  v64 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v20, "width");
  v66 = v65;
  objc_msgSend(v20, "diastolicSymbolColor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "diastolicFillColor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "_drawRangeDotsInContext:coordinate:width:symbolType:symbolColor:fillColor:", v64, v38, 1, v67, v68, v66);

  v69 = *(void **)(a1 + 32);
  v70 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v20, "width");
  v72 = v71;
  objc_msgSend(v20, "systolicSymbolColor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "systolicFillColor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "_drawRangeDotsInContext:coordinate:width:symbolType:symbolColor:fillColor:", v70, v31, 0, v73, v74, v72);

  if ((v39 & 1) == 0)
  {
    v75 = *(void **)(a1 + 32);
    v76 = *(_QWORD *)(a1 + 104);
    objc_msgSend(v91, "diastolicCoordinate");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "width");
    v79 = v78;
    objc_msgSend(v95, "diastolicSymbolColor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "diastolicFillColor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "_drawRangeDotsInContext:coordinate:width:symbolType:symbolColor:fillColor:", v76, v77, 1, v80, v81, v79);

    v82 = *(void **)(a1 + 32);
    v83 = *(_QWORD *)(a1 + 104);
    objc_msgSend(v91, "systolicCoordinate");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "width");
    v86 = v85;
    objc_msgSend(v95, "systolicSymbolColor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v92;
    objc_msgSend(v95, "systolicFillColor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "_drawRangeDotsInContext:coordinate:width:symbolType:symbolColor:fillColor:", v83, v84, 0, v87, v88, v86);

  }
  CGContextRestoreGState(*(CGContextRef *)(a1 + 104));

}

- (void)_drawRangeDotsInContext:(CGContext *)a3 coordinate:(id)a4 width:(double)a5 symbolType:(int64_t)a6 symbolColor:(id)a7 fillColor:(id)a8
{
  id v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a4;
  v12 = a7;
  objc_msgSend(v16, "min");
  -[HKBloodPressureSeries _drawBloodPressureSymbol:withColor:atLocation:width:context:](self, "_drawBloodPressureSymbol:withColor:atLocation:width:context:", a6, v12, a3);
  objc_msgSend(v16, "max");
  v14 = v13;
  objc_msgSend(v16, "min");
  if (!HKUIEqualDoubles(v14, v15))
  {
    objc_msgSend(v16, "max");
    -[HKBloodPressureSeries _drawBloodPressureSymbol:withColor:atLocation:width:context:](self, "_drawBloodPressureSymbol:withColor:atLocation:width:context:", a6, v12, a3);
  }

}

- (void)_drawRangeBackgroundInContext:(CGContext *)a3 coordinate:(id)a4 width:(double)a5 symbolType:(int64_t)a6 symbolColor:(id)a7 fillColor:(id)a8
{
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  id v36;
  CGRect v37;

  v36 = a4;
  v12 = a8;
  objc_msgSend(v36, "max");
  v14 = v13;
  objc_msgSend(v36, "min");
  if (!HKUIEqualDoubles(v14, v15))
  {
    CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(objc_retainAutorelease(v12), "CGColor"));
    if (a6)
    {
      objc_msgSend(v36, "max");
      v17 = v16 + a5 * -0.5;
      objc_msgSend(v36, "max");
      v19 = v18;
      objc_msgSend(v36, "min");
      v21 = v20;
      objc_msgSend(v36, "max");
      v37.size.height = v21 - v22;
      v37.origin.x = v17;
      v37.origin.y = v19;
      v37.size.width = a5;
      CGContextFillRect(a3, v37);
    }
    else
    {
      v23 = a5 * 0.5;
      objc_msgSend(v36, "max");
      v25 = v24 - v23;
      objc_msgSend(v36, "max");
      CGContextMoveToPoint(a3, v25, v26);
      objc_msgSend(v36, "max");
      v28 = v27;
      objc_msgSend(v36, "max");
      CGContextAddArc(a3, v28, v29, v23, 3.14159265, 0.0, 1);
      objc_msgSend(v36, "min");
      v31 = v23 + v30;
      objc_msgSend(v36, "min");
      CGContextAddLineToPoint(a3, v31, v32);
      objc_msgSend(v36, "min");
      v34 = v33;
      objc_msgSend(v36, "min");
      CGContextAddArc(a3, v34, v35, v23, 0.0, 3.14159265, 1);
      CGContextClosePath(a3);
      CGContextFillPath(a3);
    }
  }

}

- (void)_drawBloodPressureSymbol:(int64_t)a3 withColor:(id)a4 atLocation:(CGPoint)a5 width:(double)a6 context:(CGContext *)a7
{
  double y;
  double x;
  id v12;
  id v13;

  y = a5.y;
  x = a5.x;
  v12 = a4;
  if (a3 == 1)
  {
    v13 = v12;
    +[HKBloodPressureSeries _drawDiastolicSymbolWithColor:atLocation:width:context:](HKBloodPressureSeries, "_drawDiastolicSymbolWithColor:atLocation:width:context:", v12, a7, x, y, a6);
    goto LABEL_5;
  }
  if (!a3)
  {
    v13 = v12;
    +[HKBloodPressureSeries _drawSystolicSymbolWithColor:atLocation:width:context:](HKBloodPressureSeries, "_drawSystolicSymbolWithColor:atLocation:width:context:", v12, a7, x, y, a6);
LABEL_5:
    v12 = v13;
  }

}

+ (void)_drawSystolicSymbolWithColor:(id)a3 atLocation:(CGPoint)a4 width:(double)a5 context:(CGContext *)a6
{
  double y;
  double x;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  CGColor *v21;
  CGRect v22;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  objc_msgSend(a1, "_rectCenteredAt:width:", x, y, a5);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_retainAutorelease(v11);
  v21 = (CGColor *)objc_msgSend(v20, "CGColor");

  CGContextSetFillColorWithColor(a6, v21);
  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  CGContextFillEllipseInRect(a6, v22);
}

+ (CGRect)_rectCenteredAt:(CGPoint)a3 width:(double)a4
{
  double v4;
  double v5;
  CGRect result;

  v4 = a3.x - a4 * 0.5;
  v5 = a3.y - a4 * 0.5;
  result.size.height = a4;
  result.size.width = a4;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (void)_drawDiastolicSymbolWithColor:(id)a3 atLocation:(CGPoint)a4 width:(double)a5 context:(CGContext *)a6
{
  double y;
  double x;
  double v10;

  y = a4.y;
  x = a4.x;
  CGContextSetFillColorWithColor(a6, (CGColorRef)objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
  v10 = a5 * 0.5;
  CGContextMoveToPoint(a6, x - v10, y);
  CGContextAddLineToPoint(a6, x, y - v10);
  CGContextAddLineToPoint(a6, x + v10, y);
  CGContextAddLineToPoint(a6, x, y + v10);
  CGContextFillPath(a6);
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
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBloodPressureSeries.m"), 336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __67__HKBloodPressureSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C43D68;
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

void __67__HKBloodPressureSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  HKMinMaxCoordinate *v4;
  HKMinMaxCoordinate *v5;
  void *v6;
  HKMinMaxCoordinate *v7;
  HKMinMaxCoordinate *v8;
  void *v9;
  _HKBloodPressureCoordinate *v10;
  void *v11;
  _HKBloodPressureCoordinate *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v13, "systolicChartPoint");
    v4 = (HKMinMaxCoordinate *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = [HKMinMaxCoordinate alloc];
      objc_msgSend(v13, "systolicChartPoint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HKMinMaxCoordinate initWithChartPoint:xAxisTransform:yAxisTransform:](v5, "initWithChartPoint:xAxisTransform:yAxisTransform:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(v13, "diastolicChartPoint");
    v7 = (HKMinMaxCoordinate *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [HKMinMaxCoordinate alloc];
      objc_msgSend(v13, "diastolicChartPoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HKMinMaxCoordinate initWithChartPoint:xAxisTransform:yAxisTransform:](v8, "initWithChartPoint:xAxisTransform:yAxisTransform:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    v10 = [_HKBloodPressureCoordinate alloc];
    objc_msgSend(v13, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_HKBloodPressureCoordinate initWithSystolicCoordinate:diastolicCoordinate:userInfo:](v10, "initWithSystolicCoordinate:diastolicCoordinate:userInfo:", v4, v7, v11);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
  }

}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  void *v20;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBloodPressureSeries.m"), 374, CFSTR("distanceFromPoint type class failure"));

  }
  v10 = v9;
  objc_msgSend(v10, "systolicCoordinate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "diastolicCoordinate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "distanceToPoint:", x, y);
  v14 = v13;
  objc_msgSend(v12, "distanceToPoint:", x, y);
  v16 = 1.79769313e308;
  if (v12)
    v16 = v15;
  if (v14 < v15 || v12 == 0)
    v15 = v14;
  if (v11)
    v18 = v15;
  else
    v18 = v16;

  return v18;
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBloodPressureSeries.m"), 399, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  objc_msgSend(v8, "startXValue");
  v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBloodPressureSeries.m"), 407, CFSTR("yAxisDistanceFromPoint type class failure"));

  }
  v10 = v9;
  objc_msgSend(v10, "systolicCoordinate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "diastolicCoordinate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "yAxisDifferenceToPoint:", x, y);
  v14 = v13;
  objc_msgSend(v12, "yAxisDifferenceToPoint:", x, y);
  if (v11 && v12)
  {
    if (fabs(v14) >= fabs(v15))
      v16 = v15;
    else
      v16 = v14;
  }
  else
  {
    if (!v12)
      v15 = 1.79769313e308;
    if (v11)
      v16 = v14;
    else
      v16 = v15;
  }

  return v16;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  char v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "systolicCoordinate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diastolicCoordinate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isVisibleInChartRect:", x, y, width, height) & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v10, "isVisibleInChartRect:", x, y, width, height);

  return v11;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  void *v23;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBloodPressureSeries.m"), 445, CFSTR("compare type class failure"));

  }
  v9 = v7;
  objc_msgSend(v9, "systolicCoordinate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "diastolicCoordinate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(v12, "systolicCoordinate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "diastolicCoordinate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "min");
  v16 = v15;
  objc_msgSend(v13, "min");
  if (v16 >= v17)
  {
    objc_msgSend(v11, "min");
    v20 = v19;
    objc_msgSend(v14, "min");
    v18 = v20 < v21;
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  void *v23;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKBloodPressureSeries.m"), 462, CFSTR("compare type class failure"));

  }
  v9 = v7;
  objc_msgSend(v9, "systolicCoordinate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "diastolicCoordinate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(v12, "systolicCoordinate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "diastolicCoordinate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "max");
  v16 = v15;
  objc_msgSend(v13, "max");
  if (v16 <= v17)
  {
    objc_msgSend(v11, "max");
    v20 = v19;
    objc_msgSend(v14, "max");
    v18 = v20 > v21;
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

+ (id)systolicImageCompatibleWithFont:(id)a3 withColor:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  void *v9;
  CGSize v11;

  v5 = a4;
  objc_msgSend(a3, "capHeight");
  v11.height = v6;
  v7 = fmin(v6, 8.0);
  v8 = v6 * 0.5;
  v11.width = v7;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  +[HKBloodPressureSeries _drawSystolicSymbolWithColor:atLocation:width:context:](HKBloodPressureSeries, "_drawSystolicSymbolWithColor:atLocation:width:context:", v5, UIGraphicsGetCurrentContext(), v7 * 0.5, v8, v7);

  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v9;
}

+ (id)diastolicImageCompatibleWithFont:(id)a3 withColor:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  void *v9;
  CGSize v11;

  v5 = a4;
  objc_msgSend(a3, "capHeight");
  v11.height = v6;
  v7 = fmin(v6, 8.0);
  v8 = v6 * 0.5;
  v11.width = v7;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  +[HKBloodPressureSeries _drawDiastolicSymbolWithColor:atLocation:width:context:](HKBloodPressureSeries, "_drawDiastolicSymbolWithColor:atLocation:width:context:", v5, UIGraphicsGetCurrentContext(), v7 * 0.5, v8, v7);

  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v9;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKBloodPressureSeriesPresentationStyle)selectedPresentationStyleStorage
{
  return self->_selectedPresentationStyleStorage;
}

- (void)setSelectedPresentationStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPresentationStyleStorage, a3);
}

- (HKBloodPressureSeriesPresentationStyle)unselectedPresentationStyleStorage
{
  return self->_unselectedPresentationStyleStorage;
}

- (void)setUnselectedPresentationStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedPresentationStyleStorage, a3);
}

- (HKBloodPressureSeriesPresentationStyle)inactivePresentationStyleStorage
{
  return self->_inactivePresentationStyleStorage;
}

- (void)setInactivePresentationStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_inactivePresentationStyleStorage, a3);
}

- (HKBloodPressureSeriesHighlightDelegate)seriesHighlightDelegateStorage
{
  return (HKBloodPressureSeriesHighlightDelegate *)objc_loadWeakRetained((id *)&self->_seriesHighlightDelegateStorage);
}

- (void)setSeriesHighlightDelegateStorage:(id)a3
{
  objc_storeWeak((id *)&self->_seriesHighlightDelegateStorage, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_seriesHighlightDelegateStorage);
  objc_storeStrong((id *)&self->_inactivePresentationStyleStorage, 0);
  objc_storeStrong((id *)&self->_unselectedPresentationStyleStorage, 0);
  objc_storeStrong((id *)&self->_selectedPresentationStyleStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
