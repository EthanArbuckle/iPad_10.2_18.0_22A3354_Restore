@implementation AVCMNotificationDispatcherListenerKey

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCMNotificationDispatcherListenerKey;
  -[AVCMNotificationDispatcherListenerKey dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVCMNotificationDispatcherListenerKey initWithWeakReferenceToListener:callback:name:object:](+[AVCMNotificationDispatcherListenerKey allocWithZone:](AVCMNotificationDispatcherListenerKey, "allocWithZone:", -[AVCMNotificationDispatcherListenerKey zone](self, "zone", a3)), "initWithWeakReferenceToListener:callback:name:object:", self->_weakReferenceToListener, self->_callback, self->_name, self->_object);
}

+ (id)listenerKeyWithWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(id)a5 object:(void *)a6
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWeakReferenceToListener:callback:name:object:", a3, a4, a5, a6);
}

- (AVCMNotificationDispatcherListenerKey)initWithWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(id)a5 object:(void *)a6
{
  AVCMNotificationDispatcherListenerKey *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVCMNotificationDispatcherListenerKey;
  v10 = -[AVCMNotificationDispatcherListenerKey init](&v12, sel_init);
  if (v10)
  {
    v10->_weakReferenceToListener = (AVWeakReference *)a3;
    v10->_callback = a4;
    v10->_name = (NSString *)objc_msgSend(a5, "copyWithZone:", -[AVCMNotificationDispatcherListenerKey zone](v10, "zone"));
    v10->_object = a6;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NSString *name;
  int v6;
  int v7;
  AVWeakReference *weakReferenceToListener;
  char v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    name = self->_name;
    if (name == *((NSString **)a3 + 3))
      LOBYTE(v6) = 0;
    else
      v6 = !-[NSString isEqualToString:](name, "isEqualToString:");
    weakReferenceToListener = self->_weakReferenceToListener;
    if (weakReferenceToListener == *((AVWeakReference **)a3 + 1)
      || (v7 = -[AVWeakReference isEqual:](weakReferenceToListener, "isEqual:")) != 0)
    {
      if (self->_callback == (void *)*((_QWORD *)a3 + 2))
        v9 = v6;
      else
        v9 = 1;
      if ((v9 & 1) != 0)
        goto LABEL_13;
      LOBYTE(v7) = self->_object == (void *)*((_QWORD *)a3 + 4);
    }
  }
  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[AVWeakReference hash](self->_weakReferenceToListener, "hash") ^ (uint64_t)self->_callback;
  return v3 ^ -[NSString hash](self->_name, "hash") ^ (uint64_t)self->_object;
}

- (AVCMNotificationDispatcherListenerKey)init
{
  return -[AVCMNotificationDispatcherListenerKey initWithWeakReferenceToListener:callback:name:object:](self, "initWithWeakReferenceToListener:callback:name:object:", 0, 0, 0, 0);
}

@end
