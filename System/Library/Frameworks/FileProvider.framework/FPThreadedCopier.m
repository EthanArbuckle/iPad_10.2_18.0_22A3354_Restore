@implementation FPThreadedCopier

+ (FPThreadedCopier)sharedCopier
{
  if (sharedCopier_once != -1)
    dispatch_once(&sharedCopier_once, &__block_literal_global_16);
  return (FPThreadedCopier *)(id)sharedCopier_sharedCopier;
}

void __32__FPThreadedCopier_sharedCopier__block_invoke()
{
  FPThreadedCopier *v0;
  void *v1;

  v0 = objc_alloc_init(FPThreadedCopier);
  v1 = (void *)sharedCopier_sharedCopier;
  sharedCopier_sharedCopier = (uint64_t)v0;

}

- (FPThreadedCopier)init
{
  FPThreadedCopier *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *bufferLimitSemaphore;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *writeQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FPThreadedCopier;
  v2 = -[FPThreadedCopier init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(2);
    bufferLimitSemaphore = v2->_bufferLimitSemaphore;
    v2->_bufferLimitSemaphore = (OS_dispatch_semaphore *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("FPThreadedCopier Writing Queue", v5);
    writeQueue = v2->_writeQueue;
    v2->_writeQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (BOOL)copy:(id)a3 to:(id)a4 overwriteDestination:(BOOL)a5 progress:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  FPThreadedCopier *v21;
  void *v22;
  id v23;
  ssize_t v24;
  ssize_t v25;
  qos_class_t v26;
  id v27;
  dispatch_block_t v28;
  void *v29;
  FPThreadedCopier *v30;
  void *v31;
  BOOL v32;
  FPThreadedCopier *v33;
  NSObject *v34;
  void *v35;
  _BOOL4 v36;
  id v37;
  unint64_t v38;
  SEL v40;
  id v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  FPThreadedCopier *v47;
  uint64_t *v48;
  ssize_t v49;
  int v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v9 = a5;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = -[FPThreadedCopier beginReading:error:](self, "beginReading:error:", v13, a7);
  if ((_DWORD)v16 == -1
    || (v17 = v16,
        v40 = a2,
        v18 = -[FPThreadedCopier beginWriting:overwriteDestination:error:](self, "beginWriting:overwriteDestination:error:", v14, v9, a7), (_DWORD)v18 == -1))
  {
    v32 = 0;
  }
  else
  {
    v19 = v18;
    v41 = v13;
    v42 = v14;
    -[FPThreadedCopier beginOperation](self, "beginOperation");
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__10;
    v55 = __Block_byref_object_dispose__10;
    v56 = 0;
    v20 = *MEMORY[0x1E0CB2FE0];
    while (!v52[5])
    {
      if (objc_msgSend(v15, "isCancelled"))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_bufferLimitSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      if (v52[5])
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_bufferLimitSemaphore);
        break;
      }
      v21 = self;
      objc_sync_enter(v21);
      -[NSMutableArray firstObject](self->_buffers, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v40, v21, CFSTR("FPThreadedCopier.m"), 81, CFSTR("No more buffers in queue"));

      }
      -[NSMutableArray removeObjectAtIndex:](self->_buffers, "removeObjectAtIndex:", 0);
      objc_sync_exit(v21);

      v23 = objc_retainAutorelease(v22);
      v24 = read(v17, (void *)objc_msgSend(v23, "mutableBytes"), 0x10000uLL);
      v25 = v24;
      if (v24 == -1)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v20, *__error(), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v21;
        objc_sync_enter(v30);
        -[NSMutableArray addObject:](self->_buffers, "addObject:", v23);
        objc_sync_exit(v30);

        dispatch_semaphore_signal((dispatch_semaphore_t)self->_bufferLimitSemaphore);
      }
      else
      {
        if (!v24)
        {
          v33 = v21;
          objc_sync_enter(v33);
          -[NSMutableArray addObject:](self->_buffers, "addObject:", v23);
          objc_sync_exit(v33);

          -[FPThreadedCopier bufferLimitSemaphore](v33, "bufferLimitSemaphore");
          v34 = objc_claimAutoreleasedReturnValue();
          dispatch_semaphore_signal(v34);

          break;
        }
        v26 = qos_class_self();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__FPThreadedCopier_copy_to_overwriteDestination_progress_error___block_invoke;
        block[3] = &unk_1E444C3C0;
        v49 = v25;
        v27 = v23;
        v50 = v19;
        v45 = v27;
        v48 = &v51;
        v46 = v15;
        v47 = v21;
        v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v26, 0, block);
        dispatch_async((dispatch_queue_t)self->_writeQueue, v28);

        v29 = 0;
      }

      if (v29)
        goto LABEL_20;
    }
    v29 = 0;
LABEL_20:
    if (a7)
    {
      v35 = v29;
      if (v29 || (v35 = (void *)v52[5]) != 0)
        *a7 = objc_retainAutorelease(v35);
    }
    v43 = 0;
    v14 = v42;
    v36 = -[FPThreadedCopier finishReading:writing:error:](self, "finishReading:writing:error:", v17, v19, &v43);
    v37 = v43;
    v38 = (unint64_t)v37;
    if (a7 && !v36 && !v29 && !v52[5])
      *a7 = objc_retainAutorelease(v37);
    -[FPThreadedCopier endOperation](self, "endOperation");
    if (v29)
      v32 = 0;
    else
      v32 = (v52[5] | v38) == 0;

    _Block_object_dispose(&v51, 8);
    v13 = v41;
  }

  return v32;
}

