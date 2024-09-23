@implementation CUIMutablePSDImageRef

- (__CFData)copyDefaultICCProfileData
{
  CGColorSpace *v2;
  __CFData *v3;

  v2 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  v3 = CGColorSpaceCopyICCData(v2);
  CGColorSpaceRelease(v2);
  return v3;
}

- (CUIMutablePSDImageRef)initWithPixelWidth:(unint64_t)a3 pixelHeight:(unint64_t)a4
{
  int v4;
  int v5;
  CUIMutablePSDImageRef *v6;
  CUIMutablePSDImageRef *v7;
  CPSDFile *v8;
  const __CFData *v9;
  const __CFData *v10;
  const unsigned __int8 *BytePtr;
  size_t Length;
  objc_super v14;

  v4 = a4;
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CUIMutablePSDImageRef;
  v6 = -[CUIMutablePSDImageRef init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CUIPSDImageRef setFile:](v6, "setFile:", 0xFFFFFFFFLL);
    v8 = (CPSDFile *)operator new(400, 0x10B1C407992E97CLL);
    CPSDFile::CPSDFile(v8);
    -[CUIPSDImageRef setPsd:](v7, "setPsd:", v8);
    v9 = -[CUIMutablePSDImageRef copyDefaultICCProfileData](v7, "copyDefaultICCProfileData");
    if (v9)
    {
      v10 = v9;
      BytePtr = CFDataGetBytePtr(v9);
      Length = CFDataGetLength(v10);
      CPSDFile::Init((CPSDFile *)-[CUIPSDImageRef psd](v7, "psd"), v5, v4, BytePtr, Length);
      CFRelease(v10);
    }
    else
    {
      CPSDFile::Init((CPSDFile *)-[CUIPSDImageRef psd](v7, "psd"), v5, v4, 0, 0);
    }
  }
  return v7;
}

- (void)addLayoutMetricsChannel:(id)a3
{
  CPSDString *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int8 *v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  size_t v18;
  unsigned int v19;

  v5 = NewCPSDStringFromNSString((NSString *)objc_msgSend(a3, "name"));
  v6 = *((_DWORD *)-[CUIPSDImageRef psd](self, "psd") + 36);
  v7 = *((_DWORD *)-[CUIPSDImageRef psd](self, "psd") + 37);
  v8 = v7 * v6;
  v9 = (unsigned __int8 *)malloc_type_calloc(v7 * v6, 1uLL, 0x100004077774924uLL);
  objc_msgSend(a3, "edgeInsets");
  v11 = v10;
  objc_msgSend(a3, "edgeInsets");
  v13 = v12;
  objc_msgSend(a3, "edgeInsets");
  v15 = ((double)v6 - v14 - (double)v11);
  objc_msgSend(a3, "edgeInsets");
  if ((_DWORD)v15)
  {
    v17 = v13;
    v18 = ((double)v7 - v16 - (double)v17);
    v19 = v11 * v7;
    do
    {
      memset(&v9[v17 + v19], 255, v18);
      v19 += v7;
      --v15;
    }
    while (v15);
  }
  CPSDFile::AddExtraAlphaChannel((CPSDFile *)-[CUIPSDImageRef psd](self, "psd"), v9, v8, v5);
}

