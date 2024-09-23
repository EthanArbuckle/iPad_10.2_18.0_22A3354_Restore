@implementation AKRotationGestureRecognizer

- (void)setState:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKRotationGestureRecognizer;
  -[AKRotationGestureRecognizer setState:](&v5, sel_setState_);
  if (a3)
    self->tries = 0;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  v8 = -[AKRotationGestureRecognizer state](self, "state");
  v13.receiver = self;
  v13.super_class = (Class)AKRotationGestureRecognizer;
  -[AKRotationGestureRecognizer touchesMoved:withEvent:](&v13, sel_touchesMoved_withEvent_, v7, v6);

  -[AKRotationGestureRecognizer annotationController](self, "annotationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allSelectedAnnotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "count")
    || !v8
    && -[AKRotationGestureRecognizer state](self, "state") != 1
    && (v12 = self->tries + 1, self->tries = v12, v12 >= 8))
  {
    -[AKRotationGestureRecognizer setEnabled:](self, "setEnabled:", 0);
    -[AKRotationGestureRecognizer setEnabled:](self, "setEnabled:", 1);
  }

}

- (AKController)annotationController
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_annotationController);
}

- (void)setAnnotationController:(id)a3
{
  objc_storeWeak((id *)&self->_annotationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationController);
}

@end
