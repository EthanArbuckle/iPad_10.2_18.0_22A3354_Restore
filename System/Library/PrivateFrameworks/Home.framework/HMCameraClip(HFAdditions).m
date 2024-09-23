@implementation HMCameraClip(HFAdditions)

- (id)hf_endDate
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "dateOfOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  objc_msgSend(v2, "dateByAddingTimeInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_dateInterval
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(a1, "dateOfOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  v4 = (void *)objc_msgSend(v2, "initWithStartDate:duration:", v3);

  return v4;
}

- (uint64_t)hf_duration
{
  uint64_t result;
  double v3;

  result = objc_msgSend(a1, "duration");
  if (v3 >= 0.00000011920929)
    return objc_msgSend(a1, "duration");
  return result;
}

- (BOOL)hf_isPlayable
{
  double v2;
  _BOOL8 result;

  result = 1;
  if (objc_msgSend(a1, "isComplete"))
  {
    objc_msgSend(a1, "duration");
    if (v2 < 0.00000011920929)
      return 0;
  }
  return result;
}

- (uint64_t)hf_hasInsufficientAnalysis
{
  void *v3;
  uint64_t v4;

  if (+[HFCameraUtilities treatAllClipsAsUnanalyzed](HFCameraUtilities, "treatAllClipsAsUnanalyzed"))
    return 1;
  objc_msgSend(a1, "significantEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_50);

  return v4;
}

- (id)hf_sortedSignificantEvents
{
  void *v1;
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, "SortedSignificantEvents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = (void *)objc_msgSend(v1, "copy");
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];

  return v3;
}

- (void)hf_sortSignificantEvents
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (+[HFCameraUtilities treatAllClipsAsUnanalyzed](HFCameraUtilities, "treatAllClipsAsUnanalyzed"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CBA3E8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dateOfOccurrence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v2, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:", v3, 6, v4, 100, v5, 0, 0.0, v6);
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateOfOccurrence"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "significantEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_setAssociatedObject(a1, "SortedSignificantEvents", v8, (void *)0x301);
}

- (uint64_t)hf_size
{
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(a1, "videoDataSegments");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__HMCameraClip_HFAdditions__hf_size__block_invoke;
  v4[3] = &unk_1EA72CC88;
  v4[4] = &v5;
  objc_msgSend(v1, "na_each:", v4);

  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)hf_allEventsContainingPeopleInClip
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_sortedSignificantEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__HMCameraClip_HFAdditions__hf_allEventsContainingPeopleInClip__block_invoke;
  v6[3] = &unk_1EA72CCB0;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

- (id)hf_faceCropNameAtOffset:()HFAdditions
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  objc_msgSend(a1, "hf_sortedSignificantEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HMCameraClip_HFAdditions__hf_faceCropNameAtOffset___block_invoke;
  v6[3] = &unk_1EA72CCD8;
  *(double *)&v6[5] = a2;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)hf_faceCropNamesAtOffset:()HFAdditions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  double v13;
  _QWORD v14[5];
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_sortedSignificantEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__8;
  v14[4] = __Block_byref_object_dispose__8;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HMCameraClip_HFAdditions__hf_faceCropNamesAtOffset___block_invoke;
  v10[3] = &unk_1EA72CD00;
  v13 = a2;
  v12 = v14;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  _Block_object_dispose(v14, 8);
  return v8;
}

- (id)hf_familiarFaceEventAtOffset:()HFAdditions
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  objc_msgSend(a1, "hf_sortedSignificantEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HMCameraClip_HFAdditions__hf_familiarFaceEventAtOffset___block_invoke;
  v6[3] = &unk_1EA72CCD8;
  *(double *)&v6[5] = a2;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)dealloc
{
  objc_super v3;

  objc_setAssociatedObject(a1, "SortedSignificantEvents", 0, (void *)0x301);
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F0459170;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (uint64_t)containerType
{
  return 1;
}

@end