- (void)newPSDGradientFromCUIPSDGradient:(id)a3
{
  char *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;
  void **v23;
  uint64_t v24;
  void *i;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unsigned int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  unsigned int v40;
  unint64_t v41;
  double *v42;
  double *v43;
  double *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  double *v50;
  double *v51;
  __int128 v52;
  id v53;
  id v54;
  uint64_t v55;
  void **v56;
  uint64_t v57;
  void *j;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  unsigned int v64;
  double v65;
  double v66;
  unsigned int v67;
  unint64_t v68;
  double *v69;
  double *v70;
  double *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  id obj;
  id obja;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];

  v4 = (char *)operator new(136, 0x1020C40E61DAC95);
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_DWORD *)(v4 + 15) = 0;
  *((_QWORD *)v4 + 4) = 0;
  *((_QWORD *)v4 + 5) = 0;
  *((_QWORD *)v4 + 3) = 0;
  *((_DWORD *)v4 + 12) = 1282306592;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_OWORD *)(v4 + 104) = 0u;
  *(_OWORD *)(v4 + 120) = 0u;
  objc_msgSend(a3, "drawingAngle");
  *(_QWORD *)v4 = v5;
  v6 = objc_msgSend(a3, "gradientStyle");
  if (v6 == 1382312992)
    v7 = 1382312992;
  else
    v7 = 1282306592;
  if (v6 == 1382444131)
    v8 = 1382444131;
  else
    v8 = v7;
  if (v6 == 1148022372)
    v9 = 1148022372;
  else
    v9 = 1282306592;
  if (v6 == 1097754476)
    v10 = 1097754476;
  else
    v10 = v9;
  if (v6 <= 1382312991)
    v11 = v10;
  else
    v11 = v8;
  *((_DWORD *)v4 + 12) = v11;
  v82 = objc_msgSend(a3, "evaluator");
  if (v82)
  {
    objc_msgSend(v82, "smoothingCoefficient");
    *((double *)v4 + 1) = v12 * 4096.0;
    v4[17] = objc_msgSend(v82, "isDithered");
    objc_msgSend(v82, "fillColor");
    v14 = v13 * 255.0;
    objc_msgSend(v82, "fillColor");
    v16 = v15 * 255.0;
    objc_msgSend(v82, "fillColor");
    v18 = v17 * 255.0;
    objc_msgSend(v82, "fillColor");
    *((double *)v4 + 7) = v14;
    *((double *)v4 + 8) = v16;
    *((double *)v4 + 9) = v18;
    *((double *)v4 + 10) = v19 * 255.0;
    v4[18] = 1;
    v20 = objc_msgSend(objc_msgSend(v82, "colorMidpointLocations"), "count");
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    obj = objc_msgSend(v82, "colorStops");
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    if (v21)
    {
      v22 = 0;
      v23 = (void **)(v4 + 88);
      v24 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v88 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v26, "gradientColor");
          v28 = v27;
          v30 = v29;
          v32 = v31;
          if (v22 >= (uint64_t)v20)
          {
            v34 = 50.0;
          }
          else
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v82, "colorMidpointLocations"), "objectAtIndex:", v22), "doubleValue");
            v34 = v33 * 100.0;
          }
          objc_msgSend(v26, "location");
          v35 = v34;
          v36 = v28 * 255.0;
          v37 = v30 * 255.0;
          v38 = v32 * 255.0;
          v40 = vcvtd_n_u64_f64(v39, 0xCuLL);
          v42 = (double *)*((_QWORD *)v4 + 12);
          v41 = *((_QWORD *)v4 + 13);
          if ((unint64_t)v42 >= v41)
          {
            v44 = (double *)*v23;
            v45 = ((char *)v42 - (_BYTE *)*v23) >> 5;
            v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 59)
              std::vector<CPSDChannelBlendingInfo>::__throw_length_error[abi:ne180100]();
            v47 = v41 - (_QWORD)v44;
            if (v47 >> 4 > v46)
              v46 = v47 >> 4;
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFE0)
              v48 = 0x7FFFFFFFFFFFFFFLL;
            else
              v48 = v46;
            if (v48)
            {
              v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PSDGradientColorStop>>((uint64_t)(v4 + 104), v48);
              v44 = (double *)*((_QWORD *)v4 + 11);
              v42 = (double *)*((_QWORD *)v4 + 12);
            }
            else
            {
              v49 = 0;
            }
            v50 = (double *)&v49[32 * v45];
            *v50 = v36;
            v50[1] = v37;
            v50[2] = v38;
            *((_DWORD *)v50 + 6) = v40;
            *((_DWORD *)v50 + 7) = v35;
            v51 = v50;
            if (v42 != v44)
            {
              do
              {
                v52 = *((_OWORD *)v42 - 1);
                *((_OWORD *)v51 - 2) = *((_OWORD *)v42 - 2);
                *((_OWORD *)v51 - 1) = v52;
                v51 -= 4;
                v42 -= 4;
              }
              while (v42 != v44);
              v44 = (double *)*v23;
            }
            v43 = v50 + 4;
            *((_QWORD *)v4 + 11) = v51;
            *((_QWORD *)v4 + 12) = v50 + 4;
            *((_QWORD *)v4 + 13) = &v49[32 * v48];
            if (v44)
              operator delete(v44);
          }
          else
          {
            *v42 = v36;
            v42[1] = v37;
            v42[2] = v38;
            v43 = v42 + 4;
            *((_DWORD *)v42 + 6) = v40;
            *((_DWORD *)v42 + 7) = v35;
          }
          *((_QWORD *)v4 + 12) = v43;
          ++v22;
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
      }
      while (v21);
    }
    v53 = objc_msgSend(objc_msgSend(v82, "opacityMidpointLocations"), "count");
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    obja = objc_msgSend(v82, "opacityStops");
    v54 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v54)
    {
      v55 = 0;
      v56 = (void **)(v4 + 112);
      v57 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v54; j = (char *)j + 1)
        {
          if (*(_QWORD *)v84 != v57)
            objc_enumerationMutation(obja);
          v59 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j);
          if (v55 >= (uint64_t)v53)
          {
            v61 = 50.0;
          }
          else
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v82, "opacityMidpointLocations"), "objectAtIndex:", v55), "doubleValue");
            v61 = v60 * 100.0;
          }
          objc_msgSend(v59, "opacity");
          v63 = v62;
          objc_msgSend(v59, "location");
          v64 = v61;
          v65 = v63 * 100.0;
          v67 = vcvtd_n_u64_f64(v66, 0xCuLL);
          v69 = (double *)*((_QWORD *)v4 + 15);
          v68 = *((_QWORD *)v4 + 16);
          if ((unint64_t)v69 >= v68)
          {
            v71 = (double *)*v56;
            v72 = ((char *)v69 - (_BYTE *)*v56) >> 4;
            v73 = v72 + 1;
            if ((unint64_t)(v72 + 1) >> 60)
              std::vector<CPSDChannelBlendingInfo>::__throw_length_error[abi:ne180100]();
            v74 = v68 - (_QWORD)v71;
            if (v74 >> 3 > v73)
              v73 = v74 >> 3;
            if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF0)
              v75 = 0xFFFFFFFFFFFFFFFLL;
            else
              v75 = v73;
            if (v75)
            {
              v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CPSDString>>((uint64_t)(v4 + 128), v75);
              v71 = (double *)*((_QWORD *)v4 + 14);
              v69 = (double *)*((_QWORD *)v4 + 15);
            }
            else
            {
              v76 = 0;
            }
            v77 = &v76[16 * v72];
            *(double *)v77 = v65;
            *((_DWORD *)v77 + 2) = v67;
            *((_DWORD *)v77 + 3) = v64;
            v78 = v77;
            if (v69 != v71)
            {
              do
              {
                *((_OWORD *)v78 - 1) = *((_OWORD *)v69 - 1);
                v78 -= 16;
                v69 -= 2;
              }
              while (v69 != v71);
              v71 = (double *)*v56;
            }
            v70 = (double *)(v77 + 16);
            *((_QWORD *)v4 + 14) = v78;
            *((_QWORD *)v4 + 15) = v77 + 16;
            *((_QWORD *)v4 + 16) = &v76[16 * v75];
            if (v71)
              operator delete(v71);
          }
          else
          {
            *v69 = v65;
            v70 = v69 + 2;
            *((_DWORD *)v69 + 2) = v67;
            *((_DWORD *)v69 + 3) = v64;
          }
          *((_QWORD *)v4 + 15) = v70;
          ++v55;
        }
        v54 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      }
      while (v54);
    }
  }
  return v4;
}

