@implementation _BSCompoundAssertionAcquisitionRecord

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_reference);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_assertion);
}

- (void)setContext:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)assertion
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
  return WeakRetained;
}

@end
