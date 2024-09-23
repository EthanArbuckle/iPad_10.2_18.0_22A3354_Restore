@implementation PKRulerController

void __36__PKRulerController_sharedRulerView__block_invoke()
{
  PKRulerView *v0;
  void *v1;
  void *v2;
  PKRulerLayer *v3;

  v0 = objc_alloc_init(PKRulerView);
  v1 = (void *)qword_1ECEE6250;
  qword_1ECEE6250 = (uint64_t)v0;

  v3 = -[PKRulerLayer initWithRulerController:]([PKRulerLayer alloc], "initWithRulerController:", 0);
  -[PKRulerView setRulerLayer:](qword_1ECEE6250, v3);
  objc_msgSend((id)qword_1ECEE6250, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSublayer:", v3);

}

- (void)setRulerHostingDelegate:(uint64_t)a1
{
  id v3;
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;

  v3 = a2;
  if (a1)
  {
    v15 = v3;
    v4 = objc_storeWeak((id *)(a1 + 48), v3);
    if (v15)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v7 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v7, "rulerHostingView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          v9 = v8;
        else
          v9 = 0;
        objc_storeWeak((id *)(a1 + 8), v9);

      }
    }
    v10 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v10
      && (v11 = v10,
          v12 = objc_loadWeakRetained((id *)(a1 + 48)),
          v13 = objc_opt_respondsToSelector(),
          v12,
          v11,
          (v13 & 1) != 0))
    {
      v14 = objc_loadWeakRetained((id *)(a1 + 48));
      *(_BYTE *)(a1 + 16) = objc_msgSend(v14, "rulerHostWantsSharedRuler");

    }
    else
    {
      *(_BYTE *)(a1 + 16) = 1;
    }
    -[PKRulerController _enableRulerOnCanvasIfSharedRulerIsVisible](a1);
    v3 = v15;
  }

}

- (double)pixelSnapRulerTransform:(_OWORD *)a3@<X8>
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGAffineTransform v15;
  _OWORD v16[3];
  _OWORD v17[3];
  CGAffineTransform v18;

  if (a1)
  {
    v6 = *(_OWORD *)(a2 + 16);
    v17[0] = *(_OWORD *)a2;
    v17[1] = v6;
    v17[2] = *(_OWORD *)(a2 + 32);
    -[PKRulerController ensureRulerTransformIsFullyOnscreen:](a1, (double *)v17, &v18);
    v7 = *(_OWORD *)&v18.c;
    *(_OWORD *)a2 = *(_OWORD *)&v18.a;
    *(_OWORD *)(a2 + 16) = v7;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v18.tx;
    v8 = *(_OWORD *)(a2 + 16);
    v16[0] = *(_OWORD *)a2;
    v16[1] = v8;
    v16[2] = *(_OWORD *)(a2 + 32);
    -[PKRulerController getRulerCenterTValueOnScreenForTransform:]((uint64_t)a1, (double *)v16);
    v10 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v15.a = *(_OWORD *)a2;
    *(_OWORD *)&v15.c = v10;
    *(_OWORD *)&v15.tx = *(_OWORD *)(a2 + 32);
    CGAffineTransformTranslate(&v18, &v15, floor((v9 + -0.5) * 4000.0 / 50.0) * 50.0, 0.0);
    v11 = *(_OWORD *)&v18.c;
    *(_OWORD *)a2 = *(_OWORD *)&v18.a;
    *(_OWORD *)(a2 + 16) = v11;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v18.tx;
    v12 = *(_OWORD *)(a2 + 16);
    *(float64x2_t *)(a2 + 32) = vrndaq_f64(*(float64x2_t *)(a2 + 32));
    *a3 = *(_OWORD *)a2;
    a3[1] = v12;
    v13 = *(_OWORD *)(a2 + 32);
    a3[2] = v13;
  }
  else
  {
    *(_QWORD *)&v13 = 0;
    a3[1] = 0u;
    a3[2] = 0u;
    *a3 = 0u;
  }
  return *(double *)&v13;
}

- (id)initWithDelegate:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)PKRulerController;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 5, v3);
  }

  return a1;
}

