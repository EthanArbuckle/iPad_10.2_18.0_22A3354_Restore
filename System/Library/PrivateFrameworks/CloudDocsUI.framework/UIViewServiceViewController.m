@implementation UIViewServiceViewController

void __55___UIViewServiceViewController_initWithNibName_bundle___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4;
  v7 = v6;

  objc_msgSend(WeakRetained, "_updatedContentSizeForPreferredContentSize:", v5, v7);
  v9 = v8;
  v11 = v10;
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "setPreferredContentSize:", v9, v11);

}

@end
