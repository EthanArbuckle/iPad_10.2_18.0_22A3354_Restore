@implementation BWBufferometer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (void)trackBuffer:(void *)a3 trackedSize:(int64_t)a4
{
  objc_opt_self();
  +[BWBufferometerTracker trackBuffer:trackedSize:tag:bufferType:]((uint64_t)BWBufferometerTracker, a3, a4, 0, 0);
}

+ (void)trackBuffer:(void *)a3 trackedSize:(int64_t)a4 tag:(id)a5 bufferType:(id)a6
{
  +[BWBufferometerTracker trackBuffer:trackedSize:tag:bufferType:]((uint64_t)BWBufferometerTracker, a3, a4, a5, a6);
}

+ (int64_t)totalTrackedSizeInFlight
{
  int64_t result;

  do
    result = __ldxr(&sBufferometerTotalSize);
  while (__stxr(result, &sBufferometerTotalSize));
  return result;
}

+ (int64_t)totalTrackedBuffersInFlight
{
  int64_t result;

  do
    result = __ldxr(&sBufferometerTotalCount);
  while (__stxr(result, &sBufferometerTotalCount));
  return result;
}

@end
