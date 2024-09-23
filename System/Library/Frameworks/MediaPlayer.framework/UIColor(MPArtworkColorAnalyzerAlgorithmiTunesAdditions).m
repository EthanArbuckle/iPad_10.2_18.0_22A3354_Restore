@implementation UIColor(MPArtworkColorAnalyzerAlgorithmiTunesAdditions)

- (uint64_t)MP_isArtworkColorAnalyzerLightColorForAlgorithm:()MPArtworkColorAnalyzerAlgorithmiTunesAdditions
{
  if (a3 == 1)
    return objc_msgSend(MEMORY[0x1E0D4D000], "isLightColor:", objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
  else
    return 0;
}

@end
