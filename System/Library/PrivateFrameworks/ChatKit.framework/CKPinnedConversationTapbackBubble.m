@implementation CKPinnedConversationTapbackBubble

- (CKPinnedConversationTapbackBubble)initWithActivityItem:(id)a3
{
  id v5;
  CKPinnedConversationTapbackBubble *v6;
  CKPinnedConversationTapbackBubble *v7;
  CKPinnedConversationActivityItemViewShadowLayer *v8;
  CKPinnedConversationActivityItemViewShadowLayer *broadShadowLayer;
  CKPinnedConversationActivityItemViewShadowLayer *v10;
  CKPinnedConversationActivityItemViewShadowLayer *tightShadowLayer;
  CKPinnedConversationActivityItemViewBackdropLayer *v12;
  CKPinnedConversationActivityItemViewBackdropLayer *backdropLayer;
  CAShapeLayer *v14;
  CAShapeLayer *backdropMaskShapeLayer;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKPinnedConversationTapbackBubble;
  v6 = -[CKPinnedConversationTapbackBubble init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tapbackActivityItem, a3);
    v8 = -[CKPinnedConversationActivityItemViewShadowLayer initWithShadowType:]([CKPinnedConversationActivityItemViewShadowLayer alloc], "initWithShadowType:", 0);
    broadShadowLayer = v7->_broadShadowLayer;
    v7->_broadShadowLayer = v8;

    v10 = -[CKPinnedConversationActivityItemViewShadowLayer initWithShadowType:]([CKPinnedConversationActivityItemViewShadowLayer alloc], "initWithShadowType:", 1);
    tightShadowLayer = v7->_tightShadowLayer;
    v7->_tightShadowLayer = v10;

    v12 = objc_alloc_init(CKPinnedConversationActivityItemViewBackdropLayer);
    backdropLayer = v7->_backdropLayer;
    v7->_backdropLayer = v12;

    v14 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    backdropMaskShapeLayer = v7->_backdropMaskShapeLayer;
    v7->_backdropMaskShapeLayer = v14;

    -[CKPinnedConversationActivityItemViewBackdropLayer setMask:](v7->_backdropLayer, "setMask:", v7->_backdropMaskShapeLayer);
    -[CKPinnedConversationTapbackBubble _updateUserInterfaceStyles](v7, "_updateUserInterfaceStyles");
    -[CKPinnedConversationTapbackBubble layer](v7, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v7->_broadShadowLayer);

    -[CKPinnedConversationTapbackBubble layer](v7, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v7->_tightShadowLayer);

    -[CKPinnedConversationTapbackBubble layer](v7, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v7->_backdropLayer);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEmojiTapbacksEnabled");

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v22 = (void *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKPinnedConversationTapbackBubble setTapbackContainerView:](v7, "setTapbackContainerView:", v22);

      -[CKPinnedConversationTapbackBubble tapbackContainerView](v7, "tapbackContainerView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPinnedConversationTapbackBubble addSubview:](v7, "addSubview:", v23);

    }
    -[CKPinnedConversationTapbackBubble _updateAcknowledgmentType](v7, "_updateAcknowledgmentType");
  }

  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
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
  double v22;
  id v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKPinnedConversationTapbackBubble;
  -[CKPinnedConversationTapbackBubble layoutSubviews](&v28, sel_layoutSubviews);
  -[CKPinnedConversationTapbackBubble bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKPinnedConversationActivityItemViewBackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  -[CAShapeLayer setFrame:](self->_backdropMaskShapeLayer, "setFrame:", v4, v6, v8, v10);
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_broadShadowLayer, "setFrame:", v4, v6, v8, v10);
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_tightShadowLayer, "setFrame:", v4, v6, v8, v10);
  -[CKPinnedConversationTapbackBubble bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  objc_msgSend((id)objc_opt_class(), "tapbackBalloonFrameForSize:flipHorizontally:flipVertically:", -[CKPinnedConversationTapbackBubble flipHorizontally](self, "flipHorizontally"), -[CKPinnedConversationTapbackBubble flipVertically](self, "flipVertically"), v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend((id)objc_opt_class(), "tapBackBubblePathForSize:tapbackBalloonFrame:flipHorizontally:flipVertically:", -[CKPinnedConversationTapbackBubble flipHorizontally](self, "flipHorizontally"), -[CKPinnedConversationTapbackBubble flipVertically](self, "flipVertically"), v12, v14, v15, v17, v19, v21);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = objc_msgSend(v23, "CGPath");
  -[CAShapeLayer setPath:](self->_backdropMaskShapeLayer, "setPath:", v24);
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowPath:](self->_broadShadowLayer, "setShadowPath:", v24);
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowPath:](self->_tightShadowLayer, "setShadowPath:", v24);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEmojiTapbacksEnabled");

  if (v26)
    -[CKPinnedConversationTapbackBubble tapbackContainerView](self, "tapbackContainerView");
  else
    -[CKPinnedConversationTapbackBubble tapbackGlyph](self, "tapbackGlyph");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v16, v18, v20, v22);

}

