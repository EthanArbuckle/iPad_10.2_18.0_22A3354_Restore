@implementation HandleFigVirtualCaptureCardCreationMessage

pthread_mutex_t *__HandleFigVirtualCaptureCardCreationMessage_block_invoke()
{
  pthread_mutex_t *result;

  result = FigSimpleMutexCreate();
  HandleFigVirtualCaptureCardCreationMessage_sFigVirtualCaptureCardCreationLock = (uint64_t)result;
  return result;
}

@end
