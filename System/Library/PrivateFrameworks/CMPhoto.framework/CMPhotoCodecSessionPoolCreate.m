@implementation CMPhotoCodecSessionPoolCreate

uint64_t __CMPhotoCodecSessionPoolCreate_block_invoke(uint64_t a1)
{
  uint64_t result;

  CMPhotoCodecSessionPoolFlush(*(_QWORD *)(a1 + 32), 3);
  result = pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 24));
  if (!(_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "unregisterBackgroundNotificationForContext:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "releaseAssertionForContext:");
    return pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 24));
  }
  return result;
}

@end
