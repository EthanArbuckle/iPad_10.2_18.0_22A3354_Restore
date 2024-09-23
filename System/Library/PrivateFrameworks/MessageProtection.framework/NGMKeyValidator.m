@implementation NGMKeyValidator

+ (unint64_t)validatorLength
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a1, "rangeOnPublicKey");
  v4 = 3 * v3;
  objc_msgSend(a1, "versionByte");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") + v4;

  return v6;
}

+ (_NSRange)rangeOnPublicKey
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 2;
  result.length = v3;
  result.location = v2;
  return result;
}

+ (id)versionByte
{
  char v3;

  v3 = +[NGMProtocolVersion supportedVersion](NGMProtocolVersion, "supportedVersion");
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isValidKeyValidator:(id)a3 receiversIdentity:(id)a4 sendersIdentity:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  char v40;
  uint64_t v41;
  __CFString *v42;
  NSObject *v43;
  char v44;
  const __CFString *v45;
  __CFString *v47;
  __CFString *v48;
  int v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  id v53;
  int v54;
  int v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint8_t buf[4];
  __CFString *v77;
  __int16 v78;
  __CFString *v79;
  __int16 v80;
  const __CFString *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v62 = a5;
  v11 = objc_msgSend(a1, "rangeOnPublicKey");
  v13 = v12;
  v14 = objc_msgSend(v9, "length");
  v15 = objc_msgSend(a1, "validatorLength");
  if (v14 == v15)
  {
    objc_msgSend(v9, "subdataWithRange:", 0, 2);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subdataWithRange:", 2, 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subdataWithRange:", 4, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subdataWithRange:", 6, 1);
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (!+[NGMProtocolVersion isVersionSupported:](NGMProtocolVersion, "isVersionSupported:", *(unsigned __int8 *)objc_msgSend(v58, "bytes")))
    {
      MPLogAndAssignError(900, a6, CFSTR("Discarding this payload because of bad NGM version."));
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend(v62, "signingKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subdataWithRange:", v11, v13);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = -[NSObject isEqualToData:](v16, "isEqualToData:", v57);
    objc_msgSend(v10, "deviceSigningKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "publicKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dataRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "subdataWithRange:", v11, v13);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_msgSend(v60, "isEqualToData:", v56);
    v72 = 0;
    v73 = &v72;
    v74 = 0x2020000000;
    v75 = 0;
    objc_msgSend(v10, "devicePrekeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v22, "count") == 0;

    if ((_DWORD)v19)
    {
      MessageProtectionLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        if ((v55 & 1) != 0)
        {
          v47 = &stru_24C4C0760;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("❌ The sender signing key's was incorrect. Found bytes: %@, expected %@ . \n"), v57, v16);
          v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if ((v54 & 1) != 0)
        {
          v51 = &stru_24C4C0760;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("❌ The receiver's signing key was incorrect. Found bytes: %@, expected %@. \n"), v56, v60);
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412802;
        v77 = v47;
        v78 = 2112;
        v79 = v51;
        v80 = 2112;
        v81 = CFSTR("No prekeys were found on the device");
        _os_log_error_impl(&dword_20BABB000, v43, OS_LOG_TYPE_ERROR, "While checking the key validator, we found the following issues: \n %@%@%@", buf, 0x20u);
        if ((v54 & 1) == 0)

        if ((v55 & 1) == 0)
      }

      MPLogAndAssignError(807, a6, CFSTR("Sender and receiver's keys are incorrect."));
      goto LABEL_43;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "devicePrekeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x24BDAC760];
    v66[0] = MEMORY[0x24BDAC760];
    v66[1] = 3221225472;
    v66[2] = __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke;
    v66[3] = &unk_24C4BEFC8;
    v70 = v11;
    v71 = v13;
    v26 = v23;
    v67 = v26;
    v27 = v59;
    v68 = v27;
    v69 = &v72;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v66);

    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v63[0] = v25;
    v63[1] = 3221225472;
    v63[2] = __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke_16;
    v63[3] = &unk_24C4BEFF0;
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v64 = v28;
    v29 = v26;
    v65 = v29;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v63);
    if ((v55 & v54) == 1 && *((_BYTE *)v73 + 24))
    {
      if (!a6 || !*a6)
        goto LABEL_42;
      v30 = objc_msgSend(*a6, "code");
      objc_msgSend(*a6, "description");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      MPLogAndAssignError(v30 + 10000, a6, v31);
      goto LABEL_38;
    }
    MessageProtectionLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v53 = v28;
      if ((v55 & 1) != 0)
      {
        v52 = &stru_24C4C0760;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("❌ The sender signing key's was incorrect. Found bytes: %@, expected %@ . \n"), v57, v16);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if ((v54 & 1) != 0)
      {
        v48 = &stru_24C4C0760;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("❌ The receiver's signing key was incorrect. Found bytes: %@, expected %@. \n"), v56, v60);
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v49 = *((unsigned __int8 *)v73 + 24);
      if (*((_BYTE *)v73 + 24))
      {
        v50 = &stru_24C4C0760;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("❌ No prekey was found that matches the one in the validator (%@). Was it already deleted? Prekeys on device are: %@. \n"), v27, v53);
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      v77 = v52;
      v78 = 2112;
      v79 = v48;
      v80 = 2112;
      v81 = v50;
      _os_log_error_impl(&dword_20BABB000, v39, OS_LOG_TYPE_ERROR, "While checking the key validator, we found the following issues: \n %@%@%@", buf, 0x20u);
      if (!v49)

      v28 = v53;
      if ((v54 & 1) == 0)

      if ((v55 & 1) == 0)
    }

    if (((v55 | v54) & 1) != 0 || *((_BYTE *)v73 + 24))
    {
      if ((v54 & 1) != 0)
      {
        v40 = v55;
        if (*((_BYTE *)v73 + 24))
          v40 = 1;
        if ((v40 & 1) != 0)
        {
          if (*((_BYTE *)v73 + 24))
          {
            if (v55)
              v41 = 806;
            else
              v41 = 801;
            if (v55)
              v42 = CFSTR("Unhandled key validator case.");
            else
              v42 = CFSTR("The sender key is incorrect.");
          }
          else
          {
            v42 = CFSTR("The receiver's encryption key is incorrect.");
            v41 = 804;
          }
          goto LABEL_41;
        }
        v45 = CFSTR("encryption key");
      }
      else
      {
        v44 = v55;
        if (*((_BYTE *)v73 + 24))
        {
          v41 = 803;
        }
        else
        {
          v44 = 1;
          v41 = 802;
        }
        if (*((_BYTE *)v73 + 24))
          v42 = CFSTR("The receiver's signing key is incorrect.");
        else
          v42 = CFSTR("Receiver's keys are incorrect.");
        if ((v44 & 1) != 0)
          goto LABEL_41;
        v45 = CFSTR("signing key");
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The receiver's %@ and sender's identity keys are incorrect."), v45);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      MPLogAndAssignError(805, a6, v31);
LABEL_38:

LABEL_42:
LABEL_43:
      _Block_object_dispose(&v72, 8);

      goto LABEL_44;
    }
    v42 = CFSTR("Sender and receiver's keys are incorrect.");
    v41 = 800;
LABEL_41:
    MPLogAndAssignError(v41, a6, v42);
    goto LABEL_42;
  }
  MessageProtectionLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    +[NGMKeyValidator isValidKeyValidator:receiversIdentity:sendersIdentity:error:].cold.1(v16, v32, v33, v34, v35, v36, v37, v38);
LABEL_45:

  return v14 == v15;
}