- (unsigned)psdLayerBlendModeForCGBlendMode:(int)a3
{
  if ((a3 - 1) > 0xE)
    return 1852797549;
  else
    return dword_19EC758F0[a3 - 1];
}

- (void)addLayer:(id)a3
{
  uint64_t v6;
  double v7;
  int v8;
  int v9;
  CPSDString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGImage *v14;
  unint64_t v15;
  CGFloat v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned __int8 *v28[2];
  __int128 v29;

  v6 = objc_opt_class(CUIPSDLayer, a2);
  if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0)
  {
    objc_msgSend(a3, "opacity");
    v8 = (int)(v7 * 255.0);
    v9 = -[CUIMutablePSDImageRef psdLayerBlendModeForCGBlendMode:](self, "psdLayerBlendModeForCGBlendMode:", objc_msgSend(a3, "blendMode"));
    v10 = NewCPSDStringFromNSString((NSString *)objc_msgSend(a3, "name"));
    v12 = objc_opt_class(CUIPSDImageLayer, v11);
    if ((objc_opt_isKindOfClass(a3, v12) & 1) != 0)
    {
      *(_OWORD *)v28 = 0u;
      v29 = 0u;
      v14 = (CGImage *)objc_msgSend(a3, "cgImageRef");
      LODWORD(v15) = *((_DWORD *)-[CUIPSDImageRef psd](self, "psd") + 37);
      v16 = (double)v15;
      LODWORD(v17) = *((_DWORD *)-[CUIPSDImageRef psd](self, "psd") + 36);
      LODWORD(v14) = CUIGetChannelDataForImage(v14, (void **)v28, v16, (double)v17);
      CPSDFile::AddLayer((CPSDFile *)-[CUIPSDImageRef psd](self, "psd"), v28, (int)v14, (const UniChar **)v10, v8, v9);
    }
    else
    {
      v18 = objc_opt_class(CUIPSDGradientLayer, v13);
      if ((objc_opt_isKindOfClass(a3, v18) & 1) != 0)
      {
        v20 = -[CUIMutablePSDImageRef newPSDGradientFromCUIPSDGradient:](self, "newPSDGradientFromCUIPSDGradient:", objc_msgSend(a3, "gradient"));
        CPSDFile::AddLayer((uint64_t)-[CUIPSDImageRef psd](self, "psd"), (uint64_t)v20, (const UniChar **)v10, v8, v9);
        if (v20)
        {
          v21 = (void *)v20[14];
          if (v21)
          {
            v20[15] = v21;
            operator delete(v21);
          }
          v22 = (void *)v20[11];
          if (v22)
          {
            v20[12] = v22;
            operator delete(v22);
          }
          MEMORY[0x1A1AEEB08](v20, 0x1020C40E61DAC95);
        }
      }
      else
      {
        v23 = objc_opt_class(CUIPSDLayerGroupStart, v19);
        if ((objc_opt_isKindOfClass(a3, v23) & 1) != 0)
        {
          CPSDFile::AddLayerGroupStart((CPSDFile *)-[CUIPSDImageRef psd](self, "psd"));
        }
        else
        {
          v25 = objc_opt_class(CUIPSDLayerGroupEnd, v24);
          if ((objc_opt_isKindOfClass(a3, v25) & 1) == 0)
          {
            v26 = 0;
            if (!v10)
              goto LABEL_19;
            goto LABEL_16;
          }
          CPSDFile::AddLayerGroupEnd((CPSDFile *)-[CUIPSDImageRef psd](self, "psd"), (const UniChar **)v10, v8, 1885434739);
        }
      }
    }
    v26 = 1;
    if (!v10)
      goto LABEL_19;
LABEL_16:
    v27 = *((_QWORD *)v10 + 1);
    if (v27)
    {
      MEMORY[0x1A1AEEAF0](v27, 0x1000C80BDFB0063);
      *((_QWORD *)v10 + 1) = 0;
    }
    MEMORY[0x1A1AEEB08](v10, 0x1010C4082113244);
LABEL_19:
    if ((v26 & 1) != 0)
      return;
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIMutablePSDImageRef.mm"), 434, CFSTR("AddLayer called with object of unexpected class:%@"), objc_msgSend(a3, "description"));
}

