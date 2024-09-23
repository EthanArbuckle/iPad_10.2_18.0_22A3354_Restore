@implementation CKAllowedSystemFieldNames

void __CKAllowedSystemFieldNames_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C949C8];
  v5[0] = *MEMORY[0x1E0C94A00];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0C949C0];
  v5[2] = *MEMORY[0x1E0C949D8];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0C949D0];
  v5[4] = *MEMORY[0x1E0C949E0];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E0C94A18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_169;
  _MergedGlobals_169 = v3;

}

@end
