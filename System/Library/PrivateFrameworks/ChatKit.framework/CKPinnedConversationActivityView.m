@implementation CKPinnedConversationActivityView

- (CKPinnedConversationActivityView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CKPinnedConversationActivityView *v7;
  CKPinnedConversationActivityView *v8;
  NSMutableArray *v9;
  NSMutableArray *activityItemViews;
  NSMutableArray *v11;
  NSMutableArray *contactItemViews;
  CGPoint v13;
  CGSize v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat MidX;
  CGFloat MidY;
  objc_super v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)CKPinnedConversationActivityView;
  v7 = -[CKPinnedConversationActivityView initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[CKPinnedConversationActivityView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activityItemViews = v8->_activityItemViews;
    v8->_activityItemViews = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contactItemViews = v8->_contactItemViews;
    v8->_contactItemViews = v11;

    v13 = (CGPoint)*MEMORY[0x1E0C9D648];
    v14 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v8->_innerContentAlignmentFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v8->_innerContentAlignmentFrame.size = v14;
    v8->_outerContentAlignmentFrame.origin = v13;
    v8->_outerContentAlignmentFrame.size = v14;
    v13.x = x;
    v14.width = y;
    v15 = width;
    v16 = height;
    MidX = CGRectGetMidX(*(CGRect *)&v13.x);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    MidY = CGRectGetMidY(v21);
    v8->_activityItemOriginationPoint.x = MidX;
    v8->_activityItemOriginationPoint.y = MidY;
  }
  return v8;
}

