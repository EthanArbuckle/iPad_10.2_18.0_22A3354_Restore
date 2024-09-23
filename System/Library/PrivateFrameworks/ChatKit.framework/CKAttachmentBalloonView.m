@implementation CKAttachmentBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5;
  id v8;
  objc_super v9;

  v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentBalloonView;
  v8 = a3;
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:](&v9, sel_configureForMediaObject_previewWidth_orientation_, v8, v5, a4);
  -[CKAttachmentBalloonView setMediaObject:](self, "setMediaObject:", v8, v9.receiver, v9.super_class);

}

- (void)configureForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAttachmentBalloonView;
  v4 = a3;
  -[CKImageBalloonView configureForComposition:](&v8, sel_configureForComposition_, v4);
  -[CKBalloonView setColor:](self, "setColor:", 0xFFFFFFFFLL, v8.receiver, v8.super_class);
  objc_msgSend(v4, "mediaObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewMaxWidth");
  -[CKAttachmentBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);

}

- (CKAttachmentBalloonView)initWithFrame:(CGRect)a3
{
  CKAttachmentBalloonView *v3;
  CKAttachmentBalloonView *v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  CKBalloonImageView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CKBalloonImageView *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKAttachmentBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "_setDisableAnimations:", 1);
    objc_msgSend(v6, "_setUsesDeferredLayout:", 0);
    objc_msgSend(v6, "_setApplyCornerRadius:", 0);
    objc_msgSend(v6, "_setDisableTapGesture:", 1);
    objc_msgSend(v6, "_setAllowsTapToLoad:", 0);
    objc_msgSend(v6, "setDelegate:", v5);

    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
    objc_msgSend(v6, "setOpaque:", 0);
    v7 = v5[102];
    v5[102] = v6;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginBalloonInsetsForMessageFromMe:", objc_msgSend(v5, "_isFromMe"));
    objc_msgSend(v5[102], "setContentInset:");

    objc_msgSend(v5, "setBalloonStyle:", 0);
    objc_msgSend(v5, "addSubview:", v5[102]);
    v9 = [CKBalloonImageView alloc];
    objc_msgSend(v5, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v5, "pluginInsets");
    v22 = -[CKBalloonImageView initWithFrame:](v9, "initWithFrame:", v11 + v21, v13 + v18, v15 - (v21 + v19), v17 - (v18 + v20));
    objc_msgSend(v5, "setPluginInsetMask:", v22);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[LPLinkView sizeThatFits:](self->_attachmentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (a4)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v5;
  }
  -[LPLinkView sizeThatFits:](self->_attachmentView, "sizeThatFits:", a3.width, a3.height);
  v7 = v6;
  v9 = v8;
  if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
  {
    -[CKBalloonView suggestedActionsMenuAdditionalHeight](self, "suggestedActionsMenuAdditionalHeight");
    v7 = v7 + 0.0;
    v9 = v9 + v10;
  }
  v11 = v7;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _BOOL4 v24;
  LPLinkView *attachmentView;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CKAttachmentBalloonView;
  -[CKImageBalloonView layoutSubviews](&v27, sel_layoutSubviews);
  v3 = -[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu");
  -[CKAttachmentBalloonView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  if (v3)
  {
    -[CKBalloonView suggestedActionsMenuAdditionalHeight](self, "suggestedActionsMenuAdditionalHeight");
    v10 = v7 + 0.0;
    v12 = v9 - v11;
    -[CKAttachmentBalloonView bounds](self, "bounds");
    v14 = v13;
    -[CKAttachmentBalloonView bounds](self, "bounds");
  }
  else
  {
    v16 = v4;
    v17 = v5;
    -[CKAttachmentBalloonView pluginInsets](self, "pluginInsets");
    v19 = v18;
    v14 = v16 + v18;
    v15 = v17 + v20;
    v10 = v7 - (v19 + v21);
    v12 = v9 - (v20 + v22);
  }
  -[LPLinkView setFrame:](self->_attachmentView, "setFrame:", v14, v15, v10, v12);
  -[CKAttachmentBalloonView pluginInsetMask](self, "pluginInsetMask");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkView frame](self->_attachmentView, "frame");
  objc_msgSend(v23, "setFrame:");

  v24 = -[CKImageBalloonView isScheduled](self, "isScheduled");
  attachmentView = self->_attachmentView;
  if (v24)
  {
    -[LPLinkView setAlpha:](attachmentView, "setAlpha:", 0.5);
    -[CKAttachmentBalloonView pluginInsetMask](self, "pluginInsetMask");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAttachmentBalloonView insertSubview:above:](self, "insertSubview:above:", v26, self->_attachmentView);
  }
  else
  {
    -[LPLinkView setAlpha:](attachmentView, "setAlpha:", 1.0);
    -[CKAttachmentBalloonView pluginInsetMask](self, "pluginInsetMask");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeFromSuperview");
  }

}

