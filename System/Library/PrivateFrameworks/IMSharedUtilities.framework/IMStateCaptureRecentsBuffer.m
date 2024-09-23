@implementation IMStateCaptureRecentsBuffer

- (IMStateCaptureRecentsBuffer)initWithTitle:(id)a3 maximumNumberOfTrackedObjects:(unint64_t)a4 queue:(id)a5
{
  id v8;
  id v9;
  IMStateCaptureRecentsBuffer *v10;
  IMStateCaptureRecentsBuffer *v11;
  unint64_t v12;
  uint64_t v13;
  NSPointerArray *trackedObjects;
  uint64_t v15;
  NSString *title;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IMStateCaptureRecentsBuffer;
  v10 = -[IMStateCaptureRecentsBuffer init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v12 = 5;
    if (a4 < 5)
      v12 = a4;
    v10->_maximumNumberOfTrackedObjects = v12;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
    trackedObjects = v11->_trackedObjects;
    v11->_trackedObjects = (NSPointerArray *)v13;

    v11->_handles = (unint64_t *)malloc_type_calloc(v11->_maximumNumberOfTrackedObjects, 8uLL, 0x100004000313F17uLL);
    v15 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v15;

    -[IMStateCaptureRecentsBuffer registerStateCaptureBlockWithQueue:](v11, "registerStateCaptureBlockWithQueue:", v9);
  }

  return v11;
}

- (void)dealloc
{
  unint64_t *handles;
  unint64_t maximumNumberOfTrackedObjects;
  unint64_t i;
  objc_super v6;

  handles = self->_handles;
  if (handles)
  {
    maximumNumberOfTrackedObjects = self->_maximumNumberOfTrackedObjects;
    if (maximumNumberOfTrackedObjects)
    {
      for (i = 0; i < maximumNumberOfTrackedObjects; ++i)
      {
        if (self->_handles[i])
        {
          os_state_remove_handler();
          maximumNumberOfTrackedObjects = self->_maximumNumberOfTrackedObjects;
        }
      }
      handles = self->_handles;
    }
    free(handles);
  }
  v6.receiver = self;
  v6.super_class = (Class)IMStateCaptureRecentsBuffer;
  -[IMStateCaptureRecentsBuffer dealloc](&v6, sel_dealloc);
}

- (void)promoteRecentObject:(id)a3
{
  unint64_t nextInsertionIndex;

  -[NSPointerArray insertPointer:atIndex:](self->_trackedObjects, "insertPointer:atIndex:", a3, self->_nextInsertionIndex);
  nextInsertionIndex = self->_nextInsertionIndex;
  if (self->_maximumNumberOfTrackedObjects != 1)
    ++nextInsertionIndex;
  self->_nextInsertionIndex = nextInsertionIndex;
}

- (void)registerStateCaptureBlockWithQueue:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  int v7;
  id location;

  v4 = a3;
  if (v4 || (dispatch_get_global_queue(-32768, 0), (v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    location = 0;
    objc_initWeak(&location, self);
    if (self->_maximumNumberOfTrackedObjects)
    {
      v5 = 0;
      do
      {
        objc_copyWeak(&v6, &location);
        v7 = v5;
        self->_handles[v5] = os_state_add_handler();
        objc_destroyWeak(&v6);
        ++v5;
      }
      while (self->_maximumNumberOfTrackedObjects > v5);
    }
    objc_destroyWeak(&location);

  }
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)maximumNumberOfTrackedObjects
{
  return self->_maximumNumberOfTrackedObjects;
}

- (unint64_t)nextInsertionIndex
{
  return self->_nextInsertionIndex;
}

- (void)setNextInsertionIndex:(unint64_t)a3
{
  self->_nextInsertionIndex = a3;
}

- (NSPointerArray)trackedObjects
{
  return self->_trackedObjects;
}

- (void)setTrackedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_trackedObjects, a3);
}

- (unint64_t)handles
{
  return self->_handles;
}

- (void)setHandles:(unint64_t *)a3
{
  self->_handles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedObjects, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
