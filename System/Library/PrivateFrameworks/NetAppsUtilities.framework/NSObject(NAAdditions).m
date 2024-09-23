@implementation NSObject(NAAdditions)

- (_NANotificationObserverProxy)na_addNotificationBlockObserverForName:()NAAdditions object:queue:usingBlock:
{
  id v10;
  id v11;
  id v12;
  id v13;
  _NANotificationObserverProxy *v14;
  id v15;
  _NANotificationObserverProxy *v16;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, a1);
  v14 = [_NANotificationObserverProxy alloc];
  v15 = objc_loadWeakRetained(&location);
  v16 = -[_NANotificationObserverProxy initWithWeakObserver:notificationName:observerQueue:observerBlock:](v14, "initWithWeakObserver:notificationName:observerQueue:observerBlock:", v15, v10, v12, v13);

  objc_msgSend(a1, "_na_addNotificationObserverProxy:", v16);
  objc_destroyWeak(&location);

  return v16;
}

- (_NAKeyValueObserverProxy)na_addNotificationBlockObserverForObject:()NAAdditions keyPath:options:usingBlock:
{
  id v10;
  id v11;
  id v12;
  _NAKeyValueObserverProxy *v13;
  id v14;
  _NAKeyValueObserverProxy *v15;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, a1);
  v13 = [_NAKeyValueObserverProxy alloc];
  v14 = objc_loadWeakRetained(&location);
  v15 = -[_NAKeyValueObserverProxy initWithWeakObserver:observedObject:keyPath:options:observerBlock:](v13, "initWithWeakObserver:observedObject:keyPath:options:observerBlock:", v14, v10, v11, a5, v12);

  objc_msgSend(a1, "_na_addNotificationObserverProxy:", v15);
  objc_destroyWeak(&location);

  return v15;
}

- (void)na_setAssociatedObject:()NAAdditions associatedObjectDescriptor:
{
  objc_setAssociatedObject(a1, *(const void **)a4, a3, *(void **)(a4 + 8));
}

- (id)na_associatedObjectForDescriptor:()NAAdditions
{
  return objc_getAssociatedObject(a1, *a3);
}

- (void)_na_addNotificationObserverProxy:()NAAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "na_associatedObjectForDescriptor:", &sObserverProxiesAssociatedObject);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(a1, "na_setAssociatedObject:associatedObjectDescriptor:", v5, &sObserverProxiesAssociatedObject);

}

- (void)_na_removeNotificationObserverProxy:()NAAdditions
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "invalidate");
    objc_msgSend(a1, "na_associatedObjectForDescriptor:", &sObserverProxiesAssociatedObject);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeObject:", v4);
    objc_msgSend(a1, "na_setAssociatedObject:associatedObjectDescriptor:", v6, &sObserverProxiesAssociatedObject);

  }
}

@end