- (UIEdgeInsets)alignmentRectInsets
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char v17;
  UIEdgeInsets result;

  v3 = -[CKBalloonView orientation](self, "orientation");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  objc_msgSend(v4, "attachmentBalloonAlignmentRectInsetsWithTailShape:", v17);
  v8 = v7;
  v10 = v9;
  if (v3)
    v11 = v5;
  else
    v11 = v6;
  if (v3)
    v12 = v6;
  else
    v12 = v5;

  v13 = v8;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (NSString)description
{
  void *v2;
  CKMediaObject *mediaObject;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  mediaObject = self->_mediaObject;
  v7.receiver = self;
  v7.super_class = (Class)CKAttachmentBalloonView;
  -[CKImageBalloonView description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[CKAttachmentBalloonView mediaObject:%@ %@]"), mediaObject, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)prepareForDisplay
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKAttachmentBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v18, sel_prepareForDisplay);
  -[LPLinkView setHidden:](self->_attachmentView, "setHidden:", 0);
  v3 = -[CKBalloonView orientation](self, "orientation") == 1;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginBalloonInsetsForMessageFromMe:", v3);
  -[LPLinkView setContentInset:](self->_attachmentView, "setContentInset:");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView setColor:](self, "setColor:", objc_msgSend(v5, "attachmentBalloonFillColor"));

  -[CKAttachmentBalloonView attachmentView](self, "attachmentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_dominantBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAttachmentBalloonView attachmentView](self, "attachmentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v8, "_dominantBackgroundColor");
  else
    +[CKMessagesCarouselView resolvedBackgroundColorFor:](CKMessagesCarouselView, "resolvedBackgroundColorFor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentBalloonView setBackgroundColor:](self, "setBackgroundColor:", v9);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  BYTE2(v13) = 0;
  WORD4(v17) = 1;
  -[CKAttachmentBalloonView pluginInsetMask](self, "pluginInsetMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v15;
  v12[3] = v16;
  v12[4] = v17;
  v12[0] = v13;
  v12[1] = v14;
  CKResizableBalloonPunchout(v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v11);

}

- (UIEdgeInsets)pluginInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  if (-[CKImageBalloonView isScheduled](self, "isScheduled"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "linkPreviewSendLaterInsets");

  }
  v7 = v2;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAttachmentBalloonView;
  -[CKImageBalloonView prepareForReuse](&v3, sel_prepareForReuse);
  -[LPLinkView setHidden:](self->_attachmentView, "setHidden:", 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a4, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  LOBYTE(v5) = v5 != objc_opt_class();

  return v5;
}

- (CGRect)uncroppedSourceFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CKAttachmentBalloonView uncroppedSourceView](self, "uncroppedSourceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIView)uncroppedSourceView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CKAttachmentBalloonView *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CKAttachmentBalloonView *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_attachmentView)
  {
    NSClassFromString(CFSTR("LPFlippedView"));
    _CKFirstSubviewOfType(self->_attachmentView);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
      v10 = self;
LABEL_28:

      return (UIView *)v10;
    }
    _CKFirstSubviewOfType(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = self;
LABEL_27:

      goto LABEL_28;
    }
    NSClassFromString(CFSTR("LPCaptionBarView"));
    _CKFirstSubviewOfType(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      NSClassFromString(CFSTR("LPImageView"));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v6, "subviews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v8)
      {
        v9 = v8;
        v25 = v6;
        v26 = v4;
        v10 = 0;
        v11 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v28 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              _CKFirstSubviewOfType(v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (v14)
              {
                if (v10)
                {
                  -[CKAttachmentBalloonView frame](v10, "frame");
                  v17 = v16;
                  -[CKAttachmentBalloonView frame](v10, "frame");
                  v19 = v17 * v18;
                  objc_msgSend(v15, "frame");
                  v21 = v20;
                  objc_msgSend(v15, "frame");
                  if (v21 * v22 > v19)
                  {
                    v23 = v15;

                    v10 = v23;
                  }
                }
                else
                {
                  v10 = v14;
                }
              }

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v9);

        v4 = v26;
        v6 = v25;
        if (v10)
          goto LABEL_26;
      }
      else
      {

      }
    }
    v10 = self;
LABEL_26:

    goto LABEL_27;
  }
  v10 = self;
  return (UIView *)v10;
}

