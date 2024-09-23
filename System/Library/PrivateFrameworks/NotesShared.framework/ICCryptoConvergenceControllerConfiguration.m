@implementation ICCryptoConvergenceControllerConfiguration

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v23 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ICCryptoConvergenceControllerConfiguration passphrase](self, "passphrase");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", v24 != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ICCryptoConvergenceControllerConfiguration v1MainKey](self, "v1MainKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    -[ICCryptoConvergenceControllerConfiguration v1NeoMainKey](self, "v1NeoMainKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22 != 0;
  }
  objc_msgSend(v6, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[ICCryptoConvergenceControllerConfiguration divergedPassphrase](self, "divergedPassphrase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", v11 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[ICCryptoConvergenceControllerConfiguration divergedV1MainKey](self, "divergedV1MainKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = 1;
  }
  else
  {
    -[ICCryptoConvergenceControllerConfiguration divergedV1NeoMainKey](self, "divergedV1NeoMainKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21 != 0;
  }
  objc_msgSend(v13, "numberWithInt:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCryptoConvergenceControllerConfiguration includeAllAuthenticatedObjects](self, "includeAllAuthenticatedObjects"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICCryptoConvergenceControllerConfiguration isUserInitiated](self, "isUserInitiated"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p, hasPassphrase: %@, hasKeys: %@, hasDivergedKey: %@, hasDivergedKeys: %@, includeAllAuthenticatedObjects: %@, isUserInitiated: %@>"), v25, self, v5, v9, v12, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  if (!v7)

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  unint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  _BOOL4 v57;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICCryptoConvergenceControllerConfiguration passphrase](self, "passphrase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passphrase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;
    if (v8 == v7)
      v11 = 0;
    else
      v11 = v7;
    v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
      {
        LOBYTE(v15) = 0;
        goto LABEL_87;
      }
      v16 = objc_msgSend((id)v10, "isEqual:", v12);

      if (!v16)
      {
        LOBYTE(v15) = 0;
LABEL_88:

        return v15;
      }
    }
    -[ICCryptoConvergenceControllerConfiguration v1MainKey](self, "v1MainKey");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "v1MainKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v10)
      v17 = 0;
    else
      v17 = (void *)v10;
    v18 = v17;
    if (v8 == v13)
      v19 = 0;
    else
      v19 = v13;
    v20 = v19;
    if (!(v18 | v20))
      goto LABEL_29;
    v21 = (void *)v20;
    if (v18)
      v22 = v20 == 0;
    else
      v22 = 1;
    if (v22)
      goto LABEL_71;
    LODWORD(v15) = objc_msgSend((id)v18, "isEqual:", v20);

    if ((_DWORD)v15)
    {
LABEL_29:
      -[ICCryptoConvergenceControllerConfiguration v1NeoMainKey](self, "v1NeoMainKey");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "v1NeoMainKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == (void *)v18)
        v23 = 0;
      else
        v23 = (void *)v18;
      v15 = v23;
      if (v8 == v21)
        v24 = 0;
      else
        v24 = v21;
      v25 = v24;
      if (!(v15 | v25))
        goto LABEL_39;
      v26 = (void *)v25;
      v27 = (void *)v15;
      LOBYTE(v15) = 0;
      if (!v27 || !v25)
      {
        v69 = v27;
        goto LABEL_85;
      }
      v28 = v27;
      v66 = v6;
      v29 = (void *)v25;
      v68 = objc_msgSend(v27, "isEqual:", v25);

      v6 = v66;
      if (v68)
      {
LABEL_39:
        v67 = v6;
        -[ICCryptoConvergenceControllerConfiguration divergedPassphrase](self, "divergedPassphrase");
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "divergedPassphrase");
        v31 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v30;
        if (v8 == (void *)v30)
          v32 = 0;
        else
          v32 = (void *)v30;
        v33 = v32;
        v65 = (void *)v31;
        if (v8 == (void *)v31)
          v34 = 0;
        else
          v34 = (void *)v31;
        v35 = (unint64_t)v33;
        v36 = v34;
        if (!(v35 | v36))
          goto LABEL_49;
        v37 = (void *)v36;
        LOBYTE(v15) = 0;
        if (!v35 || !v36)
        {
          v55 = (void *)v35;
          v6 = v67;
LABEL_84:

          v26 = v65;
          goto LABEL_85;
        }
        v38 = (void *)v36;
        v63 = objc_msgSend((id)v35, "isEqual:", v36);

        if (v63)
        {
LABEL_49:
          -[ICCryptoConvergenceControllerConfiguration divergedV1MainKey](self, "divergedV1MainKey");
          v39 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "divergedV1MainKey");
          v40 = objc_claimAutoreleasedReturnValue();
          v62 = (void *)v39;
          if (v8 == (void *)v39)
            v41 = 0;
          else
            v41 = (void *)v39;
          v42 = v41;
          v64 = (void *)v40;
          if (v8 == (void *)v40)
            v43 = 0;
          else
            v43 = (void *)v40;
          v44 = v43;
          if (v42 | v44)
          {
            v45 = (void *)v44;
            LOBYTE(v15) = 0;
            if (!v42 || !v44)
            {
              v61 = (void *)v42;
              v55 = v62;
              v6 = v67;
LABEL_82:

              goto LABEL_83;
            }
            v46 = (void *)v44;
            v60 = objc_msgSend((id)v42, "isEqual:", v44);

            if (!v60)
            {
              v55 = v62;
              LOBYTE(v15) = 0;
              v6 = v67;
LABEL_83:
              v37 = v64;
              goto LABEL_84;
            }
          }
          -[ICCryptoConvergenceControllerConfiguration divergedV1NeoMainKey](self, "divergedV1NeoMainKey");
          v47 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "divergedV1NeoMainKey");
          v48 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v47;
          if (v8 == (void *)v47)
            v49 = 0;
          else
            v49 = (void *)v47;
          v50 = v49;
          v59 = (void *)v48;
          if (v8 == (void *)v48)
            v51 = 0;
          else
            v51 = (void *)v48;
          v52 = v51;
          if (v50 | v52)
          {
            v53 = (void *)v52;
            if (!v50 || !v52)
            {
              v55 = v62;

              goto LABEL_80;
            }
            v54 = objc_msgSend((id)v50, "isEqual:", v52);

            if (!v54)
            {
              v55 = v62;
              goto LABEL_80;
            }
          }
          v55 = v62;
          v56 = -[ICCryptoConvergenceControllerConfiguration includeAllAuthenticatedObjects](self, "includeAllAuthenticatedObjects");
          if (v56 == objc_msgSend(v5, "includeAllAuthenticatedObjects"))
          {
            v57 = -[ICCryptoConvergenceControllerConfiguration isUserInitiated](self, "isUserInitiated");
            LODWORD(v15) = v57 ^ objc_msgSend(v5, "isUserInitiated") ^ 1;
LABEL_81:
            v6 = v67;
            v45 = v59;
            goto LABEL_82;
          }
LABEL_80:
          LOBYTE(v15) = 0;
          goto LABEL_81;
        }
        LOBYTE(v15) = 0;
        v26 = v65;
        v6 = v67;
LABEL_85:

        goto LABEL_86;
      }
