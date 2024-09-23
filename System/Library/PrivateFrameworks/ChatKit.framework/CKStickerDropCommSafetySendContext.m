@implementation CKStickerDropCommSafetySendContext

+ (id)contextKey
{
  return CFSTR("CKCommSafetyContextKeyStickerDropSend");
}

+ (id)contextWithSticker:(id)a3 composition:(id)a4 mediaObject:(id)a5 parentMessagePartChatItem:(id)a6 messageSummaryInfo:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CKStickerDropCommSafetySendContext *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[CKStickerDropCommSafetySendContext initWithSticker:composition:mediaObject:parentMessagePartChatItem:messageSummaryInfo:]([CKStickerDropCommSafetySendContext alloc], "initWithSticker:composition:mediaObject:parentMessagePartChatItem:messageSummaryInfo:", v15, v14, v13, v12, v11);

  return v16;
}

- (CKStickerDropCommSafetySendContext)initWithSticker:(id)a3 composition:(id)a4 mediaObject:(id)a5 parentMessagePartChatItem:(id)a6 messageSummaryInfo:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKStickerDropCommSafetySendContext *v17;
  CKStickerDropCommSafetySendContext *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CKStickerDropCommSafetySendContext;
  v17 = -[CKStickerDropCommSafetySendContext init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sticker, a3);
    objc_storeStrong((id *)&v18->_composition, a4);
    objc_storeStrong((id *)&v18->_mediaObject, a5);
    objc_storeStrong((id *)&v18->_parentMessagePartChatItem, a6);
    objc_storeStrong((id *)&v18->_messageSummaryInfo, a7);
  }

  return v18;
}

- (IMSticker)sticker
{
  return self->_sticker;
}

- (CKComposition)composition
{
  return self->_composition;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (CKMessagePartChatItem)parentMessagePartChatItem
{
  return self->_parentMessagePartChatItem;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_parentMessagePartChatItem, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_sticker, 0);
}

@end
