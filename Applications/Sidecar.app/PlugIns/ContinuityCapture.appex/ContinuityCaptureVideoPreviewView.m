@implementation ContinuityCaptureVideoPreviewView

+ (Class)layerClass
{
  return (Class)objc_opt_class(AVCaptureVideoPreviewLayer, a2);
}

@end
