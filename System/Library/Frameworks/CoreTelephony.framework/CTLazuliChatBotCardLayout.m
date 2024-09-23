@implementation CTLazuliChatBotCardLayout

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliChatBotCardLayout cardOrientation](self, "cardOrientation");
  v10 = -[CTLazuliChatBotCardLayout cardOrientation](self, "cardOrientation");
  objc_msgSend(v3, "appendFormat:", CFSTR(", cardOrientation = [%ld - %s]"), v4, print_CTLazuliChatBotCardContentOrientationType(&v10));
  v5 = -[CTLazuliChatBotCardLayout imageAlignment](self, "imageAlignment");
  v10 = -[CTLazuliChatBotCardLayout imageAlignment](self, "imageAlignment");
  objc_msgSend(v3, "appendFormat:", CFSTR(", imageAlignment = [%ld - %s]"), v5, print_CTLazuliChatBotCardContentImageAlignmentType(&v10));
  -[CTLazuliChatBotCardLayout titleStyle](self, "titleStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", titleStyle = %@"), v6);

  -[CTLazuliChatBotCardLayout descriptionStyle](self, "descriptionStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", descriptionStyle = %@"), v7);

  -[CTLazuliChatBotCardLayout cardStyle](self, "cardStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cardStyle = %@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCardLayout:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;

  v7 = a3;
  v8 = -[CTLazuliChatBotCardLayout cardOrientation](self, "cardOrientation");
  if (v8 != objc_msgSend(v7, "cardOrientation")
    || (v9 = -[CTLazuliChatBotCardLayout imageAlignment](self, "imageAlignment"),
        v9 != objc_msgSend(v7, "imageAlignment")))
  {
    v11 = 0;
    goto LABEL_28;
  }
  -[CTLazuliChatBotCardLayout titleStyle](self, "titleStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v7, "titleStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v22 = 0;
      v23 = 0;
      goto LABEL_10;
    }
  }
  -[CTLazuliChatBotCardLayout titleStyle](self, "titleStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToCTLazuliMessageChatBotTitleStyle:", v3))
  {
    v23 = 1;
LABEL_10:
    -[CTLazuliChatBotCardLayout descriptionStyle](self, "descriptionStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v7, "descriptionStyle"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotCardLayout descriptionStyle](self, "descriptionStyle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "descriptionStyle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isEqualToCTLazuliMessageChatBotDescriptionStyle:", v5))
      {
        v11 = 0;
        goto LABEL_20;
      }
      v21 = 1;
    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
    -[CTLazuliChatBotCardLayout cardStyle](self, "cardStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend(v7, "cardStyle"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotCardLayout cardStyle](self, "cardStyle", v18, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cardStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "isEqualToCTLazuliMessageChatBotCardStyle:", v15);

      if (v13)
      {

        if (!v21)
          goto LABEL_21;
        goto LABEL_20;
      }
      v17 = v19;
    }
    else
    {
      v17 = 0;
      v11 = 1;
    }

    if ((v21 & 1) == 0)
    {
LABEL_21:
      if (!v12)

      if (!v23)
        goto LABEL_25;
      goto LABEL_24;
    }
LABEL_20:

    goto LABEL_21;
  }
  v11 = 0;
LABEL_24:

LABEL_25:
  if (!v10)

