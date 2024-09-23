@implementation BWInferenceCompressedVideoRequirement

- (BOOL)isSatisfiedByRequirement:(id)a3
{
  unsigned int v5;
  objc_super v7;

  v5 = -[BWInferenceVideoFormat pixelFormat](-[BWInferenceVideoRequirement videoFormat](self, "videoFormat"), "pixelFormat");
  if (v5 != objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "pixelFormat"))
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceCompressedVideoRequirement;
  return -[BWInferenceVideoRequirement isSatisfiedByRequirement:](&v7, sel_isSatisfiedByRequirement_, a3);
}

- (unint64_t)satisfactionHash
{
  return -[BWInferenceVideoRequirement satisfactionHash](self->_uncompressedRequirement, "satisfactionHash");
}

+ (id)newRequirementWithUncompressedRequirement:(id)a3 supportedCompressionType:(int)a4 supportedLossyCompressionLevel:(int)a5
{
  uint64_t v8;
  signed int v9;
  uint64_t v10;
  id result;
  uint64_t v12;
  BWInferenceVideoFormatRequirements *v13;
  BWInferenceVideoFormatRequirements *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "underlyingVideoFormat"), "pixelFormat");
  if ((objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "height") & 1) != 0)
    v9 = 0;
  else
    v9 = a5;
  v10 = FigCaptureCompressedPixelFormatForPixelFormat(v8, a4, v9);
  if ((_DWORD)v8 == (_DWORD)v10)
    return 0;
  v12 = v10;
  v13 = -[BWInferenceVideoFormatRequirements initWithFormat:]([BWInferenceVideoFormatRequirements alloc], "initWithFormat:", objc_msgSend(a3, "videoFormat"));
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1));
  v14 = v13;
  result = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1));
  if (result)
    return -[BWInferenceCompressedVideoRequirement initWithUncompressedRequirement:compressedVideoFormat:]([BWInferenceCompressedVideoRequirement alloc], a3, (uint64_t)result);
  return result;
}

- (_QWORD)initWithUncompressedRequirement:(uint64_t)a3 compressedVideoFormat:
{
  _QWORD *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)BWInferenceCompressedVideoRequirement;
  v4 = objc_msgSendSuper2(&v6, sel_initWithAttachedMediaKey_videoFormat_, objc_msgSend(a2, "attachedMediaKey"), a3);
  if (v4)
    v4[6] = a2;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVideoRequirement:", self);
  v4[6] = -[BWInferenceVideoRequirement copy](self->_uncompressedRequirement, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceCompressedVideoRequirement;
  -[BWInferenceVideoRequirement dealloc](&v3, sel_dealloc);
}

- (BWInferenceVideoRequirement)uncompressedRequirement
{
  return self->_uncompressedRequirement;
}

@end
