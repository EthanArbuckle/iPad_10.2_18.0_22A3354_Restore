@implementation HUPinCodeUtilities

+ (id)createSharingViewControllerForPinCodeItem:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  _HUPinCodeActivityItemSource *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[_HUPinCodeActivityItemSource initWithPinCodeItem:]([_HUPinCodeActivityItemSource alloc], "initWithPinCodeItem:", v5);
  v8 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithActivityItems:applicationActivities:", v9, 0);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HUPinCodeUtilities_createSharingViewControllerForPinCodeItem_inHome___block_invoke;
  v14[3] = &unk_1E6F55C48;
  v15 = v6;
  v16 = v5;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v10, "setCompletionWithItemsHandler:", v14);

  return v10;
}

void __71__HUPinCodeUtilities_createSharingViewControllerForPinCodeItem_inHome___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = *MEMORY[0x1E0D301C8];
    v6[0] = *MEMORY[0x1E0D30310];
    v6[1] = v3;
    v4 = *(_QWORD *)(a1 + 40);
    v7[0] = *(_QWORD *)(a1 + 32);
    v7[1] = &unk_1E7041110;
    v6[2] = *MEMORY[0x1E0D301C0];
    v7[2] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 26, v5);

  }
}

@end
