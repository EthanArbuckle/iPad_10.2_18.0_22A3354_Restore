@implementation IMNotifyAnywayChatItem

- (id)_init
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMNotifyAnywayChatItem;
  v2 = -[IMChatItem _initWithItem:](&v5, sel__initWithItem_, 0);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "_setGUID:", CFSTR("na:"));
  return v3;
}

@end
