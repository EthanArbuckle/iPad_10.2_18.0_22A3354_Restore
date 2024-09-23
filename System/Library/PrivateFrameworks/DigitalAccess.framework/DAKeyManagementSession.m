@implementation DAKeyManagementSession

- (DAKeyManagementSession)initWithDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAKeyManagementSession;
  return -[DASession initWithDelegate:](&v4, sel_initWithDelegate_, a3);
}

- (void)preWarmForManufacturer:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession preWarmForManufacturer:callback:]", 55, CFSTR("%@"), v7, v8, v9, v10, (uint64_t)v5);
  if (objc_msgSend(v5, "length"))
  {
    v20 = v6;
    SESEndPointPreWarm();
    v15 = v20;
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession preWarmForManufacturer:callback:]", 57, CFSTR("manufacturer is empty"), v11, v12, v13, v14, v19);
    v16 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(206));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 206, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v18);

  }
}

void __58__DAKeyManagementSession_preWarmForManufacturer_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  sesErrorToKmlError(a2, 0x13u);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  kmlErrorToDAError(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

- (void)requestBindingAttestationDataForManufacturer:(id)a3 callback:(id)a4
{
  void (**v5)(id, void *, void *);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DAKeyBindingAttestationRequestData *v17;
  DAKeyBindingAttestationRequestData *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = (void (**)(id, void *, void *))a4;
  v6 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession requestBindingAttestationDataForManufacturer:callback:]", 74, CFSTR("Manufacturer: %@"), v7, v8, v9, v10, (uint64_t)v6);
  SESEndpointGetBindingAttestationRequestWithSession();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v12, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 224, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }
  else
  {
    v18 = [DAKeyBindingAttestationRequestData alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subCAAttestation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "casdECDSACertificate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "casdRSACertificate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[DAKeyBindingAttestationRequestData initWithSharingSessionIdentifier:subCaAttestation:casd:rsaCertData:](v18, "initWithSharingSessionIdentifier:subCaAttestation:casd:rsaCertData:", v15, v19, v20, v21);

    v16 = 0;
  }

  v5[2](v5, v17, v16);
}

- (void)deleteKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession deleteKey:completionHandler:]", 98, CFSTR("%@"), v8, v9, v10, v11, (uint64_t)v6);
  if (objc_msgSend(v6, "length"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __54__DAKeyManagementSession_deleteKey_completionHandler___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __54__DAKeyManagementSession_deleteKey_completionHandler___block_invoke_2;
    v23[3] = &unk_24C3274E8;
    v23[4] = &v31;
    v23[5] = &v25;
    objc_msgSend(v17, "deleteKey:callback:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession deleteKey:completionHandler:]", 100, CFSTR("keyIdentifier is empty"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(206));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 206, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, (uint64_t)v21);
  }

}

void __54__DAKeyManagementSession_deleteKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession deleteKey:completionHandler:]_block_invoke", 110, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __54__DAKeyManagementSession_deleteKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)listKeysWithHandler:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  DAKeyInformation *v21;
  void (**v22)(id, _QWORD, void *);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD, void *))a3;
  v27 = 0;
  SESEndPointList();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v5, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 209, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v3[2](v3, 0, v9);
  }
  else
  {
    v22 = v3;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "publicKeyIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession listKeysWithHandler:]", 128, CFSTR("Key id = %@"), v17, v18, v19, v20, (uint64_t)v16);

          v21 = -[DAKeyInformation initWithEndpoint:]([DAKeyInformation alloc], "initWithEndpoint:", v15);
          objc_msgSend(v6, "addObject:", v21);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    v3 = v22;
    ((void (**)(id, void *, void *))v22)[2](v22, v6, 0);
  }

}

