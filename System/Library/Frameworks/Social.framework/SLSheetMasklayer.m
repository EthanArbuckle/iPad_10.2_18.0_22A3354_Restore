@implementation SLSheetMasklayer

- (SLSheetMasklayer)initWithBackgroundColor:(id)a3 cornerRadius:(double)a4
{
  id v7;
  SLSheetMasklayer *v8;
  uint64_t v9;
  CALayer *topLayer;
  uint64_t v11;
  CALayer *leftLayer;
  uint64_t v13;
  CALayer *bottomLayer;
  uint64_t v15;
  CALayer *rightLayer;
  uint64_t v17;
  _SLSheetMaskLayer *sheetMaskLayer;
  id v19;
  void *v20;
  id v21;
  id *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id *v30;
  objc_super v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SLSheetMasklayer;
  v8 = -[SLSheetMasklayer init](&v31, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v9 = objc_claimAutoreleasedReturnValue();
    topLayer = v8->_topLayer;
    v8->_topLayer = (CALayer *)v9;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    leftLayer = v8->_leftLayer;
    v8->_leftLayer = (CALayer *)v11;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v13 = objc_claimAutoreleasedReturnValue();
    bottomLayer = v8->_bottomLayer;
    v8->_bottomLayer = (CALayer *)v13;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v15 = objc_claimAutoreleasedReturnValue();
    rightLayer = v8->_rightLayer;
    v8->_rightLayer = (CALayer *)v15;

    +[_SLSheetMaskLayer layer](_SLSheetMaskLayer, "layer");
    v17 = objc_claimAutoreleasedReturnValue();
    sheetMaskLayer = v8->_sheetMaskLayer;
    v8->_sheetMaskLayer = (_SLSheetMaskLayer *)v17;

    objc_storeStrong((id *)&v8->_clipBackgroundColor, a3);
    v8->_clipCornerRadius = a4;
    objc_storeStrong((id *)&v8->_backgroundColor, a3);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[SLSheetMasklayer setBackgroundColor:](v8, "setBackgroundColor:", objc_msgSend(v19, "CGColor"));

    v32[0] = v8->_topLayer;
    v32[1] = v8->_leftLayer;
    v32[2] = v8->_bottomLayer;
    v32[3] = v8->_rightLayer;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __57__SLSheetMasklayer_initWithBackgroundColor_cornerRadius___block_invoke;
    v28[3] = &unk_1E7590B10;
    v21 = v7;
    v29 = v21;
    v22 = v8;
    v30 = v22;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v28);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v22[9];
    v22[9] = (id)v23;

    objc_msgSend(v22[9], "removeAllAnimations");
    v25 = objc_retainAutorelease(v21);
    objc_msgSend(v22[9], "setBackgroundColor:", objc_msgSend(v25, "CGColor"));
    -[_SLSheetMaskLayer setBounds:](v8->_sheetMaskLayer, "setBounds:", 0.0, 0.0, 200.0, 200.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scale");
    -[_SLSheetMaskLayer setContentsScale:](v8->_sheetMaskLayer, "setContentsScale:");

    -[_SLSheetMaskLayer setContentsCenter:](v8->_sheetMaskLayer, "setContentsCenter:", 0.5, 0.5, 0.100000001, 0.100000001);
    -[_SLSheetMaskLayer setClipBackgroundColor:](v8->_sheetMaskLayer, "setClipBackgroundColor:", v25);
    -[_SLSheetMaskLayer setClipCornerRadius:](v8->_sheetMaskLayer, "setClipCornerRadius:", a4);
    -[_SLSheetMaskLayer removeAllAnimations](v8->_sheetMaskLayer, "removeAllAnimations");
    objc_msgSend(v22, "addSublayer:", v8->_sheetMaskLayer);
    objc_msgSend(v22, "removeAllAnimations");

  }
  return v8;
}

void __57__SLSheetMasklayer_initWithBackgroundColor_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = objc_retainAutorelease(*(id *)(a1 + 32));
  v5 = a2;
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
  objc_msgSend(v5, "removeAllAnimations");
  objc_msgSend(*(id *)(a1 + 40), "addSublayer:", v5);

}

- (void)removeAllAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLSheetMasklayer;
  -[SLSheetMasklayer removeAllAnimations](&v3, sel_removeAllAnimations);
  -[CALayer removeAllAnimations](self->_topLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_leftLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_bottomLayer, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_rightLayer, "removeAllAnimations");
  -[_SLSheetMaskLayer removeAllAnimations](self->_sheetMaskLayer, "removeAllAnimations");
}

