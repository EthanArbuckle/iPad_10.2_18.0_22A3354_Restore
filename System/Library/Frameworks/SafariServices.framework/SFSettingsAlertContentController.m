@implementation SFSettingsAlertContentController

void __45___SFSettingsAlertContentController_loadView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_addGroupSeparatorIfNeededBeforeItemAtIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "_addViewForItem:", v6);

}

_QWORD *__52___SFSettingsAlertContentController_setFocusedItem___block_invoke(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "_updatePreferredContentSize");
  result = *(_QWORD **)(a1 + 40);
  if (!result[133])
    return (_QWORD *)objc_msgSend(result, "_scrollToBottomIfNeeded");
  return result;
}

BOOL __54___SFSettingsAlertContentController__updateSeparators__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backgroundMode") == 1;
}

void __54___SFSettingsAlertContentController__updateSeparators__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "viewAsUIView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v20)
  {

    v8 = 0;
LABEL_7:
    objc_msgSend(v5, "setHidesSeparator:", 1);
    goto LABEL_8;
  }
  v7 = a3 + 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "objectAtIndexedSubscript:", a3 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0)
    goto LABEL_7;
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "viewAsUIView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10) & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "containsIndex:", v7);
  objc_msgSend(v5, "setHidesSeparator:", v11);

LABEL_8:
  objc_msgSend(v20, "group");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "subItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15 != v20;

  }
  else
  {
    v16 = 0;
  }
  v17 = 4;
  if (!v16)
    v17 = 5;
  v18 = 2;
  if (!v16)
    v18 = 3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1050))
    v19 = v18;
  else
    v19 = v17;
  objc_msgSend(v5, "setDefaultBackgroundMode:", v19);

}

@end
