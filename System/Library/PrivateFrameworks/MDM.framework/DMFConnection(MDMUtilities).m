@implementation DMFConnection(MDMUtilities)

- (id)performRequest:()MDMUtilities error:
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__DMFConnection_MDMUtilities__performRequest_error___block_invoke;
  v11[3] = &unk_24EB67E98;
  v13 = &v15;
  v14 = a4;
  v8 = v7;
  v12 = v8;
  objc_msgSend(a1, "performRequest:completion:", v6, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

@end
