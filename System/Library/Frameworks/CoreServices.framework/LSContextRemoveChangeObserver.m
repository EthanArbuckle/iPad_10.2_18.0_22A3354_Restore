@implementation LSContextRemoveChangeObserver

uint64_t ___LSContextRemoveChangeObserver_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  LaunchServices::notifyd::NotifyToken::cancel((LaunchServices::notifyd::NotifyToken *)(*(_QWORD *)(a1 + 32) + 20));
  return objc_msgSend((id)gChangeObservers, "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
}

@end
