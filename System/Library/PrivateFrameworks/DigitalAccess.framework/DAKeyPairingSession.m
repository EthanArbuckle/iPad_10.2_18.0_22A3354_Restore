@implementation DAKeyPairingSession

- (DAKeyPairingSession)initWithDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAKeyPairingSession;
  return -[DASession initWithDelegate:](&v4, sel_initWithDelegate_, a3);
}

- (id)getKeyPairingProxy:(void *)a1
{
  if (a1)
  {
    objc_msgSend(a1, "getRemoteProxy:", a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)preWarmForManufacturer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession preWarmForManufacturer:]", 49, CFSTR("Manufacturer: %@"), v5, v6, v7, v8, (uint64_t)v4);
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__DAKeyPairingSession_preWarmForManufacturer___block_invoke;
  v14[3] = &unk_24C327380;
  v14[4] = &v15;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __46__DAKeyPairingSession_preWarmForManufacturer___block_invoke_2;
  v13[3] = &unk_24C327380;
  v13[4] = &v15;
  objc_msgSend(v10, "preWarmForManufacturer:callback:", v4, v13);

  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __46__DAKeyPairingSession_preWarmForManufacturer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession preWarmForManufacturer:]_block_invoke", 51, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __46__DAKeyPairingSession_preWarmForManufacturer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession preWarmForManufacturer:]_block_invoke_2", 54, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

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
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession requestBindingAttestationDataForManufacturer:callback:]", 64, CFSTR("Manufacturer: %@"), v7, v8, v9, v10, (uint64_t)v6);
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

- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4 transport:(int64_t)a5 bindingAttestation:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  _QWORD v36[5];
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  if (!objc_msgSend(v10, "length"))
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]", 94, CFSTR("password is empty"), v13, v14, v15, v16, v35);
    v28 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(10));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 10, v29);
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v32 = (void *)v39[5];
    v39[5] = v30;

    goto LABEL_7;
  }
  if (!objc_msgSend(v11, "length"))
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]", 99, CFSTR("displayName is empty"), v17, v18, v19, v20, v35);
    v31 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(203));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 203, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  DAKeyTransportTypeAsString(a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]", 104, CFSTR("Transport = %@, displayName: %@"), v22, v23, v24, v25, (uint64_t)v21);

  v26 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __92__DAKeyPairingSession_startKeyPairingWithPassword_displayName_transport_bindingAttestation___block_invoke;
  v37[3] = &unk_24C327380;
  v37[4] = &v38;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v37);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v26;
  v36[1] = 3221225472;
  v36[2] = __92__DAKeyPairingSession_startKeyPairingWithPassword_displayName_transport_bindingAttestation___block_invoke_2;
  v36[3] = &unk_24C327380;
  v36[4] = &v38;
  objc_msgSend(v27, "startKeyPairingWithPassword:keyName:transport:bindingAttestation:callback:", v10, v11, a5, v12, v36);
LABEL_7:

  v33 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v33;
}

