@implementation _BPSReduceInner

- (_BPSReduceInner)initWithDownstream:(id)a3 initial:(id)a4 reduce:(id)a5
{
  id v8;
  _BPSReduceInner *v9;
  uint64_t v10;
  id reduce;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_BPSReduceInner;
  v9 = -[BPSReduceProducer initWithDownstream:initial:reduce:](&v13, sel_initWithDownstream_initial_reduce_, a3, a4, v8);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    reduce = v9->_reduce;
    v9->_reduce = (id)v10;

  }
  return v9;
}

- (id)receiveNewValue:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  BPSPartialCompletion *v8;
  void *v9;
  BPSPartialCompletion *v10;

  v4 = a3;
  -[_BPSReduceInner reduce](self, "reduce");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[BPSReduceProducer result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BPSReduceProducer setResult:](self, "setResult:", v7);
  v8 = [BPSPartialCompletion alloc];
  -[BPSReduceProducer result](self, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BPSPartialCompletion initWithState:value:error:](v8, "initWithState:value:error:", 1, v9, 0);

  return v10;
}

- (id)reduce
{
  return self->_reduce;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reduce, 0);
}

@end
