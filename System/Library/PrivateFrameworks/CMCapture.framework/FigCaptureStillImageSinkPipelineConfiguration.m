@implementation FigCaptureStillImageSinkPipelineConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureStillImageSinkPipelineConfiguration)initWithCoder:(id)a3
{
  FigCaptureStillImageSinkPipelineConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureStillImageSinkPipelineConfiguration;
  v4 = -[FigCaptureBaseStillImageSinkPipelineConfiguration initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_clientPID = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("clientPID"));
    v4->_stillImageColorInfoForFramesOriginatingFromVideoStream = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stillImageColorInfoForFramesOriginatingFromVideoStream"));
    v4->_stillImageISPChromaNoiseReductionEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("stillImageISPChromaNoiseReductionEnabled"));
    v4->_stereoFusionSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("stereoFusionSupported"));
    v4->_isIrisSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isIrisSupported"));
    v4->_hdrSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("hdrSupported"));
    v4->_gnrHDRSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("gnrHDRSupported"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureStillImageSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_clientPID, CFSTR("clientPID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_stillImageColorInfoForFramesOriginatingFromVideoStream, CFSTR("stillImageColorInfoForFramesOriginatingFromVideoStream"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_stillImageISPChromaNoiseReductionEnabled, CFSTR("stillImageISPChromaNoiseReductionEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_stereoFusionSupported, CFSTR("stereoFusionSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isIrisSupported, CFSTR("isIrisSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_hdrSupported, CFSTR("hdrSupported"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_gnrHDRSupported, CFSTR("gnrHDRSupported"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int clientPID;
  int v10;
  NSDictionary *stillImageColorInfoForFramesOriginatingFromVideoStream;
  NSDictionary *v12;
  NSDictionary *v13;
  uint64_t v14;
  int v15;
  char gnrHDRSupported;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;

  if (a3 != self)
  {
    v19 = v4;
    v20 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    if (self)
    {
      clientPID = self->_clientPID;
      if (a3)
      {
LABEL_5:
        v10 = *((_DWORD *)a3 + 22);
        goto LABEL_6;
      }
    }
    else
    {
      clientPID = 0;
      if (a3)
        goto LABEL_5;
    }
    v10 = 0;
LABEL_6:
    if (clientPID == v10)
    {
      if (self)
      {
        stillImageColorInfoForFramesOriginatingFromVideoStream = self->_stillImageColorInfoForFramesOriginatingFromVideoStream;
        if (a3)
        {
LABEL_9:
          v12 = (NSDictionary *)*((_QWORD *)a3 + 12);
          goto LABEL_10;
        }
      }
      else
      {
        stillImageColorInfoForFramesOriginatingFromVideoStream = 0;
        if (a3)
          goto LABEL_9;
      }
      v12 = 0;
LABEL_10:
      if (stillImageColorInfoForFramesOriginatingFromVideoStream == v12)
        goto LABEL_15;
      if (self)
      {
        v13 = self->_stillImageColorInfoForFramesOriginatingFromVideoStream;
        if (a3)
        {
LABEL_13:
          v14 = *((_QWORD *)a3 + 12);
          goto LABEL_14;
        }
      }
      else
      {
        v13 = 0;
        if (a3)
          goto LABEL_13;
      }
      v14 = 0;
LABEL_14:
      v15 = -[NSDictionary isEqual:](v13, "isEqual:", v14, v19, v20, v5, v6);
      if (!v15)
        return v15;
LABEL_15:
      if (self)
      {
        if (!a3)
        {
          if (self->_stillImageISPChromaNoiseReductionEnabled
            || self->_stereoFusionSupported
            || self->_isIrisSupported
            || self->_hdrSupported)
          {
            goto LABEL_21;
          }
          v17 = 0;
          gnrHDRSupported = self->_gnrHDRSupported;
          goto LABEL_26;
        }
        if (self->_stillImageISPChromaNoiseReductionEnabled != (*((_BYTE *)a3 + 104) != 0)
          || self->_stereoFusionSupported != (*((_BYTE *)a3 + 105) != 0)
          || self->_isIrisSupported != (*((_BYTE *)a3 + 106) != 0)
          || self->_hdrSupported != (*((_BYTE *)a3 + 107) != 0))
        {
          goto LABEL_21;
        }
        gnrHDRSupported = self->_gnrHDRSupported;
      }
      else
      {
        if (!a3)
        {
          gnrHDRSupported = 0;
          v17 = 0;
          goto LABEL_26;
        }
        if (*((_BYTE *)a3 + 104))
          goto LABEL_21;
        if (*((_BYTE *)a3 + 105))
          goto LABEL_21;
        if (*((_BYTE *)a3 + 106))
          goto LABEL_21;
        gnrHDRSupported = *((_BYTE *)a3 + 107);
        if (gnrHDRSupported)
          goto LABEL_21;
      }
      v17 = *((_BYTE *)a3 + 108) != 0;
LABEL_26:
      LOBYTE(v15) = gnrHDRSupported ^ v17 ^ 1;
      return v15;
    }
LABEL_21:
    LOBYTE(v15) = 0;
    return v15;
  }
  LOBYTE(v15) = 1;
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (uint64_t)setClientPID:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 88) = a2;
  return result;
}

- (void)setStillImageColorInfoForFramesOriginatingFromVideoStream:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic(a1, newValue, newValue, 96);
}

- (uint64_t)setStillImageISPChromaNoiseReductionEnabled:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 104) = a2;
  return result;
}

- (uint64_t)setStereoFusionSupported:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 105) = a2;
  return result;
}

- (uint64_t)setIsIrisSupported:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 106) = a2;
  return result;
}

- (uint64_t)setHdrSupported:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 107) = a2;
  return result;
}

- (uint64_t)setGnrHDRSupported:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 108) = a2;
  return result;
}

@end
