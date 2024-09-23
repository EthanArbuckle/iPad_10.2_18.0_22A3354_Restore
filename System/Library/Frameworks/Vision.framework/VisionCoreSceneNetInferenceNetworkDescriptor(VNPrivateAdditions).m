@implementation VisionCoreSceneNetInferenceNetworkDescriptor(VNPrivateAdditions)

- (id)VNPublicClassificationDisallowedList
{
  void *v1;

  if (objc_msgSend(a1, "model") == 1)
  {
    +[VNDisallowedList sceneNetV3](VNDisallowedList, "sceneNetV3");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)VNSceneprintFromOutputObjects:()VNPrivateAdditions originatingRequestSpecifier:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  _QWORD aBlock[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "sceneprintOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__12438;
    v23 = __Block_byref_object_dispose__12439;
    v24 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__VisionCoreSceneNetInferenceNetworkDescriptor_VNPrivateAdditions__VNSceneprintFromOutputObjects_originatingRequestSpecifier_error___block_invoke;
    aBlock[3] = &unk_1E45455F0;
    v18 = &v19;
    aBlock[4] = a1;
    v17 = v9;
    v11 = _Block_copy(aBlock);
    objc_msgSend(v10, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "accessReadOnlyDataForName:usingBlock:error:", v12, v11, a5);

    if ((v13 & 1) != 0)
      v14 = (id)v20[5];
    else
      v14 = 0;

    _Block_object_dispose(&v19, 8);
  }
  else if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("sceneprint output descriptor is not defined"));
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)VNSceneprintFromData:()VNPrivateAdditions originatingRequestSpecifier:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "sceneprintOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (a5)
    {
      +[VNError errorForDataUnavailableWithLocalizedDescription:underlyingError:](VNError, "errorForDataUnavailableWithLocalizedDescription:underlyingError:", CFSTR("could not obtain sceneprint descriptor"), 0);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "requestClassAndReturnError:", a5))
    goto LABEL_6;
  objc_opt_class();
  objc_msgSend(a1, "VNEspressoModelImageprintOfClass:fromData:tensorDescriptor:originatingRequestSpecifier:fromBlock:error:", objc_opt_class(), v8, v10, v9, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v11;
}

@end
