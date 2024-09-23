@implementation AKSignaturesController

- (AKSignaturesController)initWithController:(id)a3
{
  id v4;
  AKSignaturesController *v5;
  AKSignaturesController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKSignaturesController;
  v5 = -[AKSignaturesController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AKSignaturesController setController:](v5, "setController:", v4);

  return v6;
}

- (void)presentSignaturesViewController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  AKSignaturesViewController_iOS *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];

  -[AKSignaturesController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signatureModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = -[AKSignaturesViewController_iOS initWithController:]([AKSignaturesViewController_iOS alloc], "initWithController:", v3);
    -[AKSignaturesController setSignaturesAlertViewController:](self, "setSignaturesAlertViewController:", v7);

    -[AKSignaturesController signaturesAlertViewController](self, "signaturesAlertViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[AKSignaturesController signaturesAlertViewController](self, "signaturesAlertViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPresentedInAlert:", 1);

    -[AKSignaturesController signaturesAlertViewController](self, "signaturesAlertViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShowsNavigationBar:", 0);

    -[AKSignaturesController signaturesAlertViewController](self, "signaturesAlertViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsEdits:", 0);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignaturesController signaturesAlertViewController](self, "signaturesAlertViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTableBackgroundColor:", v12);

    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setModalPresentationStyle:", 7);
    objc_msgSend(v14, "popoverPresentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

    objc_msgSend(v14, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPermittedArrowDirections:", 2);

    -[AKSignaturesController presentationContext](self, "presentationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sourceView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSourceView:", v18);

    -[AKSignaturesController signaturesAlertViewController](self, "signaturesAlertViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentViewController:", v20);

    v21 = (void *)MEMORY[0x24BDF67E8];
    +[AKController akBundle](AKController, "akBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Add or Remove Signature"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = sub_229036500;
    v33[3] = &unk_24F1A7DD8;
    v33[4] = self;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v25);

    v26 = (void *)MEMORY[0x24BDF67E8];
    +[AKController akBundle](AKController, "akBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v24;
    v32[1] = 3221225472;
    v32[2] = sub_2290365A4;
    v32[3] = &unk_24F1A7DD8;
    v32[4] = self;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 1, v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v29);

    -[AKSignaturesController presentationContext](self, "presentationContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "presentingViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "presentViewController:animated:completion:", v14, 1, 0);

  }
  else
  {
    -[AKSignaturesController _continueToCreateSignature](self, "_continueToCreateSignature");
  }

}

- (void)_continueToManageSignatures
{
  AKSignaturesViewController_iOS *v3;
  void *v4;
  AKSignaturesViewController_iOS *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = [AKSignaturesViewController_iOS alloc];
  -[AKSignaturesController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKSignaturesViewController_iOS initWithController:](v3, "initWithController:", v4);
  -[AKSignaturesController setSignaturesSheetViewController:](self, "setSignaturesSheetViewController:", v5);

  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalPresentationStyle:", 2);

  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModalInPresentation:", 1);

  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsNavigationBar:", 1);

  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPresentedInAlert:", 0);

  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsEdits:", 1);

  -[AKSignaturesController presentationContext](self, "presentationContext");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)signaturesViewControllerDidCancel:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2290367FC;
  v5[3] = &unk_24F1A7328;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (void)signaturesViewControllerDidSelectSignature:(id)a3
{
  void *v4;

  -[AKSignaturesController signaturesAlertViewController](self, "signaturesAlertViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[AKSignaturesController _notifyDidSelectSignature](self, "_notifyDidSelectSignature");
}

- (void)signaturesViewControllerContinueToCreateSignature:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AKSignaturesController signaturesSheetViewController](self, "signaturesSheetViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2290368B4;
  v5[3] = &unk_24F1A7328;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

- (void)_continueToCreateSignature
{
  AKSignatureCreationViewController_iOS *v3;
  void *v4;
  AKSignatureCreationViewController_iOS *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = [AKSignatureCreationViewController_iOS alloc];
  -[AKSignaturesController controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKSignatureCreationViewController_iOS initWithController:](v3, "initWithController:", v4);
  -[AKSignaturesController setSignaturesCreationViewController:](self, "setSignaturesCreationViewController:", v5);

  -[AKSignaturesController signaturesCreationViewController](self, "signaturesCreationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[AKSignaturesController signaturesCreationViewController](self, "signaturesCreationViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalTransitionStyle:", 0);

  -[AKSignaturesController signaturesCreationViewController](self, "signaturesCreationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModalPresentationStyle:", 2);

  -[AKSignaturesController signaturesCreationViewController](self, "signaturesCreationViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModalInPresentation:", 1);

  -[AKSignaturesController signaturesCreationViewController](self, "signaturesCreationViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[AKSignaturesController presentationContext](self, "presentationContext");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesController signaturesCreationViewController](self, "signaturesCreationViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)signatureCreationControllerDidCreateSignature:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AKSignaturesController signaturesCreationViewController](self, "signaturesCreationViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_229036AB0;
  v5[3] = &unk_24F1A7328;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

  -[AKSignaturesController _notifyDidSelectSignature](self, "_notifyDidSelectSignature");
}

- (void)_notifyDidSelectSignature
{
  void *v3;
  void *v4;
  AKSignatureAnnotation *v5;
  void *v6;
  void *v7;
  id v8;

  -[AKSignaturesController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signatureModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedSignature");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(AKSignatureAnnotation);
  -[AKSignatureAnnotation setSignature:](v5, "setSignature:", v8);
  objc_msgSend(v8, "pathBounds");
  -[AKSignatureAnnotation setRectangle:](v5, "setRectangle:", 0.0, 0.0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureAnnotation setStrokeColor:](v5, "setStrokeColor:", v6);

  -[AKSignaturesController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signaturesController:didSelectSignatureWithAnnotation:", self, v5);

}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKSignaturesControllerDelegate)delegate
{
  return (AKSignaturesControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AKSignaturesPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (AKSignaturesViewController_iOS)signaturesAlertViewController
{
  return self->_signaturesAlertViewController;
}

- (void)setSignaturesAlertViewController:(id)a3
{
  objc_storeStrong((id *)&self->_signaturesAlertViewController, a3);
}

- (AKSignaturesViewController_iOS)signaturesSheetViewController
{
  return self->_signaturesSheetViewController;
}

- (void)setSignaturesSheetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_signaturesSheetViewController, a3);
}

- (AKSignatureCreationViewController_iOS)signaturesCreationViewController
{
  return self->_signaturesCreationViewController;
}

- (void)setSignaturesCreationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_signaturesCreationViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signaturesCreationViewController, 0);
  objc_storeStrong((id *)&self->_signaturesSheetViewController, 0);
  objc_storeStrong((id *)&self->_signaturesAlertViewController, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_controller);
}

@end
