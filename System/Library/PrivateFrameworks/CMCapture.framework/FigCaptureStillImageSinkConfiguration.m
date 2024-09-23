@implementation FigCaptureStillImageSinkConfiguration

- (FigCaptureStillImageSinkConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureStillImageSinkConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_quadraHighResCaptureEnabled = xpc_dictionary_get_BOOL(a3, "stillImageQuadraHighResCaptureEnabled");
    v4->_zeroShutterLagEnabled = xpc_dictionary_get_BOOL(a3, "stillImageZeroShutterLagEnabled");
  }
  return v4;
}

- (id)copyXPCEncoding
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  v3 = -[FigCaptureSinkConfiguration copyXPCEncoding](&v5, sel_copyXPCEncoding);
  xpc_dictionary_set_BOOL(v3, "stillImageQuadraHighResCaptureEnabled", -[FigCaptureStillImageSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"));
  xpc_dictionary_set_BOOL(v3, "stillImageZeroShutterLagEnabled", -[FigCaptureStillImageSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled"));
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ quadraHighRes:%d zeroShutterLag:%d"), -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCaptureStillImageSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"), -[FigCaptureStillImageSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setQuadraHighResCaptureEnabled:", -[FigCaptureStillImageSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"));
  objc_msgSend(v4, "setZeroShutterLagEnabled:", -[FigCaptureStillImageSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v6 = -[FigCaptureStillImageSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"),
          v6 == objc_msgSend(a3, "quadraHighResCaptureEnabled")))
    {
      v7 = -[FigCaptureStillImageSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled");
      LOBYTE(v5) = v7 ^ objc_msgSend(a3, "zeroShutterLagEnabled") ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int)sinkType
{
  return 3;
}

- (BOOL)quadraHighResCaptureEnabled
{
  return self->_quadraHighResCaptureEnabled;
}

- (void)setQuadraHighResCaptureEnabled:(BOOL)a3
{
  self->_quadraHighResCaptureEnabled = a3;
}

- (BOOL)zeroShutterLagEnabled
{
  return self->_zeroShutterLagEnabled;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  self->_zeroShutterLagEnabled = a3;
}

@end
