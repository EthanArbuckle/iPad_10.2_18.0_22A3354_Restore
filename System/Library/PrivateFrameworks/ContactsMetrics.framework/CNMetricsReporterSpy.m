@implementation CNMetricsReporterSpy

- (CNMetricsReporterSpy)init
{
  CNMetricsReporterSpy *v2;
  uint64_t v3;
  NSMutableArray *entries;
  CNMetricsReporterSpy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNMetricsReporterSpy;
  v2 = -[CNMetricsReporterSpy init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSArray)events
{
  CNMetricsReporterSpy *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_entries, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)clearEvents
{
  CNMetricsReporterSpy *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableArray removeAllObjects](obj->_entries, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CNMetricsReporterSpiedEntry *v9;
  CNMetricsReporterSpy *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  v9 = -[CNMetricsReporterSpiedEntry initWithDictionary:event:logged:]([CNMetricsReporterSpiedEntry alloc], "initWithDictionary:event:logged:", v11, v8, v5);
  v10 = self;
  objc_sync_enter(v10);
  -[NSMutableArray addObject:](v10->_entries, "addObject:", v9);
  objc_sync_exit(v10);

}

- (void)logSimpleEvent:(id)a3 forApplication:(id)a4 andLog:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v5 = a5;
  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  v14 = CFSTR("application");
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithDictionary:", v12);
  -[CNMetricsReporterSpy sendDictionary:forEvent:andLog:](self, "sendDictionary:forEvent:andLog:", v13, v10, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
