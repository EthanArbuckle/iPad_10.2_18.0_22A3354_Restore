@implementation ProximityAutoFillDoneViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ProximityAutoFillDoneViewController;
  -[SVSBaseViewController viewWillAppear:](&v32, "viewWillAppear:", a3);
  v4 = *(UILabel **)((char *)&self->_titleLabel + 1);
  if (v4)
  {
    v5 = objc_msgSend(v4, "code") == (id)-6723;
    *(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) = v5;
    if (v5)
    {
LABEL_3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_CANCELED_DESCRIPTION"), &stru_10017E3D8, CFSTR("Localizable")));
      objc_msgSend(*(id *)(&self->_canceled + 1), "setText:", v7);

      objc_msgSend(*(id *)((char *)&self->_descriptionLabel + 1), "setHidden:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("PROX_AUTOFILL_CANCELED_TITLE");
LABEL_4:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_10017E3D8, CFSTR("Localizable")));
      objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v11);
      goto LABEL_12;
    }
  }
  else if (*(&self->super.super._didReactivateContainerViewAfterLayingOut + 1))
  {
    goto LABEL_3;
  }
  v12 = *(uint64_t *)((char *)&self->_titleLabel + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = v13;
  if (!v12)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_SUCCESS_DESCRIPTION_TV"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(*(id *)(&self->_canceled + 1), "setText:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("DoneCheck.png")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_flatImageWithColor:", v30));
    objc_msgSend(*(id *)((char *)&self->_descriptionLabel + 1), "setImage:", v31);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = CFSTR("PROX_AUTOFILL_SUCCESS_TITLE");
    goto LABEL_4;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_FAILED_DESCRIPTION"), &stru_10017E3D8, CFSTR("Localizable")));

  if (IsAppleInternalBuild(v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_FAILED_DESCRIPTION_FORMAT"), &stru_10017E3D8, CFSTR("Localizable")));

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "localizedDescription"));
    v19 = (void *)v18;
    v20 = CFSTR("Unknown error");
    if (v18)
      v20 = (const __CFString *)v18;
    v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v20));

    v9 = (void *)v21;
  }
  objc_msgSend(*(id *)(&self->_canceled + 1), "setText:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("AlertCircle.png")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_flatImageWithColor:", v23));
  objc_msgSend(*(id *)((char *)&self->_descriptionLabel + 1), "setImage:", v24);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PROX_AUTOFILL_FAILED_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v25);

LABEL_12:
  if (IsAppleInternalBuild(v26))
    v27 = (uint64_t)objc_msgSend(self->super.super._mainController, "prefHideTTR");
  else
    v27 = 1;
  objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setHidden:", v27);
}

- (void)handleDoneButtonPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillDoneViewController handleDoneButtonPressed:]", 30, "Done button pressed\n");
  objc_msgSend(self->super.super._mainController, "ensureStoppedWithDismiss:reason:", 1, 5);

}

- (void)handleReportButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8830 <= 30 && (dword_1001A8830 != -1 || _LogCategory_Initialize(&dword_1001A8830, 30)))
    LogPrintF(&dword_1001A8830, "-[ProximityAutoFillDoneViewController handleReportButton:]", 30, "File radar button tapped in done view controller");
  objc_msgSend(self->super.super._mainController, "fileRadar:", *(UILabel **)((char *)&self->_titleLabel + 1));

}

- (NSError)error
{
  return *(NSError **)((char *)&self->_titleLabel + 1);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_descriptionLabel + 1), 0);
  objc_storeStrong((id *)(&self->_canceled + 1), 0);
}

@end
