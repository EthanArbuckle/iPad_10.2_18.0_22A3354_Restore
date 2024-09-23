@implementation NSObject(FMAdditions)

- (_FMNotificationObserverProxy)fm_addNotificationBlockObserverForName:()FMAdditions object:queue:usingBlock:
{
  id v10;
  id v11;
  id v12;
  id v13;
  _FMNotificationObserverProxy *v14;
  id v15;
  _FMNotificationObserverProxy *v16;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, a1);
  v14 = [_FMNotificationObserverProxy alloc];
  v15 = objc_loadWeakRetained(&location);
  v16 = -[_FMNotificationObserverProxy initWithWeakObserver:notificationName:observerQueue:observerBlock:](v14, "initWithWeakObserver:notificationName:observerQueue:observerBlock:", v15, v10, v12, v13);

  objc_msgSend(a1, "_fm_addNotificationObserverProxy:", v16);
  objc_destroyWeak(&location);

  return v16;
}

- (_FMKeyValueObserverProxy)fm_addNotificationBlockObserverForObject:()FMAdditions keyPath:options:usingBlock:
{
  id v10;
  id v11;
  id v12;
  _FMKeyValueObserverProxy *v13;
  id v14;
  _FMKeyValueObserverProxy *v15;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, a1);
  v13 = [_FMKeyValueObserverProxy alloc];
  v14 = objc_loadWeakRetained(&location);
  v15 = -[_FMKeyValueObserverProxy initWithWeakObserver:observedObject:keyPath:options:observerBlock:](v13, "initWithWeakObserver:observedObject:keyPath:options:observerBlock:", v14, v10, v11, a5, v12);

  objc_msgSend(a1, "_fm_addNotificationObserverProxy:", v15);
  objc_destroyWeak(&location);

  return v15;
}

- (void)fm_setAssociatedObject:()FMAdditions assocatedObjectDescriptor:
{
  objc_setAssociatedObject(a1, *(const void **)a4, a3, *(void **)(a4 + 8));
}

- (id)fm_associatedObjectForDescriptor:()FMAdditions
{
  return objc_getAssociatedObject(a1, *a3);
}

- (void)_fm_addNotificationObserverProxy:()FMAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "fm_associatedObjectForDescriptor:", &sObserverProxiesAssociatedObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(a1, "fm_setAssociatedObject:assocatedObjectDescriptor:", v5, &sObserverProxiesAssociatedObject);

}

- (void)_fm_removeNotificationObserverProxy:()FMAdditions
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "invalidate");
    objc_msgSend(a1, "fm_associatedObjectForDescriptor:", &sObserverProxiesAssociatedObject);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeObject:", v4);
    objc_msgSend(a1, "fm_setAssociatedObject:assocatedObjectDescriptor:", v6, &sObserverProxiesAssociatedObject);

  }
}

@end
