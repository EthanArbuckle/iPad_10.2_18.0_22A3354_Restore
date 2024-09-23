@implementation __NSCFURLLocalStreamTaskWorkBlockOp

- (void)dealloc
{
  id block;
  objc_super v4;

  block = self->_block;
  if (block)
  {
    _Block_release(block);
    self->_block = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)__NSCFURLLocalStreamTaskWorkBlockOp;
  -[__NSCFURLLocalStreamTaskWorkBlockOp dealloc](&v4, sel_dealloc);
}

+ (_QWORD)opWithBlock:(uint64_t)a3 description:
{
  __NSCFURLLocalStreamTaskWorkBlockOp *v5;
  uint64_t v6;
  _QWORD *v7;

  objc_opt_self();
  v5 = [__NSCFURLLocalStreamTaskWorkBlockOp alloc];
  if (!v5)
  {
    v7 = 0;
    if (!a2)
      return v7;
    goto LABEL_5;
  }
  v6 = -[__NSCFURLLocalStreamTaskWorkBlockOp init](v5, "init");
  v7 = (_QWORD *)v6;
  if (v6)
    *(_QWORD *)(v6 + 8) = a3;
  if (a2)
LABEL_5:
    v7[6] = _Block_copy(a2);
  return v7;
}

@end
