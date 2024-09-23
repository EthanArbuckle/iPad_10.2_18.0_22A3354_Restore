@implementation AVURLAsset(IC)

- (Float64)ic_durationInSeconds
{
  CMTime time;

  objc_msgSend(a1, "duration");
  return CMTimeGetSeconds(&time);
}

+ (id)ic_safeURLAssetWithURL:()IC
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0C8ADA0];
  v9[0] = &unk_1EA8321D8;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
