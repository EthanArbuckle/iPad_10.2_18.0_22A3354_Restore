@implementation CKPinnedConversationMediaObjectActivityItem

- (CKPinnedConversationMediaObjectActivityItem)initWithMessage:(id)a3 mediaObject:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKPinnedConversationMediaObjectActivityItem *v14;
  CKPinnedConversationMediaObjectActivityItem *v15;
  uint64_t v16;
  NSString *attachedContactItemIdentifier;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKPinnedConversationMediaObjectActivityItem;
  v14 = -[CKPinnedConversationMediaObjectActivityItem init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_message, a3);
    objc_storeStrong((id *)&v15->_mediaObject, a4);
    v15->_activityItemContentScale = a5;
    v16 = objc_msgSend(v13, "copy");
    attachedContactItemIdentifier = v15->_attachedContactItemIdentifier;
    v15->_attachedContactItemIdentifier = (NSString *)v16;

  }
  return v15;
}

- (NSString)activityItemIdentifier
{
  return (NSString *)-[IMMessage guid](self->_message, "guid");
}

- (BOOL)activityItemAppearsWithAnimation
{
  return 1;
}

- (BOOL)activityItemDisappearsWithAnimation
{
  return 1;
}

- (id)activityItemView
{
  return -[CKPinnedConversationMediaObjectBubble initWithMediaObjectActivityItem:]([CKPinnedConversationMediaObjectBubble alloc], "initWithMediaObjectActivityItem:", self);
}

- (NSString)attachedContactItemIdentifier
{
  return self->_attachedContactItemIdentifier;
}

+ (id)previewableMediaObjectFromMessage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "__ck_mediaObjects");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "isPreviewable", (_QWORD)v20))
        {
          objc_msgSend(v9, "transfer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "commSafetySensitive");

          if ((unint64_t)(v11 - 1) >= 2)
          {
            if (objc_msgSend(a1, "_mediaTypeSupportedForPinningPreview:", objc_msgSend(v9, "mediaType")))
            {
              objc_msgSend(v9, "transfer");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "isFileDataReady");

              if (v13)
              {
                objc_msgSend(v9, "transfer");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "isAdaptiveImageGlyph");

                if ((v15 & 1) == 0)
                {
                  objc_msgSend(a1, "previewImageForMediaObject:", v9);
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (v16)
                  {
                    v18 = (void *)v16;
                    v17 = v9;

                    goto LABEL_16;
                  }
                }
              }
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_16:

  return v17;
}

+ (BOOL)_mediaTypeSupportedForPinningPreview:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 2;
}

+ (id)previewImageForMediaObject:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewMaxWidth");
  v6 = v5;

  objc_msgSend(v3, "previewForWidth:orientation:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "image");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (double)activityItemContentScale
{
  return self->_activityItemContentScale;
}

- (IMMessage)message
{
  return self->_message;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_attachedContactItemIdentifier, 0);
}

@end
