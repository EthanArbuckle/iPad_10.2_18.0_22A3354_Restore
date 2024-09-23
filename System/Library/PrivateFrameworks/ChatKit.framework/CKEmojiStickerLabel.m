@implementation CKEmojiStickerLabel

- (CKEmojiStickerLabel)initWithFrame:(CGRect)a3
{
  CKEmojiStickerLabel *v3;
  CKEmojiStickerLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKEmojiStickerLabel;
  v3 = -[CKEmojiStickerLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CKEmojiStickerLabel _configure](v3, "_configure");
  return v4;
}

- (CKEmojiStickerLabel)initWithCoder:(id)a3
{
  CKEmojiStickerLabel *v3;
  CKEmojiStickerLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKEmojiStickerLabel;
  v3 = -[CKEmojiStickerLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[CKEmojiStickerLabel _configure](v3, "_configure");
  return v4;
}

- (void)_configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emojiStickerTranscriptCellFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEmojiStickerLabel setFont:](self, "setFont:", v4);

  -[CKEmojiStickerLabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEmojiStickerLabel setTextColor:](self, "setTextColor:", v7);

  -[CKEmojiStickerLabel setTextAlignment:](self, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEmojiStickerLabel setBackgroundColor:](self, "setBackgroundColor:", v8);

}

- (NSString)stickerAccessibilityDescription
{
  return self->_stickerAccessibilityDescription;
}

- (void)setStickerAccessibilityDescription:(id)a3
{
  objc_storeStrong((id *)&self->_stickerAccessibilityDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerAccessibilityDescription, 0);
}

@end
