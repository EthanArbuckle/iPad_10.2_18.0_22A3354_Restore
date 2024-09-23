@implementation VisionCoreEspressoNetworkDescriptor(VNInternalAdditions)

- (id)modelPathForComputeDevice:()VNInternalAdditions error:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "URLForComputeDevice:error:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "VisionCoreFileSystemPathAndReturnError:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)URLForComputeDevice:()VNInternalAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v6 = a3;
  if (+[VNComputeDeviceUtilities isNeuralEngineComputeDevice:](VNComputeDeviceUtilities, "isNeuralEngineComputeDevice:", v6))
  {
    objc_msgSend(a1, "ANESpecificURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else if (a4)
    {
      +[VNError errorForUnsupportedComputeDevice:](VNError, "errorForUnsupportedComputeDevice:", v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)VisionCoreEspressoNetworkDescriptor_0;
    objc_msgSendSuper2(&v11, sel_URLForComputeDevice_error_, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
