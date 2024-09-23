@implementation IMBlockContactChatItem

- (id)_initWithItem:(id)a3 chatStyle:(unsigned __int8)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)IMBlockContactChatItem;
  v5 = -[IMChatItem _initWithItem:](&v8, sel__initWithItem_, a3);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setChatStyle:", v4);
  return v6;
}

- (unsigned)chatStyle
{
  return self->_chatStyle;
}

- (void)setChatStyle:(unsigned __int8)a3
{
  self->_chatStyle = a3;
}

@end
