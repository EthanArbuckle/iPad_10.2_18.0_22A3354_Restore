@implementation UIViewController

void __47__UIViewController_InfoButton__setupInfoButton__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "infoButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoButtonTapped:", v1);

}

@end
