@implementation CKPinnedConversationTailedActivityItemView

- (CKPinnedConversationTailedActivityItemView)initWithActivityItem:(id)a3 contentView:(id)a4 needsContentViewStroke:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  CKPinnedConversationTailedActivityItemView *v11;
  CKPinnedConversationTailedActivityItemView *v12;
  CKPinnedConversationActivityItemViewShadowLayer *v13;
  CKPinnedConversationActivityItemViewShadowLayer *broadShadowLayer;
  CKPinnedConversationActivityItemViewShadowLayer *v15;
  CKPinnedConversationActivityItemViewShadowLayer *tightShadowLayer;
  CKPinnedConversationActivityItemViewBackdropLayer *v17;
  CKPinnedConversationActivityItemViewBackdropLayer *backdropLayer;
  CAShapeLayer *v19;
  CAShapeLayer *backdropMaskShapeLayer;
  void *v21;
  void *v22;
  CKPinnedConversationActivityItemViewBackdropLayer *v23;
  void *v24;
  CAShapeLayer *v25;
  CAShapeLayer *contentViewStrokeLayer;
  id v27;
  id v28;
  void *v29;
  void *v30;
  objc_super v32;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CKPinnedConversationTailedActivityItemView;
  v11 = -[CKPinnedConversationTailedActivityItemView init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_activityItem, a3);
    objc_storeStrong((id *)&v12->_contentView, a4);
    v13 = -[CKPinnedConversationActivityItemViewShadowLayer initWithShadowType:]([CKPinnedConversationActivityItemViewShadowLayer alloc], "initWithShadowType:", 0);
    broadShadowLayer = v12->_broadShadowLayer;
    v12->_broadShadowLayer = v13;

    v15 = -[CKPinnedConversationActivityItemViewShadowLayer initWithShadowType:]([CKPinnedConversationActivityItemViewShadowLayer alloc], "initWithShadowType:", 1);
    tightShadowLayer = v12->_tightShadowLayer;
    v12->_tightShadowLayer = v15;

    v17 = objc_alloc_init(CKPinnedConversationActivityItemViewBackdropLayer);
    backdropLayer = v12->_backdropLayer;
    v12->_backdropLayer = v17;

    v19 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    backdropMaskShapeLayer = v12->_backdropMaskShapeLayer;
    v12->_backdropMaskShapeLayer = v19;

    -[CKPinnedConversationActivityItemViewBackdropLayer setMask:](v12->_backdropLayer, "setMask:", v12->_backdropMaskShapeLayer);
    -[CKPinnedConversationTailedActivityItemView _updateUserInterfaceStyles](v12, "_updateUserInterfaceStyles");
    -[CKPinnedConversationTailedActivityItemView layer](v12, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", v12->_broadShadowLayer);

    -[CKPinnedConversationTailedActivityItemView layer](v12, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v12->_tightShadowLayer);

    v23 = v12->_backdropLayer;
    -[UIView layer](v12->_contentView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationActivityItemViewBackdropLayer addSublayer:](v23, "addSublayer:", v24);

    if (v5)
    {
      v25 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      contentViewStrokeLayer = v12->_contentViewStrokeLayer;
      v12->_contentViewStrokeLayer = v25;

      -[CAShapeLayer setLineWidth:](v12->_contentViewStrokeLayer, "setLineWidth:", 1.0);
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.341176471, 1.0);
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](v12->_contentViewStrokeLayer, "setStrokeColor:", objc_msgSend(v27, "CGColor"));

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](v12->_contentViewStrokeLayer, "setFillColor:", objc_msgSend(v28, "CGColor"));

      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer setCompositingFilter:](v12->_contentViewStrokeLayer, "setCompositingFilter:", v29);

      -[CKPinnedConversationActivityItemViewBackdropLayer addSublayer:](v12->_backdropLayer, "addSublayer:", v12->_contentViewStrokeLayer);
    }
    -[CKPinnedConversationTailedActivityItemView layer](v12, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSublayer:", v12->_backdropLayer);

  }
  return v12;
}

