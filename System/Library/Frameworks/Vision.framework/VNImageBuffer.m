@implementation VNImageBuffer

- (__CVBuffer)croppedBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 error:(id *)a8
{
  return (__CVBuffer *)-[VNImageBuffer _croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:rotate90CCW:]((uint64_t)self, a3, a4, *(uint64_t *)&a5, a7, a8, 0, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (uint64_t)_cropCVPixelBuffer:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(CGFloat)a9 options:(CGFloat)a10 rotate90CCW:(CGFloat)a11 error:(CGFloat)a12
{
  id v21;
  double width;
  double height;
  double v24;
  double v25;
  unsigned int v26;
  double v27;
  double v28;
  double x;
  double y;
  double v31;
  double v32;
  uint64_t v33;
  size_t v34;
  size_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  BOOL v48;
  id v49;
  uint64_t v50;
  __CVBuffer *v51;
  size_t v52;
  size_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  __CVBuffer *v61;
  OSType v62;
  void *v63;
  uint64_t v64;
  id v65;
  CFIndex v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  BOOL v85;
  uint64_t *v86;
  id v87;
  void *v88;
  char v89;
  int v91;
  _BOOL4 v93;
  size_t v94;
  size_t v95;
  int v96;
  __CVBuffer *v97;
  OSType v98;
  void *v99;
  id v100;
  int v101;
  uint64_t v102;
  uint64_t PixelFormatType;
  __CVBuffer *cf;
  void *v105;
  id v106;
  CGFloat v107;
  CGFloat v108;
  double rect;
  _QWORD v114[7];
  int v115;
  _QWORD v116[4];
  id v117;
  float64x2_t v118;
  __int128 v119;
  __CVBuffer *v120;
  double v121;
  double v122;
  __CVBuffer *v123;
  int v124;
  OSType v125;
  int v126;
  int v127;
  int v128;
  char v129;
  int v130;
  id v131;
  float64x2_t v132;
  __int128 v133;
  CGPoint v134;
  CGFloat v135;
  CGFloat v136;
  unsigned __int8 v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;

  v134.x = a9;
  v134.y = a10;
  v135 = a11;
  v136 = a12;
  v21 = a8;
  if (a1
    && +[VNValidationUtilities validateNonNilOptionsDictionary:selector:error:](VNValidationUtilities, "validateNonNilOptionsDictionary:selector:error:", v21, sel__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error_, a14))
  {
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("Internal error: missing target buffer for crop operations"));
    objc_msgSend(a1, "fullImageBufferRect");
    v145.origin.x = a9;
    v145.origin.y = a10;
    v145.size.width = a11;
    v145.size.height = a12;
    v139 = CGRectIntersection(v138, v145);
    width = v139.size.width;
    height = v139.size.height;
    if (a10 >= 0.0)
      v24 = 0.0;
    else
      v24 = -a10;
    if (a9 >= 0.0)
      v25 = 0.0;
    else
      v25 = -a9;
    v132.f64[0] = v25;
    v132.f64[1] = v24;
    rect = v24;
    *(double *)&v133 = width;
    *((_QWORD *)&v133 + 1) = *(_QWORD *)&v139.size.height;
    v26 = -[VNImageBuffer _isRectOutOfBounds:](a1, a9, a10, a11, a12);
    if (v26)
    {
      v27 = (double)a4 / a11;
      v28 = (double)a5 / a12;
      v25 = v25 * v27;
      width = width * v27;
      v132.f64[0] = v25;
      v132.f64[1] = (a12 - (rect + height)) * v28;
      rect = v132.f64[1];
      height = height * v28;
      *(double *)&v133 = width;
      *((double *)&v133 + 1) = height;
    }
    VNAlignRectToSubsampledCVPixelBufferConstraint((float64x2_t *)&v134, a2);
    objc_msgSend(a1, "fullImageBufferRect");
    v146.origin = v134;
    v146.size.width = v135;
    v146.size.height = v136;
    v141 = CGRectIntersection(v140, v146);
    x = v141.origin.x;
    y = v141.origin.y;
    v31 = v141.size.width;
    v32 = v141.size.height;
    v134.x = v141.origin.x;
    v134.y = v141.origin.y;
    v135 = v141.size.width;
    v136 = v141.size.height;
    v33 = objc_msgSend(a1, "orientation");
    v34 = CVPixelBufferGetWidth(a2);
    v35 = CVPixelBufferGetHeight(a2);
    objc_opt_self();
    v42 = (double)v35;
    v107 = v25;
    v108 = width;
    v43 = (double)v34;
    v44 = x;
    v45 = v31;
    switch((int)v33)
    {
      case 1:
        goto LABEL_23;
      case 2:
        v44 = v43 - (x + v31);
        y = v42 - (y + v32);
        goto LABEL_24;
      case 3:
        v44 = v43 - (x + v31);
        goto LABEL_24;
      case 4:
        break;
      case 5:
        v44 = v43 - (y + v32);
        goto LABEL_17;
      case 6:
        v44 = v43 - (y + v32);
        v47 = x + v31;
        goto LABEL_20;
      case 7:
        v47 = x + v31;
        v44 = y;
LABEL_20:
        y = v42 - v47;
        goto LABEL_21;
      case 8:
        v44 = y;
LABEL_17:
        y = x;
LABEL_21:
        v45 = v32;
        v32 = v31;
        break;
      default:
        VNValidatedLog(4, (uint64_t)CFSTR("VNImageBuffer - invalid rotation case"), v36, v37, v38, v39, v40, v41, v102);
LABEL_23:
        y = v42 - (y + v32);
        v44 = x;
LABEL_24:
        v45 = v31;
        break;
    }
    v131 = 0;
    v48 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v131, objc_opt_class(), CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight"), v21, a14);
    v49 = v131;
    if (!v48)
    {
      v46 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v106 = v49;
    if (v49)
      v50 = objc_msgSend(v49, "integerValue");
    else
      v50 = 1;
    v130 = -1;
    if ((VNCalculateFeatureCropOrientationFromSuperpositionOfFeatureWithImageOrientations(v33, v50, &v130, a13, a14) & 1) == 0)
    {
      v46 = 0;
LABEL_67:
      v49 = v106;
      goto LABEL_68;
    }
    v51 = *a3;
    PixelFormatType = CVPixelBufferGetPixelFormatType(*a3);
    v52 = CVPixelBufferGetWidth(v51);
    cf = v51;
    v53 = CVPixelBufferGetHeight(v51);
    objc_msgSend(a1, "session");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "vnvtSessionManager");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (double)(int)v44;
    v56 = (double)(int)y;
    v57 = (double)(int)v45;
    v58 = (double)(int)v32;
    v59 = (double)v52;
    v60 = (double)v53;

    if (v130 == 1)
    {
      if (v26)
      {
        v142.origin.x = v107;
        v142.size.width = v108;
        v142.origin.y = rect;
        v142.size.height = height;
        v143 = CGRectIntegral(v142);
        v147.origin.x = 0.0;
        v147.origin.y = 0.0;
        v147.size.width = (double)v52;
        v147.size.height = (double)v53;
        v144 = CGRectIntersection(v143, v147);
        v132.f64[0] = v144.origin.x;
        v132.f64[1] = v144.origin.y;
        *(CGFloat *)&v133 = v144.size.width;
        *((_QWORD *)&v133 + 1) = *(_QWORD *)&v144.size.height;
        VNAlignRectToSubsampledCVPixelBufferConstraint(&v132, cf);
        v61 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)*(double *)&v133, (unint64_t)*((double *)&v133 + 1), PixelFormatType, a14);
        if (v61)
        {
          if ((+[VNImageBuffer _VNVTPixelTransferImageForSource:destinationBuffer:cropRect:performCrop:vtSessionManager:error:](v55, v56, v57, v58, (uint64_t)VNImageBuffer, a2, v61, a7, v105, a14) & 1) != 0)
          {
            v62 = CVPixelBufferGetPixelFormatType(v61);
            -[VNVTSessionManager waitAndGetAvailablePixelRotationSessionForInputPixelFormat:outputPixelFormat:rotation:flipHorizontal:flipVertical:error:]((uint64_t)v105, v62, PixelFormatType, 0, 0, 0, a14);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            if (v63)
            {
              v64 = VTPixelRotationSessionRotateSubImage();
              if (!(_DWORD)v64)
              {
                v89 = 1;
LABEL_62:
                -[VNVTSessionManager releasePixelRotationSession:]((uint64_t)v105, v63);
                CVPixelBufferRelease(v61);

                if ((v89 & 1) != 0)
                {
LABEL_63:
                  if (a6 == 1278226488)
                  {
                    *a3 = 0;
                    v114[0] = MEMORY[0x1E0C809B0];
                    v114[1] = 3221225472;
                    v114[2] = __113__VNImageBuffer__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error___block_invoke_2;
                    v114[3] = &__block_descriptor_60_e25_B24__0____CVBuffer__8__16l;
                    v114[4] = a4;
                    v114[5] = a5;
                    v114[6] = a3;
                    v115 = 1278226488;
                    VNExecuteBlockWithPixelBuffer(cf, 0, v114, a14);
                  }
                  v137 = 1;
                }
LABEL_66:

                v46 = v137;
                goto LABEL_67;
              }
              if (a14)
              {
                v65 = objc_alloc(MEMORY[0x1E0CB3940]);
                v66 = CFGetRetainCount(v61);
                v67 = CVPixelBufferGetPixelFormatType(v61);
                v68 = (void *)objc_msgSend(v65, "initWithFormat:", CFSTR("VNImageBuffer - Failed to transfer bufferForTransferSubImage                                                                                 (retain count = %ld, type = %u) to vtSessionDestBuffer                                                                                 (retain count = %ld, type = %u). Error %d"), v66, v67, CFGetRetainCount(cf), PixelFormatType, v64);
                +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v68);
                *a14 = (id)objc_claimAutoreleasedReturnValue();

              }
            }
          }
          else
          {
            v63 = 0;
          }
          v89 = 0;
          v137 = 0;
          goto LABEL_62;
        }
      }
      else if ((+[VNImageBuffer _VNVTPixelTransferImageForSource:destinationBuffer:cropRect:performCrop:vtSessionManager:error:](v55, v56, v57, v58, (uint64_t)VNImageBuffer, a2, cf, a7, v105, a14) & 1) != 0)
      {
        goto LABEL_63;
      }
    }
    else
    {
      if (v130 >= 9)
      {
        v69 = objc_alloc(MEMORY[0x1E0CB3940]);
        v70 = (void *)objc_msgSend(v69, "initWithFormat:", CFSTR("VNImageBuffer - wrong crop orientation for rotation: %d"), v130);
        if (a14)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v70);
          *a14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v71 = objc_retainAutorelease(v70);
        v72 = objc_msgSend(v71, "UTF8String");
        VNValidatedLog(4, (uint64_t)CFSTR("%s"), v73, v74, v75, v76, v77, v78, v72);
        v137 = 0;

        goto LABEL_66;
      }
      v79 = objc_msgSend((id)objc_opt_class(), "mapOrientationToRotationDegrees");
      v82 = *(_QWORD *)(v79 + 8);
      v80 = v79 + 8;
      v81 = v82;
      if (!v82)
        goto LABEL_57;
      v83 = v80;
      do
      {
        v84 = *(_DWORD *)(v81 + 28);
        v85 = v84 < v130;
        if (v84 >= v130)
          v86 = (uint64_t *)v81;
        else
          v86 = (uint64_t *)(v81 + 8);
        if (!v85)
          v83 = v81;
        v81 = *v86;
      }
      while (*v86);
      if (v83 != v80 && v130 >= *(_DWORD *)(v83 + 28))
      {
        v91 = *(_DWORD *)(v83 + 32);
        v93 = v130 == 2 || v130 == 5;
        if (v130 <= 4)
          v94 = a4;
        else
          v94 = a5;
        if (v130 <= 4)
          v95 = a5;
        else
          v95 = a4;
        v96 = v130 == 7 || v130 == 4;
        v97 = -[VNImageBuffer _createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:height:format:options:outPooled:error:]((CVPixelBufferPoolRef)a1, v94, v95, PixelFormatType, v21, 0, a14);
        if (v97)
        {
          if ((+[VNImageBuffer _VNVTPixelTransferImageForSource:destinationBuffer:cropRect:performCrop:vtSessionManager:error:](v55, v56, v57, v58, (uint64_t)VNImageBuffer, a2, v97, a7, v105, a14) & 1) != 0&& (v98 = CVPixelBufferGetPixelFormatType(v97), -[VNVTSessionManager waitAndGetAvailablePixelRotationSessionForInputPixelFormat:outputPixelFormat:rotation:flipHorizontal:flipVertical:error:]((uint64_t)v105, v98, PixelFormatType, v91, v93, v96, a14),
                (v99 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v116[1] = 3221225472;
            v118 = v132;
            v116[0] = MEMORY[0x1E0C809B0];
            v116[2] = __113__VNImageBuffer__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error___block_invoke;
            v116[3] = &unk_1E4543BB0;
            v129 = v26;
            v119 = v133;
            v120 = cf;
            v124 = v50;
            v121 = v59;
            v122 = v60;
            v100 = v99;
            v117 = v100;
            v123 = v97;
            v125 = v98;
            v126 = PixelFormatType;
            v127 = v130;
            v128 = v91;
            if ((VNExecuteBlockWithPixelBuffer(a2, 1uLL, v116, a14) & 1) != 0)
            {
              v101 = 0;
            }
            else
            {
              v137 = 0;
              v101 = 1;
            }

          }
          else
          {
            v100 = 0;
            v137 = 0;
            v101 = 3;
          }
          CVPixelBufferRelease(v97);
          -[VNVTSessionManager releasePixelRotationSession:]((uint64_t)v105, v100);

          if (v101)
            goto LABEL_66;
          goto LABEL_63;
        }
      }
      else
      {
LABEL_57:
        if (a14)
        {
          v87 = objc_alloc(MEMORY[0x1E0CB3940]);
          v88 = (void *)objc_msgSend(v87, "initWithFormat:", CFSTR("Invalid crop orientation: %d"), v130);
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v88);
          *a14 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    v137 = 0;
    goto LABEL_66;
  }
  v46 = 0;
LABEL_69:

  return v46;
}

- (int)orientation
{
  return self->_orientation;
}

- (void)_isRectOutOfBounds:(CGFloat)a3
{
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  if (result)
  {
    objc_msgSend(result, "fullImageBufferRect");
    v11.origin.x = a2;
    v11.origin.y = a3;
    v11.size.width = a4;
    v11.size.height = a5;
    v10 = CGRectIntersection(v9, v11);
    v12.origin.x = a2;
    v12.origin.y = a3;
    v12.size.width = a4;
    v12.size.height = a5;
    return (void *)!CGRectContainsRect(v10, v12);
  }
  return result;
}

- (CGRect)fullImageBufferRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = (double)-[VNImageBuffer width](self, "width");
  v4 = (double)-[VNImageBuffer height](self, "height");
  v5 = 0.0;
  v6 = 0.0;
  v7 = v3;
  result.size.height = v4;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (unint64_t)width
{
  unint64_t result;

  result = self->_origImageWidth;
  if (!result)
  {
    -[VNImageBuffer calculateOrientationCorrectedImageDimensions]((uint64_t)self);
    return self->_origImageWidth;
  }
  return result;
}

- (unint64_t)height
{
  unint64_t result;

  result = self->_origImageHeight;
  if (!result)
  {
    -[VNImageBuffer calculateOrientationCorrectedImageDimensions]((uint64_t)self);
    return self->_origImageHeight;
  }
  return result;
}

uint64_t __114__VNImageBuffer__croppedBufferWithWidth_height_format_cropRect_options_error_pixelBufferRepsCacheKey_rotate90CCW___block_invoke(uint64_t a1, _QWORD *a2)
{
  size_t v4;
  size_t v5;
  _BOOL8 v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  id v21;
  int v22;
  size_t v23;
  uint64_t v24;
  __CVPixelBufferPool *v25;
  void *v26;
  CVPixelBufferPoolRef v27;
  id v28;
  uint64_t v29;
  CVPixelBufferRef *v30;
  uint64_t v31;
  _QWORD *v32;
  __CVBuffer *v33;
  int v34;
  unsigned __int8 v35;
  char v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  int v41;
  unsigned __int8 v42;
  _BOOL4 v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  unsigned __int8 v49;
  int v50;
  int v52;
  id v53;
  char v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  CGRect v61;

  v5 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "cachedBufferWithKey:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    kdebug_trace();
    return 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "fullImageBufferRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (CGRectIsInfinite(*(CGRect *)(a1 + 104))
    || (v61.origin.x = v8,
        v61.origin.y = v10,
        v61.size.width = v12,
        v61.size.height = v14,
        CGRectEqualToRect(v61, *(CGRect *)(a1 + 104))))
  {
    v15 = 0;
  }
  else
  {
    v8 = *(double *)(a1 + 104);
    v10 = *(double *)(a1 + 112);
    v15 = 1;
    v12 = *(double *)(a1 + 120);
    v14 = *(double *)(a1 + 128);
  }
  v16 = -[VNImageBuffer _isRectOutOfBounds:](*(void **)(a1 + 32), v8, v10, v12, v14);
  v17 = MEMORY[0x1A1B0B060](v16);
  -[VNImageBuffer _optionsWithOverridingOptions:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v59 = 0;
  v19 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v60, objc_opt_class(), CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight"), v18, &v59);
  v20 = v60;
  v21 = v59;
  if (!v19)
  {
    v26 = (void *)v17;
    goto LABEL_40;
  }
  if (v20)
  {
    v22 = objc_msgSend(v20, "integerValue");
    if (v22 <= 4)
      v23 = v5;
    else
      v23 = v4;
    if (v22 > 4)
      v4 = v5;
    v5 = v23;
  }
  v24 = *(unsigned int *)(a1 + 136);
  v25 = *(__CVPixelBufferPool **)(a1 + 32);
  v52 = v15;
  v26 = (void *)v17;
  if ((_DWORD)v24 == 1278226488)
  {
    if (*((_QWORD *)v25 + 2))
    {
      v5 = (v5 + 1) & 0xFFFFFFFFFFFFFFFELL;
      v4 = (v4 + 1) & 0xFFFFFFFFFFFFFFFELL;
      v24 = 875704422;
    }
    else
    {
      v24 = 1278226488;
    }
  }
  v58 = v21;
  v27 = -[VNImageBuffer _createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:height:format:options:outPooled:error:](v25, v5, v4, v24, v18, 0, &v58);
  v28 = v58;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v27;
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v31 = *(_QWORD *)(v29 + 24);
  v30 = (CVPixelBufferRef *)(v29 + 24);
  if (v31)
  {
    v32 = *(_QWORD **)(a1 + 32);
    v33 = (__CVBuffer *)v32[2];
    if (v33)
    {
      v34 = *(_DWORD *)(a1 + 136);
      v35 = *(_BYTE *)(a1 + 140);
      v57 = v28;
      v36 = -[VNImageBuffer _cropCVPixelBuffer:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:](v32, v33, v30, v5, v4, v34, v52, v18, v8, v10, v12, v14, v35, &v57);
      v37 = v57;
    }
    else
    {
      v39 = (void *)v32[3];
      v40 = v52;
      if (!v39)
      {
        v47 = (void *)v32[5];
        if (!v47)
        {
LABEL_28:
          v54 = 0;
          v53 = v28;
          v43 = +[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v54, CFSTR("VNImageBufferOption_DoNotCacheRepresentations"), v18, 0, &v53);
          v21 = v53;

          if (v43)
          {
            v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            if (v44 && !v54)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "cacheBuffer:forCacheKey:");
              v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            }
            if (v44)
            {
              objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VNImageBufferOption_RequiresDepth"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v40 | objc_msgSend(v45, "BOOLValue") ^ 1) != 1)
              {
                v46 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);

                if (v46)
                {
                  CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), CFSTR("VNDepthRepresentationAttachment"), *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 96), kCVAttachmentMode_ShouldNotPropagate);
                  LODWORD(v46) = 0;
                }
                goto LABEL_37;
              }

            }
            LODWORD(v46) = 0;
          }
          else
          {
            LODWORD(v46) = 1;
          }
