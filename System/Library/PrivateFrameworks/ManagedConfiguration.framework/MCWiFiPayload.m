@implementation MCWiFiPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.wifi.managed"));
}

+ (id)localizedSingularForm
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  objc_msgSend(CFSTR("WIFI_NETWORK_DESCRIPTION_SINGULAR_FORMAT"), "MCAppendGreenteaSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedFormat(v2, v3, v4, v5, v6, v7, v8, v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localizedPluralForm
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  objc_msgSend(CFSTR("WIFI_NETWORK_DESCRIPTION_PLURAL_FORMAT"), "MCAppendGreenteaSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedFormat(v2, v3, v4, v5, v6, v7, v8, v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_eapConfigIsValid:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  const __CFString *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  id v83;
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  _QWORD v89[4];
  _QWORD v90[5];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v84 = 0;
  v7 = (id)objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("UserName"), 0, &v84);
  v8 = v84;
  if (v8
    || (v83 = 0,
        v9 = (id)objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("UserPassword"), 0, &v83), (v8 = v83) != 0))
  {
    v10 = v8;
    v11 = 0;
    v12 = 0;
LABEL_4:
    v13 = 0;
LABEL_5:
    v14 = 0;
    v15 = 0;
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
  v82 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AcceptEAPTypes"), 1, &v82);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v82;
  if (v18)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4212CA0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v12 = v12;
  v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v79;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v79 != v22)
          objc_enumerationMutation(v12);
        if (!objc_msgSend(v19, "containsObject:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i)))
        {
          +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("AcceptEAPTypes"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = 0;
          v15 = 0;
          v14 = 0;
          v13 = 0;
          goto LABEL_29;
        }
      }
      v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
      if (v21)
        continue;
      break;
    }
  }

  v77 = 0;
  v24 = (id)objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PayloadCertificateAnchorUUID"), 0, &v77);
  v18 = v77;
  if (v18)
    goto LABEL_11;
  v76 = 0;
  v25 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("TLSTrustedCertificates"), 0, &v76);
  v18 = v76;
  if (v18)
    goto LABEL_11;
  v75 = 0;
  v26 = (id)objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("TLSTrustedServerCommonNames"), 0, &v75);
  v18 = v75;
  if (v18)
    goto LABEL_11;
  v74 = 0;
  v27 = (id)objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("TLSTrustedServerNames"), 0, &v74);
  v18 = v74;
  if (v18
    || (v73 = 0,
        v28 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("TLSAllowTrustExceptions"), 0, &v73), (v18 = v73) != 0)|| (v72 = 0, v29 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("TLSCertificateIsRequired"), 0, &v72), (v18 = v72) != 0))
  {
LABEL_11:
    v10 = v18;
    v11 = 0;
    goto LABEL_4;
  }
  v71 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TTLSInnerAuthentication"), 0, &v71);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v71;
  if (v30)
  {
    v10 = v30;
    v11 = 0;
    goto LABEL_5;
  }
  if (!v13)
  {
LABEL_38:
    v70 = 0;
    objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TLSMinimumVersion"), 0, &v70);
    v15 = objc_claimAutoreleasedReturnValue();
    v37 = v70;
    if (v37)
    {
      v10 = v37;
      v11 = 0;
      v14 = 0;
      goto LABEL_6;
    }
    v69 = 0;
    objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TLSMaximumVersion"), 0, &v69);
    v16 = objc_claimAutoreleasedReturnValue();
    v38 = v69;
    if (v38)
      goto LABEL_56;
    if (!(v15 | v16))
      goto LABEL_52;
    v89[0] = CFSTR("1.0");
    v89[1] = CFSTR("1.1");
    v89[2] = CFSTR("1.2");
    v89[3] = CFSTR("1.3");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_msgSend(v56, "containsObject:", v15) & 1) == 0)
    {
      v45 = CFSTR("TLSMinimumVersion");
    }
    else
    {
      if (!v16)
      {
LABEL_51:

LABEL_52:
        v68 = 0;
        v41 = (id)objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OuterIdentity"), 0, &v68);
        v38 = v68;
        if (v38)
          goto LABEL_56;
        v67 = 0;
        v42 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPFASTUsePAC"), 0, &v67);
        v38 = v67;
        if (v38
          || (v66 = 0,
              v43 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPFASTProvisionPAC"), 0, &v66), (v38 = v66) != 0)|| (v65 = 0, v44 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPFASTProvisionPACAnonymously"), 0, &v65), (v38 = v65) != 0))
        {
LABEL_56:
          v10 = v38;
          v11 = 0;
          v14 = 0;
          goto LABEL_7;
        }
        v64 = 0;
        objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPSIMNumberOfRANDs"), 0, &v64);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v64;
        if (!v46)
        {
          if (!v14
            || objc_msgSend(v14, "intValue") == 2
            || objc_msgSend(v14, "intValue") == 3)
          {
            v63 = 0;
            v47 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("OneTimeUserPassword"), 0, &v63);
            v46 = v63;
            if (v46)
              goto LABEL_71;
            v62 = 0;
            v48 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPSIMAKAConservativePeer"), 0, &v62);
            v46 = v62;
            if (v46)
              goto LABEL_71;
            v61 = 0;
            v49 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPSIMAKAPseudonymIdentityLifetimeHours"), 0, &v61);
            v46 = v61;
            if (v46)
              goto LABEL_71;
            v60 = 0;
            v50 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPSIMAKAEncryptedIdentityEnabled"), 0, &v60);
            v46 = v60;
            if (v46)
              goto LABEL_71;
            v59 = 0;
            v51 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPSIMAKARealm"), 0, &v59);
            v46 = v59;
            if (v46)
              goto LABEL_71;
            v58 = 0;
            v52 = (id)objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ExtensibleSSOProvider"), 0, &v58);
            v46 = v58;
            if (v46)
              goto LABEL_71;
            v57 = 0;
            v54 = (id)objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPSIMAKANotificationActions"), 0, &v57);
            v53 = v57;
          }
          else
          {
            +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("EAPSIMNumberOfRANDs"));
            v53 = (id)objc_claimAutoreleasedReturnValue();
          }
          v10 = v53;
          goto LABEL_29;
        }
LABEL_71:
        v10 = v46;
        goto LABEL_30;
      }
      if ((objc_msgSend(v56, "containsObject:", v16) & 1) != 0)
      {
        if (v15)
        {
          v55 = objc_msgSend(v39, "indexOfObject:", v15);
          if (v55 > objc_msgSend(v39, "indexOfObject:", v16))
          {
            +[MCPayload conflictingFieldValueErrorWithUnderlyingError:](MCPayload, "conflictingFieldValueErrorWithUnderlyingError:", 0, CFSTR("TLSMinimumVersion"), CFSTR("TLSMaximumVersion"), v15, v16, 0);
            v40 = objc_claimAutoreleasedReturnValue();
LABEL_60:
            v10 = (void *)v40;

            goto LABEL_41;
          }
        }
        goto LABEL_51;
      }
      v45 = CFSTR("TLSMaximumVersion");
    }
    +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", v45);
    v40 = objc_claimAutoreleasedReturnValue();
    goto LABEL_60;
  }
  v34 = (void *)MEMORY[0x1E0C99E60];
  v90[0] = CFSTR("PAP");
  v90[1] = CFSTR("CHAP");
  v90[2] = CFSTR("MSCHAP");
  v90[3] = CFSTR("MSCHAPv2");
  v90[4] = CFSTR("EAP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v36, "containsObject:", v13))
  {

    goto LABEL_38;
  }
  +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("TTLSInnerAuthentication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v15 = 0;
LABEL_41:
  v14 = 0;
LABEL_29:
  if (v10)
  {
LABEL_30:
    v11 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "count"))
  {
    v31 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      -[MCPayload friendlyName](self, "friendlyName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v86 = v33;
      v87 = 2114;
      v88 = v6;
      _os_log_impl(&dword_19ECC4000, v32, OS_LOG_TYPE_DEFAULT, "Payload “%{public}@” contains unexpected fields in EAP Configuration. They are: %{public}@", buf, 0x16u);

    }
  }
  v10 = 0;
  v11 = 1;
LABEL_7:
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v11;
}

