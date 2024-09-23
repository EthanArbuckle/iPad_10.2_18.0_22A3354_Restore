@implementation BWPreviewStitcherNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  BWFormatRequirements *v7;
  void *v8;
  void *v9;
  int v10;
  char IsFullRange;
  char IsTenBit;
  $470D365275581EF16070F5A11344F73E *p_outputDimensions;
  uint64_t height;
  _QWORD v15[4];
  char v16;
  char v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = -[BWNodeOutput formatRequirements](self->super._output, "formatRequirements");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A002F0);
  v9 = v8;
  if (!LOBYTE(self->_lastInputPTS.epoch))
    objc_msgSend(v8, "insertObject:atIndex:", &unk_1E49F8670, 0);
  v10 = -[BWVideoFormat pixelFormat](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "pixelFormat");
  IsFullRange = FigCapturePixelFormatIsFullRange(v10);
  IsTenBit = FigCapturePixelFormatIsTenBit(v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__BWPreviewStitcherNode_didSelectFormat_forInput___block_invoke;
  v15[3] = &__block_descriptor_34_e35_B24__0__NSNumber_8__NSDictionary_16l;
  v16 = IsFullRange;
  v17 = IsTenBit;
  objc_msgSend(v9, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v15));
  -[BWFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", v9);
  p_outputDimensions = &self->_outputDimensions;
  if (FigCaptureVideoDimensionsAreValid((uint64_t)*p_outputDimensions))
  {
    -[BWFormatRequirements setWidth:](v7, "setWidth:", p_outputDimensions->width);
    height = p_outputDimensions->height;
  }
  else
  {
    -[BWFormatRequirements setWidth:](v7, "setWidth:", objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "width"));
    height = objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "height");
  }
  -[BWFormatRequirements setHeight:](v7, "setHeight:", height);
  v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
  -[BWFormatRequirements setSupportedColorSpaceProperties:](v7, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1));
}

BOOL __50__BWPreviewStitcherNode_didSelectFormat_forInput___block_invoke(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "intValue");
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange(v3)
      && *(unsigned __int8 *)(a1 + 33) == FigCapturePixelFormatIsTenBit(v3);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  objc_super v9;

  if (LOBYTE(self->_lastInputPTS.epoch))
    -[BWPreviewStitcherDelegate previewStitcher:overCaptureStatusDidChange:](self->_delegate, "previewStitcher:overCaptureStatusDidChange:", self, HIDWORD(self->_trueVideoCaptureAdditionalZoomFactor));
  v9.receiver = self;
  v9.super_class = (Class)BWPreviewStitcherNode;
  -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v9, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setPreviewTapRegistered:(BOOL)a3
{
  self->_zoomPIPOverlayEnabled = a3;
}

- (void)_updateAndGetWideRegionShifts:(double *)a3 teleShift:(int)a4 wideIsSuperWide:(int)a5 forComputedShift:(double)a6 registrationEnabled:(double)a7 currentFrameRate:(float)a8
{
  int v9;
  double *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int *v19;
  uint64_t i;
  int v21;
  int *v22;
  int *v23;
  int v24;
  int *v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v29;
  float v30;
  int v31;
  void *v32;
  float v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  char v39;
  int v40;
  int *v41;
  uint64_t v42;
  uint64_t j;
  int v44;
  uint64_t k;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  double v58;
  double v59;
  const double *v60;
  float64x2_t v61;
  int v62;
  _BOOL4 v63;
  char v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  float v69;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  float64x2_t v74;
  double v75;
  float64x2_t v76;
  int v77;
  void *v78;
  double *v79;
  unsigned int v80;
  double v81;
  double v82;
  uint64_t v83;
  unsigned int v84;
  uint64_t v85;
  int *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id *v91;
  void *v92;
  _BOOL4 v93;
  double v94;
  double v95;
  float v96;
  uint64_t v97;
  void *v98;
  id *v99;
  void *v100;
  float v101;
  BWRamp *v102;
  BWRamp *v103;
  BWRamp *v104;
  BWRamp *v105;
  int v106;
  double v107;
  double v108;
  uint64_t v109;
  double v110;
  double v111;
  double v112;
  double v113;
  uint64_t v114;
  void *v115;
  id *v116;
  void *v117;
  float v118;
  double v119;
  uint64_t v120;
  void *v121;
  id *v122;
  void *v123;
  double v124;
  uint64_t v125;
  void *v126;
  float v127;
  double v128;
  double v129;
  double *v130;
  __int128 v131;
  _BOOL4 v134;
  int v135;
  int v136;
  int v137;
  int v138;
  double v139;
  double v140;
  double v141;
  double v142;
  int v143;
  uint64_t v144;
  __int128 v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v9 = a5;
  v14 = (double *)MEMORY[0x1E0C9D538];
  v147 = *MEMORY[0x1E0C9D538];
  v148 = v147;
  v145 = v147;
  v149 = v147;
  if (a5)
  {
    v15 = *(_BYTE *)(a1 + 425) == 0;
    if (!*(_BYTE *)(a1 + 400))
    {
      if (*(unsigned __int8 *)(a1 + 426) | *(unsigned __int8 *)(a1 + 425) || *(_BYTE *)(a1 + 1449))
      {
        objc_msgSend(*(id *)(a1 + 416), "waitForRegistrationToComplete");
        *(_BYTE *)(a1 + 425) = 1;
        if (*MEMORY[0x1E0CA1FC0] == 1)
          kdebug_trace();
      }
      else
      {
        v15 = 1;
      }
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend((id)a1, "displaysWidestCameraOnly");
  v17 = *(unsigned __int8 *)(a1 + 818);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 428));
  v144 = a1;
  if (v9)
  {
    if (*(_BYTE *)(a1 + 425))
    {
      v9 = 1;
    }
    else
    {
      v18 = *(_DWORD *)(a1 + 396);
      if (!v18)
        goto LABEL_16;
      v19 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
      if (a4)
        v19 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
      if (*(_DWORD *)(a1 + *v19 + 148) >= v18)
      {
        v9 = 1;
        *(_BYTE *)(a1 + 425) = 1;
        if (*MEMORY[0x1E0CA1FC0] == 1)
          kdebug_trace();
      }
      else
      {
LABEL_16:
        v9 = 0;
      }
    }
  }
  v137 = *(unsigned __int8 *)(a1 + 400);
  v138 = a4;
  if (v137 != v9)
  {
    *(_BYTE *)(a1 + 400) = v9;
    for (i = 32; i != 200; i += 56)
    {
      *(_BYTE *)(a1 + 600 + i) = 1;
      *(_BYTE *)(a1 + 432 + i) = 1;
    }
  }
  if (!v16)
  {
    if (!*(_BYTE *)(a1 + 818))
    {
      v29 = *(void **)(a1 + 864);
      if (v29)
      {
        if ((objc_msgSend(v29, "isRamping") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 864), "currentValue");
          if (v30 == 0.0)
          {
            *(_BYTE *)(a1 + 818) = 1;

            *(_QWORD *)(a1 + 864) = 0;
            *(_BYTE *)(a1 + 904) = 0;
          }
        }
      }
    }
    if (!*(_BYTE *)(a1 + 818))
      goto LABEL_38;
    if (!v9)
    {
      v31 = 0;
      goto LABEL_73;
    }
    v24 = *(_DWORD *)(a1 + 396);
    if (v24)
    {
      v25 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
      if (a4)
        v25 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
      v24 = *(_DWORD *)(a1 + *v25 + 148) >= v24;
      if ((a4 & 1) != 0)
      {
LABEL_36:
        v26 = a1;
        v27 = *(unsigned __int8 *)(a1 + 1388);
        if (!*(_BYTE *)(a1 + 1388))
        {
          v28 = *(unsigned __int8 *)(a1 + 1360);
LABEL_68:
          if (*(_BYTE *)(v26 + 1306) || *(float *)(a1 + 824) != *(float *)(a1 + 164))
          {
            v31 = v28 | v27;
            if (v24)
              goto LABEL_73;
          }
          else
          {
            v31 = 0;
            if ((v24 & 1) != 0)
            {
LABEL_73:
              *(_BYTE *)(a1 + 818) = 0;
              if (!*(_QWORD *)(a1 + 864))
              {
                v63 = v31 != 0;
                v64 = a4;
                if (!v31)
                  v64 = 0;
                *(_BYTE *)(a1 + 904) = v64;
                *(_QWORD *)(a1 + 864) = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("TeleOpacityRamp"));
                v65 = -[BWPreviewStitcherNode _cameraDisplayTransitionFrameCountForCameraFallbackChange:currentFrameRate:]((void *)a1, v63, a8);
                LODWORD(v66) = 1065017672;
                LODWORD(v67) = 0;
                LODWORD(v68) = 1.0;
                objc_msgSend(*(id *)(a1 + 864), "startRampFrom:to:iterations:shape:exponentialConvergenceFraction:", v65, 2, v67, v68, v66);
                v39 = v63;
                if (*(_BYTE *)(a1 + 964))
                {
                  v69 = *(float *)(a1 + 824);
                  v39 = v63;
                  if (v69 != 0.0)
                  {
                    v39 = v63;
                    if ((float)(v69 / *(float *)(a1 + 828)) > 1.1)
                      v39 = 1;
                  }
                }
                v134 = v63;
                goto LABEL_140;
              }
            }
          }
          v134 = v31 != 0;
          goto LABEL_75;
        }
LABEL_49:
        v27 = 0;
        v28 = 0;
        goto LABEL_68;
      }
    }
    else if ((a4 & 1) != 0)
    {
      goto LABEL_36;
    }
    v26 = a1;
    if (!*(_BYTE *)(a1 + 1304))
    {
      v28 = 0;
      v27 = *(_BYTE *)(a1 + 1305) != 0;
      goto LABEL_68;
    }
    goto LABEL_49;
  }
  if (*(_BYTE *)(a1 + 818))
  {
LABEL_38:
    v134 = 0;
LABEL_75:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 428));
    v40 = 0;
    goto LABEL_76;
  }
  if (!v9)
  {
    v134 = 0;
    goto LABEL_56;
  }
  v21 = *(_DWORD *)(a1 + 396);
  if (v21)
  {
    v22 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
    if (a4)
      v22 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
    v21 = *(_DWORD *)(a1 + *v22 + 148) >= v21;
    if ((a4 & 1) != 0)
    {
LABEL_27:
      if (*(_BYTE *)(a1 + 1388))
      {
        v23 = &OBJC_IVAR___BWPreviewStitcherNode__superWideFallbackShiftRampTargetValueIsSuperWide;
        goto LABEL_53;
      }
      goto LABEL_55;
    }
  }
  else if ((a4 & 1) != 0)
  {
    goto LABEL_27;
  }
  if (*(_BYTE *)(a1 + 1304))
  {
    v23 = &OBJC_IVAR___BWPreviewStitcherNode__wideFallbackShiftRampTargetValueIsWide;
LABEL_53:
    v134 = *(unsigned __int8 *)(a1 + *v23) == 0;
    if (!v21)
      goto LABEL_75;
    goto LABEL_56;
  }
LABEL_55:
  v134 = 0;
  if (!v21)
    goto LABEL_75;
LABEL_56:
  if (*(_BYTE *)(a1 + 152))
  {
    if (*(_BYTE *)(a1 + 1440))
    {
      if (*(_BYTE *)(a1 + 904))
      {
        v32 = *(void **)(a1 + 864);
        if (v32)
        {
          if ((objc_msgSend(v32, "isRamping") & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 864), "currentValue");
            if (v33 == 1.0)
            {

              *(_QWORD *)(a1 + 864) = 0;
              *(_BYTE *)(a1 + 904) = 0;
            }
          }
        }
      }
    }
  }
  v34 = *(void **)(a1 + 864);
  if (v34)
  {
    if ((objc_msgSend(v34, "isRamping") & 1) == 0)
    {
      *(_BYTE *)(a1 + 818) = 1;

      *(_QWORD *)(a1 + 864) = 0;
      *(_BYTE *)(a1 + 904) = 0;
    }
    goto LABEL_75;
  }
  *(_BYTE *)(a1 + 904) = v134 & a4;
  *(_QWORD *)(a1 + 864) = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("TeleOpacityRamp"));
  v35 = -[BWPreviewStitcherNode _cameraDisplayTransitionFrameCountForCameraFallbackChange:currentFrameRate:]((void *)a1, v134, a8);
  LODWORD(v36) = 1065017672;
  LODWORD(v37) = 1.0;
  LODWORD(v38) = 0;
  objc_msgSend(*(id *)(a1 + 864), "startRampFrom:to:iterations:shape:exponentialConvergenceFraction:", v35, 2, v37, v38, v36);
  v39 = *(_BYTE *)(a1 + 964);
LABEL_140:
  *(_BYTE *)(a1 + 1004) = v39;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 428));
  objc_msgSend(*(id *)(a1 + 416), "waitForRegistrationToComplete");
  v40 = 1;
LABEL_76:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 428));
  v143 = v9 ^ 1;
  v41 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
  if (a4)
    v41 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
  v42 = a1 + *v41;
  if (v40)
  {
    for (j = 32; j != 200; j += 56)
      *(_BYTE *)(v42 + j) = 1;
  }
  v141 = v14[1];
  v142 = *v14;
  v136 = v40;
  if ((v16 & 1) != 0)
  {
    if (!v9)
    {
      v143 = 1;
      v139 = v14[1];
      v140 = *v14;
LABEL_108:
      v48 = a1;
      goto LABEL_109;
    }
  }
  else if (!a4 || !v9 || *(_BYTE *)(a1 + 1129))
  {
    v139 = v14[1];
    v140 = *v14;
    goto LABEL_91;
  }
  if (*(_BYTE *)(v42 + 32) || (v139 = v14[1], v140 = *v14, *(_BYTE *)(v42 + 88)))
  {
    v139 = *(double *)(v42 + 136);
    v140 = *(double *)(v42 + 128);
    v143 = 1;
  }
LABEL_91:
  if (v137 == v9)
    v44 = v40;
  else
    v44 = 1;
  if (!v9 || !v44)
    goto LABEL_108;
  for (k = 0; k != 168; k += 56)
  {
    if (!v16 || k == 112 || *(_BYTE *)(v144 + 1389))
    {
      v46 = v42 + k;

      *(_QWORD *)(v46 + 40) = 0;
      *(_QWORD *)(v46 + 48) = 0;
      v47 = v143 ^ 1;
      if (k == 112)
        v47 = 1;
      if ((v47 & 1) != 0)
      {
        *(_OWORD *)v46 = *(_OWORD *)(v46 + 16);
      }
      else
      {
        *(double *)v46 = v140;
        *(double *)(v46 + 8) = v139;
      }
      *(_BYTE *)(v42 + k + 32) = 0;
    }
  }
  v48 = v144;
  *(_BYTE *)(v144 + 1389) = 0;
LABEL_109:
  v135 = v9;
  if ((v40 & 1) != 0 || (a4 | v16) == 1 && v17 == v16)
  {
    v49 = v144;
    if (*(unsigned __int8 *)(v48 + 1305) != *(unsigned __int8 *)(v144 + 1304))
    {
      if (*(_BYTE *)(v144 + 1304))
      {
        *(_OWORD *)(v144 + 1288) = *(_OWORD *)(v144 + 560);
        *(float64x2_t *)(v144 + 1288) = vmulq_n_f64(*(float64x2_t *)(v144 + 1288), dbl_1A32A2990[*(_BYTE *)(v144 + 1306) == 0]);
      }
      v50 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v144, 90, a8);
      if (*(_BYTE *)(v144 + 1307))
        v50 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v144, 55, a8);
      v51 = v50;
      v52 = 0;
      if (!*(_BYTE *)(v144 + 1304))
      {
        objc_msgSend(*(id *)(v144 + 1280), "currentValue");
        v52 = v53;
      }
      if (objc_msgSend(*(id *)(v144 + 1280), "isRamping"))
      {
        objc_msgSend(*(id *)(v144 + 1280), "currentValue");
        v52 = LODWORD(v54.f64[0]);
        if (*(_BYTE *)(v144 + 1304) || *(float *)v54.f64 == 0.0)
        {
          v49 = v144;
        }
        else
        {
          v49 = v144;
          v60 = &dbl_1A32A2990[*(_BYTE *)(v144 + 1306) == 0];
          v55 = *(float64x2_t *)(v144 + 1288);
          v61 = vld1q_dup_f64(v60);
          v57 = *(float64x2_t *)(v144 + 560);
          v56 = vsubq_f64(v57, vdivq_f64(v55, v61));
          v54 = vsubq_f64(v55, vmulq_n_f64(v56, (1.0 - *(float *)v54.f64) / *(float *)v54.f64));
          *(float64x2_t *)(v144 + 1288) = v54;
        }
      }
      if (*(_BYTE *)(v49 + 408))
      {
        if (*(_BYTE *)(v49 + 1307))
          *(float *)v56.f64 = 49.0;
        else
          *(float *)v56.f64 = 20.0;
        LODWORD(v58) = 981668463;
        if (*(_BYTE *)(v49 + 1304))
          LODWORD(v55.f64[0]) = 1.0;
        else
          LODWORD(v55.f64[0]) = 0;
        LODWORD(v57.f64[0]) = 24.0;
        LODWORD(v54.f64[0]) = v52;
        *(float *)&v59 = a8;
        objc_msgSend(*(id *)(v49 + 1280), "startSpringRampFrom:to:withTension:friction:snapFraction:frameRate:", v54.f64[0], v55.f64[0], v56.f64[0], v57.f64[0], v58, v59);
      }
      else
      {
        LODWORD(v56.f64[0]) = 1065269330;
        if (*(_BYTE *)(v49 + 1304))
          LODWORD(v55.f64[0]) = 1.0;
        else
          LODWORD(v55.f64[0]) = 0;
        LODWORD(v54.f64[0]) = v52;
        objc_msgSend(*(id *)(v49 + 1280), "startRampFrom:to:iterations:shape:exponentialConvergenceFraction:", v51, 2, v54.f64[0], v55.f64[0], v56.f64[0]);
      }
      v49 = v144;
      if (*(_BYTE *)(v144 + 1306))
        objc_msgSend(*(id *)(v144 + 1280), "updateRampForNextIteration");
      *(_BYTE *)(v144 + 1305) = *(_BYTE *)(v144 + 1304);
    }
    v62 = *(unsigned __int8 *)(v49 + 1360);
    if ((v40 & 1) != 0)
      goto LABEL_151;
  }
  else
  {
    v62 = *(unsigned __int8 *)(v144 + 1360);
  }
  if ((a4 & (v16 ^ 1) & 1) != 0 || v17 != v16)
    goto LABEL_175;
LABEL_151:
  if (v62 != *(unsigned __int8 *)(v144 + 1388))
  {
    if (*(_BYTE *)(v144 + 1388))
    {
      if (*(_BYTE *)(v144 + 1464))
      {
        *(_OWORD *)(v144 + 1368) = v145;
      }
      else
      {
        *(_DWORD *)(v144 + 1384) = 1050253722;
        if (((*(_BYTE *)(v144 + 1391) == 0) & ~v15) == 0)
          *(_DWORD *)(v144 + 1384) = 0;
        *(_OWORD *)(v144 + 1368) = *(_OWORD *)(v144 + 728);
        *(float64x2_t *)(v144 + 1368) = vmulq_n_f64(*(float64x2_t *)(v144 + 1368), 1.0 - *(float *)(v144 + 1384));
      }
    }
    v70 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v144, 90, a8);
    v71 = *(unsigned __int8 *)(v144 + 1388);
    if (*(_BYTE *)(v144 + 1388) && !*(_BYTE *)(v144 + 1464) && *(float *)(v144 + 1384) == 0.0)
    {
      v72 = 0;
      v70 = 1;
    }
    else
    {
      if (*(_BYTE *)(v144 + 1391))
      {
        v70 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v144, 55, a8);
        v71 = *(unsigned __int8 *)(v144 + 1388);
      }
      v72 = 0;
      if (!v71)
      {
        objc_msgSend(*(id *)(v144 + 1352), "currentValue");
        v72 = v73;
      }
    }
    if ((objc_msgSend(*(id *)(v144 + 1352), "isRamping") & 1) != 0)
    {
      objc_msgSend(*(id *)(v144 + 1352), "currentValue");
      v72 = LODWORD(v74.f64[0]);
      v77 = *(unsigned __int8 *)(v144 + 1388);
      if (!*(_BYTE *)(v144 + 1388) && *(float *)v74.f64 != 0.0)
      {
        v75 = (1.0 - *(float *)v74.f64) / *(float *)v74.f64;
        v76 = *(float64x2_t *)(v144 + 1368);
        v74 = vsubq_f64(v76, vmulq_n_f64(vsubq_f64(*(float64x2_t *)(v144 + 728), vdivq_f64(v76, (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 - *(float *)(v144 + 1384)), 0))), v75));
        *(float64x2_t *)(v144 + 1368) = v74;
        goto LABEL_173;
      }
    }
    else
    {
      v77 = *(unsigned __int8 *)(v144 + 1388);
    }
    if (v77)
    {
      v78 = *(void **)(v144 + 1352);
      LODWORD(v76.f64[0]) = 1065269330;
      LODWORD(v75) = 1.0;
LABEL_174:
      LODWORD(v74.f64[0]) = v72;
      objc_msgSend(v78, "startRampFrom:to:iterations:shape:exponentialConvergenceFraction:", v70, 2, v74.f64[0], v75, v76.f64[0]);
      *(_BYTE *)(v144 + 1360) = *(_BYTE *)(v144 + 1388);
      goto LABEL_175;
    }
LABEL_173:
    v78 = *(void **)(v144 + 1352);
    LODWORD(v76.f64[0]) = 1065269330;
    LODWORD(v75) = 0;
    goto LABEL_174;
  }
LABEL_175:
  v79 = (double *)&v147 + 1;
  v80 = -3;
  v82 = v141;
  v81 = v142;
  v83 = v144;
  do
  {
    v84 = v80 + 3;
    if (v80 < 0xFFFFFFFD)
      v85 = v80;
    else
      v85 = v84;
    v86 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
    if (v80 >= 0xFFFFFFFD)
      v86 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
    v87 = v83 + *v86;
    v88 = v87 + 56 * v85;
    if (*(_BYTE *)(v88 + 32))
    {
      v146 = v80 + 3;
      v89 = v87 + 56 * v85;
      v92 = *(void **)(v89 + 40);
      v91 = (id *)(v89 + 40);
      v90 = v92;
      v93 = v85 != 2;
      if ((v143 & v93) != 0)
        v94 = v140;
      else
        v94 = *((double *)v91 - 3);
      if ((v143 & v93) != 0)
        v95 = v139;
      else
        v95 = *((double *)v91 - 2);
      *(_BYTE *)(v88 + 32) = 0;
      if (v90)
      {
        objc_msgSend(v90, "updateRampForNextIteration");
        *(double *)v88 = v96;
      }
      v97 = v87 + 56 * v85;
      v100 = *(void **)(v97 + 48);
      v99 = (id *)(v97 + 48);
      v98 = v100;
      if (v100)
      {
        objc_msgSend(v98, "updateRampForNextIteration");
        *(double *)(v88 + 8) = v101;
      }
      v102 = [BWRamp alloc];
      v103 = -[BWRamp initWithName:](v102, "initWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ShiftCorrectionRampX[%d]"), v146));
      v104 = [BWRamp alloc];
      v105 = -[BWRamp initWithName:](v104, "initWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ShiftCorrectionRampY[%d]"), v146));
      v106 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v144, *(unsigned int *)(v144 + 772), a8);
      HIDWORD(v108) = 1073427251;
      if (*(_DWORD *)(v144 + 1124) == 3)
        v106 = (int)((double)v106 * 1.7);
      if (v136)
        v106 = -[BWPreviewStitcherNode _cameraDisplayTransitionFrameCountForCameraFallbackChange:currentFrameRate:]((void *)v144, v134, a8);
      if (v137 == v135)
        v109 = v106;
      else
        v109 = 6;
      v110 = *(double *)v88;
      *(float *)&v110 = *(double *)v88;
      *(float *)&v108 = v94;
      LODWORD(v107) = 1065017672;
      -[BWRamp startRampFrom:to:iterations:shape:exponentialConvergenceFraction:](v103, "startRampFrom:to:iterations:shape:exponentialConvergenceFraction:", v109, 2, v110, v108, v107);
      v111 = *(double *)(v88 + 8);
      *(float *)&v111 = v111;
      *(float *)&v112 = v95;
      LODWORD(v113) = 1065017672;
      -[BWRamp startRampFrom:to:iterations:shape:exponentialConvergenceFraction:](v105, "startRampFrom:to:iterations:shape:exponentialConvergenceFraction:", v109, 2, v111, v112, v113);

      *v91 = v103;
      *v99 = v105;
      *(double *)v88 = v94;
      *(double *)(v88 + 8) = v95;
      v83 = v144;
      v84 = v80 + 3;
      a4 = v138;
    }
    if (v84 >= 3 && a4)
    {
      a6 = *(double *)(v83 + 288);
      a7 = *(double *)(v83 + 296);
    }
    v114 = v87 + 56 * v85;
    v117 = *(void **)(v114 + 40);
    v116 = (id *)(v114 + 40);
    v115 = v117;
    if (!v117)
    {
      v125 = v87 + 56 * v85;
      v126 = *(void **)(v125 + 48);
      v122 = (id *)(v125 + 48);
      v121 = v126;
      v119 = *(double *)v88;
      if (!v126)
      {
        v124 = *(double *)(v88 + 8);
        goto LABEL_213;
      }
LABEL_207:
      objc_msgSend(v121, "updateRampForNextIteration");
      v124 = v127;
      goto LABEL_208;
    }
    objc_msgSend(v115, "updateRampForNextIteration");
    v119 = v118;
    v120 = v87 + 56 * v85;
    v123 = *(void **)(v120 + 48);
    v122 = (id *)(v120 + 48);
    v121 = v123;
    if (v123)
      goto LABEL_207;
    v124 = *(double *)(v88 + 8);
LABEL_208:
    if ((objc_msgSend(*v116, "isRamping") & 1) == 0)
    {

      *v116 = 0;
    }
    if ((objc_msgSend(*v122, "isRamping") & 1) == 0)
    {

      *v122 = 0;
    }
LABEL_213:
    v128 = a7 + v124;
    v129 = a6 + v119;
    if (a4)
    {
      if (v84 > 2)
      {
        if (v80 == 2)
        {
          v82 = a7 + v124;
          v81 = a6 + v119;
        }
      }
      else
      {
        *(v79 - 1) = v129;
        *v79 = v128;
      }
    }
    else
    {
      v82 = v141;
      v81 = v142;
      if (v84 >= 3)
      {
        v130 = (double *)(&v147 + v85);
        *v130 = v129;
        v130[1] = v128;
        v82 = v141;
        v81 = v142;
      }
    }
    v79 += 2;
    ++v80;
  }
  while (v80 != 3);
  *(_BYTE *)(v83 + 820) = -[BWPreviewStitcherNode _currentlyZoomingOrSwitchingCameras](v83);
  os_unfair_lock_unlock((os_unfair_lock_t)(v83 + 428));
  if (a2)
  {
    v131 = v148;
    *a2 = v147;
    a2[1] = v131;
    a2[2] = v149;
  }
  if (a3)
  {
    *a3 = v81;
    a3[1] = v82;
  }
}

- (BOOL)_currentlyZoomingOrSwitchingCameras
{
  unsigned __int8 *v1;

  if (result)
  {
    v1 = (unsigned __int8 *)result;
    return *(float *)(result + 824) != 0.0
        || (objc_msgSend(*(id *)(result + 864), "isRamping") & 1) != 0
        || v1[818] != objc_msgSend(v1, "displaysWidestCameraOnly");
  }
  return result;
}

- (BOOL)displaysWidestCameraOnly
{
  os_unfair_lock_s *p_configurationLock;
  _BOOL4 displaysWidestCameraOnly;

  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  displaysWidestCameraOnly = self->_displaysWidestCameraOnly;
  os_unfair_lock_unlock(p_configurationLock);
  return (displaysWidestCameraOnly || self->_currentZoomRequiresWiderCamera)
      && LOBYTE(self->_lastInputPTS.epoch)
      && !self->_displaysPrimaryCameraOnly;
}

- (uint64_t)_scale30FPSFrameCount:(float)a3 toFrameRate:
{
  if (!a1)
    return 0;
  if (a3 > 0.0 && *(_BYTE *)(a1 + 912))
    return FigCaptureRoundFloatToMultipleOf(1, (float)((float)(int)a2 * a3) / 30.0);
  return a2;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  _DWORD *v6;
  opaqueCMSampleBuffer *v7;
  const void *v8;
  const void *value;
  void *v10;
  NSObject *global_queue;
  int v12;
  uint64_t UpTimeNanoseconds;
  int v14;
  BOOL *v15;
  uint64_t v16;
  uint64_t v17;
  const void *AttachedMedia;
  int v19;
  CMAttachmentBearerRef v20;
  CMAttachmentBearerRef v21;
  char v22;
  double *v23;
  int epoch_low;
  double v25;
  double v26;
  const __CFString **v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  CFTypeRef v44;
  void *v45;
  _BOOL4 registrationEnabled;
  _BOOL4 v47;
  CMAttachmentBearerRef v48;
  int v49;
  char v50;
  void *v51;
  uint64_t v52;
  void *v53;
  __CVBuffer *ImageBuffer;
  unsigned int Width;
  unsigned int Height;
  double v57;
  double v58;
  double v59;
  double v60;
  float v61;
  double v62;
  uint64_t i;
  BWPreviewStitcherShiftCorrection *v64;
  BOOL v65;
  BOOL v66;
  BOOL v68;
  CFTypeRef v70;
  BOOL v71;
  int v72;
  int registrationFrameSkipCount;
  uint64_t lastRegisteredFrameCaptureID;
  uint64_t v75;
  _BOOL4 v76;
  CMAttachmentBearerRef v77;
  void *v78;
  float v79;
  float v80;
  const void *v81;
  _BOOL4 v82;
  BOOL v83;
  uint64_t v84;
  int v85;
  int v86;
  float v87;
  float v88;
  CMSampleBufferRef v89;
  CMSampleBufferRef v90;
  void *v91;
  void *v92;
  double x;
  CFDictionaryRef DictionaryRepresentation;
  opaqueCMSampleBuffer *v95;
  opaqueCMSampleBuffer *transitionReferenceSampleBuffer;
  int v97;
  int zoomPIPMinimumUIZoomFactor_low;
  opaqueCMSampleBuffer *v99;
  CFDictionaryRef v100;
  char v101;
  CGPoint origin;
  CGSize size;
  __int128 v104;
  CGSize v105;
  __CVBuffer *v106;
  CFDictionaryRef v107;
  CFDictionaryRef v108;
  float v109;
  int v110;
  uint64_t v111;
  char v112;
  int v113;
  _BOOL4 v114;
  float64x2_t v115;
  int v116;
  void *v117;
  opaqueCMSampleBuffer *v118;
  CFTypeRef v119;
  CGRect v120;
  CGPoint v121;
  CGRect v122;
  __int128 v123;
  CGSize v124;
  CGRect v125;
  float64x2_t v126;
  CMTime v127;
  CMTime rhs;
  _QWORD block[5];
  CMTime time2;
  CMTime v131;
  CMTime v132;
  CMAttachmentBearerRef target;
  CMAttachmentBearerRef cf;
  CMTime time;
  float64x2_t v136[3];
  uint64_t v137;
  CGRect v138;
  CGRect v139;

  v137 = *MEMORY[0x1E0C80C00];
  target = 0;
  cf = 0;
  if (self->_superMacroEdgeFeatheringBlurEnabled)
    -[BWPreviewRegistration waitForRegistrationToComplete](self->_registration, "waitForRegistrationToComplete", a3, a4);
  memset(&v132, 0, sizeof(v132));
  CMSampleBufferGetPresentationTimeStamp(&v132, a3);
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    BWGetOriginalPresentationTimeStampFromBuffer(a3, (uint64_t)&v131);
    time = v131;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  time = v132;
  time2 = *(CMTime *)&self->_lastSampleBuffer;
  if ((CMTimeCompare(&time, &time2) & 0x80000000) == 0)
  {
    if (LOBYTE(self->_lastInputPTS.epoch))
    {
      if (!BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame")))
      {
        v14 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("OverCaptureSlaveStreamStatus"), 0), "intValue");
        if (v14 == 4 || v14 == 1 && !self->_previewsWideBeforeSlaveStreamStarts)
        {
LABEL_61:
          if (*v6 == 1)
            kdebug_trace();
          return;
        }
      }
    }
    os_unfair_lock_lock(&self->_configurationLock);
    v7 = *(opaqueCMSampleBuffer **)&self->_featherEdgesForOpacityRamp;
    time.value = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata(a3, (CMSampleBufferRef *)&time);
    if (v7 == a3)
    {
      if (!time.value)
      {
        os_unfair_lock_unlock(&self->_configurationLock);
        v10 = 0;
        goto LABEL_32;
      }
      v10 = (void *)CFRetain((CFTypeRef)time.value);
    }
    else
    {
      v8 = *(const void **)&self->_featherEdgesForOpacityRamp;
      value = (const void *)time.value;
      *(_QWORD *)&self->_featherEdgesForOpacityRamp = time.value;
      if (value)
        CFRetain(value);
      if (v8)
        CFRelease(v8);
      *(CMTime *)&self->_lastSampleBuffer = v132;
      v10 = a3;
    }
    if (time.value)
      CFRelease((CFTypeRef)time.value);
    os_unfair_lock_unlock(&self->_configurationLock);
    if (v7 != a3)
    {
      v12 = BYTE1(self->_lastInputPTS.epoch);
      UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      if (v12)
      {
        if (UpTimeNanoseconds - *(_QWORD *)&self->_multiCameraStitchingEnabled <= 24000000)
          goto LABEL_61;
        BYTE1(self->_lastInputPTS.epoch) = 0;
        os_unfair_lock_lock(&self->_configurationLock);
        if (!BYTE3(self->_blackFilledBorderRectsBySurfaceID)
          && BYTE4(self->_narrowerCameraFoVFillsOverCapture.name)
          && *(double *)&self->_superWideSensorCenterOffsetEnabled == 0.0
          && !BYTE5(self->_narrowerCameraFoVFillsOverCapture.name))
        {
          BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) = 0;
        }
        os_unfair_lock_unlock(&self->_configurationLock);
LABEL_34:
        if ((v132.flags & 1) != 0)
        {
          v15 = &self->_havePreheatedCI + 4;
          if ((self->_firstFramePTS.timescale & 1) != 0)
          {
            if (!self->_havePreheatedCI)
            {
              memset(&time, 0, sizeof(time));
              time2 = v132;
              *(_OWORD *)&rhs.value = *(_OWORD *)v15;
              rhs.epoch = *(_QWORD *)&self->_firstFramePTS.flags;
              CMTimeSubtract(&time, &time2, &rhs);
              CMTimeMake(&v127, 750, 1000);
              time2 = time;
              if ((CMTimeCompare(&time2, &v127) & 0x80000000) == 0)
                -[BWPreviewStitcherNode _preheatCIRenderingAsync]((uint64_t)self);
            }
          }
          else
          {
            *(_OWORD *)v15 = *(_OWORD *)&v132.value;
            *(_QWORD *)&self->_firstFramePTS.flags = v132.epoch;
            -[BWPreviewStitcherDelegate previewStitcherReadyForPrimaryCaptureRectUpdates:](self->_delegate, "previewStitcherReadyForPrimaryCaptureRectUpdates:", self);
          }
        }
        if (LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor))
        {
          v16 = *(_QWORD *)&self->_thermalPressureIsCritical;
          v17 = mach_absolute_time();
          if (!v16)
          {
            *(_QWORD *)&self->_thermalPressureIsCritical = v17;
            goto LABEL_61;
          }
          if ((float)((float)(FigHostTimeToNanoseconds() / 1000) / 1000000.0) < 0.037)
            goto LABEL_61;
          LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor) = 0;
        }
        if (self->_zoomPIPUseNarrowerCamera
          && (AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v10, (uint64_t)CFSTR("Depth"))) != 0)
        {
          v119 = CFRetain(AttachedMedia);
        }
        else
        {
          v119 = 0;
        }
        v19 = *((unsigned __int8 *)&self->_zoomPIPUseNarrowerCamera + 1);
        if (LOBYTE(self->_lastInputPTS.epoch) || LOBYTE(self->_borderStretchScaleFactor))
        {
          BWOverCaptureSampleBufferUnpackAndRetain(v10, v19 == 0, &cf, &target, 0, 0);
          if (target)
            goto LABEL_51;
        }
        else if (v10)
        {
          v70 = CFRetain(v10);
          target = v70;
          if (v70)
          {
            if (!v19)
              BWSampleBufferRemoveAllAttachedMedia(v70);
LABEL_51:
            v117 = v10;
            if (*(&self->_zoomPIPUseNarrowerCamera + 1))
            {
              v20 = target;
              if (psn_attachedMediaKeysToPropagateForStyles_onceToken != -1)
                dispatch_once(&psn_attachedMediaKeysToPropagateForStyles_onceToken, &__block_literal_global_22);
              BWSampleBufferFilterWithAllowedAttachedMedia(v20, (void *)psn_attachedMediaKeysToPropagateForStyles_propagatingKeysForStyles);
              v21 = cf;
              if (psn_attachedMediaKeysToPropagateForStyles_onceToken != -1)
                dispatch_once(&psn_attachedMediaKeysToPropagateForStyles_onceToken, &__block_literal_global_22);
              BWSampleBufferFilterWithAllowedAttachedMedia(v21, (void *)psn_attachedMediaKeysToPropagateForStyles_propagatingKeysForStyles);
            }
            if (self->_zoomPIPUseNarrowerCamera)
            {
              if ((objc_msgSend((id)CMGetAttachment(target, CFSTR("DepthDisabled"), 0), "BOOLValue") & 1) != 0)
                v22 = 1;
              else
                v22 = objc_msgSend((id)CMGetAttachment(cf, CFSTR("DepthDisabled"), 0), "BOOLValue");
            }
            else
            {
              v22 = 0;
            }
            v23 = (double *)MEMORY[0x1E0C9D538];
            *(_QWORD *)&v120.origin.y = -[BWPreviewStitcherNode _copySampleBufferToAttachForZoomPIPFromWiderSampleBuffer:narrowerSampleBuffer:]((CMSampleBufferRef)self, cf, target);
            if (LOBYTE(self->_borderStretchScaleFactor))
            {
              epoch_low = LOBYTE(self->_lastInputPTS.epoch);
              if (LOBYTE(self->_lastInputPTS.epoch) || !cf)
              {
LABEL_70:
                v26 = *v23;
                v25 = v23[1];
                v27 = (const __CFString **)MEMORY[0x1E0D05CB0];
                v118 = v7;
                v112 = v22;
                if (epoch_low)
                {
                  v113 = -[BWPreviewStitcherNode _updateZoomStatusFromWideSampleBuffer:teleSampleBuffer:]((uint64_t)self, cf, target);
                  v28 = *v27;
                  if (cf)
                  {
                    v29 = (void *)CMGetAttachment(cf, v28, 0);
                    v30 = (void *)CMGetAttachment(target, v28, 0);
                    v31 = *MEMORY[0x1E0D06ED8];
                    v32 = (void *)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D06ED8]);
                    if (!v32)
                    {
                      v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                      objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, v31);
                    }
                    v33 = *MEMORY[0x1E0D06D00];
                    v34 = objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
                    if (v34)
                    {
                      v35 = v34;
                      if (!objc_msgSend(v32, "objectForKeyedSubscript:", v34))
                      {
                        v36 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                        v37 = v33;
                        objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B58]), *MEMORY[0x1E0D06B58]);
                        v38 = *MEMORY[0x1E0D06B60];
                        v39 = objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B60]);
                        v40 = v38;
                        v33 = v37;
                        objc_msgSend(v36, "setObject:forKeyedSubscript:", v39, v40);
                        objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, v35);
                      }
                      v41 = -[BWPreviewStitcherNode _computeBravoWideToTeleShiftFromWideSampleBuffer:teleSampleBuffer:]((uint64_t)self, cf, (uint64_t)target);
                      v43 = v42;
LABEL_83:
                      v116 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(cf, v28, 0), "objectForKeyedSubscript:", v33), "isEqualToString:", *MEMORY[0x1E0D05A28]);
                      registrationEnabled = self->_registrationEnabled;
                      v47 = self->_registrationEnabled;
                      if (cf)
                        v48 = cf;
                      else
                        v48 = target;
                      v49 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v48, v28, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06110]), "BOOLValue");
                      if (self->_deviceIsStationary != v49)
                      {
                        v50 = BYTE1(self->_superWideFallbackRecenteringStrength);
                        if (v50)
                          v50 = LOBYTE(self->_superWideFallbackRecenteringStrength) != 0;
                        self->_pendingRegistrationAfterDeviceBecomesStationary = v49 & (v50 ^ 1);
                        self->_deviceIsStationary = v49;
                      }
                      v51 = (void *)CMGetAttachment(target, v28, 0);
                      v52 = objc_msgSend(v51, "objectForKeyedSubscript:", v33);
                      v111 = v33;
                      if (LOBYTE(self->_lastInputPTS.epoch))
                      {
                        if (self->_excludeStaticComponentFromAlignmentShiftsEnabled)
                        {
                          v53 = (void *)v52;
                          time = v132;
                          time2 = *(CMTime *)(&self->_havePreheatedCI + 4);
                          if (!CMTimeCompare(&time, &time2))
                          {
                            if (objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0D05A18]))
                            {
                              ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
                              Width = CVPixelBufferGetWidth(ImageBuffer);
                              Height = CVPixelBufferGetHeight(ImageBuffer);
                              -[BWPreviewRegistration computeApproximateCorrectionForWiderCamera:narrowerCameraPortType:narrowerPixelBufferDimensions:widerToNarrowerCameraScale:](self->_registration, "computeApproximateCorrectionForWiderCamera:narrowerCameraPortType:narrowerPixelBufferDimensions:widerToNarrowerCameraScale:", target, *MEMORY[0x1E0D05A30], Width | ((unint64_t)Height << 32), (float)(self->_teleBaseZoomFactor/ (float)(self->_wideBaseZoomFactor * self->_wideNondisruptiveSwitchingScaleFactor)));
                              v58 = v57;
                              v60 = v59;
                              objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
                              if (v61 != 0.0)
                              {
                                v62 = v61;
                                v58 = v58 / v62;
                                v60 = v60 / v62;
                              }
                              os_unfair_lock_lock(&self->_shiftCorrectionsUpdateLock);
                              for (i = 0; i != 3; ++i)
                              {
                                v64 = &self->_wideToTeleShiftCorrections[i];
                                v64->updatedValue.x = v58;
                                v64->updatedValue.y = v60;
                                v64->valueIsUpdated = 1;
                              }
                              *(CGPoint *)&self->_wideFallbackShiftRamp = self->_wideToTeleShiftCorrections[2].updatedValue;
                              os_unfair_lock_unlock(&self->_shiftCorrectionsUpdateLock);
                            }
                          }
                        }
                      }
                      if (LOBYTE(self->_lastInputPTS.epoch))
                        v65 = !registrationEnabled;
                      else
                        v65 = 1;
                      if (!v65)
                      {
                        if (cf)
                          v66 = target == 0;
                        else
                          v66 = 1;
                        v47 = !v66 && registrationEnabled;
                      }
                      if (LOBYTE(self->_lastInputPTS.epoch))
                        v68 = !v47;
                      else
                        v68 = 1;
                      if (v68)
                        goto LABEL_186;
                      if (self->_lastRegistrationEnabled == v47 && v118 == a3)
                        goto LABEL_186;
                      if (((!-[BWPreviewStitcherNode _currentlyZoomingOrSwitchingCameras]((_BOOL8)self) | v113) & 1) != 0)
                      {
                        if (!cf)
                          goto LABEL_186;
                      }
                      else
                      {
                        if (self->_lastRegisteredFrameCaptureID)
                          v71 = 1;
                        else
                          v71 = cf == 0;
                        if (v71)
                          goto LABEL_186;
                      }
                      v72 = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), "intValue");
                      registrationFrameSkipCount = self->_registrationFrameSkipCount;
                      v110 = v72;
                      lastRegisteredFrameCaptureID = self->_lastRegisteredFrameCaptureID;
                      v75 = v72 - lastRegisteredFrameCaptureID;
                      if (v75 < 0)
                        v75 = lastRegisteredFrameCaptureID - v72;
                      if (v113)
                      {
                        registrationFrameSkipCount /= 4;
                      }
                      else if (HIDWORD(self->_trueVideoCaptureAdditionalZoomFactor) == 3)
                      {
                        registrationFrameSkipCount = (int)((double)registrationFrameSkipCount * 1.5);
                      }
                      if (v75 < registrationFrameSkipCount
                        && (!self->_registerFirstFrame || (_DWORD)lastRegisteredFrameCaptureID)
                        && !self->_pendingRegistrationAfterDeviceBecomesStationary)
                      {
                        goto LABEL_186;
                      }
                      if ((v116 & 1) != 0)
                      {
                        v114 = 0;
                        v76 = BYTE4(self->_superWideFallbackRecenteringShiftOffset.y) != 0;
                      }
                      else
                      {
                        v76 = 0;
                        v114 = LOBYTE(self->_wideFallbackRecenteringShiftOffset.y) != 0;
                      }
                      if (cf)
                        v77 = cf;
                      else
                        v77 = target;
                      v78 = (void *)CMGetAttachment(v77, CFSTR("TotalZoomFactor"), 0);
                      if (v78)
                      {
                        objc_msgSend(v78, "floatValue");
                        v80 = v79;
                      }
                      else
                      {
                        v80 = 1.0;
                      }
                      if (((v76 | v116 ^ 1) & 1) == 0)
                        v76 = objc_msgSend(self->_wideFocusDistanceFarEnoughToUseWide.name, "isRamping")
                           && !LOBYTE(self->_superWideFallbackShiftRamp)
                           && self->_haveSuperWideCamera
                           && self->_haveTeleCamera
                           && v80 >= self->_teleBaseZoomFactor;
                      v82 = self->_deviceIsStationary && !self->_pendingRegistrationAfterDeviceBecomesStationary;
                      if (v116)
                      {
                        v83 = !self->_superMacroRangeRegistrationTuningEnabled;
                        if (!self->_superMacroRangeRegistrationTuningEnabled)
                        {
                          if (self->_lastRegisteredFrameCaptureID)
                          {
LABEL_186:
                            v136[0] = *(float64x2_t *)MEMORY[0x1E0C9D538];
                            v136[1] = v136[0];
                            v136[2] = v136[0];
                            v115 = v136[0];
                            v126 = v136[0];
                            objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0D06978]), "floatValue");
                            v88 = v87;
                            -[BWPreviewStitcherNode _updateAndGetWideRegionShifts:teleShift:wideIsSuperWide:forComputedShift:registrationEnabled:currentFrameRate:]((uint64_t)self, v136, v126.f64, v116, v47, v41, v43, v87);
                            if (LOBYTE(self->_lastInputPTS.epoch))
                              -[BWPreviewStitcherNode _updateOverCaptureStatusWithWiderSampleBuffer:narrowerSampleBuffer:]((id *)&self->super.super.isa, cf, target);
                            memset(&v125, 0, sizeof(v125));
                            v123 = 0u;
                            v124 = (CGSize)0;
                            memset(&v122, 0, sizeof(v122));
                            v121 = (CGPoint)v115;
                            v89 = -[BWPreviewStitcherNode _newStitchedSampleBufferFromWide:tele:wideRegionsShifts:teleShift:primaryCaptureRectOut:primaryCaptureRectBeforeCroppingOut:centerWideShiftOut:currentFrameRate:inputCropRectOut:]((CMSampleBufferRef)self, (CMSampleBufferRef)cf, (opaqueCMSampleBuffer *)target, v136, &v125, (double *)&v123, &v121.x, &v122, v126.f64[0], v126.f64[1], v88);
                            v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                            v10 = v117;
                            v81 = v119;
                            if (v89)
                            {
                              v90 = v89;
                              v7 = v118;
                              if (LOBYTE(self->_borderStretchScaleFactor) && *(_QWORD *)&v120.origin.y)
                              {
                                v91 = (void *)CMGetAttachment(cf, v28, 0);
                                v92 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)&v120.origin.y, v28, 0);
                                x = v121.x;
                                if (v121.x != v26 || (x = v121.y, v121.y != v25))
                                {
                                  if (objc_msgSend((id)objc_msgSend(v91, "objectForKeyedSubscript:", v111, x), "isEqualToString:", objc_msgSend(v92, "objectForKeyedSubscript:", v111)))
                                  {
                                    DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v121);
                                    CMSetAttachment(*(CMAttachmentBearerRef *)&v120.origin.y, CFSTR("NarrowerCameraPreviewAlignmentShift"), DictionaryRepresentation, 1u);
                                    if (DictionaryRepresentation)
                                      CFRelease(DictionaryRepresentation);
                                  }
                                }
                                BWSampleBufferSetAttachedMedia(v90, 0x1E495B198, *(uint64_t *)&v120.origin.y);
                              }
                              if (v119)
                                BWSampleBufferSetAttachedMedia(v90, (uint64_t)CFSTR("Depth"), (uint64_t)v119);
                              if (self->_zoomPIPUseNarrowerCamera
                                && ((v112 & 1) != 0 || BYTE4(self->_superWideFallbackRecenteringShiftOffset.y)))
                              {
                                CMSetAttachment(v90, CFSTR("DepthDisabled"), MEMORY[0x1E0C9AAB0], 1u);
                              }
                              if (*(&self->_zoomPIPUseNarrowerCamera + 1))
                              {
                                v95 = 0;
                                transitionReferenceSampleBuffer = self->_transitionReferenceSampleBuffer;
                                if (transitionReferenceSampleBuffer)
                                  v97 = 8;
                                else
                                  v97 = 18;
                                zoomPIPMinimumUIZoomFactor_low = LOBYTE(self->_zoomPIPMinimumUIZoomFactor);
                                if (LOBYTE(self->_zoomPIPMinimumUIZoomFactor) && transitionReferenceSampleBuffer)
                                {
                                  CFRetain(self->_transitionReferenceSampleBuffer);
                                  ++LODWORD(self->_transitionReferenceLearnedCoefficientsSampleBuffer);
                                  zoomPIPMinimumUIZoomFactor_low = LOBYTE(self->_zoomPIPMinimumUIZoomFactor);
                                  v95 = transitionReferenceSampleBuffer;
                                }
                                if (zoomPIPMinimumUIZoomFactor_low)
                                {
                                  v99 = self->_transitionReferenceSampleBuffer;
                                  if (v99)
                                  {
                                    if (SLODWORD(self->_transitionReferenceLearnedCoefficientsSampleBuffer) >= v97)
                                    {
                                      CFRelease(v99);
                                      self->_transitionReferenceSampleBuffer = 0;
                                    }
                                  }
                                }
                                v100 = CGRectCreateDictionaryRepresentation(v122);
                                CMSetAttachment(v90, (CFStringRef)*MEMORY[0x1E0D05C80], v100, 1u);
                                if (v100)
                                  CFRelease(v100);
                                CMSetAttachment(v90, CFSTR("PreviewStitcherPrimaryCameraTransitionInProgress"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_teleOpacityRamp != 0), 1u);
                                v10 = v117;
                                v81 = v119;
                              }
                              else
                              {
                                v95 = 0;
                              }
                              origin = v125.origin;
                              size = v125.size;
                              v104 = v123;
                              *(_QWORD *)&v120.origin.x = v123;
                              v105 = v124;
                              v106 = CMSampleBufferGetImageBuffer(v90);
                              CVPixelBufferGetWidth(v106);
                              CVPixelBufferGetHeight(v106);
                              FigCaptureMetadataUtilitiesNormalizeCropRect(origin.x, origin.y, size.width, size.height);
                              v107 = CGRectCreateDictionaryRepresentation(v138);
                              CMSetAttachment(v90, (CFStringRef)*MEMORY[0x1E0D05D10], v107, 1u);
                              if (v107)
                                CFRelease(v107);
                              v139.origin.x = v120.origin.x;
                              v139.origin.y = *((CGFloat *)&v104 + 1);
                              v139.size = v105;
                              v108 = CGRectCreateDictionaryRepresentation(v139);
                              CMSetAttachment(v90, (CFStringRef)*MEMORY[0x1E0D05D18], v108, 1u);
                              if (v108)
                                CFRelease(v108);
                              if (!LOBYTE(self->_zoomPIPMinimumUIZoomFactor))
                              {
                                if (!BYTE3(self->_blackFilledBorderRectsBySurfaceID)
                                  && BYTE2(self->_narrowerCameraFoVFillsOverCapture.name))
                                {
                                  CMSetAttachment(v90, CFSTR("SmartStyleApplyWithIdentityCoefficients"), MEMORY[0x1E0C9AAB0], 1u);
                                }
                                if (BYTE2(self->_blackFilledBorderRectsBySurfaceID)
                                  && !BYTE3(self->_blackFilledBorderRectsBySurfaceID))
                                {
                                  if (!BYTE1(self->_zoomPIPMinimumUIZoomFactor))
                                  {
                                    time = v132;
                                    v109 = CMTimeGetSeconds(&time) + 0.3;
                                    *(float *)&self->_previewTapRegistered = v109;
                                    BYTE1(self->_zoomPIPMinimumUIZoomFactor) = 1;
                                  }
                                  time = v132;
                                  if (CMTimeGetSeconds(&time) < *(float *)&self->_previewTapRegistered)
                                    CMSetAttachment(v90, CFSTR("SmartStyleApplyWithIdentityCoefficients"), MEMORY[0x1E0C9AAB0], 1u);
                                }
                              }
                              -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v90);
                              v101 = 0;
                              goto LABEL_226;
                            }
                            v7 = v118;
LABEL_218:
                            CMSampleBufferGetPresentationTimeStamp((CMTime *)&v120.size, (CMSampleBufferRef)v10);
                            -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494EFF8, &v120.size));
                            v90 = 0;
                            v95 = 0;
                            v101 = 1;
LABEL_226:
                            if (v7 == a3 && v10)
                              CFRelease(v10);
                            if (cf)
                              CFRelease(cf);
                            if (target)
                              CFRelease(target);
                            if (*(_QWORD *)&v120.origin.y)
                              CFRelease(*(CFTypeRef *)&v120.origin.y);
                            if (v81)
                              CFRelease(v81);
                            if (v95)
                              CFRelease(v95);
                            if (*v6 == 1)
                            {
                              objc_msgSend((id)CMGetAttachment(v90, CFSTR("CAContextFencePortGenerationID"), 0), "integerValue");
                              kdebug_trace();
                            }
                            if ((v101 & 1) == 0)
                              CFRelease(v90);
                            return;
                          }
                          os_unfair_lock_lock(&self->_shiftCorrectionsUpdateLock);
                          self->_lastRegisteredFrameCaptureID = self->_superWideToWideShiftCorrections[2].registeredFrameCaptureID;
                          os_unfair_lock_unlock(&self->_shiftCorrectionsUpdateLock);
                        }
                        if (!self->_lastRegisteredFrameCaptureID)
                        {
                          if ((HIDWORD(self->_wideFallbackRecenteringShiftOffset.y) - 1) <= 1)
                          {
                            if (BYTE4(self->_superWideFallbackRecenteringShiftOffset.y))
                              v84 = 1;
                            else
                              v84 = 2;
                            goto LABEL_181;
                          }
LABEL_175:
                          if (BYTE1(self->_superWideFallbackRecenteringStrength))
                          {
                            v85 = v116;
                            if (!LOBYTE(self->_superWideFallbackRecenteringStrength))
                              v85 = 0;
                            v86 = v110;
                            v84 = v85 == 1 && BYTE4(self->_superWideFallbackRecenteringShiftOffset.y) == 0;
                            goto LABEL_185;
                          }
                          v84 = 0;
LABEL_181:
                          v86 = v110;
LABEL_185:
                          self->_lastRegisteredFrameCaptureID = v86;
                          self->_pendingRegistrationAfterDeviceBecomesStationary = 0;
                          -[BWPreviewStitcherNode _updateShiftCorrectionsAsyncFromComputedShift:byRegisteringWide:tele:macroTransitionType:]((uint64_t)self, cf, (void *)target, v84, v41, v43);
                          goto LABEL_186;
                        }
                      }
                      else
                      {
                        if (!self->_lastRegisteredFrameCaptureID)
                          goto LABEL_175;
                        v83 = 0;
                      }
                      if (v114 || v76 || v82 || v83)
                        goto LABEL_186;
                      goto LABEL_175;
                    }
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                    v10 = v117;
                    v7 = v118;
LABEL_155:
                    v81 = v119;
                    goto LABEL_218;
                  }
                  v33 = *MEMORY[0x1E0D06D00];
                }
                else
                {
                  if (!self->_lastNarrowerPortType)
                    -[BWPreviewStitcherDelegate previewStitcher:overCaptureStatusDidChange:](self->_delegate, "previewStitcher:overCaptureStatusDidChange:", self, HIDWORD(self->_trueVideoCaptureAdditionalZoomFactor));
                  v28 = *v27;
                  v44 = CMGetAttachment(target, v28, 0);

                  v45 = (void *)v44;
                  v33 = *MEMORY[0x1E0D06D00];
                  v113 = 0;
                  self->_lastNarrowerPortType = (NSString *)(id)objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
                }
                v41 = v26;
                v43 = v25;
                goto LABEL_83;
              }
              CFRelease(cf);
              cf = 0;
            }
            epoch_low = LOBYTE(self->_lastInputPTS.epoch);
            goto LABEL_70;
          }
        }
        else
        {
          target = 0;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        v120.origin.y = 0.0;
        goto LABEL_155;
      }
LABEL_33:
      *(_QWORD *)&self->_multiCameraStitchingEnabled = UpTimeNanoseconds;
      goto LABEL_34;
    }
LABEL_32:
    BYTE1(self->_lastInputPTS.epoch) = 1;
    UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    goto LABEL_33;
  }
  if (*v6 == 1)
    kdebug_trace();
  if (objc_msgSend(*(id *)&self->_superMacroEdgeFeatheringShowBlurMask, "count"))
  {
    global_queue = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__BWPreviewStitcherNode_renderSampleBuffer_forInput___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
}

- (id)_setOverCaptureStatus:(id *)result
{
  id *v3;

  if (result)
  {
    v3 = result;
    if (*((_DWORD *)result + 281) != (_DWORD)a2)
    {
      objc_msgSend(result, "overCaptureStatusString");
      *((_DWORD *)v3 + 281) = a2;
      return (id *)objc_msgSend(v3[47], "previewStitcher:overCaptureStatusDidChange:", v3, a2);
    }
  }
  return result;
}

- (CMSampleBufferRef)_copySampleBufferToAttachForZoomPIPFromWiderSampleBuffer:(const void *)a3 narrowerSampleBuffer:
{
  CMSampleBufferRef v3;
  BOOL v6;
  const void *v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CFTypeRef v16;
  void *v17;
  float v18;
  float v19;
  const void *v21;
  void *v22;
  int v23;
  unsigned int v24;
  int v26;
  CMSampleBufferRef sampleBufferOut;

  if (result)
  {
    v3 = result;
    sampleBufferOut = 0;
    if (!*((_BYTE *)result + 1492))
      return 0;
    if (*((_BYTE *)result + 1494))
      v6 = 1;
    else
      v6 = a2 == 0;
    if (v6)
      v7 = a3;
    else
      v7 = a2;
    v8 = (void *)CMGetAttachment(v7, CFSTR("UIZoomFactor"), 0);
    v9 = 1.0;
    v10 = 1.0;
    if (v8)
    {
      objc_msgSend(v8, "floatValue");
      v10 = v11;
    }
    v12 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v14 = *MEMORY[0x1E0D06D00];
    v15 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v16 = CMGetAttachment(a2, v12, 0);
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D05A18]))
      v17 = v13;
    else
      v17 = (void *)v16;
    objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
    result = 0;
    if (v18 != 0.0)
      v9 = v18;
    v19 = *((float *)v3 + 374);
    if (v19 == 0.0 || v10 > v19)
    {
      v21 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v7, v12, 0), "objectForKeyedSubscript:", v14), "isEqualToString:", *MEMORY[0x1E0D05A28])? 0: v7;
      v22 = *((_BYTE *)v3 + 1500) ? 0 : (void *)v21;
      v23 = objc_msgSend((id)CMGetAttachment(v22, CFSTR("OverCaptureSlaveStreamStatus"), 0), "intValue");
      result = 0;
      v24 = v23 & 0xFFFFFFFE;
      if (v22 && v24 != 2)
      {
        v26 = objc_msgSend((id)CMGetAttachment(v22, (CFStringRef)*MEMORY[0x1E0D088E8], 0), "intValue");
        result = 0;
        if (v26 <= 2)
        {
          if (!*((_BYTE *)v3 + 1494) && v9 != 2.0)
            return 0;
          BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v22, &sampleBufferOut);
          BWSampleBufferRemoveAllAttachedMedia(sampleBufferOut);
          return sampleBufferOut;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_updateInputRequirements
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 8), "formatRequirements");
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A00308);
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(1, 1, 1, 0));
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 1, *(_DWORD *)(v1 + 148)));
    return objc_msgSend(v2, "setSupportedPixelFormats:", v3);
  }
  return result;
}

- (void)setSuperWideFallbackForMacroSceneEnabled:(BOOL)a3
{
  self->_superWideFallbackForMacroSceneEnabled = a3;
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (void)setPrimaryCaptureRectCenterX:(double)a3
{
  self->_primaryCaptureRectCenterX = a3;
}

- (void)setPrimaryCameraAspectRatio:(double)a3
{
  os_unfair_lock_s *p_configurationLock;

  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  self->_primaryCameraAspectRatio = a3;
  os_unfair_lock_unlock(p_configurationLock);
}

- (void)setPreviewsWideBeforeSlaveStreamStarts:(BOOL)a3
{
  self->_previewsWideBeforeSlaveStreamStarts = a3;
}

- (void)setOutputDimensions:(id)a3
{
  self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  if (self->_maxLossyCompressionLevel != a3)
  {
    self->_maxLossyCompressionLevel = a3;
    -[BWPreviewStitcherNode _updateInputRequirements]((uint64_t)self);
  }
}

- (void)setGeneratesHistogram:(BOOL)a3
{
  self->_generatesHistogram = a3;
}

- (void)setForceBlackFillBorderEnabled:(BOOL)a3
{
  LOBYTE(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (void)setFlipVertical:(BOOL)a3
{
  self->_flipVertical = a3;
}

- (void)setFlipHorizontal:(BOOL)a3
{
  self->_flipHorizontal = a3;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BWPreviewStitcherDelegate *)a3;
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (id)_updateOverCaptureStatusWithWiderSampleBuffer:(CMAttachmentBearerRef)a3 narrowerSampleBuffer:
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v7;
  int v8;
  CMAttachmentBearerRef v9;
  void *v10;
  void *v11;
  float v12;
  int v13;
  float v14;
  float v15;
  int v16;
  unsigned int v17;
  int v19;
  BOOL v20;

  if (result)
  {
    v3 = (uint64_t)result;
    if (!*((_BYTE *)result + 1562) && !*((_BYTE *)result + 384))
    {
      if (*((_BYTE *)result + 1105))
      {
        v4 = 0;
        return -[BWPreviewStitcherNode _setOverCaptureStatus:]((id *)v3, v4);
      }
      v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v8 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), "isEqualToString:", *MEMORY[0x1E0D05A28]);
      if (v8)
        v9 = a3;
      else
        v9 = target;
      v10 = (void *)CMGetAttachment(v9, v7, 0);
      psn_updateFocusDistanceBasedScene(v3 + 1128, v10);
      if (target)
        a3 = target;
      v11 = (void *)CMGetAttachment(a3, CFSTR("TotalZoomFactor"), 0);
      if (v11)
        objc_msgSend(v11, "floatValue");
      else
        v12 = 1.0;
      if (!v8)
      {
        v17 = 1;
        if (*(_BYTE *)(v3 + 1172) && !*(_BYTE *)(v3 + 153))
        {
          if (v12 >= 1.7 || *(float *)(v3 + 824) == *(float *)(v3 + 164))
            v17 = 1;
          else
            v17 = 2;
        }
        goto LABEL_39;
      }
      v13 = *(unsigned __int8 *)(v3 + 1168);
      v14 = *(float *)(v3 + 160);
      v15 = *(float *)(v3 + 824);
      v16 = v15 != 0.0;
      if (v15 != v14)
        v16 = 0;
      if ((v16 & 1) != 0 || v12 >= v14)
      {
        if (!*(_BYTE *)(v3 + 1169))
        {
          if (!*(_BYTE *)(v3 + 1172))
            goto LABEL_60;
          if (((*(_BYTE *)(v3 + 1177) == 0) & ~v16) != 0)
          {
LABEL_59:
            v17 = 2;
            goto LABEL_39;
          }
          if (*(_QWORD *)(v3 + 232))
          {
            if (*(_BYTE *)(v3 + 1388))
              v17 = 2;
            else
              v17 = 1;
            if (!*(_BYTE *)(v3 + 1168) || *(_BYTE *)(v3 + 1388))
              goto LABEL_39;
          }
          else
          {
LABEL_60:
            if (!*(_BYTE *)(v3 + 1168))
              goto LABEL_38;
          }
          if (!*(_BYTE *)(v3 + 1129) || *(_BYTE *)(v3 + 1388))
          {
            v17 = 3;
LABEL_39:
            v19 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("OverCaptureSlaveStreamStatus"), 0), "intValue");
            if (v19 == 1 || *(_BYTE *)(v3 + 394) && !*(_BYTE *)(v3 + 425))
              v17 = 4;
            if (*(_BYTE *)(v3 + 1220))
              v20 = (v19 & 0xFFFFFFFE) == 2;
            else
              v20 = 0;
            if (v20)
              v4 = 5;
            else
              v4 = v17;
            return -[BWPreviewStitcherNode _setOverCaptureStatus:]((id *)v3, v4);
          }
        }
      }
      else if (v13 | *(unsigned __int8 *)(v3 + 1172))
      {
        if (*(_BYTE *)(v3 + 1168))
          v13 = *(_BYTE *)(v3 + 1129) == 0;
        if (!*(_BYTE *)(v3 + 1172) && !v13 || *(_BYTE *)(v3 + 1177))
        {
          if (v13)
            v17 = 3;
          else
            v17 = 1;
          goto LABEL_39;
        }
        goto LABEL_59;
      }
LABEL_38:
      v17 = 1;
      goto LABEL_39;
    }
  }
  return result;
}

- (uint64_t)_updateZoomStatusFromWideSampleBuffer:(CMAttachmentBearerRef)target teleSampleBuffer:
{
  uint64_t v3;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int *v14;
  float v15;
  float v16;
  float v17;
  CMAttachmentBearerRef v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  float v33;
  const void *v34;
  void *v35;
  const void *v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  void *v42;
  float v43;
  double v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  double v55;
  void *v56;
  void *v57;
  int v58;
  char v59;
  char v60;
  void *v61;
  char v62;
  int v63;
  char v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  float v72;
  float v73;
  int v74;
  int v75;
  float v76;
  int v77;
  char v78;
  char v79;
  _BOOL4 v80;
  void *v81;
  int v82;
  int v83;
  float v84;
  _BOOL4 v85;
  char v86;
  BOOL v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  int *v93;
  int v94;
  BOOL v95;
  int *v96;
  int v97;
  float v98;
  _BOOL4 v99;
  float v100;
  float v101;
  BOOL v102;
  int *v103;
  void *v104;
  void *v105;
  float v106;
  float v107;
  float v108;
  uint64_t v110;
  uint64_t v111;
  float v112;
  float v113;
  void *v114;
  uint64_t v115;
  void *v116;
  CMAttachmentBearerRef targeta;
  int targetb;
  uint64_t v119;
  const void *v120;
  void *v121;
  void *v122;
  int v123;

  if (!a1)
    return 0;
  v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v9 = *MEMORY[0x1E0D06D00];
  v10 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v11 = (void *)CMGetAttachment(a2, v7, 0);
  v12 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v122 = v10;
  v115 = *MEMORY[0x1E0D05A30];
  v13 = objc_msgSend(v10, "isEqualToString:");
  v14 = &OBJC_IVAR___BWPreviewStitcherNode__wideBaseZoomFactor;
  if (v13)
    v14 = &OBJC_IVAR___BWPreviewStitcherNode__teleBaseZoomFactor;
  v15 = *(float *)(a1 + *v14);
  v16 = 0.0;
  v123 = v13;
  if ((v13 & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "firstObject"), "floatValue");
    v16 = v17;
  }
  v120 = a2;
  targeta = target;
  if (a2)
    v18 = a2;
  else
    v18 = target;
  v19 = (void *)CMGetAttachment(v18, CFSTR("TotalZoomFactor"), 0);
  v20 = 1.0;
  if (v19)
  {
    objc_msgSend(v19, "floatValue");
    v20 = v21;
  }
  v22 = (void *)*MEMORY[0x1E0D05A18];
  v23 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D05A18]);
  v116 = v12;
  v114 = v22;
  v24 = objc_msgSend(v12, "isEqualToString:", v22);
  v119 = *MEMORY[0x1E0D05A28];
  v25 = objc_msgSend(v10, "isEqualToString:");
  v121 = v8;
  if (v23)
    v26 = v8;
  else
    v26 = v11;
  v27 = *MEMORY[0x1E0D06CC8];
  objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
  if (v28 == 0.0)
    v28 = 1.0;
  *(float *)(a1 + 224) = v28;
  *(_BYTE *)(a1 + 246) = 0;
  v29 = *(float *)(a1 + 228);
  v30 = *(float *)(a1 + 224);
  if (v29 != v30)
  {
    if (v23
      && v29 == 2.0
      && v30 == 1.0
      && *(_BYTE *)(a1 + 245)
      && objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]))
    {
      *(_BYTE *)(a1 + 246) = 1;
    }
    else
    {
      *(_DWORD *)(a1 + 396) = 0;
      *(_DWORD *)(a1 + 228) = *(_DWORD *)(a1 + 224);
    }
  }
  v31 = v8;
  if (!v25)
    v31 = 0;
  if (v23)
    v32 = v11;
  else
    v32 = v31;
  objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", v27), "floatValue");
  if (v33 == 0.0)
    v33 = 1.0;
  *(float *)(a1 + 240) = v33;
  if (!*(_BYTE *)(a1 + 176))
  {
    *(_DWORD *)(a1 + 180) = 0;
    v34 = a2;
    v35 = v122;
    v36 = targeta;
    goto LABEL_70;
  }
  v34 = a2;
  v35 = v122;
  v36 = targeta;
  if (*(_BYTE *)(a1 + 1560))
  {
    v37 = *(float *)(a1 + 172);
    if ((v23 | v25) == 1)
    {
      v38 = *(float *)(a1 + 188);
      v39 = *(float *)(a1 + 156);
      if (v37 >= v20)
        v40 = v20;
      else
        v40 = *(float *)(a1 + 172);
      if (v40 < v39)
        v40 = *(float *)(a1 + 156);
      v41 = (float)((float)(v40 - v39) / (float)(v37 - v39)) + 0.0;
      v42 = *(void **)(a1 + 864);
      if (v42)
      {
        objc_msgSend(v42, "currentValue");
        v44 = 1.0 - v43;
        v37 = *(float *)(a1 + 172);
      }
      else
      {
        v44 = 1.0;
        if (!*(_BYTE *)(a1 + 1360))
          v44 = 0.0;
      }
      v54 = v44 * v41;
      if (v54 > 1.0)
        v54 = 1.0;
      if (v54 < 0.0)
        v54 = 0.0;
      v37 = v37 + (float)((float)(v38 - v37) * v54);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
    goto LABEL_62;
  }
  if ((v23 | v24) == 1)
  {
    objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CF0]), "floatValue");
    v46 = v45;
    v47 = *(float *)(a1 + 188);
    v48 = *(float *)(a1 + 172);
    v49 = *(float *)(a1 + 192);
    v50 = *(float *)(a1 + 196);
    if (v50 <= v49)
    {
      v112 = *(float *)(a1 + 196);
      v113 = *(float *)(a1 + 192);
      fig_log_get_emitter();
      v111 = v3;
      LODWORD(v110) = 0;
      FigDebugAssert3();
      v50 = v112;
      v49 = v113;
    }
    if (v50 >= v46)
      v51 = v46;
    else
      v51 = v50;
    if (v51 < v49)
      v51 = v49;
    v37 = v48 + (float)((float)(v47 - v48) * (float)((float)(v51 - v49) / (float)(v50 - v49)));
    v52 = *(float *)(a1 + 200);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
    v53 = *(float *)(a1 + 180);
    if (v53 > 0.0 && v52 < 1.0)
    {
      *(float *)(a1 + 180) = BWModifiedMovingAverage(v37, v53, v52);
LABEL_63:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
      goto LABEL_64;
    }
LABEL_62:
    *(float *)(a1 + 180) = v37;
    goto LABEL_63;
  }
LABEL_64:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
  LODWORD(v55) = 0;
  if (v123)
  {
    v56 = *(void **)(a1 + 864);
    if (v56)
    {
      objc_msgSend(v56, "currentValue", v55);
    }
    else if (!*(_BYTE *)(a1 + 818))
    {
      *(float *)&v55 = 1.0;
    }
  }
  *(float *)(a1 + 184) = *(float *)(a1 + 172)
                       + (float)((float)(*(float *)(a1 + 180) - *(float *)(a1 + 172)) * (float)(1.0 - *(float *)&v55));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
LABEL_70:
  v57 = (void *)CMGetAttachment(v36, CFSTR("RecommendedMasterPortType"), 0);
  if (!v57)
  {
    v57 = (void *)CMGetAttachment(v34, CFSTR("RecommendedMasterPortType"), 0);
    if (!v57)
      goto LABEL_93;
  }
  if ((!v36 || (v58 = objc_msgSend(v57, "isEqualToString:", v35), v34) || v58)
    && (!v34 || (v59 = objc_msgSend(v57, "isEqualToString:", v116), v36) || (v59 & 1) != 0))
  {
    if (!*(_BYTE *)(a1 + 152))
      goto LABEL_92;
    if ((objc_msgSend(v57, "isEqualToString:", v119) & 1) != 0)
    {
      if (!v36)
        goto LABEL_92;
    }
    else
    {
      v62 = objc_msgSend(v57, "isEqualToString:", v115);
      if (!v36 || (v62 & 1) == 0)
        goto LABEL_92;
    }
    v63 = objc_msgSend(v57, "isEqualToString:", v35, v110, v111);
    if (!v34)
      goto LABEL_92;
    if (v63)
      goto LABEL_92;
    v64 = objc_msgSend(v57, "isEqualToString:", v116);
    v61 = v114;
    if ((v64 & 1) != 0)
      goto LABEL_92;
  }
  else
  {
    v60 = objc_msgSend(v35, "isEqualToString:", v119, v110, v111);
    v61 = v116;
    if (v36)
      v61 = v35;
    if ((v60 & 1) != 0)
      goto LABEL_92;
  }
  v57 = v61;
  if (!v61)
    goto LABEL_93;
LABEL_92:
  if ((objc_msgSend(v57, "isEqualToString:", *(_QWORD *)(a1 + 832), v110) & 1) != 0)
  {
LABEL_93:
    targetb = 0;
    goto LABEL_95;
  }

  *(_QWORD *)(a1 + 832) = v57;
  targetb = objc_msgSend(v57, "isEqualToString:", v35);
LABEL_95:
  v65 = (void *)CMGetAttachment(v36, CFSTR("PreferredMasterPortType"), 0);
  if ((v65 || (v65 = (void *)CMGetAttachment(v34, CFSTR("PreferredMasterPortType"), 0)) != 0)
    && (objc_msgSend(v65, "isEqualToString:", *(_QWORD *)(a1 + 840), v110) & 1) == 0)
  {

    *(_QWORD *)(a1 + 840) = v65;
  }
  if (*(_BYTE *)(a1 + 152))
  {
    v66 = objc_msgSend(*(id *)(a1 + 840), "isEqual:", v119) && v20 >= *(float *)(a1 + 160);
    if (*(unsigned __int8 *)(a1 + 1392) != v66)
    {
      *(_BYTE *)(a1 + 1392) = v66;
      if ((v123 & 1) == 0 && *(_BYTE *)(a1 + 1393) && v66)
        *(_DWORD *)(a1 + 396) = 0;
    }
  }
  if ((v123 & 1) != 0)
  {
    v67 = *MEMORY[0x1E0D06AB8];
    v68 = v122;
    if (!*(_BYTE *)(a1 + 1233)
      && objc_msgSend((id)objc_msgSend(v121, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AB8]), "intValue") == 1)
    {
      goto LABEL_114;
    }
    v69 = v11;
  }
  else
  {
    v67 = *MEMORY[0x1E0D06AB8];
    v69 = v121;
    v68 = v122;
  }
  psn_updateFocusDistanceBasedScene(a1 + 1232, v69);
  psn_updateFocusDistanceBasedScene(a1 + 1312, v69);
LABEL_114:
  if (v123)
    v70 = v11;
  else
    v70 = v121;
  *(_BYTE *)(a1 + 1272) = objc_msgSend((id)objc_msgSend(v70, "objectForKeyedSubscript:", v67, v110), "intValue") == 1;
  if (v123)
  {
    *(_BYTE *)(a1 + 1273) = objc_msgSend((id)objc_msgSend(v121, "objectForKeyedSubscript:", v67), "intValue") == 1;
  }
  else if (*(_BYTE *)(a1 + 152)
         && objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v67), "intValue") != 1)
  {
    psn_updateFocusDistanceBasedScene(a1 + 1400, v11);
  }
  v71 = (void *)CMGetAttachment(v36, CFSTR("RampZoomFactorOfInterest"), 0);
  if (!v71)
    v71 = (void *)CMGetAttachment(v34, CFSTR("RampZoomFactorOfInterest"), 0);
  objc_msgSend(v71, "floatValue");
  v73 = v72;
  v74 = *(unsigned __int8 *)(a1 + 1304);
  v75 = *(_DWORD *)(a1 + 1224);
  if (!v75)
  {
    *(_BYTE *)(a1 + 1304) = 0;
    goto LABEL_145;
  }
  v76 = *(float *)(a1 + 164);
  if (v20 < v76 && v73 != v76)
  {
    v77 = *(unsigned __int8 *)(a1 + 153);
    if (*(_BYTE *)(a1 + 153))
      v77 = *(_BYTE *)(a1 + 154) != 0;
    if (v75 == 1 || v77)
    {
      v79 = 1;
      goto LABEL_140;
    }
    if (v75 != 2)
      goto LABEL_145;
LABEL_138:
    v79 = *(_BYTE *)(a1 + 1233) ^ 1;
LABEL_140:
    *(_BYTE *)(a1 + 1304) = v79;
    goto LABEL_145;
  }
  if (v75 == 2)
    goto LABEL_138;
  if (v75 == 1)
  {
    if ((objc_msgSend(*(id *)(a1 + 832), "isEqualToString:", v114) & 1) != 0)
    {
      v78 = 1;
    }
    else if (*(_BYTE *)(a1 + 152))
    {
      v78 = objc_msgSend(*(id *)(a1 + 832), "isEqualToString:", v119);
    }
    else
    {
      v78 = 0;
    }
    v68 = v122;
    *(_BYTE *)(a1 + 1304) = v78;
  }
LABEL_145:
  if (*(unsigned __int8 *)(a1 + 1304) == v74)
  {
    if (v123)
      v80 = v74 != *(unsigned __int8 *)(a1 + 1305);
    else
      v80 = 0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 1306))
      *(_BYTE *)(a1 + 1307) = (*(_DWORD *)(a1 + 1308) & 0xFFFFFFFD) == 0;
    v80 = 1;
  }
  objc_msgSend(*(id *)(a1 + 1280), "updateRampForNextIteration");
  v81 = (void *)CMGetAttachment(v36, CFSTR("LastRecommendedMasterSelectionReason"), 0);
  if (v81 || (v81 = (void *)CMGetAttachment(v34, CFSTR("LastRecommendedMasterSelectionReason"), 0)) != 0)
    *(_DWORD *)(a1 + 1308) = objc_msgSend(v81, "intValue");
  if (!*(_BYTE *)(a1 + 152))
  {
    v85 = 0;
    v83 = targetb;
    goto LABEL_181;
  }
  v82 = *(unsigned __int8 *)(a1 + 1388);
  if (!v75)
  {
    v86 = 0;
LABEL_168:
    *(_BYTE *)(a1 + 1388) = v86;
    v83 = targetb;
    goto LABEL_169;
  }
  if (v75 == 2)
  {
    v86 = *(_BYTE *)(a1 + 1313) ^ 1;
    goto LABEL_168;
  }
  v83 = targetb;
  if (v75 != 1 || ((v84 = *(float *)(a1 + 160), v20 < v84) || !*(_DWORD *)(a1 + 1308)) && v73 != v84)
  {
LABEL_169:
    if (*(unsigned __int8 *)(a1 + 1388) != v82)
    {
LABEL_177:
      if (*(_BYTE *)(a1 + 1390))
        *(_BYTE *)(a1 + 1391) = *(_DWORD *)(a1 + 1308) == 2;
      v85 = 1;
      goto LABEL_180;
    }
    if ((v123 & 1) != 0)
      goto LABEL_171;
LABEL_176:
    v85 = v82 != *(unsigned __int8 *)(a1 + 1360);
    goto LABEL_180;
  }
  *(_BYTE *)(a1 + 1388) = objc_msgSend(*(id *)(a1 + 832), "isEqualToString:", v119);
  if ((v123 & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 1388))
      v87 = 1;
    else
      v87 = *(float *)(a1 + 240) > 1.0;
    *(_BYTE *)(a1 + 1388) = v87;
    if (*(unsigned __int8 *)(a1 + 1388) != v82)
      goto LABEL_177;
    goto LABEL_176;
  }
  if (*(unsigned __int8 *)(a1 + 1388) != v82)
    goto LABEL_177;
LABEL_171:
  v85 = 0;
LABEL_180:
  objc_msgSend(*(id *)(a1 + 1352), "updateRampForNextIteration");
LABEL_181:
  v88 = 0;
  if (v20 < v15)
    v89 = v83;
  else
    v89 = 0;
  if (v89 == 1 && v73 == 0.0)
    v88 = vabds_f32(1.0, v20 / v15) >= 0.1;
  v90 = -[BWPreviewStitcherNode _primaryCameraPortType](a1);
  v91 = *(_QWORD *)(a1 + 848);
  if (v68 && (objc_msgSend(v68, "isEqualToString:", *(_QWORD *)(a1 + 848)) & 1) == 0)
  {
    if (objc_msgSend(v68, "isEqualToString:", v115) && (!*(_BYTE *)(a1 + 818) || *(_QWORD *)(a1 + 864)))
    {
      *(_BYTE *)(a1 + 818) = 1;

      *(_QWORD *)(a1 + 864) = 0;
      v93 = &OBJC_IVAR___BWPreviewStitcherNode__teleOpacityRampForSuperMacroFallbackTransition;
    }
    else
    {
      if (!objc_msgSend(v68, "isEqualToString:", v114) || !*(_BYTE *)(a1 + 818) && !*(_QWORD *)(a1 + 864))
        goto LABEL_199;
      *(_BYTE *)(a1 + 818) = 0;

      *(_QWORD *)(a1 + 864) = 0;
      *(_BYTE *)(a1 + 904) = 0;
      v93 = &OBJC_IVAR___BWPreviewStitcherNode__teleFocusingOneShot;
    }
    *(_BYTE *)(a1 + *v93) = 0;
    v68 = v122;
LABEL_199:
    *(_DWORD *)(a1 + 824) = 0;
    *(_DWORD *)(a1 + 396) = 0;

    *(_QWORD *)(a1 + 848) = v68;
    *(_BYTE *)(a1 + 856) = v123;
    *(_BYTE *)(a1 + 1389) = *(_BYTE *)(a1 + 1388);
    v92 = 1;
    goto LABEL_200;
  }
  v92 = 0;
LABEL_200:
  v94 = -[BWPreviewStitcherNode _currentlyZoomingOrSwitchingCameras](a1);
  if ((v92 & 1) != 0 || ((v73 == 0.0) & ~v94) != 0)
  {
    if (v20 >= v15)
    {
      v96 = &OBJC_IVAR___BWPreviewStitcherNode__wantSuperWideFallback;
      if (v123)
        v96 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      v95 = *(_BYTE *)(a1 + *v96) != 0;
    }
    else
    {
      v95 = 1;
    }
    *(_BYTE *)(a1 + 819) = v95;
    if (!v120 && *(_BYTE *)(a1 + 819))
      *(_BYTE *)(a1 + 819) = 0;
    if (!v91)
    {
      v97 = *(unsigned __int8 *)(a1 + 819);
      if (*(unsigned __int8 *)(a1 + 818) != v97)
        *(_BYTE *)(a1 + 818) = v97;
    }
  }
  v98 = *(float *)(a1 + 824);
  v99 = v98 == 0.0;
  if (v73 == 0.0)
    v99 = 0;
  v100 = v20;
  if (v99 || v98 != 0.0 && (v100 = 0.0, v73 == 0.0))
    *(float *)(a1 + 828) = v100;
  *(float *)(a1 + 824) = v73;
  if (v73 > 0.0)
  {
    if (v73 == v15 || v73 == v16)
    {
      v101 = *(float *)(a1 + 824);
      if (v101 == 0.0 || vabds_f32(1.0, *(float *)(a1 + 828) / v101) < 0.1)
      {
        if (!v80)
          goto LABEL_235;
        if (!*(_BYTE *)(a1 + 1306))
        {
          v104 = (void *)-[BWPreviewStitcherNode _primaryCameraPortType](a1);
          goto LABEL_236;
        }
      }
      if (v20 >= 1.07)
      {
        v103 = &OBJC_IVAR___BWPreviewStitcherNode__wantSuperWideFallback;
        if (v123)
          v103 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
        v102 = *(_BYTE *)(a1 + *v103) != 0;
      }
      else
      {
        v102 = 1;
      }
      *(_BYTE *)(a1 + 819) = v102;
    }
    else if (v73 != 1.0)
    {
      goto LABEL_235;
    }
    v88 = v88 | v99;
  }
LABEL_235:
  v104 = (void *)-[BWPreviewStitcherNode _primaryCameraPortType](a1);
  if (!v80 && !v85)
  {
LABEL_237:
    objc_msgSend(v104, "isEqualToString:", v90);
    goto LABEL_239;
  }
LABEL_236:
  if ((objc_msgSend(v104, "isEqualToString:", v90) & 1) != 0)
    goto LABEL_237;
  *(_DWORD *)(a1 + 396) = 0;
LABEL_239:
  v105 = (void *)CMGetAttachment(v120, CFSTR("UIZoomFactor"), 0);
  if (v105)
  {
    objc_msgSend(v105, "floatValue");
    v107 = v106;
  }
  else
  {
    v107 = 1.0;
  }
  v108 = *(float *)(a1 + 1216);
  if (v107 != v108)
  {
    if (v108 != 0.0)
    {
      BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering((_BYTE *)(a1 + 1176));
      BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering((_BYTE *)(a1 + 1520));
    }
    *(float *)(a1 + 1216) = v107;
  }
  return v88;
}

- (uint64_t)_primaryCameraPortType
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    if (*(_BYTE *)(result + 1040))
    {
      v1 = *MEMORY[0x1E0D05A28];
      v2 = *MEMORY[0x1E0D05A18];
      if (*(_BYTE *)(result + 856))
      {
        v1 = *MEMORY[0x1E0D05A18];
        v2 = *MEMORY[0x1E0D05A30];
      }
      if (*(_BYTE *)(result + 819))
        return v1;
      else
        return v2;
    }
    else
    {
      return *(_QWORD *)(result + 848);
    }
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  const __CFAllocator *v3;
  const __CFString *v4;
  CFStringRef *v5;
  OpaqueVTPixelRotationSession **p_outputRotationSession;
  OpaqueVTPixelRotationSession *outputRotationSession;
  const __CFString *v8;
  const void *v9;
  _BOOL4 flipVertical;
  int v11;
  __int128 v12;
  unint64_t v13;
  unint64_t primaryCaptureRectPixelInset;
  double primaryCaptureRectCenterX;
  uint64_t v16;
  float v17;
  objc_super v18;
  _OWORD v19[3];
  unsigned __int8 v20;
  int32x2_t v21;

  v21.i32[0] = -[BWVideoFormat width](-[BWNodeOutput videoFormat](self->super._output, "videoFormat"), "width");
  v21.i32[1] = -[BWVideoFormat height](-[BWNodeOutput videoFormat](self->super._output, "videoFormat"), "height");
  FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v21, self->_rotationDegrees);
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_intermediateRotationSession);
  v4 = (const __CFString *)*MEMORY[0x1E0CED768];
  VTSessionSetProperty(self->_intermediateRotationSession, (CFStringRef)*MEMORY[0x1E0CED768], MEMORY[0x1E0C9AAB0]);
  v5 = (CFStringRef *)MEMORY[0x1E0CED840];
  if (self->_zoomPIPSingleStreamModeEnabled)
    VTSessionSetProperty(self->_intermediateRotationSession, (CFStringRef)*MEMORY[0x1E0CED840], MEMORY[0x1E0C9AAB0]);
  p_outputRotationSession = &self->_outputRotationSession;
  VTPixelRotationSessionCreate(v3, &self->_outputRotationSession);
  outputRotationSession = self->_outputRotationSession;
  v8 = (const __CFString *)*MEMORY[0x1E0CED7A0];
  v9 = (const void *)FigCaptureVTRotationFromDegrees(self->_rotationDegrees);
  VTSessionSetProperty(outputRotationSession, v8, v9);
  VTSessionSetProperty(self->_outputRotationSession, v4, MEMORY[0x1E0C9AAB0]);
  if (self->_zoomPIPSingleStreamModeEnabled)
    VTSessionSetProperty(*p_outputRotationSession, *v5, MEMORY[0x1E0C9AAB0]);
  if (self->_flipHorizontal)
    VTSessionSetProperty(*p_outputRotationSession, (CFStringRef)*MEMORY[0x1E0CED778], MEMORY[0x1E0C9AAB0]);
  if (self->_flipVertical)
  {
    VTSessionSetProperty(*p_outputRotationSession, (CFStringRef)*MEMORY[0x1E0CED780], MEMORY[0x1E0C9AAB0]);
    flipVertical = self->_flipVertical;
  }
  else
  {
    flipVertical = 0;
  }
  v20 = 0;
  v11 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(self->_rotationDegrees, self->_flipHorizontal, flipVertical, (char *)&v20);
  FigCaptureMakeMirrorAndRotateVideoTransform(v21.i32[0], v21.i32[1], v20, v11, (uint64_t)v19);
  v12 = v19[1];
  *(_OWORD *)&self->_outputTransform.a = v19[0];
  *(_OWORD *)&self->_outputTransform.c = v12;
  *(_OWORD *)&self->_outputTransform.tx = v19[2];
  if (self->_generatesHistogram)
    VTSessionSetProperty(*p_outputRotationSession, (CFStringRef)*MEMORY[0x1E0CED770], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
  if (self->_primaryCaptureRectYInset != 0.0)
  {
    self->_primaryCaptureRectPixelInset = (int)(self->_primaryCaptureRectYInset
                                              * (double)-[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height"));
    if (self->_primaryCaptureRectPixelInset > (-[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height")- 2) >> 1)-[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height");
    v13 = -[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height");
    primaryCaptureRectPixelInset = self->_primaryCaptureRectPixelInset;
    if (primaryCaptureRectPixelInset > (v13 - 2) >> 1)
      primaryCaptureRectPixelInset = (-[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height")+ 0x1FFFFFFFELL) >> 1;
    self->_primaryCaptureRectPixelInset = primaryCaptureRectPixelInset;
  }
  primaryCaptureRectCenterX = self->_primaryCaptureRectCenterX;
  if (primaryCaptureRectCenterX != 0.5)
    self->_primaryCaptureRectCenterXPixelOffset = (int)((primaryCaptureRectCenterX + -0.5) * (double)v21.i32[0]);
  v16 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)&self->_lastSampleBuffer = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)&self->_lastInputPTS.timescale = *(_QWORD *)(v16 + 16);
  if (LOBYTE(self->_lastInputPTS.epoch))
    self->_drawWiderCameraOnly = 1;
  MGGetFloat32Answer();
  self->_screenScale = FigCaptureRoundFloatToMultipleOf(1, v17);
  if (BYTE2(self->_blackFilledBorderRectsBySurfaceID) | LOBYTE(self->_lastInputPTS.epoch))
  {
    self->_teleOpacityPoolReadyAssertion = (BWMemoryPoolFlushAssertion *)-[BWMemoryPool newFlushAssertion:](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "newFlushAssertion:", CFSTR("BWPreviewStitcherNode teleOpacityPool"));
    if (BYTE2(self->_blackFilledBorderRectsBySurfaceID))
      -[BWPreviewStitcherNode _preheatCIRenderingAsync]((uint64_t)self);
  }
  else
  {
    self->_havePreheatedCI = 1;
  }
  BYTE1(self->_trueVideoHDRtoSDRBlendRamp) = BWColorSpacePropertiesIsHDR(-[BWVideoFormat colorSpaceProperties](-[BWNodeInputMediaProperties resolvedVideoFormat](-[BWNodeInput primaryMediaProperties](self->super._input, "primaryMediaProperties"), "resolvedVideoFormat"), "colorSpaceProperties"));
  v18.receiver = self;
  v18.super_class = (Class)BWPreviewStitcherNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v18, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (void)_updateUprightExifOrientationOnSampleBufferIfNeeded:(uint64_t)a1
{
  int v4;
  BOOL v5;
  int v6;
  int v7;
  _BOOL4 v8;
  int v9;
  const void *v10;
  char v11;
  char v12;

  if (a1)
  {
    v4 = objc_msgSend((id)CMGetAttachment(target, CFSTR("UprightExifOrientation"), 0), "intValue");
    if (*(_DWORD *)(a1 + 104) || *(_BYTE *)(a1 + 108))
    {
      v5 = 0;
      if (!v4)
        return;
    }
    else
    {
      v5 = *(_BYTE *)(a1 + 109) == 0;
      if (!v4)
        return;
    }
    if (!v5)
    {
      v12 = 0;
      v6 = FigCaptureRotationDegreesAndMirroringFromExifOrientation(v4, &v12);
      v11 = 0;
      v7 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(*(unsigned int *)(a1 + 104), *(unsigned __int8 *)(a1 + 108), *(unsigned __int8 *)(a1 + 109), &v11);
      if (v11)
        v8 = v12 == 0;
      else
        v8 = v12 != 0;
      if (v8 && (v7 == 270 || v7 == 90))
        v6 += 180;
      v9 = FigCaptureNormalizeAngle(v6 - v7);
      v10 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigCaptureExifOrientationFromRotationDegreesAndMirroring(v9, v8));
      CMSetAttachment(target, CFSTR("UprightExifOrientation"), v10, 1u);
    }
  }
}

- (float)_scaleFactorAppliedForPixelBuffer:(void *)a3 usedSourceRect:(double)a4 primaryCaptureRectAspectRatio:(double)a5 metadata:(double)a6
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float result;
  CGRect v17;

  if (!a1)
    return 0.0;
  if (!a2)
    return 1.0;
  v17 = *(CGRect *)ymmword_1A32A29A0;
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]), &v17);
  CVPixelBufferGetWidth(a2);
  CVPixelBufferGetHeight(a2);
  FigCaptureMetadataUtilitiesDenormalizeCropRect(v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  v13 = 1.0;
  if (v11 / v12 < a8)
    v13 = a8 / (v11 / v12);
  v14 = a7 * v13;
  v15 = vabdd_f64(a7 * v13, v12);
  result = 1.0;
  if (v15 > 2.0)
    return v14 / v12;
  return result;
}

- (float)_wideBaseZoomFactorWithOverride
{
  float v1;

  if (!a1)
    return 0.0;
  v1 = a1[46];
  if (v1 <= 0.0)
  {
    v1 = a1[45];
    if (v1 <= 0.0)
    {
      v1 = a1[43];
      if (v1 <= 0.0)
        v1 = a1[40];
    }
  }
  return v1 * a1[56];
}

- (void)_restitchAndEmitLastInputForAspectAndCenterChange
{
  const void *v2;
  CFTypeRef v3;
  id v4;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
    v2 = *(const void **)(a1 + 1008);
    if (v2)
    {
      v3 = CFRetain(v2);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
      if (v3)
      {
        v4 = +[BWNodeSampleBufferMessage newMessageWithSampleBuffer:](BWNodeSampleBufferMessage, "newMessageWithSampleBuffer:", v3);
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "connection"), "consumeMessage:fromOutput:", v4, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "connection"), "output"));

        CFRelease(v3);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
    }
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWPreviewStitcherNode)initWithStitchingDisabledAndZoomPIPOverlayEnabled:(BOOL)a3 zoomPIPMinimumUIZoomFactor:(float)a4 zoomPIPSingleStreamModeEnabled:(BOOL)a5 propagateDepth:(BOOL)a6 propagateStyles:(BOOL)a7 parallaxMitigationBasedOnZoomFactorEnabled:(BOOL)a8 preallocateOutputBufferPool:(BOOL)a9
{
  uint64_t v10;

  BYTE5(v10) = a9;
  BYTE4(v10) = a5;
  BYTE3(v10) = a3;
  BYTE2(v10) = a8;
  BYTE1(v10) = a7;
  LOBYTE(v10) = a6;
  return -[BWPreviewStitcherNode initWithCameraInfoByPortType:sensorBinningFactor:inputBuffersHaveHorizontalOverscanOnly:registrationType:registrationMetalCommandQueue:excludeStaticComponentFromAlignmentShifts:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:zoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:preallocateOutputBufferPool:](self, "initWithCameraInfoByPortType:sensorBinningFactor:inputBuffersHaveHorizontalOverscanOnly:registrationType:registrationMetalCommandQueue:excludeStaticComponentFromAlignmentShifts:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:zoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:preallocateOutputBufferPool:", 0, 0, 0, 0, 0, 0, v10);
}

- (BWPreviewStitcherNode)initWithCameraInfoByPortType:(id)a3 sensorBinningFactor:(id)a4 inputBuffersHaveHorizontalOverscanOnly:(BOOL)a5 registrationType:(int)a6 registrationMetalCommandQueue:(id)a7 excludeStaticComponentFromAlignmentShifts:(BOOL)a8 propagateDepth:(BOOL)a9 propagateStyles:(BOOL)a10 parallaxMitigationBasedOnZoomFactorEnabled:(BOOL)a11 zoomPIPOverlayEnabled:(BOOL)a12 zoomPIPMinimumUIZoomFactor:(float)a13 zoomPIPSingleStreamModeEnabled:(BOOL)a14 preallocateOutputBufferPool:(BOOL)a15
{
  _BOOL4 v15;
  BWPreviewStitcherNode *v22;
  uint64_t v23;
  BWNodeInput *v24;
  BWVideoFormatRequirements *v25;
  uint64_t v26;
  int v27;
  BWNodeInputMediaConfiguration *v28;
  BWNodeInputMediaConfiguration *v29;
  BOOL v30;
  BWNodeInputMediaConfiguration *v31;
  BWNodeInputMediaConfiguration *v32;
  BWNodeInputMediaConfiguration *v33;
  BWNodeOutput *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  int v39;
  int v40;
  BOOL v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  double v46;
  float v47;
  float v48;
  void *v49;
  float v50;
  BWPreviewRegistration *v51;
  BWSpringSimulation *v52;
  char v53;
  void *v54;
  float v55;
  float v56;
  float v57;
  BOOL v59;
  id v61;
  BOOL v62;
  uint64_t v63;
  _BOOL4 v64;
  objc_super v65;

  v15 = a8;
  v65.receiver = self;
  v65.super_class = (Class)BWPreviewStitcherNode;
  v22 = -[BWNode init](&v65, sel_init);
  v23 = (uint64_t)v22;
  if (!v22)
    return (BWPreviewStitcherNode *)v23;
  v62 = a5;
  v63 = (uint64_t)a4;
  v61 = a7;
  v64 = v15;
  LOBYTE(v22->_lastInputPTS.epoch) = a3 != 0;
  v22->_additionalZoomFactorSpring = (BWSpringSimulation *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v23);
  v25 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWNodeInputMediaConfiguration setFormatRequirements:](-[BWNodeInput primaryMediaConfiguration](v24, "primaryMediaConfiguration"), "setFormatRequirements:", v25);
  -[BWNodeInputMediaConfiguration setRetainedBufferCount:](-[BWNodeInput primaryMediaConfiguration](v24, "primaryMediaConfiguration"), "setRetainedBufferCount:", 1);
  *(_BYTE *)(v23 + 1492) = a12;
  *(float *)(v23 + 1496) = a13;
  *(_BYTE *)(v23 + 1493) = a14;
  *(_BYTE *)(v23 + 1494) = a14;
  v26 = *(unsigned __int8 *)(v23 + 1040);
  v27 = *(unsigned __int8 *)(v23 + 1492);
  if (v26 | v27)
  {
    -[BWNodeInputMediaConfiguration setIndefinitelyHeldBufferCount:](-[BWNodeInput primaryMediaConfiguration](v24, "primaryMediaConfiguration"), "setIndefinitelyHeldBufferCount:", v26 | (2 * (v27 != 0)));
    if (*(_BYTE *)(v23 + 1040) || *(_BYTE *)(v23 + 1492) && !*(_BYTE *)(v23 + 1493))
    {
      v28 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v28, "setFormatRequirements:", v25);
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v28, "setPassthroughMode:", 0);
      -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v28, "setRetainedBufferCount:", 1);
      -[BWNodeInputMediaConfiguration setIndefinitelyHeldBufferCount:](v28, "setIndefinitelyHeldBufferCount:", v26);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v24, "setMediaConfiguration:forAttachedMediaKey:", v28, CFSTR("SynchronizedSlaveFrame"));
    }
  }
  *(_BYTE *)(v23 + 1502) = a9;
  if (a9)
  {
    v29 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v29, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v29, "setPassthroughMode:", 1);
    -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v29, "setRetainedBufferCount:", 1);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v24, "setMediaConfiguration:forAttachedMediaKey:", v29, CFSTR("Depth"));
  }
  *(_BYTE *)(v23 + 1503) = a10;
  v30 = v15;
  if (a10)
  {
    v31 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v31, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v31, "setPassthroughMode:", 1);
    -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v31, "setRetainedBufferCount:", 1);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v24, "setMediaConfiguration:forAttachedMediaKey:", v31, 0x1E495B358);
    v32 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v32, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v32, "setPassthroughMode:", 1);
    -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v32, "setRetainedBufferCount:", 1);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v24, "setMediaConfiguration:forAttachedMediaKey:", v32, 0x1E495B3B8);
  }
  v33 = objc_alloc_init(BWNodeInputMediaConfiguration);
  -[BWNodeInputMediaConfiguration setFormatRequirements:](v33, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  -[BWNodeInputMediaConfiguration setPassthroughMode:](v33, "setPassthroughMode:", 0);
  -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v33, "setRetainedBufferCount:", 1);
  -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v24, "setUnspecifiedAttachedMediaConfiguration:", v33);
  objc_msgSend((id)v23, "addInput:", v24);

  -[BWPreviewStitcherNode _updateInputRequirements](v23);
  v34 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v23);
  -[BWNodeOutputMediaConfiguration setFormatRequirements:](-[BWNodeOutput primaryMediaConfiguration](v34, "primaryMediaConfiguration"), "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
  -[BWNodeOutput setPoolPreallocationEnabled:](v34, "setPoolPreallocationEnabled:", a15);
  objc_msgSend((id)v23, "addOutput:", v34);

  *(_QWORD *)(v23 + 112) = 0;
  *(_QWORD *)(v23 + 128) = 0x3FE0000000000000;
  *(_DWORD *)(v23 + 260) = 1065353216;
  *(_BYTE *)(v23 + 264) = 1;
  if (!a3)
  {
    *(_DWORD *)(v23 + 388) = 0;
    goto LABEL_31;
  }
  v35 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]);
  v36 = v35;
  v37 = (_QWORD *)MEMORY[0x1E0D058B8];
  v38 = (_QWORD *)MEMORY[0x1E0D05950];
  if (v35)
  {
    *(_BYTE *)(v23 + 153) = 1;
    objc_msgSend((id)objc_msgSend(v35, "objectForKeyedSubscript:", *v37), "floatValue");
    *(_DWORD *)(v23 + 156) = v39;
    objc_msgSend((id)objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D058C0]), "floatValue");
    *(_DWORD *)(v23 + 168) = v40;
    *(_QWORD *)(v23 + 232) = (id)objc_msgSend(v36, "objectForKeyedSubscript:", *v38);
    *(_DWORD *)(v23 + 240) = 1065353216;
    v41 = *(_QWORD *)(v23 + 232) != 0;
    *(_BYTE *)(v23 + 1560) = v41;
    *(_BYTE *)(v23 + 1005) = v41;
    *(_BYTE *)(v23 + 244) = 0;
  }
  v42 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]);
  if (v42)
  {
    v43 = v42;
    objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", *v37), "floatValue");
    *(_DWORD *)(v23 + 160) = v44;
    *(_QWORD *)(v23 + 216) = (id)objc_msgSend(v43, "objectForKeyedSubscript:", *v38);
    *(_DWORD *)(v23 + 224) = 1065353216;
    *(_DWORD *)(v23 + 228) = 1065353216;
    if (v36)
    {
      *(_DWORD *)(v23 + 172) = *(_DWORD *)(v23 + 160);
      if ((objc_msgSend(&unk_1E4A002D8, "containsObject:", FigCaptureGetModelSpecificName()) & 1) != 0)
      {
        *(_BYTE *)(v23 + 176) = 1;
        goto LABEL_21;
      }
      v45 = *(unsigned __int8 *)(v23 + 1560);
      *(_BYTE *)(v23 + 176) = v45;
      if (v45)
      {
LABEL_21:
        v46 = *(float *)(v23 + 172);
        if (*(_BYTE *)(v23 + 1560))
        {
          v47 = v46 * 1.03;
          *(float *)(v23 + 188) = v47;
        }
        else
        {
          v48 = v46 * 1.03916449;
          *(float *)(v23 + 188) = v48;
          *(_DWORD *)(v23 + 192) = 1166331904;
          *(_DWORD *)(v23 + 196) = 1167001600;
          *(_DWORD *)(v23 + 200) = 1065353216;
        }
      }
    }
  }
  v49 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]);
  if (v49)
  {
    *(_BYTE *)(v23 + 154) = 1;
    objc_msgSend((id)objc_msgSend(v49, "objectForKeyedSubscript:", *v37), "floatValue");
    *(float *)(v23 + 164) = v50;
    if (v50 <= 0.0)
      goto LABEL_46;
    *(_DWORD *)(v23 + 248) = 0;
  }
  *(_QWORD *)(v23 + 252) = v63;
  if (!FigCaptureVideoDimensionsAreValid(v63))
    goto LABEL_46;
  *(_BYTE *)(v23 + 204) = v62;
  *(_DWORD *)(v23 + 208) = 1084227584;
  *(_DWORD *)(v23 + 388) = 0;
  if (*(_BYTE *)(v23 + 1040))
  {
    *(_DWORD *)(v23 + 404) = a6;
    v51 = -[BWPreviewRegistration initWithCameraInfoByPortType:sensorBinningFactor:registrationType:metalCommandQueue:excludeStaticComponentFromAlignmentShifts:]([BWPreviewRegistration alloc], "initWithCameraInfoByPortType:sensorBinningFactor:registrationType:metalCommandQueue:excludeStaticComponentFromAlignmentShifts:", a3, v63, *(unsigned int *)(v23 + 404), v61, v64);
    *(_QWORD *)(v23 + 416) = v51;
    if (v51)
    {
      *(_BYTE *)(v23 + 408) = v30;
      *(_BYTE *)(v23 + 394) = 1;
      *(_DWORD *)(v23 + 428) = 0;
      *(_DWORD *)(v23 + 768) = 22;
      *(_DWORD *)(v23 + 772) = 21;
      *(_BYTE *)(v23 + 776) = 1;
      *(_BYTE *)(v23 + 426) = 0;
      *(_QWORD *)(v23 + 784) = 0;
      goto LABEL_31;
    }
LABEL_46:
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
LABEL_31:
  *(_QWORD *)(v23 + 792) = 0;
  *(_BYTE *)(v23 + 816) = 0;
  *(_BYTE *)(v23 + 817) = 0;
  *(_DWORD *)(v23 + 140) = 0;
  *(_BYTE *)(v23 + 912) = 1;
  *(_QWORD *)(v23 + 920) = FigDispatchQueueCreateWithPriority();
  *(_WORD *)(v23 + 964) = 1;
  *(_DWORD *)(v23 + 968) = 1064514355;
  *(_DWORD *)(v23 + 972) = 1008981770;
  *(_DWORD *)(v23 + 976) = 1068708659;
  *(_DWORD *)(v23 + 980) = 1057803469;
  *(_DWORD *)(v23 + 984) = 1073322394;
  *(_DWORD *)(v23 + 988) = 1069547520;
  *(_DWORD *)(v23 + 992) = 1045220557;
  *(_DWORD *)(v23 + 996) = 1070050836;
  *(_DWORD *)(v23 + 1000) = 1064682127;
  v52 = objc_alloc_init(BWSpringSimulation);
  *(_QWORD *)(v23 + 1088) = v52;
  -[BWSpringSimulation resetWithInput:initialOutput:initialVelocity:](v52, "resetWithInput:initialOutput:initialVelocity:", 1.0, 1.0, 0.0);
  *(_DWORD *)(v23 + 1056) = 1065353216;
  *(_DWORD *)(v23 + 1060) = 0;
  BWSmartCameraSceneInitialize(v23 + 1128, 1, 4, 1, (uint64_t)"Wide Focus Distance Far Enough", 41.0, 6.0, 0.25);
  *(_BYTE *)(v23 + 1129) = 1;
  *(_DWORD *)(v23 + 1124) = 4 * *(unsigned __int8 *)(v23 + 1040);
  *(_BYTE *)(v23 + 1168) = 1;
  *(_BYTE *)(v23 + 1171) = 1;
  *(_BYTE *)(v23 + 1172) = 1;
  BWSmartCameraSceneInitialize(v23 + 1176, 1, 4, 1, (uint64_t)"Wider Camera FoV Fills Over Capture", 20.0, 16.0, 0.75);
  *(_BYTE *)(v23 + 1177) = 1;
  BWSmartCameraSceneUpdateResetTemporalHysteresisAndFiltering((_BYTE *)(v23 + 1176));
  *(_BYTE *)(v23 + 1220) = 1;
  *(_DWORD *)(v23 + 1224) = 1;
  BWSmartCameraSceneInitialize(v23 + 1232, 1, 10, 7, (uint64_t)"Wide Focus Distance Far Enough To Use Tele", 61.0, 6.0, 0.2);
  *(_BYTE *)(v23 + 1233) = 1;
  *(_QWORD *)(v23 + 1280) = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("WideFallbackShiftRamp"));
  *(_BYTE *)(v23 + 1306) = v30;
  *(_QWORD *)(v23 + 1456) = -[BWFencedAnimationQueue initWithQueueSize:]([BWFencedAnimationQueue alloc], "initWithQueueSize:", 1);
  BWSmartCameraSceneInitialize(v23 + 1312, 1, 3, 0, (uint64_t)"Wide Focus Distance Far Enough To Use Wide", 16.0, 2.0, 0.8);
  *(_BYTE *)(v23 + 1313) = 1;
  *(_QWORD *)(v23 + 1352) = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("SuperWideFallbackShiftRamp"));
  *(_DWORD *)(v23 + 1384) = 1050253722;
  *(_BYTE *)(v23 + 1393) = 1;
  *(_BYTE *)(v23 + 1390) = 1;
  *(_WORD *)(v23 + 1440) = 1;
  *(_DWORD *)(v23 + 1444) = 1028443341;
  *(_BYTE *)(v23 + 1448) = 0;
  BWSmartCameraSceneInitialize(v23 + 1400, 1, 4, 2, (uint64_t)"Super Wide Focus Distance Far Enough For Registration", 7.5, 1.5, 0.5);
  *(_BYTE *)(v23 + 1401) = 1;
  *(_DWORD *)(v23 + 1468) = 30;
  v53 = *(_BYTE *)(v23 + 1040);
  if (v53)
    v53 = *(_QWORD *)(v23 + 216) != 0;
  *(_BYTE *)(v23 + 1472) = v53;
  *(_DWORD *)(v23 + 1476) = 1098907648;
  v54 = *(void **)(v23 + 216);
  if (v54)
  {
    v55 = *(float *)(v23 + 164);
    objc_msgSend((id)objc_msgSend(v54, "lastObject"), "floatValue");
    v57 = v55 / v56;
  }
  else
  {
    v57 = 0.0;
  }
  v59 = v57 > 0.0 && *(_BYTE *)(v23 + 1040) != 0;
  if (v57 >= 2.0)
    v59 = 0;
  *(_BYTE *)(v23 + 1480) = v59;
  *(_DWORD *)(v23 + 1484) = 1067198710;
  *(_DWORD *)(v23 + 1488) = 1069547520;
  *(_BYTE *)(v23 + 245) = *(_QWORD *)(v23 + 216) != 0;
  *(_BYTE *)(v23 + 1501) = (int)FigCapturePlatformIdentifier() > 8;
  *(_BYTE *)(v23 + 1512) = a11;
  BWSmartCameraSceneInitialize(v23 + 1520, 1, 16, 0, (uint64_t)"Narrower Camera FoV Fills Over Capture", 0.99, 0.0, 0.9);
  *(_BYTE *)(v23 + 1521) = 1;
  *(_BYTE *)(v23 + 1576) = 1;
  return (BWPreviewStitcherNode *)v23;
}

- (void)dealloc
{
  OpaqueVTPixelRotationSession *intermediateRotationSession;
  opaqueCMFormatDescription *outputFormatDescription;
  OpaqueVTPixelRotationSession *outputRotationSession;
  unint64_t v6;
  BWRamp **p_rampY;
  const void *v8;
  const void *v9;
  opaqueCMSampleBuffer *transitionReferenceSampleBuffer;
  objc_super v11;

  -[BWPreviewStitcherNode _releaseResources]((uint64_t)self);
  intermediateRotationSession = self->_intermediateRotationSession;
  if (intermediateRotationSession)
    CFRelease(intermediateRotationSession);
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  outputRotationSession = self->_outputRotationSession;
  if (outputRotationSession)
    CFRelease(outputRotationSession);

  v6 = 0;
  p_rampY = &self->_superWideToWideShiftCorrections[0].rampY;
  do
  {

    v6 += 56;
  }
  while (v6 != 168);
  v8 = *(const void **)&self->_featherEdgesForOpacityRamp;
  if (v8)
    CFRelease(v8);

  v9 = *(const void **)&self->_allowEdgeInsetDuringTrueVideoTransitions;
  if (v9)
    CFRelease(v9);
  transitionReferenceSampleBuffer = self->_transitionReferenceSampleBuffer;
  if (transitionReferenceSampleBuffer)
    CFRelease(transitionReferenceSampleBuffer);

  v11.receiver = self;
  v11.super_class = (Class)BWPreviewStitcherNode;
  -[BWNode dealloc](&v11, sel_dealloc);
}

- (void)_releaseResources
{
  const void *v2;
  const void *v3;
  const void *v4;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 416), "cleanupResources");
    *(_BYTE *)(a1 + 424) = 0;
    VTPixelRotationSessionInvalidate(*(VTPixelRotationSessionRef *)(a1 + 304));
    v2 = *(const void **)(a1 + 304);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 304) = 0;
    }
    VTPixelRotationSessionInvalidate(*(VTPixelRotationSessionRef *)(a1 + 312));
    v3 = *(const void **)(a1 + 312);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 312) = 0;
    }
    v4 = *(const void **)(a1 + 1008);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 1008) = 0;
    }

    *(_QWORD *)(a1 + 872) = 0;
    *(_QWORD *)(a1 + 896) = 0;

    *(_QWORD *)(a1 + 880) = 0;
  }
}

- (BWPreviewStitcherDelegate)delegate
{
  return self->_delegate;
}

- (void)setPrimaryCaptureRectAspectRatio:(double)a3 center:(CGPoint)a4 trueVideoTransitionPercentComplete:(double)a5 trueVideoTransitionReferenceSampleBuffer:(opaqueCMSampleBuffer *)a6 fencePortSendRight:(id)a7
{
  CGFloat x;
  int v13;
  opaqueCMSampleBuffer *v14;
  int v15;
  double primaryCameraAspectRatio;
  _BOOL4 v18;
  BOOL v19;
  int v20;
  double v21;
  __CVBuffer *ImageBuffer;
  _BYTE *v23;
  BOOL v24;
  int v25;
  int v26;
  opaqueCMSampleBuffer *v27;
  id v28;
  uint64_t v29;
  BWRamp *v30;
  double v31;
  double v32;
  uint64_t v33;
  BOOL v34;
  id v35;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *transitionReferenceSampleBuffer;
  float v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int v44;
  double v45;
  double v46;
  double v47;
  int v48;
  os_unfair_lock_s *p_configurationLock;
  void *v50;
  float v51;
  double v52;
  BOOL IsHDR;
  void *v54;
  int32x2_t v55;

  x = a4.x;
  v55.i32[0] = -[BWVideoFormat width](-[BWNodeOutput videoFormat](self->super._output, "videoFormat", a3, a4.x, a4.y), "width");
  v55.i32[1] = -[BWVideoFormat height](-[BWNodeOutput videoFormat](self->super._output, "videoFormat"), "height");
  FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v55, self->_rotationDegrees);
  v13 = v55.i32[0];
  if (BYTE2(self->_blackFilledBorderRectsBySurfaceID))
    v14 = a6;
  else
    v14 = 0;
  os_unfair_lock_lock(&self->_configurationLock);
  v15 = BYTE3(self->_blackFilledBorderRectsBySurfaceID);
  primaryCameraAspectRatio = 0.999;
  if (a5 < 0.999 && v15 != 0)
    goto LABEL_25;
  if (!BYTE3(self->_blackFilledBorderRectsBySurfaceID))
  {
    if (a5 <= 0.0)
    {
      if (BYTE1(self->_lastInputPTS.epoch))
      {
        if (v14)
          v19 = 0;
        else
          v19 = BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) == 0;
        if (!v19)
          goto LABEL_25;
      }
      else if (v14)
      {
        goto LABEL_25;
      }
      primaryCameraAspectRatio = self->_primaryCameraAspectRatio;
      if (primaryCameraAspectRatio == a3 || !BYTE4(self->_narrowerCameraFoVFillsOverCapture.name))
        goto LABEL_10;
    }
LABEL_25:
    v18 = 1;
    goto LABEL_26;
  }
LABEL_10:
  if (BYTE5(self->_narrowerCameraFoVFillsOverCapture.name))
  {
    LOBYTE(primaryCameraAspectRatio) = BYTE6(self->_narrowerCameraFoVFillsOverCapture.name);
    v18 = v15 == 0;
    if ((double)*(unint64_t *)&primaryCameraAspectRatio > a3)
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
LABEL_26:
  v20 = a3 >= 1.33323333 && v18;
  if (BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) != v20)
    BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) = v20;
  v54 = (void *)objc_msgSend((id)CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (!v14)
  {
    v23 = (char *)&self->_trueVideoHDRtoSDRBlendRamp + 1;
    v24 = LOBYTE(self->_trueVideoHDRtoSDRBlendRamp) != 0;
LABEL_37:
    v27 = v14;
    if (v20)
    {
      if (BYTE3(self->_blackFilledBorderRectsBySurfaceID))
      {
        v21 = *(double *)&self->_superWideSensorCenterOffsetEnabled;
        if (v21 > a5)
        {
          if (*v23)
          {
            if (self->_transitionReferenceOpacityRamp)
              v24 = 1;
            if (!v24)
            {
              v28 = a7;
              if (BYTE4(self->_blackFilledBorderRectsBySurfaceID))
                v29 = 7;
              else
                v29 = 12;
              v30 = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("TrueVideoHDRtoSDRTransitionRamp"));
              self->_transitionReferenceOpacityRamp = v30;
              LODWORD(v31) = 1045220557;
              LODWORD(v32) = 1.0;
              v33 = v29;
              a7 = v28;
              -[BWRamp startRampFrom:to:iterations:shape:](v30, "startRampFrom:to:iterations:shape:", v33, 0, v32, v31);
            }
          }
        }
      }
    }
    goto LABEL_65;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(v14);
  if (ImageBuffer)
    IsHDR = BWPixelBufferIsHDR(ImageBuffer);
  else
    IsHDR = 0;
  v23 = (char *)&self->_trueVideoHDRtoSDRBlendRamp + 1;
  v25 = BYTE1(self->_trueVideoHDRtoSDRBlendRamp);
  v26 = objc_msgSend((id)CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E0D088F8], 0), "intValue");
  v24 = v26 > 2;
  LOBYTE(self->_trueVideoHDRtoSDRBlendRamp) = v26 > 2;
  if (*(_QWORD *)&self->_allowEdgeInsetDuringTrueVideoTransitions)
    goto LABEL_37;
  v34 = IsHDR;
  if (v25)
    v34 = 0;
  if (*(_QWORD *)&self->_transitionReferenceLearnedCoefficientsSampleBufferApplyCount || v26 > 2 || v34)
    goto LABEL_37;
  v35 = a7;
  *(_QWORD *)&self->_allowEdgeInsetDuringTrueVideoTransitions = CFRetain(v14);
  *(_QWORD *)&self->_transitionReferenceLearnedCoefficientsSampleBufferApplyCount = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("TrueVideoTransitionOpacityRamp"));
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v14, 0x1E495B358);
  if (LOBYTE(self->_zoomPIPMinimumUIZoomFactor) && AttachedMedia)
  {
    transitionReferenceSampleBuffer = self->_transitionReferenceSampleBuffer;
    self->_transitionReferenceSampleBuffer = AttachedMedia;
    CFRetain(AttachedMedia);
    if (transitionReferenceSampleBuffer)
      CFRelease(transitionReferenceSampleBuffer);
    LODWORD(self->_transitionReferenceLearnedCoefficientsSampleBuffer) = 0;
  }
  if (BYTE3(self->_blackFilledBorderRectsBySurfaceID))
    v38 = 147.0;
  else
    v38 = 166.0;
  v39 = objc_msgSend((id)CMGetAttachment(v14, CFSTR("TrueVideoTransitionLargeSphereTravelDetected"), 0), "BOOLValue");
  if (BYTE4(self->_blackFilledBorderRectsBySurfaceID)
    || (v44 = v39, objc_msgSend(v54, "isEqual:", *MEMORY[0x1E0D05A38])))
  {
    HIDWORD(v46) = 1072364778;
    v45 = v38 * 0.843373494;
    *(float *)&v40 = v45;
  }
  else if (v44)
  {
    *(float *)&v40 = v38 + -4.0;
  }
  else
  {
    *(float *)&v40 = v38;
  }
  a7 = v35;
  LODWORD(v42) = 981668463;
  LODWORD(v43) = 1114636288;
  LODWORD(v45) = 1.0;
  LODWORD(v46) = 0;
  LODWORD(v41) = 24.0;
  objc_msgSend(*(id *)&self->_transitionReferenceLearnedCoefficientsSampleBufferApplyCount, "startSpringRampFrom:to:withTension:friction:snapFraction:frameRate:", v45, v46, v40, v41, v42, v43);
  v27 = v14;
LABEL_65:
  v47 = (x + -0.5) * (double)v13;
  v48 = BYTE3(self->_blackFilledBorderRectsBySurfaceID);
  if (v27)
  {
    p_configurationLock = &self->_configurationLock;
    if (BYTE3(self->_blackFilledBorderRectsBySurfaceID))
    {
      if (objc_msgSend(v54, "isEqual:", *MEMORY[0x1E0D05A38]))
      {
        v50 = (void *)CMGetAttachment(v27, CFSTR("TotalZoomFactor"), 0);
        if (v50)
        {
          objc_msgSend(v50, "floatValue");
          v52 = v51;
        }
        else
        {
          v52 = 1.0;
        }
        v21 = *(double *)&self->_forceBlackFillBorderEnabled / v52;
        *(double *)&self->_forceBlackFillBorderEnabled = v21;
      }
      v48 = BYTE3(self->_blackFilledBorderRectsBySurfaceID);
    }
  }
  else
  {
    p_configurationLock = &self->_configurationLock;
  }
  if (v48
    || !BYTE4(self->_narrowerCameraFoVFillsOverCapture.name)
    || (v21 = *(double *)&self->_superWideSensorCenterOffsetEnabled, v21 <= 0.0)
    || v21 >= a5
    || (v21 = self->_primaryCameraAspectRatio, v21 >= a3))
  {
    if (BYTE5(self->_narrowerCameraFoVFillsOverCapture.name))
    {
      LOBYTE(v21) = BYTE6(self->_narrowerCameraFoVFillsOverCapture.name);
      if ((double)*(unint64_t *)&v21 > a3)
        BYTE5(self->_narrowerCameraFoVFillsOverCapture.name) = 0;
    }
  }
  else
  {
    BYTE5(self->_narrowerCameraFoVFillsOverCapture.name) = 1;
    BYTE6(self->_narrowerCameraFoVFillsOverCapture.name) = a3 != 0.0;
  }
  *(double *)&self->_superWideSensorCenterOffsetEnabled = a5;
  self->_primaryCameraAspectRatio = a3;
  self->_primaryCaptureRectCenterX = x;
  self->_primaryCaptureRectCenterXPixelOffset = (int)v47;
  os_unfair_lock_unlock(p_configurationLock);
  if (a7)
  {
    objc_msgSend(*(id *)&self->_superMacroEdgeFeatheringShowBlurMask, "enqueueFencedAnimation:", +[BWPreviewStitcherFencedAnimationInfo fencedAnimationInfoWithAspectRatio:centerX:centerXPixelOffset:fencePortSendRight:](BWPreviewStitcherFencedAnimationInfo, "fencedAnimationInfoWithAspectRatio:centerX:centerXPixelOffset:fencePortSendRight:", (int)v47, a7, a3, x));
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      objc_msgSend(*(id *)&self->_superMacroEdgeFeatheringShowBlurMask, "count");
      objc_msgSend(a7, "port");
      kdebug_trace();
    }
    if (LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor))
      LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor) = 0;
    -[BWPreviewStitcherNode _restitchAndEmitLastInputForAspectAndCenterChange]((uint64_t)self);
  }
}

- (double)trueVideoTransitionPercentComplete
{
  os_unfair_lock_s *p_configurationLock;
  double v4;

  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  v4 = *(double *)&self->_superWideSensorCenterOffsetEnabled;
  os_unfair_lock_unlock(p_configurationLock);
  return v4;
}

- (opaqueCMSampleBuffer)trueVideoTransitionReferenceSampleBuffer
{
  os_unfair_lock_s *p_configurationLock;
  const void *v4;
  void *v5;

  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  v4 = *(const void **)&self->_featherEdgesForOpacityRamp;
  if (v4)
    v5 = (void *)CFRetain(v4);
  else
    v5 = 0;
  os_unfair_lock_unlock(p_configurationLock);
  return (opaqueCMSampleBuffer *)v5;
}

- (void)setDisplaysWidestCameraOnly:(BOOL)a3
{
  os_unfair_lock_s *p_configurationLock;

  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  self->_displaysWidestCameraOnly = a3;
  os_unfair_lock_unlock(p_configurationLock);
}

- (void)rampToAdditionalZoomFactor:(double)a3 momentMovieRecordingRecenteringEnabled:(BOOL)a4
{
  os_unfair_lock_s *p_configurationLock;
  void *epoch;
  double v9;
  float v10;
  uint64_t v11;

  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  epoch = (void *)self->_additionalZoomFactorSpringStartPTS.epoch;
  if (*(float *)&self->_lastRenderTime >= a3)
    v9 = 22.0;
  else
    v9 = 24.0;
  objc_msgSend((id)self->_additionalZoomFactorSpringStartPTS.epoch, "setTension:", dbl_1A32A2980[*(float *)&self->_lastRenderTime < a3]);
  objc_msgSend(epoch, "setFriction:", v9);
  objc_msgSend(epoch, "resetWithInput:initialOutput:initialVelocity:convergedSpeed:", 1.0, 0.0, 0.0, 0.001);
  HIDWORD(self->_lastRenderTime) = self->_lastRenderTime;
  v10 = a3;
  *(float *)&self->_lastRenderTime = v10;
  v11 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_additionalZoomFactor = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)&self->_additionalZoomFactorSpringStartPTS.timescale = *(_QWORD *)(v11 + 16);
  LOBYTE(self->_fencedAnimationQueue) = a4;
  os_unfair_lock_unlock(p_configurationLock);
}

- (void)setStoppingForModeSwitch:(BOOL)a3 delayedEndOfDataEnabled:(BOOL)a4 ispFastSwitchEnabled:(BOOL)a5 smartStyleRenderingEnabledInTrueVideoGraph:(BOOL)a6
{
  _BOOL4 v6;
  BOOL v8;
  BOOL v10;

  v6 = a4;
  self->_stoppingForModeSwitch = a3;
  BYTE1(self->_narrowerCameraFoVFillsOverCapture.name) = a4;
  BYTE3(self->_narrowerCameraFoVFillsOverCapture.name) = a5;
  LOBYTE(self->_zoomPIPMinimumUIZoomFactor) = a6;
  if (LOBYTE(self->_lastInputPTS.epoch))
    v8 = !a3;
  else
    v8 = 1;
  if (!v8 && (BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) || a4))
    -[BWPreviewStitcherNode _setOverCaptureStatus:]((id *)&self->super.super.isa, 0);
  if (!BYTE3(self->_blackFilledBorderRectsBySurfaceID))
  {
    if (BYTE4(self->_narrowerCameraFoVFillsOverCapture.name))
      v10 = 0;
    else
      v10 = !v6;
    if (!v10)
      LOBYTE(self->_fencedAnimationQueue) = 1;
  }
}

- (void)markDelayedEndOfData
{
  id v3;

  if (BYTE1(self->_narrowerCameraFoVFillsOverCapture.name))
  {
    if (BYTE2(self->_narrowerCameraFoVFillsOverCapture.name))
    {
      v3 = +[BWNodeEndOfDataMessage newMessage](BWNodeEndOfDataMessage, "newMessage");
      -[BWNodeConnection consumeMessage:fromOutput:](-[BWNodeInput connection](self->super._input, "connection"), "consumeMessage:fromOutput:", v3, -[BWNodeConnection output](-[BWNodeInput connection](self->super._input, "connection"), "output"));

    }
    else
    {
      BYTE2(self->_narrowerCameraFoVFillsOverCapture.name) = 1;
    }
  }
}

- (BOOL)previewTapRegistered
{
  return self->_zoomPIPOverlayEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (BOOL)flipHorizontal
{
  return self->_flipHorizontal;
}

- (BOOL)flipVertical
{
  return self->_flipVertical;
}

- (double)primaryCameraAspectRatio
{
  os_unfair_lock_s *p_configurationLock;
  double primaryCameraAspectRatio;

  p_configurationLock = &self->_configurationLock;
  os_unfair_lock_lock(&self->_configurationLock);
  primaryCameraAspectRatio = self->_primaryCameraAspectRatio;
  os_unfair_lock_unlock(p_configurationLock);
  return primaryCameraAspectRatio;
}

- (void)setPrimaryCaptureRectYInset:(double)a3
{
  self->_primaryCaptureRectYInset = a3;
}

- (double)primaryCaptureRectYInset
{
  return self->_primaryCaptureRectYInset;
}

- (double)primaryCaptureRectCenterX
{
  return self->_primaryCaptureRectCenterX;
}

- (BOOL)previewsWideBeforeSlaveStreamStarts
{
  return self->_previewsWideBeforeSlaveStreamStarts;
}

- (BOOL)generatesHistogram
{
  return self->_generatesHistogram;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (BOOL)superWideFallbackForMacroSceneEnabled
{
  return self->_superWideFallbackForMacroSceneEnabled;
}

- (void)setOverCaptureNotSupportedByDownstreamNodes:(BOOL)a3
{
  BYTE1(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (BOOL)overCaptureNotSupportedByDownstreamNodes
{
  return BYTE1(self->_blackFilledBorderRectsBySurfaceID);
}

- (BOOL)forceBlackFillBorderEnabled
{
  return (BOOL)self->_blackFilledBorderRectsBySurfaceID;
}

- (void)setRebuildingGraphForTrueVideoTransition:(BOOL)a3
{
  BYTE2(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (BOOL)rebuildingGraphForTrueVideoTransition
{
  return BYTE2(self->_blackFilledBorderRectsBySurfaceID);
}

- (void)setTrueVideoCaptureEnabled:(BOOL)a3
{
  BYTE3(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (BOOL)trueVideoCaptureEnabled
{
  return BYTE3(self->_blackFilledBorderRectsBySurfaceID);
}

- (void)setTrueVideoCaptureFormatIs4K:(BOOL)a3
{
  BYTE4(self->_blackFilledBorderRectsBySurfaceID) = a3;
}

- (BOOL)trueVideoCaptureFormatIs4K
{
  return BYTE4(self->_blackFilledBorderRectsBySurfaceID);
}

- (void)setTrueVideoCaptureAdditionalZoomFactor:(double)a3
{
  *(double *)&self->_forceBlackFillBorderEnabled = a3;
}

- (double)trueVideoCaptureAdditionalZoomFactor
{
  return *(double *)&self->_forceBlackFillBorderEnabled;
}

- (void)setWaitsForFencedUpdateBeforeFirstEmit:(BOOL)a3
{
  LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor) = a3;
}

- (BOOL)waitsForFencedUpdateBeforeFirstEmit
{
  return LOBYTE(self->_trueVideoCaptureAdditionalZoomFactor);
}

- (float)_wideBaseZoomFactorWithOverrideLocked
{
  float v2;

  if (!a1)
    return 0.0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 388));
  v2 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverride]((float *)a1);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 388));
  return v2;
}

- (float)wideFocusDistance
{
  return *(float *)&self->_wideFocusDistanceFarEnoughForStitching.enabled;
}

- (float)superWideFocusDistance
{
  return *(float *)&self->_superWideFocusDistanceFarEnoughForRegistration.enabled;
}

- (id)focusingDescription
{
  const __CFString *v3;
  void *v4;
  float v5;
  double v6;
  const char *v7;

  if (BYTE1(self->_wideFocusDistanceFarEnoughToUseTele.name))
    v3 = CFSTR(" T: One Shot");
  else
    v3 = &stru_1E4928818;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[BWPreviewStitcherNode wideFocusDistance](self, "wideFocusDistance");
  v6 = v5;
  if (LOBYTE(self->_wideFocusDistanceFarEnoughToUseTele.name))
    v7 = " One Shot";
  else
    v7 = "";
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("W: \t%.1fcm%s\t%@"), *(_QWORD *)&v6, v7, v3);
}

- (id)overCaptureStatusString
{
  uint64_t trueVideoCaptureAdditionalZoomFactor_high;

  trueVideoCaptureAdditionalZoomFactor_high = SHIDWORD(self->_trueVideoCaptureAdditionalZoomFactor);
  if (trueVideoCaptureAdditionalZoomFactor_high > 5)
    return 0;
  else
    return off_1E491F670[trueVideoCaptureAdditionalZoomFactor_high];
}

- (id)primaryCameraShortDisplayName
{
  void *v3;
  void *v4;
  const __CFString *v5;

  v3 = (void *)-[BWPreviewStitcherNode _primaryCameraPortType]((uint64_t)self);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[BWPreviewStitcherNode _displayStringForPortType:]((const __CFString *)self, v3);
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (Rec %@)"), v5, -[BWPreviewStitcherNode _displayStringForPortType:]((const __CFString *)self, self->_lastRecommendedMasterPortType));
}

- (const)_displayStringForPortType:(const __CFString *)result
{
  const char *v3;

  if (result)
  {
    if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D05A28]) & 1) != 0)
    {
      return CFSTR("SuperWide");
    }
    else if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
    {
      return CFSTR("Wide");
    }
    else if ((objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0D05A30]) & 1) != 0)
    {
      return CFSTR("Tele");
    }
    else
    {
      return (const __CFString *)BWPortTypeToDisplayString(a2, v3);
    }
  }
  return result;
}

- (BOOL)tooCloseFor1xStitching
{
  return !*(&self->_waitsForFencedUpdateBeforeFirstEmit + 1);
}

- (BOOL)tooCloseForSuperWideRegistration
{
  return !self->_superMacroRangeRegistrationTuningEnabled;
}

- (BOOL)centerRegistrationValid
{
  os_unfair_lock_s *p_shiftCorrectionsUpdateLock;
  int *v4;
  BOOL v5;

  if (!LOBYTE(self->_lastInputPTS.epoch))
    return 0;
  p_shiftCorrectionsUpdateLock = &self->_shiftCorrectionsUpdateLock;
  os_unfair_lock_lock(&self->_shiftCorrectionsUpdateLock);
  if (self->_lastNarrowerCameraIsTele)
    v4 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
  else
    v4 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
  v5 = *(&self->_generatesHistogram + *v4);
  os_unfair_lock_unlock(p_shiftCorrectionsUpdateLock);
  return v5;
}

- (id)wideFallbackDescription
{
  const __CFString *v3;
  void *v4;
  float v5;

  if (BYTE1(self->_wideFallbackRecenteringShiftOffset.y))
    v3 = CFSTR("Yes");
  else
    v3 = CFSTR("No");
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)&self->_wideFocusingOneShot, "currentValue");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ : %ld%%"), v3, llroundf((float)(v5 * 100.0) * flt_1A32A28C0[BYTE2(self->_wideFallbackRecenteringShiftOffset.y) == 0]));
}

- (id)previewRegistrationType
{
  if (-[BWPreviewRegistration previewRegistrationType](self->_registration, "previewRegistrationType") == 1)
    return CFSTR("AdaptiveCorrection");
  else
    return CFSTR("Vision");
}

- (id)nodeSubType
{
  return CFSTR("PreviewStitcher");
}

- (void)_preheatCIRenderingAsync
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  if (a1
    && *(unsigned __int8 *)(a1 + 1106) | *(unsigned __int8 *)(a1 + 1040)
    && !*(_QWORD *)(a1 + 928)
    && !*(_BYTE *)(a1 + 936))
  {
    *(_QWORD *)(a1 + 928) = dispatch_group_create();
    *(_BYTE *)(a1 + 936) = 1;
    v2 = *(NSObject **)(a1 + 928);
    v3 = *(NSObject **)(a1 + 920);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__BWPreviewStitcherNode__preheatCIRenderingAsync__block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = a1;
    dispatch_group_async(v2, v3, block);
  }
}

void __53__BWPreviewStitcherNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  -[BWPreviewStitcherNode _restitchAndEmitLastInputForAspectAndCenterChange](*(_QWORD *)(a1 + 32));
}

- (double)_computeBravoWideToTeleShiftFromWideSampleBuffer:(uint64_t)a3 teleSampleBuffer:
{
  void *v6;
  void *v7;
  int v8;
  float v9;
  float v10;
  int *v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  int v19;
  float v20;
  int *v21;
  double *v22;
  float v23;
  float v24;
  float v25;
  float v26;

  if (!a1)
    return 0.0;
  v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D05A28]);
  if (v8)
  {
    v9 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverrideLocked](a1);
    v10 = *(float *)(a1 + 156);
    v11 = &OBJC_IVAR___BWPreviewStitcherNode__superWideNondisruptiveSwitchingScaleFactor;
  }
  else
  {
    v12 = *(float *)(a1 + 248);
    if (v12 <= 0.0)
    {
      v9 = *(float *)(a1 + 164);
      v10 = *(float *)(a1 + 160);
    }
    else
    {
      v10 = *(float *)(a1 + 160);
      v9 = v12 * v10;
    }
    v11 = &OBJC_IVAR___BWPreviewStitcherNode__wideNondisruptiveSwitchingScaleFactor;
  }
  objc_msgSend(*(id *)(a1 + 416), "computeCameraShiftForWiderCamera:narrowerCamera:widerToNarrowerCameraScale:", target, a3, (float)(v9 / (float)(v10 * *(float *)(a1 + *v11))));
  if (*(_BYTE *)(a1 + 264))
    v15 = v14;
  else
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (*(_BYTE *)(a1 + 264))
    v16 = v13;
  else
    v16 = *MEMORY[0x1E0C9D538];
  objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
  if (v17 != 0.0)
  {
    v16 = v16 / v17;
    v15 = v15 / v17;
  }
  if (v17 <= 1.0 || *(_BYTE *)(a1 + 1560) == 0)
    v19 = 0;
  else
    v19 = v8;
  if (v19 == 1)
  {
    v16 = *(double *)(a1 + 272);
    v15 = *(double *)(a1 + 280);
  }
  v20 = *(float *)(a1 + 260);
  v21 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleBravoShift;
  if (v8)
    v21 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideBravoShift;
  v22 = (double *)(a1 + *v21);
  v23 = v16;
  v24 = *v22;
  *v22 = BWModifiedMovingAverage(v23, v24, v20);
  v25 = v15;
  v26 = v22[1];
  v22[1] = BWModifiedMovingAverage(v25, v26, v20);
  return *v22;
}

- (uint64_t)_updateShiftCorrectionsAsyncFromComputedShift:(void *)a3 byRegisteringWide:(uint64_t)a4 tele:(double)a5 macroTransitionType:(double)a6
{
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  float v17;
  float v18;
  float v19;
  float v20;
  int v21;
  int v22;
  int v23;
  _BOOL8 v24;
  double v25;
  void *v26;
  _QWORD v27[7];
  int v28;
  int v29;
  char v30;
  CMTime v31;
  CMTime time;

  if (result)
  {
    v11 = result;
    v12 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v13 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v14 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D05A28]);
    v16 = v15;
    if (v15)
    {
      v17 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverrideLocked](v11);
    }
    else
    {
      v18 = *(float *)(v11 + 248);
      if (v18 <= 0.0)
      {
        v20 = *(float *)(v11 + 164);
        v19 = *(float *)(v11 + 160);
      }
      else
      {
        v19 = *(float *)(v11 + 160);
        v20 = v18 * v19;
      }
      v17 = v20 / (float)(v19 * *(float *)(v11 + 224));
    }
    objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
    v22 = v21;
    v23 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, v12, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), "intValue");
    if (*(_BYTE *)(v11 + 1233))
      v24 = *(_BYTE *)(v11 + 1129) == 0;
    else
      v24 = 1;
    v25 = v17;
    if (!*(_BYTE *)(v11 + 424))
    {
      memset(&v31, 0, sizeof(v31));
      CMSampleBufferGetPresentationTimeStamp(&v31, (CMSampleBufferRef)a3);
      if (*MEMORY[0x1E0CA1FC0] == 1)
      {
        time = v31;
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
      objc_msgSend(*(id *)(v11 + 416), "allocateResourcesAsynchronouslyWithVideoFormat:", objc_msgSend(*(id *)(v11 + 8), "videoFormat"));
      *(_BYTE *)(v11 + 424) = 1;
    }
    v26 = *(void **)(v11 + 416);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __114__BWPreviewStitcherNode__updateShiftCorrectionsAsyncFromComputedShift_byRegisteringWide_tele_macroTransitionType___block_invoke;
    v27[3] = &unk_1E491F650;
    v30 = v16;
    v27[4] = v11;
    v28 = v22;
    *(double *)&v27[5] = a5;
    *(double *)&v27[6] = a6;
    v29 = v23;
    return objc_msgSend(v26, "registerWiderCamera:narrowerCamera:widerToNarrowerCameraScale:isMacroScene:macroTransitionType:completionHandler:", target, a3, v24, a4, v27, v25);
  }
  return result;
}

- (CMSampleBufferRef)_newStitchedSampleBufferFromWide:(opaqueCMSampleBuffer *)a3 tele:(float64x2_t *)a4 wideRegionsShifts:(CGRect *)a5 teleShift:(double *)a6 primaryCaptureRectOut:(double *)a7 primaryCaptureRectBeforeCroppingOut:(_QWORD *)a8 centerWideShiftOut:(float64_t)a9 currentFrameRate:(float64_t)a10 inputCropRectOut:(float)a11
{
  uint64_t v11;
  uint64_t v16;
  int v17;
  CMSampleBufferRef v18;
  __CVBuffer *v19;
  void *v20;
  float v21;
  const __CFString *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  float Seconds;
  int v30;
  int v31;
  BOOL v32;
  int v33;
  double v34;
  float v35;
  float v36;
  int v37;
  CGPoint *v38;
  uint64_t v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  void *v52;
  int v53;
  void **v54;
  float v55;
  float v56;
  float v57;
  uint64_t v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  float v65;
  float v66;
  float v67;
  void *v68;
  double v69;
  float v70;
  float v71;
  float v72;
  _BOOL4 v73;
  int v74;
  int *v75;
  double v76;
  double v77;
  double v78;
  float v79;
  int *v80;
  void *v81;
  float v82;
  float v83;
  double v84;
  __CVBuffer *v85;
  BOOL v86;
  double v87;
  double v88;
  double v89;
  float v90;
  double v91;
  double v92;
  int v93;
  float64x2_t v94;
  unsigned int v95;
  unsigned int v96;
  float64x2_t v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  const __CFDictionary *v108;
  const __CFDictionary *v109;
  CGPoint v110;
  void *v111;
  int *v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat width;
  CGFloat height;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  double MaxX;
  double v122;
  double v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  double v129;
  double v130;
  double MinY;
  double MaxY;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  CGFloat v138;
  double v139;
  int v140;
  float v141;
  char v142;
  double v143;
  void *v144;
  double v145;
  float64x2_t v146;
  float v147;
  double v148;
  double v149;
  float64x2_t v150;
  float64x2_t v151;
  double v152;
  float64x2_t v153;
  unsigned int v154;
  float64x2_t v155;
  float64x2_t v156;
  unsigned int v157;
  float64x2_t v158;
  float v159;
  double v160;
  double v161;
  unsigned int v162;
  unsigned int v163;
  double v164;
  float64x2_t v165;
  double v166;
  uint64_t v167;
  float v168;
  CGFloat v169;
  CGFloat v170;
  float v171;
  float v172;
  CGFloat v173;
  CGFloat v174;
  CGFloat v175;
  CGFloat v176;
  float v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  CGFloat v181;
  double v182;
  void *v183;
  void *v184;
  float v185;
  float v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  float v192;
  int v193;
  float v194;
  float v195;
  float v196;
  float v197;
  float v198;
  float v199;
  float v200;
  CGFloat v201;
  CGFloat v202;
  double v203;
  double v204;
  double v205;
  CGFloat v206;
  double v207;
  CGFloat v208;
  double v209;
  CGFloat v210;
  float v211;
  _BOOL4 v212;
  double v213;
  _BOOL4 v214;
  double v215;
  CGFloat v216;
  CGFloat v217;
  double v218;
  BOOL v219;
  CGFloat v220;
  CGFloat v221;
  CGFloat v222;
  double v223;
  CGFloat v224;
  CGFloat v225;
  double v226;
  CGFloat v227;
  CGFloat v228;
  double v229;
  double v230;
  CGFloat v231;
  float v232;
  double v233;
  CGFloat v234;
  CGFloat v235;
  CGFloat v236;
  int v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  __int128 v244;
  double v245;
  double v246;
  __CVBuffer *v247;
  double v248;
  double v249;
  double v250;
  double v251;
  CFDictionaryRef DictionaryRepresentation;
  double v253;
  double v254;
  double v255;
  double v256;
  size_t v257;
  float v258;
  double v259;
  CGFloat v260;
  CGFloat v261;
  CGFloat v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  int v270;
  double v271;
  double v272;
  double v273;
  int v274;
  int v275;
  int v276;
  double v277;
  CGFloat v278;
  double v279;
  CGFloat v280;
  double v281;
  CGFloat v282;
  float v283;
  int a_high;
  int a_low;
  int v286;
  int v287;
  double v288;
  double v289;
  double v290;
  CGFloat v291;
  CGFloat v292;
  double v293;
  double v294;
  double v295;
  float v296;
  int v297;
  float v298;
  int v299;
  float v300;
  double v301;
  float v302;
  double v303;
  CGFloat v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  CGFloat v318;
  CGFloat v319;
  CGFloat v320;
  CGFloat v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  float v331;
  int v332;
  double v333;
  double v334;
  double v335;
  double v336;
  CGFloat v337;
  CGFloat v338;
  double v339;
  double v340;
  float v341;
  float v342;
  double v343;
  double v344;
  double v345;
  CGFloat v346;
  CGFloat MidY;
  double v348;
  CGFloat v349;
  double v350;
  CGFloat v351;
  double v352;
  CGFloat v353;
  CGFloat v354;
  double v355;
  double v356;
  double v357;
  double v358;
  CGFloat v359;
  CGFloat v360;
  CGFloat v361;
  int v362;
  int *v363;
  double v364;
  CGFloat v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  double v372;
  _BOOL4 v373;
  void *v374;
  int *v375;
  double v376;
  double v377;
  double v378;
  double v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double v384;
  double v385;
  double v386;
  CGFloat v387;
  CGFloat v388;
  CGFloat v389;
  CGFloat v390;
  _BOOL4 v391;
  BOOL v392;
  float v393;
  void *v394;
  float v395;
  float v396;
  char v397;
  float v398;
  int v399;
  int v400;
  int v401;
  int *v402;
  char v403;
  double v404;
  int v405;
  CGFloat v406;
  CGFloat v407;
  CGFloat v408;
  double b;
  double c;
  double d;
  CGFloat v412;
  double v413;
  double v414;
  double v415;
  double v416;
  double v417;
  float v418;
  _BOOL4 v419;
  float v420;
  int v421;
  double v422;
  float v423;
  double v424;
  int v425;
  double v426;
  double v427;
  double v428;
  int v429;
  double v430;
  double v431;
  double v432;
  double v433;
  CGFloat v434;
  CGFloat v435;
  CGFloat v436;
  int v437;
  int v438;
  int v439;
  double v440;
  CGFloat v441;
  CGFloat v442;
  CGFloat v443;
  __int128 v444;
  double v445;
  double v446;
  CGFloat v447;
  double v448;
  CGFloat v449;
  double v450;
  CGFloat v451;
  int v452;
  int v453;
  int v454;
  int v455;
  int v456;
  double v457;
  double v458;
  CGFloat v459;
  double v460;
  CGFloat v461;
  double v462;
  CGFloat v463;
  double v464;
  CGFloat v465;
  double v466;
  CGFloat v467;
  CGFloat v468;
  CGFloat v469;
  CGFloat v470;
  CGFloat v471;
  CGFloat v472;
  CGFloat v473;
  int v474;
  int v475;
  int v476;
  double v477;
  CGFloat v478;
  double v479;
  CGFloat v480;
  double v481;
  CGFloat v482;
  double v483;
  CGFloat v484;
  CGFloat v485;
  CGFloat v486;
  CGFloat v487;
  double v488;
  double v489;
  double v490;
  double v491;
  double v492;
  float v493;
  double v494;
  CGFloat v495;
  CGFloat v496;
  CGFloat v497;
  int v498;
  int v499;
  int v500;
  double v501;
  CGFloat v502;
  CGFloat v503;
  CGFloat v504;
  double v505;
  double v506;
  CGFloat v507;
  double v508;
  CGFloat v509;
  double v510;
  CGFloat v511;
  double v512;
  double v513;
  CGFloat v514;
  double v515;
  double v516;
  float v517;
  float v518;
  double v519;
  double v520;
  float v521;
  double v522;
  double v523;
  double v524;
  double v525;
  int v526;
  double v527;
  double v528;
  double v529;
  double v530;
  CGFloat v531;
  CGFloat v532;
  CGFloat v533;
  double v534;
  CGFloat v535;
  CGFloat v536;
  CGFloat v537;
  float v538;
  double v539;
  float v540;
  float v541;
  float v542;
  float v543;
  float v544;
  float v545;
  float v546;
  float v547;
  float v548;
  __int128 v549;
  CGFloat v550;
  CGFloat v551;
  CGFloat v552;
  CGFloat v553;
  __CVBuffer *v554;
  __CVBuffer *v555;
  __CVBuffer *v556;
  opaqueCMSampleBuffer *v557;
  unint64_t v558;
  CGFloat v559;
  CGFloat v560;
  CGFloat v561;
  CGFloat v562;
  CGFloat v563;
  double v564;
  double v565;
  double v566;
  double v567;
  int v568;
  double v569;
  double v570;
  int v571;
  uint64_t v572;
  double v573;
  double v574;
  double v575;
  double v576;
  double v577;
  int v578;
  double v579;
  double v580;
  CGFloat v581;
  double v582;
  CGFloat v583;
  double v584;
  CGFloat v585;
  double v586;
  double v587;
  double v588;
  double v589;
  CGFloat v590;
  double v591;
  double v592;
  CGFloat v593;
  double v594;
  CGFloat v595;
  int v596;
  CGFloat v597;
  CGFloat v598;
  double v599;
  CGFloat v600;
  CGFloat v601;
  double v602;
  double v603;
  double v604;
  double v605;
  double v606;
  double v607;
  double v608;
  double v609;
  double v610;
  double v611;
  double v612;
  double v613;
  double v614;
  double v615;
  uint64_t v616;
  int v617;
  double v618;
  double v619;
  uint64_t v620;
  CGFloat v621;
  void *v622;
  CGFloat v623;
  __CVBuffer *v624;
  uint64_t v625;
  void *v626;
  float v627;
  float v628;
  double v629;
  CGFloat v630;
  CGFloat v631;
  CGFloat v632;
  CGFloat v633;
  CGFloat v634;
  CGFloat v635;
  int v636;
  int v637;
  int v638;
  double v639;
  CGFloat v640;
  double v641;
  CGFloat v642;
  double v643;
  CGFloat v644;
  void *v645;
  const void *v646;
  int v647;
  float v648;
  float v649;
  double v650;
  double v651;
  double v652;
  float v653;
  __int128 v654;
  double v655;
  CGFloat v656;
  CGFloat v657;
  CGFloat v658;
  CGFloat v659;
  CGFloat v660;
  void *v661;
  float v662;
  float v663;
  __int128 v664;
  double v665;
  CGFloat v666;
  double v667;
  CGFloat v668;
  CGFloat v669;
  CGFloat v670;
  uint64_t v671;
  void *v672;
  float v673;
  void *v674;
  void *v675;
  float v676;
  float v677;
  void *v678;
  void *v679;
  float v680;
  double v681;
  double v682;
  CGFloat v683;
  double v684;
  CGFloat v685;
  double v686;
  CGFloat v687;
  double v688;
  double v689;
  double v690;
  double v691;
  double v692;
  double v693;
  double v694;
  double v695;
  double v696;
  double v697;
  CGFloat v698;
  double v699;
  CGFloat v700;
  double v701;
  double v702;
  float v703;
  CGFloat v704;
  double v705;
  double v706;
  double v707;
  int v708;
  double v709;
  int v710;
  float v711;
  float v712;
  float v713;
  float v714;
  double v715;
  double v716;
  double v717;
  __int128 v718;
  double v719;
  CGFloat v720;
  double v721;
  CGFloat v722;
  CGFloat v723;
  CGFloat v724;
  void *v725;
  float v726;
  double v727;
  float v728;
  const void *v729;
  __int128 v730;
  double v731;
  CGFloat v732;
  double v733;
  CGFloat v734;
  CGFloat v735;
  CGFloat v736;
  double v737;
  __IOSurface *IOSurface;
  float v739;
  double v740;
  CGFloat v741;
  double v742;
  CGFloat v743;
  double v744;
  CGFloat v745;
  CGFloat v746;
  void *v747;
  int v748;
  __IOSurface *v749;
  uint64_t ID;
  void *v751;
  CFDictionaryRef v752;
  opaqueCMSampleBuffer *v753;
  __CVBuffer *v754;
  __CVBuffer *v755;
  const __CFString *v756;
  CFTypeRef v757;
  float v758;
  float v759;
  double v760;
  double v761;
  double v762;
  uint64_t v763;
  float v764;
  float v765;
  float v766;
  int v767;
  int v768;
  float v769;
  double v770;
  const __CFString *v771;
  uint64_t v772;
  void *v773;
  uint64_t v774;
  double v775;
  double v776;
  double v777;
  double v778;
  double v779;
  double v780;
  CGSize v781;
  CGSize v782;
  double v783;
  double v784;
  double v785;
  double v786;
  double v787;
  double v788;
  double v789;
  double v790;
  double v791;
  double v792;
  double v793;
  double v794;
  double v795;
  double v796;
  double v797;
  size_t v798;
  float64x2_t v799;
  float64x2_t v800;
  CFDictionaryRef v801;
  void *v802;
  double v803;
  __CFString **v804;
  CGSize v805;
  double v806;
  double v807;
  double v808;
  double v809;
  double v810;
  double v811;
  double v812;
  double v813;
  double v814;
  double v815;
  double v816;
  double v817;
  double v818;
  double v819;
  double v820;
  double v821;
  double v822;
  double v823;
  uint64_t v824;
  uint64_t v825;
  uint64_t v826;
  uint64_t v827;
  int v828;
  double v829;
  double v830;
  double v831;
  double v832;
  double v833;
  double v834;
  double v835;
  unint64_t v836;
  double v837;
  CGFloat v838;
  CGFloat v839;
  CGFloat v840;
  double v841;
  double v842;
  double v843;
  double v844;
  double v845;
  double v846;
  double v847;
  uint64_t v848;
  uint64_t v849;
  uint64_t v850;
  uint64_t v851;
  int v852;
  float v853;
  CGFloat v854;
  double v855;
  double v856;
  double v857;
  double v858;
  double v859;
  double v860;
  double v861;
  _BOOL4 v863;
  CGFloat v864;
  float v865;
  double v866;
  double v867;
  double v868;
  double v869;
  float v870;
  double v871;
  double v872;
  float v873;
  float v874;
  int v875;
  int v876;
  double v877;
  uint64_t v878;
  void *v881;
  const __CFDictionary *v882;
  CGFloat v883;
  CGFloat v884;
  float v885;
  uint64_t v886;
  double v887;
  CGFloat v888;
  CGSize v889;
  CGPoint v890;
  double v891;
  double v892;
  double v893;
  CGPoint rect2;
  CGFloat rect2a;
  CGFloat rect2b;
  const __CFString *v897;
  double v898;
  double v899;
  double v900;
  double v901;
  CGFloat v902;
  double v903;
  void *v904;
  float v905;
  CGFloat v906;
  void *v907;
  CGFloat keyb;
  double key;
  double keya;
  float64x2_t v911;
  double v912;
  double v913;
  double v914;
  double v915;
  double v916;
  double v917;
  double v918;
  double v919;
  int v920;
  int v921;
  double v922;
  uint64_t v923;
  uint64_t v924;
  uint64_t v925;
  int v926;
  double v927;
  double v929;
  double v930;
  double v931;
  double v932;
  CGFloat v933;
  double v934;
  float v935;
  double v936;
  CGFloat v937;
  double v938;
  double v939;
  double v940;
  CGFloat v941;
  double v942;
  double v943;
  double v944;
  double v945;
  CGFloat v946;
  double v947;
  double v948;
  double v949;
  double v950;
  double v951;
  double y;
  double v953;
  CGFloat v954;
  double v955;
  double v956;
  CGFloat v957;
  int v958;
  double v959;
  CGFloat v960;
  CGFloat v961;
  CGFloat v962;
  double v963;
  double v964;
  double v965;
  double v966;
  double v967;
  double x;
  double v969;
  CGFloat v970;
  __CVBuffer *ImageBuffer;
  double v973;
  int v974;
  float64x2_t v975;
  CGFloat v976;
  CGFloat v977;
  float v978;
  double v979;
  CGFloat v980;
  double v981;
  float64x2_t v982;
  double v983;
  double v984;
  double v985;
  CGFloat v986;
  unsigned int v987;
  CGFloat v988;
  unsigned int v989;
  unsigned int v990;
  float v991;
  float v992;
  double v993;
  CGFloat v994;
  CGFloat v995;
  float v996;
  CGFloat v997;
  uint64_t v998;
  float64x2_t r2;
  CGFloat r2a;
  double r2b;
  double v1002;
  float64x2_t v1003;
  double MinX;
  CGFloat v1005;
  double v1006;
  double v1007;
  CGFloat v1008;
  double v1009;
  double v1010;
  double v1011;
  double v1012;
  double a;
  double v1014;
  __CVBuffer *v1015;
  float64x2_t v1016;
  CGFloat v1017;
  CGFloat v1018;
  CGFloat v1019;
  double v1020;
  double v1021;
  double v1022;
  double v1023;
  CGFloat v1024;
  double v1025;
  CGFloat v1026;
  double v1027;
  unint64_t v1028;
  opaqueCMSampleBuffer *v1029;
  void *v1030;
  double v1031;
  void *v1032;
  double v1033;
  float64x2_t r1a;
  float64x2_t r1f;
  float64x2_t r1g;
  float64x2_t r1h;
  CGFloat r1b;
  double r1c;
  double r1d;
  CGFloat r1e;
  CGRect v1043;
  CGSize v1044;
  __int128 v1045;
  CGRect rhs;
  CGAffineTransform propertyValueOut;
  CGRect v1048;
  CGPoint point;
  CGRect rect1;
  CGRect v1051;
  CGRect recta;
  CMTime time;
  CMSampleBufferRef v1054;
  int32x2_t v1055;
  CGRect v1056;
  CGRect v1057;
  CGRect v1058;
  CGRect v1059;
  CGRect v1060;
  CGRect v1061;
  CGRect v1062;
  CGRect v1063;
  CGRect v1064;
  CGRect v1065;
  CGRect v1066;
  CGRect v1067;
  CGRect v1068;
  CGRect v1069;
  CGRect v1070;
  CGRect v1071;
  CGRect v1072;
  CGRect v1073;
  CGRect v1074;
  CGRect v1075;
  CGRect v1076;
  CGRect v1077;
  CGRect v1078;
  CGRect v1079;
  CGRect v1080;
  CGRect v1081;
  CGRect v1082;
  CGRect v1083;
  CGRect v1084;
  CGRect v1085;
  CGRect v1086;
  CGRect v1087;
  CGRect v1088;
  CGRect v1089;
  CGRect v1090;
  CGRect v1091;
  CGRect v1092;
  CGRect v1093;
  CGRect v1094;
  CGRect v1095;
  CGRect v1096;
  CGRect v1097;
  CGRect v1098;
  CGRect v1099;
  CGRect v1100;
  CGRect v1101;
  CGRect v1102;
  CGRect v1103;
  CGRect v1104;
  CGRect v1105;
  CGRect v1106;
  CGRect v1107;
  CGRect v1108;
  CGRect v1109;
  CGRect v1110;
  CGRect v1111;
  CGRect v1112;
  CGRect v1113;
  CGRect v1114;
  CGRect v1115;
  CGRect v1116;
  CGRect v1117;
  CGRect v1118;
  CGRect v1119;
  CGRect v1120;
  CGRect v1121;
  CGRect v1122;
  CGRect v1123;
  CGRect v1124;
  CGRect v1125;
  CGRect v1126;
  CGRect v1127;
  CGRect v1128;
  CGRect v1129;
  CGRect v1130;
  CGRect v1131;
  CGRect v1132;
  CGRect v1133;
  CGRect v1134;
  CGRect v1135;
  CGRect v1136;
  CGRect v1137;
  CGRect v1138;
  CGRect v1139;
  CGRect v1140;
  CGRect v1141;
  CGRect v1142;
  CGRect v1143;
  CGRect v1144;
  CGRect v1145;
  CGRect v1146;
  CGRect v1147;
  CGRect v1148;
  CGRect v1149;
  CGRect v1150;
  CGRect v1151;
  CGRect v1152;
  CGRect v1153;
  CGRect v1154;
  CGRect v1155;
  CGRect v1156;
  CGRect v1157;
  CGRect v1158;
  CGRect v1159;
  CGRect v1160;
  CGRect v1161;
  CGRect v1162;
  CGRect v1163;
  CGRect v1164;
  CGRect v1165;
  CGRect v1166;
  CGRect v1167;
  CGRect v1168;
  CGRect v1169;
  CGRect v1170;
  CGRect v1171;
  CGRect v1172;
  CGRect v1173;
  CGRect v1174;
  CGRect v1175;
  CGRect v1176;
  CGRect v1177;
  CGRect v1178;
  CGRect v1179;
  CGRect v1180;
  CGRect v1181;
  CGRect v1182;
  CGRect v1183;
  CGRect v1184;
  CGRect v1185;
  CGRect v1186;
  CGRect v1187;
  CGRect v1188;
  CGRect v1189;
  CGRect v1190;
  CGRect v1191;
  CGRect v1192;
  CGRect v1193;
  CGRect v1194;
  CGRect v1195;
  CGRect v1196;
  CGRect v1197;

  if (!result)
    return result;
  v16 = (uint64_t)result;
  if (sbuf)
  {
    if (!*((_BYTE *)result + 394) || *((_BYTE *)result + 425) || *((_BYTE *)result + 818))
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
      v17 = 1;
    }
    else
    {
      v17 = 0;
      ImageBuffer = 0;
    }
    v18 = sbuf;
  }
  else
  {
    v17 = 0;
    ImageBuffer = 0;
    v18 = a3;
  }
  v1029 = a3;
  v1015 = CMSampleBufferGetImageBuffer(a3);
  v19 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "livePixelBufferPool"), "newPixelBuffer");
  *(_QWORD *)&v1043.origin.y = v19;
  v1055.i32[0] = CVPixelBufferGetWidth(v19);
  v1055.i32[1] = CVPixelBufferGetHeight(v19);
  FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v1055, *(_DWORD *)(v16 + 104));
  v1054 = 0;
  v20 = (void *)CMGetAttachment(v18, CFSTR("TotalZoomFactor"), 0);
  if (v20)
    objc_msgSend(v20, "floatValue");
  else
    v21 = 1.0;
  *(float *)&v1043.origin.x = v21;
  v22 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v1032 = (void *)CMGetAttachment(v1029, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v1030 = 0;
  if (v17)
    v1030 = (void *)CMGetAttachment(sbuf, v22, 0);
  if (v19)
    v23 = v1015 == 0;
  else
    v23 = 1;
  if (v23)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v554 = 0;
    v555 = 0;
    v556 = 0;
    v751 = 0;
    goto LABEL_668;
  }
  v1028 = (unint64_t)sbuf;
  v897 = v22;
  v958 = *(unsigned __int8 *)(v16 + 1501);
  os_unfair_lock_lock((os_unfair_lock_t)(v16 + 388));
  v24 = (void *)MEMORY[0x1A858DD40]();
  v25 = (void *)objc_msgSend(*(id *)(v16 + 1456), "dequeueFencedAnimation");
  if (v25)
  {
    v26 = v25;
    objc_msgSend(v25, "primaryCaptureAspectRatio");
    v28 = v27;
    v920 = objc_msgSend(v26, "primaryCaptureRectCenterXPixelOffset");
    *(_QWORD *)(v16 + 808) = (id)objc_msgSend(v26, "fencePortSendRight");
    v878 = objc_msgSend(v26, "fencePortGenerationCount");
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      objc_msgSend(*(id *)(v16 + 1456), "count");
      objc_msgSend(*(id *)(v16 + 808), "port");
      kdebug_trace();
    }
  }
  else
  {
    v878 = 0;
    v28 = *(double *)(v16 + 792);
    v920 = *(_DWORD *)(v16 + 136);
  }
  objc_autoreleasePoolPop(v24);
  v881 = *(void **)(v16 + 808);
  *(_QWORD *)(v16 + 808) = 0;
  v926 = *(_DWORD *)(v16 + 140);
  if ((objc_msgSend(*(id *)(v16 + 1088), "isCompleted") & 1) != 0)
    goto LABEL_33;
  if ((*(_BYTE *)(v16 + 1076) & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&propertyValueOut, v1029);
    *(_OWORD *)(v16 + 1064) = *(_OWORD *)&propertyValueOut.a;
    *(CGFloat *)(v16 + 1080) = propertyValueOut.c;
  }
  memset(&propertyValueOut, 0, 24);
  CMSampleBufferGetPresentationTimeStamp((CMTime *)&propertyValueOut, v1029);
  v1043.size = *(CGSize *)&propertyValueOut.a;
  v1044.width = propertyValueOut.c;
  rhs.origin = *(CGPoint *)(v16 + 1064);
  rhs.size.width = *(CGFloat *)(v16 + 1080);
  CMTimeSubtract(&time, (CMTime *)&v1043.size, (CMTime *)&rhs);
  Seconds = CMTimeGetSeconds(&time);
  v30 = FigCaptureRoundFloatToMultipleOf(1, Seconds * 60.0);
  v31 = objc_msgSend(*(id *)(v16 + 1088), "updateCount");
  v32 = __OFSUB__(v30, v31);
  v33 = v30 - v31;
  if (!((v33 < 0) ^ v32 | (v33 == 0)))
  {
    do
    {
      objc_msgSend(*(id *)(v16 + 1088), "update");
      --v33;
    }
    while (v33);
  }
  if (*(float *)(v16 + 1060) <= 0.0)
  {
LABEL_33:
    v36 = *(float *)(v16 + 1056);
  }
  else
  {
    objc_msgSend(*(id *)(v16 + 1088), "output");
    v35 = v34;
    if (v35 > 1.0)
      v35 = 1.0;
    if (v35 < 0.0)
      v35 = 0.0;
    v36 = *(float *)(v16 + 1060) + (float)((float)(*(float *)(v16 + 1056) - *(float *)(v16 + 1060)) * v35);
  }
  v992 = v36;
  v37 = *(unsigned __int8 *)(v16 + 1464);
  os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 388));
  v38 = (CGPoint *)MEMORY[0x1E0C9D538];
  if (v37
    && *(_BYTE *)(v16 + 1388)
    && (*(double *)(v16 + 1368) != *MEMORY[0x1E0C9D538]
     || *(double *)(v16 + 1376) != *(double *)(MEMORY[0x1E0C9D538] + 8)))
  {
    *(_OWORD *)(v16 + 1368) = *MEMORY[0x1E0C9D538];
    v40 = -[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v16, *(unsigned int *)(v16 + 1468), a11);
    v41 = *(float *)(v16 + 1384);
    if (objc_msgSend(*(id *)(v16 + 1352), "isRamping"))
    {
      objc_msgSend(*(id *)(v16 + 1352), "currentValue");
      v41 = v41 * *(float *)&v42;
    }
    LODWORD(v44) = 1065269330;
    LODWORD(v43) = 1.0;
    *(float *)&v42 = v41;
    objc_msgSend(*(id *)(v16 + 1352), "startRampFrom:to:iterations:shape:exponentialConvergenceFraction:", v40, 2, v42, v43, v44);
    if (!*(_BYTE *)(v16 + 1107) && (*(_BYTE *)(v16 + 1564) || *(_BYTE *)(v16 + 1561)))
    {
      if (*(_BYTE *)(v16 + 1563))
        *(float *)&v47 = 88.0;
      else
        *(float *)&v47 = 70.0;
      LODWORD(v49) = 981668463;
      LODWORD(v50) = 1114636288;
      LODWORD(v46) = 1.0;
      LODWORD(v48) = 17.0;
      *(float *)&v45 = v41;
      objc_msgSend(*(id *)(v16 + 1352), "startSpringRampFrom:to:withTension:friction:snapFraction:frameRate:", v45, v46, v47, v48, v49, v50);
    }
  }
  v51 = *MEMORY[0x1E0D06D00];
  v52 = (void *)objc_msgSend(v1032, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v53 = objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A30]);
  v54 = (void **)MEMORY[0x1E0D05A18];
  if (v53)
  {
    v55 = *(float *)(v16 + 164);
    v56 = *(float *)(v16 + 248);
    if (v56 <= 0.0)
      v57 = *(float *)(v16 + 164);
    else
      v57 = v56 * *(float *)(v16 + 160);
  }
  else
  {
    v57 = 1.0;
    v55 = 1.0;
    if (objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A18]))
    {
      v55 = *(float *)(v16 + 160) * *(float *)(v16 + 224);
      v57 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverride]((float *)v16);
    }
  }
  v886 = v51;
  v58 = objc_msgSend(v1030, "objectForKeyedSubscript:", v51);
  v59 = (_QWORD *)MEMORY[0x1E0D05A28];
  if (v1028 | v58)
  {
    v60 = *v54;
    v61 = (void *)v58;
  }
  else
  {
    v62 = (void *)*MEMORY[0x1E0D05A28];
    v63 = objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A28]);
    v60 = *v54;
    if (v53)
      v64 = *v54;
    else
      v64 = v62;
    if (v63)
      v61 = 0;
    else
      v61 = v64;
  }
  if (objc_msgSend(v61, "isEqualToString:", v60))
  {
    v65 = *(float *)(v16 + 160) * *(float *)(v16 + 224);
LABEL_72:
    v873 = 1.0;
    v72 = v65;
    goto LABEL_73;
  }
  if (!objc_msgSend(v61, "isEqualToString:", *v59) || !*(_BYTE *)(v16 + 153))
  {
    v65 = v55 * 0.5;
    goto LABEL_72;
  }
  v66 = *(float *)(v16 + 156);
  v67 = *(float *)(v16 + 240);
  v68 = (void *)CMGetAttachment((CMAttachmentBearerRef)v1028, CFSTR("ZoomFactorLowerBoundAfterGDCAndFocus"), 0);
  LODWORD(v69) = 1.0;
  if (v68)
    objc_msgSend(v68, "floatValue", v69);
  v70 = v66 * v67;
  v71 = *(float *)(v16 + 240);
  v65 = *(float *)&v69 * v71;
  if ((float)(*(float *)&v69 * v71) > 1.0)
  {
    v873 = v70 / v65;
    v59 = (_QWORD *)MEMORY[0x1E0D05A28];
LABEL_185:
    v72 = v66 * v67;
    goto LABEL_73;
  }
  v192 = *(float *)(v16 + 168);
  v873 = 1.0;
  if (v192 <= 0.0)
  {
    v72 = v66 * v67;
    v65 = v66 * v67;
    v59 = (_QWORD *)MEMORY[0x1E0D05A28];
  }
  else
  {
    v59 = (_QWORD *)MEMORY[0x1E0D05A28];
    if (v192 != *(float *)(v16 + 156))
    {
      v65 = v71 * v192;
      v873 = v70 / (float)(v71 * v192);
      goto LABEL_185;
    }
    v72 = v66 * v67;
    v65 = v66 * v67;
  }
LABEL_73:
  v904 = v61;
  v935 = v72;
  if (*(_BYTE *)(v16 + 1040))
    v73 = *(_BYTE *)(v16 + 817) != 0;
  else
    v73 = 1;
  v875 = v73;
  v74 = *(unsigned __int8 *)(v16 + 818);
  if (v53)
    v75 = &OBJC_IVAR___BWPreviewStitcherNode__wideNondisruptiveSwitchingScaleFactor;
  else
    v75 = &OBJC_IVAR___BWPreviewStitcherNode__superWideNondisruptiveSwitchingScaleFactor;
  v76 = *(float *)(v16 + *v75);
  r2 = vmulq_n_f64(a4[1], v76);
  v77 = a4[2].f64[0] * v76;
  v78 = a4[2].f64[1] * v76;
  v975 = vmulq_n_f64(*(float64x2_t *)(v16 + 1288), *(float *)(v16 + 224));
  v79 = *(float *)(v16 + 240);
  v982 = vmulq_n_f64(*(float64x2_t *)(v16 + 1368), v79);
  v998 = (uint64_t)v52;
  x = v38->x;
  y = v38->y;
  v874 = v65;
  v1016 = vmulq_n_f64(*a4, v76);
  v911 = *(float64x2_t *)(v16 + 712);
  v966 = *(float *)(v16 + 224);
  if (!*(_BYTE *)(v16 + 1040))
  {
    v88 = v38->y;
    v89 = v38->x;
    v85 = v1015;
    goto LABEL_108;
  }
  v80 = &OBJC_IVAR___BWPreviewStitcherNode__superWideFallbackShiftRamp;
  if (v53)
    v80 = &OBJC_IVAR___BWPreviewStitcherNode__wideFallbackShiftRamp;
  v81 = *(void **)(v16 + *v80);
  v82 = v65 / v79;
  v83 = *(float *)&v1043.origin.x;
  if (v55 < *(float *)&v1043.origin.x)
    v83 = v55;
  if (v83 < v82)
    v83 = v82;
  v84 = (float)((float)((float)(v83 - v82) / (float)(v55 - v82)) + 0.0) * 1.57079633;
  v85 = v1015;
  if (fabs(v84) <= 1.57079633)
  {
    v87 = sin(v84);
  }
  else
  {
    v86 = v84 < 0.0;
    v87 = 1.0;
    if (v86)
      v87 = -1.0;
  }
  v1020 = v87;
  objc_msgSend(v81, "currentValue");
  v91 = v1020 * (1.0 - v90);
  v92 = 1.0 - v91;
  if (*(_BYTE *)(v16 + 1560))
  {
    v1002 = v1020 * (1.0 - v90);
    v93 = objc_msgSend(v52, "isEqualToString:", *v59);
    v91 = v1002;
    if (v93)
      v92 = 0.0;
  }
  if (v92 == 0.0)
    v88 = y;
  else
    v88 = -(v92 * v78);
  if (v92 == 0.0)
    v89 = x;
  else
    v89 = -(v92 * v77);
  r2 = vmulq_n_f64(r2, v91);
  v77 = v77 * v91;
  v78 = v78 * v91;
  v1016 = vmulq_n_f64(v1016, v91);
  if (v53)
  {
    v94 = v975;
    if (v975.f64[0] != x || (v94 = v975, v975.f64[1] != y))
    {
LABEL_107:
      v1003 = v94;
      objc_msgSend(v81, "currentValue");
      v987 = v95;
      objc_msgSend(v81, "currentValue");
      v97 = vmulq_f64(v1003, vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v96, v987)), v1020));
      r2 = vaddq_f64(r2, v97);
      v1016 = vaddq_f64(v1016, v97);
      v77 = v77 + v97.f64[0];
      v78 = v78 + v97.f64[1];
      v89 = v89 + v97.f64[0];
      v88 = v88 + v97.f64[1];
    }
  }
  else
  {
    v94 = v982;
    if (v982.f64[0] != x)
      goto LABEL_107;
    v94 = v982;
    if (v982.f64[1] != y)
      goto LABEL_107;
  }
LABEL_108:
  memset(&recta, 0, sizeof(recta));
  recta.origin.x = psn_pixelBufferRect(v85);
  recta.origin.y = v98;
  recta.size.width = v99;
  recta.size.height = v100;
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v1032, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]), &recta);
  v1051 = *(CGRect *)ymmword_1A32A29A0;
  v923 = *MEMORY[0x1E0D05E68];
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v1032, "objectForKeyedSubscript:"), &v1051);
  if (v992 > 0.0)
  {
    v1051.origin.x = FigCaptureMetadataUtilitiesScaleRect2D(v1051.origin.x, v1051.origin.y, v1051.size.width, v1051.size.height, 1.0 / v992);
    v1051.origin.y = v101;
    v1051.size.width = v102;
    v1051.size.height = v103;
  }
  memset(&rect1, 0, sizeof(rect1));
  CVPixelBufferGetWidth(v85);
  CVPixelBufferGetHeight(v85);
  FigCaptureMetadataUtilitiesDenormalizeCropRect(v1051.origin.x, v1051.origin.y, v1051.size.width, v1051.size.height);
  rect1.origin.x = v104;
  rect1.origin.y = v105;
  rect1.size.width = v106;
  rect1.size.height = v107;
  v108 = (const __CFDictionary *)CMGetAttachment(v1029, (CFStringRef)*MEMORY[0x1E0D05D08], 0);
  v109 = v108;
  v110 = *v38;
  rect2 = *v38;
  point = *v38;
  v111 = (void *)v1028;
  *(double *)&v924 = v78;
  *(double *)&v925 = v77;
  v112 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  v885 = v57;
  v978 = v55;
  if (v108)
  {
    v948 = v89;
    v950 = v88;
    v953 = v28;
    CGPointMakeWithDictionaryRepresentation(v108, &point);
    v1021 = point.x;
    v963 = point.y;
    v113 = rect1.origin.x;
    v114 = rect1.origin.y;
    width = rect1.size.width;
    height = rect1.size.height;
    v118 = recta.origin.x;
    v117 = recta.origin.y;
    v119 = recta.size.width;
    v120 = recta.size.height;
    MinX = CGRectGetMinX(recta);
    v1056.origin.x = v113;
    v1056.origin.y = v114;
    v1056.size.width = width;
    v1056.size.height = height;
    v938 = MinX - CGRectGetMinX(v1056);
    v988 = v118;
    v1057.origin.x = v118;
    v1057.origin.y = v117;
    v1057.size.width = v119;
    v1057.size.height = v120;
    MaxX = CGRectGetMaxX(v1057);
    v1058.origin.x = v113;
    v1058.origin.y = v114;
    v1058.size.width = width;
    v1005 = height;
    v1058.size.height = height;
    v86 = MaxX - CGRectGetMaxX(v1058) < v1021;
    v122 = v1021;
    if (v86)
    {
      v1059.origin.x = v988;
      v1059.origin.y = v117;
      v1059.size.width = v119;
      v1059.size.height = v120;
      v123 = CGRectGetMaxX(v1059);
      v1060.origin.x = v113;
      v1060.origin.y = v114;
      v1060.size.width = width;
      v1060.size.height = v1005;
      v122 = v123 - CGRectGetMaxX(v1060);
    }
    v961 = width;
    if (v938 <= v122)
    {
      v1063.origin.x = v988;
      v1063.origin.y = v117;
      v1063.size.width = v119;
      v1063.size.height = v120;
      v939 = CGRectGetMaxX(v1063);
      v1064.origin.x = v113;
      v1064.origin.y = v114;
      v1064.size.width = width;
      v124 = v114;
      v125 = v113;
      v126 = v119;
      v127 = v117;
      v128 = v1005;
      v1064.size.height = v1005;
      if (v939 - CGRectGetMaxX(v1064) >= v1021)
        goto LABEL_119;
      v1065.origin.x = v988;
      v1065.origin.y = v117;
      v1065.size.width = v126;
      v1065.size.height = v120;
      v130 = CGRectGetMaxX(v1065);
      v1066.origin.x = v125;
      v1066.origin.y = v124;
      v1066.size.width = width;
      v1066.size.height = v1005;
      v129 = v130 - CGRectGetMaxX(v1066);
    }
    else
    {
      v1061.origin.x = v988;
      v1061.origin.y = v117;
      v1061.size.width = v119;
      v1061.size.height = v120;
      v1022 = CGRectGetMinX(v1061);
      v1062.origin.x = v113;
      v1062.origin.y = v114;
      v1062.size.width = width;
      v124 = v114;
      v125 = v113;
      v126 = v119;
      v127 = v117;
      v128 = v1005;
      v1062.size.height = v1005;
      v129 = v1022 - CGRectGetMinX(v1062);
    }
    v1021 = v129;
LABEL_119:
    v1067.origin.x = v988;
    v1067.origin.y = v127;
    v1067.size.width = v126;
    v1067.size.height = v120;
    MinY = CGRectGetMinY(v1067);
    v1068.origin.x = v125;
    v1068.origin.y = v124;
    v1068.size.width = v961;
    v1068.size.height = v128;
    v940 = MinY - CGRectGetMinY(v1068);
    v1069.origin.x = v988;
    v1069.origin.y = v127;
    v1069.size.width = v126;
    v1069.size.height = v120;
    MaxY = CGRectGetMaxY(v1069);
    v1070.origin.x = v125;
    v1070.origin.y = v124;
    v1070.size.width = v961;
    v1070.size.height = v128;
    v86 = MaxY - CGRectGetMaxY(v1070) < v963;
    v133 = v963;
    if (v86)
    {
      v1071.origin.x = v988;
      v1071.origin.y = v127;
      v1071.size.width = v126;
      v1071.size.height = v120;
      v134 = CGRectGetMaxY(v1071);
      v1072.origin.x = v125;
      v1072.origin.y = v124;
      v1072.size.width = v961;
      v1072.size.height = v1005;
      v133 = v134 - CGRectGetMaxY(v1072);
    }
    if (v940 <= v133)
    {
      v1075.origin.x = v988;
      v1075.origin.y = v127;
      v1075.size.width = v126;
      v1075.size.height = v120;
      v137 = CGRectGetMaxY(v1075);
      v1076.origin.x = v125;
      v1076.origin.y = v124;
      v1076.size.width = v961;
      v1076.size.height = v1005;
      v138 = CGRectGetMaxY(v1076);
      v139 = v963;
      if (v137 - v138 >= v963)
      {
LABEL_127:
        HIDWORD(v110.x) = HIDWORD(v1021);
        point.x = v1021;
        point.y = v139;
        v78 = *(double *)&v924;
        v77 = *(double *)&v925;
        v57 = v885;
        v55 = v978;
        v28 = v953;
        v89 = v948;
        v88 = v950;
        goto LABEL_128;
      }
      v1077.origin.x = v988;
      v1077.origin.y = v127;
      v1077.size.width = v126;
      v1077.size.height = v120;
      v135 = CGRectGetMaxY(v1077);
      v1078.origin.x = v125;
      v1078.origin.y = v124;
      v1078.size.width = v961;
      v1078.size.height = v1005;
      v136 = CGRectGetMaxY(v1078);
    }
    else
    {
      v1073.origin.x = v988;
      v1073.origin.y = v127;
      v1073.size.width = v126;
      v1073.size.height = v120;
      v135 = CGRectGetMinY(v1073);
      v1074.origin.x = v125;
      v1074.origin.y = v124;
      v1074.size.width = v961;
      v1074.size.height = v1005;
      v136 = CGRectGetMinY(v1074);
    }
    v139 = v135 - v136;
    goto LABEL_127;
  }
LABEL_128:
  v140 = *(unsigned __int8 *)(v16 + 1040);
  v882 = v109;
  if (!*(_BYTE *)(v16 + 1040))
  {
    v914 = v88 - point.y;
    v912 = v89 - point.x;
    v143 = 1.0;
    v949 = v78;
    v951 = v77;
    goto LABEL_162;
  }
  v141 = *(float *)(v16 + 164);
  if (v141 <= 0.0)
    v142 = 1;
  else
    v142 = v53;
  if ((v142 & 1) != 0)
  {
    v141 = v55 + v55;
    *(float *)&v110.x = v55;
LABEL_137:
    v145 = (float)(v935 / v57);
    goto LABEL_138;
  }
  v144 = *(void **)(v16 + 216);
  *(float *)&v110.x = v55;
  if (!v144)
    goto LABEL_137;
  objc_msgSend((id)objc_msgSend(v144, "firstObject", v110.x), "floatValue");
  v141 = *(float *)(v16 + 164);
  if (*(_BYTE *)(v16 + 1040))
    goto LABEL_137;
  v145 = 1.0;
LABEL_138:
  v1023 = v145;
  v146.f64[0] = a9;
  v146.f64[1] = a10;
  r1a = v146;
  v147 = *(float *)&v1043.origin.x;
  if (v141 < *(float *)&v1043.origin.x)
    v147 = v141;
  if (v147 < *(float *)&v110.x)
    v147 = *(float *)&v110.x;
  v148 = (float)((float)((float)(v147 - *(float *)&v110.x) / (float)(v141 - *(float *)&v110.x)) + 0.0) * 1.57079633;
  if (fabs(v148) <= 1.57079633)
  {
    v149 = sin(v148);
  }
  else if (v148 >= 0.0)
  {
    v149 = 1.0;
  }
  else
  {
    v149 = -1.0;
  }
  v150 = vmulq_n_f64(r1a, v966);
  if ((v53 & 1) != 0)
  {
    v151 = vmulq_n_f64(v150, v149);
    v152 = v1023;
    v153 = vmulq_n_f64(v151, v1023);
    if (v982.f64[0] == x && v982.f64[1] == y)
      goto LABEL_155;
    r1f = v153;
    v1006 = (float)(-[BWPreviewStitcherNode _wideBaseZoomFactorWithOverride]((float *)v16) / *(float *)(v16 + 156));
    objc_msgSend(*(id *)(v16 + 1352), "currentValue");
    v989 = v154;
    objc_msgSend(*(id *)(v16 + 1352), "currentValue");
    v155 = r1f;
    v152 = v1023;
    v156 = vsubq_f64(vmulq_n_f64(v982, v1006), vmulq_n_f64(v911, v1006));
    v158 = vcvtq_f64_f32((float32x2_t)__PAIR64__(v157, v989));
  }
  else
  {
    v1007 = v149;
    r1g = v150;
    objc_msgSend(*(id *)(v16 + 1280), "currentValue");
    v160 = r1g.f64[0];
    v152 = v1023;
    v153 = vmulq_n_f64(vmulq_n_f64(r1g, v1007 * (1.0 - v159)), v1023);
    v161 = x;
    if (v975.f64[0] == x)
    {
      v161 = v975.f64[1];
      v160 = y;
      if (v975.f64[1] == y)
        goto LABEL_155;
    }
    r1h = v153;
    objc_msgSend(*(id *)(v16 + 1280), "currentValue", v161, v160, v975.f64[0]);
    v990 = v162;
    objc_msgSend(*(id *)(v16 + 1280), "currentValue");
    v155 = r1h;
    v152 = v1023;
    v158 = vmulq_n_f64(vmulq_n_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v163, v990)), v1007), v1023);
    v156 = v975;
  }
  v153 = vaddq_f64(v155, vmulq_f64(v156, v158));
LABEL_155:
  v164 = point.x;
  v165 = vmlsq_lane_f64(v153, (float64x2_t)point, v152, 0);
  r2 = vaddq_f64(r2, v165);
  v1016 = vaddq_f64(v1016, v165);
  v949 = v78 + v165.f64[1];
  v951 = v77 + v165.f64[0];
  v140 = *(unsigned __int8 *)(v16 + 1040);
  v166 = point.y;
  if (*(_BYTE *)(v16 + 1040))
    v166 = 0.0;
  v914 = v88 + v165.f64[1] - v166;
  if (*(_BYTE *)(v16 + 1040))
    v164 = 0.0;
  v912 = v89 + v165.f64[0] - v164;
  if (*(_BYTE *)(v16 + 1040))
  {
    v143 = (float)(v57 / v935);
    v140 = 1;
  }
  else
  {
    v143 = 1.0;
  }
LABEL_162:
  v167 = MEMORY[0x1E0C9D648];
  v168 = v28;
  if (*(_BYTE *)(v16 + 1560))
  {
    if (objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A28]))
      v143 = 1.0;
    v140 = *(unsigned __int8 *)(v16 + 1040);
  }
  v889 = *(CGSize *)(v167 + 16);
  v890 = *(CGPoint *)v167;
  v1048.origin = *(CGPoint *)v167;
  v1048.size = v889;
  v169 = rect1.size.width;
  v170 = rect1.size.height;
  v171 = rect1.size.width / rect1.size.height;
  v905 = v171;
  if (v168 <= 0.0)
    v172 = rect1.size.width / rect1.size.height;
  else
    v172 = v168;
  if (v140)
  {
    if (v55 != v57)
    {
      v173 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, (float)(v57 / v55));
      v169 = v174;
      v170 = v175;
      rect1.origin.x = v173;
      rect1.origin.y = v176;
      rect1.size.width = v174;
      rect1.size.height = v175;
    }
    if (v53)
    {
      v177 = -[BWPreviewStitcherNode _wideBaseZoomFactorWithOverride]((float *)v16);
      v178 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, v169, v170, (float)(v177 / (float)(*(float *)(v16 + 160) * *(float *)(v16 + 224))));
      v169 = v179;
      v170 = v180;
      rect1.origin.x = v178;
      rect1.origin.y = v181;
      rect1.size.width = v179;
      rect1.size.height = v180;
    }
  }
  v991 = v172;
  v983 = v143;
  if (*(_BYTE *)(v16 + 1564) || *(_BYTE *)(v16 + 1107))
  {
    v182 = *(double *)(v16 + 1112);
    v183 = (void *)objc_msgSend(v1032, "objectForKeyedSubscript:", v886);
    if (!*(_BYTE *)(v16 + 1107) && objc_msgSend(v183, "isEqual:", *MEMORY[0x1E0D05A38]))
    {
      v184 = (void *)CMGetAttachment(v1029, CFSTR("TotalZoomFactor"), 0);
      if (v184)
        objc_msgSend(v184, "floatValue");
      else
        v185 = 1.0;
      v182 = v182 / v185;
    }
    v193 = *(unsigned __int8 *)(v16 + 1107);
    v194 = 1.0 / v182;
    v195 = v182;
    if (*(_BYTE *)(v16 + 1107))
      v195 = 1.0;
    else
      v194 = 1.0;
    v196 = 1.7778;
    if (v172 <= 1.7778)
      v196 = v172;
    v197 = v195 - v194;
    v198 = (float)(v196 + -1.3333) / 0.44444;
    v86 = v196 < 1.3333;
    v199 = 0.0;
    if (!v86)
      v199 = v198;
    v992 = v194 + (float)(v197 * v199);
    v200 = 1.0 / v992;
    v201 = recta.origin.x;
    v976 = recta.origin.y;
    v202 = recta.size.width;
    v203 = recta.size.height;
    v204 = recta.size.width / rect1.size.width;
    if (recta.size.width / rect1.size.width >= recta.size.height / rect1.size.height)
      v204 = recta.size.height / rect1.size.height;
    v898 = v200;
    v901 = rect1.size.width;
    if (v204 > v200)
      v204 = v200;
    v206 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v204);
    v1008 = v207;
    v208 = v205;
    v210 = v209;
    v211 = v205 / v209;
    v212 = v172 <= v211;
    v213 = v209 * v211 / v172;
    v214 = v213 > v203;
    if (v212 && v214)
      v213 = v203;
    v973 = v213;
    if (v212 && v214)
      v215 = v203 * v172;
    else
      v215 = v205;
    v1079.origin.x = v201;
    v1079.origin.y = v976;
    v1079.size.width = v202;
    v1079.size.height = v203;
    v916 = CGRectGetMinX(v1079);
    v1024 = v201;
    v1080.origin.x = v201;
    v216 = v976;
    v1080.origin.y = v976;
    v1080.size.width = v202;
    v1080.size.height = v203;
    keyb = CGRectGetMaxX(v1080) - v215;
    v1081.origin.x = v206;
    v1081.origin.y = v1008;
    v1081.size.width = v208;
    v1081.size.height = v210;
    v964 = v215;
    v954 = v208;
    v941 = v210;
    if (keyb >= CGRectGetMidX(v1081) - v215 * 0.5)
    {
      v1083.origin.x = v206;
      v1083.origin.y = v1008;
      v1083.size.width = v208;
      v1083.size.height = v210;
      v218 = CGRectGetMidX(v1083) - v215 * 0.5;
      v217 = v1024;
    }
    else
    {
      v217 = v1024;
      v1082.origin.x = v1024;
      v1082.origin.y = v976;
      v1082.size.width = v202;
      v1082.size.height = v203;
      v218 = CGRectGetMaxX(v1082) - v215;
    }
    v219 = v916 <= v218;
    v220 = v217;
    if (v219)
    {
      v224 = v976;
      v225 = v202;
      v226 = v203;
      v227 = CGRectGetMaxX(*(CGRect *)&v220) - v215;
      v1084.origin.x = v206;
      v1084.origin.y = v1008;
      v1084.size.width = v954;
      v1084.size.height = v210;
      if (v227 >= CGRectGetMidX(v1084) - v215 * 0.5)
      {
        v1086.origin.x = v206;
        v1086.origin.y = v1008;
        v1086.size.width = v954;
        v1086.size.height = v210;
        key = CGRectGetMidX(v1086) - v215 * 0.5;
      }
      else
      {
        v1085.origin.x = v217;
        v1085.origin.y = v976;
        v1085.size.width = v202;
        v1085.size.height = v203;
        key = CGRectGetMaxX(v1085) - v215;
      }
      v216 = v976;
    }
    else
    {
      v221 = v976;
      v222 = v202;
      v223 = v203;
      key = CGRectGetMinX(*(CGRect *)&v220);
    }
    v1087.origin.x = v217;
    v1087.origin.y = v216;
    v1087.size.width = v202;
    v1087.size.height = v203;
    v917 = CGRectGetMinY(v1087);
    v1088.origin.x = v217;
    v1088.origin.y = v216;
    v1088.size.width = v202;
    v1088.size.height = v203;
    v228 = CGRectGetMaxY(v1088) - v973;
    v1089.origin.x = v206;
    v1089.origin.y = v1008;
    v1089.size.width = v954;
    v1089.size.height = v210;
    v229 = v973 * 0.5;
    if (v228 >= CGRectGetMidY(v1089) - v973 * 0.5)
    {
      v1091.origin.x = v206;
      v1091.origin.y = v1008;
      v1091.size.width = v954;
      v1091.size.height = v941;
      v230 = CGRectGetMidY(v1091) - v229;
    }
    else
    {
      v1090.origin.x = v1024;
      v1090.origin.y = v976;
      v1090.size.width = v202;
      v1090.size.height = v203;
      v230 = CGRectGetMaxY(v1090) - v973;
    }
    if (v917 <= v230)
    {
      v1093.origin.x = v1024;
      v1093.origin.y = v976;
      v1093.size.width = v202;
      v1093.size.height = v203;
      v231 = CGRectGetMaxY(v1093) - v973;
      v1094.origin.x = v206;
      v1094.origin.y = v1008;
      v1094.size.width = v954;
      v1094.size.height = v941;
      if (v231 >= CGRectGetMidY(v1094) - v229)
      {
        v1096.origin.x = v206;
        v1096.origin.y = v1008;
        v1096.size.width = v954;
        v1096.size.height = v941;
        v189 = CGRectGetMidY(v1096) - v229;
      }
      else
      {
        v1095.origin.x = v1024;
        v1095.origin.y = v976;
        v1095.size.width = v202;
        v1095.size.height = v203;
        v189 = CGRectGetMaxY(v1095) - v973;
      }
      v170 = v973;
    }
    else
    {
      v1092.origin.x = v1024;
      v1092.origin.y = v976;
      v1092.size.width = v202;
      v1092.size.height = v203;
      v189 = CGRectGetMinY(v1092);
      v170 = v973;
    }
    v187 = key;
    v172 = v991;
    v55 = v978;
    v143 = v983;
    v169 = v964;
    if (v193)
      v186 = v898 / (v964 / v901);
    else
      v186 = 1.0;
  }
  else
  {
    v186 = 1.0;
    if (v168 <= 0.0)
      goto LABEL_227;
    v187 = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(rect1.origin.x, rect1.origin.y, v169, v170, v168);
    v189 = v188;
    v169 = v190;
    v170 = v191;
  }
  rect1.origin.x = v187;
  rect1.origin.y = v189;
  rect1.size.width = v169;
  rect1.size.height = v170;
LABEL_227:
  v232 = v55;
  if (v958)
    v233 = psn_rectBoundedByRect(rect1.origin.x, rect1.origin.y, v169, v170, recta.origin.x, recta.origin.y, recta.size.width, recta.size.height);
  else
    v233 = psn_conformRectForMSR420vfBoundedByRect(0, rect1.origin.x, rect1.origin.y, v169, v170, recta.origin.x, recta.origin.y, recta.size.width, recta.size.height);
  v237 = v926 + v920;
  rect1.origin.x = v233;
  rect1.origin.y = v234;
  rect1.size.width = v235;
  rect1.size.height = v236;
  v1097.size.width = (double)v1055.i32[0];
  v1097.size.height = (double)v1055.i32[1];
  v1097.origin.x = 0.0;
  v1097.origin.y = 0.0;
  v1098 = CGRectInset(v1097, (double)*(int *)(v16 + 120), (double)*(int *)(v16 + 120));
  v238 = v1098.size.width;
  v239 = v1098.size.height;
  if (v186 > 1.0 && *(_BYTE *)(v16 + 1576))
  {
    v1098.origin.x = FigCaptureMetadataUtilitiesScaleRect2D(v1098.origin.x, v1098.origin.y, v1098.size.width, v1098.size.height, (float)(1.0 / v186));
    v238 = v240;
    v239 = v241;
  }
  v242 = (double)v237;
  v918 = (double)v237;
  if (!v237)
    v242 = -0.0;
  v243 = v242 + v1098.origin.x;
  r1b = v1098.origin.y;
  v1099.origin.x = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(v242 + v1098.origin.x, v1098.origin.y, v238, v239, v172);
  v1048 = v1099;
  v244 = *(_OWORD *)(v16 + 344);
  *(_OWORD *)&propertyValueOut.a = *(_OWORD *)(v16 + 328);
  *(_OWORD *)&propertyValueOut.c = v244;
  *(_OWORD *)&propertyValueOut.tx = *(_OWORD *)(v16 + 360);
  v1100 = CGRectApplyAffineTransform(v1099, &propertyValueOut);
  v245 = v1100.origin.y;
  v246 = v1100.size.width;
  if (a5)
    *a5 = v1100;
  v965 = v1100.origin.x;
  v967 = v1100.size.height;
  v247 = ImageBuffer;
  if (a6)
  {
    v248 = v905;
    v249 = v172;
    if (v172 <= v905)
    {
      v251 = 1.0;
      v250 = v248 / v249;
    }
    else
    {
      v250 = 1.0;
      v251 = v249 / v248;
    }
    *a6 = (1.0 - v250) * 0.5;
    a6[1] = (1.0 - v251) * 0.5;
    a6[2] = v250;
    a6[3] = v251;
  }
  v921 = v926 + v920;
  if (*(_BYTE *)(v16 + 145))
  {
    v1101.origin.x = psn_conformRectForMSR420vfBoundedByRect(1, v965, v245, v246, v967, v965, v245, v246, v967);
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v1101);
    VTSessionSetProperty(*(VTSessionRef *)(v16 + 312), (CFStringRef)*MEMORY[0x1E0CED790], DictionaryRepresentation);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
  v977 = v245;
  if (*(_BYTE *)(v16 + 246))
  {
    v253 = recta.size.width;
    v254 = v253 / (double)CVPixelBufferGetWidth(v85);
    v255 = recta.size.height;
    if (v254 >= v255 / (double)CVPixelBufferGetHeight(v85))
    {
      v256 = recta.size.height;
      v257 = CVPixelBufferGetHeight(v85);
    }
    else
    {
      v256 = recta.size.width;
      v257 = CVPixelBufferGetWidth(v85);
    }
    v258 = v256 / (double)v257;
  }
  else
  {
    v258 = 1.0;
  }
  v962 = v246;
  if (*(float *)&v1043.origin.x < v232 || *(float *)&v1043.origin.x < (float)(v232 / v258))
  {
    acpr_conformRectForMSR420vf(v1048.origin.x, v1048.origin.y, v1048.size.width, v1048.size.height);
    v266 = v264 / (rect1.size.width + rect1.size.width) + v265 / (rect1.size.height + rect1.size.height);
    v267 = v258;
    if (v258 == 1.0)
      v267 = 1.0;
    v263 = v267 * v266;
    v268 = 1.0 - *(float *)&v1043.origin.x / v232 * v267;
    *(CGRect *)&v259 = CGRectInset(v1048, v268 * v1048.size.width * 0.5, v268 * v1048.size.height * 0.5);
  }
  else
  {
    v259 = psn_smallestBoundingRectAlignedToMultipleOf(*(_DWORD *)(v16 + 908), v1048.origin.x, v1048.origin.y, v1048.size.width, v1048.size.height);
    v263 = 0.0;
  }
  v269 = v243 - v918;
  v1048.origin.x = v259;
  v1048.origin.y = v260;
  v1048.size.width = v261;
  v1048.size.height = v262;
  v270 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "videoFormat"), "pixelFormat");
  v974 = v74;
  v1025 = v263;
  if (FigCapturePixelFormatIsTenBit(v270))
  {
    *(_QWORD *)&propertyValueOut.a = 0x200000002;
    if (FigCapturePixelFormatIsTenBitPacked(v270))
    {
      *(_QWORD *)&propertyValueOut.a = 0x200000006;
    }
    else if (FigCapturePixelFormatGetCompressionType(v270))
    {
      *(_QWORD *)&propertyValueOut.a = FigCapturePixelFormatTileAlignment(v270);
    }
    FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&propertyValueOut, *(_DWORD *)(v16 + 104));
    a_high = HIDWORD(propertyValueOut.a);
    a_low = LODWORD(propertyValueOut.a);
    v287 = v1055.i32[0];
    v286 = v1055.i32[1];
    v288 = psn_rectBoundedByRect(v1048.origin.x, v1048.origin.y, v1048.size.width, v1048.size.height, v269, r1b, v238, v239);
    v290 = v289;
    v291 = v238;
    v292 = v239;
    v294 = v293;
    v1009 = v295;
    v296 = v288 + 0.001;
    v297 = FigCaptureFloorFloatToMultipleOf(a_low, v296);
    v298 = v290 + 0.001;
    v299 = FigCaptureFloorFloatToMultipleOf(a_high, v298);
    v300 = v288 + v294 + -0.001;
    v301 = (double)(int)FigCaptureCeilFloatToMultipleOf(a_low, v300);
    v302 = v290 + v1009 + -0.001;
    v303 = (double)(int)FigCaptureCeilFloatToMultipleOf(a_high, v302);
    v1102.origin.x = v243 - v918;
    v1102.origin.y = r1b;
    v1102.size.width = v291;
    v1102.size.height = v292;
    v955 = CGRectGetMinX(v1102);
    v1010 = (double)a_low;
    v1103.origin.x = v243 - v918;
    v1103.origin.y = r1b;
    v1103.size.width = v291;
    v304 = v292;
    v1103.size.height = v292;
    v305 = CGRectGetMinY(v1103);
    v306 = (double)v287;
    v219 = v301 <= (double)v287;
    v85 = v1015;
    v111 = (void *)v1028;
    v112 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    if (v219)
    {
      v1104.origin.x = v269;
      v1104.origin.y = r1b;
      v1104.size.width = v291;
      v1104.size.height = v304;
      if (CGRectGetMaxX(v1104) >= v301)
        v306 = v301;
      else
        v306 = v301 - v1010;
    }
    v307 = (double)v286;
    v219 = v303 <= (double)v286;
    v74 = v974;
    if (v219)
    {
      v1105.origin.x = v269;
      v1105.origin.y = r1b;
      v1105.size.width = v291;
      v1105.size.height = v304;
      if (CGRectGetMaxY(v1105) >= v303)
        v307 = v303;
      else
        v307 = v303 - (double)a_high;
    }
    v308 = -0.0;
    if (v305 <= (double)v299)
      v309 = -0.0;
    else
      v309 = (double)a_high;
    v310 = v309 + (double)v299;
    if (v955 > (double)v297)
      v308 = v1010;
    v279 = v306 - (v308 + (double)v297);
    v899 = v308 + (double)v297;
    v902 = v310;
    v1048.origin.x = v899;
    v1048.origin.y = v310;
    v281 = v307 - v310;
    v1048.size.width = v279;
    v1048.size.height = v307 - v310;
    v247 = ImageBuffer;
    v52 = (void *)v998;
    v283 = v978;
    v143 = v983;
  }
  else
  {
    v1048.origin.x = psn_smallestBoundingRectAlignedToMultipleOf(2, v1048.origin.x, v1048.origin.y, v1048.size.width, v1048.size.height);
    v1048.origin.y = v271;
    v1048.size.width = v272;
    v1048.size.height = v273;
    v277 = psn_conformRectForMSR420vfBoundedByRect(1, v1048.origin.x, v271, v272, v273, v269, r1b, v238, v239);
    v279 = v278;
    v281 = v280;
    v899 = v277;
    v902 = v282;
    v1048.origin.x = v277;
    v1048.origin.y = v282;
    v1048.size.width = v278;
    v1048.size.height = v280;
    v283 = v232;
  }
  v311 = v912 * v143;
  v312 = v914 * v143;
  v23 = v912 == x;
  keya = v914 * v143;
  v913 = v912 * v143;
  v864 = v279;
  v906 = v281;
  if (!v23 || (v313 = v281, v314 = v279, v315 = y, v316 = x, v914 != y))
  {
    v317 = v279 / (rect1.size.width + rect1.size.width) + v281 / (rect1.size.height + rect1.size.height);
    v318 = recta.origin.x;
    v319 = recta.origin.y;
    v320 = recta.size.width;
    v321 = recta.size.height;
    *(CGPoint *)&propertyValueOut.a = rect2;
    v322 = v312;
    v323 = v311;
    if (!*(_BYTE *)(v16 + 1040))
    {
      v322 = v312;
      v323 = v311;
      if (*(_BYTE *)(v16 + 1512))
      {
        CVPixelBufferGetWidth(v85);
        CVPixelBufferGetHeight(v85);
        FigCaptureMetadataUtilitiesNormalizeCropRect(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
        v325 = v324;
        v328 = (1.0 - v327) * 0.5;
        v323 = v913 - (v329 - (1.0 - v326) * 0.5) * (double)CVPixelBufferGetWidth(v85);
        v330 = v325 - v328;
        v283 = v978;
        v322 = keya - v330 * (double)CVPixelBufferGetHeight(v85);
        v279 = v864;
      }
    }
    v331 = v317;
    -[BWPreviewStitcherNode _getInputRect:outputRect:inputShiftAppliedInOutputRect:toTransferPixelBuffer:rect:intoPixelBufferDimensions:rect:withInputShift:shiftOutsideBoundingRectAllowed:scale:forFinalOutput:](v16, &rect1.origin.x, &v1048.origin.x, &propertyValueOut.a, v85, *(_QWORD *)&v1055, 0, 0, v318, v319, v320, v321, v899, v902, v279, v906, v323, v322, v331);
    v316 = propertyValueOut.a / v983;
    v314 = v1048.size.width;
    v313 = v1048.size.height;
    v315 = propertyValueOut.b / v983;
  }
  v332 = *(unsigned __int8 *)(v16 + 1040);
  v333 = v314 / rect1.size.width;
  if (*(_BYTE *)(v16 + 1040))
    v334 = 4.0 / ((*(float *)(v16 + 208) / 100.0 + 1.0) * (float)(v283 / v935));
  else
    v334 = 4.0;
  v892 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v893 = *MEMORY[0x1E0C9D628];
  v891 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v915 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v335 = v313 / rect1.size.height;
  v860 = v315;
  v861 = v316;
  if (v333 > v334 || v335 > v334)
  {
    v1011 = v313 / rect1.size.height;
    v337 = v1048.origin.x;
    v338 = v1048.origin.y;
    v339 = CGRectGetWidth(*(CGRect *)(&v314 - 2)) / v334;
    r1c = v333;
    if (v958)
    {
      v340 = CGRectGetHeight(v1048) / v334;
    }
    else
    {
      v341 = v339;
      v339 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v341);
      v342 = CGRectGetHeight(v1048) / v334;
      v340 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v342);
    }
    v343 = rect1.origin.y;
    v344 = rect1.size.width;
    v345 = rect1.size.height;
    v984 = rect1.origin.x;
    v346 = CGRectGetMidX(rect1) - v339 * 0.5;
    MidY = CGRectGetMidY(rect1);
    rect1.origin.x = v346;
    rect1.origin.y = MidY - v340 * 0.5;
    rect1.size.width = v339;
    rect1.size.height = v340;
    v348 = psn_rectBoundedByRect(v346, rect1.origin.y, v339, v340, recta.origin.x, recta.origin.y, recta.size.width, recta.size.height);
    v350 = v349;
    v352 = v351;
    v354 = v353;
    v1167.origin.x = v348;
    v1167.origin.y = v349;
    v1167.size.width = v351;
    v1167.size.height = v353;
    if (!CGRectEqualToRect(rect1, v1167) && !*(_BYTE *)(v16 + 1040))
    {
      rect1.origin.x = v348;
      rect1.origin.y = v350;
      rect1.size.width = v352;
      rect1.size.height = v354;
      v355 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v984, v343, v344, v345, v348, v350, v352);
      v892 = v356;
      v893 = v355;
      v891 = v357;
      v915 = v358;
    }
    if (!v958)
    {
      rect1.origin.x = acpr_conformRectForMSR420vf(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
      rect1.origin.y = v359;
      rect1.size.width = v360;
      rect1.size.height = v361;
    }
    v335 = (r1c + v1011) * 0.5;
    v336 = v335 / v334;
    v332 = *(unsigned __int8 *)(v16 + 1040);
    v283 = v978;
  }
  else
  {
    v336 = 1.0;
  }
  v362 = 0;
  v363 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  v927 = v336;
  if (!v74)
  {
    if (v332)
    {
      LODWORD(v335) = LODWORD(v1043.origin.x);
      if (*(float *)&v1043.origin.x > v283)
      {
        if ((objc_msgSend(*(id *)(v16 + 864), "isRamping", v335) & 1) == 0
          && *(unsigned __int8 *)(v16 + 818) == objc_msgSend((id)v16, "displaysWidestCameraOnly"))
        {
          r1d = FigCaptureMetadataUtilitiesRectNormalizedToRect(0.0, 0.0, (double)v1055.i32[0], (double)v1055.i32[1], v1048.origin.x, v1048.origin.y, v1048.size.width);
          v365 = v364;
          v367 = v366;
          v1012 = v368;
          if (*(_BYTE *)(v16 + 246))
          {
            v369 = recta.origin.x;
            v370 = recta.origin.y;
            v371 = recta.size.width;
            v372 = recta.size.height;
          }
          else
          {
            v369 = psn_pixelBufferRect(v85);
            v370 = v376;
            v371 = v377;
            v372 = v378;
          }
          v379 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, 1.0 / v336);
          v383 = v380;
          if (!v958)
          {
            v379 = acpr_conformRectForMSR420vf(v379, v380, v381, v382);
            v383 = v384;
          }
          v985 = v379;
          v385 = v379;
          v956 = v383;
          v942 = v381;
          v386 = v381;
          if (v336 <= 1.0)
          {
            v385 = rect1.origin.x;
            v383 = rect1.origin.y;
            v386 = rect1.size.width;
          }
          v1106.origin.x = FigCaptureMetadataUtilitiesRectNormalizedToRect(v369, v370, v371, v372, v385, v383, v386);
          v387 = v1106.origin.x;
          v388 = v1106.origin.y;
          v389 = v1106.size.width;
          v390 = v1106.size.height;
          v1168.origin.x = r1d;
          v1168.origin.y = v365;
          v1168.size.width = v367;
          v1168.size.height = v1012;
          v391 = CGRectContainsRect(v1106, v1168);
          v392 = v391;
          if (v882)
          {
            v1107.origin.x = r1d;
            v1107.origin.y = v365;
            v1107.size.width = v367;
            v1107.size.height = v1012;
            v1169.origin.x = v387;
            v1169.origin.y = v388;
            v1169.size.width = v389;
            v1169.size.height = v390;
            v1108 = CGRectIntersection(v1107, v1169);
            v393 = v1108.size.width * v1108.size.height / (v367 * v1012);
            if (!v392)
            {
              if (v393 >= 0.99)
              {
                v396 = v393 * 0.95;
                v393 = v396;
              }
              BWSmartCameraSceneUpdateWithConfidence(v16 + 1520, v393);
              goto LABEL_334;
            }
            BWSmartCameraSceneUpdateWithConfidence(v16 + 1520, v393);
            if (!*(_BYTE *)(v16 + 1521))
            {
LABEL_334:
              v362 = 0;
              v52 = (void *)v998;
              goto LABEL_335;
            }
          }
          else if (!v391)
          {
            goto LABEL_334;
          }
          v394 = *(void **)(v16 + 216);
          v52 = (void *)v998;
          v363 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
          if (!v394 || (LODWORD(v335) = *(_DWORD *)(v16 + 224), *(float *)&v335 != 1.0))
          {
            v362 = 1;
            v336 = v927;
LABEL_337:
            v283 = v978;
            if (v111)
              goto LABEL_338;
            goto LABEL_310;
          }
          objc_msgSend((id)objc_msgSend(v394, "firstObject"), "floatValue");
          v395 = *(float *)&v335;
          if ((float)(*(float *)&v335 / *(float *)(v16 + 160)) < 2.0)
          {
            fig_log_get_emitter();
            v851 = v11;
            LODWORD(v848) = 0;
            FigDebugAssert3();
          }
          if (*(float *)(v16 + 824) >= v395
            || (LODWORD(v335) = LODWORD(v1043.origin.x), *(float *)&v1043.origin.x >= v395))
          {
            v837 = psn_pixelBufferRect(v85);
            v841 = FigCaptureMetadataUtilitiesScaleRect2D(v837, v838, v839, v840, (float)(1.0 / (float)(v395 / *(float *)(v16 + 160))));
            v845 = v985;
            v846 = v956;
            v847 = v942;
            if (v927 <= 1.0)
            {
              v845 = rect1.origin.x;
              v846 = rect1.origin.y;
              v847 = rect1.size.width;
            }
            v1164.origin.x = FigCaptureMetadataUtilitiesRectNormalizedToRect(v841, v842, v843, v844, v845, v846, v847);
            v1196.origin.x = r1d;
            v1196.origin.y = v365;
            v1196.size.width = v367;
            v1196.size.height = v1012;
            v362 = CGRectContainsRect(v1164, v1196);
          }
          else
          {
            v362 = 1;
          }
LABEL_335:
          v336 = v927;
          v363 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
          goto LABEL_337;
        }
        v362 = 0;
        v363 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      }
    }
  }
  if (v111)
  {
LABEL_338:
    if (!v111 || v53 == 1)
    {
      v373 = v362;
      goto LABEL_370;
    }
    v373 = v362;
    if (*(unsigned __int8 *)(v16 + 1169) == v362)
    {
      if (*(_BYTE *)(v16 + 1170) && (*(_BYTE *)(v16 + 1129) || *(_BYTE *)(v16 + 819)))
        *(_BYTE *)(v16 + 1170) = 0;
      goto LABEL_352;
    }
    if ((v362 & 1) != 0)
    {
      v397 = 0;
    }
    else
    {
      if (*(_BYTE *)(v16 + 1129))
      {
LABEL_351:
        *(_BYTE *)(v16 + 1169) = v362;
LABEL_352:
        v398 = *(float *)(v16 + 824);
        v399 = *(unsigned __int8 *)(v16 + 1171);
        if (*(_BYTE *)(v16 + 394) && *(_BYTE *)(v16 + 1389))
        {
          v400 = objc_msgSend(v904, "isEqualToString:", *MEMORY[0x1E0D05A28], v335);
          v401 = *(_DWORD *)(v16 + 396);
          if (v401)
          {
            v402 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
            if (v400)
              v402 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
            LOBYTE(v401) = *(_DWORD *)(v16 + *v402 + 148) >= v401;
          }
        }
        else
        {
          LOBYTE(v401) = 1;
        }
        if (!v74 && v1048.size.height >= (double)v1055.i32[1])
        {
          v403 = v875;
          if (!*(_BYTE *)(v16 + 1170))
            v403 = 1;
          if (v399 && (v403 & 1) == 0 && v398 != v874)
            goto LABEL_369;
          if (!*(_BYTE *)(v16 + 1389))
            LOBYTE(v401) = 1;
          if ((v401 & 1) == 0)
          {
LABEL_369:
            v373 = 1;
            v875 = 1;
          }
        }
        goto LABEL_370;
      }
      v397 = 1;
    }
    *(_BYTE *)(v16 + 1170) = v397;
    goto LABEL_351;
  }
LABEL_310:
  if (!*(_BYTE *)(v16 + 1040))
    goto LABEL_338;
  v373 = *(_DWORD *)(v16 + 1124) != 4;
  v374 = *(void **)(v16 + v363[526]);
  if (v374)
  {
    v375 = v363;

    *(_QWORD *)(v16 + v375[526]) = 0;
    *(_BYTE *)(v16 + 904) = 0;
  }
LABEL_370:
  v404 = vaddvq_f64(vdivq_f64((float64x2_t)v1048.size, vaddq_f64((float64x2_t)rect1.size, (float64x2_t)rect1.size)));
  if (v74)
  {
    v405 = v921;
    if (v1025 > 0.0)
      v404 = v1025 * (float)(*(float *)&v1043.origin.x / v283);
  }
  else
  {
    v405 = v921;
  }
  v872 = v404;
  v406 = *(double *)v167;
  v407 = *(double *)(v167 + 8);
  v408 = *(double *)(v167 + 24);
  a = *(double *)v167;
  b = v407;
  c = *(double *)(v167 + 16);
  d = v408;
  v412 = v408;
  r1e = c;
  v1026 = v407;
  v986 = *(double *)v167;
  v957 = c;
  if (v247)
  {
    *(_OWORD *)&propertyValueOut.a = *(_OWORD *)ymmword_1A32A29A0;
    *(_OWORD *)&propertyValueOut.c = *(_OWORD *)&ymmword_1A32A29A0[16];
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v1030, "objectForKeyedSubscript:", v923), (CGRect *)&propertyValueOut);
    CVPixelBufferGetWidth(v247);
    CVPixelBufferGetHeight(v247);
    FigCaptureMetadataUtilitiesDenormalizeCropRect(propertyValueOut.a, propertyValueOut.b, propertyValueOut.c, propertyValueOut.d);
    a = v413;
    b = v414;
    c = v415;
    d = v416;
    if (((v875 | v373) & 1) != 0)
    {
      v412 = v408;
      r1e = v957;
      v1026 = v407;
      v406 = v986;
      goto LABEL_480;
    }
    v417 = v872 * (float)(v885 / v935);
    v418 = *(float *)(v16 + 164) * *(float *)(v16 + 1488);
    v865 = v418;
    if (*(_BYTE *)(v16 + 1040) && *(_BYTE *)(v16 + 1480))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v16 + 216), "firstObject"), "floatValue");
      v419 = 0;
      if (*(float *)&v1043.origin.x > v420 && *(float *)&v1043.origin.x < v418)
      {
        v1109.origin.x = v899;
        v1109.origin.y = v902;
        v1109.size.width = v864;
        v1109.size.height = v906;
        v419 = CGRectGetMaxX(v1109) < (double)v1055.i32[0];
      }
    }
    else
    {
      v419 = 0;
    }
    *(float *)&v421 = v417;
    v876 = v421;
    v883 = v407;
    rect2a = v408;
    if (v74)
    {
      v422 = v951;
      v423 = v874;
      if (v405)
        v422 = v951 + (float)((float)v405 / *(float *)&v421);
      v424 = (double)v1055.i32[0];
      if (v419)
      {
        v422 = v422 + (v424 - (v1048.origin.x + v1048.size.width - v424 + v424 + 2.0)) * 0.5 / *(float *)&v421;
        v424 = v1048.origin.x + v1048.size.width - v424 + v424 + 2.0;
      }
      v425 = v1055.i32[1];
      if (*(_BYTE *)(v16 + 1560)
        && *(float *)(v16 + 240) > 1.0
        && objc_msgSend(v904, "isEqualToString:", *MEMORY[0x1E0D05A28]))
      {
        v426 = FigCaptureMetadataUtilitiesNormalizedSensorCenterOffsetInValidBufferRect(v111);
        v428 = v427;
        v429 = CVPixelBufferGetWidth(v247);
        CVPixelBufferGetHeight(v247);
        v430 = v426;
        v423 = v874;
        v422 = v422 - FigCaptureMetadataUtilitiesDenormalizePoint(v430, v428, (double)v429);
        v432 = v949 - v431;
      }
      else
      {
        v432 = v949;
      }
      v433 = psn_pixelBufferRect(v247);
      v440 = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v433, v434, v435, v436, v423 / *(float *)(v16 + 240), *(float *)&v1043.origin.x, v992, v873);
      v943 = v441;
      v929 = v443;
      v1014 = v440;
      v867 = v442;
      if (*(_BYTE *)(v16 + 1005) && *(float *)(v16 + 240) > 1.0 && (float)(*(float *)&v1043.origin.x / v978) < 1.0)
      {
        v1043.size = (CGSize)v890;
        v1044 = v889;
        rhs.origin = v890;
        rhs.size = v889;
        -[BWPreviewStitcherNode _getInputRect:outputRect:inputShiftAppliedInOutputRect:toTransferPixelBuffer:rect:intoPixelBufferDimensions:rect:withInputShift:shiftOutsideBoundingRectAllowed:scale:forFinalOutput:](v16, &v1043.size.width, &rhs.origin.x, 0, v247, *(_QWORD *)&v1055, 1, 1, v440, v441, v442, v443, 0.0, 0.0, v424, (double)v425, v422, v432, *(float *)&v421);
        v444 = *(_OWORD *)(v16 + 344);
        *(_OWORD *)&propertyValueOut.a = *(_OWORD *)(v16 + 328);
        *(_OWORD *)&propertyValueOut.c = v444;
        *(_OWORD *)&propertyValueOut.tx = *(_OWORD *)(v16 + 360);
        v1110 = CGRectApplyAffineTransform(rhs, &propertyValueOut);
        rhs = v1110;
        v445 = FigCaptureMetadataUtilitiesScaleRect2D(v1110.origin.x, v1110.origin.y, v1110.size.width, v1110.size.height, 1.0 / (float)(*(float *)&v1043.origin.x / v978));
        v447 = v446;
        v449 = v448;
        v451 = v450;
        -[BWPreviewStitcherNode _compensateForMissingFOVUsingPixelBuffer:sourceRect:destinationContainingRect:destinationInsetRect:outputPixelBuffer:](v16, v247, *(__CVBuffer **)&v1043.origin.y, v452, v453, v454, v455, v456, v1043.size.width, v1043.size.height, v1044.width, v1044.height, v445, v446, v450, v448, *(uint64_t *)&rhs.origin.x, *(uint64_t *)&rhs.origin.y, *(uint64_t *)&rhs.size.width,
          *(uint64_t *)&rhs.size.height);
        v1111.origin.x = v986;
        v1111.origin.y = v883;
        v1111.size.width = v957;
        v408 = rect2a;
        v1111.size.height = rect2a;
        v1170.origin.x = v986;
        v1170.origin.y = v883;
        v1170.size.width = v957;
        v1170.size.height = rect2a;
        v74 = v974;
        if (CGRectEqualToRect(v1111, v1170))
        {
          v1017 = v445;
          v1026 = v447;
          v457 = v927;
          v412 = v449;
          r1e = v451;
        }
        else
        {
          v1121.origin.x = v445;
          v1121.origin.y = v447;
          v1121.size.width = v451;
          v1121.size.height = v449;
          v1177.origin.x = v986;
          v1177.origin.y = v883;
          v1177.size.width = v957;
          v1177.size.height = rect2a;
          v1122 = CGRectUnion(v1121, v1177);
          v1017 = v1122.origin.x;
          v1026 = v1122.origin.y;
          r1e = v1122.size.width;
          v412 = v1122.size.height;
          v457 = v927;
        }
        v407 = v883;
        b = v1043.size.height;
        d = v1044.height;
        c = v1044.width;
        v519 = v1014;
        v489 = v1043.size.width - v1014;
        if (v1043.size.width - v1014 >= v1043.size.height - v943)
          v489 = v1043.size.height - v943;
        a = v1043.size.width;
        if (v489 >= v519 + v867 - (v1043.size.width + v1044.width))
          v489 = v519 + v867 - (v1043.size.width + v1044.width);
        v490 = v943 + v929;
      }
      else
      {
        propertyValueOut.a = v440;
        propertyValueOut.b = v441;
        propertyValueOut.c = v442;
        propertyValueOut.d = v443;
        -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v247, *(CVPixelBufferRef *)&v1043.origin.y, 1, &propertyValueOut, v437, v438, v439, v440, v441, v442, v443, 0.0, 0.0, v424, (double)v425, *(uint64_t *)&v422, *(uint64_t *)&v432, v421);
        v459 = v458;
        v461 = v460;
        v463 = v462;
        v465 = v464;
        v1112.origin.x = v986;
        v1112.origin.y = v883;
        v1112.size.width = v957;
        v408 = rect2a;
        v1112.size.height = rect2a;
        v1171.origin.x = v986;
        v1171.origin.y = v883;
        v1171.size.width = v957;
        v1171.size.height = rect2a;
        v74 = v974;
        if (CGRectEqualToRect(v1112, v1171))
        {
          v1017 = v459;
          v1026 = v461;
          v457 = v927;
          v412 = v465;
          r1e = v463;
        }
        else
        {
          v1114.origin.x = v459;
          v1114.origin.y = v461;
          v1114.size.width = v463;
          v1114.size.height = v465;
          v1173.origin.x = v986;
          v1173.origin.y = v883;
          v1173.size.width = v957;
          v1173.size.height = rect2a;
          v1115 = CGRectUnion(v1114, v1173);
          v1017 = v1115.origin.x;
          v1026 = v1115.origin.y;
          r1e = v1115.size.width;
          v412 = v1115.size.height;
          v457 = v927;
        }
        v407 = v883;
        b = propertyValueOut.b;
        c = propertyValueOut.c;
        d = propertyValueOut.d;
        v488 = v1014;
        v489 = propertyValueOut.a - v1014;
        if (propertyValueOut.a - v1014 >= propertyValueOut.b - v943)
          v489 = propertyValueOut.b - v943;
        a = propertyValueOut.a;
        if (v489 >= v488 + v867 - (propertyValueOut.a + propertyValueOut.c))
          v489 = v488 + v867 - (propertyValueOut.a + propertyValueOut.c);
        v490 = v943 + v929;
      }
      v520 = v490 - (b + d);
      if (v489 >= v520)
        v489 = v520;
      v521 = v489;
      if (v521 >= 0.0)
        v518 = v521;
      else
        v518 = 0.0;
    }
    else
    {
      v930 = d;
      v979 = c;
      v944 = b;
      v466 = psn_pixelBufferRect(v247);
      propertyValueOut.a = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v466, v467, v468, v469, v874, *(float *)&v1043.origin.x, v992, v873);
      propertyValueOut.b = v470;
      propertyValueOut.c = v471;
      propertyValueOut.d = v472;
      v473 = (double)v1055.i32[0] * 0.5 + v918 + 2.0;
      v856 = *(float *)&v421;
      *(float *)&v852 = v417;
      *(double *)&v849 = v1016.f64[0] + v473 * 0.5 / *(float *)&v421 - 2.0 / *(float *)&v421;
      v868 = propertyValueOut.a;
      v1027 = v470;
      v858 = v471;
      v1016.f64[0] = v472;
      -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v247, *(CVPixelBufferRef *)&v1043.origin.y, 1, &propertyValueOut, v474, v475, v476, propertyValueOut.a, v470, v471, v472, 0.0, 0.0, v473, (double)v1055.i32[1], v849, *(uint64_t *)&v1016.f64[1], v852);
      v478 = v477;
      v480 = v479;
      v482 = v481;
      v484 = v483;
      v1113.origin.x = v986;
      v1113.origin.y = v407;
      v1113.size.width = v957;
      v1113.size.height = v408;
      v1172.origin.x = v986;
      v1172.origin.y = v407;
      v1172.size.width = v957;
      v1172.size.height = v408;
      if (CGRectEqualToRect(v1113, v1172))
      {
        v854 = v478;
        v485 = v484;
        v486 = v482;
        v487 = v480;
      }
      else
      {
        v1116.origin.x = v478;
        v1116.origin.y = v480;
        v1116.size.width = v482;
        v1116.size.height = v484;
        v1174.origin.x = v986;
        v1174.origin.y = v407;
        v1174.size.width = v957;
        v1174.size.height = v408;
        v1117 = CGRectUnion(v1116, v1174);
        v854 = v1117.origin.x;
        v487 = v1117.origin.y;
        v486 = v1117.size.width;
        v485 = v1117.size.height;
      }
      v491 = propertyValueOut.a - v868;
      if (propertyValueOut.a - v868 >= propertyValueOut.b - v1027)
        v491 = propertyValueOut.b - v1027;
      v492 = v868 + v858 - (propertyValueOut.a + propertyValueOut.c);
      if (v491 < v492)
        v492 = v491;
      if (v492 >= v1027 + v1016.f64[0] - (propertyValueOut.b + propertyValueOut.d))
        v492 = v1027 + v1016.f64[0] - (propertyValueOut.b + propertyValueOut.d);
      v493 = v492;
      if (v493 < 0.0)
        v493 = 0.0;
      v853 = v493;
      v494 = psn_pixelBufferRect(v247);
      v501 = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v494, v495, v496, v497, v874, *(float *)&v1043.origin.x, v992, v873);
      propertyValueOut.a = v501;
      propertyValueOut.b = v502;
      propertyValueOut.c = v503;
      propertyValueOut.d = v504;
      v505 = (double)v1055.i32[0] * 0.5 + v918;
      v506 = (double)v1055.i32[0] - v505;
      v507 = v486;
      if (v419)
        v506 = v506 + v1048.origin.x + v1048.size.width - (double)v1055.i32[0] + 2.0;
      *(double *)&v850 = r2.f64[0] + v506 * -0.5 / v856;
      v855 = v503;
      v857 = v501;
      v869 = v502;
      v859 = v504;
      -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v247, *(CVPixelBufferRef *)&v1043.origin.y, 1, &propertyValueOut, v498, v499, v500, v501, v502, v503, v504, v505, 0.0, v506, (double)v1055.i32[1], v850, *(uint64_t *)&r2.f64[1], v876);
      v509 = v508;
      v511 = v510;
      r1e = v512;
      v514 = v513;
      v1118.origin.x = v854;
      v1118.origin.y = v487;
      v1118.size.width = v507;
      v1118.size.height = v485;
      v1175.origin.x = v986;
      v1175.origin.y = v883;
      v1175.size.width = v957;
      v1175.size.height = v408;
      if (CGRectEqualToRect(v1118, v1175))
      {
        v412 = v514;
        v1017 = v509;
        v1026 = v511;
      }
      else
      {
        v1119.origin.x = v509;
        v1119.origin.y = v511;
        v1119.size.width = r1e;
        v1119.size.height = v514;
        v1176.origin.x = v854;
        v1176.origin.y = v487;
        v1176.size.width = v507;
        v1176.size.height = v485;
        v1120 = CGRectUnion(v1119, v1176);
        v1017 = v1120.origin.x;
        v1026 = v1120.origin.y;
        r1e = v1120.size.width;
        v412 = v1120.size.height;
      }
      v457 = v927;
      c = v979;
      v515 = propertyValueOut.a - v857;
      if (propertyValueOut.a - v857 >= propertyValueOut.b - v869)
        v515 = propertyValueOut.b - v869;
      v516 = v857 + v855 - (propertyValueOut.a + propertyValueOut.c);
      if (v515 < v516)
        v516 = v515;
      if (v516 >= v869 + v859 - (propertyValueOut.b + propertyValueOut.d))
        v516 = v869 + v859 - (propertyValueOut.b + propertyValueOut.d);
      v517 = v516;
      if (v517 < 0.0)
        v517 = 0.0;
      if (v853 >= v517)
        v518 = v517;
      else
        v518 = v853;
      b = v944;
      d = v930;
      v407 = v883;
    }
    v406 = v1017;
    v336 = v457;
    if (!v419)
    {
      v52 = (void *)v998;
      v405 = v921;
LABEL_479:
      BWSmartCameraSceneUpdateWithConfidence(v16 + 1176, v518 * *(float *)&v876);
      goto LABEL_480;
    }
    v945 = b;
    if (v74)
      v522 = v951;
    else
      v522 = r2.f64[0];
    if (v74)
      v523 = v949;
    else
      v523 = r2.f64[1];
    v524 = v1048.origin.x;
    v525 = v1048.size.width;
    v526 = v1055.i32[1];
    v931 = d;
    v870 = v518;
    if (v457 > 1.0)
      v524 = FigCaptureMetadataUtilitiesScaleRect2D(v1048.origin.x, v1048.origin.y, v1048.size.width, v1048.size.height, 1.0 / v457);
    v527 = v524 + v525;
    v528 = (double)v1055.i32[0] - (v524 + v525);
    v529 = (double)v526;
    v530 = psn_pixelBufferRect(v247);
    v534 = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v530, v531, v532, v533, v874, *(float *)&v1043.origin.x, v992, v873);
    v1043.size.width = v534;
    v1043.size.height = v535;
    v1044.width = v536;
    v1044.height = v537;
    if (v921)
    {
      v538 = *(float *)&v876;
      v522 = v522 + (float)((float)v921 / *(float *)&v876);
      v52 = (void *)v998;
    }
    else
    {
      v52 = (void *)v998;
      v538 = *(float *)&v876;
    }
    v539 = v538;
    -[BWPreviewStitcherNode _getInputRect:outputRect:inputShiftAppliedInOutputRect:toTransferPixelBuffer:rect:intoPixelBufferDimensions:rect:withInputShift:shiftOutsideBoundingRectAllowed:scale:forFinalOutput:](v16, &v1043.size.width, 0, 0, v247, *(_QWORD *)&v1055, 1, 1, v534, v535, v536, v537, v527, 0.0, v528, (double)v526, v522 + v527 * -0.5 / v538, v523, v538);
    v540 = v528 / (v1044.width * v539);
    v541 = *(float *)(v16 + 164);
    if (*(float *)&v1043.origin.x >= v541)
    {
      v546 = *(float *)&v1043.origin.x;
      if (v865 < *(float *)&v1043.origin.x)
        v546 = v865;
      if (v546 < v541)
        v546 = *(float *)(v16 + 164);
      v545 = *(float *)(v16 + 1484)
           + (float)((float)(1.0 - *(float *)(v16 + 1484)) * (float)((float)(v546 - v541) / (float)(v865 - v541)));
      if (v545 <= v540)
        goto LABEL_472;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v16 + 216), "firstObject"), "floatValue");
      v543 = *(float *)(v16 + 164);
      v544 = *(float *)&v1043.origin.x;
      if (v543 < *(float *)&v1043.origin.x)
        v544 = *(float *)(v16 + 164);
      if (v544 < v542)
        v544 = v542;
      v545 = (float)((float)(*(float *)(v16 + 1484) + -1.0) * (float)((float)(v544 - v542) / (float)(v543 - v542)))
           + 1.0;
      if (v545 <= v540)
      {
        v548 = v1044.width * v539 * v545;
        v528 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v548);
LABEL_472:
        v405 = v921;
        psn_conformRectForMSR420vfBoundedByDimensions(v527, 0.0, v528, v529, *(_QWORD *)&v1055, 1);
        v549 = *(_OWORD *)(v16 + 344);
        *(_OWORD *)&propertyValueOut.a = *(_OWORD *)(v16 + 328);
        *(_OWORD *)&propertyValueOut.c = v549;
        *(_OWORD *)&propertyValueOut.tx = *(_OWORD *)(v16 + 360);
        v1124 = CGRectApplyAffineTransform(v1123, &propertyValueOut);
        if (v1124.size.width <= 0.0 || (v550 = v1124.size.height, v1124.size.height <= 0.0))
        {
          v550 = v412;
          v553 = r1e;
        }
        else
        {
          v551 = v1124.origin.x;
          v552 = v1124.origin.y;
          v553 = v1124.size.width;
          VTPixelRotationSessionRotateSubImage();
          v1125.origin.x = v1017;
          v1125.origin.y = v1026;
          v1125.size.width = r1e;
          v1125.size.height = v412;
          v1178.origin.x = v986;
          v1178.origin.y = v883;
          v1178.size.width = v957;
          v1178.size.height = rect2a;
          if (CGRectEqualToRect(v1125, v1178))
          {
            v1026 = v552;
            v1017 = v551;
          }
          else
          {
            v1126.origin.x = v551;
            v1126.origin.y = v552;
            v1126.size.width = v553;
            v1126.size.height = v550;
            v1179.origin.x = v1017;
            v1179.origin.y = v1026;
            v1179.size.width = r1e;
            v1179.size.height = v412;
            v1127 = CGRectUnion(v1126, v1179);
            v1017 = v1127.origin.x;
            v1026 = v1127.origin.y;
            v553 = v1127.size.width;
            v550 = v1127.size.height;
          }
        }
        v407 = v883;
        v412 = v550;
        r1e = v553;
        b = v945;
        v336 = v927;
        d = v931;
        v408 = rect2a;
        v406 = v1017;
        v518 = v870;
        goto LABEL_479;
      }
    }
    v547 = v528 / (float)(v545 * *(float *)&v876);
    v1044.width = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v547);
    goto LABEL_472;
  }
LABEL_480:
  v863 = v373;
  if (!v74)
  {
    v946 = b;
    v980 = c;
    v884 = v407;
    rect2b = v408;
    r2a = v412;
    if (v373)
    {
      v559 = v406;
      v932 = d;
      v560 = recta.origin.x;
      v561 = recta.origin.y;
      v562 = recta.size.width;
      v563 = recta.size.height;
      propertyValueOut.a = recta.origin.x;
      propertyValueOut.b = recta.origin.y;
      *(CGSize *)&propertyValueOut.c = recta.size;
      v564 = v913;
      if (v405)
        v564 = v913 + v918 / v872;
      v565 = (double)v1055.i32[0];
      v566 = (double)v1055.i32[1];
      v557 = (opaqueCMSampleBuffer *)v111;
      if (*(_BYTE *)(v16 + 1560))
      {
        v558 = 0x1E0CB3000;
        if (*(float *)(v16 + 240) > 1.0 && objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A28]))
        {
          v993 = FigCaptureMetadataUtilitiesNormalizedSensorCenterOffsetInValidBufferRect(v1029);
          v969 = v567;
          v568 = CVPixelBufferGetWidth(v85);
          CVPixelBufferGetHeight(v85);
          v564 = v564 - FigCaptureMetadataUtilitiesDenormalizePoint(v993, v969, (double)v568);
          v570 = keya - v569;
        }
        else
        {
          v570 = keya;
        }
      }
      else
      {
        v570 = keya;
        v558 = 0x1E0CB3000;
      }
      *(float *)&v578 = v872;
      -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v85, *(CVPixelBufferRef *)&v1043.origin.y, 1, &propertyValueOut, v274, v275, v276, v560, v561, v562, v563, 0.0, 0.0, v565, v566, *(uint64_t *)&v564, *(uint64_t *)&v570, v578);
      v406 = v579;
      v581 = v580;
      v583 = v582;
      v585 = v584;
      v1128.origin.x = v559;
      v1128.origin.y = v1026;
      v1128.size.width = r1e;
      v1128.size.height = r2a;
      v1180.origin.x = v986;
      v1180.origin.y = v884;
      v1180.size.width = v957;
      v1180.size.height = rect2b;
      if (!CGRectEqualToRect(v1128, v1180))
      {
        v1129.origin.x = v406;
        v1129.origin.y = v581;
        v1129.size.width = v583;
        v1129.size.height = v585;
        v1181.origin.x = v559;
        v1181.origin.y = v1026;
        v1181.size.width = r1e;
        v1181.size.height = r2a;
        v1130 = CGRectUnion(v1129, v1181);
        v406 = v1130.origin.x;
        v581 = v1130.origin.y;
        v583 = v1130.size.width;
        v585 = v1130.size.height;
      }
      c = v980;
      v554 = 0;
      v555 = 0;
      v556 = 0;
      rect1.origin = *(CGPoint *)&propertyValueOut.a;
      rect1.size = *(CGSize *)&propertyValueOut.c;
      v412 = v585;
      r1e = v583;
      v1026 = v581;
      b = v946;
      v336 = v927;
      d = v932;
      v408 = rect2b;
      v407 = v884;
      goto LABEL_592;
    }
    v1018 = v406;
    if (*(_BYTE *)(v16 + 1440) && *(_BYTE *)(v16 + 904))
    {
      v571 = 1;
    }
    else
    {
      v571 = 0;
      v899 = v1048.origin.x;
      v902 = v1048.origin.y;
      v864 = v1048.size.width;
      v906 = v1048.size.height;
    }
    v572 = v886;
    v573 = 1.0 / v336;
    v574 = FigCaptureMetadataUtilitiesScaleRect2D(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, 1.0 / v336);
    if (v958)
    {
      v887 = v577;
      v919 = v576;
    }
    else
    {
      v574 = acpr_conformRectForMSR420vf(v574, v575, v576, v577);
      v919 = v586;
      v887 = v587;
    }
    v922 = v574;
    v959 = v575;
    if (!*(_BYTE *)(v16 + 1040))
      goto LABEL_504;
    if (v336 <= 1.0)
      goto LABEL_504;
    v588 = FigCaptureMetadataUtilitiesRectNormalizedToRect(0.0, 0.0, (double)v1055.i32[0], (double)v1055.i32[1], v1048.origin.x, v1048.origin.y, v1048.size.width);
    v590 = v589;
    v591 = d;
    v593 = v592;
    v595 = v594;
    v1131.origin.x = FigCaptureMetadataUtilitiesRectNormalizedToRect(rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v922, v959, v919);
    v1182.origin.x = v588;
    v1182.origin.y = v590;
    v1182.size.width = v593;
    d = v591;
    v412 = r2a;
    v1182.size.height = v595;
    if (!CGRectContainsRect(v1131, v1182))
    {
      v602 = FigCaptureMetadataUtilitiesScaleRect2D(v1048.origin.x, v1048.origin.y, v1048.size.width, v1048.size.height, v573);
      v871 = acpr_conformRectForMSR420vf(v602, v603, v604, v605);
      v866 = v606;
      v877 = v607;
      v608 = v573;
      v597 = v609;
      v610 = FigCaptureMetadataUtilitiesScaleRect2D(v899, v902, v864, v906, v608);
      v599 = acpr_conformRectForMSR420vf(v610, v611, v612, v613);
      v864 = v614;
      v601 = v615;
      v596 = 1;
      v598 = v887;
    }
    else
    {
LABEL_504:
      v596 = 0;
      v871 = v1048.origin.x;
      v866 = v1048.origin.y;
      v597 = v1048.size.width;
      v877 = v1048.size.height;
      v959 = rect1.origin.y;
      v919 = rect1.size.width;
      v922 = rect1.origin.x;
      v598 = rect1.size.height;
      v599 = v899;
      v600 = v902;
      v601 = v906;
    }
    if (v247 && *(_QWORD *)(v16 + 864))
    {
      v900 = v599;
      v903 = v600;
      -[BWPreviewStitcherNode _waitForCIPreheatingToFinish](v16);
      v556 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
      v616 = -[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
      v555 = (__CVBuffer *)v616;
      if (v556 && v616 && !VTPixelRotationSessionRotateSubImage())
      {
        v1183.size.width = v597;
        v1183.size.height = v877;
        *(float *)&v617 = v872 * (float)(v885 / v935);
        v1132.origin.x = v900;
        v1132.origin.y = v903;
        v1132.size.width = v864;
        v1132.size.height = v601;
        v1183.origin.x = v871;
        v1183.origin.y = v866;
        v936 = v1183.size.width;
        if (CGRectEqualToRect(v1132, v1183))
          goto LABEL_525;
        v1133.origin.x = v900;
        v1133.origin.y = v903;
        v1133.size.width = v864;
        v1133.size.height = v601;
        v1184.origin.x = v871;
        v1184.origin.y = v866;
        v1184.size.width = v936;
        v1184.size.height = v877;
        if (!CGRectContainsRect(v1133, v1184))
        {
LABEL_525:
          v618 = v951 - v861;
          v619 = v949 - v860;
        }
        else
        {
          x = v871 - v900;
          y = v866 - v903;
          v619 = v949;
          v618 = v951;
        }
        v629 = psn_pixelBufferRect(v247);
        propertyValueOut.a = psn_wideBoundingRect(*(unsigned __int8 *)(v16 + 204), v629, v630, v631, v632, v874, *(float *)&v1043.origin.x, v992, v873);
        propertyValueOut.b = v633;
        propertyValueOut.c = v634;
        propertyValueOut.d = v635;
        -[BWPreviewStitcherNode _transferPixelBuffer:rect:intoPixelBuffer:rect:isFinalOutput:withInputShift:scale:inputSourceRectOut:](v16, v247, v555, 0, &propertyValueOut, v636, v637, v638, propertyValueOut.a, v633, v634, v635, v986, v407, v864, v601, *(uint64_t *)&v618, *(uint64_t *)&v619, v617);
        if (v596)
        {
          a = FigCaptureMetadataUtilitiesScaleRect2D(propertyValueOut.a, propertyValueOut.b, propertyValueOut.c, propertyValueOut.d, v927);
          v640 = v639;
          v642 = v641;
          v644 = v643;
        }
        else
        {
          a = propertyValueOut.a;
          v640 = propertyValueOut.b;
          v642 = propertyValueOut.c;
          v644 = propertyValueOut.d;
        }
        v645 = *(void **)(v16 + 1608);
        v85 = v1015;
        if (v645)
        {

          *(_QWORD *)(v16 + 1608) = 0;
          v646 = *(const void **)(v16 + 1584);
          if (v646)
          {
            CFRelease(v646);
            *(_QWORD *)(v16 + 1584) = 0;
          }
        }
        v933 = v644;
        v946 = v640;
        objc_msgSend(*(id *)(v16 + 864), "updateRampForNextIteration");
        v647 = objc_msgSend(*(id *)(v16 + 864), "isRampingUp");
        objc_msgSend(*(id *)(v16 + 864), "currentValue");
        if (v647)
          v649 = v648;
        else
          v649 = 1.0 - v648;
        v554 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");

        *(_QWORD *)(v16 + 880) = 0;
        -[BWPreviewStitcherNode _renderOpacityRampToPixelBuffer:bounds:withWidePixelBuffer:telePixelBuffer:zoomingIn:progress:teleBounds:teleShift:](v16, v554, v555, v556, v647, v986, v407, v864, v601, v649, v650, v651, v652, v986, v407, v936, v877, x, y);
        *(_BYTE *)(v16 + 936) = 1;
        if ((objc_msgSend(*(id *)(v16 + 864), "isRamping") & 1) == 0)
        {
          objc_msgSend(*(id *)(v16 + 864), "currentValue");
          if (v653 == 1.0
            && (!v571 || !objc_msgSend(*(id *)(v16 + 1352), "isRamping") || *(_BYTE *)(v16 + 1388)))
          {

            *(_QWORD *)(v16 + 864) = 0;
            *(_BYTE *)(v16 + 904) = 0;
          }
        }
        v980 = v642;
        v654 = *(_OWORD *)(v16 + 344);
        *(_OWORD *)&propertyValueOut.a = *(_OWORD *)(v16 + 328);
        *(_OWORD *)&propertyValueOut.c = v654;
        *(_OWORD *)&propertyValueOut.tx = *(_OWORD *)(v16 + 360);
        v655 = v900;
        *(double *)&v654 = v903;
        v656 = v864;
        v657 = v601;
        v1134 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v654 - 8), &propertyValueOut);
        v658 = v1134.origin.y;
        v659 = v1134.size.width;
        v660 = v1134.size.height;
        v995 = v1134.origin.x;
        if (!VTPixelRotationSessionRotateSubImage())
        {
          v1185.origin.y = v407;
          v1135.origin.x = v1018;
          v1135.origin.y = v1026;
          v1135.size.width = r1e;
          v1135.size.height = r2a;
          v1185.origin.x = v986;
          v1185.size.width = v957;
          v1185.size.height = rect2b;
          v557 = (opaqueCMSampleBuffer *)v1028;
          v112 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
          v558 = 0x1E0CB3000;
          if (CGRectEqualToRect(v1135, v1185))
          {
            v412 = v660;
            r1e = v659;
            v1026 = v658;
            v406 = v995;
          }
          else
          {
            v1136.origin.x = v995;
            v1136.origin.y = v658;
            v1136.size.width = v659;
            v1136.size.height = v660;
            v1186.origin.x = v1018;
            v1186.origin.y = v1026;
            v1186.size.width = r1e;
            v1186.size.height = r2a;
            v1137 = CGRectUnion(v1136, v1186);
            v406 = v1137.origin.x;
            v1026 = v1137.origin.y;
            r1e = v1137.size.width;
            v412 = v1137.size.height;
          }
LABEL_545:
          v661 = &unk_1E4A02DF0;
          b = v946;
          v336 = v927;
          d = v933;
          v408 = rect2b;
          c = v980;
          goto LABEL_589;
        }
        goto LABEL_693;
      }
    }
    else
    {
      v933 = d;
      v888 = v598;
      if (!*(_QWORD *)(v16 + 1608))
      {
        v85 = v1015;
        v557 = (opaqueCMSampleBuffer *)v1028;
        v112 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        if (*(_QWORD *)(v16 + 1616))
        {
          -[BWPreviewStitcherNode _waitForCIPreheatingToFinish](v16);
          objc_msgSend(*(id *)(v16 + 1616), "updateRampForNextIteration");
          objc_msgSend(*(id *)(v16 + 1616), "currentValue");
          v663 = v662;
          v556 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
          v554 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");

          *(_QWORD *)(v16 + 880) = 0;
          if (!VTPixelRotationSessionRotateSubImage())
          {
            v996 = v663;
            -[BWPreviewStitcherNode _renderHDRPixelBufferToSDR:toOutputPixelBuffer:progress:](v16, v556, (uint64_t)v554, v663);
            v664 = *(_OWORD *)(v16 + 344);
            *(_OWORD *)&propertyValueOut.a = *(_OWORD *)(v16 + 328);
            *(_OWORD *)&propertyValueOut.c = v664;
            *(_OWORD *)&propertyValueOut.tx = *(_OWORD *)(v16 + 360);
            v665 = v871;
            *(double *)&v664 = v866;
            v666 = v597;
            v667 = v877;
            v1138 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v664 - 8), &propertyValueOut);
            v668 = v1138.origin.y;
            v669 = v1138.size.width;
            v670 = v1138.size.height;
            v970 = v1138.origin.x;
            if (!VTPixelRotationSessionRotateSubImage())
            {
              v1139.origin.x = v1018;
              v1139.origin.y = v1026;
              v1139.size.width = r1e;
              v1139.size.height = v412;
              v1187.origin.x = v986;
              v1187.origin.y = v407;
              v1187.size.width = v957;
              v1187.size.height = rect2b;
              if (CGRectEqualToRect(v1139, v1187))
              {
                v412 = v670;
                r1e = v669;
                v1026 = v668;
                v406 = v970;
              }
              else
              {
                v1146.origin.x = v970;
                v1146.origin.y = v668;
                v1146.size.width = v669;
                v1146.size.height = v670;
                v1191.origin.x = v1018;
                v1191.origin.y = v1026;
                v1191.size.width = r1e;
                v1191.size.height = v412;
                v1147 = CGRectUnion(v1146, v1191);
                v406 = v1147.origin.x;
                v1026 = v1147.origin.y;
                r1e = v1147.size.width;
                v412 = v1147.size.height;
              }
              psn_propagatePixelBufferDolbyVisionRPUData(v1015, *(CVBufferRef *)&v1043.origin.y);
              psn_propagatePixelBufferAmbientViewingEnvironment(v1015, *(__CVBuffer **)&v1043.origin.y);
              v558 = 0x1E0CB3000uLL;
              *(float *)&v737 = v996;
              v661 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v737);
              v555 = 0;
              b = v946;
              v336 = v927;
              d = v933;
              v408 = rect2b;
LABEL_589:
              if (*(_BYTE *)(v16 + 1107) && *(_BYTE *)(v16 + 1625))
              {
                CMSetAttachment(*(CMAttachmentBearerRef *)&v1043.origin.y, CFSTR("AmbientViewingEnvironmentStrength"), v661, 1u);
                v558 = 0x1E0CB3000uLL;
                IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)&v1043.origin.y);
                BWUtilitiesApplyAVEStrength(IOSurface, v661);
              }
              goto LABEL_592;
            }
          }
          fig_log_get_emitter();
          FigDebugAssert3();
          v555 = 0;
        }
        else
        {
          v730 = *(_OWORD *)(v16 + 344);
          *(_OWORD *)&propertyValueOut.a = *(_OWORD *)(v16 + 328);
          *(_OWORD *)&propertyValueOut.c = v730;
          *(_OWORD *)&propertyValueOut.tx = *(_OWORD *)(v16 + 360);
          v731 = v871;
          *(double *)&v730 = v866;
          v732 = v597;
          v733 = v877;
          v1144 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v730 - 8), &propertyValueOut);
          v406 = v1144.origin.x;
          v734 = v1144.origin.y;
          v735 = v1144.size.width;
          v736 = v1144.size.height;
          v558 = 0x1E0CB3000;
          if (!VTPixelRotationSessionRotateSubImage())
          {
            v1145.origin.x = v1018;
            v1145.origin.y = v1026;
            v1145.size.width = r1e;
            v1145.size.height = v412;
            v1190.origin.x = v986;
            v1190.origin.y = v407;
            v1190.size.width = v957;
            v1190.size.height = rect2b;
            if (CGRectEqualToRect(v1145, v1190))
            {
              v554 = 0;
              v555 = 0;
              v556 = 0;
              v412 = v736;
              r1e = v735;
              v1026 = v734;
            }
            else
            {
              v1165.origin.x = v406;
              v1165.origin.y = v734;
              v1165.size.width = v735;
              v1165.size.height = v736;
              v1197.origin.x = v1018;
              v1197.origin.y = v1026;
              v1197.size.width = r1e;
              v1197.size.height = v412;
              v1166 = CGRectUnion(v1165, v1197);
              v406 = v1166.origin.x;
              v1026 = v1166.origin.y;
              r1e = v1166.size.width;
              v412 = v1166.size.height;
              v554 = 0;
              v555 = 0;
              v556 = 0;
            }
            goto LABEL_545;
          }
          fig_log_get_emitter();
          FigDebugAssert3();
          v554 = 0;
          v555 = 0;
          v556 = 0;
        }
LABEL_696:
        v751 = v881;
        goto LABEL_668;
      }
      -[BWPreviewStitcherNode _waitForCIPreheatingToFinish](v16);
      v556 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
      v620 = -[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");
      v555 = (__CVBuffer *)v620;
      v85 = v1015;
      if (v556 && v620 && !VTPixelRotationSessionRotateSubImage())
      {
        propertyValueOut.a = 0.0;
        BWCMSampleBufferCreateCopyIncludingMetadata(*(CMSampleBufferRef *)(v16 + 1584), (CMSampleBufferRef *)&propertyValueOut);
        v1043.size.width = 0.0;
        rhs.origin.x = 0.0;
        BWOverCaptureSampleBufferUnpackAndRetain(*(CMAttachmentBearerRef *)&propertyValueOut.a, 1, &v1043.size.width, (CFTypeRef *)&rhs, 0, 0);
        if (*(_QWORD *)&propertyValueOut.a)
          CFRelease(*(CFTypeRef *)&propertyValueOut.a);
        v937 = v597;
        v621 = rhs.origin.x;
        v622 = (void *)objc_msgSend(v1032, "objectForKeyedSubscript:", v572, v848, v851);
        v907 = (void *)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)&v1043.size.width, v897, 0), "objectForKeyedSubscript:", v572);
        if (objc_msgSend(v622, "isEqual:"))
          v623 = v1043.size.width;
        else
          v623 = v621;
        v994 = v623;
        v624 = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)&v623);
        v625 = *MEMORY[0x1E0D06F58];
        v626 = (void *)objc_msgSend(v1032, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F58]);
        if (v626)
        {
          objc_msgSend(v626, "floatValue");
          v628 = v627;
        }
        else
        {
          v628 = 1.0;
        }
        v671 = *MEMORY[0x1E0D06CC8];
        v672 = (void *)objc_msgSend(v1032, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]);
        if (v672)
        {
          objc_msgSend(v672, "floatValue");
          v628 = v628 * v673;
        }
        v674 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)&v994, v897, 0);
        v675 = (void *)objc_msgSend(v674, "objectForKeyedSubscript:", v625);
        if (v675)
        {
          objc_msgSend(v675, "floatValue");
          v677 = v676;
        }
        else
        {
          v677 = 1.0;
        }
        v678 = (void *)objc_msgSend(v674, "objectForKeyedSubscript:", v671);
        v679 = v678;
        if (v678)
        {
          objc_msgSend(v678, "floatValue");
          v677 = v677 * v680;
        }
        v112 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        psn_pixelBufferRect(v1015);
        v960 = FigCaptureMetadataUtilitiesScaleRect2D(v922, v959, v919, v888, 1.0 / (v681 * v628));
        v683 = v682;
        v685 = v684;
        v687 = v686;
        psn_pixelBufferRect(v624);
        v689 = v688 * v677;
        v690 = psn_pixelBufferRect(v624);
        v692 = v691;
        v694 = v693;
        v696 = v695;
        FigCaptureMetadataUtilitiesScaleRect2D(v960, v683, v685, v687, v689);
        v698 = v697;
        v700 = v699;
        v701 = v690 + (v694 - v697) * 0.5;
        v702 = v692 + (v696 - v699) * 0.5;
        objc_msgSend(v679, "floatValue");
        if (v703 <= 1.0)
        {
          v557 = (opaqueCMSampleBuffer *)v1028;
          c = v980;
          v704 = r1e;
        }
        else
        {
          v557 = (opaqueCMSampleBuffer *)v1028;
          c = v980;
          v704 = r1e;
          if (objc_msgSend(v907, "isEqualToString:", *MEMORY[0x1E0D05A28]))
          {
            v705 = FigCaptureMetadataUtilitiesNormalizedSensorCenterOffsetInValidBufferRect(*(void **)&v994);
            v707 = v706;
            v708 = psn_pixelBufferDimensions(v624);
            v701 = v701 + FigCaptureMetadataUtilitiesDenormalizePoint(v705, v707, (double)v708);
            v702 = v702 + v709;
          }
        }
        if (v702 < 0.0)
        {
          FigCaptureMetadataUtilitiesScaleRect2D(v701, v702, v698, v700, 1.0);
          FigCaptureMetadataUtilitiesScaleRect2D(v986, v884, v937, v877, 1.0);
        }
        v710 = VTPixelRotationSessionRotateSubImage();
        if (*(_QWORD *)&v1043.size.width)
          CFRelease(*(CFTypeRef *)&v1043.size.width);
        if (*(_QWORD *)&rhs.origin.x)
          CFRelease(*(CFTypeRef *)&rhs.origin.x);
        if (!v710)
        {
          objc_msgSend(*(id *)(v16 + 1608), "currentValue");
          v712 = v711;
          objc_msgSend(*(id *)(v16 + 1608), "updateRampForNextIteration");
          if ((uint64_t)llroundf(a11) <= 59 && !*(_BYTE *)(v16 + 1041) && v712 != 1.0)
            objc_msgSend(*(id *)(v16 + 1608), "updateRampForNextIteration");
          objc_msgSend(*(id *)(v16 + 1608), "currentValue");
          v714 = v713;
          v554 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool]((int32x2_t *)v16), "newPixelBuffer");

          *(_QWORD *)(v16 + 880) = 0;
          -[BWPreviewStitcherNode _renderOpacityRampToPixelBuffer:bounds:withWidePixelBuffer:telePixelBuffer:zoomingIn:progress:teleBounds:teleShift:](v16, v554, v555, v556, 0, v986, v884, v937, v877, v714, v715, v716, v717, v986, v884, v937, v877, x, y);
          *(_BYTE *)(v16 + 936) = 1;
          v718 = *(_OWORD *)(v16 + 344);
          *(_OWORD *)&propertyValueOut.a = *(_OWORD *)(v16 + 328);
          *(_OWORD *)&propertyValueOut.c = v718;
          *(_OWORD *)&propertyValueOut.tx = *(_OWORD *)(v16 + 360);
          v719 = v871;
          *(double *)&v718 = v866;
          v720 = v937;
          v721 = v877;
          v1140 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v718 - 8), &propertyValueOut);
          v722 = v1140.origin.y;
          v723 = v1140.size.width;
          v724 = v1140.size.height;
          v997 = v1140.origin.x;
          if (!VTPixelRotationSessionRotateSubImage())
          {
            v1188.origin.x = v986;
            v1141.origin.x = v1018;
            v1141.origin.y = v1026;
            v1141.size.width = v704;
            v1141.size.height = r2a;
            v1188.origin.y = v884;
            v1188.size.width = v957;
            v1188.size.height = rect2b;
            if (CGRectEqualToRect(v1141, v1188))
            {
              v412 = v724;
              r1e = v723;
              v1026 = v722;
              v406 = v997;
            }
            else
            {
              v1142.origin.x = v997;
              v1142.origin.y = v722;
              v1142.size.width = v723;
              v1142.size.height = v724;
              v1189.origin.x = v1018;
              v1189.origin.y = v1026;
              v1189.size.width = v704;
              v1189.size.height = r2a;
              v1143 = CGRectUnion(v1142, v1189);
              v406 = v1143.origin.x;
              v1026 = v1143.origin.y;
              r1e = v1143.size.width;
              v412 = v1143.size.height;
            }
            v336 = v927;
            psn_propagatePixelBufferDolbyVisionRPUData(v1015, *(CVBufferRef *)&v1043.origin.y);
            psn_propagatePixelBufferAmbientViewingEnvironment(v1015, *(__CVBuffer **)&v1043.origin.y);
            v558 = 0x1E0CB3000uLL;
            v725 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(v16 + 1608), "currentValue");
            *(float *)&v727 = 1.0 - v726;
            v661 = (void *)objc_msgSend(v725, "numberWithFloat:", v727);
            b = v946;
            d = v933;
            v408 = rect2b;
            v407 = v884;
            if ((objc_msgSend(*(id *)(v16 + 1608), "isRamping") & 1) == 0)
            {
              objc_msgSend(*(id *)(v16 + 1608), "currentValue");
              if (v728 == 0.0)
              {

                *(_QWORD *)(v16 + 1608) = 0;
                v729 = *(const void **)(v16 + 1584);
                if (v729)
                {
                  CFRelease(v729);
                  *(_QWORD *)(v16 + 1584) = 0;
                }
              }
            }
            goto LABEL_589;
          }
LABEL_693:
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_696;
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v554 = 0;
    goto LABEL_696;
  }
  v554 = 0;
  v555 = 0;
  v556 = 0;
  v557 = (opaqueCMSampleBuffer *)v111;
  v558 = 0x1E0CB3000;
LABEL_592:
  v947 = b;
  v981 = c;
  v934 = d;
  if (*(_BYTE *)(v16 + v112[412]))
  {
    if (*(_BYTE *)(v16 + 1472))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v16 + 216), "firstObject"), "floatValue");
      if (*(float *)&v1043.origin.x >= v739 && *(float *)&v1043.origin.x < *(float *)(v16 + 164) && !v863)
      {
        -[BWPreviewStitcherNode _initTeleOpacityCIContextWithColorManagementEnabled:](v16, 0);
        v1043.origin.x = psn_blurPixelBufferBorder(*(void **)(v16 + 896), *(CVPixelBufferRef *)&v1043.origin.y, v406, v1026, r1e, v412, *(float *)(v16 + 1476));
        v1192.size.height = v408;
        v741 = v740;
        v743 = v742;
        v745 = v744;
        v1148.origin.x = v406;
        v1148.origin.y = v1026;
        v1148.size.width = r1e;
        v1148.size.height = v412;
        v1192.origin.y = v407;
        v1192.origin.x = v986;
        v1192.size.width = v957;
        v746 = v1192.size.height;
        if (CGRectEqualToRect(v1148, v1192))
        {
          v412 = v745;
          r1e = v743;
          v1026 = v741;
          v406 = v1043.origin.x;
        }
        else
        {
          v1149.origin.x = v1043.origin.x;
          v1149.origin.y = v741;
          v1149.size.width = v743;
          v1149.size.height = v745;
          v1193.origin.x = v406;
          v1193.origin.y = v1026;
          v1193.size.width = r1e;
          v1193.size.height = v412;
          v1150 = CGRectUnion(v1149, v1193);
          v406 = v1150.origin.x;
          v1026 = v1150.origin.y;
          r1e = v1150.size.width;
          v412 = v1150.size.height;
        }
        b = v947;
        v408 = v746;
        v336 = v927;
        d = v934;
      }
    }
  }
  v747 = *(void **)(v16 + 1096);
  if (v747
    && (v748 = *(unsigned __int8 *)(v16 + 1104),
        (v749 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)&v1043.origin.y)) != 0))
  {
    ID = IOSurfaceGetID(v749);
    *(CGPoint *)&propertyValueOut.a = v890;
    *(CGSize *)&propertyValueOut.c = v889;
    if (!v748)
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v747, "objectForKeyedSubscript:", objc_msgSend(*(id *)(v558 + 2024), "numberWithUnsignedInt:", ID)), (CGRect *)&propertyValueOut);
    v1151.origin.x = propertyValueOut.a;
    v1151.origin.y = propertyValueOut.b;
    v1151.size.width = propertyValueOut.c;
    v1151.size.height = propertyValueOut.d;
    v1194.origin.x = v986;
    v1194.origin.y = v407;
    v1194.size.width = v957;
    v1194.size.height = v408;
    v751 = v881;
    if (CGRectEqualToRect(v1151, v1194))
      goto LABEL_607;
    v1195.origin.x = propertyValueOut.a;
    v1195.origin.y = propertyValueOut.b;
    v1195.size.width = propertyValueOut.c;
    v1195.size.height = propertyValueOut.d;
    v1152.origin.x = v406;
    v1152.origin.y = v1026;
    v1152.size.width = r1e;
    v1152.size.height = v412;
    if (!CGRectContainsRect(v1152, v1195))
LABEL_607:
      VTFillPixelBufferBorderWithBlack();
    v1153.origin.x = v406;
    v1153.origin.y = v1026;
    v1153.size.width = r1e;
    v1153.size.height = v412;
    v752 = CGRectCreateDictionaryRepresentation(v1153);
    objc_msgSend(v747, "setObject:forKeyedSubscript:", CFAutorelease(v752), objc_msgSend(*(id *)(v558 + 2024), "numberWithUnsignedInt:", ID));
    v557 = (opaqueCMSampleBuffer *)v1028;
  }
  else
  {
    VTFillPixelBufferBorderWithBlack();
    v751 = v881;
  }
  if (v974)
    v753 = v557;
  else
    v753 = v1029;
  v754 = ImageBuffer;
  if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(v753, *(__CVBuffer **)&v1043.origin.y, (CFTypeRef *)(v16 + 320), &v1054))
  {
    v1019 = v406;
    if (v974)
      v755 = ImageBuffer;
    else
      v755 = v85;
    v756 = (const __CFString *)*MEMORY[0x1E0CA8E88];
    v757 = CMGetAttachment(v755, (CFStringRef)*MEMORY[0x1E0CA8E88], 0);
    CMSetAttachment(*(CMAttachmentBearerRef *)&v1043.origin.y, v756, v757, 1u);
    v758 = -[BWPreviewStitcherNode _scaleFactorAppliedForPixelBuffer:usedSourceRect:primaryCaptureRectAspectRatio:metadata:](v16, ImageBuffer, v1030, a, b, c, d, v991);
    v759 = -[BWPreviewStitcherNode _scaleFactorAppliedForPixelBuffer:usedSourceRect:primaryCaptureRectAspectRatio:metadata:](v16, v85, v1032, rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height, v991);
    r2b = v412;
    if (v336 <= 1.0)
    {
      v760 = v336;
    }
    else
    {
      v758 = v758 / v336;
      v760 = v336;
      v759 = v759 / v336;
    }
    v761 = v913 + point.x;
    v762 = keya + point.y;
    v763 = *MEMORY[0x1E0D06CC8];
    objc_msgSend((id)objc_msgSend(v1032, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8], v848), "floatValue");
    v765 = 1.0;
    if (v764 == 0.0)
      v766 = 1.0;
    else
      v766 = v764;
    objc_msgSend((id)objc_msgSend(v1030, "objectForKeyedSubscript:", v763), "floatValue");
    if (v769 != 0.0)
      v765 = v769;
    if (*(_BYTE *)(v16 + 152))
    {
      v771 = v897;
      if (*(_BYTE *)(v16 + 1388) && *(_BYTE *)(v16 + 1360) && (objc_msgSend(*(id *)(v16 + 864), "isRamping") & 1) == 0)
      {
        if (*(_BYTE *)(v16 + 244))
          v772 = objc_msgSend(*(id *)(v16 + 1352), "isRamping") ^ 1;
        else
          v772 = 1;
      }
      else
      {
        v772 = 0;
      }
    }
    else
    {
      v772 = 0;
      v771 = v897;
    }
    *(float *)&v770 = v759;
    -[BWPreviewStitcherNode _callDelegateWithAppliedWiderShift:narrowerShift:widerScaleFactor:narrowerScaleFactor:widerPixelBuffer:narrowerPixelBuffer:widerNondisruptiveSwitchingZoomFactor:narrowerNondisruptiveSwitchingZoomFactor:widerPortType:narrowerPortType:inSuperWideMacroMode:widerShiftAtBaseZoom:](v16, ImageBuffer, v85, (uint64_t)v904, v998, v772, v767, v768, v951, v949, v761, v762, v758, v770, v765, v766, v925, v924);
    v773 = (void *)CMGetAttachment(v1054, v771, 0);
    if (v760 <= 1.0
      && (v1154.origin.x = v893,
          v1154.origin.y = v892,
          v1154.size.width = v891,
          v1154.size.height = v915,
          CGRectIsNull(v1154)))
    {
      objc_msgSend(v773, "setObject:forKeyedSubscript:", 0, v923);
      v774 = v878;
    }
    else
    {
      v1155.origin.x = v893;
      v1155.origin.y = v892;
      v1155.size.width = v891;
      v1155.size.height = v915;
      v774 = v878;
      if (CGRectIsNull(v1155))
      {
        v775 = v965;
        v776 = v977;
        v777 = v962;
        v778 = FigCaptureMetadataUtilitiesScaleRect2D(v965, v977, v962, v967, 1.0 / v760);
      }
      else
      {
        memset(&propertyValueOut, 0, sizeof(propertyValueOut));
        v781 = *(CGSize *)(v16 + 344);
        v1043.size = *(CGSize *)(v16 + 328);
        v1044 = v781;
        v1045 = *(_OWORD *)(v16 + 360);
        CGAffineTransformInvert(&propertyValueOut, (CGAffineTransform *)&v1043.size);
        v1043.size = *(CGSize *)&propertyValueOut.a;
        v1044 = *(CGSize *)&propertyValueOut.c;
        v1045 = *(_OWORD *)&propertyValueOut.tx;
        v775 = v965;
        v1156.origin.x = v965;
        v776 = v977;
        v1156.origin.y = v977;
        v777 = v962;
        v1156.size.width = v962;
        v1156.size.height = v967;
        v1157 = CGRectApplyAffineTransform(v1156, (CGAffineTransform *)&v1043.size);
        v1158.origin.x = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v893, v892, v891, v915, v1157.origin.x, v1157.origin.y, v1157.size.width);
        v782 = *(CGSize *)(v16 + 344);
        v1043.size = *(CGSize *)(v16 + 328);
        v1044 = v782;
        v1045 = *(_OWORD *)(v16 + 360);
        *(CGRect *)&v778 = CGRectApplyAffineTransform(v1158, (CGAffineTransform *)&v1043.size);
      }
      v1043.origin.x = v778;
      v1033 = v779;
      v1031 = v780;
      v783 = psn_pixelBufferRect(*(__CVBuffer **)&v1043.origin.y);
      v785 = v784;
      v787 = v786;
      v789 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v783, v784, v786, v788, v775, v776, v777);
      v793 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v789, v790, v791, v792, v1043.origin.x, v1033, v1031);
      FigCaptureMetadataUtilitiesRectNormalizedToRect(v793, v794, v795, v796, v783, v785, v787);
      FigCFDictionarySetCGRect();
    }
    v1159.origin.x = v1019;
    v1159.origin.y = v1026;
    v1159.size.width = r1e;
    v1159.size.height = r2b;
    if (!CGRectIsEmpty(v1159))
    {
      v797 = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)&v1043.origin.y);
      v558 = 0x1E0CB3000uLL;
      v798 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)&v1043.origin.y);
      v799.f64[0] = 0.0;
      v800.f64[0] = v1019;
      v1160.origin.x = FigCaptureMetadataUtilitiesClampRectToBoundingRect(v800, v1026, r1e, r2b, v799, 0.0, v797, (double)v798);
      v801 = CGRectCreateDictionaryRepresentation(v1160);
      CMSetAttachment(v1054, CFSTR("OverCaptureStitchedValidBufferRect"), v801, 1u);
      if (v801)
        CFRelease(v801);
    }
    if (v751)
      CMSetAttachment(v1054, CFSTR("CAContextFencePortSendRight"), v751, 1u);
    if (v774 >= 1)
      CMSetAttachment(v1054, CFSTR("CAContextFencePortGenerationID"), (CFTypeRef)objc_msgSend(*(id *)(v558 + 2024), "numberWithLongLong:", v774), 1u);
    if (v991 != *(float *)(v16 + 800))
      *(float *)(v16 + 800) = v991;
    if (*(_BYTE *)(v16 + 145))
    {
      propertyValueOut.a = 0.0;
      VTSessionCopyProperty(*(VTSessionRef *)(v16 + 312), (CFStringRef)*MEMORY[0x1E0CED788], (CFAllocatorRef)*MEMORY[0x1E0C9AE00], &propertyValueOut);
      v802 = (void *)objc_msgSend(*(id *)&propertyValueOut.a, "copy");
      CMSetAttachment(v1054, (CFStringRef)*MEMORY[0x1E0D05DE0], v802, 1u);

    }
    v803 = v962;
    if (ImageBuffer)
      CMSetAttachment(v1054, CFSTR("IsOverCaptureFrame"), (CFTypeRef)objc_msgSend(*(id *)(v558 + 2024), "numberWithBool:", 1), 1u);
    if (*(_DWORD *)(v16 + 104))
      CMSetAttachment(*(CMAttachmentBearerRef *)&v1043.origin.y, CFSTR("RotationDegrees"), (CFTypeRef)objc_msgSend(*(id *)(v558 + 2024), "numberWithInt:"), 1u);
    if (*(_BYTE *)(v16 + 108))
    {
      v804 = kBWNodeBufferAttachmentKey_MirroredHorizontal;
    }
    else
    {
      if (!*(_BYTE *)(v16 + 109))
      {
LABEL_657:
        -[BWPreviewStitcherNode _updateUprightExifOrientationOnSampleBufferIfNeeded:](v16, v1054);
        memset(&propertyValueOut, 0, sizeof(propertyValueOut));
        v805 = *(CGSize *)(v16 + 344);
        v1043.size = *(CGSize *)(v16 + 328);
        v1044 = v805;
        v1045 = *(_OWORD *)(v16 + 360);
        CGAffineTransformInvert(&propertyValueOut, (CGAffineTransform *)&v1043.size);
        v1043.size = *(CGSize *)&propertyValueOut.a;
        v1044 = *(CGSize *)&propertyValueOut.c;
        v1045 = *(_OWORD *)&propertyValueOut.tx;
        v1161.origin.x = v965;
        v1161.origin.y = v977;
        v1161.size.width = v962;
        v1161.size.height = v967;
        v1162 = CGRectApplyAffineTransform(v1161, (CGAffineTransform *)&v1043.size);
        v806 = v1162.origin.x;
        v807 = v1162.origin.y;
        v808 = v1162.size.width;
        v809 = v1162.size.height;
        v1043.size = *(CGSize *)&propertyValueOut.a;
        v1044 = *(CGSize *)&propertyValueOut.c;
        v1045 = *(_OWORD *)&propertyValueOut.tx;
        v1162.origin.x = v1019;
        v1162.origin.y = v1026;
        v1162.size.width = r1e;
        v1162.size.height = r2b;
        v1163 = CGRectApplyAffineTransform(v1162, (CGAffineTransform *)&v1043.size);
        v810 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v806, v807, v808, v809, v1163.origin.x, v1163.origin.y, v1163.size.width);
        if (v974)
        {
          v814 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v810, v811, v812, v813, a, v947, v981);
          v816 = v815;
          v818 = v817;
          v820 = v819;
        }
        else if (v863)
        {
          v814 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v810, v811, v812, v813, rect1.origin.x, rect1.origin.y, rect1.size.width);
          v816 = v821;
          v818 = v822;
          v820 = v823;
          v754 = v1015;
        }
        else
        {
          v814 = rect1.origin.x;
          v816 = rect1.origin.y;
          v754 = v1015;
          v818 = rect1.size.width;
          v820 = rect1.size.height;
        }
        if (a8)
        {
          CVPixelBufferGetWidth(v754);
          CVPixelBufferGetHeight(v754);
          v803 = v962;
          FigCaptureMetadataUtilitiesNormalizeCropRect(v814, v816, v818, v820);
          *a8 = v824;
          a8[1] = v825;
          a8[2] = v826;
          a8[3] = v827;
        }
        LOBYTE(v1043.size.width) = 0;
        v828 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(*(unsigned int *)(v16 + 104), *(unsigned __int8 *)(v16 + 108), *(unsigned __int8 *)(v16 + 109), (char *)&v1043.size);
        BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(v1054, (const __CFString *)*MEMORY[0x1E0CA2638], v828, LOBYTE(v1043.size.width), v814, v816, v818, v820, v965, v977, v803, v967);
        if (*(_BYTE *)(v16 + 1502))
        {
          v829 = FigCaptureMetadataUtilitiesScaleRect2D(v814, v816, v818, v820, 1.0 / v927);
          v831 = v830;
          v833 = v832;
          v835 = v834;
          v836 = psn_pixelBufferDimensions(v1015);
          BWUpdateTrackedFacesMetadataOnSampleBuffer(v1054, v829, v831, v833, v835, v965, v977, v803, v967, v836, v828, LOBYTE(v1043.size.width));
        }
        if (a7)
        {
          *a7 = v951;
          a7[1] = v949;
        }
        goto LABEL_668;
      }
      v804 = kBWNodeBufferAttachmentKey_MirroredVertical;
    }
    CMSetAttachment(*(CMAttachmentBearerRef *)&v1043.origin.y, *v804, MEMORY[0x1E0C9AAB0], 1u);
    goto LABEL_657;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_668:
  if (*(_QWORD *)&v1043.origin.y)
    CFRelease(*(CFTypeRef *)&v1043.origin.y);
  if (v556)
    CFRelease(v556);
  if (v555)
    CFRelease(v555);
  if (v554)
    CFRelease(v554);

  return v1054;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  if (BYTE1(self->_narrowerCameraFoVFillsOverCapture.name) && !BYTE2(self->_narrowerCameraFoVFillsOverCapture.name))
  {
    BYTE2(self->_narrowerCameraFoVFillsOverCapture.name) = 1;
  }
  else
  {
    if (!self->_stoppingForModeSwitch)
      -[BWPreviewStitcherNode _setOverCaptureStatus:]((id *)&self->super.super.isa, 0);
    -[BWPreviewStitcherNode _waitForCIPreheatingToFinish]((uint64_t)self);

    self->_fencePortSendRight = 0;
    objc_msgSend(*(id *)&self->_superMacroEdgeFeatheringShowBlurMask, "flush");
    if (!BYTE4(self->_narrowerCameraFoVFillsOverCapture.name) && !BYTE3(self->_blackFilledBorderRectsBySurfaceID))
      -[BWPreviewStitcherNode _releaseResources]((uint64_t)self);
    v5.receiver = self;
    v5.super_class = (Class)BWPreviewStitcherNode;
    -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
  }
}

- (void)_waitForCIPreheatingToFinish
{
  NSObject *v2;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 928);
    if (v2)
    {
      dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

      *(_QWORD *)(a1 + 928) = 0;
    }
  }
}

- (void)_getInputRect:(CGFloat *)a3 outputRect:(double *)a4 inputShiftAppliedInOutputRect:(__CVBuffer *)a5 toTransferPixelBuffer:(uint64_t)a6 rect:(int)a7 intoPixelBufferDimensions:(int)a8 rect:(CGFloat)a9 withInputShift:(CGFloat)a10 shiftOutsideBoundingRectAllowed:(CGFloat)a11 scale:(CGFloat)a12 forFinalOutput:(CGFloat)a13
{
  int v30;
  double width;
  double height;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  int v47;
  int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MidY;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double MidX;
  double v65;
  CGFloat v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  if (!a1)
    return;
  if (!a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return;
  }
  v30 = *(unsigned __int8 *)(a1 + 1501);
  FigCaptureMetadataUtilitiesScaleRect2D(a9, a10, a11, a12, a19);
  width = v67.size.width;
  height = v67.size.height;
  v59 = a19;
  v33 = a14 + (a16 - v67.size.height) * 0.5 + a18 * a19;
  v34 = a13 + (a15 - v67.size.width) * 0.5 + a17 * a19;
  v67.origin.x = v34;
  v67.origin.y = v33;
  v73.origin.x = a13;
  v73.origin.y = a14;
  v73.size.width = a15;
  v73.size.height = a16;
  v68 = CGRectIntersection(v67, v73);
  v57 = a13;
  v58 = a16;
  v56 = a14;
  if (a7)
    psn_conformRectForMSR420vfBoundedByDimensions(v68.origin.x, v68.origin.y, v68.size.width, v68.size.height, a6, a8);
  else
    v35 = psn_conformRectForMSR420vfBoundedByRect(1, v68.origin.x, v68.origin.y, v68.size.width, v68.size.height, a13, a14, a15, a16);
  v39 = v38;
  v40 = a15;
  v66 = v35;
  v41 = a9 + a11 * ((v35 - v34) / width);
  v42 = a10 + a12 * ((v36 - v33) / height);
  v43 = a11 * (v37 / width);
  v44 = a12 * (v38 / height);
  v45 = v37;
  v46 = v36;
  if (a7)
  {
    v47 = CVPixelBufferGetWidth(a5);
    v48 = CVPixelBufferGetHeight(a5);
    if (v30)
    {
      if (v43 <= (double)v47)
        v49 = v43;
      else
        v49 = (double)v47;
      if (v49 >= 0.0)
        v50 = v49;
      else
        v50 = 0.0;
      if (v44 <= (double)v48)
        v51 = v44;
      else
        v51 = (double)v48;
      if (v51 < 0.0)
        v51 = 0.0;
      v52 = (double)v47 - v50;
      if (v52 >= v41)
        v52 = v41;
      if (v52 < 0.0)
        v52 = 0.0;
      v53 = (double)v48 - v51;
      if (v53 >= v42)
        v53 = v42;
      if (v53 < 0.0)
        v53 = 0.0;
      if (!a2)
        goto LABEL_36;
    }
    else
    {
      psn_conformRectForMSR420vfBoundedByDimensions(v41, v42, v43, v44, v47 | ((unint64_t)v48 << 32), 0);
      if (!a2)
        goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (v30)
  {
    v52 = psn_rectBoundedByRect(v41, v42, v43, v44, a9, a10, a11, a12);
    if (!a2)
      goto LABEL_36;
    goto LABEL_35;
  }
  v52 = psn_conformRectForMSR420vfBoundedByRect(0, v41, v42, v43, v44, a9, a10, a11, a12);
  if (a2)
  {
LABEL_35:
    *a2 = v52;
    a2[1] = v53;
    a2[2] = v50;
    a2[3] = v51;
  }
LABEL_36:
  if (a3)
  {
    *a3 = v66;
    a3[1] = v46;
    a3[2] = v45;
    a3[3] = v39;
  }
  if (a4)
  {
    v69.origin.x = v66;
    v69.origin.y = v46;
    v69.size.width = v45;
    v69.size.height = v39;
    MidX = CGRectGetMidX(v69);
    v70.origin.x = v57;
    v70.origin.y = v56;
    v70.size.width = v40;
    v70.size.height = v58;
    v65 = MidX - CGRectGetMidX(v70);
    v71.origin.x = v66;
    v71.origin.y = v46;
    v71.size.width = v45;
    v71.size.height = v39;
    MidY = CGRectGetMidY(v71);
    v72.origin.x = v57;
    v72.origin.y = v56;
    v72.size.width = v40;
    v72.size.height = v58;
    v55 = CGRectGetMidY(v72);
    *a4 = v65 / v59;
    a4[1] = (MidY - v55) / v59;
  }
}

- (uint64_t)_transferPixelBuffer:(CVPixelBufferRef)pixelBuffer rect:(int)a4 intoPixelBuffer:(_OWORD *)a5 rect:(int)a6 isFinalOutput:(int)a7 withInputShift:(int)a8 scale:(CGFloat)a9 inputSourceRectOut:(CGFloat)a10
{
  uint64_t v28;
  CGSize v29;
  unsigned int Width;
  unint64_t v31;
  CGSize v32;
  __int128 v33;
  CGAffineTransform v37;
  unint64_t v38;
  __int128 v39;
  CGSize v40;
  __int128 v41;
  CGSize v42;
  CGRect v43;
  CGRect v44;

  if (result)
  {
    v28 = result;
    v29 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v41 = *MEMORY[0x1E0C9D648];
    v42 = v29;
    v39 = v41;
    v40 = v29;
    Width = CVPixelBufferGetWidth(pixelBuffer);
    v31 = Width | ((unint64_t)CVPixelBufferGetHeight(pixelBuffer) << 32);
    v38 = v31;
    if (a4)
    {
      FigCaptureSwapVideoDimensionsFor90Or270Rotation((int32x2_t *)&v38, *(_DWORD *)(v28 + 104));
      v31 = v38;
    }
    -[BWPreviewStitcherNode _getInputRect:outputRect:inputShiftAppliedInOutputRect:toTransferPixelBuffer:rect:intoPixelBufferDimensions:rect:withInputShift:shiftOutsideBoundingRectAllowed:scale:forFinalOutput:](v28, (double *)&v39, (CGFloat *)&v41, 0, a2, v31, 1, a4, a9, a10, a11, a12, a13, a14, a15, a16, *(double *)&a17, *(double *)&a18, *(float *)&a19);
    if (a5)
    {
      v32 = v40;
      *a5 = v39;
      a5[1] = v32;
    }
    if ((a4 & 1) != 0)
    {
      v43.origin.y = *((CGFloat *)&v41 + 1);
      v43.size = v42;
      v33 = *(_OWORD *)(v28 + 344);
      *(_OWORD *)&v37.a = *(_OWORD *)(v28 + 328);
      *(_OWORD *)&v37.c = v33;
      *(_OWORD *)&v37.tx = *(_OWORD *)(v28 + 360);
      *(_QWORD *)&v43.origin.x = v41;
      v44 = CGRectApplyAffineTransform(v43, &v37);
      *(CGFloat *)&v41 = v44.origin.x;
      *((_QWORD *)&v41 + 1) = *(_QWORD *)&v44.origin.y;
      v42.width = v44.size.width;
      v42.height = v44.size.height;
    }
    result = VTPixelRotationSessionRotateSubImage();
    if ((_DWORD)result)
    {
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_compensateForMissingFOVUsingPixelBuffer:(__CVBuffer *)a3 sourceRect:(int)a4 destinationContainingRect:(int)a5 destinationInsetRect:(int)a6 outputPixelBuffer:(int)a7
{
  uint64_t v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  float v34;
  double v35;
  float v36;
  float v37;
  CGFloat v38;
  CGFloat MidY;
  CGFloat MidX;
  CGFloat v41;
  void *v42;
  double v43;
  float v44;
  double v45;
  float v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  void *v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CGAffineTransform v74;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v83;
  CGAffineTransform v84;
  uint64_t v85;
  _QWORD v86[2];
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v86[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v27 = result;
    CVPixelBufferGetWidth(pixelBuffer);
    v28 = (double)CVPixelBufferGetHeight(pixelBuffer) - (a10 + a12);
    CVPixelBufferGetWidth(a3);
    CVPixelBufferGetHeight(a3);
    v85 = *MEMORY[0x1E0C9E128];
    v86[0] = MEMORY[0x1E0C9AAB0];
    v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
    v30 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", pixelBuffer, v29), "imageByCroppingToRect:", a9, v28, a11, a12);
    v72 = *MEMORY[0x1E0C9BAA8];
    v73 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v83.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v83.c = v73;
    v71 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v83.tx = v71;
    CGAffineTransformRotate(&v84, &v83, -1.57079633);
    v31 = (void *)objc_msgSend(v30, "imageByApplyingTransform:", &v84);
    objc_msgSend(v31, "extent");
    v32 = (void *)objc_msgSend(v31, "imageByCroppingToRect:");
    objc_msgSend(v32, "extent");
    v34 = *(double *)&a19 / v33;
    objc_msgSend(v32, "extent");
    v36 = *(double *)&a20 / v35;
    if (v34 <= v36)
      v37 = *(double *)&a20 / v35;
    else
      v37 = v34;
    *(_OWORD *)&v83.a = v72;
    *(_OWORD *)&v83.c = v73;
    *(_OWORD *)&v83.tx = v71;
    objc_msgSend(v32, "extent");
    v38 = -CGRectGetMidX(v87);
    objc_msgSend(v32, "extent");
    MidY = CGRectGetMidY(v88);
    CGAffineTransformMakeTranslation(&t2, v38, -MidY);
    *(_OWORD *)&t1.a = v72;
    *(_OWORD *)&t1.c = v73;
    *(_OWORD *)&t1.tx = v71;
    CGAffineTransformConcat(&v83, &t1, &t2);
    CGAffineTransformMakeScale(&v80, v37, v37);
    v79 = v83;
    CGAffineTransformConcat(&t1, &v79, &v80);
    v83 = t1;
    objc_msgSend(v32, "extent");
    MidX = CGRectGetMidX(v89);
    objc_msgSend(v32, "extent");
    v41 = CGRectGetMidY(v90);
    CGAffineTransformMakeTranslation(&v78, MidX, v41);
    v79 = v83;
    CGAffineTransformConcat(&t1, &v79, &v78);
    v83 = t1;
    v42 = (void *)objc_msgSend(v32, "imageByApplyingTransform:", &t1);
    objc_msgSend(v32, "extent");
    v44 = a15 / v43;
    objc_msgSend(v32, "extent");
    v46 = a16 / v45;
    if (v44 <= v46)
      v44 = a16 / v45;
    *(_OWORD *)&t1.a = v72;
    *(_OWORD *)&t1.c = v73;
    *(_OWORD *)&t1.tx = v71;
    objc_msgSend(v32, "extent");
    v47 = -CGRectGetMidX(v91);
    objc_msgSend(v32, "extent");
    v48 = CGRectGetMidY(v92);
    CGAffineTransformMakeTranslation(&v77, v47, -v48);
    *(_OWORD *)&v79.a = v72;
    *(_OWORD *)&v79.c = v73;
    *(_OWORD *)&v79.tx = v71;
    CGAffineTransformConcat(&t1, &v79, &v77);
    CGAffineTransformMakeScale(&v76, v44, v44);
    v75 = t1;
    CGAffineTransformConcat(&v79, &v75, &v76);
    t1 = v79;
    objc_msgSend(v32, "extent");
    v49 = CGRectGetMidX(v93);
    objc_msgSend(v32, "extent");
    v50 = CGRectGetMidY(v94);
    CGAffineTransformMakeTranslation(&v74, v49, v50);
    v75 = t1;
    CGAffineTransformConcat(&v79, &v75, &v74);
    t1 = v79;
    v51 = (void *)objc_msgSend(v32, "imageByApplyingTransform:", &v79);
    v52 = (void *)objc_msgSend(v42, "imageByCompositingOverImage:", v51);
    objc_msgSend(v42, "extent");
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    objc_msgSend(v51, "extent");
    v65 = psn_imageWithBlurredEdges(v52, 0, v54, v56, v58, v60, v61, v62, v63, v64, 0.0, 0.5);
    v66 = objc_msgSend(v32, "colorSpace");
    v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", a3);
    objc_msgSend(v67, "setColorSpace:", v66);
    v68 = *(void **)(v27 + 896);
    objc_msgSend(v52, "extent");
    v69 = (void *)objc_msgSend(v68, "startTaskToRender:fromRect:toDestination:atPoint:error:", v65, v67, 0);
    v79.a = 0.0;
    return objc_msgSend(v69, "waitUntilCompletedAndReturnError:", &v79);
  }
  return result;
}

- (int32x2_t)_teleOpacityPool
{
  int32x2_t *v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  BWMemoryPool *v5;
  int32x2_t v6;
  BWVideoFormatRequirements *v7;
  int32x2_t v8;
  BWVideoFormatRequirements *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = (int32x2_t *)result[109];
    if (!result)
    {
      v8.i32[0] = objc_msgSend((id)objc_msgSend(*(id *)&v1[2], "videoFormat"), "width");
      v8.i32[1] = objc_msgSend((id)objc_msgSend(*(id *)&v1[2], "videoFormat"), "height");
      v2 = objc_msgSend((id)objc_msgSend(*(id *)&v1[2], "videoFormat", COERCE_DOUBLE(FigCaptureSwapVideoDimensionsFor90Or270Rotation(&v8, v1[13].i32[0]))), "pixelFormat");
      if (v2 == 1882468912)
        v3 = 2016686640;
      else
        v3 = v2;
      v4 = objc_msgSend((id)objc_msgSend(*(id *)&v1[2], "videoFormat"), "colorSpaceProperties");
      v5 = +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool");
      v6 = v8;
      v7 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v7, "setWidth:", (int)FigCaptureRoundFloatToMultipleOf(2, (float)v6.i32[0]));
      -[BWVideoFormatRequirements setHeight:](v7, "setHeight:", (int)FigCaptureRoundFloatToMultipleOf(2, (float)v6.i32[1]));
      v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v7, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1));
      v9 = v7;
      v1[109] = (int32x2_t)-[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1)), 3, CFSTR("BWPreviewStitcherNode tele opacity ramp"), v5);
      v1[111] = v8;
      return (int32x2_t *)v1[109];
    }
  }
  return result;
}

- (uint64_t)_renderOpacityRampToPixelBuffer:(__CVBuffer *)a3 bounds:(__CVBuffer *)a4 withWidePixelBuffer:(int)a5 telePixelBuffer:(double)a6 zoomingIn:(double)a7 progress:(double)a8 teleBounds:(double)a9 teleShift:(float)a10
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  uint64_t v32;
  size_t Height;
  uint64_t v34;
  double v35;
  id v36;
  uint64_t v39;
  CGAffineTransform v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v25 = result;
    -[BWPreviewStitcherNode _initTeleOpacityCIContextWithColorManagementEnabled:](result, *(_BYTE *)(result + 1625));
    v41 = *MEMORY[0x1E0C9E128];
    v42[0] = MEMORY[0x1E0C9AAB0];
    v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v27 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", a3, v26);
    v28 = (void *)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", a4, v26);
    v29 = objc_msgSend(v28, "colorSpace");
    v30 = (double)CVPixelBufferGetHeight(a4) - a17;
    v31 = (void *)objc_msgSend(v28, "imageByCroppingToRect:", a14, v30, a16, a17);
    CGAffineTransformMakeTranslation(&v40, a18, -a19);
    v32 = objc_msgSend(v31, "imageByApplyingTransform:", &v40);
    Height = CVPixelBufferGetHeight(a3);
    v34 = -[BWPreviewStitcherNode _featheredImageWithTeleImage:wideImage:teleClipRect:wideClipRect:zoomingIn:progress:](v25, v32, v27, a5, a14 + a18, v30 - a19, a16, a17, a6, (double)Height - a9, a8, a9, a10);
    v35 = (double)CVPixelBufferGetHeight(a2) - a9;
    v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", a2);
    objc_msgSend(v36, "setColorSpace:", v29);
    v39 = 0;
    return objc_msgSend((id)objc_msgSend(*(id *)(v25 + 896), "startTaskToRender:fromRect:toDestination:atPoint:error:", v34, v36, 0, a6, v35, a8, a9, a6, v35), "waitUntilCompletedAndReturnError:", &v39);
  }
  return result;
}

- (uint64_t)_renderHDRPixelBufferToSDR:(uint64_t)a3 toOutputPixelBuffer:(float)a4 progress:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CGFloat Width;
  CGFloat Height;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    v9 = MEMORY[0x1E0C9AAB0];
    v10 = *MEMORY[0x1E0C9E170];
    v22[0] = *MEMORY[0x1E0C9E128];
    v8 = v22[0];
    v22[1] = v10;
    v23[0] = MEMORY[0x1E0C9AAB0];
    v23[1] = MEMORY[0x1E0C9AAB0];
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v20 = v8;
    v21 = v9;
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", a2, v12);
    v14 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", a2, v11);
    Width = (double)CVPixelBufferGetWidth(a2);
    Height = (double)CVPixelBufferGetHeight(a2);
    v17 = -[BWPreviewStitcherNode _featheredImageWithTeleImage:wideImage:teleClipRect:wideClipRect:zoomingIn:progress:](v7, v14, (uint64_t)v13, 0, 0.0, 0.0, Width, Height, 0.0, 0.0, Width, Height, a4);
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", a3);
    objc_msgSend(v18, "setColorSpace:", objc_msgSend(v13, "colorSpace"));
    v19 = 0;
    return objc_msgSend((id)objc_msgSend(*(id *)(v7 + 896), "startTaskToRender:fromRect:toDestination:atPoint:error:", v17, v18, 0, 0.0, 0.0, Width, Height, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8)), "waitUntilCompletedAndReturnError:", &v19);
  }
  return result;
}

- (void)_initTeleOpacityCIContextWithColorManagementEnabled:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  if (a1 && !*(_QWORD *)(a1 + 896))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0C9E070]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0C9DFC8]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C9DF58]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9DFA0]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier")), CFSTR("kCIContextIOSurfaceMemoryPoolID"));
    if ((a2 & 1) == 0)
    {
      v5 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C9DFC0]);
    }
    v6 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice"), "newCommandQueue");
    v7 = *(_QWORD *)(a1 + 1640);
    if (!v7)
    {
      v7 = FigDispatchQueueCreateWithPriority();
      *(_QWORD *)(a1 + 1640) = v7;
    }
    objc_msgSend(v6, "setCompletionQueue:", v7);
    objc_msgSend(v6, "setSubmissionQueue:", v7);
    *(_QWORD *)(a1 + 896) = (id)objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithMTLCommandQueue:options:", v6, v8);

  }
}

- (uint64_t)_callDelegateWithAppliedWiderShift:(CVPixelBufferRef)a3 narrowerShift:(uint64_t)a4 widerScaleFactor:(uint64_t)a5 narrowerScaleFactor:(uint64_t)a6 widerPixelBuffer:(int)a7 narrowerPixelBuffer:(int)a8 widerNondisruptiveSwitchingZoomFactor:(double)a9 narrowerNondisruptiveSwitchingZoomFactor:(double)a10 widerPortType:(double)a11 narrowerPortType:(double)a12 inSuperWideMacroMode:(float)a13 widerShiftAtBaseZoom:(double)a14
{
  uint64_t v18;
  int v26;
  double v29;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int Width;
  int Height;
  double v40;
  double v41;
  double v42;
  double v43;
  int v44;
  int v45;
  double v46;
  double v47;
  double v48;

  if (result)
  {
    v18 = result;
    if (!*(_BYTE *)(result + 1562) && !*(_BYTE *)(result + 384))
    {
      v26 = LODWORD(a14);
      v29 = a11;
      v32 = *MEMORY[0x1E0C9D538];
      v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v34 = *MEMORY[0x1E0C9D538];
      v35 = v33;
      v36 = *MEMORY[0x1E0C9D538];
      v37 = v33;
      if (pixelBuffer)
      {
        v46 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        v47 = *MEMORY[0x1E0C9D538];
        Width = CVPixelBufferGetWidth(pixelBuffer);
        Height = CVPixelBufferGetHeight(pixelBuffer);
        v33 = v46;
        v32 = v47;
        v40 = (float)((float)Width * a15);
        v34 = -a9 / v40;
        a11 = (float)((float)Height * a15);
        v35 = -a10 / a11;
        v36 = -*(double *)&a17 / v40;
        a14 = -*(double *)&a18;
        v37 = -*(double *)&a18 / a11;
      }
      if (a3)
      {
        v48 = v34;
        v41 = v36;
        v42 = v37;
        v43 = v35;
        v44 = CVPixelBufferGetWidth(a3);
        v45 = CVPixelBufferGetHeight(a3);
        v35 = v43;
        v37 = v42;
        v36 = v41;
        v34 = v48;
        v32 = -v29 / (float)((float)v44 * a16);
        a11 = -a12;
        v33 = -a12 / (float)((float)v45 * a16);
      }
      *(float *)&a11 = a13;
      LODWORD(a14) = v26;
      return objc_msgSend(*(id *)(v18 + 376), "previewStitcher:didApplyWiderShift:widerScaleFactor:forWiderPortType:narrowerShift:narrowerScaleFactor:forNarrowerPortType:inSuperWideMacroMode:widerShiftAtBaseZoom:", v18, a4, a5, a6, v34, v35, a11, v32, v33, a14, v36, v37);
    }
  }
  return result;
}

- (uint64_t)_featheredImageWithTeleImage:(uint64_t)a3 wideImage:(int)a4 teleClipRect:(CGFloat)a5 wideClipRect:(CGFloat)a6 zoomingIn:(CGFloat)a7 progress:(CGFloat)a8
{
  int *v25;
  float v26;
  int *v27;
  int *v28;
  int *v29;
  float v30;
  float v31;
  float v32;
  int v33;
  double v34;
  void *v35;
  double MidX;
  double v37;
  double v38;
  double v39;
  CGColorSpace *v40;
  double v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  uint64_t v49;
  void *v50;
  void *v51;
  float v52;
  float v53;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v67;
  CGRect v68;
  CGRect v69;

  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 965))
    a2 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithColor:", objc_msgSend(MEMORY[0x1E0C9DD80], "redColor"));
  v25 = &OBJC_IVAR___BWPreviewStitcherNode__zoomOutFeatheringInnerRadiusStart;
  if (a13 <= 1.0)
    v26 = a13;
  else
    v26 = 1.0;
  if (v26 < 0.0)
    v26 = 0.0;
  if (a4)
    v25 = &OBJC_IVAR___BWPreviewStitcherNode__zoomInFeatheringInnerRadiusStart;
  v27 = &OBJC_IVAR___BWPreviewStitcherNode__zoomOutFeatheringInnerRadiusEnd;
  if (a4)
    v27 = &OBJC_IVAR___BWPreviewStitcherNode__zoomInFeatheringInnerRadiusEnd;
  v28 = &OBJC_IVAR___BWPreviewStitcherNode__zoomOutFeatheringOuterRadiusStart;
  if (a4)
    v28 = &OBJC_IVAR___BWPreviewStitcherNode__zoomInFeatheringOuterRadiusStart;
  v29 = &OBJC_IVAR___BWPreviewStitcherNode__zoomOutFeatheringOuterRadiusEnd;
  if (a4)
    v29 = &OBJC_IVAR___BWPreviewStitcherNode__zoomInFeatheringOuterRadiusEnd;
  v30 = *(float *)(a1 + *v25) + (float)((float)(*(float *)(a1 + *v27) - *(float *)(a1 + *v25)) * v26);
  v31 = *(float *)(a1 + *v28) + (float)((float)(*(float *)(a1 + *v29) - *(float *)(a1 + *v28)) * v26);
  v32 = 1.0 - a13;
  if (a4)
    v32 = a13;
  v33 = *(unsigned __int8 *)(a1 + 1004);
  v34 = v32;
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "radialGradientFilter");
  v68.origin.x = a5;
  v68.origin.y = a6;
  v68.size.width = a7;
  v68.size.height = a8;
  MidX = CGRectGetMidX(v68);
  v69.origin.x = a5;
  v69.origin.y = a6;
  v69.size.width = a7;
  v69.size.height = a8;
  objc_msgSend(v35, "setCenter:", MidX, CGRectGetMidY(v69));
  if (a7 >= a8)
    v37 = a8;
  else
    v37 = a7;
  v38 = v37 * v30 * 0.5;
  *(float *)&v38 = v38;
  objc_msgSend(v35, "setRadius0:", v38);
  v39 = v37 * v31 * 0.5;
  *(float *)&v39 = v39;
  objc_msgSend(v35, "setRadius1:", v39);
  v40 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  objc_msgSend(v35, "setColor0:", objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:colorSpace:", v40, v34, v34, v34));
  v41 = 0.0;
  if (!v33)
    v41 = v34;
  objc_msgSend(v35, "setColor1:", objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:colorSpace:", v40, v41, v41, v41));
  v42 = (void *)objc_msgSend(v35, "outputImage");
  CGColorSpaceRelease(v40);
  v61 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v67.a = *MEMORY[0x1E0C9BAA8];
  v60 = *(_OWORD *)&v67.a;
  *(_OWORD *)&v67.c = v61;
  *(_OWORD *)&v67.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v59 = *(_OWORD *)&v67.tx;
  objc_msgSend(v35, "center");
  v44 = -v43;
  objc_msgSend(v35, "center");
  CGAffineTransformMakeTranslation(&t2, v44, -v45);
  *(_OWORD *)&t1.a = v60;
  *(_OWORD *)&t1.c = v61;
  *(_OWORD *)&t1.tx = v59;
  CGAffineTransformConcat(&v67, &t1, &t2);
  CGAffineTransformMakeScale(&v64, fmax(a7 / v37 * 0.949999988, 1.0), fmax(a8 / v37 * 0.949999988, 1.0));
  v63 = v67;
  CGAffineTransformConcat(&t1, &v63, &v64);
  v67 = t1;
  objc_msgSend(v35, "center");
  v47 = v46;
  objc_msgSend(v35, "center");
  CGAffineTransformMakeTranslation(&v63, v47, v48);
  v62 = v67;
  CGAffineTransformConcat(&t1, &v62, &v63);
  v67 = t1;
  v49 = objc_msgSend((id)objc_msgSend(v42, "imageByApplyingTransform:", &t1), "imageByCroppingToRect:", a5, a6, a7, a8);
  v50 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "blendWithMaskFilter");
  objc_msgSend(v50, "setInputImage:", a2);
  objc_msgSend(v50, "setMaskImage:", v49);
  objc_msgSend(v50, "setBackgroundImage:", a3);
  v51 = (void *)objc_msgSend(v50, "outputImage");
  if (*(_BYTE *)(a1 + 1441) && *(_BYTE *)(a1 + 904) && !*(_BYTE *)(a1 + 1388))
  {
    v52 = *(float *)(a1 + 1444);
    objc_msgSend(*(id *)(a1 + 1352), "currentValue");
    return psn_imageWithBlurredEdges(v51, *(_BYTE *)(a1 + 1448), a5, a6, a7, a8, a9, a10, a11, a12, v52, v53);
  }
  return (uint64_t)v51;
}

void __49__BWPreviewStitcherNode__preheatCIRenderingAsync__block_invoke(uint64_t a1)
{
  void *v2;
  __CVBuffer *v3;
  __CVBuffer *v4;
  __CVBuffer *v5;
  _BYTE *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool](*(int32x2_t **)(a1 + 32)), "newPixelBuffer");
  v4 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool](*(int32x2_t **)(a1 + 32)), "newPixelBuffer");
  v5 = (__CVBuffer *)-[int32x2_t newPixelBuffer](-[BWPreviewStitcherNode _teleOpacityPool](*(int32x2_t **)(a1 + 32)), "newPixelBuffer");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 880) = 0;
  v6 = *(_BYTE **)(a1 + 32);
  if (v6[1107] && v6[1625])
  {
    -[BWPreviewStitcherNode _renderHDRPixelBufferToSDR:toOutputPixelBuffer:progress:]((uint64_t)v6, v4, (uint64_t)v5, 0.5);
    v6 = *(_BYTE **)(a1 + 32);
  }
  if (v6[1106])
  {
    VTFillPixelBufferWithBlack();
    VTFillPixelBufferWithBlack();
    VTFillPixelBufferWithBlack();
  }
  v7 = psn_pixelBufferRect(v5);
  v11 = FigCaptureMetadataUtilitiesScaleRect2D(v7, v8, v9, v10, 0.9);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = psn_pixelBufferRect(v5);
  v22 = FigCaptureMetadataUtilitiesScaleRect2D(v18, v19, v20, v21, 0.8);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = acpr_conformRectForMSR420vf(v11, v13, v15, v17);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v36 = acpr_conformRectForMSR420vf(v22, v24, v26, v28);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[BWPreviewStitcherNode _renderOpacityRampToPixelBuffer:bounds:withWidePixelBuffer:telePixelBuffer:zoomingIn:progress:teleBounds:teleShift:](*(_QWORD *)(a1 + 32), v5, v3, v4, 1, v29, v31, v33, v35, 0.5, v43, v44, v45, v36, v37, v39, v41, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v46 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v46 + 1472))
  {
    psn_blurPixelBufferBorder(*(void **)(v46 + 896), v5, v29, v31, v33, v35, *(float *)(v46 + 1476));
    v46 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v46 + 1005))
  {
    *(double *)&v47 = FigCaptureMetadataUtilitiesScaleRect2D(v29, v31, v33, v35, 0.5);
    -[BWPreviewStitcherNode _compensateForMissingFOVUsingPixelBuffer:sourceRect:destinationContainingRect:destinationInsetRect:outputPixelBuffer:](v46, v4, v5, v48, v49, v50, v51, v52, v36, v38, v40, v42, v29, v31, v33, v35, v47, v53, v54,
      v55);
  }
  if (v3)
    CFRelease(v3);
  if (v4)
    CFRelease(v4);
  if (v5)
    CFRelease(v5);
  objc_autoreleasePoolPop(v2);
}

- (void)_cameraDisplayTransitionFrameCountForCameraFallbackChange:(float)a3 currentFrameRate:
{
  uint64_t v5;
  char v6;
  unint64_t v7;
  float v8;
  unsigned int v9;
  int v10;
  char v11;
  _BOOL4 v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;

  if (result)
  {
    v5 = (uint64_t)result;
    v6 = objc_msgSend(result, "displaysWidestCameraOnly");
    if (!a2)
    {
      if (*(_BYTE *)(v5 + 153) && *(_BYTE *)(v5 + 154) && *(float *)(v5 + 824) == *(float *)(v5 + 164))
      {
        v7 = 13;
      }
      else
      {
        v8 = *(float *)(v5 + 824);
        if (v8 == 0.0 || vabds_f32(1.0, *(float *)(v5 + 828) / v8) < 0.1)
        {
          if (*(_BYTE *)(v5 + 1233))
            v9 = 12;
          else
            v9 = 13;
          if (*(_BYTE *)(v5 + 1129))
            v7 = v9;
          else
            v7 = v9 + 1;
        }
        else
        {
          v7 = 9;
        }
      }
      return (void *)-[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v5, v7, a3);
    }
    if (!*(_BYTE *)(v5 + 1391)
      || *(_BYTE *)(v5 + 856)
      || *(unsigned __int8 *)(v5 + 1388) == *(unsigned __int8 *)(v5 + 1360))
    {
      if (*(_BYTE *)(v5 + 1307))
      {
        v7 = 22;
        if (*(_BYTE *)(v5 + 856))
        {
          if (*(unsigned __int8 *)(v5 + 1304) == *(unsigned __int8 *)(v5 + 1305))
            v7 = 22;
          else
            v7 = 15;
        }
      }
      else
      {
        v7 = 22;
      }
    }
    else
    {
      v7 = 16;
    }
    v10 = *(unsigned __int8 *)(v5 + 152);
    if (*(_BYTE *)(v5 + 152))
    {
      if (*(_BYTE *)(v5 + 1388))
        v11 = 1;
      else
        v11 = v6;
      v10 = (v11 & 1) == 0 && *(_BYTE *)(v5 + 856) == 0;
    }
    if (*(_BYTE *)(v5 + 1304))
    {
      if (!v10)
        return (void *)-[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v5, v7, a3);
      v12 = 0;
    }
    else
    {
      v12 = *(unsigned __int8 *)(v5 + 856) != 0;
      if ((v10 & 1) == 0)
      {
        if (!*(_BYTE *)(v5 + 856) || !*(_BYTE *)(v5 + 408))
          return (void *)-[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v5, v7, a3);
        v13 = flt_1A32A28C0[*(_BYTE *)(v5 + 1306) == 0];
        v14 = *(double *)(v5 + 1288);
        v15 = *(double *)(v5 + 1296);
        v16 = *(double *)(v5 + 560);
        v17 = *(double *)(v5 + 568);
        v18 = v5;
        v12 = 1;
        goto LABEL_38;
      }
    }
    v13 = *(float *)(v5 + 1384);
    v14 = *(double *)(v5 + 1368);
    v15 = *(double *)(v5 + 1376);
    v16 = *(double *)(v5 + 728);
    v17 = *(double *)(v5 + 736);
    v18 = v5;
LABEL_38:
    v7 = -[BWPreviewStitcherNode _scaleOpacityFrameCount:forCameraFallbackFromWideToTele:recenteringShiftOffset:recenteringStrength:registrationShiftOffset:](v18, v7, v12, v14, v15, v13, v16, v17);
    return (void *)-[BWPreviewStitcherNode _scale30FPSFrameCount:toFrameRate:](v5, v7, a3);
  }
  return result;
}

- (unint64_t)_scaleOpacityFrameCount:(int)a3 forCameraFallbackFromWideToTele:(double)a4 recenteringShiftOffset:(double)a5 recenteringStrength:(float)a6 registrationShiftOffset:(double)a7
{
  float v10;
  float v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;

  if (result)
  {
    v10 = (a8 - a5 / (1.0 - a6)) * (a8 - a5 / (1.0 - a6)) + (a7 - a4 / (1.0 - a6)) * (a7 - a4 / (1.0 - a6));
    v11 = sqrtf(v10);
    v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "primaryMediaProperties"), "resolvedVideoFormat"), "height");
    v13 = v11 / (float)v12;
    v14 = 0.13;
    if (v13 <= 0.13)
      v14 = v11 / (float)v12;
    if (v14 >= 0.035)
      v15 = (float)(v14 + -0.035) / 0.095;
    else
      v15 = 0.0;
    if (a3)
    {
      if (v13 > 0.035)
        v13 = 0.035;
      if (v13 >= 0.009)
        v16 = (float)(v13 + -0.009) / 0.026;
      else
        v16 = 0.0;
      v17 = (float)(v16 * 1.3) + 1.0;
    }
    else
    {
      v17 = (float)(v15 * 1.3) + 1.0;
    }
    return llroundf(v17 * (float)a2);
  }
  return result;
}

void __114__BWPreviewStitcherNode__updateShiftCorrectionsAsyncFromComputedShift_byRegisteringWide_tele_macroTransitionType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  const __CFDictionary *v7;
  uint64_t i;
  uint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  float64x2_t *v14;
  char v15;
  float v16;
  float64x2_t v17;
  uint64_t v18;
  CGPoint v19;

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
    v5 = &OBJC_IVAR___BWPreviewStitcherNode__superWideToWideShiftCorrections;
  else
    v5 = &OBJC_IVAR___BWPreviewStitcherNode__wideToTeleShiftCorrections;
  v6 = *v5;
  v7 = *(const __CFDictionary **)(v4 + 784);
  if (v7)
  {
    v19 = (CGPoint)*MEMORY[0x1E0C9D538];
    CGPointMakeWithDictionaryRepresentation(v7, &v19);
    for (i = 0; i != 72; i += 24)
    {
      v9 = a2 + i;
      *(_BYTE *)v9 = 1;
      *(CGPoint *)(v9 + 8) = v19;
    }
    v10 = *(os_unfair_lock_s **)(a1 + 32);
  }
  else
  {
    v10 = (os_unfair_lock_s *)v4;
  }
  v11 = v4 + v6;
  os_unfair_lock_lock(v10 + 107);
  v12 = 0;
  v13 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 820);
  v14 = (float64x2_t *)(a2 + 8);
  do
  {
    v15 = LOBYTE(v14[-1].f64[1]);
    if (v15)
    {
      v16 = *(float *)(a1 + 56);
      if (v16 == 0.0)
      {
        v17 = *v14;
      }
      else
      {
        v17 = vdivq_f64(*v14, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v16), 0));
        *v14 = v17;
      }
      *(float64x2_t *)(v11 + v12 + 16) = vsubq_f64(v17, *(float64x2_t *)(a1 + 40));
      if (!v13)
        *(_BYTE *)(v11 + v12 + 32) = 1;
    }
    v18 = v11 + v12;
    *(_BYTE *)(v18 + 33) = v15;
    *(_DWORD *)(v18 + 36) = *(_DWORD *)(a1 + 60);
    v14 = (float64x2_t *)((char *)v14 + 24);
    v12 += 56;
  }
  while (v12 != 168);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 428));
}

- (void)setWaitsForRegistrationToComplete:(BOOL)a3
{
  self->_superMacroEdgeFeatheringBlurEnabled = a3;
}

- (BOOL)waitsForRegistrationToComplete
{
  return self->_superMacroEdgeFeatheringBlurEnabled;
}

@end
