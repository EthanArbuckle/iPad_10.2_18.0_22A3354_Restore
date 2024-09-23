@implementation IMLoadMoreChatItem

- (id)_initWithItem:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMLoadMoreChatItem;
  v3 = -[IMChatItem _initWithItem:](&v6, sel__initWithItem_, a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_setGUID:", CFSTR("m:"));
  return v4;
}

@end
