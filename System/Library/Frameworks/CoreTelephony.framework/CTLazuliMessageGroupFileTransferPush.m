@implementation CTLazuliMessageGroupFileTransferPush

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageGroupFileTransferPush chatInformation](self, "chatInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chatInformation = %@"), v4);

  -[CTLazuliMessageGroupFileTransferPush descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", descriptor = %@"), v5);

  -[CTLazuliMessageGroupFileTransferPush metaData](self, "metaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metaData = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageGroupFileTransferPush:(id)a3
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
  -[CTLazuliMessageGroupFileTransferPush chatInformation](self, "chatInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToCTLazuliGroupChatInformation:", v7))
  {
    -[CTLazuliMessageGroupFileTransferPush descriptor](self, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToCTLazuliFileTransferDescriptor:", v9))
    {
      v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[CTLazuliMessageGroupFileTransferPush metaData](self, "metaData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "metaData"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageGroupFileTransferPush metaData](self, "metaData");
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
  CTLazuliMessageGroupFileTransferPush *v4;
  CTLazuliMessageGroupFileTransferPush *v5;
  BOOL v6;

  v4 = (CTLazuliMessageGroupFileTransferPush *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageGroupFileTransferPush isEqualToCTLazuliMessageGroupFileTransferPush:](self, "isEqualToCTLazuliMessageGroupFileTransferPush:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageGroupFileTransferPush *v4;

  v4 = +[CTLazuliMessageGroupFileTransferPush allocWithZone:](CTLazuliMessageGroupFileTransferPush, "allocWithZone:", a3);
  -[CTLazuliMessageGroupFileTransferPush setChatInformation:](v4, "setChatInformation:", self->_chatInformation);
  -[CTLazuliMessageGroupFileTransferPush setDescriptor:](v4, "setDescriptor:", self->_descriptor);
  -[CTLazuliMessageGroupFileTransferPush setMetaData:](v4, "setMetaData:", self->_metaData);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_chatInformation, CFSTR("kChatInformationKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptor, CFSTR("kDescriptorKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metaData, CFSTR("kMetaDataKey"));

}

- (CTLazuliMessageGroupFileTransferPush)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageGroupFileTransferPush *v5;
  uint64_t v6;
  CTLazuliGroupChatInformation *chatInformation;
  uint64_t v8;
  CTLazuliFileTransferDescriptor *descriptor;
  uint64_t v10;
  CTLazuliCustomMetaData *metaData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageGroupFileTransferPush;
  v5 = -[CTLazuliMessageGroupFileTransferPush init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChatInformationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    chatInformation = v5->_chatInformation;
    v5->_chatInformation = (CTLazuliGroupChatInformation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDescriptorKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (CTLazuliFileTransferDescriptor *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMetaDataKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;

  }
  return v5;
}

- (CTLazuliMessageGroupFileTransferPush)initWithReflection:(const void *)a3
{
  CTLazuliMessageGroupFileTransferPush *v4;
  CTLazuliGroupChatInformation *v5;
  CTLazuliGroupChatInformation *chatInformation;
  CTLazuliFileTransferDescriptor *v7;
  CTLazuliFileTransferDescriptor *descriptor;
  CTLazuliCustomMetaData *v9;
  uint64_t v10;
  CTLazuliCustomMetaData *metaData;
  CTLazuliMessageGroupFileTransferPush *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageGroupFileTransferPush;
  v4 = -[CTLazuliMessageGroupFileTransferPush init](&v13, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliGroupChatInformation initWithReflection:]([CTLazuliGroupChatInformation alloc], "initWithReflection:", a3);
  chatInformation = v4->_chatInformation;
  v4->_chatInformation = v5;

  v7 = -[CTLazuliFileTransferDescriptor initWithReflection:]([CTLazuliFileTransferDescriptor alloc], "initWithReflection:", (char *)a3 + 320);
  descriptor = v4->_descriptor;
  v4->_descriptor = v7;

  if (!*((_BYTE *)a3 + 592))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_6;
  }
  v9 = [CTLazuliCustomMetaData alloc];
  if (*((_BYTE *)a3 + 592))
  {
    v10 = -[CTLazuliCustomMetaData initWithReflection:](v9, "initWithReflection:", (char *)a3 + 568);
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v10;
LABEL_6:

    return v4;
  }
  result = (CTLazuliMessageGroupFileTransferPush *)std::__throw_bad_optional_access[abi:nn180100]();
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

- (CTLazuliFileTransferDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
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
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_chatInformation, 0);
}

@end
