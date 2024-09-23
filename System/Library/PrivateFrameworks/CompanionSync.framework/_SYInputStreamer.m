@implementation _SYInputStreamer

- (_SYInputStreamer)initWithCompressedFileURL:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  SYCompressedFileInputStream *v9;
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
  _SYInputStreamer *v27;
  _QWORD handler[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_SYInputStreamer;
  v8 = -[_SYInputStreamer init](&v34, sel_init);
  if (v8
    && (v9 = -[SYCompressedFileInputStream initWithCompressedFileAtURL:]([SYCompressedFileInputStream alloc], "initWithCompressedFileAtURL:", v6), v10 = (void *)*((_QWORD *)v8 + 1), *((_QWORD *)v8 + 1) = v9, v10, *((_QWORD *)v8 + 1)))
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
    v31[2] = __60___SYInputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke;
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
    handler[2] = __60___SYInputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_161;
    handler[3] = &unk_24CC655F8;
    objc_copyWeak(&v30, &location);
    dispatch_source_set_event_handler(v26, handler);
    objc_msgSend(*((id *)v8 + 1), "open");
    dispatch_resume(*((dispatch_object_t *)v8 + 5));
    v27 = (_SYInputStreamer *)v8;
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

- (void)readDataOfLength:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  NSObject *v7;
  NSObject *callbackQueue;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _SYInputDataItem *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(a4, "copy");
  if (-[SYCompressedFileInputStream streamStatus](self->_stream, "streamStatus") == 5)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v7 = qword_253D84AE0;
    if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_INFO, "Reached end of input stream.", buf, 2u);
    }
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48___SYInputStreamer_readDataOfLength_completion___block_invoke;
    block[3] = &unk_24CC65FB8;
    v24 = v6;
    dispatch_async(callbackQueue, block);
    v9 = v24;
LABEL_13:

    goto LABEL_22;
  }
  if (-[SYCompressedFileInputStream streamStatus](self->_stream, "streamStatus") == 6)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = qword_253D84AE0;
    if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_INFO, "Stream is closed.", buf, 2u);
    }
    v11 = self->_callbackQueue;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __48___SYInputStreamer_readDataOfLength_completion___block_invoke_162;
    v21[3] = &unk_24CC65FB8;
    v22 = v6;
    dispatch_async(v11, v21);
    v9 = v22;
    goto LABEL_13;
  }
  if (-[SYCompressedFileInputStream streamStatus](self->_stream, "streamStatus") == 7)
  {
    -[SYCompressedFileInputStream streamError](self->_stream, "streamError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v13 = (void *)qword_253D84AE0;
    if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      _SYObfuscate(v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_211704000, v14, OS_LOG_TYPE_DEFAULT, "Stream is in error state: %{public}@", buf, 0xCu);

    }
    v16 = self->_callbackQueue;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __48___SYInputStreamer_readDataOfLength_completion___block_invoke_163;
    v18[3] = &unk_24CC65FE0;
    v19 = v12;
    v20 = v6;
    v17 = v12;
    dispatch_async(v16, v18);

  }
  else
  {
    v17 = -[_SYInputDataItem initWithLength:callback:]([_SYInputDataItem alloc], "initWithLength:callback:", a3, v6);
    -[NSMutableArray addObject:](self->_items, "addObject:", v17);
    dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
  }

LABEL_22:
}

- (void)_tryToReadData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Orphaned data-available event found a stream error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_completeAllItemsWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *callbackQueue;
  id onComplete;
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v5 = (void *)qword_253D84AE0;
  if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    _SYObfuscate(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_impl(&dword_211704000, v6, OS_LOG_TYPE_DEFAULT, "Completing all stream read items with error '%{public}@'", buf, 0xCu);

  }
  v8 = (void *)-[NSMutableArray copy](self->_items, "copy");
  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    v13 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        callbackQueue = self->_callbackQueue;
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __47___SYInputStreamer__completeAllItemsWithError___block_invoke;
        v19[3] = &unk_24CC652B8;
        v19[4] = v15;
        v20 = v4;
        dispatch_async(callbackQueue, v19);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  onComplete = self->_onComplete;
  if (onComplete)
  {
    dispatch_async((dispatch_queue_t)self->_callbackQueue, onComplete);
    v18 = self->_onComplete;
    self->_onComplete = 0;

  }
}

- (void)whenComplete:(id)a3
{
  _SYInputStreamer *v4;
  uint64_t v5;
  id onComplete;
  dispatch_block_t block;

  block = a3;
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = objc_msgSend(block, "copy");
    onComplete = v4->_onComplete;
    v4->_onComplete = (id)v5;

    objc_sync_exit(v4);
  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_callbackQueue, block);
  }

}

- (void)close
{
  -[SYCompressedFileInputStream close](self->_stream, "close");
}

- (void)setStreamProperty:(id)a3 forKey:(id)a4
{
  -[SYCompressedFileInputStream setProperty:forKey:](self->_stream, "setProperty:forKey:", a3, a4);
}

- (id)streamPropertyForKey:(id)a3
{
  return -[SYCompressedFileInputStream propertyForKey:](self->_stream, "propertyForKey:", a3);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[16];
  _QWORD v13[5];
  id v14;

  v6 = a3;
  switch(a4)
  {
    case 0x10uLL:
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v7 = qword_253D84AE0;
      if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_INFO, "Input stream end encountered", buf, 2u);
      }
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39___SYInputStreamer_stream_handleEvent___block_invoke_165;
      block[3] = &unk_24CC65418;
      block[4] = self;
      dispatch_async(queue, block);
      break;
    case 8uLL:
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v9 = (void *)qword_253D84AE0;
      if (os_log_type_enabled((os_log_t)qword_253D84AE0, OS_LOG_TYPE_ERROR))
        -[_SYInputStreamer stream:handleEvent:].cold.1(v9, v6);
      v10 = self->_queue;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __39___SYInputStreamer_stream_handleEvent___block_invoke;
      v13[3] = &unk_24CC652B8;
      v13[4] = self;
      v14 = v6;
      dispatch_async(v10, v13);

      break;
    case 2uLL:
      dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
      break;
  }

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

- (void)stream:(void *)a1 handleEvent:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "streamError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5(&dword_211704000, v5, v6, "Input stream encountered error: %{public}@", v7, v8, v9, v10, 2u);

}

@end