LABEL_37:
          v38 = !v43;
          goto LABEL_42;
        }
        v48 = *(_DWORD *)(a1 + 136);
        v49 = *(_BYTE *)(a1 + 140);
        v55 = v28;
        v50 = -[VNImageBuffer _cropImageSourceManager:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((uint64_t)v32, v47, v30, v5, v4, v48, v52, v18, v8, v10, v12, v14, v49, &v55);
        v21 = v55;

        if (v50)
        {
LABEL_27:
          v28 = v21;
          v40 = v52;
          goto LABEL_28;
        }
        goto LABEL_40;
      }
      v41 = *(_DWORD *)(a1 + 136);
      v42 = *(_BYTE *)(a1 + 140);
      v56 = v28;
      v36 = -[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)v32, v39, v30, v5, v4, v41, v52, v18, v8, v10, v12, v14, v42, &v56);
      v37 = v56;
    }
    v21 = v37;

    if ((v36 & 1) != 0)
      goto LABEL_27;
LABEL_40:
    v38 = 1;
    goto LABEL_41;
  }
  v38 = 1;
  v21 = v28;
LABEL_41:
  LODWORD(v46) = 1;
LABEL_42:

  objc_autoreleasePoolPop(v26);
  if (v38)
  {
    CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    if (a2)
      *a2 = objc_retainAutorelease(v21);
  }
  v6 = (_DWORD)v46 == 0;

  return v6;
}

- (uint64_t)calculateOrientationCorrectedImageDimensions
{
  uint64_t v1;
  __CVBuffer *v2;
  size_t Width;
  size_t Height;
  void *v5;
  double v6;
  double v7;
  char *v8;
  CGImageSource *v9;
  CFDictionaryRef v10;
  void *v11;
  void *v12;
  size_t v13;
  size_t v14;

  if (result)
  {
    v1 = result;
    v2 = *(__CVBuffer **)(result + 16);
    if (v2)
    {
      Width = CVPixelBufferGetWidth(v2);
      Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v1 + 16));
    }
    else
    {
      v5 = *(void **)(v1 + 24);
      if (v5)
      {
        objc_msgSend(v5, "extent");
        Width = (unint64_t)v6;
        objc_msgSend(*(id *)(v1 + 24), "extent");
        Height = (unint64_t)v7;
      }
      else
      {
        v8 = *(char **)(v1 + 40);
        if (v8
          && (v9 = (CGImageSource *)objc_msgSend(v8, "_cgImageSourceAtAddress:forSubSampleFactor:protectedWithUnfairLock:operatingInLowPriority:error:", v8 + 32, 1, v8 + 12, 0, 0)) != 0)
        {
          v10 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
          -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(Width) = objc_msgSend(v11, "intValue");

          -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          Width = (int)Width;
          Height = (int)objc_msgSend(v12, "intValue");

        }
        else
        {
          Height = 0;
          Width = 0;
        }
      }
    }
    result = objc_msgSend((id)v1, "orientation");
    if ((int)result <= 4)
      v13 = Width;
    else
      v13 = Height;
    if ((int)result <= 4)
      v14 = Height;
    else
      v14 = Width;
    *(_QWORD *)(v1 + 72) = v13;
    *(_QWORD *)(v1 + 80) = v14;
  }
  return result;
}

- (id)_optionsWithOverridingOptions:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 88), "mutableCopy");
    objc_msgSend(v4, "addEntriesFromDictionary:", v3);
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CVPixelBufferPoolRef)_createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:(size_t)a3 height:(uint64_t)a4 format:(void *)a5 options:(_BYTE *)a6 outPooled:(_QWORD *)a7 error:
{
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  os_unfair_lock_s *v17;
  os_unfair_lock_s *v18;
  unint64_t v19;
  int8x8_t v20;
  uint8x8_t v21;
  unint64_t v22;
  void **v23;
  void *i;
  unint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  CVPixelBufferPoolRef v32;
  unint64_t v33;
  uint8x8_t v34;
  void **v35;
  unint64_t v36;
  float v37;
  float v38;
  _BOOL8 v39;
  unint64_t v40;
  unint64_t v41;
  int8x8_t prime;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  uint8x8_t v48;
  unint64_t v49;
  uint8x8_t v50;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  unint64_t v57;
  __CVPixelBufferPool *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  char v73;
  void *v75;
  void *v76;
  os_unfair_lock_s *lock;
  CVPixelBufferPoolRef poolOut;

  v12 = a5;
  v13 = v12;
  if (a1)
  {
    v14 = v12;
    objc_msgSend(v14, "valueForKey:", CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (a6)
      *a6 = v16;
    if (v16)
    {
      -[__CVPixelBufferPool session](a1, "session");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "vncvPixelBufferPoolManager");
      v17 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
      {
        a1 = 0;
        goto LABEL_118;
      }
      lock = v17 + 2;
      os_unfair_lock_lock(v17 + 2);
      v19 = a4 ^ __ROR8__(a3 ^ __ROR8__(a2, 51), 51);
      v20 = *(int8x8_t *)&v18[6]._os_unfair_lock_opaque;
      if (v20)
      {
        v21 = (uint8x8_t)vcnt_s8(v20);
        v21.i16[0] = vaddlv_u8(v21);
        if (v21.u32[0] > 1uLL)
        {
          v22 = v19;
          if (v19 >= *(_QWORD *)&v20)
            v22 = v19 % *(_QWORD *)&v20;
        }
        else
        {
          v22 = (*(_QWORD *)&v20 - 1) & v19;
        }
        v23 = *(void ***)(*(_QWORD *)&v18[4]._os_unfair_lock_opaque + 8 * v22);
        if (v23)
        {
          for (i = *v23; i; i = *(void **)i)
          {
            v25 = *((_QWORD *)i + 1);
            if (v25 == v19)
            {
              if (*((_QWORD *)i + 2) == a2 && *((_QWORD *)i + 3) == a3 && *((_DWORD *)i + 8) == (_DWORD)a4)
                goto LABEL_107;
            }
            else
            {
              if (v21.u32[0] > 1uLL)
              {
                if (v25 >= *(_QWORD *)&v20)
                  v25 %= *(_QWORD *)&v20;
              }
              else
              {
                v25 &= *(_QWORD *)&v20 - 1;
              }
              if (v25 != v22)
                break;
            }
          }
        }
      }
      objc_opt_self();
      objc_opt_self();
      v26 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v26, "initWithObjectsAndKeys:", v27, *MEMORY[0x1E0CA90E0], v28, *MEMORY[0x1E0CA8FD8], v29, *MEMORY[0x1E0CA9040], 0);

      if (VNIOSurfaceBackedPixelBufferAttributes::onceToken != -1)
        dispatch_once(&VNIOSurfaceBackedPixelBufferAttributes::onceToken, &__block_literal_global_26832);
      objc_msgSend((id)v30, "addEntriesFromDictionary:", VNIOSurfaceBackedPixelBufferAttributes::pixelBufferAttributes);
      poolOut = 0;
      v31 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFDictionaryRef)v30, &poolOut);
      if ((_DWORD)v31)
      {

        if (a7)
        {
          +[VNError errorForCVReturnCode:width:height:pixelFormat:localizedDescription:](VNError, "errorForCVReturnCode:width:height:pixelFormat:localizedDescription:", v31, a2, a3, a4, CFSTR("Failed to create CVPixelBufferPool"));
          v32 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = 0;
        }
      }
      else
      {
        v32 = poolOut;

      }
      v33 = *(_QWORD *)&v18[6]._os_unfair_lock_opaque;
      if (v33)
      {
        v34 = (uint8x8_t)vcnt_s8((int8x8_t)v33);
        v34.i16[0] = vaddlv_u8(v34);
        if (v34.u32[0] > 1uLL)
        {
          v30 = v19;
          if (v19 >= v33)
            v30 = v19 % v33;
        }
        else
        {
          v30 = (v33 - 1) & v19;
        }
        v35 = *(void ***)(*(_QWORD *)&v18[4]._os_unfair_lock_opaque + 8 * v30);
        if (v35)
        {
          for (i = *v35; i; i = *(void **)i)
          {
            v36 = *((_QWORD *)i + 1);
            if (v36 == v19)
            {
              if (*((_QWORD *)i + 2) == a2 && *((_QWORD *)i + 3) == a3 && *((_DWORD *)i + 8) == (_DWORD)a4)
                goto LABEL_107;
            }
            else
            {
              if (v34.u32[0] > 1uLL)
              {
                if (v36 >= v33)
                  v36 %= v33;
              }
              else
              {
                v36 &= v33 - 1;
              }
              if (v36 != v30)
                break;
            }
          }
        }
      }
      i = operator new(0x30uLL);
      *(_QWORD *)i = 0;
      *((_QWORD *)i + 1) = v19;
      *((_QWORD *)i + 2) = a2;
      *((_QWORD *)i + 3) = a3;
      *((_DWORD *)i + 8) = a4;
      *((_QWORD *)i + 5) = v32;
      v37 = (float)(unint64_t)(*(_QWORD *)&v18[10]._os_unfair_lock_opaque + 1);
      v38 = *(float *)&v18[12]._os_unfair_lock_opaque;
      if (v33 && (float)(v38 * (float)v33) >= v37)
      {
LABEL_97:
        v55 = *(_QWORD *)&v18[4]._os_unfair_lock_opaque;
        v56 = *(_QWORD **)(v55 + 8 * v30);
        if (v56)
        {
          *(_QWORD *)i = *v56;
        }
        else
        {
          *(_QWORD *)i = *(_QWORD *)&v18[8]._os_unfair_lock_opaque;
          *(_QWORD *)&v18[8]._os_unfair_lock_opaque = i;
          *(_QWORD *)(v55 + 8 * v30) = v18 + 8;
          if (!*(_QWORD *)i)
          {
LABEL_106:
            ++*(_QWORD *)&v18[10]._os_unfair_lock_opaque;
LABEL_107:
            v58 = (__CVPixelBufferPool *)*((_QWORD *)i + 5);
            objc_opt_self();
            poolOut = 0;
            v65 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v58, &poolOut);
            if ((_DWORD)v65)
              v66 = 1;
            else
              v66 = poolOut == 0;
            if (v66)
            {
              VNValidatedLog(4, (uint64_t)CFSTR("VNCVPixelBufferHelper: Failed to create CVPixelBuffer from pool (%p): %d"), v59, v60, v61, v62, v63, v64, (uint64_t)v58);
              if (a7)
              {
                CVPixelBufferPoolGetAttributes(v58);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_msgSend(v68, "unsignedLongValue");
                objc_msgSend(v67, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = objc_msgSend(v70, "unsignedLongValue");
                objc_msgSend(v67, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                +[VNError errorForCVReturnCode:width:height:pixelFormat:localizedDescription:](VNError, "errorForCVReturnCode:width:height:pixelFormat:localizedDescription:", v65, v69, v71, objc_msgSend(v72, "unsignedIntValue"), CFSTR("Failed to create CVPixelBufferPool."));
                *a7 = (id)objc_claimAutoreleasedReturnValue();

              }
            }
            else
            {
              v73 = +[VNCVPixelBufferHelper _validatePixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, poolOut, a7);
              a1 = poolOut;
              if ((v73 & 1) != 0)
                goto LABEL_117;
              CVPixelBufferRelease(poolOut);
            }
            a1 = 0;
LABEL_117:
            os_unfair_lock_unlock(lock);
LABEL_118:

            goto LABEL_119;
          }
          v57 = *(_QWORD *)(*(_QWORD *)i + 8);
          if ((v33 & (v33 - 1)) != 0)
          {
            if (v57 >= v33)
              v57 %= v33;
          }
          else
          {
            v57 &= v33 - 1;
          }
          v56 = (_QWORD *)(*(_QWORD *)&v18[4]._os_unfair_lock_opaque + 8 * v57);
        }
        *v56 = i;
        goto LABEL_106;
      }
      v39 = 1;
      if (v33 >= 3)
        v39 = (v33 & (v33 - 1)) != 0;
      v40 = v39 | (2 * v33);
      v41 = vcvtps_u32_f32(v37 / v38);
      if (v40 <= v41)
        prime = (int8x8_t)v41;
      else
        prime = (int8x8_t)v40;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      v33 = *(_QWORD *)&v18[6]._os_unfair_lock_opaque;
      if (*(_QWORD *)&prime > v33)
        goto LABEL_63;
      if (*(_QWORD *)&prime < v33)
      {
        v49 = vcvtps_u32_f32((float)*(unint64_t *)&v18[10]._os_unfair_lock_opaque / *(float *)&v18[12]._os_unfair_lock_opaque);
        if (v33 < 3 || (v50 = (uint8x8_t)vcnt_s8((int8x8_t)v33), v50.i16[0] = vaddlv_u8(v50), v50.u32[0] > 1uLL))
        {
          v49 = std::__next_prime(v49);
        }
        else
        {
          v51 = 1 << -(char)__clz(v49 - 1);
          if (v49 >= 2)
            v49 = v51;
        }
        if (*(_QWORD *)&prime <= v49)
          prime = (int8x8_t)v49;
        if (*(_QWORD *)&prime >= v33)
        {
          v33 = *(_QWORD *)&v18[6]._os_unfair_lock_opaque;
        }
        else
        {
          if (prime)
          {
LABEL_63:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v43 = operator new(8 * *(_QWORD *)&prime);
            v44 = *(void **)&v18[4]._os_unfair_lock_opaque;
            *(_QWORD *)&v18[4]._os_unfair_lock_opaque = v43;
            if (v44)
              operator delete(v44);
            v45 = 0;
            *(int8x8_t *)&v18[6]._os_unfair_lock_opaque = prime;
            do
              *(_QWORD *)(*(_QWORD *)&v18[4]._os_unfair_lock_opaque + 8 * v45++) = 0;
            while (*(_QWORD *)&prime != v45);
            v46 = *(_QWORD **)&v18[8]._os_unfair_lock_opaque;
            if (v46)
            {
              v47 = v46[1];
              v48 = (uint8x8_t)vcnt_s8(prime);
              v48.i16[0] = vaddlv_u8(v48);
              if (v48.u32[0] > 1uLL)
              {
                if (v47 >= *(_QWORD *)&prime)
                  v47 %= *(_QWORD *)&prime;
              }
              else
              {
                v47 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*(_QWORD *)&v18[4]._os_unfair_lock_opaque + 8 * v47) = v18 + 8;
              v52 = (_QWORD *)*v46;
              if (*v46)
              {
                do
                {
                  v53 = v52[1];
                  if (v48.u32[0] > 1uLL)
                  {
                    if (v53 >= *(_QWORD *)&prime)
                      v53 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v53 &= *(_QWORD *)&prime - 1;
                  }
                  if (v53 != v47)
                  {
                    v54 = *(_QWORD *)&v18[4]._os_unfair_lock_opaque;
                    if (!*(_QWORD *)(v54 + 8 * v53))
                    {
                      *(_QWORD *)(v54 + 8 * v53) = v46;
                      goto LABEL_88;
                    }
                    *v46 = *v52;
                    *v52 = **(_QWORD **)(*(_QWORD *)&v18[4]._os_unfair_lock_opaque + 8 * v53);
                    **(_QWORD **)(*(_QWORD *)&v18[4]._os_unfair_lock_opaque + 8 * v53) = v52;
                    v52 = v46;
                  }
                  v53 = v47;
LABEL_88:
                  v46 = v52;
                  v52 = (_QWORD *)*v52;
                  v47 = v53;
                }
                while (v52);
              }
            }
            v33 = (unint64_t)prime;
            goto LABEL_92;
          }
          v75 = *(void **)&v18[4]._os_unfair_lock_opaque;
          *(_QWORD *)&v18[4]._os_unfair_lock_opaque = 0;
          if (v75)
            operator delete(v75);
          v33 = 0;
          *(_QWORD *)&v18[6]._os_unfair_lock_opaque = 0;
        }
      }
LABEL_92:
      if ((v33 & (v33 - 1)) != 0)
      {
        if (v19 >= v33)
          v30 = v19 % v33;
        else
          v30 = v19;
      }
      else
      {
        v30 = (v33 - 1) & v19;
      }
      goto LABEL_97;
    }
    a1 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a2, a3, a4, a7);
  }
