@implementation AVPropertyValuePublisher

- (AVPropertyValuePublisher)initWithObject:(id)a3 key:(id)a4 notificationName:(id)a5
{
  AVPropertyValuePublisher *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVPropertyValuePublisher;
  v8 = -[AVPublisher init](&v10, sel_init);
  if (v8)
  {
    v8->_object = a3;
    v8->_key = (NSString *)objc_msgSend(a4, "copy");
    v8->_notificationName = (NSString *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPropertyValuePublisher;
  -[AVPublisher dealloc](&v3, sel_dealloc);
}

+ (id)propertyValuePublisherWithObject:(id)a3 key:(id)a4 notificationName:(id)a5
{
  return -[AVPropertyValuePublisher initWithObject:key:notificationName:]([AVPropertyValuePublisher alloc], "initWithObject:key:notificationName:", a3, a4, a5);
}

uint64_t __66__AVPropertyValuePublisher_subscribeRequestingInitialValue_block___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend((id)objc_msgSend(a2, "object"), "valueForKey:", *(_QWORD *)(a1 + 32)));
}

- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4
{
  _BOOL4 v5;
  NSString *key;
  AVNotificationSubscription *v8;
  NSObject *object;
  NSString *notificationName;
  AVNotificationSubscription *v11;
  AVNotificationSubscription *v12;
  _QWORD v14[6];
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  key = self->_key;
  v8 = [AVNotificationSubscription alloc];
  object = self->_object;
  notificationName = self->_notificationName;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__AVPropertyValuePublisher_subscribeRequestingInitialValue_block___block_invoke;
  v14[3] = &unk_1E3032348;
  v14[4] = key;
  v14[5] = a4;
  v11 = -[AVNotificationSubscription initWithObject:notificationName:callbackBlock:](v8, "initWithObject:notificationName:callbackBlock:", object, notificationName, v14);
  if (v5)
    (*((void (**)(id, id))a4 + 2))(a4, -[NSObject valueForKey:](self->_object, "valueForKey:", key));
  v12 = v11;
  objc_destroyWeak(&location);
  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p key=%@, object=%@, notification=%@>"), objc_opt_class(), self, self->_key, self->_object, self->_notificationName);
}

@end