- (BOOL)_qosMarkingConfigIsValid:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v23 = 0;
  v7 = (id)objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("QoSMarkingWhitelistedAppIdentifiers"), 0, 0, &v23);
  v8 = v23;
  if (v8)
    goto LABEL_6;
  v22 = 0;
  v9 = (id)objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), CFSTR("QoSMarkingAllowListAppIdentifiers"), 0, 0, &v22);
  v8 = v22;
  if (v8)
    goto LABEL_6;
  v21 = 0;
  v10 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("QoSMarkingAppleAudioVideoCalls"), 0, &v21);
  v8 = v21;
  if (v8
    || (v20 = 0,
        v11 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("QoSMarkingEnabled"), 0, &v20), (v8 = v20) != 0)|| (v19 = 0, v12 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("QoSMarkingURL"), 0, &v19), (v8 = v19) != 0))
  {
LABEL_6:
    v13 = v8;
    v14 = 0;
    if (a4)
LABEL_7:
      *a4 = objc_retainAutorelease(v13);
  }
  else
  {
    if (objc_msgSend(v6, "count"))
    {
      v16 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        -[MCPayload friendlyName](self, "friendlyName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        v26 = 2114;
        v27 = v6;
        _os_log_impl(&dword_19ECC4000, v17, OS_LOG_TYPE_DEFAULT, "Payload “%{public}@” contains unexpected fields in QoS Marking Configuration. They are: %{public}@", buf, 0x16u);

      }
    }
    v13 = 0;
    v14 = 1;
    if (a4)
      goto LABEL_7;
  }

  return v14;
}

- (id)_createDictionaryWithAllowListKeyMigrated:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("QoSMarkingAllowListAppIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("QoSMarkingAllowListAppIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("QoSMarkingWhitelistedAppIdentifiers"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("QoSMarkingAllowListAppIdentifiers"));
    v7 = (id)objc_msgSend(v5, "copy");

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (id)_eapUsernameFromConfig:(id)a3 isRequired:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("AcceptEAPTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "containsObject:", v8))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "containsObject:", v9))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "containsObject:", v12);

        if (a4 && (v13 & 1) == 0)
          *a4 = 1;
        goto LABEL_7;
      }

    }
  }
LABEL_7:
  objc_msgSend(v6, "objectForKey:", CFSTR("UserName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

- (id)_eapPasswordFromConfig:(id)a3 isRequired:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("AcceptEAPTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "containsObject:", v8))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "containsObject:", v9))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "containsObject:", v12);

        if (a4 && (v13 & 1) == 0)
          *a4 = 1;
        goto LABEL_7;
      }

    }
  }
