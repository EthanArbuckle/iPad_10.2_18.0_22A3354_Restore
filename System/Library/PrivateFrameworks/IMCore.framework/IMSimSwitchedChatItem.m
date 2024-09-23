@implementation IMSimSwitchedChatItem

- (id)_initWithItem:(id)a3 senderHandle:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IMSimSwitchedChatItem;
  v8 = -[IMChatItem _initWithItem:](&v11, sel__initWithItem_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(v8 + 7, a4);

  return v9;
}

- (NSString)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
