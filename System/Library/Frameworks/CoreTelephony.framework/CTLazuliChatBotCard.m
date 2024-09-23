@implementation CTLazuliChatBotCard

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotCard layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", layout = %@"), v4);

  -[CTLazuliChatBotCard content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", content = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliChatBotCard layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToCTLazuliChatBotCardLayout:", v6))
  {
    -[CTLazuliChatBotCard content](self, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToCTLazuliChatBotCardContent:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotCard *v4;
  CTLazuliChatBotCard *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotCard *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotCard isEqualToCTLazuliChatBotCard:](self, "isEqualToCTLazuliChatBotCard:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotCard *v4;

  v4 = +[CTLazuliChatBotCard allocWithZone:](CTLazuliChatBotCard, "allocWithZone:", a3);
  -[CTLazuliChatBotCard setLayout:](v4, "setLayout:", self->_layout);
  -[CTLazuliChatBotCard setContent:](v4, "setContent:", self->_content);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_layout, CFSTR("kLayoutKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, CFSTR("kContentKey"));

}

- (CTLazuliChatBotCard)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotCard *v5;
  uint64_t v6;
  CTLazuliChatBotCardLayout *layout;
  uint64_t v8;
  CTLazuliChatBotCardContent *content;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotCard;
  v5 = -[CTLazuliChatBotCard init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLayoutKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    layout = v5->_layout;
    v5->_layout = (CTLazuliChatBotCardLayout *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContentKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (CTLazuliChatBotCardContent *)v8;

  }
  return v5;
}

- (CTLazuliChatBotCard)initWithReflection:(const void *)a3
{
  CTLazuliChatBotCard *v4;
  CTLazuliChatBotCardLayout *v5;
  CTLazuliChatBotCardLayout *layout;
  CTLazuliChatBotCardContent *v7;
  CTLazuliChatBotCardContent *content;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotCard;
  v4 = -[CTLazuliChatBotCard init](&v10, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliChatBotCardLayout initWithReflection:]([CTLazuliChatBotCardLayout alloc], "initWithReflection:", a3);
    layout = v4->_layout;
    v4->_layout = v5;

    v7 = -[CTLazuliChatBotCardContent initWithReflection:]([CTLazuliChatBotCardContent alloc], "initWithReflection:", (char *)a3 + 48);
    content = v4->_content;
    v4->_content = v7;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCardLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (CTLazuliChatBotCardContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
