@implementation EFListStateCapturer

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EFListStateCapturer stateCaptureCancelable](self, "stateCaptureCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)EFListStateCapturer;
  -[EFListStateCapturer dealloc](&v4, sel_dealloc);
}

- (EFCancelable)stateCaptureCancelable
{
  return self->_stateCaptureCancelable;
}

- (EFListStateCapturer)initWithTitle:(id)a3 itemName:(id)a4 headLimit:(unint64_t)a5 tailLimit:(unint64_t)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  EFListStateCapturer *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *stateCaptureQueue;
  OS_dispatch_queue *v20;
  uint64_t v21;
  EFCancelable *stateCaptureCancelable;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27[3];
  id from;
  id location;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)EFListStateCapturer;
  v15 = -[EFListStateCapturer init](&v30, sel_init);
  if (v15)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.email.EFListStateCapturer.stateCaptureQueue", v17);
    stateCaptureQueue = v15->_stateCaptureQueue;
    v15->_stateCaptureQueue = (OS_dispatch_queue *)v18;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v15);
    from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, v14);
    v20 = v15->_stateCaptureQueue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __75__EFListStateCapturer_initWithTitle_itemName_headLimit_tailLimit_delegate___block_invoke;
    v24[3] = &unk_1E62A6128;
    objc_copyWeak(&v26, &location);
    objc_copyWeak(v27, &from);
    v27[1] = (id)a5;
    v27[2] = (id)a6;
    v25 = v13;
    EFLogRegisterStateCaptureBlock(v20, v12, 4, v24);
    v21 = objc_claimAutoreleasedReturnValue();
    stateCaptureCancelable = v15->_stateCaptureCancelable;
    v15->_stateCaptureCancelable = (EFCancelable *)v21;

    objc_destroyWeak(v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureCancelable, 0);
  objc_storeStrong((id *)&self->_stateCaptureQueue, 0);
}

id __75__EFListStateCapturer_initWithTitle_itemName_headLimit_tailLimit_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(void *, void *);
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD aBlock[4];
  id v19;
  id v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 48));
    if (v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v3, "labelForStateCapture");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR(" Label"));

      v20 = 0;
      objc_msgSend(v3, "itemsForStateCaptureWithErrorString:", &v20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v20;
      if (v6)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__EFListStateCapturer_initWithTitle_itemName_headLimit_tailLimit_delegate___block_invoke_2;
        aBlock[3] = &unk_1E62A6100;
        v19 = v3;
        v8 = (void (**)(void *, void *))_Block_copy(aBlock);
        v9 = objc_msgSend(v6, "count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("Count"));

        if (v9 <= *(_QWORD *)(a1 + 64) + *(_QWORD *)(a1 + 56))
        {
          v8[2](v8, v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 32));
        }
        else
        {
          objc_msgSend(v6, "subarrayWithRange:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "subarrayWithRange:", v9 - *(_QWORD *)(a1 + 64));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("First %@"), *(_QWORD *)(a1 + 32));
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Last %@"), *(_QWORD *)(a1 + 32));
          v8[2](v8, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v12);

          v8[2](v8, v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

        }
      }
      else
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("Error"));
      }

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __75__EFListStateCapturer_initWithTitle_itemName_headLimit_tailLimit_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__EFListStateCapturer_initWithTitle_itemName_headLimit_tailLimit_delegate___block_invoke_3;
  v5[3] = &unk_1E62A60D8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ef_compactMap:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __75__EFListStateCapturer_initWithTitle_itemName_headLimit_tailLimit_delegate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "descriptionForItem:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OS_dispatch_queue)stateCaptureQueue
{
  return self->_stateCaptureQueue;
}

@end
