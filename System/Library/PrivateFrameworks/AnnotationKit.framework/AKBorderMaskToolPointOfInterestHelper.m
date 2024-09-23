@implementation AKBorderMaskToolPointOfInterestHelper

+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  double y;
  double x;
  id v11;
  unint64_t v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v11 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___AKBorderMaskToolPointOfInterestHelper;
  v12 = (unint64_t)objc_msgSendSuper2(&v14, sel__concreteDraggableAreaForPoint_onAnnotation_withScale_pageControllerForPixelAlignment_, v11, a6, x, y, a5);
  if (!v12)
  {
    if (+[AKAnnotationRenderer pointIsOnInside:ofAnnotation:](AKAnnotationRenderer, "pointIsOnInside:ofAnnotation:", v11, x, y))
    {
      v12 = 20;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

@end
