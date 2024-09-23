@implementation IPXPCEventStateUpdateStream

- (IPXPCEventStateUpdateStream)initWithStreamName:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  IPXPCEventStateUpdateStream *v8;
  uint64_t v9;
  NSString *streamName;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPXPCEventStateUpdateStream;
  v8 = -[IPXPCEventStateUpdateStream init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    streamName = v8->_streamName;
    v8->_streamName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (id)sink
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__IPXPCEventStateUpdateStream_sink__block_invoke;
  v4[3] = &unk_250FA3DC0;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__IPXPCEventStateUpdateStream_sink__block_invoke(uint64_t a1)
{
  void *v2;
  IPXPCEventStateUpdateStreamSink *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = -[IPXPCEventStateUpdateStreamSink initWithQueue:streamName:]([IPXPCEventStateUpdateStreamSink alloc], "initWithQueue:streamName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (id)source
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__IPXPCEventStateUpdateStream_source__block_invoke;
  v4[3] = &unk_250FA3DC0;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __37__IPXPCEventStateUpdateStream_source__block_invoke(uint64_t a1)
{
  void *v2;
  IPXPCEventStateUpdateStreamSource *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = -[IPXPCEventStateUpdateStreamSource initWithQueue:streamName:]([IPXPCEventStateUpdateStreamSource alloc], "initWithQueue:streamName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
}

@end
