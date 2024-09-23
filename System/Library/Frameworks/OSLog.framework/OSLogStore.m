@implementation OSLogStore

- (OSLogStore)init
{
  objc_super v4;
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D418F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Invalid direct use of -[OSLogStore init] (use factory instead)", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)OSLogStore;
  return -[OSLogStore init](&v4, sel_init);
}

- (id)initForFactory
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OSLogStore;
  return -[OSLogStore init](&v3, sel_init);
}

- (id)_constrainedEntriesEnumeratorWithOptions:(unint64_t)a3 position:(id)a4 predicate:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  OSLogCurrentProcessEnumerator *v10;

  v8 = a5;
  v9 = a4;
  v10 = -[OSLogCurrentProcessEnumerator initWithOptions:predicate:position:]([OSLogCurrentProcessEnumerator alloc], "initWithOptions:predicate:position:", a3, v8, v9);

  return v10;
}

- (OSLogEnumerator)entriesEnumeratorWithOptions:(OSLogEnumeratorOptions)options position:(OSLogPosition *)position predicate:(NSPredicate *)predicate error:(NSError *)error
{
  OSLogPosition *v10;
  NSPredicate *v11;
  OSLogSystemEnumerator *v12;
  void *v13;
  void *v14;

  v10 = position;
  v11 = predicate;
  if (self->_constraint)
  {
    -[OSLogStore _constrainedEntriesEnumeratorWithOptions:position:predicate:error:](self, "_constrainedEntriesEnumeratorWithOptions:position:predicate:error:", options, v10, v11, error);
    v12 = (OSLogSystemEnumerator *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D446A0]), "initWithSource:", self->_source);
    v14 = v13;
    if (v11)
      objc_msgSend(v13, "setFilterPredicate:", v11);
    v12 = -[OSLogSystemEnumerator initWithEventStream:options:position:]([OSLogSystemEnumerator alloc], "initWithEventStream:options:position:", v14, options, v10);

  }
  return (OSLogEnumerator *)v12;
}

- (OSLogEnumerator)entriesEnumeratorAndReturnError:(NSError *)error
{
  return -[OSLogStore entriesEnumeratorWithOptions:position:predicate:error:](self, "entriesEnumeratorWithOptions:position:predicate:error:", 0, 0, 0, error);
}

- (OSLogPosition)positionWithDate:(NSDate *)date
{
  NSDate *v3;
  OSLogPosition *v4;

  v3 = date;
  v4 = -[OSLogPosition initWithDate:]([OSLogPosition alloc], "initWithDate:", v3);

  return v4;
}

- (OSLogPosition)positionWithTimeIntervalSinceEnd:(NSTimeInterval)seconds
{
  return -[OSLogPosition initWithEventSource:timeIntervalSinceEnd:]([OSLogPosition alloc], "initWithEventSource:timeIntervalSinceEnd:", self->_source, seconds);
}

- (OSLogPosition)positionWithTimeIntervalSinceLatestBoot:(NSTimeInterval)seconds
{
  return -[OSLogPosition initWithTimeIntervalSinceLatestBoot:]([OSLogPosition alloc], "initWithTimeIntervalSinceLatestBoot:", seconds);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

+ (OSLogStore)storeWithScope:(OSLogStoreScope)scope error:(NSError *)error
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;

  if (scope != OSLogStoreCurrentProcessIdentifier)
    return (OSLogStore *)0;
  v6 = -[OSLogStore initForFactory]([OSLogStore alloc], "initForFactory", v4, v5);
  if (v6)
    v6[4] = 1;
  return (OSLogStore *)v6;
}

+ (OSLogStore)storeWithURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD *v13;
  NSError **v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = url;
  v6 = -[OSLogStore initForFactory]([OSLogStore alloc], "initForFactory");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D44698], "storeWithArchiveURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __33__OSLogStore_storeWithURL_error___block_invoke;
      v12[3] = &unk_1E977B3B8;
      v14 = error;
      v8 = v6;
      v13 = v8;
      objc_msgSend(v7, "prepareWithCompletionHandler:", v12);
      if (v8[1])
        v9 = v8;
      else
        v9 = 0;
      v10 = v13;
    }
    else
    {
      if (!error)
      {
        v7 = 0;
        v9 = 0;
        goto LABEL_12;
      }
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("Cannot open logarchive");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D446C0], -1, v10);
      v9 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    if (!error)
    {
      v9 = 0;
      goto LABEL_13;
    }
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("Unable to alloc/init");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D446C0], -1, v7);
    v9 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

LABEL_13:
  return (OSLogStore *)v9;
}

void __33__OSLogStore_storeWithURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(_QWORD *)(a1 + 40))
      **(_QWORD **)(a1 + 40) = objc_retainAutorelease(v6);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
  }

}

@end
