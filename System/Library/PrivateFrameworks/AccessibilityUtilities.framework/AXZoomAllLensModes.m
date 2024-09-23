@implementation AXZoomAllLensModes

void __AXZoomAllLensModes_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E10];
  v1 = *MEMORY[0x1E0CF38B0];
  v9[0] = *MEMORY[0x1E0CF38A8];
  v9[1] = v1;
  v9[2] = *MEMORY[0x1E0CF38A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "orderedSetWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)AXZoomAllLensModes_Result;
  AXZoomAllLensModes_Result = v3;

  v5 = (void *)AXZoomAllLensModes_Result;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", &stru_1E24CAB08, 1, sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingDescriptors:", v7);

}

@end
