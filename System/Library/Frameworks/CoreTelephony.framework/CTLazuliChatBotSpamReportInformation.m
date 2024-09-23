@implementation CTLazuliChatBotSpamReportInformation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  int64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotSpamReportInformation chatbotUri](self, "chatbotUri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chatbotUri = %@"), v4);

  -[CTLazuliChatBotSpamReportInformation messageIDList](self, "messageIDList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messageIDList = %@"), v5);

  v6 = -[CTLazuliChatBotSpamReportInformation spamType](self, "spamType");
  v9 = -[CTLazuliChatBotSpamReportInformation spamType](self, "spamType");
  objc_msgSend(v3, "appendFormat:", CFSTR(", spamType = [%ld - %s]"), v6, print_CTLazuliChatBotSpamReportType(&v9));
  -[CTLazuliChatBotSpamReportInformation freeBodyText](self, "freeBodyText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", freeBodyText = %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSpamReportInformation:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a3;
  -[CTLazuliChatBotSpamReportInformation chatbotUri](self, "chatbotUri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatbotUri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    -[CTLazuliChatBotSpamReportInformation messageIDList](self, "messageIDList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageIDList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToCTLazuliMessageIDList:", v9)
      || (v10 = -[CTLazuliChatBotSpamReportInformation spamType](self, "spamType"), v10 != objc_msgSend(v5, "spamType")))
    {
      v14 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[CTLazuliChatBotSpamReportInformation freeBodyText](self, "freeBodyText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v5, "freeBodyText"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliChatBotSpamReportInformation freeBodyText](self, "freeBodyText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "freeBodyText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v11)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v14 = 1;
    }

    goto LABEL_12;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotSpamReportInformation *v4;
  CTLazuliChatBotSpamReportInformation *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotSpamReportInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotSpamReportInformation isEqualToCTLazuliChatBotSpamReportInformation:](self, "isEqualToCTLazuliChatBotSpamReportInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotSpamReportInformation *v4;

  v4 = +[CTLazuliChatBotSpamReportInformation allocWithZone:](CTLazuliChatBotSpamReportInformation, "allocWithZone:", a3);
  -[CTLazuliChatBotSpamReportInformation setChatbotUri:](v4, "setChatbotUri:", self->_chatbotUri);
  -[CTLazuliChatBotSpamReportInformation setMessageIDList:](v4, "setMessageIDList:", self->_messageIDList);
  -[CTLazuliChatBotSpamReportInformation setSpamType:](v4, "setSpamType:", self->_spamType);
  -[CTLazuliChatBotSpamReportInformation setFreeBodyText:](v4, "setFreeBodyText:", self->_freeBodyText);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_chatbotUri, CFSTR("kChatbotUriKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageIDList, CFSTR("kMessageIDListKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_spamType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kSpamTypeKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_freeBodyText, CFSTR("kFreeBodyTextKey"));
}

- (CTLazuliChatBotSpamReportInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotSpamReportInformation *v5;
  uint64_t v6;
  NSString *chatbotUri;
  uint64_t v8;
  CTLazuliMessageIDList *messageIDList;
  void *v10;
  uint64_t v11;
  NSString *freeBodyText;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotSpamReportInformation;
  v5 = -[CTLazuliChatBotSpamReportInformation init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChatbotUriKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    chatbotUri = v5->_chatbotUri;
    v5->_chatbotUri = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMessageIDListKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    messageIDList = v5->_messageIDList;
    v5->_messageIDList = (CTLazuliMessageIDList *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSpamTypeKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_spamType = objc_msgSend(v10, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFreeBodyTextKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    freeBodyText = v5->_freeBodyText;
    v5->_freeBodyText = (NSString *)v11;

  }
  return v5;
}

- (CTLazuliChatBotSpamReportInformation)initWithReflection:(const void *)a3
{
  CTLazuliChatBotSpamReportInformation *v4;
  const void *v5;
  uint64_t v6;
  NSString *chatbotUri;
  CTLazuliMessageIDList *v8;
  CTLazuliMessageIDList *messageIDList;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  NSString *freeBodyText;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CTLazuliChatBotSpamReportInformation;
  v4 = -[CTLazuliChatBotSpamReportInformation init](&v17, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    chatbotUri = v4->_chatbotUri;
    v4->_chatbotUri = (NSString *)v6;

    v8 = -[CTLazuliMessageIDList initWithReflection:]([CTLazuliMessageIDList alloc], "initWithReflection:", (char *)a3 + 24);
    messageIDList = v4->_messageIDList;
    v4->_messageIDList = v8;

    v4->_spamType = encode_CTLazuliChatBotSpamReportType((unsigned int *)a3 + 12);
    if (*((_BYTE *)a3 + 80))
    {
      v12 = (char *)*((_QWORD *)a3 + 7);
      v11 = (char *)a3 + 56;
      v10 = v12;
      if (v11[23] >= 0)
        v13 = v11;
      else
        v13 = v10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      freeBodyText = v4->_freeBodyText;
      v4->_freeBodyText = (NSString *)v14;
    }
    else
    {
      freeBodyText = v4->_freeBodyText;
      v4->_freeBodyText = 0;
    }

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)chatbotUri
{
  return self->_chatbotUri;
}

- (void)setChatbotUri:(id)a3
{
  objc_storeStrong((id *)&self->_chatbotUri, a3);
}

- (CTLazuliMessageIDList)messageIDList
{
  return self->_messageIDList;
}

- (void)setMessageIDList:(id)a3
{
  objc_storeStrong((id *)&self->_messageIDList, a3);
}

- (int64_t)spamType
{
  return self->_spamType;
}

- (void)setSpamType:(int64_t)a3
{
  self->_spamType = a3;
}

- (NSString)freeBodyText
{
  return self->_freeBodyText;
}

- (void)setFreeBodyText:(id)a3
{
  objc_storeStrong((id *)&self->_freeBodyText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeBodyText, 0);
  objc_storeStrong((id *)&self->_messageIDList, 0);
  objc_storeStrong((id *)&self->_chatbotUri, 0);
}

@end
