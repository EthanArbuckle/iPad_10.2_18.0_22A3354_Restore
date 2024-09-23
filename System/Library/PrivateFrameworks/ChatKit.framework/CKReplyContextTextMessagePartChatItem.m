@implementation CKReplyContextTextMessagePartChatItem

- (id)bodyTextFont
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replyBalloonTextFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)meMentionsTextColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonTextColorForColorType:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)loadTranscriptDrawerText
{
  return 0;
}

- (int64_t)bigEmojiStyle
{
  return 0;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (char)color
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFromMe");

  if (!v4)
    return 9;
  v5 = (void *)MEMORY[0x1E0D35910];
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "__ck_displayReplyColor");

  return v9;
}

- (char)balloonStyle
{
  return 1;
}

- (BOOL)wantsOutline
{
  return 1;
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
  v13.super_class = (Class)CKReplyContextTextMessagePartChatItem;
  -[CKBalloonDescriptor_t balloonDescriptor](&v13, sel_balloonDescriptor);
  retstr->var2 = -[CKReplyContextTextMessagePartChatItem balloonStyle](self, "balloonStyle");
  retstr->var0 = 3;
  retstr->var10 = 1;
  retstr->var5 = -[CKReplyContextTextMessagePartChatItem color](self, "color");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unfilledBalloonColorForColorType:", -[CKReplyContextTextMessagePartChatItem color](self, "color"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ckColor");
  retstr->var6.red = v8;
  retstr->var6.green = v9;
  retstr->var6.blue = v10;
  retstr->var6.alpha = v11;

  retstr->var9 = 0;
  result = (CKBalloonDescriptor_t *)-[CKBalloonChatItem balloonOrientation](self, "balloonOrientation");
  retstr->var3 = (char)result;
  return result;
}

- (BOOL)canBeSelectedInEditMode
{
  return 0;
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