+ (id)tapBackBubblePathForSize:(CGSize)a3 tapbackBalloonFrame:(CGRect)a4 flipHorizontally:(BOOL)a5 flipVertically:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a6;
  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.height;
  v13 = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendPath:", v15);
  objc_msgSend((id)objc_opt_class(), "largeTailBalloonFrameForSize:flipHorizontally:flipVertically:", v7, v6, v13, v12);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendPath:", v16);
  objc_msgSend((id)objc_opt_class(), "smallTailBalloonFrameForSize:flipHorizontally:flipVertically:", v7, v6, v13, v12);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendPath:", v17);

  return v14;
}

- (double)activityItemToContactItemVerticalOverlap
{
  return 3.0;
}

- (BOOL)supportsActivityItemViewContentScale
{
  return 0;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 0;
}

- (void)setAcknowledgmentType:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[CKPinnedConversationTapbackBubble tapbackGlyph](self, "tapbackGlyph");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[CKPinnedConversationTapbackBubble tapbackGlyph](self, "tapbackGlyph"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "acknowledgmentType"),
        v7,
        v6,
        v8 != a3))
  {
    -[CKPinnedConversationTapbackBubble tapbackGlyph](self, "tapbackGlyph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    +[CKAcknowledgmentGlyphView glyphViewForAcknowledgmentType:glyphColor:](CKAcknowledgmentGlyphView, "glyphViewForAcknowledgmentType:glyphColor:", a3, objc_msgSend((id)objc_opt_class(), "colorTypeForTapBack:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationTapbackBubble setTapbackGlyph:](self, "setTapbackGlyph:", v10);

    -[CKPinnedConversationTapbackBubble tapbackGlyph](self, "tapbackGlyph");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationTapbackBubble addSubview:](self, "addSubview:", v11);

    -[CKPinnedConversationTapbackBubble setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)acknowledgmentType
{
  void *v2;
  int64_t v3;

  -[CKPinnedConversationTapbackBubble tapbackGlyph](self, "tapbackGlyph");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "acknowledgmentType");

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "sizeThatFits:flipHorizontally:flipVertically:", -[CKPinnedConversationTapbackBubble flipHorizontally](self, "flipHorizontally"), -[CKPinnedConversationTapbackBubble flipVertically](self, "flipVertically"), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double height;
  double width;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat x;
  CGFloat v25;
  double MaxY;
  double v27;
  double v28;
  double MinY;
  double v30;
  double v31;
  double MaxX;
  double v33;
  double v34;
  double MinX;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  CGFloat y;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat rect;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGSize result;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v5 = a5;
  v6 = a4;
  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB558], 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  v12 = v11 * 2.5;
  if (v12 < height)
    height = v12;
  objc_msgSend((id)objc_opt_class(), "tapbackBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  v51 = v14;
  v52 = v13;
  v54 = v15;
  v42 = v16;
  objc_msgSend((id)objc_opt_class(), "largeTailBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  v18 = v17;
  v47 = v19;
  v48 = v17;
  v20 = v19;
  v22 = v21;
  v46 = v21;
  v53 = v23;
  objc_msgSend((id)objc_opt_class(), "smallTailBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  y = v56.origin.y;
  rect = v56.size.width;
  v50 = v56.size.height;
  x = v56.origin.x;
  v41 = v56.origin.x;
  v25 = v56.size.height;
  MaxY = CGRectGetMaxY(v56);
  v57.origin.x = v18;
  v57.origin.y = v20;
  v57.size.width = v22;
  v57.size.height = v53;
  v27 = CGRectGetMaxY(v57);
  if (MaxY < v27)
    MaxY = v27;
  v58.origin.x = v52;
  v58.origin.y = v51;
  v58.size.width = v54;
  v58.size.height = v42;
  v28 = CGRectGetMaxY(v58);
  if (MaxY >= v28)
    v28 = MaxY;
  v43 = v28;
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = rect;
  v59.size.height = v25;
  MinY = CGRectGetMinY(v59);
  v60.origin.y = v47;
  v60.origin.x = v48;
  v60.size.width = v46;
  v60.size.height = v53;
  v30 = CGRectGetMinY(v60);
  if (MinY >= v30)
    MinY = v30;
  v61.origin.x = v52;
  v61.origin.y = v51;
  v61.size.width = v54;
  v61.size.height = v42;
  v31 = CGRectGetMinY(v61);
  if (MinY < v31)
    v31 = MinY;
  v44 = v43 - v31;
  v62.origin.x = v41;
  v62.origin.y = y;
  v62.size.height = v50;
  v62.size.width = rect;
  MaxX = CGRectGetMaxX(v62);
  v63.origin.x = v48;
  v63.origin.y = v47;
  v63.size.width = v46;
  v63.size.height = v53;
  v33 = CGRectGetMaxX(v63);
  if (MaxX < v33)
    MaxX = v33;
  v64.origin.x = v52;
  v64.origin.y = v51;
  v64.size.width = v54;
  v64.size.height = v42;
  v34 = CGRectGetMaxX(v64);
  if (MaxX < v34)
    MaxX = v34;
  v65.origin.x = v41;
  v65.origin.y = y;
  v65.size.width = rect;
  v65.size.height = v50;
  MinX = CGRectGetMinX(v65);
  v66.origin.x = v48;
  v66.origin.y = v47;
  v66.size.width = v46;
  v66.size.height = v53;
  v36 = CGRectGetMinX(v66);
  if (MinX >= v36)
    MinX = v36;
  v67.origin.x = v52;
  v67.origin.y = v51;
  v67.size.width = v54;
  v67.size.height = v42;
  v37 = CGRectGetMinX(v67);
  if (MinX < v37)
    v37 = MinX;
  v38 = MaxX - v37;

  v39 = v38;
  v40 = v44;
  result.height = v40;
  result.width = v39;
  return result;
}

+ (char)colorTypeForTapBack:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageAcknowledgmentPinnedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2000)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageAcknowledgmentRedColor");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "ckAcknowledgementColorTypeForColor:", v6);

  return v12;
}

