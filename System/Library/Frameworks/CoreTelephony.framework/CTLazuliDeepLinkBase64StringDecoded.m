@implementation CTLazuliDeepLinkBase64StringDecoded

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliDeepLinkBase64StringDecoded chipList](self, "chipList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chipList = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliDeepLinkBase64StringDecoded:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  -[CTLazuliDeepLinkBase64StringDecoded chipList](self, "chipList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "chipList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[CTLazuliDeepLinkBase64StringDecoded chipList](self, "chipList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chipList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToCTLazuliChatBotSuggestedChipList:", v8);

  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliDeepLinkBase64StringDecoded *v4;
  CTLazuliDeepLinkBase64StringDecoded *v5;
  BOOL v6;

  v4 = (CTLazuliDeepLinkBase64StringDecoded *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliDeepLinkBase64StringDecoded isEqualToCTLazuliDeepLinkBase64StringDecoded:](self, "isEqualToCTLazuliDeepLinkBase64StringDecoded:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliDeepLinkBase64StringDecoded *v4;

  v4 = +[CTLazuliDeepLinkBase64StringDecoded allocWithZone:](CTLazuliDeepLinkBase64StringDecoded, "allocWithZone:", a3);
  -[CTLazuliDeepLinkBase64StringDecoded setChipList:](v4, "setChipList:", self->_chipList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_chipList, CFSTR("kChipListKey"));
}

- (CTLazuliDeepLinkBase64StringDecoded)initWithCoder:(id)a3
{
  id v4;
  CTLazuliDeepLinkBase64StringDecoded *v5;
  uint64_t v6;
  CTLazuliChatBotSuggestedChipList *chipList;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliDeepLinkBase64StringDecoded;
  v5 = -[CTLazuliDeepLinkBase64StringDecoded init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChipListKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v6;

  }
  return v5;
}

- (CTLazuliDeepLinkBase64StringDecoded)initWithReflection:(const void *)a3
{
  CTLazuliDeepLinkBase64StringDecoded *v4;
  CTLazuliDeepLinkBase64StringDecoded *v5;
  CTLazuliChatBotSuggestedChipList *v6;
  uint64_t v7;
  CTLazuliChatBotSuggestedChipList *chipList;
  CTLazuliDeepLinkBase64StringDecoded *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliDeepLinkBase64StringDecoded;
  v4 = -[CTLazuliDeepLinkBase64StringDecoded init](&v10, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (!*((_BYTE *)a3 + 24))
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
    goto LABEL_6;
  }
  v6 = [CTLazuliChatBotSuggestedChipList alloc];
  if (*((_BYTE *)a3 + 24))
  {
    v7 = -[CTLazuliChatBotSuggestedChipList initWithReflection:](v6, "initWithReflection:", a3);
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v7;
LABEL_6:

    return v5;
  }
  result = (CTLazuliDeepLinkBase64StringDecoded *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
}

@end
