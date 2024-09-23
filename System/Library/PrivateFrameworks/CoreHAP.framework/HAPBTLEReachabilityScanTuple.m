@implementation HAPBTLEReachabilityScanTuple

- (id)completion
{
  return self->_completion;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
}

+ (id)reachabilityScanTupleWithCompletion:(id)a3 workQueue:(id)a4 identifier:(id)a5
{
  OS_dispatch_queue *v7;
  NSString *v8;
  id v9;
  HAPBTLEReachabilityScanTuple *v10;
  uint64_t v11;
  id completion;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v14;
  NSString *identifier;

  v7 = (OS_dispatch_queue *)a4;
  v8 = (NSString *)a5;
  v9 = a3;
  v10 = objc_alloc_init(HAPBTLEReachabilityScanTuple);
  v11 = MEMORY[0x1D17B7400](v9);

  completion = v10->_completion;
  v10->_completion = (id)v11;

  queue = v10->_queue;
  v10->_queue = v7;
  v14 = v7;

  identifier = v10->_identifier;
  v10->_identifier = v8;

  return v10;
}

@end
