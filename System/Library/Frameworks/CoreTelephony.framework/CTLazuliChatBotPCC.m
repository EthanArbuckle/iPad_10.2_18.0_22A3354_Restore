@implementation CTLazuliChatBotPCC

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotPCC orgDetails](self, "orgDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", orgDetails = %@"), v4);

  -[CTLazuliChatBotPCC pccType](self, "pccType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pccType = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotPCC:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v8 = a3;
  -[CTLazuliChatBotPCC orgDetails](self, "orgDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v8, "orgDetails"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotPCC orgDetails](self, "orgDetails");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orgDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToCTLazuliChatBotOrgDetails:", v4))
    {
      v11 = 0;
      goto LABEL_12;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  v16 = v5;
  -[CTLazuliChatBotPCC pccType](self, "pccType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v8, "pccType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v11 = 1;
LABEL_16:

      if ((v10 & 1) != 0)
        goto LABEL_11;
LABEL_17:
      v5 = v16;
      if (v9)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  -[CTLazuliChatBotPCC pccType](self, "pccType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pccType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v13, "isEqualToString:", v14);

  if (!v12)
    goto LABEL_16;

  if (!v10)
    goto LABEL_17;
LABEL_11:
  v5 = v16;
LABEL_12:

  if (!v9)
LABEL_13:

LABEL_14:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotPCC *v4;
  CTLazuliChatBotPCC *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotPCC *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotPCC isEqualToCTLazuliChatBotPCC:](self, "isEqualToCTLazuliChatBotPCC:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotPCC *v4;

  v4 = +[CTLazuliChatBotPCC allocWithZone:](CTLazuliChatBotPCC, "allocWithZone:", a3);
  -[CTLazuliChatBotPCC setOrgDetails:](v4, "setOrgDetails:", self->_orgDetails);
  -[CTLazuliChatBotPCC setPccType:](v4, "setPccType:", self->_pccType);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_orgDetails, CFSTR("kOrgDetailsKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pccType, CFSTR("kPccTypeKey"));

}

- (CTLazuliChatBotPCC)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotPCC *v5;
  uint64_t v6;
  CTLazuliChatBotOrgDetails *orgDetails;
  uint64_t v8;
  NSString *pccType;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotPCC;
  v5 = -[CTLazuliChatBotPCC init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOrgDetailsKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    orgDetails = v5->_orgDetails;
    v5->_orgDetails = (CTLazuliChatBotOrgDetails *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPccTypeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    pccType = v5->_pccType;
    v5->_pccType = (NSString *)v8;

  }
  return v5;
}

- (CTLazuliChatBotPCC)initWithReflection:(const void *)a3
{
  CTLazuliChatBotPCC *v4;
  CTLazuliChatBotPCC *v5;
  CTLazuliChatBotOrgDetails *v6;
  uint64_t v7;
  CTLazuliChatBotOrgDetails *orgDetails;
  char *v9;
  uint64_t v10;
  NSString *pccType;
  CTLazuliChatBotPCC *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotPCC;
  v4 = -[CTLazuliChatBotPCC init](&v13, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (!*((_BYTE *)a3 + 272))
  {
    orgDetails = v4->_orgDetails;
    v4->_orgDetails = 0;
    goto LABEL_6;
  }
  v6 = [CTLazuliChatBotOrgDetails alloc];
  if (*((_BYTE *)a3 + 272))
  {
    v7 = -[CTLazuliChatBotOrgDetails initWithReflection:](v6, "initWithReflection:", a3);
    orgDetails = v5->_orgDetails;
    v5->_orgDetails = (CTLazuliChatBotOrgDetails *)v7;
LABEL_6:

    if (*((_BYTE *)a3 + 304))
    {
      if (*((char *)a3 + 303) >= 0)
        v9 = (char *)a3 + 280;
      else
        v9 = (char *)*((_QWORD *)a3 + 35);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      pccType = v5->_pccType;
      v5->_pccType = (NSString *)v10;
    }
    else
    {
      pccType = v5->_pccType;
      v5->_pccType = 0;
    }

    return v5;
  }
  result = (CTLazuliChatBotPCC *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotOrgDetails)orgDetails
{
  return self->_orgDetails;
}

- (void)setOrgDetails:(id)a3
{
  objc_storeStrong((id *)&self->_orgDetails, a3);
}

- (NSString)pccType
{
  return self->_pccType;
}

- (void)setPccType:(id)a3
{
  objc_storeStrong((id *)&self->_pccType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pccType, 0);
  objc_storeStrong((id *)&self->_orgDetails, 0);
}

@end