- (CGPoint)tailAttachmentPointWithOutputForMinimumContinousAnchorX:(double *)a3 maximumContinuousAnchorX:(double *)a4
{
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  int64_t originationDirection;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxX;
  double v29;
  double MinY;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MinX;
  double v40;
  CGRect v41;
  CGPoint result;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[CKPinnedConversationTailedActivityItemView bounds](self, "bounds");
  v41.origin.x = v7;
  v41.origin.y = v8;
  v41.size.width = v9;
  v41.size.height = v10;
  -[CKPinnedConversationTailedActivityItemView pillRect](self, "pillRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  originationDirection = self->_originationDirection;
  -[CKPinnedConversationTailedActivityItemView balloonTailWidth](self, "balloonTailWidth");
  v21 = v20;
  -[CKPinnedConversationTailedActivityItemView pillCornerRadius](self, "pillCornerRadius");
  v23 = v22;
  -[CKPinnedConversationTailedActivityItemView preferredTailAttachmentPointXCoordinate](self, "preferredTailAttachmentPointXCoordinate");
  v25 = v24;
  v26 = 0.645679839;
  if (self->_originationHorizontalDirection)
    v27 = 0.645679839;
  else
    v27 = 0.354320161;
  v38 = v27;
  if (self->_originationHorizontalDirection)
    v26 = 0.354320161;
  v40 = v26;
  v43.origin.x = v12;
  v43.origin.y = v14;
  v43.size.width = v16;
  v43.size.height = v18;
  MinX = CGRectGetMinX(v43);
  v44.origin.x = v12;
  v44.origin.y = v14;
  v44.size.width = v16;
  v44.size.height = v18;
  v37 = CGRectGetMinX(v44);
  v45.origin.x = v12;
  v45.origin.y = v14;
  v45.size.width = v16;
  v45.size.height = v18;
  MaxX = CGRectGetMaxX(v45);
  v46.origin.x = v12;
  v46.origin.y = v14;
  v46.size.width = v16;
  v46.size.height = v18;
  v29 = CGRectGetMaxX(v46);
  if (originationDirection == 1)
    MinY = CGRectGetMinY(v41);
  else
    MinY = CGRectGetMaxY(v41);
  v31 = MinY;
  v32 = v23 * 1.528665;
  v33 = v21 * v38;
  if (a3)
    *a3 = v32 + v37 + v33;
  v34 = v21 * v40;
  if (a4)
    *a4 = v29 - v32 - v34;
  v35 = v23 + MinX + v33;
  v36 = MaxX - v23 - v34;
  if (v36 >= v25)
    v36 = v25;
  if (v35 < v36)
    v35 = v36;
  result.y = v31;
  result.x = v35;
  return result;
}

- (CGPoint)tailAttachmentPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[CKPinnedConversationTailedActivityItemView tailAttachmentPointWithOutputForMinimumContinousAnchorX:maximumContinuousAnchorX:](self, "tailAttachmentPointWithOutputForMinimumContinousAnchorX:maximumContinuousAnchorX:", 0, 0);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)pillRect
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
  CGRect result;

  -[CKPinnedConversationTailedActivityItemView balloonTailHeight](self, "balloonTailHeight");
  v4 = v3;
  -[CKPinnedConversationTailedActivityItemView bounds](self, "bounds");
  v9 = 0.0;
  if (self->_originationDirection == 1)
    v9 = v4;
  v10 = v6 + v9;
  v11 = v8 - v4;
  result.size.height = v11;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v5;
  return result;
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
  int64_t originationDirection;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MaxX;
  double v43;
  double v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _BOOL8 v56;
  double v57;
  double MinY;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  _BOOL8 v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double MinX;
  double v84;
  double MaxY;
  double v86;
  double v87;
  double v88;
  double v89;
  int64_t originationHorizontalDirection;
  double v91;
  double v92;
  _QWORD v93[9];
  double v94;
  double v95;
  objc_super v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v96.receiver = self;
  v96.super_class = (Class)CKPinnedConversationTailedActivityItemView;
  -[CKPinnedConversationTailedActivityItemView layoutSubviews](&v96, sel_layoutSubviews);
  -[CKPinnedConversationTailedActivityItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_broadShadowLayer, "setFrame:");
  -[CKPinnedConversationActivityItemViewShadowLayer setFrame:](self->_tightShadowLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_backdropMaskShapeLayer, "setFrame:", v4, v6, v8, v10);
  -[CKPinnedConversationActivityItemViewBackdropLayer setFrame:](self->_backdropLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_contentViewStrokeLayer, "setFrame:", v4, v6, v8, v10);
  -[CKPinnedConversationTailedActivityItemView contentViewPadding](self, "contentViewPadding");
  v86 = v11;
  v82 = v12;
  v84 = v13;
  v80 = v14;
  -[CKPinnedConversationTailedActivityItemView balloonTailHeight](self, "balloonTailHeight");
  v16 = v15;
  -[CKPinnedConversationTailedActivityItemView pillCornerRadius](self, "pillCornerRadius");
  v92 = v17;
  v18 = v17 * 1.528665;
  originationDirection = self->_originationDirection;
  v20 = 0.0;
  if (originationDirection == 1)
    v21 = v16;
  else
    v21 = 0.0;
  v78 = v21;
  v22 = v6 + v21;
  v23 = v10 - v16;
  v94 = 0.0;
  v95 = 0.0;
  -[CKPinnedConversationTailedActivityItemView tailAttachmentPointWithOutputForMinimumContinousAnchorX:maximumContinuousAnchorX:](self, "tailAttachmentPointWithOutputForMinimumContinousAnchorX:maximumContinuousAnchorX:", &v95, &v94);
  v88 = v25;
  originationHorizontalDirection = self->_originationHorizontalDirection;
  v26 = originationDirection != 1;
  v27 = originationDirection == 1;
  if (v18 + v18 >= v8)
  {
    v27 = 0;
    v26 = 0;
  }
  if (v24 < v95)
    v28 = v27;
  else
    v28 = v18 + v18 < v8;
  if (v24 < v95)
    v29 = v26;
  else
    v29 = v18 + v18 < v8;
  v30 = originationDirection != 1;
  v31 = originationDirection == 1;
  v91 = v18 + v18;
  if (v18 + v18 >= v8)
  {
    v31 = 0;
    v30 = 0;
  }
  v89 = v24;
  if (v24 > v94)
    v32 = v31;
  else
    v32 = v18 + v18 < v8;
  if (v24 > v94)
    v33 = v30;
  else
    v33 = v18 + v18 < v8;
  v34 = -[CKPinnedConversationTailedActivityItemView contentViewContentMode](self, "contentViewContentMode");
  if (v34 == 1)
  {
    -[CKPinnedConversationTailedActivityItemView bounds](self, "bounds");
    v20 = v39;
  }
  else
  {
    v35 = 0.0;
    v36 = 0.0;
    v37 = 0.0;
    if (!v34)
    {
      -[CKPinnedConversationTailedActivityItemView contentViewHorizontalInsetForPillCornerRadius](self, "contentViewHorizontalInsetForPillCornerRadius");
      v20 = v82 + v4 + v38;
      v35 = v6 + v86 + v78;
      v36 = v8 - v82 - v80 + v38 * -2.0;
      v37 = v23 - v86 - v84;
    }
  }
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __60__CKPinnedConversationTailedActivityItemView_layoutSubviews__block_invoke;
  v93[3] = &unk_1E274B8B8;
  v93[4] = self;
  *(double *)&v93[5] = v20;
  *(double *)&v93[6] = v35;
  *(double *)&v93[7] = v36;
  *(double *)&v93[8] = v37;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v93);
  if ((_DWORD)v29)
    v40 = v18;
  else
    v40 = v92;
  v41 = v4 + v40;
  v97.origin.x = v4;
  v97.origin.y = v22;
  v97.size.width = v8;
  v97.size.height = v23;
  MaxX = CGRectGetMaxX(v97);
  if ((_DWORD)v33)
    v43 = v18;
  else
    v43 = v92;
  v44 = MaxX - v43;
  if (!(_DWORD)v28)
    v18 = v92;
  v98.origin.x = v4;
  v98.origin.y = v22;
  v98.size.width = v8;
  v98.size.height = v23;
  MaxY = CGRectGetMaxY(v98);
  v45 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  v87 = v41;
  objc_msgSend(v45, "moveToPoint:", v41, v22);
  v76 = 424;
  if (originationDirection == 1)
  {
    objc_msgSend(v45, "currentPoint");
    if (originationHorizontalDirection)
      v48 = v47;
    else
      v48 = v22;
    if (originationHorizontalDirection)
      v49 = v46;
    else
      v49 = v44;
    if (originationHorizontalDirection)
      v50 = v44;
    else
      v50 = v46;
    if (originationHorizontalDirection)
      v51 = v22;
    else
      v51 = v47;
    -[CKPinnedConversationTailedActivityItemView _pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationHorizontalDirection:originationDirection:](self, "_pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationHorizontalDirection:originationDirection:", self->_originationHorizontalDirection, self->_originationDirection, v49, v48, v50, v51, v89, v88, 424);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (originationHorizontalDirection)
    {
      v54 = v52;
    }
    else
    {
      objc_msgSend(v52, "bezierPathByReversingPath");
      v54 = (id)objc_claimAutoreleasedReturnValue();
    }
    v55 = v54;
    objc_msgSend(v45, "appendPath:", v54);

  }
  else
  {
    objc_msgSend(v45, "addLineToPoint:", v44, v22);
  }
  v77 = v4 + v18;
  v56 = v91 < v23;
  v99.origin.x = v4;
  v99.origin.y = v22;
  v99.size.width = v8;
  v99.size.height = v23;
  v57 = CGRectGetMaxX(v99);
  v100.origin.x = v4;
  v100.origin.y = v22;
  v100.size.width = v8;
  v100.size.height = v23;
  MinY = CGRectGetMinY(v100);
  v101.origin.x = v4;
  v101.origin.y = v22;
  v101.size.width = v8;
  v101.size.height = v23;
  v59 = CGRectGetMaxX(v101);
  v102.origin.x = v4;
  v102.origin.y = v22;
  v102.size.width = v8;
  v102.size.height = v23;
  v60 = CGRectGetMaxY(v102);
  v103.origin.x = v4;
  v103.origin.y = v22;
  v103.size.width = v8;
  v103.size.height = v23;
  MinX = CGRectGetMinX(v103);
  v104.origin.x = v4;
  v104.origin.y = v22;
  v104.size.width = v8;
  v104.size.height = v23;
  v79 = CGRectGetMaxY(v104);
  v105.origin.x = v4;
  v105.origin.y = v22;
  v105.size.width = v8;
  v105.size.height = v23;
  v81 = CGRectGetMinX(v105);
  v106.origin.x = v4;
  v106.origin.y = v22;
  v106.size.width = v8;
  v106.size.height = v23;
  v61 = CGRectGetMinY(v106);
  objc_msgSend(v45, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 2, 0, v33, v56, v57, MinY, v92, v92);
  objc_msgSend(v45, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 8, 0, v56, v32, v59, v60, v92, v92);
  if (originationDirection == 1)
  {
    objc_msgSend(v45, "addLineToPoint:", v77, MaxY);
    v62 = v91;
  }
  else
  {
    objc_msgSend(v45, "currentPoint");
    v65 = MaxY;
    if (originationHorizontalDirection)
      v66 = MaxY;
    else
      v66 = v64;
    v67 = v77;
    if (originationHorizontalDirection)
      v68 = v77;
    else
      v68 = v63;
    if (originationHorizontalDirection)
    {
      v67 = v63;
      v65 = v64;
    }
    -[CKPinnedConversationTailedActivityItemView _pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationHorizontalDirection:originationDirection:](self, "_pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationHorizontalDirection:originationDirection:", self->_originationHorizontalDirection, *(Class *)((char *)&self->super.super.super.isa + v76), v68, v66, v67, v65, v89, v88, v76);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (originationHorizontalDirection)
    {
      objc_msgSend(v69, "bezierPathByReversingPath");
      v71 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = v69;
    }
    v72 = v71;
    v62 = v91;
    objc_msgSend(v45, "appendPath:", v71);

  }
  v73 = v62 < v23;
  objc_msgSend(v45, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 4, 0, v28, v73, MinX, v79, v92, v92);
  objc_msgSend(v45, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:leadInIsContinuous:leadOutIsContinuous:", 1, 0, v73, v29, v81, v61, v92, v92);
  objc_msgSend(v45, "addLineToPoint:", v87, v22);
  v74 = objc_retainAutorelease(v45);
  v75 = objc_msgSend(v74, "CGPath");
  -[CAShapeLayer setPath:](self->_backdropMaskShapeLayer, "setPath:", v75);
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowPath:](self->_broadShadowLayer, "setShadowPath:", v75);
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowPath:](self->_tightShadowLayer, "setShadowPath:", v75);
  -[CAShapeLayer setPath:](self->_contentViewStrokeLayer, "setPath:", v75);

}

