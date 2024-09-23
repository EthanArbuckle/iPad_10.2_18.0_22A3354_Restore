@implementation IMAssociatedMessageChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  IMAssociatedMessageChatItem *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = [IMAssociatedMessageChatItem alloc];
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssociatedMessageChatItem sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMAssociatedMessageChatItem _initWithItem:sender:](v4, "_initWithItem:sender:", v5, v6);

  v9 = *(_OWORD *)&self->_geometryDescriptor.parentPreviewWidth;
  v8 = *(_OWORD *)&self->_geometryDescriptor.yScalar;
  v10 = *(_OWORD *)&self->_geometryDescriptor.layoutIntent;
  *(double *)(v7 + 152) = self->_geometryDescriptor.rotation;
  *(_OWORD *)(v7 + 104) = v10;
  *(_OWORD *)(v7 + 120) = v9;
  *(_OWORD *)(v7 + 136) = v8;
  objc_storeStrong((id *)(v7 + 64), self->_sender);
  objc_storeStrong((id *)(v7 + 72), self->_tapback);
  objc_storeStrong((id *)(v7 + 80), self->_emojiSticker);
  return (id)v7;
}

- (id)_initWithItem:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[IMChatItem _initWithItem:](self, "_initWithItem:", v6);
  if (v8)
  {
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)sub_1A2132A84();

    objc_msgSend(v8, "_setGUID:", v10);
    objc_storeStrong(v8 + 8, a4);

  }
  return v8;
}

- (id)message
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDate)time
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMAssociatedMessageChatItem _imAssociatedMessageItem](self, "_imAssociatedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (NSString)associatedMessageGUID
{
  void *v2;
  void *v3;

  -[IMAssociatedMessageChatItem _imAssociatedMessageItem](self, "_imAssociatedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedMessageGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)associatedMessageType
{
  void *v2;
  int64_t v3;

  -[IMAssociatedMessageChatItem _imAssociatedMessageItem](self, "_imAssociatedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "associatedMessageType");

  return v3;
}

- (_NSRange)associatedMessageRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[IMAssociatedMessageChatItem _imAssociatedMessageItem](self, "_imAssociatedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "associatedMessageRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSString)associatedMessageEmoji
{
  void *v2;
  void *v3;

  -[IMAssociatedMessageChatItem _imAssociatedMessageItem](self, "_imAssociatedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedMessageEmoji");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)failed
{
  void *v2;
  BOOL v3;

  -[IMAssociatedMessageChatItem _imAssociatedMessageItem](self, "_imAssociatedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "errorCode") != 0;

  return v3;
}

- (NSDictionary)messageSummaryInfo
{
  void *v2;
  void *v3;

  -[IMAssociatedMessageChatItem _imAssociatedMessageItem](self, "_imAssociatedMessageItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageSummaryInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)_setParentMessageIsFromMe:(BOOL)a3
{
  self->_parentMessageIsFromMe = a3;
}

- (void)_setGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)&a3->parentPreviewWidth;
  v3 = *(_OWORD *)&a3->yScalar;
  v5 = *(_OWORD *)&a3->layoutIntent;
  self->_geometryDescriptor.rotation = a3->rotation;
  *(_OWORD *)&self->_geometryDescriptor.parentPreviewWidth = v4;
  *(_OWORD *)&self->_geometryDescriptor.yScalar = v3;
  *(_OWORD *)&self->_geometryDescriptor.layoutIntent = v5;
}

- (void)setTapback:(id)a3
{
  objc_storeStrong((id *)&self->_tapback, a3);
}

- (void)setEmojiSticker:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSticker, a3);
}

- (BOOL)isEmojiSticker
{
  return self->_emojiSticker != 0;
}

- (BOOL)parentMessageIsFromMe
{
  return self->_parentMessageIsFromMe;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].associatedLayoutIntent;
  *(_OWORD *)&retstr->layoutIntent = *(_OWORD *)&self[1].rotation;
  *(_OWORD *)&retstr->parentPreviewWidth = v3;
  *(_OWORD *)&retstr->yScalar = *(_OWORD *)&self[2].xScalar;
  retstr->rotation = self[2].scale;
  return self;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (IMTapback)tapback
{
  return self->_tapback;
}

- (IMEmojiSticker)emojiSticker
{
  return self->_emojiSticker;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (BOOL)isReaction
{
  return self->_isReaction;
}

- (void)setIsReaction:(BOOL)a3
{
  self->_isReaction = a3;
}

- (unint64_t)stickerPositionVersion
{
  return self->_stickerPositionVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSticker, 0);
  objc_storeStrong((id *)&self->_tapback, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
