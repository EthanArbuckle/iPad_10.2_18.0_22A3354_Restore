@implementation JFXCVASegMatting_NoOp

- (id)initForFrameSet:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXCVASegMatting_NoOp;
  v5 = -[JFXMatting initForFrameSet:](&v9, sel_initForFrameSet_, v4);
  v6 = v5;
  if (v5)
  {
    v8.receiver = v5;
    v8.super_class = (Class)JFXCVASegMatting_NoOp;
    -[JFXMatting setReady:](&v8, sel_setReady_, 1);
  }

  return v6;
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (BOOL)isValidForCameraFrameSet:(id)a3
{
  return 1;
}

@end
