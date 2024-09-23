@implementation CATransactionCompletionItem

- (CATransactionCompletionItem)init
{
  CATransactionCompletionItem *result;
  uint64_t v3;
  _QWORD *v4;
  unsigned int *v5;
  unsigned int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CATransactionCompletionItem;
  result = -[CATransactionCompletionItem init](&v7, sel_init);
  if (result)
  {
    v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (v3)
    {
      v4 = (_QWORD *)(v3 + 88);
      while (1)
      {
        v4 = (_QWORD *)*v4;
        if (!v4)
          break;
        v5 = (unsigned int *)v4[1];
        if (v5)
        {
          do
            v6 = __ldaxr(v5);
          while (__stlxr(v6 + 1, v5));
          result->_priv = v5;
          break;
        }
      }
    }
    if (!result->_priv)
    {

      return 0;
    }
  }
  return result;
}

- (void)invalidate
{
  CA::Transaction::Continuation *priv;

  priv = (CA::Transaction::Continuation *)self->_priv;
  if (priv)
  {
    CA::Transaction::Continuation::unref(priv);
    self->_priv = 0;
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[CATransactionCompletionItem invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CATransactionCompletionItem;
  -[CATransactionCompletionItem dealloc](&v3, sel_dealloc);
}

+ (id)completionItem
{
  return objc_alloc_init((Class)a1);
}

@end
