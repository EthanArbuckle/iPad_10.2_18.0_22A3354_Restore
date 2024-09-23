@implementation CDRemoveEventsConsumer

- (CDRemoveEventsConsumer)initWithConsumer:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  CDRemoveEventsConsumer *v8;
  CDRemoveEventsConsumer *v9;
  uint64_t v10;
  id consumer;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *sem;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *consumer_q;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDRemoveEventsConsumer;
  v8 = -[CDRemoveEventsConsumer init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    v10 = MEMORY[0x1A8591D98](v6);
    consumer = v9->_consumer;
    v9->_consumer = (id)v10;

    v12 = dispatch_semaphore_create(0);
    sem = v9->_sem;
    v9->_sem = (OS_dispatch_semaphore *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.CDRemoveEventsConsumer", v14);
    consumer_q = v9->_consumer_q;
    v9->_consumer_q = (OS_dispatch_queue *)v15;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (-[CDRemoveEventsConsumer stream](self, "stream"))
  {
    FSEventStreamInvalidate(-[CDRemoveEventsConsumer stream](self, "stream"));
    FSEventStreamRelease(-[CDRemoveEventsConsumer stream](self, "stream"));
  }
  v3.receiver = self;
  v3.super_class = (Class)CDRemoveEventsConsumer;
  -[CDRemoveEventsConsumer dealloc](&v3, sel_dealloc);
}

- (void)callback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CDRemoveEventsConsumer *v9;

  v4 = a3;
  if (-[CDRemoveEventsConsumer historyDone](self, "historyDone"))
    FSEventStreamStop(-[CDRemoveEventsConsumer stream](self, "stream"));
  -[CDRemoveEventsConsumer consumer_q](self, "consumer_q");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CDRemoveEventsConsumer_callback___block_invoke;
  v7[3] = &unk_1E4A32CA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __35__CDRemoveEventsConsumer_callback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  CDGetLogHandle((uint64_t)"client");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v2, OS_LOG_TYPE_DEFAULT, "CDConsumer, calling client callback with:", buf, 2u);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v37;
    *(_QWORD *)&v5 = 138412290;
    v30 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "allValues", v30);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        CDGetLogHandle((uint64_t)"client");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v30;
          v41 = v10;
          _os_log_impl(&dword_1A3662000, v11, OS_LOG_TYPE_DEFAULT, "CDConsumer callback file removed: %@", buf, 0xCu);
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "consumer");
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v12[2](v12, *(_QWORD *)(a1 + 32));

  CDGetLogHandle((uint64_t)"client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3662000, v13, OS_LOG_TYPE_DEFAULT, "CDConsumer client callback complete", buf, 2u);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = *(id *)(a1 + 32);
  v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (!v15)
    goto LABEL_31;
  v17 = v15;
  v18 = 0;
  v19 = *(_QWORD *)v33;
  *(_QWORD *)&v16 = 138412546;
  v31 = v16;
  do
  {
    for (j = 0; j != v17; ++j)
    {
      if (*(_QWORD *)v33 != v19)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("historyDone"), v31, (_QWORD)v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if (objc_msgSend(v23, "unsignedLongLongValue"))
        {
          v24 = v23;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", FSEventsGetCurrentEventId());
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          CDGetLogHandle((uint64_t)"client");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v41 = v24;
            v42 = 2112;
            v43 = v21;
            _os_log_error_impl(&dword_1A3662000, v25, OS_LOG_TYPE_ERROR, "Got a zero historyDone event, using FSEventsGetCurrentEventId: %@, event: %@", buf, 0x16u);
          }

        }
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "volume");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 1;
        setPurgeMarker(v26, v27, 1, objc_msgSend(v24, "unsignedLongLongValue"));

      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("rescan"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v18 |= v29 != 0;
    }
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  }
  while (v17);

  if ((v18 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "sem");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v14);
LABEL_31:

  }
}

