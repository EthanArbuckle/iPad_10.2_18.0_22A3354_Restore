@implementation CKPinnedConversationTypingBubble

- (CKPinnedConversationTypingBubble)initWithActivityItem:(id)a3
{
  id v5;
  CKPinnedConversationTypingBubble *v6;
  CKPinnedConversationTypingBubble *v7;
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
  CALayer *v19;
  CALayer *thinkingDotContainer;
  CALayer *v21;
  void *v22;
  CAShapeLayer *v23;
  CAShapeLayer *thinkingDot;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  uint64_t v40;
  CAReplicatorLayer *thinkingDots;
  CAReplicatorLayer *v42;
  double v43;
  double v44;
  double v45;
  CATransform3D v47;
  objc_super v48;
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CKPinnedConversationTypingBubble;
  v6 = -[CKPinnedConversationTypingBubble init](&v48, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_typingBubbleActivityItem, a3);
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
    -[CKPinnedConversationTypingBubble _updateUserInterfaceStyles](v7, "_updateUserInterfaceStyles");
    -[CKPinnedConversationTypingBubble layer](v7, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v7->_broadShadowLayer);

    -[CKPinnedConversationTypingBubble layer](v7, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v7->_tightShadowLayer);

    -[CKPinnedConversationTypingBubble layer](v7, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v7->_backdropLayer);

    v19 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    thinkingDotContainer = v7->_thinkingDotContainer;
    v7->_thinkingDotContainer = v19;

    v21 = v7->_thinkingDotContainer;
    -[CKPinnedConversationTypingBubble bounds](v7, "bounds");
    -[CALayer setBounds:](v21, "setBounds:");
    -[CKPinnedConversationTypingBubble layer](v7, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v7->_thinkingDotContainer);

    v23 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    thinkingDot = v7->_thinkingDot;
    v7->_thinkingDot = v23;

    v25 = (void *)MEMORY[0x1E0CEA390];
    -[CKPinnedConversationTypingBubble thinkingDotDiameter](v7, "thinkingDotDiameter");
    v27 = v26;
    -[CKPinnedConversationTypingBubble thinkingDotDiameter](v7, "thinkingDotDiameter");
    objc_msgSend(v25, "bezierPathWithOvalInRect:", 0.0, 0.0, v27, v28);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](v7->_thinkingDot, "setPath:", objc_msgSend(v29, "CGPath"));
    -[CKPinnedConversationTypingBubble _updateThinkingDotColor](v7, "_updateThinkingDotColor");
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = &unk_1E2871120;
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[CKPinnedConversationTypingBubble thinkingDotOpacity](v7, "thinkingDotOpacity");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setValues:", v33);

    objc_msgSend(v30, "setKeyTimes:", &unk_1E286F2F8);
    objc_msgSend(v30, "setCalculationMode:", *MEMORY[0x1E0CD2938]);
    objc_msgSend(v30, "setDuration:", 0.5);
    LODWORD(v34) = 1061271823;
    LODWORD(v35) = 1014679044;
    LODWORD(v36) = 1058306785;
    LODWORD(v37) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTimingFunction:", v38);

    LODWORD(v39) = 2139095040;
    objc_msgSend(v30, "setRepeatCount:", v39);
    objc_msgSend(v30, "setAutoreverses:", 1);
    objc_msgSend(v30, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v30, "setRemovedOnCompletion:", 0);
    -[CAShapeLayer addAnimation:forKey:](v7->_thinkingDot, "addAnimation:forKey:", v30, CFSTR("Opacity"));
    objc_msgSend(MEMORY[0x1E0CD2828], "layer");
    v40 = objc_claimAutoreleasedReturnValue();
    thinkingDots = v7->_thinkingDots;
    v7->_thinkingDots = (CAReplicatorLayer *)v40;

    -[CAReplicatorLayer setInstanceCount:](v7->_thinkingDots, "setInstanceCount:", 3);
    v42 = v7->_thinkingDots;
    -[CKPinnedConversationTypingBubble thinkingDotDiameter](v7, "thinkingDotDiameter");
    v44 = v43;
    -[CKPinnedConversationTypingBubble thinkingDotSpace](v7, "thinkingDotSpace");
    CATransform3DMakeTranslation(&v47, v44 + v45, 0.0, 0.0);
    -[CAReplicatorLayer setInstanceTransform:](v42, "setInstanceTransform:", &v47);
    -[CAReplicatorLayer setInstanceDelay:](v7->_thinkingDots, "setInstanceDelay:", 0.25);
    -[CAReplicatorLayer addSublayer:](v7->_thinkingDots, "addSublayer:", v7->_thinkingDot);
    -[CALayer addSublayer:](v7->_thinkingDotContainer, "addSublayer:", v7->_thinkingDots);

  }
  return v7;
}

