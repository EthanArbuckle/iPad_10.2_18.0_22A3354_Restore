@implementation MTCAFilterCurvesInputValuesKeys

void __MTCAFilterCurvesInputValuesKeys_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD2D48];
  v4[0] = *MEMORY[0x1E0CD2D98];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0CD2CB0];
  v4[2] = *MEMORY[0x1E0CD2CF0];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MTCAFilterCurvesInputValuesKeys___curvesFilterInputValuesKeys;
  MTCAFilterCurvesInputValuesKeys___curvesFilterInputValuesKeys = v2;

}

@end
