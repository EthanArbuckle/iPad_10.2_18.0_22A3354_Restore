@implementation CDPDevice(Daemon)

- (_BYTE)initWithSecureBackupRecordInfo:()Daemon
{
  id v5;
  void *v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClientMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_BYTE *)objc_msgSend(a1, "initWithSecureBackupMetadataInfo:", v7);

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recordID"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (int)*MEMORY[0x24BE1A528];
    v11 = *(void **)&v8[v10];
    *(_QWORD *)&v8[v10] = v9;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE17CD0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");
    v8[*MEMORY[0x24BE1A4D8]] = v14;

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE17C90]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");
    *(_QWORD *)&v8[*MEMORY[0x24BE1A538]] = v16;

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE17C70]);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (int)*MEMORY[0x24BE1A540];
    v19 = *(void **)&v8[v18];
    *(_QWORD *)&v8[v18] = v17;

    v20 = *(void **)&v8[v18];
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "serialNumber");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqualToString:", v22);
    v8[*MEMORY[0x24BE1A4D0]] = v23;

    objc_storeStrong((id *)&v8[*MEMORY[0x24BE1A530]], a3);
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE17C88]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRecoveryStatus:", objc_msgSend(v24, "unsignedIntegerValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE17BE8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCoolOffPeriod:", v25);

  }
  return v8;
}

- (id)initWithEscrowRecord:()Daemon
{
  id v5;
  void *v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "escrowInformationMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_BYTE *)objc_msgSend(a1, "initWithEscrowRecordMetadata:", v7);

    if (v8)
    {
      objc_msgSend(v6, "recordId");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (int)*MEMORY[0x24BE1A528];
      v11 = *(void **)&v8[v10];
      *(_QWORD *)&v8[v10] = v9;

      objc_msgSend(v6, "escrowInformationMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "secureBackupUsesMultipleIcscs") != 0;
      v8[*MEMORY[0x24BE1A4D8]] = v13;

      v14 = objc_msgSend(v6, "remainingAttempts");
      *(_QWORD *)&v8[*MEMORY[0x24BE1A538]] = v14;
      objc_msgSend(v6, "serialNumber");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (int)*MEMORY[0x24BE1A540];
      v17 = *(void **)&v8[v16];
      *(_QWORD *)&v8[v16] = v15;

      v18 = *(void **)&v8[v16];
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "serialNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "isEqualToString:", v20);
      v8[*MEMORY[0x24BE1A4D0]] = v21;

      objc_msgSend(MEMORY[0x24BE6E100], "escrowRecordToDictionary:", v6);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (int)*MEMORY[0x24BE1A530];
      v24 = *(void **)&v8[v23];
      *(_QWORD *)&v8[v23] = v22;

      objc_storeStrong((id *)&v8[*MEMORY[0x24BE1A518]], a3);
      objc_msgSend(v8, "setRecoveryStatus:", (int)objc_msgSend(v6, "recoveryStatus"));
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v6, "coolOffEnd"));
      objc_msgSend(v8, "setCoolOffPeriod:", v25);

    }
    a1 = v8;
    v26 = a1;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (uint64_t)initWithSecureBackupMetadataInfo:()Daemon
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id *v19;
  id v20;
  uint64_t v21;
  id *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  v4 = a3;
  v5 = objc_msgSend(a1, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_mid"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (int)*MEMORY[0x24BE1A4E8];
    v8 = *(void **)(v5 + v7);
    *(_QWORD *)(v5 + v7) = v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kSecureBackupEscrowedSPKIKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (int)*MEMORY[0x24BE1A548];
    v11 = *(void **)(v5 + v10);
    *(_QWORD *)(v5 + v10) = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_name"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (int)*MEMORY[0x24BE1A4E0];
    v14 = *(void **)(v5 + v13);
    *(_QWORD *)(v5 + v13) = v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_model"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (int)*MEMORY[0x24BE1A4F0];
    v17 = *(void **)(v5 + v16);
    *(_QWORD *)(v5 + v16) = v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_model_version"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (id *)(v5 + (int)*MEMORY[0x24BE1A500]);
    v20 = *v19;
    *v19 = (id)v18;

    if (!*v19)
      objc_storeStrong(v19, *(id *)(v5 + v16));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_model_class"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (id *)(v5 + (int)*MEMORY[0x24BE1A4F8]);
    v23 = *v22;
    *v22 = (id)v21;

    if (!*v22)
      objc_storeStrong(v22, *(id *)(v5 + v16));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_platform"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "integerValue");
    *(_QWORD *)(v5 + (int)*MEMORY[0x24BE1A510]) = v25;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE17CD8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");
    *(_BYTE *)(v5 + (int)*MEMORY[0x24BE1A4C8]) = v27;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE17C60]);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (int)*MEMORY[0x24BE1A508];
    v30 = *(void **)(v5 + v29);
    *(_QWORD *)(v5 + v29) = v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ClientMetadata"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("SecureBackupMetadataTimestamp"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CDPDSecureBackupController _dateWithSecureBackupDateString:](CDPDSecureBackupController, "_dateWithSecureBackupDateString:", v33);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
    }
    v35 = (int)*MEMORY[0x24BE1A520];
    v36 = *(void **)(v5 + v35);
    *(_QWORD *)(v5 + v35) = v34;
    v37 = v34;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_color"));
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (int)*MEMORY[0x24BE1A4B8];
    v40 = *(void **)(v5 + v39);
    *(_QWORD *)(v5 + v39) = v38;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_enclosure_color"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (int)*MEMORY[0x24BE1A4C0];
    v43 = *(void **)(v5 + v42);
    *(_QWORD *)(v5 + v42) = v41;

  }
  return v5;
}

