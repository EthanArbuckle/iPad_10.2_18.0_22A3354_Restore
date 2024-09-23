@implementation CKAnimatedEmojiMessagePartChatItem

- (CKAnimatedEmojiMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6;
  CKAnimatedEmojiMessagePartChatItem *v7;
  CKAnimatedEmojiMessagePartChatItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CKAnimatedEmojiMediaObject *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKAnimatedEmojiMessagePartChatItem;
  v7 = -[CKAttachmentMessagePartChatItem initWithIMChatItem:maxWidth:](&v17, sel_initWithIMChatItem_maxWidth_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[CKAttachmentMessagePartChatItem mediaObject](v7, "mediaObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && objc_msgSend(v9, "needsAnimation"))
    {
      objc_msgSend(v6, "message");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "__ck_context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      if ((objc_msgSend(v6, "isFromMe") & 1) == 0)
        objc_msgSend(v12, "setSpam:", objc_msgSend(v6, "parentChatIsSpam"));
      v13 = [CKAnimatedEmojiMediaObject alloc];
      objc_msgSend(v9, "transfer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CKAnimatedImageMediaObject initWithTransfer:context:forceInlinePreview:](v13, "initWithTransfer:context:forceInlinePreview:", v14, v12, 0);

      -[CKAttachmentMessagePartChatItem setMediaObject:](v8, "setMediaObject:", v15);
      v9 = (void *)v15;
    }

  }
  return v8;
}

@end