+ (CGSize)tapbackBalloonSizeForSize:(CGSize)a3
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = a3.width / a3.height;
  v4 = a3.width * 0.914285714;
  v5 = a3.height * 0.8;
  if (v3 > 0.875)
    v4 = v5;
  v6 = v4;
  result.height = v6;
  result.width = v4;
  return result;
}

+ (CGSize)largeTailBalloonSizeForSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "tapbackBalloonSizeForSize:", a3.width, a3.height);
  v4 = v3 * 0.375;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)smallTailBalloonSizeForSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "largeTailBalloonSizeForSize:", a3.width, a3.height);
  v4 = v3 * 0.5;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGRect)tapbackBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v5 = a5;
  v6 = a4;
  height = a3.height;
  objc_msgSend(a1, "tapbackBalloonSizeForSize:", a3.width);
  v9 = v8;
  v11 = v10;
  v12 = v8 * 0.09375;
  v13 = 0.0;
  if (v6)
    v12 = 0.0;
  if (v5)
    v13 = height - v11;
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (CGRect)largeTailBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  v5 = a5;
  v6 = a4;
  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "largeTailBalloonSizeForSize:");
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "tapbackBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v16 * 0.09375;
  if (v6)
    v23 = CGRectGetMaxX(*(CGRect *)&v14) - (v11 - v22);
  else
    v23 = CGRectGetMinX(*(CGRect *)&v14) - v22;
  v24 = v20 * 0.71875;
  v25 = v18;
  v26 = v19;
  v27 = v20;
  v28 = v21;
  if (v5)
    v29 = CGRectGetMaxY(*(CGRect *)&v25) - v24 - v13;
  else
    v29 = v24 + CGRectGetMinY(*(CGRect *)&v25);
  v30 = v23;
  v31 = v11;
  v32 = v13;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v29;
  result.origin.x = v30;
  return result;
}