LABEL_7:
  objc_msgSend(v6, "objectForKey:", CFSTR("UserPassword"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

- (BOOL)_isEAPSIMConfig:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("AcceptEAPTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MCWiFiPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCWiFiPayload *v10;
  uint64_t v11;
  id v12;
  NSNumber *isHotspotNum;
  uint64_t v14;
  NSNumber *serviceProviderRoamingEnabledNum;
  uint64_t v16;
  NSNumber *proxyPACFallbackAllowedNum;
  uint64_t v18;
  NSString *domainName;
  uint64_t v20;
  NSString *HESSID;
  uint64_t v22;
  NSArray *roamingConsortiumOIs;
  uint64_t v24;
  NSArray *NAIRealmNames;
  uint64_t v26;
  NSArray *MCCAndMNCs;
  uint64_t v28;
  NSString *displayedOperatorName;
  uint64_t v30;
  NSNumber *isHiddenNum;
  uint64_t v32;
  NSString *ssid;
  uint64_t v34;
  NSString *encryptionType;
  uint64_t v36;
  NSString *credentialUUID;
  id v38;
  int v39;
  uint64_t v40;
  id v41;
  NSString *proxyServer;
  uint64_t v43;
  NSNumber *proxyServerPort;
  uint64_t v45;
  NSString *proxyUsername;
  uint64_t v47;
  id v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  _BOOL4 v63;
  id v64;
  uint64_t v65;
  NSString *username;
  uint64_t v67;
  NSString *password;
  uint64_t v69;
  id v70;
  NSArray *payloadCertificateAnchorUUID;
  uint64_t v72;
  id v73;
  NSString *certificateUUID;
  uint64_t v75;
  id v76;
  NSString *v77;
  _BOOL4 v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSNumber *autoJoinNum;
  NSNumber *v83;
  BOOL v84;
  uint64_t v85;
  NSNumber *isFirstAutoJoinRestricted;
  uint64_t v87;
  NSNumber *captiveBypassNum;
  NSNumber *v89;
  uint64_t v90;
  NSNumber *disableAssociationMACRandomization;
  uint64_t v92;
  NSString *v93;
  uint64_t v94;
  NSNumber *v95;
  uint64_t v96;
  NSString *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSString *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t i;
  uint64_t v119;
  char v120;
  char v121;
  uint64_t v122;
  uint64_t v123;
  id obj;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  objc_super v169;
  uint8_t buf[4];
  void *v171;
  __int16 v172;
  id v173;
  _BYTE v174[128];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v169.receiver = self;
  v169.super_class = (Class)MCWiFiPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v169, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_44;
  v168 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IsHotspot"), 0, &v168);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v168;
  isHotspotNum = v10->_isHotspotNum;
  v10->_isHotspotNum = (NSNumber *)v11;

  if (v12)
    goto LABEL_35;
  v10->_isHotspot = -[NSNumber BOOLValue](v10->_isHotspotNum, "BOOLValue");
  v167 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ServiceProviderRoamingEnabled"), 0, &v167);
  v14 = objc_claimAutoreleasedReturnValue();
  v12 = v167;
  serviceProviderRoamingEnabledNum = v10->_serviceProviderRoamingEnabledNum;
  v10->_serviceProviderRoamingEnabledNum = (NSNumber *)v14;

  if (v12)
    goto LABEL_35;
  v10->_serviceProviderRoamingEnabled = -[NSNumber BOOLValue](v10->_serviceProviderRoamingEnabledNum, "BOOLValue");
  v166 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyPACFallbackAllowed"), 0, &v166);
  v16 = objc_claimAutoreleasedReturnValue();
  v12 = v166;
  proxyPACFallbackAllowedNum = v10->_proxyPACFallbackAllowedNum;
  v10->_proxyPACFallbackAllowedNum = (NSNumber *)v16;

  if (v12)
    goto LABEL_35;
  v10->_proxyPACFallbackAllowed = -[NSNumber BOOLValue](v10->_proxyPACFallbackAllowedNum, "BOOLValue");
  v165 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("DomainName"), 0, &v165);
  v18 = objc_claimAutoreleasedReturnValue();
  v12 = v165;
  domainName = v10->_domainName;
  v10->_domainName = (NSString *)v18;

  if (v12)
    goto LABEL_35;
  v164 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("HESSID"), 0, &v164);
  v20 = objc_claimAutoreleasedReturnValue();
  v12 = v164;
  HESSID = v10->_HESSID;
  v10->_HESSID = (NSString *)v20;

  if (v12)
    goto LABEL_35;
  v163 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("RoamingConsortiumOIs"), 0, &v163);
  v22 = objc_claimAutoreleasedReturnValue();
  v12 = v163;
  roamingConsortiumOIs = v10->_roamingConsortiumOIs;
  v10->_roamingConsortiumOIs = (NSArray *)v22;

  if (v12)
    goto LABEL_35;
  v162 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("NAIRealmNames"), 0, &v162);
  v24 = objc_claimAutoreleasedReturnValue();
  v12 = v162;
  NAIRealmNames = v10->_NAIRealmNames;
  v10->_NAIRealmNames = (NSArray *)v24;

  if (v12)
    goto LABEL_35;
  v161 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("MCCAndMNCs"), 0, &v161);
  v26 = objc_claimAutoreleasedReturnValue();
  v12 = v161;
  MCCAndMNCs = v10->_MCCAndMNCs;
  v10->_MCCAndMNCs = (NSArray *)v26;

  if (v12)
    goto LABEL_35;
  v160 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("DisplayedOperatorName"), 0, &v160);
  v28 = objc_claimAutoreleasedReturnValue();
  v12 = v160;
  displayedOperatorName = v10->_displayedOperatorName;
  v10->_displayedOperatorName = (NSString *)v28;

  if (v12)
    goto LABEL_35;
  v159 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("HIDDEN_NETWORK"), 0, &v159);
  v30 = objc_claimAutoreleasedReturnValue();
  v12 = v159;
  isHiddenNum = v10->_isHiddenNum;
  v10->_isHiddenNum = (NSNumber *)v30;

  if (v12)
    goto LABEL_35;
  v10->_isHidden = -[NSNumber BOOLValue](v10->_isHiddenNum, "BOOLValue");
  v158 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SSID_STR"), 0, &v158);
  v32 = objc_claimAutoreleasedReturnValue();
  v12 = v158;
  ssid = v10->_ssid;
  v10->_ssid = (NSString *)v32;

  if (v12)
    goto LABEL_35;
  v157 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EncryptionType"), 0, &v157);
  v34 = objc_claimAutoreleasedReturnValue();
  v12 = v157;
  encryptionType = v10->_encryptionType;
  v10->_encryptionType = (NSString *)v34;

  if (v12)
    goto LABEL_35;
  if (!v10->_encryptionType)
  {
    v10->_encryptionType = (NSString *)CFSTR("Any");

  }
  if (objc_msgSend(v9, "isStub"))
  {
    v156 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("CredentialUUID"), 0, &v156);
    v36 = objc_claimAutoreleasedReturnValue();
    v12 = v156;
    credentialUUID = v10->_credentialUUID;
    v10->_credentialUUID = (NSString *)v36;

    if (v12)
    {
LABEL_35:
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52;
      if (a5)
        *a5 = objc_retainAutorelease(v52);
      v54 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v55 = v54;
        v56 = (void *)objc_opt_class();
        v57 = v56;
        objc_msgSend(v53, "MCVerboseDescription");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v171 = v56;
        v172 = 2114;
        v173 = v58;
        _os_log_impl(&dword_19ECC4000, v55, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_40;
    }
    v155 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyType"), 0, &v155);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v155;
    if (v38)
      goto LABEL_33;
    v39 = objc_msgSend(v127, "intValue");
    v10->_proxyType = v39;
    if (v39 == 1)
    {
      v150 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyPACURL"), 0, &v150);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v150;
      v49 = 216;
      goto LABEL_63;
    }
    if (v39 != 2)
      goto LABEL_65;
    v154 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyServer"), 0, &v154);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v154;
    proxyServer = v10->_proxyServer;
    v10->_proxyServer = (NSString *)v40;

    if (!v41)
    {
      v153 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyServerPort"), 0, &v153);
      v43 = objc_claimAutoreleasedReturnValue();
      v41 = v153;
      proxyServerPort = v10->_proxyServerPort;
      v10->_proxyServerPort = (NSNumber *)v43;

      if (!v41)
      {
        v152 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyUsername"), 0, &v152);
        v45 = objc_claimAutoreleasedReturnValue();
        v41 = v152;
        proxyUsername = v10->_proxyUsername;
        v10->_proxyUsername = (NSString *)v45;

        if (!v41)
        {
          v151 = 0;
          objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyPassword"), 0, &v151);
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = v151;
          v49 = 208;
LABEL_63:
          v80 = *(Class *)((char *)&v10->super.super.isa + v49);
          *(Class *)((char *)&v10->super.super.isa + v49) = (Class)v47;

          goto LABEL_64;
        }
      }
    }
LABEL_92:
    v51 = (uint64_t)v41;
    goto LABEL_34;
  }
  if (-[NSString isEqualToString:](v10->_encryptionType, "isEqualToString:", CFSTR("Any")))
    v50 = 1;
  else
    v50 = -[NSString isEqualToString:](v10->_encryptionType, "isEqualToString:", CFSTR("WEP"));
  v10->_isWEP = v50;
  if (-[NSString isEqualToString:](v10->_encryptionType, "isEqualToString:", CFSTR("Any"))
    || -[NSString isEqualToString:](v10->_encryptionType, "isEqualToString:", CFSTR("WPA"))
    || -[NSString isEqualToString:](v10->_encryptionType, "isEqualToString:", CFSTR("WPA2")))
  {
    v10->_isWPA = 1;
    goto LABEL_32;
  }
  v78 = -[NSString isEqualToString:](v10->_encryptionType, "isEqualToString:", CFSTR("WPA3"));
  v10->_isWPA = v78;
  if (v10->_isWEP || v78)
  {
LABEL_32:
    v149 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPClientConfiguration"), 0, &v149);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v149;
    if (v38)
    {
LABEL_33:
      v51 = (uint64_t)v38;
LABEL_34:

      v12 = (id)v51;
      goto LABEL_35;
    }
    if (v127)
    {
      v148 = 0;
      v63 = -[MCWiFiPayload _eapConfigIsValid:error:](v10, "_eapConfigIsValid:error:", v127, &v148);
      v64 = v148;
      if (v63)
      {
        -[MCWiFiPayload _eapUsernameFromConfig:isRequired:](v10, "_eapUsernameFromConfig:isRequired:", v127, &v10->_usernameRequired);
        v65 = objc_claimAutoreleasedReturnValue();
        username = v10->_username;
        v10->_username = (NSString *)v65;

        -[MCWiFiPayload _eapPasswordFromConfig:isRequired:](v10, "_eapPasswordFromConfig:isRequired:", v127, &v10->_passwordRequired);
        v67 = objc_claimAutoreleasedReturnValue();
        password = v10->_password;
        v10->_password = (NSString *)v67;

        v147 = v64;
        v125 = (void *)objc_msgSend(v127, "mutableCopy");
        objc_msgSend(v125, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PayloadCertificateAnchorUUID"), 0, &v147);
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = v147;

        payloadCertificateAnchorUUID = v10->_payloadCertificateAnchorUUID;
        v10->_payloadCertificateAnchorUUID = (NSArray *)v69;

        v51 = (uint64_t)v70;
        if (v70)
          goto LABEL_49;
        v146 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PayloadCertificateUUID"), 0, &v146);
        v72 = objc_claimAutoreleasedReturnValue();
        v73 = v146;
        certificateUUID = v10->_certificateUUID;
        v10->_certificateUUID = (NSString *)v72;

        v51 = (uint64_t)v73;
        if (v73)
        {
LABEL_49:

          goto LABEL_34;
        }
        -[MCWiFiPayload setEapClientConfig:](v10, "setEapClientConfig:", v125);

        goto LABEL_57;
      }
    }
    else
    {
      v64 = 0;
    }
    v145 = v64;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Password"), 0, &v145);
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v145;

    v77 = v10->_password;
    v10->_password = (NSString *)v75;

    if (v76)
    {
      v51 = (uint64_t)v76;
      goto LABEL_34;
    }
    v10->_passwordRequired = 1;
LABEL_57:

  }
  v144 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyType"), 0, &v144);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v144;
  if (v38)
    goto LABEL_33;
  if (v127)
  {
    if ((objc_msgSend(v127, "isEqualToString:", CFSTR("None")) & 1) != 0)
    {
      v79 = 0;
LABEL_83:
      -[MCWiFiPayload setProxyType:](v10, "setProxyType:", v79);
      goto LABEL_84;
    }
    if ((objc_msgSend(v127, "isEqualToString:", CFSTR("Manual")) & 1) != 0)
    {
      v79 = 2;
      goto LABEL_83;
    }
    if ((objc_msgSend(v127, "isEqualToString:", CFSTR("Auto")) & 1) != 0)
    {
      v79 = 1;
      goto LABEL_83;
    }
    +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("ProxyType"));
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (v38)
      goto LABEL_33;
  }
LABEL_84:
  if (-[MCWiFiPayload proxyType](v10, "proxyType") == 2)
  {
    v143 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyServer"), 1, &v143);
    v92 = objc_claimAutoreleasedReturnValue();
    v41 = v143;
    v93 = v10->_proxyServer;
    v10->_proxyServer = (NSString *)v92;

    if (v41)
      goto LABEL_92;
    v142 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyServerPort"), 0, &v142);
    v94 = objc_claimAutoreleasedReturnValue();
    v41 = v142;
    v95 = v10->_proxyServerPort;
    v10->_proxyServerPort = (NSNumber *)v94;

    if (v41)
      goto LABEL_92;
    v141 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyUsername"), 0, &v141);
    v96 = objc_claimAutoreleasedReturnValue();
    v41 = v141;
    v97 = v10->_proxyUsername;
    v10->_proxyUsername = (NSString *)v96;

    if (v41)
      goto LABEL_92;
    v140 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyPassword"), 0, &v140);
    v98 = objc_claimAutoreleasedReturnValue();
    v41 = v140;
    v99 = 208;
  }
  else
  {
    if (v10->_proxyType != 1)
      goto LABEL_93;
    v139 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyPACURL"), 0, &v139);
    v98 = objc_claimAutoreleasedReturnValue();
    v41 = v139;
    v99 = 216;
  }
  v100 = *(Class *)((char *)&v10->super.super.isa + v99);
  *(Class *)((char *)&v10->super.super.isa + v99) = (Class)v98;

  if (v41)
    goto LABEL_92;
