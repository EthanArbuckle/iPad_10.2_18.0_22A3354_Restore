@implementation _GEOConfigDBOperationQueue

- (void)flushOnDBQueue
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  GEOSQLiteDB *db;
  _QWORD v8[11];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[GEOSQLiteDB isolationQueue](self->_db, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[_GEOConfigDBOperationQueue cancelTimer](self, "cancelTimer");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v8[5] = MEMORY[0x1E0C809B0];
  v8[6] = 3221225472;
  v8[7] = __44___GEOConfigDBOperationQueue_flushOnDBQueue__block_invoke;
  v8[8] = &unk_1E1BFF920;
  v8[9] = self;
  v8[10] = &v9;
  geo_isolate_sync();
  j__GEOGetUserDefaultsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend((id)v10[5], "count");
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Flushing %llu operations", buf, 0xCu);
  }

  if (v10[5])
  {
    db = self->_db;
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __44___GEOConfigDBOperationQueue_flushOnDBQueue__block_invoke_271;
    v8[3] = &unk_1E1BFF948;
    v8[4] = &v9;
    -[GEOSQLiteDB executeInTransaction:](db, "executeInTransaction:", v8);
  }
  _Block_object_dispose(&v9, 8);

}

- (void)cancelTimer
{
  dispatch_source_set_timer((dispatch_source_t)self->_timer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)flush
{
  GEOSQLiteDB *db;
  _QWORD v3[5];

  db = self->_db;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35___GEOConfigDBOperationQueue_flush__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  -[GEOSQLiteDB executeAsync:](db, "executeAsync:", v3);
}

- (void)enqueueOperation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4 = a3;
  geo_isolate_sync();
  if ((unint64_t)v6[3] < 0x65)
    -[_GEOConfigDBOperationQueue scheduleTimer](self, "scheduleTimer");
  else
    -[_GEOConfigDBOperationQueue flush](self, "flush");

  _Block_object_dispose(&v5, 8);
}

- (void)scheduleTimer
{
  dispatch_time_t v3;

  v3 = dispatch_time(0, 500000000);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v3, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
}

- (id)init:(id)a3
{
  id v5;
  _GEOConfigDBOperationQueue *v6;
  _GEOConfigDBOperationQueue *v7;
  uint64_t v8;
  geo_isolater *isolator;
  uint64_t v10;
  NSMutableArray *operations;
  NSObject *global_queue;
  dispatch_source_t v13;
  OS_dispatch_source *timer;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_GEOConfigDBOperationQueue;
  v6 = -[_GEOConfigDBOperationQueue init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    v8 = geo_isolater_create();
    isolator = v7->_isolator;
    v7->_isolator = (geo_isolater *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    operations = v7->_operations;
    v7->_operations = (NSMutableArray *)v10;

    global_queue = geo_get_global_queue();
    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
    timer = v7->_timer;
    v7->_timer = (OS_dispatch_source *)v13;

    objc_initWeak(&location, v7);
    v15 = v7->_timer;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __35___GEOConfigDBOperationQueue_init___block_invoke;
    v17[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v15, v17);
    dispatch_activate((dispatch_object_t)v7->_timer);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, &__block_literal_global_270);
  v3.receiver = self;
  v3.super_class = (Class)_GEOConfigDBOperationQueue;
  -[_GEOConfigDBOperationQueue dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_isolator, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
