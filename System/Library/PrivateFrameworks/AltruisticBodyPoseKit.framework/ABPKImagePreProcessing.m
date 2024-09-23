@implementation ABPKImagePreProcessing

- (ABPKImagePreProcessing)initWithPreProcessingParams:(id)a3
{
  id v4;
  ABPKImagePreProcessing *v5;
  uint64_t v6;
  ABPKPaddingParams *paddingParameters;
  NSObject *v8;
  CFTypeRef *p_vtPixelTransferSession;
  NSObject *v10;
  ABPKImagePreProcessing *v11;
  uint8_t v13[16];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ABPKImagePreProcessing;
  v5 = -[ABPKImagePreProcessing init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "paddingParams");
    v6 = objc_claimAutoreleasedReturnValue();
    paddingParameters = v5->_paddingParameters;
    v5->_paddingParameters = (ABPKPaddingParams *)v6;

    if (!v5->_paddingParameters)
    {
      __ABPKLogSharedInstance();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_210836000, v8, OS_LOG_TYPE_ERROR, " Padding parameters not specified. Cannot run image pre-processing pipeline ", v13, 2u);
      }

    }
    p_vtPixelTransferSession = (CFTypeRef *)&v5->_vtPixelTransferSession;
    if (!VTPixelTransferSessionCreate(0, &v5->_vtPixelTransferSession))
    {
      v11 = v5;
      goto LABEL_14;
    }
    if (*p_vtPixelTransferSession)
      CFRelease(*p_vtPixelTransferSession);
    *p_vtPixelTransferSession = 0;
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_ERROR, " Unable to create pixel transfer session for image downscaling ", v13, 2u);
    }

  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *vtPixelTransferSession;
  objc_super v4;

  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(vtPixelTransferSession);
    CFRelease(self->_vtPixelTransferSession);
    self->_vtPixelTransferSession = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ABPKImagePreProcessing;
  -[ABPKImagePreProcessing dealloc](&v4, sel_dealloc);
}

- (int)preprocessData:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  signed int PixelFormatType;
  NSObject *v9;
  uint8_t v10[16];

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType > 875704437)
  {
    if (PixelFormatType != 875704438 && PixelFormatType != 1111970369)
    {
      if (PixelFormatType == 1278226488)
        return -[ABPKImagePreProcessing preprocessGrayscaleImage:outputBuffer:](self, "preprocessGrayscaleImage:outputBuffer:", a3, a4);
      goto LABEL_9;
    }
    return -[ABPKImagePreProcessing preprocessColorImage:outputBuffer:](self, "preprocessColorImage:outputBuffer:", a3, a4);
  }
  if (PixelFormatType == 32 || PixelFormatType == 875704422)
    return -[ABPKImagePreProcessing preprocessColorImage:outputBuffer:](self, "preprocessColorImage:outputBuffer:", a3, a4);
LABEL_9:
  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_ERROR, " Input image is of invalid format ", v10, 2u);
  }

  return -6660;
}

