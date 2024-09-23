@implementation UITableViewController

void __81__UITableViewController_MessageUI__mf_updatePreferredContentSizeBasedOnTableView__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "preferredContentSize");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  objc_msgSend(WeakRetained, "setPreferredContentSize:", v3);

}

@end
