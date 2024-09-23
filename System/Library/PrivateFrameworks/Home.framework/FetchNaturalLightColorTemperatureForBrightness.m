@implementation FetchNaturalLightColorTemperatureForBrightness

void __FetchNaturalLightColorTemperatureForBrightness_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  float v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0x38uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Fetch natural light color temp for profile: %@ %@ error: %@", (uint8_t *)&v11, 0x20u);
    }

    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "floatValue");
    HFGetUIColorFromMired(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
