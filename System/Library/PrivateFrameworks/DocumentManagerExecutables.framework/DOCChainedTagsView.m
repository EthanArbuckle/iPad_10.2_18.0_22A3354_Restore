@implementation DOCChainedTagsView

- (DOCChainedTagsView)init
{
  DOCChainedTagsView *v2;
  DOCChainedTagsView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCChainedTagsView;
  v2 = -[DOCChainedTagsView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DOCChainedTagsView doc_commonInit](v2, "doc_commonInit");
  return v3;
}

- (DOCChainedTagsView)initWithFrame:(CGRect)a3
{
  DOCChainedTagsView *v3;
  DOCChainedTagsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCChainedTagsView;
  v3 = -[DOCChainedTagsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DOCChainedTagsView doc_commonInit](v3, "doc_commonInit");
  return v4;
}

- (void)setSelectionOutlineColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_selectionOutlineColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectionOutlineColor, a3);
    -[DOCChainedTagsView _reloadRenderingRequest](self, "_reloadRenderingRequest");
    v5 = v6;
  }

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[DOCChainedTagsView renderingRequest](self, "renderingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[DOCTagRenderer shared](DOCTagRenderer, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeOfTagContentForRenderingRequest:", v2);
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  void *v3;
  id v4;

  -[DOCChainedTagsView renderingRequest](self, "renderingRequest", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[DOCTagRenderer shared](DOCTagRenderer, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "renderInUncacheableContext:request:", UIGraphicsGetCurrentContext(), v4);

  }
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
  -[DOCChainedTagsView _reloadRenderingRequest](self, "_reloadRenderingRequest");
}

- (void)_reloadRenderingRequest
{
  DOCTagRenderingRequest *v3;
  void *v4;
  DOCTagRenderingRequest *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  DOCTagRenderingRequest *renderingRequest;
  DOCTagRenderingRequest *v22;

  v22 = self->_renderingRequest;
  +[DOCTagRenderingRequest requestForChainedTags:tagDimension:](DOCTagRenderingRequest, "requestForChainedTags:tagDimension:", self->_tags, self->_tagDimension);
  v3 = (DOCTagRenderingRequest *)objc_claimAutoreleasedReturnValue();
  -[DOCChainedTagsView knockOutBorderWidth](self, "knockOutBorderWidth");
  -[DOCTagRenderingRequest setKnockOutBorderWidth:](v3, "setKnockOutBorderWidth:");
  -[DOCTagRenderingRequest setLayoutDirection:](v3, "setLayoutDirection:", -[DOCChainedTagsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"));
  -[DOCTagRenderingRequest setSpacingType:](v3, "setSpacingType:", self->_spacing);
  -[DOCChainedTagsView selectionOutlineColor](self, "selectionOutlineColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagRenderingRequest setSelectionOutlineColor:](v3, "setSelectionOutlineColor:", v4);

  v5 = v22;
  if (v22)
  {
    +[DOCTagRenderer shared](DOCTagRenderer, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeOfTagContentForRenderingRequest:", v22);
    v8 = v7;
    v10 = v9;

    v5 = v22;
  }
  else
  {
    v8 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  -[DOCTagRenderingRequest fillColors](v5, "fillColors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagRenderingRequest selectionOutlineColor](v22, "selectionOutlineColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[DOCTagRenderer shared](DOCTagRenderer, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeOfTagContentForRenderingRequest:", v3);
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v15 = *MEMORY[0x24BDBF148];
    v17 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  -[DOCTagRenderingRequest fillColors](v3, "fillColors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagRenderingRequest selectionOutlineColor](v3, "selectionOutlineColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  renderingRequest = self->_renderingRequest;
  self->_renderingRequest = v3;

  if (v8 != v15 || v10 != v17)
    -[DOCChainedTagsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  if ((objc_msgSend(v11, "isEqual:", v18) & 1) == 0)
    -[DOCChainedTagsView setNeedsDisplay](self, "setNeedsDisplay");
  if ((objc_msgSend(v12, "isEqual:", v19) & 1) == 0)
    -[DOCChainedTagsView setNeedsDisplay](self, "setNeedsDisplay");

}

- (UIColor)selectionOutlineColor
{
  return self->_selectionOutlineColor;
}

- (double)knockOutBorderWidth
{
  return self->_knockOutBorderWidth;
}

- (void)setKnockOutBorderWidth:(double)a3
{
  self->_knockOutBorderWidth = a3;
}

- (void)setTagDimension:(double)a3
{
  if (self->_tagDimension != a3)
  {
    self->_tagDimension = a3;
    -[DOCChainedTagsView _reloadRenderingRequest](self, "_reloadRenderingRequest");
  }
}

- (void)setSpacing:(unint64_t)a3
{
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    -[DOCChainedTagsView _reloadRenderingRequest](self, "_reloadRenderingRequest");
  }
}

- (void)setAlignmentOffset:(CGPoint)a3
{
  self->_alignmentOffset = a3;
}

- (DOCTagRenderingRequest)renderingRequest
{
  return self->_renderingRequest;
}

- (void)doc_commonInit
{
  self->_knockOutBorderWidth = 1.0;
  self->_spacing = 0;
  -[DOCChainedTagsView _reloadRenderingRequest](self, "_reloadRenderingRequest");
}

- (DOCChainedTagsView)initWithCoder:(id)a3
{
  DOCChainedTagsView *v3;
  DOCChainedTagsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCChainedTagsView;
  v3 = -[DOCChainedTagsView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[DOCChainedTagsView doc_commonInit](v3, "doc_commonInit");
  return v4;
}

- (void)setknockOutBorderWidth:(double)a3
{
  if (self->_knockOutBorderWidth != a3)
  {
    self->_knockOutBorderWidth = a3;
    -[DOCChainedTagsView _reloadRenderingRequest](self, "_reloadRenderingRequest");
  }
}

- (void)sizeToFit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCChainedTagsView;
  -[DOCChainedTagsView sizeToFit](&v3, sel_sizeToFit);
  -[DOCChainedTagsView intrinsicContentSize](self, "intrinsicContentSize");
  -[DOCChainedTagsView frame](self, "frame");
  -[DOCChainedTagsView setFrame:](self, "setFrame:");
}

- (NSArray)tags
{
  return self->_tags;
}

- (unint64_t)spacing
{
  return self->_spacing;
}

- (double)tagDimension
{
  return self->_tagDimension;
}

- (CGPoint)alignmentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_alignmentOffset.x;
  y = self->_alignmentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRenderingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_renderingRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingRequest, 0);
  objc_storeStrong((id *)&self->_selectionOutlineColor, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

@end
