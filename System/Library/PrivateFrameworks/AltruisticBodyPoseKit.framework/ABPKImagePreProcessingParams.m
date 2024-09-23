@implementation ABPKImagePreProcessingParams

- (ABPKImagePreProcessingParams)initWithType:(int)a3 inputResolution:(CGSize)a4 outputResolution:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  ABPKImagePreProcessingParams *v10;
  ABPKPaddingParams *v11;
  void *scalingParams;
  ABPKCropParams *v13;
  ABPKDirectScalingParams *v14;
  objc_super v16;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v16.receiver = self;
  v16.super_class = (Class)ABPKImagePreProcessingParams;
  v10 = -[ABPKImagePreProcessingParams init](&v16, sel_init);
  if (v10)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        v14 = -[ABPKDirectScalingParams initWithInputResolution:andOutputResolution:]([ABPKDirectScalingParams alloc], "initWithInputResolution:andOutputResolution:", v8, v7, width, height);
        scalingParams = v10->_scalingParams;
        v10->_scalingParams = v14;
      }
      else
      {
        if (a3 != 2)
        {
LABEL_9:
          v10->_type = a3;
          v10->_inputResolution.width = v8;
          v10->_inputResolution.height = v7;
          v10->_outputResolution.width = width;
          v10->_outputResolution.height = height;
          return v10;
        }
        v11 = -[ABPKPaddingParams initWithInputResolution:andOutputResolution:]([ABPKPaddingParams alloc], "initWithInputResolution:andOutputResolution:", v8, v7, width, height);
        scalingParams = v10->_paddingParams;
        v10->_paddingParams = v11;
      }
    }
    else
    {
      v13 = -[ABPKCropParams initWithInputResolution:andOutputResolution:]([ABPKCropParams alloc], "initWithInputResolution:andOutputResolution:", v8, v7, width, height);
      scalingParams = v10->_cropParams;
      v10->_cropParams = v13;
    }

    goto LABEL_9;
  }
  return v10;
}

- (void)printData
{
  NSObject *v3;
  CGFloat width;
  CGFloat height;
  NSObject *v6;
  CGFloat v7;
  CGFloat v8;
  int type;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  float v13;
  NSObject *v14;
  unsigned int v15;
  NSObject *v16;
  unsigned int v17;
  NSObject *v18;
  unsigned int v19;
  NSObject *v20;
  unsigned int v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v25;
  double v26;
  __int16 v27;
  CGFloat v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    width = self->_inputResolution.width;
    height = self->_inputResolution.height;
    v25 = 134218240;
    v26 = width;
    v27 = 2048;
    v28 = height;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " Input Resolution: (%f,%f) ", (uint8_t *)&v25, 0x16u);
  }

  __ABPKLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self->_outputResolution.width;
    v8 = self->_outputResolution.height;
    v25 = 134218240;
    v26 = v7;
    v27 = 2048;
    v28 = v8;
    _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " Output Resolution: (%f,%f) ", (uint8_t *)&v25, 0x16u);
  }

  type = self->_type;
  if (!type)
  {
    __ABPKLogSharedInstance();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_28;
    LOWORD(v25) = 0;
    v22 = "  ";
LABEL_26:
    v23 = v20;
    v24 = 2;
    goto LABEL_27;
  }
  if (type == 1)
  {
    __ABPKLogSharedInstance();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_28;
    LOWORD(v25) = 0;
    v22 = "  ";
    goto LABEL_26;
  }
  if (type != 2)
    return;
  __ABPKLogSharedInstance();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_DEBUG, " Type: ScalingPadding ", (uint8_t *)&v25, 2u);
  }

  __ABPKLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEBUG, " Padding Parameters: ", (uint8_t *)&v25, 2u);
  }

  __ABPKLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[ABPKPaddingParams scale](self->_paddingParams, "scale");
    v25 = 134217984;
    v26 = v13;
    _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " /t scale:        %f ", (uint8_t *)&v25, 0xCu);
  }

  __ABPKLogSharedInstance();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = -[ABPKPaddingParams height](self->_paddingParams, "height");
    v25 = 67109120;
    LODWORD(v26) = v15;
    _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_DEBUG, " /t height:       %u ", (uint8_t *)&v25, 8u);
  }

  __ABPKLogSharedInstance();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = -[ABPKPaddingParams width](self->_paddingParams, "width");
    v25 = 67109120;
    LODWORD(v26) = v17;
    _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_DEBUG, " /t width:        %u ", (uint8_t *)&v25, 8u);
  }

  __ABPKLogSharedInstance();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = -[ABPKPaddingParams offsetHeight](self->_paddingParams, "offsetHeight");
    v25 = 67109120;
    LODWORD(v26) = v19;
    _os_log_impl(&dword_210836000, v18, OS_LOG_TYPE_DEBUG, " /t offsetHeight: %u ", (uint8_t *)&v25, 8u);
  }

  __ABPKLogSharedInstance();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = -[ABPKPaddingParams offsetWidth](self->_paddingParams, "offsetWidth");
    v25 = 67109120;
    LODWORD(v26) = v21;
    v22 = " /t offsetWidth:  %u ";
    v23 = v20;
    v24 = 8;
