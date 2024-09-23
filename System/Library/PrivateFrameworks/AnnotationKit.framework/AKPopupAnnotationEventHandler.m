@implementation AKPopupAnnotationEventHandler

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  void *v5;
  void *v6;

  -[AKAnnotationEventHandler pageController](self, "pageController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openPopupAnnotation:", v6);

  return 1;
}

+ (BOOL)allowsDragging
{
  return 0;
}

- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  return 0;
}

- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  return 0;
}

@end
