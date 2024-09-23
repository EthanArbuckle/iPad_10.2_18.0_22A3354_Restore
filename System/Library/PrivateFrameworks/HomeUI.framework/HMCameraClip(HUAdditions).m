@implementation HMCameraClip(HUAdditions)

- (id)hu_accessibilityStringForSignificantEvents
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_sortedSignificantEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HMCameraClip_HUAdditions__hu_accessibilityStringForSignificantEvents__block_invoke;
  v7[3] = &unk_1E6F4CBA0;
  v9 = &v10;
  v7[4] = a1;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "na_each:", v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)hu_accessibilityStringForSignificantEvent:()HUAdditions inReferenceDate:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D31288];
  v7 = a4;
  objc_msgSend(v5, "dateOfOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedShortTimeStringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D31288];
  objc_msgSend(v5, "dateOfOccurrence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizerKeyDayNameFromDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateOfOccurrence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v14);
  v16 = v15;

  if (v16 > 604800.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Last%@"), v13);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUCameraEventRecordingCellAccessibilityLabelSignificantEventTimeOn%@Format"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(v18, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateOfOccurrence");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "component:fromDate:", 32, v27);

  if (objc_msgSend(v5, "confidenceLevel") == 100)
  {
    objc_msgSend(v5, "hf_faceClassificationName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = &stru_1E6F60E80;
      if (v28 == 1)
        v30 = CFSTR("Singular");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCameraSignificantEventReasonFamiliarFace%@Title"), v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hf_faceClassificationName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5)
      {
        objc_msgSend(v5, "hf_reasonKey");
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = CFSTR("AnyMotion");
      }
      v35 = &stru_1E6F60E80;
      if (v28 == 1)
        v35 = CFSTR("Singular");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCameraSignificantEventReason%@%@Title"), v31, v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    HFLocalizedStringWithFormat();
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = &stru_1E6F60E80;
    if (v28 == 1)
      v33 = CFSTR("Singular");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCameraSignificantEventReasonAnyMotion%@Title"), v33);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    HFLocalizedStringWithFormat();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v34;
}

@end
