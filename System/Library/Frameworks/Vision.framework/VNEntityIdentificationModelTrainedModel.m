@implementation VNEntityIdentificationModelTrainedModel

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  if (a5)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "resolvedAlgorithmAndReturnError:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_7;
  v14 = (void *)objc_msgSend(v12, "trainedModelClass");
  if (!v14
    || !+[VisionCoreRuntimeUtilities item:overridesClassSelector:](VNRuntimeUtilities, "item:overridesClassSelector:", v14, sel_trainedModelBuiltFromConfiguration_dataProvider_canceller_error_))
  {
    if (a6)
    {
      VNEntityIdentificationModelErrorForUnsupportedAlgorithm(v13);
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v14, "trainedModelBuiltFromConfiguration:dataProvider:canceller:error:", v9, v10, v11, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)entityPrintOriginatingRequestSpecifier
{
  return 0;
}

- (id)trainingEntityPrintsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)predictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6
{
  if (a6)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self, a5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)entityCount
{
  return 0;
}

- (id)entityUniqueIdentifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
}

- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3
{
  return 0;
}

- (unint64_t)printCountForEntityWithUniqueIdentifier:(id)a3
{
  return 0;
}

- (id)printCountsForEntitiesWithUniqueIdentifiers:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)printCountsForAllEntities
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (VNEntityIdentificationModelTrainedModel)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "failWithError:", v6);

  return 0;
}

@end
