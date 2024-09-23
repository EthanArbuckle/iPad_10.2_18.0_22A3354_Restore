@implementation PKAdornmentView

- (PKAdornmentView)initWithFrame:(CGRect)a3 strokeSelection:(id)a4 selectionController:(id)a5 selectionType:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  PKAdornmentView *v16;
  PKAdornmentView *v17;
  id *p_selectionController;
  id v19;
  id WeakRetained;
  uint64_t v21;
  PKSelectionRendering *selectionRenderer;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PKAdornmentView;
  v16 = -[PKAdornmentView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_strokeSelection, a4);
    p_selectionController = (id *)&v17->_selectionController;
    objc_storeWeak((id *)&v17->_selectionController, v15);
    if (+[PKAdornmentView classForSelectionType:](PKAdornmentView, "classForSelectionType:", a6))
    {
      v19 = objc_alloc(+[PKAdornmentView classForSelectionType:](PKAdornmentView, "classForSelectionType:", a6));
      WeakRetained = objc_loadWeakRetained(p_selectionController);
      v21 = objc_msgSend(v19, "initWithStrokeSelection:renderingDelegate:", v14, WeakRetained);
      selectionRenderer = v17->_selectionRenderer;
      v17->_selectionRenderer = (PKSelectionRendering *)v21;

      -[PKSelectionRendering _setupSelectionAdornment](v17->_selectionRenderer, "_setupSelectionAdornment");
      -[PKAdornmentView layer](v17, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionRendering adornmentLayer](v17->_selectionRenderer, "adornmentLayer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addSublayer:", v24);

    }
    v25 = (id *)objc_loadWeakRetained(p_selectionController);
    -[PKAdornmentView strokeSelection](v17, "strokeSelection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:](v25, v26, 0);

  }
  return v17;
}

+ (Class)classForSelectionType:(int64_t)a3
{
  void *v3;

  if (a3 == 6)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (BOOL)containsPoint:(CGPoint)a3 forInputType:(int64_t)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[PKAdornmentView bounds](self, "bounds", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  BOOL v13;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PKAdornmentView bounds](self, "bounds");
  if (v9 < 44.0 || v8 < 44.0)
  {
    -[PKAdornmentView bounds](self, "bounds");
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v15.x = x;
    v15.y = y;
    v13 = CGRectContainsPoint(v16, v15);
  }
  else
  {
    objc_msgSend(v7, "touchesForView:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PKAdornmentView containsPoint:forInputType:](self, "containsPoint:forInputType:", objc_msgSend(v12, "type") == 2, x, y);
  }

  return v13;
}

- (void)setStrokeSelection:(id)a3
{
  PKStrokeSelection *v4;
  PKStrokeSelection *strokeSelection;

  v4 = (PKStrokeSelection *)a3;
  -[PKStrokeSelection setStrokeImageWithHighlight:](v4, "setStrokeImageWithHighlight:", self->_strokeSelectionImage);
  strokeSelection = self->_strokeSelection;
  self->_strokeSelection = v4;

}

- (void)setStrokeSelectionImage:(id)a3
{
  PKStrokeSelectionImage **p_strokeSelectionImage;
  PKImageView *v6;
  void *v7;
  PKImageView *v8;
  PKImageView *strokeSelectionImageView;
  PKImageView *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;

  v17 = a3;
  p_strokeSelectionImage = &self->_strokeSelectionImage;
  objc_storeStrong((id *)&self->_strokeSelectionImage, a3);
  -[PKStrokeSelection setStrokeImageWithHighlight:](self->_strokeSelection, "setStrokeImageWithHighlight:", v17);
  if (!self->_strokeSelectionImageView)
  {
    v6 = [PKImageView alloc];
    -[PKStrokeSelectionImage image](*p_strokeSelectionImage, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKImageView initWithImage:](v6, "initWithImage:", v7);
    strokeSelectionImageView = self->_strokeSelectionImageView;
    self->_strokeSelectionImageView = v8;

    -[PKImageView setOpaque:](self->_strokeSelectionImageView, "setOpaque:", 0);
    v10 = self->_strokeSelectionImageView;
    -[PKAdornmentView bounds](self, "bounds");
    -[PKImageView setFrame:](v10, "setFrame:");
    -[PKAdornmentView addSubview:](self, "addSubview:", self->_strokeSelectionImageView);
    -[PKImageView setHidden:](self->_strokeSelectionImageView, "setHidden:", 1);
  }
  objc_msgSend(v17, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView setImage:](self->_strokeSelectionImageView, "setImage:", v11);

  -[PKStrokeSelectionImage addImage](*p_strokeSelectionImage, "addImage");
  v12 = objc_claimAutoreleasedReturnValue();
  -[PKImageView setAddImage:](self->_strokeSelectionImageView, "setAddImage:", v12);

  -[PKStrokeSelectionImage mulImage](*p_strokeSelectionImage, "mulImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView setMulImage:](self->_strokeSelectionImageView, "setMulImage:", v13);

  objc_msgSend(v17, "config");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageViewBounds");
  LOBYTE(v12) = CGRectIsNull(v18);

  if ((v12 & 1) == 0)
  {
    -[PKAdornmentView superview](self, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "config");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageViewBounds");
    objc_msgSend(v15, "convertRect:toView:", self);
    -[PKImageView setFrame:](self->_strokeSelectionImageView, "setFrame:");

  }
}

- (void)_liftStrokesOutOfTiledView
{
  id *WeakRetained;
  void *v4;
  _QWORD v5[5];

  self->_isInteracting = 1;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKAdornmentView strokeSelection](self, "strokeSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PKAdornmentView__liftStrokesOutOfTiledView__block_invoke;
  v5[3] = &unk_1E7778020;
  v5[4] = self;
  -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:](WeakRetained, v4, v5);

}

void __45__PKAdornmentView__liftStrokesOutOfTiledView__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 424))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 440));
    objc_msgSend(*(id *)(a1 + 32), "strokeSelection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "strokes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PKStroke copyStrokes:hidden:](PKStroke, "copyStrokes:hidden:", v6, 1);
    objc_msgSend(*(id *)(a1 + 32), "strokeSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "drawing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__PKAdornmentView__liftStrokesOutOfTiledView__block_invoke_2;
    v10[3] = &unk_1E7778020;
    v10[4] = *(_QWORD *)(a1 + 32);
    -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)WeakRetained, v7, v9, v10);

  }
}

