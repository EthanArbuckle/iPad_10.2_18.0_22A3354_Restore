@implementation NSURL(Audio)

- (double)audioDuration
{
  void *v1;
  void *v2;
  double Seconds;
  CMTime v5[2];

  objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    memset(&v5[1], 0, sizeof(CMTime));
    objc_msgSend(v1, "duration");
    v5[0] = v5[1];
    Seconds = CMTimeGetSeconds(v5);
  }
  else
  {
    Seconds = -1.0;
  }

  return Seconds;
}

@end
