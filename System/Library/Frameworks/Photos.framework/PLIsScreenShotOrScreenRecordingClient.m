@implementation PLIsScreenShotOrScreenRecordingClient

void __PLIsScreenShotOrScreenRecordingClient_block_invoke()
{
  id v0;

  PLBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqual:", CFSTR("com.apple.springboard")) & 1) != 0
    || objc_msgSend(v0, "isEqual:", CFSTR("com.apple.replayd")))
  {
    PLIsScreenShotOrScreenRecordingClient_sIsScreenShotOrScreenRecordingClient = 1;
  }

}

@end
