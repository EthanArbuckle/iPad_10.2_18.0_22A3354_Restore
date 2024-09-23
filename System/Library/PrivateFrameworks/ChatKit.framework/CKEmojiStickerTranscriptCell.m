@implementation CKEmojiStickerTranscriptCell

- (CKEmojiStickerTranscriptCell)initWithFrame:(CGRect)a3
{
  CKEmojiStickerTranscriptCell *v3;
  CKEmojiStickerLabel *v4;
  uint64_t v5;
  CKEmojiStickerLabel *labelView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKEmojiStickerTranscriptCell;
  v3 = -[CKAssociatedStickerTranscriptCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKEmojiStickerLabel alloc];
    v5 = -[CKEmojiStickerLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    labelView = v3->_labelView;
    v3->_labelView = (CKEmojiStickerLabel *)v5;

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKEmojiStickerTranscriptCell;
  -[CKAssociatedStickerTranscriptCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKEmojiStickerTranscriptCell labelView](self, "labelView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E276D870);

}

- (void)setSticker:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKEmojiStickerTranscriptCell;
  -[CKAssociatedStickerTranscriptCell setSticker:](&v8, sel_setSticker_, a3);
  -[CKEmojiStickerTranscriptCell emojiSticker](self, "emojiSticker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKEmojiStickerTranscriptCell emojiSticker](self, "emojiSticker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emojiString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEmojiStickerTranscriptCell labelView](self, "labelView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (void)animateToVisible:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v6 = a4;
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    v10 = &unk_1E2871100;
  else
    v10 = &unk_1E2871110;
  if (v4)
    v11 = &unk_1E2871110;
  else
    v11 = &unk_1E2871100;
  objc_msgSend(v8, "setFromValue:", v10);
  objc_msgSend(v9, "setToValue:", v11);
  objc_msgSend(v9, "setMass:", 2.0);
  objc_msgSend(v9, "setStiffness:", 300.0);
  objc_msgSend(v9, "setDamping:", 400.0);
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.5);
  v12 = (void *)MEMORY[0x1E0CD28B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__CKEmojiStickerTranscriptCell_animateToVisible_completion___block_invoke;
  v15[3] = &unk_1E274AED0;
  v16 = v6;
  v13 = v6;
  objc_msgSend(v12, "setCompletionBlock:", v15);
  objc_msgSend(v7, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v9, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

uint64_t __60__CKEmojiStickerTranscriptCell_animateToVisible_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performHide:(id)a3
{
  -[CKEmojiStickerTranscriptCell animateToVisible:completion:](self, "animateToVisible:completion:", 0, a3);
}

- (void)performReveal:(id)a3
{
  -[CKEmojiStickerTranscriptCell animateToVisible:completion:](self, "animateToVisible:completion:", 1, a3);
}

- (CKEmojiStickerLabel)labelView
{
  return self->_labelView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelView, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[8];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKEmojiStickerTranscriptCell;
  -[CKAssociatedStickerTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v18, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, a3, a4, a5, a7, a6);
  -[CKEmojiStickerTranscriptCell labelView](self, "labelView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v17[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v17[5] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v17[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v17[7] = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v17[0] = *MEMORY[0x1E0CD2610];
  v17[1] = v12;
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v17[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v17[3] = v13;
  objc_msgSend(v9, "setTransform:", v17);

  -[CKEmojiStickerTranscriptCell labelView](self, "labelView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllAnimations");

  -[CKEmojiStickerTranscriptCell labelView](self, "labelView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAssociatedStickerTranscriptCell setAssociatedItemView:](self, "setAssociatedItemView:", v16);

}

@end
