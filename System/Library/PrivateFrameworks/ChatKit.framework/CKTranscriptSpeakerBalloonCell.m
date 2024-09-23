@implementation CKTranscriptSpeakerBalloonCell

- (void)setOrientation:(char)a3
{
  uint64_t v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[CKEditableCollectionViewCell orientation](self, "orientation") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CKTranscriptSpeakerBalloonCell;
    -[CKEditableCollectionViewCell setOrientation:](&v6, sel_setOrientation_, v3);
    -[CKTranscriptSpeakerBalloonCell speakerButton](self, "speakerButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOrientation:", v3);

    -[CKTranscriptSpeakerBalloonCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)CKTranscriptSpeakerBalloonCell;
  -[CKTranscriptBalloonCell layoutSubviewsForAlignmentContents](&v23, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptSpeakerBalloonCell speakerButton](self, "speakerButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  if (-[CKTranscriptSpeakerBalloonCell adjustSpeakerForAcknowledgment](self, "adjustSpeakerForAcknowledgment"))
    v8 = 30.0;
  else
    v8 = 0.0;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRichAudioMessagesEnabled");

  if (v10)
    v11 = 0.0;
  else
    v11 = v8;
  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
  {
    v21 = v14 + -7.0 - v11 - v5;
  }
  else
  {
    v24.origin.x = v14;
    v24.origin.y = v16;
    v24.size.width = v18;
    v24.size.height = v20;
    v21 = v11 + CGRectGetMaxX(v24) + 7.0;
  }
  if (CKMainScreenScale_once_59 != -1)
    dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_152);
  v22 = *(double *)&CKMainScreenScale_sMainScreenScale_59;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_59 == 0.0)
    v22 = 1.0;
  objc_msgSend(v3, "setFrame:", v21, 1.0 / v22 * (v16 * v22 + floor((v20 * v22 - v7 * v22) * 0.5)), v5, v7);

}

- (void)setSpeakerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_speakerEnabled != a3)
  {
    v3 = a3;
    self->_speakerEnabled = a3;
    -[CKTranscriptSpeakerBalloonCell speakerButton](self, "speakerButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSpeakerEnabled:", v3);

  }
}

- (void)setSpeakerHidden:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (-[CKTranscriptSpeakerBalloonCell isSpeakerHidden](self, "isSpeakerHidden") != a3)
  {
    -[CKTranscriptSpeakerBalloonCell speakerButton](self, "speakerButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v8 = v5;
      v6 = 1;
    }
    else
    {
      if (!v5)
      {
        +[CKSpeakerButton buttonWithType:](CKSpeakerButton, "buttonWithType:", 1);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setOrientation:", -[CKEditableCollectionViewCell orientation](self, "orientation"));
        objc_msgSend(v8, "setSpeakerEnabled:", -[CKTranscriptSpeakerBalloonCell isSpeakerEnabled](self, "isSpeakerEnabled"));
        objc_msgSend(v8, "sizeToFit");
        -[CKEditableCollectionViewCell contentView](self, "contentView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addSubview:", v8);

        -[CKTranscriptSpeakerBalloonCell setSpeakerButton:](self, "setSpeakerButton:", v8);
        -[CKTranscriptSpeakerBalloonCell setNeedsLayout](self, "setNeedsLayout");
        goto LABEL_9;
      }
      v8 = v5;
      v6 = 0;
    }
    objc_msgSend(v5, "setHidden:", v6);
LABEL_9:

  }
}

- (BOOL)isSpeakerHidden
{
  void *v2;
  void *v3;
  char v4;

  -[CKTranscriptSpeakerBalloonCell speakerButton](self, "speakerButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isHidden");
  else
    v4 = 1;

  return v4;
}

- (void)setDrawerPercentRevealed:(double)a3
{
  void *v5;
  int v6;
  _BOOL8 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptSpeakerBalloonCell;
  -[CKTranscriptCell setDrawerPercentRevealed:](&v8, sel_setDrawerPercentRevealed_);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRichAudioMessagesEnabled");

  if (v6)
  {
    if (!-[CKTranscriptSpeakerBalloonCell speakerIsManuallyHidden](self, "speakerIsManuallyHidden"))
      -[CKTranscriptSpeakerBalloonCell setSpeakerEnabledBeforeManualHide:](self, "setSpeakerEnabledBeforeManualHide:", -[CKTranscriptSpeakerBalloonCell isSpeakerHidden](self, "isSpeakerHidden"));
    v7 = a3 > 0.3
      || -[CKTranscriptSpeakerBalloonCell speakerEnabledBeforeManualHide](self, "speakerEnabledBeforeManualHide");
    -[CKTranscriptSpeakerBalloonCell setSpeakerHidden:](self, "setSpeakerHidden:", v7);
    -[CKTranscriptSpeakerBalloonCell setSpeakerIsManuallyHidden:](self, "setSpeakerIsManuallyHidden:", a3 > 0.3);
  }
}

- (BOOL)allowsSwipeToReply
{
  return 0;
}

- (BOOL)isSpeakerEnabled
{
  return self->_speakerEnabled;
}

- (BOOL)adjustSpeakerForAcknowledgment
{
  return self->_adjustSpeakerForAcknowledgment;
}

- (void)setAdjustSpeakerForAcknowledgment:(BOOL)a3
{
  self->_adjustSpeakerForAcknowledgment = a3;
}

- (CKSpeakerButton)speakerButton
{
  return self->_speakerButton;
}

- (void)setSpeakerButton:(id)a3
{
  objc_storeStrong((id *)&self->_speakerButton, a3);
}

- (BOOL)shouldShowText
{
  return self->_shouldShowText;
}

- (void)setShouldShowText:(BOOL)a3
{
  self->_shouldShowText = a3;
}

- (BOOL)speakerEnabledBeforeManualHide
{
  return self->_speakerEnabledBeforeManualHide;
}

- (void)setSpeakerEnabledBeforeManualHide:(BOOL)a3
{
  self->_speakerEnabledBeforeManualHide = a3;
}

- (BOOL)speakerIsManuallyHidden
{
  return self->_speakerIsManuallyHidden;
}

- (void)setSpeakerIsManuallyHidden:(BOOL)a3
{
  self->_speakerIsManuallyHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakerButton, 0);
}

@end
