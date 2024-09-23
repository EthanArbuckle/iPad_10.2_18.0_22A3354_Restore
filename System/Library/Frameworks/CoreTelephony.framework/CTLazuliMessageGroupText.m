@implementation CTLazuliMessageGroupText

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageGroupText chatInformation](self, "chatInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chatInformation = %@"), v4);

  -[CTLazuliMessageGroupText content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", content = %@"), v5);

  -[CTLazuliMessageGroupText metaData](self, "metaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metaData = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageGroupText:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  -[CTLazuliMessageGroupText chatInformation](self, "chatInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToCTLazuliGroupChatInformation:", v7))
  {
    -[CTLazuliMessageGroupText content](self, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v9))
    {
      v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[CTLazuliMessageGroupText metaData](self, "metaData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "metaData"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageGroupText metaData](self, "metaData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "metaData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToCTLazuliCustomMetaData:", v12);

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v13 = 1;
    }

    goto LABEL_11;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageGroupText *v4;
  CTLazuliMessageGroupText *v5;
  BOOL v6;

  v4 = (CTLazuliMessageGroupText *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageGroupText isEqualToCTLazuliMessageGroupText:](self, "isEqualToCTLazuliMessageGroupText:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageGroupText *v4;

  v4 = +[CTLazuliMessageGroupText allocWithZone:](CTLazuliMessageGroupText, "allocWithZone:", a3);
  -[CTLazuliMessageGroupText setChatInformation:](v4, "setChatInformation:", self->_chatInformation);
  -[CTLazuliMessageGroupText setContent:](v4, "setContent:", self->_content);
  -[CTLazuliMessageGroupText setMetaData:](v4, "setMetaData:", self->_metaData);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_chatInformation, CFSTR("kChatInformationKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, CFSTR("kContentKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metaData, CFSTR("kMetaDataKey"));

}

- (CTLazuliMessageGroupText)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageGroupText *v5;
  uint64_t v6;
  CTLazuliGroupChatInformation *chatInformation;
  uint64_t v8;
  NSString *content;
  uint64_t v10;
  CTLazuliCustomMetaData *metaData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageGroupText;
  v5 = -[CTLazuliMessageGroupText init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChatInformationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    chatInformation = v5->_chatInformation;
    v5->_chatInformation = (CTLazuliGroupChatInformation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kContentKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMetaDataKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;

  }
  return v5;
}

- (CTLazuliMessageGroupText)initWithReflection:(const void *)a3
{
  CTLazuliMessageGroupText *v4;
  CTLazuliGroupChatInformation *v5;
  CTLazuliGroupChatInformation *chatInformation;
  char *v7;
  uint64_t v8;
  NSString *content;
  CTLazuliCustomMetaData *v10;
  uint64_t v11;
  CTLazuliCustomMetaData *metaData;
  CTLazuliMessageGroupText *result;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CTLazuliMessageGroupText;
  v4 = -[CTLazuliMessageGroupText init](&v14, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliGroupChatInformation initWithReflection:]([CTLazuliGroupChatInformation alloc], "initWithReflection:", a3);
  chatInformation = v4->_chatInformation;
  v4->_chatInformation = v5;

  if (*((char *)a3 + 343) >= 0)
    v7 = (char *)a3 + 320;
  else
    v7 = (char *)*((_QWORD *)a3 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  content = v4->_content;
  v4->_content = (NSString *)v8;

  if (!*((_BYTE *)a3 + 368))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_9;
  }
  v10 = [CTLazuliCustomMetaData alloc];
  if (*((_BYTE *)a3 + 368))
  {
    v11 = -[CTLazuliCustomMetaData initWithReflection:](v10, "initWithReflection:", (char *)a3 + 344);
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v11;
LABEL_9:

    return v4;
  }
  result = (CTLazuliMessageGroupText *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliGroupChatInformation)chatInformation
{
  return self->_chatInformation;
}

- (void)setChatInformation:(id)a3
{
  objc_storeStrong((id *)&self->_chatInformation, a3);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
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
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_chatInformation, 0);
}

@end
