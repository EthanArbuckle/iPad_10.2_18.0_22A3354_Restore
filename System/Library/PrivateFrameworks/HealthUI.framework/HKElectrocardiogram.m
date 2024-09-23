@implementation HKElectrocardiogram

_QWORD *__197__HKElectrocardiogram_HealthUI___hk_waveformPathsWithNumberOfValues_transform_maximumNumberOfValuesPerPath_shouldResetXValues_initialValuesToOmit_minimumValueInMicrovolts_maximumValueInMicrovolts___block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3, float a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  float v11;
  float v12;
  int v13;
  void *v14;
  double v15;
  double v16;

  if (result[6] <= a2)
  {
    v4 = a2;
    v5 = result;
    if (result[7] <= a2)
    {
      *a3 = 1;
    }
    else
    {
      v7 = result[8];
      if (v7 >= 1)
      {
        if (!(a2 % v7))
        {
          v8 = objc_alloc_init(MEMORY[0x1E0DC3508]);
          if ((objc_msgSend(*(id *)(*(_QWORD *)(v5[4] + 8) + 40), "isEmpty") & 1) == 0)
          {
            if (!*((_BYTE *)v5 + 128))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(v5[4] + 8) + 40), "currentPoint");
              objc_msgSend(v8, "moveToPoint:");
            }
            objc_msgSend(*(id *)(*(_QWORD *)(v5[5] + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 40));
          }
          v9 = *(_QWORD *)(v5[4] + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v8;

        }
        if (*((_BYTE *)v5 + 128))
          v4 %= v5[8];
      }
      v11 = *((float *)v5 + 30);
      v12 = *((float *)v5 + 31);
      if (v12 <= a4)
        v12 = a4;
      if (v12 >= v11)
        v12 = *((float *)v5 + 30);
      v13 = objc_msgSend(*(id *)(*(_QWORD *)(v5[4] + 8) + 40), "isEmpty", vaddq_f64(*(float64x2_t *)(v5 + 13), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(v5 + 11), (float)(v11 - v12)), *(float64x2_t *)(v5 + 9), (double)v4)));
      v14 = *(void **)(*(_QWORD *)(v5[4] + 8) + 40);
      if (v13)
        return (_QWORD *)objc_msgSend(v14, "moveToPoint:", v15, v16);
      else
        return (_QWORD *)objc_msgSend(v14, "addLineToPoint:", v15, v16);
    }
  }
  return result;
}

void __61__HKElectrocardiogram_HKCodingSupport__createWithCodableECG___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "_setPrivateClassification:", objc_msgSend(v3, "classificationRawValue"));
  v5 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(*(id *)(a1 + 32), "averageHeartRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createWithCodableQuantity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAverageHeartRate:", v7);

  objc_msgSend(v4, "_setSymptomsStatus:", objc_msgSend(*(id *)(a1 + 32), "symptomsStatusRawValue"));
  objc_msgSend(*(id *)(a1 + 32), "readingData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPayload:", v8);

}

@end
