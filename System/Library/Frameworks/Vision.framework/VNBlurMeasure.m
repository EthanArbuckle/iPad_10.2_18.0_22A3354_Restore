@implementation VNBlurMeasure

+ (BOOL)computeBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 andWithRegionOfInterestInImageCoordinates:(CGRect)a5 andRegionOfInterestInsetFactor:(float)a6 error:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v15;
  size_t v16;
  unint64_t v17;
  size_t v18;
  unint64_t v19;
  unint64_t v20;
  size_t BytesPerRow;
  void **v22;
  unint64_t v23;
  void *v24;
  _QWORD v26[4];
  _BYTE v27[36];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  *(_DWORD *)v27 = 1065353216;
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  v15 = (unint64_t)(y + height + 0.5);
  v16 = CVPixelBufferGetHeight(a4);
  if (x >= 0.0)
    v17 = (unint64_t)(x + 0.5);
  else
    v17 = 0;
  if (v16 >= v15)
    v18 = v16 - v15;
  else
    v18 = 0;
  if (height >= 0.0)
    v19 = (unint64_t)(height + 0.5);
  else
    v19 = 0;
  if (width >= 0.0)
    v20 = (unint64_t)(width + 0.5);
  else
    v20 = 0;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  v26[0] = (char *)CVPixelBufferGetBaseAddress(a4) + v18 * BytesPerRow + v17;
  v26[1] = v19;
  v26[2] = v20;
  v26[3] = BytesPerRow;
  v23 = vision::mod::image_quality::BlurMeasure::computeEdgeBasedBlurScoreForPlanar8Image((vision::mod::image_quality::BlurMeasure *)v26, (vImage_Buffer *)v27, 0, a6, 0, 0, v22);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  if (v23 == 2688)
  {
    if (a3)
      *a3 = *(float *)v27;
  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while computing blur score: %s"), CVML_getStatusDescription(v23));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v24);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v23 == 2688;
}

+ (BOOL)computeBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 insetFactor:(float)a5 error:(id *)a6
{
  double Width;
  double Height;
  double v13;

  Width = (double)CVPixelBufferGetWidth(a4);
  Height = (double)CVPixelBufferGetHeight(a4);
  *(float *)&v13 = a5;
  return objc_msgSend(a1, "computeBlurScore:onGrayscaleImage:andWithRegionOfInterestInImageCoordinates:andRegionOfInterestInsetFactor:error:", a3, a4, a6, 0.0, 0.0, Width, Height, v13);
}

+ (BOOL)computeBlurScore:(float *)a3 usingBlurSignature:(id)a4 insetFactor:(float)a5 imageROI:(CGRect)a6 error:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  vision::mod::image_quality::BlurMeasure *v15;
  int *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v21;
  _Geometry2D_rect2D_ v22;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a4;
  v21 = 1065353216;
  v15 = (vision::mod::image_quality::BlurMeasure *)objc_msgSend(v14, "getSignatureData");
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.height = height;
  v22.size.width = width;
  v17 = vision::mod::image_quality::BlurMeasure::computeEdgeBasedBlurForImageRegionUsingBlurSignature(v15, (float *)&v21, v22, 0, a5, 0, v16);
  v18 = v17;
  if (v17 == 2688)
  {
    if (a3)
      *(_DWORD *)a3 = v21;
  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while computing blur score: %s"), CVML_getStatusDescription(v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v19);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v18 == 2688;
}

