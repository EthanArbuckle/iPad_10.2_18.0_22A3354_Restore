@implementation StepperViewController

- (StepperViewController)initWithStepperController:(id)a3
{
  id v5;
  StepperViewController *v6;
  StepperViewController *v7;
  StepperViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)StepperViewController;
  v6 = -[StepperViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stepperController, a3);
    -[StepperViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 4);
    -[StepperViewController setTransitioningDelegate:](v7, "setTransitioningDelegate:", v7);
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  SFStepperView *v9;
  SFStepperView *stepperView;

  v3 = objc_alloc(MEMORY[0x1E0D4ED78]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v9 = (SFStepperView *)objc_msgSend(v3, "initWithFrame:includingResetButton:", objc_opt_respondsToSelector() & 1, v5, v6, v7, v8);
  stepperView = self->_stepperView;
  self->_stepperView = v9;

  -[SFStepperView setAutoresizingMask:](self->_stepperView, "setAutoresizingMask:", 18);
  -[StepperViewController setView:](self, "setView:", self->_stepperView);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)StepperViewController;
  -[StepperViewController viewDidLoad](&v39, sel_viewDidLoad);
  objc_initWeak(&location, self);
  -[SFStepperView decrementButton](self->_stepperView, "decrementButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3428];
  v5 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __36__StepperViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E9CF2C28;
  objc_copyWeak(&v37, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, 0, 0, v36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:forControlEvents:", v6, 0x2000);

  -[SFStepperView resetButton](self->_stepperView, "resetButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v7 = (void *)MEMORY[0x1E0DC3428];
    v34[0] = v5;
    v34[1] = 3221225472;
    v34[2] = __36__StepperViewController_viewDidLoad__block_invoke_2;
    v34[3] = &unk_1E9CF2C28;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, 0, 0, v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:forControlEvents:", v8, 0x2000);

    objc_destroyWeak(&v35);
  }
  -[SFStepperView incrementButton](self->_stepperView, "incrementButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3428];
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __36__StepperViewController_viewDidLoad__block_invoke_3;
  v32[3] = &unk_1E9CF2C28;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, 0, 0, v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:forControlEvents:", v11, 0x2000);

  -[SFStepperView doneButton](self->_stepperView, "doneButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTitle:forState:", v12, 0);

  v13 = (void *)MEMORY[0x1E0DC3428];
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __36__StepperViewController_viewDidLoad__block_invoke_4;
  v30[3] = &unk_1E9CF2C28;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, 0, 0, v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAction:forControlEvents:", v14, 0x2000);

  v15 = objc_opt_respondsToSelector();
  v16 = &unk_1E9D62970;
  if (!v25)
    v16 = &unk_1E9D62988;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "integerValue");
        -[StepperViewController _buttonForStepperButton:](self, "_buttonForStepperButton:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v15 & 1) != 0)
        {
          -[_SFSettingsAlertStepperController longestTextForButton:](self->_stepperController, "longestTextForButton:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        -[SFStepperView setLongestTitle:forButton:](self->_stepperView, "setLongestTitle:forButton:", v23, v22);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    }
    while (v18);
  }

  -[_SFSettingsAlertStepperController prepareStepper:](self->_stepperController, "prepareStepper:", self);
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __36__StepperViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[122], "decrementValue:", WeakRetained);

}

void __36__StepperViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[122], "resetValue:", WeakRetained);

}

void __36__StepperViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[122], "incrementValue:", WeakRetained);

}

void __36__StepperViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_buttonForStepperButton:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[SFStepperView resetButton](self->_stepperView, "resetButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[SFStepperView decrementButton](self->_stepperView, "decrementButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[SFStepperView incrementButton](self->_stepperView, "incrementButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setImage:(id)a3 forButton:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[StepperViewController _buttonForStepperButton:](self, "_buttonForStepperButton:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forState:", v6, 0);

}

- (void)setText:(id)a3 forButton:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[StepperViewController _buttonForStepperButton:](self, "_buttonForStepperButton:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v6, 0);

}

- (void)setEnabled:(BOOL)a3 forButton:(int64_t)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  -[StepperViewController _buttonForStepperButton:](self, "_buttonForStepperButton:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  InteractablePresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[InteractablePresentationController initWithPresentedViewController:presentingViewController:]([InteractablePresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (_SFSettingsAlertStepperController)stepperController
{
  return self->_stepperController;
}

- (void)setStepperController:(id)a3
{
  objc_storeStrong((id *)&self->_stepperController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepperController, 0);
  objc_storeStrong((id *)&self->_stepperView, 0);
}

@end