- (void)setShowContentAlignmentDebugFrames:(BOOL)a3
{
  CAShapeLayer *v4;
  CAShapeLayer *innerContentAlignmentDebugLayer;
  id v6;
  void *v7;
  CAShapeLayer *v8;
  CAShapeLayer *outerContentAlignmentDebugLayer;
  id v10;
  void *v11;
  CAShapeLayer *v12;
  CAShapeLayer *activityItemAttachmentCircleDebugLayer;
  id v14;
  void *v15;
  CAShapeLayer *v16;
  CAShapeLayer *originationPointDebugLayer;
  id v18;
  void *v19;
  CAShapeLayer *v20;
  CAShapeLayer *v21;
  CAShapeLayer *v22;

  if (self->_showContentAlignmentDebugFrames != a3)
  {
    self->_showContentAlignmentDebugFrames = a3;
    if (a3)
    {
      v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      innerContentAlignmentDebugLayer = self->_innerContentAlignmentDebugLayer;
      self->_innerContentAlignmentDebugLayer = v4;

      -[CAShapeLayer setFillColor:](self->_innerContentAlignmentDebugLayer, "setFillColor:", 0);
      objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](self->_innerContentAlignmentDebugLayer, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

      -[CAShapeLayer setLineDashPattern:](self->_innerContentAlignmentDebugLayer, "setLineDashPattern:", &unk_1E286F388);
      -[CKPinnedConversationActivityView layer](self, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSublayer:", self->_innerContentAlignmentDebugLayer);

      v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      outerContentAlignmentDebugLayer = self->_outerContentAlignmentDebugLayer;
      self->_outerContentAlignmentDebugLayer = v8;

      -[CAShapeLayer setFillColor:](self->_outerContentAlignmentDebugLayer, "setFillColor:", 0);
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](self->_outerContentAlignmentDebugLayer, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

      -[CAShapeLayer setLineDashPattern:](self->_outerContentAlignmentDebugLayer, "setLineDashPattern:", &unk_1E286F3A0);
      -[CKPinnedConversationActivityView layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSublayer:", self->_outerContentAlignmentDebugLayer);

      v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      activityItemAttachmentCircleDebugLayer = self->_activityItemAttachmentCircleDebugLayer;
      self->_activityItemAttachmentCircleDebugLayer = v12;

      -[CAShapeLayer setFillColor:](self->_activityItemAttachmentCircleDebugLayer, "setFillColor:", 0);
      objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](self->_activityItemAttachmentCircleDebugLayer, "setStrokeColor:", objc_msgSend(v14, "CGColor"));

      -[CAShapeLayer setLineDashPattern:](self->_activityItemAttachmentCircleDebugLayer, "setLineDashPattern:", &unk_1E286F3B8);
      -[CKPinnedConversationActivityView layer](self, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSublayer:", self->_activityItemAttachmentCircleDebugLayer);

      v16 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      originationPointDebugLayer = self->_originationPointDebugLayer;
      self->_originationPointDebugLayer = v16;

      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](self->_originationPointDebugLayer, "setFillColor:", objc_msgSend(v18, "CGColor"));

      -[CKPinnedConversationActivityView layer](self, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSublayer:", self->_originationPointDebugLayer);
    }
    else
    {
      -[CAShapeLayer removeFromSuperlayer](self->_innerContentAlignmentDebugLayer, "removeFromSuperlayer");
      v20 = self->_innerContentAlignmentDebugLayer;
      self->_innerContentAlignmentDebugLayer = 0;

      -[CAShapeLayer removeFromSuperlayer](self->_outerContentAlignmentDebugLayer, "removeFromSuperlayer");
      v21 = self->_outerContentAlignmentDebugLayer;
      self->_outerContentAlignmentDebugLayer = 0;

      -[CAShapeLayer removeFromSuperlayer](self->_activityItemAttachmentCircleDebugLayer, "removeFromSuperlayer");
      v22 = self->_activityItemAttachmentCircleDebugLayer;
      self->_activityItemAttachmentCircleDebugLayer = 0;

      -[CAShapeLayer removeFromSuperlayer](self->_originationPointDebugLayer, "removeFromSuperlayer");
      v19 = self->_originationPointDebugLayer;
      self->_originationPointDebugLayer = 0;
    }

    -[CKPinnedConversationActivityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  id v5;
  CGFloat v6;
  id v7;
  id v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationActivityView;
  -[CKPinnedConversationActivityView layoutSubviews](&v9, sel_layoutSubviews);
  -[CKPinnedConversationActivityView _layoutViewsAssociatedWithActivityItemViews:excludingContactItemViews:withContentScale:applyingTransform:updatingActivityItemViews:updatingAttachedContactItemViews:](self, "_layoutViewsAssociatedWithActivityItemViews:excludingContactItemViews:withContentScale:applyingTransform:updatingActivityItemViews:updatingAttachedContactItemViews:", self->_activityItemViews, MEMORY[0x1E0C9AA60], 0, 0, 1, 1);
  -[CKPinnedConversationActivityView _unattachedContactItemViews](self, "_unattachedContactItemViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationActivityView _layoutUnattachedContactItemViews:withContentScale:applyingTransform:](self, "_layoutUnattachedContactItemViews:withContentScale:applyingTransform:", v3, 0, 0);
  if (self->_showContentAlignmentDebugFrames)
  {
    -[CKPinnedConversationActivityView bounds](self, "bounds");
    -[CAShapeLayer setFrame:](self->_innerContentAlignmentDebugLayer, "setFrame:");
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", self->_innerContentAlignmentFrame.origin.x, self->_innerContentAlignmentFrame.origin.y, self->_innerContentAlignmentFrame.size.width, self->_innerContentAlignmentFrame.size.height);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_innerContentAlignmentDebugLayer, "setPath:", objc_msgSend(v4, "CGPath"));

    -[CKPinnedConversationActivityView bounds](self, "bounds");
    -[CAShapeLayer setFrame:](self->_outerContentAlignmentDebugLayer, "setFrame:");
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", self->_outerContentAlignmentFrame.origin.x, self->_outerContentAlignmentFrame.origin.y, self->_outerContentAlignmentFrame.size.width, self->_outerContentAlignmentFrame.size.height);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_outerContentAlignmentDebugLayer, "setPath:", objc_msgSend(v5, "CGPath"));

    -[CKPinnedConversationActivityView bounds](self, "bounds");
    -[CAShapeLayer setFrame:](self->_activityItemAttachmentCircleDebugLayer, "setFrame:");
    -[CKPinnedConversationActivityView activityItemAttachmentCircleRadiusInsetForAvatarFrame:](self, "activityItemAttachmentCircleRadiusInsetForAvatarFrame:", self->_avatarFrame.origin.x, self->_avatarFrame.origin.y, self->_avatarFrame.size.width, self->_avatarFrame.size.height);
    v10 = CGRectInset(self->_avatarFrame, v6, v6);
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_activityItemAttachmentCircleDebugLayer, "setPath:", objc_msgSend(v7, "CGPath"));

    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", self->_activityItemOriginationPoint.x + -3.0, self->_activityItemOriginationPoint.y + -3.0, 6.0, 6.0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_originationPointDebugLayer, "setPath:", objc_msgSend(v8, "CGPath"));

  }
}

- (id)_unattachedContactItemViews
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = self->_activityItemViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "activityItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attachedContactItemIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
          objc_msgSend(v3, "addObject:", v10);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = self->_contactItemViews;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(v17, "pinnedConversationContactItem", (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "contactItemIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "length") && (objc_msgSend(v3, "containsObject:", v19) & 1) == 0)
          objc_msgSend(v11, "addObject:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v14);
  }

  v20 = (void *)objc_msgSend(v11, "copy");
  return v20;
}

- (id)_presentedActivityItems
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_activityItemViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "activityItem", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_activityItemViewWithActivityItemIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_activityItemViews;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "activityItem", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "activityItemIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", v4) & 1) != 0)
        {
          v6 = v9;

          goto LABEL_11;
        }

      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setActivityItemOriginationDirection:(int64_t)a3
{
  if (self->_activityItemOriginationDirection != a3)
  {
    self->_activityItemOriginationDirection = a3;
    -[CKPinnedConversationActivityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setInnerContentAlignmentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_innerContentAlignmentFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_innerContentAlignmentFrame = &self->_innerContentAlignmentFrame;
  if (!CGRectEqualToRect(a3, self->_innerContentAlignmentFrame))
  {
    p_innerContentAlignmentFrame->origin.x = x;
    p_innerContentAlignmentFrame->origin.y = y;
    p_innerContentAlignmentFrame->size.width = width;
    p_innerContentAlignmentFrame->size.height = height;
    -[CKPinnedConversationActivityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOuterContentAlignmentFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_outerContentAlignmentFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_outerContentAlignmentFrame = &self->_outerContentAlignmentFrame;
  if (!CGRectEqualToRect(a3, self->_outerContentAlignmentFrame))
  {
    p_outerContentAlignmentFrame->origin.x = x;
    p_outerContentAlignmentFrame->origin.y = y;
    p_outerContentAlignmentFrame->size.width = width;
    p_outerContentAlignmentFrame->size.height = height;
    -[CKPinnedConversationActivityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setActivityItemOriginationPoint:(CGPoint)a3
{
  if (self->_activityItemOriginationPoint.x != a3.x || self->_activityItemOriginationPoint.y != a3.y)
  {
    self->_activityItemOriginationPoint = a3;
    -[CKPinnedConversationActivityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)contactItemViewMatchingContactItemIdentifier:(id)a3 fromContactItemViews:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "pinnedConversationContactItem", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contactItemIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v12, "isEqualToString:", v5) & 1) != 0)
        {
          v7 = v10;

          goto LABEL_11;
        }

      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)applySnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;

  v6 = a4;
  objc_storeStrong((id *)&self->_latestSnapshot, a3);
  v8 = a5;
  -[CKPinnedConversationActivityView _updateSnapshotAnimated:completion:](self, "_updateSnapshotAnimated:completion:", v6, v8);

}

- (void)_updateSnapshotAnimated:(BOOL)a3 completion:(id)a4
{
  CKPinnedConversationActivitySnapshot *v5;
  CKPinnedConversationActivitySnapshot *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t ii;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t jj;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t kk;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t mm;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  NSMutableArray **p_contactItemViews;
  uint64_t v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t nn;
  void *v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t i1;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  unint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  double v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  NSObject *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  CKPinnedConversationActivitySnapshot *v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  void *v159;
  void *v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id obj;
  id v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  id v175;
  id v176;
  _BOOL4 group;
  NSObject *groupa;
  _QWORD block[4];
  id v180;
  _QWORD v181[5];
  id v182;
  _QWORD v183[4];
  NSObject *v184;
  _QWORD v185[5];
  id v186;
  _QWORD v187[4];
  NSObject *v188;
  _QWORD v189[5];
  id v190;
  _QWORD v191[4];
  NSObject *v192;
  _QWORD v193[5];
  id v194;
  _QWORD v195[5];
  id v196;
  _QWORD v197[5];
  id v198;
  id v199;
  _QWORD v200[5];
  id v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _QWORD v210[4];
  id v211;
  NSObject *v212;
  _QWORD v213[5];
  id v214;
  _QWORD v215[4];
  id v216;
  NSObject *v217;
  _QWORD v218[5];
  id v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  _BYTE v265[128];
  _BYTE v266[128];
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  _BYTE v271[128];
  uint64_t v272;

  group = a3;
  v272 = *MEMORY[0x1E0C80C00];
  v149 = a4;
  if (-[CKPinnedConversationActivityView isSuppressingActivity](self, "isSuppressingActivity"))
  {
    +[CKPinnedConversationActivitySnapshot emptySnapshot](CKPinnedConversationActivitySnapshot, "emptySnapshot");
    v5 = (CKPinnedConversationActivitySnapshot *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_latestSnapshot;
  }
  v6 = v5;
  -[CKPinnedConversationActivityView _presentedActivityItems](self, "_presentedActivityItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationActivitySnapshot activityItems](v6, "activityItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v165 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v176 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v164 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v163 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v256 = 0u;
  v257 = 0u;
  v258 = 0u;
  v259 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v256, v271, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v257;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v257 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * i);
        objc_msgSend(v15, "activityItemIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke((uint64_t)v16, v7, v16);
        v18 = v176;
        if (!v17)
        {
          if (objc_msgSend(v15, "activityItemAppearsWithAnimation"))
            v18 = v9;
          else
            v18 = v165;
        }
        objc_msgSend(v18, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v256, v271, 16);
    }
    while (v12);
  }

  v254 = 0u;
  v255 = 0u;
  v252 = 0u;
  v253 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v252, v270, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v253;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v253 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * j);
        objc_msgSend(v24, "activityItemIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!__71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke((uint64_t)v25, v176, v25))
        {
          if (objc_msgSend(v24, "activityItemDisappearsWithAnimation"))
            v26 = v164;
          else
            v26 = v163;
          objc_msgSend(v26, "addObject:", v24);
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v252, v270, 16);
    }
    while (v21);
  }

  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v248 = 0u;
  v249 = 0u;
  v250 = 0u;
  v251 = 0u;
  v28 = v19;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v248, v269, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v249;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v249 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v248 + 1) + 8 * k), "attachedContactItemIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "length"))
          objc_msgSend(v27, "addObject:", v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v248, v269, 16);
    }
    while (v30);
  }

  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v244 = 0u;
  v245 = 0u;
  v246 = 0u;
  v247 = 0u;
  obj = v10;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v244, v268, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v245;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v245 != v37)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v244 + 1) + 8 * m), "attachedContactItemIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "length"))
          objc_msgSend(v34, "addObject:", v39);

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v244, v268, 16);
    }
    while (v36);
  }
  v148 = v28;
  v150 = v9;

  v154 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v170 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v162 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v155 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v158 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v161 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v153 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKPinnedConversationActivityView contactItemViews](self, "contactItemViews");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = (void *)objc_msgSend(v40, "copy");

  v151 = v6;
  -[CKPinnedConversationActivitySnapshot contactItems](v6, "contactItems");
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  v243 = 0u;
  v167 = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v240, v267, 16);
  v159 = v34;
  v160 = v27;
  if (v41)
  {
    v42 = v41;
    v172 = *(_QWORD *)v241;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v241 != v172)
          objc_enumerationMutation(v167);
        v44 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * v43);
        objc_msgSend(v44, "contactItemIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v34, "containsObject:", v45);
        -[CKPinnedConversationActivityView contactItemViewMatchingContactItemIdentifier:fromContactItemViews:](self, "contactItemViewMatchingContactItemIdentifier:fromContactItemViews:", v45, v174);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v46)
        {
          if (!v47)
            goto LABEL_55;
          v49 = objc_msgSend(v27, "containsObject:", v45);
          objc_msgSend(v48, "pinnedConversationContactItem");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "contactItemAlignment");
          v52 = objc_msgSend(v44, "contactItemAlignment");

          if ((v49 & 1) == 0 && v51 != v52)
          {
            objc_msgSend(v154, "addObject:", v48);
            v34 = v159;
            v27 = v160;
LABEL_55:
            objc_msgSend(v44, "contactItemView");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "addObject:", v53);
            v54 = v162;
