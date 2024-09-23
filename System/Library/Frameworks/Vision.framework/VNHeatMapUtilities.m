@implementation VNHeatMapUtilities

+ (BOOL)smoothedFloat32ImageBuffer:(vImage_Buffer *)a3 fromImageBuffer:(vImage_Buffer *)a4 originalImageSize:(CGSize)a5 sigmaX:(float)a6 sigmaY:(float)a7 nStd:(float)a8
{
  double width;
  float v12;
  float v13;
  BOOL result;
  uint64_t v15;
  float *v16;
  char *v19;
  unsigned __int8 v20;
  vImagePixelCount v21;
  size_t v22;
  uint32_t v23;
  vImage_Error v24;
  vImage_Error v25;
  vImage_Error v26;
  char *v27;
  vImage_Buffer dest;
  uint32_t kernel_width[2];
  float *v30;
  float *kernel;

  if (!a3->data)
    return 0;
  width = a5.width;
  v12 = (float)a4->width * a6;
  if (a5.height <= width)
  {
    v12 = a5.height * v12 / width;
    v13 = (float)a4->height * a7;
  }
  else
  {
    v13 = width * a7 * (double)a4->height / a5.height;
  }
  v30 = 0;
  kernel = 0;
  *(_QWORD *)kernel_width = 0;
  if (ImageProcessing_smoothGaussian_createKernelForPlanarF(&kernel, (int *)&kernel_width[1], v12, a8) == 4224)
  {
    v15 = ImageProcessing_smoothGaussian_createKernelForPlanarF(&v30, (int *)kernel_width, v13, a8);
    v16 = kernel;
    if (v15 == 4224 && kernel != 0 && v30 != 0)
    {
      v21 = a4->width;
      dest.height = a4->height;
      dest.width = v21;
      dest.rowBytes = (4 * v21 + 15) & 0xFFFFFFFFFFFFFFF0;
      v22 = dest.rowBytes * dest.height;
      v23 = kernel_width[1];
      v24 = vImageConvolve_PlanarF(a4, a3, 0, 0, 0, 0, 1u, kernel_width[1], 0.0, 0x88u);
      v25 = vImageConvolve_PlanarF(a4, a3, 0, 0, 0, 0, kernel_width[0], 1u, 0.0, 0x88u);
      if (v24 <= v25)
        v26 = v25;
      else
        v26 = v24;
      v19 = (char *)malloc_type_malloc(v26 + v22, 0x1055093BuLL);
      dest.data = v19;
      v27 = &v19[v22];
      if (vImageConvolve_PlanarF(a4, &dest, v27, 0, 0, kernel, 1u, v23, 0.0, 8u))
      {
        v20 = 122;
      }
      else if (vImageConvolve_PlanarF(&dest, a3, v27, 0, 0, v30, kernel_width[0], 1u, 0.0, 8u))
      {
        v20 = 122;
      }
      else
      {
        v20 = 0x80;
      }
      v16 = kernel;
      goto LABEL_27;
    }
    v19 = 0;
  }
  else
  {
    v19 = 0;
    v16 = kernel;
  }
  v20 = 123;
LABEL_27:
  free(v16);
  free(v30);
  result = v20 == 128;
  if (v20 == 128)
  {
    free(v19);
    return 1;
  }
  return result;
}

+ (float)maximumValueFromFloat32ImageBuffer:(vImage_Buffer *)a3
{
  vImagePixelCount width;
  float v5;
  vImagePixelCount v6;
  const float *data;
  float v9;
  float __C;

  __C = 1.1755e-38;
  width = a3->width;
  if (a3->rowBytes == 4 * width)
  {
    vDSP_maxv((const float *)a3->data, 1, &__C, a3->height * width);
    return __C;
  }
  else if (a3->height)
  {
    v6 = 0;
    data = (const float *)a3->data;
    v5 = 1.1755e-38;
    do
    {
      v9 = 1.1755e-38;
      vDSP_maxv(data, 1, &v9, a3->width);
      if (v9 > v5)
        v5 = v9;
      ++v6;
      data = (const float *)((char *)data + a3->rowBytes);
    }
    while (v6 < a3->height);
  }
  else
  {
    return 1.1755e-38;
  }
  return v5;
}

