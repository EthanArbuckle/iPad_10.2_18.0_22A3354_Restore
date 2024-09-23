@implementation OSLogEventStream

void __42__OSLogEventStream__initWithSource_flags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  const char *v5;
  char *v6;
  int v7;
  void *v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (!*(_BYTE *)(a1 + 40)
    || (v4 = (char *)objc_msgSend(v3, "path")) == 0
    || (v5 = v4, (v6 = strchr(v4, 47)) == 0)
    || (v7 = strncmp(v5, "Signpost/", v6 - v5), v8 = v9, !v7))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "insertIndexFile:", v9);
    v8 = v9;
  }

}

BOOL __43__OSLogEventStream__activateStreamInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  _BOOL8 v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v4 || objc_msgSend(v4, "evaluateWithObject:", v3))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "_timesyncRangeUUIDIndex");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v3, "machContinuousTimestamp");
    objc_msgSend(*(id *)(a1 + 40), "streamHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v3);

  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "invalidated") == 0;

  return v6;
}

- (void)activateStreamFromDate:(id)a3
{
  OSLogEventSource *source;
  id v5;
  id v6;

  source = self->_source;
  v5 = a3;
  -[OSLogEventSource newestDate](source, "newestDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[OSLogEventStream _activateStreamFromDate:toDate:](self, "_activateStreamFromDate:toDate:", v5, v6);

}

- (void)_activateStreamFromDate:(id)a3 toDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[OSLogEventStreamBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__OSLogEventStream__activateStreamFromDate_toDate___block_invoke;
  block[3] = &unk_1E41574F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)dealloc
{
  int *tsdb;
  objc_super v4;

  tsdb = (int *)self->_tsdb;
  if (tsdb)
    _timesync_db_close(tsdb);
  v4.receiver = self;
  v4.super_class = (Class)OSLogEventStream;
  -[OSLogEventStream dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_catalogFilter, 0);
}

- (id)_initWithSource:(id)a3 flags:(unint64_t)a4
{
  char v4;
  id v7;
  OSLogEventStream *v8;
  OSLogEventStream *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _OSLogIndex *v13;
  _OSLogIndex *index;
  _QWORD v16[4];
  OSLogEventStream *v17;
  char v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[OSLogEventStreamBase init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_source, a3);
    v10 = _timesync_db_openat(*(_DWORD *)objc_msgSend(v7, "tsdb"), ".");
    v9->_tsdb = (_os_timesync_db_s *)v10;
    if (v10)
    {
      objc_msgSend(v7, "lcr");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lesm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_OSLogIndex initWithCollection:timesync:metadata:]([_OSLogIndex alloc], "initWithCollection:timesync:metadata:", v11, v9->_tsdb, v12);
      index = v9->_index;
      v9->_index = v13;

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __42__OSLogEventStream__initWithSource_flags___block_invoke;
      v16[3] = &unk_1E41574A0;
      v18 = v4 & 1;
      v17 = v9;
      objc_msgSend(v7, "_enumerateIndexFiles:", v16);

    }
  }

  return v9;
}

- (void)setFilterPredicate:(id)a3
{
  _OSLogCatalogFilter *v4;
  void *v5;
  void *v6;
  _OSLogCatalogFilter *v7;
  _OSLogCatalogFilter *catalogFilter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OSLogEventStream;
  -[OSLogEventStreamBase setFilterPredicate:](&v9, sel_setFilterPredicate_, a3);
  v4 = [_OSLogCatalogFilter alloc];
  -[OSLogEventStreamBase filterPredicate](self, "filterPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogEventSource lcr](self->_source, "lcr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_OSLogCatalogFilter initWithPredicate:collection:](v4, "initWithPredicate:collection:", v5, v6);
  catalogFilter = self->_catalogFilter;
  self->_catalogFilter = v7;

}

