@implementation CTLazuliGroupChatUri

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliGroupChatUri destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", destination = %@"), v4);

  -[CTLazuliGroupChatUri focus](self, "focus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", focus = %@"), v5);

  -[CTLazuliGroupChatUri conversationID](self, "conversationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationID = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatUri:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[CTLazuliGroupChatUri destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliGroupChatUri focus](self, "focus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[CTLazuliGroupChatUri conversationID](self, "conversationID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "conversationID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliGroupChatUri *v4;
  CTLazuliGroupChatUri *v5;
  BOOL v6;

  v4 = (CTLazuliGroupChatUri *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliGroupChatUri isEqualToCTLazuliGroupChatUri:](self, "isEqualToCTLazuliGroupChatUri:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliGroupChatUri *v4;

  v4 = +[CTLazuliGroupChatUri allocWithZone:](CTLazuliGroupChatUri, "allocWithZone:", a3);
  -[CTLazuliGroupChatUri setDestination:](v4, "setDestination:", self->_destination);
  -[CTLazuliGroupChatUri setFocus:](v4, "setFocus:", self->_focus);
  -[CTLazuliGroupChatUri setConversationID:](v4, "setConversationID:", self->_conversationID);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_destination, CFSTR("kDestinationKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_focus, CFSTR("kFocusKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_conversationID, CFSTR("kConversationIDKey"));

}

- (CTLazuliGroupChatUri)initWithCoder:(id)a3
{
  id v4;
  CTLazuliGroupChatUri *v5;
  uint64_t v6;
  NSString *destination;
  uint64_t v8;
  NSString *focus;
  uint64_t v10;
  NSString *conversationID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliGroupChatUri;
  v5 = -[CTLazuliGroupChatUri init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDestinationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFocusKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    focus = v5->_focus;
    v5->_focus = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kConversationIDKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    conversationID = v5->_conversationID;
    v5->_conversationID = (NSString *)v10;

  }
  return v5;
}

- (CTLazuliGroupChatUri)initWithReflection:(const void *)a3
{
  CTLazuliGroupChatUri *v4;
  const void *v5;
  uint64_t v6;
  NSString *destination;
  char *v8;
  uint64_t v9;
  NSString *focus;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  NSString *conversationID;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CTLazuliGroupChatUri;
  v4 = -[CTLazuliGroupChatUri init](&v18, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    destination = v4->_destination;
    v4->_destination = (NSString *)v6;

    if (*((char *)a3 + 47) >= 0)
      v8 = (char *)a3 + 24;
    else
      v8 = (char *)*((_QWORD *)a3 + 3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    focus = v4->_focus;
    v4->_focus = (NSString *)v9;

    v13 = (char *)*((_QWORD *)a3 + 6);
    v12 = (char *)a3 + 48;
    v11 = v13;
    if (v12[23] >= 0)
      v14 = v12;
    else
      v14 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    conversationID = v4->_conversationID;
    v4->_conversationID = (NSString *)v15;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (NSString)focus
{
  return self->_focus;
}

- (void)setFocus:(id)a3
{
  objc_storeStrong((id *)&self->_focus, a3);
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_focus, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