- (uint64_t)getRulerCenterTValueOnScreenForTransform:(uint64_t)result
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v12;
  uint64_t v13;
  double *i;
  double v15;
  double v16[5];
  double v17;
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[4];
  double v22[5];
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v22[4] = *(double *)MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = a2[1];
    v3 = a2[4];
    v4 = a2[5];
    v5 = a2[2] * 0.0;
    v6 = a2[3] * 0.0;
    v7 = v3 + v5 + *a2 * 2000.0;
    v22[0] = v3 + v5 + *a2 * -2000.0;
    v22[1] = v4 + v6 + v2 * -2000.0;
    v22[2] = v7;
    v22[3] = v4 + v6 + v2 * 2000.0;
    objc_msgSend(*(id *)(result + 56), "bounds");
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    v21[0] = CGRectGetMinX(v23);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v21[1] = CGRectGetMinY(v24);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v21[2] = CGRectGetMaxX(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v21[3] = CGRectGetMinY(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v20[0] = CGRectGetMinX(v27);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v20[1] = CGRectGetMaxY(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v20[2] = CGRectGetMaxX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v20[3] = CGRectGetMaxY(v30);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v19[0] = CGRectGetMinX(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v19[1] = CGRectGetMinY(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v19[2] = CGRectGetMinX(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v19[3] = CGRectGetMaxY(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v18[0] = CGRectGetMaxX(v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v18[1] = CGRectGetMinY(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v18[2] = CGRectGetMaxX(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v12 = 0;
    v13 = 0;
    v18[3] = CGRectGetMaxY(v38);
    *(_QWORD *)&v16[2] = v20;
    *(_QWORD *)&v16[3] = v19;
    *(_QWORD *)&v16[4] = v18;
    for (i = (double *)v21; ; i = *(double **)&v16[v12 + 1])
    {
      result = DKDIntersectionOfLines(v22, i, (double *)&v18[v13], v16, &v15, 0, 1);
      if (!(_DWORD)result)
        goto LABEL_7;
      if (v13)
        break;
      if (++v12 == 4)
        return result;
      v13 = 1;
LABEL_8:
      ;
    }
    if (vabdd_f64(*(double *)&v18[v13], v17) >= 0.00999999978)
      return result;
    v13 = 1;
LABEL_7:
    if (++v12 == 4)
      return result;
    goto LABEL_8;
  }
  return result;
}

- (CGAffineTransform)ensureRulerTransformIsFullyOnscreen:(_OWORD *)a3@<X8>
{
  CGAffineTransform *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double x;
  double y;
  double width;
  double height;
  CGFloat MaxY;
  CGFloat v32;
  CGFloat v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MinX;
  double v56;
  double v57;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v60;
  CGFloat v61;
  CGFloat v62;
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v63 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    -[PKRulerController _adjustViewForHostingRulerView]((id *)result);
    v6 = a2[1];
    v7 = a2[4];
    v8 = a2[5];
    v9 = a2[2] * 0.0;
    v10 = v7 + v9 + *a2 * 0.0;
    v11 = a2[3] * 0.0;
    v12 = v8 + v11 + v6 * 0.0;
    v56 = v8 + v6 + v11;
    v57 = v7 + *a2 + v9;
    objc_msgSend(*(id *)&v5[1].b, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(*(id *)&v5[1].b, "safeAreaInsets");
    v22 = v16 + v21;
    v25 = v18 - (v23 + v24);
    v64.size.height = v20 - (v21 + v26);
    v64.origin.x = v14 + v23;
    v64.origin.y = v22;
    v64.size.width = v25;
    v65 = CGRectInset(v64, 10.0, 10.0);
    x = v65.origin.x;
    y = v65.origin.y;
    width = v65.size.width;
    height = v65.size.height;
    MinX = CGRectGetMinX(v65);
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    MinY = CGRectGetMinY(v66);
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    MaxX = CGRectGetMaxX(v67);
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    v52 = CGRectGetMinY(v68);
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    v51 = CGRectGetMaxX(v69);
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    MaxY = CGRectGetMaxY(v70);
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    v32 = CGRectGetMinX(v71);
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    v33 = CGRectGetMaxY(v72);
    v34 = 0;
    v35 = *MEMORY[0x1E0C9D538];
    v36 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v60.a = MinX;
    v60.b = MinY;
    v60.c = MaxX;
    v60.d = v52;
    v60.tx = v32;
    v60.ty = v33;
    v61 = v51;
    v62 = MaxY;
    v37 = 1.0 / sqrt((v56 - v12) * (v56 - v12) + (v57 - v10) * (v57 - v10));
    v38 = (v57 - v10) * v37;
    v39 = (v56 - v12) * v37;
    v40 = 1.79769313e308;
    do
    {
      v41 = v39 * (*(double *)((char *)&v60.b + v34) - v12) + (*(double *)((char *)&v60.a + v34) - v10) * v38;
      v42 = v10 + v38 * v41;
      v43 = x;
      if (v42 >= x)
      {
        v43 = v10 + v38 * v41;
        if (v42 > x + width)
          v43 = x + width;
      }
      v44 = v12 + v39 * v41;
      v45 = y;
      if (v44 >= y)
      {
        v45 = v44;
        if (v44 > y + height)
          v45 = y + height;
      }
      v46 = v43 - v42;
      v47 = v45 - v44;
      if (v47 * v47 + v46 * v46 < v40)
      {
        v40 = v47 * v47 + v46 * v46;
        v36 = v45 - v44;
        v35 = v46;
      }
      v34 += 16;
    }
    while (v34 != 64);
    v48 = *((_OWORD *)a2 + 1);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v48;
    *(_OWORD *)&t1.tx = *((_OWORD *)a2 + 2);
    CGAffineTransformMakeTranslation(&t2, v35, v36);
    result = CGAffineTransformConcat(&v60, &t1, &t2);
    v49 = *(_OWORD *)&v60.c;
    *(_OWORD *)a2 = *(_OWORD *)&v60.a;
    *((_OWORD *)a2 + 1) = v49;
    *((_OWORD *)a2 + 2) = *(_OWORD *)&v60.tx;
    v50 = *((_OWORD *)a2 + 1);
    *a3 = *(_OWORD *)a2;
    a3[1] = v50;
    a3[2] = *((_OWORD *)a2 + 2);
  }
  else
  {
    a3[1] = 0u;
    a3[2] = 0u;
    *a3 = 0u;
  }
  return result;
}

- (void)ensureRulerIsFullyOnscreen
{
  id v2;
  id v3;
  void *v4;
  _OWORD v5[3];
  _OWORD v6[3];

  if (a1)
  {
    v2 = *(id *)(a1 + 64);
    v3 = *(id *)(a1 + 64);
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "rulerTransform");
    else
      memset(v5, 0, sizeof(v5));
    objc_msgSend(v2, "setRulerTransform:", v6, -[PKRulerController pixelSnapRulerTransform:]((CGAffineTransform *)a1, (uint64_t)v5, v6));

  }
}

- (id)_viewForHostingRuler
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    v3 = WeakRetained;
    if (WeakRetained)
    {
      v1 = (id *)WeakRetained;
    }
    else
    {
      v4 = objc_loadWeakRetained(v1 + 5);
      objc_msgSend(v4, "topView");
      v1 = (id *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (double)_rulerFrame
{
  void *v1;
  double v2;

  if (!a1)
    return 0.0;
  -[PKRulerController _viewForHostingRuler](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C9D538];
  objc_msgSend(v1, "bounds");

  return v2;
}

- (uint64_t)_enableRulerOnCanvasIfSharedRulerIsVisible
{
  _BYTE *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  id WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1 || !*(_BYTE *)(a1 + 16))
    return 0;
  +[PKRulerController sharedRulerView]();
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRulerController _viewForHostingRuler]((id *)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4 || v2 && v2[416])
  {
    v5 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setRulerEnabled:", 1);

    v5 = 1;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKRulerController _viewForHostingRuler]((id *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_BYTE **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v12 != v2)) == 1)
          objc_msgSend(v12, "removeFromSuperview");
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)_adjustViewForHostingRulerView
{
  id v2;
  id v3;

  -[PKRulerController _viewForHostingRuler](a1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 != v2)
  {
    objc_msgSend(a1[7], "removeFromSuperview");
    objc_msgSend(v3, "addSubview:", a1[7]);
  }
  objc_msgSend(v3, "bringSubviewToFront:", a1[7]);
  objc_msgSend(a1[7], "setFrame:", -[PKRulerController _rulerFrame](a1));

}

+ (id)sharedRulerView
{
  objc_opt_self();
  if (_MergedGlobals_132 != -1)
    dispatch_once(&_MergedGlobals_132, &__block_literal_global_42);
  return (id)qword_1ECEE6250;
}

- (void)_configureRuler
{
  PKRulerView *v2;
  PKRulerLayer *v3;
  PKRulerLayer *v4;
  PKRulerLayer *v5;
  void *v6;
  void **v7;
  void *v8;
  PKRulerLayer *rulerLayer;
  void *v10;
  PKRulerGestureRecognizer *v11;
  void *v12;
  uint64_t v13;
  id v14;
  PKRulerGestureRecognizer *v15;
  PKRulerView *v16;

  if (!a1)
    return;
  if (*(_BYTE *)(a1 + 16))
  {
    +[PKRulerController sharedRulerView]();
    v2 = (PKRulerView *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(a1 + 56), v2);
    if (v2 && (v3 = v2->_rulerLayer) != 0)
    {
      v4 = v3;
      v5 = *(PKRulerLayer **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v4;
    }
    else
    {
      v5 = -[PKRulerLayer initWithRulerController:]([PKRulerLayer alloc], "initWithRulerController:", 0);
      -[PKRulerView setRulerLayer:]((uint64_t)v2, v5);
      -[PKRulerView layer](v2, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSublayer:", v5);

      if (v2)
        rulerLayer = v2->_rulerLayer;
      else
        rulerLayer = 0;
      objc_storeStrong((id *)(a1 + 64), rulerLayer);
    }
    goto LABEL_12;
  }
  v7 = (void **)(a1 + 64);
  v6 = *(void **)(a1 + 64);
  if (!v6)
  {
    v2 = objc_alloc_init(PKRulerView);
    objc_storeStrong((id *)(a1 + 56), v2);
    v5 = -[PKRulerLayer initWithRulerController:]([PKRulerLayer alloc], "initWithRulerController:", a1);
    objc_storeStrong((id *)(a1 + 64), v5);
    -[PKRulerView setRulerLayer:](*(_QWORD *)(a1 + 56), *v7);
    objc_msgSend(*(id *)(a1 + 56), "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", v5);

LABEL_12:
    v6 = *(void **)(a1 + 64);
    v16 = v2;
    goto LABEL_13;
  }
  v16 = 0;
LABEL_13:
  objc_msgSend(v6, "setRulerController:", a1);
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", -[PKRulerController _rulerFrame]((id *)a1));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", -[PKRulerController _rulerFrame]((id *)a1));
  if (!*(_QWORD *)(a1 + 32))
  {
    v11 = -[PKRulerGestureRecognizer initWithTarget:action:]([PKRulerGestureRecognizer alloc], "initWithTarget:action:", a1, sel_rulerMoveGesture_);
    v12 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v11;

    objc_msgSend(*(id *)(a1 + 32), "setCancelThreshold:", 15.0);
    objc_msgSend(*(id *)(a1 + 32), "setStartDelay:", 0.4);
    objc_msgSend(*(id *)(a1 + 32), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 32), "setAllowedTouchTypes:", &unk_1E77ECAF0);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v14, "addGestureRecognizer:", v13);

    v15 = -[PKRulerGestureRecognizer initWithTarget:action:]([PKRulerGestureRecognizer alloc], "initWithTarget:action:", a1, sel_eatPencilGesture_);
    -[PKFreeTransformGestureRecognizer setCancelThreshold:](v15, "setCancelThreshold:", 15.0);
    -[PKRulerGestureRecognizer setStartDelay:](v15, "setStartDelay:", 0.4);
    -[PKRulerGestureRecognizer setDelegate:](v15, "setDelegate:", a1);
    -[PKRulerGestureRecognizer setAllowedTouchTypes:](v15, "setAllowedTouchTypes:", &unk_1E77ECB08);
    objc_msgSend(*(id *)(a1 + 56), "addGestureRecognizer:", v15);

  }
  -[PKRulerController _adjustViewForHostingRulerView]((id *)a1);

}

- (uint64_t)rulerSelected
{
  uint64_t v1;

  if (result)
  {
    if (*(_BYTE *)(result + 16))
    {
      return -[PKRulerController _enableRulerOnCanvasIfSharedRulerIsVisible](result);
    }
    else
    {
      v1 = *(_QWORD *)(result + 56);
      return v1 && *(unsigned __int8 *)(v1 + 416) == 0;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_wantsSharedRuler)
    -[PKRulerView removeFromSuperview](self->_rulerView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)PKRulerController;
  -[PKRulerController dealloc](&v3, sel_dealloc);
}

- (id)adjustFrames
{
  id *v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(result[8], "setFrame:", -[PKRulerController _rulerFrame](result));
    objc_msgSend(v1[8], "frame");
    return (id *)objc_msgSend(v1[7], "setFrame:");
  }
  return result;
}

- (void)showRuler
{
  uint64_t v2;

  if (a1)
  {
    -[PKRulerController _configureRuler](a1);
    -[PKRulerController adjustFrames]((id *)a1);
    objc_msgSend(*(id *)(a1 + 64), "showRuler");
    -[PKRulerController ensureRulerIsFullyOnscreen](a1);
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
      *(_BYTE *)(v2 + 416) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setStartDelay:", 0.0);
    objc_msgSend(*(id *)(a1 + 32), "setStartThreshold:", 0.0);
    objc_msgSend(*(id *)(a1 + 32), "setStartSnapThreshold:", 10.0);
    objc_msgSend(*(id *)(a1 + 32), "setAllowSingleTouchDrag:", 1);
    UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], *(id *)(a1 + 64));
  }
}

- (void)hideRulerAnimated:(uint64_t)a1
{
  uint64_t v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "hideRulerAnimated:", a2);
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      *(_BYTE *)(v3 + 416) = 1;
    *(_BYTE *)(a1 + 19) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setStartDelay:", 0.4);
    objc_msgSend(*(id *)(a1 + 32), "setStartThreshold:", 1.79769313e308);
    objc_msgSend(*(id *)(a1 + 32), "setAllowSingleTouchDrag:", 0);
    UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
  }
}

- (double)defaultRulerTransform
{
  double result;
  CGAffineTransform v5;

  if (a1)
  {
    CGAffineTransformMakeRotation(&v5, 0.785398163);
    return -[PKRulerController pixelSnapRulerTransform:](a1, (uint64_t)&v5, a2);
  }
  else
  {
    result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

- (uint64_t)resetRulerTransform
{
  uint64_t v1;
  id v2;
  void *v3;
  double v4;
  id WeakRetained;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (result)
  {
    v1 = result;
    v2 = *(id *)(result + 64);
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "rulerTransform");
    }
    else
    {
      v7 = 0u;
      v8 = 0u;
      v6 = 0u;
    }
    *(_OWORD *)(v1 + 112) = v6;
    *(_OWORD *)(v1 + 128) = v7;
    *(_OWORD *)(v1 + 144) = v8;

    result = objc_msgSend(*(id *)(v1 + 64), "rulerAlpha");
    if (v4 < 1.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 40));
      objc_msgSend(WeakRetained, "setRulerEnabled:", 0);

      -[PKRulerController hideRulerAnimated:](v1, 1);
      objc_msgSend(*(id *)(v1 + 32), "setEnabled:", 0);
      return objc_msgSend(*(id *)(v1 + 32), "setEnabled:", 1);
    }
  }
  return result;
}