LABEL_62:
            objc_msgSend(v54, "addObject:", v53);

            goto LABEL_63;
          }
          objc_msgSend(v162, "addObject:", v48);
          objc_msgSend(v153, "addObject:", v48);
          v34 = v159;
          v27 = v160;
        }
        else
        {
          if (!v47
            || (objc_msgSend(v47, "pinnedConversationContactItem"),
                v55 = (void *)objc_claimAutoreleasedReturnValue(),
                v56 = objc_msgSend(v55, "contactItemAlignment"),
                v55,
                v56 != objc_msgSend(v44, "contactItemAlignment")))
          {
            objc_msgSend(v44, "contactItemView");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "addObject:", v53);
            v54 = v161;
            if (group)
            {
              objc_msgSend(v158, "addObject:", v53);
              v54 = v155;
            }
            goto LABEL_62;
          }
          if (group)
            v57 = v158;
          else
            v57 = v161;
          objc_msgSend(v57, "addObject:", v48);
        }
LABEL_63:

        ++v43;
      }
      while (v42 != v43);
      v58 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v240, v267, 16);
      v42 = v58;
    }
    while (v58);
  }

  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v59, "addObjectsFromArray:", v162);
  objc_msgSend(v59, "addObjectsFromArray:", v158);
  objc_msgSend(v59, "addObjectsFromArray:", v161);
  v238 = 0u;
  v239 = 0u;
  v236 = 0u;
  v237 = 0u;
  v60 = v174;
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v236, v266, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v237;
    do
    {
      for (n = 0; n != v62; ++n)
      {
        if (*(_QWORD *)v237 != v63)
          objc_enumerationMutation(v60);
        v65 = *(_QWORD *)(*((_QWORD *)&v236 + 1) + 8 * n);
        if ((objc_msgSend(v154, "containsObjectIdenticalTo:", v65) & 1) == 0
          && (objc_msgSend(v59, "containsObjectIdenticalTo:", v65) & 1) == 0)
        {
          objc_msgSend(v154, "addObject:", v65);
        }
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v236, v266, 16);
    }
    while (v62);
  }
  v147 = v60;

  v234 = 0u;
  v235 = 0u;
  v232 = 0u;
  v233 = 0u;
  v66 = v167;
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v232, v265, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v233;
    do
    {
      for (ii = 0; ii != v68; ++ii)
      {
        if (*(_QWORD *)v233 != v69)
          objc_enumerationMutation(v66);
        v71 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * ii);
        objc_msgSend(v71, "contactItemIdentifier");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKPinnedConversationActivityView contactItemViewMatchingContactItemIdentifier:fromContactItemViews:](self, "contactItemViewMatchingContactItemIdentifier:fromContactItemViews:", v72, v59);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setPinnedConversationContactItem:", v71);

      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v232, v265, 16);
    }
    while (v68);
  }
  v173 = v59;
  v146 = v66;

  v157 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v152 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v175 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v156 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v74, "addObjectsFromArray:", v163);
  objc_msgSend(v74, "addObjectsFromArray:", v164);
  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  v168 = v74;
  v75 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v228, v264, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v229;
    do
    {
      for (jj = 0; jj != v76; ++jj)
      {
        if (*(_QWORD *)v229 != v77)
          objc_enumerationMutation(v168);
        v79 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * jj);
        objc_msgSend(v79, "activityItemIdentifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKPinnedConversationActivityView _activityItemViewWithActivityItemIdentifier:](self, "_activityItemViewWithActivityItemIdentifier:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (group && objc_msgSend(v79, "activityItemDisappearsWithAnimation"))
        {
          objc_msgSend(v156, "addObject:", v81);
        }
        else
        {
          objc_msgSend(v81, "removeFromSuperview");
          -[NSMutableArray removeObject:](self->_activityItemViews, "removeObject:", v81);
        }

      }
      v76 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v228, v264, 16);
    }
    while (v76);
  }

  v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v82, "addObjectsFromArray:", v165);
  objc_msgSend(v82, "addObjectsFromArray:", v150);
  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  v166 = v82;
  v83 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v224, v263, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v225;
    do
    {
      for (kk = 0; kk != v84; ++kk)
      {
        if (*(_QWORD *)v225 != v85)
          objc_enumerationMutation(v166);
        v87 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * kk);
        objc_msgSend(v87, "activityItemView");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setActivityItemViewDelegate:", self);
        -[NSMutableArray addObject:](self->_activityItemViews, "addObject:", v88);
        -[CKPinnedConversationActivityView addSubview:](self, "addSubview:", v88);
        v89 = v175;
        if (group)
        {
          v90 = objc_msgSend(v87, "activityItemAppearsWithAnimation");
          v89 = v175;
          if (v90)
          {
            objc_msgSend(v152, "addObject:", v88);
            v89 = v157;
          }
        }
        objc_msgSend(v89, "addObject:", v88);

      }
      v84 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v224, v263, 16);
    }
    while (v84);
  }

  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v91 = v170;
  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v220, v262, 16);
  if (v92)
  {
    v93 = v92;
    v94 = *(_QWORD *)v221;
    do
    {
      for (mm = 0; mm != v93; ++mm)
      {
        if (*(_QWORD *)v221 != v94)
          objc_enumerationMutation(v91);
        v96 = *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * mm);
        -[CKPinnedConversationActivityView addSubview:](self, "addSubview:", v96);
        -[NSMutableArray addObject:](self->_contactItemViews, "addObject:", v96);
      }
      v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v220, v262, 16);
    }
    while (v93);
  }

  v97 = dispatch_group_create();
  v98 = objc_msgSend(v156, "count");
  v99 = MEMORY[0x1E0C809B0];
  if (v98)
  {
    dispatch_group_enter(v97);
    -[NSMutableArray removeObjectsInArray:](self->_activityItemViews, "removeObjectsInArray:", v156);
    v100 = (void *)MEMORY[0x1E0CEABB0];
    v218[0] = v99;
    v218[1] = 3221225472;
    v218[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3;
    v218[3] = &unk_1E274A108;
    v218[4] = self;
    v219 = v156;
    v215[0] = v99;
    v215[1] = 3221225472;
    v215[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_36;
    v215[3] = &unk_1E274BE58;
    v216 = v219;
    v217 = v97;
    objc_msgSend(v100, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v218, v215, 0.8, 0.0, 0.75, 0.0);

  }
  if (objc_msgSend(v154, "count"))
  {
    dispatch_group_enter(v97);
    -[NSMutableArray removeObjectsInArray:](self->_contactItemViews, "removeObjectsInArray:", v154);
    v101 = (void *)MEMORY[0x1E0CEABB0];
    v102 = MEMORY[0x1E0C809B0];
    v213[0] = MEMORY[0x1E0C809B0];
    v213[1] = 3221225472;
    v213[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2_38;
    v213[3] = &unk_1E274A108;
    v213[4] = self;
    v214 = v154;
    v210[0] = v102;
    v210[1] = 3221225472;
    v210[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3_39;
    v210[3] = &unk_1E274BE58;
    v211 = v214;
    v212 = v97;
    objc_msgSend(v101, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v213, v210, 0.8, 0.0, 0.75, 0.0);

  }
  groupa = v97;
  v171 = v91;
  -[CKPinnedConversationActivitySnapshot contactItems](v151, "contactItems");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "count");
  p_contactItemViews = &self->_contactItemViews;
  v106 = -[NSMutableArray count](self->_contactItemViews, "count");

  if (v104 != v106)
  {
    -[CKPinnedConversationActivitySnapshot contactItems](v151, "contactItems");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v107, "count");
    v145 = -[NSMutableArray count](*p_contactItemViews, "count");
    _IMWarn();

  }
  v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v206 = 0u;
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  -[CKPinnedConversationActivitySnapshot contactItems](v151, "contactItems");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v206, v261, 16);
  if (v110)
  {
    v111 = v110;
    v112 = *(_QWORD *)v207;
    do
    {
      for (nn = 0; nn != v111; ++nn)
      {
        if (*(_QWORD *)v207 != v112)
          objc_enumerationMutation(v109);
        objc_msgSend(*(id *)(*((_QWORD *)&v206 + 1) + 8 * nn), "contactItemIdentifier", v144, v145);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKPinnedConversationActivityView contactItemViewMatchingContactItemIdentifier:fromContactItemViews:](self, "contactItemViewMatchingContactItemIdentifier:fromContactItemViews:", v114, v59);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if (v115)
        {
          objc_msgSend(v108, "addObject:", v115);
        }
        else
        {
          v144 = (uint64_t)v114;
          _IMWarn();
        }
        objc_storeStrong((id *)p_contactItemViews, v108);

      }
      v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v206, v261, 16);
    }
    while (v111);
  }

  v204 = 0u;
  v205 = 0u;
  v202 = 0u;
  v203 = 0u;
  v116 = v176;
  v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v202, v260, 16);
  if (v117)
  {
    v118 = v117;
    v119 = *(_QWORD *)v203;
    do
    {
      for (i1 = 0; i1 != v118; ++i1)
      {
        if (*(_QWORD *)v203 != v119)
          objc_enumerationMutation(v116);
        v121 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * i1);
        objc_msgSend(v121, "activityItemIdentifier", v144);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKPinnedConversationActivityView _activityItemViewWithActivityItemIdentifier:](self, "_activityItemViewWithActivityItemIdentifier:", v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setActivityItem:", v121);
        objc_msgSend(v157, "addObject:", v123);

      }
      v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v202, v260, 16);
    }
    while (v118);
  }

  v124 = objc_msgSend(v175, "count");
  v125 = MEMORY[0x1E0C809B0];
  if (v124)
  {
    v126 = (void *)MEMORY[0x1E0CEABB0];
    v200[0] = MEMORY[0x1E0C809B0];
    v200[1] = 3221225472;
    v200[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_4;
    v200[3] = &unk_1E274A108;
    v200[4] = self;
    v201 = v175;
    objc_msgSend(v126, "performWithoutAnimation:", v200);

  }
  v127 = 0x1E0CEA000;
  if (objc_msgSend(v152, "count", v144))
  {
    v128 = (void *)MEMORY[0x1E0CEABB0];
    v197[0] = v125;
    v197[1] = 3221225472;
    v197[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_5;
    v197[3] = &unk_1E274A0B8;
    v197[4] = self;
    v198 = v152;
    v199 = v153;
    v129 = v128;
    v127 = 0x1E0CEA000;
    objc_msgSend(v129, "performWithoutAnimation:", v197);

  }
  if (objc_msgSend(v155, "count"))
  {
    v130 = (void *)MEMORY[0x1E0CEABB0];
    v195[0] = v125;
    v195[1] = 3221225472;
    v195[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_45;
    v195[3] = &unk_1E274A108;
    v195[4] = self;
    v196 = v155;
    v131 = v130;
    v127 = 0x1E0CEA000;
    objc_msgSend(v131, "performWithoutAnimation:", v195);

  }
  if (objc_msgSend(v157, "count"))
  {
    v132 = 0.0;
    if (-[CKPinnedConversationActivityView haveAttachedContactItemViewsForActivityViews:](self, "haveAttachedContactItemViewsForActivityViews:", v157))
    {
      dispatch_group_enter(groupa);
      v133 = (void *)MEMORY[0x1E0CEABB0];
      v134 = MEMORY[0x1E0C809B0];
      v193[0] = MEMORY[0x1E0C809B0];
      v193[1] = 3221225472;
      v193[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_47;
      v193[3] = &unk_1E274A108;
      v193[4] = self;
      v194 = v157;
      v191[0] = v134;
      v191[1] = 3221225472;
      v191[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2_48;
      v191[3] = &unk_1E274A1B8;
      v192 = groupa;
      v132 = 0.0;
      objc_msgSend(v133, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v193, v191, 0.8, 0.0, 0.75, 0.0);

      if (objc_msgSend(v152, "count"))
        v132 = 0.25;
    }
    dispatch_group_enter(groupa);
    v135 = (void *)MEMORY[0x1E0CEABB0];
    v136 = MEMORY[0x1E0C809B0];
    v189[0] = MEMORY[0x1E0C809B0];
    v189[1] = 3221225472;
    v189[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3_49;
    v189[3] = &unk_1E274A108;
    v189[4] = self;
    v190 = v157;
    v187[0] = v136;
    v187[1] = 3221225472;
    v187[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_4_50;
    v187[3] = &unk_1E274A1B8;
    v125 = v136;
    v188 = groupa;
    v137 = v135;
    v127 = 0x1E0CEA000;
    objc_msgSend(v137, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v189, v187, 0.8, v132, 0.75, 0.0);

  }
  if (objc_msgSend(v158, "count"))
  {
    dispatch_group_enter(groupa);
    v138 = (void *)MEMORY[0x1E0CEABB0];
    v185[0] = MEMORY[0x1E0C809B0];
    v185[1] = 3221225472;
    v185[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_5_51;
    v185[3] = &unk_1E274A108;
    v185[4] = self;
    v186 = v158;
    v183[0] = MEMORY[0x1E0C809B0];
    v183[1] = 3221225472;
    v183[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_6;
    v183[3] = &unk_1E274A1B8;
    v139 = groupa;
    v125 = MEMORY[0x1E0C809B0];
    v184 = v139;
    v140 = v138;
    v127 = 0x1E0CEA000uLL;
    objc_msgSend(v140, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v185, v183, 0.8, 0.0, 0.75, 0.0);

  }
  if (objc_msgSend(v161, "count"))
  {
    v141 = *(void **)(v127 + 2992);
    v181[0] = v125;
    v181[1] = 3221225472;
    v181[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_7;
    v181[3] = &unk_1E274A108;
    v181[4] = self;
    v182 = v161;
    objc_msgSend(v141, "performWithoutAnimation:", v181);

  }
  if (v149)
  {
    v142 = MEMORY[0x1E0C80D38];
    v143 = MEMORY[0x1E0C80D38];
    block[0] = v125;
    block[1] = 3221225472;
    block[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_8;
    block[3] = &unk_1E274AED0;
    v180 = v149;
    dispatch_group_notify(groupa, v142, block);

  }
}

BOOL __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2;
  v8[3] = &unk_1E274DF48;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a2, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "activityItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViewsAssociatedWithActivityItemViews:excludingContactItemViews:withContentScale:applyingTransform:updatingActivityItemViews:updatingAttachedContactItemViews:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], &unk_1E2871160, 1, 1, 0);
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_36(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeFromSuperview", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2_38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutUnattachedContactItemViews:withContentScale:applyingTransform:", *(_QWORD *)(a1 + 40), &unk_1E2871160, 1);
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3_39(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeFromSuperview", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViewsAssociatedWithActivityItemViews:excludingContactItemViews:withContentScale:applyingTransform:updatingActivityItemViews:updatingAttachedContactItemViews:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], 0, 0, 1, 1);
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViewsAssociatedWithActivityItemViews:excludingContactItemViews:withContentScale:applyingTransform:updatingActivityItemViews:updatingAttachedContactItemViews:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &unk_1E2871170, 1, 1, 1);
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutUnattachedContactItemViews:withContentScale:applyingTransform:", *(_QWORD *)(a1 + 40), &unk_1E2871180, 1);
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_47(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViewsAssociatedWithActivityItemViews:excludingContactItemViews:withContentScale:applyingTransform:updatingActivityItemViews:updatingAttachedContactItemViews:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], 0, 1, 0, 1);
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_2_48(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_3_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutViewsAssociatedWithActivityItemViews:excludingContactItemViews:withContentScale:applyingTransform:updatingActivityItemViews:updatingAttachedContactItemViews:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], 0, 1, 1, 0);
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_4_50(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_5_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutUnattachedContactItemViews:withContentScale:applyingTransform:", *(_QWORD *)(a1 + 40), 0, 1);
}

void __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutUnattachedContactItemViews:withContentScale:applyingTransform:", *(_QWORD *)(a1 + 40), 0, 1);
}

uint64_t __71__CKPinnedConversationActivityView__updateSnapshotAnimated_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_layoutViewsAssociatedWithActivityItemViews:(id)a3 excludingContactItemViews:(id)a4 withContentScale:(id)a5 applyingTransform:(BOOL)a6 updatingActivityItemViews:(BOOL)a7 updatingAttachedContactItemViews:(BOOL)a8
{
  id v11;
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
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect *p_outerContentAlignmentFrame;
  double width;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int64_t v36;
  int v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat x;
  CGFloat y;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  CGRect *p_innerContentAlignmentFrame;
  double v67;
  int v68;
  double MaxX;
  double MinX;
  double v71;
  CGRect *v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double MidX;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  id v106;
  id obj;
  double height;
  double v109;
  double v110;
  double v111;
  uint64_t v112;
  double v113;
  _BOOL4 v114;
  _BOOL4 v115;
  id v116;
  uint64_t v117;
  _BOOL8 v118;
  int v119;
  double v120;
  int64_t v121;
  double v122;
  double v123;
  _BOOL4 v124;
  CGAffineTransform v125;
  CGAffineTransform v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  uint64_t v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;

  v114 = a6;
  v115 = a8;
  v124 = a7;
  v132 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v106 = a4;
  v116 = a5;
  -[CKPinnedConversationActivityView avatarFrame](self, "avatarFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CKPinnedConversationActivityView activityItemOriginationSubAvatarFrame](self, "activityItemOriginationSubAvatarFrame");
  v100 = v21;
  v101 = v20;
  v98 = v23;
  v99 = v22;
  v110 = v15;
  v111 = v13;
  v122 = v19;
  v123 = v17;
  -[CKPinnedConversationActivityView contactItemViewDiameterForAvatarFrame:](self, "contactItemViewDiameterForAvatarFrame:", v13, v15, v17, v19);
  v95 = v24;
  v121 = -[CKPinnedConversationActivityView activityItemOriginationDirection](self, "activityItemOriginationDirection");
  -[CKPinnedConversationActivityView activityItemOriginationPoint](self, "activityItemOriginationPoint");
  v104 = v26;
  v105 = v25;
  p_outerContentAlignmentFrame = &self->_outerContentAlignmentFrame;
  width = self->_outerContentAlignmentFrame.size.width;
  height = self->_outerContentAlignmentFrame.size.height;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  obj = v11;
  v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v131, 16);
  if (v117)
  {
    v112 = *(_QWORD *)v128;
    v96 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v97 = *MEMORY[0x1E0C9D538];
    v109 = v95 * 0.5;
    v113 = width;
    do
    {
      for (i = 0; i != v117; ++i)
      {
        if (*(_QWORD *)v128 != v112)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
        objc_msgSend(v30, "activityItem");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setParentAvatarViewSize:", v123, v122);
        objc_msgSend(v31, "attachedContactItemIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "length"))
        {
          -[CKPinnedConversationActivityView contactItemViewMatchingContactItemIdentifier:fromContactItemViews:](self, "contactItemViewMatchingContactItemIdentifier:fromContactItemViews:", v32, self->_contactItemViews);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "pinnedConversationContactItem");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "contactItemAlignment");

          v36 = -[CKPinnedConversationActivityView activityViewContentAlignmentForContactItemAlignment:](self, "activityViewContentAlignmentForContactItemAlignment:", v35);
        }
        else
        {
          v33 = 0;
          v36 = 1;
        }
        if (v115)
          v37 = objc_msgSend(v106, "containsObjectIdenticalTo:", v33) ^ 1;
        else
          v37 = 0;
        if (v116)
          objc_msgSend(v116, "doubleValue");
        else
          objc_msgSend(v31, "activityItemContentScale");
        v39 = v38;
        if (v114)
        {
          memset(&v126, 0, sizeof(v126));
          CGAffineTransformMakeScale(&v126, v38, v38);
          if (v124)
          {
            v125 = v126;
            objc_msgSend(v30, "setTransform:", &v125);
          }
          if (v37)
          {
            v125 = v126;
            objc_msgSend(v33, "setTransform:", &v125);
          }
        }
        if (objc_msgSend(v30, "supportsActivityItemViewContentScale"))
        {
          objc_msgSend(v30, "setActivityItemViewContentScale:", 1);
          objc_msgSend(v30, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
          if (v40 < width)
            goto LABEL_24;
          objc_msgSend(v30, "setActivityItemViewContentScale:", 0);
        }
        objc_msgSend(v30, "sizeThatFits:", width, height);
LABEL_24:
        v42 = v40;
        v43 = v41;
        if (v124)
        {
          objc_msgSend(v30, "setBounds:", 0.0, 0.0, v40, v41);
          objc_msgSend(v30, "setOriginationDirection:", v121);
        }
        x = p_outerContentAlignmentFrame->origin.x;
        y = self->_outerContentAlignmentFrame.origin.y;
        v46 = self->_outerContentAlignmentFrame.size.width;
        v47 = self->_outerContentAlignmentFrame.size.height;
        v120 = v39;
        if (v121)
        {
          CGRectGetMaxY(*(CGRect *)&x);
          UIRoundToViewScale();
          v49 = v48;
          v133.origin.x = p_outerContentAlignmentFrame->origin.x;
          v133.origin.y = self->_outerContentAlignmentFrame.origin.y;
          v133.size.width = self->_outerContentAlignmentFrame.size.width;
          v133.size.height = self->_outerContentAlignmentFrame.size.height;
          CGRectGetMaxY(v133);
          UIRoundToViewScale();
          v51 = v50;
          if (!v33)
            goto LABEL_35;
          objc_msgSend(v30, "activityItemToContactItemVerticalOverlap");
          v53 = v49 + v52;
          objc_msgSend(v31, "activityItemContentScale");
          v55 = -(v95 * 0.5);
        }
        else
        {
          CGRectGetMinY(*(CGRect *)&x);
          UIRoundToViewScale();
          v49 = v56;
          v134.origin.x = p_outerContentAlignmentFrame->origin.x;
          v134.origin.y = self->_outerContentAlignmentFrame.origin.y;
          v134.size.width = self->_outerContentAlignmentFrame.size.width;
          v134.size.height = self->_outerContentAlignmentFrame.size.height;
          CGRectGetMinY(v134);
          UIRoundToViewScale();
          v51 = v57;
          if (!v33)
          {
LABEL_35:
            v135.size.width = v100;
            v135.origin.x = v101;
            v135.size.height = v98;
            v135.origin.y = v99;
            if (CGRectIsEmpty(v135) || (objc_msgSend(v30, "supportsAlignmentWithOriginationSubAvatarFrame") & 1) == 0)
            {
              -[CKPinnedConversationActivityView tailAttachmentXCoordinateForYCoordinate:avatarFrame:contentAlignment:](self, "tailAttachmentXCoordinateForYCoordinate:avatarFrame:contentAlignment:", v36, v49, v111, v110, v123, v122);
              v64 = v65;
              v118 = v36 != 1;
            }
            else
            {
              v118 = 0;
              v64 = v101 + v100 * 0.684210526;
            }
            v63 = v49 + (v51 - v49) * v39;
            v119 = 1;
            v59 = v96;
            v61 = v97;
            if (v36 == 1)
              goto LABEL_41;
            goto LABEL_42;
          }
          objc_msgSend(v30, "activityItemToContactItemVerticalOverlap");
          v53 = v49 - v58;
          objc_msgSend(v31, "activityItemContentScale");
          v55 = v95 * 0.5;
        }
        v59 = v53 + v55 * v54;
        -[CKPinnedConversationActivityView contactItemViewCenterXCoordinateForYCoordinate:avatarFrame:contentAlignment:](self, "contactItemViewCenterXCoordinateForYCoordinate:avatarFrame:contentAlignment:", v36, v59, v111, v110, v123, v122);
        v61 = v60;
        if (v37)
        {
          objc_msgSend(v33, "setCenter:", v60, v59);
          objc_msgSend(v33, "setBounds:", 0.0, 0.0, v95, v95);
          objc_msgSend(v33, "layer");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setZPosition:", 1.0);

        }
        v63 = v49 + (v51 - v49) * v39;
        if (v36 == 1)
        {
          v119 = 0;
          v64 = v61 - v109;
          v118 = 1;
LABEL_41:
          p_innerContentAlignmentFrame = &self->_innerContentAlignmentFrame;
          v67 = CGRectGetMaxX(self->_innerContentAlignmentFrame) - v64;
          v68 = 1;
          goto LABEL_43;
        }
        v119 = 0;
        v118 = 0;
        v64 = v109 + v61;
LABEL_42:
        p_innerContentAlignmentFrame = &self->_innerContentAlignmentFrame;
        v68 = 0;
        v67 = v64 - CGRectGetMinX(self->_innerContentAlignmentFrame);
LABEL_43:
        MaxX = CGRectGetMaxX(*p_innerContentAlignmentFrame);
        MinX = CGRectGetMinX(*p_innerContentAlignmentFrame);
        if (v42 <= v67 + v67)
        {
          v84 = v64;
          goto LABEL_57;
        }
        v71 = MaxX - MinX;
        v72 = &self->_innerContentAlignmentFrame;
        v73 = self->_innerContentAlignmentFrame.origin.x;
        v74 = self->_innerContentAlignmentFrame.origin.y;
        v75 = self->_innerContentAlignmentFrame.size.width;
        v76 = self->_innerContentAlignmentFrame.size.height;
        if (v42 > v71)
        {
          v102 = v63;
          v103 = v59;
          MidX = CGRectGetMidX(*(CGRect *)&v73);
          v136.origin.x = 0.0;
          v136.origin.y = 0.0;
          v136.size.width = v42;
          v136.size.height = v43;
          v78 = MidX + CGRectGetWidth(v136) * -0.5;
          v137.origin.x = v72->origin.x;
          v137.origin.y = self->_innerContentAlignmentFrame.origin.y;
          v137.size.width = self->_innerContentAlignmentFrame.size.width;
          v137.size.height = self->_innerContentAlignmentFrame.size.height;
          v79 = CGRectGetMidX(v137);
          v138.origin.x = 0.0;
          v138.origin.y = 0.0;
          v138.size.width = v42;
          v138.size.height = v43;
          v80 = CGRectGetWidth(v138);
          v139.origin.x = p_outerContentAlignmentFrame->origin.x;
          v139.origin.y = self->_outerContentAlignmentFrame.origin.y;
          v139.size.width = self->_outerContentAlignmentFrame.size.width;
          v139.size.height = self->_outerContentAlignmentFrame.size.height;
          if (v78 < CGRectGetMinX(v139))
          {
            v140.origin.x = p_outerContentAlignmentFrame->origin.x;
            v140.origin.y = self->_outerContentAlignmentFrame.origin.y;
            v140.size.width = self->_outerContentAlignmentFrame.size.width;
            v140.size.height = self->_outerContentAlignmentFrame.size.height;
            v81 = CGRectGetMinX(v140);
            v141.origin.x = 0.0;
            v141.origin.y = 0.0;
            v141.size.width = v42;
            v141.size.height = v43;
            v82 = CGRectGetWidth(v141);
            v83 = 0.5;
            goto LABEL_52;
          }
          v143.origin.x = p_outerContentAlignmentFrame->origin.x;
          v143.origin.y = self->_outerContentAlignmentFrame.origin.y;
          v143.size.width = self->_outerContentAlignmentFrame.size.width;
          v143.size.height = self->_outerContentAlignmentFrame.size.height;
          if (v79 + v80 * 0.5 <= CGRectGetMaxX(v143))
          {
            v147.origin.x = v72->origin.x;
            v147.origin.y = self->_innerContentAlignmentFrame.origin.y;
            v147.size.width = self->_innerContentAlignmentFrame.size.width;
            v147.size.height = self->_innerContentAlignmentFrame.size.height;
            v84 = CGRectGetMidX(v147);
          }
          else
          {
            v144.origin.x = p_outerContentAlignmentFrame->origin.x;
            v144.origin.y = self->_outerContentAlignmentFrame.origin.y;
            v144.size.width = self->_outerContentAlignmentFrame.size.width;
            v144.size.height = self->_outerContentAlignmentFrame.size.height;
            v81 = CGRectGetMaxX(v144);
            v145.origin.x = 0.0;
            v145.origin.y = 0.0;
            v145.size.width = v42;
            v145.size.height = v43;
            v82 = CGRectGetWidth(v145);
            v83 = -0.5;
LABEL_52:
            v84 = v81 + v82 * v83;
          }
          v63 = v102;
          v59 = v103;
          goto LABEL_57;
        }
        if (v68)
        {
          v85 = CGRectGetMaxX(*(CGRect *)&v73);
          v142.origin.x = 0.0;
          v142.origin.y = 0.0;
          v142.size.width = v42;
          v142.size.height = v43;
          v86 = CGRectGetWidth(v142);
          v87 = -0.5;
        }
        else
        {
          v85 = CGRectGetMinX(*(CGRect *)&v73);
          v146.origin.x = 0.0;
          v146.origin.y = 0.0;
          v146.size.width = v42;
          v146.size.height = v43;
          v86 = CGRectGetWidth(v146);
          v87 = 0.5;
        }
        v84 = v85 + v86 * v87;
LABEL_57:
        v148.origin.x = 0.0;
        v148.origin.y = 0.0;
        v148.size.width = v42;
        v148.size.height = v43;
        v88 = CGRectGetWidth(v148);
        if (v124)
        {
          v89 = v59;
          v90 = v84 + v88 * -0.5;
          objc_msgSend(v30, "setOriginationHorizontalDirection:", v118);
          objc_msgSend(v30, "setPreferredTailAttachmentPointXCoordinate:", v64 - v90);
          objc_msgSend(v30, "tailAttachmentPoint");
          objc_msgSend(v30, "setCenter:", v90 + v91 + (v84 - (v90 + v91)) * v120, v63);
          objc_msgSend(v30, "layer");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "setZPosition:", 2.0);

          v94 = v104;
          v93 = v105;
          if (!v119)
          {
            v93 = v61;
            v94 = v89;
          }
          -[CKPinnedConversationActivityView _convertPointInOwnCoordinateSpace:toUnscaledCoordinateSpaceOfSubview:](self, "_convertPointInOwnCoordinateSpace:toUnscaledCoordinateSpaceOfSubview:", v30, v93, v94);
          objc_msgSend(v30, "setOriginationPoint:");
          objc_msgSend(v30, "layoutIfNeeded");
        }

        width = v113;
      }
      v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v131, 16);
    }
    while (v117);
  }

}

- (CGPoint)_convertPointInOwnCoordinateSpace:(CGPoint)a3 toUnscaledCoordinateSpaceOfSubview:(id)a4
{
  double y;
  double x;
  id v6;
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
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "center");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "bounds");
  v12 = v11;
  v14 = v13;

  v15 = x - (v8 - v12 * 0.5);
  v16 = y - (v10 - v14 * 0.5);
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)_layoutUnattachedContactItemViews:(id)a3 withContentScale:(id)a4 applyingTransform:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id *v26;
  _QWORD v27[4];
  id v28;
  CKPinnedConversationActivityView *v29;
  uint64_t *v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  id *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[5];
  id v52;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    -[CKPinnedConversationActivityView avatarFrame](self, "avatarFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[CKPinnedConversationActivityView contactItemViewDiameterForAvatarFrame:](self, "contactItemViewDiameterForAvatarFrame:");
    v19 = v18;
    -[NSMutableArray firstObject](self->_activityItemViews, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activityItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attachedContactItemIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKPinnedConversationActivityView contactItemViewMatchingContactItemIdentifier:fromContactItemViews:](self, "contactItemViewMatchingContactItemIdentifier:fromContactItemViews:", v22, self->_contactItemViews);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__16;
    v51[4] = __Block_byref_object_dispose__16;
    v52 = 0;
    v45 = 0;
    v46 = (id *)&v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__16;
    v49 = __Block_byref_object_dispose__16;
    v50 = 0;
    v39 = 0;
    v40 = (id *)&v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__16;
    v43 = __Block_byref_object_dispose__16;
    v44 = 0;
    if (v23)
    {
      objc_storeStrong(&v52, v23);
      objc_msgSend(v23, "pinnedConversationContactItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "contactItemAlignment");

      if (!v25)
      {
        v26 = v46;
        goto LABEL_7;
      }
      if (v25 == 1)
      {
        v26 = v40;
LABEL_7:
        objc_storeStrong(v26 + 5, v23);
      }
    }
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __105__CKPinnedConversationActivityView__layoutUnattachedContactItemViews_withContentScale_applyingTransform___block_invoke;
    v27[3] = &unk_1E274DF70;
    v28 = v9;
    v29 = self;
    v30 = &v45;
    v31 = &v39;
    v33 = v11;
    v34 = v13;
    v35 = v15;
    v36 = v17;
    v37 = v19;
    v32 = v51;
    v38 = a5;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v27);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(v51, 8);
  }

}

void __105__CKPinnedConversationActivityView__layoutUnattachedContactItemViews_withContentScale_applyingTransform___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MidY;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double MidX;
  _BOOL8 v38;
  uint64_t v39;
  CGAffineTransform v40;
  CGAffineTransform v41;

  v4 = a2;
  objc_msgSend(v4, "pinnedConversationContactItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v6, "doubleValue");
  else
    objc_msgSend(v5, "contentScale");
  v8 = v7;
  v9 = objc_msgSend(v5, "contactItemAlignment");
  v10 = objc_msgSend(*(id *)(a1 + 40), "nextContactItemIsClockwiseForOriginationDirection:contactItemAlignment:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 424), v9);
  v11 = objc_msgSend(*(id *)(a1 + 40), "activityViewContentAlignmentForContactItemAlignment:", v9);
  if (v9 == 1)
  {
    v12 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    if (v9)
      goto LABEL_10;
    v12 = *(_QWORD *)(a1 + 48);
  }
  v13 = *(id *)(*(_QWORD *)(v12 + 8) + 40);
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "pinnedConversationContactItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentScale");
    v17 = v16;

    v18 = *(double *)(a1 + 88) * 0.174532925;
    objc_msgSend(v14, "bounds");
    v20 = v18 + v19 * 0.5 * v17 + *(double *)(a1 + 104) * 0.5 * v8;
    v21 = *(void **)(a1 + 40);
    objc_msgSend(v14, "center");
    objc_msgSend(v21, "pointAlongCircle:atArcLength:fromPoint:clockwise:", v10, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), v20, v22, v23);
    v25 = v24;
    MidY = v26;
    goto LABEL_14;
  }
LABEL_10:
  v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v28)
  {
    objc_msgSend(v28, "center");
    v30 = v29;
    objc_msgSend(*(id *)(a1 + 40), "contactItemViewCenterXCoordinateForYCoordinate:avatarFrame:contentAlignment:", v11, v29, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 40), "pointAlongCircle:atArcLength:fromPoint:clockwise:", v10, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 88) * 0.0872664626, v31, v30);
    v25 = v32;
    MidY = v33;
  }
  else
  {
    MidY = CGRectGetMidY(*(CGRect *)(*(_QWORD *)(a1 + 40) + 504));
    objc_msgSend(*(id *)(a1 + 40), "contactItemViewCenterXCoordinateForYCoordinate:avatarFrame:contentAlignment:", v11, MidY, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    v25 = v34;
  }
  v14 = 0;
LABEL_14:
  objc_msgSend(v4, "setCenter:", v25, MidY);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, *(double *)(a1 + 104), *(double *)(a1 + 104));
  objc_msgSend(v4, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setZPosition:", 1.0);

  v36 = v8 * *(double *)(a1 + 104) * 0.5;
  MidX = CGRectGetMidX(*(CGRect *)(*(_QWORD *)(a1 + 40) + 504));
  if (v9 == 1)
  {
    v38 = v25 - v36 < MidX;
  }
  else if (v9)
  {
    v38 = 0;
  }
  else
  {
    v38 = v25 + v36 > MidX;
  }
  objc_msgSend(v4, "setHidden:", v38, MidX);
  if (*(_BYTE *)(a1 + 112))
  {
    memset(&v41, 0, sizeof(v41));
    CGAffineTransformMakeScale(&v41, v8, v8);
    v40 = v41;
    objc_msgSend(v4, "setTransform:", &v40);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  if (v9 == 1)
  {
    v39 = *(_QWORD *)(a1 + 56);
    goto LABEL_25;
  }
  if (!v9)
  {
    v39 = *(_QWORD *)(a1 + 48);
LABEL_25:
    objc_storeStrong((id *)(*(_QWORD *)(v39 + 8) + 40), a2);
  }

}

- (int64_t)activityViewContentAlignmentForContactItemAlignment:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)nextContactItemIsClockwiseForOriginationDirection:(int64_t)a3 contactItemAlignment:(int64_t)a4
{
  if (a3)
    return a4 == 0;
  else
    return a4 != 0;
}

