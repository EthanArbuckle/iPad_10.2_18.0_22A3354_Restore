@implementation NSConcreteNotification

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteNotification;
  -[NSConcreteNotification dealloc](&v3, sel_dealloc);
}

- (NSConcreteNotification)initWithName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  NSConcreteNotification *v5;

  v5 = self;
  if (a3)
  {
    self->name = (NSString *)objc_msgSend(a3, "copy");
    v5->object = a4;
    v5->userInfo = (NSDictionary *)a5;
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)object
{
  return self->object;
}

- (id)name
{
  return self->name;
}

- (id)userInfo
{
  return self->userInfo;
}

@end
