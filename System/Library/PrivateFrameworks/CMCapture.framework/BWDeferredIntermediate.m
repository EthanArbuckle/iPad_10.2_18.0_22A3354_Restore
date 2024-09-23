@implementation BWDeferredIntermediate

- (NSString)tag
{
  return self->_tag;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWDeferredIntermediate)initWithTag:(id)a3 URL:(id)a4
{
  BWDeferredIntermediate *v7;

  if (a3 && a4)
  {
    v7 = -[BWDeferredIntermediate init](self, "init");
    if (v7)
    {
      v7->_tag = (NSString *)a3;
      v7->_URL = (NSURL *)a4;
      v7->_dirty = 1;
    }
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

- (BWDeferredIntermediate)init
{
  BWDeferredIntermediate *v2;
  BWDeferredIntermediate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeferredIntermediate;
  v2 = -[BWDeferredIntermediate init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    pthread_cond_init(&v3->_cv, 0);
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredIntermediate)initWithCoder:(id)a3
{
  BWDeferredIntermediate *v5;

  if (a3)
  {
    v5 = -[BWDeferredIntermediate init](self, "init");
    if (v5)
      v5->_tag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_tag, CFSTR("tag"));
}

- (void)dealloc
{
  objc_super v3;

  pthread_cond_destroy(&self->_cv);
  pthread_mutex_destroy(&self->_lock);

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredIntermediate;
  -[BWDeferredIntermediate dealloc](&v3, sel_dealloc);
}

- (int)setURL:(id)a3 prefetchQueue:(id)a4
{
  return -16136;
}

- (id)fetchAndRetain:(int *)a3
{
  if (a3)
    *a3 = -16136;
  return 0;
}

- (int)flush
{
  return -16136;
}

- (id)archive:(int *)a3
{
  if (a3)
    *a3 = -16136;
  return 0;
}

- (id)_shortString
{
  return CFSTR("<unspecified>");
}

- (NSURL)URL
{
  return self->_URL;
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (void)setSettingsID:(int64_t)a3
{
  self->_settingsID = a3;
}

@end
