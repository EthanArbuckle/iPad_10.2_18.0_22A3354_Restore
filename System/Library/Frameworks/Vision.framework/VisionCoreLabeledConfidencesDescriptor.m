@implementation VisionCoreLabeledConfidencesDescriptor

uint64_t __168__VisionCoreLabeledConfidencesDescriptor_VNInternalAdditions__newClassificationObservationsFromOutputObjects_originatingRequestSpecifier_operationPointsProvider_error___block_invoke(uint64_t a1, uint64_t a2, float a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  VNClassificationObservation *v13;
  double v14;
  VNClassificationObservation *v15;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v17 = 0;
    v10 = objc_msgSend(v9, "getClassificationMetrics:forClassificationIdentifier:error:", &v17, v8, a5);
    v11 = v17;
    if (!v10)
    {
      v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v11 = 0;
  }
  v13 = [VNClassificationObservation alloc];
  *(float *)&v14 = a3;
  v15 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](v13, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", *(_QWORD *)(a1 + 48), v8, v11, v14);
  if (v15)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);

  v12 = 1;
LABEL_8:

  return v12;
}

@end
