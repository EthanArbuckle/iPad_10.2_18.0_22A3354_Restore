@implementation RenderFrame

uint64_t __basicVideoCompositor_RenderFrame_block_invoke(uint64_t a1)
{
  CFAllocatorRef v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CVBuffer *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  size_t Width;
  size_t Height;
  CFTypeRef v24;
  CGColorSpace *v25;
  const void *v26;
  CFTypeRef v27;
  double v28;
  unint64_t v29;
  double v30;
  OSType v32;
  int v33;
  CFDictionaryRef DictionaryRepresentation;
  int v35;
  int v37;
  BOOL v39;
  BOOL v41;
  const void *v42;
  const void *v43;
  CVPixelBufferRef v44;
  unint64_t v45;
  unint64_t v46;
  __CVBuffer *v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  unint64_t v53;
  __CVPixelBufferPool **v54;
  unint64_t v55;
  int v56;
  int v57;
  unsigned int v58;
  __CVPixelBufferPool *v59;
  int PixelBufferPoolForPreProcessing;
  CFTypeRef *v61;
  CGFloat v62;
  __CVPixelBufferPool **v63;
  unsigned int v64;
  __CVPixelBufferPool *v65;
  int v66;
  VTPixelTransferSessionRef *v67;
  int v68;
  const void *v69;
  const void *v70;
  uint64_t result;
  uint64_t v72;
  _QWORD *v73;
  const void *v74;
  unint64_t v75;
  unint64_t v76;
  double v77;
  double v78;
  double v79;
  const __CFString *key;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CGRect *v84;
  CFTypeRef cf;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  OSType PixelFormatType;
  int v92;
  uint64_t v93;
  int v94;
  const __CFAllocator *allocator;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferRef v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 336) = FigGetUpTimeNanoseconds();
  v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_DWORD *)(v3 + 168);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(v5 + 16);
  v7 = *(_QWORD *)(v3 + 184);
  v8 = *(char **)(v3 + 192);
  v10 = *(_QWORD *)(v3 + 200);
  v9 = *(_QWORD *)(v3 + 208);
  v12 = *(_QWORD *)(v3 + 232);
  v11 = *(_QWORD *)(v3 + 240);
  v14 = *(_QWORD *)(v3 + 216);
  v13 = *(_QWORD *)(v3 + 224);
  v15 = *(__CVBuffer **)v5;
  v16 = *(_DWORD *)(v5 + 176);
  v94 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v17 = *(double *)(v5 + 296);
  v18 = *(double *)(v5 + 304);
  v19 = *(double *)(v5 + 312);
  v20 = *(double *)(v5 + 320);
  v21 = *(_QWORD *)(v5 + 160);
  v93 = *(_QWORD *)(v5 + 168);
  pixelBufferOut = 0;
  v97 = 0;
  allocator = v2;
  if (!v2)
  {
    v35 = FigSignalErrorAt();
    v24 = 0;
    DictionaryRepresentation = 0;
    v8 = 0;
    goto LABEL_142;
  }
  if (!v7)
    goto LABEL_49;
  if (!v8)
  {
    v35 = FigSignalErrorAt();
    goto LABEL_50;
  }
  if (!v12 || !v11 || !v14 || !v13 || !v10 || !v9)
  {
LABEL_49:
    v35 = FigSignalErrorAt();
    v8 = 0;
LABEL_50:
    DictionaryRepresentation = 0;
    v24 = 0;
    goto LABEL_140;
  }
  if (v16 > 179)
  {
    if (v16 != 180 && v16 != 270)
      goto LABEL_49;
  }
  else if (v16 && v16 != 90)
  {
    goto LABEL_49;
  }
  if (!v15)
  {
    v8 = 0;
    DictionaryRepresentation = 0;
    v24 = 0;
    v35 = 0;
    *(_QWORD *)v5 = 0;
    goto LABEL_140;
  }
  v81 = v9;
  v82 = v10;
  v83 = v7;
  v89 = v11;
  v90 = v12;
  v92 = v16;
  v88 = v14;
  v84 = (CGRect *)(v13 + 32 * v6);
  Width = CVPixelBufferGetWidth(v15);
  Height = CVPixelBufferGetHeight(v15);
  PixelFormatType = CVPixelBufferGetPixelFormatType(v15);
  key = (const __CFString *)*MEMORY[0x1E0CA8EE8];
  v24 = CVBufferCopyAttachment(v15, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0);
  v86 = v6;
  if (!v24)
  {
    v25 = (CGColorSpace *)CVBufferCopyAttachment(v15, (CFStringRef)*MEMORY[0x1E0CA8CD8], 0);
    CGColorSpaceGetName(v25);
    v26 = (const void *)VTGetDefaultYCbCrMatrixWithColorSpaceNameAndDimensionHints();
    if (v26)
    {
      v27 = CFRetain(v26);
      if (!v25)
      {
LABEL_21:
        v24 = v27;
        v6 = v86;
        goto LABEL_22;
      }
    }
    else
    {
      v27 = 0;
      if (!v25)
        goto LABEL_21;
    }
    CFRelease(v25);
    goto LABEL_21;
  }