- (unsigned)newUInt32CArray:(unsigned int *)a3 withNSArray:(id)a4 prependNumber:(id)a5 appendNumber:(id)a6
{
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;

  v10 = objc_msgSend(a4, "count");
  v11 = v10;
  if (a5)
    v12 = v10 + 1;
  else
    v12 = v10;
  if (a6)
    v13 = v12 + 1;
  else
    v13 = v12;
  v14 = (unsigned int *)malloc_type_malloc(4 * v13, 0x100004052888210uLL);
  v15 = v14;
  if (v14)
  {
    v16 = v11;
    if (v11)
    {
      v17 = 0;
      v18 = &v14[a5 != 0];
      do
      {
        v18[v17] = objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v17), "unsignedIntegerValue");
        ++v17;
      }
      while (v16 != v17);
    }
    if (a5)
      *v15 = objc_msgSend(a5, "unsignedIntegerValue");
    if (a6)
      v15[v12++] = objc_msgSend(a6, "unsignedIntegerValue");
  }
  else
  {
    v12 = 0;
  }
  *a3 = v15;
  return v12;
}

- (unsigned)newSliceRectsArray:(PSDRect *)a3 withSliceRects:(id)a4
{
  unsigned int v6;
  unsigned int v7;
  PSDRect *v8;
  uint64_t v9;
  _DWORD *v10;
  CGRect v12;

  v6 = objc_msgSend(a4, "count");
  v7 = v6;
  if (v6)
  {
    v8 = (PSDRect *)operator new[](16 * v6, 0x1000C80451B5BE8);
    bzero(v8, 16 * v7);
    v9 = 0;
    v10 = (_DWORD *)((char *)v8 + 8);
    do
    {
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a4, "objectAtIndex:", v9), &v12);
      *(v10 - 1) = CGRectGetMinX(v12);
      v10[1] = CGRectGetMaxX(v12);
      *(v10 - 2) = CGRectGetMinY(v12);
      *v10 = CGRectGetMaxY(v12);
      v10 += 4;
      ++v9;
    }
    while (v7 != v9);
  }
  else
  {
    v8 = 0;
  }
  *a3 = v8;
  return v7;
}

