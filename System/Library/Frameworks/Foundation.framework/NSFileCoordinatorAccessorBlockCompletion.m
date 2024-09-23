@implementation NSFileCoordinatorAccessorBlockCompletion

- (void)decrement
{
  int *p_count;
  unsigned int v4;

  p_count = &self->count;
  do
    v4 = __ldaxr((unsigned int *)p_count);
  while (__stlxr(v4 - 1, (unsigned int *)p_count));
  if (v4 == 1)
  {
    (*((void (**)(void))self->block + 2))();

    self->block = 0;
  }
  else if (!v4)
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Accessor completion counter over-decremented"), 0));
  }
}

+ (id)completionWithBlock:(id)a3
{
  id v4;

  if (!a3)
    return 0;
  v4 = (id)objc_opt_new();
  *((_QWORD *)v4 + 1) = objc_msgSend(a3, "copy");
  atomic_store(1u, (unsigned int *)v4 + 4);
  return v4;
}

- (void)dealloc
{
  int v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned int *)&self->count);
  if (v3 >= 1)
    (*((void (**)(void))self->block + 2))();

  v4.receiver = self;
  v4.super_class = (Class)NSFileCoordinatorAccessorBlockCompletion;
  -[NSFileCoordinatorAccessorBlockCompletion dealloc](&v4, sel_dealloc);
}

- (void)increment
{
  int *p_count;
  unsigned int v3;

  p_count = &self->count;
  do
    v3 = __ldaxr((unsigned int *)p_count);
  while (__stlxr(v3 + 1, (unsigned int *)p_count));
  if (!v3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Accessor completion counter should never be incremented from 0 to 1"), 0));
}

@end
