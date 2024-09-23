@implementation GEOArrivalParameters

void __96__GEOArrivalParameters_MNExtras__regionContainmentTypeForLocation_arrivalRegionType_parameters___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E620F728, &unk_1E620F740, &unk_1E620F758, 0, &unk_1E620F710);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = &unk_1E620F740;
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E620F728, &unk_1E620F758, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_48;
  _MergedGlobals_48 = v2;

}

@end
