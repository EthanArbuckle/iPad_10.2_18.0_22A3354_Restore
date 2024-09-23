@implementation CTLazuliMessageEnvelope

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  int64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliMessageEnvelope type](self, "type");
  v8 = -[CTLazuliMessageEnvelope type](self, "type");
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = [%ld - %s]"), v4, print_CTLazuliMessageType(&v8));
  -[CTLazuliMessageEnvelope from](self, "from");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", from = %@"), v5);

  -[CTLazuliMessageEnvelope messageID](self, "messageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messageID = %@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", content {%@} = %@"), objc_opt_class(), self->_content);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageEnvelope:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  v5 = -[CTLazuliMessageEnvelope type](self, "type");
  if (v5 != objc_msgSend(v4, "type"))
    goto LABEL_6;
  -[CTLazuliMessageEnvelope from](self, "from");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "from");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToCTLazuliDestination:", v7);

  if ((v8 & 1) == 0)
    goto LABEL_6;
  -[CTLazuliMessageEnvelope messageID](self, "messageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToCTLazuliMessageID:", v10);

  if ((v11 & 1) != 0)
  {
    switch(self->_type)
    {
      case 0:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageText:", v13);
        goto LABEL_17;
      case 1:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageGroupText:", v13);
        goto LABEL_17;
      case 2:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageGeoLocationPush:", v13);
        goto LABEL_17;
      case 3:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageGroupGeoLocationPush:", v13);
        goto LABEL_17;
      case 4:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageFileTransferPush:", v13);
        goto LABEL_17;
      case 5:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageGroupFileTransferPush:", v13);
        goto LABEL_17;
      case 6:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageChatBotCard:", v13);
        goto LABEL_17;
      case 7:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageChatBotCardCarousel:", v13);
        goto LABEL_17;
      case 8:
        -[CTLazuliMessageEnvelope content](self, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToCTLazuliMessageIncomingGroupChat:", v13);
LABEL_17:
        v15 = v14;

        break;
      default:
        v15 = 1;
        break;
    }
  }
  else
  {
LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageEnvelope *v4;
  CTLazuliMessageEnvelope *v5;
  BOOL v6;

  v4 = (CTLazuliMessageEnvelope *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageEnvelope isEqualToCTLazuliMessageEnvelope:](self, "isEqualToCTLazuliMessageEnvelope:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageEnvelope *v4;

  v4 = +[CTLazuliMessageEnvelope allocWithZone:](CTLazuliMessageEnvelope, "allocWithZone:", a3);
  -[CTLazuliMessageEnvelope setType:](v4, "setType:", self->_type);
  -[CTLazuliMessageEnvelope setFrom:](v4, "setFrom:", self->_from);
  -[CTLazuliMessageEnvelope setMessageID:](v4, "setMessageID:", self->_messageID);
  -[CTLazuliMessageEnvelope setContent:](v4, "setContent:", self->_content);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kTypeKey"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_from, CFSTR("kFromKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageID, CFSTR("kMessageIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_content, CFSTR("kContentKey"));

}

- (CTLazuliMessageEnvelope)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageEnvelope *v5;
  void *v6;
  uint64_t v7;
  CTLazuliDestination *from;
  uint64_t v9;
  CTLazuliMessageID *messageID;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id content;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CTLazuliMessageEnvelope;
  v5 = -[CTLazuliMessageEnvelope init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFromKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    from = v5->_from;
    v5->_from = (CTLazuliDestination *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMessageIDKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    messageID = v5->_messageID;
    v5->_messageID = (CTLazuliMessageID *)v9;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v22, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kContentKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (id)v19;

  }
  return v5;
}

- (CTLazuliMessageEnvelope)initWithReflection:(const void *)a3
{
  CTLazuliMessageEnvelope *v4;
  CTLazuliDestination *v5;
  CTLazuliDestination *from;
  CTLazuliMessageID *v7;
  CTLazuliMessageID *messageID;
  id v9;
  CTLazuliMessageGeoLocationPush *v10;
  id v11;
  void *v12;
  CTLazuliMessageGroupGeoLocationPush *v13;
  id v14;
  CTLazuliMessageFileTransferPush *v15;
  id v16;
  CTLazuliMessageGroupFileTransferPush *v17;
  id v18;
  CTLazuliMessageChatBotCard *v19;
  id v20;
  CTLazuliMessageChatBotCardCarousel *v21;
  id v22;
  CTLazuliMessageIncomingGroupChat *v23;
  id v24;
  CTLazuliMessageText *v25;
  id content;
  CTLazuliMessageGroupText *v27;
  id v28;
  void *__p[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50[2];
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  objc_super v54;
  void **v55;

  v54.receiver = self;
  v54.super_class = (Class)CTLazuliMessageEnvelope;
  v4 = -[CTLazuliMessageEnvelope init](&v54, sel_init);
  if (v4)
  {
    v4->_type = encode_CTLazuliMessageType((unsigned int *)a3);
    v5 = -[CTLazuliDestination initWithReflection:]([CTLazuliDestination alloc], "initWithReflection:", (char *)a3 + 8);
    from = v4->_from;
    v4->_from = v5;

    v7 = -[CTLazuliMessageID initWithReflection:]([CTLazuliMessageID alloc], "initWithReflection:", (char *)a3 + 120);
    messageID = v4->_messageID;
    v4->_messageID = v7;

    switch(*((_DWORD *)a3 + 188))
    {
      case 0:
        *(_QWORD *)&v35 = 0;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        *(_OWORD *)__p = 0u;
        if (*((char *)a3 + 175) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)__p, *((const std::string::value_type **)a3 + 19), *((_QWORD *)a3 + 20));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)((char *)a3 + 152);
          *(_QWORD *)&v31 = *((_QWORD *)a3 + 21);
        }
        std::__optional_copy_base<Lazuli::ChatBotSuggestedChipList,false>::__optional_copy_base[abi:nn180100]((uint64_t)&v31 + 8, (uint64_t)a3 + 176);
        std::__optional_copy_base<Lazuli::CustomMetaData,false>::__optional_copy_base[abi:nn180100]((std::string *)((char *)&v33 + 8), (uint64_t)a3 + 208);
        v25 = -[CTLazuliMessageText initWithReflection:]([CTLazuliMessageText alloc], "initWithReflection:", __p);
        content = v4->_content;
        v4->_content = v25;

        if ((_BYTE)v35)
        {
          v55 = (void **)&v33 + 1;
          std::vector<Lazuli::CustomMetaDataWrapper>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if ((_BYTE)v33)
        {
          v55 = (void **)&v31 + 1;
          std::vector<Lazuli::ChatBotSuggestedChip>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if (SBYTE7(v31) < 0)
        {
          v12 = __p[0];
          goto LABEL_29;
        }
        return v4;
      case 1:
        v53 = 0;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        *(_OWORD *)v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        *(_OWORD *)__p = 0u;
        Lazuli::GroupChatInformation::GroupChatInformation((Lazuli::GroupChatInformation *)__p, (const Lazuli::GroupChatInformation *)((char *)a3 + 152));
        if (*((char *)a3 + 495) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)v50, *((const std::string::value_type **)a3 + 59), *((_QWORD *)a3 + 60));
        }
        else
        {
          *(_OWORD *)v50 = *(_OWORD *)((char *)a3 + 472);
          *(_QWORD *)&v51 = *((_QWORD *)a3 + 61);
        }
        std::__optional_copy_base<Lazuli::CustomMetaData,false>::__optional_copy_base[abi:nn180100]((std::string *)((char *)&v51 + 8), (uint64_t)a3 + 496);
        v27 = -[CTLazuliMessageGroupText initWithReflection:]([CTLazuliMessageGroupText alloc], "initWithReflection:", __p);
        v28 = v4->_content;
        v4->_content = v27;

        if ((_BYTE)v53)
        {
          v55 = (void **)&v51 + 1;
          std::vector<Lazuli::CustomMetaDataWrapper>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if (SBYTE7(v51) < 0)
          operator delete(v50[0]);
        goto LABEL_35;
      case 2:
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        *(_OWORD *)__p = *(_OWORD *)((char *)a3 + 152);
        std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:nn180100]((std::string *)&v31, (__int128 *)((char *)a3 + 168));
        std::__optional_copy_base<Lazuli::ChatBotSuggestedChipList,false>::__optional_copy_base[abi:nn180100]((uint64_t)&v33, (uint64_t)a3 + 200);
        std::__optional_copy_base<Lazuli::CustomMetaData,false>::__optional_copy_base[abi:nn180100]((std::string *)&v35, (uint64_t)a3 + 232);
        v10 = -[CTLazuliMessageGeoLocationPush initWithReflection:]([CTLazuliMessageGeoLocationPush alloc], "initWithReflection:", __p);
        v11 = v4->_content;
        v4->_content = v10;

        if (BYTE8(v36))
        {
          v55 = (void **)&v35;
          std::vector<Lazuli::CustomMetaDataWrapper>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if (BYTE8(v34))
        {
          v55 = (void **)&v33;
          std::vector<Lazuli::ChatBotSuggestedChip>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        if (BYTE8(v32) && SBYTE7(v32) < 0)
        {
          v12 = (void *)v31;
LABEL_29:
          operator delete(v12);
        }
        return v4;
      case 3:
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        *(_OWORD *)v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        *(_OWORD *)__p = 0u;
        Lazuli::GroupChatInformation::GroupChatInformation((Lazuli::GroupChatInformation *)__p, (const Lazuli::GroupChatInformation *)((char *)a3 + 152));
        *(_OWORD *)v50 = *(_OWORD *)((char *)a3 + 472);
        std::__optional_copy_base<Lazuli::CustomMetaData,false>::__optional_copy_base[abi:nn180100]((std::string *)&v51, (uint64_t)a3 + 488);
        v13 = -[CTLazuliMessageGroupGeoLocationPush initWithReflection:]([CTLazuliMessageGroupGeoLocationPush alloc], "initWithReflection:", __p);
        v14 = v4->_content;
        v4->_content = v13;

        if (BYTE8(v52))
        {
          v55 = (void **)&v51;
          std::vector<Lazuli::CustomMetaDataWrapper>::__destroy_vector::operator()[abi:nn180100](&v55);
        }
        goto LABEL_35;
      case 4:
        *(_QWORD *)&v49 = 0;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        *(_OWORD *)__p = 0u;
        Lazuli::MessageFileTransferPush::MessageFileTransferPush((Lazuli::MessageFileTransferPush *)__p, (const Lazuli::MessageFileTransferPush *)((char *)a3 + 152));
        v15 = -[CTLazuliMessageFileTransferPush initWithReflection:]([CTLazuliMessageFileTransferPush alloc], "initWithReflection:", __p);
        v16 = v4->_content;
        v4->_content = v15;

        Lazuli::MessageFileTransferPush::~MessageFileTransferPush((Lazuli::MessageFileTransferPush *)__p);
        return v4;
      case 5:
        bzero(__p, 0x258uLL);
        Lazuli::MessageGroupFileTransferPush::MessageGroupFileTransferPush((Lazuli::MessageGroupFileTransferPush *)__p, (const Lazuli::MessageGroupFileTransferPush *)((char *)a3 + 152));
        v17 = -[CTLazuliMessageGroupFileTransferPush initWithReflection:]([CTLazuliMessageGroupFileTransferPush alloc], "initWithReflection:", __p);
        v18 = v4->_content;
        v4->_content = v17;

        Lazuli::MessageGroupFileTransferPush::~MessageGroupFileTransferPush((Lazuli::MessageGroupFileTransferPush *)__p);
        return v4;
      case 6:
        *(_QWORD *)&v52 = 0;
        *(_OWORD *)v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        *(_OWORD *)__p = 0u;
        v31 = 0u;
        Lazuli::MessageChatBotCard::MessageChatBotCard((Lazuli::MessageChatBotCard *)__p, (const Lazuli::MessageChatBotCard *)((char *)a3 + 152));
        v19 = -[CTLazuliMessageChatBotCard initWithReflection:]([CTLazuliMessageChatBotCard alloc], "initWithReflection:", __p);
        v20 = v4->_content;
        v4->_content = v19;

        Lazuli::MessageChatBotCard::~MessageChatBotCard((Lazuli::MessageChatBotCard *)__p);
        return v4;
      case 7:
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        *(_OWORD *)__p = 0u;
        Lazuli::MessageChatBotCardCarousel::MessageChatBotCardCarousel((Lazuli::MessageChatBotCardCarousel *)__p, (const Lazuli::MessageChatBotCardCarousel *)((char *)a3 + 152));
        v21 = -[CTLazuliMessageChatBotCardCarousel initWithReflection:]([CTLazuliMessageChatBotCardCarousel alloc], "initWithReflection:", __p);
        v22 = v4->_content;
        v4->_content = v21;

        Lazuli::MessageChatBotCardCarousel::~MessageChatBotCardCarousel((Lazuli::MessageChatBotCardCarousel *)__p);
        return v4;
      case 8:
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        *(_OWORD *)__p = 0u;
        v31 = 0u;
        Lazuli::GroupChatInformation::GroupChatInformation((Lazuli::GroupChatInformation *)__p, (const Lazuli::GroupChatInformation *)((char *)a3 + 152));
        v23 = -[CTLazuliMessageIncomingGroupChat initWithReflection:]([CTLazuliMessageIncomingGroupChat alloc], "initWithReflection:", __p);
        v24 = v4->_content;
        v4->_content = v23;

LABEL_35:
        Lazuli::GroupChatInformation::~GroupChatInformation(__p);
        break;
      default:
        v9 = v4->_content;
        v4->_content = 0;

        break;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CTLazuliDestination)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_storeStrong((id *)&self->_from, a3);
}

- (CTLazuliMessageID)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_messageID, a3);
}

- (id)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong(&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_content, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_from, 0);
}

@end
