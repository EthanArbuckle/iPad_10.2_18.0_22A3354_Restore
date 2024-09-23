@implementation ASDCellularIdentity

+ (id)identityForSubscription:(id)a3 usingClient:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (!v7)
    goto LABEL_11;
  if (!v8)
    goto LABEL_11;
  v19 = 0;
  v11 = (void *)objc_msgSend(v8, "copySIMIdentity:error:", v7, &v19);
  v10 = v19;
  if (!v11)
    goto LABEL_11;
  if (objc_msgSend(v11, "length"))
  {
    v18 = v10;
    objc_msgSend(v9, "getDataStatus:error:", v7, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    v14 = v12 ? objc_msgSend(v12, "inHomeCountry") ^ 1 : 0;
    v15 = -[ASDCellularIdentity initWithSIMIdentity:roaming:]([ASDCellularIdentity alloc], v11, v14);

    v10 = v13;
  }
  else
  {
    objc_msgSend(a1, "nullIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v15)
  {
LABEL_11:
    ASDLogHandleForCategory(12);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_error_impl(&dword_19A03B000, v16, OS_LOG_TYPE_ERROR, "[Cellular] Returning 'null' identity after error occurred: %{public}@", buf, 0xCu);
    }

    objc_msgSend(a1, "nullIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)initWithSIMIdentity:(char)a3 roaming:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  unsigned __int8 md[16];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = a2;
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = objc_retainAutorelease(v6);
  CC_MD5((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
    objc_msgSend(v8, "appendFormat:", CFSTR("%02x"), md[i]);
  v10 = (void *)objc_msgSend(v8, "copy");

  v11 = -[ASDCellularIdentity initWithSIMIdentity:roaming:defaultsKey:](a1, v5, a3, v10);
  v12 = v11;

  return v12;
}

- (id)initWithSIMIdentity:(char)a3 roaming:(void *)a4 defaultsKey:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)ASDCellularIdentity;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v9;

      *((_BYTE *)a1 + 8) = a3;
      v11 = objc_msgSend(v8, "copy");
      v12 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v11;

    }
  }

  return a1;
}

+ (id)nullIdentity
{
  return -[ASDCellularIdentity initWithSIMIdentity:roaming:](objc_alloc((Class)a1), CFSTR("00000000000000000000"), 0);
}

- (id)copyWithRoaming:(BOOL)a3
{
  return -[ASDCellularIdentity initWithSIMIdentity:roaming:defaultsKey:]([ASDCellularIdentity alloc], self->_simIdentity, a3, self->_defaultsKey);
}

- (id)description
{
  uint64_t v4;

  if (os_variant_has_internal_content())
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ASDCellularIdentity %p; sim = %@; key = %@ }"),
      self,
      self->_simIdentity,
      self->_defaultsKey);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ASDCellularIdentity %p; sim = <private>; key = %@ }"),
      self,
      self->_defaultsKey,
      v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)defaultsKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isRoaming
{
  return self->_roaming;
}

- (NSString)simIdentity
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simIdentity, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
}

@end
