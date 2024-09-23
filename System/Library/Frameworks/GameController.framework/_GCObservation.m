@implementation _GCObservation

- (_GCObservation)initWithCleanupHandler:(id)a3
{
  id v4;
  _GCObservation *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCObservation;
  v5 = -[_GCObservation init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x2199DEBB0](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  void (**handler)(id, SEL);
  objc_super v4;

  handler = (void (**)(id, SEL))self->_handler;
  if (handler)
    handler[2](handler, a2);
  v4.receiver = self;
  v4.super_class = (Class)_GCObservation;
  -[_GCObservation dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
