@implementation DDParsecRemoteCollectionViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

+ (id)serviceViewControllerInterface
{
  return _ddui_parsec_xpcInterface(1);
}

+ (id)exportedInterface
{
  return _ddui_parsec_xpcInterface(0);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDParsecRemoteCollectionViewController viewServiceDidTerminateWithError:].cold.1(v4);
  -[DDParsecRemoteCollectionViewController interactionEndedWithPunchout:](self, "interactionEndedWithPunchout:", 0);
  v5.receiver = self;
  v5.super_class = (Class)DDParsecRemoteCollectionViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v5, sel_viewServiceDidTerminateWithError_, v4);

}

- (void)interactionEnded
{
  -[DDParsecRemoteCollectionViewController interactionEndedWithPunchout:](self, "interactionEndedWithPunchout:", 0);
}

- (void)interactionEndedWithPunchout:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (!self->_receivedInteractionDidFinish)
  {
    v3 = a3;
    self->_receivedInteractionDidFinish = 1;
    -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactionEndedWithPunchout:", v3);

  }
}

- (void)reportAnIssueWithReportIdentifier:(id)a3 sfReportData:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportAnIssueWithReportIdentifier:sfReportData:", v7, v6);

}

- (void)loadReportAnIssueImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadReportAnIssueImage:", v4);

}

- (void)showingErrorView:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__DDParsecRemoteCollectionViewController_showingErrorView___block_invoke;
  v3[3] = &unk_1E4258288;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __59__DDParsecRemoteCollectionViewController_showingErrorView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "hostSideDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showingErrorView:", *(unsigned __int8 *)(a1 + 40));

}

- (void)showingFTE:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__DDParsecRemoteCollectionViewController_showingFTE___block_invoke;
  v3[3] = &unk_1E4258288;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __53__DDParsecRemoteCollectionViewController_showingFTE___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "hostSideDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showingFTE:", *(unsigned __int8 *)(a1 + 40));

}

- (void)openParsecURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openParsecURL:", v4);

}

- (void)getStatusBarHidden:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getStatusBarHidden:", v4);

}

- (void)openTrailerPunchout:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openTrailerPunchout:", v4);

}

- (void)performClientQueryWithServerAccessPermitted:(BOOL)a3 localSearchPermitted:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performClientQueryWithServerAccessPermitted:localSearchPermitted:", v5, v4);

}

- (void)performClientTextQueryWithTerm:(id)a3 queryId:(unint64_t)a4 sessionId:(id)a5 userAgent:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performClientTextQueryWithTerm:queryId:sessionId:userAgent:reply:", v15, a4, v14, v13, v12);

}

- (void)remoteVCIsReady
{
  id v2;

  -[DDParsecRemoteCollectionViewController hostSideDelegate](self, "hostSideDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteVCIsReady");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (DDParsecHostVCInterface)hostSideDelegate
{
  return (DDParsecHostVCInterface *)objc_loadWeakRetained((id *)&self->_hostSideDelegate);
}

- (void)setHostSideDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hostSideDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostSideDelegate);
}

- (void)viewServiceDidTerminateWithError:(void *)a1 .cold.1(void *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = objc_msgSend(a1, "code");
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "View service did terminate (reason:%ld)", (uint8_t *)&v1, 0xCu);
}

@end
