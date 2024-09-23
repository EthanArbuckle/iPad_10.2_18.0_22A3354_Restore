void HUCCUpdateRunningState(int a1, uint64_t a2, uint64_t a3)
{
  HUCCUpdateRunningStateWithAppleMediaAccessories(a1, 0, a3);
}

void HUCCPerformCommonInitialization()
{
  if (qword_25414D0D0 != -1)
    dispatch_once(&qword_25414D0D0, &unk_24FFD8430);
}

BOOL sub_230FE0790(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_hf_prettyDescription(v2, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_230FDD000, v4, OS_LOG_TYPE_DEFAULT, "HUCCSmartGridItemManager hiding item %@", (uint8_t *)&v9, 0xCu);

    }
  }

  return (isKindOfClass & 1) == 0;
}

uint64_t sub_230FE107C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend_predictionsItemProvider(v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemPriority_(v10, v11, (uint64_t)v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_predictionsItemProvider(*(void **)(a1 + 32), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemPriority_(v15, v16, (uint64_t)v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_compare_(v12, v18, (uint64_t)v17);
  return v19;
}

id sub_230FE161C(void *a1, const char *a2, uint64_t a3)
{
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v11[6];

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_230FE16CC;
  v11[3] = &unk_24FFD80E0;
  v11[4] = a3;
  v11[5] = a1;
  sub_230FE16CC((uint64_t)v11, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a3 - 3) <= 2)
  {
    objc_msgSend__hucc_sizeSubclassSearchOrderForBaseSizeSubclass_(a1, v5, a3 - 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(v6, v8, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  return v6;
}

id sub_230FE16CC(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;

  v2 = &unk_24FFDDA38;
  switch(*(_QWORD *)(a1 + 32))
  {
    case 0:
      return v2;
    case 1:
      v2 = &unk_24FFDDA50;
      break;
    case 2:
      v2 = &unk_24FFDDA68;
      break;
    case 3:
      v2 = &unk_24FFDDA80;
      break;
    case 4:
      v2 = &unk_24FFDDA98;
      break;
    case 5:
      v2 = &unk_24FFDDAB0;
      break;
    case 6:
      objc_msgSend__hucc_sizeSubclassSearchOrderForBaseSizeSubclass_(*(void **)(a1 + 40), a2, 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObjectsFromArray_(&unk_24FFDDAC8, v4, (uint64_t)v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v2 = (void *)MEMORY[0x24BDBD1A8];
      break;
  }
  return v2;
}

double sub_230FE178C(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend_hucc_objectForSizeSubclass_(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (!v3)
    v3 = &unk_24FFDD898;
  objc_msgSend_doubleValue(v3, v4, v5);
  v8 = v7;

  return v8;
}

id sub_230FE17D8(void *a1, const char *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_count(a1, a2, a3))
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend__hucc_sizeSubclassSearchOrderForBaseSizeSubclass_(v5, v6, a3);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v7);
          objc_msgSend_objectForKeyedSubscript_(a1, v10, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            goto LABEL_12;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_12:

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

BOOL _HUCCLayoutStyleForModuleViewWidth(double a1, uint64_t a2, const char *a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;

  objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_userInterfaceIdiom(v5, v6, v7);

  if (v8 == 1)
    return 0;
  objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fixedCoordinateSpace(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v15, v16, v17);
  v11 = v18 < a1;

  return v11;
}

uint64_t HUCCSizeSubclassForModuleViewWidth(uint64_t a1, const char *a2, uint64_t a3, double a4)
{
  _BOOL8 v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = _HUCCLayoutStyleForModuleViewWidth(a4, a1, a2, a3);
  objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fixedCoordinateSpace(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v10, v11, v12);

  v13 = HUViewSizeSubclassForViewSize();
  v14 = 1;
  if (v13 != 1)
    v14 = 2;
  v15 = 4;
  if (v13 != 1)
    v15 = 5;
  if (!v13)
  {
    v14 = 0;
    v15 = 3;
  }
  if (v4)
    return v15;
  else
    return v14;
}

void sub_230FE1B14()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  const char *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BE4F498]);
  objc_msgSend_sharedInstance(MEMORY[0x24BE4F410], v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStatusBarVisibilityHandler_(v2, v3, (uint64_t)v4);

}

id sub_230FE1B68(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  uint8_t v30[16];
  uint8_t v31[8];
  uint64_t v32;
  uint8_t buf[16];

  if (!a1)
    return 0;
  v6 = a2;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230FDD000, v7, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule loading preview asset", buf, 2u);
  }

  v8 = objc_alloc(MEMORY[0x24BDF6718]);
  v9 = (void *)MEMORY[0x24BDD1488];
  v10 = objc_opt_class();
  objc_msgSend_bundleForClass_(v9, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithName_bundle_(v8, v13, (uint64_t)v6, v12);

  v15 = (void *)MEMORY[0x24BDE5718];
  objc_msgSend_data(v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BDE5D58];
  v32 = 0;
  objc_msgSend_packageWithData_type_options_error_(v15, v20, (uint64_t)v18, v19, MEMORY[0x24BDBD1B8], &v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v32;

  HFLogForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v24)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_230FDD000, v23, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule could not load HomeLargeXL asset", v30, 2u);
    }

    objc_msgSend_emptyPreviewForGridSize_(MEMORY[0x24BE4F438], v25, a3, a4);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v24)
    {
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_230FDD000, v23, OS_LOG_TYPE_DEFAULT, "HUCCControlCenterModule loaded HomeLargeXL asset", v31, 2u);
    }

    objc_msgSend_previewWithPackage_forGridSize_(MEMORY[0x24BE4F438], v27, (uint64_t)v21, a3, a4);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v26;

  return v28;
}

uint64_t sub_230FE2148(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t isAppleTV;

  v2 = a2;
  if ((objc_msgSend_hf_isHomePod(v2, v3, v4) & 1) != 0)
    isAppleTV = 1;
  else
    isAppleTV = objc_msgSend_hf_isAppleTV(v2, v5, v6);

  return isAppleTV;
}

void sub_230FE267C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FE26A8(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend_mainThreadScheduler(MEMORY[0x24BE6B628], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_230FE2774;
  v9[3] = &unk_24FFD8188;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v7 = v3;
  v10 = v7;
  objc_msgSend_performBlock_(v6, v8, (uint64_t)v9);

  objc_destroyWeak(&v11);
}

void sub_230FE2760(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230FE2774(uint64_t a1)
{
  uint64_t v1;
  const char *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_setCharacteristicRegistrationObject_(WeakRetained, v2, v1);

}

void sub_230FE29E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FE2A14(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_setCharacteristicRegistrationScheduledCancelation_(WeakRetained, v2, 0);
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = WeakRetained;
    _os_log_impl(&dword_230FDD000, v3, OS_LOG_TYPE_DEFAULT, "%@:CharacteristicRegistration deregistering characteristic notifications", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_characteristicRegistrationObject(WeakRetained, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelRegistration_(WeakRetained, v7, (uint64_t)v6);

  objc_msgSend_setCharacteristicRegistrationObject_(WeakRetained, v8, 0);
}

void sub_230FE2EC4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend_context(*(void **)(a1 + 32), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230FE2F64;
  v10[3] = &unk_24FFD8200;
  v11 = v3;
  v8 = v3;
  objc_msgSend_openURL_completionHandler_(v6, v9, v7, v10);

}

void sub_230FE2F64(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)a2)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend_na_genericError(MEMORY[0x24BDD1540], a2, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

void sub_230FE32B4(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  id v5;
  id v6;

  objc_msgSend_itemManager(*(void **)(a1 + 32), a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend_reloadAndUpdateAllItemsFromSenderSelector_(v6, v4, *(_QWORD *)(a1 + 40));

}

uint64_t sub_230FE3458(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v8 = objc_msgSend_shouldShowAsEmptyHome(v5, v6, v7) ^ 1;
  else
    v8 = 0;

  return v8;
}

id sub_230FE4324(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 48);
  v4.super_class = (Class)HUCCSmartGridViewController;
  objc_msgSendSuper2(&v4, sel_prepareToPerformToggleActionForItem_sourceItem_, v2, v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_230FE4624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FE4648(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_home(*(void **)(a1 + 32), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__showDashboardControllerForHome_(WeakRetained, v8, (uint64_t)v7);

  objc_msgSend_finishWithNoResult(v4, v9, v10);
}

uint64_t sub_230FE5208(uint64_t a1, const char *a2)
{
  return objc_msgSend_requiresUnlockToPerformActionForItem_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_230FE5214(void **a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  objc_msgSend_delegate(a1[4], a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prepareForActionRequiringDeviceUnlockForGridViewController_(v4, v5, (uint64_t)a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend_copy(a1[5], v7, v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_230FE52DC;
  v13[3] = &unk_24FFD8330;
  v14 = a1[6];
  v15 = v9;
  v10 = v9;
  v12 = (id)objc_msgSend_addSuccessBlock_(v6, v11, (uint64_t)v13);

}

id sub_230FE52DC(uint64_t a1, const char *a2)
{
  return (id)objc_msgSend_presentQuickControlWithContext_animated_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), 1);
}

id sub_230FE5568(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;

  v3 = a2;
  objc_msgSend_collectionView(*(void **)(a1 + 32), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cellForItemAtIndexPath_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_conformsToProtocol_(v8, v9, (uint64_t)&unk_255EEA4C0))
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend_itemManager(*(void **)(a1 + 32), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_displayedItemAtIndexPath_(v14, v15, (uint64_t)v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_item(v11, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 == v16)
    {
      v25 = 0;
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_item(v11, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("Cell item %@ at index path %@ does not match item manager's item %@!"), v23, v3, v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void sub_230FE568C(uint64_t a1)
{
  NSObject *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  const char *v53;
  id obj;
  uint64_t v55;
  uint8_t v56;
  _BYTE v57[15];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[4];
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[16];
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  uint64_t v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_230FF4274();

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v3 = *(id *)(a1 + 32);
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v70, v82, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v71;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v71 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v8);
        HFLogForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v9;
          _os_log_error_impl(&dword_230FDD000, v10, OS_LOG_TYPE_ERROR, "  %@", buf, 0xCu);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v11, (uint64_t)&v70, v82, 16);
    }
    while (v6);
  }

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_230FF4248();

  if (*(_QWORD *)(a1 + 40))
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_230FF421C();

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend_changes(*(void **)(a1 + 40), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allOperations(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v66, v79, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v67;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v67 != v23)
            objc_enumerationMutation(v19);
          v25 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v24);
          HFLogForCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            sub_230FF41D0((uint64_t)buf, v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v27, (uint64_t)&v66, v79, 16);
      }
      while (v22);
    }

    HFLogForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_230FF41A4();

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend_changes(*(void **)(a1 + 40), v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fromGroups(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v34;
    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v62, v78, 16);
    if (v36)
    {
      v37 = v36;
      v55 = *(_QWORD *)v63;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v63 != v55)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v38);
          HFLogForCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            sub_230FF4158((uint64_t)v77, (uint64_t)v39);

          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          objc_msgSend_diffableItems(v39, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v58, v76, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v59;
            do
            {
              v48 = 0;
              do
              {
                if (*(_QWORD *)v59 != v47)
                  objc_enumerationMutation(v43);
                v49 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v48);
                HFLogForCategory();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v74 = 138412290;
                  v75 = v49;
                  _os_log_error_impl(&dword_230FDD000, v50, OS_LOG_TYPE_ERROR, "  %@", v74, 0xCu);
                }

                ++v48;
              }
              while (v46 != v48);
              v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v51, (uint64_t)&v58, v76, 16);
            }
            while (v46);
          }

          HFLogForCategory();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            sub_230FF4124(&v56, v57, v52);

          ++v38;
        }
        while (v38 != v37);
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v62, v78, 16);
      }
      while (v37);
    }

  }
}

BOOL sub_230FE5CA8(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_type(a2, (const char *)a2, a3) == 1;
}

void sub_230FE5CC8(uint64_t a1)
{
  NSObject *v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  const char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  id obj;
  uint64_t v53;
  uint8_t v54;
  _BYTE v55[15];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[16];
  _BYTE v72[128];
  _BYTE v73[16];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_230FF44BC();

  HFLogForCategory();
  v3 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    sub_230FF4430(a1, v3, v4);

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_230FF43A0((uint64_t)v5, v6, v7);

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_230FF4374();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend_changes(*(void **)(a1 + 40), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allOperations(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v64, v74, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v65;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v65 != v18)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v19);
        HFLogForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_230FF41D0((uint64_t)v73, v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v22, (uint64_t)&v64, v74, 16);
    }
    while (v17);
  }

  HFLogForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_230FF41A4();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v51 = a1;
  objc_msgSend_changes(*(void **)(a1 + 40), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fromGroups(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v29;
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v60, v72, 16);
  if (v31)
  {
    v32 = v31;
    v53 = *(_QWORD *)v61;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v61 != v53)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v33);
        HFLogForCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_230FF4158((uint64_t)v71, (uint64_t)v34);

        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend_diffableItems(v34, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v56, v70, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v57;
          do
          {
            v43 = 0;
            do
            {
              if (*(_QWORD *)v57 != v42)
                objc_enumerationMutation(v38);
              v44 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v43);
              HFLogForCategory();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v69 = v44;
                _os_log_error_impl(&dword_230FDD000, v45, OS_LOG_TYPE_ERROR, "  %@", buf, 0xCu);
              }

              ++v43;
            }
            while (v41 != v43);
            v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v46, (uint64_t)&v56, v70, 16);
          }
          while (v41);
        }

        HFLogForCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          sub_230FF4124(&v54, v55, v47);

        ++v33;
      }
      while (v33 != v32);
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v60, v72, 16);
    }
    while (v32);
  }

  HFLogForCategory();
  v49 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
    sub_230FF42AC(v51, v49, v50);

}