- (void)listKeysWithSession:(id)a3 seid:(id)a4 callback:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(id, _QWORD, void *);
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  DAKeyInformation *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (**v36)(id, _QWORD, void *);
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (a3 && a4)
  {
    v41 = 0;
    SESEndPointListWithSession();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v12, "count"));
    if (v13)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v13, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 209, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v11[2](v11, 0, v17);
    }
    else
    {
      v36 = v11;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v12 = v12;
      v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v12);
            v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v24, "publicKeyIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession listKeysWithSession:seid:callback:]", 153, CFSTR("Key id = %@"), v26, v27, v28, v29, (uint64_t)v25);

            v30 = -[DAKeyInformation initWithEndpoint:]([DAKeyInformation alloc], "initWithEndpoint:", v24);
            objc_msgSend(v14, "addObject:", v30);

          }
          v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v21);
      }

      v31 = objc_msgSend(v14, "count");
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession listKeysWithSession:seid:callback:]", 157, CFSTR("listKeysWithSession: key count = %lu"), v32, v33, v34, v35, v31);
      v11 = v36;
      ((void (**)(id, void *, void *))v36)[2](v36, v14, 0);
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession listKeysWithSession:seid:callback:]", 142, CFSTR("Null arguments provided. Session : %@, seid : %@"), v7, v8, v9, v10, (uint64_t)a3);
    v18 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v44[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v19);

  }
}

- (void)listSharingInvitationsForKeyIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession listSharingInvitationsForKeyIdentifier:callback:]", 167, CFSTR("keyIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __74__DAKeyManagementSession_listSharingInvitationsForKeyIdentifier_callback___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __74__DAKeyManagementSession_listSharingInvitationsForKeyIdentifier_callback___block_invoke_2;
    v23[3] = &unk_24C327510;
    v23[4] = &v31;
    v23[5] = &v25;
    objc_msgSend(v17, "listSharingInvitationsForKeyIdentifier:callback:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession listSharingInvitationsForKeyIdentifier:callback:]", 169, CFSTR("Null argument provided."), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __74__DAKeyManagementSession_listSharingInvitationsForKeyIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession listSharingInvitationsForKeyIdentifier:callback:]_block_invoke", 178, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __74__DAKeyManagementSession_listSharingInvitationsForKeyIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)listReceivedSharingInvitationsWithCallback:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession listReceivedSharingInvitationsWithCallback:]", 190, &stru_24C3287B0, v5, v6, v7, v8, v11);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v9 = MEMORY[0x24BDAC760];
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__DAKeyManagementSession_listReceivedSharingInvitationsWithCallback___block_invoke;
  v13[3] = &unk_24C327380;
  v13[4] = &v20;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __69__DAKeyManagementSession_listReceivedSharingInvitationsWithCallback___block_invoke_2;
  v12[3] = &unk_24C327510;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v10, "listReceivedSharingInvitationsWithCallback:", v12);

  v4[2](v4, v15[5], v21[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __69__DAKeyManagementSession_listReceivedSharingInvitationsWithCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession listReceivedSharingInvitationsWithCallback:]_block_invoke", 196, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __69__DAKeyManagementSession_listReceivedSharingInvitationsWithCallback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)localDeleteKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession localDeleteKey:completionHandler:]", 208, CFSTR("%@"), v8, v9, v10, v11, (uint64_t)v6);
  if (objc_msgSend(v6, "length"))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __59__DAKeyManagementSession_localDeleteKey_completionHandler___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v25;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __59__DAKeyManagementSession_localDeleteKey_completionHandler___block_invoke_2;
    v23[3] = &unk_24C327380;
    v23[4] = &v25;
    objc_msgSend(v17, "localDeleteKey:callback:", v6, v23);

    v7[2](v7, v26[5]);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession localDeleteKey:completionHandler:]", 211, CFSTR("keyIdentifier is empty"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(206));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 206, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *))v7)[2](v7, v21);
  }

}

void __59__DAKeyManagementSession_localDeleteKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession localDeleteKey:completionHandler:]_block_invoke", 219, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __59__DAKeyManagementSession_localDeleteKey_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)cancelAllFriendInvitationsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = (void (**)(id, _QWORD))a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession cancelAllFriendInvitationsWithCompletionHandler:]", 230, &stru_24C3287B0, v5, v6, v7, v8, v11[0]);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v9 = MEMORY[0x24BDAC760];
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__DAKeyManagementSession_cancelAllFriendInvitationsWithCompletionHandler___block_invoke;
  v12[3] = &unk_24C327380;
  v12[4] = &v13;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)__74__DAKeyManagementSession_cancelAllFriendInvitationsWithCompletionHandler___block_invoke_2;
  v11[3] = (uint64_t)&unk_24C327380;
  v11[4] = (uint64_t)&v13;
  objc_msgSend(v10, "cancelAllFriendInvitationsWithCompletionHandler:", v11);

  v4[2](v4, v14[5]);
  _Block_object_dispose(&v13, 8);

}

