@implementation SpeakScreenGestureRecognizer

- (int64_t)_touchInterfaceOrientation
{
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation");
}

@end
