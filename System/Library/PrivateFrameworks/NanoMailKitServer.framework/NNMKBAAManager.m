@implementation NNMKBAAManager

+ (void)appleAuthHeaderFrom:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__NNMKBAAManager_appleAuthHeaderFrom_completion___block_invoke;
  v8[3] = &unk_24F9F6C80;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "signRequestData:completion:", a3, v8);

}

void __49__NNMKBAAManager_appleAuthHeaderFrom_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
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
  uint64_t v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (objc_msgSend(v7, "count") == 2)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("LeafCert"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("IntermediateCert"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("Signature"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v23[0] = v16;
      v23[1] = v12;
      v23[2] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v22 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "genericErrorWithMessage:", CFSTR("Invalid cert count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v12);
    }

  }
}

+ (void)signRequestData:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  SecAccessControlRef v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  void *v23;
  id v24;
  id *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id *v36;
  void *v37;
  id v38;
  id *v39;
  void *v40;
  id v41;
  id *v42;
  void *v43;
  id v44;
  id *v45;
  void *v46;
  id v47;
  id *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  _QWORD *v53;
  void *v54;
  id v55;
  _QWORD *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  CFErrorRef error;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  void *v72;
  _QWORD v73[5];
  _QWORD v74[5];
  id v75;
  _QWORD v76[8];

  v76[6] = *MEMORY[0x24BDAC8D0];
  v64 = a3;
  v5 = a4;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v6 = getDeviceIdentityIsSupportedSymbolLoc_ptr;
  v72 = getDeviceIdentityIsSupportedSymbolLoc_ptr;
  if (!getDeviceIdentityIsSupportedSymbolLoc_ptr)
  {
    v7 = (void *)DeviceIdentityLibrary();
    v6 = dlsym(v7, "DeviceIdentityIsSupported");
    v70[3] = (uint64_t)v6;
    getDeviceIdentityIsSupportedSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v69, 8);
  if (!v6)
  {
    +[NNMKBAAManager signRequestData:completion:].cold.1();
    goto LABEL_68;
  }
  if ((((uint64_t (*)(void))v6)() & 1) != 0)
  {
    error = 0;
    v8 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F70], 0x40000000uLL, &error);
    if (!v8)
    {
      v60 = qword_253E87AA0;
      if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
        +[NNMKBAAManager signRequestData:completion:].cold.2((uint64_t *)&error, v60, v61);
      objc_msgSend(MEMORY[0x24BDD1540], "genericErrorWithMessage:", CFSTR("Failed to create access control"));
      v55 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, id))v5 + 2))(v5, 0, 0, v55);
      goto LABEL_53;
    }
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v9 = getDeviceIdentityUCRTAttestationSupportedSymbolLoc_ptr;
    v72 = getDeviceIdentityUCRTAttestationSupportedSymbolLoc_ptr;
    if (!getDeviceIdentityUCRTAttestationSupportedSymbolLoc_ptr)
    {
      v10 = (void *)DeviceIdentityLibrary();
      v9 = dlsym(v10, "DeviceIdentityUCRTAttestationSupported");
      v70[3] = (uint64_t)v9;
      getDeviceIdentityUCRTAttestationSupportedSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(&v69, 8);
    if (!v9)
      goto LABEL_56;
    v11 = ((uint64_t (*)(void))v9)();
    v12 = (void *)MEMORY[0x24BDBCED8];
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v13 = (id *)getkMAOptionsBAAKeychainLabelSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAKeychainLabelSymbolLoc_ptr;
    if (!getkMAOptionsBAAKeychainLabelSymbolLoc_ptr)
    {
      v14 = (void *)DeviceIdentityLibrary();
      v13 = (id *)dlsym(v14, "kMAOptionsBAAKeychainLabel");
      v70[3] = (uint64_t)v13;
      getkMAOptionsBAAKeychainLabelSymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(&v69, 8);
    if (!v13)
      goto LABEL_56;
    v62 = *v13;
    v74[0] = v62;
    v76[0] = CFSTR("NanoMail");
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v15 = (id *)getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr;
    if (!getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr)
    {
      v16 = (void *)DeviceIdentityLibrary();
      v15 = (id *)dlsym(v16, "kMAOptionsBAAIgnoreExistingKeychainItems");
      v70[3] = (uint64_t)v15;
      getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(&v69, 8);
    if (!v15)
      goto LABEL_56;
    v17 = *v15;
    v74[1] = v17;
    v76[1] = MEMORY[0x24BDBD1C0];
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v18 = (id *)getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_ptr;
    if (!getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_ptr)
    {
      v19 = (void *)DeviceIdentityLibrary();
      v18 = (id *)dlsym(v19, "kMAOptionsBAANetworkTimeoutInterval");
      v70[3] = (uint64_t)v18;
      getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(&v69, 8);
    if (!v18)
      goto LABEL_56;
    v20 = *v18;
    v74[2] = v20;
    v76[2] = &unk_24FA10CA0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v21 = (id *)getkMAOptionsBAAValiditySymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAValiditySymbolLoc_ptr;
    if (!getkMAOptionsBAAValiditySymbolLoc_ptr)
    {
      v22 = (void *)DeviceIdentityLibrary();
      v21 = (id *)dlsym(v22, "kMAOptionsBAAValidity");
      v70[3] = (uint64_t)v21;
      getkMAOptionsBAAValiditySymbolLoc_ptr = (uint64_t)v21;
    }
    _Block_object_dispose(&v69, 8);
    if (!v21)
      goto LABEL_56;
    v23 = v12;
    v24 = *v21;
    v74[3] = v24;
    v76[3] = &unk_24FA10CB8;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v25 = (id *)getkMAOptionsBAASCRTAttestationSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAASCRTAttestationSymbolLoc_ptr;
    if (!getkMAOptionsBAASCRTAttestationSymbolLoc_ptr)
    {
      v26 = (void *)DeviceIdentityLibrary();
      v25 = (id *)dlsym(v26, "kMAOptionsBAASCRTAttestation");
      v70[3] = (uint64_t)v25;
      getkMAOptionsBAASCRTAttestationSymbolLoc_ptr = (uint64_t)v25;
    }
    _Block_object_dispose(&v69, 8);
    if (!v25)
      goto LABEL_56;
    v27 = v11 ^ 1u;
    v28 = *v25;
    v74[4] = v28;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v76[4] = v29;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v30 = (id *)getkMAOptionsBAAAccessControlsSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAAccessControlsSymbolLoc_ptr;
    if (!getkMAOptionsBAAAccessControlsSymbolLoc_ptr)
    {
      v31 = (void *)DeviceIdentityLibrary();
      v30 = (id *)dlsym(v31, "kMAOptionsBAAAccessControls");
      v70[3] = (uint64_t)v30;
      getkMAOptionsBAAAccessControlsSymbolLoc_ptr = (uint64_t)v30;
    }
    _Block_object_dispose(&v69, 8);
    if (!v30)
      goto LABEL_56;
    v75 = *v30;
    v76[5] = v8;
    v32 = (void *)MEMORY[0x24BDBCE70];
    v33 = v75;
    objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v76, v74, 6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "dictionaryWithDictionary:", v34);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v36 = (id *)getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_ptr)
    {
      v37 = (void *)DeviceIdentityLibrary();
      v36 = (id *)dlsym(v37, "kMAOptionsBAAOIDIMG4Manifest");
      v70[3] = (uint64_t)v36;
      getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_ptr = (uint64_t)v36;
    }
    _Block_object_dispose(&v69, 8);
    if (!v36)
      goto LABEL_56;
    v38 = *v36;
    v73[0] = v38;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v39 = (id *)getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_ptr)
    {
      v40 = (void *)DeviceIdentityLibrary();
      v39 = (id *)dlsym(v40, "kMAOptionsBAAOIDHardwareProperties");
      v70[3] = (uint64_t)v39;
      getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_ptr = (uint64_t)v39;
    }
    _Block_object_dispose(&v69, 8);
    if (!v39)
      goto LABEL_56;
    v41 = *v39;
    v73[1] = v41;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v42 = (id *)getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_ptr)
    {
      v43 = (void *)DeviceIdentityLibrary();
      v42 = (id *)dlsym(v43, "kMAOptionsBAAOIDKeyUsageProperties");
      v70[3] = (uint64_t)v42;
      getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_ptr = (uint64_t)v42;
    }
    _Block_object_dispose(&v69, 8);
    if (!v42)
      goto LABEL_56;
    v44 = *v42;
    v73[2] = v44;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v45 = (id *)getkMAOptionsBAAOIDAccessControlsSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAOIDAccessControlsSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDAccessControlsSymbolLoc_ptr)
    {
      v46 = (void *)DeviceIdentityLibrary();
      v45 = (id *)dlsym(v46, "kMAOptionsBAAOIDAccessControls");
      v70[3] = (uint64_t)v45;
      getkMAOptionsBAAOIDAccessControlsSymbolLoc_ptr = (uint64_t)v45;
    }
    _Block_object_dispose(&v69, 8);
    if (!v45)
      goto LABEL_56;
    v47 = *v45;
    v73[3] = v47;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v48 = (id *)getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_ptr)
    {
      v49 = (void *)DeviceIdentityLibrary();
      v48 = (id *)dlsym(v49, "kMAOptionsBAAOIDDeviceOSInformation");
      v70[3] = (uint64_t)v48;
      getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_ptr = (uint64_t)v48;
    }
    _Block_object_dispose(&v69, 8);
    if (!v48)
      goto LABEL_56;
    v50 = *v48;
    v73[4] = v50;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v35, "initWithArray:", v51);
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v53 = (_QWORD *)getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr;
    v72 = (void *)getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr)
    {
      v54 = (void *)DeviceIdentityLibrary();
      v53 = dlsym(v54, "kMAOptionsBAAOIDSToInclude");
      v70[3] = (uint64_t)v53;
      getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr = (uint64_t)v53;
    }
    _Block_object_dispose(&v69, 8);
    if (v53)
    {
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v52, *v53);

      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __45__NNMKBAAManager_signRequestData_completion___block_invoke;
      v65[3] = &unk_24F9F6CA8;
      v67 = v5;
      v66 = v64;
      v55 = v63;
      v56 = v65;
      v69 = 0;
      v70 = &v69;
      v71 = 0x2020000000;
      v57 = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr;
      v72 = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr;
      if (!getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr)
      {
        v58 = (void *)DeviceIdentityLibrary();
        v57 = dlsym(v58, "DeviceIdentityIssueClientCertificateWithCompletion");
        v70[3] = (uint64_t)v57;
        getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr = v57;
      }
      _Block_object_dispose(&v69, 8);
      if (v57)
      {
        ((void (*)(_QWORD, id, _QWORD *))v57)(0, v55, v56);

LABEL_53:
        goto LABEL_54;
      }
      +[NNMKBAAManager signRequestData:completion:].cold.1();
    }
    else
    {
LABEL_56:
      +[NNMKBAAManager signRequestData:completion:].cold.1();
    }
