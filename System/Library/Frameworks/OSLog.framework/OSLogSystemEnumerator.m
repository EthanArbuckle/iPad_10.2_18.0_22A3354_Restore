@implementation OSLogSystemEnumerator

- (OSLogSystemEnumerator)initWithEventStream:(id)a3 options:(unint64_t)a4 position:(id)a5
{
  char v6;
  id v9;
  id v10;
  OSLogSystemEnumerator *v11;
  OSLogSystemEnumerator *v12;
  id *p_stream;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *pushDone;
  dispatch_semaphore_t v16;
  OS_dispatch_semaphore *handlerDone;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  OSLogSystemEnumerator *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)OSLogSystemEnumerator;
  v11 = -[OSLogSystemEnumerator init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    p_stream = (id *)&v11->_stream;
    objc_storeStrong((id *)&v11->_stream, a3);
    v14 = dispatch_semaphore_create(0);
    pushDone = v12->_pushDone;
    v12->_pushDone = (OS_dispatch_semaphore *)v14;

    v16 = dispatch_semaphore_create(0);
    handlerDone = v12->_handlerDone;
    v12->_handlerDone = (OS_dispatch_semaphore *)v16;

    objc_initWeak(&location, v12);
    v18 = *p_stream;
    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke;
    v29[3] = &unk_1E977B3E0;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v18, "setEventHandler:", v29);
    v20 = *p_stream;
    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke_2;
    v27[3] = &unk_1E977B408;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v20, "setInvalidationHandler:", v27);
    objc_msgSend(*p_stream, "setFlags:", 39);
    if ((v6 & 1) != 0)
      objc_msgSend(*p_stream, "setFlags:", objc_msgSend(*p_stream, "flags") | 8);
    if (v10)
    {
      if (objc_msgSend(v10, "precision") == 1)
      {
        v21 = *p_stream;
        objc_msgSend(v10, "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "activateStreamFromDate:", v22);
LABEL_10:

        goto LABEL_11;
      }
      if (objc_msgSend(v10, "precision") == 2)
      {
        v23 = *p_stream;
        objc_msgSend(v10, "offset");
        objc_msgSend(v23, "_activateStreamFromTimeIntervalSinceLastBoot:");
LABEL_11:
        v25 = v12;
        objc_destroyWeak(&v28);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
    }
    v24 = *p_stream;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateStreamFromDate:", v22);
    goto LABEL_10;
  }
LABEL_12:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[OSLogEventStream invalidate](self->_stream, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)OSLogSystemEnumerator;
  -[OSLogSystemEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  OSLogEntry *v3;

  if (self->_done
    || (dispatch_semaphore_signal((dispatch_semaphore_t)self->_pushDone),
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_handlerDone, 0xFFFFFFFFFFFFFFFFLL),
        self->_done))
  {
    v3 = 0;
  }
  else
  {
    v3 = self->_next;
  }
  return v3;
}

- (void)_handleEventProxy:(id)a3
{
  OSLogEntry *v4;
  OSLogEntry *next;

  convertEventProxyToEntry(a3);
  v4 = (OSLogEntry *)objc_claimAutoreleasedReturnValue();
  next = self->_next;
  self->_next = v4;

}

- (void)_handleInvalidation
{
  self->_done = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_pushDone);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_handlerDone);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerDone, 0);
  objc_storeStrong((id *)&self->_pushDone, 0);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

void __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *WeakRetained;
  id *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;

  v10 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = WeakRetained[4];
    v7 = WeakRetained[5];
    v8 = v6;

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v9 = objc_loadWeakRetained(v3);
    objc_msgSend(v9, "_handleEventProxy:", v10);

    dispatch_semaphore_signal(v7);
  }

}

void __62__OSLogSystemEnumerator_initWithEventStream_options_position___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInvalidation");

}

@end
