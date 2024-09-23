@implementation VisionCoreLabeledConfidencesDescriptor(VNInternalAdditions)

- (_QWORD)newClassificationObservationsFromOutputObjects:()VNInternalAdditions originatingRequestSpecifier:operationPointsProvider:error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "operationPointsAndReturnError:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      a6 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(a1, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "elementCount");
  objc_msgSend(a1, "labels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") == v16)
  {
    objc_msgSend(a1, "validLabelIndexes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __168__VisionCoreLabeledConfidencesDescriptor_VNInternalAdditions__newClassificationObservationsFromOutputObjects_originatingRequestSpecifier_operationPointsProvider_error___block_invoke;
    aBlock[3] = &unk_1E4546740;
    v26 = v17;
    v27 = v14;
    v24 = v11;
    v28 = v11;
    v20 = v19;
    v29 = v20;
    v21 = _Block_copy(aBlock);
    if (objc_msgSend(v10, "VNEnumerateFloatValuesAtIndexes:asTensor:usingBlock:error:", v18, a1, v21, a6))
      a6 = v20;
    else
      a6 = 0;

    v11 = v24;
  }
  else if (a6)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Tensor with %lu elements does not align with %lu labels"), v16, objc_msgSend(v17, "count"));
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v22);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

LABEL_13:
  return a6;
}

- (uint64_t)newClassificationObservationsFromTensorData:()VNInternalAdditions originatingRequestSpecifier:operationPointsProvider:error:
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v10 = (objc_class *)MEMORY[0x1E0DC6C98];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [v10 alloc];
  objc_msgSend(a1, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithNamedObjects:", v15, v13, 0);

  v17 = objc_msgSend(a1, "newClassificationObservationsFromOutputObjects:originatingRequestSpecifier:operationPointsProvider:error:", v16, v12, v11, a6);
  return v17;
}

@end
