@implementation UISwitch(MobileSafariExtras)

- (void)sf_initWithOn:()MobileSafariExtras valueChangeHandler:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3428];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__UISwitch_MobileSafariExtras__sf_initWithOn_valueChangeHandler___block_invoke;
  v14[3] = &unk_1E21E2F88;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "actionWithHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(a1, "initWithFrame:primaryAction:", v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setOn:", a3);
    v12 = v11;
  }

  return v11;
}

@end
