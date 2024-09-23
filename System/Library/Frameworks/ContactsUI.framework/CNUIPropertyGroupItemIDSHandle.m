@implementation CNUIPropertyGroupItemIDSHandle

- (NSString)_cnui_IDSIDRepresentation
{
  void *v2;
  void *v3;

  -[CNUIPropertyGroupItemIDSHandle contactPropertyHandle](self, "contactPropertyHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cnui_IDSIDRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

uint64_t __38__CNUIPropertyGroupItemIDSHandle_hash__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "contactPropertyHandle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");

  return v2;
}

uint64_t __42__CNUIPropertyGroupItemIDSHandle_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "contactPropertyHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "contactPropertyHandle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "contactPropertyHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contactPropertyHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

- (CNUIContactPropertyIDSHandle)contactPropertyHandle
{
  return self->_contactPropertyHandle;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __38__CNUIPropertyGroupItemIDSHandle_hash__block_invoke;
  v3[3] = &unk_1E204ED08;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__CNUIPropertyGroupItemIDSHandle_isEqual___block_invoke;
  v8[3] = &unk_1E2050050;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v6, v8, 0);

  return (char)self;
}

+ (BOOL)supportsPropertyGroupItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = (void *)MEMORY[0x1E0D13C98];
  v4 = a3;
  objc_msgSend(v3, "supportedContactPropertyKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "containsObject:", v7);

  return v8;
}

- (CNUIPropertyGroupItemIDSHandle)initWithPropertyGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  CNUIPropertyGroupItemIDSHandle *v9;
  uint64_t v10;
  CNContactProperty *contactProperty;
  id v12;
  void *v13;
  uint64_t v14;
  CNUIContactPropertyIDSHandle *contactPropertyHandle;
  CNUIPropertyGroupItemIDSHandle *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  objc_super v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13C98], "supportedContactPropertyKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "containsObject:", v7);

  if ((v8 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v23 = CFSTR("groupItem");
    v24[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, CFSTR("Unsupported property group item"), v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)CNUIPropertyGroupItemIDSHandle;
  v9 = -[CNUIPropertyGroupItemIDSHandle init](&v22, sel_init);
  if (v9)
  {
    objc_msgSend(v4, "contactProperty");
    v10 = objc_claimAutoreleasedReturnValue();
    contactProperty = v9->_contactProperty;
    v9->_contactProperty = (CNContactProperty *)v10;

    v12 = objc_alloc(MEMORY[0x1E0D13C98]);
    objc_msgSend(v4, "contactProperty");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithContactProperty:", v13);
    contactPropertyHandle = v9->_contactPropertyHandle;
    v9->_contactPropertyHandle = (CNUIContactPropertyIDSHandle *)v14;

    v16 = v9;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIPropertyGroupItemIDSHandle contactPropertyHandle](self, "contactPropertyHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("handle"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CNContactProperty)contactProperty
{
  return self->_contactProperty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPropertyHandle, 0);
  objc_storeStrong((id *)&self->_contactProperty, 0);
}

+ (BOOL)isSupportedGroupItem:(id)a3
{
  return CNUIPropertyGroupItemIDSHandleSupported_block_invoke_2((uint64_t)a1, a3);
}

@end
