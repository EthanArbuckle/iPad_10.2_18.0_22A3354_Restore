@implementation PKPass(NanoPassKit)

- (uint64_t)npkAccessoryType
{
  _BOOL8 v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a1, "style") == 7)
    return 2;
  objc_msgSend(a1, "barcode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageData");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(a1, "barcode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v7, "length") != 0;

  }
  else
  {

    return 0;
  }
  return v2;
}

- (BOOL)npkSupportsHidingAccessory
{
  _BOOL8 v2;
  void *v3;

  if ((NPKShowRedesignedUI() & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "npkAccessoryType") != 1)
    return objc_msgSend(a1, "npkAccessoryType") != 2;
  objc_msgSend(a1, "nfcPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (uint64_t)npkCompleteHash
{
  return objc_msgSend(a1, "npkCompleteHashForWatchOSVersion:", 2);
}

- (id)npkCompleteHashForWatchOSVersion:()NanoPassKit
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v15;
  __int16 v16;
  void *v17;
  _BYTE v18[12];
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 1) >= 2)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v18 = 136446978;
        *(_QWORD *)&v18[4] = "-[PKPass(NanoPassKit) npkCompleteHashForWatchOSVersion:]";
        v19 = 2082;
        v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/PKPass+NanoPassKit.m";
        v21 = 2048;
        v22 = 117;
        v23 = 2048;
        v24 = a3;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot calculate npk complete hash for version %llu)", v18, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  objc_msgSend(a1, "manifestHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  v9 = (void *)MEMORY[0x24BDBCEC8];
  objc_msgSend(a1, "manifestHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataWithData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    v18[0] = objc_msgSend(a1, "settings") & 1;
    v12 = v11;
    v13 = 1;
  }
  else
  {
    v15 = objc_msgSend(a1, "settings");
    v16 = objc_msgSend(a1, "settings") & 0x20 | v15 & 1;
    *(_WORD *)v18 = v16 | objc_msgSend(a1, "settings") & 0x10;
    v12 = v11;
    v13 = 2;
  }
  objc_msgSend(v12, "appendBytes:length:", v18, v13, *(_QWORD *)v18);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (uint64_t)hasLogoImageSet
{
  return objc_msgSend(a1, "isImageSetLoaded:", 4);
}

- (uint64_t)npkHasValidNFCPayload
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "nfcPayload");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v1, "encryptionPublicKeyData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = 1;
    else
      v4 = PKNFCPassKeyOptional();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)npkIsDefaultPassEligible
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "secureElementPass");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1
    && !objc_msgSend(v1, "contactlessActivationState")
    && objc_msgSend(v2, "supportsDefaultCardSelection")
    && (objc_msgSend(v2, "effectiveContactlessPaymentApplicationState"),
        PKPaymentApplicationStateIsPersonalized())
    && (objc_msgSend(v2, "isAccessPass") & 1) == 0)
  {
    v3 = objc_msgSend(v2, "isIdentityPass") ^ 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)npkIsHomeKeyUWB
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "secureElementPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "npkSupportsBluetooth"))
  {
    objc_msgSend(a1, "secureElementPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHomeKeyPass");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)npkIsAddValuePending
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nanopassbook"));
  objc_msgSend(v2, "objectForKey:", NPKTransitValuePendingDefaultsKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    v7 = 0;
    goto LABEL_15;
  }
  if (!__isLegacyPassInfo(v5))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "allValues", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "objectForKeyedSubscript:", CFSTR("date"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {

            v7 = 1;
            goto LABEL_15;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }

    goto LABEL_13;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

LABEL_15:
  return v7;
}

- (id)npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:()NanoPassKit currentBalance:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __pendingFieldValueInfo(v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("balance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = 0;
  v14 = 1;
  if (v7 && v11)
  {
    v15 = objc_msgSend(v11, "compare:", v7);
    v14 = v15 != -1;
    v13 = v15 == -1;
  }
  v16 = 0;
  if (v14 && v10)
  {
    objc_msgSend(v10, "dateByAddingTimeInterval:", 600.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  pk_Payment_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    pk_Payment_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138413058;
      v23 = v16;
      v24 = 2112;
      v25 = v20;
      v26 = 2112;
      v27 = v6;
      v28 = 1024;
      v29 = v13;
      _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: PendingAddValueStateExpireDate: %@ for pass %@ field:%@ balanceUpdated:%d", (uint8_t *)&v22, 0x26u);

    }
  }

  return v16;
}

- (id)npkPendingAddValueStateExpireDateForCommutePlanFieldWithIdentifier:()NanoPassKit expiryDate:rawCountValue:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a1, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __pendingFieldValueInfo(v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", CFSTR("date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "_hasPlanUpdatedWithFieldIdentifier:fieldInfo:renewalDate:expiryDate:rawCountValue:", v8, v12, v13, v10, v9);

  v15 = 0;
  if (v13 && (v14 & 1) == 0)
  {
    objc_msgSend(v13, "dateByAddingTimeInterval:", 600.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  pk_Payment_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "uniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413314;
      v22 = v15;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v8;
      v27 = 1024;
      v28 = v14;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: PendingAddValueStateExpireDate: %@ for pass %@ field:%@ planUpdated:%d renewalDate: %@", (uint8_t *)&v21, 0x30u);

    }
  }

  return v15;
}