LABEL_22:
  if (v94 == 1)
  {
    v28 = (double)v21;
    v29 = v93;
    v30 = (double)v93;
    if (v19 != (double)v21 || v20 != v30)
    {
      v32 = PixelFormatType;
      v33 = v92;
LABEL_62:
      v87 = v32;
      goto LABEL_63;
    }
    v101.size.width = (double)Width;
    v101.size.height = (double)Height;
    v101.origin.x = 0.0;
    v101.origin.y = 0.0;
    v98.origin.x = v17;
    v98.origin.y = v18;
    v98.size.width = v19;
    v98.size.height = v20;
    v41 = CGRectContainsRect(v98, v101);
    v33 = v92;
    if (v92)
    {
      v32 = PixelFormatType;
      goto LABEL_62;
    }
    v87 = PixelFormatType;
    if (v41)
    {
LABEL_53:
      v42 = *(const void **)(v89 + 8 * v6);
      if (v42)
      {
        CFRelease(v42);
        *(_QWORD *)(v89 + 8 * v6) = 0;
      }
      v43 = *(const void **)(v90 + 8 * v6);
      if (v43)
      {
        CFRelease(v43);
        v8 = 0;
        DictionaryRepresentation = 0;
        *(_QWORD *)(v90 + 8 * v6) = 0;
      }
      else
      {
        v8 = 0;
        DictionaryRepresentation = 0;
      }
      v35 = -16210;
      v44 = v15;
      goto LABEL_139;
    }
  }
  else
  {
    v33 = v92;
    if (PixelFormatType == 875704422 && v4 == 875704438)
      v37 = 875704438;
    else
      v37 = PixelFormatType;
    v28 = (double)v21;
    v29 = v93;
    v30 = (double)v93;
    v39 = v19 == (double)v21 && v20 == v30 && v92 == 0;
    v87 = v37;
    if (v39 && v37 == PixelFormatType)
    {
      if (((CVPixelBufferGetPixelFormatType(v15) - 875704422) & 0xFFFFFFEF) != 0)
        goto LABEL_53;
      v87 = PixelFormatType;
      if (FigCFEqual())
        goto LABEL_53;
    }
  }
LABEL_63:
  if (*(__CVBuffer **)(v90 + 8 * v6) == v15
    && CVPixelBufferGetWidth(*(CVPixelBufferRef *)(v89 + 8 * v6)) == v21
    && CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v89 + 8 * v6)) == v29
    && CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(v89 + 8 * v6)) == v87)
  {
    v102.origin.x = v17;
    v102.origin.y = v18;
    v102.size.width = v19;
    v102.size.height = v20;
    if (CGRectEqualToRect(*v84, v102) && *(_DWORD *)(v88 + 4 * v6) == v33)
    {
      v44 = *(CVPixelBufferRef *)(v89 + 8 * v6);
      if (v44)
      {
        v8 = 0;
        DictionaryRepresentation = 0;
        v35 = 0;
LABEL_139:
        *(_DWORD *)(v88 + 4 * v6) = v33;
        v84->origin.x = v17;
        v84->origin.y = v18;
        v84->size.width = v19;
        v84->size.height = v20;
        *(_QWORD *)v5 = v44;
        goto LABEL_140;
      }
    }
  }
  cf = v24;
  v78 = v18;
  v79 = v17;
  v77 = v19;
  if (v33)
  {
    v45 = (unint64_t)v20;
    if (v33 == 270 || v33 == 90)
    {
      v46 = (unint64_t)v19;
    }
    else
    {
      v46 = (unint64_t)v20;
      v45 = (unint64_t)v19;
    }
    if (v21 <= 4 * v45)
    {
      v53 = v21;
      if (v45 > 4 * v21)
        v53 = (v45 + 3) >> 2;
    }
    else
    {
      v53 = 4 * v45;
    }
    v54 = (__CVPixelBufferPool **)&v8[8 * v6];
    if (v29 <= 4 * v46)
    {
      v55 = v29;
      if (v46 > 4 * v29)
        v55 = (v46 + 3) >> 2;
    }
    else
    {
      v55 = 4 * v46;
    }
    if (v94 != 1 && ((CVPixelBufferGetPixelFormatType(v15) - 875704422) & 0xFFFFFFEF) == 0)
    {
      v56 = FigCFEqual();
      v57 = PixelFormatType;
      if (!v56)
        v57 = 1111970369;
      PixelFormatType = v57;
    }
    v58 = bvc_isPixelBufferPoolCompatibleWithDimensionsAndPixelFormat(*v54, v53, v55, PixelFormatType);
    v59 = *v54;
    if (v58)
    {
      if (v59)
        goto LABEL_96;
    }
    else if (v59)
    {
      CFRelease(v59);
      *v54 = 0;
    }
    PixelBufferPoolForPreProcessing = bvc_createPixelBufferPoolForPreProcessing(v53, v55, PixelFormatType, v54);
    if (PixelBufferPoolForPreProcessing)
      goto LABEL_160;
LABEL_96:
    v61 = (CFTypeRef *)(v81 + 8 * v6);
    if (*v61)
    {
      if (*(_DWORD *)(v88 + 4 * v6) == v92)
      {
LABEL_101:
        PixelBufferPoolForPreProcessing = CVPixelBufferPoolCreatePixelBuffer(allocator, *v54, &pixelBufferOut);
        if (!PixelBufferPoolForPreProcessing)
        {
          v50 = (double)v53;
          v52 = (double)v55;
          CVBufferPropagateAttachments(v15, pixelBufferOut);
          CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8D50]);
          CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E68]);
          PixelBufferPoolForPreProcessing = MEMORY[0x1940303F8](*v61, v15, pixelBufferOut, v17, v18, v19, v20, 0.0, 0.0, (double)v53, (double)v55);
          if (!PixelBufferPoolForPreProcessing)
          {
            v8 = (char *)CVBufferCopyAttachment(pixelBufferOut, key, 0);
            v44 = pixelBufferOut;
            pixelBufferOut = 0;
            v47 = v44;
            v49 = 0.0;
            v62 = 0.0;
            v29 = v93;
            v51 = 0.0;
            if (v8)
              goto LABEL_108;
            goto LABEL_104;
          }
        }
