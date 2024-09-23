@implementation AXZoomUserSelectableLensModes

void __AXZoomUserSelectableLensModes_block_invoke()
{
  int IsPad;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  IsPad = AXDeviceIsPad();
  v1 = (void *)MEMORY[0x1E0C99E10];
  if (IsPad)
  {
    v2 = *MEMORY[0x1E0CF38B0];
    v15[0] = *MEMORY[0x1E0CF38A8];
    v15[1] = v2;
    v15[2] = *MEMORY[0x1E0CF38A0];
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v15;
    v5 = 3;
  }
  else
  {
    v6 = *MEMORY[0x1E0CF38A0];
    v14[0] = *MEMORY[0x1E0CF38A8];
    v14[1] = v6;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v14;
    v5 = 2;
  }
  objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "orderedSetWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)AXZoomUserSelectableLensModes_Result;
  AXZoomUserSelectableLensModes_Result = v8;

  v10 = (void *)AXZoomUserSelectableLensModes_Result;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", &stru_1E24CAB08, 1, sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortUsingDescriptors:", v12);

}

@end
