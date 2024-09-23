@implementation ReplayErrorTransport

- (ReplayErrorTransport)initWithTransport:(id)a3
{
  id v5;
  ReplayErrorTransport *v6;
  ReplayErrorTransport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ReplayErrorTransport;
  v6 = -[ReplayErrorTransport init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transport, a3);

  return v7;
}

- (void)notifyError:(id)a3
{
  void *v4;
  dispatch_semaphore_t v5;
  dispatch_time_t v6;
  GTTransport_replayer *transport;
  dispatch_queue_global_t global_queue;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  dispatch_semaphore_t v12;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GTTransportMessage_replayer messageWithKind:attributes:objectPayload:](GTTransportMessage_replayer, "messageWithKind:attributes:objectPayload:", 4127, 0, a3));
    v5 = dispatch_semaphore_create(0);
    v6 = dispatch_time(0, 3000000000);
    transport = self->_transport;
    global_queue = dispatch_get_global_queue(0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __36__ReplayErrorTransport_notifyError___block_invoke;
    v11[3] = &unk_7260D8;
    v12 = v5;
    v10 = v5;
    -[GTTransport_replayer send:inReplyTo:error:replyQueue:timeout:handler:](transport, "send:inReplyTo:error:replyQueue:timeout:handler:", v4, 0, 0, v9, v6, v11);

    dispatch_semaphore_wait(v10, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

uint64_t __36__ReplayErrorTransport_notifyError___block_invoke(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return 1;
}

@end
