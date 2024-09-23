@implementation SFReportFeedbackCollectionViewController

void __78___SFReportFeedbackCollectionViewController_initWithBrowserContentController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

id __72___SFReportFeedbackCollectionViewController__createCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _BOOL8 v5;
  void *v6;
  id v7;
  void *v8;
  double v9;

  v5 = a2 == 0;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "setFooterMode:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setHeaderMode:", v5);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentInsets");
  if (!a2)
    v9 = 16.0;
  objc_msgSend(v8, "setContentInsets:", v9);
  return v8;
}

@end