- (CGPoint)pointAlongCircle:(CGRect)a3 atArcLength:(double)a4 fromPoint:(CGPoint)a5 clockwise:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  CGFloat height;
  double width;
  CGFloat v12;
  CGFloat v13;
  double MidX;
  double MidY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __double2 v21;
  double v22;
  double v23;
  CGPoint result;
  CGRect v25;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  height = a3.size.height;
  width = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v25.origin.x = v13;
  v25.origin.y = v12;
  v25.size.width = width;
  v25.size.height = height;
  MidY = CGRectGetMidY(v25);
  v16 = width * 0.5;
  if (v16 != 0.0)
  {
    v17 = MidX - x;
    v18 = MidY - y;
    if (v17 == 0.0)
    {
      v19 = dbl_18E7C9120[v18 > 0.0];
    }
    else
    {
      v19 = atan(v18 / v17);
      if (v17 >= 0.0)
        v19 = v19 + 3.14159265;
    }
    v20 = a4 / v16;
    if (!v6)
      v20 = -(a4 / v16);
    v21 = __sincos_stret(v20 + v19);
    MidX = MidX + v16 * v21.__cosval;
    MidY = MidY + v16 * v21.__sinval;
  }
  v22 = MidX;
  v23 = MidY;
  result.y = v23;
  result.x = v22;
  return result;
}

