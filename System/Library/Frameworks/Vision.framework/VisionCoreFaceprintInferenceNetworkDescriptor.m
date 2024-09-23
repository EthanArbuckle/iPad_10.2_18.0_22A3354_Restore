@implementation VisionCoreFaceprintInferenceNetworkDescriptor

BOOL __132__VisionCoreFaceprintInferenceNetworkDescriptor_VNPrivateAdditions__VNFaceprintFromOutputObjects_originatingRequestSpecifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v5 = a2;
  LODWORD(v6) = *(_DWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "VNFaceprintFromData:confidence:originatingRequestSpecifier:error:", v5, *(_QWORD *)(a1 + 40), a3, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v10;
}

@end