LABEL_160:
        v35 = PixelBufferPoolForPreProcessing;
        v8 = 0;
LABEL_164:
        DictionaryRepresentation = 0;
        goto LABEL_165;
      }
      CFRelease(*v61);
      *v61 = 0;
    }
    PixelBufferPoolForPreProcessing = VTImageRotationSessionCreate();
    if (PixelBufferPoolForPreProcessing)
      goto LABEL_160;
    MEMORY[0x1940303E0](*v61, *MEMORY[0x1E0CED6D0], *MEMORY[0x1E0C9AE50]);
    goto LABEL_101;
  }
  v44 = 0;
  v47 = v15;
  v48 = v17;
  v49 = v18;
  v50 = v19;
  v51 = v48;
  v52 = v20;
LABEL_104:
  if (cf)
    v8 = (char *)CFRetain(cf);
  else
    v8 = 0;
  v62 = v49;
LABEL_108:
  v103.origin.x = 0.0;
  v103.origin.y = 0.0;
  v99.origin.x = v51;
  v99.origin.y = v62;
  v99.size.width = v50;
  v99.size.height = v52;
  v103.size.width = v28;
  v103.size.height = v30;
  if (CGRectContainsRect(v99, v103)
    && CVPixelBufferGetWidth(v47) == v21
    && CVPixelBufferGetHeight(v47) == v29
    && CVPixelBufferGetPixelFormatType(v47) == v87
    && (v94 == 1 || ((CVPixelBufferGetPixelFormatType(v47) - 875704422) & 0xFFFFFFEF) != 0 || FigCFEqual()))
  {
    DictionaryRepresentation = 0;
    v24 = cf;
LABEL_134:
    v18 = v78;
    v17 = v79;
    v19 = v77;
    v69 = *(const void **)(v90 + 8 * v6);
    *(_QWORD *)(v90 + 8 * v6) = v15;
    CFRetain(v15);
    if (v69)
      CFRelease(v69);
    v70 = *(const void **)(v89 + 8 * v6);
    if (v70)
      CFRelease(v70);
    v35 = 0;
    *(_QWORD *)(v89 + 8 * v6) = v44;
    v33 = v92;
    goto LABEL_139;
  }
  v63 = (__CVPixelBufferPool **)(v83 + 8 * v6);
  v64 = bvc_isPixelBufferPoolCompatibleWithDimensionsAndPixelFormat(*v63, v21, v29, v87);
  v65 = *v63;
  if (v64)
  {
    if (v65)
      goto LABEL_122;
  }
  else if (v65)
  {
    CFRelease(v65);
    *v63 = 0;
  }
  v66 = bvc_createPixelBufferPoolForPreProcessing(v21, v29, v87, v63);
  if (v66)
  {
LABEL_163:
    v35 = v66;
    goto LABEL_164;
  }
LABEL_122:
  v67 = (VTPixelTransferSessionRef *)(v82 + 8 * v6);
  if (!*v67)
  {
    v66 = VTPixelTransferSessionCreate(allocator, v67);
    if (!v66)
    {
      VTPixelTransferSessionSetProperty();
      goto LABEL_125;
    }
    goto LABEL_163;
  }
LABEL_125:
  v100.origin.x = v51;
  v100.origin.y = v62;
  v100.size.width = v50;
  v100.size.height = v52;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v100);
  if (DictionaryRepresentation)
  {
    VTPixelTransferSessionSetProperty();
    v68 = VTPixelTransferSessionSetProperty();
    if (!v68)
    {
      v68 = VTPixelTransferSessionSetProperty();
      if (!v68)
      {
        v68 = VTPixelTransferSessionSetProperty();
        if (!v68)
        {
          v68 = CVPixelBufferPoolCreatePixelBuffer(allocator, *v63, &v97);
          if (!v68)
          {
            v68 = VTPixelTransferSessionTransferImage(*v67, v47, v97);
            if (!v68)
            {
              v24 = cf;
              if (v44)
                CFRelease(v44);
              v44 = v97;
              v97 = 0;
              v6 = v86;
              goto LABEL_134;
            }
          }
        }
      }
    }
  }
  else
  {
    v68 = FigSignalErrorAt();
  }
  v35 = v68;
LABEL_165:
  v24 = cf;
LABEL_140:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
LABEL_142:
  if (v97)
    CFRelease(v97);
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  if (v24)
    CFRelease(v24);
  if (v8)
    CFRelease(v8);
  result = FigGetUpTimeNanoseconds();
  v72 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(v72 + 344) = result;
  if (v35)
  {
    v73 = *(_QWORD **)(a1 + 64);
    v74 = (const void *)v73[20];
    v75 = v73[2];
    v76 = v73[3];
    result = bvc_updateSourcebufferCharacteristics(v72);
    if (!(_DWORD)result)
      result = bvc_computeScaledTransformAndTransformedRect(v75, v76, v74, v72);
    if (v35 != -16210)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __basicVideoCompositor_RenderFrame_block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  const void *v4;

  v2 = a1[4];
  v3 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 296);
  if (v3)
    v3(*(_QWORD *)(v2 + 304), a1[5], 0, a1[6]);
  v4 = (const void *)a1[6];
  if (v4)
    CFRelease(v4);
}

