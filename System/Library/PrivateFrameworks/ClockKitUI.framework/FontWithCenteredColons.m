@implementation FontWithCenteredColons

void ___FontWithCenteredColons_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC4A48];
  v3[0] = *MEMORY[0x1E0DC4A58];
  v3[1] = v0;
  v4[0] = &unk_1E86EF038;
  v4[1] = &unk_1E86EF050;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_FontWithCenteredColons___centeredColonsFeatureSetting;
  _FontWithCenteredColons___centeredColonsFeatureSetting = v1;

}

@end
