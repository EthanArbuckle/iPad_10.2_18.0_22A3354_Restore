@implementation _NSXPCBoost

- (_QWORD)_initWithEvent:(void *)a1
{
  _QWORD *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)_NSXPCBoost;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  v3[1] = xpc_retain(a2);
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  xpc_release(self->_event);
  v3.receiver = self;
  v3.super_class = (Class)_NSXPCBoost;
  -[_NSXPCBoost dealloc](&v3, sel_dealloc);
}

@end
