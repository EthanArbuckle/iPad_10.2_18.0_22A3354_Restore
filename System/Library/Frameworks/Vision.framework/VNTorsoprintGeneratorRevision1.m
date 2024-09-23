@implementation VNTorsoprintGeneratorRevision1

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("bodynet_v1.0.espresso");
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return &stru_1E4549388;
}

- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  const __CFString *v8;
  void *v9;
  VNTorsoprint *v10;
  double v11;
  double v12;
  VNTorsoprint *v15;
  double v16;

  -[VNEspressoModelFileBasedDetector espressoResources](self, "espressoResources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "network");
  if (!espresso_network_bind_buffer())
  {
    objc_msgSend(v7, "network");
    if (espresso_network_bind_input_cvpixelbuffer())
    {
      if (a5)
      {
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Could not bind input buffer to network"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v7, "plan");
      if (espresso_plan_execute_sync())
      {
        if (a5)
        {
          v8 = CFSTR("Could not run network");
          goto LABEL_4;
        }
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "torsoprintDescriptorSize");
        if (v12 == (double)0 && v11 == (double)0)
        {
          v15 = [VNTorsoprint alloc];
          LODWORD(v16) = 1.0;
          v10 = -[VNTorsoprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v15, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", 0, 0, 1, 0, a4, v16);
          goto LABEL_19;
        }
        if (a5)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("inference output results dimensions are incorrect"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
      }
    }
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  if (!a5)
    goto LABEL_18;
  v8 = CFSTR("Could not bind input buffer to network");
LABEL_4:
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = 0;
  *a5 = v9;
LABEL_19:

  return v10;
}

@end
