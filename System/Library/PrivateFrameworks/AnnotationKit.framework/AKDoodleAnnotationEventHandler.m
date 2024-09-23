@implementation AKDoodleAnnotationEventHandler

- (BOOL)alwaysLockAspectRatio
{
  return 1;
}

- (CGSize)naturalSizeForAnnotation
{
  void *v2;
  void *v3;
  void *v4;
  const CGPath *v5;
  CGFloat height;
  CGFloat width;
  double v8;
  double v9;
  CGSize result;
  CGRect BoundingBox;

  -[AKAnnotationEventHandler annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (const CGPath *)objc_msgSend(v4, "newCGPathForPlatformBezierPath");

    height = 1.0;
    if (v5)
    {
      width = 1.0;
      if (!CGPathIsEmpty(v5))
      {
        BoundingBox = CGPathGetBoundingBox(v5);
        width = BoundingBox.size.width;
        height = BoundingBox.size.height;
      }
    }
    else
    {
      width = 1.0;
    }
    CGPathRelease(v5);
  }
  else
  {
    height = 1.0;
    width = 1.0;
  }

  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

@end
