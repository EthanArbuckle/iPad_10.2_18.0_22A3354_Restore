@implementation VNTorsoprintGeneratorBase

+ (CGSize)torsoprintInputImageSizeForFaceOrientation:(int)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 0.0;
  v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_11;
  if (objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()))
  {
    v7 = objc_msgSend(v6, "requestRevision");
    if (v7 > 3737841670)
    {
      if ((unint64_t)(v7 - 3737841671) < 2)
      {
LABEL_12:
        objc_opt_class();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else if (v7 == 1 || v7 == 3737841666 || v7 == 3737841670)
    {
      goto LABEL_12;
    }
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v8 = 0;
  }
LABEL_13:

  return (Class)v8;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((id)objc_opt_class() == a1)
  {
    v13 = CFSTR("VNComputeStageMain");
    +[VNComputeDeviceUtilities mostPerformantComputeDevice](VNComputeDeviceUtilities, "mostPerformantComputeDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___VNTorsoprintGeneratorBase;
    objc_msgSendSuper2(&v11, sel_supportedComputeStageDevicesForOptions_error_, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
