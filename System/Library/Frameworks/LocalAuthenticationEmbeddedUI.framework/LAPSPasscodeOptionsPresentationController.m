@implementation LAPSPasscodeOptionsPresentationController

- (void)presentPasscodeOptions:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_msgSend(v8, "presentationStyle");
  switch(v7)
  {
    case 2:
      -[LAPSPasscodeOptionsPresentationController _presentPasscodeOptionsSheet:completion:](self, "_presentPasscodeOptionsSheet:completion:", v8, v6);
      break;
    case 1:
      -[LAPSPasscodeOptionsPresentationController _presentPasscodeOptionsPopover:completion:](self, "_presentPasscodeOptionsPopover:completion:", v8, v6);
      break;
    case 0:
      -[LAPSPasscodeOptionsPresentationController _presentPasscodeOptionsAlert:completion:](self, "_presentPasscodeOptionsAlert:completion:", v8, v6);
      break;
  }

}

- (void)_presentPasscodeOptionsSheet:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sourceViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke;
  v10[3] = &unk_24FDCDBD8;
  v11 = v5;
  v9 = v5;
  __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke((uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v8, objc_msgSend(v9, "animated"), v6);

}

LAPSPasscodeOptionsSheetViewController *__85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke(uint64_t a1)
{
  LAPSPasscodeOptionsSheetViewController *v2;
  void *v3;
  LAPSPasscodeOptionsSheetViewController *v4;
  void *v5;
  LAPSPasscodeOptionsSheetViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  LAPSPasscodeOptionsSheetViewController *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = [LAPSPasscodeOptionsSheetViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LAPSPasscodeOptionsSheetViewController initWithConfiguration:](v2, "initWithConfiguration:", v3);

  -[LAPSPasscodeOptionsSheetViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  -[LAPSPasscodeOptionsSheetViewController sheetPresentationController](v4, "sheetPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_2;
  v11[3] = &unk_24FDCDBB0;
  v6 = v4;
  v12 = v6;
  __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_2((uint64_t)v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetents:", v8);

  objc_msgSend(v5, "setPreferredCornerRadius:", 12.0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsSheetViewController setDelegate:](v6, "setDelegate:", v9);

  return v6;
}

id __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[4];
  id v5;

  v1 = (void *)MEMORY[0x24BEBD950];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_3;
  v4[3] = &unk_24FDCDB88;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v1, "customDetentWithIdentifier:resolver:", CFSTR("Small"), v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double __85__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsSheet_completion___block_invoke_3(uint64_t a1)
{
  double v1;

  objc_msgSend(*(id *)(a1 + 32), "preferredContentSize");
  return v1;
}

- (void)_presentPasscodeOptionsAlert:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeOptionsAlertViewController *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "config");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[LAPSPasscodeOptionsAlertViewController initWithConfiguration:]([LAPSPasscodeOptionsAlertViewController alloc], "initWithConfiguration:", v9);
  -[LAPSPasscodeOptionsPresentationController _presentPasscodeOptionsPopOverWithContentVC:request:completion:](self, "_presentPasscodeOptionsPopOverWithContentVC:request:completion:", v8, v7, v6);

}

- (void)_presentPasscodeOptionsPopover:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LAPSPasscodeOptionsSheetViewController *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "config");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[LAPSPasscodeOptionsSheetViewController initWithConfiguration:style:]([LAPSPasscodeOptionsSheetViewController alloc], "initWithConfiguration:style:", v9, 1);
  -[LAPSPasscodeOptionsPresentationController _presentPasscodeOptionsPopOverWithContentVC:request:completion:](self, "_presentPasscodeOptionsPopOverWithContentVC:request:completion:", v8, v7, v6);

}

- (void)_presentPasscodeOptionsPopOverWithContentVC:(id)a3 request:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "sourceViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __108__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsPopOverWithContentVC_request_completion___block_invoke;
  v14[3] = &unk_24FDCDC00;
  v15 = v8;
  v16 = v7;
  v11 = v7;
  v13 = v8;
  __108__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsPopOverWithContentVC_request_completion___block_invoke((uint64_t)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v12, objc_msgSend(v13, "animated"), v9);

}

id __108__LAPSPasscodeOptionsPresentationController__presentPasscodeOptionsPopOverWithContentVC_request_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "sourceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "setModalPresentationStyle:", 6);
      goto LABEL_9;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setModalPresentationStyle:", 7);
  objc_msgSend(*(id *)(a1 + 40), "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSourceView:", v6);

    objc_msgSend(*(id *)(a1 + 32), "sourceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v4, "setSourceRect:");

  }
  objc_msgSend(*(id *)(a1 + 32), "sourceItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSourceItem:", v9);

    objc_msgSend(v4, "setPermittedArrowDirections:", 1);
  }

LABEL_9:
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v11);

  return *(id *)(a1 + 40);
}

@end
