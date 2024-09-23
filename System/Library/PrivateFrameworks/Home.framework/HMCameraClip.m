@implementation HMCameraClip

uint64_t __60__HMCameraClip_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "reason");
  return HMStringFromCameraSignificantEventReason();
}

BOOL __55__HMCameraClip_HFAdditions__hf_hasInsufficientAnalysis__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reason") == 6;
}

uint64_t __36__HMCameraClip_HFAdditions__hf_size__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "byteLength");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __63__HMCameraClip_HFAdditions__hf_allEventsContainingPeopleInClip__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "faceClassification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __53__HMCameraClip_HFAdditions__hf_faceCropNameAtOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a2;
  v7 = *(double *)(a1 + 40);
  v12 = v6;
  objc_msgSend(v6, "timeOffsetWithinClip");
  if (vabdd_f64(v7, v8) < 4.0)
  {
    objc_msgSend(v12, "hf_faceClassificationName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

void __54__HMCameraClip_HFAdditions__hf_faceCropNamesAtOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = a2;
  v7 = *(double *)(a1 + 48);
  v13 = v6;
  objc_msgSend(v6, "timeOffsetWithinClip");
  v9 = vabdd_f64(v7, v8);
  if (v9 < 4.0)
  {
    objc_msgSend(v13, "hf_faceClassificationName");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
  if (v9 > 8.0)
    *a4 = 1;

}

void __58__HMCameraClip_HFAdditions__hf_familiarFaceEventAtOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v7 = a2;
  v8 = *(double *)(a1 + 40);
  v11 = v7;
  objc_msgSend(v7, "timeOffsetWithinClip");
  if (vabdd_f64(v8, v9) < 4.0)
  {
    objc_msgSend(v11, "hf_faceClassificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }

}

@end