LABEL_119:

  return a1;
}

- (VNSession)session
{
  return self->_session;
}

- (uint64_t)_croppedBufferWithWidth:(uint64_t)a3 height:(uint64_t)a4 format:(void *)a5 cropRect:(_QWORD *)a6 options:(_QWORD *)a7 error:(char)a8 pixelBufferRepsCacheKey:(double)a9 rotate90CCW:(double)a10
{
  __CVBuffer *v22;
  uint64_t PixelFormatType;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  char v32;
  uint64_t v33;
  id v36;
  _QWORD aBlock[5];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v36 = a5;
  if (!a1)
  {
    v33 = 0;
    goto LABEL_24;
  }
  v22 = *(__CVBuffer **)(a1 + 16);
  if (!v22)
    goto LABEL_9;
  PixelFormatType = CVPixelBufferGetPixelFormatType(v22);
  v24 = PixelFormatType;
  if ((int)PixelFormatType > 792872768)
  {
    if ((_DWORD)PixelFormatType == 792872769)
      goto LABEL_10;
    v25 = 2084718401;
  }
  else
  {
    if ((_DWORD)PixelFormatType == 641877825)
      goto LABEL_10;
    v25 = 759318337;
  }
  if ((_DWORD)PixelFormatType != v25)
LABEL_9:
    v24 = a4;
LABEL_10:
  +[VNImageBufferCache cacheKeyWithBufferFormat:width:height:cropRect:](VNImageBufferCache, "cacheKeyWithBufferFormat:width:height:cropRect:", v24, a2, a3, a9, a10, a11, a12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash");
  if (a3 && a2 && a11 >= 1.0 && a12 >= 1.0)
  {
    v28 = v27;
    v52 = 0;
    v53 = &v52;
    v29 = v24 | ((unint64_t)((unsigned __int16)a3 | ((unsigned __int16)a2 << 16)) << 32);
    v54 = 0x2020000000;
    v55 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__VNImageBuffer__croppedBufferWithWidth_height_format_cropRect_options_error_pixelBufferRepsCacheKey_rotate90CCW___block_invoke;
    aBlock[3] = &unk_1E4543BF8;
    v41 = a2;
    v42 = a3;
    v40 = &v52;
    aBlock[4] = a1;
    v30 = v26;
    v38 = v30;
    v43 = v28;
    v44 = (int)a12 | ((((unint64_t)(int)a10 << 16) | ((unint64_t)(int)a9 << 32) | (int)a11) << 16);
    v45 = v29;
    v46 = a9;
    v47 = a10;
    v48 = a11;
    v49 = a12;
    v39 = v36;
    v50 = v24;
    v51 = a8;
    v31 = _Block_copy(aBlock);
    kdebug_trace();
    v32 = VNExecuteBlock(v31, (uint64_t)a6);
    kdebug_trace();
    if ((v32 & 1) != 0)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v30);
      v33 = v53[3];
    }
    else
    {
      v33 = 0;
    }

    _Block_object_dispose(&v52, 8);
  }
  else if (a6)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, CFSTR("Operation failed due to attempt to crop zero or near zero dimensioned area"));
    v33 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }

LABEL_24:
  return v33;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  __CVBuffer *v12;
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  void *v16;
  VNImageBuffer *v17;

  v10 = a5;
  v11 = a6;
  if (a3
    && (self = (VNImageBuffer *)-[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v10, a4, v11)) != 0)
  {
    v12 = CVPixelBufferRetain(a3);
    self->_origPixelBuffer = v12;
    Width = CVPixelBufferGetWidth(v12);
    Height = CVPixelBufferGetHeight(self->_origPixelBuffer);
    PixelFormatType = CVPixelBufferGetPixelFormatType(self->_origPixelBuffer);
    if (-[VNImageBuffer orientation](self, "orientation") == 1)
    {
      +[VNImageBufferCache cacheKeyWithBufferFormat:width:height:](VNImageBufferCache, "cacheKeyWithBufferFormat:width:height:", PixelFormatType, Width, Height);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageBufferCache cacheBuffer:forCacheKey:](self->_pixelBufferRepsCache, "cacheBuffer:forCacheKey:", self->_origPixelBuffer, v16);

    }
    kdebug_trace();
    self = self;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)initWithOptions:(int)a3 orientation:(void *)a4 session:
{
  id v7;
  id v8;
  id *v9;
  uint64_t v10;
  id v11;
  VNImageBufferCache *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  objc_super v23;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)VNImageBuffer;
    v9 = (id *)objc_msgSendSuper2(&v23, sel_init);
    a1 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 1, a4);
      if (v7)
      {
        v10 = objc_msgSend(v7, "copy");
        v11 = a1[11];
        a1[11] = (id)v10;
      }
      else
      {
        v11 = a1[11];
        a1[11] = (id)MEMORY[0x1E0C9AA70];
      }

      v12 = objc_alloc_init(VNImageBufferCache);
      v13 = a1[6];
      a1[6] = v12;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNImageOptionCIContext"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = a1[7];
      a1[7] = (id)v14;

      v16 = v7;
      objc_opt_self();
      if (!a3)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VNImageOptionProperties"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = *MEMORY[0x1E0CBCFF0];
          objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19
            && (objc_msgSend(v17, "objectForKeyedSubscript:", v18),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                (v19 = v20) != 0))
          {
            a3 = objc_msgSend(v20, "intValue");
          }
          else
          {
            a3 = 1;
          }

        }
        else
        {
          a3 = 0;
        }

      }
      if ((a3 - 1) >= 8)
        v21 = 1;
      else
        v21 = a3;
      *((_DWORD *)a1 + 16) = v21;
      *((_DWORD *)a1 + 26) = 0;
    }
  }

  return a1;
}

- ($7CE4EAA4D876C6E552FFFC689D0B35FA)timingInfo
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  $7CE4EAA4D876C6E552FFFC689D0B35FA *result;

  v3 = MEMORY[0x1E0CA2E90];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&retstr->var2.var0 = v4;
  retstr->var2.var3 = *(_QWORD *)(v3 + 64);
  v5 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v3;
  *(_OWORD *)&retstr->var0.var3 = v5;
  result = ($7CE4EAA4D876C6E552FFFC689D0B35FA *)self->_origSampleBuffer;
  if (result)
    return ($7CE4EAA4D876C6E552FFFC689D0B35FA *)CMSampleBufferGetSampleTimingInfo((CMSampleBufferRef)result, 0, (CMSampleTimingInfo *)retstr);
  return result;
}

+ (uint64_t)_VNVTPixelTransferImageForSource:(CGFloat)a3 destinationBuffer:(CGFloat)a4 cropRect:(uint64_t)a5 performCrop:(__CVBuffer *)a6 vtSessionManager:(__CVBuffer *)a7 error:(int)a8
{
  OSType PixelFormatType;
  OSType v16;
  OSType v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  __CVBuffer *sourceBuffer;
  _QWORD *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;

  v60 = *MEMORY[0x1E0C80C00];
  v54 = a9;
  objc_opt_self();
  PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
  v16 = CVPixelBufferGetPixelFormatType(a7);
  sourceBuffer = a6;
  if (!v54)
  {
    v28 = 0;
LABEL_40:
    v39 = 0;
    goto LABEL_41;
  }
  v17 = v16;
  v18 = v54[1];
  v19 = &__block_literal_global_15076;
  v20 = &__block_literal_global_32_15077;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v18 + 8), 0xFFFFFFFFFFFFFFFFLL);
  os_unfair_lock_lock((os_unfair_lock_t)(v18 + 16));
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v21 = *(id *)(v18 + 24);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v22)
  {
    v23 = 0;
    v24 = *(_QWORD *)v56;
    do
    {
      v25 = 0;
      v26 = v23 + v22;
      do
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v21);
        v27 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * v25);
        v28 = v27;
        if (v27)
        {
          if (v27[2] == PixelFormatType && v27[3] == v17)
          {

            objc_msgSend(*(id *)(v18 + 24), "removeObjectAtIndex:", v23 + v25);
            goto LABEL_21;
          }
        }
        else if (!(PixelFormatType | v17))
        {
          goto LABEL_15;
        }

        ++v25;
      }
      while (v22 != v25);
      v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      v22 = v29;
      v23 = v26;
    }
    while (v29);
  }
LABEL_15:

  v30 = objc_msgSend(*(id *)(v18 + 24), "count");
  v31 = objc_msgSend(*(id *)(v18 + 32), "count");
  if (v30 && v31 + v30 == *(_DWORD *)v18)
    v31 = objc_msgSend(*(id *)(v18 + 24), "removeLastObject");
  _block_invoke_2(v31, a10);
  v32 = objc_claimAutoreleasedReturnValue();
  v28 = (_QWORD *)v32;
  if (v32)
  {
    *(_DWORD *)(v32 + 8) = PixelFormatType;
    *(_DWORD *)(v32 + 12) = v17;
  }
LABEL_21:
  objc_msgSend(*(id *)(v18 + 32), "addObject:", v28);
  os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 16));

  if (!v28)
    goto LABEL_40;
  v33 = (void *)v28[3];
  if (a8)
  {
    v61.origin.x = a1;
    v61.origin.y = a2;
    v61.size.width = a3;
    v61.size.height = a4;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v61);
  }
  else
  {
    DictionaryRepresentation = 0;
  }
  v35 = VTSessionSetProperty(v33, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  if ((_DWORD)v35)
  {
    if (a10)
    {
      v49 = v35;
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot set VTSession property, error: %d"));
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v36);
      v37 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
      *a10 = v37;

    }
  }
  else
  {
    v38 = VTPixelTransferSessionTransferImage((VTPixelTransferSessionRef)v33, sourceBuffer, a7);
    if (!(_DWORD)v38)
    {
      v39 = 1;
      goto LABEL_35;
    }
    if (a10)
    {
      v49 = v38;
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot transfer image using VTSession, error: %d"));
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v36);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
  }
  v39 = 0;
LABEL_35:
  v40 = v28;
  v41 = v54[1];
  v28 = v40;
  os_unfair_lock_lock((os_unfair_lock_t)(v41 + 16));
  if ((objc_msgSend(*(id *)(v41 + 32), "containsObject:", v28) & 1) == 0)
  objc_msgSend(*(id *)(v41 + 24), "addObject:", v28);
  objc_msgSend(*(id *)(v41 + 32), "removeObject:", v28);
  os_unfair_lock_unlock((os_unfair_lock_t)(v41 + 16));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v41 + 8));

LABEL_41:
  return v39;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *origSampleBuffer;
  VNSession *session;
  objc_super v5;

  CVPixelBufferRelease(self->_origPixelBuffer);
  self->_origPixelBuffer = 0;
  origSampleBuffer = self->_origSampleBuffer;
  if (origSampleBuffer)
  {
    CFRelease(origSampleBuffer);
    self->_origSampleBuffer = 0;
  }
  session = self->_session;
  self->_session = 0;

  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)VNImageBuffer;
  -[VNImageBuffer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthRepresentation, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_passedInCIContext, 0);
  objc_storeStrong((id *)&self->_pixelBufferRepsCache, 0);
  objc_storeStrong((id *)&self->_imageSourceManager, 0);
  objc_storeStrong((id *)&self->_origCIImage, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (__CVBuffer)cachedPixelBufferRepresentationForKey:(id)a3
{
  return -[VNImageBufferCache cachedBufferWithKey:](self->_pixelBufferRepsCache, "cachedBufferWithKey:", a3);
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4
{
  id v6;
  VNSession *v7;
  VNImageBuffer *v8;

  v6 = a4;
  v7 = objc_alloc_init(VNSession);
  v8 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:](self, "initWithCVPixelBuffer:orientation:options:session:", a3, 0, v6, v7);

  return v8;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  VNSession *v9;
  VNImageBuffer *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = objc_alloc_init(VNSession);
  v10 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:](self, "initWithCVPixelBuffer:orientation:options:session:", a3, v5, v8, v9);

  return v10;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  VNSession *v12;
  VNImageBuffer *v13;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(VNSession);
  v13 = -[VNImageBuffer initWithCVPixelBuffer:depthData:orientation:options:session:](self, "initWithCVPixelBuffer:depthData:orientation:options:session:", a3, v10, v7, v11, v12);

  return v13;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  VNImageBuffer *v15;
  uint64_t v16;
  VNDepthRepresentation *depthRepresentation;
  VNImageBuffer *v18;

  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:](self, "initWithCVPixelBuffer:orientation:options:session:", a3, v9, v13, v14);
  if (v15)
  {
    +[VNDepthRepresentation depthRepresentationForDepthData:orientation:](VNDepthRepresentation, "depthRepresentationForDepthData:orientation:", v12, v9);
    v16 = objc_claimAutoreleasedReturnValue();
    depthRepresentation = v15->_depthRepresentation;
    v15->_depthRepresentation = (VNDepthRepresentation *)v16;

    v18 = v15;
  }

  return v15;
}

