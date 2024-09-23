@implementation CKReplyContextAggregateMessagePartChatItem

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

- (id)loadTranscriptDrawerText
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
  double v5;
  double v6;
  double v7;
  double v8;
  CKBalloonDescriptor_t *result;
  objc_super v10;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v10.receiver = self;
  v10.super_class = (Class)CKReplyContextAggregateMessagePartChatItem;
  -[CKBalloonDescriptor_t balloonDescriptor](&v10, sel_balloonDescriptor);
  retstr->var2 = -[CKReplyContextAggregateMessagePartChatItem balloonStyle](self, "balloonStyle");
  retstr->var0 = 3;
  retstr->var10 = 1;
  retstr->var5 = -[CKReplyContextAggregateMessagePartChatItem color](self, "color");
  -[CKMessagePartChatItem strokeColor](self, "strokeColor");
  retstr->var6.red = v5;
  retstr->var6.green = v6;
  retstr->var6.blue = v7;
  retstr->var6.alpha = v8;
  retstr->var9 = 0;
  result = (CKBalloonDescriptor_t *)-[CKBalloonChatItem balloonOrientation](self, "balloonOrientation");
  retstr->var3 = (char)result;
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
