@implementation SKStarRatingAlertController

+ (id)starRatingAlertController
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RATING_ALERT_TITLE"), &stru_1E5B2D460, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SKStarRatingAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  SKStarRatingAlertController *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  SKStarRatingControl *v12;
  SKStarRatingControl *ratingControl;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SKStarRatingAlertController;
  v4 = -[SKStarRatingAlertController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("AlertStarBackground"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("AlertStarForeground"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SKGetRatingStarsImage(v6, 5, 9.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    SKGetRatingStarsImage(v9, 5, 9.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[SKStarRatingControl initWithBackgroundImage:foregroundImage:]([SKStarRatingControl alloc], "initWithBackgroundImage:foregroundImage:", v10, v11);
    ratingControl = v4->_ratingControl;
    v4->_ratingControl = v12;

    -[SKStarRatingControl addTarget:action:forControlEvents:](v4->_ratingControl, "addTarget:action:forControlEvents:", v4, sel__ratingControlChanged_, 4096);
    -[SKStarRatingControl setAutoresizingMask:](v4->_ratingControl, "setAutoresizingMask:", 37);
    -[SKStarRatingControl setHitPadding:](v4->_ratingControl, "setHitPadding:", 50.0, 15.0);
    -[SKStarRatingControl setStarWidth:](v4->_ratingControl, "setStarWidth:", v8);
    -[SKStarRatingControl sizeToFit](v4->_ratingControl, "sizeToFit");
    -[SKStarRatingControl frame](v4->_ratingControl, "frame");
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F20]), "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", 0.0, 0.0, v15, v17 + 20.0);

    objc_msgSend(v18, "setPreferredContentSize:", v15, v17 + 20.0);
    -[SKStarRatingControl setFrame:](v4->_ratingControl, "setFrame:", 0.0, 0.0, v15, v17);
    objc_msgSend(v18, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v4->_ratingControl);

    -[SKStarRatingAlertController setContentViewController:](v4, "setContentViewController:", v18);
    -[SKStarRatingAlertController setupActionsWithBundle:](v4, "setupActionsWithBundle:", v5);

  }
  return v4;
}

- (void)setupActionsWithBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIAlertAction *v11;
  UIAlertAction *submitAction;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5B2D460, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SUBMIT"), &stru_1E5B2D460, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC3448];
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__SKStarRatingAlertController_setupActionsWithBundle___block_invoke;
  v15[3] = &unk_1E5B27D18;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "actionWithTitle:style:handler:", v5, 1, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStarRatingAlertController addAction:](self, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __54__SKStarRatingAlertController_setupActionsWithBundle___block_invoke_2;
  v13[3] = &unk_1E5B27D18;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v6, 0, v13);
  v11 = (UIAlertAction *)objc_claimAutoreleasedReturnValue();
  submitAction = self->_submitAction;
  self->_submitAction = v11;

  -[SKStarRatingAlertController addAction:](self, "addAction:", self->_submitAction);
  -[SKStarRatingAlertController _updateButtonState](self, "_updateButtonState");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __54__SKStarRatingAlertController_setupActionsWithBundle___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(_QWORD, _QWORD, float);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "completion");
    v2 = (void (**)(_QWORD, _QWORD, float))objc_claimAutoreleasedReturnValue();
    v2[2](v2, 0, 0.0);

  }
}

void __54__SKStarRatingAlertController_setupActionsWithBundle___block_invoke_2(uint64_t a1)
{
  float v1;
  float v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, float);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rating");
  v2 = v1;
  objc_msgSend(WeakRetained, "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "completion");
    v4 = (void (**)(_QWORD, _QWORD, float))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1, v2);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[SKStarRatingControl removeTarget:action:forControlEvents:](self->_ratingControl, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKStarRatingAlertController;
  -[SKStarRatingAlertController dealloc](&v3, sel_dealloc);
}

- (float)rating
{
  float result;

  -[SKStarRatingControl value](self->_ratingControl, "value");
  return result;
}

- (void)setRating:(float)a3
{
  -[SKStarRatingControl setValue:](self->_ratingControl, "setValue:");
}

- (void)_updateButtonState
{
  float v3;

  if (self->_submitAction)
  {
    -[SKStarRatingAlertController rating](self, "rating");
    -[UIAlertAction setEnabled:](self->_submitAction, "setEnabled:", v3 > 0.00000011921);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_submitAction, 0);
  objc_storeStrong((id *)&self->_ratingControl, 0);
}

@end