void sub_230FE6490(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_230FE64A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_230FE64AC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_230FE64C0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_230FE64F4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_230FE6508(uint64_t result, float a2)
{
  _QWORD *v2;
  float *v3;

  *v3 = a2;
  *v2 = result;
  return result;
}

void sub_230FE6924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FE6940(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230FDD000, v2, OS_LOG_TYPE_DEFAULT, "Lock state has changed, checking access.", v5, 2u);
  }

  objc_msgSend__updateAccessAllowedForLockState(WeakRetained, v3, v4);
}

void sub_230FE6B60(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  objc_msgSend_configuration(MEMORY[0x24BE4D0B0], a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_setAdaptive_(v17, v6, 1);
  objc_msgSend_setConfiguration_(MEMORY[0x24BE4D0B0], v7, (uint64_t)v17);
  objc_msgSend_sharedDispatcher(MEMORY[0x24BE4D0B0], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_warmup(v10, v11, v12);

  objc_msgSend_sharedInstance(MEMORY[0x24BE4D098], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRunningState_(v15, v16, 1);

}

void HUCCUpdateRunningStateWithAppleMediaAccessories(int a1, const char *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  id v23;

  objc_msgSend_sharedInstance(MEMORY[0x24BE4D098], a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_runningState(v5, v6, v7);

  if (v8 != (a1 ^ 1))
  {
    if (a1)
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        objc_msgSend_sharedManager(MEMORY[0x24BE4D060], v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_enableNotificationsForSelectedHomeWithReason_numberOfAppleMediaAccessories_(v13, v14, *MEMORY[0x24BE4CFE8], a2);

      }
      objc_msgSend_sharedInstance(MEMORY[0x24BE4D098], v11, v12);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_executionEnvironmentWillEnterForeground(v23, v15, v16);
      goto LABEL_9;
    }
    objc_msgSend_sharedInstance(MEMORY[0x24BE4D098], v9, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_executionEnvironmentDidEnterBackground(v17, v18, v19);

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend_sharedManager(MEMORY[0x24BE4D060], v20, v21);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_disableNotificationsForSelectedHomeWithReason_(v23, v22, *MEMORY[0x24BE4CFE0]);
LABEL_9:

    }
  }
}

void launchHomeAppForModuleViewController(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  const char *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (a2)
  {
    v4 = a2;
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_230FDD000, v5, OS_LOG_TYPE_DEFAULT, "Launching Home app for moduleViewController %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v6, (uint64_t)CFSTR("com.apple.home://"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_openURL_completionHandler_(v4, v8, (uint64_t)v7, 0);

  }
}

const __CFString *HUCCStringForOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_24FFD8450[a1 - 1];
}

void sub_230FE8014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FE8040(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  HULocalizedBiometryString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FE8100;
  block[3] = &unk_24FFD8478;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v7);
}

void sub_230FE8100(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend_lockSecurityView(WeakRetained, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateUIWithInfoText_andActionText_(v4, v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id sub_230FE8458(void *a1, const char *a2, uint64_t a3, double a4)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  unint64_t v83;
  const char *v84;
  double v85;
  double v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  double v117;
  double v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  double v124;
  const char *v125;
  uint64_t v126;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD v137[4];
  _QWORD v138[4];
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[2];
  _BYTE v144[128];
  _QWORD v145[2];
  _QWORD v146[4];

  v146[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultOptionsForViewSize_(MEMORY[0x24BE4F468], a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HUCCSizeSubclassForModuleViewWidth((uint64_t)v7, v8, v9, a4);
  v128 = objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, v11, a3, v10);
  v12 = (void *)MEMORY[0x24BDD16E0];
  v14 = objc_msgSend__controlCenterModuleHCFNumberOfColumnsForSizeSubclass_(a1, v13, v10);
  objc_msgSend_numberWithUnsignedInteger_(v12, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOverrideNumberOfColumns_(v7, v17, (uint64_t)v16);

  v145[0] = &unk_24FFDD8B0;
  v145[1] = &unk_24FFDD8E0;
  v146[0] = &unk_24FFDD8C8;
  v146[1] = &unk_24FFDD8F8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)v146, v145, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hucc_constantForSizeSubclass_(v19, v20, v10);
  v22 = v21;

  objc_msgSend_setRowSpacing_(v7, v23, v24, v22);
  objc_msgSend_setColumnSpacing_(v7, v25, v26, v22);
  objc_msgSend_setSectionLeadingMargin_(v7, v27, v28, 0.0);
  objc_msgSend_setSectionTrailingMargin_(v7, v29, v30, 0.0);
  objc_msgSend_setSectionBottomMargin_(v7, v31, v32, 0.0);
  objc_msgSend_setSectionTopMargin_(v7, v33, v34, 0.0);
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  objc_msgSend_serviceCellOptions(v7, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v143[0] = v37;
  v129 = v7;
  objc_msgSend_sceneCellOptions(v7, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v40;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v41, (uint64_t)v143, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v133, v144, 16);
  if (v44)
  {
    v47 = v44;
    v132 = *(_QWORD *)v134;
    v130 = *MEMORY[0x24BDF77C0];
    v131 = *MEMORY[0x24BDF77C8];
    v48 = *MEMORY[0x24BDF77D0];
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v134 != v132)
          objc_enumerationMutation(v42);
        v50 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i);
        objc_msgSend_backgroundDisplayOptions(v50, v45, v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDisplayStyle_(v51, v52, 2);

        objc_msgSend_controlCenterSecondaryVibrancyEffect(MEMORY[0x24BDF6F88], v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setVibrancyEffect_(v50, v56, (uint64_t)v55);

        objc_msgSend_controlCenterSecondaryVibrancyEffect(MEMORY[0x24BDF6F88], v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSecondaryVibrancyEffect_(v50, v60, (uint64_t)v59);

        v141[0] = &unk_24FFDD8B0;
        v141[1] = &unk_24FFDD8E0;
        v142[0] = &unk_24FFDD8F8;
        v142[1] = &unk_24FFDD910;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v61, (uint64_t)v142, v141, 2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_hucc_constantForSizeSubclass_(v62, v63, v10);
        objc_msgSend_setCellInnerMargin_(v50, v64, v65);

        v139[0] = &unk_24FFDD8B0;
        v139[1] = &unk_24FFDD8E0;
        v140[0] = v131;
        v140[1] = v130;
        v139[2] = &unk_24FFDD928;
        v140[2] = v48;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v66, (uint64_t)v140, v139, 3);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_hucc_objectForSizeSubclass_(v67, v68, v10);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_defaultFontDescriptorWithTextStyle_addingSymbolicTraits_options_(MEMORY[0x24BDF6A78], v70, (uint64_t)v69, 2, 0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fontWithDescriptor_size_(MEMORY[0x24BDF6A70], v72, (uint64_t)v71, 0.0);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFont_(v50, v74, (uint64_t)v73);

      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v133, v144, 16);
    }
    while (v47);
  }

  objc_msgSend_sceneCellOptions(v129, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, v78, 0, v10);
  v81 = v80;
  v83 = objc_msgSend_numberOfColumns(v129, v80, v82);
  objc_msgSend_preferredSectionHeightForNumberOfServiceRows_spanningColumns_(v129, v84, v79, v83 / (unint64_t)v81);
  v86 = v85;
  objc_msgSend_rowSpacing(v129, v87, v88);
  objc_msgSend_setCellHeight_(v77, v90, v91, (v86 - (double)(unint64_t)(v128 - 1) * v89) / (double)(unint64_t)v128);
  objc_msgSend_setNumberOfTitleLines_(v77, v92, 2);
  objc_msgSend_font(v77, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDescriptionFont_(v77, v96, (uint64_t)v95);

  objc_msgSend_font(v77, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineHeight(v99, v100, v101);
  objc_msgSend_setTitleInterLineSpacing_(v77, v102, v103);

  objc_msgSend_font(v77, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineHeight(v106, v107, v108);
  objc_msgSend_setTitleDescriptionLineSpacing_(v77, v109, v110);

  objc_msgSend_serviceCellOptions(v129, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = &unk_24FFDD8B0;
  v137[1] = &unk_24FFDD958;
  v138[0] = &unk_24FFDD940;
  v138[1] = &unk_24FFDDAE0;
  v137[2] = &unk_24FFDD970;
  v137[3] = &unk_24FFDD988;
  v138[2] = &unk_24FFDD940;
  v138[3] = &unk_24FFDDAE0;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v114, (uint64_t)v138, v137, 4);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hucc_constantForSizeSubclass_(v115, v116, v10);
  v118 = v117;

  objc_msgSend_font(v113, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineHeight(v121, v122, v123);
  objc_msgSend_setLineSpacing_(v113, v125, v126, v118 * v124);

  return v129;
}

uint64_t sub_230FE89E4(void *a1, const char *a2, uint64_t a3)
{
  const char *v5;

  objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, a2, 1, a3);
  objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, v5, 0, a3);
  return HUHighestCommonFactor();
}

uint64_t sub_230FE8A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;

  v4 = a4 - 3;
  if (a3 == 1)
  {
    if (v4 < 3)
      return 3;
    else
      return 4;
  }
  else if (v4 > 2)
  {
    return 3;
  }
  else
  {
    return 2;
  }
}

double sub_230FE8A7C(void *a1, const char *a2, uint64_t a3, double a4)
{
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  double v16;
  double v17;

  v6 = HUCCSizeSubclassForModuleViewWidth((uint64_t)a1, a2, a3, a4);
  objc_msgSend_controlCenterLayoutOptionsForViewSize_itemType_(a1, v7, 0, a4, *MEMORY[0x24BDF7FB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_controlCenterGridLayoutForItemType_sizeSubclass_(a1, v9, 0, v6);
  v12 = v11;
  v14 = objc_msgSend_numberOfColumns(v8, v11, v13);
  objc_msgSend_preferredSectionHeightForNumberOfServiceRows_spanningColumns_(v8, v15, v10, v14 / (unint64_t)v12);
  v17 = v16;

  return v17;
}

void sub_230FE8F34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_230FE8F50(uint64_t a1, int a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    HFLogForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_230FF44E8(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  return 0;
}

void sub_230FE8F9C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend__configureAndAddRemoteViewController_forHome_(WeakRetained, v5, (uint64_t)v3, *(_QWORD *)(a1 + 32));
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_230FF451C(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

void sub_230FE91B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FE91D4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  const char *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend_setTransitionSubviewFrames_(WeakRetained, v4, (uint64_t)v3);

}

void sub_230FE959C(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  id v5;

  objc_msgSend_serviceViewControllerProxy(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lockAuthenticationCompleted_(v5, v4, (uint64_t)a2);

}

void sub_230FEA0D4(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  if (objc_msgSend_isExpanded(*(void **)(a1 + 32), a2, a3))
    v6 = 0.0;
  else
    v6 = 1.0;
  objc_msgSend_smartGridViewController(*(void **)(a1 + 32), v4, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(v12, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v9, v10, v11, v6);

}

uint64_t sub_230FEA59C(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v5[5];
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FEA628;
  v5[3] = &unk_24FFD8580;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_230FEA628(uint64_t a1, const char *a2, uint64_t a3)
{
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  double v91;
  double v92;
  const char *v93;
  uint64_t v94;
  double v95;
  double v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  double v119;
  double v120;
  const char *v121;
  uint64_t v122;
  double v123;
  double v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  double v132;
  double v133;
  const char *v134;
  uint64_t v135;
  double v136;
  double v137;
  const char *v138;
  uint64_t v139;
  double v140;
  double v141;
  const char *v142;
  uint64_t v143;
  double v144;
  double v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  double v153;
  double v154;
  const char *v155;
  uint64_t v156;
  double v157;
  double v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  double v181;
  double v182;
  const char *v183;
  uint64_t v184;
  double v185;
  double v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  id v206;

  objc_msgSend_transitionDeviceCornerRadius(*(void **)(a1 + 32), a2, a3);
  v5 = v4;
  objc_msgSend_view(*(void **)(a1 + 32), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animationView(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setContinuousCornerRadius_(v11, v12, v13, v5);

  CCUIExpandedModuleContinuousCornerRadius();
  v15 = v14;
  objc_msgSend_view(*(void **)(a1 + 32), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandedView(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setContinuousCornerRadius_(v21, v22, v23, v15);

  objc_msgSend_dashboardContainerViewController(*(void **)(a1 + 32), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandedContentFrame(v26, v27, v28);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend_view(*(void **)(a1 + 32), v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animationView(v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v42, v43, v44, v30, v32, v34, v36);

  objc_msgSend_dashboardContainerViewController(*(void **)(a1 + 32), v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandedContentFrame(v47, v48, v49);
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  objc_msgSend_view(*(void **)(a1 + 32), v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandedView(v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v63, v64, v65, v51, v53, v55, v57);

  objc_msgSend_view(*(void **)(a1 + 32), v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandedView(v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v71, v72, v73, 1.0);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v74, v75);
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;
  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v86, v87, v88, v77, v79, v81, v83);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v89, v90);
  v92 = v91;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v93, v94);
  v96 = v95;
  objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v99, v100, v101, 0.0, 0.0, v92, v96);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v102, v103);
  v105 = v104;
  v107 = v106;
  v109 = v108;
  v111 = v110;
  objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v114, v115, v116, v105, v107, v109, v111);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v117, v118);
  v120 = v119;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v121, v122);
  v124 = v123;
  objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v127, v128, v129, 0.0, 0.0, v120, v124);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v130, v131);
  v133 = v132;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v134, v135);
  v137 = v136;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v138, v139);
  v141 = v140 + 50.0;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v142, v143);
  v145 = v144;
  objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v146, v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v148, v149, v150, v133, v137, v141, v145);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v151, v152);
  v154 = v153 + 50.0;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v155, v156);
  v158 = v157;
  objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v159, v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v161, v162, v163, 0.0, 0.0, v154, v158);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v164, v165);
  v167 = v166;
  v169 = v168;
  v171 = v170;
  v173 = v172;
  objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v174, v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v176, v177, v178, v167, v169, v171, v173);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v179, v180);
  v182 = v181;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v183, v184);
  v186 = v185;
  objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v187, v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v189, v190, v191, 0.0, 0.0, v182, v186);

  objc_msgSend__iconViewInNavigationHeaderViewFrame(*(void **)(a1 + 32), v192, v193);
  v195 = v194;
  v197 = v196;
  v199 = v198;
  v201 = v200;
  objc_msgSend_transitionIconView(*(void **)(a1 + 32), v202, v203);
  v206 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v206, v204, v205, v195, v197, v199, v201);

}

