@implementation CTLazuliChatBotCommunicationAddress

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotCommunicationAddress telInformation](self, "telInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", telInformation = %@"), v4);

  -[CTLazuliChatBotCommunicationAddress uriList](self, "uriList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", uriList = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCommunicationAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliChatBotCommunicationAddress telInformation](self, "telInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "telInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToCTLazuliChatBotTelephoneInformation:", v6))
  {
    -[CTLazuliChatBotCommunicationAddress uriList](self, "uriList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uriList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToCTLazuliChatBotURIEntryList:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotCommunicationAddress *v4;
  CTLazuliChatBotCommunicationAddress *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotCommunicationAddress *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotCommunicationAddress isEqualToCTLazuliChatBotCommunicationAddress:](self, "isEqualToCTLazuliChatBotCommunicationAddress:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotCommunicationAddress *v4;

  v4 = +[CTLazuliChatBotCommunicationAddress allocWithZone:](CTLazuliChatBotCommunicationAddress, "allocWithZone:", a3);
  -[CTLazuliChatBotCommunicationAddress setTelInformation:](v4, "setTelInformation:", self->_telInformation);
  -[CTLazuliChatBotCommunicationAddress setUriList:](v4, "setUriList:", self->_uriList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_telInformation, CFSTR("kTelInformationKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uriList, CFSTR("kUriListKey"));

}

- (CTLazuliChatBotCommunicationAddress)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotCommunicationAddress *v5;
  uint64_t v6;
  CTLazuliChatBotTelephoneInformation *telInformation;
  uint64_t v8;
  CTLazuliChatBotURIEntryList *uriList;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotCommunicationAddress;
  v5 = -[CTLazuliChatBotCommunicationAddress init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTelInformationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    telInformation = v5->_telInformation;
    v5->_telInformation = (CTLazuliChatBotTelephoneInformation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUriListKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    uriList = v5->_uriList;
    v5->_uriList = (CTLazuliChatBotURIEntryList *)v8;

  }
  return v5;
}

- (CTLazuliChatBotCommunicationAddress)initWithReflection:(const void *)a3
{
  CTLazuliChatBotCommunicationAddress *v4;
  CTLazuliChatBotTelephoneInformation *v5;
  CTLazuliChatBotTelephoneInformation *telInformation;
  CTLazuliChatBotURIEntryList *v7;
  CTLazuliChatBotURIEntryList *uriList;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotCommunicationAddress;
  v4 = -[CTLazuliChatBotCommunicationAddress init](&v10, sel_init);
  if (v4)
  {
    v5 = -[CTLazuliChatBotTelephoneInformation initWithReflection:]([CTLazuliChatBotTelephoneInformation alloc], "initWithReflection:", a3);
    telInformation = v4->_telInformation;
    v4->_telInformation = v5;

    v7 = -[CTLazuliChatBotURIEntryList initWithReflection:]([CTLazuliChatBotURIEntryList alloc], "initWithReflection:", (char *)a3 + 72);
    uriList = v4->_uriList;
    v4->_uriList = v7;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotTelephoneInformation)telInformation
{
  return self->_telInformation;
}

- (void)setTelInformation:(id)a3
{
  objc_storeStrong((id *)&self->_telInformation, a3);
}

- (CTLazuliChatBotURIEntryList)uriList
{
  return self->_uriList;
}

- (void)setUriList:(id)a3
{
  objc_storeStrong((id *)&self->_uriList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uriList, 0);
  objc_storeStrong((id *)&self->_telInformation, 0);
}

@end