- (void)setMediaObject:(id)a3
{
  CKMediaObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  LPLinkView *attachmentView;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  CKAttachmentBalloonView *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (CKMediaObject *)a3;
  if (self->_mediaObject == v5)
    goto LABEL_16;
  objc_storeStrong((id *)&self->_mediaObject, a3);
  -[LPLinkView resetDownloadState](self->_attachmentView, "resetDownloadState");
  objc_msgSend((id)objc_opt_class(), "linkMetadataFromMediaObject:", self->_mediaObject);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkView setMetadata:](self->_attachmentView, "setMetadata:", v6);

  -[CKMediaObject transfer](v5, "transfer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isDownloadable") & 1) != 0)
    goto LABEL_5;
  v8 = +[CKApplicationState isResizing](CKApplicationState, "isResizing");

  if (!v8)
  {
    attachmentView = self->_attachmentView;
    -[CKMediaObject transfer](v5, "transfer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _setBytesLoaded:](attachmentView, "_setBytesLoaded:", objc_msgSend(v7, "totalBytes"));
LABEL_5:

  }
  -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("CKFileTransferUpdatedNotification"), 0);
  if (v5)
  {
    -[CKMediaObject transfer](v5, "transfer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isDownloadable") & 1) != 0 || objc_msgSend(v11, "isDownloading"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = 138412290;
          v14 = self;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Media object not available, listen for updated notifications on %@", (uint8_t *)&v13, 0xCu);
        }

      }
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_transferUpdated_, CFSTR("CKFileTransferUpdatedNotification"), v11);
    }
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_richIconDidChange_, CFSTR("CKRichIconDidChangeNotification"), v5);

  }
LABEL_16:

}

- (void)_setProgressWithMediaObject:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "transfer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "totalBytes");

    objc_msgSend(v9, "transfer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDownloading");

    if (v7)
    {
      objc_msgSend(v9, "transfer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "currentBytes");

    }
    -[LPLinkView _setBytesLoaded:](self->_attachmentView, "_setBytesLoaded:", v5);
  }

}

- (void)transferUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject transfer](self->_mediaObject, "transfer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Transfer updated, marking needing display.", v11, 2u);
      }

    }
    -[CKAttachmentBalloonView _setProgressWithMediaObject:](self, "_setProgressWithMediaObject:", self->_mediaObject);
  }

}

- (void)richIconDidChange:(id)a3
{
  CKMediaObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "object");
  v5 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKAttachmentBalloonView.m"), 366, CFSTR("Received notification %@ but the object had an unexpected type or was nil. Expected: CKMediaObject. Got: %@"), v8, v5);

  }
  if (self->_mediaObject == v5)
  {
    objc_msgSend((id)objc_opt_class(), "linkMetadataFromMediaObject:", self->_mediaObject);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView setMetadata:](self->_attachmentView, "setMetadata:", v6);

  }
}

- (id)overlayColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)overlayImage
{
  if (overlayImage_onceToken != -1)
    dispatch_once(&overlayImage_onceToken, &__block_literal_global_74);
  return (id)overlayImage_attachmentOverlayImage;
}

