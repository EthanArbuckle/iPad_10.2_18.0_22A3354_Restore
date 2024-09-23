@implementation GKExtensionHostContext

- (void)messageFromExtension:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__GKExtensionHostContext_messageFromExtension___block_invoke;
  v6[3] = &unk_1E59C4708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __47__GKExtensionHostContext_messageFromExtension___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageFromExtension:", *(_QWORD *)(a1 + 40));

}

- (GKExtensionRemoteViewController)remoteViewController
{
  return (GKExtensionRemoteViewController *)objc_loadWeakRetained((id *)&self->_remoteViewController);
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeWeak((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteViewController);
}

@end
