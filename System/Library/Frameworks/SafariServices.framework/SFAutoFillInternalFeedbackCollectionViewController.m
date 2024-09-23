@implementation SFAutoFillInternalFeedbackCollectionViewController

id __82___SFAutoFillInternalFeedbackCollectionViewController__createCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  v7 = v6;
  if (a2 == 3)
  {
    objc_msgSend(v6, "setHeaderMode:", 1);
    objc_msgSend(v7, "setFooterMode:", 1);
  }
  else if (!a2)
  {
    objc_msgSend(v6, "setHeaderMode:", 1);
  }
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "detailTypesForSelectedFeedbackCategory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
      v14 = 0.0;
      v10 = 0.0;
    }
  }
  objc_msgSend(v8, "setContentInsets:", v10, v12, v14, v16);

  return v8;
}

@end