- (uint64_t)initWithEscrowRecordMetadata:()Daemon
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id *v21;
  id v22;
  uint64_t v23;
  id *v24;
  id v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  v4 = a3;
  v5 = objc_msgSend(a1, "init");
  objc_msgSend(v4, "clientMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "deviceMid");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (int)*MEMORY[0x24BE1A4E8];
    v10 = *(void **)(v5 + v9);
    *(_QWORD *)(v5 + v9) = v8;

    objc_msgSend(v4, "escrowedSpki");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (int)*MEMORY[0x24BE1A548];
    v13 = *(void **)(v5 + v12);
    *(_QWORD *)(v5 + v12) = v11;

    objc_msgSend(v7, "deviceName");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (int)*MEMORY[0x24BE1A4E0];
    v16 = *(void **)(v5 + v15);
    *(_QWORD *)(v5 + v15) = v14;

    objc_msgSend(v7, "deviceModel");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (int)*MEMORY[0x24BE1A4F0];
    v19 = *(void **)(v5 + v18);
    *(_QWORD *)(v5 + v18) = v17;

    objc_msgSend(v7, "deviceModelVersion");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (id *)(v5 + (int)*MEMORY[0x24BE1A500]);
    v22 = *v21;
    *v21 = (id)v20;

    if (!*v21)
      objc_storeStrong(v21, *(id *)(v5 + v18));
    objc_msgSend(v7, "deviceModelClass");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (id *)(v5 + (int)*MEMORY[0x24BE1A4F8]);
    v25 = *v24;
    *v24 = (id)v23;

    if (!*v24)
      objc_storeStrong(v24, *(id *)(v5 + v18));
    v26 = objc_msgSend(v7, "devicePlatform");
    *(_QWORD *)(v5 + (int)*MEMORY[0x24BE1A510]) = v26;
    v27 = objc_msgSend(v7, "secureBackupUsesNumericPassphrase") != 0;
    *(_BYTE *)(v5 + (int)*MEMORY[0x24BE1A4C8]) = v27;
    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v7, "secureBackupNumericPassphraseLength"));
    v29 = (int)*MEMORY[0x24BE1A508];
    v30 = *(void **)(v5 + v29);
    *(_QWORD *)(v5 + v29) = v28;

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "secureBackupMetadataTimestamp"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (int)*MEMORY[0x24BE1A520];
    v33 = *(void **)(v5 + v32);
    *(_QWORD *)(v5 + v32) = v31;
    v34 = v31;

    objc_msgSend(v7, "deviceColor");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (int)*MEMORY[0x24BE1A4B8];
    v37 = *(void **)(v5 + v36);
    *(_QWORD *)(v5 + v36) = v35;

    objc_msgSend(v7, "deviceEnclosureColor");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (int)*MEMORY[0x24BE1A4C0];
    v40 = *(void **)(v5 + v39);
    *(_QWORD *)(v5 + v39) = v38;

  }
  return v5;
}

@end