void __92__DAKeyPairingSession_startKeyPairingWithPassword_displayName_transport_bindingAttestation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]_block_invoke", 107, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __92__DAKeyPairingSession_startKeyPairingWithPassword_displayName_transport_bindingAttestation___block_invoke_2(uint64_t a1, void *a2)
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:]_block_invoke_2", 114, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
  kmlErrorToDAError(v3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4 transport:(int64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x24BDD1880];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  kmlUtilUUIDToData(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:bindingAttestation:](self, "startKeyPairingWithPassword:displayName:transport:bindingAttestation:", v10, v9, a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)startKeyPairingWithPassword:(id)a3 displayName:(id)a4
{
  return -[DAKeyPairingSession startKeyPairingWithPassword:displayName:transport:](self, "startKeyPairingWithPassword:displayName:transport:", a3, a4, 1);
}

- (id)startProbing
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v2 = MEMORY[0x24BDAC760];
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__DAKeyPairingSession_startProbing__block_invoke;
  v7[3] = &unk_24C327380;
  v7[4] = &v8;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __35__DAKeyPairingSession_startProbing__block_invoke_2;
  v6[3] = &unk_24C3273A8;
  v6[4] = &v8;
  objc_msgSend(v3, "startProbingWithCallback:", v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __35__DAKeyPairingSession_startProbing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession startProbing]_block_invoke", 143, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __35__DAKeyPairingSession_startProbing__block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v8 = a2;
  v17[1] = *MEMORY[0x24BDAC8D0];
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession startProbing]_block_invoke_2", 146, CFSTR("Result: %d"), a5, a6, a7, a8, a2);
  if ((v8 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(4));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 4, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
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
      v26 = __Block_byref_object_copy_;
      v27 = __Block_byref_object_dispose_;
      v14 = MEMORY[0x24BDAC760];
      v28 = 0;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __78__DAKeyPairingSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke;
      v22[3] = &unk_24C327380;
      v22[4] = &v23;
      objc_msgSend(a1, "getRemoteProxy:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __78__DAKeyPairingSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke_2;
      v21[3] = &unk_24C327380;
      v21[4] = &v23;
      objc_msgSend(v15, "consumeTrackingReceipt:otherJSONData:forKeyWithIdentifier:callback:", v7, v8, v9, v21);

      a1 = (id)v24[5];
      _Block_object_dispose(&v23, 8);

    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]", 163, CFSTR("Null argument provided"), v10, v11, v12, v13, v20);
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

void __78__DAKeyPairingSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]_block_invoke", 169, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __78__DAKeyPairingSession_sendTrackingReceipt_otherJSONData_forKeyWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:]_block_invoke_2", 175, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:forKeyWithIdentifier:]", 186, CFSTR("keyIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  -[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v7, 0, v6);
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:vehicleMobilizationData:forKeyWithIdentifier:]", 196, CFSTR("keyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v8);
  +[DAUtils decryptVehicleMobilizationData:forKeyWithIdentifier:](DAUtils, "decryptVehicleMobilizationData:forKeyWithIdentifier:", v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, v15, v8);
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
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:slotIdentifier:confidentialMailboxData:ephemeralPublicKey:forKeyWithIdentifier:]", 210, CFSTR("Deprecated API"), v11, v12, v13, v14, v21);
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:slotIdentifier:confidentialMailboxData:ephemeralPublicKey:forKeyWithIdentifier:]", 211, CFSTR("keyIdentifier: %@"), v15, v16, v17, v18, (uint64_t)v9);
  -[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, 0, v9);
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession setTrackingReceipt:decryptedDeviceData:forKeyWithIdentifier:]", 221, CFSTR("keyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v8);
  -[DAKeyPairingSession sendTrackingReceipt:otherJSONData:forKeyWithIdentifier:](self, v10, v9, v8);
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
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 246, CFSTR("endPointPrivacyDecryption: return error: %@"), v20, v21, v22, v23, (uint64_t)v19);
      v25 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v24, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 204, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v15[2](v15, 0, v27);
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 243, CFSTR("endPointPrivacyDecryption: got decrypted data: %@"), v20, v21, v22, v23, (uint64_t)v18);
      ((void (**)(id, void *, void *))v15)[2](v15, v18, 0);
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyPairingSession endPointPrivacyDecryption:encryptedData:publicKey:callback:]", 233, CFSTR("Null argument provided"), v11, v12, v13, v14, v29);
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
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession requestImmobilizerTokenRefillForKeyWithIdentifier:callback:]", 258, CFSTR("This method is deprecated. Please stop use."), v5, v6, v7, v8, v13);
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
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeyPairingSession setImmobilizerTokens:publicKey:forKeyWithIdentifier:callback:]", 268, CFSTR("This method is deprecated. Please stop use."), v7, v8, v9, v10, v15);
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession didStart:]", 276, &stru_24C3287B0, v3, v4, v5, v6, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeyPairingSession;
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
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession didEnd:]", 282, &stru_24C3287B0, v5, v6, v7, v8, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeyPairingSession;
  -[DASession didEnd:](&v9, sel_didEnd_, v4);

}