+ (id)significantRegionsFromFloat32ImageBuffer:(vImage_Buffer *)a3 threshold:(float)a4
{
  unint64_t v6;
  vImagePixelCount height;
  double *v8;
  CGFloat *v9;
  vImagePixelCount v10;
  vImagePixelCount width;
  vImagePixelCount v12;
  uint64_t v13;
  _QWORD *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat x;
  double y;
  double v20;
  CGFloat v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  CGFloat *v32;
  unint64_t v33;
  __int128 v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  double *v38;
  double *v39;
  double v40;
  double v41;
  double v42;
  vImagePixelCount v43;
  vImagePixelCount v44;
  double v45;
  void *v46;
  unint64_t v48;
  CGFloat *v49;
  void *__p[3];
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v6 = a3->height * a3->width;
  LOBYTE(v52) = 0;
  std::vector<BOOL>::vector(__p, v6, (unsigned __int8 *)&v52);
  height = a3->height;
  if (height)
  {
    v8 = 0;
    v9 = 0;
    v48 = 0;
    v10 = 0;
    width = a3->width;
    do
    {
      if (width)
      {
        v12 = 0;
        v13 = v10;
        v14 = __p[0];
        do
        {
          v15 = v12 + width * v10;
          v16 = v15 >> 6;
          v17 = 1 << v15;
          if ((v14[v16] & (1 << v15)) == 0
            && *(float *)((char *)a3->data + 4 * v12 + a3->rowBytes * v13) > a4)
          {
            v49 = v8;
            x = *MEMORY[0x1E0C9D628];
            y = *(double *)(MEMORY[0x1E0C9D628] + 8);
            v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
            v20 = *(double *)(MEMORY[0x1E0C9D628] + 24);
            v22 = __p[1];
            v53 = 0u;
            v54 = 0u;
            v52 = 0u;
            v51 = __PAIR64__(v10, v12);
            std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
            while (*((_QWORD *)&v54 + 1))
            {
              v23 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v52 + 1) + (((unint64_t)v54 >> 6) & 0x3FFFFFFFFFFFFF8))
                              + 8 * (v54 & 0x1FF));
              *(_QWORD *)&v54 = v54 + 1;
              --*((_QWORD *)&v54 + 1);
              if ((unint64_t)v54 >= 0x400)
              {
                operator delete(**((void ***)&v52 + 1));
                *((_QWORD *)&v52 + 1) += 8;
                *(_QWORD *)&v54 = v54 - 512;
              }
              if ((unint64_t)v22 > (v23 + LODWORD(a3->width) * HIDWORD(v23)))
              {
                v24 = (unint64_t)(v23 + LODWORD(a3->width) * HIDWORD(v23)) >> 6;
                v25 = 1 << (v23 + LOBYTE(a3->width) * BYTE4(v23));
                v26 = *((_QWORD *)__p[0] + v24);
                if ((v26 & v25) == 0)
                {
                  *((_QWORD *)__p[0] + v24) = v26 | v25;
                  if (*(float *)((char *)a3->data + 4 * v23 + a3->rowBytes * HIDWORD(v23)) > a4)
                  {
                    v58.origin.x = (float)v23;
                    v58.origin.y = (float)HIDWORD(v23);
                    v58.size.width = 0.0;
                    v58.size.height = 0.0;
                    v55.origin.x = x;
                    v55.origin.y = y;
                    v55.size.width = v21;
                    v55.size.height = v20;
                    v56 = CGRectUnion(v55, v58);
                    x = v56.origin.x;
                    y = v56.origin.y;
                    v21 = v56.size.width;
                    v20 = v56.size.height;
                    if (a3->width > (v23 + 1))
                    {
                      LODWORD(v51) = v23 + 1;
                      HIDWORD(v51) = HIDWORD(v23);
                      std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
                    }
                    if ((_DWORD)v23)
                    {
                      LODWORD(v51) = v23 - 1;
                      HIDWORD(v51) = HIDWORD(v23);
                      std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
                    }
                    if (a3->height > (HIDWORD(v23) + 1))
                    {
                      v51 = v23 + 0x100000000;
                      std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
                    }
                    if (HIDWORD(v23))
                    {
                      v51 = v23 - 0x100000000;
                      std::deque<std::pair<unsigned int,unsigned int>>::emplace_back<std::pair<unsigned int,unsigned int>>(&v52, &v51);
                    }
                  }
                }
              }
            }
            v27 = (double)a3->height - (y + v20);
            std::deque<std::pair<int,int>>::~deque[abi:ne180100]((uint64_t)&v52);
            v57.origin.x = x;
            v57.origin.y = v27;
            v57.size.width = v21;
            v57.size.height = v20;
            v8 = v49;
            if (!CGRectIsEmpty(v57))
            {
              if ((unint64_t)v9 >= v48)
              {
                v28 = ((char *)v9 - (char *)v49) >> 5;
                v29 = v28 + 1;
                if ((unint64_t)(v28 + 1) >> 59)
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                if ((uint64_t)(v48 - (_QWORD)v49) >> 4 > v29)
                  v29 = (uint64_t)(v48 - (_QWORD)v49) >> 4;
                if (v48 - (unint64_t)v49 >= 0x7FFFFFFFFFFFFFE0)
                  v30 = 0x7FFFFFFFFFFFFFFLL;
                else
                  v30 = v29;
                if (v30)
                  v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v30);
                else
                  v31 = 0;
                v32 = (CGFloat *)(v30 + 32 * v28);
                *v32 = x;
                v32[1] = v27;
                v32[2] = v21;
                v32[3] = v20;
                if (v9 == v49)
                {
                  v35 = v30 + 32 * v28;
                }
                else
                {
                  v33 = v30 + 32 * v28;
                  do
                  {
                    v34 = *((_OWORD *)v9 - 1);
                    v35 = v33 - 32;
                    *(_OWORD *)(v33 - 32) = *((_OWORD *)v9 - 2);
                    *(_OWORD *)(v33 - 16) = v34;
                    v9 -= 4;
                    v33 -= 32;
                  }
                  while (v9 != v49);
                }
                v48 = v30 + 32 * v31;
                v9 = v32 + 4;
                if (v49)
                  operator delete(v49);
                v8 = (double *)v35;
              }
              else
              {
                *v9 = x;
                v9[1] = v27;
                v9[2] = v21;
                v9[3] = v20;
                v9 += 4;
              }
            }
            v13 = v10;
          }
          v14 = __p[0];
          *((_QWORD *)__p[0] + v16) |= v17;
          ++v12;
          width = a3->width;
        }
        while (v12 < width);
        height = a3->height;
      }
      ++v10;
    }
    while (v10 < height);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  if (__p[0])
    operator delete(__p[0]);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ((char *)v9 - (char *)v8) >> 5);
  if (v9 != v8)
  {
    if ((unint64_t)(((char *)v9 - (char *)v8) >> 5) <= 1)
      v37 = 1;
    else
      v37 = ((char *)v9 - (char *)v8) >> 5;
    v38 = v8;
    v39 = v8 + 2;
    do
    {
      v52 = 0u;
      v53 = 0u;
      v40 = 0.0;
      v41 = 0.0;
      v42 = 0.0;
      v43 = a3->width;
      if (v43)
      {
        v41 = *(v39 - 2) / (double)v43;
        v42 = *v39 / (double)v43;
      }
      v44 = a3->height;
      v45 = 0.0;
      if (v44)
      {
        v40 = *(v39 - 1) / (double)v44;
        v45 = v39[1] / (double)v44;
      }
      *(double *)&v52 = v41;
      *((double *)&v52 + 1) = v40;
      *(double *)&v53 = v42;
      *((double *)&v53 + 1) = v45;
      objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v52, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v46);

      v39 += 4;
      --v37;
    }
    while (v37);
    goto LABEL_62;
  }
  v38 = v8;
  if (v8)
