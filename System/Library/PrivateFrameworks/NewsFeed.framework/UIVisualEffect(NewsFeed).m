@implementation UIVisualEffect(NewsFeed)

+ (id)ne_visualEffectsForDailyBriefing
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[6];
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  int64x2_t v14;
  uint64_t v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = 0;
  v5[0] = 0x3FE0A3D70A3D70A4;
  memset(&v5[1], 0, 32);
  v5[5] = 0x3FE0A3D70A3D70A4;
  v6 = 0u;
  v7 = 0u;
  v9 = 0;
  v10 = 0;
  v8 = 0x3FE0A3D70A3D70A4;
  v13 = xmmword_1BB87A380;
  v14 = vdupq_n_s64(0x3FB1EB851EB851ECuLL);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectMatrix:", v5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 40.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v1;
  objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 2.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v2;
  v16[2] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
