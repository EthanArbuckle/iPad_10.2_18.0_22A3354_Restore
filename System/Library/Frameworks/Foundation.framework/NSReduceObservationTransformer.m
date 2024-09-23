@implementation NSReduceObservationTransformer

+ (id)reduceValue:(id)a3 withReducer:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:initialValue:", a4, a3);
}

- (void)finishObserving
{
  id accumulator;
  uint64_t StackObservedValueClassAndBoxSize;
  uint64_t v5;
  Class v6;
  _DWORD *v7;
  objc_super v8;
  uint64_t v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  accumulator = self->_accumulator;
  v9 = 0;
  StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(&v9);
  MEMORY[0x1E0C80A78](StackObservedValueClassAndBoxSize);
  v7 = objc_constructInstance(v6, (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7[6] = 1;
  *((_QWORD *)v7 + 1) = accumulator;
  *((_QWORD *)v7 + 2) = self;
  v10.receiver = self;
  v10.super_class = (Class)NSReduceObservationTransformer;
  -[NSReduceObservationTransformer _receiveBox:](&v10, sel__receiveBox_, v7);
  v8.receiver = self;
  v8.super_class = (Class)NSReduceObservationTransformer;
  -[NSReduceObservationTransformer finishObserving](&v8, sel_finishObserving);
}

- (void)_receiveBox:(id)a3
{
  int v3;
  id accumulator;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *((_DWORD *)a3 + 6);
  if (v3 == 1)
  {
    accumulator = self->_accumulator;
    self->_accumulator = (id)(*((uint64_t (**)(void))self->_reducer + 2))();

  }
  else if (v3 == 3)
  {
    -[NSReduceObservationTransformer finishObserving](self, "finishObserving");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSReduceObservationTransformer;
    -[NSReduceObservationTransformer _receiveBox:](&v5, sel__receiveBox_);
  }
}

- (NSReduceObservationTransformer)initWithBlock:(id)a3 initialValue:(id)a4
{
  NSReduceObservationTransformer *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSReduceObservationTransformer;
  v6 = -[NSReduceObservationTransformer init](&v8, sel_init);
  if (v6)
  {
    v6->_reducer = (id)objc_msgSend(a3, "copy");
    v6->_accumulator = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSReduceObservationTransformer;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

@end
