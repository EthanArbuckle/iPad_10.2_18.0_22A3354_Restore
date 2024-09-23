@implementation FigVisionDataCaptureConnectionConfiguration

- (FigVisionDataCaptureConnectionConfiguration)init
{
  FigVisionDataCaptureConnectionConfiguration *v2;
  FigVisionDataCaptureConnectionConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigVisionDataCaptureConnectionConfiguration;
  v2 = -[FigCaptureConnectionConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FigVideoCaptureConnectionConfiguration setOutputFormat:](v2, "setOutputFormat:", 1278226488);
    -[FigVideoCaptureConnectionConfiguration setOutputWidth:](v3, "setOutputWidth:", 128);
    -[FigVideoCaptureConnectionConfiguration setOutputHeight:](v3, "setOutputHeight:", 128);
  }
  return v3;
}

- (id)description
{
  int v3;
  const __CFString *v4;
  void *v5;

  v3 = -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType");
  if (v3 == -[FigCaptureSourceConfiguration sourceDeviceType](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourceDeviceType"))v4 = &stru_1E4928818;
  else
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (SUB-DEVICE:%@)"), +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType")));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("VsnC %p: <%@>%@ -> <%@>"), self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"));
  objc_msgSend(v5, "appendFormat:", CFSTR(", %@/%dx%d, E:%d"), BWStringForOSType(-[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat")), -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"), -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"));
  return v5;
}

@end
