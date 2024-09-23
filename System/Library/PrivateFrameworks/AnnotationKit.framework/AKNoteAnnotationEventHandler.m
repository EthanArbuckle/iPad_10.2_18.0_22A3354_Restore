@implementation AKNoteAnnotationEventHandler

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AKAnnotationEventHandler pageController](self, "pageController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childAnnotation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "openPopupAnnotation:", v7);
  }
  else
  {
    -[AKAnnotationEventHandler annotation](self, "annotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addPopupToAnnotation:openPopup:", v8, 1);

  }
  return 1;
}

+ (BOOL)allowsDragging
{
  return 1;
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
