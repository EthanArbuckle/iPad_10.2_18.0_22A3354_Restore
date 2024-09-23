@implementation CKAttachmentMessagePartChatItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CKAttachmentMessagePartChatItem;
  -[CKMessagePartChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ attachmentContiguousType:%d]"), v4, -[CKChatItem attachmentContiguousType](self, "attachmentContiguousType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CKAttachmentMessagePartChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  id v6;
  CKAttachmentMessagePartChatItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKAttachmentMessagePartChatItem;
  v7 = -[CKMessagePartChatItem initWithIMChatItem:maxWidth:](&v18, sel_initWithIMChatItem_maxWidth_, v6, a4);
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      NSStringFromSelector(sel_chatContext);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      NSStringFromSelector(sel_message);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAttachmentMessagePartChatItem transferGUID](v7, "transferGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaObjectWithTransferGUID:imMessage:chatContext:", v13, v11, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      NSStringFromSelector(sel_time);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v14, "setTime:", v16);

      }
    }
    -[CKAttachmentMessagePartChatItem setMediaObject:](v7, "setMediaObject:", v14);

  }
  return v7;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __objc2_class *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v22;
  void *v23;
  double *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  char isKindOfClass;
  id v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  float v80;
  double v81;
  void *v82;
  char v83;
  void *v84;
  double v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  objc_super v111;
  objc_super v112;
  char v113;
  double buf[3];
  uint64_t v115;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v115 = *MEMORY[0x1E0C80C00];
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewBalloonSizeThatFits:", width, height);
LABEL_3:
    v12 = v10;
    v13 = v11;

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = CKDeletedMomentShareBalloonView;
LABEL_8:
    -[__objc2_class sizeThatFits:](v14, "sizeThatFits:", width, height);
