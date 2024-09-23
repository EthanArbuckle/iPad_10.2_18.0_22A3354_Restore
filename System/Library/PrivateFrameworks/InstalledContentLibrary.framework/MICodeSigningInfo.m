@implementation MICodeSigningInfo

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MICodeSigningInfo;
  return -[MICodeSigningInfo init](&v3, sel_init);
}

- (MICodeSigningInfo)initWithSignerIdentity:(id)a3 signerOrganization:(id)a4 codeInfoIdentifier:(id)a5 teamIdentifier:(id)a6 signatureVersion:(id)a7 entitlements:(id)a8 signerType:(unint64_t)a9 profileType:(unint64_t)a10 signingInfoSource:(unint64_t)a11 launchWarningData:(id)a12
{
  id v19;
  id v20;
  id v21;
  MICodeSigningInfo *v22;
  MICodeSigningInfo *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v19 = a3;
  v20 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v21 = a12;
  v29.receiver = self;
  v29.super_class = (Class)MICodeSigningInfo;
  v22 = -[MICodeSigningInfo init](&v29, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_signerIdentity, a3);
    objc_storeStrong((id *)&v23->_signerOrganization, a4);
    objc_storeStrong((id *)&v23->_codeInfoIdentifier, a5);
    objc_storeStrong((id *)&v23->_teamIdentifier, a6);
    objc_storeStrong((id *)&v23->_signatureVersion, a7);
    objc_storeStrong((id *)&v23->_entitlements, a8);
    v23->_profileValidationType = a10;
    v23->_signingInfoSource = a11;
    v23->_codeSignerType = a9;
    objc_storeStrong((id *)&v23->_launchWarningData, a12);
  }

  return v23;
}

- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3
{
  return -[MICodeSigningInfo initWithDictionaryRepresentation:fromSource:](self, "initWithDictionaryRepresentation:fromSource:", a3, 0);
}

- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3 fromSource:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  MICodeSigningInfo *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  MICodeSigningInfo *v65;

  v6 = a3;
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_41;
LABEL_40:
    MOLogWrite();
LABEL_41:
    v35 = 0;
    goto LABEL_64;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SigningInfoSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  if (a4)
    v13 = a4;
  else
    v13 = v12;
  v14 = v7;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CodeSignerType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = v15;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  if (v17)
  {
    v18 = objc_msgSend(v17, "unsignedIntegerValue");
  }
  else
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AdHocSigned"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MIBooleanValue(v19, 0);

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ValidatedByProfile"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MIBooleanValue(v21, 0);

    v23 = 2;
    if (v22)
      v23 = 3;
    if (v20)
      v18 = 1;
    else
      v18 = v23;
  }

  v24 = v14;
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ProfileType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = v25;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;

  if (v27)
  {
    v28 = objc_msgSend(v27, "unsignedIntegerValue");
  }
  else
  {
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ValidatedByProfile"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MIBooleanValue(v29, 0);

    if (v30)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ValidatedByUPP"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = MIBooleanValue(v31, 0);

      if ((v32 & 1) != 0)
      {
        v28 = 2;
      }
      else
      {
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ValidatedByFreeProfile"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = MIBooleanValue(v33, 0);

        if (v34)
          v28 = 3;
        else
          v28 = 4;
      }
    }
    else
    {
      v28 = 1;
    }
  }

  if (v18 == 3 && v28 == 1)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_41;
    goto LABEL_40;
  }
  v63 = v28;
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SignerIdentity"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v37 = v36;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v62 = v37;
  else
    v62 = 0;
  v64 = v37;

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SignerOrganization"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v39 = v38;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v60 = v39;
  else
    v60 = 0;
  v61 = v39;

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CodeInfoIdentifier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v41 = v40;
  v65 = self;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v58 = v41;
  else
    v58 = 0;
  v59 = v41;

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("TeamIdentifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = v42;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v56 = v43;
  else
    v56 = 0;
  v57 = v43;

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SignatureVersion"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v45 = v44;
  v46 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v47 = v45;
  else
    v47 = 0;

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("com.apple.MobileContainerManager.Entitlements"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v49 = v48;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v50 = v49;
  else
    v50 = 0;

  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("LaunchWarningData"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v52 = v51;
  v55 = v45;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v53 = v52;
  else
    v53 = 0;

  v35 = -[MICodeSigningInfo initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:](v65, "initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:", v62, v60, v58, v56, v47, v50, v46, v63, v13, v53);
  self = v35;

LABEL_64:
  return v35;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_opt_new();
  -[MICodeSigningInfo entitlements](self, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MICodeSigningInfo entitlements](self, "entitlements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("com.apple.MobileContainerManager.Entitlements"));

  }
  -[MICodeSigningInfo signerIdentity](self, "signerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MICodeSigningInfo signerIdentity](self, "signerIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SignerIdentity"));

  }
  -[MICodeSigningInfo signerOrganization](self, "signerOrganization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MICodeSigningInfo signerOrganization](self, "signerOrganization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("SignerOrganization"));

  }
  -[MICodeSigningInfo codeInfoIdentifier](self, "codeInfoIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MICodeSigningInfo codeInfoIdentifier](self, "codeInfoIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("CodeInfoIdentifier"));

  }
  -[MICodeSigningInfo teamIdentifier](self, "teamIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MICodeSigningInfo teamIdentifier](self, "teamIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("TeamIdentifier"));

  }
  -[MICodeSigningInfo signatureVersion](self, "signatureVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MICodeSigningInfo signatureVersion](self, "signatureVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("SignatureVersion"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MICodeSigningInfo profileValidationType](self, "profileValidationType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("ProfileType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MICodeSigningInfo codeSignerType](self, "codeSignerType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("CodeSignerType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MICodeSigningInfo signingInfoSource](self, "signingInfoSource"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("SigningInfoSource"));

  -[MICodeSigningInfo launchWarningData](self, "launchWarningData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("LaunchWarningData"));

  v20 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v20;
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (NSString)signerOrganization
{
  return self->_signerOrganization;
}

- (NSString)codeInfoIdentifier
{
  return self->_codeInfoIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSNumber)signatureVersion
{
  return self->_signatureVersion;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (unint64_t)codeSignerType
{
  return self->_codeSignerType;
}

- (unint64_t)profileValidationType
{
  return self->_profileValidationType;
}

- (unint64_t)signingInfoSource
{
  return self->_signingInfoSource;
}

- (NSData)launchWarningData
{
  return self->_launchWarningData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchWarningData, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_signatureVersion, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_codeInfoIdentifier, 0);
  objc_storeStrong((id *)&self->_signerOrganization, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
}

@end
