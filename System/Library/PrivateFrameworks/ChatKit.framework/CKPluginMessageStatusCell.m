@implementation CKPluginMessageStatusCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  void *v15;
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
  objc_super v29;

  v9 = a5;
  v12 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CKPluginMessageStatusCell;
  -[CKTranscriptStampCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v29, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "IMChatItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "balloonBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPluginMessageStatusCell setBalloonBundleID:](self, "setBalloonBundleID:", v14);

  -[CKTranscriptLabelCell label](self, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v12, "size");
  v25 = v24;
  v27 = v26;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "iconSizePlusHorizontalPadding");
    v25 = v25 - v28;
  }
  if (v21 != v25 || v23 != v27)
  {
    objc_msgSend(v15, "setFrame:", v17, v19, v25, v27);
    -[CKPluginMessageStatusCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CKPluginMessageStatusCell)initWithFrame:(CGRect)a3
{
  CKPluginMessageStatusCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKPluginMessageStatusCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v5, "setContentMode:", 0);
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);

    -[CKPluginMessageStatusCell setImageView:](v3, "setImageView:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__updateBalloonPluginIconImage, *MEMORY[0x1E0D352C8], 0);

  }
  return v3;
}

- (BOOL)hidesCheckmark
{
  if (IMGetDomainBoolForKey())
    return !-[CKTranscriptStampCell isRetractionStamp](self, "isRetractionStamp");
  else
    return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKPluginMessageStatusCell;
  -[CKPluginMessageStatusCell dealloc](&v4, sel_dealloc);
}

