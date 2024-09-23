@implementation _MFMessageContentRequestScheduler

- (id)initWithScheduler:(void *)a3 requestID:(void *)a4 messagePersistence:
{
  id v8;
  id v9;
  id *v10;
  objc_super v12;

  v8 = a2;
  v9 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_MFMessageContentRequestScheduler;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      objc_storeStrong(a1 + 3, a4);
      a1[1] = a3;
    }
  }

  return a1;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  unint64_t requestID;
  EFScheduler *scheduler;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v6 = a4;
  requestID = self->_requestID;
  scheduler = self->_scheduler;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61___MFMessageContentRequestScheduler_afterDelay_performBlock___block_invoke;
  v12[3] = &unk_1E4E8DE10;
  v12[4] = self;
  v13 = v6;
  v14 = requestID;
  v9 = v6;
  -[EFScheduler afterDelay:performBlock:](scheduler, "afterDelay:performBlock:", v12, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)performBlockWithActivity:(uint64_t)a3 requestID:
{
  void (**v5)(_QWORD);
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = a2;
  if (a1)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 8);
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4F90000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MFMessageContentRequestScheduler", "Begin work on scheduler", buf, 2u);
      }

    }
    v5[2](v5);
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 8);
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4F90000, v10, OS_SIGNPOST_INTERVAL_END, v11, "MFMessageContentRequestScheduler", "End work on scheduler", v12, 2u);
      }

    }
  }

}

- (void)performBlock:(id)a3
{
  id v4;
  unint64_t requestID;
  EFScheduler *scheduler;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v4 = a3;
  requestID = self->_requestID;
  scheduler = self->_scheduler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50___MFMessageContentRequestScheduler_performBlock___block_invoke;
  v8[3] = &unk_1E4E8DE10;
  v8[4] = self;
  v9 = v4;
  v10 = requestID;
  v7 = v4;
  -[EFScheduler performBlock:](scheduler, "performBlock:", v8);

}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  EFScheduler *scheduler;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  scheduler = self->_scheduler;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60___MFMessageContentRequestScheduler_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E4E8DE60;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[EFScheduler performCancelableBlock:](scheduler, "performCancelableBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)performSyncBlock:(id)a3
{
  id v4;
  unint64_t requestID;
  EFScheduler *scheduler;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v4 = a3;
  requestID = self->_requestID;
  scheduler = self->_scheduler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54___MFMessageContentRequestScheduler_performSyncBlock___block_invoke;
  v8[3] = &unk_1E4E8DE10;
  v8[4] = self;
  v9 = v4;
  v10 = requestID;
  v7 = v4;
  -[EFScheduler performSyncBlock:](scheduler, "performSyncBlock:", v8);

}

- (void)performSyncBarrierBlock:(id)a3
{
  id v4;
  unint64_t requestID;
  EFScheduler *scheduler;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v4 = a3;
  requestID = self->_requestID;
  scheduler = self->_scheduler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61___MFMessageContentRequestScheduler_performSyncBarrierBlock___block_invoke;
  v8[3] = &unk_1E4E8DE10;
  v8[4] = self;
  v9 = v4;
  v10 = requestID;
  v7 = v4;
  -[EFScheduler performSyncBarrierBlock:](scheduler, "performSyncBarrierBlock:", v8);

}

- (void)performVoucherPreservingBlock:(id)a3
{
  id v4;
  unint64_t requestID;
  EFScheduler *scheduler;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v4 = a3;
  requestID = self->_requestID;
  scheduler = self->_scheduler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___MFMessageContentRequestScheduler_performVoucherPreservingBlock___block_invoke;
  v8[3] = &unk_1E4E8DE10;
  v8[4] = self;
  v9 = v4;
  v10 = requestID;
  v7 = v4;
  -[EFScheduler performVoucherPreservingBlock:](scheduler, "performVoucherPreservingBlock:", v8);

}

- (id)performWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "onScheduler:performWithObject:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
