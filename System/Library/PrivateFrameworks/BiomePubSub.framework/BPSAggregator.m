@implementation BPSAggregator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_closure, 0);
  objc_storeStrong(&self->_accumulator, 0);
}

- (id)closure
{
  return self->_closure;
}

- (id)accumulator
{
  return self->_accumulator;
}

- (BPSAggregator)initWithAccumulator:(id)a3 closure:(id)a4
{
  id v7;
  id v8;
  BPSAggregator *v9;
  BPSAggregator *v10;
  void *v11;
  id closure;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSAggregator;
  v9 = -[BPSAggregator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_accumulator, a3);
    v11 = _Block_copy(v8);
    closure = v10->_closure;
    v10->_closure = v11;

  }
  return v10;
}

@end
