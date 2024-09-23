@implementation ARRaycastResult(ARRaycastResult_Position)

- (double)worldPosition
{
  double v1;

  objc_msgSend(a1, "worldTransform");
  return v1;
}

@end
