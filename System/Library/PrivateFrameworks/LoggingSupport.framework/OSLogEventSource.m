@implementation OSLogEventSource

- (void)_enumerateIndexFiles:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_fileRefs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_insertIndexFile:(id)a3
{
  -[NSMutableArray addObject:](self->_fileRefs, "addObject:", a3);
}

- (void)dealloc
{
  objc_super v3;

  _timesync_db_close((int *)self->_tsdb);
  -[_OSLogCollectionReference close](self->_lcr, "close");
  v3.receiver = self;
  v3.super_class = (Class)OSLogEventSource;
  -[OSLogEventSource dealloc](&v3, sel_dealloc);
}

- (OSLogEventSource)initWithCollection:(id)a3 metadata:(id)a4 timesync:(_os_timesync_db_s *)a5
{
  id v9;
  id v10;
  OSLogEventSource *v11;
  OSLogEventSource *v12;
  uint64_t v13;
  NSMutableArray *fileRefs;
  id v15;
  uint64_t *impl;
  _OSLogEventStoreTimeRef *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _OSLogEventStoreTimeRef *oldestTimeRef;
  objc_super v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)OSLogEventSource;
  v11 = -[OSLogEventSource init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_lcr, a3);
    objc_storeStrong((id *)&v12->_lesm, a4);
    v12->_tsdb = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    fileRefs = v12->_fileRefs;
    v12->_fileRefs = (NSMutableArray *)v13;

    if (v10)
    {
      v15 = v10;
      impl = (uint64_t *)_timesync_range_create_impl((uint64_t)a5, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_msgSend(v15, "oldestLive");
      v17 = (_OSLogEventStoreTimeRef *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v15, "oldestLive");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _findOldestTimeRef(impl, 0, v18);
        v17 = (_OSLogEventStoreTimeRef *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v15, "oldestPersist");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v15, "oldestPersist");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _findOldestTimeRef(impl, v17, v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v17 = (_OSLogEventStoreTimeRef *)v21;
      }
      objc_msgSend(v15, "oldestSpecial");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v15, "oldestSpecial");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _findOldestTimeRef(impl, v17, v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v17 = (_OSLogEventStoreTimeRef *)v24;
      }
      _os_trace_uuid_map_destroy((void **)*impl);
      free(impl);

      oldestTimeRef = v12->_oldestTimeRef;
      v12->_oldestTimeRef = v17;

    }
  }

  return v12;
}

- (_OSLogCollectionReference)lcr
{
  return self->_lcr;
}

- (NSUUID)uniqueIdentifier
{
  return -[_OSLogEventStoreMetadata archiveUUID](self->_lesm, "archiveUUID");
}

- (_os_timesync_db_s)tsdb
{
  return self->_tsdb;
}

- (NSDate)newestDate
{
  _OSLogEventStoreMetadata *lesm;
  _os_timesync_db_s *tsdb;
  void *v5;
  _QWORD *v6;
  void *v7;
  unint64_t v8;

  lesm = self->_lesm;
  if (lesm)
  {
    tsdb = self->_tsdb;
    -[_OSLogEventStoreMetadata end](lesm, "end");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)objc_msgSend(v5, "UUID");
    -[_OSLogEventStoreMetadata end](self->_lesm, "end");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _timesync_continuous_to_wall_time((uint64_t)tsdb, v6, objc_msgSend(v7, "continuousTime"), 0);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v8 / 1000000000.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  }
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (_OSLogEventStoreMetadata)lesm
{
  return self->_lesm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestTimeRef, 0);
  objc_storeStrong((id *)&self->_lesm, 0);
  objc_storeStrong((id *)&self->_lcr, 0);
  objc_storeStrong((id *)&self->_fileRefs, 0);
}

- (_OSLogEventStoreTimeRef)newestTimeRef
{
  return -[_OSLogEventStoreMetadata end](self->_lesm, "end");
}

- (NSDate)oldestDate
{
  _OSLogEventStoreTimeRef *oldestTimeRef;

  oldestTimeRef = self->_oldestTimeRef;
  if (oldestTimeRef)
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)_timesync_continuous_to_wall_time((uint64_t)self->_tsdb, (_QWORD *)-[_OSLogEventStoreTimeRef UUID](oldestTimeRef, "UUID"), -[_OSLogEventStoreTimeRef continuousTime](self->_oldestTimeRef, "continuousTime"), 0)/ 1000000000.0);
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableArray)_fileRefs
{
  return self->_fileRefs;
}

- (void)set_fileRefs:(id)a3
{
  objc_storeStrong((id *)&self->_fileRefs, a3);
}

- (_OSLogEventStoreTimeRef)oldestTimeRef
{
  return self->_oldestTimeRef;
}

@end
