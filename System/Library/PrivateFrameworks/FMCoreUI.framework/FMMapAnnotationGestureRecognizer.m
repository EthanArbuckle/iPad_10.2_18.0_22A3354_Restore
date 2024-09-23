@implementation FMMapAnnotationGestureRecognizer

- (FMMapAnnotationGestureRecognizer)init
{
  FMMapAnnotationGestureRecognizer *v2;
  FMMapAnnotationGestureRecognizer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMMapAnnotationGestureRecognizer;
  v2 = -[FMMapAnnotationGestureRecognizer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[FMMapAnnotationGestureRecognizer setCancelsTouchesInView:](v2, "setCancelsTouchesInView:", 0);

  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  -[FMMapAnnotationGestureRecognizer touchDelegate](self, "touchDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fingerOnAnnotation:", self);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;

  -[FMMapAnnotationGestureRecognizer touchDelegate](self, "touchDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fingerOffAnnotation:", self);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;

  -[FMMapAnnotationGestureRecognizer touchDelegate](self, "touchDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fingerOffAnnotation:", self);

}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 1;
}

- (FMMapAnnotationGestureRecognizerDelegate)touchDelegate
{
  return self->_touchDelegate;
}

- (void)setTouchDelegate:(id)a3
{
  self->_touchDelegate = (FMMapAnnotationGestureRecognizerDelegate *)a3;
}

@end
