@implementation CTLazuliChatBotMenuL1Content

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTLazuliChatBotMenuL1Content type](self, "type");
  v6 = -[CTLazuliChatBotMenuL1Content type](self, "type");
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = [%ld - %s]"), v4, print_CTLazuliMenuL1ContentType(&v6));
  objc_msgSend(v3, "appendFormat:", CFSTR(", item {%@} = %@"), objc_opt_class(), self->_item);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMenuL1Content:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v4 = a3;
  v5 = -[CTLazuliChatBotMenuL1Content type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    v6 = -[CTLazuliChatBotMenuL1Content type](self, "type");
    if (v6 == 1)
    {
      objc_msgSend(v4, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTLazuliChatBotMenuL1Content item](self, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToCTLazuliChatBotMenuL2:", v8);
    }
    else
    {
      if (v6)
      {
        v10 = 1;
        goto LABEL_9;
      }
      objc_msgSend(v4, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTLazuliChatBotMenuL1Content item](self, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToCTLazuliChatBotSuggestedChip:", v8);
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }
LABEL_9:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotMenuL1Content *v4;
  CTLazuliChatBotMenuL1Content *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotMenuL1Content *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotMenuL1Content isEqualToCTLazuliChatBotMenuL1Content:](self, "isEqualToCTLazuliChatBotMenuL1Content:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotMenuL1Content *v4;

  v4 = +[CTLazuliChatBotMenuL1Content allocWithZone:](CTLazuliChatBotMenuL1Content, "allocWithZone:", a3);
  -[CTLazuliChatBotMenuL1Content setType:](v4, "setType:", self->_type);
  -[CTLazuliChatBotMenuL1Content setItem:](v4, "setItem:", self->_item);
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

  objc_msgSend(v5, "encodeObject:forKey:", self->_item, CFSTR("kItemKey"));
}

- (CTLazuliChatBotMenuL1Content)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotMenuL1Content *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id item;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotMenuL1Content;
  v5 = -[CTLazuliChatBotMenuL1Content init](&v14, sel_init);
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kItemKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    item = v5->_item;
    v5->_item = (id)v11;

  }
  return v5;
}

- (CTLazuliChatBotMenuL1Content)initWithReflection:(const void *)a3
{
  CTLazuliChatBotMenuL1Content *v4;
  int v5;
  int v6;
  CTLazuliChatBotSuggestedChip *v7;
  id v8;
  CTLazuliChatBotMenuL2 *v9;
  id item;
  objc_super v12;
  void **v13;
  _BYTE v14[32];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotMenuL1Content;
  v4 = -[CTLazuliChatBotMenuL1Content init](&v12, sel_init);
  if (v4)
  {
    v4->_type = encode_CTLazuliGroupChatParticipantRoleType(a3);
    v5 = *((_DWORD *)a3 + 60);
    if (v5 == 1)
    {
      v15 = 0u;
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
      *(_QWORD *)&v14[24] = 0;
      v15 = 0uLL;
      std::vector<Lazuli::ChatBotMenuL2Content>::__init_with_size[abi:nn180100]<Lazuli::ChatBotMenuL2Content*,Lazuli::ChatBotMenuL2Content*>(&v14[24], *((_QWORD *)a3 + 4), *((_QWORD *)a3 + 5), 0x34F72C234F72C235 * ((uint64_t)(*((_QWORD *)a3 + 5) - *((_QWORD *)a3 + 4)) >> 3));
      v9 = -[CTLazuliChatBotMenuL2 initWithReflection:]([CTLazuliChatBotMenuL2 alloc], "initWithReflection:", v14);
      item = v4->_item;
      v4->_item = v9;

      v13 = (void **)&v14[24];
      std::vector<Lazuli::ChatBotMenuL2Content>::__destroy_vector::operator()[abi:nn180100](&v13);
      if ((v14[23] & 0x80000000) != 0)
        operator delete(*(void **)v14);
    }
    else if (!v5)
    {
      v27 = 0;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v15 = 0u;
      v6 = *((_DWORD *)a3 + 2);
      memset(v14, 0, sizeof(v14));
      *(_DWORD *)v14 = v6;
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<Lazuli::ChatBotSuggestedAction,Lazuli::ChatBotSuggestedReply>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v14[8], (uint64_t)a3 + 16);
      v7 = -[CTLazuliChatBotSuggestedChip initWithReflection:]([CTLazuliChatBotSuggestedChip alloc], "initWithReflection:", v14);
      v8 = v4->_item;
      v4->_item = v7;

      if ((_DWORD)v27 != -1)
        ((void (*)(void ***, _BYTE *))off_1E15320B8[v27])(&v13, &v14[8]);
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

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong(&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_item, 0);
}

@end
