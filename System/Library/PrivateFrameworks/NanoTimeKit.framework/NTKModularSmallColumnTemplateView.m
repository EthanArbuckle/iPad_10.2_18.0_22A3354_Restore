@implementation NTKModularSmallColumnTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

- (NTKModularSmallColumnTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularSmallColumnTemplateView *v3;
  NTKModularSmallColumnTemplateView *v4;
  uint64_t v5;
  CLKUIColoringLabel *row1Column1Label;
  uint64_t v7;
  CLKUIColoringLabel *row2Column1Label;
  uint64_t v9;
  CLKUIColoringLabel *row1Column2Label;
  uint64_t v11;
  CLKUIColoringLabel *row2Column2Label;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKModularSmallColumnTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[NTKModularSmallColumnTemplateView _newLabelSubview](v3, "_newLabelSubview");
    row1Column1Label = v4->_row1Column1Label;
    v4->_row1Column1Label = (CLKUIColoringLabel *)v5;

    v7 = -[NTKModularSmallColumnTemplateView _newLabelSubview](v4, "_newLabelSubview");
    row2Column1Label = v4->_row2Column1Label;
    v4->_row2Column1Label = (CLKUIColoringLabel *)v7;

    v9 = -[NTKModularSmallColumnTemplateView _newLabelSubview](v4, "_newLabelSubview");
    row1Column2Label = v4->_row1Column2Label;
    v4->_row1Column2Label = (CLKUIColoringLabel *)v9;

    v11 = -[NTKModularSmallColumnTemplateView _newLabelSubview](v4, "_newLabelSubview");
    row2Column2Label = v4->_row2Column2Label;
    v4->_row2Column2Label = (CLKUIColoringLabel *)v11;

  }
  return v4;
}

- (id)_newLabelSubview
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = objc_alloc_init((Class)off_1E6BCA6E0);
  -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInTimeTravel:", v4 != 0);

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NTKModularSmallColumnTemplateView__newLabelSubview__block_invoke;
  v10[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setNowProvider:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __53__NTKModularSmallColumnTemplateView__newLabelSubview__block_invoke_2;
  v8[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setNeedsResizeHandler:", v8);
  -[NTKModuleView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v3);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v3;
}

id __53__NTKModularSmallColumnTemplateView__newLabelSubview__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeTravelDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __53__NTKModularSmallColumnTemplateView__newLabelSubview__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (id)_headerFontOfSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", a3, *MEMORY[0x1E0DC1438]);
}

- (id)_bodyFontOfSize:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", a3);
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  int v5;
  int *v6;
  int *v7;
  id v8;

  v4 = (void (**)(id, _QWORD))a3;
  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "highlightColumn2");
  v6 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row1Column1Label;
  if (v5)
  {
    v6 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row1Column2Label;
    v7 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row2Column2Label;
  }
  else
  {
    v7 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row2Column1Label;
  }
  v4[2](v4, *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v6));
  v4[2](v4, *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v7));

}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  int v5;
  int *v6;
  int *v7;
  id v8;

  v4 = (void (**)(id, _QWORD))a3;
  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "highlightColumn2");
  v6 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row1Column2Label;
  if (v5)
  {
    v6 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row1Column1Label;
    v7 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row2Column1Label;
  }
  else
  {
    v7 = &OBJC_IVAR___NTKModularSmallColumnTemplateView__row2Column2Label;
  }
  v4[2](v4, *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v6));
  v4[2](v4, *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + *v7));

}