- (int)preprocessGrayscaleImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  NSObject *v7;
  const __CFDictionary *v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  const __CFAllocator *v12;
  NSObject *v13;
  OSStatus v14;
  NSObject *v15;
  NSObject *v17;
  size_t Width;
  size_t Height;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t v24[8];
  uint8_t buf[8];
  CVPixelBufferRef v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v26 = a4;
  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " \t\t Preprocessing GrayscaleImage ", buf, 2u);
  }

  v27 = *MEMORY[0x24BDC5668];
  v28[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  self->_startScale = CFAbsoluteTimeGetCurrent();
  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_DEBUG, " \t\t Scaling image ", buf, 2u);
  }

  -[ABPKImagePreProcessing _startScaleSignpost](self, "_startScaleSignpost");
  *(_QWORD *)buf = 0;
  v10 = -[ABPKPaddingParams width](self->_paddingParameters, "width");
  v11 = -[ABPKPaddingParams height](self->_paddingParameters, "height");
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, v11, 0x4C303038u, v8, (CVPixelBufferRef *)buf))
  {
    __ABPKLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_ERROR, " Could not create scaledImage buffer ", v24, 2u);
    }

    goto LABEL_9;
  }
  v14 = VTPixelTransferSessionTransferImage(self->_vtPixelTransferSession, a3, *(CVPixelBufferRef *)buf);
  -[ABPKImagePreProcessing _endScaleSignpost](self, "_endScaleSignpost");
  if (!v14)
  {
    self->_timeScale = CFAbsoluteTimeGetCurrent() - self->_startScale;
    self->_startPadding = CFAbsoluteTimeGetCurrent();
    __ABPKLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_210836000, v17, OS_LOG_TYPE_DEBUG, " \t\t Padding image ", v24, 2u);
    }

    -[ABPKImagePreProcessing _startPaddingSignpost](self, "_startPaddingSignpost");
    *(_QWORD *)v24 = 0;
    Width = CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    if (CVPixelBufferCreate(v12, Width, Height, 0x4C303038u, v8, (CVPixelBufferRef *)v24))
    {
      __ABPKLogSharedInstance();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        v21 = " Could not create scaledImage buffer ";
LABEL_28:
        _os_log_impl(&dword_210836000, v20, OS_LOG_TYPE_ERROR, v21, v23, 2u);
      }
    }
    else
    {
      if (!padImage(*(__CVBuffer **)buf, (CVPixelBufferRef *)v24, -[ABPKPaddingParams offsetHeight](self->_paddingParameters, "offsetHeight"), -[ABPKPaddingParams offsetWidth](self->_paddingParameters, "offsetWidth")))
      {
        -[ABPKImagePreProcessing _endPaddingSignpost](self, "_endPaddingSignpost");
        self->_timePadding = CFAbsoluteTimeGetCurrent() - self->_startPadding;
        __ABPKLogSharedInstance();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_210836000, v22, OS_LOG_TYPE_DEBUG, " Convert Format GrayScale To ARGB_BGRA ", v23, 2u);
        }

        self->_startConvertGrayScaleToBGRA = CFAbsoluteTimeGetCurrent();
        -[ABPKImagePreProcessing _startGrayToBGRASignpost](self, "_startGrayToBGRASignpost");
        if (!convertFormatGrayScaleToARGB_BGRA(*(__CVBuffer **)v24, &v26))
        {
          -[ABPKImagePreProcessing _endGrayToBGRASignpost](self, "_endGrayToBGRASignpost");
          self->_timeConvertGrayScaleToBGRA = CFAbsoluteTimeGetCurrent() - self->_startConvertGrayScaleToBGRA;
          CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
          CVPixelBufferRelease(*(CVPixelBufferRef *)v24);
          v14 = 0;
          goto LABEL_14;
        }
        __ABPKLogSharedInstance();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        *(_WORD *)v23 = 0;
        v21 = " Could not convert Grayscale to BGRA buffer ";
        goto LABEL_28;
      }
      __ABPKLogSharedInstance();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        v21 = " Could not pad buffer ";
        goto LABEL_28;
      }
    }
LABEL_29:

LABEL_9:
    v14 = -6660;
    goto LABEL_14;
  }
  __ABPKLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_ERROR, " Could not scale Image ", v24, 2u);
  }

LABEL_14:
  return v14;
}