uint64_t sub_230FEAA24(uint64_t a1, const char *a2)
{
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_230FEAAB4;
  v4[3] = &unk_24FFD8580;
  v5 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_230FEAFB4;
  v3[3] = &unk_24FFD8530;
  v3[4] = v5;
  return objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], a2, 0, v4, v3, 0.0, 0.0);
}

uint64_t sub_230FEAAB4(uint64_t a1, const char *a2)
{
  uint64_t v3;
  const char *v4;
  const char *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_230FEABA4;
  v9[3] = &unk_24FFD8580;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BDF6F90], a2, (uint64_t)v9, 0.0, 0.0);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = sub_230FEACE0;
  v8[3] = &unk_24FFD8580;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BDF6F90], v4, (uint64_t)v8, 0.05, 0.2);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = sub_230FEAE24;
  v7[3] = &unk_24FFD8580;
  v7[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BDF6F90], v5, (uint64_t)v7, 0.02, 0.1);
}

uint64_t sub_230FEABA4(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v5[5];
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FEAC30;
  v5[3] = &unk_24FFD8580;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_230FEAC30(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  objc_msgSend_view(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animationView(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v7, v8, 0);

  objc_msgSend_view(*(void **)(a1 + 32), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandedView(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v14, v15, 0);

  objc_msgSend_smartGridViewController(*(void **)(a1 + 32), v16, v17);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v22, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v20, v21, 1);

}

uint64_t sub_230FEACE0(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v5[5];
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FEAD6C;
  v5[3] = &unk_24FFD8580;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_230FEAD6C(uint64_t a1, const char *a2, uint64_t a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id v27;

  objc_msgSend_transitionCompressedViewFrame(*(void **)(a1 + 32), a2, a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend_view(*(void **)(a1 + 32), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compressedView(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v17, v18, v19, v5, v7, v9, v11);

  objc_msgSend_view(*(void **)(a1 + 32), v20, v21);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compressedView(v27, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v24, v25, v26, 0.0);

}

uint64_t sub_230FEAE24(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v5[5];
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FEAEB0;
  v5[3] = &unk_24FFD8580;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_230FEAEB0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;

  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v4, v5, v6, 1.0);

  objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v9, v10, v11, 1.0);

  objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v14, v15, v16, 0.0);

  objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v19, v20, v21, 0.0);

  objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v24, v25, v26, 1.0);

  objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v29, v30, v31, 1.0);

  objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v34, v35, v36, 0.0);

  objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v37, v38);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v41, v39, v40, 0.0);

}

void sub_230FEAFB4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t isExpanded;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  id v78;

  objc_msgSend_dashboardContainerViewController(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isExpanded = objc_msgSend_isExpanded(*(void **)(a1 + 32), v5, v6);
  objc_msgSend_willFinishTransition_forCompactModule_(v4, v8, isExpanded, 0);

  if ((objc_msgSend_isAnIPad(MEMORY[0x24BE4D198], v9, v10) & 1) == 0)
  {
    CCUIExpandedModuleContinuousCornerRadius();
    v14 = v13;
    objc_msgSend_view(*(void **)(a1 + 32), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedView(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v20, v21, v22, v14);

    objc_msgSend_transitionDeviceCornerRadius(*(void **)(a1 + 32), v23, v24);
    v26 = v25;
    objc_msgSend_view(*(void **)(a1 + 32), v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_animationView(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v32, v33, v34, v26);

  }
  v35 = *MEMORY[0x24BDBEFB0];
  v36 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend_view(*(void **)(a1 + 32), v11, v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compressedView(v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrameOrigin_(v40, v41, v42, v35, v36);

  objc_msgSend_transitionIconView(*(void **)(a1 + 32), v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v45, v46, 1);

  objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v49, v50, 1);

  objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v53, v54, 1);

  objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v57, v58, 1);

  objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v61, v62, 1);

  objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v65, v66, 1);

  objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v69, v70, 1);

  objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v73, v74, 1);

  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v75, v76);
  v78 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v78, v77, 1);

}

