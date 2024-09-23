@implementation CTLazuliChatBotMediaList

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotMediaList entry](self, "entry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", entry = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMediaList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliChatBotMediaList entry](self, "entry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToCTLazuliChatBotMediaEntryList:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotMediaList *v4;
  CTLazuliChatBotMediaList *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotMediaList *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotMediaList isEqualToCTLazuliChatBotMediaList:](self, "isEqualToCTLazuliChatBotMediaList:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotMediaList *v4;

  v4 = +[CTLazuliChatBotMediaList allocWithZone:](CTLazuliChatBotMediaList, "allocWithZone:", a3);
  -[CTLazuliChatBotMediaList setEntry:](v4, "setEntry:", self->_entry);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_entry, CFSTR("kEntryKey"));
}

- (CTLazuliChatBotMediaList)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotMediaList *v5;
  uint64_t v6;
  CTLazuliChatBotMediaEntryList *entry;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotMediaList;
  v5 = -[CTLazuliChatBotMediaList init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kEntryKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    entry = v5->_entry;
    v5->_entry = (CTLazuliChatBotMediaEntryList *)v6;

  }
  return v5;
}

- (CTLazuliChatBotMediaList)initWithReflection:(const void *)a3
{
  CTLazuliChatBotMediaList *v4;
  CTLazuliChatBotMediaEntryList *v5;
  CTLazuliChatBotMediaEntryList *entry;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTLazuliChatBotMediaList;
  v4 = -[CTLazuliChatBotMediaList init](&v8, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliChatBotMediaEntryList initWithReflection:]([CTLazuliChatBotMediaEntryList alloc], "initWithReflection:", a3);
    entry = v4->_entry;
    v4->_entry = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotMediaEntryList)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