LABEL_62:
    operator delete(v38);
  return v36;
}

+ (id)significantRegionsFromFloat32ImageBuffer:(vImage_Buffer *)a3 threshold:(float)a4 relativeToMaximum:(BOOL)a5
{
  __int128 v8;
  float v9;
  __int128 v10;
  _OWORD v12[2];
  _OWORD v13[2];

  if (a5)
  {
    v8 = *(_OWORD *)&a3->width;
    v13[0] = *(_OWORD *)&a3->data;
    v13[1] = v8;
    objc_msgSend(a1, "maximumValueFromFloat32ImageBuffer:", v13);
    a4 = v9 * a4;
  }
  v10 = *(_OWORD *)&a3->width;
  v12[0] = *(_OWORD *)&a3->data;
  v12[1] = v10;
  objc_msgSend(a1, "significantRegionsFromFloat32ImageBuffer:threshold:", v12, COERCE_DOUBLE(__PAIR64__(DWORD1(v12[0]), LODWORD(a4))));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)significantRegionsFromFloat32PixelBuffer:(__CVBuffer *)a3 threshold:(float)a4 relativeToMaximum:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  double v15;
  _QWORD v17[4];

  if (!a3)
  {
    if (a6)
    {
      v13 = CFSTR("pixelBuffer cannot be null");
LABEL_10:
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v13, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_12:
    v14 = 0;
    return v14;
  }
  v7 = a5;
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226534)
  {
    if (a6)
    {
      v13 = CFSTR("pixelBuffer is not in correct format. (Required format is one component, 32-float)");
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (!(_DWORD)v11)
  {
    v17[0] = CVPixelBufferGetBaseAddress(a3);
    v17[1] = CVPixelBufferGetHeight(a3);
    v17[2] = CVPixelBufferGetWidth(a3);
    v17[3] = CVPixelBufferGetBytesPerRow(a3);
    *(float *)&v15 = a4;
    objc_msgSend(a1, "significantRegionsFromFloat32ImageBuffer:threshold:relativeToMaximum:", v17, v7, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    return v14;
  }
  if (!a6)
    goto LABEL_12;
  +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v11, CFSTR("unable to lock base address of pixelBuffer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v14 = 0;
  *a6 = v12;
  return v14;
}

+ (id)boundingBoxesFromFloat32ImageBuffer:(vImage_Buffer *)a3 thresholds:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  void *v10;
  uint64_t v11;
  VNHeatMapExtrema *v12;
  void *v13;
  int v14;
  vImagePixelCount height;
  vImagePixelCount v16;
  float *data;
  vImagePixelCount width;
  vImagePixelCount v19;
  float *v20;
  uint64_t v21;
  float v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  unsigned int v30;
  unsigned int v31;
  void *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v40;
  id obj;
  _OWORD v42[2];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v40 = a4;
  v7 = objc_msgSend(v40, "count");
  v8 = v7;
  if (v7)
  {
    v9 = malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    v11 = 0;
    do
    {
      v12 = objc_alloc_init(VNHeatMapExtrema);
      objc_msgSend(v10, "addObject:", v12);
      objc_msgSend(v40, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v9[v11] = v14;

      ++v11;
    }
    while (v8 != v11);
    height = a3->height;
    if (height)
    {
      v16 = 0;
      data = (float *)a3->data;
      width = a3->width;
      do
      {
        if (width)
        {
          v19 = 0;
          v20 = data;
          do
          {
            v21 = 0;
            v22 = *v20;
            do
            {
              if (v22 >= *(float *)&v9[v21])
              {
                objc_msgSend(v10, "objectAtIndexedSubscript:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(float *)&v24 = v22;
                objc_msgSend(v23, "updateExtrema:x:y:", v19, v16, v24);

              }
              ++v21;
            }
            while (v8 != v21);
            ++v20;
            ++v19;
            width = a3->width;
          }
          while (v19 < width);
          height = a3->height;
        }
        data = (float *)((char *)data + a3->rowBytes);
        ++v16;
      }
      while (v16 < height);
    }
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v40;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v26)
    {
      v27 = 0;
      v28 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v46 != v28)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "floatValue");
          v31 = v30;
          objc_msgSend(v10, "objectAtIndexedSubscript:", v27 + i);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0u;
          v44 = 0u;
          v33 = *(_OWORD *)&a3->width;
          v42[0] = *(_OWORD *)&a3->data;
          v42[1] = v33;
          objc_msgSend(v32, "computeRectFromExtremaUsingThreshold:vImage:", v42, COERCE_DOUBLE(__PAIR64__(DWORD1(v42[0]), v31)));
          *(_QWORD *)&v43 = v34;
          *((_QWORD *)&v43 + 1) = v35;
          *(_QWORD *)&v44 = v36;
          *((_QWORD *)&v44 + 1) = v37;
          objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v43, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v38);

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        v27 += i;
      }
      while (v26);
    }

    free(v9);
  }
  else if (a5)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("thresholds not provided"));
    v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)boundingBoxesFromFloat32ImageBuffer:(vImage_Buffer *)a3 thresholds:(id)a4 relativeToMaximum:(BOOL)a5 applySmoothing:(BOOL)a6 originalImageSize:(CGSize)a7 sigmaX:(float)a8 sigmaY:(float)a9 nStd:(float)a10 error:(id *)a11
{
  double height;
  double width;
  _BOOL4 v16;
  _BOOL4 v17;
  id v19;
  uint64_t v20;
  vImagePixelCount v21;
  vImagePixelCount v22;
  size_t rowBytes;
  __int128 v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  float v29;
  float v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  float v36;
  double v37;
  void *v38;
  void *v40;
  id v41;
  uint64_t data;
  _QWORD v45[4];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  _OWORD v51[2];
  _QWORD v52[4];
  _BYTE v53[128];
  uint64_t v54;

  height = a7.height;
  width = a7.width;
  v16 = a6;
  v17 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v40 = v19;
  if (v16)
  {
    v41 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3->height * a3->rowBytes));
    v20 = objc_msgSend(v41, "mutableBytes");
    v22 = a3->height;
    v21 = a3->width;
    rowBytes = a3->rowBytes;
    data = v20;
    v52[0] = v20;
    v52[1] = v22;
    v52[2] = v21;
    v52[3] = rowBytes;
    v24 = *(_OWORD *)&a3->width;
    v51[0] = *(_OWORD *)&a3->data;
    v51[1] = v24;
    *(float *)&v25 = a8;
    *(float *)&v26 = a9;
    *(float *)&v27 = a10;
    if ((objc_msgSend(a1, "smoothedFloat32ImageBuffer:fromImageBuffer:originalImageSize:sigmaX:sigmaY:nStd:", v52, v51, width, height, v25, v26, v27) & 1) == 0)
    {
      if (a11)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to generate smoothed float-32 image buffer"));
        v28 = 0;
        *a11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      goto LABEL_17;
    }
  }
  else
  {
    v22 = a3->height;
    v41 = 0;
    data = (uint64_t)a3->data;
    v21 = a3->width;
    rowBytes = a3->rowBytes;
  }
  if (v17)
  {
    v50[0] = data;
    v50[1] = v22;
    v50[2] = v21;
    v50[3] = rowBytes;
    objc_msgSend(a1, "maximumValueFromFloat32ImageBuffer:", v50);
    v30 = v29;
    v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v32 = v19;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v47 != v34)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "floatValue");
          *(float *)&v37 = v30 * v36;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v38);

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      }
      while (v33);
    }

  }
  else
  {
    v31 = v19;
  }
  v45[0] = data;
  v45[1] = v22;
  v45[2] = v21;
  v45[3] = rowBytes;
  objc_msgSend(a1, "boundingBoxesFromFloat32ImageBuffer:thresholds:error:", v45, v31, a11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v28;
}

