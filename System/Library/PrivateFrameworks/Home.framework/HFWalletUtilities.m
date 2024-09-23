@implementation HFWalletUtilities

+ (id)handleAddOrShowHomeKeyButtonTapForHome:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20;
  id location;
  _QWORD v22[5];
  _QWORD v23[3];
  char v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[3];
  char v32;

  v4 = a3;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  objc_msgSend(v4, "hf_hasWalletKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke;
  v25[3] = &unk_1EA739DC0;
  v27 = v29;
  v7 = v4;
  v26 = v7;
  v28 = v31;
  objc_msgSend(v5, "flatMap:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  objc_msgSend(v7, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_3;
  v22[3] = &unk_1EA739E28;
  v22[4] = v23;
  objc_msgSend(v9, "flatMap:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, a1);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_5;
  v15[3] = &unk_1EA739EF8;
  objc_copyWeak(&v20, &location);
  v18 = v29;
  v11 = v7;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v19 = v23;
  v13 = (id)objc_msgSend(v8, "addSuccessBlock:", v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  return v8;
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "BOOLValue");
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "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");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_2;
    v8[3] = &unk_1EA72E100;
    v8[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "addSuccessBlock:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

uint64_t __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "count") != 0;
  objc_msgSend(v3, "na_filter:", &__block_literal_global_168);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "count") != 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "walletKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyInWalletAppURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "flatMap:", &__block_literal_global_19_6);

  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_7;
    v9[3] = &unk_1EA739ED0;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    v12 = WeakRetained;
    v13 = *(_QWORD *)(a1 + 56);
    v8 = (id)objc_msgSend(v7, "addSuccessBlock:", v9);

  }
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int8x16_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  int8x16_t v22;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  LODWORD(v3) = objc_msgSend(v3, "BOOLValue");
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = MEMORY[0x1E0C809B0];
  if (!(_DWORD)v3)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v10 = v5;
    else
      v10 = 1;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      +[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("bridge:root=com.apple.NanoPassbookBridgeSettings%230"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "openURL:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_9;
    }
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "hf_addWalletKeyToPairedWatchesWithOptions:", 0, *(_OWORD *)&v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recover:", &__block_literal_global_24_4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "hf_addWalletKeyWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_8;
  v21[3] = &unk_1EA726990;
  v18 = *(int8x16_t *)(a1 + 40);
  v8 = (id)v18.i64[0];
  v22 = vextq_s8(v18, v18, 8uLL);
  objc_msgSend(v7, "recover:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_11;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", *(_OWORD *)&v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "na_safeAddObject:", v9);
  objc_msgSend(v15, "na_safeAddObject:", v11);
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_2_28;
  v19[3] = &unk_1EA72ADB0;
  v20 = *(id *)(a1 + 40);
  v17 = (id)objc_msgSend(v16, "flatMap:", v19);

}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x42uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138413058;
    v10 = v7;
    v11 = 2080;
    v12 = "+[HFWalletUtilities handleAddOrShowHomeKeyButtonTapForHome:]_block_invoke_8";
    v13 = 2112;
    v14 = v3;
    v15 = 2112;
    v16 = v8;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "(%@:%s) hf_addWalletKeyWithOptions: with notification but without enabling Express Mode returned error %@ for home %@", (uint8_t *)&v9, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CBA528], "errorByDeviceWithOverallError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "na_safeAddObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }
  v10 = objc_msgSend(v4, "count");
  v11 = (void *)MEMORY[0x1E0D519C0];
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithResult:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

