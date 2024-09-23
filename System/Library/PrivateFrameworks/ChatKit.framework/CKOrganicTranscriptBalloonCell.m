@implementation CKOrganicTranscriptBalloonCell

- (double)layoutOffset
{
  void *v2;
  double v3;
  double v4;

  -[CKOrganicTranscriptBalloonCell layoutRecipe](self, "layoutRecipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offset");
  v4 = v3;

  return v4;
}

- (void)layoutSubviewsForAlignmentContents
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
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
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)CKOrganicTranscriptBalloonCell;
  -[CKTranscriptBalloonCell layoutSubviewsForAlignmentContents](&v30, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CKOrganicTranscriptBalloonCell layoutRecipe](self, "layoutRecipe");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relativeGroupCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CKOrganicTranscriptBalloonCell layoutRecipe](self, "layoutRecipe");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "relativeGroupCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      -[CKOrganicTranscriptBalloonCell layoutRecipe](self, "layoutRecipe");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "groupMaxX");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13;

      -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      v31.origin.x = v17;
      v31.origin.y = v19;
      v31.size.width = v21;
      v31.size.height = v23;
      v24 = v10 + CGRectGetHeight(v31) * -0.5;
      -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
      v25 = v14 + CGRectGetMinX(v32);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "transcriptQuickActionButtonHorizontalSpacing");
      v28 = v25 + v27;

      -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFrame:", v28, v24, v21, v23);

    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v18;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v19.x = x;
  v19.y = y;
  v9 = CGRectContainsPoint(v20, v19);

  if (v9)
  {
    -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKOrganicTranscriptBalloonCell convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    v12 = v11;
    v14 = v13;

    -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hitTest:withEvent:", v7, v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CKOrganicTranscriptBalloonCell;
    -[CKOrganicTranscriptBalloonCell hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (CKOrganicImageLayoutRecipe)layoutRecipe
{
  return self->_layoutRecipe;
}

- (void)setLayoutRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRecipe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRecipe, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKOrganicTranscriptBalloonCell;
  v12 = a3;
  -[CKTranscriptBalloonCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v14, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "layoutRecipe", v14.receiver, v14.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKOrganicTranscriptBalloonCell setLayoutRecipe:](self, "setLayoutRecipe:", v13);
}

@end
