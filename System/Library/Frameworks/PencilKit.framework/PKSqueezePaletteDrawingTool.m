@implementation PKSqueezePaletteDrawingTool

- (id)initWithTool:(void *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  PKPaletteToolViewFactory *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  objc_super v38;
  _QWORD v39[7];

  v39[6] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v38.receiver = a1;
    v38.super_class = (Class)PKSqueezePaletteDrawingTool;
    v4 = objc_msgSendSuper2(&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    if (v4)
    {
      v5 = objc_msgSend(v3, "copy");
      v37 = v3;
      v6 = (void *)*((_QWORD *)v4 + 103);
      *((_QWORD *)v4 + 103) = v5;

      *((_QWORD *)v4 + 97) = PKSqueezePaletteToolWidth;
      v7 = objc_alloc_init(PKPaletteToolViewFactory);
      v8 = (void *)*((_QWORD *)v4 + 95);
      *((_QWORD *)v4 + 95) = v7;

      *((_QWORD *)v4 + 98) = 0;
      v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v10 = (void *)*((_QWORD *)v4 + 96);
      *((_QWORD *)v4 + 96) = v9;

      objc_msgSend(*((id *)v4 + 96), "setUserInteractionEnabled:", 0);
      objc_msgSend(*((id *)v4 + 96), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*((id *)v4 + 96), "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMasksToBounds:", 0);

      objc_msgSend(v4, "addSubview:", *((_QWORD *)v4 + 96));
      -[PKPaletteToolViewFactory makePaletteToolViewForTool:](*((_QWORD *)v4 + 95), *((void **)v4 + 103));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)v4 + 94);
      *((_QWORD *)v4 + 94) = v12;

      objc_msgSend(*((id *)v4 + 94), "setUserInteractionEnabled:", 0);
      objc_msgSend(*((id *)v4 + 94), "setEdgeLocation:", 4);
      objc_msgSend(*((id *)v4 + 94), "setSelected:", 1);
      objc_msgSend(*((id *)v4 + 94), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*((id *)v4 + 96), "addSubview:", *((_QWORD *)v4 + 94));
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
      v15 = (void *)*((_QWORD *)v4 + 100);
      *((_QWORD *)v4 + 100) = v14;

      objc_msgSend(v4, "addInteraction:", *((_QWORD *)v4 + 100));
      objc_msgSend(*((id *)v4 + 96), "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, *((double *)v4 + 98));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)*((_QWORD *)v4 + 99);
      *((_QWORD *)v4 + 99) = v18;

      v31 = (void *)MEMORY[0x1E0CB3718];
      v39[0] = *((_QWORD *)v4 + 99);
      objc_msgSend(*((id *)v4 + 96), "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, *(double *)&PKSqueezePaletteToolHoverOffsetY);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v34;
      objc_msgSend(*((id *)v4 + 96), "widthAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "widthAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v32);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v30;
      objc_msgSend(*((id *)v4 + 94), "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v4 + 96), "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v22;
      objc_msgSend(*((id *)v4 + 94), "centerXAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v4 + 96), "centerXAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[4] = v25;
      objc_msgSend(*((id *)v4 + 94), "widthAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToConstant:", *((double *)v4 + 97));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39[5] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "activateConstraints:", v28);

      v3 = v37;
      objc_msgSend(v4, "setHitTestInsets:", -16.0, 0.0, -10.0, 0.0);
      -[PKSqueezePaletteDrawingTool _updateUI]((uint64_t)v4);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateUI
{
  _BOOL8 v2;
  int v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    v2 = (objc_msgSend((id)a1, "isSelected") & 1) == 0 && *(_BYTE *)(a1 + 808) == 0;
    objc_msgSend(*(id *)(a1 + 800), "setEnabled:", v2);
    if (*(_BYTE *)(a1 + 808))
      -[PKSqueezePaletteDrawingTool resetPointerInteractionTransform](a1);
    v3 = objc_msgSend((id)a1, "isSelected");
    v4 = 8.0;
    if (v3)
      v4 = -16.0;
    *(double *)(a1 + 784) = v4;
    objc_msgSend(*(id *)(a1 + 792), "setConstant:");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 752), "_setOverrideLabelCenterOffsetYHandler:", &__block_literal_global_14);
    objc_msgSend(*(id *)(a1 + 752), "setColorUserInterfaceStyle:", *(_QWORD *)(a1 + 832));
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 752), "toolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("MiniPalette-Tool-%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setAccessibilityIdentifier:", v7);

    objc_msgSend(*(id *)(a1 + 752), "toolName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setAccessibilityLabel:", v8);

  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  BOOL v29;
  BOOL v30;
  objc_super v32;
  CGPoint v33;
  CGRect v34;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKSqueezePaletteDrawingTool hitTestInsets](self, "hitTestInsets");
  if (v11 == *(double *)(MEMORY[0x1E0DC49E8] + 8)
    && v8 == *MEMORY[0x1E0DC49E8]
    && v10 == *(double *)(MEMORY[0x1E0DC49E8] + 24)
    && v9 == *(double *)(MEMORY[0x1E0DC49E8] + 16))
  {
    v32.receiver = self;
    v32.super_class = (Class)PKSqueezePaletteDrawingTool;
    v29 = -[PKSqueezePaletteDrawingTool pointInside:withEvent:](&v32, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    -[PKSqueezePaletteDrawingTool bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[PKSqueezePaletteDrawingTool hitTestInsets](self, "hitTestInsets");
    v24 = v18 + v23;
    v27 = v20 - (v25 + v26);
    v34.size.height = v22 - (v23 + v28);
    v34.origin.x = v16 + v25;
    v34.origin.y = v24;
    v34.size.width = v27;
    v33.x = x;
    v33.y = y;
    v29 = CGRectContainsPoint(v34, v33);
  }
  v30 = v29;

  return v30;
}

- (void)setSelected:(BOOL)a3
{
  -[PKSqueezePaletteDrawingTool setSelected:animated:completion:](self, a3, 0, 0);
}

- (void)setSelected:(int)a3 animated:(void *)a4 completion:
{
  id v7;
  _QWORD v8[5];
  objc_super v9;

  v7 = a4;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PKSqueezePaletteDrawingTool;
    objc_msgSendSuper2(&v9, sel_setSelected_, a2);
    -[PKSqueezePaletteDrawingTool _updateUI]((uint64_t)a1);
    if (a3)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __63__PKSqueezePaletteDrawingTool_setSelected_animated_completion___block_invoke;
      v8[3] = &unk_1E7778020;
      v8[4] = a1;
      +[PKPaletteToolViewAnimation performSelectionAnimations:completion:]((uint64_t)PKPaletteToolViewAnimation, v8, v7);
    }
  }

}