void __60__CKPinnedConversationTailedActivityItemView_layoutSubviews__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (id)_pathForTailedBalloonSegmentWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 anchorPoint:(CGPoint)a5 originationHorizontalDirection:(int64_t)a6 originationDirection:(int64_t)a7
{
  double y;
  double x;
  double v11;
  double v12;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;

  y = a5.y;
  x = a5.x;
  v11 = a3.y;
  v12 = a3.x;
  v14 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  objc_msgSend(v14, "moveToPoint:", v12, v11);
  -[CKPinnedConversationTailedActivityItemView balloonTailWidth](self, "balloonTailWidth");
  v16 = vabdd_f64(y, v11) + -1.0;
  v17 = -(v15 * 0.661754856);
  if (a7 == 1)
    v18 = -(v16 * 0.811138015);
  else
    v18 = v16 * 0.811138015;
  v19 = -(v16 * 0.182405165);
  if (a7 == 1)
    v19 = v16 * 0.182405165;
  v37 = v19;
  if (!a6)
    v17 = v15 * 0.661754856;
  v20 = -(v15 * 0.162759545);
  if (a6)
  {
    v20 = v15 * 0.162759545;
    v21 = v15 * 0.419959812;
  }
  else
  {
    v21 = -(v15 * 0.419959812);
  }
  v22 = -(v15 * 0.158070998);
  if (a6)
    v22 = v15 * 0.158070998;
  v36 = v22;
  if (a6)
    v23 = v15;
  else
    v23 = -v15;
  v24 = x;
  v25 = v20 + x + v17;
  v38 = x + v17;
  v39 = v23;
  v26 = v16 * 0.136400323;
  if (a7 == 1)
    v26 = -(v16 * 0.136400323);
  v27 = v11 + v26;
  v28 = v16 * 0.0121065375;
  if (a7 == 1)
    v28 = -(v16 * 0.0121065375);
  v35 = v28;
  objc_msgSend(v14, "addLineToPoint:");
  v29 = v21 + v25;
  v30 = v18 + v27;
  v31 = (v27 - v30) / (v25 - v29);
  objc_msgSend(v14, "addQuadCurveToPoint:controlPoint:", v25, v27, v29 + (v11 - v30) / v31, v11);
  objc_msgSend(v14, "addLineToPoint:", v29, v30);
  objc_msgSend(v14, "addCurveToPoint:controlPoint1:controlPoint2:", v36 + v29, v37 + v30, v24, v30 + v31 * (v24 - v29), v36 + v29, v35 + v30);
  objc_msgSend(v14, "currentPoint");
  objc_msgSend(v14, "currentPoint");
  objc_msgSend(v14, "currentPoint");
  v33 = v32;
  objc_msgSend(v14, "addLineToPoint:");
  objc_msgSend(v14, "addQuadCurveToPoint:controlPoint:", v39 + v38, v11, v33, v11);
  objc_msgSend(v14, "addLineToPoint:", a4.x, a4.y);
  return v14;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKPinnedConversationTailedActivityItemView contentViewPadding](self, "contentViewPadding");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v35 = v12;
  -[CKPinnedConversationTailedActivityItemView balloonTailHeight](self, "balloonTailHeight");
  v14 = v13;
  -[CKPinnedConversationTailedActivityItemView balloonTailWidth](self, "balloonTailWidth");
  -[CKPinnedConversationTailedActivityItemView pillCornerRadius](self, "pillCornerRadius");
  v15 = -[CKPinnedConversationTailedActivityItemView contentViewContentMode](self, "contentViewContentMode");
  if (v15 == 1)
  {
    -[CKPinnedConversationTailedActivityItemView contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "systemLayoutSizeFittingSize:", width, height);
    v22 = v30;
    v21 = v31;

  }
  else
  {
    v16 = v14;
    v17 = height;
    v34 = width;
    v18 = v9;
    v19 = v11;
    v20 = v7;
    v21 = 0.0;
    v22 = 0.0;
    if (!v15)
    {
      v23 = v16;
      -[CKPinnedConversationTailedActivityItemView contentViewHorizontalInsetForPillCornerRadius](self, "contentViewHorizontalInsetForPillCornerRadius");
      v25 = v34 - v18 - v35 - v24 * 2.0;
      -[CKPinnedConversationTailedActivityItemView contentView](self, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "systemLayoutSizeFittingSize:", v25, v17 - v23 - v20 - v19);

      UICeilToViewScale();
      v21 = v27;
      UICeilToViewScale();
      v22 = v28;
    }
  }
  v32 = v22;
  v33 = v21;
  result.height = v33;
  result.width = v32;
  return result;
}