- (unsigned)newSliceRectsArray:(PSDRect *)a3 withXCutPositions:(id)a4 yCutPositions:(id)a5
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  signed int v13;
  PSDRect *v14;
  int *v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int *v23;
  uint64_t v24;
  _DWORD *v25;
  int v26;
  void **v27;
  uint64_t v29;
  void *v30;

  v30 = 0;
  v8 = -[CUIMutablePSDImageRef newUInt32CArray:withNSArray:prependNumber:appendNumber:](self, "newUInt32CArray:withNSArray:prependNumber:appendNumber:", &v30, a4, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *((unsigned int *)-[CUIPSDImageRef psd](self, "psd") + 37)));
  if (v30)
  {
    v9 = v8;
    v29 = 0;
    v10 = -[CUIMutablePSDImageRef newUInt32CArray:withNSArray:prependNumber:appendNumber:](self, "newUInt32CArray:withNSArray:prependNumber:appendNumber:", &v29, a5, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *((unsigned int *)-[CUIPSDImageRef psd](self, "psd") + 37)));
    if (v29)
    {
      v11 = v10;
      v12 = v10 - 1;
      v13 = v12 * (v9 - 1);
      if (v13 <= 0)
      {
        v14 = 0;
        v15 = (int *)v30;
      }
      else
      {
        v14 = (PSDRect *)operator new[](16 * v12 * (v9 - 1), 0x1000C80451B5BE8);
        bzero(v14, 16 * v12 * (v9 - 1));
        v15 = (int *)v30;
        if ((int)(v11 - 2) >= 0)
        {
          v16 = 0;
          v17 = 0;
          v18 = v29;
          do
          {
            if (((v9 - 2) & 0x80000000) != 0)
            {
              v19 = v16 + 1;
            }
            else
            {
              v19 = v16 + 1;
              v20 = *v15;
              v21 = *(_DWORD *)(v18 + 4 * v16);
              v22 = *(_DWORD *)(v18 + 4 * v19);
              v23 = v15 + 1;
              v24 = v9 - 1;
              do
              {
                v25 = (_DWORD *)((char *)v14 + 16 * v17);
                v25[1] = v20;
                v26 = *v23++;
                v20 = v26;
                *v25 = v21;
                v25[2] = v22;
                v25[3] = v26;
                ++v17;
                --v24;
              }
              while (v24);
            }
            v16 = v19;
          }
          while (v19 != v12);
        }
      }
      free(v15);
      v27 = (void **)&v29;
    }
    else
    {
      v14 = 0;
      v13 = 0;
      v27 = &v30;
    }
    free(*v27);
    *a3 = v14;
  }
  else
  {
    v13 = 0;
    *a3 = 0;
  }
  return v13;
}

