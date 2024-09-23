@implementation HDSessionAssertionWrapper

- (HDSessionAssertionWrapper)initWithCreateAndTakeBlock:(id)a3
{
  id v4;
  HDSessionAssertionWrapper *v5;
  void *v6;
  id createAndTakeBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSessionAssertionWrapper;
  v5 = -[HDSessionAssertionWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    createAndTakeBlock = v5->_createAndTakeBlock;
    v5->_createAndTakeBlock = v6;

  }
  return v5;
}

- (void)dealloc
{
  HDAssertion *currentAssertion;
  objc_super v4;

  -[HDAssertion invalidate](self->_currentAssertion, "invalidate");
  currentAssertion = self->_currentAssertion;
  self->_currentAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)HDSessionAssertionWrapper;
  -[HDSessionAssertionWrapper dealloc](&v4, sel_dealloc);
}

- (BOOL)taken
{
  return -[HDAssertion state](self->_currentAssertion, "state") == 2;
}

- (id)createAndTakeBlock
{
  return self->_createAndTakeBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createAndTakeBlock, 0);
  objc_storeStrong((id *)&self->_currentAssertion, 0);
}

@end
