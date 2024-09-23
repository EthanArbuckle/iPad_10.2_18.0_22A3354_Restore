@implementation SGDNotificationBroadcaster

+ (void)emitURLChanged
{
  unsigned __int8 v2;
  void *v3;
  id v4;

  do
    v2 = __ldaxr(_notifyURLs_pending);
  while (__stlxr(1u, _notifyURLs_pending));
  if ((v2 & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0D81598];
    getQueue();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "runAsyncOnQueue:afterDelaySeconds:block:", v4, &__block_literal_global_19_33210, 0.3);

  }
}

+ (unint64_t)notificationCount
{
  NSObject *v2;
  unint64_t v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  getQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SGDNotificationBroadcaster_notificationCount__block_invoke;
  block[3] = &unk_1E7DB7220;
  block[4] = &v6;
  dispatch_sync(v2, block);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SGDNotificationBroadcaster_notificationCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = _notificationCount;
  return result;
}

@end
