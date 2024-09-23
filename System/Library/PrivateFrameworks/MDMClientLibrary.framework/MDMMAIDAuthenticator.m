@implementation MDMMAIDAuthenticator

- (MDMMAIDAuthenticator)initWithRMAccountID:(id)a3
{
  id v5;
  MDMMAIDAuthenticator *v6;
  MDMMAIDAuthenticator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDMMAIDAuthenticator;
  v6 = -[MDMMAIDAuthenticator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rmAccountID, a3);

  return v7;
}

- (BOOL)authenticateRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  _BYTE buf[24];
  void *v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[MDMMAIDAuthenticator rmAccountID](self, "rmAccountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMAccountUtilities maidPropertiesForRMAccountID:](MDMAccountUtilities, "maidPropertiesForRMAccountID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = v7;
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __sortKeysAndMakeCommaSeparatedString_block_invoke;
  v41 = &unk_1E9852B28;
  v42 = v10;
  v11 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", buf);

  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v13, *MEMORY[0x1E0D1C050]);
  objc_msgSend(v5, "ak_addDeviceUDIDHeader");
  objc_msgSend(v5, "ak_addClientInfoHeader");
  objc_msgSend(v5, "ak_addDeviceSerialNumberHeader");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D1C068]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D1C080]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 && v15)
  {
    v17 = v15;
    if (coerceIntoString_onceToken != -1)
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_76);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "stringValue");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)coerceIntoString_dateFormatter, "stringFromDate:", v17);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
          else
            objc_msgSend(v17, "description");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v20 = v18;

    v21 = v14;
    if (coerceIntoString_onceToken != -1)
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_76);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v21;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v21, "stringValue");
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)coerceIntoString_dateFormatter, "stringFromDate:", v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
          else
            objc_msgSend(v21, "description");
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v23 = v22;

    objc_msgSend(v5, "ak_addAuthorizationHeaderWithServiceToken:forAltDSID:", v20, v23);
  }
  else
  {
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1D4BF7000, v19, OS_LOG_TYPE_ERROR, "Missing short-lived token details for RM account: altDSID: %{public}@, token: %{public}@", buf, 0x16u);
    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D1C070]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D1C078]);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v24 && v25)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = v24;
    if (coerceIntoString_onceToken != -1)
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_76);
    objc_opt_class();
    v39 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v28;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v28, "stringValue");
        v29 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)coerceIntoString_dateFormatter, "stringFromDate:", v28);
          v29 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v28, "base64EncodedStringWithOptions:", 0);
          else
            objc_msgSend(v28, "description");
          v29 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v31 = v29;

    v32 = v26;
    if (coerceIntoString_onceToken != -1)
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_76);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v32;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v32, "stringValue");
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)coerceIntoString_dateFormatter, "stringFromDate:", v32);
          v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v32, "base64EncodedStringWithOptions:", 0);
          else
            objc_msgSend(v32, "description");
          v33 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v34 = v33;

    objc_msgSend(v39, "stringWithFormat:", CFSTR("%@:%@"), v31, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "dataUsingEncoding:", 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "base64EncodedStringWithOptions:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v37, *MEMORY[0x1E0D1C060]);

  }
  else
  {
    v30 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v26;
      _os_log_impl(&dword_1D4BF7000, v30, OS_LOG_TYPE_ERROR, "Missing long-lived token details for RM account: dsid: %{public}@, token: %{public}@", buf, 0x16u);
    }
  }

  return 1;
}

- (BOOL)prepareTask:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MDMMAIDAuthenticator _appleIDContext](self, "_appleIDContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setAppleIDContext:", v6);

  }
  return 1;
}

- (id)_appleIDContext
{
  id v3;
  void *v4;

  if (_appleIDContext_onceToken != -1)
    dispatch_once(&_appleIDContext_onceToken, &__block_literal_global_4);
  v3 = (id)_appleIDContext_lock;
  objc_sync_enter(v3);
  objc_getAssociatedObject(self, CFSTR("AssociatedKeyAppleIDContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    DMCAKAppleIDSession();
    v4 = (void *)objc_opt_new();
    objc_setAssociatedObject(self, CFSTR("AssociatedKeyAppleIDContext"), v4, (void *)0x301);
  }
  objc_sync_exit(v3);

  return v4;
}

void __39__MDMMAIDAuthenticator__appleIDContext__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_appleIDContext_lock;
  _appleIDContext_lock = v0;

}

- (NSString)rmAccountID
{
  return self->_rmAccountID;
}

- (void)setRmAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_rmAccountID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmAccountID, 0);
}

@end
