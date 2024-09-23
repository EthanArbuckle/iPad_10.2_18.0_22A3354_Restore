@implementation AKTextFieldAnnotationEventHandler

+ (BOOL)allowsDragging
{
  return 0;
}

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "editingDisabled");

  if ((v7 & 1) == 0)
  {
    -[AKAnnotationEventHandler pageController](self, "pageController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showSelectionMenu:", v5);

  }
  return v7 ^ 1;
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