LABEL_28:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotCardLayout *v4;
  CTLazuliChatBotCardLayout *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotCardLayout *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotCardLayout isEqualToCTLazuliChatBotCardLayout:](self, "isEqualToCTLazuliChatBotCardLayout:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotCardLayout *v4;

  v4 = +[CTLazuliChatBotCardLayout allocWithZone:](CTLazuliChatBotCardLayout, "allocWithZone:", a3);
  -[CTLazuliChatBotCardLayout setCardOrientation:](v4, "setCardOrientation:", self->_cardOrientation);
  -[CTLazuliChatBotCardLayout setImageAlignment:](v4, "setImageAlignment:", self->_imageAlignment);
  -[CTLazuliChatBotCardLayout setTitleStyle:](v4, "setTitleStyle:", self->_titleStyle);
  -[CTLazuliChatBotCardLayout setDescriptionStyle:](v4, "setDescriptionStyle:", self->_descriptionStyle);
  -[CTLazuliChatBotCardLayout setCardStyle:](v4, "setCardStyle:", self->_cardStyle);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_cardOrientation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kCardOrientationKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_imageAlignment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kImageAlignmentKey"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_titleStyle, CFSTR("kTitleStyleKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_descriptionStyle, CFSTR("kDescriptionStyleKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cardStyle, CFSTR("kCardStyleKey"));

}

- (CTLazuliChatBotCardLayout)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotCardLayout *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CTLazuliMessageChatBotTitleStyle *titleStyle;
  uint64_t v10;
  CTLazuliMessageChatBotDescriptionStyle *descriptionStyle;
  uint64_t v12;
  CTLazuliMessageChatBotCardStyle *cardStyle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotCardLayout;
  v5 = -[CTLazuliChatBotCardLayout init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCardOrientationKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cardOrientation = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kImageAlignmentKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_imageAlignment = objc_msgSend(v7, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTitleStyleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    titleStyle = v5->_titleStyle;
    v5->_titleStyle = (CTLazuliMessageChatBotTitleStyle *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDescriptionStyleKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    descriptionStyle = v5->_descriptionStyle;
    v5->_descriptionStyle = (CTLazuliMessageChatBotDescriptionStyle *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCardStyleKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    cardStyle = v5->_cardStyle;
    v5->_cardStyle = (CTLazuliMessageChatBotCardStyle *)v12;

  }
  return v5;
}

- (CTLazuliChatBotCardLayout)initWithReflection:(const void *)a3
{
  CTLazuliChatBotCardLayout *v4;
  CTLazuliMessageChatBotTitleStyle *v5;
  uint64_t v6;
  CTLazuliMessageChatBotTitleStyle *titleStyle;
  CTLazuliMessageChatBotDescriptionStyle *v8;
  uint64_t v9;
  CTLazuliMessageChatBotDescriptionStyle *descriptionStyle;
  CTLazuliMessageChatBotCardStyle *v11;
  uint64_t v12;
  CTLazuliMessageChatBotCardStyle *cardStyle;
  CTLazuliChatBotCardLayout *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotCardLayout;
  v4 = -[CTLazuliChatBotCardLayout init](&v15, sel_init);
  if (!v4)
    return v4;
  v4->_cardOrientation = encode_CTLazuliGroupChatParticipantRoleType(a3);
  v4->_imageAlignment = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 1);
  if (*((_BYTE *)a3 + 11))
  {
    v5 = [CTLazuliMessageChatBotTitleStyle alloc];
    if (!*((_BYTE *)a3 + 11))
      goto LABEL_16;
    v6 = -[CTLazuliMessageChatBotTitleStyle initWithReflection:](v5, "initWithReflection:", (char *)a3 + 8);
    titleStyle = v4->_titleStyle;
    v4->_titleStyle = (CTLazuliMessageChatBotTitleStyle *)v6;
  }
  else
  {
    titleStyle = v4->_titleStyle;
    v4->_titleStyle = 0;
  }

  if (*((_BYTE *)a3 + 15))
  {
    v8 = [CTLazuliMessageChatBotDescriptionStyle alloc];
    if (!*((_BYTE *)a3 + 15))
      goto LABEL_16;
    v9 = -[CTLazuliMessageChatBotDescriptionStyle initWithReflection:](v8, "initWithReflection:", (char *)a3 + 12);
    descriptionStyle = v4->_descriptionStyle;
    v4->_descriptionStyle = (CTLazuliMessageChatBotDescriptionStyle *)v9;
  }
  else
  {
    descriptionStyle = v4->_descriptionStyle;
    v4->_descriptionStyle = 0;
  }

  if (!*((_BYTE *)a3 + 40))
  {
    cardStyle = v4->_cardStyle;
    v4->_cardStyle = 0;
    goto LABEL_14;
  }
  v11 = [CTLazuliMessageChatBotCardStyle alloc];
  if (*((_BYTE *)a3 + 40))
  {
    v12 = -[CTLazuliMessageChatBotCardStyle initWithReflection:](v11, "initWithReflection:", (char *)a3 + 16);
    cardStyle = v4->_cardStyle;
    v4->_cardStyle = (CTLazuliMessageChatBotCardStyle *)v12;
LABEL_14:

    return v4;
  }
LABEL_16:
  result = (CTLazuliChatBotCardLayout *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)cardOrientation
{
  return self->_cardOrientation;
}

- (void)setCardOrientation:(int64_t)a3
{
  self->_cardOrientation = a3;
}

- (int64_t)imageAlignment
{
  return self->_imageAlignment;
}

- (void)setImageAlignment:(int64_t)a3
{
  self->_imageAlignment = a3;
}

- (CTLazuliMessageChatBotTitleStyle)titleStyle
{
  return self->_titleStyle;
}

- (void)setTitleStyle:(id)a3
{
  objc_storeStrong((id *)&self->_titleStyle, a3);
}

- (CTLazuliMessageChatBotDescriptionStyle)descriptionStyle
{
  return self->_descriptionStyle;
}

- (void)setDescriptionStyle:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionStyle, a3);
}

- (CTLazuliMessageChatBotCardStyle)cardStyle
{
  return self->_cardStyle;
}

- (void)setCardStyle:(id)a3
{
  objc_storeStrong((id *)&self->_cardStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardStyle, 0);
  objc_storeStrong((id *)&self->_descriptionStyle, 0);
  objc_storeStrong((id *)&self->_titleStyle, 0);
}

@end
