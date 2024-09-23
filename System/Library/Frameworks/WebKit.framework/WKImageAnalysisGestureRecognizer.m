@implementation WKImageAnalysisGestureRecognizer

- (WKImageAnalysisGestureRecognizer)initWithImageAnalysisGestureDelegate:(id)a3
{
  WKImageAnalysisGestureRecognizer *v4;
  WKImageAnalysisGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKImageAnalysisGestureRecognizer;
  v4 = -[WKImageAnalysisGestureRecognizer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_imageAnalysisGestureRecognizerDelegate, a3);
    -[WKImageAnalysisGestureRecognizer setDelegate:](v5, "setDelegate:", a3);
    -[WKImageAnalysisGestureRecognizer setMinimumPressDuration:](v5, "setMinimumPressDuration:", 0.1);
    -[WKImageAnalysisGestureRecognizer setAllowableMovement:](v5, "setAllowableMovement:", 0.0);
    -[WKImageAnalysisGestureRecognizer setName:](v5, "setName:", CFSTR("Image analysis"));
  }
  return v5;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKImageAnalysisGestureRecognizer;
  -[WKImageAnalysisGestureRecognizer reset](&v3, sel_reset);
  objc_storeWeak((id *)&self->_lastTouchedScrollView, 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKImageAnalysisGestureRecognizer;
  -[WKImageAnalysisGestureRecognizer touchesBegan:withEvent:](&v7, sel_touchesBegan_withEvent_, a3, a4);
  v6 = (void *)WebKit::scrollViewForTouches(a3);
  if (v6)
    objc_storeWeak((id *)&self->_lastTouchedScrollView, v6);
  -[WKImageAnalysisGestureRecognizer beginAfterExceedingForceThresholdIfNeeded:](self, "beginAfterExceedingForceThresholdIfNeeded:", a3);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKImageAnalysisGestureRecognizer;
  -[WKImageAnalysisGestureRecognizer touchesMoved:withEvent:](&v6, sel_touchesMoved_withEvent_, a3, a4);
  -[WKImageAnalysisGestureRecognizer beginAfterExceedingForceThresholdIfNeeded:](self, "beginAfterExceedingForceThresholdIfNeeded:", a3);
}

- (void)beginAfterExceedingForceThresholdIfNeeded:(id)a3
{
  double v5;

  if (!-[WKImageAnalysisGestureRecognizer state](self, "state") && (unint64_t)objc_msgSend(a3, "count") <= 1)
  {
    objc_msgSend((id)objc_msgSend(a3, "anyObject"), "force");
    if (v5 >= 1.5)
      -[WKImageAnalysisGestureRecognizer setState:](self, "setState:", 1);
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v5 = -[WKImageAnalysisGestureRecognizer state](self, "state");
  v7.receiver = self;
  v7.super_class = (Class)WKImageAnalysisGestureRecognizer;
  -[WKImageAnalysisGestureRecognizer setState:](&v7, sel_setState_, a3);
  v6 = -[WKImageAnalysisGestureRecognizer state](self, "state");
  if (v5 != v6)
  {
    if (v6 == 5)
    {
      objc_msgSend(objc_loadWeak((id *)&self->_imageAnalysisGestureRecognizerDelegate), "imageAnalysisGestureDidFail:", self);
    }
    else if (v6 == 1)
    {
      objc_msgSend(objc_loadWeak((id *)&self->_imageAnalysisGestureRecognizerDelegate), "imageAnalysisGestureDidBegin:", self);
    }
  }
}

- (UIScrollView)lastTouchedScrollView
{
  return (UIScrollView *)objc_loadWeak((id *)&self->_lastTouchedScrollView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastTouchedScrollView);
  objc_destroyWeak((id *)&self->_imageAnalysisGestureRecognizerDelegate);
}

@end
