@implementation IMKeyTransparencyStatusChangedChatItem

- (id)_initWithHandles:(id)a3 status:(unint64_t)a4 isGroupChat:(BOOL)a5
{
  id v9;
  id *v10;
  id *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMKeyTransparencyStatusChangedChatItem;
  v10 = -[IMChatItem _initWithItem:](&v13, sel__initWithItem_, 0);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_setGUID:", CFSTR("kte:"));
    objc_storeStrong(v11 + 8, a3);
    v11[9] = (id)a4;
    *((_BYTE *)v11 + 56) = a5;
  }

  return v11;
}

- (NSArray)affectedHandles
{
  return self->_affectedHandles;
}

- (unint64_t)status
{
  return self->_status;
}

- (BOOL)isGroupChat
{
  return self->_groupChat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affectedHandles, 0);
}

@end
