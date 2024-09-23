@implementation _BPSRemoveDuplicatesInner

- (_BPSRemoveDuplicatesInner)initWithDownstream:(id)a3 isDuplicate:(id)a4
{
  id v6;
  _BPSRemoveDuplicatesInner *v7;
  uint64_t v8;
  id isDuplicate;
  id last;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BPSRemoveDuplicatesInner;
  v7 = -[BPSFilterProducer initWithDownstream:](&v12, sel_initWithDownstream_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    isDuplicate = v7->_isDuplicate;
    v7->_isDuplicate = (id)v8;

    last = v7->_last;
    v7->_last = 0;

  }
  return v7;
}

- (id)receiveNewValue:(id)a3
{
  id v5;
  id v6;
  BPSPartialCompletion *v7;

  v5 = a3;
  if (self->_last && ((*((uint64_t (**)(void))self->_isDuplicate + 2))() & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_storeStrong(&self->_last, a3);
    v6 = v5;
  }
  v7 = -[BPSPartialCompletion initWithState:value:error:]([BPSPartialCompletion alloc], "initWithState:value:error:", 1, v6, 0);

  return v7;
}

- (id)isDuplicate
{
  return self->_isDuplicate;
}

- (id)last
{
  return self->_last;
}

- (void)setLast:(id)a3
{
  objc_storeStrong(&self->_last, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_last, 0);
  objc_storeStrong(&self->_isDuplicate, 0);
}

@end