- (double)circleXCoordinateForYCoordinate:(double)a3 radius:(double)a4 centerPoint:(CGPoint)a5 contentAlignment:(int64_t)a6
{
  double v6;

  v6 = sqrt(fmax(a4 * a4 - (a3 - a5.y) * (a3 - a5.y), 0.0));
  if (a6 != 1)
    v6 = -v6;
  return a5.x + v6;
}

- (double)tailAttachmentXCoordinateForYCoordinate:(double)a3 avatarFrame:(CGRect)a4 contentAlignment:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MidX;
  double result;
  CGRect v17;
  CGRect v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a4.size.width * 0.5;
  -[CKPinnedConversationActivityView activityItemAttachmentCircleRadiusInsetForAvatarFrame:](self, "activityItemAttachmentCircleRadiusInsetForAvatarFrame:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v14 = v12 - v13;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  -[CKPinnedConversationActivityView circleXCoordinateForYCoordinate:radius:centerPoint:contentAlignment:](self, "circleXCoordinateForYCoordinate:radius:centerPoint:contentAlignment:", a5, a3, v14, MidX, CGRectGetMidY(v18));
  return result;
}

- (double)contactItemViewCenterXCoordinateForYCoordinate:(double)a3 avatarFrame:(CGRect)a4 contentAlignment:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  double MidX;
  double result;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a4.size.width * 0.5;
  MidX = CGRectGetMidX(a4);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  -[CKPinnedConversationActivityView circleXCoordinateForYCoordinate:radius:centerPoint:contentAlignment:](self, "circleXCoordinateForYCoordinate:radius:centerPoint:contentAlignment:", a5, a3, v12, MidX, CGRectGetMidY(v15));
  return result;
}

