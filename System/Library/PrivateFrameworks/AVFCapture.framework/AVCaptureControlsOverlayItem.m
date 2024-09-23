@implementation AVCaptureControlsOverlayItem

- (NSString)identifier
{
  return (NSString *)(id)-[NSString copy](-[AVCaptureControl identifier](self->_control, "identifier"), "copy");
}

- (AVCaptureControlsOverlayItem)initWithControl:(id)a3 overlayControl:(id)a4
{
  AVCaptureControlsOverlayItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureControlsOverlayItem;
  v6 = -[AVCaptureControlsOverlayItem init](&v8, sel_init);
  if (v6)
  {
    v6->_control = (AVCaptureControl *)a3;
    v6->_overlayControl = (CAMAbstractOverlayServiceControl *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureControlsOverlayItem;
  -[AVCaptureControlsOverlayItem dealloc](&v3, sel_dealloc);
}

- (AVCaptureControl)control
{
  return self->_control;
}

- (CAMAbstractOverlayServiceControl)overlayControl
{
  return self->_overlayControl;
}

@end
