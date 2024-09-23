@implementation CKMessagePartHighlightChatItemCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  objc_class *v13;
  void *v14;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKMessagePartHighlightChatItemCell;
  v12 = a3;
  -[CKAssociatedMessageTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v15, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  v13 = (objc_class *)objc_opt_class();
  CKBalloonViewForClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagePartHighlightChatItemCell setHighlightBalloonView:](self, "setHighlightBalloonView:", v14, v15.receiver, v15.super_class);
  objc_msgSend(v14, "configureForMessagePartHighlightChatItem:", v12);

}

- (void)setHighlightBalloonView:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessagePartHighlightChatItemCell;
  -[CKAssociatedMessageTranscriptCell setAssociatedItemView:](&v3, sel_setAssociatedItemView_, a3);
}

- (id)accessibilityIdentifier
{
  return CFSTR("highlightBalloonViewIdentifier");
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double Height;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  CGFloat v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v48.receiver = self;
  v48.super_class = (Class)CKMessagePartHighlightChatItemCell;
  -[CKAssociatedMessageTranscriptCell layoutSubviewsForAlignmentContents](&v48, sel_layoutSubviewsForAlignmentContents);
  -[CKMessagePartHighlightChatItemCell highlightBalloonView](self, "highlightBalloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKAssociatedMessageTranscriptCell parentSize](self, "parentSize");
  v13 = v12;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageHighlightTranscriptBalloonRelativePosition");
  v16 = v15;

  if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
  {
    if (-[CKEditableCollectionViewCell orientation](self, "orientation") == 2)
      v5 = v5 - v13 + v16;
  }
  else
  {
    v5 = v5 + v13 - v16;
  }
  -[CKAssociatedMessageTranscriptCell cumulativeAssociatedOffset](self, "cumulativeAssociatedOffset");
  if (v17 != 0.0)
  {
    -[CKAssociatedMessageTranscriptCell cumulativeAssociatedOffset](self, "cumulativeAssociatedOffset");
    v5 = v5 + v18;
  }
  -[CKTranscriptMessageCell failureButton](self, "failureButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v47 = v11;
    -[CKTranscriptMessageCell failureButton](self, "failureButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      if (-[CKEditableCollectionViewCell orientation](self, "orientation") == 2)
      {
        v49.origin.x = v22;
        v49.origin.y = v24;
        v49.size.width = v26;
        v49.size.height = v28;
        v22 = v5 - CGRectGetWidth(v49) + -1.0;
      }
      v29 = v47;
    }
    else
    {
      v50.origin.x = v5;
      v50.origin.y = v7;
      v50.size.width = v9;
      v29 = v47;
      v50.size.height = v47;
      v22 = CGRectGetMaxX(v50) + 1.0;
    }
    v51.size.width = v9;
    v51.origin.x = v5;
    v45 = v7;
    v51.origin.y = v7;
    v51.size.height = v29;
    Height = CGRectGetHeight(v51);
    v52.origin.x = v22;
    v52.origin.y = v24;
    v52.size.width = v26;
    v52.size.height = v28;
    v31 = (Height - CGRectGetHeight(v52)) * 0.5;
    if (CKMainScreenScale_once_108 != -1)
      dispatch_once(&CKMainScreenScale_once_108, &__block_literal_global_278);
    v32 = *(double *)&CKMainScreenScale_sMainScreenScale_108;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_108 == 0.0)
      v32 = 1.0;
    v33 = round(v31 * v32) / v32;
    -[CKTranscriptMessageCell failureButton](self, "failureButton", *(_QWORD *)&v45);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v22, v33, v26, v28);

    v7 = v46;
    v11 = v47;
  }
  -[CKMessagePartHighlightChatItemCell traitCollection](self, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "displayScale");
  if (v36 == 0.0)
  {
    if (CKMainScreenScale_once_108 != -1)
      dispatch_once(&CKMainScreenScale_once_108, &__block_literal_global_278);
    v37 = *(double *)&CKMainScreenScale_sMainScreenScale_108;
    v38 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_108 == 0.0)
      v37 = 1.0;
    v39 = floor(v5 * v37) / v37;
    v36 = *(double *)&CKMainScreenScale_sMainScreenScale_108;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_108 == 0.0)
      v36 = 1.0;
    v40 = *(double *)&CKMainScreenScale_sMainScreenScale_108;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_108 == 0.0)
      v40 = 1.0;
    v41 = ceil(v9 * v40) / v40;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_108 != 0.0)
      v38 = *(double *)&CKMainScreenScale_sMainScreenScale_108;
  }
  else
  {
    v39 = floor(v5 * v36) / v36;
    v38 = v36;
    v41 = ceil(v9 * v36) / v36;
  }
  v42 = floor(v7 * v36) / v36;
  v43 = ceil(v11 * v38) / v38;

  -[CKMessagePartHighlightChatItemCell highlightBalloonView](self, "highlightBalloonView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", v39, v42, v41, v43);

}

- (void)performInsertion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessagePartHighlightChatItemCell highlightBalloonView](self, "highlightBalloonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performTranscriptInsertionAnimation:", v4);

}

- (void)performRemoval:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessagePartHighlightChatItemCell highlightBalloonView](self, "highlightBalloonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performTranscriptRemovalAnimation:", v4);

}

- (void)performHide:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CKMessagePartHighlightChatItemCell highlightBalloonView](self, "highlightBalloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CKMessagePartHighlightChatItemCell_performHide___block_invoke;
  v7[3] = &unk_1E274C308;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performTranscriptHideAnimation:", v7);

}

uint64_t __50__CKMessagePartHighlightChatItemCell_performHide___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performReveal:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CKMessagePartHighlightChatItemCell highlightBalloonView](self, "highlightBalloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CKMessagePartHighlightChatItemCell_performReveal___block_invoke;
  v7[3] = &unk_1E274C308;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performTranscriptRevealAnimation:", v7);

}

uint64_t __52__CKMessagePartHighlightChatItemCell_performReveal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performReload:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
  -[CKMessagePartHighlightChatItemCell highlightBalloonView](self, "highlightBalloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performTranscriptReloadAnimation:", v7);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[CKMessagePartHighlightChatItemCell highlightBalloonView](self, "highlightBalloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKBalloonViewReuse(v3);

  v4.receiver = self;
  v4.super_class = (Class)CKMessagePartHighlightChatItemCell;
  -[CKAssociatedMessageTranscriptCell prepareForReuse](&v4, sel_prepareForReuse);
}

@end