uint64_t __45__PKAdornmentView__liftStrokesOutOfTiledView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideStrokeSelectionImageView:animated:", 0, 0);
}

- (void)_putStrokesBackIntoTiledViewAnimated:(BOOL)a3
{
  id WeakRetained;
  _QWORD v5[5];

  self->_isInteracting = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PKAdornmentView__putStrokesBackIntoTiledViewAnimated___block_invoke;
  v5[3] = &unk_1E7778020;
  v5[4] = self;
  -[PKSelectionController commitStrokesWithCompletion:]((uint64_t)WeakRetained, v5);

}

uint64_t __56__PKAdornmentView__putStrokesBackIntoTiledViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideStrokeSelectionImageView:animated:", 1, 0);
}

- (void)hideStrokeImageView
{
  -[PKImageView setHidden:](self->_strokeSelectionImageView, "setHidden:", 1);
}

- (void)_hideStrokeSelectionImageView:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  PKImageView *strokeSelectionImageView;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  PKAdornmentView *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  PKAdornmentView *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  if (a3)
  {
    if (a4)
    {
      v5 = (void *)MEMORY[0x1E0DC3F10];
      strokeSelectionImageView = self->_strokeSelectionImageView;
      v13 = self;
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_3;
      v17 = &unk_1E7778020;
      v18 = self;
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_4;
      v12 = &unk_1E7778650;
      v7 = &v14;
      v8 = &v9;
LABEL_6:
      objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", strokeSelectionImageView, 5242880, v7, v8, 0.0, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      return;
    }
    -[PKAdornmentView hideStrokeImageView](self, "hideStrokeImageView");
  }
  else
  {
    if (a4)
    {
      -[PKImageView setHidden:](self->_strokeSelectionImageView, "setHidden:", 0);
      -[PKImageView setAlpha:](self->_strokeSelectionImageView, "setAlpha:", 0.0);
      strokeSelectionImageView = self->_strokeSelectionImageView;
      v5 = (void *)MEMORY[0x1E0DC3F10];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke;
      v20[3] = &unk_1E7778020;
      v20[4] = self;
      v7 = v20;
      v8 = 0;
      goto LABEL_6;
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_2;
    v19[3] = &unk_1E7778020;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v19);
  }
}

uint64_t __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

uint64_t __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setHidden:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

uint64_t __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
}

uint64_t __58__PKAdornmentView__hideStrokeSelectionImageView_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideStrokeImageView");
}

- (PKStrokeSelection)strokeSelection
{
  return self->_strokeSelection;
}

- (PKSelectionController)selectionController
{
  return (PKSelectionController *)objc_loadWeakRetained((id *)&self->_selectionController);
}

- (void)setSelectionController:(id)a3
{
  objc_storeWeak((id *)&self->_selectionController, a3);
}

- (PKSelectionRendering)selectionRenderer
{
  return self->_selectionRenderer;
}

- (void)setSelectionRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionRenderer, a3);
}

- (PKStrokeSelectionImage)strokeSelectionImage
{
  return self->_strokeSelectionImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeSelectionImage, 0);
  objc_storeStrong((id *)&self->_selectionRenderer, 0);
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_strokeSelection, 0);
  objc_storeStrong((id *)&self->_strokeSelectionImageView, 0);
}

@end
