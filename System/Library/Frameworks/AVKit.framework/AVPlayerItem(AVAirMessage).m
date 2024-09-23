@implementation AVPlayerItem(AVAirMessage)

- (id)avkitACMIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "asset");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "URL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
