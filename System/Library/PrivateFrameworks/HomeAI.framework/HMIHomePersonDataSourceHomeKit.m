@implementation HMIHomePersonDataSourceHomeKit

- (HMIHomePersonDataSourceHomeKit)initWithHMHomePersonManager:(id)a3
{
  id v5;
  HMIHomePersonDataSourceHomeKit *v6;
  HMIHomePersonDataSourceHomeKit *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMIHomePersonDataSourceHomeKit;
  v6 = -[HMIHomePersonDataSourceHomeKit init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    HMIDispatchQueueNameString(v6, 0);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v7->_homePersonManager, a3);
  }

  return v7;
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonDataSourceHomeKit *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchAllPersonsWithCompletion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIHomePersonDataSourceHomeKit workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke;
  v11[3] = &unk_24DBEA348;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

void __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_2;
  v3[3] = &unk_24DBEA320;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fetchAllPersonsWithCompletion:", v3);

}

void __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_23);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

id __64__HMIHomePersonDataSourceHomeKit_fetchAllPersonsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[HMIPerson personFromHomePerson:](HMIPerson, "personFromHomePerson:", a2);
}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@fetchPersonsWithUUIDs:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_2;
  v4[3] = &unk_24DBEA320;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchPersonsWithUUIDs:completion:", v3, v4);

}

void __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_3_0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

id __67__HMIHomePersonDataSourceHomeKit_fetchPersonsWithUUIDs_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[HMIPerson personFromHomePerson:](HMIPerson, "personFromHomePerson:", a2);
}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonDataSourceHomeKit *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchAllPersonFaceCropsWithCompletion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIHomePersonDataSourceHomeKit workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v11[3] = &unk_24DBEA348;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

void __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_2;
  v4[3] = &unk_24DBEA3B8;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "fetchAllPersonFaceCropsWithCompletion:", v4);

}

void __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_3;
    v4[3] = &unk_24DBEA390;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "na_map:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

HMIPersonFaceCrop *__72__HMIHomePersonDataSourceHomeKit_fetchAllPersonFaceCropsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  HMIPersonFaceCrop *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  HMIPersonFaceCrop *v22;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "source");
  if (v4 >= 5)
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v8;
      v26 = 2048;
      v27 = objc_msgSend(v3, "source");
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HMPersonFaceCropSource: %ld", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }
  v9 = [HMIPersonFaceCrop alloc];
  objc_msgSend(v3, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateCreated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceBoundingBox");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v3, "personUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v10, v11, v12, v21, v4, v14, v16, v18, v20);

  return v22;
}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@fetchFaceCropsForPersonsWithUUIDs:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2;
  v5[3] = &unk_24DBEA3B8;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "fetchFaceCropsForPersonsWithUUIDs:completion:", v3, v5);

}

void __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_3;
    v4[3] = &unk_24DBEA390;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "na_map:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

HMIPersonFaceCrop *__79__HMIHomePersonDataSourceHomeKit_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  HMIPersonFaceCrop *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  HMIPersonFaceCrop *v22;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "source");
  if (v4 >= 5)
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v8;
      v26 = 2048;
      v27 = objc_msgSend(v3, "source");
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HMPersonFaceCropSource: %ld", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }
  v9 = [HMIPersonFaceCrop alloc];
  objc_msgSend(v3, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateCreated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceBoundingBox");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v3, "personUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v10, v11, v12, v21, v4, v14, v16, v18, v20);

  return v22;
}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonDataSourceHomeKit *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchAllFaceprintsWithCompletion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIHomePersonDataSourceHomeKit workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke;
  v11[3] = &unk_24DBEA348;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

void __67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_2;
  v3[3] = &unk_24DBEA320;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fetchAllFaceprintsWithCompletion:", v3);

}

void __67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_7_1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

HMIFaceprint *__67__HMIHomePersonDataSourceHomeKit_fetchAllFaceprintsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HMIFaceprint *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMIFaceprint *v8;

  v2 = a2;
  v3 = [HMIFaceprint alloc];
  objc_msgSend(v2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceCropUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMIFaceprint initWithUUID:data:modelUUID:faceCropUUID:](v3, "initWithUUID:data:modelUUID:faceCropUUID:", v4, v5, v6, v7);
  return v8;
}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@fetchFaceprintsForFaceCropsWithUUIDs:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_2;
  v4[3] = &unk_24DBEA320;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "fetchFaceprintsForFaceCropsWithUUIDs:completion:", v3, v4);

}

void __82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_9_0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

HMIFaceprint *__82__HMIHomePersonDataSourceHomeKit_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HMIFaceprint *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMIFaceprint *v8;

  v2 = a2;
  v3 = [HMIFaceprint alloc];
  objc_msgSend(v2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceCropUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMIFaceprint initWithUUID:data:modelUUID:faceCropUUID:](v3, "initWithUUID:data:modelUUID:faceCropUUID:", v4, v5, v6, v7);
  return v8;
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  HMIHomePersonDataSourceHomeKit *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchSettingsWithCompletion", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v9);

}

- (void)performCloudPullWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonDataSourceHomeKit *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@performCloudPullWithCompletion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIHomePersonDataSourceHomeKit workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__HMIHomePersonDataSourceHomeKit_performCloudPullWithCompletion___block_invoke;
  v11[3] = &unk_24DBEA348;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

void __65__HMIHomePersonDataSourceHomeKit_performCloudPullWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performCloudPullWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)addFaceCrops:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  HMIHomePersonDataSourceHomeKit *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addFaceCrops:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMIHomePersonDataSourceHomeKit_addFaceCrops_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v16 = v6;
  v17 = v9;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __58__HMIHomePersonDataSourceHomeKit_addFaceCrops_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_12_0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addOrUpdateFaceCrops:completion:", v3, *(_QWORD *)(a1 + 48));

}

