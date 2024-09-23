@implementation RBSProcessLegacyStateDescriptor

void __RBSProcessLegacyStateDescriptor_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
  RBSProcessLegacyStateDescriptor___LegacyDescriptor = v0;

  objc_msgSend((id)RBSProcessLegacyStateDescriptor___LegacyDescriptor, "setValues:", 9);
  v2 = (void *)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
  v4[0] = *MEMORY[0x1E0D87E68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEndowmentNamespaces:", v3);

}

@end