- (void)_layoutContentView
{
  void *v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  double v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  double (**v46)(void *, CGFloat *, CGFloat *);
  void *v47;
  double (**v48)(_QWORD, _QWORD, _QWORD);
  double v49;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double MinY;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  CGFloat v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double rect;
  CGFloat recta;
  _QWORD v98[5];
  id v99;
  double v100;
  _QWORD aBlock[5];
  id v102;
  double v103;
  double v104;
  CGFloat v105;
  double v106;
  CGFloat Width;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v108 = 0u;
  -[NTKModuleView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKComplicationModuleView isXL](self, "isXL");
  v5 = v3;
  v6 = v5;
  if (!v4)
  {
    _LayoutConstantsModularSmall_2(v5, &v108);
    goto LABEL_9;
  }
  v7 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_4);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_4);
  if (!WeakRetained)
    goto LABEL_7;
  v9 = WeakRetained;
  v10 = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_4);
  if (v10 != v7)
  {

LABEL_7:
    v13 = objc_storeWeak(&_LayoutConstantsExtraLarge___cachedDevice_4, v7);
    _LayoutConstantsExtraLarge___previousCLKDeviceVersion_4 = objc_msgSend(v7, "version");

    ___LayoutConstantsExtraLarge_block_invoke_5(v14, v7);
    goto LABEL_8;
  }
  v11 = objc_msgSend(v7, "version");
  v12 = _LayoutConstantsExtraLarge___previousCLKDeviceVersion_4;

  if (v11 != v12)
    goto LABEL_7;
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_4);
  v110 = xmmword_1EF175A30;
  v111 = xmmword_1EF175A40;
  v112 = xmmword_1EF175A50;
  v108 = _LayoutConstantsExtraLarge_constants_0;
  v109 = unk_1EF175A20;