uint64_t sub_230FEB1C8(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v5[5];
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FEB254;
  v5[3] = &unk_24FFD8580;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_230FEB254(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  double v76;
  double v77;
  const char *v78;
  uint64_t v79;
  double v80;
  double v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  double v89;
  double v90;
  const char *v91;
  uint64_t v92;
  double v93;
  double v94;
  const char *v95;
  uint64_t v96;
  double v97;
  double v98;
  const char *v99;
  uint64_t v100;
  double v101;
  double v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  double v110;
  double v111;
  const char *v112;
  uint64_t v113;
  double v114;
  double v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  double v138;
  double v139;
  const char *v140;
  uint64_t v141;
  double v142;
  double v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  double v151;
  double v152;
  const char *v153;
  uint64_t v154;
  double v155;
  double v156;
  const char *v157;
  uint64_t v158;
  double v159;
  double v160;
  const char *v161;
  uint64_t v162;
  double v163;
  double v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  double v172;
  double v173;
  const char *v174;
  uint64_t v175;
  double v176;
  double v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  const char *v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  id v197;

  objc_msgSend_smartGridViewController(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__continuousCornerRadius(v7, v8, v9);
  v11 = v10;
  objc_msgSend_view(*(void **)(a1 + 32), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animationView(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setContinuousCornerRadius_(v17, v18, v19, v11);

  v20 = *MEMORY[0x24BDBEFB0];
  v21 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend_view(*(void **)(a1 + 32), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compressedView(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrameOrigin_(v27, v28, v29, v20, v21);

  objc_msgSend_view(*(void **)(a1 + 32), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compressedView(v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v35, v36, v37, 1.0);

  objc_msgSend_view(*(void **)(a1 + 32), v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compressedAnimationStartFrame(v40, v41, v42);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  objc_msgSend_view(*(void **)(a1 + 32), v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animationView(v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v56, v57, v58, v44, v46, v48, v50);

  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v59, v60);
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v68 = v67;
  objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v71, v72, v73, v62, v64, v66, v68);

  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v74, v75);
  v77 = v76;
  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v78, v79);
  v81 = v80;
  objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v84, v85, v86, 0.0, 0.0, v77, v81);

  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v87, v88);
  v90 = v89;
  objc_msgSend__homeNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v91, v92);
  v94 = v93;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v95, v96);
  v98 = v97;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v99, v100);
  v102 = v101;
  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v105, v106, v107, v90, v94, v98, v102);

  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v108, v109);
  v111 = v110;
  objc_msgSend__homeNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v112, v113);
  v115 = v114;
  objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v118, v119, v120, 0.0, 0.0, v111, v115);

  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v121, v122);
  v124 = v123;
  v126 = v125;
  v128 = v127;
  v130 = v129;
  objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v131, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v133, v134, v135, v124, v126, v128, v130);

  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v136, v137);
  v139 = v138;
  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v140, v141);
  v143 = v142;
  objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v146, v147, v148, 0.0, 0.0, v139, v143);

  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v149, v150);
  v152 = v151;
  objc_msgSend__roomNameLabelInHomeGridCellFrame(*(void **)(a1 + 32), v153, v154);
  v156 = v155;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v157, v158);
  v160 = v159;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v161, v162);
  v164 = v163;
  objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v167, v168, v169, v152, v156, v160, v164);

  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v170, v171);
  v173 = v172;
  objc_msgSend__roomNameLabelInNavigationHeaderViewFrame(*(void **)(a1 + 32), v174, v175);
  v177 = v176;
  objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v178, v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v180, v181, v182, 0.0, 0.0, v173, v177);

  objc_msgSend__iconViewInHomeGridCellFrame(*(void **)(a1 + 32), v183, v184);
  v186 = v185;
  v188 = v187;
  v190 = v189;
  v192 = v191;
  objc_msgSend_transitionIconView(*(void **)(a1 + 32), v193, v194);
  v197 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v197, v195, v196, v186, v188, v190, v192);

}

uint64_t sub_230FEB628(uint64_t a1, const char *a2)
{
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_230FEB6B8;
  v4[3] = &unk_24FFD8580;
  v5 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_230FEBC10;
  v3[3] = &unk_24FFD8530;
  v3[4] = v5;
  return objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(MEMORY[0x24BDF6F90], a2, 0, v4, v3, 0.0, 0.0);
}

uint64_t sub_230FEB6B8(uint64_t a1, const char *a2)
{
  uint64_t v3;
  const char *v4;
  const char *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_230FEB7A4;
  v9[3] = &unk_24FFD8580;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BDF6F90], a2, (uint64_t)v9, 0.0, 0.0);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = sub_230FEB9A8;
  v8[3] = &unk_24FFD8580;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BDF6F90], v4, (uint64_t)v8, 0.0, 0.15);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = sub_230FEBA80;
  v7[3] = &unk_24FFD8580;
  v7[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(MEMORY[0x24BDF6F90], v5, (uint64_t)v7, 0.3, 0.1);
}

uint64_t sub_230FEB7A4(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v5[5];
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FEB830;
  v5[3] = &unk_24FFD8580;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_230FEB830(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  id v49;

  if ((objc_msgSend_isAnIPad(MEMORY[0x24BE4D198], a2, a3) & 1) == 0)
  {
    objc_msgSend_transitionDeviceCornerRadius(*(void **)(a1 + 32), v4, v5);
    v7 = v6;
    objc_msgSend_view(*(void **)(a1 + 32), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expandedView(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setContinuousCornerRadius_(v13, v14, v15, v7);

  }
  objc_msgSend_transitionIconView(*(void **)(a1 + 32), v4, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v16, v17, 0);

  objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v20, v21, 0);

  objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v24, v25, 0);

  objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v28, v29, 0);

  objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v32, v33, 0);

  objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v36, v37, 0);

  objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v40, v41, 0);

  objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v44, v45, 0);

  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v46, v47);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v49, v48, 0);

}

uint64_t sub_230FEB9A8(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v5[5];
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FEBA34;
  v5[3] = &unk_24FFD8580;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_230FEBA34(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_view(*(void **)(a1 + 32), a2, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandedView(v8, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v5, v6, v7, 0.0);

}

uint64_t sub_230FEBA80(uint64_t a1)
{
  void *v2;
  const char *v3;
  _QWORD v5[5];
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x24BDF6F90];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230FEBB0C;
  v5[3] = &unk_24FFD8580;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(v2, v3, 1769473, v5, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void sub_230FEBB0C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;

  objc_msgSend_transitionGridCellHomeNameLabelEffectView(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v4, v5, v6, 1.0);

  objc_msgSend_transitionGridCellHomeNameLabel(*(void **)(a1 + 32), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v9, v10, v11, 1.0);

  objc_msgSend_transitionNavigationHeaderHomeNameLabelEffectView(*(void **)(a1 + 32), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v14, v15, v16, 0.0);

  objc_msgSend_transitionNavigationHeaderHomeNameLabel(*(void **)(a1 + 32), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v19, v20, v21, 0.0);

  objc_msgSend_transitionGridCellRoomNameLabelEffectView(*(void **)(a1 + 32), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v24, v25, v26, 1.0);

  objc_msgSend_transitionGridCellRoomNameLabel(*(void **)(a1 + 32), v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v29, v30, v31, 1.0);

  objc_msgSend_transitionNavigationHeaderRoomNameLabelEffectView(*(void **)(a1 + 32), v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v34, v35, v36, 0.0);

  objc_msgSend_transitionNavigationHeaderRoomNameLabel(*(void **)(a1 + 32), v37, v38);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v41, v39, v40, 0.0);

}

uint64_t sub_230FEBC10(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t isExpanded;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;

  objc_msgSend_dashboardContainerViewController(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isExpanded = objc_msgSend_isExpanded(*(void **)(a1 + 32), v5, v6);
  objc_msgSend_willFinishTransition_forCompactModule_(v4, v8, isExpanded, 0);

  objc_msgSend_view(*(void **)(a1 + 32), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_animationView(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v14, v15, 1);

  objc_msgSend_smartGridViewController(*(void **)(a1 + 32), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homeCell(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHidden_(v21, v22, 0);

  objc_msgSend_setIsTransitioningToHomeControlService_(*(void **)(a1 + 32), v23, 0);
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__cleanupTransitionSubviews, v24);
}

void sub_230FEBE20(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  const char *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_230FEBEC4;
  v4[3] = &unk_24FFD85A8;
  objc_copyWeak(&v5, v1);
  objc_msgSend_requestAuthenticationIfLockedWithCompletionHandler_(WeakRetained, v3, (uint64_t)v4);
  objc_destroyWeak(&v5);

}

void sub_230FEBEB0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_230FEBEC4(uint64_t a1, int a2)
{
  const char *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__showLockSecurityView_(WeakRetained, v3, a2 ^ 1u);

}

void sub_230FED878(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  if ((_DWORD)a2)
  {
    NAEmptyResult();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithResult_(v3, v4, (uint64_t)v5);

  }
  else
  {
    objc_msgSend_cancel(*(void **)(a1 + 32), a2, a3);
  }
}

uint64_t sub_230FEDEE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230FEE18C(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_hf_characteristicValueManager(a2, (const char *)a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancelInFlightReadRequests(v5, v3, v4);

}

void sub_230FEE2C0(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_delegate(WeakRetained, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_launchHomeAppForSmartGridContentViewController_(v3, v4, (uint64_t)WeakRetained);

}

uint64_t type metadata accessor for HUCCAccessoryControlsContainerViewController()
{
  uint64_t result;

  result = qword_255EB16E8;
  if (!qword_255EB16E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_230FEE8B4()
{
  return swift_initClassMetadata2();
}

void sub_230FEE8FC(void *a1, int a2, int a3, void *aBlock)
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  objc_super v11;
  _QWORD aBlocka[6];

  v5 = _Block_copy(aBlock);
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v5 = sub_230FEEE58;
  }
  else
  {
    v6 = 0;
  }
  v7 = a1;
  v8 = sub_230FF4600();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v9[3] = v5;
  v9[4] = v6;
  aBlocka[4] = sub_230FEEDB0;
  aBlocka[5] = v9;
  aBlocka[0] = MEMORY[0x24BDAC760];
  aBlocka[1] = 1107296256;
  aBlocka[2] = sub_230FEEE64;
  aBlocka[3] = &unk_24FFD8780;
  v10 = _Block_copy(aBlocka);
  swift_retain();
  sub_230FEEE04((uint64_t)v5);
  swift_release();
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for HUCCAccessoryControlsContainerViewController();
  objc_msgSendSuper2(&v11, sel_dismissViewControllerAnimated_completion_, 0, v10);
  _Block_release(v10);
  swift_release();
  sub_230FEED3C((uint64_t)v5);

}

void sub_230FEEA40(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)();
  uint64_t v8;

  if ((*(_BYTE *)(v3 + qword_255EB16E0) & 1) != 0)
  {
    if (a2)
      a2();
  }
  else
  {
    *(_BYTE *)(v3 + qword_255EB16E0) = 1;
    if (a2)
    {
      v6 = swift_allocObject();
      *(_QWORD *)(v6 + 16) = a2;
      *(_QWORD *)(v6 + 24) = a3;
      v7 = sub_230FEEE38;
    }
    else
    {
      v6 = 0;
      v7 = nullsub_1;
    }
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v7;
    *(_QWORD *)(v8 + 24) = v6;
    sub_230FEEE04((uint64_t)a2);
    sub_230FF45F4();
    swift_release();
  }
}

void sub_230FEEB34(void *a1, int a2, uint64_t a3, void *aBlock)
{
  void (*v6)(void);
  uint64_t v7;
  id v8;

  v6 = (void (*)(void))_Block_copy(aBlock);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_230FEED70;
  }
  else
  {
    v7 = 0;
  }
  v8 = a1;
  sub_230FEEA40(a3, v6, v7);
  sub_230FEED3C((uint64_t)v6);

}

void *sub_230FEEBD0(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _BYTE *v7;
  void *v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  uint64_t v12;

  v3 = sub_230FF45DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone(v1);
  v7[qword_255EB16E0] = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v8 = (void *)sub_230FF4750();
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v10 = v8;
  v9(a1, v3);
  if (v8)

  return v8;
}

id sub_230FEECAC(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  objc_super v5;

  a1[qword_255EB16E0] = 0;
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for HUCCAccessoryControlsContainerViewController();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

id sub_230FEED00()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HUCCAccessoryControlsContainerViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_230FEED34()
{
  return type metadata accessor for HUCCAccessoryControlsContainerViewController();
}

uint64_t sub_230FEED3C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_230FEED4C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_230FEED70()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_230FEED7C()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_230FEEDB0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t result;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 24);
  result = sub_230FF4618();
  if (v1)
    return v1(result);
  return result;
}

uint64_t sub_230FEEDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_230FEEDFC()
{
  return swift_release();
}

uint64_t sub_230FEEE04(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_230FEEE14()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_230FEEE38()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_230FEEE64(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id HUCCSmartGridViewController.presentAccessoryControls(for:)(void *a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v18;
  id v19;
  _QWORD aBlock[6];

  sub_230FEF0A8(&qword_25414D0B0);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v1, sel_unwrappedItemForAccessoryControls_, a1);
  if (v5)
  {
    v6 = v5;
    v7 = sub_230FF487C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = v1;
    v8[3] = v6;
    v8[4] = a1;
    v9 = v1;
    v10 = v6;
    v11 = a1;
    sub_230FEF0A8(&qword_255EB1818);
    v12 = (void *)sub_230FF4648();
    swift_release();
    sub_230FEFC10((uint64_t)v4, &qword_25414D0B0);
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v9;
    aBlock[4] = sub_230FEF530;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_230FEF850;
    aBlock[3] = &unk_24FFD8880;
    v14 = _Block_copy(aBlock);
    v15 = v9;
    swift_release();
    v16 = objc_msgSend(v12, sel_flatMap_, v14);
    _Block_release(v14);

    return v16;
  }
  else
  {
    v18 = objc_msgSend((id)objc_opt_self(), sel_futureWithNoResult);
    v19 = objc_msgSend(v18, sel_asGeneric);

    return v19;
  }
}

uint64_t sub_230FEF0A8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348CD6D8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230FEF0E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t sub_230FEF104()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[17];
  v1 = v0[18];
  v3 = (void *)v0[16];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_230FEF1AC;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_230FEF3A4;
  v5[3] = &unk_24FFD8A10;
  v5[4] = v4;
  objc_msgSend(v3, sel_accessoryControlViewControllerFor_tileItem_completionHandler_, v2, v1, v5);
  return swift_continuation_await();
}

uint64_t sub_230FEF1AC()
{
  return swift_task_switch();
}

uint64_t sub_230FEF1F8()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  if (!*(_QWORD *)(v0 + 120))
  {
    v2 = sub_230FF460C();
    sub_230FF0680(&qword_255EB1880, (uint64_t (*)(uint64_t))MEMORY[0x24BE4D2A0], MEMORY[0x24BE4D2A8]);
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, *MEMORY[0x24BE4D298], v2);
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230FEF2B8()
{
  id *v0;

  return swift_deallocObject();
}

uint64_t sub_230FEF2EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_230FEF354;
  *(_QWORD *)(v3 + 144) = v2;
  *(_OWORD *)(v3 + 128) = v4;
  return swift_task_switch();
}

uint64_t sub_230FEF354(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_230FEF3A4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_230FF06C0((uint64_t)&v6, v3);
  return swift_continuation_resume();
}

id sub_230FEF3EC(void *a1, void *a2)
{
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;

  sub_230FEF0A8(&qword_25414D0B0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6B608]), sel_init);
  v7 = sub_230FF487C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 1, 1, v7);
  sub_230FF4864();
  v8 = a2;
  v9 = a1;
  v10 = v6;
  v11 = sub_230FF4858();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v8;
  v12[5] = v9;
  v12[6] = v10;
  sub_230FF071C((uint64_t)v5, (uint64_t)&unk_255EB1878, (uint64_t)v12);
  swift_release();
  return v10;
}

