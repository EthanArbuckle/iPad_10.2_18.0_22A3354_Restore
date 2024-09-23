@implementation PKSqueezePaletteView

- (id)initWithBackgroundView:(void *)a3 radius:(double)a4 contentHeight:(double)a5 layoutFactory:(double)a6 azimuth:
{
  id v12;
  id v13;
  id *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  PKPalettePassthroughView *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  _QWORD v85[4];
  id *v86;
  objc_super v87;
  _QWORD v88[14];

  v88[12] = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  if (a1)
  {
    v87.receiver = a1;
    v87.super_class = (Class)PKSqueezePaletteView;
    v14 = (id *)objc_msgSendSuper2(&v87, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    a1 = v14;
    if (v14)
    {
      v83 = v13;
      objc_storeStrong(v14 + 68, a2);
      *((double *)a1 + 63) = a4;
      *((double *)a1 + 64) = a5;
      a1[65] = 0;
      a1[66] = 0;
      objc_storeStrong(a1 + 71, a3);
      v15 = a1[72];
      a1[72] = 0;

      *((double *)a1 + 67) = a6;
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = a1[53];
      a1[53] = (id)v16;

      objc_msgSend(a1[53], "setLineWidth:", *((double *)a1 + 64));
      v84 = v12;
      v18 = *MEMORY[0x1E0CD3010];
      objc_msgSend(a1[53], "setLineCap:", *MEMORY[0x1E0CD3010]);
      objc_msgSend(a1[53], "setStrokeStart:", 0.0);
      objc_msgSend(a1[53], "setStrokeEnd:", 1.0);
      objc_msgSend(a1[53], "setFillColor:", 0);
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = a1[54];
      a1[54] = (id)v19;

      objc_msgSend(a1[54], "setLineWidth:", *((double *)a1 + 64));
      objc_msgSend(a1[54], "setLineCap:", v18);
      objc_msgSend(a1[54], "setStrokeStart:", 0.0);
      objc_msgSend(a1[54], "setStrokeEnd:", 1.0);
      objc_msgSend(a1[54], "setFillColor:", 0);
      objc_msgSend(a1, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSublayer:", a1[53]);

      objc_msgSend(a1, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSublayer:", a1[54]);

      objc_msgSend(a1[68], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(a1, "addSubview:", a1[68]);
      v23 = objc_alloc_init(PKPalettePassthroughView);
      v24 = a1[69];
      a1[69] = v23;

      objc_msgSend(a1[69], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(a1[69], "setAccessibilityIdentifier:", CFSTR("MiniPalette-ToolPickerView"));
      objc_msgSend(a1, "addSubview:", a1[69]);
      v25 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v26 = a1[70];
      a1[70] = v25;

      objc_msgSend(a1[70], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(a1[70], "setAccessibilityIdentifier:", CFSTR("MiniPalette-ContentView"));
      objc_msgSend(a1, "addSubview:", a1[70]);
      v27 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      v28 = a1[55];
      a1[55] = v27;

      objc_msgSend(a1[55], "setLineWidth:", *((double *)a1 + 64));
      objc_msgSend(a1[55], "setLineCap:", v18);
      objc_msgSend(a1[55], "setStrokeStart:", 0.0);
      objc_msgSend(a1[55], "setStrokeEnd:", 1.0);
      objc_msgSend(a1[55], "setFillColor:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(a1[55], "setStrokeColor:", objc_msgSend(v29, "CGColor"));

      v30 = a1[55];
      objc_msgSend(a1[68], "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setMask:", v30);

      v32 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      v33 = a1[56];
      a1[56] = v32;

      objc_msgSend(a1[56], "setLineWidth:", *((double *)a1 + 64));
      objc_msgSend(a1[56], "setLineCap:", v18);
      objc_msgSend(a1[56], "setStrokeStart:", 0.0);
      objc_msgSend(a1[56], "setStrokeEnd:", 1.0);
      objc_msgSend(a1[56], "setFillColor:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(a1[56], "setStrokeColor:", objc_msgSend(v34, "CGColor"));

      v35 = a1[56];
      objc_msgSend(a1[70], "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setMask:", v35);

      v37 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      v38 = a1[57];
      a1[57] = v37;

      objc_msgSend(a1[57], "setLineWidth:", *(double *)&PKSqueezePaletteViewToolsContentClippingShapeMaskExtraLineWidth + *((double *)a1 + 64) + 16.0);
      objc_msgSend(a1[57], "setLineCap:", v18);
      objc_msgSend(a1[57], "setStrokeStart:", 0.0);
      objc_msgSend(a1[57], "setStrokeEnd:", 1.0);
      objc_msgSend(a1[57], "setFillColor:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(a1[57], "setStrokeColor:", objc_msgSend(v39, "CGColor"));

      v40 = a1[57];
      objc_msgSend(a1[69], "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setMask:", v40);

      objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __90__PKSqueezePaletteView_initWithBackgroundView_radius_contentHeight_layoutFactory_azimuth___block_invoke;
      v85[3] = &unk_1E777A858;
      a1 = a1;
      v86 = a1;
      v43 = (id)objc_msgSend(a1, "registerForTraitChanges:withHandler:", v42, v85);

      v68 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(a1[68], "topAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "topAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "constraintEqualToAnchor:", v81);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = v80;
      objc_msgSend(a1[68], "leadingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "leadingAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintEqualToAnchor:", v78);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v88[1] = v77;
      objc_msgSend(a1[68], "trailingAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "trailingAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v75);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v88[2] = v74;
      objc_msgSend(a1[68], "bottomAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "bottomAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:", v72);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v88[3] = v71;
      objc_msgSend(a1[69], "topAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "topAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v69);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v88[4] = v67;
      objc_msgSend(a1[69], "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "leadingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v65);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v88[5] = v64;
      objc_msgSend(a1[69], "trailingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "trailingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:", v62);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v88[6] = v61;
      objc_msgSend(a1[69], "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "bottomAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v59);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v88[7] = v58;
      objc_msgSend(a1[70], "topAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "topAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v88[8] = v55;
      objc_msgSend(a1[70], "leadingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v88[9] = v45;
      objc_msgSend(a1[70], "trailingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v88[10] = v48;
      objc_msgSend(a1[70], "bottomAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "bottomAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v88[11] = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 12);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "activateConstraints:", v52);

      v12 = v84;
      v13 = v83;

      -[PKSqueezePaletteView _updateShadows]((uint64_t)a1);
      objc_msgSend(a1, "setAccessibilityIdentifier:", CFSTR("Circular-MiniPalette"));

    }
  }

  return a1;
}

uint64_t __90__PKSqueezePaletteView_initWithBackgroundView_radius_contentHeight_layoutFactory_azimuth___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "System trait color appearance did change", v4, 2u);
  }

  return -[PKSqueezePaletteView _updateShadows](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_updateShadows
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  if (result)
  {
    v1 = result;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    PKSqueezePaletteViewConfigureShadow(*(void **)(v1 + 424), 1);
    PKSqueezePaletteViewConfigureShadow(*(void **)(v1 + 432), 0);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(v1 + 488), *(double *)(v1 + 472), *(double *)(v1 + 480), *(double *)(v1 + 504), -3.14159265, 9.42477796);
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(v1 + 424), "setPath:", objc_msgSend(v2, "CGPath"));

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(v1 + 424), "setStrokeColor:", objc_msgSend(v3, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(v1 + 432), "setStrokeColor:", objc_msgSend(v4, "CGColor"));

    return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  return result;
}

- (void)dealloc
{
  CGPath *baseShapeLayerPathForHitTesting;
  objc_super v4;

  baseShapeLayerPathForHitTesting = self->_baseShapeLayerPathForHitTesting;
  if (baseShapeLayerPathForHitTesting)
  {
    CGPathRelease(baseShapeLayerPathForHitTesting);
    self->_baseShapeLayerPathForHitTesting = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKSqueezePaletteView;
  -[PKSqueezePaletteView dealloc](&v4, sel_dealloc);
}

- (uint64_t)setColorUserInterfaceStyle:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 592) != a2)
    {
      *(_QWORD *)(result + 592) = a2;
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend(*(id *)(v2 + 576), "colorUserInterfaceStyleDidChange");
    }
  }
  return result;
}

- (void)setDelegate:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  id obj;

  v3 = a2;
  if (a1)
  {
    obj = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));

    v3 = obj;
    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 496), obj);
      objc_msgSend(*(id *)(a1 + 576), "updateUI");
      v3 = obj;
    }
  }

}

- (void)setCurrentLayout:(uint64_t)a1
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (a1 && *(id *)(a1 + 576) != v4)
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 576);
      v9 = 138478083;
      v10 = v5;
      v11 = 2113;
      v12 = v7;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Update layout to: %{private}@, from: %{private}@", (uint8_t *)&v9, 0x16u);
    }

    v8 = *(void **)(a1 + 576);
    if (v8)
      objc_msgSend(v8, "willTransitionToLayout:", v5);
    objc_storeStrong((id *)(a1 + 576), a2);
    objc_msgSend(*(id *)(a1 + 576), "setPaletteView:", a1);
    objc_msgSend(*(id *)(a1 + 576), "setupUI");
  }

}