void __basicVideoCompositor_RenderFrame_block_invoke_5(uint64_t a1)
{
  const __CFAllocator *v2;
  CVReturn v3;
  const __CFDictionary *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t UpTimeNanoseconds;
  NSObject *v14;
  uint64_t v15;
  __CVBuffer *v16;
  uint64_t v17;
  __CVBuffer *v18;
  __CVBuffer *v19;
  float v20;
  CGFloat Width;
  CGFloat Height;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFArray *Value;
  const __CFArray *v37;
  CFTypeID TypeID;
  CFIndex v39;
  float32x4_t *v40;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v42;
  CFTypeID v43;
  __CVBuffer *v44;
  OSType v45;
  CFTypeRef v46;
  size_t v47;
  size_t v48;
  int8x16_t v49;
  float32x4_t v54;
  int16x8_t v55;
  uint64_t (*v56)(size_t, unint64_t, unsigned __int8 *, uint64_t *, char **);
  int v57;
  size_t v58;
  size_t k;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  __CVBuffer *v67;
  __CVBuffer *v68;
  uint64_t v69;
  float v70;
  double v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  OSType PixelFormatType;
  OSType v78;
  CFTypeRef v79;
  double x;
  double y;
  double v82;
  double v83;
  uint64_t (*v85)(double *, uint64_t *, uint64_t *, uint64_t *, _QWORD *, double, double, double, double, double, double, double, double, float);
  uint64_t (*v86)(double *, uint64_t *, uint64_t *, uint64_t *, _QWORD *, double, double, double, double, double, double, double, double, float);
  double v87;
  double v88;
  double v89;
  BOOL v90;
  uint64_t v92;
  float32x4_t v93;
  __int128 v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  int v109;
  uint64_t (*v110)(double *, uint64_t *, uint64_t *, uint64_t *, _QWORD *, double, double, double, double, double, double, double, double, float);
  size_t PlaneCount;
  uint64_t v112;
  size_t i;
  size_t v114;
  uint64_t v115;
  size_t j;
  double v117;
  double v118;
  double v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t m;
  const void *v130;
  const void *v131;
  const void *v132;
  const void *v133;
  const void *v134;
  const void *v135;
  double v136;
  CFTypeRef cf2;
  uint64_t (*v138)(float32x4_t *, _QWORD *, _QWORD *, _QWORD *, _QWORD *, double, double, double, double, double, double, double, double, double);
  NSObject *queue;
  const __CFString *key;
  uint64_t (*v141)(size_t, unint64_t, unsigned __int8 *, uint64_t *, char **);
  double v142;
  double v143;
  uint64_t v144;
  _QWORD v145[7];
  int v146;
  CGAffineTransform v147;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  int v152;
  float32x4_t v153;
  __int128 v154;
  __int128 v155;
  float32x4_t v156;
  __int128 v157;
  __int128 v158;
  CGAffineTransform block;
  double v160;
  double v161;
  double v162;
  unint64_t v163;
  size_t v164;
  uint64_t (*v165)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double, double, double, double, double, double);
  double v166;
  double v167;
  double v168;
  double v169;
  float32x4_t v170;
  __int128 v171;
  __int128 v172;
  _QWORD *v173;
  _QWORD *v174;
  _QWORD *v175;
  _QWORD *v176;
  float v177;
  _QWORD v178[4];
  _QWORD v179[4];
  _QWORD v180[4];
  _QWORD v181[8];
  CGRect v182;
  CGRect v183;
  CGRect v184;

  v181[5] = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 40));
  v3 = CVPixelBufferPoolCreatePixelBuffer(v2, *(CVPixelBufferPoolRef *)(a1 + 48), &pixelBufferOut);
  if (v3)
  {
    v57 = v3;
    goto LABEL_135;
  }
  v4 = *(const __CFDictionary **)(a1 + 56);
  if (v4)
    CVBufferSetAttachments(pixelBufferOut, v4, kCVAttachmentMode_ShouldPropagate);
  v5 = (const __CFString *)*MEMORY[0x1E0CA8D50];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8D50]);
  v6 = (const __CFString *)*MEMORY[0x1E0CA8E68];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E68]);
  v7 = (const __CFString *)*MEMORY[0x1E0CA8EE8];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8EE8]);
  v8 = (const __CFString *)*MEMORY[0x1E0CA8D68];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8D68]);
  v9 = (const __CFString *)*MEMORY[0x1E0CA8E98];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98]);
  CVBufferSetAttachment(pixelBufferOut, v5, *(CFTypeRef *)(*(_QWORD *)(a1 + 64) + 160), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(pixelBufferOut, v6, *(CFTypeRef *)(*(_QWORD *)(a1 + 64) + 32), kCVAttachmentMode_ShouldPropagate);
  key = v7;
  CVBufferSetAttachment(pixelBufferOut, v7, *(CFTypeRef *)(a1 + 72), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(pixelBufferOut, v8, *(CFTypeRef *)(a1 + 80), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(pixelBufferOut, v9, *(CFTypeRef *)(a1 + 88), kCVAttachmentMode_ShouldPropagate);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 2)
  {
    v10 = *(uint64_t **)(a1 + 96);
    v11 = *v10;
    v12 = v10[1];
    UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 64) + 256);
    v15 = *(_QWORD *)(a1 + 104);
    v11 *= 352;
    v16 = *(__CVBuffer **)(v15 + v11);
    v17 = 352 * v12;
    v18 = *(__CVBuffer **)(v15 + 352 * v12);
    v19 = pixelBufferOut;
    v20 = *(float *)(v15 + v11 + 24);
    Width = (double)CVPixelBufferGetWidth(v16);
    Height = (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(_QWORD *)(a1 + 104) + v11));
    *(double *)&v23 = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(_QWORD *)(a1 + 104) + v17));
    *(double *)&v24 = (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(_QWORD *)(a1 + 104) + v17));
    *(double *)&v25 = (double)CVPixelBufferGetWidth(pixelBufferOut);
    v26 = CVPixelBufferGetHeight(pixelBufferOut);
    v31 = bvc_mixBuffers(v14, v16, v18, v19, v27, v28, v29, v30, v20, 0.0, 0.0, Width, Height, 0, 0, v23, v24, 0, 0,
            v25,
            COERCE__INT64((double)v26));
    v32 = *(_QWORD *)(a1 + 64);
    v33 = (FigGetUpTimeNanoseconds() - UpTimeNanoseconds) / 1000;
    ++*(_DWORD *)(v32 + 440);
    v34 = *(_QWORD *)(v32 + 424);
    *(_QWORD *)(v32 + 432) += v33;
    v35 = *(_QWORD *)(v32 + 416);
    if (v35 >= (int)v33)
      v35 = (int)v33;
    if (v34 <= (int)v33)
      v33 = (int)v33;
    else
      v33 = v34;
    *(_QWORD *)(v32 + 416) = v35;
    *(_QWORD *)(v32 + 424) = v33;
    if (v31)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 3;
    else
      ++*(_DWORD *)(*(_QWORD *)(a1 + 64) + 364);
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 3)
  {
    v57 = 0;
    goto LABEL_135;
  }
  ++*(_DWORD *)(*(_QWORD *)(a1 + 64) + 368);
  if (!*(_BYTE *)(a1 + 136))
  {
LABEL_43:
    v57 = 0;
    v60 = *(_QWORD *)(a1 + 112);
    cf2 = (CFTypeRef)*MEMORY[0x1E0CA8F18];
    while (1)
    {
      while (1)
      {
        if (--v60 < 0)
          goto LABEL_135;
        v61 = *(_QWORD *)(a1 + 104);
        v62 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8 * v60);
        v63 = v61 + 352 * v62;
        v64 = v63 + 80;
        v65 = *(double *)(v63 + 80);
        if (fabs(v65) >= 0.000001)
        {
          v88 = *(double *)(v63 + 88);
          v87 = *(double *)(v63 + 96);
          v89 = *(double *)(v63 + 104);
          if (fabs(v65 + -1.0) < 0.000001 || (fabs(v65 + 1.0) >= 0.000001 ? (v90 = v65 == 1.0) : (v90 = 0), v90))
          {
            if ((fabs(v88) < 0.000001 || fabs(v88 + -1.0) >= 0.000001 && fabs(v88 + 1.0) >= 0.000001 && v88 == 0.0)
              && (fabs(v87) < 0.000001 || fabs(v87 + -1.0) >= 0.000001 && fabs(v87 + 1.0) >= 0.000001 && v87 == 0.0)
              && fabs(v89) >= 0.000001)
            {
              if (fabs(v89 + -1.0) < 0.000001)
                break;
              if (fabs(v89 + 1.0) >= 0.000001 && v89 == 1.0)
                break;
            }
          }
        }
LABEL_46:
        ++*(_DWORD *)(*(_QWORD *)(a1 + 64) + 380);
        v66 = FigGetUpTimeNanoseconds();
        queue = *(NSObject **)(*(_QWORD *)(a1 + 64) + 256);
        v67 = *(__CVBuffer **)v63;
        v68 = pixelBufferOut;
        v69 = v61 + 352 * v62;
        v70 = *(float *)(v69 + 24);
        v72 = *(double *)(v69 + 264);
        v71 = *(double *)(v69 + 272);
        v142 = *(double *)(v69 + 280);
        v143 = *(double *)(v69 + 288);
        v73 = *(double *)(v69 + 200);
        v74 = *(double *)(v69 + 208);
        v75 = *(double *)(v69 + 216);
        v76 = *(double *)(v69 + 224);
        v153 = *(float32x4_t *)v64;
        v154 = *(_OWORD *)(v64 + 16);
        v155 = *(_OWORD *)(v64 + 32);
        v149 = 0;
        v150 = &v149;
        v151 = 0x2000000000;
        v152 = 0;
        PixelFormatType = CVPixelBufferGetPixelFormatType(v67);
        v78 = CVPixelBufferGetPixelFormatType(v68);
        v79 = CVBufferCopyAttachment(v68, key, 0);
        memset(v181, 0, 32);
        memset(v180, 0, sizeof(v180));
        memset(v179, 0, sizeof(v179));
        memset(v178, 0, sizeof(v178));
        v182.origin.x = v73;
        v182.origin.y = v74;
        v182.size.width = v75;
        v182.size.height = v76;
        v183 = CGRectIntegral(v182);
        x = v183.origin.x;
        y = v183.origin.y;
        v82 = v183.size.width;
        v83 = v183.size.height;
        CVPixelBufferLockBaseAddress(v67, 1uLL);
        CVPixelBufferLockBaseAddress(v68, 0);
        if (v78 != 875704438)
        {
          v108 = v150;
          v109 = -12503;
LABEL_122:
          *((_DWORD *)v108 + 6) = v109;
          goto LABEL_123;
        }
        switch(PixelFormatType)
        {
          case 0x20u:
            if (v79 && CFEqual(v79, cf2))
            {
              _ZF = v70 == 1.0;
              v85 = bvc_FullComposition_ARGB_420v709;
              v86 = (uint64_t (*)(double *, uint64_t *, uint64_t *, uint64_t *, _QWORD *, double, double, double, double, double, double, double, double, float))bvc_FullCompositionOpaque_ARGB_420v709;
            }
            else
            {
              _ZF = v70 == 1.0;
              v85 = bvc_FullComposition_ARGB_420v601;
              v86 = (uint64_t (*)(double *, uint64_t *, uint64_t *, uint64_t *, _QWORD *, double, double, double, double, double, double, double, double, float))bvc_FullCompositionOpaque_ARGB_420v601;
            }
            break;
          case 0x42475241u:
            if (v79 && CFEqual(v79, cf2))
            {
              _ZF = v70 == 1.0;
              v85 = bvc_FullComposition_BGRA_420v709;
              v86 = (uint64_t (*)(double *, uint64_t *, uint64_t *, uint64_t *, _QWORD *, double, double, double, double, double, double, double, double, float))bvc_FullCompositionOpaque_BGRA_420v709;
            }
            else
            {
              _ZF = v70 == 1.0;
              v85 = bvc_FullComposition_BGRA_420v601;
              v86 = (uint64_t (*)(double *, uint64_t *, uint64_t *, uint64_t *, _QWORD *, double, double, double, double, double, double, double, double, float))bvc_FullCompositionOpaque_BGRA_420v601;
            }
            break;
          case 0x34323076u:
            _ZF = v70 == 1.0;
            v85 = bvc_FullComposition_420v_420v;
            v86 = bvc_FullCompositionOpaque_420v_420v;
            break;
          default:
            goto LABEL_121;
        }
        if (_ZF)
          v110 = v86;
        else
          v110 = v85;
        v138 = (uint64_t (*)(float32x4_t *, _QWORD *, _QWORD *, _QWORD *, _QWORD *, double, double, double, double, double, double, double, double, double))v110;
        if (!CVPixelBufferIsPlanar(v67))
        {
          if (CVPixelBufferIsPlanar(v67))
          {
            v112 = 1;
LABEL_100:
            for (i = 0; i != v112; ++i)
            {
              v181[i] = CVPixelBufferGetBytesPerRowOfPlane(v67, i);
              v179[i] = CVPixelBufferGetBaseAddressOfPlane(v67, i);
            }
            goto LABEL_104;
          }
LABEL_103:
          v181[0] = CVPixelBufferGetBytesPerRow(v67);
          v179[0] = CVPixelBufferGetBaseAddress(v67);
          goto LABEL_104;
        }
        PlaneCount = CVPixelBufferGetPlaneCount(v67);
        if (PlaneCount >= 5)
        {
LABEL_121:
          v108 = v150;
          v109 = -12502;
          goto LABEL_122;
        }
        v112 = PlaneCount;
        if (!CVPixelBufferIsPlanar(v67))
          goto LABEL_103;
        if (v112)
          goto LABEL_100;
LABEL_104:
        if (!CVPixelBufferIsPlanar(v68))
        {
          if (CVPixelBufferIsPlanar(v68))
          {
            v115 = 1;
LABEL_111:
            for (j = 0; j != v115; ++j)
            {
              v180[j] = CVPixelBufferGetBytesPerRowOfPlane(v68, j);
              v178[j] = CVPixelBufferGetBaseAddressOfPlane(v68, j);
            }
LABEL_115:
            if (FigThreadGetMaxLogicalCoreCount() < 2)
            {
              v156 = v153;
              v157 = v154;
              v158 = v155;
              *(float *)&v136 = v70;
              v120 = v138(&v156, v181, v179, v180, v178, v72, v71, v142, v143, x, y, v82, v83, v136);
              *((_DWORD *)v150 + 6) = v120;
            }
            else
            {
              v117 = v82 * v83 / 19200.0;
              if (v117 <= 1.0)
                v118 = 1.0;
              else
                v118 = (double)(unint64_t)v117;
              v119 = fmax(v83 / v118, 1.0);
              *(_QWORD *)&block.a = MEMORY[0x1E0C809B0];
              *(_QWORD *)&block.b = 0x40000000;
              *(_QWORD *)&block.c = __bvc_blitLayer_block_invoke;
              *(_QWORD *)&block.d = &unk_1E2FA6720;
              block.ty = x;
              v160 = y;
              v161 = v82;
              v162 = v83;
              v163 = ((unint64_t)v119 & 1) + (unint64_t)v119;
              v164 = (unint64_t)fmax(v83 / (double)v163, 1.0);
              v165 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double, double, double, double, double, double))v138;
              v166 = v72;
              v167 = v71;
              v168 = v142;
              v169 = v143;
              v171 = v154;
              v172 = v155;
              v170 = v153;
              v177 = v70;
              v173 = v181;
              v174 = v179;
              v175 = v180;
              v176 = v178;
              *(_QWORD *)&block.tx = &v149;
              dispatch_apply(v164, queue, &block);
            }
            goto LABEL_123;
          }
LABEL_114:
          v180[0] = CVPixelBufferGetBytesPerRow(v68);
          v178[0] = CVPixelBufferGetBaseAddress(v68);
          goto LABEL_115;
        }
        v114 = CVPixelBufferGetPlaneCount(v68);
        if (v114 < 5)
        {
          v115 = v114;
          if (CVPixelBufferIsPlanar(v68))
          {
            if (!v115)
              goto LABEL_115;
            goto LABEL_111;
          }
          goto LABEL_114;
        }
        *((_DWORD *)v150 + 6) = -12503;
