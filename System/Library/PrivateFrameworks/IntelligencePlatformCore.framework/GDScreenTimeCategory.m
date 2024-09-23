@implementation GDScreenTimeCategory

+ (id)categoryForBundleId:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1C106A390;
  v20 = sub_1C106A3A0;
  v21 = 0;
  objc_msgSend_sharedCategories(MEMORY[0x1E0D0D510], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1C106A3A8;
  v13[3] = &unk_1E7A49AF8;
  v15 = &v16;
  v9 = v4;
  v14 = v9;
  objc_msgSend_categoryForBundleID_completionHandler_(v8, v10, (uint64_t)v3, (uint64_t)v13);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

@end