- (float64x2_t)applyTransformToTouchLocation:(__n128)a3
{
  float64x2_t result;
  id WeakRetained;
  void *v5;
  __n128 v6;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v6 = a3;
  result = 0uLL;
  if (a1)
  {
    memset(&v9, 0, sizeof(v9));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "strokeTransform", *(_OWORD *)&v6);
    else
      memset(&v8, 0, sizeof(v8));
    CGAffineTransformInvert(&v9, &v8);

    return vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, v6.n128_f64[0]), *(float64x2_t *)&v9.a, a2));
  }
  return result;
}

- (void)drawingBegan:(double)a3 coordinateSystem:(double)a4
{
  double v7;
  __n128 v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 16))
      -[PKRulerController _configureRuler](a1);
    -[PKRulerController startRulerDrawing]((id *)a1);
    objc_msgSend(v9, "convertPoint:toCoordinateSpace:", *(_QWORD *)(a1 + 56), a3, a4);
    objc_msgSend(*(id *)(a1 + 64), "updateRulerMarkerForLocation:firstTouch:", 1, -[PKRulerController applyTransformToTouchLocation:](a1, v7, v8).f64[0]);
  }

}

- (void)startRulerDrawing
{
  id v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  id v13;
  void *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  id v21;
  double v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v30;
  CGAffineTransform v31[2];

  if (a1)
  {
    v2 = a1[8];
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v3, "rulerTransform");

      memset(v31, 0, sizeof(v31));
      WeakRetained = objc_loadWeakRetained(a1 + 5);
      objc_msgSend(WeakRetained, "topView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = a1[7];
      objc_msgSend(v6, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v5)
      {
        v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v31[0].a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v31[0].c = v12;
        *(_OWORD *)&v31[0].tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      else
      {
        objc_msgSend(v5, "convertRect:fromView:", v6, 0.0, 0.0, 100.0, 100.0);
        DKDTransformConvertingRectToRectAtPercent((uint64_t)v31, 0.0, 0.0, 100.0, 100.0, v8, v9, v10, v11, 1.0);
      }

      t1 = v31[1];
      t2 = v31[0];
      CGAffineTransformConcat(&v30, &t1, &t2);
      v31[1] = v30;
      memset(&v30, 0, sizeof(v30));
      v13 = objc_loadWeakRetained(a1 + 5);
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "strokeTransform");
      else
        memset(&v27, 0, sizeof(v27));
      CGAffineTransformInvert(&v30, &v27);

      v25 = v31[1];
      v24 = v30;
      CGAffineTransformConcat(&v26, &v25, &v24);
      v31[1] = v26;
      v15 = objc_loadWeakRetained(a1 + 5);
      objc_msgSend(v15, "drawingController");
      v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      -[PKController inputController](v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v31[1];
      v18 = a1[8];
      objc_msgSend(v18, "rulerWidth");
      v20 = v19;
      v21 = a1[8];
      objc_msgSend(v21, "rulerAlignInset");
      objc_msgSend(v17, "allowSnappingToRuler:width:", &v23, v20 - v22);

    }
  }
}

