@implementation FigDepthDataCaptureConnectionConfiguration

- (id)description
{
  int v3;
  const __CFString *v4;
  void *v5;

  v3 = -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType");
  if (v3 == -[FigCaptureSourceConfiguration sourceDeviceType](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourceDeviceType"))v4 = &stru_1E4928818;
  else
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (SUB-DEVICE:%@)"), +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType")));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("DC %p: <%@>%@ -> <%@>"), self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"));
  objc_msgSend(v5, "appendFormat:", CFSTR(", %@/%dx%d"), BWStringForOSType(-[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat")), -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"), -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight"));
  objc_msgSend(v5, "appendFormat:", CFSTR(", E:%d, VIS:%d, M:%d, O:%d, RBC:%d"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"), -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](self, "videoStabilizationMethod"), -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"), -[FigVideoCaptureConnectionConfiguration orientation](self, "orientation"), -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"));
  return v5;
}

@end
