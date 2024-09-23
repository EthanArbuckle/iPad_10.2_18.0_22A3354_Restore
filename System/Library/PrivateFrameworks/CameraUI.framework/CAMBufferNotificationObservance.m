@implementation CAMBufferNotificationObservance

- (CAMBufferNotificationObservance)initWithNotification:(id)a3 object:(id)a4 center:(id)a5 removeOnceEnabled:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  CAMBufferNotificationObservance *v14;
  CAMBufferNotificationObservance *v15;
  CAMBufferNotificationObservance *v16;
  objc_super v18;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CAMBufferNotificationObservance;
  v14 = -[CAMBufferObservance initWithPredicate:removedOnceEnabled:](&v18, sel_initWithPredicate_removedOnceEnabled_, 0, v6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_notification, a3);
    objc_storeWeak((id *)&v15->_object, v12);
    objc_storeStrong((id *)&v15->_notificationCenter, a5);
    v16 = v15;
  }

  return v15;
}

- (void)fulfillWithChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  if (!-[CAMBufferObservance isFulfilled](self, "isFulfilled"))
    -[CAMBufferObservance setFulfilled:](self, "setFulfilled:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v10;
    -[CAMBufferNotificationObservance notification](self, "notification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMBufferNotificationObservance object](self, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v5))
    {
      objc_msgSend(v4, "object");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  -[CAMBufferObservance setEnabled:](self, "setEnabled:", v9);

}

- (void)setupObservanceForBuffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CAMBufferNotificationObservance notification](self, "notification");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMBufferNotificationObservance object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBufferNotificationObservance notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_handleObservedNotification_, v7, v5);

}

- (void)teardownObservanceForBuffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CAMBufferNotificationObservance notification](self, "notification");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMBufferNotificationObservance object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBufferNotificationObservance notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", v4, v7, v5);

}

- (NSString)notification
{
  return self->_notification;
}

- (NSObject)object
{
  return objc_loadWeakRetained((id *)&self->_object);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_object);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
