@implementation AMSSecureCodableError

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  -[AMSSecureCodableError domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSSecureCodableError code](self, "code");
  -[AMSSecureCodableError _secureCodableUserInfoDictionary](self, "_secureCodableUserInfoDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v6, v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "encodeWithCoder:", v5);
}

- (id)_secureCodableUserInfoDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  AMSSecureCodableError *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[AMSSecureCodableError userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = CFSTR("NSErrorPeerCertificateChainKey");
  v18[1] = CFSTR("NSErrorClientCertificateChainKey");
  v5 = *MEMORY[0x1E0CB3388];
  v18[2] = *MEMORY[0x1E0CB32F8];
  v18[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  -[AMSSecureCodableError userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke;
  v14[3] = &unk_1E25456B0;
  v15 = v7;
  v10 = v8;
  v16 = v10;
  v17 = self;
  v11 = v7;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);

  v12 = v10;
  return v12;
}

void __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(a1[4], "containsObject:", v5) & 1) == 0)
  {
    v7 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;

      if (v8)
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_2;
        v18[3] = &unk_1E253E830;
        v18[4] = a1[6];
        objc_msgSend(v8, "ams_filterUsingTest:", v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v9, v5);

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {

    }
    v10 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;

      if (v11)
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_3;
        v17[3] = &unk_1E2541570;
        v17[4] = a1[6];
        objc_msgSend(v11, "ams_filterUsingTest:", v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v12, v5);

LABEL_16:
        v8 = 0;
        goto LABEL_17;
      }
    }
    else
    {

    }
    v13 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;

      if (v14)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_4;
        v16[3] = &unk_1E253E830;
        v16[4] = a1[6];
        objc_msgSend(v14, "ams_filterUsingTest:", v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v15, v5);

        goto LABEL_16;
      }
    }
    else
    {

    }
    if (objc_msgSend(a1[6], "_secureCodingSupportedByObject:", v13))
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v13, v5);
    goto LABEL_16;
  }
LABEL_18:

}

uint64_t __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_secureCodingSupportedByObject:", a2);
}

uint64_t __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_secureCodingSupportedByObject:");
}

uint64_t __57__AMSSecureCodableError__secureCodableUserInfoDictionary__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_secureCodingSupportedByObject:", a2);
}

- (BOOL)_secureCodingSupportedByObject:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "supportsSecureCoding"))
  {
    v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE064348);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
