@implementation NANotificationObserverProxy

uint64_t __98___NANotificationObserverProxy_initWithWeakObserver_notificationName_observerQueue_observerBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "performObserverBlock");
}

@end