- (void)handleKeyPairingCompletionResult:(id)a3 keyInformation:(id)a4 trackingRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  DAKeyPairingSession *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DASession getDelegate](self, "getDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __87__DAKeyPairingSession_handleKeyPairingCompletionResult_keyInformation_trackingRequest___block_invoke;
  v16[3] = &unk_24C3273D0;
  v17 = v8;
  v18 = v11;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v11;
  v15 = v8;
  -[DASession dispatchOnCallbackQueue:](self, "dispatchOnCallbackQueue:", v16);

}

void __87__DAKeyPairingSession_handleKeyPairingCompletionResult_keyInformation_trackingRequest___block_invoke(uint64_t a1)
{
  id v2;

  kmlErrorToDAError(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "keyPairingSession:didFinishPairingWithKey:trackingRequest:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v2);

}

- (void)handleFirstTransactionCompletionResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  DAKeyPairingSession *v11;

  v4 = a3;
  -[DASession getDelegate](self, "getDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__DAKeyPairingSession_handleFirstTransactionCompletionResult___block_invoke;
  v8[3] = &unk_24C3273F8;
  v9 = v4;
  v10 = v5;
  v11 = self;
  v6 = v5;
  v7 = v4;
  -[DASession dispatchOnCallbackQueue:](self, "dispatchOnCallbackQueue:", v8);

}

void __62__DAKeyPairingSession_handleFirstTransactionCompletionResult___block_invoke(uint64_t a1)
{
  id v2;

  kmlErrorToDAError(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "didFinishFirstTransactionForSession:error:", *(_QWORD *)(a1 + 48), v2);

}

- (void)handlePreWarmCompletionResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[DASession getDelegate](self, "getDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__DAKeyPairingSession_handlePreWarmCompletionResult___block_invoke;
  v8[3] = &unk_24C327420;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[DASession dispatchOnCallbackQueue:](self, "dispatchOnCallbackQueue:", v8);

}

void __53__DAKeyPairingSession_handlePreWarmCompletionResult___block_invoke(uint64_t a1)
{
  id v2;

  kmlErrorToDAError(*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "didFinishPreWarmWithResult:", v2);

}

- (void)handleProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  unint64_t v13;

  v6 = a4;
  -[DASession getDelegate](self, "getDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__DAKeyPairingSession_handleProbingCompletionWithBrandCode_error___block_invoke;
  v10[3] = &unk_24C327448;
  v12 = v6;
  v13 = a3;
  v11 = v7;
  v8 = v6;
  v9 = v7;
  -[DASession dispatchOnCallbackQueue:](self, "dispatchOnCallbackQueue:", v10);

}

void __66__DAKeyPairingSession_handleProbingCompletionWithBrandCode_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  kmlErrorToDAError(*(void **)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didFinishProbingWithBrandCode:error:", v2, v3);

}

- (void)handlePairingDidStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeyPairingSession handlePairingDidStart]", 325, &stru_24C3287B0, v2, v3, v4, v5, v9);
  -[DASession getDelegate](self, "getDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__DAKeyPairingSession_handlePairingDidStart__block_invoke;
  v10[3] = &unk_24C327470;
  v11 = v7;
  v8 = v7;
  -[DASession dispatchOnCallbackQueue:](self, "dispatchOnCallbackQueue:", v10);

}

uint64_t __44__DAKeyPairingSession_handlePairingDidStart__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didStartPairing");
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DAKeyPairingSession;
  -[DASession encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (DAKeyPairingSession)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAKeyPairingSession;
  return -[DASession initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
