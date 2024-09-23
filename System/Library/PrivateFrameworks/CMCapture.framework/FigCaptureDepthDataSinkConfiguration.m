@implementation FigCaptureDepthDataSinkConfiguration

- (int)sinkType
{
  return 11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDiscardsLateDepthData:", -[FigCaptureDepthDataSinkConfiguration discardsLateDepthData](self, "discardsLateDepthData"));
  objc_msgSend(v4, "setFilteringEnabled:", -[FigCaptureDepthDataSinkConfiguration filteringEnabled](self, "filteringEnabled"));
  return v4;
}

- (void)setFilteringEnabled:(BOOL)a3
{
  self->_filteringEnabled = a3;
}

- (void)setDiscardsLateDepthData:(BOOL)a3
{
  self->_discardsLateDepthData = a3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v6 = -[FigCaptureDepthDataSinkConfiguration discardsLateDepthData](self, "discardsLateDepthData"),
          v6 == objc_msgSend(a3, "discardsLateDepthData")))
    {
      v7 = -[FigCaptureDepthDataSinkConfiguration filteringEnabled](self, "filteringEnabled");
      LOBYTE(v5) = v7 ^ objc_msgSend(a3, "filteringEnabled") ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ discards:%d filters:%d"), -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCaptureDepthDataSinkConfiguration discardsLateDepthData](self, "discardsLateDepthData"), -[FigCaptureDepthDataSinkConfiguration filteringEnabled](self, "filteringEnabled"));
}

- (BOOL)filteringEnabled
{
  return self->_filteringEnabled;
}

- (BOOL)discardsLateDepthData
{
  return self->_discardsLateDepthData;
}

- (id)copyXPCEncoding
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  v3 = -[FigCaptureSinkConfiguration copyXPCEncoding](&v5, sel_copyXPCEncoding);
  xpc_dictionary_set_BOOL(v3, "discardsLateDepthData", -[FigCaptureDepthDataSinkConfiguration discardsLateDepthData](self, "discardsLateDepthData"));
  xpc_dictionary_set_BOOL(v3, "filteringEnabled", -[FigCaptureDepthDataSinkConfiguration filteringEnabled](self, "filteringEnabled"));
  return v3;
}

- (FigCaptureDepthDataSinkConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureDepthDataSinkConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_discardsLateDepthData = xpc_dictionary_get_BOOL(a3, "discardsLateDepthData");
    v4->_filteringEnabled = xpc_dictionary_get_BOOL(a3, "filteringEnabled");
  }
  return v4;
}

@end
