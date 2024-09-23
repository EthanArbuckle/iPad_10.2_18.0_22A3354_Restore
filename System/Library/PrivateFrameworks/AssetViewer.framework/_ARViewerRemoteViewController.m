@implementation _ARViewerRemoteViewController

+ (id)serviceViewControllerInterface
{
  if (serviceViewControllerInterface_onceToken != -1)
    dispatch_once(&serviceViewControllerInterface_onceToken, &__block_literal_global_5);
  return (id)serviceViewControllerInterface_sVendorInterface;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken != -1)
    dispatch_once(&exportedInterface_onceToken, &__block_literal_global_41);
  return (id)exportedInterface_sHostInterface;
}

- (void)isIgnoringInteractionEvents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_ARViewerRemoteViewController arviewerDelegate](self, "arviewerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isIgnoringInteractionEvents:", v4);

}

- (void)statusBarOrientation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_ARViewerRemoteViewController arviewerDelegate](self, "arviewerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarOrientation:", v4);

}

- (void)setStatusBarOrientation:(int64_t)a3
{
  id v4;

  -[_ARViewerRemoteViewController arviewerDelegate](self, "arviewerDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusBarOrientation:", a3);

}

- (ARViewerHostProtocol)arviewerDelegate
{
  return (ARViewerHostProtocol *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setArviewerDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1472);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arviewerDelegate, 0);
}

@end
