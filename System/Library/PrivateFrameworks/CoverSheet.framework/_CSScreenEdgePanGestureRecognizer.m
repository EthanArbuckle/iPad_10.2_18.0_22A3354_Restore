@implementation _CSScreenEdgePanGestureRecognizer

- (int64_t)_touchInterfaceOrientation
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
}

@end
