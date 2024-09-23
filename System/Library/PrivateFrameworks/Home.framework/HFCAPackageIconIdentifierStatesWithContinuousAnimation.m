@implementation HFCAPackageIconIdentifierStatesWithContinuousAnimation

void __HFCAPackageIconIdentifierStatesWithContinuousAnimation_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("HFCAPackageIconIdentifierDeskFan");
  v11[0] = HFCAPackageStateOn;
  v11[1] = HFCAPackageStateOnVibrant;
  v11[2] = HFCAPackageStateDisplay;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v0;
  v12[1] = CFSTR("HFCAPackageIconIdentifierFloorFan");
  v10[0] = HFCAPackageStateOn;
  v10[1] = HFCAPackageStateOnVibrant;
  v10[2] = HFCAPackageStateDisplay;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v1;
  v12[2] = CFSTR("HFCAPackageIconIdentifierCeilingFan");
  v9[0] = HFCAPackageStateOn;
  v9[1] = HFCAPackageStateOnVibrant;
  v9[2] = HFCAPackageStateDisplay;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v2;
  v12[3] = CFSTR("HFCAPackageIconIdentifierCeilingFanWithLight");
  v8[0] = HFCAPackageStateOn;
  v8[1] = HFCAPackageStateOnVibrant;
  v8[2] = HFCAPackageStateDisplay;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = CFSTR("HFCAPackageIconIdentifierSecuritySystem");
  v7[0] = HFCAPackageStateActivated;
  v7[1] = HFCAPackageStateActivatedAlternate;
  v13[3] = v3;
  v7[2] = HFCAPackageStateActivatedVibrant;
  v7[3] = HFCAPackageStateDisplay;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_MergedGlobals_248;
  _MergedGlobals_248 = v5;

}

@end
