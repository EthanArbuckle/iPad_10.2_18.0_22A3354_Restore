@implementation FISplitsForMeasuringSystemIdentifier

BOOL __FISplitsForMeasuringSystemIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  if (objc_msgSend(v3, "fi_isSplitEvent"))
  {
    objc_msgSend(v3, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_HKPrivateMetadataSplitMeasuringSystem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue") == *(_QWORD *)(a1 + 32);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