uint64_t sub_230FEF50C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_230FEF530(void *a1)
{
  uint64_t v1;

  return sub_230FEF3EC(a1, *(void **)(v1 + 16));
}

uint64_t sub_230FEF538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  sub_230FF4864();
  v6[11] = sub_230FF4858();
  sub_230FF484C();
  return swift_task_switch();
}

id sub_230FEF5A8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id result;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v1 = (void *)v0[8];
  v2 = v0[9];
  swift_release();
  objc_msgSend(v1, sel_configureWithAccessoryControlViewController_, v2);
  result = objc_msgSend(v1, sel_hu_presentPreloadableViewController_animated_, v2, objc_msgSend(v1, sel_controlsWantSystemPresentationAnimations));
  if (result)
  {
    v4 = result;
    v6 = (void *)v0[9];
    v5 = (void *)v0[10];
    v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = v7;
    v8[3] = v6;
    v8[4] = v5;
    v0[6] = sub_230FF0674;
    v0[7] = v8;
    v0[2] = MEMORY[0x24BDAC760];
    v0[3] = 1107296256;
    v0[4] = sub_230FEF7E8;
    v0[5] = &unk_24FFD89E8;
    v9 = _Block_copy(v0 + 2);
    v10 = v6;
    v11 = v5;
    swift_release();
    v12 = objc_msgSend(v4, sel_addCompletionBlock_, v9);
    _Block_release(v9);

    return (id)((uint64_t (*)(void))v0[1])();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_230FEF70C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v7 = a3 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x2348CD7BC](v7);
  if (v8)
  {
    v9 = (void *)v8;
    type metadata accessor for HUCCAccessoryControlsContainerViewController();
    v10 = swift_dynamicCastClass();
    if (v10)
    {
      v11 = v10;
      v12 = a4;
      v13 = objc_msgSend(v9, sel_delegate);
      if (v13)
      {
        objc_msgSend(v13, sel_willPresentAccessoryControlsViewController_, v11);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
    objc_msgSend(a5, sel_finishWithNoResult);

  }
}

uint64_t sub_230FEF7E8(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_230FEF850(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_230FEF8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_230FEF8B0()
{
  return swift_release();
}

uint64_t HUCCSmartGridViewController.accessoryControlViewController(for:tileItem:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_230FEF0A8(&qword_255EB1828);
  v3[5] = swift_task_alloc();
  v4 = sub_230FF45DC();
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = sub_230FF4864();
  v3[12] = sub_230FF4858();
  sub_230FF475C();
  v5 = (_QWORD *)swift_task_alloc();
  v3[13] = v5;
  *v5 = v3;
  v5[1] = sub_230FEF9FC;
  return sub_230FF4744();
}

uint64_t sub_230FEF9FC()
{
  swift_task_dealloc();
  sub_230FF484C();
  return swift_task_switch();
}

uint64_t sub_230FEFA6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  _BYTE *v16;
  id v17;
  void (*v18)(uint64_t, uint64_t);
  id v19;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_230FEFC10(*(_QWORD *)(v0 + 40), &qword_255EB1828);
    v4 = 0;
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 72);
    v6 = *(_QWORD *)(v0 + 80);
    v8 = *(_QWORD *)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 48);
    v11 = *(void **)(v0 + 24);
    v10 = *(void **)(v0 + 32);
    v12 = *(void **)(v0 + 16);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 32))(v6, *(_QWORD *)(v0 + 40), v9);
    sub_230FF4774();
    swift_allocObject();
    v13 = v11;
    v14 = v10;
    sub_230FF4768();
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v15(v5, v6, v9);
    v16 = objc_allocWithZone((Class)type metadata accessor for HUCCAccessoryControlsContainerViewController());
    v16[qword_255EB16E0] = 0;
    v15(v7, v5, v9);
    v17 = v12;
    v4 = (void *)sub_230FF4750();
    v18 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v19 = v4;
    v18(v5, v9);
    if (v4)

    v18(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 48));
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void *))(v0 + 8))(v4);
}

uint64_t sub_230FEFC10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_230FEF0A8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_230FEFD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  sub_230FF4864();
  v4[6] = sub_230FF4858();
  sub_230FF484C();
  return swift_task_switch();
}

uint64_t sub_230FEFDF4()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;

  v1 = (void *)v0[5];
  v3 = (void *)v0[3];
  v2 = (const void *)v0[4];
  v4 = (void *)v0[2];
  swift_release();
  v0[7] = (uint64_t)_Block_copy(v2);
  v5 = v4;
  v6 = v3;
  v7 = v1;
  v8 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_230FEFE78;
  return HUCCSmartGridViewController.accessoryControlViewController(for:tileItem:)(v0[2], v0[3]);
}

uint64_t sub_230FEFE78(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 56);
  v4 = *(void **)(*v1 + 40);
  v6 = *(void **)(*v1 + 16);
  v5 = *(void **)(*v1 + 24);
  v8 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v8 + 8))();
}

Swift::Void __swiftcall HUCCSmartGridViewController.willDismiss(viewController:)(UIViewController *viewController)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  UIViewController *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v2 = sub_230FF47E0();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v16 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_230FF47F8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230FF0118();
  v10 = (void *)sub_230FF48B8();
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = viewController;
  *(_QWORD *)(v12 + 24) = v11;
  aBlock[4] = sub_230FF026C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_230FEEE64;
  aBlock[3] = &unk_24FFD88F8;
  v13 = _Block_copy(aBlock);
  v14 = viewController;
  swift_release();
  sub_230FF47EC();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_230FF0680(&qword_255EB1838, v3, MEMORY[0x24BEE5468]);
  sub_230FEF0A8(&qword_255EB1840);
  sub_230FF0274();
  sub_230FF4918();
  MEMORY[0x2348CD090](0, v9, v5, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_230FF0118()
{
  unint64_t result;

  result = qword_255EB1830;
  if (!qword_255EB1830)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255EB1830);
  }
  return result;
}

uint64_t sub_230FF0154()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_230FF0178(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  type metadata accessor for HUCCAccessoryControlsContainerViewController();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = v4;
    swift_beginAccess();
    v6 = MEMORY[0x2348CD7BC](a2 + 16);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = a1;
      v9 = objc_msgSend(v7, sel_delegate);

      if (v9)
      {
        objc_msgSend(v9, sel_willDismissAccessoryControlsViewController_, v5);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
  }
}

uint64_t sub_230FF0240()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_230FF026C()
{
  uint64_t v0;

  sub_230FF0178(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_230FF0274()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EB1848;
  if (!qword_255EB1848)
  {
    v1 = sub_230FF02C0(&qword_255EB1840);
    result = MEMORY[0x2348CD6F0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255EB1848);
  }
  return result;
}

uint64_t sub_230FF02C0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348CD6E4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230FF0358()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_230FF0394()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_230FF0708;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_255EB1850 + dword_255EB1850))(v2, v3, v5, v4);
}

uint64_t sub_230FF0410()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_230FF0708;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_255EB19A0 + dword_255EB19A0))(v2, v3, v4);
}

uint64_t sub_230FF048C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_230FF04B8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_230FF053C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255EB19A8 + dword_255EB19A8))(a1, v4, v5, v6);
}

