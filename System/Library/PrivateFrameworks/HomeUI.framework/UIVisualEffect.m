@implementation UIVisualEffect

void __53__UIVisualEffect_HUAdditions__hu_dashboardBarEffects__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _OWORD v5[10];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectLuminanceCurveMap:blendingAmount:", &unk_1E7042D38, 0.18);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[6] = xmmword_1EF218738;
  v5[7] = unk_1EF218748;
  v5[8] = xmmword_1EF218758;
  v5[9] = unk_1EF218768;
  v5[2] = xmmword_1EF2186F8;
  v5[3] = unk_1EF218708;
  v5[4] = xmmword_1EF218718;
  v5[5] = unk_1EF218728;
  v5[0] = HUDashboardBarColorMatrix;
  v5[1] = unk_1EF2186E8;
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectMatrix:", v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 32.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED580C08;
  qword_1ED580C08 = v3;

}

void __62__UIVisualEffect_HUAdditions__hu_gridCellBackgroundOffEffects__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _OWORD v5[10];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectLuminanceCurveMap:blendingAmount:", &unk_1E7042D68, 0.24);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[6] = xmmword_1EF2187D8;
  v5[7] = unk_1EF2187E8;
  v5[8] = xmmword_1EF2187F8;
  v5[9] = unk_1EF218808;
  v5[2] = xmmword_1EF218798;
  v5[3] = unk_1EF2187A8;
  v5[4] = xmmword_1EF2187B8;
  v5[5] = unk_1EF2187C8;
  v5[0] = HUGridCellBackgroundOffColorMatrix;
  v5[1] = unk_1EF218788;
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectMatrix:", v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 20.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED580C28;
  qword_1ED580C28 = v3;

}

void __61__UIVisualEffect_HUAdditions__hu_gridCellBackgroundOnEffects__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 14);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED580C38;
  qword_1ED580C38 = v1;

}

void __68__UIVisualEffect_HUAdditions__hu_categoryDashboardBackgroundEffects__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectLuminanceCurveMap:blendingAmount:", &unk_1E7042D50, 0.25);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectSaturate:", 1.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 32.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectBrightness:", -0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED580C18;
  qword_1ED580C18 = v4;

}

@end
