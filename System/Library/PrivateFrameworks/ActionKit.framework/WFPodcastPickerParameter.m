@implementation WFPodcastPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFPodcastPickerParameter)initWithDefinition:(id)a3
{
  WFPodcastPickerParameter *v3;
  WFPodcastPickerParameter *v4;
  WFPodcastPickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFPodcastPickerParameter;
  v3 = -[WFPodcastPickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v7[3] = &unk_24F8B9110;
  v8 = v5;
  v6 = v5;
  +[WFPodcastUtilities getPodcastsFromLibraryFetchingDetailsFromServer:withCompletion:](WFPodcastUtilities, "getPodcastsFromLibraryFetchingDetailsFromServer:withCompletion:", 0, v7);

}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
  v5[3] = &unk_24F8BB5E0;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "if_compactMap:", &__block_literal_global_8501);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x24BDD9ED0]);
  if (v5)
    v3 = v5;
  else
    v3 = (id)MEMORY[0x24BDBD1A8];
  v4 = (void *)objc_msgSend(v2, "initWithItems:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __90__WFPodcastPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC3F78];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

@end
