@implementation HMIHomePersonDataSourceInMemory

- (HMIHomePersonDataSourceInMemory)init
{
  HMIHomePersonDataSourceInMemory *v2;
  HMIHomePersonDataSourceInMemory *v3;
  uint64_t v4;
  NSMutableDictionary *personToFaceCrops;
  uint64_t v6;
  NSMutableSet *unassociatedFaceCrops;
  uint64_t v8;
  NSSet *removedPersonFaceCrops;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HMIHomePersonDataSourceInMemory;
  v2 = -[HMIHomePersonDataSourceInMemory init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    personToFaceCrops = v3->_personToFaceCrops;
    v3->_personToFaceCrops = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    unassociatedFaceCrops = v3->_unassociatedFaceCrops;
    v3->_unassociatedFaceCrops = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    removedPersonFaceCrops = v3->_removedPersonFaceCrops;
    v3->_removedPersonFaceCrops = (NSSet *)v8;

    HMIDispatchQueueNameString(v3, 0);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v13;

  }
  return v3;
}

- (id)existingPersonUUIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x24BDBCF20];
  -[HMIHomePersonDataSourceInMemory personToFaceCrops](self, "personToFaceCrops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

uint64_t __54__HMIHomePersonDataSourceInMemory_existingPersonUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (id)existingPersonFaceCropUUIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHomePersonDataSourceInMemory personToFaceCrops](self, "personToFaceCrops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__HMIHomePersonDataSourceInMemory_existingPersonFaceCropUUIDs__block_invoke;
  v10[3] = &unk_24DBEBC38;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "na_each:", v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  os_unfair_lock_unlock(p_lock);
  return v8;
}

void __62__HMIHomePersonDataSourceInMemory_existingPersonFaceCropUUIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "na_map:", &__block_literal_global_4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

uint64_t __62__HMIHomePersonDataSourceInMemory_existingPersonFaceCropUUIDs__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (id)existingFaceCropUUIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIHomePersonDataSourceInMemory unassociatedFaceCrops](self, "unassociatedFaceCrops");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_7_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

uint64_t __56__HMIHomePersonDataSourceInMemory_existingFaceCropUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (void)fetchAllFaceprintsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMIHomePersonDataSourceInMemory_fetchAllFaceprintsWithCompletion___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __68__HMIHomePersonDataSourceInMemory_fetchAllFaceprintsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)fetchAllPersonFaceCropsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__HMIHomePersonDataSourceInMemory_fetchAllPersonFaceCropsWithCompletion___block_invoke;
  v7[3] = &unk_24DBEA348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __73__HMIHomePersonDataSourceInMemory_fetchAllPersonFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "personToFaceCrops");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__HMIHomePersonDataSourceInMemory_fetchAllPersonFaceCropsWithCompletion___block_invoke_2;
  v9[3] = &unk_24DBEBC38;
  v8 = v2;
  v10 = v8;
  objc_msgSend(v5, "na_each:", v9);

  os_unfair_lock_unlock(v3);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)objc_msgSend(v8, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

}

uint64_t __73__HMIHomePersonDataSourceInMemory_fetchAllPersonFaceCropsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
}

- (void)fetchAllPersonsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMIHomePersonDataSourceInMemory_fetchAllPersonsWithCompletion___block_invoke;
  v7[3] = &unk_24DBEA348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__HMIHomePersonDataSourceInMemory_fetchAllPersonsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  os_unfair_lock_s *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "personToFaceCrops");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(v3);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

}

- (void)fetchFaceCropsForPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMIHomePersonDataSourceInMemory *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HMIHomePersonDataSourceInMemory_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __80__HMIHomePersonDataSourceInMemory_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  os_unfair_lock_s *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "existingPersonUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isSubsetOfSet:", v3);

  if ((v2 & 1) != 0)
  {
    v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __80__HMIHomePersonDataSourceInMemory_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2;
    v11[3] = &unk_24DBEBCC8;
    v12 = *(id *)(a1 + 32);
    v6 = v10;
    v13 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

    os_unfair_lock_unlock(v4);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)objc_msgSend(v6, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Invalid person UUIDs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v8);
  }

}

void __80__HMIHomePersonDataSourceInMemory_fetchFaceCropsForPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", v7);

}

- (void)fetchFaceprintsForFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__HMIHomePersonDataSourceInMemory_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __83__HMIHomePersonDataSourceInMemory_fetchFaceprintsForFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)fetchPersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMIHomePersonDataSourceInMemory *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMIHomePersonDataSourceInMemory_fetchPersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__HMIHomePersonDataSourceInMemory_fetchPersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "existingPersonUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isSubsetOfSet:", v3);

  if ((v2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    v6 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v5);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__HMIHomePersonDataSourceInMemory_fetchPersonsWithUUIDs_completion___block_invoke_2;
    v13[3] = &unk_24DBEBCF0;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v11, "na_filter:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Invalid person UUIDs"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);

  }
}

