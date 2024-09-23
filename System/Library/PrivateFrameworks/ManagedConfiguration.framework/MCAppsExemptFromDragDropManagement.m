@implementation MCAppsExemptFromDragDropManagement

void __MCAppsExemptFromDragDropManagement_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.springboard");
  v4[1] = CFSTR("com.apple.Maps");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MCAppsExemptFromDragDropManagement_retval;
  MCAppsExemptFromDragDropManagement_retval = v2;

}

@end
