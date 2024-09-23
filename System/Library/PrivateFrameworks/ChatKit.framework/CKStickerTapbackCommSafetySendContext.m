@implementation CKStickerTapbackCommSafetySendContext

+ (id)contextKey
{
  return CFSTR("CKCommSafetyContextKeyStickerTapbackSend");
}

+ (id)contextWithStickerTapback:(id)a3 mediaObject:(id)a4 parentMessagePartChatItem:(id)a5
{
  id v7;
  id v8;
  id v9;
  CKStickerTapbackCommSafetySendContext *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CKStickerTapbackCommSafetySendContext initWithStickerTapback:mediaObject:parentMessagePartChatItem:]([CKStickerTapbackCommSafetySendContext alloc], "initWithStickerTapback:mediaObject:parentMessagePartChatItem:", v9, v8, v7);

  return v10;
}

- (CKStickerTapbackCommSafetySendContext)initWithStickerTapback:(id)a3 mediaObject:(id)a4 parentMessagePartChatItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKStickerTapbackCommSafetySendContext *v12;
  CKStickerTapbackCommSafetySendContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKStickerTapbackCommSafetySendContext;
  v12 = -[CKStickerTapbackCommSafetySendContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stickerTapback, a3);
    objc_storeStrong((id *)&v13->_mediaObject, a4);
    objc_storeStrong((id *)&v13->_parentMessagePartChatItem, a5);
  }

  return v13;
}

- (IMStickerTapback)stickerTapback
{
  return self->_stickerTapback;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (CKMessagePartChatItem)parentMessagePartChatItem
{
  return self->_parentMessagePartChatItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentMessagePartChatItem, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_stickerTapback, 0);
}

@end
