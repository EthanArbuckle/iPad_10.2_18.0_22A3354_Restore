@implementation NSConcreteOrderedSetChange

- (NSConcreteOrderedSetChange)initWithType:(unint64_t)a3 sourceIndex:(unint64_t)a4 destinationIndex:(unint64_t)a5 value:(id)a6
{
  NSConcreteOrderedSetChange *v10;
  NSConcreteOrderedSetChange *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)NSConcreteOrderedSetChange;
  v10 = -[NSConcreteOrderedSetChange init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_changeType = a3;
    v10->_sourceIndex = a4;
    v10->_destinationIndex = a5;
    v10->_value = a6;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteOrderedSetChange;
  -[NSConcreteOrderedSetChange dealloc](&v3, sel_dealloc);
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (unint64_t)sourceIndex
{
  return self->_sourceIndex;
}

- (unint64_t)destinationIndex
{
  return self->_destinationIndex;
}

- (id)value
{
  return self->_value;
}

@end
