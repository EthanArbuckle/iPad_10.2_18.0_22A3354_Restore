@implementation FigRemoteQueueSenderReleaseIOSurfaces

void __FigRemoteQueueSenderReleaseIOSurfaces_block_invoke(uint64_t a1)
{
  uint64_t v2;

  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 40) + 72));
  if (!FigRemoteQueueIOSurfaceSender_ReleaseIOSurfaces(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 156)))
    rqSurfacesRemoveAll(*(_QWORD *)(a1 + 40) + 168);
  pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 40) + 72));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