- (void)drawingMoved:(double)a3 coordinateSystem:(double)a4
{
  id v7;
  double v8;
  __n128 v9;
  id WeakRetained;
  _QWORD *v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  char v16;
  id v17;

  v7 = a2;
  if (a1)
  {
    v17 = v7;
    objc_msgSend(v7, "convertPoint:toCoordinateSpace:", *(_QWORD *)(a1 + 56), a3, a4);
    objc_msgSend(*(id *)(a1 + 64), "updateRulerMarkerForLocation:firstTouch:", 0, -[PKRulerController applyTransformToTouchLocation:](a1, v8, v9).f64[0]);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "drawingController");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[PKController inputController](v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "lastPointIsMasked");
    v14 = objc_msgSend(v12, "isSnappedToRuler");
    *(_BYTE *)(a1 + 21) = v13;
    if (*(_BYTE *)(a1 + 22))
      v15 = 1;
    else
      v15 = v13;
    *(_BYTE *)(a1 + 22) = v15;
    if (*(_BYTE *)(a1 + 23))
      v16 = 1;
    else
      v16 = v14;
    *(_BYTE *)(a1 + 23) = v16;

    v7 = v17;
  }

}

- (void)drawingEnded
{
  int v2;
  _BOOL8 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    -[PKRulerController resetRulerTouches](a1);
    objc_msgSend(*(id *)(a1 + 64), "removeRulerMarkers");
    v2 = *(unsigned __int8 *)(a1 + 23);
    if (!*(_BYTE *)(a1 + 22))
    {
      if (!*(_BYTE *)(a1 + 23))
      {
LABEL_8:
        *(_WORD *)(a1 + 21) = 0;
        *(_BYTE *)(a1 + 23) = 0;
        return;
      }
      v2 = 1;
    }
    v3 = v2 == 0;
    +[PKStatisticsManager sharedStatisticsManager]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 56);
    v6 = v5;
    if (v5)
      v7 = (void *)*((_QWORD *)v5 + 53);
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v8, "currentAngle");
    -[PKStatisticsManager recordRulerInteractionEndedWithType:angle:]((uint64_t)v4, v3);

    goto LABEL_8;
  }
}

