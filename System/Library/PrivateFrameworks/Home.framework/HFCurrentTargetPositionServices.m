@implementation HFCurrentTargetPositionServices

id __HFCurrentTargetPositionServices_block_invoke()
{
  if (qword_1ED3790C8 != -1)
    dispatch_once(&qword_1ED3790C8, &__block_literal_global_247);
  return (id)qword_1ED3790D0;
}

void __HFCurrentTargetPositionServices_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9B28];
  v5[0] = *MEMORY[0x1E0CB9A00];
  v5[1] = v1;
  v5[2] = *MEMORY[0x1E0CB9B30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3790D0;
  qword_1ED3790D0 = v3;

}

@end
