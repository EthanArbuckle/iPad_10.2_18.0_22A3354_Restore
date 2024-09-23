@implementation CAFilter(MobileSafariExtras)

+ (uint64_t)safari_gaussianBlurWithRadius:()MobileSafariExtras
{
  return objc_msgSend(a1, "safari_gaussianBlurWithRadius:normalizeEdges:", 0);
}

+ (id)safari_gaussianBlurWithRadius:()MobileSafariExtras normalizeEdges:
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, *MEMORY[0x1E0CD2D70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v8, *MEMORY[0x1E0CD2D90]);

  return v6;
}

@end
