@implementation LAPSPasscodeChangeUIPresentationController

- (LAPSPasscodeChangeUIPresentationController)initWithParentVC:(id)a3 containerVC:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeChangeUIPresentationController *v8;
  LAPSPasscodeChangeUIPresentationController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v11.receiver = self;
  v11.super_class = (Class)LAPSPasscodeChangeUIPresentationController;
  v8 = -[LAPSPasscodeChangeUIPresentationController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parentVC, v6);
    -[LAPSPasscodeChangeUIPresentationController _storeParentModalInPresentationFlag](v9, "_storeParentModalInPresentationFlag");
    objc_storeStrong((id *)&v9->_containerVC, a4);
  }

  return v9;
}

- (void)dismissWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  id WeakRetained;
  char isKindOfClass;
  void *v9;
  id v10;
  UIViewController **p_rootVC;
  id v12;
  id v13;
  int v14;
  LAPSPasscodeChangeUIPresentationController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LACLogPasscodeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = self;
    _os_log_impl(&dword_22FE91000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will dismiss UI", (uint8_t *)&v14, 0xCu);
  }

  -[LACUIContainerViewController resignFirstResponder](self->_containerVC, "resignFirstResponder");
  -[LACUIContainerViewController view](self->_containerVC, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[LAPSPasscodeChangeUIPresentationController _restoreParentModalInPresentationFlag](self, "_restoreParentModalInPresentationFlag");
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentVC);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[LACUIContainerViewController navigationItem](self->_containerVC, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BEBD410]);
    objc_msgSend(v10, "setTitle:", &stru_24FDCE800);
    objc_msgSend(v9, "setBackBarButtonItem:", v10);

LABEL_7:
    v4[2](v4);
    goto LABEL_8;
  }
  p_rootVC = &self->_rootVC;
  v12 = objc_loadWeakRetained((id *)p_rootVC);

  if (!v12)
    goto LABEL_7;
  v13 = objc_loadWeakRetained((id *)p_rootVC);
  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v4);

LABEL_8:
}

- (void)presentAlertVC:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  LACUIContainerViewController *WeakRetained;
  LACUIContainerViewController *v8;
  int v9;
  LAPSPasscodeChangeUIPresentationController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LACLogPasscodeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_22FE91000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will present %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[LACUIContainerViewController parentViewController](self->_containerVC, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    WeakRetained = self->_containerVC;
  else
    WeakRetained = (LACUIContainerViewController *)objc_loadWeakRetained((id *)&self->_parentVC);
  v8 = WeakRetained;

  -[LACUIContainerViewController resignFirstResponder](v8, "resignFirstResponder");
  -[LACUIContainerViewController presentViewController:animated:completion:](v8, "presentViewController:animated:completion:", v4, 1, &__block_literal_global_4);

}

- (void)presentVC:(id)a3 animated:(BOOL)a4
{
  id v6;
  NSObject *v7;
  LACUIContainerViewController *containerVC;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  LAPSPasscodeChangeUIPresentationController *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LACLogPasscodeService();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_22FE91000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will present %{public}@", buf, 0x16u);
  }

  -[LAPSPasscodeChangeUIPresentationController _setupParentVCIfNeededAnimated:](self, "_setupParentVCIfNeededAnimated:", 1);
  containerVC = self->_containerVC;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__LAPSPasscodeChangeUIPresentationController_presentVC_animated___block_invoke;
  v9[3] = &unk_24FDCE0A0;
  v10 = a4;
  v9[4] = self;
  -[LACUIContainerViewController presentViewController:transitionStyle:](containerVC, "presentViewController:transitionStyle:", v6, __65__LAPSPasscodeChangeUIPresentationController_presentVC_animated___block_invoke((uint64_t)v9));

}

BOOL __65__LAPSPasscodeChangeUIPresentationController_presentVC_animated___block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  if (!*(_BYTE *)(a1 + 40))
    return 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "currentViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (void)_storeParentModalInPresentationFlag
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentVC);
  self->_parentModalInPresentationOriginalFlag = objc_msgSend(WeakRetained, "isModalInPresentation");

}

- (void)_restoreParentModalInPresentationFlag
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentVC);
  objc_msgSend(WeakRetained, "setModalInPresentation:", self->_parentModalInPresentationOriginalFlag);

}

- (void)_setupParentVCIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;
  char isKindOfClass;
  LACUIContainerViewController *containerVC;
  void *v9;
  id v10;
  id obj;

  v3 = a3;
  -[LACUIContainerViewController parentViewController](self->_containerVC, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentVC);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      obj = objc_loadWeakRetained((id *)&self->_parentVC);
      objc_msgSend(obj, "setModalInPresentation:", 1);
      containerVC = self->_containerVC;
      objc_msgSend(obj, "viewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "pushViewController:animated:", containerVC, objc_msgSend(v9, "count") != 0);

      -[LACUIContainerViewController setParentViewController:](self->_containerVC, "setParentViewController:", obj);
    }
    else
    {
      obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE60840]), "initWithRootViewController:", self->_containerVC);
      objc_msgSend(obj, "setShouldTrackPreferredContentSize:", 0);
      objc_msgSend(obj, "setModalInPresentation:", 1);
      objc_msgSend(obj, "setModalPresentationStyle:", 2);
      v10 = objc_loadWeakRetained((id *)&self->_parentVC);
      objc_msgSend(v10, "presentViewController:animated:completion:", obj, v3, &__block_literal_global_7);

    }
    objc_storeWeak((id *)&self->_rootVC, obj);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerVC, 0);
  objc_destroyWeak((id *)&self->_rootVC);
  objc_destroyWeak((id *)&self->_parentVC);
}

@end
