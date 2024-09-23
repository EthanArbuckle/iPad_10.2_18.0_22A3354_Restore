@implementation SAVCSPlayContent

- (id)_sr_playerForHighResolutionPlayback:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  if (-[SAVCSPlayContent playTrailer](self, "playTrailer"))
  {
    if (v3)
      v5 = objc_claimAutoreleasedReturnValue(-[SAVCSPlayContent hiresTrailerUri](self, "hiresTrailerUri"));
    else
      v5 = objc_claimAutoreleasedReturnValue(-[SAVCSPlayContent lowresTrailerUri](self, "lowresTrailerUri"));
    v7 = (void *)v5;
    if (v5)
      v6 = objc_msgSend(objc_alloc((Class)AVPlayer), "initWithURL:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
