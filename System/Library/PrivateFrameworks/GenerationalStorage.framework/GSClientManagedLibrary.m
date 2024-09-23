@implementation GSClientManagedLibrary

- (GSAdditionStoring)storage
{
  return (GSAdditionStoring *)self->_ts;
}

- (NSString)nameSpace
{
  return (NSString *)CFSTR("com.apple.documentVersions");
}

- (GSClientManagedLibrary)initWithURL:(id)a3 error:(id *)a4
{
  id v7;
  GSClientManagedLibrary *v8;
  void *v9;
  uint64_t v10;
  GSTemporaryStorage *ts;
  void *v13;
  objc_super v14;

  v7 = a3;
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GSClientManagedLibrary.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isFileURL]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)GSClientManagedLibrary;
  v8 = -[GSClientManagedLibrary init](&v14, sel_init);
  if (v8)
  {
    +[GSStorageManager manager](GSStorageManager, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "temporaryStorageForItemAtURL:locatedAtURL:error:", v7, v7, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    ts = v8->_ts;
    v8->_ts = (GSTemporaryStorage *)v10;

    if (!v8->_ts)
    {

      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)generationsRemove:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  GSTemporaryStorage *ts;
  NSObject *v10;
  char v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  -[GSTemporaryStorage additionsWithNames:inNameSpace:error:](self->_ts, "additionsWithNames:inNameSpace:error:", v6, CFSTR("com.apple.documentVersions"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  if (v7)
  {
    v8 = dispatch_semaphore_create(0);
    ts = self->_ts;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__GSClientManagedLibrary_generationsRemove_error___block_invoke;
    v13[3] = &unk_1E9771E50;
    v15 = &v17;
    v16 = &v23;
    v10 = v8;
    v14 = v10;
    -[GSTemporaryStorage removeAdditions:completionHandler:](ts, "removeAdditions:completionHandler:", v7, v13);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v11 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

void __50__GSClientManagedLibrary_generationsRemove_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ts, 0);
}

@end
