@implementation CTLazuliChatBotSuggestedChip

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliChatBotSuggestedChip type](self, "type");
  v6 = -[CTLazuliChatBotSuggestedChip type](self, "type");
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = [%ld - %s]"), v4, print_CTLazuliSuggestedChipType(&v6));
  objc_msgSend(v3, "appendFormat:", CFSTR(", chip {%@} = %@"), objc_opt_class(), self->_chip);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSuggestedChip:(id)a3
{
  char v3;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;

  v5 = a3;
  v6 = -[CTLazuliChatBotSuggestedChip type](self, "type");
  if (v6 == objc_msgSend(v5, "type"))
  {
    -[CTLazuliChatBotSuggestedChip chip](self, "chip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      objc_msgSend(v5, "chip");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v3 = 1;
        goto LABEL_11;
      }
    }
    v9 = -[CTLazuliChatBotSuggestedChip type](self, "type");
    if ((unint64_t)(v9 + 1) < 2)
    {
      -[CTLazuliChatBotSuggestedChip chip](self, "chip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chip");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToCTLazuliChatBotSuggestedReply:", v11);
LABEL_10:
      v3 = v12;

      goto LABEL_11;
    }
    if (v9 == 1)
    {
      -[CTLazuliChatBotSuggestedChip chip](self, "chip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chip");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToCTLazuliChatBotSuggestedAction:", v11);
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
  }
LABEL_11:

  return v3 & 1;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotSuggestedChip *v4;
  CTLazuliChatBotSuggestedChip *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotSuggestedChip *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotSuggestedChip isEqualToCTLazuliChatBotSuggestedChip:](self, "isEqualToCTLazuliChatBotSuggestedChip:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotSuggestedChip *v4;

  v4 = +[CTLazuliChatBotSuggestedChip allocWithZone:](CTLazuliChatBotSuggestedChip, "allocWithZone:", a3);
  -[CTLazuliChatBotSuggestedChip setType:](v4, "setType:", self->_type);
  -[CTLazuliChatBotSuggestedChip setChip:](v4, "setChip:", self->_chip);
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

  objc_msgSend(v5, "encodeObject:forKey:", self->_chip, CFSTR("kChipKey"));
}

- (CTLazuliChatBotSuggestedChip)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotSuggestedChip *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id chip;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotSuggestedChip;
  v5 = -[CTLazuliChatBotSuggestedChip init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "longValue");

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kChipKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    chip = v5->_chip;
    v5->_chip = (id)v11;

  }
  return v5;
}

- (CTLazuliChatBotSuggestedChip)initWithReflection:(const void *)a3
{
  CTLazuliChatBotSuggestedChip *v4;
  int v5;
  CTLazuliChatBotSuggestedAction *v6;
  id v7;
  void *v8;
  CTLazuliChatBotSuggestedReply *v9;
  id chip;
  objc_super v12;
  char v13;
  _BYTE v14[32];
  void *__p[2];
  __int128 v16;
  _OWORD v17[9];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotSuggestedChip;
  v4 = -[CTLazuliChatBotSuggestedChip init](&v12, sel_init);
  if (v4)
  {
    v4->_type = encode_CTLazuliGroupChatParticipantRoleType(a3);
    v5 = *((_DWORD *)a3 + 56);
    if (v5 == 1)
    {
      *(_QWORD *)&v16 = 0;
      *(_OWORD *)__p = 0u;
      memset(v14, 0, sizeof(v14));
      if (*((char *)a3 + 31) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)v14, *((const std::string::value_type **)a3 + 1), *((_QWORD *)a3 + 2));
      }
      else
      {
        *(_OWORD *)v14 = *(_OWORD *)((char *)a3 + 8);
        *(_QWORD *)&v14[16] = *((_QWORD *)a3 + 3);
      }
      std::__optional_copy_base<Lazuli::ChatBotPostbackData,false>::__optional_copy_base[abi:nn180100]((std::string *)&v14[24], (__int128 *)a3 + 2);
      v9 = -[CTLazuliChatBotSuggestedReply initWithReflection:]([CTLazuliChatBotSuggestedReply alloc], "initWithReflection:", v14);
      chip = v4->_chip;
      v4->_chip = v9;

      if ((_BYTE)v16 && SHIBYTE(__p[1]) < 0)
        operator delete(*(void **)&v14[24]);
      if ((v14[23] & 0x80000000) != 0)
      {
        v8 = *(void **)v14;
        goto LABEL_22;
      }
    }
    else if (!v5)
    {
      v18 = 0;
      v16 = 0u;
      memset(v17, 0, sizeof(v17));
      *(_OWORD *)__p = 0u;
      memset(v14, 0, sizeof(v14));
      *(_DWORD *)v14 = *((_DWORD *)a3 + 2);
      if (*((char *)a3 + 39) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&v14[8], *((const std::string::value_type **)a3 + 2), *((_QWORD *)a3 + 3));
      }
      else
      {
        *(_OWORD *)&v14[8] = *((_OWORD *)a3 + 1);
        *(_QWORD *)&v14[24] = *((_QWORD *)a3 + 4);
      }
      std::__optional_copy_base<Lazuli::ChatBotPostbackData,false>::__optional_copy_base[abi:nn180100]((std::string *)__p, (__int128 *)((char *)a3 + 40));
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<Lazuli::SuggestedActionOpenUrlInWebView,Lazuli::SuggestedActionOpenUrlInApplication,Lazuli::SuggestedActionComposeText,Lazuli::SuggestedActionComposeAudioRecording,Lazuli::SuggestedActionComposeVideoRecording,Lazuli::SuggestedActionShowLocation,Lazuli::SuggestedActionRequestLocationPush,Lazuli::SuggestedActionCalendar,Lazuli::SuggestedActionDialVideoCall,Lazuli::SuggestedActionDialEnrichedCall,Lazuli::SuggestedActionDialPhoneNumber,Lazuli::SuggestedActionDevice,Lazuli::SuggestedActionSettings>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v17 + 8, (uint64_t)a3 + 80);
      v6 = -[CTLazuliChatBotSuggestedAction initWithReflection:]([CTLazuliChatBotSuggestedAction alloc], "initWithReflection:", v14);
      v7 = v4->_chip;
      v4->_chip = v6;

      if ((_DWORD)v18 != -1)
        ((void (*)(char *, char *))off_1E1531FE8[v18])(&v13, (char *)v17 + 8);
      LODWORD(v18) = -1;
      if (BYTE8(v16) && SBYTE7(v16) < 0)
        operator delete(__p[0]);
      if ((v14[31] & 0x80000000) != 0)
      {
        v8 = *(void **)&v14[8];
LABEL_22:
        operator delete(v8);
      }
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

- (id)chip
{
  return self->_chip;
}

- (void)setChip:(id)a3
{
  objc_storeStrong(&self->_chip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chip, 0);
}

@end
