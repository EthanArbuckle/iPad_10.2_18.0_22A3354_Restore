@implementation CKAggregateAcknowledgmentTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKAggregateAcknowledgmentTranscriptCell;
  v12 = a3;
  -[CKAssociatedMessageTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v14, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  CKBalloonViewForClass((objc_class *)objc_msgSend(v12, "balloonViewClass", v14.receiver, v14.super_class));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAggregateAcknowledgmentTranscriptCell setBalloonView:](self, "setBalloonView:", v13);
  objc_msgSend(v13, "configureForAggregateAcknowledgmentChatItem:", v12);

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
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double Height;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  objc_super v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v57.receiver = self;
  v57.super_class = (Class)CKAggregateAcknowledgmentTranscriptCell;
  -[CKAssociatedMessageTranscriptCell layoutSubviewsForAlignmentContents](&v57, sel_layoutSubviewsForAlignmentContents);
  -[CKAggregateAcknowledgmentTranscriptCell balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageAcknowledgmentTranscriptBalloonRelativePosition");
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEmojiTapbacksEnabled");

  if (v16)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "usesFannedBubbleStyle");

    if (v18)
    {
      +[CKTapbackPileTemplate topOfPileBubbleRadius](CKTapbackPileTemplate, "topOfPileBubbleRadius");
      v14 = v9 - v19;
    }
  }
  -[CKAssociatedMessageTranscriptCell parentSize](self, "parentSize");
  v21 = v20;
  if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
  {
    if (-[CKEditableCollectionViewCell orientation](self, "orientation") == 2)
      v22 = v14 + v5 - v21;
    else
      v22 = v5;
  }
  else
  {
    v22 = v5 + v21 - v14;
  }
  -[CKAssociatedMessageTranscriptCell parentRotationOffset](self, "parentRotationOffset");
  v24 = v22 + v23;
  -[CKAssociatedMessageTranscriptCell cumulativeAssociatedOffset](self, "cumulativeAssociatedOffset");
  if (v25 != 0.0)
  {
    -[CKAssociatedMessageTranscriptCell cumulativeAssociatedOffset](self, "cumulativeAssociatedOffset");
    v24 = v24 + v26;
  }
  -[CKTranscriptMessageCell failureButton](self, "failureButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v55 = v11;
    v56 = v7;
    -[CKTranscriptMessageCell failureButton](self, "failureButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      v37 = v9;
      if (-[CKEditableCollectionViewCell orientation](self, "orientation") == 2)
      {
        v58.origin.x = v30;
        v58.origin.y = v32;
        v58.size.width = v34;
        v58.size.height = v36;
        v30 = v24 - CGRectGetWidth(v58) + -1.0;
      }
      v38 = v55;
      v39 = v56;
    }
    else
    {
      v59.origin.x = v24;
      v37 = v9;
      v38 = v55;
      v39 = v56;
      v59.origin.y = v56;
      v59.size.width = v37;
      v59.size.height = v55;
      v30 = CGRectGetMaxX(v59) + 1.0;
    }
    v60.origin.x = v24;
    v60.origin.y = v39;
    v60.size.width = v37;
    v60.size.height = v38;
    Height = CGRectGetHeight(v60);
    v61.origin.x = v30;
    v61.origin.y = v32;
    v61.size.width = v34;
    v61.size.height = v36;
    v41 = (Height - CGRectGetHeight(v61)) * 0.5;
    v9 = v37;
    if (CKMainScreenScale_once_72 != -1)
      dispatch_once(&CKMainScreenScale_once_72, &__block_literal_global_179);
    v42 = *(double *)&CKMainScreenScale_sMainScreenScale_72;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_72 == 0.0)
      v42 = 1.0;
    v43 = round(v41 * v42) / v42;
    -[CKTranscriptMessageCell failureButton](self, "failureButton");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setFrame:", v30, v43, v34, v36);

    v11 = v55;
    v7 = v56;
  }
  -[CKAggregateAcknowledgmentTranscriptCell traitCollection](self, "traitCollection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "displayScale");
  if (v46 == 0.0)
  {
    if (CKMainScreenScale_once_72 != -1)
      dispatch_once(&CKMainScreenScale_once_72, &__block_literal_global_179);
    v47 = *(double *)&CKMainScreenScale_sMainScreenScale_72;
    v48 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_72 == 0.0)
      v47 = 1.0;
    v49 = floor(v24 * v47) / v47;
    v46 = *(double *)&CKMainScreenScale_sMainScreenScale_72;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_72 == 0.0)
      v46 = 1.0;
    v50 = *(double *)&CKMainScreenScale_sMainScreenScale_72;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_72 == 0.0)
      v50 = 1.0;
    v51 = ceil(v9 * v50) / v50;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_72 != 0.0)
      v48 = *(double *)&CKMainScreenScale_sMainScreenScale_72;
  }
  else
  {
    v49 = floor(v24 * v46) / v46;
    v48 = v46;
    v51 = ceil(v9 * v46) / v46;
  }
  v52 = floor(v7 * v46) / v46;
  v53 = ceil(v11 * v48) / v48;

  -[CKAggregateAcknowledgmentTranscriptCell balloonView](self, "balloonView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFrame:", v49, v52, v51, v53);

}

- (void)performInsertion:(id)a3
{
  -[CKAggregateAcknowledgmentTranscriptCell performInsertion:animated:](self, "performInsertion:animated:", a3, 1);
}

- (void)performInsertion:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  double v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 2.0);
  -[CKAggregateAcknowledgmentTranscriptCell balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", &unk_1E2870AB0);
  objc_msgSend(v11, "setMass:", 1.0);
  objc_msgSend(v11, "setStiffness:", 80.0);
  objc_msgSend(v11, "setDamping:", 20.0);
  objc_msgSend(v11, "setBeginTime:", v10);
  LODWORD(v12) = 3.0;
  objc_msgSend(v11, "setSpeed:", v12);
  objc_msgSend(v11, "setDuration:", 1.0);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  if (v4)
  {
    -[CKAggregateAcknowledgmentTranscriptCell balloonView](self, "balloonView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAnimation:forKey:", v11, CFSTR("transform.scale.xy"));

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v15, "isEmojiTapbacksEnabled");

    -[CKAggregateAcknowledgmentTranscriptCell balloonView](self, "balloonView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!(_DWORD)v14)
    {
      objc_msgSend(v16, "glyphView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "animationDuration");
      objc_msgSend(v19, "animateWithBeginTime:completionDelay:completion:", 0, v10, v20);
      goto LABEL_6;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKAggregateAcknowledgmentTranscriptCell balloonView](self, "balloonView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "playInsertionAnimationOnTopPlatter");
LABEL_6:

    }
  }
  v21 = (void *)MEMORY[0x1E0CD28B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__CKAggregateAcknowledgmentTranscriptCell_performInsertion_animated___block_invoke;
  v23[3] = &unk_1E274AED0;
  v24 = v6;
  v22 = v6;
  objc_msgSend(v21, "setCompletionBlock:", v23);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");

}

uint64_t __69__CKAggregateAcknowledgmentTranscriptCell_performInsertion_animated___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[CKAggregateAcknowledgmentTranscriptCell balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKBalloonViewReuse(v3);

  v4.receiver = self;
  v4.super_class = (Class)CKAggregateAcknowledgmentTranscriptCell;
  -[CKAssociatedMessageTranscriptCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (BOOL)parentMessageIsFromMe
{
  return self->_parentMessageIsFromMe;
}

- (void)setParentMessageIsFromMe:(BOOL)a3
{
  self->_parentMessageIsFromMe = a3;
}

@end
