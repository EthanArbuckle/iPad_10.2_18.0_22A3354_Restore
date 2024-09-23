@implementation FigProcessInfoCreateWithDetails

pthread_mutex_t *__FigProcessInfoCreateWithDetails_block_invoke()
{
  pthread_mutex_t *result;

  result = FigSimpleMutexCreate();
  FigProcessInfoCreateWithDetails_mutex = (uint64_t)result;
  return result;
}

@end