LABEL_71:
      LOBYTE(v15) = 0;
LABEL_86:

    }
LABEL_87:

    goto LABEL_88;
  }
  LOBYTE(v15) = 1;
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v28;
  void *v29;
  char v30;

  -[ICCryptoConvergenceControllerConfiguration passphrase](self, "passphrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hash");

  }
  -[ICCryptoConvergenceControllerConfiguration v1MainKey](self, "v1MainKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "hash");

  }
  -[ICCryptoConvergenceControllerConfiguration v1NeoMainKey](self, "v1NeoMainKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hash");

  }
  v30 = v7;
  -[ICCryptoConvergenceControllerConfiguration divergedPassphrase](self, "divergedPassphrase");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hash");

  }
  -[ICCryptoConvergenceControllerConfiguration divergedV1MainKey](self, "divergedV1MainKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hash");

  }
  -[ICCryptoConvergenceControllerConfiguration divergedV1NeoMainKey](self, "divergedV1NeoMainKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "hash"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = v9;
    v22 = v4;
    v23 = v6;
    v24 = v3;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hash");

    v3 = v24;
    v6 = v23;
    v4 = v22;
    v9 = v28;
  }
  v26 = ICHashWithHashKeys(v4, v15, v16, v17, v18, v19, v20, v21, v30);

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICCryptoConvergenceControllerConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[ICCryptoConvergenceControllerConfiguration init](+[ICCryptoConvergenceControllerConfiguration allocWithZone:](ICCryptoConvergenceControllerConfiguration, "allocWithZone:", a3), "init");
  -[ICCryptoConvergenceControllerConfiguration passphrase](self, "passphrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCryptoConvergenceControllerConfiguration setPassphrase:](v4, "setPassphrase:", v5);

  -[ICCryptoConvergenceControllerConfiguration v1MainKey](self, "v1MainKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCryptoConvergenceControllerConfiguration setV1MainKey:](v4, "setV1MainKey:", v6);

  -[ICCryptoConvergenceControllerConfiguration v1NeoMainKey](self, "v1NeoMainKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCryptoConvergenceControllerConfiguration setV1NeoMainKey:](v4, "setV1NeoMainKey:", v7);

  -[ICCryptoConvergenceControllerConfiguration divergedPassphrase](self, "divergedPassphrase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCryptoConvergenceControllerConfiguration setDivergedPassphrase:](v4, "setDivergedPassphrase:", v8);

  -[ICCryptoConvergenceControllerConfiguration divergedV1MainKey](self, "divergedV1MainKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCryptoConvergenceControllerConfiguration setDivergedV1MainKey:](v4, "setDivergedV1MainKey:", v9);

  -[ICCryptoConvergenceControllerConfiguration divergedV1NeoMainKey](self, "divergedV1NeoMainKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCryptoConvergenceControllerConfiguration setDivergedV1NeoMainKey:](v4, "setDivergedV1NeoMainKey:", v10);

  -[ICCryptoConvergenceControllerConfiguration setIncludeAllAuthenticatedObjects:](v4, "setIncludeAllAuthenticatedObjects:", -[ICCryptoConvergenceControllerConfiguration includeAllAuthenticatedObjects](self, "includeAllAuthenticatedObjects"));
  -[ICCryptoConvergenceControllerConfiguration setUserInitiated:](v4, "setUserInitiated:", -[ICCryptoConvergenceControllerConfiguration isUserInitiated](self, "isUserInitiated"));
  return v4;
}

- (BOOL)shouldConvergeObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  char v36;

  v4 = a3;
  if (!-[ICCryptoConvergenceControllerConfiguration includeAllAuthenticatedObjects](self, "includeAllAuthenticatedObjects")|| (objc_msgSend(v4, "isAuthenticated") & 1) == 0)
  {
    -[ICCryptoConvergenceControllerConfiguration passphrase](self, "passphrase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      -[ICCryptoConvergenceControllerConfiguration passphrase](self, "passphrase");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isPassphraseCorrect:", v6);

      if (v7)
      {
        if ((objc_msgSend(v4, "isAuthenticated") & 1) == 0)
        {
          objc_msgSend(v4, "cryptoStrategy");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCryptoConvergenceControllerConfiguration passphrase](self, "passphrase");
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_28:
          v35 = (void *)v9;
          v36 = objc_msgSend(v8, "authenticateWithPassphrase:", v9);
          goto LABEL_29;
        }
        goto LABEL_17;
      }
    }
    else
    {

    }
    -[ICCryptoConvergenceControllerConfiguration v1MainKey](self, "v1MainKey");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_11;
    v11 = (void *)v10;
    objc_msgSend(v4, "cryptoStrategy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCryptoConvergenceControllerConfiguration v1MainKey](self, "v1MainKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "mainKeyDecryptsPrimaryData:", v13);

    if (v14)
    {
      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCryptoConvergenceControllerConfiguration v1MainKey](self, "v1MainKey");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_11:
      -[ICCryptoConvergenceControllerConfiguration v1NeoMainKey](self, "v1NeoMainKey");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_14;
      v17 = (void *)v16;
      objc_msgSend(v4, "cryptoStrategy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCryptoConvergenceControllerConfiguration v1NeoMainKey](self, "v1NeoMainKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "mainKeyDecryptsPrimaryData:", v19);

      if (v20)
      {
        +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCryptoConvergenceControllerConfiguration v1NeoMainKey](self, "v1NeoMainKey");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_14:
        -[ICCryptoConvergenceControllerConfiguration divergedPassphrase](self, "divergedPassphrase");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length"))
        {
          -[ICCryptoConvergenceControllerConfiguration divergedPassphrase](self, "divergedPassphrase");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v4, "isPassphraseCorrect:", v22);

          if (v23)
          {
            if ((objc_msgSend(v4, "isAuthenticated") & 1) == 0)
            {
              objc_msgSend(v4, "cryptoStrategy");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICCryptoConvergenceControllerConfiguration divergedPassphrase](self, "divergedPassphrase");
              v9 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            }
            goto LABEL_17;
          }
        }
        else
        {

        }
        -[ICCryptoConvergenceControllerConfiguration divergedV1MainKey](self, "divergedV1MainKey");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
          goto LABEL_22;
        v26 = (void *)v25;
        objc_msgSend(v4, "cryptoStrategy");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCryptoConvergenceControllerConfiguration divergedV1MainKey](self, "divergedV1MainKey");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "mainKeyDecryptsPrimaryData:", v28);

        if (v29)
        {
          +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCryptoConvergenceControllerConfiguration divergedV1MainKey](self, "divergedV1MainKey");
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_22:
          -[ICCryptoConvergenceControllerConfiguration divergedV1NeoMainKey](self, "divergedV1NeoMainKey");
          v30 = objc_claimAutoreleasedReturnValue();
          if (!v30)
            goto LABEL_26;
          v31 = (void *)v30;
          objc_msgSend(v4, "cryptoStrategy");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCryptoConvergenceControllerConfiguration divergedV1NeoMainKey](self, "divergedV1NeoMainKey");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v32, "mainKeyDecryptsPrimaryData:", v33);

          if (!v34)
          {
LABEL_26:
            v24 = 0;
            goto LABEL_30;
          }
          +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICCryptoConvergenceControllerConfiguration divergedV1NeoMainKey](self, "divergedV1NeoMainKey");
          v15 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v35 = (void *)v15;
    v36 = objc_msgSend(v8, "setCachedMainKey:forObject:", v15, v4);
