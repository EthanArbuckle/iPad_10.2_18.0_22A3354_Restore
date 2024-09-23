@implementation CKEditedTextMessagePartHistoricalContentChatItem

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

- (id)time
{
  void *v2;
  void *v3;

  -[CKEditedTextMessagePartHistoricalContentChatItem historicalContent](self, "historicalContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateSent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)bigEmojiStyle
{
  return 0;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)historicalContent
{
  void *v2;
  void *v3;

  -[CKEditedTextMessagePartHistoricalContentChatItem editedMessagePartChatItem](self, "editedMessagePartChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "historicalContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (char)color
{
  void *v3;
  int v4;
  char v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPriusEnabled");

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKEditedTextMessagePartHistoricalContentChatItem;
    return -[CKMessagePartChatItem color](&v8, sel_color);
  }
  else
  {
    -[CKChatItem IMChatItem](self, "IMChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isFromMe"))
      v5 = 1;
    else
      v5 = -1;

  }
  return v5;
}

- (char)balloonStyle
{
  return 0;
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
  v13.super_class = (Class)CKEditedTextMessagePartHistoricalContentChatItem;
  -[CKBalloonDescriptor_t balloonDescriptor](&v13, sel_balloonDescriptor);
  retstr->var2 = -[CKEditedTextMessagePartHistoricalContentChatItem balloonStyle](self, "balloonStyle");
  retstr->var0 = 0;
  retstr->var10 = 0;
  retstr->var5 = -[CKEditedTextMessagePartHistoricalContentChatItem color](self, "color");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unfilledBalloonColorForColorType:", -[CKEditedTextMessagePartHistoricalContentChatItem color](self, "color"));
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

@end