id __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_2_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x42uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v12 = 136315650;
    v13 = "+[HFWalletUtilities handleAddOrShowHomeKeyButtonTapForHome:]_block_invoke_2";
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "(HFWalletUtilities : %s) Completed adding Wallet Key without enabling Express Mode for iPhone and paired Apple Watches for home %@ with results %@", (uint8_t *)&v12, 0x20u);
  }

  objc_msgSend(v3, "na_arrayByFlattening");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_filter:", &__block_literal_global_31_6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") == 1 || (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleError:", v9);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __60__HFWalletUtilities_handleAddOrShowHomeKeyButtonTapForHome___block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isWalletKeyDeviceStateCompatible:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "canAddWalletKey") & 1) != 0
    || objc_msgSend(v3, "canAddWalletKeyErrorCode") != 4 && objc_msgSend(v3, "canAddWalletKeyErrorCode") != 3;

  return v4;
}

+ (id)walletAppURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("shoebox://"));
}

+ (id)walletAppFromAppStoreURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("itms-apps://apple.com/app/id1160481993"));
}

+ (id)walletKeyColorOfDeviceState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "walletKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "walletKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "color"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (unint64_t)pkPassHomeKeyLiveRenderTypeForHMHomeWalletKeyColor:(int64_t)a3
{
  if (a3 <= 14935010)
  {
    if (a3 == 14341582)
      return 2;
    return 3;
  }
  if (a3 != 14935011)
  {
    if (a3 == 15521450)
      return 4;
    return 3;
  }
  return 1;
}

+ (id)packageIconIdentifierForHome:(id)a3 shouldUseKeyholeAsset:(BOOL)a4
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  BOOL v9;

  objc_msgSend(a3, "hf_walletKeyColorToDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HFWalletUtilities_packageIconIdentifierForHome_shouldUseKeyholeAsset___block_invoke;
  v8[3] = &__block_descriptor_33_e28___NAFuture_16__0__NSNumber_8l;
  v9 = a4;
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __72__HFWalletUtilities_packageIconIdentifierForHome_shouldUseKeyholeAsset___block_invoke(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  if (*(_BYTE *)(a1 + 32))
    v1 = CFSTR("HFCAPackageIconIdentifierLockKeyhole");
  else
    v1 = CFSTR("HFCAPackageIconIdentifierLockKeypad");
  v2 = (void *)MEMORY[0x1E0CEAB40];
  v3 = v1;
  objc_msgSend(v2, "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
    v6 = CFSTR("%@DarkModeMatteBlack");
  else
    v6 = CFSTR("%@LightModeMatteBlack");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)walletKeyIconDescriptorForHome:(id)a3 shouldUseKeyholeAsset:(BOOL)a4 foriPhoneDevice:(BOOL)a5
{
  void *v7;
  void *v8;
  _QWORD v10[4];
  BOOL v11;
  BOOL v12;

  objc_msgSend(a1, "packageIconIdentifierForHome:shouldUseKeyholeAsset:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__HFWalletUtilities_walletKeyIconDescriptorForHome_shouldUseKeyholeAsset_foriPhoneDevice___block_invoke;
  v10[3] = &__block_descriptor_34_e28___NAFuture_16__0__NSString_8l;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __90__HFWalletUtilities_walletKeyIconDescriptorForHome_shouldUseKeyholeAsset_foriPhoneDevice___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  HFCAPackageIconDescriptor *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 32))
    v3 = CFSTR("Lock");
  else
    v3 = CFSTR("Keypad");
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (*(_BYTE *)(a1 + 33))
    v5 = CFSTR("iPhone");
  else
    v5 = CFSTR("Watch");
  v6 = a2;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 33))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v17 = 0;
    v9 = objc_msgSend(v8, "canEvaluatePolicy:error:", 2, &v17);
    v10 = v17;
    if (v9)
    {
      if (objc_msgSend(v8, "biometryType") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Home Button"), v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v12 = 1;
        v7 = (void *)v11;
      }
      else
      {
        v12 = 2;
      }
      HFLogForCategory(0x42uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "+[HFWalletUtilities walletKeyIconDescriptorForHome:shouldUseKeyholeAsset:foriPhoneDevice:]_block_invoke";
        v20 = 2048;
        v21 = v12;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "(%s) biometryType is %ld. localAuthenticationError: %@", buf, 0x20u);
      }

    }
  }
  v14 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:state:", v6, v7);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
