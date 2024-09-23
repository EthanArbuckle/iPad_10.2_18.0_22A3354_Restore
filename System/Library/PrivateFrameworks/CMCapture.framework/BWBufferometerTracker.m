@implementation BWBufferometerTracker

+ (void)trackBuffer:(uint64_t)a3 trackedSize:(void *)a4 tag:(void *)a5 bufferType:
{
  _QWORD *v9;
  id v10;

  objc_opt_self();
  if (a2 && a3 >= 1)
  {
    v9 = -[BWBufferometerTracker initWithBuffer:trackedSize:tag:bufferType:]([BWBufferometerTracker alloc], (uint64_t)a2, a3, a4, a5);
    if (v9)
    {
      v10 = v9;
      objc_setAssociatedObject(a2, CFSTR("BufferometerTracer"), v9, (void *)0x301);

    }
  }
}

- (_QWORD)initWithBuffer:(uint64_t)a3 trackedSize:(void *)a4 tag:(void *)a5 bufferType:
{
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)BWBufferometerTracker;
  v9 = objc_msgSendSuper2(&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[3] = a2;
    v9[1] = a3;
    v9[4] = a4;
    v10[5] = a5;
    v11 = sBufferometerTrackingSerialNumber++;
    v10[2] = v11;
    v12 = v10[1];
    do
      v13 = __ldxr(&sBufferometerTotalSize);
    while (__stxr(v13 + v12, &sBufferometerTotalSize));
    do
      v14 = __ldxr(&sBufferometerTotalCount);
    while (__stxr(v14 + 1, &sBufferometerTotalCount));
  }
  return v10;
}

- (void)dealloc
{
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  objc_super v6;

  v3 = -self->_trackedSize;
  do
    v4 = __ldxr(&sBufferometerTotalSize);
  while (__stxr(v4 + v3, &sBufferometerTotalSize));
  do
    v5 = __ldxr(&sBufferometerTotalCount);
  while (__stxr(v5 - 1, &sBufferometerTotalCount));

  v6.receiver = self;
  v6.super_class = (Class)BWBufferometerTracker;
  -[BWBufferometerTracker dealloc](&v6, sel_dealloc);
}

@end
