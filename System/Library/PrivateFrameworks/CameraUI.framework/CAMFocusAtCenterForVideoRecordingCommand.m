@implementation CAMFocusAtCenterForVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  CAMFocusCommand *v6;
  id v7;

  objc_msgSend(a3, "currentVideoDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "autoFocusSystem") == 2)
    v5 = 3;
  else
    v5 = 2;
  v6 = -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:atPointOfInterest:smooth:", v5, 1, 0.5, 0.5);
  if (v6)
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v6);

}

@end