id __58__HMIHomePersonDataSourceHomeKit_addFaceCrops_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v2 = (objc_class *)MEMORY[0x24BDD7680];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceBoundingBox");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_msgSend(v4, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v5, v6, v7, v9, v11, v13, v15);
  return v16;
}

- (void)addFaceprints:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  HMIHomePersonDataSourceHomeKit *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addFaceprints:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMIHomePersonDataSourceHomeKit_addFaceprints_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v16 = v6;
  v17 = v9;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __59__HMIHomePersonDataSourceHomeKit_addFaceprints_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_15);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addOrUpdateFaceprints:completion:", v3, *(_QWORD *)(a1 + 48));

}

id __59__HMIHomePersonDataSourceHomeKit_addFaceprints_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x24BDD7688];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceCropUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v4, "initWithUUID:data:modelUUID:faceCropUUID:", v5, v6, v7, v8);
  return v9;
}

- (void)addPersonFaceCrops:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  HMIHomePersonDataSourceHomeKit *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addPersonFaceCrops:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__HMIHomePersonDataSourceHomeKit_addPersonFaceCrops_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v16 = v6;
  v17 = v9;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __64__HMIHomePersonDataSourceHomeKit_addPersonFaceCrops_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__HMIHomePersonDataSourceHomeKit_addPersonFaceCrops_completion___block_invoke_2;
  v5[3] = &unk_24DBEC778;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "na_map:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "homePersonManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOrUpdateFaceCrops:completion:", v3, *(_QWORD *)(a1 + 48));

}

id __64__HMIHomePersonDataSourceHomeKit_addPersonFaceCrops_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "source");
  if (v4 >= 5)
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v8;
      v27 = 2048;
      v28 = objc_msgSend(v3, "source");
      _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HMIPersonFaceCropSource: %ld", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }
  v9 = objc_alloc(MEMORY[0x24BDD7850]);
  objc_msgSend(v3, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateCreated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceBoundingBox");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v3, "personUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v9, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v10, v11, v12, v21, v14, v16, v18, v20);

  objc_msgSend(v22, "setSource:", v4);
  v23 = (void *)objc_msgSend(v22, "copy");

  return v23;
}

- (void)addPersons:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  HMIHomePersonDataSourceHomeKit *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@addPersons:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMIHomePersonDataSourceHomeKit_addPersons_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v16 = v6;
  v17 = v9;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __56__HMIHomePersonDataSourceHomeKit_addPersons_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_20);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addOrUpdatePersons:completion:", v3, *(_QWORD *)(a1 + 48));

}

id __56__HMIHomePersonDataSourceHomeKit_addPersons_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BDD7848];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUID:", v5);

  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setName:", v7);
  return v6;
}

- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMIHomePersonDataSourceHomeKit *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x220735570]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_DEBUG, "%{public}@fetchAllUnassociatedFaceCropsWithCompletion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMIHomePersonDataSourceHomeKit workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke;
  v11[3] = &unk_24DBEA348;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

void __78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke_2;
  v3[3] = &unk_24DBEA320;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fetchAllUnassociatedFaceCropsWithCompletion:", v3);

}

void __78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "na_map:", &__block_literal_global_23);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

HMIFaceCrop *__78__HMIHomePersonDataSourceHomeKit_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HMIFaceCrop *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  HMIFaceCrop *v15;

  v2 = a2;
  v3 = [HMIFaceCrop alloc];
  objc_msgSend(v2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceBoundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v3, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v4, v5, v6, v8, v10, v12, v14);
  return v15;
}

- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@removeFaceCropsWithUUIDs:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMIHomePersonDataSourceHomeKit_removeFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __70__HMIHomePersonDataSourceHomeKit_removeFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFaceCropsWithUUIDs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@removeFaceprintsWithUUIDs:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMIHomePersonDataSourceHomeKit_removeFaceprintsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __71__HMIHomePersonDataSourceHomeKit_removeFaceprintsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFaceprintsWithUUIDs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMIHomePersonDataSourceHomeKit *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_DEBUG, "%{public}@removePersonsWithUUIDs:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMIHomePersonDataSourceHomeKit workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMIHomePersonDataSourceHomeKit_removePersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

void __68__HMIHomePersonDataSourceHomeKit_removePersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removePersonsWithUUIDs:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HMIHomePersonDataSourceHomeKit *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  int64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!a5)
    _HMFPreconditionFailure();
  v13 = v12;
  v14 = (void *)MEMORY[0x220735570]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v17;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_DEBUG, "%{public}@associateFaceCropsWithUUIDs:%@ toPersonWithUUID:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMIHomePersonDataSourceHomeKit workQueue](v15, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__HMIHomePersonDataSourceHomeKit_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke;
  block[3] = &unk_24DBEC820;
  v25 = v13;
  v26 = a5;
  block[4] = v15;
  v23 = v10;
  v24 = v11;
  v19 = v13;
  v20 = v11;
  v21 = v10;
  dispatch_async(v18, block);

}

void __100__HMIHomePersonDataSourceHomeKit_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 >= 5)
  {
    v3 = (void *)MEMORY[0x220735570]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 64);
      v9 = 138543618;
      v10 = v6;
      v11 = 2048;
      v12 = v7;
      _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_ERROR, "%{public}@Received invalid HMIPersonFaceCropSource: %ld", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "homePersonManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "associateFaceCropsWithUUIDs:toPersonWithUUID:forSource:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 56));

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMIHomePersonDataSourceHomeKit homePersonManager](self, "homePersonManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMHomePersonManager)homePersonManager
{
  return (HMHomePersonManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHomePersonManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homePersonManager, 0);
}

@end
