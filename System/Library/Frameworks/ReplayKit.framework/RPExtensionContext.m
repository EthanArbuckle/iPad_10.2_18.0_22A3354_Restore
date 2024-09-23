@implementation RPExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D68580);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Requested vendor protocol", v3, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D882D8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Set endpoint", v9, 2u);
  }
  -[RPExtensionContext delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionContext:setEndpoint:", self, v6);

  v7[2](v7);
}

- (RPExtensionContextDelegate)delegate
{
  return (RPExtensionContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
