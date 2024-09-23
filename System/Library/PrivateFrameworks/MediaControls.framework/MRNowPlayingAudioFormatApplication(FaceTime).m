@implementation MRNowPlayingAudioFormatApplication(FaceTime)

- (uint64_t)isFaceTime
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(a1, "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "mru_isFaceTimeBundleIdentifier:", v2);

  return v3;
}

@end
