@implementation AXZoomDockPositions

void __AXZoomDockPositions_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E10];
  v1 = *MEMORY[0x1E0CF3858];
  v6[0] = *MEMORY[0x1E0CF3868];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CF3850];
  v6[2] = *MEMORY[0x1E0CF3860];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "orderedSetWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)AXZoomDockPositions_Result;
  AXZoomDockPositions_Result = v4;

}

@end
