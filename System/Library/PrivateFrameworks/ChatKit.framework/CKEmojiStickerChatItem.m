@implementation CKEmojiStickerChatItem

- (IMEmojiSticker)emojiSticker
{
  IMEmojiSticker *emojiSticker;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IMEmojiSticker *v11;
  IMEmojiSticker *v12;

  emojiSticker = self->_emojiSticker;
  if (!emojiSticker)
  {
    -[CKAssociatedStickerChatItem stickerUserInfo](self, "stickerUserInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0D39828]);
    -[CKEmojiStickerChatItem IMEmojiStickerChatItem](self, "IMEmojiStickerChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emojiString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D39310]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAssociatedStickerChatItem mediaObject](self, "mediaObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (IMEmojiSticker *)objc_msgSend(v5, "initWithEmojiString:stickerPackID:fileURL:", v7, v8, v10);
    v12 = self->_emojiSticker;
    self->_emojiSticker = v11;

    -[CKAssociatedStickerChatItem setSticker:](self, "setSticker:", self->_emojiSticker);
    emojiSticker = self->_emojiSticker;
  }
  return emojiSticker;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emojiStickerTranscriptBalloonSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSticker, 0);
}

@end