LABEL_27:
    _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v25, v24);
  }
LABEL_28:

}

+ (double)convert2DPoint:(uint64_t)a3 toInputSpaceWithParams:(void *)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  unsigned int v33;
  NSObject *v34;
  unsigned int v36;
  unsigned int v37;
  float v38;
  uint8_t v39[2];
  uint8_t buf[16];
  __int16 v41;
  __int16 v42;

  v5 = a4;
  if (objc_msgSend(v5, "type") != 2)
  {
    if (objc_msgSend(v5, "type"))
    {
      if (objc_msgSend(v5, "type") == 1)
      {
        objc_msgSend(v5, "scalingParams");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v5, "scalingParams");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "widthScale");
          v37 = v22;

          objc_msgSend(v5, "scalingParams");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "heightScale");
          __asm { FMOV            V2.2D, #1.0 }
          _D9 = vcvt_f32_f64(vmulq_f64(vdivq_f64(_Q2, vcvtq_f64_f32((float32x2_t)__PAIR64__(v23, v37))), vcvtq_f64_f32(a1)));
          goto LABEL_12;
        }
        __ABPKLogSharedInstance();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_210836000, v34, OS_LOG_TYPE_ERROR, " Scaling Parameters not specified ", buf, 2u);
        }

      }
      __ABPKLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v39 = 0;
        v26 = " Invalid Image Pre-Processing type specified ";
        v27 = v39;
        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(v5, "cropParams");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v5, "cropParams");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (float)objc_msgSend(v29, "width");
        objc_msgSend(v5, "outputResolution");
        *(float *)&v31 = v30 / v31;
        v38 = *(float *)&v31;

        objc_msgSend(v5, "cropParams");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "offsetWidth");

        objc_msgSend(v5, "cropParams");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _D9 = vmla_n_f32(vcvt_f32_u32((uint32x2_t)__PAIR64__(objc_msgSend(v11, "offsetHeight"), v33)), a1, v38);
        goto LABEL_12;
      }
      __ABPKLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v41 = 0;
        v26 = " Crop Parameters not specified ";
        v27 = (uint8_t *)&v41;
        goto LABEL_20;
      }
    }
LABEL_21:

    __asm { FMOV            V9.2S, #-1.0 }
    goto LABEL_22;
  }
  objc_msgSend(v5, "paddingParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    __ABPKLogSharedInstance();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v42 = 0;
      v26 = " Padding Parameters not specified ";
      v27 = (uint8_t *)&v42;
LABEL_20:
      _os_log_impl(&dword_210836000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  objc_msgSend(v5, "paddingParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "offsetWidth");
  objc_msgSend(v5, "paddingParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v36 = v10;

  objc_msgSend(v5, "paddingParams");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "offsetHeight");
  objc_msgSend(v5, "paddingParams");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  __asm { FMOV            V2.2D, #1.0 }
  _D9 = vcvt_f32_f64(vmulq_f64(vdivq_f64(_Q2, vcvtq_f64_f32((float32x2_t)__PAIR64__(v13, v36))), vcvtq_f64_f32(vsub_f32(a1, vcvt_f32_u32((uint32x2_t)__PAIR64__(v9, v8))))));

LABEL_12:
LABEL_22:

  return *(double *)&_D9;
}

- (ABPKCropParams)cropParams
{
  return self->_cropParams;
}

- (ABPKPaddingParams)paddingParams
{
  return self->_paddingParams;
}

- (ABPKDirectScalingParams)scalingParams
{
  return self->_scalingParams;
}

- (int)type
{
  return self->_type;
}

- (CGSize)inputResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_inputResolution.width;
  height = self->_inputResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)outputResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_outputResolution.width;
  height = self->_outputResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalingParams, 0);
  objc_storeStrong((id *)&self->_paddingParams, 0);
  objc_storeStrong((id *)&self->_cropParams, 0);
}

@end
