@implementation UIAlertController(AppleAccountUI)

+ (uint64_t)alertWithTitle:()AppleAccountUI message:
{
  return objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
}

+ (id)alertWithTitle:()AppleAccountUI message:buttonTitle:actionHandler:
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x1E0DC3450];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v12, "_handlerWithSingleActionHandler:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "actionWithTitle:style:handler:", v11, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v15);
  return v12;
}

+ (id)alertWithTitle:()AppleAccountUI message:buttonTitle:
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "alertWithTitle:message:buttonTitle:actionHandler:", v9, v8, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:defaultButtonTitle:actionHandler:
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v11 = (void *)MEMORY[0x1E0DC3450];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v15, "_handlerWithMultiActionHandler:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v14, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v18);
  v19 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v15, "_handlerWithMultiActionHandler:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "actionWithTitle:style:handler:", v13, 0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v21);
  return v15;
}

+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:destructiveButtonTitle:actionHandler:
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v11 = (void *)MEMORY[0x1E0DC3450];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v15, "_handlerWithMultiActionHandler:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v14, 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v18);
  v19 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v15, "_handlerWithMultiActionHandler:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "actionWithTitle:style:handler:", v13, 2, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v21);
  return v15;
}

+ (id)alertWithTitle:()AppleAccountUI message:cancelButtonTitle:defaultButtonTitle:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:", v12, v11, v10, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_handlerWithSingleActionHandler:()AppleAccountUI
{
  id v3;
  void *v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__UIAlertController_AppleAccountUI___handlerWithSingleActionHandler___block_invoke;
    aBlock[3] = &unk_1EA2DC540;
    v8 = v3;
    v5 = _Block_copy(aBlock);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_handlerWithMultiActionHandler:()AppleAccountUI
{
  id v3;
  void *v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UIAlertController_AppleAccountUI___handlerWithMultiActionHandler___block_invoke;
    aBlock[3] = &unk_1EA2DC540;
    v8 = v3;
    v5 = _Block_copy(aBlock);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
