@implementation PUPickerExtensionHostContext

- (void)_pickerDidSetOnboardingOverlayDismissed:(BOOL)a3
{
  PLDispatchOnMainQueue();
}

- (void)_pickerDidSetOnboardingHeaderDismissed:(BOOL)a3
{
  PLDispatchOnMainQueue();
}

- (void)_pickerDidSetModalInPresentation:(BOOL)a3
{
  PLDispatchOnMainQueue();
}

- (void)_pickerDidFinishPicking:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLDispatchOnMainQueue();

}

- (_PUPickerExtensionContextHostInterface)delegate
{
  return (_PUPickerExtensionContextHostInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __56__PUPickerExtensionHostContext__pickerDidFinishPicking___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidFinishPicking:", *(_QWORD *)(a1 + 40));

}

void __65__PUPickerExtensionHostContext__pickerDidSetModalInPresentation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidSetModalInPresentation:", *(unsigned __int8 *)(a1 + 40));

}

void __71__PUPickerExtensionHostContext__pickerDidSetOnboardingHeaderDismissed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidSetOnboardingHeaderDismissed:", *(unsigned __int8 *)(a1 + 40));

}

void __72__PUPickerExtensionHostContext__pickerDidSetOnboardingOverlayDismissed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pickerDidSetOnboardingOverlayDismissed:", *(unsigned __int8 *)(a1 + 40));

}

@end
