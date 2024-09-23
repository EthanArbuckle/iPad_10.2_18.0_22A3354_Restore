@implementation UIView(BatteryCenterUI)

- (void)observeContentSizeCategoryChange:()BatteryCenterUI
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__UIView_BatteryCenterUI__observeContentSizeCategoryChange___block_invoke;
  v9[3] = &unk_1E94184A8;
  v9[4] = a1;
  v10 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(a1, "registerForTraitChanges:withHandler:", v6, v9);

}

@end