- (void)_updateBalloonPluginIconImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPluginMessageStatusCell balloonBundleID](self, "balloonBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonPluginForBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  v9 = objc_msgSend(v5, "shouldBreadcrumbHideAppIcon") | v8;
  if (v5
    || (-[CKPluginMessageStatusCell balloonBundleID](self, "balloonBundleID"),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((v9 & 1) == 0)
    {
      location = 0;
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58__CKPluginMessageStatusCell__updateBalloonPluginIconImage__block_invoke;
      v11[3] = &unk_1E275A588;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v5, "__ck_generateStatusImage:", v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __58__CKPluginMessageStatusCell__updateBalloonPluginIconImage__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v8)
    {
      objc_msgSend(v4, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImage:", v8);

      objc_msgSend(v4, "setNeedsLayout");
    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPluginMessageStatusCell;
  -[CKTranscriptStampCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKPluginMessageStatusCell setPreviousPluginSnapshot:](self, "setPreviousPluginSnapshot:", 0);
  -[CKPluginMessageStatusCell setDataSource:](self, "setDataSource:", 0);
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
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
  CGFloat v22;
  double v23;
  CGFloat v24;
  int v25;
  double MaxX;
  double MidX;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  objc_super v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptLabelCell label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v43.receiver = self;
  v43.super_class = (Class)CKPluginMessageStatusCell;
  -[CKTranscriptStampCell layoutSubviewsForAlignmentContents](&v43, sel_layoutSubviewsForAlignmentContents);
  -[CKPluginMessageStatusCell imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iMessageAppIconSize");
  v13 = v12;
  v42 = v14;

  if (v10)
  {
    objc_msgSend(v3, "transcriptCustomStatusImagePadding");
    v16 = v13 + v15;
  }
  else
  {
    v16 = 0.0;
  }
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = -[CKEditableCollectionViewCell orientation](self, "orientation");
  if (v25 == 2)
  {
    v45.origin.x = v18;
    v45.origin.y = v20;
    v45.size.width = v22;
    v45.size.height = v24;
    MaxX = CGRectGetMaxX(v45);
    v46.origin.x = v18;
    v46.origin.y = v20;
    v46.size.width = v6;
    v46.size.height = v8;
    v18 = MaxX - CGRectGetWidth(v46);
  }
  else if (v25 == 1)
  {
    v47.origin.x = v18;
    v47.origin.y = v20;
    v47.size.width = v22;
    v47.size.height = v24;
    MidX = CGRectGetMidX(v47);
    v48.origin.x = v18;
    v48.origin.y = v20;
    v48.size.width = v6;
    v48.size.height = v8;
    v18 = MidX + (v16 + CGRectGetWidth(v48)) * -0.5;
  }
  else if (!(_BYTE)v25)
  {
    v44.origin.x = v18;
    v44.origin.y = v20;
    v44.size.width = v22;
    v44.size.height = v24;
    v18 = v16 + CGRectGetMinX(v44);
  }
  objc_msgSend(v4, "setFrame:", v18, v20, v6, v8);
  if (v10)
  {
    objc_msgSend(v3, "transcriptTextFont");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lineHeight");
    v30 = v20 + (v29 - v42) * 0.5;

    -[CKPluginMessageStatusCell imageView](self, "imageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transcriptCustomStatusImageEdgeInsets");
    v33 = v18 - v16 + v32;
    v35 = v30 + v34;
    v37 = v13 - (v32 + v36);
    v39 = v42 - (v34 + v38);
    objc_msgSend(v31, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "mask");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFrame:", 0.0, 0.0, v37, v39);

    objc_msgSend(v31, "setFrame:", v33, v35, v37, v39);
  }

}

- (void)performInsertion:(id)a3
{
  id v4;
  void *v5;
  UIView *previousPluginSnapshot;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[CKPluginMessageStatusCell previousPluginSnapshot](self, "previousPluginSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    previousPluginSnapshot = self->_previousPluginSnapshot;
    self->_previousPluginSnapshot = 0;

    v7 = MEMORY[0x1E0C809B0];
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__CKPluginMessageStatusCell_performInsertion___block_invoke;
    v12[3] = &unk_1E274A108;
    v12[4] = self;
    v13 = v5;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __46__CKPluginMessageStatusCell_performInsertion___block_invoke_2;
    v9[3] = &unk_1E274C780;
    v10 = v13;
    v11 = v4;
    objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 0x10000, v12, v9, 0.3, 0.0);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __46__CKPluginMessageStatusCell_performInsertion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", v6, v8, v10, v12);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "label");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", 1.0);

}

uint64_t __46__CKPluginMessageStatusCell_performInsertion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)setDataSource:(id)a3
{
  void *v5;
  NSString *v6;
  NSString *balloonBundleID;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "pluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginBundleID");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  balloonBundleID = self->_balloonBundleID;
  if (balloonBundleID != v6 && !-[NSString isEqualToString:](balloonBundleID, "isEqualToString:", v6)
    || (-[CKPluginMessageStatusCell imageView](self, "imageView"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "image"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[CKPluginMessageStatusCell _updateBalloonPluginIconImage](self, "_updateBalloonPluginIconImage");
  }

}

- (void)setBalloonBundleID:(id)a3
{
  NSString *v5;
  NSString *balloonBundleID;
  void *v7;
  void *v8;
  NSString *v9;

  v5 = (NSString *)a3;
  balloonBundleID = self->_balloonBundleID;
  v9 = v5;
  if (balloonBundleID != v5 && !-[NSString isEqualToString:](balloonBundleID, "isEqualToString:", v5)
    || (-[CKPluginMessageStatusCell imageView](self, "imageView"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "image"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    objc_storeStrong((id *)&self->_balloonBundleID, a3);
    -[CKPluginMessageStatusCell _updateBalloonPluginIconImage](self, "_updateBalloonPluginIconImage");
  }

}

- (void)setPreviousPluginSnapshot:(id)a3
{
  UIView *v5;
  UIView **p_previousPluginSnapshot;
  UIView *previousPluginSnapshot;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;

  v5 = (UIView *)a3;
  p_previousPluginSnapshot = &self->_previousPluginSnapshot;
  previousPluginSnapshot = self->_previousPluginSnapshot;
  if (previousPluginSnapshot != v5)
  {
    v13 = v5;
    -[UIView removeFromSuperview](previousPluginSnapshot, "removeFromSuperview");
    objc_storeStrong((id *)&self->_previousPluginSnapshot, a3);
    v8 = *p_previousPluginSnapshot;
    -[CKPluginMessageStatusCell imageView](self, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "setAlpha:", 0.0);

      -[CKTranscriptLabelCell label](self, "label");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", 0.0);

      -[CKPluginMessageStatusCell insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_previousPluginSnapshot, 0);
    }
    else
    {
      objc_msgSend(v9, "setAlpha:", 1.0);

      -[CKTranscriptLabelCell label](self, "label");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlpha:", 1.0);

    }
    v5 = v13;
  }

}

- (NSString)balloonBundleID
{
  return self->_balloonBundleID;
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (UIView)previousPluginSnapshot
{
  return self->_previousPluginSnapshot;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_previousPluginSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_balloonBundleID, 0);
}

@end