LABEL_93:
  -[MCWiFiPayload ssid](v10, "ssid");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "length");

  if (!v102)
  {
    if (!-[MCWiFiPayload isHotspot](v10, "isHotspot")
      || (-[MCWiFiPayload domainName](v10, "domainName"),
          v103 = (void *)objc_claimAutoreleasedReturnValue(),
          v104 = objc_msgSend(v103, "length"),
          v103,
          !v104))
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("SSID_STR"));
      v51 = objc_claimAutoreleasedReturnValue();
      goto LABEL_99;
    }
    v105 = (void *)MEMORY[0x1E0CB3940];
    -[MCWiFiPayload domainName](v10, "domainName");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "MCMakeUUID");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "stringWithFormat:", CFSTR("%@-%@"), v106, v107);
    v108 = objc_claimAutoreleasedReturnValue();
    v109 = v10->_ssid;
    v10->_ssid = (NSString *)v108;

  }
  v51 = 0;
LABEL_99:
  -[MCWiFiPayload roamingConsortiumOIs](v10, "roamingConsortiumOIs");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "count");

  if (!v111)
    -[MCWiFiPayload setRoamingConsortiumOIs:](v10, "setRoamingConsortiumOIs:", 0);
  if (v51)
    goto LABEL_34;
  -[MCWiFiPayload NAIRealmNames](v10, "NAIRealmNames");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "count");

  if (!v113)
    -[MCWiFiPayload setNAIRealmNames:](v10, "setNAIRealmNames:", 0);
  -[MCWiFiPayload MCCAndMNCs](v10, "MCCAndMNCs");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v114, "count");

  if (!v115)
  {
    -[MCWiFiPayload setMCCAndMNCs:](v10, "setMCCAndMNCs:", 0);
    goto LABEL_65;
  }
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  -[MCWiFiPayload MCCAndMNCs](v10, "MCCAndMNCs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v174, 16);
  if (!v122)
  {
LABEL_123:

    goto LABEL_65;
  }
  v123 = *(_QWORD *)v136;
  while (1)
  {
    v126 = 0;
LABEL_108:
    if (*(_QWORD *)v136 != v123)
      objc_enumerationMutation(obj);
    v116 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v126);
    objc_opt_class();
    v117 = v116;
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v116, "length") != 6)
      break;
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 6; ++i)
    {
      v119 = objc_msgSend(v117, "characterAtIndex:", i);
      v120 = objc_msgSend(v128, "characterIsMember:", v119);
      if (i == 3)
      {
        if ((_DWORD)v119 == 70)
          v121 = 1;
        else
          v121 = v120;
        if ((v121 & 1) == 0)
        {
LABEL_127:

          goto LABEL_128;
        }
      }
      else if ((v120 & 1) == 0)
      {
        goto LABEL_127;
      }
    }

    if (++v126 != v122)
      goto LABEL_108;
    v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v174, 16);
    if (!v122)
      goto LABEL_123;
  }
LABEL_128:
  +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("MCCAndMNCs"));
  v48 = (id)objc_claimAutoreleasedReturnValue();

LABEL_64:
  v51 = (uint64_t)v48;
  if (v48)
    goto LABEL_34;
LABEL_65:

  v134 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AutoJoin"), 0, &v134);
  v81 = objc_claimAutoreleasedReturnValue();
  v12 = v134;
  autoJoinNum = v10->_autoJoinNum;
  v10->_autoJoinNum = (NSNumber *)v81;

  if (v12)
    goto LABEL_35;
  v83 = v10->_autoJoinNum;
  v84 = !v83 || -[NSNumber BOOLValue](v83, "BOOLValue");
  v10->_autoJoin = v84;
  v133 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("FirstAutoJoinRestricted"), 0, &v133);
  v85 = objc_claimAutoreleasedReturnValue();
  v12 = v133;
  isFirstAutoJoinRestricted = v10->_isFirstAutoJoinRestricted;
  v10->_isFirstAutoJoinRestricted = (NSNumber *)v85;

  if (v12)
    goto LABEL_35;
  v132 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("CaptiveBypass"), 0, &v132);
  v87 = objc_claimAutoreleasedReturnValue();
  v12 = v132;
  captiveBypassNum = v10->_captiveBypassNum;
  v10->_captiveBypassNum = (NSNumber *)v87;

  if (v12)
    goto LABEL_35;
  v89 = v10->_captiveBypassNum;
  if (v89)
    LOBYTE(v89) = -[NSNumber BOOLValue](v89, "BOOLValue");
  v10->_captiveBypass = (char)v89;
  v131 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("DisableAssociationMACRandomization"), 0, &v131);
  v90 = objc_claimAutoreleasedReturnValue();
  v12 = v131;
  disableAssociationMACRandomization = v10->_disableAssociationMACRandomization;
  v10->_disableAssociationMACRandomization = (NSNumber *)v90;

  if (v12)
    goto LABEL_35;
  v130 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("QoSMarkingPolicy"), 0, &v130);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v130;
  if (v38)
    goto LABEL_33;
  if (!v127)
  {
    v53 = 0;
    goto LABEL_130;
  }
  v129 = 0;
  -[MCWiFiPayload _qosMarkingConfigIsValid:error:](v10, "_qosMarkingConfigIsValid:error:", v127, &v129);
  v38 = v129;
  if (v38)
    goto LABEL_33;
  -[MCWiFiPayload _createDictionaryWithAllowListKeyMigrated:](v10, "_createDictionaryWithAllowListKeyMigrated:", v127);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_130:
  -[MCWiFiPayload setQosMarkingConfig:](v10, "setQosMarkingConfig:", v53);
  v12 = 0;
