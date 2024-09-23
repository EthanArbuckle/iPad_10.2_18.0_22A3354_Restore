@implementation CKAttachmentReplyPreviewBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  uint64_t v5;
  id v8;
  objc_super v9;

  v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  v8 = a3;
  -[CKBalloonView configureForMediaObject:previewWidth:orientation:](&v9, sel_configureForMediaObject_previewWidth_orientation_, v8, v5, a4);
  -[CKAttachmentReplyPreviewBalloonView setMediaObject:](self, "setMediaObject:", v8, v9.receiver, v9.super_class);

}

- (void)configureForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  v4 = a3;
  -[CKColoredBalloonView configureForComposition:](&v8, sel_configureForComposition_, v4);
  -[CKColoredBalloonView setColor:](self, "setColor:", 8, v8.receiver, v8.super_class);
  objc_msgSend(v4, "mediaObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewMaxWidth");
  -[CKAttachmentReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v6, 1);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKAttachmentReplyPreviewBalloonView mediaObject](self, "mediaObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  -[CKColoredBalloonView description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKAttachmentReplyPreviewBalloonView mediaObject:%@ %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKAttachmentReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  CKAttachmentReplyPreviewBalloonView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replyBalloonTextFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v7);

    objc_msgSend(v5, "setNumberOfLines:", 1);
    objc_msgSend(v5, "setLineBreakMode:", 4);
    -[CKAttachmentReplyPreviewBalloonView setTitleLabel:](v3, "setTitleLabel:", v5);
    -[CKAttachmentReplyPreviewBalloonView addSubview:](v3, "addSubview:", v5);
    -[CKBalloonView doubleTapGestureRecognizer](v3, "doubleTapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

  }
  return v3;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  -[CKColoredBalloonView prepareForDisplay](&v6, sel_prepareForDisplay);
  -[CKAttachmentReplyPreviewBalloonView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentReplyPreviewBalloonView mediaObject](self, "mediaObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentReplyPreviewBalloonView attachmentTitleForMediaObject:](self, "attachmentTitleForMediaObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v5);

  -[CKAttachmentReplyPreviewBalloonView bounds](self, "bounds");
  -[CKAttachmentReplyPreviewBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  objc_msgSend(v3, "setFrame:");

}

- (UIEdgeInsets)alignmentRectInsets
{
  int v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v2 = -[CKBalloonView orientation](self, "orientation");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentReplyPreviewBalloonAlignmentRectInsets");
  v7 = v6;
  v9 = v8;
  if (v2)
    v10 = v4;
  else
    v10 = v5;
  if (v2)
    v11 = v5;
  else
    v11 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textAlignmentRectInsetsScaleFactor");
  v14 = v7 * v13;
  v15 = v10 * v13;
  v16 = v9 * v13;
  v17 = v11 * v13;

  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  -[CKColoredBalloonView prepareForReuse](&v4, sel_prepareForReuse);
  -[CKAttachmentReplyPreviewBalloonView setMediaObject:](self, "setMediaObject:", 0);
  -[CKAttachmentReplyPreviewBalloonView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  objc_super v33;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v33.receiver = self;
  v33.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  -[CKBalloonView sizeThatFits:textAlignmentInsets:](&v33, sel_sizeThatFits_textAlignmentInsets_);
  v9 = v8;
  -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", width, height);
  v11 = v10;
  v13 = v12;
  -[CKAttachmentReplyPreviewBalloonView titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v11, v13);
  v16 = v15;
  v18 = v17;

  -[CKAttachmentReplyPreviewBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  if (a4)
  {
    -[CKAttachmentReplyPreviewBalloonView alignmentRectInsets](self, "alignmentRectInsets");
    a4->top = v27;
    a4->left = v28;
    a4->bottom = v29;
    a4->right = v30;
  }
  v31 = fmax(v18 + v20 + v24, v9);
  v32 = fmin(v16 + v22 + v26, width);
  result.height = v31;
  result.width = v32;
  return result;
}

- (void)setMediaObject:(id)a3
{
  CKMediaObject *v5;
  CKMediaObject *v6;

  v5 = (CKMediaObject *)a3;
  if (self->_mediaObject != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaObject, a3);
    v5 = v6;
  }

}

- (id)attachmentTitleForMediaObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v14 = 0;
    goto LABEL_16;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonTextColorForColorType:", -[CKBalloonView color](self, "color"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "mediaType");
  if (v8 == 4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replyPreviewContactIconName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithTintColor:", v7);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v16;
    goto LABEL_9;
  }
  if (v8 != 5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "replyPreviewDocumentIconName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithTintColor:", v7);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replyPreviewLocationIconName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKMapAnnotationMarkerColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithTintColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(v4, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v14, "appendAttributedString:", v21);

    v22 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v4, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithString:", v23);
    objc_msgSend(v14, "appendAttributedString:", v24);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v28 = 136315138;
      v29 = "-[CKAttachmentReplyPreviewBalloonView attachmentTitleForMediaObject:]";
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "CKAttachmentReplyPreviewBalloonView %s Media object missing title!", (uint8_t *)&v28, 0xCu);
    }

  }
  v26 = objc_msgSend(v14, "length");
  objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v7, 0, v26);

LABEL_16:
  return v14;
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8[5];
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentReplyPreviewBalloonView;
  -[CKColoredBalloonView configureForMessagePart:](&v9, sel_configureForMessagePart_, v4);
  if (v4)
    objc_msgSend(v4, "balloonDescriptor");
  else
    memset(v8, 0, sizeof(v8));
  -[CKColoredBalloonView setBalloonDescriptor:](self, "setBalloonDescriptor:", v8);
  objc_msgSend(v4, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewMaxWidth");
  -[CKAttachmentReplyPreviewBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", v5, objc_msgSend(v4, "balloonOrientation"), v7);

}

@end
