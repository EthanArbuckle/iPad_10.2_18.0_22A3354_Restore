@implementation NAFuture(MTUtilities)

- (id)mtFinishWithFuture:()MTUtilities
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__NAFuture_MTUtilities__mtFinishWithFuture___block_invoke;
  v4[3] = &unk_1E39CD4D8;
  v4[4] = a1;
  return (id)objc_msgSend(a3, "addCompletionBlock:", v4);
}

- (id)mtSynchronousResult:()MTUtilities
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__NAFuture_MTUtilities__mtSynchronousResult___block_invoke;
  v10[3] = &unk_1E39CD800;
  v12 = &v14;
  v13 = a3;
  v6 = v5;
  v11 = v6;
  v7 = (id)objc_msgSend(a1, "addCompletionBlock:", v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

@end