- (void)removeSheetCutout
{
  -[_SLSheetMaskLayer removeFromSuperlayer](self->_sheetMaskLayer, "removeFromSuperlayer");
  -[_SLSheetMaskLayer frame](self->_sheetMaskLayer, "frame");
  -[CALayer setFrame:](self->_solidSheetMaskLayer, "setFrame:");
  -[SLSheetMasklayer addSublayer:](self, "addSublayer:", self->_solidSheetMaskLayer);
}

- (void)restoreSheetCutout
{
  -[CALayer frame](self->_solidSheetMaskLayer, "frame");
  -[_SLSheetMaskLayer setFrame:](self->_sheetMaskLayer, "setFrame:");
  -[CALayer removeFromSuperlayer](self->_solidSheetMaskLayer, "removeFromSuperlayer");
  -[SLSheetMasklayer addSublayer:](self, "addSublayer:", self->_sheetMaskLayer);
}

- (void)animateSheetMaskFromOldSheetFrame:(CGRect)a3 toSheetFrame:(CGRect)a4 duration:(double)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  double v48;
  CALayer *leftLayer;
  CALayer *rightLayer;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  double v64;
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[7];

  v69[5] = *MEMORY[0x1E0C80C00];
  -[SLSheetMasklayer frame](self, "frame");
  -[SLSheetMasklayer updateMaskWithBounds:maskRect:](self, "updateMaskWithBounds:maskRect:");
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer position](self->_topLayer, "position");
  objc_msgSend(v6, "valueWithCGPoint:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer position](self->_leftLayer, "position");
  objc_msgSend(v8, "valueWithCGPoint:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v9;
  v10 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer position](self->_bottomLayer, "position");
  objc_msgSend(v10, "valueWithCGPoint:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v11;
  v12 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer position](self->_rightLayer, "position");
  objc_msgSend(v12, "valueWithCGPoint:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v13;
  v14 = (void *)MEMORY[0x1E0CB3B18];
  -[_SLSheetMaskLayer position](self->_sheetMaskLayer, "position");
  objc_msgSend(v14, "valueWithCGPoint:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer bounds](self->_topLayer, "bounds");
  objc_msgSend(v16, "valueWithCGRect:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v17;
  v18 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer bounds](self->_leftLayer, "bounds");
  objc_msgSend(v18, "valueWithCGRect:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v19;
  v20 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer bounds](self->_bottomLayer, "bounds");
  objc_msgSend(v20, "valueWithCGRect:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v21;
  v22 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer bounds](self->_rightLayer, "bounds");
  objc_msgSend(v22, "valueWithCGRect:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v68[3] = v23;
  v24 = (void *)MEMORY[0x1E0CB3B18];
  -[_SLSheetMaskLayer bounds](self->_sheetMaskLayer, "bounds");
  objc_msgSend(v24, "valueWithCGRect:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 5);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLSheetMasklayer frame](self, "frame");
  -[SLSheetMasklayer updateMaskWithBounds:maskRect:](self, "updateMaskWithBounds:maskRect:");
  v26 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer position](self->_topLayer, "position");
  objc_msgSend(v26, "valueWithCGPoint:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v27;
  v28 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer position](self->_leftLayer, "position");
  objc_msgSend(v28, "valueWithCGPoint:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v29;
  v30 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer position](self->_bottomLayer, "position");
  objc_msgSend(v30, "valueWithCGPoint:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v31;
  v32 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer position](self->_rightLayer, "position");
  objc_msgSend(v32, "valueWithCGPoint:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v33;
  v34 = (void *)MEMORY[0x1E0CB3B18];
  -[_SLSheetMaskLayer position](self->_sheetMaskLayer, "position");
  objc_msgSend(v34, "valueWithCGPoint:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v67[4] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 5);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer bounds](self->_topLayer, "bounds");
  objc_msgSend(v36, "valueWithCGRect:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v37;
  v38 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer bounds](self->_leftLayer, "bounds");
  objc_msgSend(v38, "valueWithCGRect:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v39;
  v40 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer bounds](self->_bottomLayer, "bounds");
  objc_msgSend(v40, "valueWithCGRect:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v41;
  v42 = (void *)MEMORY[0x1E0CB3B18];
  -[CALayer bounds](self->_rightLayer, "bounds");
  objc_msgSend(v42, "valueWithCGRect:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v43;
  v44 = (void *)MEMORY[0x1E0CB3B18];
  -[_SLSheetMaskLayer bounds](self->_sheetMaskLayer, "bounds");
  objc_msgSend(v44, "valueWithCGRect:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  UIAnimationDragCoefficient();
  v48 = v47 * a5;
  leftLayer = self->_leftLayer;
  v65[0] = self->_topLayer;
  v65[1] = leftLayer;
  rightLayer = self->_rightLayer;
  v65[2] = self->_bottomLayer;
  v65[3] = rightLayer;
  v65[4] = self->_sheetMaskLayer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __76__SLSheetMasklayer_animateSheetMaskFromOldSheetFrame_toSheetFrame_duration___block_invoke;
  v59[3] = &unk_1E7590B38;
  v64 = v48;
  v60 = v58;
  v61 = v56;
  v62 = v57;
  v63 = v46;
  v52 = v46;
  v53 = v57;
  v54 = v56;
  v55 = v58;
  objc_msgSend(v51, "enumerateObjectsUsingBlock:", v59);

}

void __76__SLSheetMasklayer_animateSheetMaskFromOldSheetFrame_toSheetFrame_duration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = (void *)MEMORY[0x1E0CD2710];
  v6 = a2;
  objc_msgSend(v5, "animationWithKeyPath:", CFSTR("position"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDuration:", *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v7);

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setToValue:", v8);

  v9 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v10);

  objc_msgSend(v6, "addAnimation:forKey:", v17, 0);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CGPointValue");
  objc_msgSend(v6, "setPosition:");

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDuration:", *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", v13);

  objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToValue:", v14);

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimingFunction:", v15);

  objc_msgSend(v6, "addAnimation:forKey:", v12, 0);
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "CGRectValue");
  objc_msgSend(v6, "setBounds:");

}

- (void)updateMaskWithBounds:(CGRect)a3 maskRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double MaxX;
  double MaxY;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (!CGRectIsNull(a4))
  {
    v19.origin.x = v11;
    v19.origin.y = v10;
    v19.size.width = v9;
    v19.size.height = v8;
    if (!CGRectEqualToRect(self->_lastBounds, v19)
      || (v20.origin.x = x,
          v20.origin.y = y,
          v20.size.width = width,
          v20.size.height = height,
          !CGRectEqualToRect(self->_lastMaskRect, v20)))
    {
      self->_lastMaskRect.origin.x = x;
      self->_lastMaskRect.origin.y = y;
      self->_lastMaskRect.size.width = width;
      self->_lastMaskRect.size.height = height;
      self->_lastBounds.origin.x = v11;
      self->_lastBounds.origin.y = v10;
      self->_lastBounds.size.width = v9;
      self->_lastBounds.size.height = v8;
      -[SLSheetMasklayer setFrame:](self, "setFrame:", v11, v10, v9, v8);
      -[CALayer setFrame:](self->_leftLayer, "setFrame:", 0.0, 0.0, x, v8);
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      MaxX = CGRectGetMaxX(v15);
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      -[CALayer setFrame:](self->_rightLayer, "setFrame:", MaxX, 0.0, v9 - CGRectGetMaxX(v16), v8);
      -[CALayer setFrame:](self->_topLayer, "setFrame:", x, 0.0, width, y);
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      MaxY = CGRectGetMaxY(v17);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      -[CALayer setFrame:](self->_bottomLayer, "setFrame:", x, MaxY, width, v8 - CGRectGetMaxY(v18));
      -[_SLSheetMaskLayer setFrame:](self->_sheetMaskLayer, "setFrame:", x, y, width, height);
      -[_SLSheetMaskLayer setNeedsDisplay](self->_sheetMaskLayer, "setNeedsDisplay");
    }
  }
}

- (double)clipCornerRadius
{
  return self->_clipCornerRadius;
}

- (void)setClipCornerRadius:(double)a3
{
  self->_clipCornerRadius = a3;
}

- (UIColor)clipBackgroundColor
{
  return self->_clipBackgroundColor;
}

- (void)setClipBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_clipBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_solidSheetMaskLayer, 0);
  objc_storeStrong((id *)&self->_sheetMaskLayer, 0);
  objc_storeStrong((id *)&self->_rightLayer, 0);
  objc_storeStrong((id *)&self->_bottomLayer, 0);
  objc_storeStrong((id *)&self->_leftLayer, 0);
  objc_storeStrong((id *)&self->_topLayer, 0);
}

@end