LABEL_40:

  if (objc_msgSend(v8, "count"))
  {
    v59 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v60 = v59;
      -[MCPayload friendlyName](v10, "friendlyName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v171 = v61;
      v172 = 2114;
      v173 = v8;
      _os_log_impl(&dword_19ECC4000, v60, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_44:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *ssid;
  NSString *encryptionType;
  void *v7;
  NSNumber *isFirstAutoJoinRestricted;
  void *v9;
  NSNumber *disableAssociationMACRandomization;
  void *v11;
  NSString *proxyServer;
  NSNumber *proxyServerPort;
  NSString *proxyPACURLString;
  NSString *credentialUUID;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSDictionary *eapClientConfig;
  void *v33;
  NSDictionary *v34;
  id v35;
  _QWORD v37[4];
  id v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)MCWiFiPayload;
  -[MCPayload stubDictionary](&v39, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ssid = self->_ssid;
  if (ssid)
    objc_msgSend(v3, "setObject:forKey:", ssid, CFSTR("SSID_STR"));
  encryptionType = self->_encryptionType;
  if (encryptionType)
    objc_msgSend(v4, "setObject:forKey:", encryptionType, CFSTR("EncryptionType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoJoin);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("AutoJoin"));

  isFirstAutoJoinRestricted = self->_isFirstAutoJoinRestricted;
  if (isFirstAutoJoinRestricted)
    objc_msgSend(v4, "setObject:forKey:", isFirstAutoJoinRestricted, CFSTR("FirstAutoJoinRestricted"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captiveBypass);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("CaptiveBypass"));

  disableAssociationMACRandomization = self->_disableAssociationMACRandomization;
  if (disableAssociationMACRandomization)
    objc_msgSend(v4, "setObject:forKey:", disableAssociationMACRandomization, CFSTR("DisableAssociationMACRandomization"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_proxyType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("ProxyType"));

  proxyServer = self->_proxyServer;
  if (proxyServer)
    objc_msgSend(v4, "setObject:forKey:", proxyServer, CFSTR("ProxyServer"));
  proxyServerPort = self->_proxyServerPort;
  if (proxyServerPort)
    objc_msgSend(v4, "setObject:forKey:", proxyServerPort, CFSTR("ProxyServerPort"));
  proxyPACURLString = self->_proxyPACURLString;
  if (proxyPACURLString)
    objc_msgSend(v4, "setObject:forKey:", proxyPACURLString, CFSTR("ProxyPACURL"));
  credentialUUID = self->_credentialUUID;
  if (credentialUUID)
    objc_msgSend(v4, "setObject:forKey:", credentialUUID, CFSTR("CredentialUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCWiFiPayload isHotspot](self, "isHotspot"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("IsHotspot"));

  -[MCWiFiPayload HESSID](self, "HESSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MCWiFiPayload HESSID](self, "HESSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("HESSID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCWiFiPayload isServiceProviderRoamingEnabled](self, "isServiceProviderRoamingEnabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("ServiceProviderRoamingEnabled"));

  -[MCWiFiPayload roamingConsortiumOIs](self, "roamingConsortiumOIs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[MCWiFiPayload roamingConsortiumOIs](self, "roamingConsortiumOIs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("RoamingConsortiumOIs"));

  }
  -[MCWiFiPayload NAIRealmNames](self, "NAIRealmNames");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MCWiFiPayload NAIRealmNames](self, "NAIRealmNames");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("NAIRealmNames"));

  }
  -[MCWiFiPayload MCCAndMNCs](self, "MCCAndMNCs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MCWiFiPayload MCCAndMNCs](self, "MCCAndMNCs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("MCCAndMNCs"));

  }
  -[MCWiFiPayload displayedOperatorName](self, "displayedOperatorName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[MCWiFiPayload displayedOperatorName](self, "displayedOperatorName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("DisplayedOperatorName"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_proxyPACFallbackAllowed);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("ProxyPACFallbackAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isHidden);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("HIDDEN_NETWORK"));

  -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("QoSMarkingPolicy"));

  }
  eapClientConfig = self->_eapClientConfig;
  if (eapClientConfig)
  {
    v33 = (void *)-[NSDictionary mutableCopy](eapClientConfig, "mutableCopy");
    v34 = self->_eapClientConfig;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __31__MCWiFiPayload_stubDictionary__block_invoke;
    v37[3] = &unk_1E41E34E0;
    v38 = v33;
    v35 = v33;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v34, "enumerateKeysAndObjectsUsingBlock:", v37);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("EAPClientConfiguration"));

  }
  return v4;
}

void __31__MCWiFiPayload_stubDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (_nonPrivacySensitiveEAPKeys_onceToken != -1)
    dispatch_once(&_nonPrivacySensitiveEAPKeys_onceToken, &__block_literal_global_19);
  if ((objc_msgSend((id)_nonPrivacySensitiveEAPKeys_keys, "containsObject:", v6) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("(present)"), v6);

}

- (id)subtitle1Label
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[MCWiFiPayload ssid](self, "ssid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR("NETWORK_COLON");
  else
    v3 = CFSTR("NETWORK_MISSING");
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subtitle2Label
{
  void *v2;
  void *v3;

  -[MCWiFiPayload ssid](self, "ssid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    MCLocalizedString(CFSTR("ENCRYPTION_COLON"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_localizedEncryptionTypeString
{
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;

  -[MCWiFiPayload encryptionType](self, "encryptionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCWiFiPayload ssid](self, "ssid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3)
    {
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Any")))
      {
        v6 = v3;
        goto LABEL_8;
      }
      v5 = CFSTR("ANY_ENCRYPTION");
    }
    else
    {
      v5 = CFSTR("NONE");
    }
    MCLocalizedString(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v4 = v6;
  }

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  void *v6;
  void *v7;
  MCKeyValue *v8;
  void *v9;
  MCKeyValue *v10;
  void *v11;
  void *v12;
  MCKeyValue *v13;
  void *v14;
  MCKeyValue *v15;
  void *v16;
  void *v17;
  MCKeyValue *v18;
  void *v19;
  MCKeyValue *v20;
  void *v21;
  void *v22;
  MCKeyValue *v23;
  void *v24;
  MCKeyValue *v25;
  void *v26;
  void *v27;
  MCKeyValue *v28;
  void *v29;
  MCKeyValue *v30;
  void *v31;
  void *v32;
  MCKeyValue *v33;
  void *v34;
  MCKeyValue *v35;
  void *v36;
  MCKeyValue *v37;
  void *v38;
  MCKeyValue *v39;
  void *v40;
  void *v41;
  MCKeyValue *v42;
  MCKeyValue *v43;
  void *v44;
  void *v45;
  MCKeyValue *v46;
  void *v47;
  MCKeyValue *v48;
  void *v49;
  void *v50;
  MCKeyValue *v51;
  void *v52;
  MCKeyValue *v53;
  void *v54;
  void *v55;
  MCKeyValue *v56;
  void *v57;
  MCKeyValue *v58;
  void *v59;
  void *v60;
  MCKeyValue *v61;
  void *v62;
  uint64_t v63;
  unsigned int v64;
  __CFString *v65;
  uint64_t v66;
  MCKeyValue *v67;
  void *v68;
  MCKeyValue *v69;
  void *v70;
  MCKeyValue *v71;
  void *v72;
  void *v73;
  MCKeyValue *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  MCKeyValue *v79;
  void *v80;
  MCKeyValue *v81;
  void *v82;
  _UNKNOWN **v83;
  MCKeyValue *v84;
  void *v85;
  void *v86;
  MCKeyValue *v87;
  void *v88;
  MCKeyValue *v89;
  void *v90;
  void *v91;
  MCKeyValue *v92;
  void *v93;
  MCKeyValue *v94;
  void *v95;
  void *v96;
  MCKeyValue *v97;
  MCKeyValue *v98;
  void *v99;
  void *v100;
  MCKeyValue *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  id v120;
  void *v121;
  void *v122;
  MCKeyValue *v123;
  void *v124;
  void *v125;
  MCKeyValue *v126;
  void *v127;
  void *v128;
  MCKeyValue *v129;
  void *v130;
  void *v131;
  MCKeyValue *v132;
  void *v133;
  void *v134;
  MCKeyValue *v135;
  void *v136;
  MCKeyValue *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  MCKeyValue *v143;
  void *v144;
  MCKeyValue *v145;
  void *v146;
  void *v147;
  id v148;
  void *v150;
  void *v151;
  void *v152;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (-[MCWiFiPayload isHotspot](self, "isHotspot"))
  {
    v5 = [MCKeyValue alloc];
    MCLocalizedStringForBool(1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_HOTSPOT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", v6, v7);

    objc_msgSend(v4, "addObject:", v8);
  }
  -[MCWiFiPayload ssid](self, "ssid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [MCKeyValue alloc];
    -[MCWiFiPayload ssid](self, "ssid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_SSID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MCKeyValue initWithLocalizedString:localizedKey:](v10, "initWithLocalizedString:localizedKey:", v11, v12);

    objc_msgSend(v4, "addObject:", v13);
  }
  -[MCWiFiPayload HESSID](self, "HESSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = [MCKeyValue alloc];
    -[MCWiFiPayload HESSID](self, "HESSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_HESSID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MCKeyValue initWithLocalizedString:localizedKey:](v15, "initWithLocalizedString:localizedKey:", v16, v17);

    objc_msgSend(v4, "addObject:", v18);
  }
  -[MCWiFiPayload displayedOperatorName](self, "displayedOperatorName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = [MCKeyValue alloc];
    -[MCWiFiPayload displayedOperatorName](self, "displayedOperatorName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_OPERATOR"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MCKeyValue initWithLocalizedString:localizedKey:](v20, "initWithLocalizedString:localizedKey:", v21, v22);

    objc_msgSend(v4, "addObject:", v23);
  }
  -[MCWiFiPayload domainName](self, "domainName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = [MCKeyValue alloc];
    -[MCWiFiPayload domainName](self, "domainName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_DOMAIN"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[MCKeyValue initWithLocalizedString:localizedKey:](v25, "initWithLocalizedString:localizedKey:", v26, v27);

    objc_msgSend(v4, "addObject:", v28);
  }
  -[MCWiFiPayload isHiddenNum](self, "isHiddenNum");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_isHiddenNum, "BOOLValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_HIDDEN"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[MCKeyValue initWithLocalizedString:localizedKey:](v30, "initWithLocalizedString:localizedKey:", v31, v32);

    objc_msgSend(v4, "addObject:", v33);
  }
  -[MCWiFiPayload _localizedEncryptionTypeString](self, "_localizedEncryptionTypeString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("WIFI_ENCRYPTION"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[MCKeyValue initWithLocalizedString:localizedKey:](v35, "initWithLocalizedString:localizedKey:", v34, v36);
    objc_msgSend(v4, "addObject:", v37);

  }
  -[MCWiFiPayload autoJoinNum](self, "autoJoinNum");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_autoJoinNum, "BOOLValue"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_AUTOJOIN"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[MCKeyValue initWithLocalizedString:localizedKey:](v39, "initWithLocalizedString:localizedKey:", v40, v41);

    objc_msgSend(v4, "addObject:", v42);
  }
  if (-[MCWiFiPayload captiveBypass](self, "captiveBypass"))
  {
    v43 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_captiveBypassNum, "BOOLValue"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_CAPTIVEBYPASS"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[MCKeyValue initWithLocalizedString:localizedKey:](v43, "initWithLocalizedString:localizedKey:", v44, v45);

    objc_msgSend(v4, "addObject:", v46);
  }
  -[MCWiFiPayload disableAssociationMACRandomization](self, "disableAssociationMACRandomization");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_disableAssociationMACRandomization, "BOOLValue"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_ASSOCIATIONMACRANDOMIZATIONDISABLED"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[MCKeyValue initWithLocalizedString:localizedKey:](v48, "initWithLocalizedString:localizedKey:", v49, v50);

    objc_msgSend(v4, "addObject:", v51);
  }
  -[MCWiFiPayload password](self, "password");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    v53 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PASSWORD"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[MCKeyValue initWithLocalizedString:localizedKey:](v53, "initWithLocalizedString:localizedKey:", v54, v55);

    objc_msgSend(v4, "addObject:", v56);
  }
  -[MCWiFiPayload eapClientConfig](self, "eapClientConfig");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v58 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_EAP_CONFIGURATION"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[MCKeyValue initWithLocalizedString:localizedKey:](v58, "initWithLocalizedString:localizedKey:", v59, v60);

    objc_msgSend(v4, "addObject:", v61);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v62);

    v63 = objc_opt_new();
    v4 = (void *)v63;
  }
  v64 = -[MCWiFiPayload proxyType](self, "proxyType");
  if (v64 > 2)
    v65 = CFSTR("WIFI_PROXY_TYPE_UNKNOWN");
  else
    v65 = off_1E41E3500[v64];
  MCLocalizedString(v65);
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = [MCKeyValue alloc];
  MCLocalizedString(CFSTR("PROXY"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)v66;
  v69 = -[MCKeyValue initWithLocalizedString:localizedKey:](v67, "initWithLocalizedString:localizedKey:", v66, v68);
  objc_msgSend(v4, "addObject:", v69);

  -[MCWiFiPayload proxyServer](self, "proxyServer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    v71 = [MCKeyValue alloc];
    -[MCWiFiPayload proxyServer](self, "proxyServer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("SERVER"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[MCKeyValue initWithLocalizedString:localizedKey:](v71, "initWithLocalizedString:localizedKey:", v72, v73);

    objc_msgSend(v4, "addObject:", v74);
  }
  -[MCWiFiPayload proxyServerPort](self, "proxyServerPort");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    v76 = (void *)MEMORY[0x1E0CB3940];
    -[MCWiFiPayload proxyServerPort](self, "proxyServerPort");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "stringWithFormat:", CFSTR("%@"), v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PORT"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = -[MCKeyValue initWithLocalizedString:localizedKey:](v79, "initWithLocalizedString:localizedKey:", v78, v80);

    objc_msgSend(v4, "addObject:", v81);
  }
  -[MCWiFiPayload proxyUsername](self, "proxyUsername");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = &off_1E41DE000;
  if (v82)
  {
    v84 = [MCKeyValue alloc];
    -[MCWiFiPayload proxyUsername](self, "proxyUsername");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("USERNAME"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = -[MCKeyValue initWithLocalizedString:localizedKey:](v84, "initWithLocalizedString:localizedKey:", v85, v86);

    objc_msgSend(v4, "addObject:", v87);
  }
  -[MCWiFiPayload proxyPassword](self, "proxyPassword");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    v89 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PASSWORD"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = -[MCKeyValue initWithLocalizedString:localizedKey:](v89, "initWithLocalizedString:localizedKey:", v90, v91);

    objc_msgSend(v4, "addObject:", v92);
  }
  -[MCWiFiPayload proxyPACURLString](self, "proxyPACURLString");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    v94 = [MCKeyValue alloc];
    -[MCWiFiPayload proxyPACURLString](self, "proxyPACURLString");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_PROXY_PAC_URL"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = -[MCKeyValue initWithLocalizedString:localizedKey:](v94, "initWithLocalizedString:localizedKey:", v95, v96);

    objc_msgSend(v4, "addObject:", v97);
  }
  if (-[MCWiFiPayload proxyType](self, "proxyType") == 1)
  {
    v98 = [MCKeyValue alloc];
    MCStringForBool(-[MCWiFiPayload proxyPACFallbackAllowed](self, "proxyPACFallbackAllowed"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_PROXY_PAC_FALLBACK"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = -[MCKeyValue initWithLocalizedString:localizedKey:](v98, "initWithLocalizedString:localizedKey:", v99, v100);

    objc_msgSend(v4, "addObject:", v101);
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v102);

  }
  -[MCWiFiPayload roamingConsortiumOIs](self, "roamingConsortiumOIs");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "count");

  if (v104)
  {
    -[MCWiFiPayload roamingConsortiumOIs](self, "roamingConsortiumOIs");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_ROAMING_CONSORTIUM_OIS"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v105, v106, 0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v107);
  }
  -[MCWiFiPayload NAIRealmNames](self, "NAIRealmNames");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v108, "count");

  if (v109)
  {
    -[MCWiFiPayload NAIRealmNames](self, "NAIRealmNames");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_NAI_REALM_NAMES"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v110, v111, 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v112);
  }
  -[MCWiFiPayload MCCAndMNCs](self, "MCCAndMNCs");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "count");

  if (v114)
  {
    -[MCWiFiPayload MCCAndMNCs](self, "MCCAndMNCs");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WIFI_MCC_AND_MNCS"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v115, v116, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v117);
  }
  -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "count");

  if (v119)
  {
    v150 = v34;
    v151 = v3;
    v120 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("QoSMarkingEnabled"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    if (v122)
    {
      v123 = [MCKeyValue alloc];
      MCLocalizedStringForBool(objc_msgSend(v122, "BOOLValue"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(CFSTR("WIFI_QOS_MARKING_ENABLED"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = -[MCKeyValue initWithLocalizedString:localizedKey:](v123, "initWithLocalizedString:localizedKey:", v124, v125);

      objc_msgSend(v120, "addObject:", v126);
    }
    -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("QoSMarkingAppleAudioVideoCalls"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (v128)
    {
      v129 = [MCKeyValue alloc];
      MCLocalizedStringForBool(objc_msgSend(v128, "BOOLValue"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(CFSTR("WIFI_QOS_APPLE_AUDIO_VIDEO_CALLS"));
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = -[MCKeyValue initWithLocalizedString:localizedKey:](v129, "initWithLocalizedString:localizedKey:", v130, v131);

      objc_msgSend(v120, "addObject:", v132);
    }
    -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("QoSMarkingURL"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (v134)
    {
      v135 = [MCKeyValue alloc];
      MCLocalizedString(CFSTR("WIFI_QOS_MARKING_URL"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = -[MCKeyValue initWithLocalizedString:localizedKey:](v135, "initWithLocalizedString:localizedKey:", v134, v136);

      objc_msgSend(v120, "addObject:", v137);
    }
    -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("QoSMarkingAllowListAppIdentifiers"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = v139;
    if (v139)
    {
      v141 = v139;
    }
    else
    {
      -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("QoSMarkingWhitelistedAppIdentifiers"));
      v141 = (id)objc_claimAutoreleasedReturnValue();

      v83 = &off_1E41DE000;
    }

    if (objc_msgSend(v141, "count"))
    {
      v143 = [MCKeyValue alloc];
      MCLocalizedString(CFSTR("WIFI_QOS_MARKED_APP_IDS"));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = -[MCKeyValue initWithLocalizedArray:localizedKey:](v143, "initWithLocalizedArray:localizedKey:", v141, v144);

      v83 = &off_1E41DE000;
      objc_msgSend(v120, "addObject:", v145);

    }
    v3 = v151;
    if (objc_msgSend(v120, "count"))
    {
      objc_msgSend(v83[133], "sectionWithKeyValues:", v120);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(CFSTR("WIFI_QOS_MARKING_POLICY"));
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setSectionTitle:", v147);

      objc_msgSend(v151, "addObject:", v146);
    }

    v34 = v150;
  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  v148 = v3;

  return v148;
}

- (id)verboseDescription
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v45;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v45.receiver = self;
  v45.super_class = (Class)MCWiFiPayload;
  -[MCPayload verboseDescription](&v45, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MCWiFiPayload isHotspot](self, "isHotspot"))
    objc_msgSend(v5, "appendString:", CFSTR("IsHotspot   : Yes\n"));
  -[MCWiFiPayload ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCWiFiPayload ssid](self, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("SSID        : %@\n"), v7);

  }
  -[MCWiFiPayload HESSID](self, "HESSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCWiFiPayload HESSID](self, "HESSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("HESSID      : %@\n"), v9);

  }
  -[MCWiFiPayload roamingConsortiumOIs](self, "roamingConsortiumOIs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCWiFiPayload roamingConsortiumOIs](self, "roamingConsortiumOIs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Roaming Consortium OIs:\n%@\n"), v11);

  }
  -[MCWiFiPayload NAIRealmNames](self, "NAIRealmNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MCWiFiPayload NAIRealmNames](self, "NAIRealmNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("NAI Realm Names:\n%@\n"), v13);

  }
  -[MCWiFiPayload MCCAndMNCs](self, "MCCAndMNCs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MCWiFiPayload MCCAndMNCs](self, "MCCAndMNCs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("MCC and MNCs:\n%@\n"), v15);

  }
  -[MCWiFiPayload displayedOperatorName](self, "displayedOperatorName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MCWiFiPayload displayedOperatorName](self, "displayedOperatorName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Operator    : %@\n"), v17);

  }
  -[MCWiFiPayload domainName](self, "domainName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MCWiFiPayload domainName](self, "domainName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Domain      : %@\n"), v19);

  }
  MCStringForBool(self->_isHidden);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Hidden      : %@\n"), v20);

  -[MCWiFiPayload encryptionType](self, "encryptionType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Encryption  : %@\n"), v21);

  MCStringForBool(self->_autoJoin);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Autojoin    : %@\n"), v22);

  -[MCWiFiPayload isFirstAutoJoinRestricted](self, "isFirstAutoJoinRestricted");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[MCWiFiPayload isFirstAutoJoinRestricted](self, "isFirstAutoJoinRestricted");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    MCStringForBool(objc_msgSend(v24, "BOOLValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("First Autojoin Restricted: %@\n"), v25);

  }
  -[MCWiFiPayload password](self, "password");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    objc_msgSend(v5, "appendFormat:", CFSTR("Password    : (present)\n"));
  -[MCWiFiPayload eapClientConfig](self, "eapClientConfig");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    objc_msgSend(v5, "appendFormat:", CFSTR("EAP Config  : (present)\n"));
  -[MCWiFiPayload qosMarkingConfig](self, "qosMarkingConfig");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    objc_msgSend(v5, "appendFormat:", CFSTR("QoS Marking Policy Config  : (present)\n"));
  -[MCWiFiPayload disableAssociationMACRandomization](self, "disableAssociationMACRandomization");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[MCWiFiPayload disableAssociationMACRandomization](self, "disableAssociationMACRandomization");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    MCStringForBool(objc_msgSend(v30, "BOOLValue") ^ 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Randomization: %@\n"), v31);

  }
  v32 = -[MCWiFiPayload proxyType](self, "proxyType");
  if (v32 > 2)
    v33 = CFSTR("Unknown");
  else
    v33 = off_1E41E3518[v32];
  objc_msgSend(v5, "appendFormat:", CFSTR("Proxy       : %@\n"), v33);
  -[MCWiFiPayload proxyServer](self, "proxyServer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[MCWiFiPayload proxyServer](self, "proxyServer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  Server    : %@\n"), v35);

  }
  -[MCWiFiPayload proxyServerPort](self, "proxyServerPort");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[MCWiFiPayload proxyServerPort](self, "proxyServerPort");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  Port      : %@\n"), v37);

  }
  -[MCWiFiPayload proxyUsername](self, "proxyUsername");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[MCWiFiPayload proxyUsername](self, "proxyUsername");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  Username  : %@\n"), v39);

  }
  -[MCWiFiPayload proxyPassword](self, "proxyPassword");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    objc_msgSend(v5, "appendFormat:", CFSTR("  Password  : (present)\n"));
  -[MCWiFiPayload proxyPACURLString](self, "proxyPACURLString");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[MCWiFiPayload proxyPACURLString](self, "proxyPACURLString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  PAC URL   : %@\n"), v42);

  }
  if (-[MCWiFiPayload proxyType](self, "proxyType") == 1)
  {
    MCStringForBool(-[MCWiFiPayload proxyPACFallbackAllowed](self, "proxyPACFallbackAllowed"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("   fallback : %@\n"), v43);

  }
  return v5;
}

- (id)installationWarnings
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  __CFString *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (-[MCWiFiPayload proxyType](self, "proxyType"))
  {
    +[MCHacks sharedHacks](MCHacks, "sharedHacks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isGreenTea"))
      v4 = CFSTR("INSTALL_WARNING_WLAN");
    else
      v4 = CFSTR("INSTALL_WARNING_WIFI");
    MCLocalizedStringByDevice(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[MCWiFiPayload disableAssociationMACRandomization](self, "disableAssociationMACRandomization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    v10 = 0;
    v11 = v5 != 0;
LABEL_15:
    if (v11)
      v13 = v5;
    else
      v13 = v10;
    v12 = v13;
    goto LABEL_19;
  }
  +[MCHacks sharedHacks](MCHacks, "sharedHacks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isGreenTea"))
    v9 = CFSTR("INSTALL_WARNING_WLAN_RANDOMIZATION");
  else
    v9 = CFSTR("INSTALL_WARNING_WIFI_RANDOMIZATION");
  MCLocalizedStringByDevice(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v5 != 0;
  if (!v5 || !v10)
    goto LABEL_15;
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@"), v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  v14 = v12;
  if (v12)
  {
    +[MCHacks sharedHacks](MCHacks, "sharedHacks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isGreenTea"))
      v16 = CFSTR("INSTALL_WARNING_WLAN_TITLE");
    else
      v16 = CFSTR("INSTALL_WARNING_WIFI_TITLE");
    MCLocalizedString(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v17, v14, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)userInputFields
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCWiFiPayload username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 && -[MCWiFiPayload usernameRequired](self, "usernameRequired"))
  {
    MCLocalizedString(CFSTR("USERNAME_PROMPT_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(CFSTR("WIFI_USERNAME_PROMPT_DESCRIPTION"), "MCAppendGreenteaSuffix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCWiFiPayload ssid](self, "ssid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCPayloadUserPromptUtilities promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCPayloadUserPromptUtilities, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("UsernameUserInputKey"), v5, v10, 0, 0, 0, 0, 0, 0x100000000);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[MCWiFiPayload password](self, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_10;
  if (-[MCWiFiPayload passwordRequired](self, "passwordRequired"))
  {
    v13 = objc_msgSend(v4, "length");
    v14 = (void *)MEMORY[0x1E0CB3940];
    if (v13)
    {
      objc_msgSend(CFSTR("WIFI_PASSWORD_ACCOUNT_PROMPT_DESCRIPTION"), "MCAppendGreenteaSuffix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v16, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(CFSTR("WIFI_PASSWORD_PROMPT_DESCRIPTION"), "MCAppendGreenteaSuffix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCWiFiPayload ssid](self, "ssid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v16, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCPayloadUserPromptUtilities promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCPayloadUserPromptUtilities, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("PasswordUserInputKey"), v18, v12, 0, 0, 0, 0, 0, 0x100000003);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

LABEL_10:
  }

  return v3;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  void *v4;
  void *v5;
  NSString *proxyServer;
  NSNumber *proxyServerPort;
  NSString *proxyUsername;
  NSString *proxyPassword;
  NSString *v10;
  NSString *proxyPACURLString;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_proxyType)
  {
    objc_msgSend(v4, "addObject:", CFSTR("ProxyType"));
    self->_proxyType = 0;
  }
  if (self->_proxyServer)
  {
    objc_msgSend(v5, "addObject:", CFSTR("ProxyServer"));
    proxyServer = self->_proxyServer;
    self->_proxyServer = 0;

  }
  if (self->_proxyServerPort)
  {
    objc_msgSend(v5, "addObject:", CFSTR("ProxyServerPort"));
    proxyServerPort = self->_proxyServerPort;
    self->_proxyServerPort = 0;

  }
  if (self->_proxyUsername)
  {
    objc_msgSend(v5, "addObject:", CFSTR("ProxyUsername"));
    proxyUsername = self->_proxyUsername;
    self->_proxyUsername = 0;

  }
  if (self->_proxyPassword)
  {
    objc_msgSend(v5, "addObject:", CFSTR("ProxyPassword"));
    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = 0;

    if (self->_proxyPassword)
    {
      objc_msgSend(v5, "addObject:", CFSTR("ProxyPassword"));
      v10 = self->_proxyPassword;
      self->_proxyPassword = 0;

    }
  }
  if (self->_proxyPACURLString)
  {
    objc_msgSend(v5, "addObject:", CFSTR("ProxyPACURL"));
    proxyPACURLString = self->_proxyPACURLString;
    self->_proxyPACURLString = 0;

  }
  if (self->_proxyPACFallbackAllowed)
  {
    objc_msgSend(v5, "addObject:", CFSTR("ProxyPACFallbackAllowed"));
    self->_proxyPACFallbackAllowed = 0;
  }
  if (objc_msgSend(v5, "count"))
  {
    v12 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      -[MCPayload friendlyName](self, "friendlyName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_INFO, "Payload “%{public}@” has ignored proxy keys. They are: %{public}@", (uint8_t *)&v16, 0x16u);

    }
  }

  return 0;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_storeStrong((id *)&self->_ssid, a3);
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)captiveBypass
{
  return self->_captiveBypass;
}

- (void)setCaptiveBypass:(BOOL)a3
{
  self->_captiveBypass = a3;
}

- (NSString)encryptionType
{
  return self->_encryptionType;
}

- (void)setEncryptionType:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionType, a3);
}

- (BOOL)isWEP
{
  return self->_isWEP;
}

- (void)setIsWEP:(BOOL)a3
{
  self->_isWEP = a3;
}

- (BOOL)isWPA
{
  return self->_isWPA;
}

- (void)setIsWPA:(BOOL)a3
{
  self->_isWPA = a3;
}

- (NSDictionary)eapClientConfig
{
  return self->_eapClientConfig;
}

- (void)setEapClientConfig:(id)a3
{
  objc_storeStrong((id *)&self->_eapClientConfig, a3);
}

- (NSDictionary)qosMarkingConfig
{
  return self->_qosMarkingConfig;
}

- (void)setQosMarkingConfig:(id)a3
{
  objc_storeStrong((id *)&self->_qosMarkingConfig, a3);
}

- (NSNumber)disableAssociationMACRandomization
{
  return self->_disableAssociationMACRandomization;
}

- (void)setDisableAssociationMACRandomization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)passwordRequired
{
  return self->_passwordRequired;
}

- (void)setPasswordRequired:(BOOL)a3
{
  self->_passwordRequired = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (BOOL)usernameRequired
{
  return self->_usernameRequired;
}

- (void)setUsernameRequired:(BOOL)a3
{
  self->_usernameRequired = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (BOOL)autoJoin
{
  return self->_autoJoin;
}

- (void)setAutoJoin:(BOOL)a3
{
  self->_autoJoin = a3;
}

- (NSNumber)isFirstAutoJoinRestricted
{
  return self->_isFirstAutoJoinRestricted;
}

- (void)setIsFirstAutoJoinRestricted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (void)setCertificateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_certificateUUID, a3);
}

- (NSArray)payloadCertificateAnchorUUID
{
  return self->_payloadCertificateAnchorUUID;
}

- (void)setPayloadCertificateAnchorUUID:(id)a3
{
  objc_storeStrong((id *)&self->_payloadCertificateAnchorUUID, a3);
}

- (int)proxyType
{
  return self->_proxyType;
}

- (void)setProxyType:(int)a3
{
  self->_proxyType = a3;
}

- (NSString)proxyServer
{
  return self->_proxyServer;
}

- (void)setProxyServer:(id)a3
{
  objc_storeStrong((id *)&self->_proxyServer, a3);
}

- (NSNumber)proxyServerPort
{
  return self->_proxyServerPort;
}

- (void)setProxyServerPort:(id)a3
{
  objc_storeStrong((id *)&self->_proxyServerPort, a3);
}

- (NSString)proxyUsername
{
  return self->_proxyUsername;
}

- (void)setProxyUsername:(id)a3
{
  objc_storeStrong((id *)&self->_proxyUsername, a3);
}

- (NSString)proxyPassword
{
  return self->_proxyPassword;
}

- (void)setProxyPassword:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPassword, a3);
}