+ (CGRect)smallTailBalloonFrameForSize:(CGSize)a3 flipHorizontally:(BOOL)a4 flipVertically:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect result;

  v5 = a5;
  v6 = a4;
  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "smallTailBalloonSizeForSize:");
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "largeTailBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(a1, "tapbackBalloonFrameForSize:flipHorizontally:flipVertically:", v6, v5, width, height);
  v23 = v22 * 0.03125;
  v24 = v15;
  v25 = v17;
  v26 = v19;
  v27 = v21;
  if (v6)
    v28 = CGRectGetMinX(*(CGRect *)&v24) - (v11 - v23);
  else
    v28 = CGRectGetMaxX(*(CGRect *)&v24) - v23;
  v29 = v15;
  v30 = v17;
  v31 = v19;
  v32 = v21;
  if (v5)
    v33 = CGRectGetMinY(*(CGRect *)&v29) - (v13 - v23);
  else
    v33 = CGRectGetMaxY(*(CGRect *)&v29) - v23;
  v34 = v28;
  v35 = v11;
  v36 = v13;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v33;
  result.origin.x = v34;
  return result;
}

- (BOOL)flipHorizontally
{
  return 0;
}

- (BOOL)flipVertically
{
  return self->_originationDirection == 1;
}

- (CKPinnedConversationActivityItem)activityItem
{
  return (CKPinnedConversationActivityItem *)self->_tapbackActivityItem;
}

- (void)setActivityItem:(id)a3
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&self->_tapbackActivityItem, a3);
    -[CKPinnedConversationTapbackBubble _updateAcknowledgmentType](self, "_updateAcknowledgmentType");
  }

}

- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3
{
  if (self->_preferredTailAttachmentPointXCoordinate != a3)
  {
    self->_preferredTailAttachmentPointXCoordinate = a3;
    -[CKPinnedConversationTapbackBubble setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOriginationDirection:(int64_t)a3
{
  if (self->_originationDirection != a3)
  {
    self->_originationDirection = a3;
    -[CKPinnedConversationTapbackBubble setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGPoint)tailAttachmentPoint
{
  void *v3;
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  _BOOL4 v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MaxY;
  double v17;
  double v18;
  CGPoint result;
  CGRect v20;

  v3 = (void *)objc_opt_class();
  -[CKPinnedConversationTapbackBubble bounds](self, "bounds");
  objc_msgSend(v3, "smallTailBalloonFrameForSize:flipHorizontally:flipVertically:", -[CKPinnedConversationTapbackBubble flipHorizontally](self, "flipHorizontally"), -[CKPinnedConversationTapbackBubble flipVertically](self, "flipVertically"), v4, v5);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MidX = CGRectGetMidX(v20);
  v11 = -[CKPinnedConversationTapbackBubble flipVertically](self, "flipVertically");
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  if (v11)
    MaxY = CGRectGetMaxY(*(CGRect *)&v12);
  else
    MaxY = CGRectGetMinY(*(CGRect *)&v12);
  v17 = MaxY;
  v18 = MidX;
  result.y = v17;
  result.x = v18;
  return result;
}

- (void)_updateAcknowledgmentType
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  -[CKPinnedConversationTapbackBubbleActivityItem message](self->_tapbackActivityItem, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "tapback");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[CKPinnedConversationTapbackBubble configureWithTapback:](self, "configureWithTapback:", v8);
  }
  else
  {
    v7 = CKMessageAcknowledgmentTypeFromIMAssociatedMessageType(objc_msgSend(v5, "associatedMessageType"));

    -[CKPinnedConversationTapbackBubble setAcknowledgmentType:](self, "setAcknowledgmentType:", v7);
  }
}

- (void)configureWithTapback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
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
  id v32;

  v32 = a3;
  -[CKPinnedConversationTapbackBubble displayedTapback](self, "displayedTapback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v32) & 1) == 0)
  {
    -[CKPinnedConversationTapbackBubble tapbackView](self, "tapbackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    +[CKTapbackViewUtils viewFor:isSelected:](CKTapbackViewUtils, "viewFor:isSelected:", v32, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationTapbackBubble setTapbackView:](self, "setTapbackView:", v6);
    objc_msgSend(v6, "platterEdgeInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[CKPinnedConversationTapbackBubble setDisplayedTapback:](self, "setDisplayedTapback:", v32);
    -[CKPinnedConversationTapbackBubble tapbackContainerView](self, "tapbackContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v6);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationTapbackBubble tapbackContainerView](self, "tapbackContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    objc_msgSend(v6, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationTapbackBubble tapbackContainerView](self, "tapbackContainerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    objc_msgSend(v6, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationTapbackBubble tapbackContainerView](self, "tapbackContainerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    objc_msgSend(v6, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationTapbackBubble tapbackContainerView](self, "tapbackContainerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[CKPinnedConversationTapbackBubble setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationTapbackBubble;
  -[CKPinnedConversationTapbackBubble traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKPinnedConversationTapbackBubble _updateUserInterfaceStyles](self, "_updateUserInterfaceStyles");
}

- (void)_updateUserInterfaceStyles
{
  void *v3;
  uint64_t v4;

  -[CKPinnedConversationTapbackBubble traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[CKPinnedConversationActivityItemViewBackdropLayer setUserInterfaceStyle:](self->_backdropLayer, "setUserInterfaceStyle:", v4);
  -[CKPinnedConversationActivityItemViewShadowLayer setUserInterfaceStyle:](self->_broadShadowLayer, "setUserInterfaceStyle:", v4);
  -[CKPinnedConversationActivityItemViewShadowLayer setUserInterfaceStyle:](self->_tightShadowLayer, "setUserInterfaceStyle:", v4);
}

- (CKPinnedConversationActivityItemViewDelegate)activityItemViewDelegate
{
  return (CKPinnedConversationActivityItemViewDelegate *)objc_loadWeakRetained((id *)&self->_activityItemViewDelegate);
}

- (void)setActivityItemViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_activityItemViewDelegate, a3);
}

- (int64_t)activityItemViewContentScale
{
  return self->_activityItemViewContentScale;
}

- (void)setActivityItemViewContentScale:(int64_t)a3
{
  self->_activityItemViewContentScale = a3;
}

- (CGSize)parentAvatarViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_parentAvatarViewSize.width;
  height = self->_parentAvatarViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setParentAvatarViewSize:(CGSize)a3
{
  self->_parentAvatarViewSize = a3;
}

- (int64_t)originationHorizontalDirection
{
  return self->_originationHorizontalDirection;
}

- (void)setOriginationHorizontalDirection:(int64_t)a3
{
  self->_originationHorizontalDirection = a3;
}

- (CKPinnedConversationTapbackBubbleActivityItem)tapbackActivityItem
{
  return self->_tapbackActivityItem;
}

- (int64_t)originationDirection
{
  return self->_originationDirection;
}

- (CGPoint)originationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_originationPoint.x;
  y = self->_originationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginationPoint:(CGPoint)a3
{
  self->_originationPoint = a3;
}

- (double)preferredTailAttachmentPointXCoordinate
{
  return self->_preferredTailAttachmentPointXCoordinate;
}

- (CKAcknowledgmentGlyphView)tapbackGlyph
{
  return self->_tapbackGlyph;
}

- (void)setTapbackGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackGlyph, a3);
}

- (IMTapback)displayedTapback
{
  return self->_displayedTapback;
}

- (void)setDisplayedTapback:(id)a3
{
  objc_storeStrong((id *)&self->_displayedTapback, a3);
}

- (UIView)tapbackView
{
  return self->_tapbackView;
}

- (void)setTapbackView:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackView, a3);
}

- (UIView)tapbackContainerView
{
  return self->_tapbackContainerView;
}

- (void)setTapbackContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackContainerView, a3);
}

- (CKPinnedConversationActivityItemViewBackdropLayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropLayer, a3);
}

- (CAShapeLayer)backdropMaskShapeLayer
{
  return self->_backdropMaskShapeLayer;
}

- (void)setBackdropMaskShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, a3);
}

- (CKPinnedConversationActivityItemViewShadowLayer)broadShadowLayer
{
  return self->_broadShadowLayer;
}

- (void)setBroadShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_broadShadowLayer, a3);
}

- (CKPinnedConversationActivityItemViewShadowLayer)tightShadowLayer
{
  return self->_tightShadowLayer;
}

- (void)setTightShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_tightShadowLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tightShadowLayer, 0);
  objc_storeStrong((id *)&self->_broadShadowLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_tapbackContainerView, 0);
  objc_storeStrong((id *)&self->_tapbackView, 0);
  objc_storeStrong((id *)&self->_displayedTapback, 0);
  objc_storeStrong((id *)&self->_tapbackGlyph, 0);
  objc_storeStrong((id *)&self->_tapbackActivityItem, 0);
  objc_destroyWeak((id *)&self->_activityItemViewDelegate);
}

@end
