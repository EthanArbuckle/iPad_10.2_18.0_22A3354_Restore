@implementation JFXCVASegMatting

- (id)initForFrameSet:(id)a3
{
  id v4;
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  objc_super v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JFXCVASegMatting;
  v5 = -[JFXMatting initForFrameSet:](&v11, sel_initForFrameSet_, v4);
  if (v5)
  {
    v6 = -[JFXCVASegMatting_NoOp initForFrameSet:]([JFXCVASegMatting_NoOp alloc], "initForFrameSet:", v4);
    v7 = v5[5];
    v5[5] = v6;

    v8 = objc_msgSend(v5[5], "ready");
    v10.receiver = v5;
    v10.super_class = (Class)JFXCVASegMatting;
    -[JFXMatting setReady:](&v10, sel_setReady_, v8);
  }

  return v5;
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  objc_super v11;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11.receiver = self;
  v11.super_class = (Class)JFXCVASegMatting;
  if (-[JFXMatting ready](&v11, sel_ready))
    -[JFXMatting alphaMatteForFrameSet:mattingPerfState:completionHandler:](self->_impl, "alphaMatteForFrameSet:mattingPerfState:completionHandler:", v8, v9, v10);
  else
    v10[2](v10, 0);

}

- (BOOL)isValidForCameraFrameSet:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)JFXCVASegMatting;
  if (-[JFXMatting isValidForCameraFrameSet:](&v7, sel_isValidForCameraFrameSet_, v4))
    v5 = -[JFXMatting isValidForCameraFrameSet:](self->_impl, "isValidForCameraFrameSet:", v4);
  else
    v5 = 0;

  return v5;
}

+ (CGSize)mattingDepthInputSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 320.0;
  v3 = 180.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