- (NSString)proxyPACURLString
{
  return self->_proxyPACURLString;
}

- (void)setProxyPACURLString:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPACURLString, a3);
}

- (BOOL)proxyPACFallbackAllowed
{
  return self->_proxyPACFallbackAllowed;
}

- (void)setProxyPACFallbackAllowed:(BOOL)a3
{
  self->_proxyPACFallbackAllowed = a3;
}

- (NSString)credentialUUID
{
  return self->_credentialUUID;
}

- (void)setCredentialUUID:(id)a3
{
  objc_storeStrong((id *)&self->_credentialUUID, a3);
}

- (BOOL)isHotspot
{
  return self->_isHotspot;
}

- (void)setIsHotspot:(BOOL)a3
{
  self->_isHotspot = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_domainName, a3);
}

- (NSString)HESSID
{
  return self->_HESSID;
}

- (void)setHESSID:(id)a3
{
  objc_storeStrong((id *)&self->_HESSID, a3);
}

- (BOOL)isServiceProviderRoamingEnabled
{
  return self->_serviceProviderRoamingEnabled;
}

- (void)setServiceProviderRoamingEnabled:(BOOL)a3
{
  self->_serviceProviderRoamingEnabled = a3;
}

- (NSArray)roamingConsortiumOIs
{
  return self->_roamingConsortiumOIs;
}

