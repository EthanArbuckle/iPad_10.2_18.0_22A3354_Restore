@implementation NTKDarwinNotificationCenterObserver

- (void)setObserverObject:(id)a3
{
  objc_storeWeak((id *)&self->_observerObject, a3);
}

- (void)setNotificationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[NTKDarwinNotificationCenterObserver observerObject](self, "observerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "observerObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    -[NTKDarwinNotificationCenterObserver notificationName](self, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSObject)observerObject
{
  return objc_loadWeakRetained((id *)&self->_observerObject);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_destroyWeak((id *)&self->_observerObject);
}

@end
