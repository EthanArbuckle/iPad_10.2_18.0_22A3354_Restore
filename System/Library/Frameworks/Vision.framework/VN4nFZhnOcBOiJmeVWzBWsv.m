@implementation VN4nFZhnOcBOiJmeVWzBWsv

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  _BOOL4 v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VN4nFZhnOcBOiJmeVWzBWsv;
  v5 = -[VNImageAnalyzerBasedDetector configureImageAnalyzerOptions:error:](&v8, sel_configureImageAnalyzerOptions_error_, a3, a4);
  if (v5)
  {
    if (*((char *)a3 + 95) < 0)
    {
      *((_QWORD *)a3 + 10) = 11;
      v6 = (char *)*((_QWORD *)a3 + 9);
    }
    else
    {
      v6 = (char *)a3 + 72;
      *((_BYTE *)a3 + 95) = 11;
    }
    strcpy(v6, "leaf/logits");
  }
  return v5;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  return 1;
}

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  id v9;
  _BYTE *v10;
  _BYTE *v11;
  VN6Ac6Cyl5O5oK19HboyMBR *v12;
  uint64_t v13;
  VN6Ac6Cyl5O5oK19HboyMBR *v14;
  VNImageNeuralHashprintObservation *v15;
  void *v16;
  unint64_t v18[23];
  _BYTE *v19;
  _BYTE *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)v18, (uint64_t)a3);
  vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&v19, v18);
  vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)v18);
  v11 = v19;
  v10 = v20;
  v12 = [VN6Ac6Cyl5O5oK19HboyMBR alloc];
  v13 = v10 - v11;
  v14 = -[VN6Ac6Cyl5O5oK19HboyMBR initWithData:elementCount:elementType:lengthInBytes:imageSignatureprintType:originatingRequestSpecifier:](v12, "initWithData:elementCount:elementType:lengthInBytes:imageSignatureprintType:originatingRequestSpecifier:", v19, v13 >> 2, 1, v13, 3, v9);
  if (v14)
  {
    v15 = -[VNImageNeuralHashprintObservation initWithOriginatingRequestSpecifier:imageNeuralHashprint:]([VNImageNeuralHashprintObservation alloc], "initWithOriginatingRequestSpecifier:imageNeuralHashprint:", v9, v14);
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not create a image signature print from tensor vector with %lu elements (%lu bytes)"), v13 >> 2, v13);
    v15 = (VNImageNeuralHashprintObservation *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v15);
    v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v16 = 0;
LABEL_6:

  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }

  return v16;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUAndGPUComputeDevices](VNComputeDeviceUtilities, "allCPUAndGPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", CFSTR("NeuralHashv3b_fp16-current.espresso"), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  return CFSTR("image");
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  return 1111970369;
}

@end
