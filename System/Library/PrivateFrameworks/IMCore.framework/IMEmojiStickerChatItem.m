@implementation IMEmojiStickerChatItem

- (id)_initWithItem:(id)a3 sender:(id)a4 transferGUID:(id)a5 emojiSticker:(id)a6
{
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)IMEmojiStickerChatItem;
  v11 = -[IMAssociatedStickerChatItem _initWithItem:sender:transferGUID:](&v14, sel__initWithItem_sender_transferGUID_, a3, a4, a5);
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "setEmojiSticker:", v10);

  return v12;
}

- (NSString)emojiString
{
  void *v2;
  void *v3;

  -[IMAssociatedMessageChatItem emojiSticker](self, "emojiSticker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emojiString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
