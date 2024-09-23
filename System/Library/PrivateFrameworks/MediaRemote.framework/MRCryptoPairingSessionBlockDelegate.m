@implementation MRCryptoPairingSessionBlockDelegate

- (void)pairingSession:(id)a3 didPrepareExchangeData:(id)a4
{
  void (**dataExchangeBlock)(id, id, id);

  dataExchangeBlock = (void (**)(id, id, id))self->_dataExchangeBlock;
  if (dataExchangeBlock)
    dataExchangeBlock[2](dataExchangeBlock, a3, a4);
}

- (void)pairingSession:(id)a3 showSetupCode:(id)a4
{
  void (**showSetupCodeBlock)(id, id, id);

  showSetupCodeBlock = (void (**)(id, id, id))self->_showSetupCodeBlock;
  if (showSetupCodeBlock)
    showSetupCodeBlock[2](showSetupCodeBlock, a3, a4);
}

- (void)pairingSessionHideSetupCode:(id)a3
{
  void (**hideSetupCodeBlock)(id, id);

  hideSetupCodeBlock = (void (**)(id, id))self->_hideSetupCodeBlock;
  if (hideSetupCodeBlock)
    hideSetupCodeBlock[2](hideSetupCodeBlock, a3);
}

- (void)pairingSession:(id)a3 promptForSetupCodeWithCompletion:(id)a4
{
  void (**promptForSetupCodeBlock)(id, id, id, double);

  promptForSetupCodeBlock = (void (**)(id, id, id, double))self->_promptForSetupCodeBlock;
  if (promptForSetupCodeBlock)
    promptForSetupCodeBlock[2](promptForSetupCodeBlock, a3, a4, -1.0);
}

- (void)pairingSession:(id)a3 promptForSetupCodeWithDelay:(double)a4 completion:(id)a5
{
  void (**promptForSetupCodeBlock)(id, id, id, double);

  promptForSetupCodeBlock = (void (**)(id, id, id, double))self->_promptForSetupCodeBlock;
  if (promptForSetupCodeBlock)
    promptForSetupCodeBlock[2](promptForSetupCodeBlock, a3, a5, a4);
}

- (void)pairingSession:(id)a3 didCompleteExchangeWithError:(id)a4
{
  void (**exchangeCompleteBlock)(id, id, id);

  exchangeCompleteBlock = (void (**)(id, id, id))self->_exchangeCompleteBlock;
  if (exchangeCompleteBlock)
    exchangeCompleteBlock[2](exchangeCompleteBlock, a3, a4);
}

- (id)dataExchangeBlock
{
  return self->_dataExchangeBlock;
}

- (void)setDataExchangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)showSetupCodeBlock
{
  return self->_showSetupCodeBlock;
}

- (void)setShowSetupCodeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)hideSetupCodeBlock
{
  return self->_hideSetupCodeBlock;
}

- (void)setHideSetupCodeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)promptForSetupCodeBlock
{
  return self->_promptForSetupCodeBlock;
}

- (void)setPromptForSetupCodeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)exchangeCompleteBlock
{
  return self->_exchangeCompleteBlock;
}

- (void)setExchangeCompleteBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exchangeCompleteBlock, 0);
  objc_storeStrong(&self->_promptForSetupCodeBlock, 0);
  objc_storeStrong(&self->_hideSetupCodeBlock, 0);
  objc_storeStrong(&self->_showSetupCodeBlock, 0);
  objc_storeStrong(&self->_dataExchangeBlock, 0);
}

@end