- (uint64_t)drawingCancelled:(uint64_t)result
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    -[PKRulerController resetRulerTouches](result);
    result = objc_msgSend(*(id *)(v1 + 64), "removeRulerMarkers");
    *(_WORD *)(v1 + 21) = 0;
    *(_BYTE *)(v1 + 23) = 0;
  }
  return result;
}

- (void)resetRulerTouches
{
  id v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (a1 && *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "resetStartingTouches");
    v2 = *(id *)(a1 + 64);
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "rulerTransform");
    }
    else
    {
      v5 = 0u;
      v6 = 0u;
      v4 = 0u;
    }
    *(_OWORD *)(a1 + 112) = v4;
    *(_OWORD *)(a1 + 128) = v5;
    *(_OWORD *)(a1 + 144) = v6;

  }
}

- (void)rulerMoveGesture:(id)a3
{
  id v4;
  PKRulerView *rulerView;
  PKRulerView *v6;
  uint64_t v7;
  UIImpactFeedbackGenerator *v8;
  NSObject *v9;
  PKRulerLayer *v10;
  double v11;
  id v12;
  NSObject *v13;
  PKRulerLayer *v14;
  CGFloat v15;
  CGFloat v16;
  PKRulerLayer *rulerLayer;
  PKRulerLayer *v18;
  PKRulerLayer *v19;
  PKRulerLayer *v20;
  __int128 v21;
  PKRulerLayer *v22;
  PKRulerLayer *v23;
  UIImpactFeedbackGenerator *v24;
  void *v25;
  UIImpactFeedbackGenerator *snapImpactBehavior;
  id v27;
  id WeakRetained;
  char v29;
  PKRulerView *v30;
  CGFloat v31;
  CGFloat v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  __int128 v39;
  __int128 v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  __int128 v45;
  long double v46;
  double v47;
  double v49;
  double v50;
  double v51;
  double v53;
  double v54;
  double v55;
  unint64_t v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  double snapAngle;
  double v61;
  uint64_t v62;
  BOOL v63;
  void *v64;
  PKRulerLayer *v65;
  id v66;
  PKRulerLayer *v67;
  PKRulerLayer *v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  _BOOL4 canRulerSnapToAngle;
  uint64_t v85;
  double v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  CGAffineTransform v92;
  _OWORD v93[3];
  CGAffineTransform v94;
  CGAffineTransform v95;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v98;
  _OWORD v99[3];
  CGAffineTransform v100;
  CGAffineTransform v101;
  _OWORD v102[3];
  CGAffineTransform v103;
  CGAffineTransform v104[2];
  CGAffineTransform v105;
  CGAffineTransform v106;
  CGAffineTransform v107;
  CGAffineTransform v108;
  CGAffineTransform v109;
  CGAffineTransform v110;
  CGAffineTransform v111;

  v4 = a3;
  if (self)
    rulerView = self->_rulerView;
  else
    rulerView = 0;
  v6 = rulerView;
  v7 = objc_msgSend(v4, "state");
  if ((unint64_t)(v7 - 3) >= 2)
  {
    if (v7 != 1)
    {
      if (v7 != 2)
        goto LABEL_108;
LABEL_44:
      v27 = v4;
      if (!self
        || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
            v29 = objc_msgSend(WeakRetained, "isDrawing"),
            WeakRetained,
            (v29 & 1) != 0))
      {
LABEL_107:

        goto LABEL_108;
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
      memset(&v104[1], 0, sizeof(CGAffineTransform));
      if (v27)
        objc_msgSend(v27, "freeTransform");
      v30 = self->_rulerView;
      v104[0] = v104[1];
      -[PKRulerView frame](v30, "frame");
      DKDTransformConvertForNewOrigin(v104, &v111, v31, v32);
      v104[1] = v111;
      v103 = v111;
      v33 = *(_OWORD *)&self->_rulerStartTransform.a;
      v34 = *(_OWORD *)&self->_rulerStartTransform.tx;
      v102[1] = *(_OWORD *)&self->_rulerStartTransform.c;
      v102[2] = v34;
      v102[0] = v33;
      DKDTransformInTransformSpace(&v103, v102, &v111);
      v104[1] = v111;
      v35 = sqrt(v111.b * v111.b + v111.a * v111.a);
      v36 = 1.0;
      if (v35 < 0.5)
      {
        v36 = v35;
        if (v35 > 1.0)
          v36 = 1.0;
      }
      -[PKRulerLayer setRulerAlpha:](self->_rulerLayer, "setRulerAlpha:", v36);
      if (v27)
        objc_msgSend(v27, "unscaledFreeTransform");
      else
        memset(&v111, 0, sizeof(v111));
      v104[1] = v111;
      v101 = v111;
      -[PKRulerView frame](v30, "frame");
      DKDTransformConvertForNewOrigin(&v101, &v111, v37, v38);
      v104[1] = v111;
      v100 = v111;
      v39 = *(_OWORD *)&self->_rulerStartTransform.a;
      v40 = *(_OWORD *)&self->_rulerStartTransform.tx;
      v99[1] = *(_OWORD *)&self->_rulerStartTransform.c;
      v99[2] = v40;
      v99[0] = v39;
      DKDTransformInTransformSpace(&v100, v99, &v111);
      v104[1] = v111;
      CGAffineTransformScale(&v110, &v111, 1.0 / sqrt(v111.b * v111.b + v111.a * v111.a), 1.0 / sqrt(v111.d * v111.d + v111.c * v111.c));
      v104[1] = v110;
      objc_msgSend(v27, "locationInView:", v30);
      v42 = v41;
      v44 = v43;
      t1 = v104[1];
      memset(&v98, 0, sizeof(v98));
      v45 = *(_OWORD *)&self->_rulerStartTransform.c;
      *(_OWORD *)&t2.a = *(_OWORD *)&self->_rulerStartTransform.a;
      *(_OWORD *)&t2.c = v45;
      *(_OWORD *)&t2.tx = *(_OWORD *)&self->_rulerStartTransform.tx;
      CGAffineTransformConcat(&v98, &t1, &t2);
      v95 = v98;
      v110 = v98;
      memset(&v111, 0, sizeof(v111));
      DKDTransformConvertForNewOrigin(&v110, &v111, v42, v44);
      v109 = v111;
      v46 = DKDTransformAngle(&v109.a);
      v47 = fmod(v46, 360.0);
      if (v46 <= 360.0 && v46 >= 0.0)
        v47 = v46;
      if (v47 < 0.0)
        v47 = v47 + 360.0;
      if (v47 == 0.0)
        v49 = 0.0;
      else
        v49 = v47;
      v50 = round(v49 / 45.0) * 45.0;
      v51 = fmod(v50, 360.0);
      if (v50 <= 360.0 && v50 >= 0.0)
        v51 = v50;
      if (v51 < 0.0)
        v51 = v51 + 360.0;
      if (v51 == 0.0)
        v53 = 0.0;
      else
        v53 = v51;
      v54 = fmod(v49 - v53, 360.0);
      if (v54 > 180.0)
        v54 = v54 + -360.0;
      v55 = v54 + 360.0;
      if (v54 >= -180.0)
        v55 = v54;
      v56 = (unint64_t)(v55 < 0.0) << 32;
      v57 = fabs(v55);
      v58 = v56 | 2;
      if (v57 <= 5.0)
        v58 = (unint64_t)(v55 < 0.0) << 32;
      v59 = v56 | 1;
      if (v57 <= 12.5)
        v59 = v58;
      snapAngle = self->_rulerState.snapAngle;
      if (v53 != snapAngle)
      {
        self->_canRulerSnapToAngle = 1;
        *(_QWORD *)&self->_rulerState.arcType = v59;
        self->_rulerState.snapAngle = v53;
        *(_QWORD *)&self->_previousRulerState.arcType = v59;
        self->_previousRulerState.snapAngle = v53;
        if (!(_DWORD)v59)
          goto LABEL_84;
LABEL_96:
        if (self->_rulerSnappedToAngle)
        {
          self->_rulerSnappedToAngle = 0;
          v61 = 0.5;
          goto LABEL_98;
        }
LABEL_99:
        v98 = v95;
        objc_msgSend(v27, "touches");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        self->_rulerIsRotating = (unint64_t)objc_msgSend(v64, "count") > 1;

        v65 = self->_rulerLayer;
        v107 = v98;
        -[PKRulerLayer setRulerTransform:](v65, "setRulerTransform:", &v108, -[PKRulerController pixelSnapRulerTransform:]((CGAffineTransform *)self, (uint64_t)&v107, &v108));

        v66 = v27;
        if (self->_rulerIsRotating)
        {
          memset(&v111, 0, sizeof(v111));
          v67 = self->_rulerLayer;
          v68 = v67;
          if (v67)
            -[PKRulerLayer rulerTransform](v67, "rulerTransform");
          else
            memset(&v111, 0, sizeof(v111));

          memset(&v110, 0, sizeof(v110));
          v109 = v111;
          CGAffineTransformInvert(&v110, &v109);
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "scale");
          v86 = v71;

          objc_msgSend(v66, "touches");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectAtIndexedSubscript:", 0);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "locationInView:", self->_rulerView);
          v75 = v74;
          v77 = v76;

          objc_msgSend(v66, "touches");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "locationInView:", self->_rulerView);
          v81 = v80;
          v83 = v82;

          -[PKRulerLayer updateAngleWithAngleMarkerPosition:](self->_rulerLayer, "updateAngleWithAngleMarkerPosition:", vmulq_n_f64(vrndaq_f64(vmulq_n_f64(vaddq_f64(*(float64x2_t *)&v111.tx, vmlaq_n_f64(vmulq_f64(*(float64x2_t *)&v111.c, (float64x2_t)0), *(float64x2_t *)&v111.a, (v110.tx + v77 * v110.c + v110.a * v75 + v110.tx + v83 * v110.c + v110.a * v81) * 0.5)), v86)), 1.0 / v86));
        }
        else
        {
          -[PKRulerLayer rulerAngleMarker](self->_rulerLayer, "rulerAngleMarker");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69)
            -[PKRulerLayer hideRulerAngleMarker](self->_rulerLayer, "hideRulerAngleMarker");
        }

        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        goto LABEL_107;
      }
      v62 = *(_QWORD *)&self->_rulerState.arcType;
      if ((_DWORD)v62 == (_DWORD)v59)
      {
        if (!(_DWORD)v62)
        {
          if (!self->_canRulerSnapToAngle)
            goto LABEL_96;
          goto LABEL_84;
        }
        if (v55 < 0.0 != ((v62 & 0x100000000) == 0))
          goto LABEL_96;
      }
      if ((_DWORD)v59)
      {
        if ((_DWORD)v59 == 1)
          goto LABEL_93;
        if ((_DWORD)v59 != 2)
        {
LABEL_95:
          *(_QWORD *)&self->_previousRulerState.arcType = v62;
          self->_previousRulerState.snapAngle = snapAngle;
          *(_QWORD *)&self->_rulerState.arcType = v59;
          self->_rulerState.snapAngle = v53;
          goto LABEL_96;
        }
        if ((_DWORD)v62)
        {
LABEL_93:
          v63 = 1;
        }
        else
        {
          v85 = *(_QWORD *)&self->_previousRulerState.arcType;
          if ((_DWORD)v85)
            v63 = (v55 < 0.0) ^ BYTE4(v85) & 1;
          else
            v63 = 1;
        }
        self->_canRulerSnapToAngle = v63;
        goto LABEL_95;
      }
      canRulerSnapToAngle = self->_canRulerSnapToAngle;
      *(_QWORD *)&self->_previousRulerState.arcType = v62;
      self->_previousRulerState.snapAngle = snapAngle;
      *(_QWORD *)&self->_rulerState.arcType = v59;
      self->_rulerState.snapAngle = v53;
      if (!canRulerSnapToAngle)
        goto LABEL_96;
