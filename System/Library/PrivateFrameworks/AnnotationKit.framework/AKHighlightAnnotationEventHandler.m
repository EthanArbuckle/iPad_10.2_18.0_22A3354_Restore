@implementation AKHighlightAnnotationEventHandler

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[AKAnnotationEventHandler pageController](self, "pageController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageModelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSet:", v10);

  -[AKAnnotationEventHandler annotation](self, "annotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openPopoverForHighlightAnnotation:", v11);

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
