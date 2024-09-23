@implementation IMStewieResumeItem

- (id)_initWithItem:(id)a3 chatIdentifier:(id)a4
{
  id v7;
  id *v8;
  id *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IMStewieResumeItem;
  v8 = -[IMChatItem _initWithItem:](&v11, sel__initWithItem_, a3);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_setGUID:", CFSTR("srb:"));
    objc_storeStrong(v9 + 7, a4);
  }

  return v9;
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
}

@end
