@implementation NTKModularLargeColumnTemplateView

- (void)_positionLeadingAlignedImageView:(id)a3 label:(id)a4 withBaselineOffset:(double)a5
{
  id v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  double v29;
  __int128 v30;

  v27 = a3;
  v8 = a4;
  if (v27)
  {
    objc_msgSend(v27, "frame");
    if (v9 > 0.0)
    {
      objc_msgSend(v8, "font");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "capHeight");
      -[NTKModuleView device](self, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CLKRoundForDevice();
      v13 = a5 - v12;

      objc_msgSend(v27, "setCenter:", 0.0, v13);
    }
  }
  objc_msgSend(v8, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v8, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ascender");
  v22 = a5 - v21;

  objc_msgSend(v8, "setFrame:", v15, v22, v17, v19);
  -[NTKModuleView device](self, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v23, &v30);
  v24 = *((double *)&v30 + 1);
  -[NTKModuleView device](self, "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v25, &v28);
  -[NTKModuleView viewsAndSpacingArrayForSpace:view:space:view:](self, "viewsAndSpacingArrayForSpace:view:space:view:", v27, v8, v24, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKModuleView naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:](self, "naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:", v26, 0);
}

- (void)_layoutRowsOfColumnsWithAlignment:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  _QWORD v20[13];
  __int128 v21;
  double v22;
  __int128 v23;
  double v24;
  _QWORD v25[10];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  -[NTKModuleView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v5, &v41);
  v6 = v42;

  -[NTKModuleView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v7, &v40);
  v8 = *((double *)&v40 + 1);

  -[NTKModuleView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v9, &v38);
  v10 = v39;

  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x2020000000;
  v29 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__NTKModularLargeColumnTemplateView__layoutRowsOfColumnsWithAlignment___block_invoke;
  v25[3] = &unk_1E6BD84B8;
  v25[8] = v10;
  v25[9] = v6;
  v25[4] = self;
  v25[5] = &v34;
  v25[6] = &v30;
  v25[7] = &v26;
  -[NTKModularLargeColumnTemplateView _enumerateColumnRowsWithBlock:](self, "_enumerateColumnRowsWithBlock:", v25);
  -[NTKModuleView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  -[NTKModuleView device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v15, &v23);
  v16 = v24;

  v17 = 0.0;
  if (!self->_useNoColumnPadding)
  {
    -[NTKModuleView device](self, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_38(v18, &v21);
    v17 = v22;

  }
  v19 = v35[3];
  if (v16 + v17 + v8 + v19 + v27[3] > v14)
    v19 = v31[3];
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __71__NTKModularLargeColumnTemplateView__layoutRowsOfColumnsWithAlignment___block_invoke_2;
  v20[3] = &unk_1E6BD84E0;
  v20[5] = v10;
  *(double *)&v20[6] = v19;
  v20[4] = self;
  *(double *)&v20[7] = v14 - v8 - v19 - v17 - v16;
  v20[8] = a3;
  *(double *)&v20[9] = v8;
  *(double *)&v20[10] = v17;
  *(double *)&v20[11] = v14;
  *(double *)&v20[12] = v16;
  -[NTKModularLargeColumnTemplateView _enumerateColumnRowsWithBlock:](self, "_enumerateColumnRowsWithBlock:", v20);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

void __71__NTKModularLargeColumnTemplateView__layoutRowsOfColumnsWithAlignment___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  id v28;

  v28 = a2;
  v7 = a3;
  v8 = a4;
  v9 = 0.0;
  if (v28)
  {
    objc_msgSend(v28, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    if (v10 > 0.0)
      v9 = v10 + *(double *)(a1 + 64);
  }
  objc_msgSend(v7, "widthForMaxWidth:", *(double *)(a1 + 72) - v9);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  v13 = v12;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(double *)(v14 + 24);
  v16 = *(double *)(a1 + 72);
  if (v13 <= v16)
    v16 = v13;
  if (v15 < v16)
    v15 = v16;
  *(double *)(v14 + 24) = v15;
  objc_msgSend(v7, "minimumWidth");
  objc_msgSend(*(id *)(a1 + 32), "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  v19 = v18;

  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(double *)(v20 + 24);
  v22 = *(double *)(a1 + 72);
  if (v19 <= v22)
    v22 = v19;
  if (v21 < v22)
    v21 = v22;
  *(double *)(v20 + 24) = v21;
  objc_msgSend(v8, "minimumWidth");
  objc_msgSend(*(id *)(a1 + 32), "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  v25 = v24;

  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v27 = *(double *)(v26 + 24);
  if (v27 < v25)
    v27 = v25;
  *(double *)(v26 + 24) = v27;

}

void __71__NTKModularLargeColumnTemplateView__layoutRowsOfColumnsWithAlignment___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9;
  id v10;
  double v11;
  double v12;
  double x;
  double height;
  double Width;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a2;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v23, "sizeToFit");
  v11 = 0.0;
  if (v23)
  {
    objc_msgSend(v23, "frame");
    if (v12 > 0.0)
      v11 = v12 + *(double *)(a1 + 40);
  }
  objc_msgSend(v10, "setMaxWidth:", *(double *)(a1 + 48) - v11);
  objc_msgSend(v10, "sizeToFit");
  objc_msgSend(v10, "frame");
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "_positionLeadingAlignedImageView:label:withBaselineOffset:", v23, v10, a5);

  objc_msgSend(v9, "setMaxWidth:", *(double *)(a1 + 56));
  objc_msgSend(v9, "sizeToFit");
  objc_msgSend(v9, "frame");
  x = v24.origin.x;
  height = v24.size.height;
  Width = CGRectGetWidth(v24);
  if (Width <= *(double *)(a1 + 56))
    v16 = Width;
  else
    v16 = *(double *)(a1 + 56);
  objc_msgSend(v9, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ascender");
  v19 = a5 - v18;

  objc_msgSend(v9, "setFrame:", x, v19, v16, height);
  if (*(_QWORD *)(a1 + 64))
  {
    v20 = *(double *)(a1 + 88) - *(double *)(a1 + 96);
    v25.origin.x = x;
    v25.origin.y = v19;
    v25.size.width = v16;
    v25.size.height = height;
    v21 = v20 - CGRectGetWidth(v25);
  }
  else
  {
    v21 = *(double *)(a1 + 72) + *(double *)(a1 + 48) + *(double *)(a1 + 80);
  }
  objc_msgSend(*(id *)(a1 + 32), "viewsAndSpacingArrayForSpace:view:", v9, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:", v22, 1);

}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)off_1E6BCA6E0);
  objc_msgSend(v5, "setFont:", v4);
  objc_msgSend(v5, "setUppercase:", 0);
  -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInTimeTravel:", v6 != 0);

  objc_msgSend(v5, "setNowProvider:", &__block_literal_global_136);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __62__NTKModularLargeColumnTemplateView__newLabelSubviewWithFont___block_invoke_2;
  v12 = &unk_1E6BCD7F0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setNeedsResizeHandler:", &v9);
  -[NTKModuleView contentView](self, "contentView", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __62__NTKModularLargeColumnTemplateView__newLabelSubviewWithFont___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
}

void __62__NTKModularLargeColumnTemplateView__newLabelSubviewWithFont___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (id)_newHeaderLabelSubview
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v8[6];

  v3 = (void *)MEMORY[0x1E0C944D0];
  -[NTKModuleView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v4, v8);
  objc_msgSend(v3, "systemFontOfSize:weight:", v8[0], *MEMORY[0x1E0DC1438]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NTKModularLargeColumnTemplateView _newLabelSubviewWithFont:](self, "_newLabelSubviewWithFont:", v5);
  return v6;
}

- (id)_newBodyLabelSubview
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v8[6];

  v3 = (void *)MEMORY[0x1E0C944D0];
  -[NTKModuleView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v4, v8);
  objc_msgSend(v3, "systemFontOfSize:", v8[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NTKModularLargeColumnTemplateView _newLabelSubviewWithFont:](self, "_newLabelSubviewWithFont:", v5);
  return v6;
}

- (BOOL)useNoColumnPadding
{
  return self->_useNoColumnPadding;
}

- (void)setUseNoColumnPadding:(BOOL)a3
{
  self->_useNoColumnPadding = a3;
}

@end
