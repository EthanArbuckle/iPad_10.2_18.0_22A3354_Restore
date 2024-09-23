@implementation NSFilePresenterOperationRecord

+ (id)operationRecordWithDescription:(id)a3 reactor:(id)a4
{
  id v6;

  v6 = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)v6 + 1) = objc_msgSend(a3, "copy");
  objc_storeWeak((id *)v6 + 3, a4);
  *((_QWORD *)v6 + 4) = objc_msgSend(+[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a4), "copy");
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFilePresenterOperationRecord;
  -[NSFilePresenterOperationRecord dealloc](&v3, sel_dealloc);
}

- (void)didBegin
{
  self->state = 1;
}

- (void)willEnd
{
  self->state = 2;
}

- (void)didEnd
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  self->state = 3;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__NSFilePresenterOperationRecord_didEnd__block_invoke;
  v2[3] = &unk_1E0F542E0;
  v2[4] = self;
  +[NSFileAccessArbiterProxy _accessPresenterOperationRecordsUsingBlock:](NSFileAccessArbiterProxy, "_accessPresenterOperationRecordsUsingBlock:", v2);
}

uint64_t __40__NSFilePresenterOperationRecord_didEnd__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (id)_reactorQueue
{
  char v3;
  id v4;

  -[NSFilePresenterOperationRecord reactor](self, "reactor");
  v3 = objc_opt_respondsToSelector();
  v4 = -[NSFilePresenterOperationRecord reactor](self, "reactor");
  if ((v3 & 1) != 0)
    return (id)objc_msgSend(v4, "presentedItemOperationQueue");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(-[NSFilePresenterOperationRecord reactor](self, "reactor"), "_providedItemsOperationQueue");
  return 0;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  id v5;
  NSString *reactorID;
  NSString *v7;
  NSString *v8;
  id v9;

  v3 = -[NSFilePresenterOperationRecord state](self, "state");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = off_1E0F54778[v3];
  v5 = -[NSFilePresenterOperationRecord reactor](self, "reactor");
  reactorID = self->reactorID;
  v7 = -[NSFilePresenterOperationRecord operationDescription](self, "operationDescription");
  if (!v5)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reactor with ID %@ deallocated in state: %@ %@"), reactorID, v4, v7);
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reactor %@ with ID %@ %@ %@"), v5, reactorID, v4, v7);
  v9 = -[NSFilePresenterOperationRecord _reactorQueue](self, "_reactorQueue");
  if (objc_msgSend(v9, "isSuspended"))
    return -[NSString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR(" -- Queue is suspended: %@"), v9);
  else
    return v8;
}

- (NSString)operationDescription
{
  return self->operationDescription;
}

- (int64_t)state
{
  return self->state;
}

- (id)reactor
{
  return objc_loadWeak(&self->reactor);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->reactor);
}

@end
