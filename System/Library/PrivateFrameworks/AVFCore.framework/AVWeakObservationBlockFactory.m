@implementation AVWeakObservationBlockFactory

uint64_t __83__AVWeakObservationBlockFactory_weakObservationBlockForWeakObserver_passedToBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

+ (id)weakObservationBlockForWeakObserver:(id)a3 passedToBlock:(id)a4
{
  AVWeakReference *v5;
  void *v6;
  _QWORD v8[6];

  v5 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__AVWeakObservationBlockFactory_weakObservationBlockForWeakObserver_passedToBlock___block_invoke;
  v8[3] = &unk_1E3035720;
  v8[4] = v5;
  v8[5] = a4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

@end