uint64_t sub_230FF053C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_230FF0584()
{
  id *v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_230FF05C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_230FF0708;
  return sub_230FEF538(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_230FF0640()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_230FF0674(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_230FEF70C(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_230FF0680(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348CD6F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_230FF06C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_230FEF0A8(&qword_255EB1888);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_230FF071C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_230FF487C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_230FF4870();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_230FF3C28(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_230FF484C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t HUCCControlCenterModule.register(for:items:in:currentRegistration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_230FF0880()
{
  uint64_t v0;
  id v1;
  id v2;
  _QWORD *v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedDispatcher);
  v2 = objc_msgSend(v1, sel_homeManager);

  if (!v2)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *v3 = v0;
  v3[1] = sub_230FF0930;
  return sub_230FF0AB8(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_230FF0930()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_230FF0984()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  if (v0[5])
  {
    sub_230FF469C();
    swift_unknownObjectRetain();
    v1 = swift_dynamicCastClass();
    if (!v1)
      swift_unknownObjectRelease();
  }
  else
  {
    v1 = 0;
  }
  v0[8] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_230FF0A24;
  return sub_230FF0F10(v0[2], v0[3], v0[4], v1);
}

uint64_t sub_230FF0A24(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_230FF0A80()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_230FF0AB8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;

  ObjectType = swift_getObjectType();
  v2[5] = a2;
  v2[6] = ObjectType;
  v2[4] = a1;
  v6 = sub_230FF463C();
  v2[7] = v6;
  v2[8] = *(_QWORD *)(v6 - 8);
  v2[9] = swift_task_alloc();
  sub_230FF4864();
  v2[10] = sub_230FF4858();
  v2[11] = sub_230FF484C();
  v2[12] = v7;
  return swift_task_switch();
}

uint64_t sub_230FF0B68()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  sub_230FF1FC8(v0[4]);
  v2 = v1;
  v0[13] = v1;
  v0[14] = sub_230FF48D0();
  v5 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x24BDD4728] + MEMORY[0x24BDD4728]);
  v3 = (_QWORD *)swift_task_alloc();
  v0[15] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_230FF0BEC;
  return v5(v2);
}

uint64_t sub_230FF0BEC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 128) = v0;
  swift_task_dealloc();
  v3 = *(void **)(v2 + 112);
  if (v0)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();

  }
  return swift_task_switch();
}

uint64_t sub_230FF0C74()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230FF0CAC()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = v0;
  v2 = (void *)v0[16];
  swift_release();
  sub_230FF4624();
  v3 = v2;
  v4 = v2;
  v5 = sub_230FF4630();
  v6 = sub_230FF48AC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (void *)v0[16];
    v20 = v0[8];
    v21 = v0[7];
    v22 = v0[9];
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v23 = v19;
    *(_DWORD *)v8 = 136315394;
    v10 = sub_230FF4990();
    v0[2] = sub_230FF355C(v10, v11, &v23);
    sub_230FF4900();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2112;
    v12 = v7;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v13;
    sub_230FF4900();
    *v9 = v13;

    _os_log_impl(&dword_230FDD000, v5, v6, "%s: Failed to fetch updates for media devices with error: %@", (uint8_t *)v8, 0x16u);
    sub_230FEF0A8((uint64_t *)&unk_255EB1910);
    swift_arrayDestroy();
    MEMORY[0x2348CD738](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2348CD738](v19, -1, -1);
    MEMORY[0x2348CD738](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  }
  else
  {
    v14 = (void *)v0[16];
    v16 = v1[8];
    v15 = v1[9];
    v17 = v1[7];

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_230FF0F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;

  v5[6] = a4;
  v5[7] = v4;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  sub_230FF4660();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4CCD8];
  v5[8] = sub_230FF4654();
  sub_230FF0680(&qword_255EB1988, v6, MEMORY[0x24BE4CCE0]);
  v5[9] = sub_230FF484C();
  v5[10] = v7;
  return swift_task_switch();
}

uint64_t sub_230FF0FA8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 48);
  if (v1)
  {
    sub_230FF4034(0, &qword_255EB19D0);
    swift_retain();
    v2 = (void *)sub_230FF4690();
    v3 = sub_230FF48E8();

    if ((v3 & 1) != 0)
    {
      v4 = *(_QWORD *)(v0 + 24);
      swift_release();
      v5 = sub_230FF4678();
      sub_230FF2DF8(v5, v4);
      LOBYTE(v4) = v6;
      swift_bridgeObjectRelease();
      if ((v4 & 1) == 0)
      {
        sub_230FF17C8(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
        sub_230FF466C();
      }
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
    }
    else
    {
      sub_230FF46D8();
      *(_QWORD *)(v0 + 88) = sub_230FF46CC();
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 96) = v8;
      *v8 = v0;
      v8[1] = sub_230FF1134;
      return sub_230FF46C0();
    }
  }
  else
  {
    sub_230FF4864();
    *(_QWORD *)(v0 + 104) = sub_230FF4858();
    sub_230FF484C();
    return swift_task_switch();
  }
}

uint64_t sub_230FF1134()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_230FF1188()
{
  uint64_t v0;

  swift_release();
  sub_230FF4864();
  *(_QWORD *)(v0 + 104) = sub_230FF4858();
  sub_230FF484C();
  return swift_task_switch();
}

uint64_t sub_230FF11F8()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v1 = *(void **)(v0 + 56);
  swift_release();
  v2 = objc_msgSend(v1, sel_currentContentViewController);
  if (!v2)
    goto LABEL_5;
  v3 = v2;
  objc_opt_self();
  v4 = (void *)swift_dynamicCastObjCClass();
  if (!v4)
  {

LABEL_5:
    v9 = objc_msgSend(*(id *)(v0 + 56), sel_currentContentViewController);
    *(_QWORD *)(v0 + 16) = v9;
    sub_230FEF0A8(&qword_255EB19C8);
    v6 = sub_230FF48F4();
    v8 = v10;

    goto LABEL_6;
  }
  v5 = objc_msgSend(v4, sel_fullDescription);
  v6 = sub_230FF4804();
  v8 = v7;

LABEL_6:
  *(_QWORD *)(v0 + 112) = v8;
  *(_QWORD *)(v0 + 120) = v6;
  return swift_task_switch();
}

uint64_t sub_230FF12EC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;

  v1 = v0[4];
  v2 = (void *)v0[5];
  v3 = v0[3];
  sub_230FF469C();
  swift_allocObject();
  v4 = v2;
  swift_bridgeObjectRetain();
  v0[16] = sub_230FF4684();
  sub_230FF17C8(v3, v1);
  sub_230FF46D8();
  v0[17] = sub_230FF46CC();
  v5 = (_QWORD *)swift_task_alloc();
  v0[18] = v5;
  *v5 = v0;
  v5[1] = sub_230FF13C0;
  return sub_230FF46B4();
}

uint64_t sub_230FF13C0()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_230FF1414()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 128));
}

uint64_t sub_230FF15A0(int a1, int a2, void *a3, uint64_t a4, void *aBlock, void *a6)
{
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD *v15;

  v6[3] = a4;
  v6[4] = a6;
  v6[2] = a3;
  v6[5] = _Block_copy(aBlock);
  sub_230FF4034(0, &qword_255EB1968);
  v10 = MEMORY[0x24BEE5BD8];
  sub_230FF3D6C(&qword_255EB1970, &qword_255EB1968, 0x24BDD75B8, MEMORY[0x24BEE5BD8]);
  v11 = sub_230FF4894();
  v6[6] = v11;
  sub_230FF4034(0, &qword_255EB1948);
  sub_230FF3D6C(&qword_255EB1950, &qword_255EB1948, 0x24BE4D0C0, v10);
  v12 = sub_230FF4894();
  v6[7] = v12;
  v13 = a3;
  swift_unknownObjectRetain();
  v14 = a6;
  v15 = (_QWORD *)swift_task_alloc();
  v6[8] = v15;
  *v15 = v6;
  v15[1] = sub_230FF1718;
  v15[5] = a4;
  v15[6] = v14;
  v15[3] = v12;
  v15[4] = v13;
  v15[2] = v11;
  return swift_task_switch();
}

uint64_t sub_230FF1718(uint64_t a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 40);
  v4 = *(void **)(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  v3[2](v3, a1);
  _Block_release(v3);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_230FF17C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_230FF46F0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0 && sub_230FF4930() < 0)
  {
    sub_230FF4978();
    __break(1u);
  }
  sub_230FF1900(a2);
  sub_230FF46E4();
  sub_230FF0680(&qword_255EB19D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F338], MEMORY[0x24BE4F328]);
  sub_230FF45E8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_230FF1900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_230FF4924();
    sub_230FF4034(0, &qword_255EB1948);
    sub_230FF3D6C(&qword_255EB1950, &qword_255EB1948, 0x24BE4D0C0, MEMORY[0x24BEE5BD8]);
    sub_230FF48A0();
    v1 = v18;
    v17 = v19;
    v2 = v20;
    v3 = v21;
    v4 = v22;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v17 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    v12 = v3;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    if (!sub_230FF4948())
      goto LABEL_31;
    sub_230FF4034(0, &qword_255EB1948);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v10 = v23;
    swift_unknownObjectRelease();
    if (!v23)
      goto LABEL_31;
