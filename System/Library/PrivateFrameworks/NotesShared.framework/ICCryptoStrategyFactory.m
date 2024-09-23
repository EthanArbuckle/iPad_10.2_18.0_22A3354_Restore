@implementation ICCryptoStrategyFactory

+ (id)makeCryptoStrategyForObject:(id)a3 andValidateProtocolConformance:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "strategyForObject:cipherVersion:", v7, objc_msgSend(a1, "cipherVersionForObject:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(v8, "conformsToProtocol:", v6);
  if ((a1 & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

+ (id)makeCryptoStrategyForObject:(id)a3 withCipherMatchingEncryptedData:(id)a4 andValidateProtocolConformance:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "strategyForObject:cipherVersion:", v9, objc_msgSend(a1, "cipherVersionForPrimaryEncryptedData:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v10, "conformsToProtocol:", v8);
  if ((v9 & 1) == 0)
  {

    v10 = 0;
  }
  return v10;
}

+ (BOOL)shouldAuthenticateWithCustomPasswordForObject:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(a1, "cipherVersionForObject:", v4))
    v5 = objc_msgSend(a1, "cipherVersionForObject:", v4) == 2;
  else
    v5 = 1;

  return v5;
}

+ (BOOL)shouldAuthenticateWithDevicePasswordForObject:(id)a3
{
  return objc_msgSend(a1, "cipherVersionForObject:", a3) == 1;
}

+ (int64_t)cipherVersionForObject:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "userSelectedCipherVersionForObject:", v4);
  if (objc_msgSend(v4, "isPasswordProtected"))
  {
    objc_msgSend(a1, "primaryEncryptedDataForObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v5 = objc_msgSend(a1, "cipherVersionForPrimaryEncryptedData:", v6);

  }
  return v5;
}

+ (id)primaryEncryptedDataForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    while (1)
    {
      objc_msgSend(v5, "primaryEncryptedData");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
        break;
      objc_msgSend(v5, "unappliedEncryptedRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v5, "unappliedEncryptedRecord");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "primaryEncryptedDataFromRecord:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          goto LABEL_10;
      }
      objc_msgSend(v5, "parentEncryptableObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
      if (!v10)
      {
        v9 = 0;
        v5 = 0;
        goto LABEL_10;
      }
    }
    v9 = (void *)v6;
  }
  else
  {
    v5 = 0;
    v9 = 0;
  }
LABEL_10:

  return v9;
}

+ (int64_t)cipherVersionForPrimaryEncryptedData:(id)a3
{
  id v3;
  ICEncryptionObject *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "primaryEncryptedData.length", "+[ICCryptoStrategyFactory cipherVersionForPrimaryEncryptedData:]", 1, 0, CFSTR("Valid data must be provided to cipherVersionForPrimaryEncryptedData:"));
  v4 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", v3);

  if (v4)
  {
    -[ICEncryptionObject metadata](v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "cipherVersion");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)userSelectedCipherVersionForObject:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "ic_isTransitioning");
  objc_msgSend(v3, "cloudAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4 & 1) != 0)
    objc_msgSend(v5, "accountData");
  else
    objc_msgSend(v5, "accountDataCreateIfNecessary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "lockedNotesMode") > 1)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v6, "supportsV1Neo"))
  {
    if (ICInternalSettingsIsLockedNotesV1NeoEnabled())
      v7 = 2;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)strategyForObject:(id)a3 cipherVersion:(int64_t)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  __objc2_class ***v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = off_1E76C5928;
LABEL_3:
    v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithCloudSyncingObject:", v5);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 0;
      v6 = off_1E76C59C0;
      switch(a4)
      {
        case 0:
          goto LABEL_3;
        case 1:
          v6 = off_1E76C59D0;
          goto LABEL_3;
        case 2:
          v6 = off_1E76C59C8;
          goto LABEL_3;
        case 3:
          goto LABEL_4;
        default:
          goto LABEL_11;
      }
      goto LABEL_4;
    }
LABEL_11:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 0;
      v6 = off_1E76C5A48;
      switch(a4)
      {
        case 0:
          goto LABEL_3;
        case 1:
          v6 = off_1E76C5A58;
          goto LABEL_3;
        case 2:
          v6 = off_1E76C5A50;
          goto LABEL_3;
        case 3:
          goto LABEL_4;
        default:
          goto LABEL_14;
      }
      goto LABEL_4;
    }
LABEL_14:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 0;
      v6 = off_1E76C5E38;
      switch(a4)
      {
        case 0:
          goto LABEL_3;
        case 1:
          v6 = off_1E76C5E48;
          goto LABEL_3;
        case 2:
          v6 = off_1E76C5E40;
          goto LABEL_3;
        case 3:
          goto LABEL_4;
        default:
          goto LABEL_17;
      }
      goto LABEL_4;
    }
LABEL_17:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((unint64_t)a4 < 3)
      {
        v9 = off_1E76C9300;
LABEL_23:
        v6 = v9[a4];
        goto LABEL_3;
      }
    }
    else if ((unint64_t)a4 < 3)
    {
      v9 = off_1E76C9318;
      goto LABEL_23;
    }
    v7 = 0;
    goto LABEL_4;
  }
  v7 = 0;
  v6 = off_1E76C5EA8;
  switch(a4)
  {
    case 0:
      goto LABEL_3;
    case 1:
      v6 = off_1E76C5EB8;
      goto LABEL_3;
    case 2:
      v6 = off_1E76C5EB0;
      goto LABEL_3;
    case 3:
      break;
    default:
      goto LABEL_8;
  }
LABEL_4:

  return v7;
}

@end
