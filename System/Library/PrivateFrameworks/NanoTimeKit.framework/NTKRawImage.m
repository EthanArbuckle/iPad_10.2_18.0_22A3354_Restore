@implementation NTKRawImage

- (NTKRawImage)initWithContent:(NTKRawImage *)self width:(SEL)a2 height:
{
  const float *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  const float *v7;
  NTKRawImage *v8;
  NTKRawImage *v9;
  NTKRawImage *v10;
  objc_super v12;

  v5 = v4;
  v6 = v3;
  v7 = v2;
  v12.receiver = self;
  v12.super_class = (Class)NTKRawImage;
  v8 = -[NTKRawImage init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_contents = v7;
    v8->_width = v6;
    v8->_height = v5;
    v10 = v8;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free((void *)self->_contents);
  v3.receiver = self;
  v3.super_class = (Class)NTKRawImage;
  -[NTKRawImage dealloc](&v3, sel_dealloc);
}

+ (id)rawImageWithImage:(id)a3 width:(int)a4 height:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  int Width;
  int Height;
  NTKRawImage *v11;
  int v12;
  char *v13;
  CGColorSpace *v14;
  CGContext *v15;
  unsigned int *v16;
  unsigned int *v17;
  _OWORD *v18;
  __int128 v19;
  _OWORD *v21;
  CGRect v22;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = objc_retainAutorelease(a3);
  v8 = objc_msgSend(v7, "CGImage");
  Width = CGImageGetWidth((CGImageRef)v8);
  Height = CGImageGetHeight((CGImageRef)v8);
  v11 = 0;
  if (v7 && Width >= 1 && Height >= 1)
  {
    v21 = malloc_type_malloc(16 * (int)v6 * (uint64_t)(int)v5, 0x1000040451B5BE8uLL);
    v12 = v5 * v6;
    if ((int)v5 * (int)v6 < 1)
      v13 = 0;
    else
      v13 = (char *)malloc_type_malloc(4 * (v5 * v6), 0x100004052888210uLL);
    v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v15 = CGBitmapContextCreate(v13, (int)v6, (int)v5, 8uLL, (4 * v6), v14, 1u);
    bzero(v13, 4 * v12);
    v22.size.width = (double)(int)v6;
    v22.size.height = (double)(int)v5;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    CGContextDrawImage(v15, v22, (CGImageRef)v8);
    if (v12 >= 1)
    {
      v16 = (unsigned int *)&v13[4 * v12];
      v17 = (unsigned int *)v13;
      v18 = v21;
      do
      {
        v8 = v8 & 0xFFFFFFFF00000000 | *v17;
        CLKUIConvertToRGBfFromSRGB8_fast();
        *v18++ = v19;
        ++v17;
      }
      while (v17 < v16);
    }
    CGContextRelease(v15);
    CGColorSpaceRelease(v14);
    v11 = -[NTKRawImage initWithContent:width:height:]([NTKRawImage alloc], "initWithContent:width:height:", v21, v6, v5);
    free(v13);
  }

  return v11;
}

