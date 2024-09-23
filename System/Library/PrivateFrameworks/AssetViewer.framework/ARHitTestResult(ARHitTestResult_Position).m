@implementation ARHitTestResult(ARHitTestResult_Position)

- (double)worldPosition
{
  double v1;

  objc_msgSend(a1, "worldTransform");
  return v1;
}

- (double)localPosition
{
  double v1;

  objc_msgSend(a1, "localTransform");
  return v1;
}

@end