void __74__DAKeyManagementSession_cancelAllFriendInvitationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelAllFriendInvitationsWithCompletionHandler:]_block_invoke", 235, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __74__DAKeyManagementSession_cancelAllFriendInvitationsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)removeSharingInvitationWithId:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession removeSharingInvitationWithId:completionHandler:]", 246, &stru_24C3287B0, v8, v9, v10, v11, v14[0]);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v12 = MEMORY[0x24BDAC760];
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__DAKeyManagementSession_removeSharingInvitationWithId_completionHandler___block_invoke;
  v15[3] = &unk_24C327380;
  v15[4] = &v16;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = (uint64_t)__74__DAKeyManagementSession_removeSharingInvitationWithId_completionHandler___block_invoke_2;
  v14[3] = (uint64_t)&unk_24C327380;
  v14[4] = (uint64_t)&v16;
  objc_msgSend(v13, "removeSharingInvitationWithId:completionHandler:", v6, v14);

  v7[2](v7, v17[5]);
  _Block_object_dispose(&v16, 8);

}

void __74__DAKeyManagementSession_removeSharingInvitationWithId_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession removeSharingInvitationWithId:completionHandler:]_block_invoke", 251, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __74__DAKeyManagementSession_removeSharingInvitationWithId_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)signAppData:(id)a3 appBundleIdentifier:(id)a4 nonce:(id)a5 auth:(id)a6 keyIdentifier:(id)a7 callback:(id)a8
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a8;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession signAppData:appBundleIdentifier:nonce:auth:keyIdentifier:callback:]", 262, CFSTR("Deprecated"), v9, v10, v11, v12, v17);
  v13 = (void *)MEMORY[0x24BDD1540];
  v18 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(214));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 214, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v16);

}

- (void)countImmobilizerTokensForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession countImmobilizerTokensForKeyWithIdentifier:callback:]", 269, CFSTR("KeyIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)&__block_literal_global_1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __78__DAKeyManagementSession_countImmobilizerTokensForKeyWithIdentifier_callback___block_invoke_2;
    v18[3] = &unk_24C327558;
    v18[4] = &v23;
    v18[5] = &v19;
    objc_msgSend(v16, "countImmobilizerTokensForKeyWithIdentifier:callback:", v6, v18);

    v7[2](v7, v24[3], v20[3]);
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession countImmobilizerTokensForKeyWithIdentifier:callback:]", 271, CFSTR("Null argument provided"), v12, v13, v14, v15, v17);
    v7[2](v7, 0, 0);
  }

}

void __78__DAKeyManagementSession_countImmobilizerTokensForKeyWithIdentifier_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession countImmobilizerTokensForKeyWithIdentifier:callback:]_block_invoke", 279, CFSTR("XPC Proxy error %@"), a5, a6, a7, a8, a2);
}

uint64_t __78__DAKeyManagementSession_countImmobilizerTokensForKeyWithIdentifier_callback___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (void)cancelInvitationsWithIdentifiers:(id)a3 sentByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]", 292, CFSTR("OwnerKeyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __97__DAKeyManagementSession_cancelInvitationsWithIdentifiers_sentByOwnerKeyWithIdentifier_callback___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __97__DAKeyManagementSession_cancelInvitationsWithIdentifiers_sentByOwnerKeyWithIdentifier_callback___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]", 294, CFSTR("Null argument provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __97__DAKeyManagementSession_cancelInvitationsWithIdentifiers_sentByOwnerKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]_block_invoke", 302, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __97__DAKeyManagementSession_cancelInvitationsWithIdentifiers_sentByOwnerKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)cancelInvitationWithIdentifier:(id)a3 reason:(unint64_t)a4 callback:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]", 315, CFSTR("invitationIdentifier: %@"), v10, v11, v12, v13, (uint64_t)v8);
  if (objc_msgSend(v8, "length"))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__0;
    v37 = __Block_byref_object_dispose__0;
    v38 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__0;
    v31 = __Block_byref_object_dispose__0;
    v18 = MEMORY[0x24BDAC760];
    v32 = 0;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __73__DAKeyManagementSession_cancelInvitationWithIdentifier_reason_callback___block_invoke;
    v26[3] = &unk_24C327380;
    v26[4] = &v33;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __73__DAKeyManagementSession_cancelInvitationWithIdentifier_reason_callback___block_invoke_2;
    v25[3] = &unk_24C327580;
    v25[4] = &v27;
    v25[5] = &v33;
    objc_msgSend(v19, "cancelInvitationWithIdentifier:reason:callback:", v8, a4, v25);

    v9[2](v9, v28[5], v34[5]);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]", 317, CFSTR("Null argument provided"), v14, v15, v16, v17, v24);
    v20 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, (uint64_t)v23);

  }
}

