@implementation CTLazuliMessageIncomingGroupChat

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageIncomingGroupChat chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chat = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageIncomingGroupChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliMessageIncomingGroupChat chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToCTLazuliGroupChatInformation:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageIncomingGroupChat *v4;
  CTLazuliMessageIncomingGroupChat *v5;
  BOOL v6;

  v4 = (CTLazuliMessageIncomingGroupChat *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageIncomingGroupChat isEqualToCTLazuliMessageIncomingGroupChat:](self, "isEqualToCTLazuliMessageIncomingGroupChat:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageIncomingGroupChat *v4;

  v4 = +[CTLazuliMessageIncomingGroupChat allocWithZone:](CTLazuliMessageIncomingGroupChat, "allocWithZone:", a3);
  -[CTLazuliMessageIncomingGroupChat setChat:](v4, "setChat:", self->_chat);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_chat, CFSTR("kChatKey"));
}

- (CTLazuliMessageIncomingGroupChat)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageIncomingGroupChat *v5;
  uint64_t v6;
  CTLazuliGroupChatInformation *chat;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageIncomingGroupChat;
  v5 = -[CTLazuliMessageIncomingGroupChat init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChatKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    chat = v5->_chat;
    v5->_chat = (CTLazuliGroupChatInformation *)v6;

  }
  return v5;
}

- (CTLazuliMessageIncomingGroupChat)initWithReflection:(const void *)a3
{
  CTLazuliMessageIncomingGroupChat *v4;
  CTLazuliGroupChatInformation *v5;
  CTLazuliGroupChatInformation *chat;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageIncomingGroupChat;
  v4 = -[CTLazuliMessageIncomingGroupChat init](&v8, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliGroupChatInformation initWithReflection:]([CTLazuliGroupChatInformation alloc], "initWithReflection:", a3);
    chat = v4->_chat;
    v4->_chat = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliGroupChatInformation)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
}

@end
