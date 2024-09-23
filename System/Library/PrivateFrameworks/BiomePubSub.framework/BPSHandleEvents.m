@implementation BPSHandleEvents

- (BPSHandleEvents)initWithUpstream:(id)a3 receiveSubscription:(id)a4 receiveOutput:(id)a5 receiveCompletion:(id)a6 receiveCancel:(id)a7 receiveRequest:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BPSHandleEvents *v21;
  BPSHandleEvents *v22;
  uint64_t v23;
  id receiveSubscription;
  uint64_t v25;
  id receiveOutput;
  uint64_t v27;
  id receiveCompletion;
  uint64_t v29;
  id receiveCancel;
  uint64_t v31;
  id receiveRequest;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v34.receiver = self;
  v34.super_class = (Class)BPSHandleEvents;
  v21 = -[BPSHandleEvents init](&v34, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_upstream, a3);
    v23 = objc_msgSend(v16, "copy");
    receiveSubscription = v22->_receiveSubscription;
    v22->_receiveSubscription = (id)v23;

    v25 = objc_msgSend(v17, "copy");
    receiveOutput = v22->_receiveOutput;
    v22->_receiveOutput = (id)v25;

    v27 = objc_msgSend(v18, "copy");
    receiveCompletion = v22->_receiveCompletion;
    v22->_receiveCompletion = (id)v27;

    v29 = objc_msgSend(v19, "copy");
    receiveCancel = v22->_receiveCancel;
    v22->_receiveCancel = (id)v29;

    v31 = objc_msgSend(v20, "copy");
    receiveRequest = v22->_receiveRequest;
    v22->_receiveRequest = (id)v31;

    v22->_lock._os_unfair_lock_opaque = 0;
  }

  return v22;
}

- (BPSHandleEvents)initWithUpstream:(id)a3 receiveOutput:(id)a4 receiveCancel:(id)a5
{
  return -[BPSHandleEvents initWithUpstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:](self, "initWithUpstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:", a3, &__block_literal_global_1, a4, &__block_literal_global_84, a5, &__block_literal_global_86);
}

- (void)subscribe:(id)a3
{
  BPSPublisher *upstream;
  id v5;
  _BPSHandleEventsInner *v6;

  upstream = self->_upstream;
  v5 = a3;
  v6 = -[_BPSHandleEventsInner initWithDownstream:handleEvents:]([_BPSHandleEventsInner alloc], "initWithDownstream:handleEvents:", v5, self);

  -[BPSPublisher subscribe:](upstream, "subscribe:", v6);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BPSHandleEvents *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BPSHandleEvents *v15;

  v6 = a3;
  v7 = a4;
  v8 = [BPSHandleEvents alloc];
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "receiveSubscription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiveOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiveCompletion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiveCancel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiveRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BPSHandleEvents initWithUpstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:](v8, "initWithUpstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:", v9, v10, v11, v12, v13, v14);

  return v15;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSHandleEvents upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSHandleEvents upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[BPSHandleEvents upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BPSHandleEvents receiveOutput](self, "receiveOutput");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v4);

  }
  return v4;
}

- (void)cancel
{
  void (**v2)(void);

  -[BPSHandleEvents receiveCancel](self, "receiveCancel");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)receiveSubscription
{
  return self->_receiveSubscription;
}

- (id)receiveOutput
{
  return self->_receiveOutput;
}

- (id)receiveCompletion
{
  return self->_receiveCompletion;
}

- (id)receiveCancel
{
  return self->_receiveCancel;
}

- (id)receiveRequest
{
  return self->_receiveRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveRequest, 0);
  objc_storeStrong(&self->_receiveCancel, 0);
  objc_storeStrong(&self->_receiveCompletion, 0);
  objc_storeStrong(&self->_receiveOutput, 0);
  objc_storeStrong(&self->_receiveSubscription, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

@end
