@implementation NAFuture(FirewallRuleManager)

- (id)blockAndWaitForCompletionWithError:()FirewallRuleManager
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__32264;
  v25 = __Block_byref_object_dispose__32265;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__32264;
  v19 = __Block_byref_object_dispose__32265;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__NAFuture_FirewallRuleManager__blockAndWaitForCompletionWithError___block_invoke;
  v11[3] = &unk_24E779ED0;
  v13 = &v21;
  v14 = &v15;
  v6 = v5;
  v12 = v6;
  v7 = (id)objc_msgSend(a1, "addCompletionBlock:", v11);
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    if (v22[5])
      v8 = 0;
    else
      v8 = (void *)v16[5];
    *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end
