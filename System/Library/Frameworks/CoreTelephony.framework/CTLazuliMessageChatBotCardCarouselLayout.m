@implementation CTLazuliMessageChatBotCardCarouselLayout

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliMessageChatBotCardCarouselLayout orientation](self, "orientation");
  v11 = -[CTLazuliMessageChatBotCardCarouselLayout orientation](self, "orientation");
  objc_msgSend(v3, "appendFormat:", CFSTR(", orientation = [%ld - %s]"), v4, print_CTLazuliChatBotCardContentOrientationType(&v11));
  v5 = -[CTLazuliMessageChatBotCardCarouselLayout imageAlignment](self, "imageAlignment");
  v11 = -[CTLazuliMessageChatBotCardCarouselLayout imageAlignment](self, "imageAlignment");
  objc_msgSend(v3, "appendFormat:", CFSTR(", imageAlignment = [%ld - %s]"), v5, print_CTLazuliChatBotCardContentImageAlignmentType(&v11));
  v6 = -[CTLazuliMessageChatBotCardCarouselLayout width](self, "width");
  v11 = -[CTLazuliMessageChatBotCardCarouselLayout width](self, "width");
  objc_msgSend(v3, "appendFormat:", CFSTR(", width = [%ld - %s]"), v6, print_CTLazuliChatBotCardCarouselWidthType(&v11));
  -[CTLazuliMessageChatBotCardCarouselLayout titleStyle](self, "titleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", titleStyle = %@"), v7);

  -[CTLazuliMessageChatBotCardCarouselLayout descriptionStyle](self, "descriptionStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", descriptionStyle = %@"), v8);

  -[CTLazuliMessageChatBotCardCarouselLayout cardStyle](self, "cardStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cardStyle = %@"), v9);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotCardCarouselLayout:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  char v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;

  v7 = a3;
  v8 = -[CTLazuliMessageChatBotCardCarouselLayout orientation](self, "orientation");
  if (v8 != objc_msgSend(v7, "orientation")
    || (v9 = -[CTLazuliMessageChatBotCardCarouselLayout imageAlignment](self, "imageAlignment"),
        v9 != objc_msgSend(v7, "imageAlignment"))
    || (v10 = -[CTLazuliMessageChatBotCardCarouselLayout width](self, "width"), v10 != objc_msgSend(v7, "width")))
  {
    v12 = 0;
    goto LABEL_9;
  }
  -[CTLazuliMessageChatBotCardCarouselLayout titleStyle](self, "titleStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v7, "titleStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v23 = 0;
      v24 = 0;
      goto LABEL_12;
    }
  }
  -[CTLazuliMessageChatBotCardCarouselLayout titleStyle](self, "titleStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEqualToCTLazuliMessageChatBotTitleStyle:", v3))
  {
    v24 = 1;
LABEL_12:
    -[CTLazuliMessageChatBotCardCarouselLayout descriptionStyle](self, "descriptionStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v7, "descriptionStyle"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageChatBotCardCarouselLayout descriptionStyle](self, "descriptionStyle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "descriptionStyle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "isEqualToCTLazuliMessageChatBotDescriptionStyle:", v5))
      {
        v12 = 0;
        goto LABEL_22;
      }
      v22 = 1;
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    -[CTLazuliMessageChatBotCardCarouselLayout cardStyle](self, "cardStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (objc_msgSend(v7, "cardStyle"), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageChatBotCardCarouselLayout cardStyle](self, "cardStyle", v19, v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cardStyle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v16, "isEqualToCTLazuliMessageChatBotCardStyle:", v17);

      if (v15)
      {

        if (!v22)
          goto LABEL_23;
        goto LABEL_22;
      }
      v18 = v20;
    }
    else
    {
      v18 = 0;
      v12 = 1;
    }

    if ((v22 & 1) == 0)
    {
LABEL_23:
      if (!v14)

      if (!v24)
        goto LABEL_27;
      goto LABEL_26;
    }
LABEL_22:

    goto LABEL_23;
  }
  v12 = 0;
LABEL_26:

LABEL_27:
  if (!v11)

LABEL_9:
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageChatBotCardCarouselLayout *v4;
  CTLazuliMessageChatBotCardCarouselLayout *v5;
  BOOL v6;

  v4 = (CTLazuliMessageChatBotCardCarouselLayout *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageChatBotCardCarouselLayout isEqualToCTLazuliMessageChatBotCardCarouselLayout:](self, "isEqualToCTLazuliMessageChatBotCardCarouselLayout:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageChatBotCardCarouselLayout *v4;

  v4 = +[CTLazuliMessageChatBotCardCarouselLayout allocWithZone:](CTLazuliMessageChatBotCardCarouselLayout, "allocWithZone:", a3);
  -[CTLazuliMessageChatBotCardCarouselLayout setOrientation:](v4, "setOrientation:", self->_orientation);
  -[CTLazuliMessageChatBotCardCarouselLayout setImageAlignment:](v4, "setImageAlignment:", self->_imageAlignment);
  -[CTLazuliMessageChatBotCardCarouselLayout setWidth:](v4, "setWidth:", self->_width);
  -[CTLazuliMessageChatBotCardCarouselLayout setTitleStyle:](v4, "setTitleStyle:", self->_titleStyle);
  -[CTLazuliMessageChatBotCardCarouselLayout setDescriptionStyle:](v4, "setDescriptionStyle:", self->_descriptionStyle);
  -[CTLazuliMessageChatBotCardCarouselLayout setCardStyle:](v4, "setCardStyle:", self->_cardStyle);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_orientation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("kOrientationKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_imageAlignment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("kImageAlignmentKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kWidthKey"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_titleStyle, CFSTR("kTitleStyleKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_descriptionStyle, CFSTR("kDescriptionStyleKey"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_cardStyle, CFSTR("kCardStyleKey"));

}

- (CTLazuliMessageChatBotCardCarouselLayout)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageChatBotCardCarouselLayout *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CTLazuliMessageChatBotTitleStyle *titleStyle;
  uint64_t v11;
  CTLazuliMessageChatBotDescriptionStyle *descriptionStyle;
  uint64_t v13;
  CTLazuliMessageChatBotCardStyle *cardStyle;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliMessageChatBotCardCarouselLayout;
  v5 = -[CTLazuliMessageChatBotCardCarouselLayout init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOrientationKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_orientation = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kImageAlignmentKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_imageAlignment = objc_msgSend(v7, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kWidthKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_width = objc_msgSend(v8, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTitleStyleKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    titleStyle = v5->_titleStyle;
    v5->_titleStyle = (CTLazuliMessageChatBotTitleStyle *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDescriptionStyleKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    descriptionStyle = v5->_descriptionStyle;
    v5->_descriptionStyle = (CTLazuliMessageChatBotDescriptionStyle *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCardStyleKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    cardStyle = v5->_cardStyle;
    v5->_cardStyle = (CTLazuliMessageChatBotCardStyle *)v13;

  }
  return v5;
}

- (CTLazuliMessageChatBotCardCarouselLayout)initWithReflection:(const void *)a3
{
  CTLazuliMessageChatBotCardCarouselLayout *v4;
  CTLazuliMessageChatBotTitleStyle *v5;
  uint64_t v6;
  CTLazuliMessageChatBotTitleStyle *titleStyle;
  CTLazuliMessageChatBotDescriptionStyle *v8;
  uint64_t v9;
  CTLazuliMessageChatBotDescriptionStyle *descriptionStyle;
  CTLazuliMessageChatBotCardStyle *v11;
  uint64_t v12;
  CTLazuliMessageChatBotCardStyle *cardStyle;
  CTLazuliMessageChatBotCardCarouselLayout *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageChatBotCardCarouselLayout;
  v4 = -[CTLazuliMessageChatBotCardCarouselLayout init](&v15, sel_init);
  if (!v4)
    return v4;
  v4->_orientation = encode_CTLazuliGroupChatParticipantRoleType(a3);
  v4->_imageAlignment = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 1);
  v4->_width = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 2);
  if (*((_BYTE *)a3 + 15))
  {
    v5 = [CTLazuliMessageChatBotTitleStyle alloc];
    if (!*((_BYTE *)a3 + 15))
      goto LABEL_16;
    v6 = -[CTLazuliMessageChatBotTitleStyle initWithReflection:](v5, "initWithReflection:", (char *)a3 + 12);
    titleStyle = v4->_titleStyle;
    v4->_titleStyle = (CTLazuliMessageChatBotTitleStyle *)v6;
  }
  else
  {
    titleStyle = v4->_titleStyle;
    v4->_titleStyle = 0;
  }

  if (*((_BYTE *)a3 + 19))
  {
    v8 = [CTLazuliMessageChatBotDescriptionStyle alloc];
    if (!*((_BYTE *)a3 + 19))
      goto LABEL_16;
    v9 = -[CTLazuliMessageChatBotDescriptionStyle initWithReflection:](v8, "initWithReflection:", (char *)a3 + 16);
    descriptionStyle = v4->_descriptionStyle;
    v4->_descriptionStyle = (CTLazuliMessageChatBotDescriptionStyle *)v9;
  }
  else
  {
    descriptionStyle = v4->_descriptionStyle;
    v4->_descriptionStyle = 0;
  }

  if (!*((_BYTE *)a3 + 48))
  {
    cardStyle = v4->_cardStyle;
    v4->_cardStyle = 0;
    goto LABEL_14;
  }
  v11 = [CTLazuliMessageChatBotCardStyle alloc];
  if (*((_BYTE *)a3 + 48))
  {
    v12 = -[CTLazuliMessageChatBotCardStyle initWithReflection:](v11, "initWithReflection:", (char *)a3 + 24);
    cardStyle = v4->_cardStyle;
    v4->_cardStyle = (CTLazuliMessageChatBotCardStyle *)v12;
LABEL_14:

    return v4;
  }
LABEL_16:
  result = (CTLazuliMessageChatBotCardCarouselLayout *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)imageAlignment
{
  return self->_imageAlignment;
}

- (void)setImageAlignment:(int64_t)a3
{
  self->_imageAlignment = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
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
