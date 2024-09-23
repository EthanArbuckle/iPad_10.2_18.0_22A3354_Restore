@implementation CSUSceneNetV5SceneTaxonomy(VNCoreSceneUnderstandingDetector)

- (BOOL)VNGetClassificationMetrics:()VNCoreSceneUnderstandingDetector forLabel:error:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v8 = a4;
  if ((objc_msgSend(a1, "hasLabelAttributes") & 1) != 0)
  {
    objc_msgSend(a1, "attributesForLabel:error:", v8, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "precisionOperatingPointCurve");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recallOperatingPointCurve");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "count");
      v14 = objc_msgSend(v12, "count");
      v15 = v14;
      if (v13 && v14)
      {
        objc_msgSend(MEMORY[0x1E0DC6D08], "VNCurveForCSUMetricOperatingPointCurve:error:", v11, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0DC6D08], "VNCurveForCSUMetricOperatingPointCurve:error:", v12, a5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 != 0;
          if (v17)
            *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C20]), "initWithPrecisionCurve:recallCurve:", v16, v17);

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        if (!v13)
        {
          v19 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
          VNValidatedLog(2, (uint64_t)CFSTR("%s does not have prevision curve"), v20, v21, v22, v23, v24, v25, v19);
        }
        if (!v15)
        {
          v26 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
          VNValidatedLog(2, (uint64_t)CFSTR("%s does not have recall curve"), v27, v28, v29, v30, v31, v32, v26);
        }
        *a3 = 0;
        v18 = 1;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    *a3 = 0;
    v18 = 1;
  }

  return v18;
}

@end
