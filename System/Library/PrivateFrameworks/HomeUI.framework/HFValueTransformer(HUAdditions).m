@implementation HFValueTransformer(HUAdditions)

+ (id)transformerForRingSliderViewProfile:()HUAdditions rangeControlItem:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D318F0], "sharedCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCelsius");

  if (objc_msgSend(v8, "mode") == 1)
  {
    v11 = (void *)MEMORY[0x1E0D318D8];
    objc_msgSend(v6, "targetValueConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "validRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0D319D8];
    v16 = objc_opt_class();
    v17 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke;
    v52[3] = &unk_1E6F56220;
    v53 = v5;
    v54 = v14;
    v49[0] = v17;
    v49[1] = 3221225472;
    v49[2] = __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_2;
    v49[3] = &unk_1E6F56248;
    v50 = v54;
    v51 = v53;
    v18 = v54;
    objc_msgSend(v15, "transformerForValueClass:transformBlock:reverseTransformBlock:", v16, v52, v49);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v8, "mode") == 2)
  {
    v20 = (void *)MEMORY[0x1E0D318D8];
    objc_msgSend(v6, "maximumValueConstraints");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "validRange");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v22, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0D318D8];
    objc_msgSend(v6, "minimumValueConstraints");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "validRange");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v26, v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "primaryValueConstraints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "validRange");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "secondaryValueConstraints");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "validRange");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1E0D319D8];
    v32 = objc_opt_class();
    v33 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_3;
    v44[3] = &unk_1E6F56270;
    v45 = v29;
    v46 = v23;
    v47 = v31;
    v48 = v27;
    v39[0] = v33;
    v39[1] = 3221225472;
    v39[2] = __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_4;
    v39[3] = &unk_1E6F56298;
    v40 = v48;
    v41 = v47;
    v42 = v46;
    v43 = v45;
    v34 = v45;
    v35 = v46;
    v36 = v47;
    v18 = v48;
    objc_msgSend(v38, "transformerForValueClass:transformBlock:reverseTransformBlock:", v32, v44, v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "+[HFValueTransformer(HUAdditions) transformerForRingSliderViewProfile:rangeControlItem:]";
      v57 = 2048;
      v58 = objc_msgSend(v8, "mode");
      _os_log_debug_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEBUG, "(%s) %lu is an unsupported mode for HUQuickControlRingSliderRangeViewController. Only HFRangeControlItemModeTarget and HFRangeControlItemModeThreshold are valid. (HFTemperatureModeTarget and HFTemperatureModeThreshold are deprecated)", buf, 0x16u);
    }
    v19 = 0;
  }

  return v19;
}

@end