void __39__CKAttachmentBalloonView_overlayImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", 1.0, 1.0);
  objc_msgSend(v0, "imageWithActions:", &__block_literal_global_89_1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)overlayImage_attachmentOverlayImage;
  overlayImage_attachmentOverlayImage = v1;

  objc_msgSend((id)overlayImage_attachmentOverlayImage, "imageWithRenderingMode:", 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resizableImageWithCapInsets:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)overlayImage_attachmentOverlayImage;
  overlayImage_attachmentOverlayImage = v3;

}

void __39__CKAttachmentBalloonView_overlayImage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CEA478];
  v3 = a2;
  objc_msgSend(v2, "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  objc_msgSend(v3, "format");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "fillRect:");

}

+ (id)linkMetadataFromMediaObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *PreferredIdentifierForTag;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  objc_msgSend(v4, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayNameAtPath:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0CC1200]);
  v13 = objc_alloc_init(MEMORY[0x1E0CC1160]);
  objc_msgSend(v4, "transfer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isThumbnail");

  if (v15)
  {
    objc_msgSend(v4, "transfer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "originalFilename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", v17);

    v18 = (const __CFString *)*MEMORY[0x1E0CA5A88];
    objc_msgSend(v13, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PreferredIdentifierForTag = (void *)UTTypeCreatePreferredIdentifierForTag(v18, (CFStringRef)objc_msgSend(v19, "pathExtension"), 0);

  }
  else
  {
    objc_msgSend(v13, "setName:", v6);
    objc_msgSend(v4, "UTIType");
    PreferredIdentifierForTag = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "setType:", PreferredIdentifierForTag);

  objc_msgSend(v4, "transfer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSize:", objc_msgSend(v21, "totalBytes"));

  objc_msgSend(a1, "_linkViewThumbnailFromMediaObject:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v22);
    objc_msgSend(v13, "setThumbnail:", v23);

  }
  objc_msgSend(v12, "setSpecialization:", v13);
  objc_msgSend(v5, "setSpecialization:", v12);

  return v5;
}

+ (id)_linkViewThumbnailFromMediaObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "transfer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorDocumentIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_9;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "isDownloadable") & 1) != 0 && !objc_msgSend(v4, "isThumbnail")
    || (objc_msgSend(v3, "richIcon"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_7:
    objc_msgSend(v3, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "genericDocumentIcon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_9:

  return v7;
}

- (void)setOverrideBackgroundColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CKAttachmentBalloonView attachmentView](self, "attachmentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setOverrideBackgroundColor:", v5);

  -[CKAttachmentBalloonView setBackgroundColor:](self, "setBackgroundColor:", v5);
}

- (BOOL)_isFromMe
{
  return -[CKBalloonView orientation](self, "orientation") == 1;
}

- (BOOL)shouldProvideDragPreview
{
  return 0;
}

- (id)attachmentBalloonViewPreview
{
  return 0;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (LPLinkView)attachmentView
{
  return self->_attachmentView;
}

- (void)setAttachmentView:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentView, a3);
}

- (CKBalloonImageView)pluginInsetMask
{
  return self->_pluginInsetMask;
}

- (void)setPluginInsetMask:(id)a3
{
  objc_storeStrong((id *)&self->_pluginInsetMask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginInsetMask, 0);
  objc_storeStrong((id *)&self->_attachmentView, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKAttachmentBalloonView;
  -[CKImageBalloonView configureForMessagePart:](&v15, sel_configureForMessagePart_, v4);
  objc_msgSend(v4, "strokeColor");
  if (v8 == 0.0 && v5 == 0.0 && v6 == 0.0 && v7 == 0.0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unfilledBalloonColorForColorType:", 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ckColor");
    -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");

  }
  else
  {
    -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");
  }
  -[CKBalloonView setColor:](self, "setColor:", 8);
  objc_msgSend(v4, "mediaObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "previewMaxWidth");
  -[CKAttachmentBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v12, objc_msgSend(v4, "balloonOrientation"), v14);

}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3
{
  -[CKBalloonView addSuggestedActionsMenuWithSuggestedActionsList:backgroundStyle:](self, "addSuggestedActionsMenuWithSuggestedActionsList:backgroundStyle:", a3, 0);
}

@end