LABEL_9:
    v12 = v15;
    v13 = v16;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = CKUnavailableMomentShareBalloonView;
    goto LABEL_8;
  }
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "transfer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isSticker");

  if (v21)
  {
    if (a4)
    {
      v22 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
      *(_OWORD *)&a4->bottom = v22;
    }
    +[CKChatItemSizeCache sharedInstance](CKChatItemSizeCache, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (double *)MEMORY[0x1E0C9D820];
    *(_OWORD *)buf = *MEMORY[0x1E0C9D820];
    if (objc_msgSend(v23, "cachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, buf, 0, width, height))
    {
      -[CKAttachmentMessagePartChatItem _adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:](self, "_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:", buf[0], buf[1]);
      v12 = v25;
      v13 = v26;
    }
    else
    {
      v113 = 0;
      -[CKAttachmentMessagePartChatItem _transcoderGeneratedSizeFittingSize:sizeExists:](self, "_transcoderGeneratedSizeFittingSize:sizeExists:", &v113, width, height);
      v46 = v45;
      v47 = *v24;
      v109 = v24[1];
      if (v113)
      {
        v48 = v44;
        v49 = 0.0;
      }
      else
      {
        -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "previewMaxWidth");
        objc_msgSend(v50, "previewForWidth:orientation:", 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v54 = v52;
          v55 = v54;
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v54, "image");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "size");
            v46 = v57;
            v48 = v58;

            objc_msgSend(v55, "image");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v59, "scale");
            v49 = v60;
          }
          else
          {
            objc_msgSend(v54, "size");
            v46 = v72;
            v48 = v73;
            objc_msgSend(v55, "scale");
            v49 = v74;
            v59 = v55;
          }

        }
        else
        {
          v49 = 0.0;
          v48 = v109;
          v46 = v47;
        }

      }
      -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject", *(_QWORD *)&v109);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "transfer");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "stickerUserInfo");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (v77)
      {
        objc_msgSend(v77, "objectForKey:", *MEMORY[0x1E0D392D8]);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        if (v78)
        {
          objc_msgSend(v78, "floatValue");
          v81 = v80;
        }
        else
        {
          v81 = 1.0;
        }

      }
      else
      {
        v81 = 1.0;
      }
      -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v83 = objc_opt_isKindOfClass();

      if ((v83 & 1) != 0)
      {
        -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = width;
        if (objc_msgSend(v84, "isSticker"))
        {
          objc_msgSend(v84, "sticker");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "externalURI");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "hasPrefix:", CFSTR("sticker:///emoji/"));

          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKAttachmentMessagePartChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "displayScale");
          objc_msgSend(v89, "stickerInlinePreviewMaxWidthForImageSize:isEmoji:displayScale:", v88, v46, v48, v91);
          v93 = v92;

          v85 = fmin(width, v93);
        }

      }
      else
      {
        v85 = width;
      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "stickerScreenScale");
      objc_msgSend(v94, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v46, v48, v49, v81, v95, v85);
      v98 = v96;
      v99 = v97;
      if (v96 != v47 || v97 != v110)
        objc_msgSend(v23, "setCachedSizeForChatItem:size:textAlignmentInsets:fittingSize:", self, v96, v97, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24), width, height);
      -[CKAttachmentMessagePartChatItem _adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:](self, "_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:", v98, v99);
      v12 = v100;
      v13 = v101;

    }
    goto LABEL_10;
  }
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_opt_class();
  if (objc_msgSend(v28, "isEqual:", objc_opt_class()))
  {
    v29 = -[CKMessagePartChatItem isReplyContextPreview](self, "isReplyContextPreview");

    if (!v29)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "mapPreviewMaxWidth");
      v32 = v31;

      if (v32 >= width)
        v33 = width;
      else
        v33 = v32;
      objc_msgSend(v9, "mapThumbnailFillSizeForWidth:", v33);
      goto LABEL_3;
    }
  }
  else
  {

  }
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v34, "generatePreviewOutOfProcess") & 1) == 0)
  {

    goto LABEL_30;
  }
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend((id)objc_opt_class(), "shouldUseTranscoderGeneratedPreviewSize");

  if (!v36)
    goto LABEL_30;
  v113 = 0;
  -[CKAttachmentMessagePartChatItem _transcoderGeneratedSizeFittingSize:sizeExists:](self, "_transcoderGeneratedSizeFittingSize:sizeExists:", &v113, width, height);
  if (v113)
  {
    v39 = v37;
    v40 = v38;
    -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "previewMaxWidth");
    objc_msgSend(v41, "prewarmPreviewForWidth:orientation:", -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation"), v43);

    -[CKAttachmentMessagePartChatItem _adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:](self, "_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:", v39, v40);
    goto LABEL_9;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      -[CKAttachmentMessagePartChatItem transferGUID](self, "transferGUID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v62;
      _os_log_impl(&dword_18DFCD000, v61, OS_LOG_TYPE_INFO, "Did not find transcoder generated size for item w/ transferGUID = %@, generating preview", (uint8_t *)buf, 0xCu);

    }
  }
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "previewMaxWidth");
  objc_msgSend(v63, "previewForWidth:orientation:", -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation"), v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v66)
  {
LABEL_30:
    v111.receiver = self;
    v111.super_class = (Class)CKAttachmentMessagePartChatItem;
    -[CKBalloonChatItem loadSizeThatFits:textAlignmentInsets:](&v111, sel_loadSizeThatFits_textAlignmentInsets_, a4, width, height);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v66, "image");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "size");
    v69 = v68;
    v71 = v70;

  }
  else
  {
    objc_msgSend(v66, "size");
    v69 = v102;
    v71 = v103;
  }
  if (!+[CKApplicationState isResizing](CKApplicationState, "isResizing"))
  {
    v112.receiver = self;
    v112.super_class = (Class)CKAttachmentMessagePartChatItem;
    -[CKBalloonChatItem loadSizeThatFits:textAlignmentInsets:](&v112, sel_loadSizeThatFits_textAlignmentInsets_, a4, width, height);
  }
  -[CKAttachmentMessagePartChatItem _adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:](self, "_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:", v69, v71);
  v12 = v104;
  v13 = v105;
  if (width < v104 || height < v105)
  {
    v106 = width / v104;
    v107 = 0.0;
    if (v12 == 0.0)
      v106 = 0.0;
    if (v13 != 0.0)
      v107 = height / v13;
    v108 = fmin(v106, v107);
    v12 = ceil(v12 * v108);
    v13 = ceil(v13 * v108);
  }

LABEL_10:
  v17 = v12;
  v18 = v13;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)_adjustedSizeForSensitiveBlurredViewThatFitsSizeIfNeeded:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isFeatureEnabled"))
  {
    v7 = -[CKChatItem isCommSafetySensitiveNotViewable](self, "isCommSafetySensitiveNotViewable");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "enablementGroup");

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 == 2)
        objc_msgSend(v10, "obscuredBalloonMinimumSizeForAdult");
      else
        objc_msgSend(v10, "obscuredBalloonMinimumSizeForChild");
      v14 = v12;
      v15 = v13;

      width = fmax(width, v14);
      height = fmax(height, v15);
    }
  }
  else
  {

  }
  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (Class)cellClass
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v7;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKAttachmentMessagePartChatItem;
    -[CKBalloonChatItem cellClass](&v7, sel_cellClass);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v5;
}