LABEL_84:
      memset(&v108, 0, sizeof(v108));
      CGAffineTransformMakeRotation(&v108, (v53 - v49) * 3.14159265 / 180.0);
      v106 = v111;
      v105 = v108;
      CGAffineTransformConcat(&v107, &v106, &v105);
      v111 = v107;
      DKDTransformConvertForNewOrigin(&v107, &v95, -v42, -v44);
      if (!self->_rulerSnappedToAngle)
      {
        self->_rulerSnappedToAngle = 1;
        v61 = 1.0;
LABEL_98:
        -[UIImpactFeedbackGenerator _impactOccurredWithIntensity:](self->_snapImpactBehavior, "_impactOccurredWithIntensity:", v61);
        goto LABEL_99;
      }
      goto LABEL_99;
    }
    v13 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v111.a) = 0;
      _os_log_debug_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEBUG, "rulerMoveGesture began", (uint8_t *)&v111, 2u);
    }

    if (!self || (v14 = self->_rulerLayer) == 0)
    {
      -[PKRulerController showRuler]((uint64_t)self);
      -[PKRulerController drawingCancelled:]((uint64_t)self);
      if (self)
        self->_rulerWasShownViaGesture = 1;
      memset(&v111, 0, sizeof(v111));
      if (v4)
        objc_msgSend(v4, "rulerTransform");
      v94 = v111;
      -[PKRulerView frame](v6, "frame");
      DKDTransformConvertForNewOrigin(&v94, &v110, v15, v16);
      v111 = v110;
      if (self)
        rulerLayer = self->_rulerLayer;
      else
        rulerLayer = 0;
      v18 = rulerLayer;
      v92 = v111;
      -[PKRulerLayer setRulerTransform:](v18, "setRulerTransform:", v93, -[PKRulerController pixelSnapRulerTransform:]((CGAffineTransform *)self, (uint64_t)&v92, v93));

      if (!self)
      {
        v24 = 0;
LABEL_41:
        -[UIImpactFeedbackGenerator deactivate](v24, "deactivate");
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:coordinateSpace:", 1, v6);
        -[PKRulerController setSnapImpactBehavior:]((uint64_t)self, v25);

        if (self)
          snapImpactBehavior = self->_snapImpactBehavior;
        else
          snapImpactBehavior = 0;
        -[UIImpactFeedbackGenerator activateWithCompletionBlock:](snapImpactBehavior, "activateWithCompletionBlock:", 0);
        goto LABEL_44;
      }
      v14 = self->_rulerLayer;
    }
    *(_WORD *)&self->_isInteractingWithRuler = 1;
    v19 = v14;
    v20 = v19;
    if (v19)
    {
      -[PKRulerLayer rulerTransform](v19, "rulerTransform");
      v87 = v89;
      v88 = v90;
      v21 = v91;
    }
    else
    {
      v21 = 0uLL;
      v87 = 0u;
      v88 = 0u;
    }
    *(_OWORD *)&self->_rulerStartTransform.a = v87;
    *(_OWORD *)&self->_rulerStartTransform.c = v88;
    *(_OWORD *)&self->_rulerStartTransform.tx = v21;

    self->_previousRulerState = self->_rulerState;
    self->_rulerSnappedToAngle = 0;
    v24 = self->_snapImpactBehavior;
    goto LABEL_41;
  }
  if (self)
  {
    self->_rulerSnappedToAngle = 0;
    v8 = self->_snapImpactBehavior;
  }
  else
  {
    v8 = 0;
  }
  -[UIImpactFeedbackGenerator deactivate](v8, "deactivate");
  -[PKRulerController setSnapImpactBehavior:]((uint64_t)self, 0);
  v9 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v111.a) = 0;
    _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "rulerMoveGesture ended/canceled", (uint8_t *)&v111, 2u);
  }

  if (self)
    v10 = self->_rulerLayer;
  else
    v10 = 0;
  -[PKRulerLayer rulerAlpha](v10, "rulerAlpha");
  if (v11 >= 1.0)
  {
    if (self)
      goto LABEL_33;
  }
  else
  {
    if (self)
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
    else
      v12 = 0;
    objc_msgSend(v12, "setRulerEnabled:", 0);

    if (self)
    {
      -[PKRulerController hideRulerAnimated:]((uint64_t)self, 1);
LABEL_33:
      v22 = self->_rulerLayer;
      goto LABEL_34;
    }
  }
  v22 = 0;
