@implementation ENKeyClassRegister

+ (void)registerKeyClass:(Class)a3
{
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(a1, "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4CFBB5C;
  block[3] = &unk_1E987B2A0;
  block[4] = a3;
  dispatch_barrier_async(v4, block);

}

+ (id)registeredKeyClasses
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1D4CFBC44;
  v10 = sub_1D4CFBC54;
  v11 = 0;
  objc_msgSend(a1, "_queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4CFBC5C;
  block[3] = &unk_1E987B2C8;
  block[4] = &v6;
  dispatch_sync(v2, block);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)_queue
{
  if (qword_1EFEC8F90 != -1)
    dispatch_once(&qword_1EFEC8F90, &unk_1E987B048);
  return (id)qword_1EFEC8F98;
}

@end