- (CGSize)_transcoderGeneratedSizeFittingSize:(CGSize)a3 sizeExists:(BOOL *)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _OWORD v21[2];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transfer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isSticker"))
    IMClientPreviewStickerConstraints();
  else
    IMClientPreviewConstraints();

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v23;
  v21[1] = v24;
  v22 = v25;
  objc_msgSend(v10, "transcoderGeneratedSizeForConstraints:", v21);
  v12 = v11;
  v14 = v13;

  if (v12 == *MEMORY[0x1E0C9D820] && v14 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (a4)
      *a4 = 0;
  }
  else
  {
    if (a4)
      *a4 = 1;
    if (width < v12 || height < v14)
    {
      v16 = width / v12;
      v17 = 0.0;
      if (v12 == 0.0)
        v16 = 0.0;
      if (v14 != 0.0)
        v17 = height / v14;
      v18 = fmin(v16, v17);
      v12 = ceil(v12 * v18);
      v14 = ceil(v14 * v18);
    }
  }
  v19 = v12;
  v20 = v14;
  result.height = v20;
  result.width = v19;
  return result;
}

- (BOOL)canCopy
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  char v9;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transfer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSticker");

  if ((v5 & 1) != 0)
    return 0;
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transfer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFileDataReady");

  return v9;
}

- (BOOL)canInlineReply
{
  CKAttachmentMessagePartChatItem *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v2 = self;
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "transfer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = !+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForCKFileTransfer:](CKCommSafetyHelper, "shouldDisableTranscriptCapabilitiesForCKFileTransfer:", v4);
  v6.receiver = v2;
  v6.super_class = (Class)CKAttachmentMessagePartChatItem;
  LODWORD(v2) = -[CKMessagePartChatItem canInlineReply](&v6, sel_canInlineReply) & v3;

  return (char)v2;
}

- (BOOL)canForward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transfer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForCKFileTransfer:](CKCommSafetyHelper, "shouldDisableTranscriptCapabilitiesForCKFileTransfer:", v4)|| (-[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "transfer"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isSticker"), v6, v5, (v7 & 1) != 0))
  {
    v8 = 0;
  }
  else
  {
    -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transfer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isFileDataReady");

  }
  return v8;
}

- (BOOL)canExport
{
  void *v2;
  char v3;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canExport");

  return v3;
}

- (BOOL)canPerformQuickAction
{
  void *v3;
  _BOOL4 v4;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canPerformQuickAction"))
    v4 = !-[CKChatItem itemIsReplyContextPreview](self, "itemIsReplyContextPreview");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (BOOL)stickersSnapToPoint
{
  void *v2;
  char v3;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = objc_opt_isKindOfClass() ^ 1;
  }

  return v3 & 1;
}

- (void)setTranscriptTraitCollection:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[UITraitCollection isEqual:](self->_transcriptTraitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transcriptTraitCollection, a3);
    -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranscriptTraitCollection:", v6);

  }
}

- (Class)balloonViewClass
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  double v8;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewMaxWidth");
    objc_msgSend(v6, "balloonViewClassForWidth:orientation:", -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation"), v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v4;
}

- (unint64_t)balloonCorners
{
  return -1;
}

- (BOOL)shouldCacheSize
{
  return 0;
}

- (id)fileURLForAttachment
{
  void *v2;
  void *v3;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rtfDocumentItemsWithFormatString:selectedTextRange:", v7, location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dragItemProvider
{
  NSItemProvider *dragItemProvider;
  void *v4;
  NSItemProvider *v5;
  NSItemProvider *v6;

  dragItemProvider = self->_dragItemProvider;
  if (!dragItemProvider)
  {
    -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pasteboardItemProvider");
    v5 = (NSItemProvider *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dragItemProvider;
    self->_dragItemProvider = v5;

    dragItemProvider = self->_dragItemProvider;
  }
  return dragItemProvider;
}

- (NSString)transferGUID
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transferGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)momentShareURL
{
  NSURL *momentShareURL;
  void *v4;
  NSURL *v5;
  NSURL *v6;

  momentShareURL = self->_momentShareURL;
  if (!momentShareURL)
  {
    -[CKMessagePartChatItem message](self, "message");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IMCoreMomentShareURLForMessage();
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v6 = self->_momentShareURL;
    self->_momentShareURL = v5;

    momentShareURL = self->_momentShareURL;
  }
  return momentShareURL;
}

- (id)transcriptTraitCollection
{
  return self->_transcriptTraitCollection;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaObject, 0);
  objc_storeStrong((id *)&self->_transcriptTraitCollection, 0);
  objc_storeStrong((id *)&self->_momentShareURL, 0);
  objc_storeStrong((id *)&self->_dragItemProvider, 0);
}

- (id)compositionWithContext:(id)a3
{
  void *v3;
  void *v4;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
