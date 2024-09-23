@implementation CEKSliderTickMarksView

- (CEKSliderTickMarksView)initWithFrame:(CGRect)a3
{
  CEKSliderTickMarksView *v3;
  CEKSliderTickMarksView *v4;
  _TtC13CameraEditKit14TickMarksModel *v5;
  _TtC13CameraEditKit14TickMarksModel *tickMarksModel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CEKSliderTickMarksView;
  v3 = -[CEKSliderTickMarksView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CEKSliderTickMarksView setOpaque:](v3, "setOpaque:", 0);
    -[CEKSliderTickMarksView setContentMode:](v4, "setContentMode:", 3);
    v5 = objc_alloc_init(_TtC13CameraEditKit14TickMarksModel);
    tickMarksModel = v4->_tickMarksModel;
    v4->_tickMarksModel = v5;

    -[TickMarksModel setDataSource:](v4->_tickMarksModel, "setDataSource:", v4);
    -[TickMarksModel setDelegate:](v4->_tickMarksModel, "setDelegate:", v4);
  }
  return v4;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[CEKSliderTickMarksView _shadowWidth](self, "_shadowWidth");
  v4 = v3;
  -[CEKSliderTickMarksView tickMarksModel](self, "tickMarksModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "useTickMarkLegibilityShadows") & 1) != 0)
  {
    v6 = v4;
    v7 = v4;
    v8 = v4;
  }
  else
  {
    v6 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }

  v9 = v6;
  v10 = v4;
  v11 = v7;
  v12 = v8;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (CGRect)frameForTickMarkAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[CEKSliderTickMarksView bounds](self, "bounds");
  -[CEKSliderTickMarksView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v6 = v5;
  v8 = v7;
  -[CEKSliderTickMarksView tickMarksModel](self, "tickMarksModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tickMarkWidth");
  v11 = v10;

  -[CEKSliderTickMarksView tickMarksModel](self, "tickMarksModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "xOffsetForTickMarkIndex:", a3);
  v14 = v13;

  v15 = v14;
  v16 = v6;
  v17 = v11;
  v18 = v8;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_shadowFrameForTickMarkRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CEKSliderTickMarksView _shadowWidth](self, "_shadowWidth");
  v8 = -v7;
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectInset(v9, v8, v8);
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  CGRect v27;
  CGRect v28;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[CEKSliderTickMarksView tickMarksModel](self, "tickMarksModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "useTickMarkLegibilityShadows");

  -[CEKSliderTickMarksView tickMarksModel](self, "tickMarksModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainTickMarkColor");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  -[CEKSliderTickMarksView tickMarksModel](self, "tickMarksModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryTickMarkColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[CEKSliderTickMarksView tickMarksModel](self, "tickMarksModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "tickMarksCount");

  if (v13)
  {
    for (i = 0; i != v13; ++i)
    {
      -[CEKSliderTickMarksView tickMarksModel](self, "tickMarksModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isMainTickMarkAtIndex:", i);

      -[CEKSliderTickMarksView frameForTickMarkAtIndex:](self, "frameForTickMarkAtIndex:", i);
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      if (v6)
      {
        objc_msgSend(v11, "set");
        -[CEKSliderTickMarksView _shadowFrameForTickMarkRect:](self, "_shadowFrameForTickMarkRect:", v18, v20, v22, v24);
        CGContextFillRect(CurrentContext, v27);
      }
      v25 = v26;
      if (!v16)
        v25 = v9;
      objc_msgSend(v25, "set");
      v28.origin.x = v18;
      v28.origin.y = v20;
      v28.size.width = v22;
      v28.size.height = v24;
      CGContextFillRect(CurrentContext, v28);
    }
  }

}

- (void)tickMarksModelDidChangeWidthForTickMarkCountWithModel:(id)a3
{
  id v4;

  -[CEKSliderTickMarksView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tickMarksViewDidChangeWidthForTickMarkCount:", self);

}

- (CEKSliderTickMarksDelegate)delegate
{
  return (CEKSliderTickMarksDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC13CameraEditKit14TickMarksModel)tickMarksModel
{
  return self->_tickMarksModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickMarksModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
