@implementation VNPersonsModelFaceModel

- (id)personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 canceller:(id)a6 error:(id *)a7
{
  if (a7)
  {
    VNPersonsModelErrorForUnimplementedMethod((uint64_t)self, (uint64_t)a2);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)isCompatibleWithConfiguration:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend(a3, "resolvedAlgorithmAndReturnError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v6 = v3 && (v5 = objc_msgSend(v3, "faceModelClass")) != 0 && objc_opt_class() == v5;

  return v6;
}

- (unint64_t)faceprintRequestRevision
{
  return 0;
}

- (unint64_t)personCount
{
  return 0;
}

- (id)personUniqueIdentifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  return 0;
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)faceCountsForAllPersons
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    VNPersonsModelErrorForUnimplementedMethod((uint64_t)self, (uint64_t)a2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (VNPersonsModelFaceModel)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNPersonsModelFaceModel;
  return -[VNPersonsModelFaceModel init](&v4, sel_init, a3);
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  if (a5)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
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
  v14 = (void *)objc_msgSend(v12, "faceModelClass");
  if (!v14
    || !+[VisionCoreRuntimeUtilities item:overridesClassSelector:](VNRuntimeUtilities, "item:overridesClassSelector:", v14, sel_modelBuiltFromConfiguration_dataProvider_canceller_error_))
  {
    if (a6)
    {
      VNPersonsModelErrorForUnsupportedAlgorithm(v13);
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v14, "modelBuiltFromConfiguration:dataProvider:canceller:error:", v9, v10, v11, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
