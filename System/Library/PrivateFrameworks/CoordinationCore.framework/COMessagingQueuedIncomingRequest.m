@implementation COMessagingQueuedIncomingRequest

- (COMessagingQueuedIncomingRequest)initWithRequest:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  COMessagingQueuedIncomingRequest *v9;
  COMessagingQueuedIncomingRequest *v10;
  uint64_t v11;
  id callback;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMessagingQueuedIncomingRequest;
  v9 = -[COMessagingQueuedIncomingRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    v11 = MEMORY[0x2199F3D40](v8);
    callback = v10->_callback;
    v10->_callback = (id)v11;

    v10->_enqueueTimestamp = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  }

  return v10;
}

- (id)senderNode
{
  void *v2;
  void *v3;

  -[COMessagingQueuedIncomingRequest request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)remainingTimeUsingCurrentTime:(unint64_t)a3
{
  return (uint64_t)(3.0e11 - (double)(a3 - -[COMessagingQueuedIncomingRequest enqueueTimestamp](self, "enqueueTimestamp")));
}

- (COMessagingRequest)request
{
  return self->_request;
}

- (id)callback
{
  return self->_callback;
}

- (unint64_t)enqueueTimestamp
{
  return self->_enqueueTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
