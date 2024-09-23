@implementation VNANFDMultiDetectorANSTv1

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allNeuralEngineComputeDevices](VNComputeDeviceUtilities, "allNeuralEngineComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __46__VNANFDMultiDetectorANSTv1_supportsExecution__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32)))
    v4 = objc_msgSend(v3, "containsString:", *(_QWORD *)(a1 + 40));
  else
    v4 = 0;

  return v4;
}

void __46__VNANFDMultiDetectorANSTv1_supportsExecution__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "detectorClass"), "modelName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasSuffix:", CFSTR(".espresso")))
  {
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    VNANEArchitectureName();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      VNFrameworkBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pathsForResourcesOfType:inDirectory:", CFSTR("hwx"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __46__VNANFDMultiDetectorANSTv1_supportsExecution__block_invoke_2;
      v7[3] = &unk_1E45477E0;
      v8 = v1;
      v9 = v2;
      objc_msgSend(v4, "indexesOfObjectsPassingTest:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
        +[VNANFDMultiDetectorANSTv1 supportsExecution]::supportsExecution = 1;

    }
  }

}

+ (BOOL)supportsExecution
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VNANFDMultiDetectorANSTv1_supportsExecution__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution]::onceToken != -1)
    dispatch_once(&+[VNANFDMultiDetectorANSTv1 supportsExecution]::onceToken, block);
  return +[VNANFDMultiDetectorANSTv1 supportsExecution]::supportsExecution;
}

+ (Class)detectorClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)shouldAlignFacesForRequestWithSpecifier:(id)a3
{
  return 0;
}

@end