- (VNImageBuffer)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  VNSession *v9;
  VNImageBuffer *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = objc_alloc_init(VNSession);
  v10 = -[VNImageBuffer initWithCGImage:orientation:options:session:](self, "initWithCGImage:orientation:options:session:", a3, v5, v8, v9);

  return v10;
}

- (VNImageBuffer)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  VNImageBuffer *v12;
  uint64_t v13;
  CIImage *origCIImage;
  VNImageBuffer *v15;

  v10 = a5;
  v11 = a6;
  v12 = (VNImageBuffer *)-[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v10, a4, v11);
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", a3);
    origCIImage = v12->_origCIImage;
    v12->_origCIImage = (CIImage *)v13;

    kdebug_trace();
    v15 = v12;
  }

  return v12;
}

- (VNImageBuffer)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  VNSession *v10;
  VNImageBuffer *v11;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNImageBuffer initWithCIImage:orientation:options:session:](self, "initWithCIImage:orientation:options:session:", v8, v6, v9, v10);

  return v11;
}

- (VNImageBuffer)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v11;
  id v12;
  id v13;
  id *v14;
  VNImageBuffer *v15;
  VNImageBuffer *v16;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = -[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v12, a4, v13);
  v15 = (VNImageBuffer *)v14;
  if (v14)
  {
    objc_storeStrong(v14 + 3, a3);
    kdebug_trace();
    v16 = v15;
  }

  return v15;
}

- (VNImageBuffer)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  VNSession *v10;
  VNImageBuffer *v11;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNImageBuffer initWithData:orientation:options:session:](self, "initWithData:orientation:options:session:", v8, v6, v9, v10);

  return v11;
}

- (VNImageBuffer)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  VNImageSourceManager *v13;
  VNImageSourceManager *v14;
  id *v15;
  id *v16;
  VNImageBuffer *v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[VNImageSourceManager initWithImageData:]([VNImageSourceManager alloc], "initWithImageData:", v10);
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  if (!a4)
    a4 = -[VNImageSourceManager exifOrientation](v13, "exifOrientation");
  v15 = -[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v11, a4, v12);
  v16 = v15;
  if (!v15)
  {
    self = 0;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  objc_storeStrong(v15 + 5, v14);
  kdebug_trace();
  self = v16;
  v17 = self;
LABEL_8:

  return v17;
}

- (VNImageBuffer)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  VNSession *v10;
  VNImageBuffer *v11;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(VNSession);
  v11 = -[VNImageBuffer initWithURL:orientation:options:session:](self, "initWithURL:orientation:options:session:", v8, v6, v9, v10);

  return v11;
}

- (VNImageBuffer)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  VNImageSourceManager *v13;
  VNImageSourceManager *v14;
  id *v15;
  id *v16;
  VNImageBuffer *v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[VNImageSourceManager initWithImageURL:]([VNImageSourceManager alloc], "initWithImageURL:", v10);
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  if (!a4)
    a4 = -[VNImageSourceManager exifOrientation](v13, "exifOrientation");
  v15 = -[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v11, a4, v12);
  v16 = v15;
  if (!v15)
  {
    self = 0;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  objc_storeStrong(v15 + 5, v14);
  kdebug_trace();
  self = v16;
  v17 = self;
LABEL_8:

  return v17;
}

- (VNImageBuffer)initWithURL:(id)a3 options:(id)a4
{
  return -[VNImageBuffer initWithURL:orientation:options:](self, "initWithURL:orientation:options:", a3, 0, a4);
}

- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  VNSession *v9;
  VNImageBuffer *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = objc_alloc_init(VNSession);
  v10 = -[VNImageBuffer initWithCMSampleBuffer:orientation:options:session:](self, "initWithCMSampleBuffer:orientation:options:session:", a3, v5, v8, v9);

  return v10;
}

- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  const __CFNumber *v12;
  CVImageBufferRef ImageBuffer;
  VNImageBuffer *v14;
  VNImageBuffer *v15;
  unsigned int valuePtr;

  valuePtr = a4;
  v10 = a5;
  v11 = a6;
  if (!CMSampleBufferIsValid(a3) || !CMSampleBufferDataIsReady(a3))
    goto LABEL_10;
  if (!a4)
  {
    v12 = (const __CFNumber *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CBCFF0], 0);
    if (v12)
      CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
    goto LABEL_10;
  v14 = -[VNImageBuffer initWithCVPixelBuffer:orientation:options:session:](self, "initWithCVPixelBuffer:orientation:options:session:", ImageBuffer, valuePtr, v10, v11);
  if (!v14)
  {
    self = 0;
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  CFRetain(a3);
  v14->_origSampleBuffer = a3;
  self = v14;
  v15 = self;
LABEL_11:

  return v15;
}

- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  VNSession *v12;
  VNImageBuffer *v13;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(VNSession);
  v13 = -[VNImageBuffer initWithCMSampleBuffer:depthData:orientation:options:session:](self, "initWithCMSampleBuffer:depthData:orientation:options:session:", a3, v10, v7, v11, v12);

  return v13;
}

- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  VNImageBuffer *v13;
  uint64_t v14;
  VNDepthRepresentation *depthRepresentation;
  VNImageBuffer *v16;

  v8 = *(_QWORD *)&a5;
  v11 = a4;
  v12 = a6;
  v13 = -[VNImageBuffer initWithCMSampleBuffer:orientation:options:](self, "initWithCMSampleBuffer:orientation:options:", a3, v8, v12);
  if (v13)
  {
    +[VNDepthRepresentation depthRepresentationForDepthData:orientation:](VNDepthRepresentation, "depthRepresentationForDepthData:orientation:", v11, v8);
    v14 = objc_claimAutoreleasedReturnValue();
    depthRepresentation = v13->_depthRepresentation;
    v13->_depthRepresentation = (VNDepthRepresentation *)v14;

    v16 = v13;
  }

  return v13;
}

- (__CVBuffer)originalPixelBuffer
{
  return self->_origPixelBuffer;
}

- (CGImage)originalCGImage
{
  return -[CIImage CGImage](self->_origCIImage, "CGImage");
}

- (VNImageBuffer)bufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 error:(id *)a7
{
  return -[VNImageBuffer bufferWithWidth:height:format:options:error:pixelBufferRepsCacheKey:](self, "bufferWithWidth:height:format:options:error:pixelBufferRepsCacheKey:", a3, a4, *(_QWORD *)&a5, a6, a7, 0);
}

- (VNImageBuffer)bufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 error:(id *)a7 pixelBufferRepsCacheKey:(id *)a8
{
  uint64_t v10;
  id v14;
  void *v16;

  v10 = *(_QWORD *)&a5;
  v14 = a6;
  if (*(_OWORD *)&self->_origPixelBuffer == 0 && !self->_imageSourceManager)
  {
    if (a7)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to create image for processing"));
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v16);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }
  else
  {
    -[VNImageBuffer fullImageBufferRect](self, "fullImageBufferRect");
    a7 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:](self, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", a3, a4, v10, v14, a7, a8);
  }

  return (VNImageBuffer *)a7;
}

- (__CVBuffer)croppedBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 error:(id *)a8 pixelBufferRepsCacheKey:(id *)a9
{
  return (__CVBuffer *)-[VNImageBuffer _croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:rotate90CCW:]((uint64_t)self, a3, a4, *(uint64_t *)&a5, a7, a8, a9, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (__CVBuffer)cropAndScaleBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 cropRect:(CGRect)a5 format:(unsigned int)a6 imageCropAndScaleOption:(unint64_t)a7 options:(id)a8 error:(id *)a9 calculatedNormalizedOriginOffset:(CGPoint *)a10 calculatedScaleX:(double *)a11 calculatedScaleY:(double *)a12
{
  return -[VNImageBuffer cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:](self, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", a3, a4, *(_QWORD *)&a6, a7, a8, a9, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a10, a11, a12, 0);
}

- (__CVBuffer)cropAndScaleBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 cropRect:(CGRect)a5 format:(unsigned int)a6 imageCropAndScaleOption:(unint64_t)a7 options:(id)a8 error:(id *)a9 calculatedNormalizedOriginOffset:(CGPoint *)a10 calculatedScaleX:(double *)a11 calculatedScaleY:(double *)a12 pixelBufferRepsCacheKey:(id *)a13
{
  uint64_t v15;
  double height;
  double width;
  double y;
  double x;
  id v23;
  unint64_t v24;
  char v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  __CVBuffer *v38;
  __CVBuffer *v39;
  __CVBuffer *v40;
  int v41;
  _QWORD v43[8];
  int v44;
  char v45;
  uint64_t v46;
  double *v47;
  uint64_t v48;
  __n128 (*v49)(__n128 *, __n128 *);
  uint64_t (*v50)();
  const char *v51;
  double v52;
  double v53;
  char v54;
  double v55;
  double v56;

  v15 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v23 = a8;
  v24 = 0;
  v25 = 0;
  v26 = *MEMORY[0x1E0C9D538];
  v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v56 = 1.0;
  v55 = 1.0;
  if ((uint64_t)a7 <= 1)
  {
    if (!a7)
    {
      +[VNImageBuffer computeCenterCropRectFromCropRect:inImageSize:calculatedScaleX:calculatedScaleY:](VNImageBuffer, "computeCenterCropRectFromCropRect:inImageSize:calculatedScaleX:calculatedScaleY:", &v56, &v55, x, y, width, height, (double)a3, (double)a4);
      x = v33;
      y = v34;
      v25 = 0;
      v26 = v33 / width;
      v24 = a4;
      v32 = a3;
      width = v35;
      v27 = v34 / height;
      height = v36;
      goto LABEL_20;
    }
    if (a7 != 1)
      goto LABEL_16;
    v28 = (double)a3 / width;
    v56 = v28;
    v29 = (double)a4 / height;
    v55 = v29;
    v25 = 0;
    if (v28 < v29)
    {
      v24 = (unint64_t)(height * v28);
      v55 = (double)a3 / width;
LABEL_14:
      v32 = a3;
      goto LABEL_20;
    }
    v32 = (unint64_t)(width * v29);
    v56 = (double)a4 / height;
  }
  else
  {
    if (a7 == 2)
    {
      v25 = 0;
      goto LABEL_11;
    }
    if (a7 != 257)
    {
      if (a7 == 258)
      {
        v56 = (double)a3 / height;
        v55 = (double)a4 / width;
        v25 = 1;
LABEL_11:
        v24 = a4;
        goto LABEL_14;
      }
LABEL_16:
      v32 = 0;
      goto LABEL_20;
    }
    v30 = (double)a3 / height;
    v56 = v30;
    v31 = (double)a4 / width;
    v55 = v31;
    if (v30 < v31)
    {
      v24 = (unint64_t)(width * v30);
      v55 = (double)a3 / height;
      v25 = 1;
      goto LABEL_14;
    }
    v32 = (unint64_t)(height * v31);
    v56 = (double)a4 / width;
    v25 = 1;
  }
  v24 = a4;
LABEL_20:
  v37 = -[VNImageBuffer _croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:rotate90CCW:]((uint64_t)self, v32, v24, v15, v23, a9, a13, v25, x, y, width, height);
  v38 = (__CVBuffer *)v37;
  if (!v37)
  {
LABEL_35:
    v40 = 0;
    goto LABEL_36;
  }
  if (a7 - 257 >= 2 && a7 != 1)
  {
    v40 = (__CVBuffer *)v37;
    goto LABEL_28;
  }
  v54 = 0;
  v39 = -[VNImageBuffer _createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:height:format:options:outPooled:error:]((CVPixelBufferPoolRef)self, a3, a4, v15, v23, &v54, a9);
  v40 = v39;
  if (!v39)
  {
    CVPixelBufferRelease(v38);
    goto LABEL_35;
  }
  v46 = 0;
  v47 = (double *)&v46;
  v48 = 0x4012000000;
  v49 = __Block_byref_object_copy__4449;
  v50 = __Block_byref_object_dispose__4450;
  v51 = "";
  v52 = v26;
  v53 = v27;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __197__VNImageBuffer_cropAndScaleBufferWithWidth_height_cropRect_format_imageCropAndScaleOption_options_error_calculatedNormalizedOriginOffset_calculatedScaleX_calculatedScaleY_pixelBufferRepsCacheKey___block_invoke;
  v43[3] = &unk_1E4543C20;
  v44 = v15;
  v45 = v54;
  v43[6] = a4;
  v43[7] = v38;
  v43[4] = &v46;
  v43[5] = a3;
  v41 = VNExecuteBlockWithPixelBuffer(v39, 0, v43, a9);
  v26 = v47[6];
  v27 = v47[7];
  CVPixelBufferRelease(v38);
  if (!v41)
  {
    CVPixelBufferRelease(v40);
    _Block_object_dispose(&v46, 8);
    goto LABEL_35;
  }
  _Block_object_dispose(&v46, 8);
LABEL_28:
  if (a10)
  {
    a10->x = v26;
    a10->y = v27;
  }
  if (a11)
    *a11 = v56;
  if (a12)
    *a12 = v55;
LABEL_36:

  return v40;
}

- (NSNumber)sceneStabilityMetric
{
  id origSampleBuffer;

  origSampleBuffer = self->_origSampleBuffer;
  if (origSampleBuffer)
  {
    origSampleBuffer = (id)CMGetAttachment(origSampleBuffer, CFSTR("SceneStabilityMetric"), 0);
    if (origSampleBuffer)
      origSampleBuffer = origSampleBuffer;
  }
  return (NSNumber *)origSampleBuffer;
}

- (int)aspect
{
  double v3;
  unint64_t v4;

  v3 = (double)-[VNImageBuffer width](self, "width");
  v4 = -[VNImageBuffer height](self, "height");
  if (v3 < (double)v4)
    return 1;
  else
    return 2 * (v3 > (double)v4);
}

- (int)aspectForRegionOfInterest:(CGRect)a3
{
  double height;
  double width;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;

  height = a3.size.height;
  width = a3.size.width;
  v6 = -[VNImageBuffer width](self, "width", a3.origin.x, a3.origin.y);
  v7 = -[VNImageBuffer height](self, "height");
  v8 = width * (double)v6;
  v9 = height * (double)v7;
  if (v8 < v9)
    return 1;
  else
    return 2 * (v8 > v9);
}

- (BOOL)getPixelFocalLengthIfAvailable:(float *)a3
{
  _BOOL4 v4;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  v4 = -[VNImageBuffer getCameraIntrinsicsAvailable:](self, "getCameraIntrinsicsAvailable:", v6);
  if (v4)
    *a3 = *(float *)v6;
  return v4;
}

- (BOOL)getCameraOpticalCenterIfAvailable:(CGPoint *)a3
{
  _BOOL4 v5;
  float v6;
  float v7;
  _OWORD v9[2];
  __int128 v10;

  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  v5 = -[VNImageBuffer getCameraIntrinsicsAvailable:](self, "getCameraIntrinsicsAvailable:", v9);
  if (v5)
  {
    v6 = *(float *)&v10;
    a3->x = (float)(v6 / (float)-[VNImageBuffer width](self, "width"));
    v7 = *((float *)&v10 + 1);
    a3->y = (float)(v7 / (float)-[VNImageBuffer height](self, "height"));
  }
  return v5;
}

- (BOOL)getCameraIntrinsicsAvailable:(id *)a3
{
  const __CFData *v4;
  BOOL v5;
  CFRange v7;

  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("VNImageOptionCameraIntrinsics"));
  v4 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7.location = 0;
    v7.length = 48;
    CFDataGetBytes(v4, v7, (UInt8 *)a3);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)imageProperties
{
  return -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("VNImageOptionProperties"));
}

- (id)fileURL
{
  VNImageSourceManager *imageSourceManager;

  imageSourceManager = self->_imageSourceManager;
  if (imageSourceManager)
    return imageSourceManager->_imageURL;
  else
    return 0;
}

- (CGRect)makeClippedRectAgainstImageExtentUsingOriginalRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v7;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VNImageBuffer fullImageBufferRect](self, "fullImageBufferRect");
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectIntersection(v7, v9);
}

