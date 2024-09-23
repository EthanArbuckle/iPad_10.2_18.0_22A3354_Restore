@implementation CKMessageAcknowledgmentChatItem

- (CKMessageAcknowledgmentChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  CKMessageAcknowledgmentChatItem *v4;
  CKMessageAcknowledgmentChatItem *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMessageAcknowledgmentChatItem;
  v4 = -[CKChatItem initWithIMChatItem:maxWidth:](&v8, sel_initWithIMChatItem_maxWidth_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKMessageAcknowledgmentChatItem messageAcknowledgmentChatItem](v4, "messageAcknowledgmentChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_messageAcknowledgmentType = CKMessageAcknowledgmentTypeFromIMAssociatedMessageType(objc_msgSend(v6, "associatedMessageType"));

  }
  return v5;
}

- (UIEdgeInsets)contentInsets
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
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonTranscriptInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a4, a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgmentTranscriptBalloonSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (NSString)acknowledgmentImageName
{
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageAcknowledgmentImageNameForType:", -[CKMessageAcknowledgmentChatItem messageAcknowledgmentType](self, "messageAcknowledgmentType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)sender
{
  void *v2;
  void *v3;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (char)balloonOrientation
{
  return -[CKAssociatedMessageChatItem parentMessageIsFromMe](self, "parentMessageIsFromMe");
}

- (char)transcriptOrientation
{
  if (-[CKAssociatedMessageChatItem parentMessageIsFromMe](self, "parentMessageIsFromMe"))
    return 2;
  else
    return 0;
}

- (char)balloonColorType
{
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "messageAcknowledgmentBalloonColorTypeForStyle:", -[CKMessageAcknowledgmentChatItem themeStyle](self, "themeStyle"));

  return (char)self;
}

- (int64_t)themeStyle
{
  return -[CKChatItem isFromMe](self, "isFromMe");
}

- (int64_t)themeColor
{
  return self->_messageAcknowledgmentType == 2000;
}

- (UIColor)acknowledgmentImageColor
{
  void *v3;
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgment:acknowledgmentImageColor:", -[CKMessageAcknowledgmentChatItem themeStyle](self, "themeStyle"), -[CKMessageAcknowledgmentChatItem themeColor](self, "themeColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

- (UIColor)selectedAcknowledgmentImageColor
{
  void *v3;
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgment:selectedAcknowledgmentImageColor:", -[CKMessageAcknowledgmentChatItem themeStyle](self, "themeStyle"), -[CKMessageAcknowledgmentChatItem themeColor](self, "themeColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

- (UIColor)selectedBalloonColor
{
  void *v3;
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgmentSelectedBalloonColorForStyle:", -[CKMessageAcknowledgmentChatItem themeStyle](self, "themeStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  void *v5;
  void *v6;
  CKBalloonDescriptor_t *result;
  objc_super v8;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v8.receiver = self;
  v8.super_class = (Class)CKMessageAcknowledgmentChatItem;
  -[CKBalloonDescriptor_t balloonDescriptor](&v8, sel_balloonDescriptor);
  *(_WORD *)&retstr->var0 = 514;
  retstr->var2 = 1;
  retstr->var4 = -1;
  *(_WORD *)&retstr->var9 = 256;
  retstr->var5 = -[CKMessageAcknowledgmentChatItem balloonColorType](self, "balloonColorType");
  retstr->var3 = -[CKMessageAcknowledgmentChatItem balloonOrientation](self, "balloonOrientation");
  -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var7 = objc_msgSend(v5, "userInterfaceStyle");

  -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var8 = CKBackgroundLevelForTraitCollection();

  return result;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (id)attributionImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CEA638];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "largeMessageAcknowledgmentPollingImageNameForAcknowledgmentType:", -[CKMessageAcknowledgmentChatItem messageAcknowledgmentType](self, "messageAcknowledgmentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ckTemplateImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributionImageTintColor
{
  void *v3;
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgment:acknowledgmentImageColor:", 0, -[CKMessageAcknowledgmentChatItem themeColor](self, "themeColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)messageAcknowledgmentType
{
  return self->_messageAcknowledgmentType;
}

@end