void __73__DAKeyManagementSession_cancelInvitationWithIdentifier_reason_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]_block_invoke", 326, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __73__DAKeyManagementSession_cancelInvitationWithIdentifier_reason_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)removeSharedKeysWithIdentifiers:(id)a3 ownerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:]", 340, CFSTR("OwnerKeyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __90__DAKeyManagementSession_removeSharedKeysWithIdentifiers_ownerKeyWithIdentifier_callback___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __90__DAKeyManagementSession_removeSharedKeysWithIdentifiers_ownerKeyWithIdentifier_callback___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:]", 342, CFSTR("Null argument provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __90__DAKeyManagementSession_removeSharedKeysWithIdentifiers_ownerKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:]_block_invoke", 349, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __90__DAKeyManagementSession_removeSharedKeysWithIdentifiers_ownerKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)revokeKeysWithIdentifiers:(id)a3 sharedByOwnerKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[6];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession revokeKeysWithIdentifiers:sharedByOwnerKeyWithIdentifier:callback:]", 362, CFSTR("keyIdentifier List: %@"), v11, v12, v13, v14, (uint64_t)v8);
  v15 = objc_msgSend(v8, "count");
  if (v9 && v15)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__0;
    v39 = __Block_byref_object_dispose__0;
    v40 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__0;
    v33 = __Block_byref_object_dispose__0;
    v20 = MEMORY[0x24BDAC760];
    v34 = 0;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __92__DAKeyManagementSession_revokeKeysWithIdentifiers_sharedByOwnerKeyWithIdentifier_callback___block_invoke;
    v28[3] = &unk_24C327380;
    v28[4] = &v35;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __92__DAKeyManagementSession_revokeKeysWithIdentifiers_sharedByOwnerKeyWithIdentifier_callback___block_invoke_2;
    v27[3] = &unk_24C3275A8;
    v27[4] = &v35;
    v27[5] = &v29;
    objc_msgSend(v21, "remoteTerminateKeys:nodeGroupIdentifiers:treeGroupIdentifiers:adminKey:callback:", v8, 0, 0, v9, v27);

    v10[2](v10, v30[5], v36[5]);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revokeKeysWithIdentifiers:sharedByOwnerKeyWithIdentifier:callback:]", 364, CFSTR("Null argument provided"), v16, v17, v18, v19, v26);
    v22 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, (uint64_t)v25);

  }
}

void __92__DAKeyManagementSession_revokeKeysWithIdentifiers_sharedByOwnerKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revokeKeysWithIdentifiers:sharedByOwnerKeyWithIdentifier:callback:]_block_invoke", 373, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __92__DAKeyManagementSession_revokeKeysWithIdentifiers_sharedByOwnerKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)revokeNodesWithGroupIdentifiers:(id)a3 treesWithGroupIdentifier:(id)a4 authorizedByKeyWithIdentifier:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[6];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:]", 392, CFSTR("keyGrouoIdentifier List: %@"), v14, v15, v16, v17, (uint64_t)v10);
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:]", 393, CFSTR("treeGrouoIdentifier List: %@"), v18, v19, v20, v21, (uint64_t)v11);
  if (objc_msgSend(v10, "count"))
  {
    if (!v12)
    {
LABEL_7:
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:]", 396, CFSTR("Null argument provided"), v22, v23, v24, v25, v33);
      v29 = (void *)MEMORY[0x24BDD1540];
      v48 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v32);

      goto LABEL_8;
    }
  }
  else
  {
    v26 = objc_msgSend(v11, "count");
    if (!v12 || !v26)
      goto LABEL_7;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v27 = MEMORY[0x24BDAC760];
  v41 = 0;
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __122__DAKeyManagementSession_revokeNodesWithGroupIdentifiers_treesWithGroupIdentifier_authorizedByKeyWithIdentifier_callback___block_invoke;
  v35[3] = &unk_24C327380;
  v35[4] = &v42;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v27;
  v34[1] = 3221225472;
  v34[2] = __122__DAKeyManagementSession_revokeNodesWithGroupIdentifiers_treesWithGroupIdentifier_authorizedByKeyWithIdentifier_callback___block_invoke_2;
  v34[3] = &unk_24C3275A8;
  v34[4] = &v42;
  v34[5] = &v36;
  objc_msgSend(v28, "remoteTerminateKeys:nodeGroupIdentifiers:treeGroupIdentifiers:adminKey:callback:", 0, v10, v11, v12, v34);

  v13[2](v13, v37[5], (void *)v43[5]);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
LABEL_8:

}

