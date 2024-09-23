@implementation CSRemoteContentHostViewController

- (void)configureWithDefinition:(id)a3
{
  id v5;
  SBSRemoteContentDefinition **p_definition;
  CGSize v7;
  xpc_object_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_definition = &self->_definition;
  objc_storeStrong((id *)&self->_definition, a3);
  v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_contentFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_contentFrame.size = v7;
  v8 = xpc_dictionary_create(0, 0, 0);
  -[CSRemoteContentHostViewController _customContentBounds](self, "_customContentBounds");
  BSSerializeCGRectToXPCDictionaryWithKey();
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteContentDefinition userInfo](self->_definition, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSRemoteContentDefinition xpcEndpoint](self->_definition, "xpcEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithUserInfo:contentBounds:endpoint:", v10, v8, v11);

  SBLogDashBoard();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[SBSRemoteContentDefinition userInfo](*p_definition, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSRemoteContentDefinition xpcEndpoint](*p_definition, "xpcEndpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEFAULT, "[RemoteContent] CSRemoteContentHostViewController configuring with user info: %@, endpoint: %@", (uint8_t *)&v15, 0x16u);

  }
  -[CSRemoteContentHostViewController _fetchContentPreferences](self, "_fetchContentPreferences");

}

- (SBSRemoteContentPreferences)contentPreferences
{
  return self->_contentPreferences;
}

- (void)didDismissForDismissType:(int64_t)a3
{
  id v4;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDismissForDismissType:", a3);

}

- (void)hostDidChangeContentBounds
{
  id v2;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangeContentBounds");

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CSRemoteContentHostViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)getContentBoundsWithReplyBlock:(id)a3
{
  void (**v4)(id, id);
  id v5;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    v5 = xpc_dictionary_create(0, 0, 0);
    -[CSRemoteContentHostViewController _customContentBounds](self, "_customContentBounds");
    BSSerializeCGRectToXPCDictionaryWithKey();
    v4[2](v4, v5);

  }
}

- (void)presentAlert:(id)a3 replyBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v22;
  id obj;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, objc_msgSend(v5, "preferredStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = v5;
  objc_msgSend(v5, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E0CEA2E0];
        objc_msgSend(v15, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "style");
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __61__CSRemoteContentHostViewController_presentAlert_replyBlock___block_invoke;
        v24[3] = &unk_1E8E30790;
        v19 = v6;
        v24[4] = v15;
        v25 = v19;
        objc_msgSend(v16, "actionWithTitle:style:handler:", v17, v18, v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v20);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  -[CSRemoteContentHostViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

uint64_t __61__CSRemoteContentHostViewController_presentAlert_replyBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogDashBoard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D0337000, v5, OS_LOG_TYPE_DEFAULT, "[RemoteContent] CSRemoteContentHostViewController client process terminated: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "remoteContentHostViewController:didTerminateWithError:", self, v4);
  }
  else
  {
    SBLogDashBoard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D0337000, v8, OS_LOG_TYPE_DEFAULT, "[RemoteContent] unhandled termination for nil delegate", (uint8_t *)&v9, 2u);
    }

  }
}

+ (id)serviceViewControllerInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC8C330);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C812F8], sel_getInlinePresentationContentFrameWithReplyBlock_, 0, 1);
  return v2;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC72668);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_fetchContentPreferences
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__CSRemoteContentHostViewController__fetchContentPreferences__block_invoke;
  v5[3] = &unk_1E8E307B8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = (void *)MEMORY[0x1D17E1614](v5);
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getContentPreferencesWithReplyBlock:", v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__CSRemoteContentHostViewController__fetchContentPreferences__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "_updateContentPreferences:", v3);
  }
  else
  {
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Ignoring nil remote preferences", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_updateContentPreferences:(id)a3
{
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_contentPreferences, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didChangeRemotePreferences:", v6);
  if (objc_msgSend(WeakRetained, "prefersInlineForPreferences:", v6))
    -[CSRemoteContentHostViewController _fetchInlinePresentationContentFrame](self, "_fetchInlinePresentationContentFrame");

}

- (CGRect)_customContentBounds
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v3 = -[CSRemoteContentHostViewController interfaceOrientation](self, "interfaceOrientation");
  +[CSContentCutoutBoundsCalculator modalContentCutoutBoundsForInterfaceOrientation:](CSContentCutoutBoundsCalculator, "modalContentCutoutBoundsForInterfaceOrientation:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((unint64_t)(v3 - 1) <= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteContentComplicationHeightInset");
    v14 = v13;

    v7 = v7 + v14;
    v11 = v11 - v14;
  }
  v15 = v5;
  v16 = v7;
  v17 = v9;
  v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_fetchInlinePresentationContentFrame
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__CSRemoteContentHostViewController__fetchInlinePresentationContentFrame__block_invoke;
  v4[3] = &unk_1E8E307E0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "getInlinePresentationContentFrameWithReplyBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __73__CSRemoteContentHostViewController__fetchInlinePresentationContentFrame__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    objc_msgSend(WeakRetained, "_updateContentFrame:");
  }

}

- (void)_updateContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_contentFrame;
  id WeakRetained;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentFrame = &self->_contentFrame;
  if (!CGRectEqualToRect(self->_contentFrame, a3))
  {
    p_contentFrame->origin.x = x;
    p_contentFrame->origin.y = y;
    p_contentFrame->size.width = width;
    p_contentFrame->size.height = height;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didChangeRemoteHostContentFrame:", x, y, width, height);

  }
}

- (CSRemoteContentHostDelegate)delegate
{
  return (CSRemoteContentHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContentPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_contentPreferences, a3);
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (SBSRemoteContentDefinition)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_definition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_contentPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
