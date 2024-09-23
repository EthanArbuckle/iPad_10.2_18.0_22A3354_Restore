@implementation PKTextInputDebugDrawingEntryCell

- (void)setDrawing:(id)a3
{
  PKDrawing *v5;
  PKDrawing *v6;

  v5 = (PKDrawing *)a3;
  if (self->_drawing != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_drawing, a3);
    -[PKTextInputDebugDrawingEntryCell _updateDrawingView](self, "_updateDrawingView");
    v5 = v6;
  }

}

- (void)_updateDrawingView
{
  id v3;
  UIImageView *v4;
  UIImageView *drawingImageView;
  void *v6;
  double v7;
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
  id *v18;
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
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  if (!self->_drawingImageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    drawingImageView = self->_drawingImageView;
    self->_drawingImageView = v4;

    -[PKTextInputDebugDrawingEntryCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_drawingImageView);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_drawingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v7) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_drawingImageView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    v26 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](self->_drawingImageView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugDrawingEntryCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 10.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v29;
    -[UIImageView trailingAnchor](self->_drawingImageView, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugDrawingEntryCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v25, -10.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v24;
    -[UIImageView topAnchor](self->_drawingImageView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugDrawingEntryCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v9, 10.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v10;
    -[UIImageView bottomAnchor](self->_drawingImageView, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugDrawingEntryCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -10.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v15);

  }
  -[PKTextInputDebugDrawingEntryCell drawing](self, "drawing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[PKMetalUtility defaultDevice](PKMetalUtility, "defaultDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v17);
      v18 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKMetalResourceHandler strokeRenderCache](v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKLRUCache removeAllObjects]((uint64_t)v19);

    }
    -[PKTextInputDebugDrawingEntryCell drawing](self, "drawing");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugDrawingEntryCell drawing](self, "drawing");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v20, "imageFromRect:scale:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  -[UIImageView setImage:](self->_drawingImageView, "setImage:", v22);

}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_drawingImageView, 0);
}

@end