uint64_t __68__HMIHomePersonDataSourceInMemory_fetchPersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)performCloudPullWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMIHomePersonDataSourceInMemory_performCloudPullWithCompletion___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __66__HMIHomePersonDataSourceInMemory_performCloudPullWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addFaceCrops:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMIHomePersonDataSourceInMemory_addFaceCrops_completion___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __59__HMIHomePersonDataSourceInMemory_addFaceCrops_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Not implemented"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)addPersonFaceCrops:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMIHomePersonDataSourceInMemory_addPersonFaceCrops_completion___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __65__HMIHomePersonDataSourceInMemory_addPersonFaceCrops_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Not implemented"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)addPersons:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMIHomePersonDataSourceInMemory *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  os_unfair_lock_s *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_16);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "existingPersonUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "intersectsSet:", v2);

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Invalid persons, person already exists"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke_3;
    v9[3] = &unk_24DBEBD38;
    v7 = *(void **)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "na_each:", v9);
    os_unfair_lock_unlock(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __57__HMIHomePersonDataSourceInMemory_addPersons_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a2;
  objc_msgSend(v3, "set");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personToFaceCrops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v4);

}

- (void)fetchAllUnassociatedFaceCropsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__HMIHomePersonDataSourceInMemory_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke;
  v7[3] = &unk_24DBEA348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __79__HMIHomePersonDataSourceInMemory_fetchAllUnassociatedFaceCropsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "unassociatedFaceCrops");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchSettingsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMIHomePersonDataSourceInMemory_fetchSettingsWithCompletion___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __63__HMIHomePersonDataSourceInMemory_fetchSettingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Not implemented"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)removeFaceCropsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMIHomePersonDataSourceInMemory *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int8x16_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  int8x16_t v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "existingPersonFaceCropUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isSubsetOfSet:", v3);

  if ((v2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_2;
    v15[3] = &unk_24DBEBD88;
    v14 = v4;
    v16 = v14;
    v13 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v13.i64[0];
    v17 = vextq_s8(v13, v13, 8uLL);
    objc_msgSend(v7, "na_each:", v15);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setByAddingObjectsFromSet:", v14);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v9;

    os_unfair_lock_unlock(v5);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Invalid faceCropUUIDs"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v14);
  }

}

void __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "personToFaceCrops");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_3;
  v19[3] = &unk_24DBEBD60;
  v20 = *(id *)(a1 + 48);
  objc_msgSend(v7, "na_filter:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v9);

  objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15 = 3221225472;
  v16 = __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_4;
  v17 = &unk_24DBEBD60;
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v11, "na_filter:", &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v5);

}

uint64_t __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __71__HMIHomePersonDataSourceInMemory_removeFaceCropsWithUUIDs_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)removePersonsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMIHomePersonDataSourceInMemory *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMIHomePersonDataSourceInMemory_removePersonsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBE9AA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __69__HMIHomePersonDataSourceInMemory_removePersonsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "existingPersonUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isSubsetOfSet:", v3);

  if ((v2 & 1) != 0)
  {
    v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__HMIHomePersonDataSourceInMemory_removePersonsWithUUIDs_completion___block_invoke_2;
    v11[3] = &unk_24DBEBDB0;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v12 = v7;
    v13 = v8;
    objc_msgSend(v6, "na_each:", v11);

    os_unfair_lock_unlock(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, CFSTR("Invalid persons, person UUID doesn't exists"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

  }
}

void __69__HMIHomePersonDataSourceInMemory_removePersonsWithUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v14 = v3;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = *(_QWORD **)(a1 + 40);
    v7 = (void *)v6[4];
    objc_msgSend(v6, "personToFaceCrops");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromSet:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = v10;

    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v14);

  }
}

- (void)addFaceprints:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HMIHomePersonDataSourceInMemory_addFaceprints_completion___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __60__HMIHomePersonDataSourceInMemory_addFaceprints_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeFaceprintsWithUUIDs:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMIHomePersonDataSourceInMemory_removeFaceprintsWithUUIDs_completion___block_invoke;
  block[3] = &unk_24DBEBCA0;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __72__HMIHomePersonDataSourceInMemory_removeFaceprintsWithUUIDs_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)associateFaceCropsWithUUIDs:(id)a3 toPersonWithUUID:(id)a4 forSource:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  HMIHomePersonDataSourceInMemory *v19;
  id v20;
  id v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HMIHomePersonDataSourceInMemory workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke;
  block[3] = &unk_24DBEBE78;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v21 = v12;
  v22 = a5;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(v13, block);

}

