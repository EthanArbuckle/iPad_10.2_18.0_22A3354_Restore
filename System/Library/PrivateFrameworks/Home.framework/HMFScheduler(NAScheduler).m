@implementation HMFScheduler(NAScheduler)

- (id)afterDelay:()NAScheduler performBlock:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a4;
  objc_initWeak(&location, a1);
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__HMFScheduler_NAScheduler__afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1EA730E40;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "afterDelay:performBlock:", v11, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (id)performCancelableBlock:()NAScheduler
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D51990]);
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__HMFScheduler_NAScheduler__performCancelableBlock___block_invoke;
  v15[3] = &unk_1EA728120;
  v17 = v4;
  v7 = v5;
  v16 = v7;
  v8 = v4;
  objc_msgSend(a1, "performBlock:", v15);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __52__HMFScheduler_NAScheduler__performCancelableBlock___block_invoke_2;
  v13[3] = &unk_1EA727DD8;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  objc_msgSend(v7, "addCancelationBlock:", v13);
  v10 = v14;
  v11 = v7;

  return v11;
}

@end
