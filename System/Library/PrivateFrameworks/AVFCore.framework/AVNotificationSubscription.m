@implementation AVNotificationSubscription

- (void)cancel
{
  MEMORY[0x194033BF8](self->_cancelMutex, a2);
  if (self->_observerToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_observerToken);

    self->_observerToken = 0;
  }
  JUMPOUT(0x194033C04);
}

- (void)dealloc
{
  objc_super v3;

  -[AVNotificationSubscription cancel](self, "cancel");
  if (self->_cancelMutex)
    FigSimpleMutexDestroy();

  self->_object = 0;
  self->_callback = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVNotificationSubscription;
  -[AVNotificationSubscription dealloc](&v3, sel_dealloc);
}

- (AVNotificationSubscription)initWithObject:(id)a3 notificationName:(id)a4 callbackBlock:(id)a5
{
  AVNotificationSubscription *v8;
  void *v9;
  NSObject *object;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVNotificationSubscription;
  v8 = -[AVNotificationSubscription init](&v15, sel_init);
  if (v8)
  {
    v8->_object = a3;
    v8->_callback = (id)objc_msgSend(a5, "copy");
    v8->_cancelMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    objc_initWeak(&location, v8);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    object = v8->_object;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__AVNotificationSubscription_initWithObject_notificationName_callbackBlock___block_invoke;
    v12[3] = &unk_1E302FA38;
    objc_copyWeak(&v13, &location);
    v8->_observerToken = (id)objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", a4, object, 0, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __76__AVNotificationSubscription_initWithObject_notificationName_callbackBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *Weak;

  v2 = (void *)MEMORY[0x1940343FC]();
  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
    (*(void (**)(void))(Weak[3] + 16))();
  objc_autoreleasePoolPop(v2);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p object=%@>"), objc_opt_class(), self, self->_object);
}

@end
