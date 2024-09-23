@implementation ARSession

BOOL __85__ARSession_SmartRaycast__smartRaycastResultForImagePoint_assetPosition_maxDistance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  _BOOL8 v5;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "target") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("ARSession+SmartRaycast.m"), 35, CFSTR("Expected ARRaycastResult.target == ARRaycastTargetEstimatedPlane, but got %ld"), objc_msgSend(v3, "target"));

  }
  objc_msgSend(*(id *)(a1 + 32), "raycastResultDistanceFromCamera:", v3);
  v5 = v4 < *(float *)(a1 + 48);

  return v5;
}

@end
