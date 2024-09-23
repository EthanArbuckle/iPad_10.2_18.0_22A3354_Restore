@implementation NSBundle(VCPMediaAnalysis)

+ (id)vcp_mediaAnalysisBundle
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaAnalysis"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.mediaanalysisd"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

@end
