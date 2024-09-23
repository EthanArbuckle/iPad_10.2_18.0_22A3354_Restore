@implementation CTLazuliMessageText

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageText content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", content = %@"), v4);

  -[CTLazuliMessageText chipList](self, "chipList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chipList = %@"), v5);

  -[CTLazuliMessageText metaData](self, "metaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metaData = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageText:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;

  v6 = a3;
  -[CTLazuliMessageText content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v8))
  {
    v10 = 0;
    goto LABEL_17;
  }
  -[CTLazuliMessageText chipList](self, "chipList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v6, "chipList"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliMessageText chipList](self, "chipList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chipList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToCTLazuliChatBotSuggestedChipList:", v4) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_14;
    }
    v18 = 1;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  -[CTLazuliMessageText metaData](self, "metaData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v6, "metaData");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v15 = 0;
      v10 = 1;
LABEL_20:

      if ((v18 & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  -[CTLazuliMessageText metaData](self, "metaData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metaData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "isEqualToCTLazuliCustomMetaData:", v13);

  if (!v11)
  {
    v15 = (void *)v16;
    goto LABEL_20;
  }

  if (v18)
  {
LABEL_13:

  }
LABEL_14:
  if (!v9)

LABEL_17:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageText *v4;
  CTLazuliMessageText *v5;
  BOOL v6;

  v4 = (CTLazuliMessageText *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageText isEqualToCTLazuliMessageText:](self, "isEqualToCTLazuliMessageText:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageText *v4;

  v4 = +[CTLazuliMessageText allocWithZone:](CTLazuliMessageText, "allocWithZone:", a3);
  -[CTLazuliMessageText setContent:](v4, "setContent:", self->_content);
  -[CTLazuliMessageText setChipList:](v4, "setChipList:", self->_chipList);
  -[CTLazuliMessageText setMetaData:](v4, "setMetaData:", self->_metaData);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, CFSTR("kContentKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chipList, CFSTR("kChipListKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metaData, CFSTR("kMetaDataKey"));

}

- (CTLazuliMessageText)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageText *v5;
  uint64_t v6;
  NSString *content;
  uint64_t v8;
  CTLazuliChatBotSuggestedChipList *chipList;
  uint64_t v10;
  CTLazuliCustomMetaData *metaData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageText;
  v5 = -[CTLazuliMessageText init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContentKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChipListKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMetaDataKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;

  }
  return v5;
}

- (CTLazuliMessageText)initWithReflection:(const void *)a3
{
  CTLazuliMessageText *v4;
  const void *v5;
  uint64_t v6;
  NSString *content;
  CTLazuliChatBotSuggestedChipList *v8;
  uint64_t v9;
  CTLazuliChatBotSuggestedChipList *chipList;
  CTLazuliCustomMetaData *v11;
  uint64_t v12;
  CTLazuliCustomMetaData *metaData;
  CTLazuliMessageText *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageText;
  v4 = -[CTLazuliMessageText init](&v15, sel_init);
  if (!v4)
    return v4;
  if (*((char *)a3 + 23) >= 0)
    v5 = a3;
  else
    v5 = *(const void **)a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  content = v4->_content;
  v4->_content = (NSString *)v6;

  if (*((_BYTE *)a3 + 48))
  {
    v8 = [CTLazuliChatBotSuggestedChipList alloc];
    if (!*((_BYTE *)a3 + 48))
      goto LABEL_15;
    v9 = -[CTLazuliChatBotSuggestedChipList initWithReflection:](v8, "initWithReflection:", (char *)a3 + 24);
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v9;
  }
  else
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
  }

  if (!*((_BYTE *)a3 + 80))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_13;
  }
  v11 = [CTLazuliCustomMetaData alloc];
  if (*((_BYTE *)a3 + 80))
  {
    v12 = -[CTLazuliCustomMetaData initWithReflection:](v11, "initWithReflection:", (char *)a3 + 56);
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v12;
LABEL_13:

    return v4;
  }
LABEL_15:
  result = (CTLazuliMessageText *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CTLazuliChatBotSuggestedChipList)chipList
{
  return self->_chipList;
}

- (void)setChipList:(id)a3
{
  objc_storeStrong((id *)&self->_chipList, a3);
}

- (CTLazuliCustomMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_chipList, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