LABEL_9:
  v15 = *((double *)&v110 + 1);
  v16 = *(double *)&v111;
  v18 = *((double *)&v109 + 1);
  v17 = *(double *)&v110;
  v19 = *((double *)&v111 + 1);
  rect = *((double *)&v112 + 1);
  v20 = *(double *)&v112;
  v21 = *((double *)&v111 + 1) + *(double *)&v110 * -2.0 - *((double *)&v110 + 1);
  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "column2Alignment");

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "highlightColumn2");

  v106 = 0.0;
  Width = 0.0;
  v104 = 0.0;
  v105 = 0.0;
  v94 = v17;
  v95 = v15;
  v92 = v18;
  v93 = v19;
  if (self->_calculatedFontSize)
  {
    -[CLKUIColoringLabel sizeToFit](self->_row1Column1Label, "sizeToFit");
    -[CLKUIColoringLabel bounds](self->_row1Column1Label, "bounds");
    Width = CGRectGetWidth(v113);
    -[CLKUIColoringLabel sizeToFit](self->_row2Column1Label, "sizeToFit");
    -[CLKUIColoringLabel bounds](self->_row2Column1Label, "bounds");
    v105 = CGRectGetWidth(v114);
    -[CLKUIColoringLabel sizeToFit](self->_row1Column2Label, "sizeToFit");
    -[CLKUIColoringLabel bounds](self->_row1Column2Label, "bounds");
    v106 = CGRectGetWidth(v115);
    -[CLKUIColoringLabel sizeToFit](self->_row2Column2Label, "sizeToFit");
    -[CLKUIColoringLabel bounds](self->_row2Column2Label, "bounds");
    v104 = CGRectGetWidth(v116);
    -[NTKModuleView device](self, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CLKCeilForDevice();
    v28 = v27;

    -[NTKModuleView device](self, "device");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CLKCeilForDevice();
    v31 = v30;

    v32 = rect;
  }
  else
  {
    v34 = *((double *)&v108 + 1);
    v33 = *(double *)&v108;
    v88 = v23;
    v86 = v20;
    if (*(double *)&v108 >= *((double *)&v108 + 1))
    {
      v36 = 0;
      v35 = 0;
      v37 = *(double *)&v109;
      v38 = MEMORY[0x1E0C809B0];
      do
      {
        -[NTKModularSmallColumnTemplateView _headerFontOfSize:](self, "_headerFontOfSize:", v33, *(_QWORD *)&v86, v88);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKModularSmallColumnTemplateView _bodyFontOfSize:](self, "_bodyFontOfSize:", v33);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v40;
        if (v25)
          v42 = (void *)v40;
        else
          v42 = v39;
        if (v25)
          v43 = v39;
        else
          v43 = (void *)v40;
        v44 = v42;

        v45 = v43;
        aBlock[0] = v38;
        aBlock[1] = 3221225472;
        aBlock[2] = __55__NTKModularSmallColumnTemplateView__layoutContentView__block_invoke;
        aBlock[3] = &unk_1E6BD8618;
        v103 = v21;
        aBlock[4] = self;
        v36 = v44;
        v102 = v36;
        v46 = (double (**)(void *, CGFloat *, CGFloat *))_Block_copy(aBlock);
        v98[0] = v38;
        v98[1] = 3221225472;
        v98[2] = __55__NTKModularSmallColumnTemplateView__layoutContentView__block_invoke_2;
        v98[3] = &unk_1E6BD8618;
        v100 = v21;
        v98[4] = self;
        v35 = v45;
        v99 = v35;
        v47 = _Block_copy(v98);
        v48 = (double (**)(_QWORD, _QWORD, _QWORD))v47;
        if (v25)
        {
          v31 = (*((double (**)(void *, double *, double *, double))v47 + 2))(v47, &v106, &v104, 0.0);
          v28 = v46[2](v46, &Width, &v105);
        }
        else
        {
          v28 = ((double (*)(double (**)(void *, CGFloat *, CGFloat *), CGFloat *, CGFloat *, double))v46[2])(v46, &Width, &v105, 0.0);
          v31 = ((double (**)(_QWORD, double *, double *))v48)[2](v48, &v106, &v104);
        }

        v49 = 0.0;
        if (v31 + v28 > v21)
          v49 = v37;
        v33 = v33 - v49;
      }
      while (v31 + v28 > v21 && v33 >= v34);
    }
    else
    {
      v35 = 0;
      v36 = 0;
      v31 = 0.0;
      v28 = 0.0;
    }
    -[CLKUIColoringLabel setFont:](self->_row1Column1Label, "setFont:", v36, *(_QWORD *)&v86, v88);
    -[CLKUIColoringLabel sizeToFit](self->_row1Column1Label, "sizeToFit");
    -[CLKUIColoringLabel setFont:](self->_row1Column2Label, "setFont:", v35);
    -[CLKUIColoringLabel sizeToFit](self->_row1Column2Label, "sizeToFit");
    -[CLKUIColoringLabel setFont:](self->_row2Column1Label, "setFont:", v36);
    -[CLKUIColoringLabel sizeToFit](self->_row2Column1Label, "sizeToFit");
    -[CLKUIColoringLabel setFont:](self->_row2Column2Label, "setFont:", v35);
    -[CLKUIColoringLabel sizeToFit](self->_row2Column2Label, "sizeToFit");
    self->_calculatedFontSize = 1;

    v32 = rect;
    v23 = v89;
    v20 = v87;
  }
  if (v31 + v28 > v21)
  {
    if (v25)
    {
      if (v31 > v16)
        v31 = v16;
      v28 = v21 - v31;
    }
    else
    {
      if (v28 > v16)
        v28 = v16;
      v31 = v21 - v28;
    }
  }
  -[CLKUIColoringLabel frame](self->_row1Column1Label, "frame");
  v52 = v51;
  v54 = v53;
  recta = v53;
  -[CLKUIColoringLabel _lastLineBaseline](self->_row1Column1Label, "_lastLineBaseline");
  v56 = v20 - v55;
  v91 = v20 - v55;
  -[CLKUIColoringLabel setFrame:](self->_row1Column1Label, "setFrame:", v52, v20 - v55, v28, v54);
  -[CLKUIColoringLabel frame](self->_row2Column1Label, "frame");
  v58 = v57;
  v60 = v59;
  v90 = v59;
  -[CLKUIColoringLabel _lastLineBaseline](self->_row2Column1Label, "_lastLineBaseline");
  v62 = v20 + v32 - v61;
  -[CLKUIColoringLabel setFrame:](self->_row2Column1Label, "setFrame:", v58, v62, v28, v60);
  -[CLKUIColoringLabel frame](self->_row1Column2Label, "frame");
  v64 = v63;
  v66 = v65;
  v117.origin.x = v52;
  v117.origin.y = v56;
  v117.size.width = v28;
  v117.size.height = recta;
  MinY = CGRectGetMinY(v117);
  if (v106 <= v31)
    v68 = v106;
  else
    v68 = v31;
  -[CLKUIColoringLabel setFrame:](self->_row1Column2Label, "setFrame:", v64, MinY, v68, v66);
  -[CLKUIColoringLabel frame](self->_row2Column2Label, "frame");
  v70 = v69;
  v72 = v71;
  v118.origin.x = v58;
  v118.origin.y = v62;
  v118.size.width = v28;
  v118.size.height = v90;
  v73 = CGRectGetMinY(v118);
  if (v104 <= v31)
    v74 = v104;
  else
    v74 = v31;
  -[CLKUIColoringLabel setFrame:](self->_row2Column2Label, "setFrame:", v70, v73, v74, v72);
  -[NTKModuleView device](self, "device");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRoundForDevice();
  v77 = v76;

  if (v77 <= v92)
    v78 = v77;
  else
    v78 = v92;
  if (v78 >= v94)
    v79 = v78;
  else
    v79 = v94;
  v119.origin.y = v91;
  v119.origin.x = v52;
  v119.size.width = v28;
  v119.size.height = recta;
  v80 = v95 + CGRectGetMaxX(v119);
  if (v80 < v93 - v92 - v31)
    v80 = v93 - v92 - v31;
  if (v80 <= v93 - v94 - v31)
    v81 = v80;
  else
    v81 = v93 - v94 - v31;
  v82 = v31 - v68;
  if (v23 == 1)
  {
    v83 = v31 - v74;
  }
  else
  {
    v82 = 0.0;
    v83 = 0.0;
  }
  -[NTKModuleView viewsAndSpacingArrayForSpace:view:space:view:](self, "viewsAndSpacingArrayForSpace:view:space:view:", self->_row1Column1Label, self->_row1Column2Label, v79, v82 + v81);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:](self, "naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:", v84, 1);
  -[NTKModuleView viewsAndSpacingArrayForSpace:view:space:view:](self, "viewsAndSpacingArrayForSpace:view:space:view:", self->_row2Column1Label, self->_row2Column2Label, v79, v83 + v81);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:](self, "naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:", v85, 1);

}