LABEL_10:
    objc_opt_self();
    v11 = swift_dynamicCastObjCClass();

    if (v11)
      goto LABEL_31;
  }
  if (v4)
  {
    v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v9 = v8 | (v3 << 6);
LABEL_9:
    v10 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v9);
    if (!v10)
      goto LABEL_31;
    goto LABEL_10;
  }
  v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v16)
      goto LABEL_31;
    v14 = *(_QWORD *)(v17 + 8 * v13);
    ++v3;
    if (!v14)
    {
      v3 = v12 + 2;
      if (v12 + 2 >= v16)
        goto LABEL_31;
      v14 = *(_QWORD *)(v17 + 8 * v3);
      if (!v14)
      {
        v3 = v12 + 3;
        if (v12 + 3 >= v16)
          goto LABEL_31;
        v14 = *(_QWORD *)(v17 + 8 * v3);
        if (!v14)
        {
          v3 = v12 + 4;
          if (v12 + 4 >= v16)
            goto LABEL_31;
          v14 = *(_QWORD *)(v17 + 8 * v3);
          if (!v14)
          {
            v3 = v12 + 5;
            if (v12 + 5 >= v16)
              goto LABEL_31;
            v14 = *(_QWORD *)(v17 + 8 * v3);
            if (!v14)
            {
              v15 = v12 + 6;
              while (v16 != v15)
              {
                v14 = *(_QWORD *)(v17 + 8 * v15++);
                if (v14)
                {
                  v3 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_230FF406C();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v4 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_230FF1C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_230FF1C20()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  *(_QWORD *)(v0 + 24) = sub_230FF46D8();
  sub_230FF4660();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4CCD8];
  *(_QWORD *)(v0 + 32) = sub_230FF4654();
  sub_230FF0680(&qword_255EB1988, v1, MEMORY[0x24BE4CCE0]);
  sub_230FF484C();
  return swift_task_switch();
}

uint64_t sub_230FF1CB8()
{
  uint64_t v0;
  _QWORD *v1;

  swift_release();
  *(_QWORD *)(v0 + 40) = sub_230FF46CC();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_230FF1D1C;
  return sub_230FF46C0();
}

uint64_t sub_230FF1D1C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_230FF1FC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  int64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;

  sub_230FF45D0();
  MEMORY[0x24BDAC7A8]();
  v29 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BEE4AF8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_230FF4924();
    sub_230FF4034(0, &qword_255EB1948);
    sub_230FF3D6C(&qword_255EB1950, &qword_255EB1948, 0x24BE4D0C0, MEMORY[0x24BEE5BD8]);
    sub_230FF48A0();
    a1 = v32;
    v26 = v33;
    v3 = v34;
    v4 = v35;
    v5 = v36;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 56);
    v26 = a1 + 56;
    v8 = ~v6;
    v9 = -v6;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v5 = v10 & v7;
    swift_bridgeObjectRetain();
    v3 = v8;
    v4 = 0;
  }
  v24[0] = v3;
  v24[3] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v25 = (unint64_t)(v3 + 64) >> 6;
  v27 = xmmword_230FF61A0;
  v24[2] = MEMORY[0x24BEE4AD0] + 8;
  v28 = a1;
  if ((a1 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_31:
  v18 = sub_230FF4948();
  if (!v18)
    goto LABEL_41;
  v30 = v18;
  sub_230FF4034(0, &qword_255EB1948);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v17 = v31;
  swift_unknownObjectRelease();
  v13 = v4;
  v11 = v5;
  if (!v17)
    goto LABEL_41;
  while (1)
  {
    objc_opt_self();
    v19 = swift_dynamicCastObjCClass();
    if (!v19)
    {

      goto LABEL_10;
    }
    v20 = (void *)v19;
    v21 = v17;
    if ((objc_msgSend(v20, sel_isHomePod, v24[0]) & 1) == 0
      && !objc_msgSend(v20, sel_isAppleTV))
    {

LABEL_10:
      v4 = v13;
      v5 = v11;
      if (a1 < 0)
        goto LABEL_31;
      goto LABEL_11;
    }
    v22 = objc_msgSend(objc_msgSend(v20, sel_homeKitObject), sel_uniqueIdentifier);
    swift_unknownObjectRelease();
    sub_230FF45C4();

    sub_230FEF0A8(&qword_255EB19E0);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = v27;
    sub_230FF47BC();
    swift_allocObject();
    *(_QWORD *)(v23 + 32) = sub_230FF47B0();
    sub_230FF47D4();
    swift_allocObject();
    *(_QWORD *)(v23 + 40) = sub_230FF47C8();
    sub_230FF4804();
    sub_230FF478C();
    swift_allocObject();
    *(_QWORD *)(v23 + 48) = sub_230FF4780();
    sub_230FF4804();
    swift_allocObject();
    *(_QWORD *)(v23 + 56) = sub_230FF4780();
    v31 = (void *)v23;
    sub_230FF4828();
    sub_230FF47A4();
    swift_allocObject();
    sub_230FF4798();

    MEMORY[0x2348CCFE8]();
    if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_230FF4834();
    sub_230FF4840();
    sub_230FF4828();
    v4 = v13;
    v5 = v11;
    a1 = v28;
    if (v28 < 0)
      goto LABEL_31;
LABEL_11:
    if (!v5)
      break;
    v11 = (v5 - 1) & v5;
    v12 = __clz(__rbit64(v5)) | (v4 << 6);
    v13 = v4;
LABEL_29:
    v17 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v12);
    if (!v17)
      goto LABEL_41;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v25)
    goto LABEL_41;
  v15 = *(_QWORD *)(v26 + 8 * v14);
  v13 = v4 + 1;
  if (v15)
    goto LABEL_28;
  v13 = v4 + 2;
  if (v4 + 2 >= v25)
    goto LABEL_41;
  v15 = *(_QWORD *)(v26 + 8 * v13);
  if (v15)
    goto LABEL_28;
  v13 = v4 + 3;
  if (v4 + 3 >= v25)
    goto LABEL_41;
  v15 = *(_QWORD *)(v26 + 8 * v13);
  if (v15)
    goto LABEL_28;
  v13 = v4 + 4;
  if (v4 + 4 >= v25)
    goto LABEL_41;
  v15 = *(_QWORD *)(v26 + 8 * v13);
  if (v15)
    goto LABEL_28;
  v13 = v4 + 5;
  if (v4 + 5 >= v25)
    goto LABEL_41;
  v15 = *(_QWORD *)(v26 + 8 * v13);
  if (v15)
  {
LABEL_28:
    v11 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v13 << 6);
    goto LABEL_29;
  }
  v16 = v4 + 6;
  while (v25 != v16)
  {
    v15 = *(_QWORD *)(v26 + 8 * v16++);
    if (v15)
    {
      v13 = v16 - 1;
      goto LABEL_28;
    }
  }
LABEL_41:
  sub_230FF406C();
}

uint64_t sub_230FF2538()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  sub_230FEF0A8(&qword_25414D0B0);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_230FF487C();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  v7 = v0;
  if (v6 == 1)
  {
    sub_230FF3C28((uint64_t)v2);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    sub_230FF4870();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_230FF484C();
      v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = &unk_255EB1928;
  *(_QWORD *)(v11 + 24) = v5;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_230FF2700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_230FF2718()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  sub_230FF4714();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4F350];
  *(_QWORD *)(v0 + 24) = sub_230FF46FC();
  *(_QWORD *)(v0 + 32) = sub_230FF3D6C(&qword_25414D0B8, (unint64_t *)&unk_25414D0C0, (uint64_t)off_24FFD7A98, (uint64_t)&protocol conformance descriptor for HUCCControlCenterModule);
  sub_230FF0680((unint64_t *)&unk_25414D0A0, v1, MEMORY[0x24BE4F358]);
  sub_230FF484C();
  return swift_task_switch();
}

uint64_t sub_230FF27CC()
{
  uint64_t v0;

  sub_230FF4708();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HUCCControlCenterModule.configuration.getter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = swift_getObjectType();
  v3 = sub_230FF463C();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_230FF28A8()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v6;
  uint64_t v7;

  v1 = objc_msgSend(*(id *)(v0 + 40), sel_currentContentViewController);
  *(_QWORD *)(v0 + 80) = v1;
  if (v1)
  {
    v2 = v1;
    objc_opt_self();
    v3 = swift_dynamicCastObjCClass();
    *(_QWORD *)(v0 + 88) = v3;
    if (v3)
    {
      *(_QWORD *)(v0 + 96) = sub_230FF4864();
      v4 = v2;
      *(_QWORD *)(v0 + 104) = sub_230FF4858();
      sub_230FF484C();
      return swift_task_switch();
    }

  }
  v6 = *(_QWORD *)(v0 + 32);
  v7 = sub_230FF4738();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230FF29A4()
{
  _QWORD *v0;
  void *v1;
  void *v2;

  v1 = (void *)v0[10];
  v2 = (void *)v0[11];
  swift_release();
  v0[14] = objc_msgSend(v2, sel_itemManager);

  return swift_task_switch();
}

uint64_t sub_230FF2A04()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(void **)(v0 + 112);
  sub_230FF472C();
  v2 = swift_dynamicCastClass();
  *(_QWORD *)(v0 + 120) = v2;
  if (v2)
  {
    v3 = v1;
    *(_QWORD *)(v0 + 128) = sub_230FF4858();
    sub_230FF484C();
    return swift_task_switch();
  }
  else
  {
    sub_230FF4624();
    v5 = v1;
    v6 = sub_230FF4630();
    v7 = sub_230FF48AC();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(void **)(v0 + 112);
    v10 = *(_QWORD *)(v0 + 72);
    v11 = *(_QWORD *)(v0 + 56);
    v12 = *(_QWORD *)(v0 + 64);
    if (v8)
    {
      v23 = *(_QWORD *)(v0 + 72);
      v21 = *(void **)(v0 + 80);
      v22 = *(_QWORD *)(v0 + 64);
      v13 = swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v24 = v20;
      *(_DWORD *)v13 = 136315394;
      v15 = sub_230FF4990();
      *(_QWORD *)(v0 + 16) = sub_230FF355C(v15, v16, &v24);
      sub_230FF4900();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2112;
      *(_QWORD *)(v0 + 24) = v9;
      v17 = v9;
      sub_230FF4900();
      *v14 = v9;

      _os_log_impl(&dword_230FDD000, v6, v7, "%s: Failed to unwrap item manager to ControlCenterModuleItemManager: %@", (uint8_t *)v13, 0x16u);
      sub_230FEF0A8((uint64_t *)&unk_255EB1910);
      swift_arrayDestroy();
      MEMORY[0x2348CD738](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2348CD738](v20, -1, -1);
      MEMORY[0x2348CD738](v13, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v11);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
    v18 = *(_QWORD *)(v0 + 32);
    v19 = sub_230FF4738();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_230FF2CF4()
{
  swift_release();
  sub_230FF4720();
  return swift_task_switch();
}

uint64_t sub_230FF2D3C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 32);

  v3 = sub_230FF4738();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 0, 1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_230FF2DA8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_230FF0708;
  return HUCCControlCenterModule.configuration.getter(a1);
}

void sub_230FF2DF8(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;

  v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v4)
    {
      sub_230FF493C();
      return;
    }
    v6 = v5;
    v7 = a2;
    goto LABEL_13;
  }
  if (v4)
  {
    if (a2 < 0)
      v6 = a2;
    else
      v6 = a2 & 0xFFFFFFFFFFFFFF8;
    v7 = a1;
LABEL_13:
    sub_230FF310C(v6, v7);
    return;
  }
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v27 = a1 + 56;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(a1 + 56);
  sub_230FF4034(0, &qword_255EB1968);
  v11 = 0;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v12 = a2 + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_39;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v15 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v28)
        return;
      v16 = *(_QWORD *)(v27 + 8 * v11);
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v28)
          return;
        v16 = *(_QWORD *)(v27 + 8 * v11);
        if (!v16)
        {
          v11 = v15 + 3;
          if (v15 + 3 >= v28)
            return;
          v16 = *(_QWORD *)(v27 + 8 * v11);
          if (!v16)
            break;
        }
      }
    }
LABEL_38:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_39:
    v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v14);
    v19 = sub_230FF48DC();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_46;
    v29 = v11;
    v22 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
    v23 = sub_230FF48E8();

    if ((v23 & 1) == 0)
    {
      v24 = ~v20;
      while (1)
      {
        v21 = (v21 + 1) & v24;
        if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        v25 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
        v26 = sub_230FF48E8();

        if ((v26 & 1) != 0)
          goto LABEL_20;
      }
LABEL_46:

      return;
    }
LABEL_20:

    v11 = v29;
  }
  v17 = v15 + 4;
  if (v17 >= v28)
    return;
  v16 = *(_QWORD *)(v27 + 8 * v17);
  if (v16)
  {
    v11 = v17;
    goto LABEL_38;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_38;
  }
LABEL_49:
  __break(1u);
}

void sub_230FF310C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  char v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 != sub_230FF4930())
    return;
  v4 = 0;
  v5 = a2 + 56;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_6:
    v12 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v11);
    v13 = sub_230FF4954();

    if ((v13 & 1) == 0)
      return;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v14);
  ++v4;
  if (v15)
    goto LABEL_19;
  v4 = v14 + 1;
  if (v14 + 1 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    v8 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  v16 = v14 + 2;
  if (v16 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v9)
      return;
    v15 = *(_QWORD *)(v5 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_230FF325C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_230FF32C0;
  return v6(a1);
}

uint64_t sub_230FF32C0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_230FF330C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_230FF0708;
  return v6();
}

uint64_t sub_230FF3360(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_230FF0708;
  return v7();
}

uint64_t sub_230FF33B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_230FF487C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_230FF4870();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_230FF3C28(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_230FF484C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_230FF34F8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_230FF4074;
  return v6(a1);
}

uint64_t sub_230FF355C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_230FF362C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_230FF3FF4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_230FF3FF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_230FF3FD4((uint64_t)v12);
  return v7;
}

uint64_t sub_230FF362C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_230FF490C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_230FF37E4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_230FF496C();
  if (!v8)
  {
    sub_230FF4978();
    __break(1u);
LABEL_17:
    result = sub_230FF4984();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_230FF37E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_230FF3878(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_230FF3A50(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_230FF3A50(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_230FF3878(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_230FF39EC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_230FF4960();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_230FF4978();
      __break(1u);
LABEL_10:
      v2 = sub_230FF4810();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_230FF4984();
    __break(1u);
LABEL_14:
    result = sub_230FF4978();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_230FF39EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_230FEF0A8(&qword_255EB19C0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_230FF3A50(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_230FEF0A8(&qword_255EB19C0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_230FF4984();
  __break(1u);
  return result;
}

uint64_t sub_230FF3B9C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_230FF3BC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_230FF0708;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_230FF3C28(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_230FEF0A8(&qword_25414D0B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_230FF3C68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_230FF0708;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255EB1930 + dword_255EB1930))(a1, v4);
}

uint64_t sub_230FF3CD8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_230FF3CFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_230FF053C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255EB1930 + dword_255EB1930))(a1, v4);
}

uint64_t sub_230FF3D6C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_230FF4034(255, a2);
    result = MEMORY[0x2348CD6F0](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_230FF3DAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EB1960;
  if (!qword_255EB1960)
  {
    v1 = sub_230FF02C0(&qword_255EB1958);
    result = MEMORY[0x2348CD6F0](MEMORY[0x24BEE1728], v1);
    atomic_store(result, (unint64_t *)&qword_255EB1960);
  }
  return result;
}

uint64_t sub_230FF3DF8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_230FF3E24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_230FF0708;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_230FF3E84()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 48));

  return swift_deallocObject();
}