void __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  os_unfair_lock_s *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  id v35[2];
  void *v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  id v40;
  _QWORD v41[4];
  id v42;
  int8x16_t v43;
  id v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t v51;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "existingFaceCropUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isSubsetOfSet:", v3))
  {

  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "existingPersonFaceCropUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isSubsetOfSet:", v5);

    if ((v4 & 1) == 0)
    {
      v32 = *(_QWORD *)(a1 + 56);
      v33 = (void *)MEMORY[0x24BDD1540];
      v34 = CFSTR("Invalid faceCropUUIDs");
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "existingPersonUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 48));

  if ((v7 & 1) != 0)
  {
    v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 40) + 8);
    os_unfair_lock_lock_with_options();
    v9 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(*(id *)(a1 + 40), "unassociatedFaceCrops");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_2;
    v48[3] = &unk_24DBEBDD8;
    v49 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 64);
    v50 = v12;
    v51 = v13;
    objc_msgSend(v10, "na_map:", v48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "unassociatedFaceCrops");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v11;
    v46[1] = 3221225472;
    v46[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_3;
    v46[3] = &unk_24DBEBE00;
    v47 = *(id *)(a1 + 32);
    objc_msgSend(v16, "na_filter:", v46);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "mutableCopy");
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(void **)(v19 + 24);
    *(_QWORD *)(v19 + 24) = v18;

    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v11;
    v41[1] = 3221225472;
    v41[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_4;
    v41[3] = &unk_24DBEBE50;
    v23 = v15;
    v42 = v23;
    *(_OWORD *)v35 = *(_OWORD *)(a1 + 32);
    v24 = v35[0];
    v43 = vextq_s8(*(int8x16_t *)v35, *(int8x16_t *)v35, 8uLL);
    v25 = *(id *)(a1 + 48);
    v26 = *(_QWORD *)(a1 + 64);
    v44 = v25;
    v45 = v26;
    objc_msgSend(v22, "na_each:", v41);

    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v11;
    v37[1] = 3221225472;
    v37[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_7;
    v37[3] = &unk_24DBEBD88;
    v29 = *(id *)(a1 + 48);
    v30 = *(_QWORD *)(a1 + 40);
    v38 = v29;
    v39 = v30;
    v31 = v23;
    v40 = v31;
    objc_msgSend(v28, "na_each:", v37);

    os_unfair_lock_unlock(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  v32 = *(_QWORD *)(a1 + 56);
  v33 = (void *)MEMORY[0x24BDD1540];
  v34 = CFSTR("Invalid personUUID");
LABEL_8:
  objc_msgSend(v33, "hmiPrivateErrorWithCode:description:", 1000, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v36);

}

HMIPersonFaceCrop *__101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HMIPersonFaceCrop *v6;
  void *v7;
  void *v8;
  void *v9;
  HMIPersonFaceCrop *v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = [HMIPersonFaceCrop alloc];
    objc_msgSend(v3, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateCreated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceBoundingBox");
    v10 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](v6, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v7, v8, v9, a1[5], a1[6]);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

void __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;

  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "personToFaceCrops");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_5;
  v21[3] = &unk_24DBEBE28;
  v22 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v23 = v9;
  v24 = v10;
  objc_msgSend(v7, "na_map:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v11);

  objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  v17 = 3221225472;
  v18 = __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_6;
  v19 = &unk_24DBEBD60;
  v20 = *(id *)(a1 + 48);
  objc_msgSend(v13, "na_filter:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v5);

}

HMIPersonFaceCrop *__101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HMIPersonFaceCrop *v6;
  void *v7;
  void *v8;
  void *v9;
  HMIPersonFaceCrop *v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = [HMIPersonFaceCrop alloc];
    objc_msgSend(v3, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateCreated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "faceBoundingBox");
    v10 = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](v6, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v7, v8, v9, a1[5], a1[6]);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

void __101__HMIHomePersonDataSourceInMemory_associateFaceCropsWithUUIDs_toPersonWithUUID_forSource_completion___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "personToFaceCrops");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
}

+ (id)shortDescription
{
  return CFSTR("NOT IMPLEMENTED");
}

- (NSMutableDictionary)personToFaceCrops
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableSet)unassociatedFaceCrops
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)removedPersonFaceCrops
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_removedPersonFaceCrops, 0);
  objc_storeStrong((id *)&self->_unassociatedFaceCrops, 0);
  objc_storeStrong((id *)&self->_personToFaceCrops, 0);
}

@end