- (UIEdgeInsets)contentViewPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 5.0;
  v3 = 0.0;
  v4 = 5.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)balloonTailHeight
{
  double result;

  -[CKPinnedConversationTailedActivityItemView pillCornerRadius](self, "pillCornerRadius");
  UIRoundToViewScale();
  return result;
}

- (double)balloonTailWidth
{
  double v2;

  -[CKPinnedConversationTailedActivityItemView balloonTailHeight](self, "balloonTailHeight");
  return v2 * 2.41;
}

- (double)balloonTailRadius
{
  return 3.0;
}

- (double)balloonCornerRadius
{
  return 10.0;
}

- (double)activityItemToContactItemVerticalOverlap
{
  return 3.0;
}

- (double)contentViewHorizontalInsetForPillCornerRadius
{
  double result;

  -[CKPinnedConversationTailedActivityItemView pillCornerRadius](self, "pillCornerRadius");
  UIRoundToViewScale();
  return result;
}

- (void)setOriginationDirection:(int64_t)a3
{
  if (self->_originationDirection != a3)
  {
    self->_originationDirection = a3;
    -[CKPinnedConversationTailedActivityItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOriginationPoint:(CGPoint)a3
{
  if (a3.x != self->_originationPoint.x || a3.y != self->_originationPoint.y)
  {
    self->_originationPoint = a3;
    -[CKPinnedConversationTailedActivityItemView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3
{
  if (self->_preferredTailAttachmentPointXCoordinate != a3)
  {
    self->_preferredTailAttachmentPointXCoordinate = a3;
    -[CKPinnedConversationTailedActivityItemView setNeedsLayout](self, "setNeedsLayout");
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

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationTailedActivityItemView;
  -[CKPinnedConversationTailedActivityItemView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKPinnedConversationTailedActivityItemView _updateUserInterfaceStyles](self, "_updateUserInterfaceStyles");
}

- (void)_updateUserInterfaceStyles
{
  void *v3;
  uint64_t v4;

  -[CKPinnedConversationTailedActivityItemView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[CKPinnedConversationActivityItemViewBackdropLayer setUserInterfaceStyle:](self->_backdropLayer, "setUserInterfaceStyle:", v4);
  -[CKPinnedConversationActivityItemViewShadowLayer setUserInterfaceStyle:](self->_broadShadowLayer, "setUserInterfaceStyle:", v4);
  -[CKPinnedConversationActivityItemViewShadowLayer setUserInterfaceStyle:](self->_tightShadowLayer, "setUserInterfaceStyle:", v4);
}

- (int64_t)contentViewContentMode
{
  return 0;
}

- (CKPinnedConversationActivityItem)activityItem
{
  return self->_activityItem;
}

- (void)setActivityItem:(id)a3
{
  objc_storeStrong((id *)&self->_activityItem, a3);
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

- (int64_t)originationHorizontalDirection
{
  return self->_originationHorizontalDirection;
}

- (void)setOriginationHorizontalDirection:(int64_t)a3
{
  self->_originationHorizontalDirection = a3;
}

- (double)preferredTailAttachmentPointXCoordinate
{
  return self->_preferredTailAttachmentPointXCoordinate;
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

- (UIView)contentView
{
  return self->_contentView;
}

- (double)pillCornerRadius
{
  return self->_pillCornerRadius;
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

- (CAShapeLayer)contentViewStrokeLayer
{
  return self->_contentViewStrokeLayer;
}

- (void)setContentViewStrokeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewStrokeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewStrokeLayer, 0);
  objc_storeStrong((id *)&self->_tightShadowLayer, 0);
  objc_storeStrong((id *)&self->_broadShadowLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_activityItemViewDelegate);
  objc_storeStrong((id *)&self->_activityItem, 0);
}

@end
