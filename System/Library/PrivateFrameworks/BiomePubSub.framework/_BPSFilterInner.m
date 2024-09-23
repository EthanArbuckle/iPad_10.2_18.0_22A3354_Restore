@implementation _BPSFilterInner

- (_BPSFilterInner)initWithDownstream:(id)a3 isIncluded:(id)a4
{
  id v6;
  _BPSFilterInner *v7;
  uint64_t v8;
  id isIncluded;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSFilterInner;
  v7 = -[BPSFilterProducer initWithDownstream:](&v11, sel_initWithDownstream_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    isIncluded = v7->_isIncluded;
    v7->_isIncluded = (id)v8;

  }
  return v7;
}

- (id)receiveNewValue:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  int v6;
  id v7;
  BPSPartialCompletion *v8;

  v4 = a3;
  -[_BPSFilterInner isIncluded](self, "isIncluded");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v4);

  if (v6)
    v7 = v4;
  else
    v7 = 0;
  v8 = -[BPSPartialCompletion initWithState:value:error:]([BPSPartialCompletion alloc], "initWithState:value:error:", 1, v7, 0);

  return v8;
}

- (id)isIncluded
{
  return self->_isIncluded;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isIncluded, 0);
}

@end
