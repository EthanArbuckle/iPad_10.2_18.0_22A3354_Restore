@implementation CTLazuliMessageFileTransferPush

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageFileTransferPush descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", descriptor = %@"), v4);

  -[CTLazuliMessageFileTransferPush chipList](self, "chipList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chipList = %@"), v5);

  -[CTLazuliMessageFileTransferPush metaData](self, "metaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metaData = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageFileTransferPush:(id)a3
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
  -[CTLazuliMessageFileTransferPush descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToCTLazuliFileTransferDescriptor:", v8))
  {
    v10 = 0;
    goto LABEL_17;
  }
  -[CTLazuliMessageFileTransferPush chipList](self, "chipList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v6, "chipList"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliMessageFileTransferPush chipList](self, "chipList");
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
  -[CTLazuliMessageFileTransferPush metaData](self, "metaData");
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
  -[CTLazuliMessageFileTransferPush metaData](self, "metaData");
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
  CTLazuliMessageFileTransferPush *v4;
  CTLazuliMessageFileTransferPush *v5;
  BOOL v6;

  v4 = (CTLazuliMessageFileTransferPush *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageFileTransferPush isEqualToCTLazuliMessageFileTransferPush:](self, "isEqualToCTLazuliMessageFileTransferPush:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageFileTransferPush *v4;

  v4 = +[CTLazuliMessageFileTransferPush allocWithZone:](CTLazuliMessageFileTransferPush, "allocWithZone:", a3);
  -[CTLazuliMessageFileTransferPush setDescriptor:](v4, "setDescriptor:", self->_descriptor);
  -[CTLazuliMessageFileTransferPush setChipList:](v4, "setChipList:", self->_chipList);
  -[CTLazuliMessageFileTransferPush setMetaData:](v4, "setMetaData:", self->_metaData);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptor, CFSTR("kDescriptorKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chipList, CFSTR("kChipListKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metaData, CFSTR("kMetaDataKey"));

}

- (CTLazuliMessageFileTransferPush)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageFileTransferPush *v5;
  uint64_t v6;
  CTLazuliFileTransferDescriptor *descriptor;
  uint64_t v8;
  CTLazuliChatBotSuggestedChipList *chipList;
  uint64_t v10;
  CTLazuliCustomMetaData *metaData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliMessageFileTransferPush;
  v5 = -[CTLazuliMessageFileTransferPush init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDescriptorKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (CTLazuliFileTransferDescriptor *)v6;

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

- (CTLazuliMessageFileTransferPush)initWithReflection:(const void *)a3
{
  CTLazuliMessageFileTransferPush *v4;
  CTLazuliFileTransferDescriptor *v5;
  CTLazuliFileTransferDescriptor *descriptor;
  CTLazuliChatBotSuggestedChipList *v7;
  uint64_t v8;
  CTLazuliChatBotSuggestedChipList *chipList;
  CTLazuliCustomMetaData *v10;
  uint64_t v11;
  CTLazuliCustomMetaData *metaData;
  CTLazuliMessageFileTransferPush *result;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CTLazuliMessageFileTransferPush;
  v4 = -[CTLazuliMessageFileTransferPush init](&v14, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliFileTransferDescriptor initWithReflection:]([CTLazuliFileTransferDescriptor alloc], "initWithReflection:", a3);
  descriptor = v4->_descriptor;
  v4->_descriptor = v5;

  if (*((_BYTE *)a3 + 272))
  {
    v7 = [CTLazuliChatBotSuggestedChipList alloc];
    if (!*((_BYTE *)a3 + 272))
      goto LABEL_12;
    v8 = -[CTLazuliChatBotSuggestedChipList initWithReflection:](v7, "initWithReflection:", (char *)a3 + 248);
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v8;
  }
  else
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
  }

  if (!*((_BYTE *)a3 + 304))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_10;
  }
  v10 = [CTLazuliCustomMetaData alloc];
  if (*((_BYTE *)a3 + 304))
  {
    v11 = -[CTLazuliCustomMetaData initWithReflection:](v10, "initWithReflection:", (char *)a3 + 280);
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v11;
LABEL_10:

    return v4;
  }
LABEL_12:
  result = (CTLazuliMessageFileTransferPush *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliFileTransferDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
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
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