- (uint64_t)updateUIStartAngle:(int)a3 endAngle:(double)a4 clockwise:(double)a5 animated:
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    *(double *)(result + 520) = a4;
    *(double *)(result + 528) = a5;
    *(_BYTE *)(result + 488) = a2;
    -[PKSqueezePaletteView _updateBaseShapeLayerPathAnimated:](result, a3);
    return objc_msgSend(*(id *)(v5 + 576), "updateUI");
  }
  return result;
}

- (void)_updateBaseShapeLayerPathAnimated:(uint64_t)a1
{
  id v3;
  const CGPath *v4;
  id v5;
  const CGPath *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id *v14;
  void *v15;
  _QWORD *v16;
  _QWORD v18[4];
  id v19;
  id location;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 488), *(double *)(a1 + 472), *(double *)(a1 + 480), *(double *)(a1 + 504), -3.14159265, 9.42477796);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(a1 + 440), "setPath:", objc_msgSend(v3, "CGPath"));

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v4 = *(const CGPath **)(a1 + 464);
    if (v4)
    {
      CGPathRelease(v4);
      *(_QWORD *)(a1 + 464) = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 488), *(double *)(a1 + 472), *(double *)(a1 + 480), *(double *)(a1 + 504), *(double *)(a1 + 520), *(double *)(a1 + 528));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const CGPath *)objc_msgSend(v5, "CGPath");
    objc_msgSend(*(id *)(a1 + 440), "lineWidth");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 440), "miterLimit");
    *(_QWORD *)(a1 + 464) = CGPathCreateCopyByStrokingPath(v6, 0, v8, kCGLineCapRound, kCGLineJoinMiter, v9);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 488), *(double *)(a1 + 472), *(double *)(a1 + 480), *(double *)(a1 + 504), -3.14159265, 9.42477796);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(a1 + 448), "setPath:", objc_msgSend(v10, "CGPath"));

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 488), *(double *)(a1 + 472), *(double *)(a1 + 480), *(double *)(a1 + 504) + (*(double *)&PKSqueezePaletteViewToolsContentClippingShapeMaskExtraLineWidth + 16.0) * 0.5, -3.14159265, 9.42477796);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(a1 + 456), "setPath:", objc_msgSend(v11, "CGPath"));

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    -[PKSqueezePaletteView _updateShadows](a1);
    v12 = (*(double *)(a1 + 520) + 3.14159265) / 12.5663706;
    v13 = (*(double *)(a1 + 528) + 3.14159265) / 12.5663706;
    if (!*(_QWORD *)(a1 + 416))
    {
      v14 = -[PKSqueezePaletteViewResizeHandle initWithStrokeStartPresentationValue:strokeEndPresentationValue:]([PKSqueezePaletteViewResizeHandle alloc], v12, v13);
      v15 = *(void **)(a1 + 416);
      *(_QWORD *)(a1 + 416) = v14;

      -[PKSqueezePaletteView _handleResizing](a1);
    }
    objc_initWeak(&location, (id)a1);
    v16 = *(_QWORD **)(a1 + 416);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__PKSqueezePaletteView__updateBaseShapeLayerPathAnimated___block_invoke;
    v18[3] = &unk_1E7777588;
    objc_copyWeak(&v19, &location);
    -[PKSqueezePaletteViewResizeHandle resizeToStrokeStart:strokeEnd:animated:resizeHandler:completion:](v16, a2, v18, 0, v12, v13);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