void __122__DAKeyManagementSession_revokeNodesWithGroupIdentifiers_treesWithGroupIdentifier_authorizedByKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revokeNodesWithGroupIdentifiers:treesWithGroupIdentifier:authorizedByKeyWithIdentifier:callback:]_block_invoke", 405, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __122__DAKeyManagementSession_revokeNodesWithGroupIdentifiers_treesWithGroupIdentifier_authorizedByKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)handleActivationForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession handleActivationForKeyWithIdentifier:callback:]", 422, CFSTR("%@"), v7, v8, v9, v10, (uint64_t)v6);
  kmlUtilDataForHexString(v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  SESEndpointNotifyPassAdded();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v11);

}

- (void)hasUpgradeAvailableForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void (*v24)(_QWORD *, __int128 *, uint64_t);
  __int128 v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (*v31)(_QWORD *, __int128 *, void *);
  __int128 v32;
  uint64_t v33;
  _QWORD v34[6];
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v44 = 0;
  v45 = &v44;
  v46 = 0x4010000000;
  v47 = &unk_20A6419E5;
  v48 = a4;
  v50 = 0;
  v51 = 0;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]", 439, CFSTR("keyIdentifier: %@"), v13, v14, v15, v16, (uint64_t)v10);
  if (v10 && objc_msgSend(v11, "count"))
  {
    v21 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __105__DAKeyManagementSession_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler___block_invoke;
    v35[3] = &unk_24C327380;
    v35[4] = &v38;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v21;
    v34[1] = 3221225472;
    v34[2] = __105__DAKeyManagementSession_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler___block_invoke_2;
    v34[3] = &unk_24C3275D0;
    v34[4] = &v38;
    v34[5] = &v44;
    objc_msgSend(v22, "hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:", v10, a4, v11, v34);

    v23 = v39[5];
    v24 = (void (*)(_QWORD *, __int128 *, uint64_t))v12[2];
    v25 = *((_OWORD *)v45 + 3);
    v36 = *((_OWORD *)v45 + 2);
    v37 = v25;
    v24(v12, &v36, v23);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]", 441, CFSTR("Null argument provided"), v17, v18, v19, v20, v33);
    v26 = v45;
    v27 = (void *)MEMORY[0x24BDD1540];
    v52 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void (*)(_QWORD *, __int128 *, void *))v12[2];
    v32 = *((_OWORD *)v26 + 3);
    v36 = *((_OWORD *)v26 + 2);
    v37 = v32;
    v31(v12, &v36, v30);

  }
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
}

void __105__DAKeyManagementSession_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]_block_invoke", 447, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

double __105__DAKeyManagementSession_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double result;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v5 = a3;
  v6 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]_block_invoke_2", 453, CFSTR("Result: %@"), v7, v8, v9, v10, (uint64_t)v5);
  kmlErrorToDAError(v5);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(v6, "availableVersionUpgradeValue");
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v17;
  v16 = v18;
  *(_OWORD *)(v14 + 32) = v17;
  *(_OWORD *)(v14 + 48) = v16;
  return result;
}

- (void)upgradeKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = (void (**)(id, _QWORD))a7;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]", 467, CFSTR("keyIdentifier: %@"), v15, v16, v17, v18, (uint64_t)v12);
  if (v12)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__0;
    v36 = __Block_byref_object_dispose__0;
    v23 = MEMORY[0x24BDAC760];
    v37 = 0;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __108__DAKeyManagementSession_upgradeKeyWithIdentifier_versionType_version_upgradeInformation_completionHandler___block_invoke;
    v31[3] = &unk_24C327380;
    v31[4] = &v32;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __108__DAKeyManagementSession_upgradeKeyWithIdentifier_versionType_version_upgradeInformation_completionHandler___block_invoke_2;
    v30[3] = &unk_24C327380;
    v30[4] = &v32;
    objc_msgSend(v24, "upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:", v12, a4, a5, v13, v30);

    v14[2](v14, v33[5]);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]", 469, CFSTR("Null argument provided"), v19, v20, v21, v22, v29);
    v25 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v14)[2](v14, v28);

  }
}

