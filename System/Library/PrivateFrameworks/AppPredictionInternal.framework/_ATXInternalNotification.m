@implementation _ATXInternalNotification

- (_ATXInternalNotification)initWithNotificationName:(id)a3
{
  id v6;
  _ATXInternalNotification *v7;
  _ATXInternalNotification *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXInternalNotification.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationName"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_ATXInternalNotification;
  v7 = -[_ATXInternalNotification init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_notificationName, a3);
    pthread_mutex_init(&v8->_lock, 0);
  }

  return v8;
}

- (void)dealloc
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  objc_super v5;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_token)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_token);

  }
  pthread_mutex_unlock(p_lock);
  pthread_mutex_destroy(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)_ATXInternalNotification;
  -[_ATXInternalNotification dealloc](&v5, sel_dealloc);
}

- (void)registerForNotifications:(id)a3
{
  id v4;
  void *v5;
  NSString *notificationName;
  void *v7;
  id token;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  pthread_mutex_lock(&self->_lock);
  if (!self->_token)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    notificationName = self->_notificationName;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___ATXInternalNotification_registerForNotifications___block_invoke;
    v9[3] = &unk_1E82E6028;
    v10 = v4;
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", notificationName, 0, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    token = self->_token;
    self->_token = v7;

  }
  pthread_mutex_unlock(&self->_lock);

}

+ (void)postData:(id)a3 forNotificationNamed:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v9 = CFSTR("data");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", v6, 0, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
