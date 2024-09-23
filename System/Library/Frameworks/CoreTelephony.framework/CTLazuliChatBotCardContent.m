@implementation CTLazuliChatBotCardContent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotCardContent media](self, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", media = %@"), v4);

  -[CTLazuliChatBotCardContent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", title = %@"), v5);

  -[CTLazuliChatBotCardContent cardDescription](self, "cardDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cardDescription = %@"), v6);

  -[CTLazuliChatBotCardContent chipList](self, "chipList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chipList = %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCardContent:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;

  v6 = a3;
  -[CTLazuliChatBotCardContent media](self, "media");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_msgSend(v6, "media"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotCardContent media](self, "media");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToCTLazuliChatBotCardMedia:", v4) & 1) == 0)
    {

      v8 = 0;
      goto LABEL_36;
    }
    v25 = 1;
  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  -[CTLazuliChatBotCardContent title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v6, "title"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotCardContent title](self, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToCTLazuliChatBotCardTitle:") & 1) == 0)
    {

      if (v9)
      else

      v8 = 0;
      if ((v25 & 1) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
    v21 = 1;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  -[CTLazuliChatBotCardContent cardDescription](self, "cardDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v6, "cardDescription"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotCardContent cardDescription](self, "cardDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "isEqualToCTLazuliChatBotCardDescription:"))
    {
      v8 = 0;
      goto LABEL_27;
    }
    v18 = 1;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  -[CTLazuliChatBotCardContent chipList](self, "chipList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v6, "chipList"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotCardContent chipList](self, "chipList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chipList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "isEqualToCTLazuliChatBotSuggestedChipList:", v13);

    if (v11)
    {

      if (!v18)
        goto LABEL_28;
      goto LABEL_27;
    }
    v15 = (void *)v16;
  }
  else
  {
    v15 = 0;
    v8 = 1;
  }

  if ((v18 & 1) != 0)
  {
LABEL_27:

  }
LABEL_28:
  if (!v10)

  if (v21)
  {

  }
  if (!v9)

  if (v25)
  {
LABEL_35:

  }
LABEL_36:
  if (!v7)

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotCardContent *v4;
  CTLazuliChatBotCardContent *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotCardContent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotCardContent isEqualToCTLazuliChatBotCardContent:](self, "isEqualToCTLazuliChatBotCardContent:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotCardContent *v4;

  v4 = +[CTLazuliChatBotCardContent allocWithZone:](CTLazuliChatBotCardContent, "allocWithZone:", a3);
  -[CTLazuliChatBotCardContent setMedia:](v4, "setMedia:", self->_media);
  -[CTLazuliChatBotCardContent setTitle:](v4, "setTitle:", self->_title);
  -[CTLazuliChatBotCardContent setCardDescription:](v4, "setCardDescription:", self->_cardDescription);
  -[CTLazuliChatBotCardContent setChipList:](v4, "setChipList:", self->_chipList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_media, CFSTR("kMediaKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("kTitleKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardDescription, CFSTR("kCardDescriptionKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chipList, CFSTR("kChipListKey"));

}

- (CTLazuliChatBotCardContent)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotCardContent *v5;
  uint64_t v6;
  CTLazuliChatBotCardMedia *media;
  uint64_t v8;
  CTLazuliChatBotCardTitle *title;
  uint64_t v10;
  CTLazuliChatBotCardDescription *cardDescription;
  uint64_t v12;
  CTLazuliChatBotSuggestedChipList *chipList;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotCardContent;
  v5 = -[CTLazuliChatBotCardContent init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    media = v5->_media;
    v5->_media = (CTLazuliChatBotCardMedia *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTitleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (CTLazuliChatBotCardTitle *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCardDescriptionKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    cardDescription = v5->_cardDescription;
    v5->_cardDescription = (CTLazuliChatBotCardDescription *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChipListKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v12;

  }
  return v5;
}

- (CTLazuliChatBotCardContent)initWithReflection:(const void *)a3
{
  CTLazuliChatBotCardContent *v4;
  CTLazuliChatBotCardContent *v5;
  CTLazuliChatBotCardMedia *v6;
  uint64_t v7;
  CTLazuliChatBotCardMedia *media;
  CTLazuliChatBotCardTitle *v9;
  uint64_t v10;
  CTLazuliChatBotCardTitle *title;
  CTLazuliChatBotCardDescription *v12;
  uint64_t v13;
  CTLazuliChatBotCardDescription *cardDescription;
  CTLazuliChatBotSuggestedChipList *v15;
  uint64_t v16;
  CTLazuliChatBotSuggestedChipList *chipList;
  CTLazuliChatBotCardContent *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CTLazuliChatBotCardContent;
  v4 = -[CTLazuliChatBotCardContent init](&v19, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (*((_BYTE *)a3 + 176))
  {
    v6 = [CTLazuliChatBotCardMedia alloc];
    if (!*((_BYTE *)a3 + 176))
      goto LABEL_20;
    v7 = -[CTLazuliChatBotCardMedia initWithReflection:](v6, "initWithReflection:", a3);
    media = v5->_media;
    v5->_media = (CTLazuliChatBotCardMedia *)v7;
  }
  else
  {
    media = v4->_media;
    v4->_media = 0;
  }

  if (*((_BYTE *)a3 + 208))
  {
    v9 = [CTLazuliChatBotCardTitle alloc];
    if (!*((_BYTE *)a3 + 208))
      goto LABEL_20;
    v10 = -[CTLazuliChatBotCardTitle initWithReflection:](v9, "initWithReflection:", (char *)a3 + 184);
    title = v5->_title;
    v5->_title = (CTLazuliChatBotCardTitle *)v10;
  }
  else
  {
    title = v5->_title;
    v5->_title = 0;
  }

  if (*((_BYTE *)a3 + 240))
  {
    v12 = [CTLazuliChatBotCardDescription alloc];
    if (!*((_BYTE *)a3 + 240))
      goto LABEL_20;
    v13 = -[CTLazuliChatBotCardDescription initWithReflection:](v12, "initWithReflection:", (char *)a3 + 216);
    cardDescription = v5->_cardDescription;
    v5->_cardDescription = (CTLazuliChatBotCardDescription *)v13;
  }
  else
  {
    cardDescription = v5->_cardDescription;
    v5->_cardDescription = 0;
  }

  if (!*((_BYTE *)a3 + 272))
  {
    chipList = v5->_chipList;
    v5->_chipList = 0;
    goto LABEL_18;
  }
  v15 = [CTLazuliChatBotSuggestedChipList alloc];
  if (*((_BYTE *)a3 + 272))
  {
    v16 = -[CTLazuliChatBotSuggestedChipList initWithReflection:](v15, "initWithReflection:", (char *)a3 + 248);
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v16;
LABEL_18:

    return v5;
  }
LABEL_20:
  result = (CTLazuliChatBotCardContent *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCardMedia)media
{
  return self->_media;
}

- (void)setMedia:(id)a3
{
  objc_storeStrong((id *)&self->_media, a3);
}

- (CTLazuliChatBotCardTitle)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (CTLazuliChatBotCardDescription)cardDescription
{
  return self->_cardDescription;
}

- (void)setCardDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cardDescription, a3);
}

- (CTLazuliChatBotSuggestedChipList)chipList
{
  return self->_chipList;
}

- (void)setChipList:(id)a3
{
  objc_storeStrong((id *)&self->_chipList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipList, 0);
  objc_storeStrong((id *)&self->_cardDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_media, 0);
}

@end
