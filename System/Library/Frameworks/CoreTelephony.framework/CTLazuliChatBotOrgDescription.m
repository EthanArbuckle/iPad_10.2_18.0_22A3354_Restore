@implementation CTLazuliChatBotOrgDescription

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotOrgDescription orgDescription](self, "orgDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", orgDescription = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotOrgDescription:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  -[CTLazuliChatBotOrgDescription orgDescription](self, "orgDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "orgDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[CTLazuliChatBotOrgDescription orgDescription](self, "orgDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orgDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotOrgDescription *v4;
  CTLazuliChatBotOrgDescription *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotOrgDescription *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotOrgDescription isEqualToCTLazuliChatBotOrgDescription:](self, "isEqualToCTLazuliChatBotOrgDescription:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotOrgDescription *v4;

  v4 = +[CTLazuliChatBotOrgDescription allocWithZone:](CTLazuliChatBotOrgDescription, "allocWithZone:", a3);
  -[CTLazuliChatBotOrgDescription setOrgDescription:](v4, "setOrgDescription:", self->_orgDescription);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_orgDescription, CFSTR("kOrgDescriptionKey"));
}

- (CTLazuliChatBotOrgDescription)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotOrgDescription *v5;
  uint64_t v6;
  NSString *orgDescription;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotOrgDescription;
  v5 = -[CTLazuliChatBotOrgDescription init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOrgDescriptionKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    orgDescription = v5->_orgDescription;
    v5->_orgDescription = (NSString *)v6;

  }
  return v5;
}

- (CTLazuliChatBotOrgDescription)initWithReflection:(const void *)a3
{
  CTLazuliChatBotOrgDescription *v4;
  CTLazuliChatBotOrgDescription *v5;
  const void *v6;
  uint64_t v7;
  NSString *orgDescription;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotOrgDescription;
  v4 = -[CTLazuliChatBotOrgDescription init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if (*((_BYTE *)a3 + 24))
    {
      if (*((char *)a3 + 23) >= 0)
        v6 = a3;
      else
        v6 = *(const void **)a3;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      orgDescription = v5->_orgDescription;
      v5->_orgDescription = (NSString *)v7;
    }
    else
    {
      orgDescription = v4->_orgDescription;
      v4->_orgDescription = 0;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)orgDescription
{
  return self->_orgDescription;
}

- (void)setOrgDescription:(id)a3
{
  objc_storeStrong((id *)&self->_orgDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orgDescription, 0);
}

@end