- (void)setRoamingConsortiumOIs:(id)a3
{
  objc_storeStrong((id *)&self->_roamingConsortiumOIs, a3);
}

- (NSArray)NAIRealmNames
{
  return self->_NAIRealmNames;
}

- (void)setNAIRealmNames:(id)a3
{
  objc_storeStrong((id *)&self->_NAIRealmNames, a3);
}

- (NSArray)MCCAndMNCs
{
  return self->_MCCAndMNCs;
}

- (void)setMCCAndMNCs:(id)a3
{
  objc_storeStrong((id *)&self->_MCCAndMNCs, a3);
}

- (NSString)displayedOperatorName
{
  return self->_displayedOperatorName;
}

- (void)setDisplayedOperatorName:(id)a3
{
  objc_storeStrong((id *)&self->_displayedOperatorName, a3);
}

- (NSNumber)isHiddenNum
{
  return self->_isHiddenNum;
}

- (void)setIsHiddenNum:(id)a3
{
  objc_storeStrong((id *)&self->_isHiddenNum, a3);
}

- (NSNumber)autoJoinNum
{
  return self->_autoJoinNum;
}

- (void)setAutoJoinNum:(id)a3
{
  objc_storeStrong((id *)&self->_autoJoinNum, a3);
}

- (NSNumber)captiveBypassNum
{
  return self->_captiveBypassNum;
}

