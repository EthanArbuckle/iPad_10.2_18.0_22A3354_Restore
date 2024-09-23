@implementation IMTypingChatItem

- (id)_initWithItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMTypingChatItem;
  v5 = -[IMChatItem _initWithItem:](&v8, sel__initWithItem_, v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("t:%d/%d"), objc_msgSend(v4, "isAudioMessage"), objc_msgSend(v4, "isFromMe"));
    objc_msgSend(v5, "_setGUID:", v6);

  }
  return v5;
}

@end
