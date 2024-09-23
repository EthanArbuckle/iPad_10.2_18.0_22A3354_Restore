@implementation IPLocalStateUpdateStream

- (IPLocalStateUpdateStream)initWithSourceDeliveryQueue:(id)a3
{
  id v5;
  IPLocalStateUpdateStream *v6;
  IPLocalStateUpdateStream *v7;
  IPLocalStateUpdateStreamSource *v8;
  IPLocalStateUpdateStreamSource *source;
  IPLocalStateUpdateStreamSink *v10;
  IPLocalStateUpdateStreamSink *sink;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IPLocalStateUpdateStream;
  v6 = -[IPLocalStateUpdateStream init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asyncDeliveryQueue, a3);
    v8 = -[IPLocalStateUpdateStreamSource initWithUpdateStream:]([IPLocalStateUpdateStreamSource alloc], "initWithUpdateStream:", v7);
    source = v7->_source;
    v7->_source = v8;

    v10 = -[IPLocalStateUpdateStreamSink initWithUpdateStream:]([IPLocalStateUpdateStreamSink alloc], "initWithUpdateStream:", v7);
    sink = v7->_sink;
    v7->_sink = v10;

  }
  return v7;
}

- (id)sink
{
  return self->_sink;
}

- (id)source
{
  return self->_source;
}

- (void)sink:(id)a3 sendMessage:(id)a4
{
  id v5;
  NSObject *asyncDeliveryQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  asyncDeliveryQueue = self->_asyncDeliveryQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__IPLocalStateUpdateStream_sink_sendMessage___block_invoke;
  v8[3] = &unk_250FA3B50;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(asyncDeliveryQueue, v8);

}

uint64_t __45__IPLocalStateUpdateStream_sink_sendMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stream:receiveMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_asyncDeliveryQueue, 0);
}

@end