- (__CVBuffer)createBufferWithMaxSideLengthOf:(unint64_t)a3 pixelFormat:(unsigned int)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  VNImageBuffer *v14;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = -[VNImageBuffer width](self, "width");
  v12 = -[VNImageBuffer height](self, "height");
  v13 = v12;
  if (v11 <= v12)
  {
    if (v12 > a3)
    {
      v11 = (unint64_t)(float)((float)((float)a3 * (float)v11) / (float)v12);
      v13 = a3;
    }
  }
  else if (v11 > a3)
  {
    v13 = (unint64_t)(float)((float)((float)a3 * (float)v12) / (float)v11);
    v11 = a3;
  }
  v14 = -[VNImageBuffer bufferWithWidth:height:format:options:error:](self, "bufferWithWidth:height:format:options:error:", v11, v13, v7, v10, a6);

  return (__CVBuffer *)v14;
}

- (__CVBuffer)createCroppedBufferWithMaxSideLengthOf:(unint64_t)a3 cropRect:(CGRect)a4 pixelFormat:(unsigned int)a5 options:(id)a6 error:(id *)a7 pixelBufferRepsCacheKey:(id *)a8
{
  uint64_t v10;
  double height;
  double width;
  double y;
  double x;
  id v17;
  unint64_t v18;
  unint64_t v19;
  __CVBuffer *v20;

  v10 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a6;
  v18 = (unint64_t)width;
  v19 = (unint64_t)height;
  if (width <= height)
  {
    if (v19 > a3)
    {
      v18 = (unint64_t)(width / height * (double)a3);
      v19 = a3;
    }
  }
  else if (v18 > a3)
  {
    v19 = (unint64_t)(height / width * (double)a3);
    v18 = a3;
  }
  v20 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:](self, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v18, v19, v10, v17, a7, a8, x, y, width, height);

  return v20;
}

- (void)purgeCachedRepresentations
{
  -[VNImageBufferCache purgeCacheRepresentationsForOriginalBuffer:](self->_pixelBufferRepsCache, "purgeCacheRepresentationsForOriginalBuffer:", self->_origPixelBuffer);
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 1;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@;opt=%@"), v5, self->_options);

  return v6;
}

- (id)debugQuickLookObject
{
  CIImage *v2;
  CIImage *origCIImage;
  void *v4;
  VNImageSourceManager *imageSourceManager;
  CGImage *ImageAtIndex;

  if (self->_origPixelBuffer)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:");
    v2 = (CIImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    origCIImage = self->_origCIImage;
    if (origCIImage)
    {
      v2 = origCIImage;
    }
    else
    {
      imageSourceManager = self->_imageSourceManager;
      if (imageSourceManager)
      {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(-[VNImageSourceManager _cgImageSourceAtAddress:forSubSampleFactor:protectedWithUnfairLock:operatingInLowPriority:error:](self->_imageSourceManager, "_cgImageSourceAtAddress:forSubSampleFactor:protectedWithUnfairLock:operatingInLowPriority:error:", &imageSourceManager->_imageSourceSubsample1, 1, &imageSourceManager->_loadSubSample1Lock, 0, 0), 0, 0);
        VNDebugImageFromCGImage((uint64_t)ImageAtIndex);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        CGImageRelease(ImageAtIndex);
        return v4;
      }
      -[VNImageBuffer debugDescription](self, "debugDescription");
      v2 = (CIImage *)objc_claimAutoreleasedReturnValue();
    }
  }
  v4 = v2;
  return v4;
}