- (void)setCaptiveBypassNum:(id)a3
{
  objc_storeStrong((id *)&self->_captiveBypassNum, a3);
}

- (NSNumber)proxyPACFallbackAllowedNum
{
  return self->_proxyPACFallbackAllowedNum;
}

- (void)setProxyPACFallbackAllowedNum:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPACFallbackAllowedNum, a3);
}

- (NSNumber)isHotspotNum
{
  return self->_isHotspotNum;
}

- (void)setIsHotspotNum:(id)a3
{
  objc_storeStrong((id *)&self->_isHotspotNum, a3);
}

- (NSNumber)serviceProviderRoamingEnabledNum
{
  return self->_serviceProviderRoamingEnabledNum;
}

- (void)setServiceProviderRoamingEnabledNum:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderRoamingEnabledNum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderRoamingEnabledNum, 0);
  objc_storeStrong((id *)&self->_isHotspotNum, 0);
  objc_storeStrong((id *)&self->_proxyPACFallbackAllowedNum, 0);
  objc_storeStrong((id *)&self->_captiveBypassNum, 0);
  objc_storeStrong((id *)&self->_autoJoinNum, 0);
  objc_storeStrong((id *)&self->_isHiddenNum, 0);
  objc_storeStrong((id *)&self->_displayedOperatorName, 0);
  objc_storeStrong((id *)&self->_MCCAndMNCs, 0);
  objc_storeStrong((id *)&self->_NAIRealmNames, 0);
  objc_storeStrong((id *)&self->_roamingConsortiumOIs, 0);
  objc_storeStrong((id *)&self->_HESSID, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_credentialUUID, 0);
  objc_storeStrong((id *)&self->_proxyPACURLString, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyUsername, 0);
  objc_storeStrong((id *)&self->_proxyServerPort, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
  objc_storeStrong((id *)&self->_payloadCertificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_isFirstAutoJoinRestricted, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_disableAssociationMACRandomization, 0);
  objc_storeStrong((id *)&self->_qosMarkingConfig, 0);
  objc_storeStrong((id *)&self->_eapClientConfig, 0);
  objc_storeStrong((id *)&self->_encryptionType, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