void __108__DAKeyManagementSession_upgradeKeyWithIdentifier_versionType_version_upgradeInformation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]_block_invoke", 476, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __108__DAKeyManagementSession_upgradeKeyWithIdentifier_versionType_version_upgradeInformation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]_block_invoke_2", 483, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
  kmlErrorToDAError(v3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)commitUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]", 496, CFSTR("keyIdentifier: %@"), v12, v13, v14, v15, (uint64_t)v10);
  if (v10)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__0;
    v33 = __Block_byref_object_dispose__0;
    v20 = MEMORY[0x24BDAC760];
    v34 = 0;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __98__DAKeyManagementSession_commitUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke;
    v28[3] = &unk_24C327380;
    v28[4] = &v29;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __98__DAKeyManagementSession_commitUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke_2;
    v27[3] = &unk_24C327380;
    v27[4] = &v29;
    objc_msgSend(v21, "finalizeUpgradeForKeyWithIdentifier:versionType:version:revert:completionHandler:", v10, a4, a5, 0, v27);

    v11[2](v11, v30[5]);
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]", 498, CFSTR("Null argument provided"), v16, v17, v18, v19, v26);
    v22 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v11)[2](v11, v25);

  }
}

void __98__DAKeyManagementSession_commitUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]_block_invoke", 505, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __98__DAKeyManagementSession_commitUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession commitUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]_block_invoke_2", 512, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
  kmlErrorToDAError(v3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)revertUpgradeForKeyWithIdentifier:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]", 524, CFSTR("keyIdentifier: %@"), v12, v13, v14, v15, (uint64_t)v10);
  if (v10)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__0;
    v33 = __Block_byref_object_dispose__0;
    v20 = MEMORY[0x24BDAC760];
    v34 = 0;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __98__DAKeyManagementSession_revertUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke;
    v28[3] = &unk_24C327380;
    v28[4] = &v29;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v20;
    v27[1] = 3221225472;
    v27[2] = __98__DAKeyManagementSession_revertUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke_2;
    v27[3] = &unk_24C327380;
    v27[4] = &v29;
    objc_msgSend(v21, "finalizeUpgradeForKeyWithIdentifier:versionType:version:revert:completionHandler:", v10, a4, a5, 1, v27);

    v11[2](v11, v30[5]);
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]", 526, CFSTR("Null argument provided"), v16, v17, v18, v19, v26);
    v22 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v11)[2](v11, v25);

  }
}

void __98__DAKeyManagementSession_revertUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]_block_invoke", 533, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __98__DAKeyManagementSession_revertUpgradeForKeyWithIdentifier_versionType_version_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession revertUpgradeForKeyWithIdentifier:versionType:version:completionHandler:]_block_invoke_2", 540, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
  kmlErrorToDAError(v3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)updateConfiguration:(id)a3 forKeyWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]", 553, CFSTR("keyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __85__DAKeyManagementSession_updateConfiguration_forKeyWithIdentifier_completionHandler___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __85__DAKeyManagementSession_updateConfiguration_forKeyWithIdentifier_completionHandler___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "updateConfiguration:forKeyWithIdentifier:completionHandler:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]", 555, CFSTR("Null argument provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __85__DAKeyManagementSession_updateConfiguration_forKeyWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]_block_invoke", 562, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __85__DAKeyManagementSession_updateConfiguration_forKeyWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]_block_invoke_2", 567, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
  kmlErrorToDAError(v3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)sendTrackingReceipt:(void *)a3 otherJSONData:(void *)a4 forKeyWithIdentifier:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    kmlUtilLogLargeData(CFSTR("Tracking Receipt Data"), v8);
    if (v9)
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__0;
      v27 = __Block_byref_object_dispose__0;
      v14 = MEMORY[0x24BDAC760];
      v28 = 0;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __81__DAKeyManagementSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke;
      v22[3] = &unk_24C327380;
      v22[4] = &v23;
      objc_msgSend(a1, "getRemoteProxy:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __81__DAKeyManagementSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke_2;
      v21[3] = &unk_24C327380;
      v21[4] = &v23;
      objc_msgSend(v15, "consumeTrackingReceipt:otherJSONData:forKeyWithIdentifier:callback:", v7, v8, v9, v21);

      a1 = (id)v24[5];
      _Block_object_dispose(&v23, 8);

    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]", 581, CFSTR("Null argument provided"), v10, v11, v12, v13, v20);
      v16 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v18);
      a1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return a1;
}

