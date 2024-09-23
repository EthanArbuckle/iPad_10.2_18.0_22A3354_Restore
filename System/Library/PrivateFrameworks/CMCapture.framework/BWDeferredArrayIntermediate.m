@implementation BWDeferredArrayIntermediate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredArrayIntermediate)initWithArray:(id)a3 tag:(id)a4 URL:(id)a5
{
  BWDeferredArrayIntermediate *v7;
  objc_super v9;

  if (a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)BWDeferredArrayIntermediate;
    v7 = -[BWDeferredIntermediate initWithTag:URL:](&v9, sel_initWithTag_URL_, a4, a5);
    if (v7)
      v7->_array = (NSArray *)a3;
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

- (BWDeferredArrayIntermediate)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWDeferredArrayIntermediate;
  return -[BWDeferredIntermediate initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredArrayIntermediate;
  -[BWDeferredIntermediate encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredArrayIntermediate;
  -[BWDeferredDataIntermediate dealloc](&v3, sel_dealloc);
}

- (int)setURL:(id)a3 prefetchQueue:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  int v8;

  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  if (self->_array)
  {
    FigDebugAssert3();
    v8 = -16135;
  }
  else
  {
    -[BWDeferredDataIntermediate _setURL:prefetchQueue:]((uint64_t)self, a3, a4);
    v8 = 0;
  }
  pthread_mutex_unlock(p_lock);
  return v8;
}

- (int)setArchive:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  int v6;

  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  if (*(_OWORD *)&self->super._archive != 0 || self->super.super._URL)
  {
    FigDebugAssert3();
    v6 = -16135;
  }
  else
  {
    v6 = 0;
    self->super._archive = (NSData *)objc_msgSend(a3, "copy");
  }
  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)fetchWithCustomClassesAndRetain:(id)a3 err:(int *)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v8;
  NSData *archive;
  int v10;
  NSURL *URL;
  NSArray *v13;
  id v14;

  v14 = 0;
  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  if (self->_array)
    goto LABEL_7;
  if (self->super.super._prefetching)
    pthread_cond_wait(&self->super.super._cv, p_lock);
  v8 = +[BWDeferredContainer buildArchiveClasses:](BWDeferredContainer, "buildArchiveClasses:", a3);
  archive = self->super._archive;
  if (archive)
  {
    self->_array = (NSArray *)+[BWDeferredContainer unarchiveObject:classes:error:](BWDeferredContainer, "unarchiveObject:classes:error:", archive, v8, &v14);

    self->super._archive = 0;
  }
  else
  {
    URL = self->super.super._URL;
    if (URL)
    {
      v13 = (NSArray *)+[BWDeferredContainer unarchiveObjectWithURL:classes:error:](BWDeferredContainer, "unarchiveObjectWithURL:classes:error:", URL, v8, &v14);
      self->_array = v13;
      if (v13)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  if (self->_array)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
LABEL_13:
  if (v14)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" due to error: %@"), objc_msgSend(v14, "description"));
  v10 = -16134;
LABEL_8:
  pthread_mutex_unlock(p_lock);
  if (a4)
    *a4 = v10;
  return self->_array;
}

- (id)archive:(int *)a3
{
  uint64_t v3;
  _opaque_pthread_mutex_t *p_lock;
  NSArray *array;
  void *v8;
  void *v9;
  int v10;
  uint64_t v12;
  id v13;

  v13 = 0;
  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  array = self->_array;
  if (array)
  {
    if (+[BWDeferredContainer archiveObject:error:](BWDeferredContainer, "archiveObject:error:", array, &v13))
    {
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      v9 = v8;
      if (v8)
      {
        CFAutorelease(v8);
        v10 = 0;
      }
      else
      {
        FigDebugAssert3();
        v10 = -16133;
      }
    }
    else
    {
      LODWORD(v12) = 0;
      FigDebugAssert3();
      objc_msgSend(v13, "code", v12, v3);
      v10 = FigSignalErrorAt();
      v9 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v9 = 0;
    v10 = -16136;
  }
  pthread_mutex_unlock(p_lock);
  if (a3)
    *a3 = v10;
  return v9;
}

- (int)flush
{
  uint64_t v2;
  _opaque_pthread_mutex_t *p_lock;
  int v5;
  uint64_t v7;

  p_lock = &self->super.super._lock;
  pthread_mutex_lock(&self->super.super._lock);
  if (!self->super.super._URL)
    goto LABEL_11;
  if (!self->_array)
  {
    if (!self->super.super._dirty)
      goto LABEL_7;
LABEL_11:
    FigDebugAssert3();
    v5 = -16136;
    goto LABEL_8;
  }
  if (!self->super.super._dirty)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  if (+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:"))
  {

    v5 = 0;
    self->_array = 0;
    self->super.super._dirty = 0;
  }
  else
  {
    LODWORD(v7) = 0;
    FigDebugAssert3();
    v5 = objc_msgSend(0, "code", v7, v2);
  }
LABEL_8:
  pthread_mutex_unlock(p_lock);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)MEMORY[0x1A858DD40]();
  v5 = -[NSArray description](self->_array, "description");
  if (-[NSString length](v5, "length") >= 0x201)
    v5 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@...)"), -[NSString substringToIndex:](v5, "substringToIndex:", 512));
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>: tag:%@ array:%@"), objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), v5);
  objc_autoreleasePoolPop(v4);
  return (id)objc_msgSend(v3, "copy");
}

- (NSArray)array
{
  return self->_array;
}

@end