void __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(a2, "dhKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subdataWithRange:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToData:", v9))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    MessageProtectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

void __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke_16(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  if (objc_msgSend(v6, "count") - 1 == a3)
    v8 = &stru_24C4C0760;
  else
    v8 = CFSTR(",");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", v9);
}

+ (id)keyValidatorWithReceiversIdentity:(id)a3 sendersIdentity:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  id v25;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(a1, "rangeOnPublicKey");
  v10 = v9;
  v11 = objc_msgSend(a1, "validatorLength");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceSigningKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "publicKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subdataWithRange:", v8, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "signingKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subdataWithRange:", v8, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "echnidaRegistration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "dhKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "subdataWithRange:", v8, v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "appendData:", v16);
  objc_msgSend(v12, "appendData:", v19);
  objc_msgSend(v12, "appendData:", v23);
  objc_msgSend(a1, "versionByte");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendData:", v24);

  if (objc_msgSend(v12, "length") == v11)
    v25 = v12;
  else
    v25 = 0;

  return v25;
}

+ (void)isValidKeyValidator:(uint64_t)a3 receiversIdentity:(uint64_t)a4 sendersIdentity:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, a1, a3, "No key validator was found.", a5, a6, a7, a8, 0);
}

void __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, a1, a3, "Failed to get public key of a prekey while checking the key validator.", a5, a6, a7, a8, 0);
}

@end
