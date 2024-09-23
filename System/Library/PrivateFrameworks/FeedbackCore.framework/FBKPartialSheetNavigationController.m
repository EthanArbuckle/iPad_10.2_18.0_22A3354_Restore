@implementation FBKPartialSheetNavigationController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBKPartialSheetNavigationController;
  -[FBKPartialSheetNavigationController viewDidLoad](&v3, sel_viewDidLoad);
  -[FBKPartialSheetNavigationController setDetentBehavior:](self, "setDetentBehavior:", 0);
  -[FBKPartialSheetNavigationController setCustomDetentHeight:](self, "setCustomDetentHeight:", -1.0);
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "_setShouldDismissWhenTappedOutside:", 1);
    objc_msgSend(v6, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v6, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    v12 = -[FBKPartialSheetNavigationController detentBehavior](self, "detentBehavior");
    switch(v12)
    {
      case 0uLL:
        goto LABEL_8;
      case 1uLL:
        objc_msgSend(MEMORY[0x24BEBDD20], "_mediumDetent");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      case 2uLL:
        v13 = (void *)objc_opt_class();
        -[FBKPartialSheetNavigationController customDetentHeight](self, "customDetentHeight");
        objc_msgSend(v13, "detentForCustomHeight:");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_8:
        -[FBKPartialSheetNavigationController detentForPreferredContentSize](self, "detentForPreferredContentSize");
        v14 = objc_claimAutoreleasedReturnValue();
        break;
    }
    v15 = (void *)v14;
    if (v14)
    {
      v22[0] = v14;
      objc_msgSend(MEMORY[0x24BEBDD20], "_largeDetent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v16;
      v17 = (void *)MEMORY[0x24BDBCE30];
      v18 = (void **)v22;
      v19 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBDD20], "_largeDetent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      v17 = (void *)MEMORY[0x24BDBCE30];
      v18 = &v21;
      v19 = 1;
    }
    objc_msgSend(v17, "arrayWithObjects:count:", v18, v19, v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setDetents:", v20);

    goto LABEL_14;
  }
LABEL_16:

}

- (void)setCustomDetentHeight:(double)a3
{
  double v4;
  void *v6;
  double v7;
  double v8;

  v4 = -1.0;
  if (a3 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;

    if (v8 > a3)
      v4 = a3;
  }
  self->_customDetentHeight = v4;
}

+ (id)detentForCustomHeight:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[7];

  if (a3 == -1.0)
  {
    v5 = 0;
  }
  else
  {
    v7[5] = v3;
    v7[6] = v4;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __61__FBKPartialSheetNavigationController_detentForCustomHeight___block_invoke;
    v7[3] = &__block_descriptor_40_e16_d16__0__UIView_8l;
    *(double *)&v7[4] = a3;
    objc_msgSend(MEMORY[0x24BEBDD20], "_detentWithContainerViewBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

double __61__FBKPartialSheetNavigationController_detentForCustomHeight___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  v2 = *(double *)(a1 + 32);
  objc_msgSend(a2, "bounds");
  return fmin(v2, v3 + -100.0);
}

- (id)detentForPreferredContentSize
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__FBKPartialSheetNavigationController_detentForPreferredContentSize__block_invoke;
  v3[3] = &unk_24E159748;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDD20], "_detentWithContainerViewBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

double __68__FBKPartialSheetNavigationController_detentForPreferredContentSize__block_invoke(uint64_t a1)
{
  double v1;

  objc_msgSend(*(id *)(a1 + 32), "preferredContentSize");
  return v1;
}

- (unint64_t)detentBehavior
{
  return self->_detentBehavior;
}

- (void)setDetentBehavior:(unint64_t)a3
{
  self->_detentBehavior = a3;
}

- (double)customDetentHeight
{
  return self->_customDetentHeight;
}

@end