+ (BOOL)computeEdgeWidthBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 error:(id *)a5
{
  size_t Width;
  size_t Height;
  char *v9;
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  size_t v12;
  size_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  size_t v23;
  char *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  int v37;
  char *v38;
  uint64_t v39;
  int v40;
  int v41;
  BOOL v42;
  unsigned int v43;
  BOOL v44;
  int v45;
  int v46;
  BOOL v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  unsigned __int8 *v54;
  uint64_t v55;
  int v56;
  int v57;
  BOOL v58;
  unsigned __int8 *v59;
  unsigned int v60;
  BOOL v61;
  int v62;
  int v63;
  BOOL v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  float v70;
  float v71;

  CVPixelBufferLockBaseAddress(a4, 1uLL);
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v9 = (char *)malloc_type_malloc(Height * Width, 0x69E79101uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  v12 = Width - 2;
  v13 = Height - 2;
  if (Height == 2)
  {
    v37 = 0;
    v36 = 0;
    if (Width == 2)
      goto LABEL_72;
    goto LABEL_43;
  }
  v14 = 0;
  v15 = BaseAddressOfPlane + 1;
  v16 = BaseAddressOfPlane + 2;
  do
  {
    if (Width == 2)
    {
      v17 = v14 + 1;
    }
    else
    {
      v17 = v14 + 1;
      v18 = v14 + 2;
      v19 = &v9[v14 * Width];
      v20 = &v15[v14 * BytesPerRowOfPlane];
      v21 = &v16[BytesPerRowOfPlane * (v14 + 1)];
      v22 = &v16[BytesPerRowOfPlane * v18];
      v23 = Width - 2;
      v24 = v20;
      do
      {
        v25 = *(v20 - 1);
        v27 = *++v24;
        v26 = v27;
        v28 = *(v21 - 2);
        v29 = *v21++;
        v30 = *(v22 - 2);
        v31 = *v22;
        v32 = v26 - (v25 + v30) + v31 + 2 * (v29 - v28);
        v33 = v30 - (v26 + v25) + v31 + 2 * (*(v22 - 1) - *v20);
        v34 = (v32 * v32 + v33 * v33) >> 4;
        if (v34 >= 0xFF)
          LOBYTE(v34) = -1;
        *v19++ = v34;
        ++v22;
        v20 = v24;
        --v23;
      }
      while (v23);
    }
    v14 = v17;
  }
  while (v17 != v13);
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = v9;
  do
  {
    if (Width != 2)
    {
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      do
      {
        v43 = v38[v39];
        v44 = v43 > 0x63;
        if (v43 < 0x64)
        {
          v50 = v42 && v41 > 0;
          v51 = v39 + v36 - v41;
          if ((int)v39 - v41 < 3)
            v52 = v37;
          else
            v52 = v37 + 1;
          if ((int)v39 - v41 < 3)
            v51 = v36;
          if (v50 == 1)
          {
            v37 = v52;
            v36 = v51;
          }
        }
        else
        {
          v45 = v39 - v41 + v36;
          if ((int)v39 - v41 < 3)
            v46 = v37;
          else
            v46 = v37 + 1;
          if ((int)v39 - v41 < 3)
            v45 = v36;
          if (v41 < 1)
          {
            v46 = v37;
            v45 = v36;
          }
          v47 = v40 == 1;
          if (v40 == 1)
            v48 = v37;
          else
            v48 = v46;
          if (v47)
          {
            v45 = v36;
            v49 = 1;
          }
          else
          {
            v49 = 0;
          }
          if (v42)
          {
            v37 = v48;
            v36 = v45;
            v40 = v49;
          }
          else
          {
            v41 = v39;
            v40 = 1;
          }
        }
        ++v39;
        v42 = v44;
      }
      while (v12 != v39);
    }
    ++v35;
    v38 += Width;
  }
  while (v35 != v13);
  if (Width != 2)
  {
LABEL_43:
    v53 = 0;
    v54 = (unsigned __int8 *)v9;
    do
    {
      if (Height != 2)
      {
        v55 = 0;
        v56 = 0;
        v57 = 0;
        v58 = 0;
        v59 = v54;
        do
        {
          v60 = *v59;
          v61 = v60 > 0x63;
          if (v60 < 0x64)
          {
            v67 = v58 && v57 > 0;
            v68 = v55 + v36 - v57;
            if ((int)v55 - v57 < 3)
              v69 = v37;
            else
              v69 = v37 + 1;
            if ((int)v55 - v57 < 3)
              v68 = v36;
            if (v67 == 1)
            {
              v37 = v69;
              v36 = v68;
            }
          }
          else
          {
            v62 = v55 - v57 + v36;
            if ((int)v55 - v57 < 3)
              v63 = v37;
            else
              v63 = v37 + 1;
            if ((int)v55 - v57 < 3)
              v62 = v36;
            if (v57 < 1)
            {
              v63 = v37;
              v62 = v36;
            }
            v64 = v56 == 1;
            if (v56 == 1)
              v65 = v37;
            else
              v65 = v63;
            if (v64)
            {
              v62 = v36;
              v66 = 1;
            }
            else
            {
              v66 = 0;
            }
            if (v58)
            {
              v37 = v65;
              v36 = v62;
              v56 = v66;
            }
            else
            {
              v57 = v55;
              v56 = 1;
            }
          }
          v59 += Width;
          ++v55;
          v58 = v61;
        }
        while (v13 != v55);
      }
      ++v53;
      ++v54;
    }
    while (v53 != v12);
  }
LABEL_72:
  v70 = 0.0;
  if (Height + Width <= v37)
    v70 = 4.0 / (float)((float)v36 / (float)v37);
  v71 = fmaxf(1.0 - v70, 0.0);
  if (v71 > 1.0)
    v71 = 1.0;
  *a3 = v71;
  free(v9);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  return 1;
}

+ (BOOL)computeApproximateBlurScore:(float *)a3 onGrayscaleImage:(__CVBuffer *)a4 sampledPixelsCount:(int)a5 insetFactor:(float)a6 error:(id *)a7
{
  unsigned __int8 *Width;
  int Height;
  int *BytesPerRow;
  _anonymous_namespace_ *BaseAddress;
  float *v16;
  unint64_t v17;
  void *v18;
  int *v20;
  int *v21;

  HIDWORD(v21) = 1065353216;
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  Width = (unsigned __int8 *)CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  BytesPerRow = (int *)CVPixelBufferGetBytesPerRow(a4);
  BaseAddress = (_anonymous_namespace_ *)CVPixelBufferGetBaseAddress(a4);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  if (v17 == 2688)
  {
    if (a3)
      *a3 = *((float *)&v21 + 1);
  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while computing blur score: %s"), CVML_getStatusDescription(v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17 == 2688;
}

+ (BOOL)computeApproximateBlurScore:(float *)a3 onRGBAImage:(__CVBuffer *)a4 sampledPixelsCount:(int)a5 insetFactor:(float)a6 error:(id *)a7
{
  unsigned __int8 *Width;
  int Height;
  int *BytesPerRow;
  _anonymous_namespace_ *BaseAddress;
  float *v16;
  unint64_t v17;
  void *v18;
  int *v20;
  int *v21;

  HIDWORD(v21) = 1065353216;
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  Width = (unsigned __int8 *)CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  BytesPerRow = (int *)CVPixelBufferGetBytesPerRow(a4);
  BaseAddress = (_anonymous_namespace_ *)CVPixelBufferGetBaseAddress(a4);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  if (v17 == 2688)
  {
    if (a3)
      *a3 = *((float *)&v21 + 1);
  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while computing blur score: %s"), CVML_getStatusDescription(v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 3, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17 == 2688;
}

@end
