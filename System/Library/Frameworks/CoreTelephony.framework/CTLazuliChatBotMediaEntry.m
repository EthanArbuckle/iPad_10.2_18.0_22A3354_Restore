@implementation CTLazuliChatBotMediaEntry

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  int64_t v6;
  int64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliChatBotMediaEntry label](self, "label");
  v8 = -[CTLazuliChatBotMediaEntry label](self, "label");
  objc_msgSend(v3, "appendFormat:", CFSTR(", label = [%ld - %s]"), v4, print_CTLazuliChatBotMediaLabelType(&v8));
  -[CTLazuliChatBotMediaEntry media](self, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", media = %@"), v5);

  v6 = -[CTLazuliChatBotMediaEntry content](self, "content");
  v8 = -[CTLazuliChatBotMediaEntry content](self, "content");
  objc_msgSend(v3, "appendFormat:", CFSTR(", content = [%ld - %s]"), v6, print_CTLazuliChatBotMediaContentType(&v8));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMediaEntry:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  int64_t v12;

  v7 = a3;
  v8 = -[CTLazuliChatBotMediaEntry label](self, "label");
  if (v8 != objc_msgSend(v7, "label"))
  {
    v11 = 0;
    goto LABEL_14;
  }
  -[CTLazuliChatBotMediaEntry media](self, "media");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v7, "media"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotMediaEntry media](self, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToCTLazuliChatBotMedia:", v5))
    {
      v11 = 0;
LABEL_10:

      goto LABEL_11;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  v12 = -[CTLazuliChatBotMediaEntry content](self, "content");
  v11 = v12 == objc_msgSend(v7, "content");
  if (v10)
    goto LABEL_10;
LABEL_11:
  if (!v9)

LABEL_14:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotMediaEntry *v4;
  CTLazuliChatBotMediaEntry *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotMediaEntry *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotMediaEntry isEqualToCTLazuliChatBotMediaEntry:](self, "isEqualToCTLazuliChatBotMediaEntry:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotMediaEntry *v4;

  v4 = +[CTLazuliChatBotMediaEntry allocWithZone:](CTLazuliChatBotMediaEntry, "allocWithZone:", a3);
  -[CTLazuliChatBotMediaEntry setLabel:](v4, "setLabel:", self->_label);
  -[CTLazuliChatBotMediaEntry setMedia:](v4, "setMedia:", self->_media);
  -[CTLazuliChatBotMediaEntry setContent:](v4, "setContent:", self->_content);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_label);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kLabelKey"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_media, CFSTR("kMediaKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_content);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kContentKey"));

}

- (CTLazuliChatBotMediaEntry)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotMediaEntry *v5;
  void *v6;
  uint64_t v7;
  CTLazuliChatBotMedia *media;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotMediaEntry;
  v5 = -[CTLazuliChatBotMediaEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLabelKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_label = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    media = v5->_media;
    v5->_media = (CTLazuliChatBotMedia *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContentKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_content = objc_msgSend(v9, "longValue");

  }
  return v5;
}

- (CTLazuliChatBotMediaEntry)initWithReflection:(const void *)a3
{
  CTLazuliChatBotMediaEntry *v4;
  CTLazuliChatBotMedia *v5;
  uint64_t v6;
  CTLazuliChatBotMedia *media;
  CTLazuliChatBotMediaEntry *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotMediaEntry;
  v4 = -[CTLazuliChatBotMediaEntry init](&v9, sel_init);
  if (!v4)
    return v4;
  v4->_label = encode_CTLazuliChatBotMediaLabelType(a3);
  if (!*((_BYTE *)a3 + 64))
  {
    media = v4->_media;
    v4->_media = 0;
    goto LABEL_6;
  }
  v5 = [CTLazuliChatBotMedia alloc];
  if (*((_BYTE *)a3 + 64))
  {
    v6 = -[CTLazuliChatBotMedia initWithReflection:](v5, "initWithReflection:", (char *)a3 + 8);
    media = v4->_media;
    v4->_media = (CTLazuliChatBotMedia *)v6;
LABEL_6:

    v4->_content = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 18);
    return v4;
  }
  result = (CTLazuliChatBotMediaEntry *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)label
{
  return self->_label;
}

- (void)setLabel:(int64_t)a3
{
  self->_label = a3;
}

- (CTLazuliChatBotMedia)media
{
  return self->_media;
}

- (void)setMedia:(id)a3
{
  objc_storeStrong((id *)&self->_media, a3);
}

- (int64_t)content
{
  return self->_content;
}

- (void)setContent:(int64_t)a3
{
  self->_content = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);
}

@end
