@implementation FigPointCloudDataCaptureConnectionConfiguration

- (FigPointCloudDataCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  FigPointCloudDataCaptureConnectionConfiguration *v4;
  objc_super v6;

  if (!a3)
  {

    self = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)FigPointCloudDataCaptureConnectionConfiguration;
  v4 = -[FigVideoCaptureConnectionConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_, a3);
  if (v4)
  {
    *(_DWORD *)&v4->super._coreMediaFaceTrackingEnabled = xpc_dictionary_get_int64(a3, "projectorMode");
    *(&v4->super._coreMediaFaceTrackingEnabled + 4) = xpc_dictionary_get_BOOL(a3, "supplementalPointCloudData");
    *(&v4->super._coreMediaFaceTrackingEnabled + 5) = xpc_dictionary_get_BOOL(a3, "pointCloudOutputDisabled");
  }
  return v4;
}

- (id)copyXPCEncoding
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigPointCloudDataCaptureConnectionConfiguration;
  v3 = -[FigVideoCaptureConnectionConfiguration copyXPCEncoding](&v5, sel_copyXPCEncoding);
  xpc_dictionary_set_int64(v3, "projectorMode", -[FigPointCloudDataCaptureConnectionConfiguration projectorMode](self, "projectorMode"));
  xpc_dictionary_set_BOOL(v3, "supplementalPointCloudData", -[FigPointCloudDataCaptureConnectionConfiguration supplementalPointCloudData](self, "supplementalPointCloudData"));
  xpc_dictionary_set_BOOL(v3, "pointCloudOutputDisabled", -[FigPointCloudDataCaptureConnectionConfiguration pointCloudOutputDisabled](self, "pointCloudOutputDisabled"));
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
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("PC %p: <%@>%@ -> <%@>"), self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"));
  objc_msgSend(v5, "appendFormat:", CFSTR(", %@/%dx%d"), BWStringForOSType(-[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat")), -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"), -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight"));
  objc_msgSend(v5, "appendFormat:", CFSTR(", E:%d, PROJ:%d, SUP:%d, RBC:%d, PCO=%d"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"), -[FigPointCloudDataCaptureConnectionConfiguration projectorMode](self, "projectorMode"), -[FigPointCloudDataCaptureConnectionConfiguration supplementalPointCloudData](self, "supplementalPointCloudData"), -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount"), -[FigPointCloudDataCaptureConnectionConfiguration pointCloudOutputDisabled](self, "pointCloudOutputDisabled"));
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigPointCloudDataCaptureConnectionConfiguration;
  v4 = -[FigVideoCaptureConnectionConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setProjectorMode:", -[FigPointCloudDataCaptureConnectionConfiguration projectorMode](self, "projectorMode"));
  objc_msgSend(v4, "setSupplementalPointCloudData:", -[FigPointCloudDataCaptureConnectionConfiguration supplementalPointCloudData](self, "supplementalPointCloudData"));
  objc_msgSend(v4, "setPointCloudOutputDisabled:", -[FigPointCloudDataCaptureConnectionConfiguration pointCloudOutputDisabled](self, "pointCloudOutputDisabled"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int v6;
  int v7;
  objc_super v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[FigPointCloudDataCaptureConnectionConfiguration projectorMode](self, "projectorMode");
  if (v5 != objc_msgSend(a3, "projectorMode"))
    return 0;
  v6 = -[FigPointCloudDataCaptureConnectionConfiguration supplementalPointCloudData](self, "supplementalPointCloudData");
  if (v6 != objc_msgSend(a3, "supplementalPointCloudData"))
    return 0;
  v7 = -[FigPointCloudDataCaptureConnectionConfiguration pointCloudOutputDisabled](self, "pointCloudOutputDisabled");
  if (v7 != objc_msgSend(a3, "pointCloudOutputDisabled"))
    return 0;
  v9.receiver = self;
  v9.super_class = (Class)FigPointCloudDataCaptureConnectionConfiguration;
  return -[FigVideoCaptureConnectionConfiguration isEqual:](&v9, sel_isEqual_, a3);
}

- (int)projectorMode
{
  return *(_DWORD *)&self->super._coreMediaFaceTrackingEnabled;
}

- (void)setProjectorMode:(int)a3
{
  *(_DWORD *)&self->super._coreMediaFaceTrackingEnabled = a3;
}

- (BOOL)supplementalPointCloudData
{
  return *(&self->super._coreMediaFaceTrackingEnabled + 4);
}

- (void)setSupplementalPointCloudData:(BOOL)a3
{
  *(&self->super._coreMediaFaceTrackingEnabled + 4) = a3;
}

- (BOOL)pointCloudOutputDisabled
{
  return *(&self->super._coreMediaFaceTrackingEnabled + 5);
}

- (void)setPointCloudOutputDisabled:(BOOL)a3
{
  *(&self->super._coreMediaFaceTrackingEnabled + 5) = a3;
}

@end
