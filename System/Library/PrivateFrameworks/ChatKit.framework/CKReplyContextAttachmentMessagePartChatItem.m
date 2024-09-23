@implementation CKReplyContextAttachmentMessagePartChatItem

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  objc_super v29;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mediaType");

  if ((v9 & 0xFFFFFFFE) == 2)
  {
    v29.receiver = self;
    v29.super_class = (Class)CKReplyContextAttachmentMessagePartChatItem;
    -[CKAttachmentMessagePartChatItem loadSizeThatFits:textAlignmentInsets:](&v29, sel_loadSizeThatFits_textAlignmentInsets_, a4, width, height);
    v11 = v10;
    v13 = v12;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textBalloonMinHeight");
    v16 = v15;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "replyPreviewBalloonMinWidth");
    v19 = v18;

    if (v19 < v11 || v16 < v13)
    {
      v21 = v19 / v11;
      v22 = 0.0;
      if (v11 == 0.0)
        v21 = 0.0;
      if (v13 != 0.0)
        v22 = v16 / v13;
      v23 = fmax(v21, v22);
      v19 = ceil(v11 * v23);
      v16 = ceil(v13 * v23);
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CKReplyContextAttachmentMessagePartChatItem;
    -[CKAttachmentMessagePartChatItem loadSizeThatFits:textAlignmentInsets:](&v28, sel_loadSizeThatFits_textAlignmentInsets_, a4, width, height);
    v19 = v24;
    v16 = v25;
  }
  v26 = v19;
  v27 = v16;
  result.height = v27;
  result.width = v26;
  return result;
}

- (Class)balloonViewClass
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mediaType");

  v5 = 0;
  switch(v4)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
      goto LABEL_4;
    case 1:
      -[CKMessagePartChatItem message](self, "message");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isAudioMessage");

      goto LABEL_4;
    case 2:
      objc_opt_class();
LABEL_4:
      v5 = (void *)objc_opt_class();
      break;
    default:
      return (Class)v5;
  }
  return (Class)v5;
}

- (char)color
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mediaType");

  if (v4 == 7)
    return 9;
  if (v4 == 9)
    return 9;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFromMe");

  if (!v6)
    return 9;
  v7 = (void *)MEMORY[0x1E0D35910];
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "__ck_displayReplyColor");

  return v11;
}

- (char)balloonStyle
{
  objc_class *v2;

  v2 = -[CKReplyContextAttachmentMessagePartChatItem balloonViewClass](self, "balloonViewClass");
  return v2 != (objc_class *)objc_opt_class();
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CKBalloonDescriptor_t *result;
  objc_super v13;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v13.receiver = self;
  v13.super_class = (Class)CKReplyContextAttachmentMessagePartChatItem;
  -[CKBalloonDescriptor_t balloonDescriptor](&v13, sel_balloonDescriptor);
  retstr->var2 = -[CKReplyContextAttachmentMessagePartChatItem balloonStyle](self, "balloonStyle");
  retstr->var0 = 4;
  retstr->var10 = 1;
  retstr->var3 = -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation");
  retstr->var5 = -[CKReplyContextAttachmentMessagePartChatItem color](self, "color");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unfilledBalloonColorForColorType:", -[CKReplyContextAttachmentMessagePartChatItem color](self, "color"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ckColor");
  retstr->var6.red = v8;
  retstr->var6.green = v9;
  retstr->var6.blue = v10;
  retstr->var6.alpha = v11;

  retstr->var9 = 1;
  return result;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)replyIsFromMe
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "replyIsFromMe");

  return v3;
}

@end