void __55__NTKModularSmallColumnTemplateView__layoutContentView__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3, double a4)
{
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v7 = *(double *)(a1 + 48) - a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "widthForMaxWidth:withFont:", *(_QWORD *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  *a2 = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "widthForMaxWidth:withFont:", *(_QWORD *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  *a3 = v11;

}

void __55__NTKModularSmallColumnTemplateView__layoutContentView__block_invoke_2(uint64_t a1, _QWORD *a2, _QWORD *a3, double a4)
{
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v7 = *(double *)(a1 + 48) - a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "widthForMaxWidth:withFont:", *(_QWORD *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  *a2 = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "widthForMaxWidth:withFont:", *(_QWORD *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  *a3 = v11;

}

- (void)_update
{
  CLKUIColoringLabel *row1Column1Label;
  void *v4;
  CLKUIColoringLabel *row1Column2Label;
  void *v6;
  CLKUIColoringLabel *row2Column1Label;
  void *v8;
  CLKUIColoringLabel *row2Column2Label;
  void *v10;
  void *v11;
  id v12;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  self->_calculatedFontSize = 0;
  -[NTKModuleView _updateColors](self, "_updateColors");
  row1Column1Label = self->_row1Column1Label;
  objc_msgSend(v12, "row1Column1TextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row1Column1Label, "setTextProvider:", v4);

  row1Column2Label = self->_row1Column2Label;
  objc_msgSend(v12, "row1Column2TextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row1Column2Label, "setTextProvider:", v6);

  row2Column1Label = self->_row2Column1Label;
  objc_msgSend(v12, "row2Column1TextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row2Column1Label, "setTextProvider:", v8);

  row2Column2Label = self->_row2Column2Label;
  objc_msgSend(v12, "row2Column2TextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row2Column2Label, "setTextProvider:", v10);

  -[NTKModuleView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayout");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row2Column2Label, 0);
  objc_storeStrong((id *)&self->_row2Column1Label, 0);
  objc_storeStrong((id *)&self->_row1Column2Label, 0);
  objc_storeStrong((id *)&self->_row1Column1Label, 0);
}

@end
