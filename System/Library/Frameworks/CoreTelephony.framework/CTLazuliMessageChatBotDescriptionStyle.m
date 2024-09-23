@implementation CTLazuliMessageChatBotDescriptionStyle

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageChatBotDescriptionStyle style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", style = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotDescriptionStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliMessageChatBotDescriptionStyle style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToCTLazuliMessageChatBotFontStyle:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageChatBotDescriptionStyle *v4;
  CTLazuliMessageChatBotDescriptionStyle *v5;
  BOOL v6;

  v4 = (CTLazuliMessageChatBotDescriptionStyle *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageChatBotDescriptionStyle isEqualToCTLazuliMessageChatBotDescriptionStyle:](self, "isEqualToCTLazuliMessageChatBotDescriptionStyle:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageChatBotDescriptionStyle *v4;

  v4 = +[CTLazuliMessageChatBotDescriptionStyle allocWithZone:](CTLazuliMessageChatBotDescriptionStyle, "allocWithZone:", a3);
  -[CTLazuliMessageChatBotDescriptionStyle setStyle:](v4, "setStyle:", self->_style);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_style, CFSTR("kStyleKey"));
}

- (CTLazuliMessageChatBotDescriptionStyle)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageChatBotDescriptionStyle *v5;
  uint64_t v6;
  CTLazuliMessageChatBotFontStyle *style;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliMessageChatBotDescriptionStyle;
  v5 = -[CTLazuliMessageChatBotDescriptionStyle init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kStyleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    style = v5->_style;
    v5->_style = (CTLazuliMessageChatBotFontStyle *)v6;

  }
  return v5;
}

- (CTLazuliMessageChatBotDescriptionStyle)initWithReflection:(const MessageChatBotDescriptionStyle *)a3
{
  CTLazuliMessageChatBotDescriptionStyle *v4;
  CTLazuliMessageChatBotFontStyle *v5;
  CTLazuliMessageChatBotFontStyle *style;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTLazuliMessageChatBotDescriptionStyle;
  v4 = -[CTLazuliMessageChatBotDescriptionStyle init](&v8, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliMessageChatBotFontStyle initWithReflection:]([CTLazuliMessageChatBotFontStyle alloc], "initWithReflection:", a3);
    style = v4->_style;
    v4->_style = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliMessageChatBotFontStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

@end
