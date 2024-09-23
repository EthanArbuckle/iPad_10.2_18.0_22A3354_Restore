@implementation FigMetadataItemCaptureConnectionConfiguration

- (FigMetadataItemCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  FigMetadataItemCaptureConnectionConfiguration *v4;
  int int64;
  CMClockRef HostTimeClock;
  int v7;
  uint64_t v9;
  objc_super v10;

  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
    v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v10, sel_initWithXPCEncoding_);
    if (v4)
    {
      v9 = 0;
      FigXPCMessageCopyCFData();
      int64 = xpc_dictionary_get_int64(a3, "clock");
      if (int64 == 2)
      {
        CMAudioClockCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v4->_clock);
      }
      else if (int64 == 1)
      {
        HostTimeClock = CMClockGetHostTimeClock();
        v4->_clock = (OpaqueCMClock *)CFRetain(HostTimeClock);
      }
      v7 = xpc_dictionary_get_int64(a3, "inputType");
      if ((v7 - 1) <= 2)
        v4->_sourceSubType = v7;
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
  id v4;
  void *v5;
  int64_t v6;
  size_t v8;
  size_t lengthAtOffsetOut;
  char *dataPointerOut;
  objc_super v11;
  CMBlockBufferRef blockBufferOut;

  v11.receiver = self;
  v11.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
  blockBufferOut = 0;
  v3 = -[FigCaptureConnectionConfiguration copyXPCEncoding](&v11, sel_copyXPCEncoding);
  CMMetadataFormatDescriptionCopyAsBigEndianMetadataDescriptionBlockBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_formatDescription, 0, &blockBufferOut);
  lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  v8 = 0;
  CMBlockBufferGetDataPointer(blockBufferOut, 0, &lengthAtOffsetOut, &v8, &dataPointerOut);
  v4 = objc_alloc(MEMORY[0x1E0C99D50]);
  v5 = (void *)objc_msgSend(v4, "initWithBytes:length:", dataPointerOut, v8);
  FigXPCMessageSetCFData();

  CMClockGetHostTimeClock();
  if (FigCFEqual())
  {
    v6 = 1;
  }
  else
  {
    if (!self->_clock)
      goto LABEL_6;
    v6 = 2;
  }
  xpc_dictionary_set_int64(v3, "clock", v6);
LABEL_6:
  xpc_dictionary_set_int64(v3, "inputType", self->_sourceSubType);
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  return v3;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  OpaqueCMClock *clock;
  objc_super v5;

  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  clock = self->_clock;
  if (clock)
    CFRelease(clock);
  v5.receiver = self;
  v5.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
  -[FigCaptureConnectionConfiguration dealloc](&v5, sel_dealloc);
}

- (id)description
{
  int v3;
  const __CFString *v4;

  v3 = -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType");
  if (v3 == -[FigCaptureSourceConfiguration sourceDeviceType](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourceDeviceType"))v4 = &stru_1E4928818;
  else
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (SUB-DEVICE:%@)"), +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType")));
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("MIC %p: <%@>%@ -> <%@>, SST: %d, E:%d"), self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), -[FigMetadataItemCaptureConnectionConfiguration sourceSubType](self, "sourceSubType"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
  v4 = -[FigCaptureConnectionConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setFormatDescription:", -[FigMetadataItemCaptureConnectionConfiguration formatDescription](self, "formatDescription"));
  objc_msgSend(v4, "setClock:", -[FigMetadataItemCaptureConnectionConfiguration clock](self, "clock"));
  objc_msgSend(v4, "setSourceSubType:", -[FigMetadataItemCaptureConnectionConfiguration sourceSubType](self, "sourceSubType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigMetadataItemCaptureConnectionConfiguration;
  v5 = -[FigCaptureConnectionConfiguration isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = CMFormatDescriptionEqual(-[FigMetadataItemCaptureConnectionConfiguration formatDescription](self, "formatDescription"), (CMFormatDescriptionRef)objc_msgSend(a3, "formatDescription"));
      if (v5)
      {
        -[FigMetadataItemCaptureConnectionConfiguration clock](self, "clock");
        objc_msgSend(a3, "clock");
        v5 = FigCFEqual();
        if (v5)
        {
          v6 = -[FigMetadataItemCaptureConnectionConfiguration sourceSubType](self, "sourceSubType");
          LOBYTE(v5) = v6 == objc_msgSend(a3, "sourceSubType");
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- (void)setFormatDescription:(opaqueCMFormatDescription *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (OpaqueCMClock)clock
{
  return self->_clock;
}

- (void)setClock:(OpaqueCMClock *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int)sourceSubType
{
  return self->_sourceSubType;
}

- (void)setSourceSubType:(int)a3
{
  self->_sourceSubType = a3;
}

@end
