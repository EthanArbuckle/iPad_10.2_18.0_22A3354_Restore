@implementation FigCameraCalibrationDataCaptureConnectionConfiguration

- (FigCameraCalibrationDataCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  FigCameraCalibrationDataCaptureConnectionConfiguration *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FigCameraCalibrationDataCaptureConnectionConfiguration;
    v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
    if (v4)
    {
      *(&v4->super._enabled + 1) = xpc_dictionary_get_BOOL(a3, "mirroringEnabled");
      *((_DWORD *)&v4->super._enabled + 1) = xpc_dictionary_get_int64(a3, "orientation");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (id)copyXPCEncoding
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCameraCalibrationDataCaptureConnectionConfiguration;
  v3 = -[FigCaptureConnectionConfiguration copyXPCEncoding](&v5, sel_copyXPCEncoding);
  xpc_dictionary_set_BOOL(v3, "mirroringEnabled", -[FigCameraCalibrationDataCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"));
  xpc_dictionary_set_int64(v3, "orientation", -[FigCameraCalibrationDataCaptureConnectionConfiguration orientation](self, "orientation"));
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
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("CaCC %p: <%@>%@ -> <%@>"), self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"));
  objc_msgSend(v5, "appendFormat:", CFSTR(", E:%d, M:%d, O:%d"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"), -[FigCameraCalibrationDataCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"), -[FigCameraCalibrationDataCaptureConnectionConfiguration orientation](self, "orientation"));
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCameraCalibrationDataCaptureConnectionConfiguration;
  v4 = -[FigCaptureConnectionConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setMirroringEnabled:", -[FigCameraCalibrationDataCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"));
  objc_msgSend(v4, "setOrientation:", -[FigCameraCalibrationDataCaptureConnectionConfiguration orientation](self, "orientation"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FigCameraCalibrationDataCaptureConnectionConfiguration;
  v5 = -[FigCaptureConnectionConfiguration isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v6 = -[FigCameraCalibrationDataCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"),
          v6 == objc_msgSend(a3, "mirroringEnabled")))
    {
      v7 = -[FigCameraCalibrationDataCaptureConnectionConfiguration orientation](self, "orientation");
      LOBYTE(v5) = v7 == objc_msgSend(a3, "orientation");
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)mirroringEnabled
{
  return *(&self->super._enabled + 1);
}

- (void)setMirroringEnabled:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

- (int)orientation
{
  return *((_DWORD *)&self->super._enabled + 1);
}

- (void)setOrientation:(int)a3
{
  *((_DWORD *)&self->super._enabled + 1) = a3;
}

@end