- (void)addOrUpdateSlicesWithSliceRects:(id)a3
{
  int v4;
  CPSDFile *v5;
  PSDRect *v6;

  v6 = 0;
  v4 = -[CUIMutablePSDImageRef newSliceRectsArray:withSliceRects:](self, "newSliceRectsArray:withSliceRects:", &v6, a3);
  v5 = -[CUIPSDImageRef psd](self, "psd");
  CPSDFile::AddOrUpdateSlices(v5, (int32x4_t *)v6, v4);
  if (v6)
    MEMORY[0x1A1AEEAF0](v6, 0x1000C80451B5BE8);
}

- (void)addOrUpdateSlicesWithXCutPositions:(id)a3 yCutPositions:(id)a4
{
  int v5;
  CPSDFile *v6;
  PSDRect *v7;

  v7 = 0;
  v5 = -[CUIMutablePSDImageRef newSliceRectsArray:withXCutPositions:yCutPositions:](self, "newSliceRectsArray:withXCutPositions:yCutPositions:", &v7, a3, a4);
  v6 = -[CUIPSDImageRef psd](self, "psd");
  CPSDFile::AddOrUpdateSlices(v6, (int32x4_t *)v7, v5);
  if (v7)
    MEMORY[0x1A1AEEAF0](v7, 0x1000C80451B5BE8);
}

- (void)updateSliceName:(id)a3 atIndex:(unsigned int)a4
{
  const unsigned __int16 *v6;
  CPSDFile *v7;
  unsigned int v8;

  v8 = 0;
  v6 = (const unsigned __int16 *)NSStringToUTF16LEBytes((NSString *)a3, &v8);
  v7 = -[CUIPSDImageRef psd](self, "psd");
  CPSDFile::UpdateSliceNameAtIndex(v7, v6, v8, a4);
}

- (void)setFileURL:(id)a3
{
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Bad URL"), CFSTR("CUIMutablePSDImageRef setFileURL called with non-file URL"), 0));
  -[CUIPSDImageRef setPath:](self, "setPath:", objc_msgSend(a3, "path"));
}

- (BOOL)saveWithCompletionHandler:(id)a3
{
  uint64_t File;
  void *v6;

  File = CreateFile((char *)-[NSFileManager fileSystemRepresentationWithPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileSystemRepresentationWithPath:", -[CUIPSDImageRef path](self, "path")), 1538);
  v6 = -[CUIPSDImageRef psd](self, "psd");
  (*(void (**)(void *, uint64_t))(*(_QWORD *)v6 + 56))(v6, File);
  CloseHandle(File);
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  return 1;
}

- (BOOL)saveToURL:(id)a3 completionHandler:(id)a4
{
  -[CUIMutablePSDImageRef setFileURL:](self, "setFileURL:", a3);
  return -[CUIMutablePSDImageRef saveWithCompletionHandler:](self, "saveWithCompletionHandler:", a4);
}

- (uint64_t)saveWithCompletionHandler:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSError **a4)
{
  uint64_t v7;
  NSError *v8;
  uint64_t result;
  void (**v10)(CStdException *__hidden);
  uint64_t v11;

  v7 = *((_QWORD *)__cxa_get_exception_ptr(a1) + 1);
  v10 = &off_1E41A8FA0;
  v11 = v7;
  __cxa_begin_catch(a1);
  CStdException::~CStdException((CStdException *)&v10);
  __cxa_end_catch();
  if (!a3)
    return 1;
  v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CUIMutablePSDImageRef"), 0, 0, v10, v11);
  result = 0;
  *a4 = v8;
  return result;
}

@end
