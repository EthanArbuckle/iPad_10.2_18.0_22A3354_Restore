@implementation MFStringTransform

- (MFStringTransform)init
{
  __assert_rtn("-[MFStringTransform init]", "MFStringTransform.m", 28, "0");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFStringTransform;
  return -[MFStringTransform init](&v3, sel_init);
}

- (MFStringTransform)initWithSoftBankHexData:(id)a3
{
  id v4;
  MFStringTransform *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  void *v23;
  void **v24;
  MFStringTransform *v25;
  objc_super v27;
  _BYTE v28[16];
  uint8_t v29[8];
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, int);
  void *v32;
  uint8_t *v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MFStringTransform;
  v5 = -[MFStringTransform init](&v27, sel_init);
  if (!v5)
    goto LABEL_37;
  v6 = v4;
  v7 = (void *)MEMORY[0x1AF433BF4]();
  if (!v6)
  {
    v12 = 0;
    goto LABEL_16;
  }
  *(_QWORD *)v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(id *)v29;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      MFLogGeneral();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v11;
        _os_log_impl(&dword_1ABB13000, v10, OS_LOG_TYPE_INFO, "MFStringTransform: Found %u hex values.", buf, 8u);
      }

      v12 = v8;
      goto LABEL_15;
    }
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      -[MFStringTransform initWithSoftBankHexData:].cold.3(v14, (uint64_t)v28, v13);
    }
  }
  else
  {
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MFStringTransform initWithSoftBankHexData:].cold.2((uint64_t)v9, v13);
  }

  v12 = 0;
LABEL_15:

LABEL_16:
  objc_autoreleasePoolPop(v7);

  v15 = v12;
  v16 = (void *)MEMORY[0x1AF433BF4]();
  if (!v15)
  {
    v18 = 0;
    goto LABEL_33;
  }
  if (objc_msgSend(v15, "count"))
  {
    if ((unint64_t)objc_msgSend(v15, "count") < 0x186A1)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 20 * objc_msgSend(v15, "count"));
      v36 = 0u;
      v37 = 0u;
      *(_OWORD *)buf = 0u;
      v35 = 0u;
      v17 = v15;
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", buf, v29, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(v18, "appendFormat:", CFSTR("\\u%@ > \\ufffd; "), *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * i));
          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", buf, v29, 16);
        }
        while (v19);
      }
      goto LABEL_32;
    }
    MFLogGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MFStringTransform initWithSoftBankHexData:].cold.1();
  }
  else
  {
    MFLogGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1ABB13000, v17, OS_LOG_TYPE_INFO, "MFStringTransform: Empty hex values found.", v29, 2u);
    }
  }
  v18 = 0;
LABEL_32:

LABEL_33:
  objc_autoreleasePoolPop(v16);

  v22 = v18;
  v23 = (void *)MEMORY[0x1AF433BF4]();
  if (v22)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&v35 = 0x2020000000;
    *((_QWORD *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __createTransliterator_block_invoke;
    v32 = &unk_1E5AA17B8;
    v33 = buf;
    withMutableCharacters(v22, v29);
    v24 = *(void ***)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v24 = 0;
  }
  objc_autoreleasePoolPop(v23);

  v5->_underlying = v24;
  if (!v5->_underlying)
  {
    v25 = 0;
    goto LABEL_39;
  }
LABEL_37:
  v25 = v5;
LABEL_39:

  return v25;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_underlying)
  {
    utrans_close();
    self->_underlying = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)MFStringTransform;
  -[MFStringTransform dealloc](&v3, sel_dealloc);
}

+ (id)identityTransform
{
  return -[MFStringTransform _init]([MFStringTransform alloc], "_init");
}

- (void)initWithSoftBankHexData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1ABB13000, v0, v1, "MFStringTransform: Number of hex values out of bounds.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithSoftBankHexData:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1ABB13000, a2, OS_LOG_TYPE_ERROR, "MFStringTransform: Unable to parse hex values data: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithSoftBankHexData:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_error_impl(&dword_1ABB13000, a3, OS_LOG_TYPE_ERROR, "MFStringTransform: hex values of unexpected type '%{public}@'.", (uint8_t *)a2, 0xCu);

}

@end
