@implementation MDMSharedDefinitions

+ (id)oidsAnonymous:(BOOL)a3 nonce:(BOOL)a4 coresidency:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  id *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  _QWORD v43[3];
  id v44;
  uint64_t v45;

  v5 = a5;
  v6 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v9 = (id *)getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr;
  v40 = getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr;
  if (!getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr)
  {
    v10 = (void *)DeviceIdentityLibrary();
    v9 = (id *)dlsym(v10, "kMAOptionsBAAOIDEDASEPOSVersion");
    v38[3] = (uint64_t)v9;
    getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v37, 8);
  if (!v9)
    +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1();
  v11 = *v9;
  v43[0] = v11;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v12 = (id *)getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr;
  v40 = getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr;
  if (!getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr)
  {
    v13 = (void *)DeviceIdentityLibrary();
    v12 = (id *)dlsym(v13, "kMAOptionsBAAOIDEDAFirmwareVersion");
    v38[3] = (uint64_t)v12;
    getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v37, 8);
  if (!v12)
    +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1();
  v14 = *v12;
  v43[1] = v14;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v15 = (id *)getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr;
  v40 = getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr;
  if (!getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr)
  {
    v16 = (void *)DeviceIdentityLibrary();
    v15 = (id *)dlsym(v16, "kMAOptionsBAAOIDEDAOSVersion");
    v38[3] = (uint64_t)v15;
    getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v37, 8);
  if (!v15)
    +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1();
  v17 = *v15;
  v43[2] = v17;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v18 = (id *)getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr;
  v40 = getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr;
  if (!getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr)
  {
    v19 = (void *)DeviceIdentityLibrary();
    v18 = (id *)dlsym(v19, "kMAOptionsBAAOIDEDAProductType");
    v38[3] = (uint64_t)v18;
    getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v37, 8);
  if (!v18)
    +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1();
  v44 = *v18;
  v20 = (void *)MEMORY[0x1E0C99D20];
  v21 = v44;
  objc_msgSend(v20, "arrayWithObjects:count:", v43, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v24 = (id *)getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr;
    v40 = getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr)
    {
      v25 = (void *)DeviceIdentityLibrary();
      v24 = (id *)dlsym(v25, "kMAOptionsBAAOIDEDASerialNumber");
      v38[3] = (uint64_t)v24;
      getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr = (uint64_t)v24;
    }
    _Block_object_dispose(&v37, 8);
    if (!v24)
      +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1();
    v26 = *v24;
    v41 = v26;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v27 = (id *)getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr;
    v40 = getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr)
    {
      v28 = (void *)DeviceIdentityLibrary();
      v27 = (id *)dlsym(v28, "kMAOptionsBAAOIDEDAUDID");
      v38[3] = (uint64_t)v27;
      getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr = (uint64_t)v27;
    }
    _Block_object_dispose(&v37, 8);
    if (!v27)
      +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1();
    v42 = *v27;
    v29 = (void *)MEMORY[0x1E0C99D20];
    v30 = v42;
    objc_msgSend(v29, "arrayWithObjects:count:", &v41, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addObjectsFromArray:", v31);
  }
  if (v5 && objc_msgSend(MEMORY[0x1E0D1C1C0], "isMDACoResidencyEnabled"))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v32 = (_QWORD *)getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr;
    v40 = getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr)
    {
      v33 = (void *)DeviceIdentityLibrary();
      v32 = dlsym(v33, "kMAOptionsBAAOIDEDAAttestationPublicKey");
      v38[3] = (uint64_t)v32;
      getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr = (uint64_t)v32;
    }
    _Block_object_dispose(&v37, 8);
    if (!v32)
      +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1();
    objc_msgSend(v23, "addObject:", *v32);
  }
  if (v6)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v34 = (_QWORD *)getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr;
    v40 = getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr)
    {
      v35 = (void *)DeviceIdentityLibrary();
      v34 = dlsym(v35, "kMAOptionsBAAOIDEDANonce");
      v38[3] = (uint64_t)v34;
      getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr = (uint64_t)v34;
    }
    _Block_object_dispose(&v37, 8);
    if (!v34)
      +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1();
    objc_msgSend(v23, "addObject:", *v34);
  }
  return v23;
}

+ (void)oidsAnonymous:nonce:coresidency:.cold.1()
{
  dlerror();
  abort_report_np();
  AMFIMDMModeEnroll();
}

@end
