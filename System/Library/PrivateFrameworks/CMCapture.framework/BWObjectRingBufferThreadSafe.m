@implementation BWObjectRingBufferThreadSafe

- (BWObjectRingBufferThreadSafe)initWithCapacity:(int)a3
{
  uint64_t v3;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  self->_lock = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
  v6.receiver = self;
  v6.super_class = (Class)BWObjectRingBufferThreadSafe;
  return -[BWObjectRingBuffer initWithCapacity:](&v6, sel_initWithCapacity_, v3);
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWObjectRingBufferThreadSafe;
  -[BWObjectRingBuffer dealloc](&v3, sel_dealloc);
}

- (void)setCapacity:(int)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *(_QWORD *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWObjectRingBufferThreadSafe;
  -[BWObjectRingBuffer setCapacity:](&v5, sel_setCapacity_, v3);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)appendObject:(id)a3 forTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  objc_super v8;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v8.receiver = self;
  v8.super_class = (Class)BWObjectRingBufferThreadSafe;
  v7 = *a4;
  -[BWObjectRingBuffer appendObject:forTime:](&v8, sel_appendObject_forTime_, a3, &v7);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (id)firstObject
{
  id v3;
  objc_super v5;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWObjectRingBufferThreadSafe;
  v3 = -[BWObjectRingBuffer firstObject](&v5, sel_firstObject);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstTime
{
  objc_super v6;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  v6.receiver = self;
  v6.super_class = (Class)BWObjectRingBufferThreadSafe;
  -[$3CC8671D27C23BF42ADDB32F2B5E48AE firstTime](&v6, sel_firstTime);
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (id)lastObject
{
  id v3;
  objc_super v5;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWObjectRingBufferThreadSafe;
  v3 = -[BWObjectRingBuffer lastObject](&v5, sel_lastObject);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTime
{
  objc_super v6;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  v6.receiver = self;
  v6.super_class = (Class)BWObjectRingBufferThreadSafe;
  -[$3CC8671D27C23BF42ADDB32F2B5E48AE lastTime](&v6, sel_lastTime);
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)enumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  objc_super v8;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v8.receiver = self;
  v8.super_class = (Class)BWObjectRingBufferThreadSafe;
  v7 = *a3;
  -[BWObjectRingBuffer enumerateObjectsStartingAt:usingBlock:](&v8, sel_enumerateObjectsStartingAt_usingBlock_, &v7, a4);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)reverseEnumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  objc_super v8;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v8.receiver = self;
  v8.super_class = (Class)BWObjectRingBufferThreadSafe;
  v7 = *a3;
  -[BWObjectRingBuffer reverseEnumerateObjectsStartingAt:usingBlock:](&v8, sel_reverseEnumerateObjectsStartingAt_usingBlock_, &v7, a4);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)extractTimeRangeFrom:(id *)a3 until:(id *)a4 into:(id)a5 times:(id)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  objc_super v13;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v13.receiver = self;
  v13.super_class = (Class)BWObjectRingBufferThreadSafe;
  v12 = *a3;
  v11 = *a4;
  -[BWObjectRingBuffer extractTimeRangeFrom:until:into:times:](&v13, sel_extractTimeRangeFrom_until_into_times_, &v12, &v11, a5, a6);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)clear
{
  objc_super v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)BWObjectRingBufferThreadSafe;
  -[BWObjectRingBuffer clear](&v3, sel_clear);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)flushEntriesEarlierThan:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  objc_super v6;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v6.receiver = self;
  v6.super_class = (Class)BWObjectRingBufferThreadSafe;
  v5 = *a3;
  -[BWObjectRingBuffer flushEntriesEarlierThan:](&v6, sel_flushEntriesEarlierThan_, &v5);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (id)description
{
  id v3;
  objc_super v5;

  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWObjectRingBufferThreadSafe;
  v3 = -[BWObjectRingBuffer description](&v5, sel_description);
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return v3;
}

@end
