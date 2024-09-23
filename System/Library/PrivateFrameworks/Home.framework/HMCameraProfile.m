@implementation HMCameraProfile

BOOL __54__HMCameraProfile_HFAdditions__hf_thermalShutdownMode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "hasOperatingState"))
    v3 = objc_msgSend(v2, "lastKnownOperatingState") == 2;
  else
    v3 = 0;

  return v3;
}

void __66__HMCameraProfile_HFAdditions__hf_doorbellChimeMuteCharacteristic__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a2;
  objc_msgSend(v9, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB9A08]);

  if (v7)
  {
    objc_msgSend(v9, "characteristics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__HMCameraProfile_HFAdditions__hf_doorbellChimeMuteCharacteristic__block_invoke_2;
    v10[3] = &unk_1EA729B70;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a4 = 1;

}

void __66__HMCameraProfile_HFAdditions__hf_doorbellChimeMuteCharacteristic__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8960]);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __96__HMCameraProfile_HFAdditions__hf_cameraAccessModeSelectedOptionForCameraProfiles_presenceType___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;
  __CFString *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 > 3)
    v3 = 0;
  else
    v3 = off_1EA7319F8[v2];
  return objc_msgSend(a2, "isEqualToString:", v3);
}

void __66__HMCameraProfile_HFAdditions__hf_significantEventWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "clipManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__HMCameraProfile_HFAdditions__hf_significantEventWithIdentifier___block_invoke_2;
  v8[3] = &unk_1EA731978;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v9 = *(id *)(a1 + 32);
  v7 = v3;
  v10 = v7;
  objc_msgSend(v5, "fetchSignificantEventsWithUUIDs:completion:", v6, v8);

  objc_destroyWeak(&v11);
}

void __66__HMCameraProfile_HFAdditions__hf_significantEventWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id WeakRetained;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v5, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishWithResult:", v9);
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  HFLogForCategory(0xEuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412802;
    v15 = WeakRetained;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v9;
    _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "%@: Unable to fetch significant event with identifier:%@ (error:%@)", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v9);
LABEL_8:

}

void __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "clipManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchFaceCropDataRepresentationForSignificantEventWithUUID:completion:", v5, v4);

}

id __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0CEA638];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithData:", v3);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x13uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Error %@ fetching face crop for significant event %@", (uint8_t *)&v6, 0x16u);
  }

}

@end