- (void)pencilInteractionDidTap:(uint64_t)a1
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        v6 = *(_QWORD *)(a1 + 576);
        v7 = 138477827;
        v8 = v6;
        _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Forward Pencil tap interaction to layout: %{private}@", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 576), "handlePencilInteractionDidTap:", a2);
    }
    else
    {
      if (v5)
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Ignore Pencil tap interaction.", (uint8_t *)&v7, 2u);
      }

    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  UIView *v11;
  CGAffineTransform v13;
  objc_super v14;
  CGPoint v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKSqueezePaletteView convertPoint:toView:](self, "convertPoint:toView:", self->_toolsContentView, x, y);
  -[UIView hitTest:withEvent:](self->_toolsContentView, "hitTest:withEvent:", v7);
  v8 = (UIView *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (v14.receiver = self,
        v14.super_class = (Class)PKSqueezePaletteView,
        -[PKSqueezePaletteView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y),
        (v8 = (UIView *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (v8 == self->_toolsContentView || !-[UIView isDescendantOfView:](v8, "isDescendantOfView:"))
    {
      -[PKSqueezePaletteView transform](self, "transform", 0, 0, 0, 0, 0, 0);
      v15.x = x;
      v15.y = y;
      if (CGPathContainsPoint(self->_baseShapeLayerPathForHitTesting, &v13, v15, 0))
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      v8 = v10;
    }
  }
  v11 = v8;

  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  void (**layoutSubviewsHandler)(void);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSqueezePaletteView;
  -[PKSqueezePaletteView layoutSubviews](&v8, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PKSqueezePaletteView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_baseShapeLayer, "setFrame:");
  -[PKSqueezePaletteView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_contentClippingShapeMask, "setFrame:");
  -[PKSqueezePaletteView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_toolsContentClippingShapeMask, "setFrame:");
  -[PKSqueezePaletteView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_largeShadow, "setFrame:");
  -[PKSqueezePaletteView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_smallShadow, "setFrame:");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  -[PKSqueezePaletteView bounds](self, "bounds");
  v5 = v4 * 0.5;
  if (self->_viewCenter.x != v3 * 0.5 || self->_viewCenter.y != v5)
  {
    self->_viewCenter.x = v3 * 0.5;
    self->_viewCenter.y = v5;
    -[PKSqueezePaletteView _updateBaseShapeLayerPathAnimated:]((uint64_t)self, 0);
  }
  layoutSubviewsHandler = (void (**)(void))self->_layoutSubviewsHandler;
  if (layoutSubviewsHandler)
    layoutSubviewsHandler[2]();
}

- (uint64_t)_handleResizing
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 416);
    v3 = 0.0;
    if (v2)
    {
      objc_msgSend(*(id *)(v2 + 8), "presentationValue");
      v5 = v4;
      v6 = *(_QWORD *)(v1 + 416);
      if (v6)
      {
        objc_msgSend(*(id *)(v6 + 16), "presentationValue");
        v3 = v7;
      }
    }
    else
    {
      v5 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(*(id *)(v1 + 440), "setStrokeStart:", v5);
    objc_msgSend(*(id *)(v1 + 440), "setStrokeEnd:", v3);
    objc_msgSend(*(id *)(v1 + 448), "setStrokeStart:", v5);
    objc_msgSend(*(id *)(v1 + 448), "setStrokeEnd:", v3);
    objc_msgSend(*(id *)(v1 + 456), "setStrokeStart:", v5);
    objc_msgSend(*(id *)(v1 + 456), "setStrokeEnd:", v3);
    objc_msgSend(*(id *)(v1 + 424), "setStrokeStart:", v5);
    objc_msgSend(*(id *)(v1 + 424), "setStrokeEnd:", v3);
    objc_msgSend(*(id *)(v1 + 432), "setStrokeStart:", v5);
    objc_msgSend(*(id *)(v1 + 432), "setStrokeEnd:", v3);
    return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  return result;
}

void __58__PKSqueezePaletteView__updateBaseShapeLayerPathAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKSqueezePaletteView _handleResizing]((uint64_t)WeakRetained);

}

