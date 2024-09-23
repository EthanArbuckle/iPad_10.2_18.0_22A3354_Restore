@implementation IMTransientMessagePartChatItem

- (IMTransientMessagePartChatItem)initWithGUID:(id)a3
{
  id v4;
  IMTransientMessagePartChatItem *v5;
  IMTransientMessagePartChatItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMTransientMessagePartChatItem;
  v5 = -[IMTransientMessagePartChatItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[IMTranscriptChatItem _setGUID:](v5, "_setGUID:", v4);

  return v6;
}

@end
