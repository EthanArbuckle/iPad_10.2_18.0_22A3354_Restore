@implementation UIHoverGestureRecognizer(MapsUILayout)

- (uint64_t)_mapsui_isHovering
{
  uint64_t result;

  result = objc_msgSend(a1, "state");
  if (result != 1)
    return objc_msgSend(a1, "state") == 2;
  return result;
}

@end
