@implementation VisionCoreClassificationMetrics(VNCoreMLTransformer)

+ (id)VNMetricsFromMLPrecisionRecallCurve:()VNCoreMLTransformer error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0DC6D08];
  objc_msgSend(v6, "precisionValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "precisionConfidenceThresholds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "curveWithValuesArray:confidencesArray:error:", v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0DC6D08];
    objc_msgSend(v6, "recallValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recallConfidenceThresholds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "curveWithValuesArray:confidencesArray:error:", v12, v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = (void *)objc_msgSend([a1 alloc], "initWithPrecisionCurve:recallCurve:", v10, v14);
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
