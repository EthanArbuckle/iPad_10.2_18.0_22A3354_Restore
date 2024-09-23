@implementation INUIVoiceShortcutHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerServingInterface](INUIVoiceShortcutXPCInterface, "remoteViewControllerServingInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerHostingInterface](INUIVoiceShortcutXPCInterface, "remoteViewControllerHostingInterface");
}

+ (id)_allowedItemPayloadClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (void)remoteViewControllerDidCancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__INUIVoiceShortcutHostContext_remoteViewControllerDidCancel__block_invoke;
  block[3] = &unk_1EA43A918;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)remoteViewControllerDidCreateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__INUIVoiceShortcutHostContext_remoteViewControllerDidCreateVoiceShortcut_error___block_invoke;
  block[3] = &unk_1EA43A4D8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__INUIVoiceShortcutHostContext_remoteViewControllerDidUpdateVoiceShortcut_error___block_invoke;
  block[3] = &unk_1EA43A4D8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__INUIVoiceShortcutHostContext_remoteViewControllerDidDeleteVoiceShortcutWithIdentifier___block_invoke;
  v6[3] = &unk_1EA43A968;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (INUIVoiceShortcutRemoteHostingInterface)delegate
{
  return (INUIVoiceShortcutRemoteHostingInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __89__INUIVoiceShortcutHostContext_remoteViewControllerDidDeleteVoiceShortcutWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:", *(_QWORD *)(a1 + 40));

}

void __81__INUIVoiceShortcutHostContext_remoteViewControllerDidUpdateVoiceShortcut_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerDidUpdateVoiceShortcut:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __81__INUIVoiceShortcutHostContext_remoteViewControllerDidCreateVoiceShortcut_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerDidCreateVoiceShortcut:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __61__INUIVoiceShortcutHostContext_remoteViewControllerDidCancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "remoteViewControllerDidCancel");

}

@end