LABEL_123:
        CVPixelBufferUnlockBaseAddress(v67, 1uLL);
        CVPixelBufferUnlockBaseAddress(v68, 0);
        if (v79)
          CFRelease(v79);
        v57 = *((_DWORD *)v150 + 6);
        _Block_object_dispose(&v149, 8);
        v121 = *(_QWORD *)(a1 + 64);
        v122 = (FigGetUpTimeNanoseconds() - v66) / 1000;
        ++*(_DWORD *)(v121 + 440);
        v123 = *(_QWORD *)(v121 + 424);
        *(_QWORD *)(v121 + 432) += v122;
        v124 = *(_QWORD *)(v121 + 416);
        if (v124 >= (int)v122)
          v124 = (int)v122;
        if (v123 <= (int)v122)
          v122 = (int)v122;
        else
          v122 = v123;
        *(_QWORD *)(v121 + 416) = v124;
        *(_QWORD *)(v121 + 424) = v122;
        if (v57)
          goto LABEL_135;
      }
      v92 = v61 + 352 * v62;
      v93 = *(float32x4_t *)v64;
      v94 = *(_OWORD *)(v63 + 112);
      *(_OWORD *)&block.c = *(_OWORD *)(v63 + 96);
      *(_OWORD *)&block.tx = v94;
      *(float32x4_t *)&block.a = v93;
      CGAffineTransformInvert(&v147, &block);
      v184 = CGRectApplyAffineTransform(*(CGRect *)(v92 + 200), &v147);
      v95 = v184.origin.x;
      v96 = v184.origin.y;
      v97 = v184.size.width;
      v98 = v184.size.height;
      v144 = FigGetUpTimeNanoseconds();
      v103 = bvc_mixBuffers(*(NSObject **)(*(_QWORD *)(a1 + 64) + 256), *(CVPixelBufferRef *)v63, pixelBufferOut, pixelBufferOut, v99, v100, v101, v102, *(float *)(v92 + 24), v95, v96, v97, v98, *(_QWORD *)(v92 + 200), *(_QWORD *)(v92 + 208), *(_QWORD *)(v92 + 216), *(_QWORD *)(v92 + 224), *(_QWORD *)(v92 + 200), *(_QWORD *)(v92 + 208),
               *(_QWORD *)(v92 + 216),
               *(_QWORD *)(v92 + 224));
      v104 = *(_QWORD *)(a1 + 64);
      v105 = (FigGetUpTimeNanoseconds() - v144) / 1000;
      ++*(_DWORD *)(v104 + 440);
      v106 = *(_QWORD *)(v104 + 424);
      *(_QWORD *)(v104 + 432) += v105;
      v107 = *(_QWORD *)(v104 + 416);
      if (v107 >= (int)v105)
        v107 = (int)v105;
      if (v106 <= (int)v105)
        v105 = (int)v105;
      else
        v105 = v106;
      *(_QWORD *)(v104 + 416) = v107;
      *(_QWORD *)(v104 + 424) = v105;
      if (v103)
      {
        if ((v103 + 12503) > 1)
        {
          v57 = v103;
          goto LABEL_135;
        }
        goto LABEL_46;
      }
      ++*(_DWORD *)(*(_QWORD *)(a1 + 64) + 376);
    }
  }
  v153 = (float32x4_t)xmmword_1932FA180;
  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 120), CFSTR("BackgroundColorARGB"));
  if (Value)
  {
    v37 = Value;
    TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v37))
    {
      v39 = 0;
      v40 = &v153;
      do
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v37, v39);
        if (ValueAtIndex)
        {
          v42 = ValueAtIndex;
          v43 = CFNumberGetTypeID();
          if (v43 == CFGetTypeID(v42))
            CFNumberGetValue(v42, kCFNumberFloat32Type, v40);
        }
        ++v39;
        v40 = (float32x4_t *)((char *)v40 + 4);
      }
      while (v39 != 4);
    }
  }
  v44 = pixelBufferOut;
  LODWORD(v149) = 0;
  v45 = CVPixelBufferGetPixelFormatType(pixelBufferOut);
  v46 = CVBufferCopyAttachment(v44, key, 0);
  v47 = CVPixelBufferGetWidth(v44);
  v48 = CVPixelBufferGetHeight(v44);
  memset(&block, 0, 32);
  v156 = 0u;
  v157 = 0u;
  CVPixelBufferLockBaseAddress(v44, 0);
  v49 = (int8x16_t)vcgezq_f32(v153);
  __asm { FMOV            V2.4S, #1.0 }
  v54 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  v55 = (int16x8_t)vcvtq_s32_f32((float32x4_t)vandq_s8(vbslq_s8(vbicq_s8(v49, (int8x16_t)vcgtq_f32(v153, _Q2)), (int8x16_t)vmulq_f32(v153, v54), (int8x16_t)v54), v49));
  *(int16x4_t *)v55.i8 = vmovn_s32((int32x4_t)v55);
  LODWORD(v149) = vmovn_s16(v55).u32[0];
  if (v45 != 875704438)
  {
    v57 = -12503;
    goto LABEL_40;
  }
  if (v46 && CFEqual(v46, (CFTypeRef)*MEMORY[0x1E0CA8F18]))
    v56 = bvc_Fill_32ARGB_420v709;
  else
    v56 = bvc_Fill_32ARGB_420v601;
  v141 = v56;
  if (CVPixelBufferIsPlanar(v44))
  {
    v58 = CVPixelBufferGetPlaneCount(v44);
    if (CVPixelBufferIsPlanar(v44))
    {
      if (!v58)
        goto LABEL_39;
LABEL_35:
      for (k = 0; k != v58; ++k)
      {
        *((_QWORD *)&block.a + k) = CVPixelBufferGetBytesPerRowOfPlane(v44, k);
        v156.i64[k] = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(v44, k);
      }
      goto LABEL_39;
    }
  }
  else if (CVPixelBufferIsPlanar(v44))
  {
    v58 = 1;
    goto LABEL_35;
  }
  *(_QWORD *)&block.a = CVPixelBufferGetBytesPerRow(v44);
  v156.i64[0] = (uint64_t)CVPixelBufferGetBaseAddress(v44);
LABEL_39:
  v141(v47, v48, (unsigned __int8 *)&v149, (uint64_t *)&block, (char **)&v156);
  v57 = 0;
LABEL_40:
  CVPixelBufferUnlockBaseAddress(v44, 0);
  if (v46)
    CFRelease(v46);
  if (v45 == 875704438)
    goto LABEL_43;
LABEL_135:
  dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 64) + 272), &__block_literal_global_23_2);
  v125 = *(_QWORD *)(a1 + 64);
  v126 = *(NSObject **)(v125 + 272);
  v145[0] = MEMORY[0x1E0C809B0];
  v145[1] = 0x40000000;
  v145[2] = __basicVideoCompositor_RenderFrame_block_invoke_7;
  v145[3] = &__block_descriptor_tmp_24_1;
  v127 = *(_QWORD *)(a1 + 128);
  v145[4] = v125;
  v145[5] = v127;
  v146 = v57;
  v145[6] = pixelBufferOut;
  dispatch_async(v126, v145);
  v128 = *(_QWORD *)(a1 + 112);
  if (v128)
  {
    for (m = 0; m < v128; ++m)
    {
      v130 = *(const void **)(*(_QWORD *)(a1 + 104) + 352 * *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8 * m));
      if (v130)
      {
        CFRelease(v130);
        v128 = *(_QWORD *)(a1 + 112);
      }
    }
  }
  free(*(void **)(a1 + 104));
  free(*(void **)(a1 + 96));
  v131 = *(const void **)(a1 + 48);
  if (v131)
    CFRelease(v131);
  v132 = *(const void **)(a1 + 56);
  if (v132)
    CFRelease(v132);
  v133 = *(const void **)(a1 + 72);
  if (v133)
    CFRelease(v133);
  v134 = *(const void **)(a1 + 80);
  if (v134)
    CFRelease(v134);
  v135 = *(const void **)(a1 + 88);
  if (v135)
    CFRelease(v135);
}

