@implementation SFQRCodeDetectionController

void __48___SFQRCodeDetectionController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v1;

}

void __61___SFQRCodeDetectionController_getActionForImage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61___SFQRCodeDetectionController_getActionForImage_completion___block_invoke_2;
  v5[3] = &unk_1E4AC13D8;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __61___SFQRCodeDetectionController_getActionForImage_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = isLiveCameraOnlyAction(*(void **)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 || (v4 = *(_QWORD *)(a1 + 32)) == 0)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
  }
  else
  {
    v6 = CFSTR("action");
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v4, v5);

  }
}

void __72___SFQRCodeDetectionController_getActionForImageSynchronously_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if ((isLiveCameraOnlyAction(v4) & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

BOOL __49___SFQRCodeDetectionController_elementForAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == *(void **)(a1 + 32);

  return v5;
}

id __59___SFQRCodeDetectionController_menuElementsForElementInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v2 = a2;
  objc_msgSend(v2, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("qrcode"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v2, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59___SFQRCodeDetectionController_menuElementsForElementInfo___block_invoke_2;
  v12[3] = &unk_1E4ABFA58;
  v13 = v2;
  v9 = v2;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v6, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __59___SFQRCodeDetectionController_menuElementsForElementInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction");
}

void __72___SFQRCodeDetectionController_adjustedCopyActionForAction_elementInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safari_originalDataAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", v2);

}

uint64_t __72___SFQRCodeDetectionController_adjustedCopyActionForAction_elementInfo___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCopyActionItem");
}

@end
