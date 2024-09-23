@implementation FigCaptureSourceDepthDataFormat

- (id)copyWithNewPixelFormat:(unsigned int)a3
{
  if (self->super._formatDictionary)
    return -[FigCaptureSourceFormat initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:]([FigCaptureSourceDepthDataFormat alloc], "initWithFigCaptureStreamFormatDictionary:pixelFormatOverride:", self->super._formatDictionary, *(_QWORD *)&a3);
  else
    return 0;
}

- (unsigned)mediaType
{
  return 1685091432;
}

- (BOOL)RGBIRStereoFusionSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("RGBIRStereoFusionSupported")), "BOOLValue");
}

- (BOOL)isStillImageOnlyDepthData
{
  BOOL v3;

  v3 = FigCaptureVideoDimensionsAreValid(-[FigCaptureSourceFormat dimensions](self, "dimensions"));
  return objc_msgSend(-[FigCaptureSourceDepthDataFormat highResStillImageDimensions](self, "highResStillImageDimensions"), "count")&& !v3;
}

- (id)highResStillImageDimensions
{
  unsigned int v3;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HighResStillWidth")), "intValue");
  v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("HighResStillHeight")), "intValue");
  v6[0] = -[FigCaptureSourceFormatDimensions initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:]([FigCaptureSourceFormatDimensions alloc], "initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:", v3 | (unint64_t)(v4 << 32), v3 | (unint64_t)(v4 << 32), 0, 0, 0);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
}

- (float)fieldOfView
{
  float result;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E0D08820]), "floatValue");
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)depthEngineOutputDimensions
{
  unsigned int v3;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DepthEngineOutputWidth")), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("DepthEngineOutputHeight")), "intValue") << 32));
}

- (BOOL)gainMapSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", CFSTR("GainMapSupported")), "BOOLValue");
}

@end