- (uint64_t)_redoCount
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  v4 = objc_loadWeakRetained((id *)(a1 + 496));
  v5 = objc_msgSend(v4, "paletteViewRedoCount:", a1);

  return v5;
}

- (uint64_t)_undoCount
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  v4 = objc_loadWeakRetained((id *)(a1 + 496));
  v5 = objc_msgSend(v4, "paletteViewUndoCount:", a1);

  return v5;
}

- (uint64_t)_canUndo
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  v4 = objc_loadWeakRetained((id *)(a1 + 496));
  v5 = objc_msgSend(v4, "paletteViewCanUndo:", a1);

  return v5;
}

- (uint64_t)_canRedo
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  v4 = objc_loadWeakRetained((id *)(a1 + 496));
  v5 = objc_msgSend(v4, "paletteViewCanRedo:", a1);

  return v5;
}

- (void)_didUndo
{
  id WeakRetained;
  char v3;
  id v4;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      v4 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v4, "paletteViewDidInvokeUndo:", a1);

    }
  }
}

- (void)_didRedo
{
  id WeakRetained;
  char v3;
  id v4;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      v4 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v4, "paletteViewDidInvokeRedo:", a1);

    }
  }
}

- (void)_didTapRuler
{
  id WeakRetained;
  char v3;
  id v4;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      v4 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v4, "paletteViewDidTapRuler:", a1);

    }
  }
}

