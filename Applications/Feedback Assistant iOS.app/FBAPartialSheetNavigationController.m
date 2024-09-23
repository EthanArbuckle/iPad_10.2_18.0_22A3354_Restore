@implementation FBAPartialSheetNavigationController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBAPartialSheetNavigationController;
  -[FBAPartialSheetNavigationController viewDidLoad](&v3, "viewDidLoad");
  -[FBAPartialSheetNavigationController setDetentBehavior:](self, "setDetentBehavior:", 0);
  -[FBAPartialSheetNavigationController setCustomDetentHeight:](self, "setCustomDetentHeight:", -1.0);
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v5 = a4;
  v6 = objc_opt_class(_UISheetPresentationController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "_setShouldDismissWhenTappedOutside:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));
    v9 = objc_opt_class(UINavigationController);
    isKindOfClass = objc_opt_isKindOfClass(v8, v9);

    if ((isKindOfClass & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topViewController"));
    v13 = objc_opt_class(UIViewController);
    v14 = objc_opt_isKindOfClass(v12, v13);

    if ((v14 & 1) == 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    v15 = -[FBAPartialSheetNavigationController detentBehavior](self, "detentBehavior");
    switch(v15)
    {
      case 0uLL:
        goto LABEL_8;
      case 1uLL:
        v17 = objc_claimAutoreleasedReturnValue(+[_UISheetDetent _mediumDetent](_UISheetDetent, "_mediumDetent"));
        break;
      case 2uLL:
        v16 = (void *)objc_opt_class(self);
        -[FBAPartialSheetNavigationController customDetentHeight](self, "customDetentHeight");
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "detentForCustomHeight:"));
        break;
      default:
LABEL_8:
        v17 = objc_claimAutoreleasedReturnValue(-[FBAPartialSheetNavigationController detentForPreferredContentSize](self, "detentForPreferredContentSize"));
        break;
    }
    v18 = (void *)v17;
    if (v17)
    {
      v24[0] = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[_UISheetDetent _largeDetent](_UISheetDetent, "_largeDetent"));
      v24[1] = v19;
      v20 = (void **)v24;
      v21 = 2;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[_UISheetDetent _largeDetent](_UISheetDetent, "_largeDetent"));
      v23 = v19;
      v20 = &v23;
      v21 = 1;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, v21, v23));
    objc_msgSend(v7, "_setDetents:", v22);

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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
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
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003A948;
    v7[3] = &unk_1000E76E8;
    *(double *)&v7[4] = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_UISheetDetent _detentWithContainerViewBlock:](_UISheetDetent, "_detentWithContainerViewBlock:", v7));
  }
  return v5;
}

- (id)detentForPreferredContentSize
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003A9DC;
  v3[3] = &unk_1000E7710;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[_UISheetDetent _detentWithContainerViewBlock:](_UISheetDetent, "_detentWithContainerViewBlock:", v3));
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
