@implementation AKInkAnnotationEventHandler

+ (BOOL)allowsDraggingOfAnnotation:(id)a3
{
  return 0;
}

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  return 0;
}

- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  return 0;
}

- (BOOL)alwaysLockAspectRatio
{
  return 1;
}

- (CGSize)naturalSizeForAnnotation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[AKAnnotationEventHandler annotation](self, "annotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "drawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "bounds");
      v7 = v6;
      v9 = v8;
      if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
      {
        v9 = 1.0;
        v7 = 1.0;
      }
    }
    else
    {
      v9 = 1.0;
      v7 = 1.0;
    }

  }
  else
  {
    v9 = 1.0;
    v7 = 1.0;
  }

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
