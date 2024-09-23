@implementation ICDocCamPreviewView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (AVCaptureSession)session
{
  void *v2;
  void *v3;

  -[ICDocCamPreviewView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVCaptureSession *)v3;
}

- (void)setSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICDocCamPreviewView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSession:", v4);

}

@end