LABEL_68:
    __break(1u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "genericErrorWithMessage:", CFSTR("DeviceIdentity not supported on this platform."));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v59);

LABEL_54:
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke(uint64_t a1, __SecKey *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  CFDataRef v17;
  CFDataRef v18;
  NSObject *v19;
  CFDataRef Signature;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CFErrorRef v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    if (a2)
    {
      if (objc_msgSend(v7, "count") == 2)
      {
        v11 = (void *)objc_opt_new();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v12 = v7;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(v12);
              v17 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v33 + 1) + 8 * i));
              if (!v17)
              {
                v26 = *(_QWORD *)(a1 + 40);
                objc_msgSend(MEMORY[0x24BDD1540], "genericErrorWithMessage:", CFSTR("Unable to convert certificate to data"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v26 + 16))(v26, 0, 0, v27);

                goto LABEL_31;
              }
              v18 = v17;
              objc_msgSend(v11, "addObject:", v17);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v14)
              continue;
            break;
          }
        }

        v19 = qword_253E87AA0;
        if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_22E161000, v19, OS_LOG_TYPE_DEFAULT, "Certificate issued", (uint8_t *)v32, 2u);
        }
        v32[0] = 0;
        Signature = SecKeyCreateSignature(a2, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], *(CFDataRef *)(a1 + 32), v32);
        if (Signature)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
        else
        {
          v28 = qword_253E87AA0;
          if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
            __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_2((uint64_t *)v32, v28, v29);
          v30 = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD1540], "genericErrorWithMessage:", CFSTR("Failed to create signature"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v30 + 16))(v30, 0, 0, v31);

        }
        goto LABEL_31;
      }
      v25 = (void *)qword_253E87AA0;
      if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
        __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_3(v25, v7);
      v22 = *(_QWORD *)(a1 + 40);
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = CFSTR("Invalid cert count");
    }
    else
    {
      v21 = qword_253E87AA0;
      if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
        __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_1(v21);
      v22 = *(_QWORD *)(a1 + 40);
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = CFSTR("Missing referenceKey");
    }
    objc_msgSend(v23, "genericErrorWithMessage:", v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v22 + 16))(v22, 0, 0, v11);
LABEL_31:

    goto LABEL_32;
  }
  v9 = qword_253E87AA0;
  if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
    __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_4((uint64_t)v8, v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_32:

}

+ (uint64_t)signRequestData:completion:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[NNMKBAAManager signRequestData:completion:].cold.2(v0);
}

+ (void)signRequestData:(uint64_t)a3 completion:.cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, a2, a3, "Failed to create access control: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_15();
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "Failed to obtain BAA certificates: no referenceKey", v1, 2u);
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, a2, a3, "Failed to create signature: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_15();
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_3(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v5 = 134217984;
  v6 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v3, v4, "Failed to obtain BAA certificates: invalid cert count: %lu", (uint8_t *)&v5);

}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, a2, a3, "Failed to obtain BAA certificates: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_15();
}

@end