void __81__DAKeyManagementSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]_block_invoke", 587, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __81__DAKeyManagementSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]_block_invoke_2", 593, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
  kmlErrorToDAError(v3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)setTrackingReceipt:(id)a3 forKeyWithIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:forKeyWithIdentifier:]", 603, CFSTR("keyIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  -[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v7, 0, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)setTrackingReceipt:(id)a3 vehicleMobilizationData:(id)a4 forKeyWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:vehicleMobilizationData:forKeyWithIdentifier:]", 613, CFSTR("keyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v8);
  +[DAUtils decryptVehicleMobilizationData:forKeyWithIdentifier:](DAUtils, "decryptVehicleMobilizationData:forKeyWithIdentifier:", v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)setTrackingReceipt:(id)a3 slotIdentifier:(id)a4 confidentialMailboxData:(id)a5 ephemeralPublicKey:(id)a6 forKeyWithIdentifier:(id)a7
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;

  v9 = a7;
  v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:slotIdentifier:confidentialMailboxData:ephemeralPublicKey:forKeyWithIdentifier:]", 628, CFSTR("Deprecated API"), v11, v12, v13, v14, v21);
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:slotIdentifier:confidentialMailboxData:ephemeralPublicKey:forKeyWithIdentifier:]", 629, CFSTR("keyIdentifier: %@"), v15, v16, v17, v18, (uint64_t)v9);
  -[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, 0, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)setTrackingReceipt:(id)a3 decryptedDeviceData:(id)a4 forKeyWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setTrackingReceipt:decryptedDeviceData:forKeyWithIdentifier:]", 639, CFSTR("keyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v8);
  -[DAKeyManagementSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)endPointPrivacyDecryption:(id)a3 encryptedData:(id)a4 publicKey:(id)a5 callback:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v15 = (void (**)(id, _QWORD, void *))a6;
  if (v9 && v10 && a5)
  {
    kmlUtilDataForHexString(a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    kmlUtilDataForHexString(v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SESEndPointPrivacyDecryption();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    if (v19)
    {
      v24 = v19;
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 664, CFSTR("endPointPrivacyDecryption: return error: %@"), v20, v21, v22, v23, (uint64_t)v19);
      v25 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v24, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 204, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v15[2](v15, 0, v27);
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 661, CFSTR("endPointPrivacyDecryption: got decrypted data: %@"), v20, v21, v22, v23, (uint64_t)v18);
      ((void (**)(id, void *, void *))v15)[2](v15, v18, 0);
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 651, CFSTR("Null argument provided"), v11, v12, v13, v14, v29);
    v28 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v18);
  }

}

- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession requestBindingAttestationDataForKeyWithIdentifier:callback:]", 676, CFSTR("keyIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __85__DAKeyManagementSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __85__DAKeyManagementSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke_2;
    v23[3] = &unk_24C3275F8;
    v23[4] = &v31;
    v23[5] = &v25;
    objc_msgSend(v17, "requestBindingAttestationDataForKeyWithIdentifier:callback:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession requestBindingAttestationDataForKeyWithIdentifier:callback:]", 678, CFSTR("Null argument provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __85__DAKeyManagementSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession requestBindingAttestationDataForKeyWithIdentifier:callback:]_block_invoke", 687, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __85__DAKeyManagementSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession setBindingAttestation:forKeyWithIdentifier:callback:]", 701, CFSTR("keyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __78__DAKeyManagementSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __78__DAKeyManagementSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "setBindingAttestation:forKeyWithIdentifier:callback:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setBindingAttestation:forKeyWithIdentifier:callback:]", 703, CFSTR("Null argument provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __78__DAKeyManagementSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setBindingAttestation:forKeyWithIdentifier:callback:]_block_invoke", 711, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __78__DAKeyManagementSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]", 723, CFSTR("invitationIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (objc_msgSend(v6, "length"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __90__DAKeyManagementSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __90__DAKeyManagementSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke_2;
    v23[3] = &unk_24C3275A8;
    v23[4] = &v25;
    v23[5] = &v31;
    objc_msgSend(v17, "getPreTrackRequestForInvitationWithIdentifier:completionHandler:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]", 725, CFSTR("Null argument provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __90__DAKeyManagementSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 734, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __90__DAKeyManagementSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForKeyWithIdentifier:callback:]", 748, CFSTR("keyIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __74__DAKeyManagementSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __74__DAKeyManagementSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke_2;
    v23[3] = &unk_24C3275A8;
    v23[4] = &v25;
    v23[5] = &v31;
    objc_msgSend(v17, "getPreTrackRequestForKeyWithIdentifier:callback:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForKeyWithIdentifier:callback:]", 750, CFSTR("Null argument provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __74__DAKeyManagementSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession getPreTrackRequestForKeyWithIdentifier:callback:]_block_invoke", 759, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __74__DAKeyManagementSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)ppidRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:completionHandler:]", 772, CFSTR("invitationIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (objc_msgSend(v6, "length"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __83__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __83__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke_2;
    v23[3] = &unk_24C3275A8;
    v23[4] = &v25;
    v23[5] = &v31;
    objc_msgSend(v17, "ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v6, 0, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:completionHandler:]", 774, CFSTR("Null arguments provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __83__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 783, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __83__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  void (**v10)(id, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = (uint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 799, CFSTR("invitationIdentifier: %@"), v11, v12, v13, v14, v8);
  if (v8 | v9)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__0;
    v38 = __Block_byref_object_dispose__0;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v23 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __105__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v34;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __105__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v26[3] = &unk_24C3275A8;
    v26[4] = &v28;
    v26[5] = &v34;
    objc_msgSend(v24, "ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v8, v9, v26);

    v10[2](v10, v29[5], v35[5]);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 801, CFSTR("Null arguments provided"), v15, v16, v17, v18, v25);
    v19 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, (uint64_t)v22);

  }
}

void __105__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 810, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __105__DAKeyManagementSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession setProductPlanIdentifier:forInvitationIdentifier:completion:]", 824, CFSTR("invitationIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (objc_msgSend(v9, "length"))
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __86__DAKeyManagementSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __86__DAKeyManagementSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "setProductPlanIdentifier:forInvitationIdentifier:completion:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setProductPlanIdentifier:forInvitationIdentifier:completion:]", 826, CFSTR("Null arguments provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __86__DAKeyManagementSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession setProductPlanIdentifier:forInvitationIdentifier:completion:]_block_invoke", 835, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __86__DAKeyManagementSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  void (**v10)(id, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = (uint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 848, CFSTR("invitationIdentifier: %@"), v11, v12, v13, v14, v8);
  if (v8 | v9)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__0;
    v38 = __Block_byref_object_dispose__0;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v23 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __111__DAKeyManagementSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v34;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __111__DAKeyManagementSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v26[3] = &unk_24C327620;
    v26[4] = &v28;
    v26[5] = &v34;
    objc_msgSend(v24, "readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v8, v9, v26);

    v10[2](v10, v29[5], v35[5]);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 850, CFSTR("Null arguments provided"), v15, v16, v17, v18, v25);
    v19 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, (uint64_t)v22);

  }
}

void __111__DAKeyManagementSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyManagementSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 859, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __111__DAKeyManagementSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)requestImmobilizerTokenRefillForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a4;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession requestImmobilizerTokenRefillForKeyWithIdentifier:callback:]", 874, CFSTR("This method is deprecated. Please stop use."), v5, v6, v7, v8, v13);
  v9 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(214));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 214, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v12);

}

- (void)setImmobilizerTokens:(id)a3 publicKey:(id)a4 forKeyWithIdentifier:(id)a5 callback:(id)a6
{
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a6;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyManagementSession setImmobilizerTokens:publicKey:forKeyWithIdentifier:callback:]", 884, CFSTR("This method is deprecated. Please stop use."), v7, v8, v9, v10, v15);
  v11 = (void *)MEMORY[0x24BDD1540];
  v16 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(214));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 214, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v14);

}

- (void)didStart:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  objc_super v9;

  v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession didStart:]", 893, &stru_24C3287B0, v3, v4, v5, v6, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeyManagementSession;
  -[DASession didStart:](&v9, sel_didStart_, v7);
}

- (void)didEnd:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyManagementSession didEnd:]", 899, &stru_24C3287B0, v5, v6, v7, v8, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeyManagementSession;
  -[DASession didEnd:](&v9, sel_didEnd_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DAKeyManagementSession;
  -[DASession encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (DAKeyManagementSession)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAKeyManagementSession;
  return -[DASession initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