void __64__FPThreadedCopier_copy_to_overwriteDestination_progress_error___block_invoke(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  char *v4;
  ssize_t v5;
  ssize_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "mutableBytes");
  if (v2 >= 1)
  {
    v4 = (char *)v3;
    while (1)
    {
      v5 = write(*(_DWORD *)(a1 + 72), v4, v2);
      if (v5 == -1)
        break;
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + v5);
      v4 += v6;
      v2 -= v6;
      if (v6)
        v7 = v2 <= 0;
      else
        v7 = 1;
      if (v7)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
LABEL_11:
  v11 = *(id *)(a1 + 48);
  objc_sync_enter(v11);
  objc_msgSend(*(id *)(a1 + 48), "buffers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 32));

  objc_sync_exit(v11);
  objc_msgSend(*(id *)(a1 + 48), "bufferLimitSemaphore");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v13);

}

- (int)beginReading:(id)a3 error:(id *)a4
{
  int v5;
  int v6;

  v5 = open((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), 33028);
  v6 = v5;
  if (a4 && v5 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (int)beginWriting:(id)a3 overwriteDestination:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  const char *v7;
  int v8;
  int v9;

  v6 = a4;
  v7 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (v6)
    v8 = open(v7, 1797, 384);
  else
    v8 = open(v7, 3845, 384);
  v9 = v8;
  if (a5 && v8 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (BOOL)finishReading:(int)a3 writing:(int)a4 error:(id *)a5
{
  NSObject *writeQueue;
  void *v9;
  _QWORD v11[5];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  close(a3);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  writeQueue = self->_writeQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__FPThreadedCopier_finishReading_writing_error___block_invoke;
  v11[3] = &unk_1E444C3E8;
  v12 = a4;
  v11[4] = &v13;
  dispatch_sync(writeQueue, v11);
  v9 = (void *)v14[5];
  if (a5 && v9)
    *a5 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v13, 8);

  return v9 == 0;
}

void __48__FPThreadedCopier_finishReading_writing_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (close(*(_DWORD *)(a1 + 40)) == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)beginOperation
{
  NSObject *writeQueue;
  _QWORD v3[6];

  writeQueue = self->_writeQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__FPThreadedCopier_beginOperation__block_invoke;
  v3[3] = &unk_1E44499E8;
  v3[4] = self;
  v3[5] = a2;
  dispatch_sync(writeQueue, v3);
}

void __34__FPThreadedCopier_beginOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (!objc_msgSend(*(id *)(a1 + 32), "numberOfInflightCopies"))
  {
    objc_msgSend(*(id *)(a1 + 32), "buffers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("FPThreadedCopier.m"), 203, CFSTR("self.buffers should be nil"));

    }
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    objc_msgSend(*(id *)(a1 + 32), "setBuffers:", v3);

    v4 = 1;
    do
    {
      v5 = v4;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 0x10000);
      objc_msgSend(*(id *)(a1 + 32), "buffers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v6);

      v4 = 0;
    }
    while ((v5 & 1) != 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInflightCopies:", objc_msgSend(*(id *)(a1 + 32), "numberOfInflightCopies") + 1);
  objc_sync_exit(obj);

}

- (void)endOperation
{
  NSObject *writeQueue;
  _QWORD v3[6];

  writeQueue = self->_writeQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__FPThreadedCopier_endOperation__block_invoke;
  v3[3] = &unk_1E44499E8;
  v3[4] = self;
  v3[5] = a2;
  dispatch_sync(writeQueue, v3);
}

void __32__FPThreadedCopier_endOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfInflightCopies:", objc_msgSend(*(id *)(a1 + 32), "numberOfInflightCopies") - 1);
  if (!objc_msgSend(*(id *)(a1 + 32), "numberOfInflightCopies"))
  {
    objc_msgSend(*(id *)(a1 + 32), "buffers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("FPThreadedCopier.m"), 221, CFSTR("self.buffers should be non-nil"));

    }
    objc_msgSend(*(id *)(a1 + 32), "setBuffers:", 0);
  }
  objc_sync_exit(obj);

}

- (int64_t)numberOfInflightCopies
{
  return self->_numberOfInflightCopies;
}

- (void)setNumberOfInflightCopies:(int64_t)a3
{
  self->_numberOfInflightCopies = a3;
}

- (OS_dispatch_semaphore)bufferLimitSemaphore
{
  return self->_bufferLimitSemaphore;
}

- (void)setBufferLimitSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_bufferLimitSemaphore, a3);
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_buffers, a3);
}

- (OS_dispatch_queue)writeQueue
{
  return self->_writeQueue;
}

- (void)setWriteQueue:(id)a3
{
  objc_storeStrong((id *)&self->_writeQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_bufferLimitSemaphore, 0);
}

@end
