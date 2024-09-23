@implementation VCMediaControlInfoGenerator

- (VCMediaControlInfoGenerator)initWithType:(unsigned int)a3 version:(unsigned __int8)a4
{
  VCMediaControlInfoGenerator *v6;
  VCMediaControlInfoGenerator *v7;
  CFDictionaryValueCallBacks v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCMediaControlInfoGenerator;
  v6 = -[VCMediaControlInfoGenerator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_version = a4;
    v6->_type = a3;
    *(_OWORD *)&v9.version = 0u;
    v9.copyDescription = 0;
    v9.equal = 0;
    v9.release = (CFDictionaryReleaseCallBack)freeValueCallback;
    pthread_rwlock_init(&v6->_callbackDictLock, 0);
    v7->_callbacksDict = CFDictionaryCreateMutable(0, 0, 0, &v9);
    pthread_mutex_init(&v7->_controlInfoPoolLock, 0);
    v7->_controlInfoPool = (NSMutableArray *)objc_opt_new();
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  pthread_mutex_destroy(&self->_controlInfoPoolLock);
  CFRelease(self->_callbacksDict);
  pthread_rwlock_destroy(&self->_callbackDictLock);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfoGenerator;
  -[VCMediaControlInfoGenerator dealloc](&v3, sel_dealloc);
}

- (int)registerFillBlobCallback:(void *)a3 processBlobCallback:(void *)a4 context:(void *)a5
{
  _QWORD *v9;

  v9 = malloc_type_malloc(0x10uLL, 0x80040803F642BuLL);
  *v9 = a3;
  v9[1] = a4;
  pthread_rwlock_wrlock(&self->_callbackDictLock);
  CFDictionarySetValue(self->_callbacksDict, a5, v9);
  pthread_rwlock_unlock(&self->_callbackDictLock);
  return 0;
}

- (int)deregisterCallbacksWithContext:(void *)a3
{
  _opaque_pthread_rwlock_t *p_callbackDictLock;

  p_callbackDictLock = &self->_callbackDictLock;
  pthread_rwlock_wrlock(&self->_callbackDictLock);
  CFDictionaryRemoveValue(self->_callbacksDict, a3);
  pthread_rwlock_unlock(p_callbackDictLock);
  return 0;
}

- (int)addMediaControlInfoOption:(unsigned int)a3
{
  self->_optionBitmap |= a3;
  return 0;
}

- (unint64_t)feedbackSize
{
  unsigned int optionBitmap;
  unint64_t v4;

  if (self->_type)
    return 0;
  optionBitmap = self->_optionBitmap;
  v4 = 10;
  if ((optionBitmap & 1) == 0)
    v4 = 6;
  if ((optionBitmap & 2) != 0)
    return v4 + 4;
  else
    return v4;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)fecFeedbackVersion
{
  return self->_fecFeedbackVersion;
}

- (void)setFecFeedbackVersion:(unsigned __int8)a3
{
  self->_fecFeedbackVersion = a3;
}

@end
