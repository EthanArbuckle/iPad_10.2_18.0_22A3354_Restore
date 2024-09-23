@implementation FigCaptureMovieFileSinkConfiguration

- (FigCaptureMovieFileSinkConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureMovieFileSinkConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4)
    v4->_trueVideoCaptureEnabled = xpc_dictionary_get_BOOL(a3, "trueVideoCaptureEnabled");
  return v4;
}

- (id)copyXPCEncoding
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  v3 = -[FigCaptureSinkConfiguration copyXPCEncoding](&v5, sel_copyXPCEncoding);
  xpc_dictionary_set_BOOL(v3, "trueVideoCaptureEnabled", -[FigCaptureMovieFileSinkConfiguration trueVideoCaptureEnabled](self, "trueVideoCaptureEnabled"));
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ trueVideo:%d"), -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCaptureMovieFileSinkConfiguration trueVideoCaptureEnabled](self, "trueVideoCaptureEnabled"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setTrueVideoCaptureEnabled:", -[FigCaptureMovieFileSinkConfiguration trueVideoCaptureEnabled](self, "trueVideoCaptureEnabled"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[FigCaptureMovieFileSinkConfiguration trueVideoCaptureEnabled](self, "trueVideoCaptureEnabled");
      LOBYTE(v5) = v6 ^ objc_msgSend(a3, "trueVideoCaptureEnabled") ^ 1;
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
  return 4;
}

- (BOOL)trueVideoCaptureEnabled
{
  return self->_trueVideoCaptureEnabled;
}

- (void)setTrueVideoCaptureEnabled:(BOOL)a3
{
  self->_trueVideoCaptureEnabled = a3;
}

@end
