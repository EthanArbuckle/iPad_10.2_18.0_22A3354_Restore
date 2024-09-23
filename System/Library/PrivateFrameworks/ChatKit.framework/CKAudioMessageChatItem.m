@implementation CKAudioMessageChatItem

- (Class)cellClass
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioBalloonCellClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (BOOL)isAudioMessage
{
  return 1;
}

- (BOOL)canForward
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)MEMORY[0x1E0D35918];
  -[CKMessagePartChatItem serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceWithInternalName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsForwardingAudioMessages");

  return v5;
}

- (BOOL)shouldCacheSize
{
  return 0;
}

- (NSString)audioTranscriptionText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  -[CKMessagePartChatItem message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_imMessageItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "body");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length"))
    {
      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D37490], 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[CKAudioMessageChatItem _audioTranscriptionTextFromTransfer](self, "_audioTranscriptionTextFromTransfer");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;

    }
    else
    {
      -[CKAudioMessageChatItem _audioTranscriptionTextFromTransfer](self, "_audioTranscriptionTextFromTransfer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[CKAudioMessageChatItem _audioTranscriptionTextFromTransfer](self, "_audioTranscriptionTextFromTransfer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v11;
}

- (id)_audioTranscriptionTextFromTransfer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "transfer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "audioTranscriptionText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (Class)balloonViewClass
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldSuppressPreview"))
  {

LABEL_5:
    objc_opt_class();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return (Class)v8;
  }
  -[CKAttachmentMessagePartChatItem mediaObject](self, "mediaObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transfer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFileDataReady");

  if ((v6 & 1) == 0)
    goto LABEL_5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioBalloonViewClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
}

- (unint64_t)balloonCorners
{
  return -1;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

@end