LABEL_34:
  -[PKRulerLayer hideRulerAngleMarker](v22, "hideRulerAngleMarker");
  if (self)
    v23 = self->_rulerLayer;
  else
    v23 = 0;
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], v23);
  if (self)
  {
    self->_isInteractingWithRuler = 0;
    if (self->_rulerWasShownViaGesture)
      -[PKRulerController hideRulerAnimated:]((uint64_t)self, 1);
  }
LABEL_108:

}

- (void)setSnapImpactBehavior:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  PKRulerGestureRecognizer *v6;
  id v7;
  void *v8;
  PKRulerGestureRecognizer *v9;
  PKRulerGestureRecognizer *v10;
  id WeakRetained;
  PKRulerGestureRecognizer *v12;
  PKRulerLayer *rulerLayer;
  double v14;
  double v15;
  double v16;
  double v17;
  PKRulerLayer *v18;
  PKRulerLayer *v19;
  BOOL v20;
  PKRulerLayer *v21;
  PKRulerGestureRecognizer *v22;
  PKRulerLayer *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  void *v33;
  id v34;

  v6 = (PKRulerGestureRecognizer *)a3;
  v7 = a4;
  -[PKRulerController _viewForHostingRuler]((id *)&self->super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v9 = self->_rulerGestureRecognizer;
    if (v9 == v6)
    {
      rulerLayer = self->_rulerLayer;

      if (!rulerLayer)
        goto LABEL_12;
      goto LABEL_8;
    }
    v10 = v9;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
LABEL_4:
    objc_msgSend(WeakRetained, "drawingGestureRecognizer");
    v12 = (PKRulerGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    if (v12 != v6)
    {

      if (!self)
      {
LABEL_33:
        if (v6)
        {
          v22 = 0;
          goto LABEL_13;
        }
        goto LABEL_35;
      }
      goto LABEL_12;
    }
    if (!self)
    {

      goto LABEL_33;
    }
    v21 = self->_rulerLayer;

    if (!v21)
    {
LABEL_12:
      v22 = self->_rulerGestureRecognizer;
      if (v22 != v6)
      {
LABEL_13:

LABEL_26:
        v31 = 1;
        goto LABEL_27;
      }
      v23 = self->_rulerLayer;

      if (v23)
        goto LABEL_26;
      v24 = objc_loadWeakRetained((id *)&self->_delegate);
      goto LABEL_16;
    }
LABEL_8:
    objc_msgSend(v7, "locationInView:", v8);
    v15 = v14;
    v17 = v16;
    v18 = self->_rulerLayer;
    if (v18)
    {
      v19 = v18;
      v20 = -[PKRulerLayer viewPointInRuler:](self->_rulerLayer, "viewPointInRuler:", v15, v17);

    }
    else
    {
      v20 = 1;
    }
    v31 = v20 ^ (self->_rulerGestureRecognizer != v6);
    goto LABEL_27;
  }
  if (v6)
  {
    v10 = 0;
    WeakRetained = 0;
    goto LABEL_4;
  }
LABEL_35:

  v24 = 0;
LABEL_16:
  if ((objc_msgSend(v24, "isDrawing") & 1) == 0)
  {

    goto LABEL_26;
  }
  if (self)
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
  else
    v25 = 0;
  objc_msgSend(v25, "drawingGestureRecognizer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "drawingTouch");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v27 == v7)
  {
    v31 = 1;
  }
  else
  {
    v34 = v25;
    -[PKFreeTransformGestureRecognizer touches](v6, "touches");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v28 = objc_loadWeakRetained((id *)&self->_delegate);
    else
      v28 = 0;
    objc_msgSend(v28, "drawingGestureRecognizer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "drawingTouch");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v33, "containsObject:", v30);

    v25 = v34;
  }

LABEL_27:
  return v31;
}

- (double)rulerTransform
{
  id v4;
  void *v5;
  double result;
  _OWORD v7[3];

  if (a1)
  {
    v4 = *(id *)(a1 + 64);
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "rulerTransform");
    else
      memset(v7, 0, sizeof(v7));
    -[PKRulerController pixelSnapRulerTransform:]((CGAffineTransform *)a1, (uint64_t)v7, a2);

  }
  else
  {
    result = 0.0;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

- (void)canvasTransform
{
  id *v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  CGFloat v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;

  if (a1)
  {
    v3 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "strokeTransform");
      v7 = v21;
      v6 = v20;
      v9 = v23;
      v8 = v22;
    }
    else
    {
      v24 = 0u;
      v8 = 0.0;
      v7 = 0.0;
      v9 = 0.0;
      v6 = 0.0;
    }
    v10 = fabs(v6 * v9 - v7 * v8);
    if (v10 < 0.001 || v10 == INFINITY || (v11 = fabs(*(double *)&v24), v11 >= INFINITY) && v11 <= INFINITY)
    {

LABEL_10:
      v12 = objc_loadWeakRetained(v3);
      objc_msgSend(v12, "drawingScale");
      v14 = v13;

      CGAffineTransformMakeScale((CGAffineTransform *)a2, v14, v14);
      return;
    }

    if (fabs(*((double *)&v24 + 1)) == INFINITY)
      goto LABEL_10;
    v15 = objc_loadWeakRetained(v3);
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "strokeTransform");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
    }
    *(_OWORD *)a2 = v17;
    *(_OWORD *)(a2 + 16) = v18;
    *(_OWORD *)(a2 + 32) = v19;

  }
  else
  {
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapImpactBehavior, 0);
  objc_storeStrong((id *)&self->_rulerLayer, 0);
  objc_storeStrong((id *)&self->_rulerView, 0);
  objc_destroyWeak((id *)&self->_rulerHostingDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rulerGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_rulerHostingView);
}

@end
