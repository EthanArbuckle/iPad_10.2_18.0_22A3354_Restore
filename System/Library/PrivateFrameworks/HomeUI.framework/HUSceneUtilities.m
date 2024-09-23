@implementation HUSceneUtilities

+ (id)initialViewControllerForAddingSceneWithPresentationDelegate:(id)a3 home:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D519C0];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(a1, "_hasSuggestedScenesForHome:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__HUSceneUtilities_initialViewControllerForAddingSceneWithPresentationDelegate_home___block_invoke;
  v17[3] = &unk_1E6F592A8;
  v18 = v6;
  v11 = v9;
  v19 = v11;
  v12 = v6;
  v13 = (id)objc_msgSend(v10, "addCompletionBlock:", v17);

  v14 = v19;
  v15 = v11;

  return v15;
}

void __85__HUSceneUtilities_initialViewControllerForAddingSceneWithPresentationDelegate_home___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HUSceneSuggestionsViewController *v6;
  HUSceneSuggestionsViewController *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8 && objc_msgSend(v8, "BOOLValue"))
    v6 = objc_alloc_init(HUSceneSuggestionsViewController);
  else
    v6 = -[HUSceneActionEditorViewController initWithActionSetBuilder:mode:]([HUSceneActionEditorViewController alloc], "initWithActionSetBuilder:mode:", 0, 2);
  v7 = v6;
  -[HUSceneSuggestionsViewController setPresentationDelegate:](v6, "setPresentationDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v7);

}

+ (id)_hasSuggestedScenesForHome:(id)a3
{
  void *v3;
  void *v4;

  +[HUSceneSuggestionsViewController computeNumberOfSuggestionsInHome:](HUSceneSuggestionsViewController, "computeNumberOfSuggestionsInHome:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flatMap:", &__block_literal_global_176);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __47__HUSceneUtilities__hasSuggestedScenesForHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "unsignedIntegerValue") != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
