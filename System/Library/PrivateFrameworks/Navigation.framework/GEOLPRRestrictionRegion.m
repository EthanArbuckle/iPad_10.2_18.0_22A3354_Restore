@implementation GEOLPRRestrictionRegion

void __75__GEOLPRRestrictionRegion_MNExtras__plateTypeIndexesMatchingVehicle_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  id obj;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(a2, "hasDefinedPlateConditionsForVehicle:error:", v7, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    *a4 = 1;
  }
}

@end