- (id)augmentedBuffersWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 augmentationOptions:(id)a7 error:(id *)a8
{
  -[VNImageBuffer augmentedCroppedBuffersWithWidth:height:format:cropRect:options:augmentationOptions:error:](self, "augmentedCroppedBuffersWithWidth:height:format:cropRect:options:augmentationOptions:error:", a3, a4, *(_QWORD *)&a5, a6, a7, a8, *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)augmentedCroppedBuffersWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 augmentationOptions:(id)a8 error:(id *)a9
{
  CGFloat x;
  id v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  __CVBuffer *origPixelBuffer;
  void *v22;
  id v23;
  void *v24;
  CIContext *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  void *v46;
  float v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  unsigned int v55;
  float i;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  float v64;
  float v65;
  void *v66;
  void *v67;
  float v68;
  float v69;
  void *v70;
  void *v71;
  float v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  double v77;
  unsigned int v78;
  float k;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  float v86;
  float v87;
  void *v88;
  void *v89;
  float v90;
  float v91;
  void *v92;
  void *v93;
  float v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t m;
  void *v98;
  unsigned int v99;
  float v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  float v107;
  float v108;
  void *v109;
  void *v110;
  float v111;
  float v112;
  void *v113;
  void *v114;
  float v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t n;
  unsigned int v120;
  float ii;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  float v126;
  float v127;
  void *v128;
  void *v129;
  float v130;
  float v131;
  void *v132;
  void *v133;
  void *v134;
  float v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *jj;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  double v146;
  unsigned int v147;
  float kk;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t mm;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  float v165;
  float v166;
  unsigned int v167;
  float v168;
  float v169;
  void *v170;
  void *v171;
  float v172;
  void *v173;
  void *v174;
  void *v175;
  unsigned int v176;
  unint64_t v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  CGFloat *v181;
  uint64_t nn;
  void *v183;
  float v184;
  double v185;
  double v186;
  unint64_t v187;
  unint64_t v188;
  double v189;
  float v190;
  float v191;
  BOOL v192;
  double v193;
  double v194;
  unsigned int v195;
  uint64_t v196;
  double v197;
  float v198;
  void *v199;
  char v200;
  void *v201;
  void *v203;
  _BOOL4 v204;
  void *v205;
  id v206;
  void *v210;
  id v212;
  id v214;
  id v215;
  CGFloat y;
  double width;
  double rect;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  id obj;
  id obja;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  unsigned int v241;
  unsigned int v242;
  unsigned int v243;
  unsigned int v244;
  unsigned int v245;
  id v246;
  id v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  _QWORD v264[3];
  __int128 v265;
  uint64_t v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  CVPixelBufferRef texture;
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  _QWORD v287[11];
  CGRect v288;
  CGRect v289;
  CGRect v290;

  width = a6.size.width;
  rect = a6.size.height;
  y = a6.origin.y;
  x = a6.origin.x;
  v287[9] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v214 = a8;
  v206 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v212 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = -[VNImageBuffer width](self, "width");
  v13 = -[VNImageBuffer height](self, "height");
  v288.origin.x = x;
  v288.origin.y = y;
  v288.size.width = width;
  v288.size.height = rect;
  v14 = (double)v12;
  v15 = (double)v13;
  if (CGRectIsInfinite(v288))
  {
    v204 = 0;
  }
  else
  {
    v289.origin.x = 0.0;
    v289.origin.y = 0.0;
    v289.size.width = (double)v12;
    v289.size.height = (double)v13;
    v290.origin.x = x;
    v290.origin.y = y;
    v290.size.width = width;
    v290.size.height = rect;
    v204 = !CGRectEqualToRect(v289, v290);
  }
  v287[0] = CFSTR("VNImageBufferAugmentationApplePipeline");
  v287[1] = CFSTR("VNImageBufferAugmentationBlur");
  v287[2] = CFSTR("VNImageBufferAugmentationNoise");
  v287[3] = CFSTR("VNImageBufferAugmentationRotation");
  v287[4] = CFSTR("VNImageBufferAugmentationFlipHorizontal");
  v287[5] = CFSTR("VNImageBufferAugmentationFlipVertical");
  v287[6] = CFSTR("VNImageBufferAugmentationShear");
  v287[7] = CFSTR("VNImageBufferAugmentationExposure");
  v287[8] = CFSTR("VNImageBufferAugmentationRandomCrop");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v287, 9);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageBuffer _optionsWithOverridingOptions:]((uint64_t)self, v11);
  v210 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v214, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObjectCommonWithArray:", v205);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationApplePipeline"));
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    if (v220)
    {
      texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
      if (!texture)
        goto LABEL_221;
      v19 = v210;
      v20 = v19;
      if (!self)
      {

        goto LABEL_221;
      }
      origPixelBuffer = self->_origPixelBuffer;
      if (origPixelBuffer)
      {
        v22 = (void *)CFAutorelease(origPixelBuffer);
      }
      else
      {
        -[VNImageBuffer _baseCIImage](self);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, -[VNImageBuffer width](self, "width"), -[VNImageBuffer height](self, "height"), 875704422, a9);
        if (v22)
        {
          v25 = self->_passedInCIContext;
          -[VNImageBuffer session](self, "session");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "vnciContextManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v28 = 0;
          }
          else
          {
            -[VNCIContextManager waitAndGetAvailableContextFromOptions:error:](v27, MEMORY[0x1E0C9AA70], 0);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v29;
            if (v29)
              v31 = *(void **)(v29 + 8);
            else
              v31 = 0;
            v25 = v31;
            v28 = v30;
          }
          -[CIContext render:toCVPixelBuffer:](v25, "render:toCVPixelBuffer:", v24, v22);
          v22 = (void *)CFAutorelease(v22);
          -[VNCIContextManager releaseContext:]((uint64_t)v27, v28);

        }
      }

      if (!v22)
        goto LABEL_221;
      if (!-[VNImageBuffer _cropCVPixelBuffer:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:](self, (__CVBuffer *)v22, &texture, a3, a4, a5, v204, v20, x, y, width, rect, 0, a9))goto LABEL_221;
      objc_msgSend(v206, "addObject:", texture);
      CVPixelBufferRelease(texture);
      texture = 0;
      texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
      if (!texture)
        goto LABEL_221;
      -[VNImageBuffer _baseCIImage](self);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)&self->super.isa, v32, &texture, a3, a4, a5, v204, v20, x, y, width, rect, 0, a9);

      if ((v33 & 1) == 0)
        goto LABEL_221;
      objc_msgSend(v206, "addObject:", texture);
      CVPixelBufferRelease(texture);
      texture = 0;
      if (self->_imageSourceManager)
      {
        texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
        if (!texture
          || !-[VNImageBuffer _cropImageSourceManager:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((uint64_t)self, self->_imageSourceManager, &texture, a3, a4, a5, v204, v20, x, y, width, rect, 0, a9))
        {
          goto LABEL_221;
        }
        objc_msgSend(v206, "addObject:", texture);
        CVPixelBufferRelease(texture);
      }
    }
    -[VNImageBuffer _baseCIImage](self);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "addObject:", v34);

    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationBlur"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v221 = v35;
    if (v35)
    {
      v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v35, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMaxRange"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "floatValue");
        v40 = v39;
      }
      else
      {
        v40 = 32.0;
      }
      objc_msgSend(v221, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMinRange"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v41;
      if (v41)
      {
        objc_msgSend(v41, "floatValue");
        v44 = v43;
      }
      else
      {
        v44 = 1.0;
      }
      objc_msgSend(v221, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionNumberOfBuffers"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
        v242 = objc_msgSend(v45, "intValue");
      else
        v242 = 10;
      objc_msgSend(v221, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionRandomSeed"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        srand(objc_msgSend(v46, "intValue"));
        v47 = (float)(v40 - v44) * 4.6566e-10;
      }
      else
      {
        v47 = (float)(v40 - v44) / (float)v242;
      }
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDiscBlur"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = 0u;
      v278 = 0u;
      v275 = 0u;
      v276 = 0u;
      obj = v212;
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v275, v286, 16);
      if (v49)
      {
        v228 = (id)*MEMORY[0x1E0C9E1F8];
        v232 = *(id *)v276;
        v50 = *MEMORY[0x1E0C9E258];
        do
        {
          v51 = 0;
          v237 = v49;
          do
          {
            if (*(id *)v276 != v232)
              objc_enumerationMutation(obj);
            v52 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * v51);
            objc_msgSend(v52, "imageByClampingToExtent");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setValue:forKey:", v53, v228);

            v55 = v242;
            for (i = v44; v55; --v55)
            {
              *(float *)&v54 = i;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setValue:forKey:", v57, v50);

              objc_msgSend(v48, "outputImage");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "extent");
              objc_msgSend(v58, "imageByCroppingToRect:");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v36, "addObject:", v59);
              if (v46)
                i = v44 + (float)((float)random() * v47);
              else
                i = v47 + i;

            }
            ++v51;
          }
          while (v51 != v237);
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v275, v286, 16);
        }
        while (v49);
      }

      v212 = v36;
    }
    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationExposure"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v222 = v60;
    if (v60)
    {
      v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v60, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMaxRange"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v62)
      {
        objc_msgSend(v62, "floatValue");
        v65 = v64;
      }
      else
      {
        v65 = 2.0;
      }
      objc_msgSend(v60, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMinRange"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = v66;
      if (v66)
      {
        objc_msgSend(v66, "floatValue");
        v69 = v68;
      }
      else
      {
        v69 = -2.0;
      }
      objc_msgSend(v222, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionNumberOfBuffers"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
        v243 = objc_msgSend(v70, "intValue");
      else
        v243 = 10;
      objc_msgSend(v222, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionRandomSeed"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        srand(objc_msgSend(v71, "intValue"));
        v72 = (float)(v65 - v69) * 4.6566e-10;
      }
      else
      {
        v72 = (float)(v65 - v69) / (float)v243;
      }
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIExposureAdjust"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v273 = 0u;
      v274 = 0u;
      v271 = 0u;
      v272 = 0u;
      v229 = v212;
      v74 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v271, v285, 16);
      if (v74)
      {
        v233 = (id)*MEMORY[0x1E0C9E1F8];
        v238 = *(_QWORD *)v272;
        v75 = *MEMORY[0x1E0C9E1E8];
        do
        {
          for (j = 0; j != v74; ++j)
          {
            if (*(_QWORD *)v272 != v238)
              objc_enumerationMutation(v229);
            objc_msgSend(v73, "setValue:forKey:", *(_QWORD *)(*((_QWORD *)&v271 + 1) + 8 * j), v233);
            v78 = v243;
            for (k = v69; v78; --v78)
            {
              *(float *)&v77 = k;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "setValue:forKey:", v80, v75);

              objc_msgSend(v73, "outputImage");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "addObject:", v81);

              if (v71)
                k = v69 + (float)((float)random() * v72);
              else
                k = v72 + k;
            }
          }
          v74 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v271, v285, 16);
        }
        while (v74);
      }

      v212 = v61;
    }
    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationShear"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v223 = v82;
    if (v82)
    {
      v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v82, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMaxRange"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v84;
      if (v84)
      {
        objc_msgSend(v84, "floatValue");
        v87 = v86;
      }
      else
      {
        v87 = 10.0;
      }
      objc_msgSend(v82, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMinRange"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      v89 = v88;
      if (v88)
      {
        objc_msgSend(v88, "floatValue");
        v91 = v90;
      }
      else
      {
        v91 = -10.0;
      }
      objc_msgSend(v223, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionNumberOfBuffers"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (v92)
        v244 = objc_msgSend(v92, "intValue");
      else
        v244 = 10;
      objc_msgSend(v223, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionRandomSeed"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      if (v93)
      {
        srand(objc_msgSend(v93, "intValue"));
        v94 = (float)(v87 - v91) * 4.6566e-10;
      }
      else
      {
        v94 = (float)(v87 - v91) / (float)v244;
      }
      v269 = 0u;
      v270 = 0u;
      v267 = 0u;
      v268 = 0u;
      v234 = v212;
      v95 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v267, v284, 16);
      if (v95)
      {
        v239 = *(_QWORD *)v268;
        v96 = (uint64_t *)MEMORY[0x1E0C9BAA8];
        do
        {
          for (m = 0; m != v95; ++m)
          {
            if (*(_QWORD *)v268 != v239)
              objc_enumerationMutation(v234);
            if (v244)
            {
              v98 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * m);
              v99 = v244;
              v100 = v91;
              do
              {
                v101 = *v96;
                v265 = *(_OWORD *)(v96 + 3);
                v266 = v96[5];
                v264[0] = v101;
                v264[1] = 0;
                *(double *)&v264[2] = v100 * 3.14159265 / -180.0;
                objc_msgSend(v98, "imageByApplyingTransform:", v264);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "addObject:", v102);

                if (v93)
                  v100 = v91 + (float)((float)random() * v94);
                else
                  v100 = v94 + v100;
                --v99;
              }
              while (v99);
            }
          }
          v95 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v267, v284, 16);
        }
        while (v95);
      }

      v212 = v83;
    }
    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationRotation"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    v224 = v103;
    if (v103)
    {
      v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v103, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMaxRange"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v105;
      if (v105)
      {
        objc_msgSend(v105, "floatValue");
        v108 = v107;
      }
      else
      {
        v108 = 10.0;
      }
      objc_msgSend(v224, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMinRange"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      v110 = v109;
      if (v109)
      {
        objc_msgSend(v109, "floatValue");
        v112 = v111;
      }
      else
      {
        v112 = -10.0;
      }
      objc_msgSend(v224, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionNumberOfBuffers"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      if (v113)
        v245 = objc_msgSend(v113, "intValue");
      else
        v245 = 10;
      objc_msgSend(v224, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionRandomSeed"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();

      if (v114)
      {
        srand(objc_msgSend(v114, "intValue"));
        v115 = (float)(v108 - v112) * 4.6566e-10;
      }
      else
      {
        v115 = (float)(v108 - v112) / (float)v245;
      }
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIStraightenFilter"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v262 = 0u;
      v263 = 0u;
      v260 = 0u;
      v261 = 0u;
      v230 = v212;
      v117 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v260, v283, 16);
      if (v117)
      {
        v240 = *(_QWORD *)v261;
        v235 = (id)*MEMORY[0x1E0C9E1F8];
        v118 = *MEMORY[0x1E0C9E180];
        do
        {
          for (n = 0; n != v117; ++n)
          {
            if (*(_QWORD *)v261 != v240)
              objc_enumerationMutation(v230);
            objc_msgSend(v116, "setValue:forKey:", *(_QWORD *)(*((_QWORD *)&v260 + 1) + 8 * n), v235);
            v120 = v245;
            for (ii = v112; v120; --v120)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ii * 3.14159265 / 180.0);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "setValue:forKey:", v122, v118);

              objc_msgSend(v116, "outputImage");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "addObject:", v123);

              if (v114)
                ii = v112 + (float)((float)random() * v115);
              else
                ii = v115 + ii;
            }
          }
          v117 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v260, v283, 16);
        }
        while (v117);
      }

      v212 = v104;
    }
    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationNoise"));
    v203 = (void *)objc_claimAutoreleasedReturnValue();

    if (v203)
    {
      v246 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v203, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMaxRange"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = v124;
      if (v124)
      {
        objc_msgSend(v124, "floatValue");
        v127 = v126;
      }
      else
      {
        v127 = 0.0;
      }
      objc_msgSend(v203, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMinRange"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      v129 = v128;
      if (v128)
      {
        objc_msgSend(v128, "floatValue");
        v131 = v130;
      }
      else
      {
        v131 = 1.0;
      }
      objc_msgSend(v203, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionNumberOfBuffers"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      v133 = v132;
      if (v132)
        v241 = objc_msgSend(v132, "intValue");
      else
        v241 = 10;
      objc_msgSend(v203, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionRandomSeed"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      if (v134)
      {
        srand(objc_msgSend(v134, "intValue"));
        v135 = (float)(v127 - v131) * 4.6566e-10;
      }
      else
      {
        v135 = (float)(v127 - v131) / (float)v241;
      }
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIRandomGenerator"));
      v231 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorMonochrome"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIMultiplyBlendMode"));
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v258 = 0u;
      v259 = 0u;
      v256 = 0u;
      v257 = 0u;
      v215 = v212;
      v138 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v256, v282, 16);
      if (v138)
      {
        obja = *(id *)v257;
        v139 = *MEMORY[0x1E0C9E1F8];
        v225 = *MEMORY[0x1E0C9E1C0];
        v219 = *MEMORY[0x1E0C9E190];
        v140 = *MEMORY[0x1E0C9E200];
        do
        {
          v236 = (id)v138;
          for (jj = 0; jj != v236; jj = (char *)jj + 1)
          {
            if (*(id *)v257 != obja)
              objc_enumerationMutation(v215);
            v142 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * (_QWORD)jj);
            objc_msgSend(v231, "outputImage");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "setValue:forKey:", v143, v139);

            objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "setValue:forKey:", v144, v225);

            objc_msgSend(v142, "imageByClampingToExtent");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "setValue:forKey:", v145, v219);

            v147 = v241;
            for (kk = v131; v147; --v147)
            {
              *(float *)&v146 = kk;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v146);
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v136, "setValue:forKey:", v149, v140);

              objc_msgSend(v136, "outputImage");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "setValue:forKey:", v150, v139);

              objc_msgSend(v137, "outputImage");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v246, "addObject:", v151);

              if (v134)
                kk = v131 + (float)((float)random() * v135);
              else
                kk = v135 + kk;
            }
          }
          v138 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v256, v282, 16);
        }
        while (v138);
      }

      v212 = v246;
    }
    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationFlipHorizontal"));
    v152 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationFlipVertical"));
    v153 = (void *)objc_claimAutoreleasedReturnValue();

    if (v152 != 0 || v153 != 0)
    {
      v154 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v254 = 0u;
      v255 = 0u;
      v252 = 0u;
      v253 = 0u;
      v247 = v212;
      v155 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v252, v281, 16);
      if (v155)
      {
        v156 = *(_QWORD *)v253;
        do
        {
          for (mm = 0; mm != v155; ++mm)
          {
            if (*(_QWORD *)v253 != v156)
              objc_enumerationMutation(v247);
            v158 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * mm);
            objc_msgSend(v158, "imageByCroppingToRect:", 0.0, 0.0, v14, v15);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "imageByApplyingCGOrientation:", 2);
            v160 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v158, "imageByCroppingToRect:", x, y, width, rect);
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "imageByApplyingCGOrientation:", 4);
            v162 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v154, "addObject:", v158);
            if (v152)
              objc_msgSend(v154, "addObject:", v160);
            if (v153)
              objc_msgSend(v154, "addObject:", v162);

          }
          v155 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v252, v281, 16);
        }
        while (v155);
      }

      v212 = v154;
    }
    objc_msgSend(v214, "objectForKey:", CFSTR("VNImageBufferAugmentationRandomCrop"));
    v220 = (void *)objc_claimAutoreleasedReturnValue();

    if (v220)
    {
      objc_msgSend(v220, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMaxRange"));
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = v163;
      if (v163)
      {
        objc_msgSend(v163, "floatValue");
        v166 = v165;
      }
      else
      {
        v166 = 0.1;
      }
      objc_msgSend(v220, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionMinRange"));
      v170 = (void *)objc_claimAutoreleasedReturnValue();

      v171 = v170;
      if (v170)
      {
        objc_msgSend(v170, "floatValue");
        v169 = v172;
      }
      else
      {
        v169 = 0.1;
      }
      objc_msgSend(v220, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionNumberOfBuffers"));
      v173 = (void *)objc_claimAutoreleasedReturnValue();

      v174 = v173;
      if (v173)
        v167 = objc_msgSend(v173, "intValue");
      else
        v167 = 10;
      objc_msgSend(v220, "objectForKey:", CFSTR("VNImageBufferAugmentationOptionRandomSeed"));
      v175 = (void *)objc_claimAutoreleasedReturnValue();

      if (v175)
        v176 = objc_msgSend(v175, "intValue");
      else
        v176 = 0;
      srand(v176);

      v168 = fmaxf((float)(v169 - v166) / (float)v167, 0.001);
    }
    else
    {
      v167 = 10;
      v168 = 0.001;
      v166 = 0.1;
      v169 = 0.1;
    }
    texture = 0;
    v177 = objc_msgSend(v212, "count");
    if (v220 || v177 >= 2)
    {
      v250 = 0u;
      v251 = 0u;
      v248 = 0u;
      v249 = 0u;
      v178 = v212;
      v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v248, v280, 16);
      if (v179)
      {
        v180 = *(_QWORD *)v249;
        v181 = (CGFloat *)MEMORY[0x1E0C9D538];
        while (2)
        {
          for (nn = 0; nn != v179; ++nn)
          {
            if (*(_QWORD *)v249 != v180)
              objc_enumerationMutation(v178);
            v183 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * nn);
            if (v220)
            {
              v184 = v166;
              if (v166 <= v169)
              {
                while (1)
                {
                  v187 = -[VNImageBuffer height](self, "height");
                  v188 = -[VNImageBuffer width](self, "width");
                  v189 = 1.0 - v184;
                  v190 = width * v189;
                  v191 = ceilf(v190);
                  v185 = v191;
                  *(float *)&v189 = rect * v189;
                  *(float *)&v189 = ceilf(*(float *)&v189);
                  v186 = *(float *)&v189;
                  v192 = v191 < 1.0;
                  if (*(float *)&v189 < 1.0)
                    v192 = 1;
                  if (a9 && v192)
                  {
                    v201 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("RandomCrop produced an invalid crop for width %f height %f"), *(_QWORD *)&v185, *(_QWORD *)&v186);
                    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, v201);
                    *a9 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_220;
                  }
                  if (v167)
                    break;
LABEL_208:
                  v184 = v168 + v184;
                  if (v184 > v169)
                    goto LABEL_198;
                }
                v193 = (double)v187 - v186;
                v194 = (double)v188 - v185;
                v195 = v167;
                while (1)
                {
                  v196 = random();
                  texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
                  if (!texture)
                    break;
                  v197 = (float)((float)v196 * 4.6566e-10);
                  v198 = v194 * v197;
                  *(float *)&v197 = v193 * v197;
                  if (!-[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)&self->super.isa, v183, &texture, a3, a4, a5, v204, v210, ceilf(v198), ceilf(*(float *)&v197), v185, v186, 0, a9))break;
                  objc_msgSend(v206, "addObject:", texture);
                  CVPixelBufferRelease(texture);
                  texture = 0;
                  if (!--v195)
                    goto LABEL_208;
                }
LABEL_220:

                goto LABEL_221;
              }
              v185 = *(double *)(MEMORY[0x1E0C9D648] + 16);
              v186 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_198:
              x = *v181;
              y = v181[1];
              width = v185;
              rect = v186;
            }
            else
            {
              texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
              if (!texture
                || !-[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)&self->super.isa, v183, &texture, a3, a4, a5, v204, v210, x, y, width, rect, 0, a9))
              {
                goto LABEL_220;
              }
              objc_msgSend(v206, "addObject:", texture);
              CVPixelBufferRelease(texture);
              texture = 0;
            }
          }
          v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v248, v280, 16);
          if (v179)
            continue;
          break;
        }
      }

    }
    texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
    if (texture)
    {
      -[VNImageBuffer _baseCIImage](self);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v200 = -[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)&self->super.isa, v199, &texture, a3, a4, a5, v204, v210, x, y, width, rect, 0, a9);

      if ((v200 & 1) != 0)
      {
        objc_msgSend(v206, "addObject:", texture);
        CVPixelBufferRelease(texture);
        v23 = v206;
LABEL_222:

        goto LABEL_223;
      }
    }
LABEL_221:
    v23 = 0;
    goto LABEL_222;
  }
  if (a9)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("The augmentationOptions do not conatain any of the VNImageBufferAugmentation keys"));
    v23 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
LABEL_223:

  return v23;
}

