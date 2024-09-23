@implementation CKLineView

- (void)setShouldUseDarkFSMStrokeColor:(BOOL)a3
{
  self->_shouldUseDarkFSMStrokeColor = a3;
  -[CKLineView _updateReplyLineColor](self, "_updateReplyLineColor");
}

- (CKLineView)initWithFrame:(CGRect)a3
{
  CKLineView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKLineView;
  v3 = -[CKLineView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLineView setLineShapeLayer:](v3, "setLineShapeLayer:", v4);
    -[CKLineView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSublayer:", v4);

    -[CKLineView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMasksToBounds:", 0);

  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKLineView;
  -[CKLineView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_lineShapeLayer)
  {
    -[CKLineView bounds](self, "bounds");
    -[CAShapeLayer setFrame:](self->_lineShapeLayer, "setFrame:");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKLineView;
  v4 = a3;
  -[CKLineView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[CKLineView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[CKLineView _updateReplyLineColor](self, "_updateReplyLineColor");
}

- (void)_updateReplyLineColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (-[CKLineView shouldUseDarkFSMStrokeColor](self, "shouldUseDarkFSMStrokeColor"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replyLineColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v8, "CGColor");
  -[CKLineView lineShapeLayer](self, "lineShapeLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeColor:", v6);

}

- (void)addFilter:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
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

  v17 = a3;
  objc_msgSend(v17, "balloonBackdropFilters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CKLineView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    -[CKLineView backdropFilterLayer](self, "backdropFilterLayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CD2708]);
      objc_msgSend(v7, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      objc_msgSend(v7, "setGroupName:", CFSTR("FSMBackdropGroup"));
      objc_msgSend(v7, "setScale:", 0.25);
      -[CKLineView lineShapeLayer](self, "lineShapeLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMask:", v8);

      -[CKLineView bounds](self, "bounds");
      objc_msgSend(v7, "setFrame:");
      -[CKLineView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", v7);
      -[CKLineView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertSublayer:atIndex:", v7, 0);

    }
    objc_msgSend(v17, "balloonBackdropFilters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v10);

    -[CKLineView lineShapeLayer](self, "lineShapeLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLineView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMask:", v11);

  }
  -[CKLineView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "balloonFilters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFilters:", v14);

  -[CKLineView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "balloonCompositingFilter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCompositingFilter:", v16);

  -[CKLineView setShouldUseDarkFSMStrokeColor:](self, "setShouldUseDarkFSMStrokeColor:", 1);
}

- (void)clearFilters
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKLineView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

  -[CKLineView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", 0);

  -[CKLineView setShouldUseDarkFSMStrokeColor:](self, "setShouldUseDarkFSMStrokeColor:", 0);
  -[CKLineView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMask:", 0);

  -[CKLineView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", 0);
  -[CKLineView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupBlending:", 1);

}

- (CABackdropLayer)backdropFilterLayer
{
  return self->_backdropFilterLayer;
}

- (void)setBackdropFilterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropFilterLayer, a3);
}

- (CAShapeLayer)lineShapeLayer
{
  return self->_lineShapeLayer;
}

- (void)setLineShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_lineShapeLayer, a3);
}

- (BOOL)shouldUseDarkFSMStrokeColor
{
  return self->_shouldUseDarkFSMStrokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropFilterLayer, 0);
}

@end