LABEL_29:
    v24 = v36;

    goto LABEL_30;
  }
LABEL_17:
  v24 = 1;
LABEL_30:

  return v24;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ICEncryptionKey)v1MainKey
{
  return self->_v1MainKey;
}

- (void)setV1MainKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICEncryptionKey)v1NeoMainKey
{
  return self->_v1NeoMainKey;
}

- (void)setV1NeoMainKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)divergedPassphrase
{
  return self->_divergedPassphrase;
}

- (void)setDivergedPassphrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ICEncryptionKey)divergedV1MainKey
{
  return self->_divergedV1MainKey;
}

- (void)setDivergedV1MainKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ICEncryptionKey)divergedV1NeoMainKey
{
  return self->_divergedV1NeoMainKey;
}

- (void)setDivergedV1NeoMainKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)includeAllAuthenticatedObjects
{
  return self->_includeAllAuthenticatedObjects;
}

- (void)setIncludeAllAuthenticatedObjects:(BOOL)a3
{
  self->_includeAllAuthenticatedObjects = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divergedV1NeoMainKey, 0);
  objc_storeStrong((id *)&self->_divergedV1MainKey, 0);
  objc_storeStrong((id *)&self->_divergedPassphrase, 0);
  objc_storeStrong((id *)&self->_v1NeoMainKey, 0);
  objc_storeStrong((id *)&self->_v1MainKey, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
}

@end
