@implementation FANavigationController

- (BOOL)_isEmpty
{
  void *v2;
  BOOL v3;

  -[FANavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v4 = a4;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[FANavigationController _isEmpty](self, "_isEmpty"))
  {
    v9[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FANavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v7, 0);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FANavigationController;
    -[FANavigationController pushViewController:animated:](&v8, sel_pushViewController_animated_, v6, v4);
  }

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  if (-[FANavigationController _isEmpty](self, "_isEmpty"))
  {
    v7 = objc_msgSend(v6, "count");
    if (v7)
      v8 = 0;
    else
      v8 = v4;
    v11.receiver = self;
    v11.super_class = (Class)FANavigationController;
    -[FANavigationController setViewControllers:animated:](&v11, sel_setViewControllers_animated_, v6, v8);
    if (v7)
    {
      -[FANavigationController familyDelegate](self, "familyDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigationController:didPresentInitialViewController:", self, v10);

    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)FANavigationController;
    -[FANavigationController setViewControllers:animated:](&v11, sel_setViewControllers_animated_, v6, v4);
  }

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[FANavigationController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v12.receiver = self;
    v12.super_class = (Class)FANavigationController;
    -[FANavigationController presentViewController:animated:completion:](&v12, sel_presentViewController_animated_completion_, v8, v6, v9);
  }
  else
  {
    -[FANavigationController familyDelegate](self, "familyDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController:presentViewController:", self, v8);

  }
}

- (FANavigationControllerDelegate)familyDelegate
{
  return (FANavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_familyDelegate);
}

- (void)setFamilyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_familyDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_familyDelegate);
}

@end
