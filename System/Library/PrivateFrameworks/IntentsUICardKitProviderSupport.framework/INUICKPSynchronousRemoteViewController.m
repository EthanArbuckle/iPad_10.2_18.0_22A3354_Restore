@implementation INUICKPSynchronousRemoteViewController

+ (void)requestInstanceWithInfo:(id)a3 configuration:(id)a4 synchronousRemoteViewControllerDelegate:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  objc_msgSend(v14, "setDelegate:", v12);

  v15 = (void *)MEMORY[0x24BDDA510];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke;
  v19[3] = &unk_24EB4F260;
  v21 = v10;
  v22 = v11;
  v20 = v14;
  v16 = v10;
  v17 = v14;
  v18 = v11;
  objc_msgSend(v15, "requestRemoteViewControllerWithRequestInfo:reply:", v13, v19);

}

void __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(id, _QWORD, void *);
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_2;
    v9[3] = &unk_24EB4F238;
    v10 = a1[4];
    v11 = v5;
    v12 = a1[5];
    v13 = a1[6];
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
  else
  {
    v8 = (void (**)(id, _QWORD, void *))a1[6];
    if (v8)
      v8[2](v8, 0, v7);
  }

}

void __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_2(id *a1)
{
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id location;

  objc_msgSend(a1[4], "setRemoteViewController:", a1[5]);
  objc_msgSend(a1[5], "setInheritsSecurity:", 1);
  objc_msgSend(a1[5], "setServiceViewShouldShareTouchesWithHost:", 1);
  objc_initWeak(&location, a1[5]);
  v3 = a1[4];
  v2 = a1[5];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_3;
  v4[3] = &unk_24EB4F210;
  objc_copyWeak(&v8, &location);
  v5 = a1[6];
  v7 = a1[7];
  v6 = a1[4];
  objc_msgSend(v2, "setDelegate:completion:", v3, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_4;
    v4[3] = &unk_24EB4F1E8;
    v6 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "setIdealConfiguration:animated:completion:", v3, 0, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (void)loadView
{
  INUICKPSynchronousRemoteView *v3;

  v3 = objc_alloc_init(INUICKPSynchronousRemoteView);
  -[INUICKPSynchronousRemoteView setDelegate:](v3, "setDelegate:", self);
  -[INUICKPSynchronousRemoteViewController setView:](self, "setView:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRemoteViewController:(id)a3
{
  INUIRemoteViewController *v5;
  INUIRemoteViewController **p_remoteViewController;
  INUIRemoteViewController *remoteViewController;
  void *v8;
  void *v9;
  void *v10;
  INUIRemoteViewController *v11;

  v5 = (INUIRemoteViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  v11 = v5;
  if (remoteViewController != v5)
  {
    -[INUIRemoteViewController removeFromParentViewController](remoteViewController, "removeFromParentViewController");
    -[INUIRemoteViewController view](*p_remoteViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[INUIRemoteViewController didMoveToParentViewController:](*p_remoteViewController, "didMoveToParentViewController:", 0);
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    if (*p_remoteViewController)
    {
      -[INUICKPSynchronousRemoteViewController addChildViewController:](self, "addChildViewController:");
      -[INUICKPSynchronousRemoteViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[INUIRemoteViewController view](*p_remoteViewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

      -[INUIRemoteViewController didMoveToParentViewController:](*p_remoteViewController, "didMoveToParentViewController:", self);
    }
  }

}

- (NSSet)cachedRepresentedParameters
{
  void *v2;
  void *v3;
  void *v4;

  -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)_interaction
{
  void *v2;
  void *v3;
  void *v4;

  -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_minimumSizesBySystemVersion
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[INUICKPSynchronousRemoteViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingWidthForSynchronousRemoteViewController:", self);
  v5 = v4;

  v10[0] = &unk_24EB52610;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v5, 120.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = &unk_24EB52628;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v5, 20.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)remoteViewControllerServiceDidTerminate:(id)a3
{
  void *v4;

  v4 = (void *)*MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
    -[INUICKPSynchronousRemoteViewController remoteViewControllerServiceDidTerminate:].cold.1(v4, self);
}

- (id)maximumSizesBySystemVersionForRemoteViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];
  CGRect v15;

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[INUICKPSynchronousRemoteViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingWidthForSynchronousRemoteViewController:", self);
  v6 = v5;

  v13[0] = &unk_24EB52610;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v6, 200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = &unk_24EB52628;
  v14[0] = v7;
  v8 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "valueWithCGSize:", v6, CGRectGetHeight(v15));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)interfaceSectionsForRemoteViewController:(id)a3
{
  void *v3;
  void *v4;

  -[INUICKPSynchronousRemoteViewController interfaceSectionOrganizer](self, "interfaceSectionOrganizer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "organizedInterfaceSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)preferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "preferredContentSize");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[INUICKPSynchronousRemoteViewController _minimumSizesBySystemVersion](self, "_minimumSizesBySystemVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _INUIUtilitiesBestFittingSizeForSizeBySystemVersionDictionary();
    v6 = v10;
    v8 = v11;

  }
  v12 = v6;
  v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate
{
  return (CRKCardSectionViewControllingDelegate *)objc_loadWeakRetained((id *)&self->cardSectionViewControllingDelegate);
}

- (void)setCardSectionViewControllingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->cardSectionViewControllingDelegate, a3);
}

- (INUIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (INUICKPInterfaceSectionOrganizing)interfaceSectionOrganizer
{
  return (INUICKPInterfaceSectionOrganizing *)objc_loadWeakRetained((id *)&self->_interfaceSectionOrganizer);
}

- (void)setInterfaceSectionOrganizer:(id)a3
{
  objc_storeWeak((id *)&self->_interfaceSectionOrganizer, a3);
}

- (INUICKPSynchronousRemoteViewControllerDelegate)delegate
{
  return (INUICKPSynchronousRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_interfaceSectionOrganizer);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->cardSectionViewControllingDelegate);
}

- (void)remoteViewControllerServiceDidTerminate:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "_interaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "cachedRepresentedParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_222C18000, v3, OS_LOG_TYPE_ERROR, "IntentsUI remote view controller did terminate\n    Interaction: %@\n    Parameters: %@", (uint8_t *)&v6, 0x16u);

}

@end
