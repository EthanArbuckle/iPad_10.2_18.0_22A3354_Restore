@implementation AKInkSignatureView

- (AKInkSignatureView)initWithFrame:(CGRect)a3
{
  AKInkSignatureView *v3;
  AKInkSignatureView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKInkSignatureView;
  v3 = -[AKInkSignatureView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AKInkSignatureView _commonInit](v3, "_commonInit");
  return v4;
}

- (AKInkSignatureView)initWithCoder:(id)a3
{
  AKInkSignatureView *v3;
  AKInkSignatureView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKInkSignatureView;
  v3 = -[AKInkSignatureView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AKInkSignatureView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AKInkSignatureView setStrokeColor:](self, "setStrokeColor:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL IsEmpty;
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
  id v29;
  CGRect v30;

  -[AKInkSignatureView canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AKInkSignatureView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[AKInkSignatureView superview](self, "superview");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v29 = (id)v12;
      -[AKInkSignatureView window](self, "window");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_7:

        return;
      }
      v14 = (void *)v13;
      v30.origin.x = v5;
      v30.origin.y = v7;
      v30.size.width = v9;
      v30.size.height = v11;
      IsEmpty = CGRectIsEmpty(v30);

      if (!IsEmpty)
      {
        v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE3378]), "initWithFrame:", v5, v7, v9, v11);
        objc_msgSend(v29, "setDrawingPolicy:", 1);
        -[AKInkSignatureView setCanvasView:](self, "setCanvasView:", v29);
        objc_msgSend(v29, "setDelegate:", self);
        -[AKInkSignatureView tool](self, "tool");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setTool:", v16);

        -[AKInkSignatureView addSubview:](self, "addSubview:", v29);
        objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v29, "widthAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKInkSignatureView widthAnchor](self, "widthAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "constraintEqualToAnchor:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setActive:", 1);

        objc_msgSend(v29, "heightAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKInkSignatureView heightAnchor](self, "heightAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "constraintEqualToAnchor:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setActive:", 1);

        objc_msgSend(v29, "centerXAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKInkSignatureView centerXAnchor](self, "centerXAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setActive:", 1);

        objc_msgSend(v29, "centerYAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKInkSignatureView centerYAnchor](self, "centerYAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "constraintEqualToAnchor:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setActive:", 1);

        goto LABEL_7;
      }
    }
  }
}

- (void)setStrokeColor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDE33B8];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithInkType:color:", *MEMORY[0x24BDE3450], v5);

  -[AKInkSignatureView setTool:](self, "setTool:", v7);
  MEMORY[0x24BEDD108](self, sel__updateTool);
}

- (void)_updateTool
{
  void *v3;
  id v4;

  -[AKInkSignatureView canvasView](self, "canvasView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AKInkSignatureView tool](self, "tool");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTool:", v3);

  }
}

- (void)clear
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AKInkSignatureView setLatestDrawing:](self, "setLatestDrawing:", 0);
  -[AKInkSignatureView canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDE3380]);
    v9 = (id)objc_opt_new();
    -[AKInkSignatureView canvasView](self, "canvasView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "drawing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithStrokes:fromDrawing:", v9, v6);
    -[AKInkSignatureView canvasView](self, "canvasView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDrawing:", v7);

  }
}

- (CGPath)copyPotracedPathAndReturnDrawing:(id *)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  AKPotrace *v12;
  AKPotrace *v13;
  const CGPath *MutableCopy;
  CGPath *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v24;

  -[AKInkSignatureView latestDrawing](self, "latestDrawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v15 = 0;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  +[AKInkRendererHelper renderDrawing:clippedToStrokeSpaceRect:scale:](AKInkRendererHelper, "renderDrawing:clippedToStrokeSpaceRect:scale:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = -[AKPotrace initWithCGImage:flipped:whiteIsInside:]([AKPotrace alloc], "initWithCGImage:flipped:whiteIsInside:", objc_msgSend(v10, "akCGImage"), 1, 0);
    v13 = v12;
    if (v12)
    {
      -[AKPotrace setTurdsize:](v12, "setTurdsize:", 0);
      MutableCopy = CGPathCreateMutableCopy(-[AKPotrace CGPath](v13, "CGPath"));
      v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v24.a = *MEMORY[0x24BDBD8B8];
      v18 = *(_OWORD *)&v24.a;
      *(_OWORD *)&v24.c = v19;
      *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      v17 = *(_OWORD *)&v24.tx;
      CGAffineTransformMakeScale(&t2, 0.333333333, 0.333333333);
      *(_OWORD *)&t1.a = v18;
      *(_OWORD *)&t1.c = v19;
      *(_OWORD *)&t1.tx = v17;
      CGAffineTransformConcat(&v24, &t1, &t2);
      CGAffineTransformMakeTranslation(&v21, v7, v9);
      v20 = v24;
      CGAffineTransformConcat(&t1, &v20, &v21);
      v24 = t1;
      v15 = (CGPath *)MEMORY[0x22E2C0A54](MutableCopy, &v24);
      CGPathRelease(MutableCopy);
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  if (a3)
LABEL_11:
    *a3 = (id)objc_msgSend(v5, "copy", v17, v18, v19);
LABEL_12:

  return v15;
}

- (void)canvasViewDrawingDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "drawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    -[AKInkSignatureView setLatestDrawing:](self, "setLatestDrawing:", v4);
    objc_msgSend(v6, "strokes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKInkSignatureView setHasStrokes:](self, "setHasStrokes:", objc_msgSend(v5, "count") != 0);

    v4 = v6;
  }

}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (BOOL)hasStrokes
{
  return self->_hasStrokes;
}

- (void)setHasStrokes:(BOOL)a3
{
  self->_hasStrokes = a3;
}

- (PKCanvasView)canvasView
{
  return (PKCanvasView *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCanvasView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (PKTool)tool
{
  return (PKTool *)objc_getProperty(self, a2, 440, 1);
}

- (void)setTool:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (PKDrawing)latestDrawing
{
  return (PKDrawing *)objc_getProperty(self, a2, 448, 1);
}

- (void)setLatestDrawing:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDrawing, 0);
  objc_storeStrong((id *)&self->_tool, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
