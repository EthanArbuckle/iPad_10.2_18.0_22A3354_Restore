@implementation VNOpticalFlowGenerator

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
    if (objc_msgSend(v6, "requestRevision") != 1)
      goto LABEL_9;
LABEL_12:
    objc_opt_class();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()))
  {
    v7 = objc_msgSend(v6, "requestRevision");
    if (v7 == 1 || v7 == 2)
      goto LABEL_12;
  }
LABEL_9:
  if (!a4)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_13;
  }
  +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return (Class)v8;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VNOpticalFlowGenerator_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)supportedOutputPixelFormatsForOptions:(id)a3 error:(id *)a4
{
  if (+[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken != -1)
    dispatch_once(&+[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken, &__block_literal_global_10759);
  return (id)+[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;
}

void __70__VNOpticalFlowGenerator_supportedOutputPixelFormatsForOptions_error___block_invoke()
{
  void *v0;

  v0 = (void *)+[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;
  +[VNOpticalFlowGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats = (uint64_t)&unk_1E459E0C0;

}

void __63__VNOpticalFlowGenerator_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNOpticalFlowGenerator;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNOpticalFlowGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (id)validatedImageBuffersFromOptions:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0;
  v7 = +[VNValidationUtilities getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:](VNValidationUtilities, "getArray:forKey:inOptions:withElementsOfClass:requiredMinimumCount:allowedMaximumCount:error:", &v20, CFSTR("VNDetectorProcessOption_InputImageBuffers"), v6, objc_opt_class(), 2, 2, a4);
  v8 = v20;
  v9 = v8;
  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          if (!-[VNDetector validateImageBuffer:error:](self, "validateImageBuffer:error:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), a4))
          {

            goto LABEL_12;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
          continue;
        break;
      }
    }

    v14 = v10;
  }
  else
  {
LABEL_12:
    v14 = 0;
  }

  return v14;
}

@end
