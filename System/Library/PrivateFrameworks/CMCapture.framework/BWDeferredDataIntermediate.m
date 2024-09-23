@implementation BWDeferredDataIntermediate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredDataIntermediate;
  -[BWDeferredIntermediate dealloc](&v3, sel_dealloc);
}

- (uint64_t)_setURL:(NSObject *)a3 prefetchQueue:
{
  uint64_t v3;
  uint64_t v5;
  _QWORD block[5];

  if (result)
  {
    if (a2)
    {
      v3 = result;
      if (*(_QWORD *)(result + 152) || *(_QWORD *)(result + 128))
      {
        FigDebugAssert3();
        return 4294951161;
      }
      else
      {
        *(_QWORD *)(result + 128) = objc_msgSend(a2, "copy");
        if (a3)
        {
          v5 = MEMORY[0x1E0C809B0];
          *(_BYTE *)(v3 + 144) = 1;
          block[0] = v5;
          block[1] = 3221225472;
          block[2] = __52__BWDeferredDataIntermediate__setURL_prefetchQueue___block_invoke;
          block[3] = &unk_1E491E720;
          block[4] = v3;
          dispatch_async(a3, block);
        }
        return 0;
      }
    }
    else
    {
      FigDebugAssert3();
      return 4294951162;
    }
  }
  return result;
}

uint64_t __52__BWDeferredDataIntermediate__setURL_prefetchQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v4;

  v4 = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), 0, &v4);
  if (v4)
    FigDebugAssert3();
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
  if (!v4)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = v2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 72));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (int)setArchive:(id)a3
{
  return -16136;
}

- (id)fetchAndRetain:(int *)a3
{
  return -[BWDeferredDataIntermediate fetchWithCustomClassesAndRetain:err:](self, "fetchWithCustomClassesAndRetain:err:", 0, a3);
}

- (id)fetchWithCustomClassesAndRetain:(id)a3 err:(int *)a4
{
  if (a4)
    *a4 = -16136;
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: tag:%@ data:%@"), objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), self->_archive);
}

@end