void __basicVideoCompositor_RenderFrame_block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  const void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 296);
  if (v3)
    v3(*(_QWORD *)(v2 + 304), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);
}

uint64_t __openglVideoCompositor_RenderFrame_block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_QWORD *)(*(_QWORD *)(result + 40) + 648))
  {
    v1 = result;
    result = FigSignalErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t __openglVideoCompositor_RenderFrame_block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, _QWORD, _QWORD, _QWORD);

  v2 = a1[4];
  v3 = a1[5];
  result = FigGetUpTimeNanoseconds();
  v5 = (result - v3) / 1000;
  ++*(_DWORD *)(v2 + 816);
  *(_QWORD *)(v2 + 808) += v5;
  v6 = *(_QWORD *)(v2 + 792);
  if (v6 >= v5)
    v6 = (result - v3) / 1000;
  *(_QWORD *)(v2 + 792) = v6;
  if (*(_QWORD *)(v2 + 800) > v5)
    v5 = *(_QWORD *)(v2 + 800);
  *(_QWORD *)(v2 + 800) = v5;
  v7 = a1[4];
  v8 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v7 + 648);
  if (v8)
    return v8(*(_QWORD *)(v7 + 656), a1[6], 0, a1[7]);
  return result;
}

void __mvc_RenderFrame_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  const void *v4;
  const void *v5;

  v2 = a1[5];
  v3 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 24);
  if (v3)
    v3(*(_QWORD *)(v2 + 32), a1[6], 0, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  v4 = (const void *)a1[7];
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v5)
    CFRelease(v5);
}

@end