- (int)preprocessColorImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  size_t Width;
  size_t Height;
  signed int PixelFormatType;
  signed int v9;
  int v10;
  _BOOL4 v11;
  const __CFDictionary *v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  const char *v17;
  OSStatus v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v24;
  uint8_t v25[16];
  uint8_t buf[8];
  uint8_t v27[8];
  CVPixelBufferRef v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v28 = a4;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v9 = PixelFormatType;
  if (PixelFormatType > 875704437)
  {
    if (PixelFormatType == 875704438)
      goto LABEL_7;
    v10 = 1111970369;
  }
  else
  {
    if (PixelFormatType == 32)
      goto LABEL_7;
    v10 = 875704422;
  }
  if (PixelFormatType == v10)
  {
LABEL_7:
    v11 = PixelFormatType == 1111970369;
    *(_QWORD *)v27 = 0;
    v29 = *MEMORY[0x24BDC5668];
    v30[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      *(_QWORD *)v27 = a3;
      goto LABEL_9;
    }
    if ((v9 & 0xFFFFFFEF) == 0x34323066)
    {
      __ABPKLogSharedInstance();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v19, OS_LOG_TYPE_DEBUG, " \t\t Converting image format: YCbCr --> BGRA ", buf, 2u);
      }

      self->_startConvertYCbCrToBGRA = CFAbsoluteTimeGetCurrent();
      -[ABPKImagePreProcessing _startYCbCrToARGBSignpost](self, "_startYCbCrToARGBSignpost");
    }
    else
    {
      __ABPKLogSharedInstance();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v21, OS_LOG_TYPE_DEBUG, " \t\t Converting image format: ARGB --> BGRA ", buf, 2u);
      }

      self->_startConvertARGBToBGRA = CFAbsoluteTimeGetCurrent();
      -[ABPKImagePreProcessing _startARGBToBGRASignpost](self, "_startARGBToBGRASignpost");
    }
    if (CVPixelBufferCreate(0, Width, Height, 0x42475241u, v12, (CVPixelBufferRef *)v27))
    {
      __ABPKLogSharedInstance();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v22, OS_LOG_TYPE_ERROR, " Could not create imageBGRA buffer ", buf, 2u);
      }
LABEL_30:

      v18 = -6660;
      goto LABEL_31;
    }
    if ((v9 & 0xFFFFFFEF) == 0x34323066)
    {
      if (convertFormatYCbCrToBGRA(a3, (CVPixelBufferRef *)v27))
      {
        __ABPKLogSharedInstance();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v22, OS_LOG_TYPE_ERROR, " Could not convert Format YCbCr to BGRA. ", buf, 2u);
        }
        goto LABEL_30;
      }
      -[ABPKImagePreProcessing _endYCbCrToARGBSignpost](self, "_endYCbCrToARGBSignpost");
      self->_timeConvertYCbCrToBGRA = CFAbsoluteTimeGetCurrent() - self->_startConvertYCbCrToBGRA;
    }
    else
    {
      if (changeChannelsARGB(a3, (CVPixelBufferRef *)v27))
      {
        __ABPKLogSharedInstance();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v22, OS_LOG_TYPE_ERROR, " changeChannelsARGB failed. ", buf, 2u);
        }
        goto LABEL_30;
      }
      -[ABPKImagePreProcessing _endARGBToBGRASignpost](self, "_endARGBToBGRASignpost");
      self->_timeConvertARGBToBGRA = CFAbsoluteTimeGetCurrent() - self->_startConvertARGBToBGRA;
    }
LABEL_9:
    self->_startScale = CFAbsoluteTimeGetCurrent();
    __ABPKLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " \t\t Scaling image ", buf, 2u);
    }

    -[ABPKImagePreProcessing _startScaleSignpost](self, "_startScaleSignpost");
    *(_QWORD *)buf = 0;
    v14 = -[ABPKPaddingParams width](self->_paddingParameters, "width");
    v15 = -[ABPKPaddingParams height](self->_paddingParameters, "height");
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v14, v15, 0x42475241u, v12, (CVPixelBufferRef *)buf))
    {
      __ABPKLogSharedInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v25 = 0;
        v17 = " Could not create scaledImage buffer ";
LABEL_14:
        _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_ERROR, v17, v25, 2u);
      }
    }
    else
    {
      v18 = VTPixelTransferSessionTransferImage(self->_vtPixelTransferSession, *(CVPixelBufferRef *)v27, *(CVPixelBufferRef *)buf);
      -[ABPKImagePreProcessing _endScaleSignpost](self, "_endScaleSignpost");
      if (v18)
      {
        __ABPKLogSharedInstance();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_ERROR, " Could not scale Image ", v25, 2u);
        }
        goto LABEL_16;
      }
      self->_timeScale = CFAbsoluteTimeGetCurrent() - self->_startScale;
      self->_startPadding = CFAbsoluteTimeGetCurrent();
      __ABPKLogSharedInstance();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_210836000, v24, OS_LOG_TYPE_DEBUG, " \t\t Padding image ", v25, 2u);
      }

      -[ABPKImagePreProcessing _startPaddingSignpost](self, "_startPaddingSignpost");
      if (!padImage(*(__CVBuffer **)buf, &v28, -[ABPKPaddingParams offsetHeight](self->_paddingParameters, "offsetHeight"), -[ABPKPaddingParams offsetWidth](self->_paddingParameters, "offsetWidth")))
      {
        -[ABPKImagePreProcessing _endPaddingSignpost](self, "_endPaddingSignpost");
        self->_timePadding = CFAbsoluteTimeGetCurrent() - self->_startPadding;
        CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
        if (v9 != 1111970369)
          CVPixelBufferRelease(*(CVPixelBufferRef *)v27);
        v18 = 0;
        goto LABEL_31;
      }
      __ABPKLogSharedInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v25 = 0;
        v17 = " Could not pad buffer ";
        goto LABEL_14;
      }
    }
    v18 = -6660;
