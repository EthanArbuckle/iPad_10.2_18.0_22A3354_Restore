@implementation CAMCameraViewController

- (CAMCameraViewControllerUberDelegate)uberDelegate
{
  return (CAMCameraViewControllerUberDelegate *)-[CAMCameraViewController captureDelegate](self, "captureDelegate");
}

- (void)setUberDelegate:(id)a3
{
  id v4;

  v4 = a3;
  -[CAMCameraViewController setCaptureDelegate:](self, "setCaptureDelegate:", v4);
  -[CAMCameraViewController setCameraSessionDelegate:](self, "setCameraSessionDelegate:", v4);
  -[CAMCameraViewController setPresentationDelegate:](self, "setPresentationDelegate:", v4);
  -[CAMCameraViewController setCreativeCameraDelegate:](self, "setCreativeCameraDelegate:", v4);

}

@end
