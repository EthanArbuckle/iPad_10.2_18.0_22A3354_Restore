@implementation _SYOutputStreamer

- (_SYOutputStreamer)initWithCompressedFileURL:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  dispatch_source_t v24;
  void *v25;
  NSObject *v26;
  _SYOutputStreamer *v27;
  _QWORD handler[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_SYOutputStreamer;
  v8 = -[_SYOutputStreamer init](&v34, sel_init);
  if (v8
    && (v9 = -[SYCompressedFileOutputStream initToCompressedFileAtURL:shouldAppend:]([SYCompressedFileOutputStream alloc], "initToCompressedFileAtURL:shouldAppend:", v6, 0), v10 = (void *)*((_QWORD *)v8 + 1), *((_QWORD *)v8 + 1) = v9, v10, *((_QWORD *)v8 + 1)))
  {
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v6, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("_SYOutputStreamer: %@"), v12);

    v14 = objc_retainAutorelease(v13);
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    v18 = (void *)*((_QWORD *)v8 + 4);
    *((_QWORD *)v8 + 4) = v17;

    objc_storeStrong((id *)v8 + 6, a4);
    objc_msgSend(*((id *)v8 + 1), "setDelegate:", v8);
    objc_initWeak(&location, v8);
    v19 = (void *)*((_QWORD *)v8 + 1);
    v20 = *((_QWORD *)v8 + 4);
    v21 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __61___SYOutputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke;
    v31[3] = &unk_24CC66AE0;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v19, "_SY_notifyOnQueue:handler:", v20, v31);
    v22 = objc_opt_new();
    v23 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v22;

    v24 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, *((dispatch_queue_t *)v8 + 4));
    v25 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v24;

    v26 = *((_QWORD *)v8 + 5);
    handler[0] = v21;
    handler[1] = 3221225472;
    handler[2] = __61___SYOutputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_52;
    handler[3] = &unk_24CC655F8;
    objc_copyWeak(&v30, &location);
    dispatch_source_set_event_handler(v26, handler);
    objc_msgSend(*((id *)v8 + 1), "open");
    dispatch_resume(*((dispatch_object_t *)v8 + 5));
    v27 = (_SYOutputStreamer *)v8;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)_getCompletionBlock
{
  _SYOutputStreamer *v2;
  void *v3;
  id onComplete;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x212BE0F2C](v2->_onComplete);
  onComplete = v2->_onComplete;
  v2->_onComplete = 0;

  objc_sync_exit(v2);
  v5 = (void *)MEMORY[0x212BE0F2C](v3);

  return v5;
}

- (void)writeData:(id)a3 completion:(id)a4
{
  id v6;
  SYCompressedFileOutputStream *stream;
  id v8;
  NSObject *v9;
  NSObject *callbackQueue;
  id v11;
  void *v12;
  SYCompressedFileOutputStream *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  _SYOutputStreamer *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  stream = self->_stream;
  v8 = a3;
  if (-[SYCompressedFileOutputStream streamStatus](stream, "streamStatus") == 6)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v9 = qword_253D84AE0;
    if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_211704000, v9, OS_LOG_TYPE_DEFAULT, "Streamer %{public}@ writing to a closed stream", buf, 0xCu);
    }
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42___SYOutputStreamer_writeData_completion___block_invoke;
    block[3] = &unk_24CC65FB8;
    v24 = v6;
    dispatch_async(callbackQueue, block);
    v11 = v24;
LABEL_13:

    goto LABEL_14;
  }
  if (-[SYCompressedFileOutputStream streamStatus](self->_stream, "streamStatus") == 7)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v12 = (void *)qword_253D84AE0;
    if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_stream;
      v14 = v12;
      -[SYCompressedFileOutputStream streamError](v13, "streamError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _SYObfuscate(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "Streamer %{public}@ writing to a stream in error state. Error = %{public}@", buf, 0x16u);

    }
    -[SYCompressedFileOutputStream streamError](self->_stream, "streamError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_callbackQueue;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __42___SYOutputStreamer_writeData_completion___block_invoke_55;
    v20[3] = &unk_24CC65FE0;
    v21 = v17;
    v22 = v6;
    v11 = v17;
    dispatch_async(v18, v20);

    goto LABEL_13;
  }
LABEL_14:
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setData:", v8);

  objc_msgSend(v19, "setCallback:", v6);
  -[NSMutableArray addObject:](self->_items, "addObject:", v19);
  dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);

}

- (void)_tryToSendData
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_debug_impl(&dword_211704000, log, OS_LOG_TYPE_DEBUG, "Wrote %ld bytes to stream %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_completeAllItemsWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *callbackQueue;
  void *v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_items;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        callbackQueue = self->_callbackQueue;
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __48___SYOutputStreamer__completeAllItemsWithError___block_invoke;
        v14[3] = &unk_24CC652B8;
        v14[4] = v11;
        v15 = v4;
        dispatch_async(callbackQueue, v14);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
  -[_SYOutputStreamer _getCompletionBlock](self, "_getCompletionBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_DEBUG))
      -[_SYOutputStreamer _tryToSendData].cold.1();
    dispatch_async((dispatch_queue_t)self->_callbackQueue, v13);
  }

}

- (void)whenComplete:(id)a3
{
  NSMutableArray *items;
  void *v5;
  id onComplete;
  id block;

  items = self->_items;
  block = a3;
  if (-[NSMutableArray count](items, "count"))
  {
    v5 = (void *)objc_msgSend(block, "copy");

    onComplete = self->_onComplete;
    self->_onComplete = v5;
  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_callbackQueue, block);
    onComplete = block;
  }

}

- (void)close
{
  -[SYCompressedFileOutputStream close](self->_stream, "close");
}

- (void)setStreamProperty:(id)a3 forKey:(id)a4
{
  -[SYCompressedFileOutputStream setProperty:forKey:](self->_stream, "setProperty:forKey:", a3, a4);
}

- (id)streamPropertyForKey:(id)a3
{
  return -[SYCompressedFileOutputStream propertyForKey:](self->_stream, "propertyForKey:", a3);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = v6;
  if (a4 == 8)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40___SYOutputStreamer_stream_handleEvent___block_invoke;
    v9[3] = &unk_24CC652B8;
    v9[4] = self;
    v10 = v6;
    dispatch_async(queue, v9);

  }
  else if (a4 == 4)
  {
    dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
  }

}

- (BOOL)hasWrittenData
{
  return self->_hasWrittenData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_onComplete, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
