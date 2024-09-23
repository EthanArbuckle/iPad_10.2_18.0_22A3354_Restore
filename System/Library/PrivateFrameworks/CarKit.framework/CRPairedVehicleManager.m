@implementation CRPairedVehicleManager

- (CRPairedVehicleManager)init
{
  CRPairedVehicleManager *v2;
  CRCarKitServiceClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRPairedVehicleManager;
  v2 = -[CRPairedVehicleManager init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CRCarKitServiceClient);
    -[CRPairedVehicleManager setServiceClient:](v2, "setServiceClient:", v3);

  }
  return v2;
}

- (void)setServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_serviceClient, a3);
}

void __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

void __60__CRPairedVehicleManager_fetchPairedVehiclesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v5);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v5);
  }

}

- (void)fetchPairedVehiclesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CRPairedVehicleManager_fetchPairedVehiclesWithCompletion___block_invoke;
  v6[3] = &unk_1E5428030;
  v7 = v4;
  v5 = v4;
  -[CRPairedVehicleManager fetchAllVehiclesWithCompletion:](self, "fetchAllVehiclesWithCompletion:", v6);

}

- (void)fetchAllVehiclesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CRPairedVehicleManager serviceClient](self, "serviceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke;
  v10[3] = &unk_1E54283C0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "performServiceBlock:errorHandler:", v10, v8);

}

- (CRCarKitServiceClient)serviceClient
{
  return self->_serviceClient;
}

void __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5428398;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchAllVehiclesWithReply:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClient, 0);
}

- (void)syncFetchAllVehiclesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CRPairedVehicleManager serviceClient](self, "serviceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke;
  v10[3] = &unk_1E54283C0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "performSynchronousServiceBlock:errorHandler:", v10, v8);

}

void __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5428398;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchAllVehiclesWithReply:", v3);

}

void __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

uint64_t __61__CRPairedVehicleManager_syncFetchAllVehiclesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __57__CRPairedVehicleManager_fetchAllVehiclesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __60__CRPairedVehicleManager_fetchPairedVehiclesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPaired");
}

- (void)saveVehicle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[CRPairedVehicleManager serviceClient](self, "serviceClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__CRPairedVehicleManager_saveVehicle_completion___block_invoke;
  v14[3] = &unk_1E5428058;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __49__CRPairedVehicleManager_saveVehicle_completion___block_invoke_2;
  v12[3] = &unk_1E5427E30;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  objc_msgSend(v8, "performServiceBlock:errorHandler:", v14, v12);

}

uint64_t __49__CRPairedVehicleManager_saveVehicle_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveVehicle:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __49__CRPairedVehicleManager_saveVehicle_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)removeVehicle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[CRPairedVehicleManager serviceClient](self, "serviceClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__CRPairedVehicleManager_removeVehicle_completion___block_invoke;
  v14[3] = &unk_1E5428058;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __51__CRPairedVehicleManager_removeVehicle_completion___block_invoke_2;
  v12[3] = &unk_1E5427E30;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  objc_msgSend(v8, "performServiceBlock:errorHandler:", v14, v12);

}

uint64_t __51__CRPairedVehicleManager_removeVehicle_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeVehicle:reply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __51__CRPairedVehicleManager_removeVehicle_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (id)_firstVehicleMatchingTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CRPairedVehicleManager__firstVehicleMatchingTest___block_invoke;
  v8[3] = &unk_1E5428408;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[CRPairedVehicleManager syncFetchAllVehiclesWithCompletion:](self, "syncFetchAllVehiclesWithCompletion:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__CRPairedVehicleManager__firstVehicleMatchingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "indexOfObjectPassingTest:", *(_QWORD *)(a1 + 32));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)vehicleForBluetoothAddress:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CRPairedVehicleManager_vehicleForBluetoothAddress___block_invoke;
  v8[3] = &unk_1E5428430;
  v9 = v4;
  v5 = v4;
  -[CRPairedVehicleManager _firstVehicleMatchingTest:](self, "_firstVehicleMatchingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __53__CRPairedVehicleManager_vehicleForBluetoothAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;

  v6 = a2;
  objc_msgSend(v6, "bluetoothAddress");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "bluetoothAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      v7 = 1;
      *a4 = 1;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)vehicleNameForWiFiUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__CRPairedVehicleManager_vehicleNameForWiFiUUID___block_invoke;
  v9[3] = &unk_1E5428430;
  v10 = v4;
  v5 = v4;
  -[CRPairedVehicleManager _firstVehicleMatchingTest:](self, "_firstVehicleMatchingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vehicleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__CRPairedVehicleManager_vehicleNameForWiFiUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;

  v6 = a2;
  objc_msgSend(v6, "carplayWiFiUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "carplayWiFiUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      v7 = 1;
      *a4 = 1;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)vehicleForCertificateSerial:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CRPairedVehicleManager_vehicleForCertificateSerial___block_invoke;
  v8[3] = &unk_1E5428430;
  v9 = v4;
  v5 = v4;
  -[CRPairedVehicleManager _firstVehicleMatchingTest:](self, "_firstVehicleMatchingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__CRPairedVehicleManager_vehicleForCertificateSerial___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;

  v6 = a2;
  objc_msgSend(v6, "certificateSerialNumber");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "certificateSerialNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToData:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      v7 = 1;
      *a4 = 1;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)saveVehicle:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__CRPairedVehicleManager_saveVehicle___block_invoke;
  v10[3] = &unk_1E5428458;
  v12 = &v13;
  v6 = v5;
  v11 = v6;
  -[CRPairedVehicleManager saveVehicle:completion:](self, "saveVehicle:completion:", v4, v10);
  v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __38__CRPairedVehicleManager_saveVehicle___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)removeVehicle:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__CRPairedVehicleManager_removeVehicle___block_invoke;
  v9[3] = &unk_1E5428480;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  -[CRPairedVehicleManager removeVehicle:completion:](self, "removeVehicle:completion:", v4, v9);
  v7 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v7);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

intptr_t __40__CRPairedVehicleManager_removeVehicle___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)allVehicles
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__CRPairedVehicleManager_allVehicles__block_invoke;
  v8[3] = &unk_1E54284A8;
  v10 = &v11;
  v4 = v3;
  v9 = v4;
  -[CRPairedVehicleManager fetchAllVehiclesWithCompletion:](self, "fetchAllVehiclesWithCompletion:", v8);
  v5 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __37__CRPairedVehicleManager_allVehicles__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)pairedVehicles
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CRPairedVehicleManager_pairedVehicles__block_invoke;
  v8[3] = &unk_1E54284A8;
  v10 = &v11;
  v4 = v3;
  v9 = v4;
  -[CRPairedVehicleManager fetchPairedVehiclesWithCompletion:](self, "fetchPairedVehiclesWithCompletion:", v8);
  v5 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __40__CRPairedVehicleManager_pairedVehicles__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
