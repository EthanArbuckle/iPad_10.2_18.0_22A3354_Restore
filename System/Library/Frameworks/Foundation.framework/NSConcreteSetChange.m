@implementation NSConcreteSetChange

- (NSConcreteSetChange)initWithType:(unint64_t)a3 object:(id)a4
{
  NSConcreteSetChange *v6;
  NSConcreteSetChange *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteSetChange;
  v6 = -[NSConcreteSetChange init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_changeType = a3;
    v6->_value = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteSetChange;
  -[NSConcreteSetChange dealloc](&v3, sel_dealloc);
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (id)value
{
  return self->_value;
}

@end
