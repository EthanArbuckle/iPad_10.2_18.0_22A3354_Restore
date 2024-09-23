@implementation UIViewController

void __88__UIViewController_FocusUI__fcui_layoutViewIfNeededAndAppearingOrAppearedWithAnimation___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

@end