- (_QWORD)_baseCIImage
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[3];
    if (v2)
    {
      v3 = v2;
LABEL_6:
      v1 = v3;
      return v1;
    }
    if (a1[2])
    {
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVImageBuffer:");
      v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v5 = a1[5];
    if (v5)
    {
      v6 = *(id *)(v5 + 64);
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithContentsOfURL:", v6);
        v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = v1[5];
        if (v7)
          v8 = *(id *)(v7 + 72);
        else
          v8 = 0;

        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

- (uint64_t)_cropCIImage:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(double)a9 options:(double)a10 rotate90CCW:(double)a11 error:(double)a12
{
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  double x;
  double y;
  double width;
  double height;
  BOOL v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  CGColorSpace *v62;
  CVPixelBufferRef v63;
  size_t v64;
  int v65;
  id v67;
  void *v68;
  void *v69;
  id v70;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  CGAffineTransform v75;
  int v76;
  id v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  unsigned __int8 v81;
  CGRect v82;
  CGRect v83;

  v24 = a2;
  v25 = a8;
  if (a1
    && +[VNValidationUtilities validateNonNilOptionsDictionary:selector:error:](VNValidationUtilities, "validateNonNilOptionsDictionary:selector:error:", v25, sel__cropCIImage_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error_, a14))
  {
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", a3 != 0, CFSTR("Internal error: missing target buffer for crop operations"));
    v26 = objc_msgSend(a1, "orientation");
    memset(&v80, 0, sizeof(v80));
    if (v24)
      objc_msgSend(v24, "imageTransformForCGOrientation:", v26);
    else
      memset(&v79, 0, sizeof(v79));
    CGAffineTransformInvert(&v80, &v79);
    v78 = v80;
    v82.origin.x = (double)(int)a9;
    v82.origin.y = (double)(int)a10;
    v82.size.width = (double)(int)a11;
    v82.size.height = (double)(int)a12;
    v83 = CGRectApplyAffineTransform(v82, &v78);
    x = v83.origin.x;
    y = v83.origin.y;
    width = v83.size.width;
    height = v83.size.height;
    v77 = 0;
    v32 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v77, objc_opt_class(), CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight"), v25, a14);
    v33 = v77;
    if (v32)
    {
      v70 = v33;
      if (v33)
        v34 = objc_msgSend(v33, "integerValue");
      else
        v34 = 1;
      v76 = -1;
      if ((VNCalculateFeatureCropOrientationFromSuperpositionOfFeatureWithImageOrientations(v26, v34, &v76, a13, a14) & 1) != 0)
      {
        v35 = a1[7];
        objc_msgSend(a1, "session");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "vnciContextManager");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v68 = 0;
        }
        else
        {
          -[VNCIContextManager waitAndGetAvailableContextFromOptions:error:](v69, v25, a14);
          v37 = objc_claimAutoreleasedReturnValue();
          v68 = (void *)v37;
          if (v37)
            v38 = *(void **)(v37 + 8);
          else
            v38 = 0;
          v35 = v38;
        }
        v39 = v24;
        if (a7)
        {
          v67 = v35;
          objc_msgSend(MEMORY[0x1E0C9DDC8], "clearImage");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "imageByCompositingOverImage:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "imageByCroppingToRect:", x, y, width, height);
          v42 = objc_claimAutoreleasedReturnValue();

          v39 = (id)v42;
          v35 = v67;
        }
        if (v76 <= 4)
          v43 = a4;
        else
          v43 = a5;
        if (v76 <= 4)
          v44 = a5;
        else
          v44 = a4;
        v45 = (double)v44;
        v46 = (double)v43;
        if (width != (double)v43 || height != v45)
        {
          v47 = v46 / width;
          v48 = v45 / height;
          if (a7)
          {
            v49 = *MEMORY[0x1E0C9D538];
            v50 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          }
          else
          {
            v49 = round(x * v47);
            v50 = round(y * v48);
          }
          if (v49 > 0.0)
            v47 = v49 / x;
          memset(&v75.c, 0, 32);
          if (v50 > 0.0)
            v48 = v50 / y;
          *(_OWORD *)&v75.a = 0uLL;
          CGAffineTransformMakeScale(&v75, v47, v48);
          v74 = v75;
          objc_msgSend(v39, "imageByApplyingTransform:highQualityDownsample:", &v74, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "extent");
          v53 = v52;
          objc_msgSend(v51, "extent");
          CGAffineTransformMakeTranslation(&v73, -v53, -v54);
          objc_msgSend(v51, "imageByApplyingTransform:highQualityDownsample:", &v73, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v55, "imageByCroppingToRect:", v49, v50, v46, v45);
          v39 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v39, "extent");
        v57 = v56;
        objc_msgSend(v39, "extent");
        CGAffineTransformMakeTranslation(&v72, -v57, -v58);
        objc_msgSend(v39, "imageByApplyingTransform:highQualityDownsample:", &v72, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v59, "imageByApplyingOrientation:", v76);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          v61 = v68;
          v62 = VNColorspaceForFormat(a6, 0);
          v63 = *a3;
          v64 = CVPixelBufferGetWidth(*a3);
          objc_msgSend(v35, "render:toCVPixelBuffer:bounds:colorSpace:", v60, v63, v62, 0.0, 0.0, (double)v64, (double)CVPixelBufferGetHeight(*a3));
          CGColorSpaceRelease(v62);
          v65 = 0;
        }
        else
        {
          if (a14)
          {
            +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, CFSTR("Extracting ROI from an image failed"));
            *a14 = (id)objc_claimAutoreleasedReturnValue();
          }
          v81 = 0;
          v65 = 1;
          v61 = v68;
        }

        -[VNCIContextManager releaseContext:]((uint64_t)v69, v61);
        if (!v65)
          v81 = 1;

        v27 = v81;
      }
      else
      {
        v27 = 0;
      }
      v33 = v70;
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (uint64_t)_cropImageSourceManager:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(double)a9 options:(double)a10 rotate90CCW:(double)a11 error:(double)a12
{
  id v25;
  BOOL v26;
  id v27;
  uint64_t v28;
  CGImageRef v29;
  unint64_t v30;
  double v31;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  CGInterpolationQuality v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  CGImageSource *v54;
  void *v55;
  void *v56;
  void *v57;
  CGImageRef ImageAtIndex;
  void *v60;
  size_t Width;
  size_t Height;
  unint64_t v63;
  double v64;
  double v65;
  _OWORD *v66;
  __int128 v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CGFloat v79;
  CGFloat v80;
  double x;
  double y;
  double v83;
  double v84;
  CGImageRef v85;
  double v86;
  double v87;
  __CVBuffer *v88;
  size_t BytesPerRow;
  void *BaseAddress;
  CGColorSpace *v91;
  CGContext *v92;
  size_t v93;
  size_t v94;
  __int128 v95;
  double v96;
  double v97;
  CGImage *v98;
  id v99;
  int v100;
  CGImage *image;
  CGInterpolationQuality quality;
  unint64_t v103;
  unint64_t v104;
  int v105;
  unsigned int options;
  const __CFDictionary *optionsa;
  void *v108;
  int v109;
  void *v110;
  char *v111;
  CGAffineTransform transform;
  CGAffineTransform v113;
  CGAffineTransform v114;
  CGAffineTransform v115;
  CGAffineTransform v116;
  CGAffineTransform v117;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v120;
  CGAffineTransform v121;
  CGAffineTransform v122;
  CGAffineTransform v123;
  int v124;
  id v125;
  char v126;
  CGAffineTransform v127;
  CGAffineTransform v128;
  uint64_t v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v129 = *MEMORY[0x1E0C80C00];
  v111 = a2;
  v25 = a8;
  if (!a1
    || !+[VNValidationUtilities validateNonNilOptionsDictionary:selector:error:](VNValidationUtilities, "validateNonNilOptionsDictionary:selector:error:", v25, sel__cropImageSourceManager_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error_, a14))
  {
    goto LABEL_9;
  }
  if (a3)
  {
    v109 = objc_msgSend((id)a1, "orientation");
    v125 = 0;
    v26 = +[VNValidationUtilities getOptionalObject:ofClass:forKey:inOptions:error:](VNValidationUtilities, "getOptionalObject:ofClass:forKey:inOptions:error:", &v125, objc_opt_class(), CFSTR("VNImageBufferOption_FeatureOrientationRelativeToUpRight"), v25, a14);
    v27 = v125;
    v110 = v27;
    if (!v26
      || (!v27 ? (v28 = 1) : (v28 = objc_msgSend(v27, "integerValue")),
          v124 = -1,
          (VNCalculateFeatureCropOrientationFromSuperpositionOfFeatureWithImageOrientations(v109, v28, &v124, a13, a14) & 1) == 0))
    {
      LOBYTE(v29) = 0;
LABEL_75:

      goto LABEL_76;
    }
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", 1, CFSTR("Internal error: needToUpscale cannot be NULL"));
    if ((int)v28 <= 4)
      v30 = a4;
    else
      v30 = a5;
    v31 = (double)v30;
    if ((int)v28 <= 4)
      v32 = a5;
    else
      v32 = a4;
    if (a13)
      v33 = a12;
    else
      v33 = a11;
    if (a13)
      v34 = a11;
    else
      v34 = a12;
    v35 = v31 / v33;
    if (v35 >= (double)v32 / v34)
      v36 = v35;
    else
      v36 = (double)v32 / v34;
    v105 = a6;
    v103 = a4;
    v104 = a5;
    if (v36 <= 0.125)
    {
      v37 = 8;
    }
    else if (v36 <= 0.25)
    {
      v37 = 4;
    }
    else if (v36 <= 0.5)
    {
      v37 = 2;
    }
    else
    {
      v37 = 1;
    }
    options = v37;
    v29 = (CGImageRef)v25;
    -[CGImage objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("VNImageBufferOption_DownscaleCGInterpolationQuality"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
      v40 = objc_msgSend(v38, "intValue");
    else
      v40 = 4;
    -[CGImage objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("VNImageBufferOption_UpscaleCGInterpolationQuality"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      v42 = objc_msgSend(v41, "intValue");
    else
      v42 = 4;

    if (v36 > 1.0)
      v43 = v42;
    else
      v43 = v40;
    quality = v43;

    -[CGImage objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v44;
    if (v44)
      v45 = objc_msgSend(v44, "BOOLValue");
    else
      v45 = 0;
    -[CGImage objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("VNImageBufferOption_RequiresDepth"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "BOOLValue");

    if (!v47 || (a7 & 1) != 0 || *(_QWORD *)(a1 + 96))
    {
      if ((v47 & a7) == 1)
      {
        if (a14)
        {
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, CFSTR("Unable to load depth when crop is required"));
          LOBYTE(v29) = 0;
          *a14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_74:

          goto LABEL_75;
        }
        goto LABEL_73;
      }
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
      if (v111)
      {
        v48 = objc_msgSend(v111, "_cgImageSourceAtAddress:forSubSampleFactor:protectedWithUnfairLock:operatingInLowPriority:error:", v111 + 32, 1, v111 + 12, 0, 0);
        if (v48)
        {
          +[VNDepthRepresentation depthRepresentationForImageSource:orientation:](VNDepthRepresentation, "depthRepresentationForImageSource:orientation:", v48, objc_msgSend(v111, "exifOrientation"));
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = *(void **)(a1 + 96);
          *(_QWORD *)(a1 + 96) = v49;

        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    }
    if (v105 > 1111970368)
    {
      if (v105 != 1111970369 && v105 != 1278226488)
      {
        v51 = 1380401729;
LABEL_64:
        if (v105 != v51)
        {
          -[VNImageSourceManager ciImageWithSubSampleFactor:useLowPriority:error:]((id *)v111, options, v45, a14);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v60)
            LOBYTE(v29) = -[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)a1, v60, a3, v103, v104, v105, a7, v29, (double)(int)(a9 * (1.0 / (double)options)), (double)(int)(a10 * (1.0 / (double)options)), (double)(int)(a11 * (1.0 / (double)options)), (double)(int)(a12 * (1.0 / (double)options)), a13, a14);
          else
            LOBYTE(v29) = 0;

          goto LABEL_74;
        }
      }
    }
    else if (v105 != 32 && v105 != 40)
    {
      v51 = 1094862674;
      goto LABEL_64;
    }
    if (!v111)
      goto LABEL_73;
    v52 = options - 1;
    if (((0x8Bu >> v52) & 1) == 0)
    {
      if (a14)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", options);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v53, CFSTR("subSampleFactor"));
        *a14 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_73;
    }
    v54 = (CGImageSource *)objc_msgSend(v111, "_cgImageSourceAtAddress:forSubSampleFactor:protectedWithUnfairLock:operatingInLowPriority:error:", &v111[qword_1A15FB068[v52]], dword_1A15FB0E8[v52], &v111[qword_1A15FB0A8[v52]], 0, a14);
    if (!v54)
    {
LABEL_73:
      LOBYTE(v29) = 0;
      goto LABEL_74;
    }
    v55 = (void *)*MEMORY[0x1E0CBD240];
    *(_QWORD *)&v128.a = MEMORY[0x1E0C9AAA0];
    v56 = (void *)*MEMORY[0x1E0CBD290];
    *(_QWORD *)&v127.a = v55;
    *(_QWORD *)&v127.b = v56;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", options);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v128.b = v57;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 2);
    optionsa = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    ImageAtIndex = CGImageSourceCreateImageAtIndex(v54, 0, optionsa);
    v29 = ImageAtIndex;
    if (a14 && !ImageAtIndex)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot obtain a CGImageRef from the image source"));
      *a14 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_73;
    }

    if (!v29)
      goto LABEL_74;
    image = v29;
    Width = CGImageGetWidth(v29);
    Height = CGImageGetHeight(v29);
    if (v109 < 5)
      v63 = objc_msgSend((id)a1, "width");
    else
      v63 = objc_msgSend((id)a1, "height");
    v64 = (double)Width;
    v65 = 1.0 / round((double)v63 / (double)Width);
    v66 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    v67 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v128.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v128.c = v67;
    *(_OWORD *)&v128.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v127.a = *(_OWORD *)&v128.a;
    *(_OWORD *)&v127.c = v67;
    *(_OWORD *)&v127.tx = *(_OWORD *)&v128.tx;
    if (a7)
    {
      v68 = a11 * v65;
      v69 = (double)(int)(a9 * v65);
      v70 = (double)(int)(a10 * v65);
      v71 = (double)(int)v68;
      v72 = (double)(int)(a12 * v65);
      memset(&v123, 0, sizeof(v123));
      switch(v109)
      {
        case 2:
          v122.a = -1.0;
          v122.b = 0.0;
          v122.c = 0.0;
          v122.d = 1.0;
          v122.tx = (double)Width;
          goto LABEL_101;
        case 3:
          v122.a = -1.0;
          v122.b = 0.0;
          v122.c = 0.0;
          v122.d = -1.0;
          v122.tx = (double)Width;
          goto LABEL_97;
        case 4:
          v122.c = 0.0;
          v122.a = 1.0;
          v122.b = 0.0;
          *(_OWORD *)&v122.d = xmmword_1A15FB480;
LABEL_97:
          v122.ty = (double)Height;
          goto LABEL_102;
        case 5:
          *(_OWORD *)&v122.a = xmmword_1A15FB470;
          *(_OWORD *)&v122.c = xmmword_1A15FB480;
          v122.tx = (double)Height;
          goto LABEL_94;
        case 6:
          *(_OWORD *)&v122.a = xmmword_1A15FB470;
          v122.tx = 0.0;
          v122.c = 1.0;
          v122.d = 0.0;
LABEL_94:
          v122.ty = (double)Width;
          goto LABEL_102;
        case 7:
          *(_OWORD *)&v122.a = xmmword_1A15FB460;
          v122.c = 1.0;
          v122.d = 0.0;
          goto LABEL_99;
        case 8:
          *(_OWORD *)&v122.a = xmmword_1A15FB460;
          *(_OWORD *)&v122.c = xmmword_1A15FB480;
          v122.tx = (double)Height;
LABEL_101:
          v122.ty = 0.0;
          goto LABEL_102;
        default:
          v122.a = 1.0;
          v122.b = 0.0;
          v122.c = 0.0;
          v122.d = 1.0;
LABEL_99:
          v122.ty = 0.0;
          v122.tx = 0.0;
LABEL_102:
          CGAffineTransformInvert(&v123, &v122);
          v121 = v123;
          v132.origin.x = v69;
          v132.origin.y = v70;
          v132.size.width = v71;
          v132.size.height = v72;
          v133 = CGRectApplyAffineTransform(v132, &v121);
          x = v133.origin.x;
          y = v133.origin.y;
          v83 = v133.size.width;
          v84 = v133.size.height;
          v133.origin.y = (double)Height - v133.origin.y - v133.size.height;
          v85 = CGImageCreateWithImageInRect(image, v133);
          if (v85)
          {
            -[VNImageBuffer _calculateTranslationTransformForOrientedCropWithOrientation:unorientedSubsampledFullImageRect:unorientedSubsampledOriginalCrop:](&v127, v124, 0.0, 0.0, v64, (double)Height, x, y, v83, v84);
            CGImageRelease(image);
            if (v124 <= 4)
              v86 = v83;
            else
              v86 = v84;
            if (v124 <= 4)
              v87 = v84;
            else
              v87 = v83;
            CGAffineTransformMakeScale(&v128, (double)v103 / v86, (double)v104 / v87);
            image = v85;
            goto LABEL_110;
          }
          if (!a14)
            goto LABEL_118;
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, CFSTR("Unable to crop a region of interest from a source buffer"));
          v99 = (id)objc_claimAutoreleasedReturnValue();
          break;
      }
    }
    else
    {
      objc_msgSend((id)a1, "fullImageBufferRect");
      v76 = v75 * v65;
      v78 = v77 * v65;
      if (a13)
      {
        v79 = v74 * v65;
        v80 = v73 * v65;
        CGAffineTransformMakeRotation(&v120, 1.57079633);
        v130.origin.x = v80;
        v130.origin.y = v79;
        v130.size.width = v76;
        v130.size.height = v78;
        v131 = CGRectApplyAffineTransform(v130, &v120);
        v76 = v131.size.width;
        v78 = v131.size.height;
      }
      CGAffineTransformMakeScale(&v123, (double)v103 / v76, (double)v104 / v78);
      v128 = v123;
LABEL_110:
      v88 = *a3;
      LODWORD(v123.a) = 0;
      CVPixelBufferLockBaseAddress(v88, 0);
      BytesPerRow = CVPixelBufferGetBytesPerRow(v88);
      BaseAddress = CVPixelBufferGetBaseAddress(v88);
      v91 = VNColorspaceForFormat(v105, (int *)&v123);
      v92 = CGBitmapContextCreate(BaseAddress, v103, v104, 8uLL, BytesPerRow, v91, LODWORD(v123.a));
      CVPixelBufferUnlockBaseAddress(v88, 0);
      CGColorSpaceRelease(v91);
      if (v92)
      {
        CGContextSetInterpolationQuality(v92, quality);
        CGContextSetShouldAntialias(v92, 0);
        CGContextSetBlendMode(v92, kCGBlendModeCopy);
        v93 = CGImageGetWidth(image);
        v94 = CGImageGetHeight(image);
        v95 = v66[1];
        *(_OWORD *)&v123.a = *v66;
        *(_OWORD *)&v123.c = v95;
        *(_OWORD *)&v123.tx = v66[2];
        *(_OWORD *)&t1.a = *(_OWORD *)&v123.a;
        *(_OWORD *)&t1.c = v95;
        *(_OWORD *)&t1.tx = *(_OWORD *)&v123.tx;
        v96 = (double)v93;
        v97 = (double)v94;
        v98 = image;
        switch(v124)
        {
          case 2:
            t2.a = -1.0;
            t2.b = 0.0;
            t2.c = 0.0;
            t2.d = 1.0;
            t2.tx = v96;
            goto LABEL_126;
          case 3:
            t2.a = -1.0;
            t2.b = 0.0;
            t2.c = 0.0;
            t2.d = -1.0;
            t2.tx = v96;
            t2.ty = (double)v94;
            break;
          case 4:
            t2.b = 0.0;
            t2.c = 0.0;
            t2.a = 1.0;
            *(_OWORD *)&t2.d = xmmword_1A15FB480;
            t2.ty = (double)v94;
            break;
          case 5:
            *(_OWORD *)&t2.a = xmmword_1A15FB470;
            *(_OWORD *)&t2.c = xmmword_1A15FB480;
            t2.tx = (double)v94;
            t2.ty = v96;
            break;
          case 6:
            *(_OWORD *)&t2.a = xmmword_1A15FB470;
            t2.d = 0.0;
            t2.tx = 0.0;
            t2.c = 1.0;
            t2.ty = v96;
            break;
          case 7:
            *(_OWORD *)&t2.a = xmmword_1A15FB460;
            t2.c = 1.0;
            memset(&t2.d, 0, 24);
            break;
          case 8:
            *(_OWORD *)&t2.a = xmmword_1A15FB460;
            *(_OWORD *)&t2.c = xmmword_1A15FB480;
            t2.tx = (double)v94;
LABEL_126:
            t2.ty = 0.0;
            break;
          default:
            t2.a = 1.0;
            t2.b = 0.0;
            t2.c = 0.0;
            t2.d = 1.0;
            t2.tx = 0.0;
            t2.ty = 0.0;
            v98 = image;
            break;
        }
        CGAffineTransformConcat(&v123, &t1, &t2);
        v116 = v123;
        v115 = v127;
        CGAffineTransformConcat(&v117, &v116, &v115);
        v123 = v117;
        v114 = v117;
        v113 = v128;
        CGAffineTransformConcat(&v117, &v114, &v113);
        v123 = v117;
        transform = v117;
        CGContextConcatCTM(v92, &transform);
        v134.origin.x = 0.0;
        v134.origin.y = 0.0;
        v134.size.width = v96;
        v134.size.height = v97;
        CGContextDrawImage(v92, v134, v98);
        CGContextRelease(v92);
        v100 = 0;
        goto LABEL_128;
      }
      if (!a14)
      {
LABEL_118:
        v126 = 0;
        v100 = 1;
LABEL_128:
        CGImageRelease(image);
        LODWORD(v29) = ((v100 == 0) | v126);
        goto LABEL_74;
      }
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, CFSTR("Unable to create CGImage for scaling"));
      v99 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a14 = v99;
    goto LABEL_118;
  }
  if (a14)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, CFSTR("Missing target buffer for crop operations"));
    LOBYTE(v29) = 0;
    *a14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    LOBYTE(v29) = 0;
  }
LABEL_76:

  return v29 & 1;
}

- (CGAffineTransform)_calculateTranslationTransformForOrientedCropWithOrientation:(double)a3 unorientedSubsampledFullImageRect:(double)a4 unorientedSubsampledOriginalCrop:(double)a5
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  __int128 v17;
  CGAffineTransform *v18;
  CGFloat v19;

  if (a7 >= 0.0)
    v10 = 0.0;
  else
    v10 = -a7;
  if (a8 >= 0.0)
    v11 = 0.0;
  else
    v11 = -a8;
  v12 = a5 - a9;
  if (a2 > 4)
    v12 = a6;
  v13 = -v12;
  v14 = a6 - a10;
  if (a2 <= 4)
    a5 = v14;
  if (v12 >= 0.0)
    v13 = 0.0;
  if (a5 >= 0.0)
    v15 = 0.0;
  else
    v15 = -a5;
  v16 = MEMORY[0x1E0C9BAA8];
  v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v16 + 32);
  switch(a2)
  {
    case 1:
      v18 = retstr;
      v19 = v10;
      goto LABEL_22;
    case 2:
      v18 = retstr;
      v19 = v13;
LABEL_22:
      v10 = v11;
      goto LABEL_18;
    case 3:
      v18 = retstr;
      v19 = v13;
      goto LABEL_25;
    case 4:
      v18 = retstr;
      v19 = v10;
LABEL_25:
      v10 = v15;
      goto LABEL_18;
    case 5:
    case 8:
      v18 = retstr;
      v19 = v15;
      goto LABEL_18;
    case 6:
      return CGAffineTransformMakeTranslation(retstr, v11, v13);
    case 7:
      v18 = retstr;
      v19 = v11;
LABEL_18:
      retstr = CGAffineTransformMakeTranslation(v18, v19, v10);
      break;
    default:
      return retstr;
  }
  return retstr;
}

