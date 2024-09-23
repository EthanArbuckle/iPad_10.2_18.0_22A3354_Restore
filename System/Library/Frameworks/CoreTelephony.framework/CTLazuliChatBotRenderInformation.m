@implementation CTLazuliChatBotRenderInformation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotRenderInformation botInfo](self, "botInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", botInfo = %@"), v4);

  -[CTLazuliChatBotRenderInformation persistentMenu](self, "persistentMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", persistentMenu = %@"), v5);

  -[CTLazuliChatBotRenderInformation verificationDetails](self, "verificationDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", verificationDetails = %@"), v6);

  -[CTLazuliChatBotRenderInformation cssInfo](self, "cssInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", cssInfo = %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotRenderInformation:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;

  v5 = a3;
  -[CTLazuliChatBotRenderInformation botInfo](self, "botInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "botInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToCTLazuliChatBotInformation:", v7))
  {
    v9 = 0;
    goto LABEL_19;
  }
  -[CTLazuliChatBotRenderInformation persistentMenu](self, "persistentMenu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v5, "persistentMenu"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliChatBotRenderInformation persistentMenu](self, "persistentMenu");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistentMenu");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToCTLazuliChatBotMenuItem:", v3) & 1) == 0)
    {

      v9 = 0;
      goto LABEL_16;
    }
    v19 = 1;
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  -[CTLazuliChatBotRenderInformation verificationDetails](self, "verificationDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verificationDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToCTLazuliChatBotVerificationDetails:", v11))
  {
    -[CTLazuliChatBotRenderInformation cssInfo](self, "cssInfo");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17 || (objc_msgSend(v5, "cssInfo"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotRenderInformation cssInfo](self, "cssInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cssInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "isEqualToCTLazuliChatBotGenericCssTemplateInfo:", v13);

      v14 = (void *)v17;
      if (!v17)
        v14 = (void *)v16;
    }
    else
    {
      v14 = 0;
      v9 = 1;
    }

    if ((v19 & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }

  v9 = 0;
  if (v19)
  {
LABEL_15:

  }
LABEL_16:
  if (!v8)

LABEL_19:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotRenderInformation *v4;
  CTLazuliChatBotRenderInformation *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotRenderInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotRenderInformation isEqualToCTLazuliChatBotRenderInformation:](self, "isEqualToCTLazuliChatBotRenderInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotRenderInformation *v4;

  v4 = +[CTLazuliChatBotRenderInformation allocWithZone:](CTLazuliChatBotRenderInformation, "allocWithZone:", a3);
  -[CTLazuliChatBotRenderInformation setBotInfo:](v4, "setBotInfo:", self->_botInfo);
  -[CTLazuliChatBotRenderInformation setPersistentMenu:](v4, "setPersistentMenu:", self->_persistentMenu);
  -[CTLazuliChatBotRenderInformation setVerificationDetails:](v4, "setVerificationDetails:", self->_verificationDetails);
  -[CTLazuliChatBotRenderInformation setCssInfo:](v4, "setCssInfo:", self->_cssInfo);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_botInfo, CFSTR("kBotInfoKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_persistentMenu, CFSTR("kPersistentMenuKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verificationDetails, CFSTR("kVerificationDetailsKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cssInfo, CFSTR("kCssInfoKey"));

}

- (CTLazuliChatBotRenderInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotRenderInformation *v5;
  uint64_t v6;
  CTLazuliChatBotInformation *botInfo;
  uint64_t v8;
  CTLazuliChatBotMenuItem *persistentMenu;
  uint64_t v10;
  CTLazuliChatBotVerificationDetails *verificationDetails;
  uint64_t v12;
  CTLazuliChatBotGenericCssTemplateInfo *cssInfo;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotRenderInformation;
  v5 = -[CTLazuliChatBotRenderInformation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBotInfoKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    botInfo = v5->_botInfo;
    v5->_botInfo = (CTLazuliChatBotInformation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPersistentMenuKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    persistentMenu = v5->_persistentMenu;
    v5->_persistentMenu = (CTLazuliChatBotMenuItem *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVerificationDetailsKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    verificationDetails = v5->_verificationDetails;
    v5->_verificationDetails = (CTLazuliChatBotVerificationDetails *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCssInfoKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    cssInfo = v5->_cssInfo;
    v5->_cssInfo = (CTLazuliChatBotGenericCssTemplateInfo *)v12;

  }
  return v5;
}

- (CTLazuliChatBotRenderInformation)initWithReflection:(const void *)a3
{
  CTLazuliChatBotRenderInformation *v4;
  CTLazuliChatBotInformation *v5;
  CTLazuliChatBotInformation *botInfo;
  CTLazuliChatBotMenuItem *v7;
  uint64_t v8;
  CTLazuliChatBotMenuItem *persistentMenu;
  CTLazuliChatBotVerificationDetails *v10;
  CTLazuliChatBotVerificationDetails *verificationDetails;
  CTLazuliChatBotGenericCssTemplateInfo *v12;
  uint64_t v13;
  CTLazuliChatBotGenericCssTemplateInfo *cssInfo;
  CTLazuliChatBotRenderInformation *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CTLazuliChatBotRenderInformation;
  v4 = -[CTLazuliChatBotRenderInformation init](&v16, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliChatBotInformation initWithReflection:]([CTLazuliChatBotInformation alloc], "initWithReflection:", a3);
  botInfo = v4->_botInfo;
  v4->_botInfo = v5;

  if (*((_BYTE *)a3 + 592))
  {
    v7 = [CTLazuliChatBotMenuItem alloc];
    if (!*((_BYTE *)a3 + 592))
      goto LABEL_12;
    v8 = -[CTLazuliChatBotMenuItem initWithReflection:](v7, "initWithReflection:", (char *)a3 + 568);
    persistentMenu = v4->_persistentMenu;
    v4->_persistentMenu = (CTLazuliChatBotMenuItem *)v8;
  }
  else
  {
    persistentMenu = v4->_persistentMenu;
    v4->_persistentMenu = 0;
  }

  v10 = -[CTLazuliChatBotVerificationDetails initWithReflection:]([CTLazuliChatBotVerificationDetails alloc], "initWithReflection:", (char *)a3 + 600);
  verificationDetails = v4->_verificationDetails;
  v4->_verificationDetails = v10;

  if (!*((_BYTE *)a3 + 680))
  {
    cssInfo = v4->_cssInfo;
    v4->_cssInfo = 0;
    goto LABEL_10;
  }
  v12 = [CTLazuliChatBotGenericCssTemplateInfo alloc];
  if (*((_BYTE *)a3 + 680))
  {
    v13 = -[CTLazuliChatBotGenericCssTemplateInfo initWithReflection:](v12, "initWithReflection:", (char *)a3 + 656);
    cssInfo = v4->_cssInfo;
    v4->_cssInfo = (CTLazuliChatBotGenericCssTemplateInfo *)v13;
LABEL_10:

    return v4;
  }
LABEL_12:
  result = (CTLazuliChatBotRenderInformation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotInformation)botInfo
{
  return self->_botInfo;
}

- (void)setBotInfo:(id)a3
{
  objc_storeStrong((id *)&self->_botInfo, a3);
}

- (CTLazuliChatBotMenuItem)persistentMenu
{
  return self->_persistentMenu;
}

- (void)setPersistentMenu:(id)a3
{
  objc_storeStrong((id *)&self->_persistentMenu, a3);
}

- (CTLazuliChatBotVerificationDetails)verificationDetails
{
  return self->_verificationDetails;
}

- (void)setVerificationDetails:(id)a3
{
  objc_storeStrong((id *)&self->_verificationDetails, a3);
}

- (CTLazuliChatBotGenericCssTemplateInfo)cssInfo
{
  return self->_cssInfo;
}

- (void)setCssInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cssInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cssInfo, 0);
  objc_storeStrong((id *)&self->_verificationDetails, 0);
  objc_storeStrong((id *)&self->_persistentMenu, 0);
  objc_storeStrong((id *)&self->_botInfo, 0);
}

@end
