@implementation HNScreenTimeCategory

+ (id)categoryForBundleId:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
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

  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_21775DFDC;
  v16 = sub_21775DFEC;
  v17 = 0;
  objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_21775DFF4;
  v9[3] = &unk_24D8032B8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "categoryForBundleID:completionHandler:", v3, v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

@end
