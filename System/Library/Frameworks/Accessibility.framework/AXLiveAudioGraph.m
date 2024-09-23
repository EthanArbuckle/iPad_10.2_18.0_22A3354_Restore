@implementation AXLiveAudioGraph

+ (void)start
{
  id v2;

  objc_msgSend(getAXMDataSonificationManagerClass(), "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginLiveModeSession");

}

+ (void)updateValue:(double)value
{
  id v4;

  objc_msgSend(getAXMDataSonificationManagerClass(), "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLiveModeValue:", value);

}

+ (void)stop
{
  id v2;

  objc_msgSend(getAXMDataSonificationManagerClass(), "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endLiveModeSession");

}

@end
