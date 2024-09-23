@implementation AXMAVUtilities

+ (id)videoDeviceFromConnection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "inputPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isMirroredVideoDevice:(id)a3
{
  return objc_msgSend(a3, "position") == 2;
}

+ ($2825F4736939C4A6D3AD43837233062D)videoDimensionsForDeviceFormat:(id)a3
{
  return *($2825F4736939C4A6D3AD43837233062D *)&CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(a3, "formatDescription"));
}

@end