- (double)activityItemAttachmentCircleRadiusInsetForAvatarFrame:(CGRect)a3
{
  return a3.size.width * 0.0909090909;
}

- (double)contactItemViewDiameterForAvatarFrame:(CGRect)a3
{
  return a3.size.width * 0.295454545;
}

- (NSArray)displayedContacts
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CKPinnedConversationActivityView contactItemViews](self, "contactItemViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C9AA60];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "pinnedConversationContactItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cnContactWithKeys:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (void)resetToEmptySnapshot
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  NSMutableArray *activityItemViews;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  NSMutableArray *contactItemViews;
  CKPinnedConversationActivitySnapshot *v17;
  CKPinnedConversationActivitySnapshot *latestSnapshot;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CKPinnedConversationActivityView activityItemViews](self, "activityItemViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  activityItemViews = self->_activityItemViews;
  self->_activityItemViews = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CKPinnedConversationActivityView contactItemViews](self, "contactItemViews", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14++), "removeFromSuperview");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v12);
  }

  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  contactItemViews = self->_contactItemViews;
  self->_contactItemViews = v15;

  +[CKPinnedConversationActivitySnapshot emptySnapshot](CKPinnedConversationActivitySnapshot, "emptySnapshot");
  v17 = (CKPinnedConversationActivitySnapshot *)objc_claimAutoreleasedReturnValue();
  latestSnapshot = self->_latestSnapshot;
  self->_latestSnapshot = v17;

  self->_suppressingActivity = 0;
}

