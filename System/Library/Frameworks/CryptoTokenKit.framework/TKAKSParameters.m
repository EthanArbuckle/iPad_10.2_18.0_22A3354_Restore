@implementation TKAKSParameters

- (void)setData:(id)a3 forKey:(unsigned int)a4
{
  id v5;
  NSData *encoded;

  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");

  aks_params_set_data();
  encoded = self->_encoded;
  self->_encoded = 0;

}

- (const)bytes
{
  id v2;
  const void *v3;

  -[TKAKSParameters data](self, "data");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const void *)objc_msgSend(v2, "bytes");

  return v3;
}

- (NSData)data
{
  NSData *encoded;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSData *v7;
  NSData *v8;
  uint64_t v10;
  uint64_t v11;

  encoded = self->_encoded;
  if (!encoded)
  {
    v10 = 0;
    v11 = 0;
    v4 = MEMORY[0x1BCCC4684](self->_params, &v11, &v10);
    if ((_DWORD)v4)
    {
      v5 = v4;
      TK_LOG_sepkey_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[TKAKSParameters data].cold.1();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("failed to get DER-encoded aks_params_t (err=%d)"), v5);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v11, v10);
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    v8 = self->_encoded;
    self->_encoded = v7;

    encoded = self->_encoded;
  }
  return encoded;
}

- (TKAKSParameters)initWithParameters:(id)a3
{
  id v4;
  TKAKSParameters *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TKAKSParameters;
  v5 = -[TKAKSParameters init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "length");
    v5->_params = (aks_params_s *)aks_params_create();
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  aks_params_free();
  v3.receiver = self;
  v3.super_class = (Class)TKAKSParameters;
  -[TKAKSParameters dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[TKAKSParameters data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (TKAKSParameters)init
{
  return -[TKAKSParameters initWithParameters:](self, "initWithParameters:", 0);
}

+ (void)_dumpPlist:(id)a3 into:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  unint64_t v12;
  CFTypeID v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t i;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = v6;
LABEL_26:
    objc_msgSend(v8, "appendString:", v9);
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_retainAutorelease(v6);
    v11 = -[__CFString bytes](v10, "bytes");
    if (-[__CFString length](v10, "length"))
    {
      v12 = 0;
      do
        objc_msgSend(v7, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v11 + v12++));
      while (v12 < -[__CFString length](v10, "length"));
    }

    goto LABEL_27;
  }
  v13 = CFGetTypeID(v6);
  if (v13 == CFBooleanGetTypeID())
  {
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
      v9 = CFSTR("true");
    else
      v9 = CFSTR("false");
LABEL_25:
    v8 = v7;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v6);
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "appendString:", CFSTR("["));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = v6;
    v15 = -[__CFString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      v18 = 1;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((v18 & 1) == 0)
            objc_msgSend(v7, "appendString:", CFSTR(","));
          objc_msgSend(a1, "_dumpPlist:into:", v20, v7);
          v18 = 0;
        }
        v16 = -[__CFString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        v18 = 0;
      }
      while (v16);
    }

    v9 = CFSTR("]");
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "appendString:", CFSTR("{"));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v29 = v6;
    v21 = v6;
    v22 = -[__CFString countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 1;
      v25 = *(_QWORD *)v31;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v21);
          v27 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v26);
          if ((v24 & 1) == 0)
            objc_msgSend(v7, "appendString:", CFSTR(","));
          objc_msgSend(a1, "_dumpPlist:into:", v27, v7);
          objc_msgSend(v7, "appendString:", CFSTR(":"));
          if (_dumpPlist_into__onceToken != -1)
            dispatch_once(&_dumpPlist_into__onceToken, &__block_literal_global_7);
          if (objc_msgSend((id)_dumpPlist_into__deniedKeys, "containsObject:", v27))
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("###"));
          }
          else
          {
            -[__CFString objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_dumpPlist:into:", v28, v7);

          }
          v24 = 0;
          ++v26;
        }
        while (v23 != v26);
        v23 = -[__CFString countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        v24 = 0;
      }
      while (v23);
    }

    objc_msgSend(v7, "appendString:", CFSTR("}"));
    v6 = v29;
  }
LABEL_27:

}

void __35__TKAKSParameters__dumpPlist_into___block_invoke()
{
  void *v0;

  v0 = (void *)_dumpPlist_into__deniedKeys;
  _dumpPlist_into__deniedKeys = (uint64_t)&unk_1E7097878;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v3 = (void *)objc_msgSend(CFSTR("<AKSp:"), "mutableCopy");
  -[TKAKSParameters data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TKTLVRecord recordFromData:](TKBERTLVRecord, "recordFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_dumpPlist:into:", v6, v3);
  }
  else
  {
    -[TKAKSParameters data](self, "data");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "bytes");

    -[TKAKSParameters data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v11 = 0;
      do
      {
        objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v8 + v11++));
        -[TKAKSParameters data](self, "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

      }
      while (v11 < v13);
    }
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (void)setNumber:(int64_t)a3 forKey:(unsigned int)a4
{
  NSData *encoded;

  aks_params_set_number();
  encoded = self->_encoded;
  self->_encoded = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoded, 0);
}

- (void)data
{
  os_log_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12_1();
  _os_log_error_impl(&dword_1B9768000, v0, OS_LOG_TYPE_ERROR, "failed to get DER-encoded aks_params_t (err=%d)", v1, 8u);
  OUTLINED_FUNCTION_8();
}

@end