- (void)consumeStream:(__FSEventStream *)a3 forVolume:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  __FSEventStream *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int *v17;
  char *v18;
  int *v19;
  char *v20;
  int v21;
  id v22;
  __int16 v23;
  char *v24;
  statfs v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = mach_absolute_time();
  if (a3)
  {
    bzero(&v25, 0x878uLL);
    v8 = objc_retainAutorelease(v6);
    if (statfs((const char *)objc_msgSend(v8, "UTF8String"), &v25))
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v17 = __error();
        v18 = strerror(*v17);
        v21 = 138543618;
        v22 = v8;
        v23 = 2080;
        v24 = v18;
        _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "statfs failed for \"%{public}@\" : %s", (uint8_t *)&v21, 0x16u);
      }

      goto LABEL_22;
    }
    if (-[CDRemoveEventsConsumer stream](self, "stream"))
    {
      CDGetLogHandle((uint64_t)"client");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "consumer is being reused, replacing FSEventStream", (uint8_t *)&v21, 2u);
      }

      v12 = -[CDRemoveEventsConsumer stream](self, "stream");
      -[CDRemoveEventsConsumer setStream:](self, "setStream:", 0);
      FSEventStreamInvalidate(v12);
      FSEventStreamRelease(v12);
    }
    -[CDRemoveEventsConsumer setFsid:](self, "setFsid:", *(_QWORD *)&v25.f_fsid);
    -[CDRemoveEventsConsumer setStream:](self, "setStream:", a3);
    -[CDRemoveEventsConsumer setVolume:](self, "setVolume:", v8);
    if (FSEventStreamStart(-[CDRemoveEventsConsumer stream](self, "stream")))
    {
      -[CDRemoveEventsConsumer sem](self, "sem");
      v13 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

      CDGetLogHandle((uint64_t)"client");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1A3662000, v14, OS_LOG_TYPE_DEFAULT, "FSStream completed.", (uint8_t *)&v21, 2u);
      }
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = __error();
        v20 = strerror(*v19);
        v21 = 138412546;
        v22 = v8;
        v23 = 2080;
        v24 = v20;
        _os_log_error_impl(&dword_1A3662000, v14, OS_LOG_TYPE_ERROR, "CacheDeleteEnumerateRemovedFiles: Unable to start FSEventStream on volume \"%@\" : %s", (uint8_t *)&v21, 0x16u);
      }
    }

  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25.f_bsize) = 0;
      _os_log_error_impl(&dword_1A3662000, v10, OS_LOG_TYPE_ERROR, "No stream parameter", (uint8_t *)&v25, 2u);
    }

  }
  CDGetLogHandle((uint64_t)"client");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = mach_absolute_time();
    v25.f_bsize = 134217984;
    *(double *)&v25.f_iosize = *(double *)&gTimebaseConversion * ((double)v16 - (double)v7) / 1000000000.0;
    _os_log_impl(&dword_1A3662000, v15, OS_LOG_TYPE_DEFAULT, "consumeStream Time taken: %f", (uint8_t *)&v25, 0xCu);
  }

LABEL_22:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)consumer
{
  return self->_consumer;
}

- (void)setConsumer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (__FSEventStream)stream
{
  return self->_stream;
}

- (void)setStream:(__FSEventStream *)a3
{
  self->_stream = a3;
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void)setSem:(id)a3
{
  objc_storeStrong((id *)&self->_sem, a3);
}

- (OS_dispatch_queue)consumer_q
{
  return self->_consumer_q;
}

- (void)setConsumer_q:(id)a3
{
  objc_storeStrong((id *)&self->_consumer_q, a3);
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
  objc_storeStrong((id *)&self->_volume, a3);
}

- (BOOL)historyDone
{
  return self->_historyDone;
}

- (void)setHistoryDone:(BOOL)a3
{
  self->_historyDone = a3;
}

- (fsid)fsid
{
  fsid dest;

  objc_copyStruct(&dest, &self->_fsid, 8, 1, 0);
  return dest;
}

- (void)setFsid:(fsid)a3
{
  fsid src;

  src = a3;
  objc_copyStruct(&self->_fsid, &src, 8, 1, 0);
}

- (unint64_t)since
{
  return self->_since;
}

- (void)setSince:(unint64_t)a3
{
  self->_since = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_consumer_q, 0);
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong(&self->_consumer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
