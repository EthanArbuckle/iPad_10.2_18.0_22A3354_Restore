@implementation FCBackgroundActivityScheduler

- (void)scheduleBackgroundTaskRepeatingAtInterval:(double)a3 identifier:(id)a4 task:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  FCBackgroundActivityScheduler *v15;
  id v16;

  v8 = a5;
  -[FCBackgroundActivityScheduler _makeFullIdentifierFromIdentifier:](self, "_makeFullIdentifierFromIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", v9);
  objc_msgSend(v10, "setRepeats:", 1);
  objc_msgSend(v10, "setInterval:", a3);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke;
  v13[3] = &unk_1E4645CB8;
  v14 = v10;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v10;
  objc_msgSend(v12, "scheduleWithBlock:", v13);

}

void __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD aBlock[4];
  id v11;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke_2;
  aBlock[3] = &unk_1E463AB90;
  v11 = *(id *)(a1 + 32);
  v5 = _Block_copy(aBlock);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke_3;
  v8[3] = &unk_1E4645C90;
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  v7 = _Block_copy(v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldDefer");
}

uint64_t __91__FCBackgroundActivityScheduler_scheduleBackgroundTaskRepeatingAtInterval_identifier_task___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_makeFromFCResult:", a2));
}

- (void)cancelRepeatingTaskWithIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[FCBackgroundActivityScheduler _makeFullIdentifierFromIdentifier:](self, "_makeFullIdentifierFromIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", v4);
  objc_msgSend(v3, "invalidate");

}

- (void)requestBackgroundAppRefreshStartingAfter:(id)a3 before:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = (void *)MEMORY[0x1E0D1D928];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "scheduler");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D1D900];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D1D9C8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:", v10, v11, v13, *MEMORY[0x1E0D1D9B8], *MEMORY[0x1E0D1D978], v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setRequiresNetwork:", 1);
  objc_msgSend(v15, "submitActivity:", v14);

}

- (int64_t)_makeFromFCResult:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return 1;
}

- (id)_makeFullIdentifierFromIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v6);
  objc_msgSend(v7, "appendString:", CFSTR("."));
  objc_msgSend(v7, "appendString:", v4);

  return v7;
}

@end
