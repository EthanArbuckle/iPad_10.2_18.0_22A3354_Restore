@implementation FigCaptureSourceCompanionFormat

- (FigCaptureSourceCompanionFormat)initWithCompanionFormatDictionary:(id)a3
{
  FigCaptureSourceCompanionFormat *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  CGFloat v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  float v23;
  objc_super v25;

  if (a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)FigCaptureSourceCompanionFormat;
    v4 = -[FigCaptureSourceCompanionFormat init](&v25, sel_init);
    if (v4)
    {
      v4->_formatIndex = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Index")), "intValue");
      v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Width")), "intValue");
      v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Height")), "intValue");
      v4->_fesDimensions.width = v5;
      v4->_fesDimensions.height = v6;
      v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("FESInputCropWidth")), "intValue");
      v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("FESInputCropHeight")), "intValue");
      v4->_fesInputCropDimensions.width = v7;
      v4->_fesInputCropDimensions.height = v8;
      v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CropWidthForFES")), "intValue");
      v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CropHeightForFES")), "intValue");
      v4->_outputCropDimensionsWhenFesIsEnabled.width = v9;
      v4->_outputCropDimensionsWhenFesIsEnabled.height = v10;
      v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07ED0]), "intValue");
      v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D07EC8]), "intValue");
      v4->_sensorDimensions.width = v11;
      v4->_sensorDimensions.height = v12;
      v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SensorCropWidth")), "intValue");
      v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SensorCropHeight")), "intValue");
      v4->_sensorCropDimensions.width = v13;
      v4->_sensorCropDimensions.height = v14;
      v15 = (double)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SensorCenterOffsetX")), "intValue");
      v16 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SensorCenterOffsetY")), "intValue");
      v4->_sensorCenterOffset.x = v15;
      v4->_sensorCenterOffset.y = (double)v16;
      v17 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PostGDCCropWidth")), "intValue");
      v18 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PostGDCCropHeight")), "intValue");
      v4->_postGDCCropDimensions.width = v17;
      v4->_postGDCCropDimensions.height = v18;
      v4->_sifrEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SIFREnabled")), "BOOLValue");
      v19 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HighQualitySensorWidth")), "intValue");
      v20 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HighQualitySensorHeight")), "intValue");
      v4->_highQualitySensorDimensions.width = v19;
      v4->_highQualitySensorDimensions.height = v20;
      v21 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCorrectedNativeWidth")), "intValue");
      v22 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCorrectedNativeHeight")), "intValue");
      v4->_geometricDistortionCorrectedNativeDimensions.width = v21;
      v4->_geometricDistortionCorrectedNativeDimensions.height = v22;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StereoVideoAEMaxGain")), "floatValue");
      v4->_stereoVideoAEMaxGain = v23;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectedNativeDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_geometricDistortionCorrectedNativeDimensions, 8, 1, 0);
  return dest;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FigCaptureSourceCompanionFormat;
  -[FigCaptureSourceCompanionFormat dealloc](&v2, sel_dealloc);
}

- (BOOL)sifrEnabled
{
  return self->_sifrEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorCropDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_sensorCropDimensions, 8, 1, 0);
  return dest;
}

- (CGPoint)sensorCenterOffset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_sensorCenterOffset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)postGDCCropDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_postGDCCropDimensions, 8, 1, 0);
  return dest;
}

- ($2825F4736939C4A6D3AD43837233062D)outputCropDimensionsWhenFesIsEnabled
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_outputCropDimensionsWhenFesIsEnabled, 8, 1, 0);
  return dest;
}

- (int)formatIndex
{
  return self->_formatIndex;
}

- ($2825F4736939C4A6D3AD43837233062D)fesInputCropDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_fesInputCropDimensions, 8, 1, 0);
  return dest;
}

- ($2825F4736939C4A6D3AD43837233062D)fesDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_fesDimensions, 8, 1, 0);
  return dest;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> [%d]:%dx%d SIFR:%d FESInputCropDim:%dx%d outputCropDimForFES:%dx%d sensorCropDim:%dx%d HighQualitySensorDim:%dx%d"), NSStringFromClass(v4), self, self->_formatIndex, self->_fesDimensions.width, self->_fesDimensions.height, self->_sifrEnabled, self->_fesInputCropDimensions.width, self->_fesInputCropDimensions.height, self->_outputCropDimensionsWhenFesIsEnabled.width, self->_outputCropDimensionsWhenFesIsEnabled.height, self->_sensorCropDimensions.width, self->_sensorCropDimensions.height, self->_highQualitySensorDimensions.width, self->_highQualitySensorDimensions.height);
}

- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_sensorDimensions, 8, 1, 0);
  return dest;
}

- ($2825F4736939C4A6D3AD43837233062D)highQualitySensorDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_highQualitySensorDimensions, 8, 1, 0);
  return dest;
}

- (float)stereoVideoAEMaxGain
{
  return self->_stereoVideoAEMaxGain;
}

@end