- (void)layoutSubviews
{
  id v3;
  uint64_t v4;
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
  CGFloat v17;
  CGFloat v18;
  void *v19;
  id v20;
  _OWORD v21[2];
  _OWORD v22[2];
  CGRect v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKPinnedConversationTypingBubble;
  -[CKPinnedConversationTypingBubble layoutSubviews](&v24, sel_layoutSubviews);
  memset(&v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  v20 = 0;
  -[CKPinnedConversationTypingBubble calculateBezierPathWithOutputsForPath:largeBubbleFrame:mediumBubbleFrame:smallBubbleFrame:](self, "calculateBezierPathWithOutputsForPath:largeBubbleFrame:mediumBubbleFrame:smallBubbleFrame:", &v20, &v23, v22, v21);
  v3 = objc_retainAutorelease(v20);
  v4 = objc_msgSend(v3, "CGPath");
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKPinnedConversationActivityItemViewBackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  -[CAShapeLayer setFrame:](self->_backdropMaskShapeLayer, "setFrame:", v6, v8, v10, v12);
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_broadShadowLayer, "setFrame:", v6, v8, v10, v12);
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_tightShadowLayer, "setFrame:", v6, v8, v10, v12);
  -[CAShapeLayer setPath:](self->_backdropMaskShapeLayer, "setPath:", v4);
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowPath:](self->_broadShadowLayer, "setShadowPath:", v4);
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowPath:](self->_tightShadowLayer, "setShadowPath:", v4);
  -[CKPinnedConversationTypingBubble thinkingDotContainerSize](self, "thinkingDotContainerSize");
  v14 = v13;
  v16 = v15;
  v17 = CGRectGetMinX(v23) + (v23.size.width - v13) * 0.5;
  v18 = CGRectGetMinY(v23) + (v23.size.height - v16) * 0.5;
  -[CKPinnedConversationTypingBubble thinkingDotContainer](self, "thinkingDotContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setFrame:", v17, v18, v14, v16);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  _OWORD v11[2];
  _OWORD v12[2];
  _OWORD v13[2];
  CGSize result;

  memset(v13, 0, sizeof(v13));
  memset(v12, 0, sizeof(v12));
  memset(v11, 0, sizeof(v11));
  v10 = 0;
  -[CKPinnedConversationTypingBubble calculateBezierPathWithOutputsForPath:largeBubbleFrame:mediumBubbleFrame:smallBubbleFrame:](self, "calculateBezierPathWithOutputsForPath:largeBubbleFrame:mediumBubbleFrame:smallBubbleFrame:", &v10, v13, v12, v11);
  v3 = v10;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)activityItemToContactItemVerticalOverlap
{
  return 5.0;
}

- (CGSize)largeBubbleSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 26.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)largeBubbleCornerRadius
{
  return 12.0;
}

- (CGSize)mediumBubbleSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 9.0;
  v3 = 9.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallBubbleSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 5.0;
  v3 = 5.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGPoint)mediumBubbleOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)smallBubbleOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)thinkingDotDiameter
{
  return 6.0;
}

- (id)thinkingDotColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

- (void)_updateThinkingDotColor
{
  id v3;

  -[CKPinnedConversationTypingBubble thinkingDotColor](self, "thinkingDotColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_thinkingDot, "setFillColor:", objc_msgSend(v3, "CGColor"));

}

- (double)thinkingDotOpacity
{
  return 0.45;
}

- (double)thinkingDotSpace
{
  return 3.0;
}

- (CGSize)thinkingDotContainerSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CKPinnedConversationTypingBubble thinkingDotDiameter](self, "thinkingDotDiameter");
  v4 = v3;
  -[CKPinnedConversationTypingBubble thinkingDotSpace](self, "thinkingDotSpace");
  v6 = v5 + v5 + v4 * 3.0;
  -[CKPinnedConversationTypingBubble thinkingDotDiameter](self, "thinkingDotDiameter");
  v8 = v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (unint64_t)tailCornerAnchor
{
  int64_t originationDirection;

  originationDirection = self->_originationDirection;
  if (originationDirection == 1)
    return 1;
  else
    return 4 * (originationDirection == 0);
}

- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3
{
  if (self->_preferredTailAttachmentPointXCoordinate != a3)
  {
    self->_preferredTailAttachmentPointXCoordinate = a3;
    -[CKPinnedConversationTypingBubble setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGPoint)tailAttachmentPoint
{
  unint64_t v3;
  double v4;
  char v5;
  CGFloat MidX;
  double MaxY;
  double v8;
  uint64_t v9;
  CGRect v10;
  _OWORD v11[2];
  _OWORD v12[2];
  CGPoint result;

  memset(v12, 0, sizeof(v12));
  memset(v11, 0, sizeof(v11));
  memset(&v10, 0, sizeof(v10));
  v9 = 0;
  -[CKPinnedConversationTypingBubble calculateBezierPathWithOutputsForPath:largeBubbleFrame:mediumBubbleFrame:smallBubbleFrame:](self, "calculateBezierPathWithOutputsForPath:largeBubbleFrame:mediumBubbleFrame:smallBubbleFrame:", &v9, v12, v11, &v10);
  v3 = -[CKPinnedConversationTypingBubble tailCornerAnchor](self, "tailCornerAnchor");
  v4 = 0.0;
  v5 = v3 + 1;
  if (v3 + 1 > 9)
  {
    MidX = 0.0;
    goto LABEL_7;
  }
  if (((1 << v5) & 0x221) != 0)
  {
    MidX = CGRectGetMidX(v10);
    MaxY = CGRectGetMaxY(v10);
LABEL_6:
    v4 = MaxY;
    goto LABEL_7;
  }
  MidX = 0.0;
  if (((1 << v5) & 0xC) != 0)
  {
    MidX = CGRectGetMidX(v10);
    MaxY = CGRectGetMinY(v10);
    goto LABEL_6;
  }
LABEL_7:
  v8 = MidX;
  result.y = v4;
  result.x = v8;
  return result;
}

- (void)setOriginationDirection:(int64_t)a3
{
  if (self->_originationDirection != a3)
  {
    self->_originationDirection = a3;
    -[CKPinnedConversationTypingBubble setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)supportsActivityItemViewContentScale
{
  return 0;
}

- (BOOL)supportsAlignmentWithOriginationSubAvatarFrame
{
  return 1;
}

- (void)calculateBezierPathWithOutputsForPath:(id *)a3 largeBubbleFrame:(CGRect *)a4 mediumBubbleFrame:(CGRect *)a5 smallBubbleFrame:(CGRect *)a6
{
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat MaxY;
  CGFloat v35;
  void *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double x;
  double v43;
  CGFloat v44;
  CGFloat rect;
  double v46;
  CGFloat v47;
  id v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  -[CKPinnedConversationTypingBubble largeBubbleSize](self, "largeBubbleSize");
  v12 = v11;
  v44 = v13;
  -[CKPinnedConversationTypingBubble mediumBubbleSize](self, "mediumBubbleSize");
  v15 = v14;
  v17 = v16;
  -[CKPinnedConversationTypingBubble smallBubbleSize](self, "smallBubbleSize");
  rect = v18;
  v20 = v19;
  -[CKPinnedConversationTypingBubble mediumBubbleOffset](self, "mediumBubbleOffset");
  v46 = v21;
  v40 = v22;
  -[CKPinnedConversationTypingBubble smallBubbleOffset](self, "smallBubbleOffset");
  v24 = v23;
  v26 = v25;
  -[CKPinnedConversationTypingBubble largeBubbleCornerRadius](self, "largeBubbleCornerRadius");
  v27 = -[CKPinnedConversationTypingBubble tailCornerAnchor](self, "tailCornerAnchor");
  v28 = *MEMORY[0x1E0C9D648];
  v29 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v43 = v15;
  v41 = v20;
  switch(v27)
  {
    case 1uLL:
      v49.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
      v49.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
      v49.size.width = v15;
      v49.size.height = v17;
      v50.origin.x = CGRectGetMaxX(v49) - v24;
      x = v50.origin.x;
      v50.origin.y = v29;
      v50.size.width = rect;
      v50.size.height = v20;
      v30 = v26 + CGRectGetMaxY(v50);
      v51.origin.x = v28;
      v51.origin.y = v30;
      v51.size.width = v15;
      v51.size.height = v17;
      v31 = v40 + CGRectGetMinY(v51);
      v32 = v46;
      goto LABEL_5;
    case 2uLL:
      v38 = *MEMORY[0x1E0C9D648];
      v52.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
      v52.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
      v52.size.width = v12;
      v52.size.height = v44;
      v28 = v46 + CGRectGetMaxX(v52) - v15;
      v53.origin.x = v28;
      v53.origin.y = v29;
      v53.size.width = v15;
      v53.size.height = v17;
      v54.origin.x = CGRectGetMinX(v53) - v24;
      x = v54.origin.x;
      v54.origin.y = v29;
      v54.size.width = rect;
      v54.size.height = v20;
      v30 = v26 + CGRectGetMaxY(v54);
      v55.origin.x = v28;
      v55.origin.y = v30;
      v55.size.width = v15;
      v55.size.height = v17;
      v31 = v40 + CGRectGetMinY(v55);
      v32 = v38;
      goto LABEL_5;
    case 4uLL:
      v56.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
      v56.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
      v56.size.width = v15;
      v56.size.height = v17;
      x = CGRectGetMaxX(v56) - v24;
      v32 = v46;
      v57.origin.x = v46;
      v57.origin.y = v29;
      v57.size.width = v12;
      v57.size.height = v44;
      v30 = v40 + CGRectGetMaxY(v57) - v17;
      v58.origin.x = v28;
      v58.origin.y = v30;
      v58.size.width = v15;
      v58.size.height = v17;
      MaxY = CGRectGetMaxY(v58);
      v31 = v29;
      v33 = v26 + MaxY;
      goto LABEL_8;
    case 8uLL:
      v59.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
      v59.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
      v59.size.width = v12;
      v59.size.height = v44;
      v60.origin.x = v46 + CGRectGetMaxX(v59) - v15;
      v47 = v60.origin.x;
      v60.origin.y = v29;
      v60.size.width = v15;
      v60.size.height = v17;
      x = CGRectGetMinX(v60) - v24;
      v61.origin.x = v28;
      v61.origin.y = v29;
      v61.size.width = v12;
      v61.size.height = v44;
      v30 = v40 + CGRectGetMaxY(v61) - v17;
      v62.origin.x = v47;
      v62.origin.y = v30;
      v62.size.width = v15;
      v62.size.height = v17;
      v35 = CGRectGetMaxY(v62);
      v31 = v29;
      v33 = v26 + v35;
      v32 = v28;
      v28 = v47;
      goto LABEL_8;
    default:
      v32 = *MEMORY[0x1E0C9D648];
      v30 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v31 = v30;
      x = *MEMORY[0x1E0C9D648];
LABEL_5:
      v33 = v29;
LABEL_8:
      v39 = v31;
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v32, *(_QWORD *)&v38);
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", v28, v30, v43, v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "appendPath:", v36);
      objc_msgSend(v48, "appendPath:", v37);
      if (a3)
        *a3 = objc_retainAutorelease(v48);
      if (a4)
      {
        a4->origin.x = v32;
        a4->origin.y = v39;
        a4->size.width = v12;
        a4->size.height = v44;
      }
      if (a5)
      {
        a5->origin.x = v28;
        a5->origin.y = v30;
        a5->size.width = v43;
        a5->size.height = v17;
      }
      if (a6)
      {
        a6->origin.x = x;
        a6->origin.y = v33;
        a6->size.width = rect;
        a6->size.height = v41;
      }

      return;
  }
}

- (CKPinnedConversationActivityItem)activityItem
{
  return (CKPinnedConversationActivityItem *)self->_typingBubbleActivityItem;
}

- (void)setActivityItem:(id)a3
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_typingBubbleActivityItem, a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationTypingBubble;
  -[CKPinnedConversationTypingBubble traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKPinnedConversationTypingBubble _updateThinkingDotColor](self, "_updateThinkingDotColor");
  -[CKPinnedConversationTypingBubble _updateUserInterfaceStyles](self, "_updateUserInterfaceStyles");
}

- (void)_updateUserInterfaceStyles
{
  void *v3;
  uint64_t v4;

  -[CKPinnedConversationTypingBubble traitCollection](self, "traitCollection");
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

- (CKPinnedConversationTypingBubbleActivityItem)typingBubbleActivityItem
{
  return self->_typingBubbleActivityItem;
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

- (CALayer)thinkingDotContainer
{
  return self->_thinkingDotContainer;
}

- (void)setThinkingDotContainer:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDotContainer, a3);
}

- (CAShapeLayer)thinkingDot
{
  return self->_thinkingDot;
}

- (void)setThinkingDot:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDot, a3);
}

- (CAReplicatorLayer)thinkingDots
{
  return self->_thinkingDots;
}

- (void)setThinkingDots:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDots, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thinkingDots, 0);
  objc_storeStrong((id *)&self->_thinkingDot, 0);
  objc_storeStrong((id *)&self->_thinkingDotContainer, 0);
  objc_storeStrong((id *)&self->_tightShadowLayer, 0);
  objc_storeStrong((id *)&self->_broadShadowLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_typingBubbleActivityItem, 0);
  objc_destroyWeak((id *)&self->_activityItemViewDelegate);
}

@end
