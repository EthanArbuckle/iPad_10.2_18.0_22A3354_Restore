@implementation ARFrame

BOOL __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hitTestResult:isPlaneOfType:", v3, 32))
  {
    objc_msgSend(*(id *)(a1 + 32), "hitTestResultDistanceFromCamera:", v3);
    v5 = v4 < *(float *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hitTestResult:isPlaneOfType:", v3, 16))
  {
    objc_msgSend(*(id *)(a1 + 32), "hitTestResultDistanceFromCamera:", v3);
    v5 = v4 < *(float *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __91__ARFrame_ARFrame_SmartHitTest__smartHitTestResultForImagePoint_assetPosition_maxDistance___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "hitTestResultDistanceFromCamera:", v3);
    v5 = v4 < *(float *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