- (id)scaleToWidth:(int)a3 height:(int)a4
{
  uint64_t height;
  uint64_t width;
  uint64_t v9;
  float32x4_t *v10;
  float v11;
  const float *contents;
  float v13;
  float32x4_t *v14;
  int v16;
  int v17;
  int v18;
  size_t v19;
  float *v20;
  int *v21;
  _DWORD *v22;
  _DWORD *v23;
  uint64_t v24;
  float v25;
  int v26;
  int v27;
  float v28;
  int v29;
  int v30;
  float v31;
  float v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  float *v38;
  uint64_t v39;
  float32x4_t v40;
  int *v41;
  float *v42;
  uint64_t v43;
  float32x4_t v44;
  uint64_t i;
  float v46;
  int v47;
  int v48;
  float v49;
  int v50;
  int v51;
  float v52;
  float v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  float *v59;
  uint64_t v60;
  float32x4_t v61;
  int *v62;
  float *v63;
  int v64;
  float32x4_t v65;
  float v66;
  NTKRawImage *v67;
  float32x4_t *v68;
  int v69;
  int v70;
  int v71;
  float v72;
  float v73;
  int *v74;
  float *v75;
  uint64_t v76;

  height = self->_height;
  width = self->_width;
  if ((_DWORD)width == a3 && (_DWORD)height == a4)
    return self;
  v9 = *(_QWORD *)&a3;
  v10 = (float32x4_t *)malloc_type_malloc(16 * a3 * (uint64_t)a4, 0x1000040451B5BE8uLL);
  v11 = (float)(int)v9 / (float)(int)width;
  contents = self->_contents;
  v13 = (float)a4 / (float)(int)height;
  if ((int)height * (int)v9 < 1)
    v14 = 0;
  else
    v14 = (float32x4_t *)malloc_type_malloc(16 * (height * v9), 0x1000040451B5BE8uLL);
  v72 = 1.0 / v11;
  v73 = 1.0 / v13;
  v16 = (int)(float)((float)((float)(1.0 / v13) * 2.0) + 1.0);
  v69 = (int)(float)((float)((float)(1.0 / v11) * 2.0) + 1.0);
  v70 = v16;
  if (v69 > v16)
    v16 = (int)(float)((float)((float)(1.0 / v11) * 2.0) + 1.0);
  if ((int)v9 <= a4)
    v17 = a4;
  else
    v17 = v9;
  v18 = v16 * v17;
  if (v18 < 1)
  {
    v20 = 0;
    v21 = 0;
  }
  else
  {
    v19 = 4 * v18;
    v20 = (float *)malloc_type_malloc(v19, 0x100004052888210uLL);
    v21 = (int *)malloc_type_malloc(v19, 0x100004052888210uLL);
  }
  v74 = v21;
  v75 = v20;
  v76 = height;
  v71 = a4;
  if (v17 < 1)
  {
    v22 = 0;
    v23 = 0;
  }
  else
  {
    v22 = malloc_type_malloc(4 * v17, 0x100004052888210uLL);
    v23 = malloc_type_malloc(4 * v17, 0x100004052888210uLL);
  }
  v68 = v10;
  if ((int)v9 >= 1)
  {
    v24 = 0;
    do
    {
      v23[v24] = 0;
      v22[v24] = 0;
      v25 = (float)(int)v24 / v11;
      v26 = (int)(float)((float)(v25 + 0.5) - v72);
      v27 = (int)(float)((float)v26 + (float)(v72 * 2.0));
      v28 = 0.0;
      if (v26 <= v27)
      {
        v29 = 0;
        v30 = v27 + 1;
        do
        {
          if ((v26 & 0x80000000) == 0 && v26 < (int)width)
          {
            v31 = v11 * (float)(v25 - (float)v26);
            if (v31 > -1.0 && v31 < 1.0)
            {
              v33 = (float)(cosf(v31 * 3.1416) + 1.0) * 0.5;
              if (v33 > 0.0)
              {
                v74[v24 * v69 + v29] = v26;
                v75[v24 * v69 + v29] = v33;
                v28 = v33 + *(float *)&v22[v24];
                *(float *)&v22[v24] = v28;
                v29 = v23[v24] + 1;
                v23[v24] = v29;
              }
            }
          }
          ++v26;
        }
        while (v30 != v26);
      }
      *(float *)&v22[v24++] = 1.0 / v28;
    }
    while (v24 != v9);
  }
  if ((int)v76 >= 1)
  {
    v34 = 0;
    v35 = 4 * v69;
    do
    {
      if ((int)v9 >= 1)
      {
        v36 = 0;
        v37 = v74;
        v38 = v75;
        do
        {
          v39 = v23[v36];
          v40 = 0uLL;
          if ((int)v39 >= 1)
          {
            v41 = v37;
            v42 = v38;
            do
            {
              v43 = *v41++;
              v44 = *(float32x4_t *)&contents[4 * v34 * width + 4 * v43];
              *(float *)&v43 = *v42++;
              v40 = vmlaq_n_f32(v40, v44, *(float *)&v43);
              --v39;
            }
            while (v39);
          }
          v14[v36 + v34 * (int)v9] = vmulq_n_f32(v40, *(float *)&v22[v36]);
          ++v36;
          v38 = (float *)((char *)v38 + v35);
          v37 = (int *)((char *)v37 + v35);
        }
        while (v36 != v9);
      }
      ++v34;
    }
    while (v34 != v76);
  }
  if (v71 >= 1)
  {
    for (i = 0; i != v71; *(float *)&v22[i++] = 1.0 / v49)
    {
      v23[i] = 0;
      v22[i] = 0;
      v46 = (float)(int)i / v13;
      v47 = (int)(float)((float)(v46 + 0.5) - v73);
      v48 = (int)(float)((float)v47 + (float)(v73 * 2.0));
      v49 = 0.0;
      if (v47 <= v48)
      {
        v50 = 0;
        v51 = v48 + 1;
        do
        {
          if ((v47 & 0x80000000) == 0 && v47 < (int)v76)
          {
            v52 = v13 * (float)(v46 - (float)v47);
            if (v52 > -1.0 && v52 < 1.0)
            {
              v54 = (float)(cosf(v52 * 3.1416) + 1.0) * 0.5;
              if (v54 > 0.0)
              {
                v74[i * v70 + v50] = v47;
                v75[i * v70 + v50] = v54;
                v49 = v54 + *(float *)&v22[i];
                *(float *)&v22[i] = v49;
                v50 = v23[i] + 1;
                v23[i] = v50;
              }
            }
          }
          ++v47;
        }
        while (v51 != v47);
      }
    }
  }
  if ((int)v9 >= 1)
  {
    v55 = 0;
    v56 = 4 * v70;
    do
    {
      if (v71 >= 1)
      {
        v57 = 0;
        v58 = v74;
        v59 = v75;
        do
        {
          v60 = v23[v57];
          v61 = 0uLL;
          if ((int)v60 >= 1)
          {
            v62 = v58;
            v63 = v59;
            do
            {
              v64 = *v62++;
              v65 = v14[v55 + v64 * (uint64_t)(int)v9];
              v66 = *v63++;
              v61 = vmlaq_n_f32(v61, v65, v66);
              --v60;
            }
            while (v60);
          }
          v68[v55 + v57 * (int)v9] = vmulq_n_f32(v61, *(float *)&v22[v57]);
          ++v57;
          v59 = (float *)((char *)v59 + v56);
          v58 = (int *)((char *)v58 + v56);
        }
        while (v57 != v71);
      }
      ++v55;
    }
    while (v55 != v9);
  }
  v67 = -[NTKRawImage initWithContent:width:height:]([NTKRawImage alloc], "initWithContent:width:height:", v68, v9, v71);
  free(v23);
  free(v22);
  free(v74);
  free(v75);
  free(v14);
  return v67;
}

- (void)write:(id)a3
{
  id v4;
  int width;
  int height;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const void *v11;
  int v12;
  int v13;

  v4 = a3;
  width = self->_width;
  height = self->_height;
  v12 = height * width;
  v13 = height * width;
  v10 = v4;
  if (height * width <= 0)
  {
    v9 = v4;
    v7 = 0;
    v11 = 0;
  }
  else
  {
    v7 = malloc_type_malloc(4 * (height * width), 0x100004052888210uLL);
    width = self->_width;
    height = self->_height;
    v11 = v7;
    if (height * width >= 1)
    {
      v8 = 0;
      do
      {
        *((_DWORD *)v7 + v8++) = CLKUIConvertToSRGB8FromRGBf_fast();
        width = self->_width;
        height = self->_height;
      }
      while (v8 < height * width);
    }
    v9 = v10;
  }
  _NTKRawWriteToFile(&v11, width, height, v9);
  free(v7);

}

- (const)contents
{
  return self->_contents;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

@end
