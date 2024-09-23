@implementation CNUIContactPropertyIDSHandle

uint64_t __36__CNUIContactPropertyIDSHandle_hash__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "idsID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");

  return v2;
}

uint64_t __40__CNUIContactPropertyIDSHandle_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "idsID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "idsID");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "idsID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "idsID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v3)
    goto LABEL_6;
LABEL_7:

  return v6;
}

- (NSString)idsID
{
  return self->_idsID;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __36__CNUIContactPropertyIDSHandle_hash__block_invoke;
  v3[3] = &unk_1EA603130;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

- (CNUIContactPropertyIDSHandle)initWithContactProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  CNUIContactPropertyIDSHandle *v8;
  uint64_t v9;
  CNContactProperty *contactProperty;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *idsID;
  CNUIContactPropertyIDSHandle *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedContactPropertyKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99768];
    v26 = CFSTR("unsupportedKey");
    objc_msgSend(v4, "key");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, CFSTR("Unsupported key passed to CNUIContactPropertyIDSHandle"), v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v24);
  }
  v25.receiver = self;
  v25.super_class = (Class)CNUIContactPropertyIDSHandle;
  v8 = -[CNUIContactPropertyIDSHandle init](&v25, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v4, "copy");
    contactProperty = v8->_contactProperty;
    v8->_contactProperty = (CNContactProperty *)v9;

    objc_msgSend(v4, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0C967C0]);

    v13 = (void *)objc_opt_class();
    objc_msgSend(v4, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v13, "idsIDForPhoneNumber:", v14);
    else
      objc_msgSend(v13, "idsIDForEmail:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "copy");
    idsID = v8->_idsID;
    v8->_idsID = (NSString *)v16;

    v18 = v8;
  }

  return v8;
}

+ (id)supportedContactPropertyKeys
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C967C0];
  v4[0] = *MEMORY[0x1E0C966A8];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)idsIDForPhoneNumber:(id)a3
{
  uint64_t (*v3)(void *, void *, uint64_t);
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (uint64_t (*)(void *, void *, uint64_t))softLinkIDSCopyIDForPhoneNumberWithOptions;
  v4 = a3;
  objc_msgSend(v4, "digits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)v3(v5, v6, 1);
  return v7;
}

+ (id)idsIDForEmail:(id)a3
{
  return (id)softLinkIDSCopyIDForEmailAddress(a3);
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
  v8[2] = __40__CNUIContactPropertyIDSHandle_isEqual___block_invoke;
  v8[3] = &unk_1EA603108;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v6, v8, 0);

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsID, 0);
  objc_storeStrong((id *)&self->_contactProperty, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIContactPropertyIDSHandle contactProperty](self, "contactProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactProperty"), v4);

  -[CNUIContactPropertyIDSHandle idsID](self, "idsID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("idsID"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CNContactProperty)contactProperty
{
  return self->_contactProperty;
}

@end
