@implementation AKNoPointOfInterestHelper

+ (void)_concretePointsOfInterest:(id *)a3 withVisualStyle:(id *)a4 ofAnnotation:(id)a5 pageControllerForPixelAlignment:(id)a6
{
  void *v6;

  v6 = (void *)MEMORY[0x24BDBD1A8];
  *a3 = (id)MEMORY[0x24BDBD1A8];
  *a4 = v6;
}

+ (unint64_t)_concreteDraggableAreaForPoint:(CGPoint)a3 onAnnotation:(id)a4 withScale:(double)a5 pageControllerForPixelAlignment:(id)a6
{
  return 0;
}

@end
