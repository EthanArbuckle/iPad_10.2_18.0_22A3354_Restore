@implementation IPLocalStateUpdateStreamSink

- (IPLocalStateUpdateStreamSink)initWithUpdateStream:(id)a3
{
  id v4;
  IPLocalStateUpdateStreamSink *v5;
  IPLocalStateUpdateStreamSink *v6;
  NSMutableArray *v7;
  NSMutableArray *queuedUpdateMessages;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IPLocalStateUpdateStreamSink;
  v5 = -[IPLocalStateUpdateStreamSink init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weakStream, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    queuedUpdateMessages = v6->_queuedUpdateMessages;
    v6->_queuedUpdateMessages = v7;

    v6->_resumptionLock._os_unfair_lock_opaque = 0;
    v6->_resumed = 0;
  }

  return v6;
}

- (void)resume
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__IPLocalStateUpdateStreamSink_resume__block_invoke;
  v2[3] = &unk_250FA3EA0;
  v2[4] = self;
  IPDoWithLock(&self->_resumptionLock, v2);
}

void __38__IPLocalStateUpdateStreamSink_resume__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(WeakRetained, "sink:sendMessage:", *(_QWORD *)(a1 + 32), v7, (_QWORD)v11);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 1;
}

- (void)sendUpdateMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__IPLocalStateUpdateStreamSink_sendUpdateMessage___block_invoke;
  v6[3] = &unk_250FA3B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  IPDoWithLock(&self->_resumptionLock, v6);

}

void __50__IPLocalStateUpdateStreamSink_sendUpdateMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 28))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    objc_msgSend(WeakRetained, "sink:sendMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 16), "addObject:", *(_QWORD *)(a1 + 40));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedUpdateMessages, 0);
  objc_destroyWeak((id *)&self->_weakStream);
}

@end
