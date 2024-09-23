@implementation UIDocumentPickerURLContainerModel

uint64_t __52___UIDocumentPickerURLContainerModel_tagColorsByTag__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x24BDD1378];
  objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", v3, sel__tagColorsDidChange, v4, v5);

  return objc_msgSend(*(id *)(a1 + 32), "_tagColorsDidChange");
}

void __52___UIDocumentPickerURLContainerModel__tagBlipColors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.8, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  objc_msgSend(MEMORY[0x24BDF6950], "systemPurpleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)_tagBlipColors_colors;
  _tagBlipColors_colors = v9;

}

void __69___UIDocumentPickerURLContainerModel_initWithURL_pickableTypes_mode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69___UIDocumentPickerURLContainerModel_initWithURL_pickableTypes_mode___block_invoke_2;
  v5[3] = &unk_24E43AC50;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __69___UIDocumentPickerURLContainerModel_initWithURL_pickableTypes_mode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateObserverForURL:", *(_QWORD *)(a1 + 32));

}

uint64_t __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "compare:options:range:locale:", v5, 833, 0, objc_msgSend(v6, "length"), *(_QWORD *)(a1 + 32));

  return v7;
}

uint64_t __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "type");
  v7 = objc_msgSend(v5, "type");
  if (v6 && v7)
  {
    v8 = 0;
  }
  else if (!v6 || v7)
  {
    if (v6 || !v7)
    {
      objc_msgSend(v4, "modificationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modificationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "compare:", v10);

    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(a2, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", &stru_24E43B9D8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsJoinedByString:", &stru_24E43B9D8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v10;
}

void __79___UIDocumentPickerURLContainerModel_arrayController_modelChanged_differences___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "callUpdateHandlerWithNewItems:diff:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __59___UIDocumentPickerURLContainerModel_updateObserverForURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  cdui_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59___UIDocumentPickerURLContainerModel_updateObserverForURL___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "callUpdateHandlerWithNewItems:diff:", MEMORY[0x24BDBD1A8], 0);
  objc_msgSend(*(id *)(a1 + 32), "_createObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObserver:", v10);

}

void __59___UIDocumentPickerURLContainerModel_updateObserverForURL___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F506000, a1, a3, "[DEBUG] move: calling update handler and recreating observer", a5, a6, a7, a8, 0);
}

@end