LABEL_16:

LABEL_31:
    return v18;
  }
  __ABPKLogSharedInstance();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_210836000, v20, OS_LOG_TYPE_ERROR, " Input image is of invalid format ", v27, 2u);
  }

  return -6660;
}

- (void)logProfilingDetails
{
  NSObject *v3;
  double timeConvertYCbCrToBGRA;
  NSObject *v5;
  double timeConvertARGBToBGRA;
  NSObject *v7;
  double timeConvertGrayScaleToBGRA;
  NSObject *v9;
  double timeScale;
  NSObject *v11;
  double timePadding;
  NSObject *v13;
  double v14;
  int v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    timeConvertYCbCrToBGRA = self->_timeConvertYCbCrToBGRA;
    v15 = 134217984;
    v16 = timeConvertYCbCrToBGRA;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ConvertYCbCrToBGRA: %f ", (uint8_t *)&v15, 0xCu);
  }

  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    timeConvertARGBToBGRA = self->_timeConvertARGBToBGRA;
    v15 = 134217984;
    v16 = timeConvertARGBToBGRA;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " ConvertARGBToBGRA: %f ", (uint8_t *)&v15, 0xCu);
  }

  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    timeConvertGrayScaleToBGRA = self->_timeConvertGrayScaleToBGRA;
    v15 = 134217984;
    v16 = timeConvertGrayScaleToBGRA;
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " ConvertGrayScaleToBGRA: %f ", (uint8_t *)&v15, 0xCu);
  }

  __ABPKLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    timeScale = self->_timeScale;
    v15 = 134217984;
    v16 = timeScale;
    _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_DEBUG, " Scale: %f ", (uint8_t *)&v15, 0xCu);
  }

  __ABPKLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    timePadding = self->_timePadding;
    v15 = 134217984;
    v16 = timePadding;
    _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEBUG, " Padding: %f ", (uint8_t *)&v15, 0xCu);
  }

  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = self->_timeConvertARGBToBGRA
        + self->_timeConvertYCbCrToBGRA
        + self->_timeConvertGrayScaleToBGRA
        + self->_timeScale
        + self->_timePadding;
    v15 = 134217984;
    v16 = v14;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " Total: %f ", (uint8_t *)&v15, 0xCu);
  }

}

- (void)_startScaleSignpost
{
  kdebug_trace();
}

- (void)_endScaleSignpost
{
  kdebug_trace();
}

- (void)_startARGBToRGBASignpost
{
  kdebug_trace();
}

- (void)_endARGBToRGBASignpost
{
  kdebug_trace();
}

- (void)_startPaddingSignpost
{
  kdebug_trace();
}

- (void)_endPaddingSignpost
{
  kdebug_trace();
}

- (void)_startYCbCrToARGBSignpost
{
  kdebug_trace();
}

- (void)_endYCbCrToARGBSignpost
{
  kdebug_trace();
}

- (void)_startARGBToBGRASignpost
{
  kdebug_trace();
}

- (void)_endARGBToBGRASignpost
{
  kdebug_trace();
}

- (void)_startGrayToBGRASignpost
{
  kdebug_trace();
}

- (void)_endGrayToBGRASignpost
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingParameters, 0);
}

@end
