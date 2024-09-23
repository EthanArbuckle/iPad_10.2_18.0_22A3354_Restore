@implementation CMContinuityCaptureEventQueue

- (CMContinuityCaptureEventQueue)initWithActionDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  CMContinuityCaptureEventQueue *v8;
  CMContinuityCaptureEventQueue *v9;
  NSMutableArray *v10;
  NSMutableArray *eventQueue;
  NSMutableSet *v12;
  NSMutableSet *completedIdentifiers;
  CMContinuityCaptureEventQueue *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CMContinuityCaptureEventQueue;
  v8 = -[CMContinuityCaptureEventQueue init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    eventQueue = v9->_eventQueue;
    v9->_eventQueue = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    completedIdentifiers = v9->_completedIdentifiers;
    v9->_completedIdentifiers = v12;

    v14 = v9;
  }

  return v9;
}

- (void)enqueueEventAction:(unint64_t)a3 args:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  CMContinuityCaptureEventQueue *v11;
  id v12[2];
  id location;

  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CMContinuityCaptureEventQueue_enqueueEventAction_args___block_invoke;
  block[3] = &unk_24F06C3D8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __57__CMContinuityCaptureEventQueue_enqueueEventAction_args___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v2);
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = objc_msgSend(WeakRetained[3], "count");
      *(_DWORD *)buf = 138413058;
      v16 = v5;
      v17 = 1024;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      v21 = 2048;
      v22 = v8;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%@ enqueueEventAction %d %@ pendingActionCount %ld", buf, 0x26u);

    }
    v9 = objc_loadWeakRetained(WeakRetained + 1);
    v10 = WeakRetained[3];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56), CFSTR("ContinuityCaptureSelector"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("ContinuityCaptureArgs");
    v14[0] = v11;
    v14[1] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    if (objc_msgSend(WeakRetained[3], "count") == 1
      && (objc_msgSend(v9, "postEventAction:args:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "notifyCompletion");
    }
  }
  else
  {
    v9 = 0;
  }

}

- (void)setEventCompletionExpectationForIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CMContinuityCaptureEventQueue_setEventCompletionExpectationForIdentifiers___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __77__CMContinuityCaptureEventQueue_setEventCompletionExpectationForIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", *(_QWORD *)(a1 + 32));
    v3 = (void *)WeakRetained[4];
    WeakRetained[4] = v2;

  }
}

- (void)notifyCompletionForIdentfier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CMContinuityCaptureEventQueue_notifyCompletionForIdentfier___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureEventQueue_notifyCompletionForIdentfier___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      CMContinuityCaptureLog(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v7 = objc_loadWeakRetained(v2);
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *((_QWORD *)WeakRetained + 4);
        v10 = *((_QWORD *)WeakRetained + 5);
        v11 = 138413058;
        v12 = v7;
        v13 = 2114;
        v14 = v8;
        v15 = 2114;
        v16 = v9;
        v17 = 2114;
        v18 = v10;
        _os_log_debug_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEBUG, "%@ notify completion for identifier %{public}@ expected %{public}@ completed %{public}@", (uint8_t *)&v11, 0x2Au);

      }
    }
    objc_msgSend(*((id *)WeakRetained + 5), "addObject:", *(_QWORD *)(a1 + 32));
    v5 = (void *)*((_QWORD *)WeakRetained + 4);
    if (v5 && objc_msgSend(v5, "isEqualToSet:", *((_QWORD *)WeakRetained + 5)))
    {
      objc_msgSend(*((id *)WeakRetained + 5), "removeAllObjects");
      v6 = (void *)*((_QWORD *)WeakRetained + 4);
      *((_QWORD *)WeakRetained + 4) = 0;

      objc_msgSend(WeakRetained, "_notifyCompletion");
    }
  }

}

- (void)notifyCompletion
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__CMContinuityCaptureEventQueue_notifyCompletion__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__CMContinuityCaptureEventQueue_notifyCompletion__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyCompletion");

}

- (void)_dropStreamStartEventsForEntityIfApplicable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  CMContinuityCaptureEventQueue *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (!-[NSMutableArray count](self->_eventQueue, "count"))
    return;
  -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureArgs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || (unint64_t)objc_msgSend(v4, "count") < 3)
    goto LABEL_33;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStartStream"))
    || (unint64_t)-[NSMutableArray count](self->_eventQueue, "count") < 2)
  {
    goto LABEL_32;
  }
  v34 = v5;
  v33 = v7;
  v8 = 0;
  v9 = 1;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_eventQueue, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_eventQueue, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureSelector"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntValue");

      if (v14 == 3)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_eventQueue, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ContinuityCaptureArgs"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16 || (unint64_t)objc_msgSend(v16, "count") < 3)
          goto LABEL_23;
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStopStream"))
          && (v19 = objc_msgSend(v18, "unsignedIntValue"), v19 == objc_msgSend(v6, "unsignedIntValue")))
        {
          CMContinuityCaptureLog(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_eventQueue, "objectAtIndexedSubscript:", v9);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
            v21 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v36 = self;
            v37 = 2112;
            v38 = v31;
            v39 = 2112;
            v40 = v21;
            v22 = (void *)v21;
            _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%@ Associated stop %@ for %@", buf, 0x20u);

          }
          v8 = 1;
        }
        else
        {
          if (!objc_msgSend(v17, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStartStream")))
            goto LABEL_22;
          v23 = objc_msgSend(v18, "unsignedIntValue");
          if (v23 != objc_msgSend(v6, "unsignedIntValue"))
            goto LABEL_22;
          CMContinuityCaptureLog(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_eventQueue, "objectAtIndexedSubscript:", v9);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
            v24 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v36 = self;
            v37 = 2112;
            v38 = v32;
            v39 = 2112;
            v40 = v24;
            v25 = (void *)v24;
            _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%@ Associated start %@ for %@", buf, 0x20u);

          }
          v8 = 0;
        }

LABEL_22:
LABEL_23:

      }
    }
    ++v9;
  }
  while (-[NSMutableArray count](self->_eventQueue, "count") > v9);
  v7 = v33;
  v5 = v34;
  if ((v8 & 1) != 0)
  {
    CMContinuityCaptureLog(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray firstObject](self->_eventQueue, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = self;
      v37 = 2112;
      v38 = v27;
      _os_log_impl(&dword_227C5D000, v26, OS_LOG_TYPE_DEFAULT, "%@ Dropping %@", buf, 0x16u);

    }
    if (v33)
    {
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataCompletionBlock"));
        v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 2, 0);
        ((void (**)(_QWORD, void *))v29)[2](v29, v30);

      }
    }
    -[NSMutableArray removeObjectAtIndex:](self->_eventQueue, "removeObjectAtIndex:", 0);
  }
LABEL_32:

LABEL_33:
}

- (void)_notifyCompletion
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_3(&dword_227C5D000, a3, v6, "%@ Completed %@", (uint8_t *)&v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedIdentifiers, 0);
  objc_storeStrong((id *)&self->_expectedIdentifiers, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
