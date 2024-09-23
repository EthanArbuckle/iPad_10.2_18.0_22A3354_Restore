@implementation BEContextMenuConfiguration

- (BEContextMenuConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BEContextMenuConfiguration;
  return -[UIContextMenuConfiguration init](&v3, sel_init);
}

- (void)_prepareWithCompletion:(id)a3
{
  id v4;
  _BEBurnableBlock *v5;
  _BEBurnableBlock *deferredCompletion;

  v4 = a3;
  v5 = -[_BEBurnableBlock initWithTimeout:block:defaultInputProvider:]([_BEBurnableBlock alloc], "initWithTimeout:block:defaultInputProvider:", v4, 0, 0.5);

  deferredCompletion = self->_deferredCompletion;
  self->_deferredCompletion = v5;

}

- (BOOL)fulfillUsingConfiguration:(id)a3
{
  BOOL v4;
  _BEBurnableBlock *deferredCompletion;

  v4 = -[_BEBurnableBlock performWithInput:](self->_deferredCompletion, "performWithInput:", a3);
  deferredCompletion = self->_deferredCompletion;
  self->_deferredCompletion = 0;

  return v4;
}

+ (id)configurationWithIdentifier:(id)a3 previewProvider:(id)a4 actionProvider:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredCompletion, 0);
}

@end
