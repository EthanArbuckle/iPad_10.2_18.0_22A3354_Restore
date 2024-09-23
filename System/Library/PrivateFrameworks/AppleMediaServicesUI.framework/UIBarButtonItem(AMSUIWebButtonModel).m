@implementation UIBarButtonItem(AMSUIWebButtonModel)

+ (id)barButtonItemWithWebButtonModel:()AMSUIWebButtonModel navigationBarModel:actionBlock:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id *v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  id v45;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v7, "actionBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      v11 = v10;
    v13 = _Block_copy(v11);

    objc_msgSend(v7, "activityIndicator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x24BEBD410]);
      objc_msgSend(v7, "_makeActivityIndicatorView");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v18 = (void *)v16;
      v17 = (void *)objc_msgSend(v15, "initWithCustomView:", v16);

LABEL_10:
      objc_msgSend(v7, "accessibilityLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessibilityLabel:", v19);

      objc_msgSend(v17, "setAccessibilityTraits:", *MEMORY[0x24BEBDF00]);
      objc_msgSend(v17, "setIsAccessibilityElement:", 1);
      objc_msgSend(v17, "setEnabled:", objc_msgSend(v7, "enabled"));
      goto LABEL_11;
    }
    if (objc_msgSend(v7, "style") == 4)
    {
      v15 = objc_alloc(MEMORY[0x24BEBD410]);
      objc_msgSend(v7, "_makeProxCardButtonWithActionBlock:", v13);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(v7, "_imageForButtonWithNavStyle:", objc_msgSend(v8, "style"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x24BEBD410]);
      v23 = (void *)MEMORY[0x24BEBD388];
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = MEMORY[0x24BDAC760];
      v42 = 3221225472;
      v43 = __103__UIBarButtonItem_AMSUIWebButtonModel__barButtonItemWithWebButtonModel_navigationBarModel_actionBlock___block_invoke;
      v44 = &unk_24CB50BE0;
      v25 = &v45;
      v45 = v13;
      v26 = &v41;
      v27 = v23;
      v28 = v24;
      v29 = v21;
    }
    else
    {
      objc_msgSend(v7, "title");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        objc_msgSend(v7, "title");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", &stru_24CB5A078);

        if ((v33 & 1) != 0)
        {
          v17 = 0;
LABEL_19:
          objc_msgSend(v17, "setStyle:", objc_msgSend(v7, "_barButtonItemStyle"));

          goto LABEL_10;
        }
      }
      v22 = objc_alloc(MEMORY[0x24BEBD410]);
      v34 = (void *)MEMORY[0x24BEBD388];
      objc_msgSend(v7, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = MEMORY[0x24BDAC760];
      v37 = 3221225472;
      v38 = __103__UIBarButtonItem_AMSUIWebButtonModel__barButtonItemWithWebButtonModel_navigationBarModel_actionBlock___block_invoke_2;
      v39 = &unk_24CB50BE0;
      v25 = &v40;
      v40 = v13;
      v26 = &v36;
      v27 = v34;
      v28 = v24;
      v29 = 0;
    }
    objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v28, v29, 0, v26, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v22, "initWithPrimaryAction:", v35);

    goto LABEL_19;
  }
  v17 = 0;
  v13 = v9;
LABEL_11:

  return v17;
}

@end
