@implementation HFSimplePowerStateServices

id __HFSimplePowerStateServices_block_invoke()
{
  if (qword_1ED3790A8 != -1)
    dispatch_once(&qword_1ED3790A8, &__block_literal_global_243);
  return (id)qword_1ED3790B0;
}

void __HFSimplePowerStateServices_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9A70];
  v6[0] = *MEMORY[0x1E0CB9A10];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CB9AD8];
  v6[2] = *MEMORY[0x1E0CB9AA0];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED3790B0;
  qword_1ED3790B0 = v4;

}

@end
