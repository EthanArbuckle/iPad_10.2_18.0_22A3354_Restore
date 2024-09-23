@implementation _PFAutoreleasePoolThunk

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)MEMORY[0x18D76B4E4](self, a2);
  (*((void (**)(void))self->_action + 2))();
  _Block_release(self->_action);
  objc_autoreleasePoolPop(v3);
  v4.receiver = self;
  v4.super_class = (Class)_PFAutoreleasePoolThunk;
  -[_PFAutoreleasePoolThunk dealloc](&v4, sel_dealloc);
}

+ (_QWORD)thunkWithBlock:(uint64_t)a1
{
  id v3;

  v3 = objc_alloc((Class)objc_opt_self());
  return -[_PFAutoreleasePoolThunk initWithBlock:](v3, a2);
}

- (_QWORD)initWithBlock:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)_PFAutoreleasePoolThunk;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = _Block_copy(a2);
  return v3;
}

@end
