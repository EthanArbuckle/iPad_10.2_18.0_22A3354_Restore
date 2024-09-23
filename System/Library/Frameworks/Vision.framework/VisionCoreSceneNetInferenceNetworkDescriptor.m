@implementation VisionCoreSceneNetInferenceNetworkDescriptor

BOOL __132__VisionCoreSceneNetInferenceNetworkDescriptor_VNPrivateAdditions__VNSceneprintFromOutputObjects_originatingRequestSpecifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "VNSceneprintFromData:originatingRequestSpecifier:error:", v5, *(_QWORD *)(a1 + 40), a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v9;
}

@end
