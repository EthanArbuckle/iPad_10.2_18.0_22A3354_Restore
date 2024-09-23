@implementation AXElementTransactionLogging

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_103);
  return (id)sharedLogger___sharedLogger;
}

void __43__AXElementTransactionLogging_sharedLogger__block_invoke()
{
  AXElementTransactionLogging *v0;
  void *v1;

  v0 = objc_alloc_init(AXElementTransactionLogging);
  v1 = (void *)sharedLogger___sharedLogger;
  sharedLogger___sharedLogger = (uint64_t)v0;

}

- (AXElementTransactionLogging)init
{
  AXElementTransactionLogging *v2;
  uint64_t v3;
  NSMutableDictionary *pendingTransactions;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXElementTransactionLogging;
  v2 = -[AXElementTransactionLogging init](&v8, sel_init);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  pendingTransactions = v2->_pendingTransactions;
  v2->_pendingTransactions = (NSMutableDictionary *)v3;

  v5 = dispatch_queue_create("AXElementTransactionLogging", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  return v2;
}

+ (id)transactionSummary
{
  void *v2;
  void *v3;

  +[AXProfileDatabase sharedDatabase](AXProfileDatabase, "sharedDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)willFetchAttribute:(int64_t)a3 forElement:(__AXUIElement *)a4
{
  CFAbsoluteTime Current;
  AXElementTransactionLogging *v8;
  NSObject *queue;
  _QWORD v11[8];

  Current = CFAbsoluteTimeGetCurrent();
  v8 = self;
  objc_sync_enter(v8);
  ++willFetchAttribute_forElement____transactionID;
  objc_sync_exit(v8);

  if (a4)
  {
    CFRetain(a4);
    queue = v8->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__AXElementTransactionLogging_willFetchAttribute_forElement___block_invoke;
    v11[3] = &unk_1E69197D8;
    v11[5] = a3;
    v11[6] = a4;
    *(CFAbsoluteTime *)&v11[7] = Current;
    v11[4] = v8;
    dispatch_async(queue, v11);
  }
  return willFetchAttribute_forElement____transactionID;
}

void __61__AXElementTransactionLogging_willFetchAttribute_forElement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setAttribute:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setElement:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setStart:", *(double *)(a1 + 56));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", willFetchAttribute_forElement____transactionID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, v3);

}

- (id)_appNameForUIElement:(__AXUIElement *)a3 pid:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *pidsToBundleIDs;
  void *v8;
  void *v9;
  CFTypeRef v11;
  NSMutableDictionary *v12;
  void *v13;
  CFTypeRef value;

  v4 = *(_QWORD *)&a4;
  pidsToBundleIDs = self->_pidsToBundleIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pidsToBundleIDs, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    return &stru_1E691BCF0;
  value = 0;
  if (AXUIElementCopyAttributeValue(a3, (CFStringRef)0xBBB, &value))
    return &stru_1E691BCF0;
  v11 = value;
  if (!value)
    return &stru_1E691BCF0;
  v12 = self->_pidsToBundleIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v13);

  return (id)(id)value;
}

- (void)failedTransaction:(unint64_t)a3
{
  CFAbsoluteTime Current;
  NSObject *queue;
  _QWORD block[7];

  Current = CFAbsoluteTimeGetCurrent();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AXElementTransactionLogging_failedTransaction___block_invoke;
  block[3] = &unk_1E6919800;
  block[4] = self;
  block[5] = a3;
  *(CFAbsoluteTime *)&block[6] = Current;
  dispatch_async(queue, block);
}

void __49__AXElementTransactionLogging_failedTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  pid_t pid;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 1);
    objc_msgSend(v5, "setAttribute:", objc_msgSend(v4, "attribute"));
    if (objc_msgSend(v4, "element"))
    {
      pid = 0;
      AXUIElementGetPid((AXUIElementRef)objc_msgSend(v4, "element"), &pid);
      objc_msgSend(v5, "setPid:", pid);
      v6 = _AXUIElementIDForElement(objc_msgSend(v4, "element"));
      objc_msgSend(v5, "setUid:", v6, v7);
      v8 = *(void **)(a1 + 32);
      v9 = objc_msgSend(v4, "element");
      objc_msgSend(v8, "_appNameForUIElement:pid:", v9, pid);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAppName:", v10);

    }
    v11 = *(double *)(a1 + 48);
    objc_msgSend(v4, "start");
    objc_msgSend(v5, "setDuration:", v11 - v12);
    objc_msgSend(v5, "setValueSize:", 0);
    objc_msgSend(v5, "setValueHash:", 0);
    +[AXProfileDatabase sharedDatabase](AXProfileDatabase, "sharedDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerEntry:", v5);

    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v16);

  }
}

- (void)finishedTransaction:(unint64_t)a3 withValue:(void *)a4
{
  -[AXElementTransactionLogging finishedTransaction:withValue:amortization:](self, "finishedTransaction:withValue:amortization:", a3, a4, 1.0);
}

- (void)finishedTransaction:(unint64_t)a3 withValue:(void *)a4 amortization:(double)a5
{
  CFAbsoluteTime Current;
  CFHashCode v10;
  CFTypeID v11;
  const __CFAttributedString *Length;
  NSObject *queue;
  _QWORD v14[10];

  if (a4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v10 = CFHash(a4);
    v11 = CFGetTypeID(a4);
    if (v11 == CFStringGetTypeID())
    {
      Length = (const __CFAttributedString *)CFStringGetLength((CFStringRef)a4);
    }
    else if (AXIsAXAttributedString())
    {
      Length = (const __CFAttributedString *)AXGetCFAttributedStringFromAXAttributedString(a4);
      if (Length)
        Length = (const __CFAttributedString *)CFAttributedStringGetLength(Length);
    }
    else
    {
      Length = 0;
    }
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__AXElementTransactionLogging_finishedTransaction_withValue_amortization___block_invoke;
    v14[3] = &unk_1E6919828;
    v14[4] = self;
    v14[5] = a3;
    *(CFAbsoluteTime *)&v14[6] = Current;
    *(double *)&v14[7] = a5;
    v14[8] = Length;
    v14[9] = v10;
    dispatch_async(queue, v14);
  }
}

void __74__AXElementTransactionLogging_finishedTransaction_withValue_amortization___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  pid_t pid;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", 0);
    objc_msgSend(v5, "setAttribute:", objc_msgSend(v4, "attribute"));
    if (objc_msgSend(v4, "element"))
    {
      pid = 0;
      AXUIElementGetPid((AXUIElementRef)objc_msgSend(v4, "element"), &pid);
      objc_msgSend(v5, "setPid:", pid);
      v6 = _AXUIElementIDForElement(objc_msgSend(v4, "element"));
      objc_msgSend(v5, "setUid:", v6, v7);
      v8 = *(void **)(a1 + 32);
      v9 = objc_msgSend(v4, "element");
      objc_msgSend(v8, "_appNameForUIElement:pid:", v9, pid);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAppName:", v10);

      CFRelease((CFTypeRef)objc_msgSend(v4, "element"));
    }
    v11 = *(double *)(a1 + 48);
    objc_msgSend(v4, "start");
    objc_msgSend(v5, "setDuration:", (v11 - v12) * *(double *)(a1 + 56));
    objc_msgSend(v5, "setValueSize:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v5, "setValueHash:", *(_QWORD *)(a1 + 72));
    +[AXProfileDatabase sharedDatabase](AXProfileDatabase, "sharedDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerEntry:", v5);

    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v16);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pidsToBundleIDs, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
}

@end
