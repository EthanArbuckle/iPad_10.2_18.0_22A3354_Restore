@implementation CTLazuliMessageChatBotCard

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageChatBotCard card](self, "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", card = %@"), v4);

  -[CTLazuliMessageChatBotCard chipList](self, "chipList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chipList = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotCard:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  -[CTLazuliMessageChatBotCard card](self, "card");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "card");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToCTLazuliChatBotCard:", v7))
  {
    -[CTLazuliMessageChatBotCard chipList](self, "chipList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v5, "chipList"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageChatBotCard chipList](self, "chipList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToCTLazuliChatBotSuggestedChipList:", v10);

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageChatBotCard *v4;
  CTLazuliMessageChatBotCard *v5;
  BOOL v6;

  v4 = (CTLazuliMessageChatBotCard *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageChatBotCard isEqualToCTLazuliMessageChatBotCard:](self, "isEqualToCTLazuliMessageChatBotCard:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageChatBotCard *v4;

  v4 = +[CTLazuliMessageChatBotCard allocWithZone:](CTLazuliMessageChatBotCard, "allocWithZone:", a3);
  -[CTLazuliMessageChatBotCard setCard:](v4, "setCard:", self->_card);
  -[CTLazuliMessageChatBotCard setChipList:](v4, "setChipList:", self->_chipList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_card, CFSTR("kCardKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chipList, CFSTR("kChipListKey"));

}

- (CTLazuliMessageChatBotCard)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageChatBotCard *v5;
  uint64_t v6;
  CTLazuliChatBotCard *card;
  uint64_t v8;
  CTLazuliChatBotSuggestedChipList *chipList;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliMessageChatBotCard;
  v5 = -[CTLazuliMessageChatBotCard init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCardKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    card = v5->_card;
    v5->_card = (CTLazuliChatBotCard *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChipListKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;

  }
  return v5;
}

- (CTLazuliMessageChatBotCard)initWithReflection:(const void *)a3
{
  CTLazuliMessageChatBotCard *v4;
  CTLazuliChatBotCard *v5;
  CTLazuliChatBotCard *card;
  CTLazuliChatBotSuggestedChipList *v7;
  uint64_t v8;
  CTLazuliChatBotSuggestedChipList *chipList;
  CTLazuliMessageChatBotCard *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CTLazuliMessageChatBotCard;
  v4 = -[CTLazuliMessageChatBotCard init](&v11, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliChatBotCard initWithReflection:]([CTLazuliChatBotCard alloc], "initWithReflection:", a3);
  card = v4->_card;
  v4->_card = v5;

  if (!*((_BYTE *)a3 + 352))
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
    goto LABEL_6;
  }
  v7 = [CTLazuliChatBotSuggestedChipList alloc];
  if (*((_BYTE *)a3 + 352))
  {
    v8 = -[CTLazuliChatBotSuggestedChipList initWithReflection:](v7, "initWithReflection:", (char *)a3 + 328);
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;
LABEL_6:

    return v4;
  }
  result = (CTLazuliMessageChatBotCard *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
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
  objc_storeStrong((id *)&self->_card, 0);
}

@end