- (void)_activateStreamInRange:(os_timesync_range_s *)a3
{
  void *v4;
  char v5;
  char v6;
  char v7;
  char v8;
  __int16 v9;
  __int16 v10;
  void *v11;
  _OSLogIndex *index;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  OSLogEventStreamPosition *v18;
  OSLogEventStreamPosition *v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  char v24;
  _QWORD v26[4];
  id v27;
  OSLogEventStream *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  -[OSLogEventStreamBase streamHandler](self, "streamHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventStream activated without stream handler";
    __break(1u);
  }
  v24 = -[OSLogEventStreamBase flags](self, "flags");
  v23 = -[OSLogEventStreamBase flags](self, "flags");
  v22 = -[OSLogEventStreamBase flags](self, "flags");
  v5 = -[OSLogEventStreamBase flags](self, "flags");
  v21 = -[OSLogEventStreamBase flags](self, "flags");
  v6 = -[OSLogEventStreamBase flags](self, "flags");
  v7 = -[OSLogEventStreamBase flags](self, "flags");
  v8 = -[OSLogEventStreamBase flags](self, "flags");
  v9 = -[OSLogEventStreamBase flags](self, "flags");
  v10 = -[OSLogEventStreamBase flags](self, "flags");
  -[OSLogEventStreamBase filterPredicate](self, "filterPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  index = self->_index;
  -[OSLogEventStream catalogFilter](self, "catalogFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __43__OSLogEventStream__activateStreamInRange___block_invoke;
  v26[3] = &unk_1E41574C8;
  v14 = v23 & 0x40 | v24 & 0x20 | (4 * (v22 & 1)) | v5 & 2 | ((v21 & 4) == 0) | v6 & 8 | v7 & 0x10 | v8 & 0x80 | v9 & 0x100 | v10 & 0x200u;
  v15 = v11;
  v27 = v15;
  v28 = self;
  v29 = &v32;
  v30 = &v40;
  v31 = &v36;
  -[_OSLogIndex enumerateEntriesInRange:options:usingCatalogFilter:usingBlock:](index, "enumerateEntriesInRange:options:usingCatalogFilter:usingBlock:", a3, v14, v13, v26);

  v44[0] = 0;
  v44[1] = 0;
  v16 = v41[3];
  -[OSLogEventSource uniqueIdentifier](self->_source, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getUUIDBytes:", v44);

  v18 = [OSLogEventStreamPosition alloc];
  v19 = -[OSLogEventStreamPosition initWithSource:bootUUID:time:](v18, "initWithSource:bootUUID:time:", v44, a3->var3[v16], v37[3]);
  v20 = v33[3];
  if (!v20)
  {
    if (-[OSLogEventStreamBase invalidated](self, "invalidated"))
      v20 = 4;
    else
      v20 = 5;
    v33[3] = v20;
  }
  _invalidate(self, v20, v19);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

}

- (_OSLogCatalogFilter)catalogFilter
{
  return self->_catalogFilter;
}

- (OSLogEventStream)initWithSource:(id)a3 skipNonSignpostFiles:(BOOL)a4
{
  return (OSLogEventStream *)-[OSLogEventStream _initWithSource:flags:](self, "_initWithSource:flags:", a3, a4);
}

void __51__OSLogEventStream__activateStreamFromDate_toDate___block_invoke(id *a1)
{
  _QWORD *v1;
  double v3;
  double v4;
  unint64_t v5;
  id *v6;
  void *v7;
  OSLogEventStreamPosition *v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void ***impl;
  uuid_t uu;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (v1[11] && v1[9])
  {
    objc_msgSend(a1[5], "timeIntervalSince1970");
    if (v3 <= 0.0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(a1[5], "timeIntervalSince1970");
      v5 = (unint64_t)(v4 * 1000000000.0);
    }
    if ((objc_msgSend(a1[4], "flags") & 8) != 0)
    {
      v13 = *((_QWORD *)a1[4] + 11);
      v14 = 0;
      v12 = v5;
    }
    else
    {
      objc_msgSend(a1[6], "timeIntervalSince1970");
      v10 = v9;
      v11 = 0.0;
      if (v10 > 0.0)
        objc_msgSend(a1[6], "timeIntervalSince1970", 0.0);
      if (v11 == 0.0)
        v12 = -1;
      else
        v12 = (unint64_t)(v11 * 1000000000.0);
      v13 = *((_QWORD *)a1[4] + 11);
      v14 = v5;
    }
    impl = (void ***)_timesync_range_create_impl(v13, v14, v12, 1);
    objc_msgSend(a1[4], "_activateStreamInRange:", impl);
    _os_trace_uuid_map_destroy(*impl);
    free(impl);
  }
  else
  {
    v17[0] = 0;
    v17[1] = 0;
    memset(uu, 0, sizeof(uu));
    v6 = v1;
    uuid_clear(uu);
    objc_msgSend(v6[10], "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getUUIDBytes:", v17);

    v8 = -[OSLogEventStreamPosition initWithSource:bootUUID:time:]([OSLogEventStreamPosition alloc], "initWithSource:bootUUID:time:", v17, uu, 0);
    _invalidate(v6, 9, v8);

  }
}

- (OSLogEventStream)initWithSource:(id)a3
{
  return (OSLogEventStream *)-[OSLogEventStream _initWithSource:flags:](self, "_initWithSource:flags:", a3, 0);
}

- (void)_foreachIndexFile:(id)a3
{
  -[_OSLogIndex _foreachIndexFile:](self->_index, "_foreachIndexFile:", a3);
}

- (void)_activateStreamFromTimeIntervalSinceLastBoot:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[OSLogEventStreamBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__OSLogEventStream__activateStreamFromTimeIntervalSinceLastBoot___block_invoke;
  v6[3] = &unk_1E4157518;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)activateStreamFromLastBoot
{
  -[OSLogEventStream _activateStreamFromTimeIntervalSinceLastBoot:](self, "_activateStreamFromTimeIntervalSinceLastBoot:", 0.0);
}

- (void)activateStreamFromPosition:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[OSLogEventStreamBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__OSLogEventStream_activateStreamFromPosition___block_invoke;
  v7[3] = &unk_1E4157540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setCatalogFilter:(id)a3
{
  objc_storeStrong((id *)&self->_catalogFilter, a3);
}

- (_OSLogIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

- (OSLogEventSource)source
{
  return self->_source;
}

- (_os_timesync_db_s)tsdb
{
  return self->_tsdb;
}

- (void)setTsdb:(_os_timesync_db_s *)a3
{
  self->_tsdb = a3;
}

void __47__OSLogEventStream_activateStreamFromPosition___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  _QWORD *v4;
  char *impl;
  id *v6;
  void *v7;
  OSLogEventStreamPosition *v8;
  uuid_t uu;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 88) && *(_QWORD *)(v1 + 72))
  {
    v10 = 0;
    v11 = 0;
    objc_msgSend(*(id *)(v1 + 80), "uniqueIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getUUIDBytes:", &v10);

    v4 = (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "sourceUUID");
    if (v10 == *v4
      && v11 == v4[1]
      && (impl = (char *)_timesync_range_create_impl(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 0, 0xFFFFFFFFFFFFFFFFLL, 0), (_timesync_range_contains((uint64_t *)impl, (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "UUID"), objc_msgSend(*(id *)(a1 + 40), "continuousTime")) & 1) != 0))
    {
      _timesync_range_intersect(impl, (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "UUID"), (float *)objc_msgSend(*(id *)(a1 + 40), "continuousTime"), 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "_activateStreamInRange:", impl);
      _os_trace_uuid_map_destroy(*(void ***)impl);
      free(impl);
    }
    else
    {
      _invalidate(*(void **)(a1 + 32), 3, *(void **)(a1 + 40));
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
    memset(uu, 0, sizeof(uu));
    v6 = (id *)(id)v1;
    uuid_clear(uu);
    objc_msgSend(v6[10], "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getUUIDBytes:", &v10);

    v8 = -[OSLogEventStreamPosition initWithSource:bootUUID:time:]([OSLogEventStreamPosition alloc], "initWithSource:bootUUID:time:", &v10, uu, 0);
    _invalidate(v6, 9, v8);

  }
}

void __65__OSLogEventStream__activateStreamFromTimeIntervalSinceLastBoot___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  void ***since_last_boot;
  id *v7;
  void *v8;
  OSLogEventStreamPosition *v9;
  uuid_t uu;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[11];
  if (v3 && v2[9])
  {
    v4 = *(double *)(a1 + 40);
    if (v4 <= 0.0)
      v5 = 0;
    else
      v5 = (unint64_t)(v4 * 1000000000.0);
    since_last_boot = (void ***)_timesync_range_create_since_last_boot(v3, v5);
    objc_msgSend(*(id *)(a1 + 32), "_activateStreamInRange:", since_last_boot);
    _os_trace_uuid_map_destroy(*since_last_boot);
    free(since_last_boot);
  }
  else
  {
    v11[0] = 0;
    v11[1] = 0;
    memset(uu, 0, sizeof(uu));
    v7 = v2;
    uuid_clear(uu);
    objc_msgSend(v7[10], "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getUUIDBytes:", v11);

    v9 = -[OSLogEventStreamPosition initWithSource:bootUUID:time:]([OSLogEventStreamPosition alloc], "initWithSource:bootUUID:time:", v11, uu, 0);
    _invalidate(v7, 9, v9);

  }
}

@end