BOOL __113__VNImageBuffer__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  CGFloat v5;
  CGFloat v6;
  uint64_t v7;
  OpaqueVTPixelRotationSession *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  CFIndex v12;
  uint64_t v13;
  CFIndex v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGPoint v23;
  CGFloat width;
  CGFloat height;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  if (*(_BYTE *)(a1 + 124))
  {
    v26 = CGRectIntegral(*(CGRect *)(a1 + 40));
    v23.x = v26.origin.x;
    v23.y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;
    VNAlignRectToSubsampledCVPixelBufferConstraint((float64x2_t *)&v23, *(CVPixelBufferRef *)(a1 + 72));
    memset(&v22, 0, sizeof(v22));
    v5 = *(double *)(a1 + 80);
    v6 = *(double *)(a1 + 88);
    switch(*(_DWORD *)(a1 + 104))
    {
      case 2:
        v21.a = -1.0;
        v21.b = 0.0;
        v21.c = 0.0;
        v21.d = 1.0;
        v21.tx = v5;
        goto LABEL_15;
      case 3:
        v21.a = -1.0;
        v21.b = 0.0;
        v21.c = 0.0;
        v21.d = -1.0;
        v21.tx = v5;
        v21.ty = v6;
        goto LABEL_16;
      case 4:
        v21.b = 0.0;
        v21.c = 0.0;
        v21.a = 1.0;
        *(_OWORD *)&v21.d = xmmword_1A15FB480;
        v21.ty = v6;
        goto LABEL_16;
      case 5:
        *(_OWORD *)&v21.a = xmmword_1A15FB470;
        *(_OWORD *)&v21.c = xmmword_1A15FB480;
        v21.tx = v6;
        v21.ty = v5;
        goto LABEL_16;
      case 6:
        *(_OWORD *)&v21.a = xmmword_1A15FB470;
        v21.d = 0.0;
        v21.tx = 0.0;
        v21.c = 1.0;
        v21.ty = v5;
        goto LABEL_16;
      case 7:
        *(_OWORD *)&v21.a = xmmword_1A15FB460;
        v21.c = 1.0;
        v21.d = 0.0;
        goto LABEL_13;
      case 8:
        *(_OWORD *)&v21.a = xmmword_1A15FB460;
        *(_OWORD *)&v21.c = xmmword_1A15FB480;
        v21.tx = v6;
LABEL_15:
        v21.ty = 0.0;
        goto LABEL_16;
      default:
        v21.a = 1.0;
        v21.b = 0.0;
        v21.c = 0.0;
        v21.d = 1.0;
LABEL_13:
        v21.tx = 0.0;
        v21.ty = 0.0;
LABEL_16:
        CGAffineTransformInvert(&v22, &v21);
        v27.origin = v23;
        v27.size.width = width;
        v27.size.height = height;
        v20 = v22;
        v28 = CGRectApplyAffineTransform(v27, &v20);
        v29.origin.x = 0.0;
        v29.origin.y = 0.0;
        v29.size.width = v5;
        v29.size.height = v6;
        CGRectIntersection(v28, v29);
        CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 96));
        CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 96));
        v9 = VTPixelRotationSessionRotateSubImage();
        break;
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(OpaqueVTPixelRotationSession **)(v7 + 32);
    else
      v8 = 0;
    v9 = VTPixelRotationSessionRotateImage(v8, *(CVPixelBufferRef *)(a1 + 96), *(CVPixelBufferRef *)(a1 + 72));
  }
  v10 = v9;
  if (a3 && (_DWORD)v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = CFGetRetainCount(*(CFTypeRef *)(a1 + 96));
    v13 = *(unsigned int *)(a1 + 108);
    v14 = CFGetRetainCount(*(CFTypeRef *)(a1 + 72));
    v15 = *(unsigned int *)(a1 + 112);
    v16 = *(unsigned int *)(a1 + 116);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 124));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("VNImageBuffer - Failed to transfer inputBufferForRotation (retain count = %ld, type = %u) to vtSessionDestBuffer (retain count = %ld, type = %u). Orientation %d. Crop %@. Rotation %d. Error %d"), v12, v13, v14, v15, v16, v17, *(unsigned int *)(a1 + 120), v10);

    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v18);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (_DWORD)v10 == 0;
}

BOOL __113__VNImageBuffer__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error___block_invoke_2(uint64_t a1, CVPixelBufferRef pixelBuffer, _QWORD *a3)
{
  const __CFAllocator *v6;
  size_t v7;
  size_t v8;
  OSType v9;
  void *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  uint64_t v12;
  int v13;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_DWORD *)(a1 + 56);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  if (VNIOSurfaceBackedPixelBufferAttributes::onceToken != -1)
    dispatch_once(&VNIOSurfaceBackedPixelBufferAttributes::onceToken, &__block_literal_global_26832);
  v12 = CVPixelBufferCreateWithBytes(v6, v7, v8, v9, BaseAddressOfPlane, BytesPerRowOfPlane, (CVPixelBufferReleaseBytesCallback)CVPixelBufferReleaseReferencingPixelBufferCallback, pixelBuffer, (CFDictionaryRef)VNIOSurfaceBackedPixelBufferAttributes::pixelBufferAttributes, *(CVPixelBufferRef **)(a1 + 48));
  v13 = v12;
  if (a3 && (_DWORD)v12)
  {
    +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v12, CFSTR("unable to create the Y plane wrapper buffer"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13 == 0;
}

uint64_t __197__VNImageBuffer_cropAndScaleBufferWithWidth_height_cropRect_format_imageCropAndScaleOption_options_error_calculatedNormalizedOriginOffset_calculatedScaleX_calculatedScaleY_pixelBufferRepsCacheKey___block_invoke(uint64_t a1, CVPixelBufferRef pixelBuffer, _QWORD *a3)
{
  size_t BytesPerRow;
  void *BaseAddress;
  CGColorSpace *v8;
  CGContext *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  CGFloat Width;
  CGFloat v14;
  CGFloat v15;
  CGImageRef image;
  uint32_t bitmapInfo;
  CGRect v19;

  bitmapInfo = 0;
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
  v8 = VNColorspaceForFormat(*(_DWORD *)(a1 + 64), (int *)&bitmapInfo);
  v9 = CGBitmapContextCreate(BaseAddress, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 8uLL, BytesPerRow, v8, bitmapInfo);
  if (*(_BYTE *)(a1 + 68))
    bzero(BaseAddress, *(_QWORD *)(a1 + 48) * BytesPerRow);
  image = 0;
  v10 = VTCreateCGImageFromCVPixelBuffer(*(CVPixelBufferRef *)(a1 + 56), 0, &image);
  if ((_DWORD)v10)
    v11 = 1;
  else
    v11 = image == 0;
  v12 = !v11;
  if (v11)
  {
    if (a3)
    {
      +[VNError errorForOSStatus:localizedDescription:](VNError, "errorForOSStatus:localizedDescription:", v10, CFSTR("Failed to create CGImage from CVPixelBuffer"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    Width = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 56));
    v19.size.height = (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 56));
    v14 = ((double)*(unint64_t *)(a1 + 40) - Width) * 0.5;
    v15 = ((double)*(unint64_t *)(a1 + 48) - v19.size.height) * 0.5;
    v19.origin.x = v14;
    v19.origin.y = v15;
    v19.size.width = Width;
    CGContextDrawImage(v9, v19, image);
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = v14 / (double)*(unint64_t *)(a1 + 40);
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = v15 / (double)*(unint64_t *)(a1 + 48);
    CGImageRelease(image);
    image = 0;
  }
  CGColorSpaceRelease(v8);
  CGContextRelease(v9);
  return v12;
}

+ (const)mapOrientationToRotationDegrees
{
  if (+[VNImageBuffer mapOrientationToRotationDegrees]::onceToken != -1)
    dispatch_once(&+[VNImageBuffer mapOrientationToRotationDegrees]::onceToken, &__block_literal_global_4457);
  return (const void *)+[VNImageBuffer mapOrientationToRotationDegrees]::mapOrientationToRotationDegrees;
}

+ (CGRect)computeCenterCropRectFromCropRect:(CGRect)result inImageSize:(CGSize)a4 calculatedScaleX:(double *)a5 calculatedScaleY:(double *)a6
{
  CGFloat v6;
  CGFloat v7;
  BOOL v8;
  double v9;
  double v10;

  if (result.size.width == 0.0 || result.size.height == 0.0)
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D628];
  }
  else
  {
    v6 = a4.width / result.size.width;
    v7 = a4.height / result.size.height;
    v8 = a4.width / result.size.width < a4.height / result.size.height;
    v9 = a4.height / (a4.width / result.size.width);
    v10 = a4.width / v7;
    if (v8)
      result.origin.x = result.origin.x + (result.size.width - v10) * 0.5;
    if (v8)
      result.size.width = v10;
    else
      result.origin.y = result.origin.y + (result.size.height - v9) * 0.5;
    if (!v8)
      result.size.height = v9;
    if (a5)
      *a5 = v6;
    if (a6)
      *a6 = v7;
  }
  return result;
}

_QWORD *__48__VNImageBuffer_mapOrientationToRotationDegrees__block_invoke()
{
  _QWORD *result;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  int *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  BOOL v10;
  int v11;
  uint64_t **v12;
  uint64_t **v13;
  uint64_t *v14;
  int v15;

  result = (_QWORD *)operator new();
  v1 = (uint64_t)result;
  v2 = 0;
  v3 = 0;
  result[1] = 0;
  v4 = result + 1;
  result[2] = 0;
  *result = result + 1;
  v5 = result + 1;
  while (1)
  {
    v6 = (int *)((char *)&unk_1A15E2A50 + 8 * v3);
    v7 = v4;
    if (v5 == v4)
      goto LABEL_8;
    v8 = v2;
    v9 = v4;
    if (v2)
    {
      do
      {
        v7 = v8;
        v8 = (uint64_t *)v8[1];
      }
      while (v8);
    }
    else
    {
      do
      {
        v7 = (uint64_t *)v9[2];
        v10 = *v7 == (_QWORD)v9;
        v9 = v7;
      }
      while (v10);
    }
    v11 = *v6;
    if (*((_DWORD *)v7 + 7) < *v6)
    {
LABEL_8:
      v12 = (uint64_t **)(v2 ? v7 : v4);
      v13 = (uint64_t **)(v2 ? v7 + 1 : v4);
    }
    else
    {
      v12 = (uint64_t **)v4;
      v13 = (uint64_t **)v4;
      if (v2)
      {
        v13 = (uint64_t **)v4;
        while (1)
        {
          while (1)
          {
            v12 = (uint64_t **)v2;
            v15 = *((_DWORD *)v2 + 7);
            if (v11 >= v15)
              break;
            v2 = *v12;
            v13 = v12;
            if (!*v12)
              goto LABEL_15;
          }
          if (v15 >= v11)
            break;
          v13 = v12 + 1;
          v2 = v12[1];
          if (!v2)
            goto LABEL_15;
        }
      }
    }
    if (!*v13)
    {
LABEL_15:
      v14 = (uint64_t *)operator new(0x28uLL);
      *(uint64_t *)((char *)v14 + 28) = *(_QWORD *)v6;
      result = std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::__insert_node_at((uint64_t **)v1, (uint64_t)v12, v13, v14);
    }
    if (++v3 == 8)
      break;
    v5 = *(uint64_t **)v1;
    v2 = *(uint64_t **)(v1 + 8);
  }
  +[VNImageBuffer mapOrientationToRotationDegrees]::mapOrientationToRotationDegrees = v1;
  return result;
}

@end