- (void)_didSelectTool:(uint64_t)a3 atIndex:
{
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    -[PKMathResultAttribution setString:](*(_QWORD *)(a1 + 584), v9);
    PKDisplayColorForTool(v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSqueezePaletteViewContext setSelectedColor:](*(_QWORD *)(a1 + 584), v5);

    objc_msgSend(*(id *)(a1 + 576), "updateUI");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v8, "paletteView:didSelectTool:atIndex:", a1, v9, a3);

    }
  }

}

- (void)_didSelectColor:(uint64_t)a3 isFromExtendedColorPicker:(uint64_t)a4 isContinuousColorSelection:
{
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    -[PKSqueezePaletteViewContext setSelectedColor:](*(_QWORD *)(a1 + 584), v10);
    objc_msgSend(*(id *)(a1 + 576), "updateUI");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v9, "paletteView:didSelectColor:isFromExtendedColorPicker:isContinuousColorSelection:", a1, v10, a3, a4);

    }
  }

}

- (void)_didTapMulticolorButton:(void *)a3 currentSelectedColor:
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v8, "paletteViewDidInvokeExtendedColorPicker:currentSelectedColor:sourceView:", a1, v5, v9);

    }
  }

}

- (void)_didTapTextBoxButton:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v5, "paletteViewDidInvokeAddTextBox:sourceView:", a1, v6);

    }
  }

}

- (void)_didTapSignatureButton:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v5, "paletteViewDidInvokeSignature:sourceView:", a1, v6);

    }
  }

}

- (void)_didTapShapesButton:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v5, "paletteViewDidInvokeAddShape:sourceView:", a1, v6);

    }
  }

}

- (void)_didTapStickersButton:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v5, "paletteViewDidInvokeAddSticker:sourceView:", a1, v6);

    }
  }

}

- (void)_didTapMoreOptionsButton:(uint64_t)a1
{
  id WeakRetained;
  char v4;
  id v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 496));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 496));
      objc_msgSend(v5, "paletteViewDidInvokeMoreOptions:sourceView:", a1, v6);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__extendedColorPickerColorSelectionHandler, 0);
  objc_storeStrong(&self->_layoutSubviewsHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_layoutFactory, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_toolsContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toolsContentClippingShapeMask, 0);
  objc_storeStrong((id *)&self->_contentClippingShapeMask, 0);
  objc_storeStrong((id *)&self->_baseShapeLayer, 0);
  objc_storeStrong((id *)&self->_smallShadow, 0);
  objc_storeStrong((id *)&self->_largeShadow, 0);
  objc_storeStrong((id *)&self->_resizeHandle, 0);
}

@end