- (void)setSuppressingActivity:(BOOL)a3
{
  -[CKPinnedConversationActivityView setSuppressingActivity:animated:completion:](self, "setSuppressingActivity:animated:completion:", a3, 0, 0);
}

- (void)setSuppressingActivity:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (self->_suppressingActivity != v6)
  {
    self->_suppressingActivity = v6;
    v10 = v8;
    -[CKPinnedConversationActivityView _updateSnapshotAnimated:completion:](self, "_updateSnapshotAnimated:completion:", v5, v8);
    goto LABEL_5;
  }
  if (v8)
  {
    v10 = v8;
    (*((void (**)(id))v8 + 2))(v8);
LABEL_5:
    v9 = v10;
  }

}

- (BOOL)haveAttachedContactItemViewsForActivityViews:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "activityItem", (_QWORD)v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "attachedContactItemIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");

        if (v9)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (CGRect)avatarFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_avatarFrame.origin.x;
  y = self->_avatarFrame.origin.y;
  width = self->_avatarFrame.size.width;
  height = self->_avatarFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAvatarFrame:(CGRect)a3
{
  self->_avatarFrame = a3;
}

- (CGRect)innerContentAlignmentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_innerContentAlignmentFrame.origin.x;
  y = self->_innerContentAlignmentFrame.origin.y;
  width = self->_innerContentAlignmentFrame.size.width;
  height = self->_innerContentAlignmentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)outerContentAlignmentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_outerContentAlignmentFrame.origin.x;
  y = self->_outerContentAlignmentFrame.origin.y;
  width = self->_outerContentAlignmentFrame.size.width;
  height = self->_outerContentAlignmentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)activityItemOriginationDirection
{
  return self->_activityItemOriginationDirection;
}

