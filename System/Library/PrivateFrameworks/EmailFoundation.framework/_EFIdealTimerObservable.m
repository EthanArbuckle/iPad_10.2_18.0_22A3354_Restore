@implementation _EFIdealTimerObservable

- (_EFIdealTimerObservable)initWithObservable:(id)a3 timeInterval:(double)a4 scheduler:(id)a5
{
  id v9;
  id v10;
  _EFIdealTimerObservable *v11;
  _EFIdealTimerObservable *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_EFIdealTimerObservable;
  v11 = -[_EFIdealTimerObservable init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_input, a3);
    objc_storeStrong((id *)&v12->_scheduler, a5);
    v12->_interval = a4;
  }

  return v12;
}

- (id)subscribe:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double interval;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  EFScheduler *v12;
  id v13;
  void *v14;
  EFObservable *input;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  EFScheduler *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  EFScheduler *v35;
  id v36;
  _QWORD *v37;
  double v38;
  uint64_t v39;
  _QWORD aBlock[4];
  id v41;
  _QWORD v42[5];

  v24 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  interval = self->_interval;
  v23 = self->_scheduler;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0x10000000000000;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37___EFIdealTimerObservable_subscribe___block_invoke;
  aBlock[3] = &unk_1E62A5860;
  v9 = v24;
  v41 = v9;
  v10 = _Block_copy(aBlock);
  v33[0] = v8;
  v33[1] = 3221225472;
  v33[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_2;
  v33[3] = &unk_1E62A58D8;
  v11 = v7;
  v34 = v11;
  v37 = v42;
  v38 = interval;
  v39 = v5;
  v12 = v23;
  v35 = v12;
  v13 = v10;
  v36 = v13;
  v14 = _Block_copy(v33);
  input = self->_input;
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_3;
  v31[3] = &unk_1E62A5900;
  v16 = v14;
  v32 = v16;
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_4;
  v29[3] = &unk_1E62A5860;
  v30 = v9;
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_5;
  v27[3] = &unk_1E62A5888;
  v17 = v30;
  v28 = v17;
  +[EFObserver observerWithResultBlock:completionBlock:failureBlock:](EFObserver, "observerWithResultBlock:completionBlock:failureBlock:", v31, v29, v27, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable subscribe:](input, "subscribe:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __37___EFIdealTimerObservable_subscribe___block_invoke_6;
  v25[3] = &unk_1E62A5860;
  v26 = v19;
  v20 = v19;
  +[EFCancelationToken tokenWithCancelationBlock:](EFCancelationToken, "tokenWithCancelationBlock:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v42, 8);
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
