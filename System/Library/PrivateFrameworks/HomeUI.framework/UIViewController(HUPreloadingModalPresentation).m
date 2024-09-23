@implementation UIViewController(HUPreloadingModalPresentation)

- (id)hu_presentPreloadableViewController:()HUPreloadingModalPresentation animated:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  char v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__UIViewController_HUPreloadingModalPresentation__hu_presentPreloadableViewController_animated___block_invoke;
  v10[3] = &unk_1E6F4D650;
  v10[4] = a1;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  _HUPreloadViewController(v7, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
