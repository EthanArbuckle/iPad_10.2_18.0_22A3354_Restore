@implementation CKAutomaticallyPlacedStickerCommSafetySendContext

+ (id)contextKey
{
  return CFSTR("CKCommSafetyContextKeyAutomaticallyPlacedStickerSend");
}

+ (id)contextWithAutomaticallyPlacedSticker:(id)a3 stickerReactionSession:(id)a4 chatItem:(id)a5 parentChatItem:(id)a6 stickerFrame:(CGRect)a7 animationCompletionHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CKAutomaticallyPlacedStickerCommSafetySendContext *v21;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[CKAutomaticallyPlacedStickerCommSafetySendContext initWithAutomaticallyPlacedSticker:stickerReactionSession:chatItem:parentChatItem:stickerFrame:animationCompletionHandler:]([CKAutomaticallyPlacedStickerCommSafetySendContext alloc], "initWithAutomaticallyPlacedSticker:stickerReactionSession:chatItem:parentChatItem:stickerFrame:animationCompletionHandler:", v20, v19, v18, v17, v16, x, y, width, height);

  return v21;
}

- (CKAutomaticallyPlacedStickerCommSafetySendContext)initWithAutomaticallyPlacedSticker:(id)a3 stickerReactionSession:(id)a4 chatItem:(id)a5 parentChatItem:(id)a6 stickerFrame:(CGRect)a7 animationCompletionHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  id v21;
  CKAutomaticallyPlacedStickerCommSafetySendContext *v22;
  CKAutomaticallyPlacedStickerCommSafetySendContext *v23;
  void *v24;
  id animationCompletionHandler;
  id v27;
  objc_super v28;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v27 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v28.receiver = self;
  v28.super_class = (Class)CKAutomaticallyPlacedStickerCommSafetySendContext;
  v22 = -[CKAutomaticallyPlacedStickerCommSafetySendContext init](&v28, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sticker, a3);
    objc_storeStrong((id *)&v23->_stickerReactionSession, a4);
    objc_storeStrong((id *)&v23->_chatItem, a5);
    objc_storeStrong((id *)&v23->_parentChatItem, a6);
    v23->_stickerFrame.origin.x = x;
    v23->_stickerFrame.origin.y = y;
    v23->_stickerFrame.size.width = width;
    v23->_stickerFrame.size.height = height;
    v24 = _Block_copy(v21);
    animationCompletionHandler = v23->_animationCompletionHandler;
    v23->_animationCompletionHandler = v24;

  }
  return v23;
}

- (IMSticker)sticker
{
  return self->_sticker;
}

- (CKStickerReactionSession)stickerReactionSession
{
  return self->_stickerReactionSession;
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (CKMessagePartChatItem)parentChatItem
{
  return self->_parentChatItem;
}

- (CGRect)stickerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_stickerFrame.origin.x;
  y = self->_stickerFrame.origin.y;
  width = self->_stickerFrame.size.width;
  height = self->_stickerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)animationCompletionHandler
{
  return self->_animationCompletionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_parentChatItem, 0);
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_storeStrong((id *)&self->_stickerReactionSession, 0);
  objc_storeStrong((id *)&self->_sticker, 0);
}

@end