+ (id)boundingBoxesFromFloat32PixelBuffer:(__CVBuffer *)a3 thresholds:(id)a4 relativeToMaximum:(BOOL)a5 applySmoothing:(BOOL)a6 originalImageSize:(CGSize)a7 sigmaX:(float)a8 sigmaY:(float)a9 nStd:(float)a10 error:(id *)a11
{
  double height;
  double width;
  _BOOL8 v17;
  _BOOL8 v18;
  id v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  _QWORD v30[4];

  height = a7.height;
  width = a7.width;
  v17 = a6;
  v18 = a5;
  v21 = a4;
  if (!a3)
  {
    if (a11)
    {
      v24 = CFSTR("pixelBuffer cannot be null");
LABEL_10:
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_12:
    v25 = 0;
    goto LABEL_14;
  }
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226534)
  {
    if (a11)
    {
      v24 = CFSTR("pixelBuffer is not in correct format. (Required format is one component, 32-float)");
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  v22 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (!(_DWORD)v22)
  {
    v30[0] = CVPixelBufferGetBaseAddress(a3);
    v30[1] = CVPixelBufferGetHeight(a3);
    v30[2] = CVPixelBufferGetWidth(a3);
    v30[3] = CVPixelBufferGetBytesPerRow(a3);
    *(float *)&v26 = a8;
    *(float *)&v27 = a9;
    *(float *)&v28 = a10;
    objc_msgSend(a1, "boundingBoxesFromFloat32ImageBuffer:thresholds:relativeToMaximum:applySmoothing:originalImageSize:sigmaX:sigmaY:nStd:error:", v30, v21, v18, v17, a11, width, height, v26, v27, v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    goto LABEL_14;
  }
  if (!a11)
    goto LABEL_12;
  +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v22, CFSTR("unable to lock base address of pixelBuffer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v25 = 0;
  *a11 = v23;
LABEL_14:

  return v25;
}

@end
