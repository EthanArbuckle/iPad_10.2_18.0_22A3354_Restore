@implementation HKHealthStore(HKMedicalIDAdditions)

- (id)createMedicalIDData
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  v2 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HKHealthStore_HKMedicalIDAdditions__createMedicalIDData__block_invoke;
  v9[3] = &unk_1E9C42360;
  v11 = &v12;
  v3 = v2;
  v10 = v3;
  objc_msgSend(a1, "fetchMedicalIDDataCreateIfNecessary:withCompletion:", 1, v9);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (void *)v13[5];
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB6FD8]);
    v6 = (void *)v13[5];
    v13[5] = (uint64_t)v5;

    v4 = (void *)v13[5];
  }
  v7 = v4;

  _Block_object_dispose(&v12, 8);
  return v7;
}

@end
