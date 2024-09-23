@implementation BWMemoryPoolFlushAssertion

- (_QWORD)initWithIdentifier:(void *)a3 pool:
{
  _QWORD *v5;
  uint64_t v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)BWMemoryPoolFlushAssertion;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(a2, "copy");
    v5[1] = a3;
    v5[2] = v6;
    objc_msgSend(a3, "_addFlushAssertion");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BWMemoryPool _removeFlushAssertion](self->_pool, "_removeFlushAssertion");

  v3.receiver = self;
  v3.super_class = (Class)BWMemoryPoolFlushAssertion;
  -[BWMemoryPoolFlushAssertion dealloc](&v3, sel_dealloc);
}

@end