- (CGPoint)activityItemOriginationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_activityItemOriginationPoint.x;
  y = self->_activityItemOriginationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)activityItemOriginationSubAvatarFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_activityItemOriginationSubAvatarFrame.origin.x;
  y = self->_activityItemOriginationSubAvatarFrame.origin.y;
  width = self->_activityItemOriginationSubAvatarFrame.size.width;
  height = self->_activityItemOriginationSubAvatarFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setActivityItemOriginationSubAvatarFrame:(CGRect)a3
{
  self->_activityItemOriginationSubAvatarFrame = a3;
}

- (BOOL)isSuppressingActivity
{
  return self->_suppressingActivity;
}

- (BOOL)showContentAlignmentDebugFrames
{
  return self->_showContentAlignmentDebugFrames;
}

- (NSMutableArray)activityItemViews
{
  return self->_activityItemViews;
}

- (void)setActivityItemViews:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemViews, a3);
}

- (NSMutableArray)contactItemViews
{
  return self->_contactItemViews;
}

- (void)setContactItemViews:(id)a3
{
  objc_storeStrong((id *)&self->_contactItemViews, a3);
}

- (CKPinnedConversationActivitySnapshot)latestSnapshot
{
  return self->_latestSnapshot;
}

- (void)setLatestSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_latestSnapshot, a3);
}

- (CAShapeLayer)innerContentAlignmentDebugLayer
{
  return self->_innerContentAlignmentDebugLayer;
}

- (void)setInnerContentAlignmentDebugLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerContentAlignmentDebugLayer, a3);
}

- (CAShapeLayer)outerContentAlignmentDebugLayer
{
  return self->_outerContentAlignmentDebugLayer;
}

- (void)setOuterContentAlignmentDebugLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerContentAlignmentDebugLayer, a3);
}

- (CAShapeLayer)activityItemAttachmentCircleDebugLayer
{
  return self->_activityItemAttachmentCircleDebugLayer;
}

- (void)setActivityItemAttachmentCircleDebugLayer:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemAttachmentCircleDebugLayer, a3);
}

- (CAShapeLayer)originationPointDebugLayer
{
  return self->_originationPointDebugLayer;
}

- (void)setOriginationPointDebugLayer:(id)a3
{
  objc_storeStrong((id *)&self->_originationPointDebugLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originationPointDebugLayer, 0);
  objc_storeStrong((id *)&self->_activityItemAttachmentCircleDebugLayer, 0);
  objc_storeStrong((id *)&self->_outerContentAlignmentDebugLayer, 0);
  objc_storeStrong((id *)&self->_innerContentAlignmentDebugLayer, 0);
  objc_storeStrong((id *)&self->_latestSnapshot, 0);
  objc_storeStrong((id *)&self->_contactItemViews, 0);
  objc_storeStrong((id *)&self->_activityItemViews, 0);
}

@end