uint64_t __63__PKSqueezePaletteDrawingTool_setSelected_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setTool:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Tool parameter can not be nil."), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    if (*(id *)(a1 + 824) != v4)
    {
      objc_storeStrong((id *)(a1 + 824), a2);
      objc_msgSend(*(id *)(a1 + 752), "removeFromSuperview");
      v6 = *(void **)(a1 + 752);
      *(_QWORD *)(a1 + 752) = 0;

      -[PKPaletteToolViewFactory makePaletteToolViewForTool:](*(_QWORD *)(a1 + 760), *(void **)(a1 + 824));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 752);
      *(_QWORD *)(a1 + 752) = v7;

      objc_msgSend(*(id *)(a1 + 752), "setUserInteractionEnabled:", 0);
      objc_msgSend(*(id *)(a1 + 752), "setEdgeLocation:", 4);
      objc_msgSend(*(id *)(a1 + 752), "setSelected:", 1);
      objc_msgSend(*(id *)(a1 + 752), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(a1 + 768), "addSubview:", *(_QWORD *)(a1 + 752));
      v18 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(*(id *)(a1 + 752), "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 768), "topAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      objc_msgSend(*(id *)(a1 + 752), "centerXAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 768), "centerXAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v13;
      objc_msgSend(*(id *)(a1 + 752), "widthAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToConstant:", *(double *)(a1 + 776));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateConstraints:", v16);

      -[PKSqueezePaletteDrawingTool _updateUI](a1);
    }
  }

}

- (void)setDragging:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 808) != a2)
    {
      *(_BYTE *)(a1 + 808) = a2;
      objc_msgSend(*(id *)(a1 + 800), "invalidate");
      -[PKSqueezePaletteDrawingTool _updateUI](a1);
    }
  }
}

- (uint64_t)resetPointerInteractionTransform
{
  uint64_t v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = result;
    result = objc_msgSend((id)result, "isSelected");
    if ((result & 1) == 0)
    {
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __63__PKSqueezePaletteDrawingTool_resetPointerInteractionTransform__block_invoke;
      v2[3] = &unk_1E7778020;
      v2[4] = v1;
      return objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v2);
    }
  }
  return result;
}

uint64_t __63__PKSqueezePaletteDrawingTool_resetPointerInteractionTransform__block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  -[PKSqueezePaletteDrawingTool _makeTransformForPointerInteractionVisible:](&v5, *(id **)(a1 + 32), 0);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

- (CGAffineTransform)_makeTransformForPointerInteractionVisible:(int)a3
{
  CGAffineTransform *v3;
  id WeakRetained;
  double v7;
  long double v8;
  double v9;
  long double v10;
  CGAffineTransform v11;

  v3 = result;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained(a2 + 102);
    objc_msgSend(WeakRetained, "toolAngle:", a2);
    v8 = v7;

    if (a3)
      v9 = *(double *)&PKSqueezePaletteToolHoverOffsetY;
    else
      v9 = -*(double *)&PKSqueezePaletteToolHoverOffsetY;
    *(_OWORD *)&v3->a = 0u;
    *(_OWORD *)&v3->c = 0u;
    *(_OWORD *)&v3->tx = 0u;
    objc_msgSend(a2, "transform");
    v10 = sin(v8);
    return CGAffineTransformTranslate(v3, &v11, 0.0, v10 * v9);
  }
  else
  {
    *(_OWORD *)&result->c = 0u;
    *(_OWORD *)&result->tx = 0u;
    *(_OWORD *)&result->a = 0u;
  }
  return result;
}

double __40__PKSqueezePaletteDrawingTool__updateUI__block_invoke()
{
  return *(double *)&PKSqueezePaletteHandwritingToolOverrideLabelCenterOffsetY;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PKSqueezePaletteDrawingTool *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PKSqueezePaletteDrawingTool_pointerInteraction_willEnterRegion_animator___block_invoke;
  v9[3] = &unk_1E7777C20;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(a5, "addAnimations:", v9);

}

void __75__PKSqueezePaletteDrawingTool_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  -[PKSqueezePaletteDrawingTool _makeTransformForPointerInteractionVisible:](&v4, *(id **)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PKSqueezePaletteDrawingTool *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PKSqueezePaletteDrawingTool_pointerInteraction_willExitRegion_animator___block_invoke;
  v9[3] = &unk_1E7777C20;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(a5, "addAnimations:", v9);

}

void __74__PKSqueezePaletteDrawingTool_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  -[PKSqueezePaletteDrawingTool _makeTransformForPointerInteractionVisible:](&v4, *(id **)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3B38], "systemPointerStyle", a3, a4);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_msgSend(a5, "rect", a3, a4);
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tool, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_toolTopConstraint, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_toolView, 0);
}

@end
