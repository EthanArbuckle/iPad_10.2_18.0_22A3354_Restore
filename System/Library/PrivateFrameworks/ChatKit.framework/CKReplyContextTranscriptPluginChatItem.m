@implementation CKReplyContextTranscriptPluginChatItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CKReplyContextTranscriptPluginChatItem;
  -[CKMessagePartChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ attachmentContiguousType:%d]"), v4, -[CKChatItem attachmentContiguousType](self, "attachmentContiguousType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)configureBalloonView:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "configureForTranscriptPlugin:", self);

}

- (Class)balloonViewClass
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[CKReplyContextTranscriptPluginChatItem _imChatItem](self, "_imChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D375F8]))
  {
    objc_opt_class();
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKReplyContextTranscriptPluginChatItem;
    -[CKBalloonChatItem balloonViewClass](&v8, sel_balloonViewClass);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return (Class)v6;
}

- (id)mediaObject
{
  return 0;
}

- (char)color
{
  return 9;
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
  v13.super_class = (Class)CKReplyContextTranscriptPluginChatItem;
  -[CKBalloonDescriptor_t balloonDescriptor](&v13, sel_balloonDescriptor);
  retstr->var2 = 1;
  retstr->var0 = 3;
  retstr->var10 = 1;
  retstr->var5 = -[CKReplyContextTranscriptPluginChatItem color](self, "color");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unfilledBalloonColorForColorType:", -[CKReplyContextTranscriptPluginChatItem color](self, "color"));
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

  -[CKReplyContextTranscriptPluginChatItem _imChatItem](self, "_imChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "replyIsFromMe");

  return v3;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
}

@end