uint64_t sub_230FF3ED0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (void *)v0[4];
  v5 = v0[5];
  v7 = (void *)v0[6];
  v6 = (void *)v0[7];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_230FF0708;
  return ((uint64_t (*)(int, int, void *, uint64_t, void *, void *))((char *)&dword_255EB1990 + dword_255EB1990))(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_230FF3F64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_230FF0708;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255EB19B0 + dword_255EB19B0))(a1, v4);
}

uint64_t sub_230FF3FD4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_230FF3FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_230FF4034(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_230FF406C()
{
  return swift_release();
}

uint64_t sub_230FF4080()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void sub_230FF40B0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230FDD000, a2, OS_LOG_TYPE_ERROR, "%@: No items to display", (uint8_t *)&v2, 0xCu);
}

void sub_230FF4124(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_230FE64A0(&dword_230FDD000, a3, (uint64_t)a3, ")", a1);
}

void sub_230FF4158(uint64_t a1, uint64_t a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)sub_230FE64C0(a1, a2);
  objc_msgSend_groupIdentifier(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230FE6508((uint64_t)v5, 5.7779e-34);
  sub_230FE64AC(&dword_230FDD000, v6, v7, "%@: (");

  sub_230FE64DC();
}

void sub_230FF41A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230FE64E8();
  sub_230FE6490(&dword_230FDD000, v0, v1, "), initial state:", v2, v3, v4, v5, v6);
  sub_230FE64D4();
}

void sub_230FF41D0(uint64_t a1, uint64_t a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)sub_230FE64C0(a1, a2);
  objc_msgSend_operationDescription(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230FE6508((uint64_t)v5, 5.7779e-34);
  sub_230FE64AC(&dword_230FDD000, v6, v7, "  %@");

  sub_230FE64DC();
}

void sub_230FF421C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230FE64E8();
  sub_230FE6490(&dword_230FDD000, v0, v1, "Triggered by item updates: (", v2, v3, v4, v5, v6);
  sub_230FE64D4();
}

void sub_230FF4248()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230FE64E8();
  sub_230FE6490(&dword_230FDD000, v0, v1, ")", v2, v3, v4, v5, v6);
  sub_230FE64D4();
}

void sub_230FF4274()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_230FE64E8();
  _os_log_fault_impl(&dword_230FDD000, v0, OS_LOG_TYPE_FAULT, "ERROR: Inconsistencies detected between item manager state and collection view state! This is bad. Asserts: (", v1, 2u);
  sub_230FE64D4();
}

void sub_230FF42AC(uint64_t a1, char *a2, uint64_t a3)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_itemManager(*(void **)(a1 + 32), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemManager(*(void **)(a1 + 32), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412546;
  v12 = v5;
  v13 = 2048;
  v14 = objc_msgSend_numberOfSections(v8, v9, v10);
  _os_log_error_impl(&dword_230FDD000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Item manager: %@ believes there are %lu sections", (uint8_t *)&v11, 0x16u);

}

void sub_230FF4374()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230FE64E8();
  sub_230FE6490(&dword_230FDD000, v0, v1, "The update request contains:", v2, v3, v4, v5, v6);
  sub_230FE64D4();
}

void sub_230FF43A0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], a2, a3);
  sub_230FE64F4(&dword_230FDD000, v3, v4, "Is Main thread: %@", v5, v6, v7, v8, 2u);
  sub_230FE6514();
}

void sub_230FF4430(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_itemType(*(void **)(a1 + 32), a2, a3);
  sub_230FE64F4(&dword_230FDD000, v3, v4, "Control Center mode: %@", v5, v6, v7, v8, 2u);
  sub_230FE6514();
}

void sub_230FF44BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230FE64E8();
  sub_230FE6490(&dword_230FDD000, v0, v1, "Error: we're processing an update request with no insertions while the collection view says it has 0 sections before the update. UIKit will assert next.", v2, v3, v4, v5, v6);
  sub_230FE64D4();
}

void sub_230FF44E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230FE6490(&dword_230FDD000, a1, a3, "Timeout trying to load Remote Dashboard View Controller", a5, a6, a7, a8, 0);
}

void sub_230FF451C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230FE6490(&dword_230FDD000, a1, a3, "Unable to load Remote Dashboard View Controller", a5, a6, a7, a8, 0);
}

void sub_230FF4550(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230FDD000, a2, OS_LOG_TYPE_ERROR, "Remote Dashboard View Controller View Service terminated  (error: %@)", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_230FF45C4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_230FF45D0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_230FF45DC()
{
  return MEMORY[0x24BE4D278]();
}

uint64_t sub_230FF45E8()
{
  return MEMORY[0x24BE4DC80]();
}

uint64_t sub_230FF45F4()
{
  return MEMORY[0x24BE4D288]();
}

uint64_t sub_230FF4600()
{
  return MEMORY[0x24BE4D290]();
}

uint64_t sub_230FF460C()
{
  return MEMORY[0x24BE4D2A0]();
}

uint64_t sub_230FF4618()
{
  return MEMORY[0x24BE4D2B0]();
}

uint64_t sub_230FF4624()
{
  return MEMORY[0x24BE4F320]();
}

uint64_t sub_230FF4630()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_230FF463C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_230FF4648()
{
  return MEMORY[0x24BE4CC98]();
}

uint64_t sub_230FF4654()
{
  return MEMORY[0x24BE4CCD0]();
}

uint64_t sub_230FF4660()
{
  return MEMORY[0x24BE4CCD8]();
}

uint64_t sub_230FF466C()
{
  return MEMORY[0x24BE4CCE8]();
}

uint64_t sub_230FF4678()
{
  return MEMORY[0x24BE4CCF0]();
}

uint64_t sub_230FF4684()
{
  return MEMORY[0x24BE4CCF8]();
}

uint64_t sub_230FF4690()
{
  return MEMORY[0x24BE4CD00]();
}

uint64_t sub_230FF469C()
{
  return MEMORY[0x24BE4CD08]();
}

uint64_t sub_230FF46A8()
{
  return MEMORY[0x24BE4CD18]();
}

uint64_t sub_230FF46B4()
{
  return MEMORY[0x24BE4CD20]();
}

uint64_t sub_230FF46C0()
{
  return MEMORY[0x24BE4CD30]();
}

uint64_t sub_230FF46CC()
{
  return MEMORY[0x24BE4CD40]();
}

uint64_t sub_230FF46D8()
{
  return MEMORY[0x24BE4CD48]();
}

uint64_t sub_230FF46E4()
{
  return MEMORY[0x24BE4F330]();
}

uint64_t sub_230FF46F0()
{
  return MEMORY[0x24BE4F338]();
}

uint64_t sub_230FF46FC()
{
  return MEMORY[0x24BE4F340]();
}

uint64_t sub_230FF4708()
{
  return MEMORY[0x24BE4F348]();
}

uint64_t sub_230FF4714()
{
  return MEMORY[0x24BE4F350]();
}

uint64_t sub_230FF4720()
{
  return MEMORY[0x24BE4F360]();
}

uint64_t sub_230FF472C()
{
  return MEMORY[0x24BE4F368]();
}

uint64_t sub_230FF4738()
{
  return MEMORY[0x24BE4F370]();
}

uint64_t sub_230FF4744()
{
  return MEMORY[0x24BE4F378]();
}

uint64_t sub_230FF4750()
{
  return MEMORY[0x24BE4F388]();
}

uint64_t sub_230FF475C()
{
  return MEMORY[0x24BE4F390]();
}

uint64_t sub_230FF4768()
{
  return MEMORY[0x24BE4F3A0]();
}

uint64_t sub_230FF4774()
{
  return MEMORY[0x24BE4F3A8]();
}

uint64_t sub_230FF4780()
{
  return MEMORY[0x24BDD4730]();
}

uint64_t sub_230FF478C()
{
  return MEMORY[0x24BDD4738]();
}

uint64_t sub_230FF4798()
{
  return MEMORY[0x24BDD47A0]();
}

uint64_t sub_230FF47A4()
{
  return MEMORY[0x24BDD47A8]();
}

uint64_t sub_230FF47B0()
{
  return MEMORY[0x24BDD47B0]();
}

uint64_t sub_230FF47BC()
{
  return MEMORY[0x24BDD47B8]();
}

uint64_t sub_230FF47C8()
{
  return MEMORY[0x24BDD47C0]();
}

uint64_t sub_230FF47D4()
{
  return MEMORY[0x24BDD47C8]();
}

uint64_t sub_230FF47E0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_230FF47EC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_230FF47F8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_230FF4804()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230FF4810()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_230FF481C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_230FF4828()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_230FF4834()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_230FF4840()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_230FF484C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_230FF4858()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_230FF4864()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_230FF4870()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_230FF487C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_230FF4888()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_230FF4894()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_230FF48A0()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_230FF48AC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_230FF48B8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_230FF48C4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_230FF48D0()
{
  return MEMORY[0x24BDD47D8]();
}

uint64_t sub_230FF48DC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_230FF48E8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_230FF48F4()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_230FF4900()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_230FF490C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_230FF4918()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_230FF4924()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_230FF4930()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_230FF493C()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t sub_230FF4948()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_230FF4954()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_230FF4960()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_230FF496C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_230FF4978()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_230FF4984()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_230FF4990()
{
  return MEMORY[0x24BEE4A98]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x24BDE5440](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CCUICompactModuleContinuousCornerRadius()
{
  return MEMORY[0x24BE19A48]();
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return MEMORY[0x24BE19A58]();
}

uint64_t CCUIExpandedModuleContinuousCornerRadius()
{
  return MEMORY[0x24BE19A68]();
}

uint64_t CCUIExpandedModuleEdgeInsets()
{
  return MEMORY[0x24BE19A70]();
}

uint64_t CCUIIsPortrait()
{
  return MEMORY[0x24BE19A78]();
}

uint64_t CCUIItemEdgeSize()
{
  return MEMORY[0x24BE19A80]();
}

uint64_t CCUILayoutGutter()
{
  return MEMORY[0x24BE19A88]();
}

uint64_t CCUIMaximumExpandedContentModuleHeight()
{
  return MEMORY[0x24BE19AB0]();
}

uint64_t CCUIScreenBounds()
{
  return MEMORY[0x24BE19AD0]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HFLogForCategory()
{
  return MEMORY[0x24BE4CF30]();
}

uint64_t HUDefaultSizeForIconSize()
{
  return MEMORY[0x24BE4F4A0]();
}

uint64_t HUHighestCommonFactor()
{
  return MEMORY[0x24BE4F3C0]();
}

uint64_t HULocalizedBiometryString()
{
  return MEMORY[0x24BE4F3E0]();
}

uint64_t HULocalizedModelString()
{
  return MEMORY[0x24BE4F3E8]();
}

uint64_t HULocalizedString()
{
  return MEMORY[0x24BE4F3F0]();
}

uint64_t HUViewSizeSubclassForViewSize()
{
  return MEMORY[0x24BE4F408]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x24BED8480]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x24BE6B5E8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

