@implementation CTLazuliMessageChatBotCardCarousel

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageChatBotCardCarousel layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", layout = %@"), v4);

  -[CTLazuliMessageChatBotCardCarousel content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", content = %@"), v5);

  -[CTLazuliMessageChatBotCardCarousel chipList](self, "chipList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chipList = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotCardCarousel:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  -[CTLazuliMessageChatBotCardCarousel layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToCTLazuliMessageChatBotCardCarouselLayout:", v7))
  {
    -[CTLazuliMessageChatBotCardCarousel content](self, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToArray:", v9))
    {
      v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[CTLazuliMessageChatBotCardCarousel chipList](self, "chipList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "chipList"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageChatBotCardCarousel chipList](self, "chipList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToCTLazuliChatBotSuggestedChipList:", v12);

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v13 = 1;
    }

    goto LABEL_11;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageChatBotCardCarousel *v4;
  CTLazuliMessageChatBotCardCarousel *v5;
  BOOL v6;

  v4 = (CTLazuliMessageChatBotCardCarousel *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageChatBotCardCarousel isEqualToCTLazuliMessageChatBotCardCarousel:](self, "isEqualToCTLazuliMessageChatBotCardCarousel:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageChatBotCardCarousel *v4;

  v4 = +[CTLazuliMessageChatBotCardCarousel allocWithZone:](CTLazuliMessageChatBotCardCarousel, "allocWithZone:", a3);
  -[CTLazuliMessageChatBotCardCarousel setLayout:](v4, "setLayout:", self->_layout);
  -[CTLazuliMessageChatBotCardCarousel setContent:](v4, "setContent:", self->_content);
  -[CTLazuliMessageChatBotCardCarousel setChipList:](v4, "setChipList:", self->_chipList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_layout, CFSTR("kLayoutKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, CFSTR("kContentKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chipList, CFSTR("kChipListKey"));

}

- (CTLazuliMessageChatBotCardCarousel)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageChatBotCardCarousel *v5;
  uint64_t v6;
  CTLazuliMessageChatBotCardCarouselLayout *layout;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *content;
  uint64_t v13;
  CTLazuliChatBotSuggestedChipList *chipList;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliMessageChatBotCardCarousel;
  v5 = -[CTLazuliMessageChatBotCardCarousel init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLayoutKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    layout = v5->_layout;
    v5->_layout = (CTLazuliMessageChatBotCardCarouselLayout *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kContentKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChipListKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v13;

  }
  return v5;
}

- (CTLazuliMessageChatBotCardCarousel)initWithReflection:(const void *)a3
{
  CTLazuliMessageChatBotCardCarousel *v4;
  CTLazuliMessageChatBotCardCarouselLayout *v5;
  CTLazuliMessageChatBotCardCarouselLayout *layout;
  id v7;
  uint64_t v8;
  uint64_t i;
  CTLazuliChatBotCardContent *v10;
  CTLazuliChatBotSuggestedChipList *v11;
  uint64_t v12;
  CTLazuliChatBotSuggestedChipList *chipList;
  CTLazuliMessageChatBotCardCarousel *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageChatBotCardCarousel;
  v4 = -[CTLazuliMessageChatBotCardCarousel init](&v15, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliMessageChatBotCardCarouselLayout initWithReflection:]([CTLazuliMessageChatBotCardCarouselLayout alloc], "initWithReflection:", a3);
  layout = v4->_layout;
  v4->_layout = v5;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = *((_QWORD *)a3 + 7);
  for (i = *((_QWORD *)a3 + 8); v8 != i; v8 += 280)
  {
    v10 = -[CTLazuliChatBotCardContent initWithReflection:]([CTLazuliChatBotCardContent alloc], "initWithReflection:", v8);
    objc_msgSend(v7, "addObject:", v10);

  }
  objc_storeStrong((id *)&v4->_content, v7);
  if (!*((_BYTE *)a3 + 104))
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
    goto LABEL_8;
  }
  v11 = [CTLazuliChatBotSuggestedChipList alloc];
  if (*((_BYTE *)a3 + 104))
  {
    v12 = -[CTLazuliChatBotSuggestedChipList initWithReflection:](v11, "initWithReflection:", (char *)a3 + 80);
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v12;
LABEL_8:

    return v4;
  }
  result = (CTLazuliMessageChatBotCardCarousel *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliMessageChatBotCardCarouselLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (NSArray)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
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
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
