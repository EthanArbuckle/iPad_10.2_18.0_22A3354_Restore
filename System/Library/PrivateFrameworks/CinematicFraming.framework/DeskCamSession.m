@implementation DeskCamSession

- (DeskCamSession)initWithOutputDimensions:(id)a3 portType:(id)a4 deviceModelName:(id)a5
{
  id v9;
  id v10;
  char *v11;
  void *v12;
  DeskCamSession *v13;
  DeskCamSessionOptions *v14;
  void *v15;
  DeskCamRenderingSession *v16;
  void *v17;
  void *v18;
  objc_super v25;

  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)DeskCamSession;
  v11 = -[DeskCamSession init](&v25, sel_init);
  if (!v11)
  {
    v13 = 0;
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CinematicFraming"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_10;
  v13 = 0;
  if (a3.var0 && a3.var1)
  {
    if (!isDeskCamAllowedCamera(v9))
    {
LABEL_11:
      v13 = 0;
      goto LABEL_12;
    }
    *($2825F4736939C4A6D3AD43837233062D *)(v11 + 28) = a3;
    objc_storeStrong((id *)v11 + 5, a4);
    objc_storeStrong((id *)v11 + 6, a5);
    v11[164] = objc_msgSend(*((id *)v11 + 5), "isEqualToString:", *MEMORY[0x1E0D05A50]);
    *((_DWORD *)v11 + 14) = objc_msgSend(v11, "_deviceType");
    v14 = -[DeskCamSessionOptions initWithDeviceType:]([DeskCamSessionOptions alloc], "initWithDeviceType:", *((unsigned int *)v11 + 14));
    v15 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v14;

    if (*((_QWORD *)v11 + 2))
    {
      v16 = -[DeskCamRenderingSession initWithOutputDimensions:portType:deviceType:isFrontFacingCamera:]([DeskCamRenderingSession alloc], "initWithOutputDimensions:portType:deviceType:isFrontFacingCamera:", *(_QWORD *)(v11 + 28), *((_QWORD *)v11 + 5), *((unsigned int *)v11 + 14), v11[164]);
      v17 = (void *)*((_QWORD *)v11 + 1);
      *((_QWORD *)v11 + 1) = v16;

      v18 = (void *)*((_QWORD *)v11 + 1);
      if (v18)
      {
        objc_msgSend(v18, "setOptions:", *((_QWORD *)v11 + 2));
        *((_DWORD *)v11 + 6) = 0;
        __asm { FMOV            V0.2S, #-1.0 }
        *((_QWORD *)v11 + 19) = _D0;
        v11[144] = 1;
        v13 = v11;
        goto LABEL_12;
      }
    }
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_11;
  }
LABEL_12:

  return v13;
}

- (int)_deviceType
{
  return 1;
}

- (DeskCamSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  -[DeskCamRenderingSession setOptions:](self->_renderingSession, "setOptions:", a3);
}

- (int)processPixelBuffer:(__CVBuffer *)a3 withMetadata:(id)a4 outputPixelBuffer:(__CVBuffer *)a5
{
  id v8;
  DeskCamRenderingSession *renderingSession;
  void *v10;
  float32x4_t v11;
  uint32x4_t v12;
  double v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a4;
  renderingSession = self->_renderingSession;
  objc_msgSend(v8, "cameraCalibrationDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DeskCamRenderingSession registerCameraCalibrationDictionary:](renderingSession, "registerCameraCalibrationDictionary:", v10);

  -[DeskCamRenderingSession registerCameraOrientation:](self->_renderingSession, "registerCameraOrientation:", objc_msgSend(v8, "cameraOrientation"));
  objc_msgSend(v8, "gravity");
  v12 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v11), (int8x16_t)vcgezq_f32(v11)));
  v12.i32[3] = v12.i32[2];
  if ((vmaxvq_u32(v12) & 0x80000000) != 0)
    *(_QWORD *)&v13 = vdupq_n_s32(0x7FC00000u).u64[0];
  else
    objc_msgSend(v8, "gravity");
  -[DeskCamRenderingSession registerGravity:](self->_renderingSession, "registerGravity:", v13);
  if (self->_outputType)
  {
    -[DeskCamRenderingSession registerOutputType:](self->_renderingSession, "registerOutputType:");
    v14 = -[DeskCamRenderingSession processBuffer:outputPixelBuffer:](self->_renderingSession, "processBuffer:outputPixelBuffer:", a3, a5);
    if (v14)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      -[DeskCamRenderingSession trapezoid](self->_renderingSession, "trapezoid");
      *(_QWORD *)&self->_anon_40[4] = v15;
      *(_QWORD *)&self->_anon_40[12] = v16;
      *(_QWORD *)&self->_anon_40[20] = v17;
      *(_QWORD *)&self->_anon_40[28] = v18;
      -[DeskCamRenderingSession transformMatrix](self->_renderingSession, "transformMatrix");
      *(_DWORD *)&self->_anon_60[12] = v19;
      *(_QWORD *)&self->_anon_60[4] = v20;
      *(_DWORD *)&self->_anon_60[28] = v21;
      *(_QWORD *)&self->_anon_60[20] = v22;
      *(_DWORD *)&self->_anon_60[44] = v23;
      *(_QWORD *)&self->_anon_60[36] = v24;
      self->_focusPoint[3] = -[DeskCamRenderingSession transformIsValid](self->_renderingSession, "transformIsValid");
      -[DeskCamRenderingSession focusPoint](self->_renderingSession, "focusPoint");
      *(_QWORD *)&self->_exifOrientation = v25;
      LODWORD(self[1].super.isa) = -[DeskCamRenderingSession exifOrientation](self->_renderingSession, "exifOrientation");
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = -1;
  }

  return v14;
}

- (int)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(int)a3
{
  self->_outputType = a3;
}

- (double)trapezoid
{
  return *(double *)(a1 + 64);
}

- (__n128)transformMatrix
{
  return a1[6];
}

- (BOOL)transformIsValid
{
  return self->_focusPoint[3];
}

- (double)focusPoint
{
  return *(double *)(a1 + 152);
}

- (unsigned)exifOrientation
{
  return self[1].super.isa;
}

- (BOOL)isFrontFacingCamera
{
  return BYTE4(self[1].super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModelName, 0);
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_renderingSession, 0);
}

@end