- (uint64_t)_hasPlanUpdatedWithFieldIdentifier:()NanoPassKit fieldInfo:renewalDate:expiryDate:rawCountValue:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  int v22;
  id v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = a7;
  v13 = a4;
  objc_msgSend(v13, "objectForKey:", CFSTR("planExpiry"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("planTripCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v11 && v14)
    v16 = objc_msgSend(v14, "compare:", v11) == -1;
  v17 = 0;
  if (v12 && v15)
    v17 = objc_msgSend(v15, "compare:", v12) == -1;
  pk_Payment_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    pk_Payment_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412802;
      v23 = v10;
      v24 = 1024;
      v25 = v16;
      v26 = 1024;
      v27 = v17;
      _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: PendingAddValueStateExpireDate for field:%@ expiryDateDidUpdate:%d tripCountDidUpdate: %d", (uint8_t *)&v22, 0x18u);
    }

  }
  return v16 | v17;
}

+ (void)npkHandleTransitValuePendingAmount:()NanoPassKit forBalanceField:passWithUniqueID:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412802;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: npkHandleTransitValuePendingAmount %@ withField:%@ forPassWithID %@", (uint8_t *)&v18, 0x20u);
    }

  }
  objc_msgSend(v8, "balance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("date"));

    if (v7)
      objc_msgSend(v15, "setObject:forKey:", v7, CFSTR("amount"));
    if (v14)
      objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("balance"));
    objc_msgSend(v8, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __setPendingFieldValueInfo(v15, v9, v17);

  }
}

+ (void)npkHandleTransitValuePendingExpiryDate:()NanoPassKit forCommutePlanField:passWithUniqueID:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "usageDateRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expiryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "rawCountValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138413314;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: npkHandleTransitValuePendingExpiryDate %@ withField:%@ forPassWithID %@ currentExpiry: %@, tripCount: %@", (uint8_t *)&v19, 0x34u);
    }

  }
  if (v9)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("date"));

    if (v11)
      objc_msgSend(v16, "setObject:forKey:", v11, CFSTR("planExpiry"));
    if (v12)
      objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("planTripCount"));
    objc_msgSend(v8, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __setPendingFieldValueInfo(v16, v9, v18);

  }
}

+ (void)npkClearTransitValuePendingStateIfNecessaryForPassWithID:()NanoPassKit withBalanceFields:commutePlanFields:
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  const __CFString *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  _BOOL4 v43;
  BOOL v44;
  _BOOL4 v45;
  uint64_t v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id obj;
  id obja;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  id v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v7 = a4;
  v8 = a5;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)a4)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v69 = v57;
      v70 = 2112;
      v71 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: npkClearTransitValuePendingStateIfNecessaryForPassWithID %@ fields %@", buf, 0x16u);
    }

  }
  if (v57)
  {
    v52 = v7;
    v53 = v8;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v63;
      v15 = CFSTR("balance");
      obj = v11;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v63 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          __pendingFieldValueInfo(v57, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v19, "objectForKey:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "balance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              v23 = v22 == 0;
            else
              v23 = 1;
            if (!v23 && objc_msgSend(v20, "compare:", v22) == -1)
            {
              v24 = v15;
              pk_Payment_log();
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

              if (v26)
              {
                pk_Payment_log();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: Balance is greater than before pending top up, clearing value pending state", buf, 2u);
                }

              }
              v28 = (void *)objc_msgSend(v19, "mutableCopy");
              objc_msgSend(v28, "removeObjectForKey:", CFSTR("date"));
              objc_msgSend(v28, "removeObjectForKey:", v24);
              objc_msgSend(v17, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              __setPendingFieldValueInfo(v28, v57, v29);

              v15 = v24;
              v11 = obj;
            }

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v13);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obja = v53;
    v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v59;
      do
      {
        v33 = 0;
        v54 = v31;
        do
        {
          if (*(_QWORD *)v59 != v32)
            objc_enumerationMutation(obja);
          v34 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v33);
          objc_msgSend(v34, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          __pendingFieldValueInfo(v57, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            objc_msgSend(v36, "objectForKey:", CFSTR("planExpiry"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "usageDateRange");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "expiryDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "objectForKey:", CFSTR("planTripCount"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "rawCountValue");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
              v42 = v39 == 0;
            else
              v42 = 1;
            v43 = !v42 && objc_msgSend(v37, "compare:", v39) == -1;
            if (v40)
              v44 = v41 == 0;
            else
              v44 = 1;
            v45 = !v44 && objc_msgSend(v40, "compare:", v41) == -1;
            if (v43 || v45)
            {
              v46 = v32;
              pk_Payment_log();
              v47 = objc_claimAutoreleasedReturnValue();
              v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

              if (v48)
              {
                pk_Payment_log();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_213518000, v49, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: expiration date or trip count is greater than before pending renew, clearing value pending state", buf, 2u);
                }

              }
              v50 = (void *)objc_msgSend(v36, "mutableCopy");
              objc_msgSend(v50, "removeObjectForKey:", CFSTR("date"));
              objc_msgSend(v50, "removeObjectForKey:", CFSTR("planExpiry"));
              objc_msgSend(v50, "removeObjectForKey:", CFSTR("planTripCount"));
              objc_msgSend(v34, "identifier");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              __setPendingFieldValueInfo(v50, v57, v51);

              v32 = v46;
              v31 = v54;
            }

          }
          ++v33;
        }
        while (v31 != v33);
        v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v31);
    }

    v7 = v52;
    v8 = v53;
  }

}

@end
