@implementation AVCapturePrepareBracketRequest

+ (id)prepareBracketRequestWithCompletionBlock:(id)a3 settings:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCompletionBlock:settings:", a3, a4);
}

- (id)_initWithCompletionBlock:(id)a3 settings:(id)a4
{
  AVCapturePrepareBracketRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCapturePrepareBracketRequest;
  v6 = -[AVCapturePrepareBracketRequest init](&v8, sel_init);
  if (v6)
  {
    v6->_completionBlock = (id)objc_msgSend(a3, "copy");
    v6->_settings = (FigCaptureStillImageSettings *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCapturePrepareBracketRequest;
  -[AVCapturePrepareBracketRequest dealloc](&v3, sel_dealloc);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (FigCaptureStillImageSettings)settings
{
  return self->_settings;
}

@end
