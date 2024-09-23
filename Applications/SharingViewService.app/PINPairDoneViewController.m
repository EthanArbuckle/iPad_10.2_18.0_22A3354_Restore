@implementation PINPairDoneViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v3 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairDoneViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v22.receiver = self;
  v22.super_class = (Class)PINPairDoneViewController;
  -[SVSBaseViewController viewWillAppear:](&v22, "viewWillAppear:", v3);
  if (*(_DWORD *)((char *)&self->_doneButton + 1))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("AlertCircle.png")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_flatImageWithColor:", v6));
    objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setImage:", v7);

    v15 = sub_1001173A4(CFSTR("PAIR_FAILED"), v8, v9, v10, v11, v12, v13, v14, *(unsigned int *)((char *)&self->_doneButton + 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v16);

    v17 = *(UIImageView **)((char *)&self->_imageView + 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(v17, "setTitle:forState:", v19, 0);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("DoneCheck.png")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_flatImageWithColor:", v19));
    objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setImage:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v21, "setSwipeDismissible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairDoneViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)PINPairDoneViewController;
  -[PINPairDoneViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A86D8 <= 30 && (dword_1001A86D8 != -1 || _LogCategory_Initialize(&dword_1001A86D8, 30)))
    LogPrintF(&dword_1001A86D8, "-[PINPairDoneViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (int)status
{
  return *(_DWORD *)((char *)&self->_doneButton + 1);
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)((char *)&self->_doneButton + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
