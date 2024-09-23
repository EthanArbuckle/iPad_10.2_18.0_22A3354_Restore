@implementation CIBilateralGridHash

- (int)countVertices
{
  return self->_hash_table_size;
}

- (int)countDims
{
  return self->_n_dims;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (int)sigma_s
{
  return self->_sigma_s;
}

- (int)sigma_r_luma
{
  return self->_sigma_r_luma;
}

- (int)sigma_r_chroma
{
  return self->_sigma_r_chroma;
}

- (CIBilateralGridHash)initWithWidth:(int)a3 height:(int)a4 maxHashTableSize:(unint64_t)a5
{
  CIBilateralGridHash *v8;
  CIBilateralGridHash *v9;
  size_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CIBilateralGridHash;
  v8 = -[CIBilateralGridHash init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_n_dims = 0;
    v8->_width = a3;
    v8->_height = a4;
    v8->_sigma_s = 0;
    *(_QWORD *)&v8->_sigma_r_luma = 0;
    v8->_max_hash_table_size = a5;
    v8->_hash_table_size = 0;
    v10 = 4 * a4 * a3;
    v8->_hash_matrix_data = (unsigned int *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_hash_table = ($ABC56A0A3CBBD8239319071184D304B7 *)malloc_type_malloc(24 * a5, 0x1000040504FFAC1uLL);
    v9->_blur_indices = (unsigned int *)malloc_type_malloc(40 * a5, 0x100004052888210uLL);
    v9->_coord_indices = (unsigned int *)malloc_type_malloc(4 * a5 + 4, 0x100004052888210uLL);
    v9->_coord_table = (unsigned int *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_coord_indices_off = (unsigned int *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
    v9->_interp_indices = (unsigned int *)malloc_type_malloc(4 * a5 + 4, 0x100004052888210uLL);
    v9->_interp_table = (unsigned int *)malloc_type_malloc(20 * a5, 0x100004052888210uLL);
    v9->_interp_pad = (char *)malloc_type_malloc(5 * a5, 0x100004077774924uLL);
    v9->_hash_map = (BGHashMapContext *)BGHashMapCreate(a5);
    bzero(v9->_hash_matrix_data, v10);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_hash_matrix_data);
  free(self->_hash_table);
  free(self->_blur_indices);
  free(self->_coord_indices);
  free(self->_coord_table);
  free(self->_coord_indices_off);
  free(self->_interp_indices);
  free(self->_interp_table);
  free(self->_interp_pad);
  BGHashMapRelease(self->_hash_map);
  v3.receiver = self;
  v3.super_class = (Class)CIBilateralGridHash;
  -[CIBilateralGridHash dealloc](&v3, sel_dealloc);
}

- (void)clear
{
  *(_QWORD *)&self->_sigma_r_luma = 0;
  self->_sigma_s = 0;
  self->_hash_table_size = 0;
  BGHashClear((uint64_t)self->_hash_map);
}

- (int)_createWithSurface:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  int v21;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a4.size.height;
  v16 = a4.size.width;
  v17 = a4.origin.y;
  v18 = a4.origin.x;
  -[CIBilateralGridHash clear](self, "clear");
  if (-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](self, "_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", a3, v10, v9, v8, v18, v17, v16, v15, x, y, width, height))
  {
    v21 = self->_height * self->_width;
    self->_hash_table_size = 0;
    bzero(self->_hash_matrix_data, 4 * v21);
    return 1;
  }
  else
  {
    -[CIBilateralGridHash _computeBlurIndices](self, "_computeBlurIndices");
    -[CIBilateralGridHash _computeCoordIndices](self, "_computeCoordIndices");
    -[CIBilateralGridHash _computeInterpIndices](self, "_computeInterpIndices");
    return 0;
  }
}

- (int)createWithSurface:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  int result;
  NSObject *v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v8 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4.size.height;
  v15 = a4.size.width;
  v16 = a4.origin.y;
  v17 = a4.origin.x;
  v24 = *MEMORY[0x1E0C80C00];
  result = -[CIBilateralGridHash _createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](self, "_createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", a3, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
  if (result)
  {
    ci_logger_performance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = 136446210;
      v23 = "-[CIBilateralGridHash createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]";
      _os_log_impl(&dword_1921E4000, v21, OS_LOG_TYPE_INFO, "%{public}s Using 3D bilateral grid hash instead of 5D.", (uint8_t *)&v22, 0xCu);
    }

    return -[CIBilateralGridHash _createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](self, "_createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", a3, v9, v8, 255, v17, v16, v15, v14, x, y, width, height);
  }
  return result;
}

- (void)splat:(__CVBuffer *)a3 pout:(float *)a4
{
  int v7;
  int v8;
  int v9;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  unsigned int *v15;

  v7 = -[CIBilateralGridHash countVertices](self, "countVertices");
  v8 = -[CIBilateralGridHash width](self, "width");
  v9 = -[CIBilateralGridHash height](self, "height");
  CVPixelBufferLockBaseAddress(a3, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  bzero(a4, 4 * v7);
  if (v9 >= 1)
  {
    v12 = 0;
    for (i = 0; i != v9; ++i)
    {
      if (v8 >= 1)
      {
        v14 = 0;
        v15 = &self->_hash_matrix_data[v12];
        do
        {
          a4[v15[v14]] = *(float *)&BaseAddressOfPlane[v14 * 4] + a4[v15[v14]];
          ++v14;
        }
        while (v8 != v14);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v12 += v8;
    }
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
}

- (void)splat_w_mul_x:(__CVBuffer *)a3 inPixelBuffer:(__CVBuffer *)a4 pout:(float *)a5
{
  int v9;
  int v10;
  size_t BytesPerRowOfPlane;
  size_t v12;
  char *BaseAddressOfPlane;
  char *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  unsigned int *v18;
  int v19;

  v19 = -[CIBilateralGridHash countVertices](self, "countVertices");
  v9 = -[CIBilateralGridHash width](self, "width");
  v10 = -[CIBilateralGridHash height](self, "height");
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v12 = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v14 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  bzero(a5, 4 * v19);
  if (v10 >= 1)
  {
    v15 = 0;
    for (i = 0; i != v10; ++i)
    {
      if (v9 >= 1)
      {
        v17 = 0;
        v18 = &self->_hash_matrix_data[v15];
        do
        {
          a5[v18[v17]] = a5[v18[v17]] + (float)(*(float *)&BaseAddressOfPlane[v17 * 4] * *(float *)&v14[v17 * 4]);
          ++v17;
        }
        while (v9 != v17);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v14 += v12;
      v15 += v9;
    }
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CVPixelBufferUnlockBaseAddress(a4, 0);
}

- (void)slice:(const float *)a3 outPixelBuffer:(__CVBuffer *)a4
{
  int v7;
  int v8;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unsigned int *v14;

  v7 = -[CIBilateralGridHash width](self, "width");
  v8 = -[CIBilateralGridHash height](self, "height");
  CVPixelBufferLockBaseAddress(a4, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  if (v8 >= 1)
  {
    v11 = 0;
    for (i = 0; i != v8; ++i)
    {
      if (v7 >= 1)
      {
        v13 = 0;
        v14 = &self->_hash_matrix_data[v11];
        do
        {
          *(float *)&BaseAddressOfPlane[v13 * 4] = a3[v14[v13]];
          ++v13;
        }
        while (v7 != v13);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v11 += v7;
    }
  }
  CVPixelBufferUnlockBaseAddress(a4, 0);
}

- (void)slice_trilinear:(__IOSurface *)a3 pin:(const float *)a4 pout:(__CVBuffer *)a5
{
  int v9;
  int v10;
  size_t BytesPerRow;
  size_t BytesPerRowOfPlane;
  _BYTE *BaseAddress;
  float *BaseAddressOfPlane;
  float v15;
  uint64_t i;
  uint64_t v17;
  float sigma_s;
  float sigma_r_luma;
  float v20;
  unsigned int *hash_matrix_data;
  unsigned int *interp_indices;
  float v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  unsigned int *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  char v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  uint32_t seed;

  v9 = -[CIBilateralGridHash width](self, "width");
  v10 = -[CIBilateralGridHash height](self, "height");
  seed = 0;
  IOSurfaceLock(a3, 1u, &seed);
  CVPixelBufferLockBaseAddress(a5, 0);
  BytesPerRow = IOSurfaceGetBytesPerRow(a3);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a5, 0);
  BaseAddress = IOSurfaceGetBaseAddress(a3);
  BaseAddressOfPlane = (float *)CVPixelBufferGetBaseAddressOfPlane(a5, 0);
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      if (v9 >= 1)
      {
        v17 = 0;
        sigma_s = (float)self->_sigma_s;
        sigma_r_luma = (float)self->_sigma_r_luma;
        v20 = (float)((float)(int)i / sigma_s) - (float)(int)(float)((float)(int)i / sigma_s);
        hash_matrix_data = self->_hash_matrix_data;
        interp_indices = self->_interp_indices;
        do
        {
          LOBYTE(v15) = BaseAddress[4 * v17 + 2];
          v23 = (float)((float)(int)v17 / sigma_s) - (float)(int)(float)((float)(int)v17 / sigma_s);
          v24 = hash_matrix_data[v17 + i * v9];
          v25 = interp_indices[v24];
          v15 = (float)((float)LODWORD(v15) / sigma_r_luma) - (float)(int)(float)((float)LODWORD(v15) / sigma_r_luma);
          v26 = interp_indices[(v24 + 1)];
          v27 = (float)((float)(1.0 - v23) * (float)(1.0 - v20)) * (float)(1.0 - v15);
          v28 = a4[v24] * v27;
          if (v25 < v26)
          {
            v29 = &self->_interp_table[v25];
            v30 = &self->_interp_pad[v25];
            v31 = v26 - v25;
            do
            {
              v33 = *v29++;
              v32 = v33;
              LOBYTE(v33) = *v30++;
              v34 = v33;
              if ((v33 & 1) != 0)
                v35 = (float)((float)(int)v17 / sigma_s) - (float)(int)(float)((float)(int)v17 / sigma_s);
              else
                v35 = 1.0 - v23;
              if ((v34 & 2) != 0)
                v36 = (float)((float)(int)i / sigma_s) - (float)(int)(float)((float)(int)i / sigma_s);
              else
                v36 = 1.0 - v20;
              v37 = v35 * v36;
              if ((v34 & 4) != 0)
                v38 = v15;
              else
                v38 = 1.0 - v15;
              v39 = v38 * v37;
              v28 = v28 + (float)(v39 * a4[v32]);
              v27 = v27 + v39;
              --v31;
            }
            while (v31);
          }
          BaseAddressOfPlane[v17++] = v28 / v27;
        }
        while (v17 != v9);
      }
      BaseAddress += BytesPerRow;
      BaseAddressOfPlane = (float *)((char *)BaseAddressOfPlane + BytesPerRowOfPlane);
    }
  }
  IOSurfaceUnlock(a3, 1u, &seed);
  CVPixelBufferUnlockBaseAddress(a5, 0);
}

- (void)blur:(const float *)a3 pout:(float *)a4
{
  int v7;
  int v8;
  uint64_t v9;
  const float *v10;
  float *v11;
  float v12;
  $ABC56A0A3CBBD8239319071184D304B7 *hash_table;
  unint64_t var4;
  unint64_t v15;
  float v16;
  unsigned int *v17;
  unint64_t v18;
  int v19;

  v7 = -[CIBilateralGridHash countDims](self, "countDims");
  v8 = -[CIBilateralGridHash countVertices](self, "countVertices");
  if (v8 >= 1)
  {
    v9 = v8;
    v10 = a3;
    v11 = a4;
    do
    {
      v12 = *v10++;
      *v11++ = v12 * (float)(2 * v7);
      --v9;
    }
    while (v9);
    hash_table = self->_hash_table;
    do
    {
      if (v9)
        var4 = hash_table[(v9 - 1)].var4;
      else
        var4 = 0;
      v15 = hash_table[v9].var4;
      if (var4 < v15)
      {
        v16 = a4[v9];
        v17 = &self->_blur_indices[var4];
        v18 = v15 - var4;
        do
        {
          v19 = *v17++;
          v16 = a3[v19] + v16;
          a4[v9] = v16;
          --v18;
        }
        while (v18);
      }
      ++v9;
    }
    while (v9 != v8);
  }
}

- (void)normalize:(const float *)a3 pout:(float *)a4
{
  int v7;
  uint64_t v8;
  unsigned int *p_var1;
  float v10;
  float v11;
  int v12;

  v7 = -[CIBilateralGridHash countVertices](self, "countVertices");
  if (v7 >= 1)
  {
    v8 = v7;
    p_var1 = &self->_hash_table->var1;
    do
    {
      v10 = *a3++;
      v11 = v10;
      v12 = *p_var1;
      p_var1 += 6;
      *a4++ = v11 / (float)v12;
      --v8;
    }
    while (v8);
  }
}

- (void)normalize_blur:(const float *)a3 pout:(float *)a4
{
  int v7;
  uint64_t v8;
  unsigned int *p_var2;
  float v10;
  float v11;
  int v12;

  v7 = -[CIBilateralGridHash countVertices](self, "countVertices");
  if (v7 >= 1)
  {
    v8 = v7;
    p_var2 = &self->_hash_table->var2;
    do
    {
      v10 = *a3++;
      v11 = v10;
      v12 = *p_var2;
      p_var2 += 6;
      *a4++ = v11 / (float)v12;
      --v8;
    }
    while (v8);
  }
}

- (void)splat_ones:(float *)a3
{
  int v5;
  uint64_t v6;
  unsigned int *p_var1;
  int v8;

  v5 = -[CIBilateralGridHash countVertices](self, "countVertices");
  if (v5 >= 1)
  {
    v6 = v5;
    p_var1 = &self->_hash_table->var1;
    do
    {
      v8 = *p_var1;
      p_var1 += 6;
      *a3++ = (float)v8;
      --v6;
    }
    while (v6);
  }
}

- (void)blur_ones:(float *)a3
{
  int v5;
  uint64_t v6;
  unsigned int *p_var2;
  int v8;

  v5 = -[CIBilateralGridHash countVertices](self, "countVertices");
  if (v5 >= 1)
  {
    v6 = v5;
    p_var2 = &self->_hash_table->var2;
    do
    {
      v8 = *p_var2;
      p_var2 += 6;
      *a3++ = (float)v8;
      --v6;
    }
    while (v6);
  }
}

- (void)blur_n:(float *)a3
{
  int v5;
  uint64_t v6;
  unsigned int *p_var3;
  int v8;

  v5 = -[CIBilateralGridHash countVertices](self, "countVertices");
  if (v5 >= 1)
  {
    v6 = v5;
    p_var3 = &self->_hash_table->var3;
    do
    {
      v8 = *p_var3;
      p_var3 += 6;
      *a3++ = (float)v8;
      --v6;
    }
    while (v6);
  }
}

- (const)blur_indices:(int)a3 n_blur_indices:(int *)a4
{
  $ABC56A0A3CBBD8239319071184D304B7 *hash_table;
  unsigned int var4;

  hash_table = self->_hash_table;
  if (a3 < 1)
    var4 = 0;
  else
    var4 = hash_table[a3 - 1].var4;
  *a4 = hash_table[a3].var4 - var4;
  return &self->_blur_indices[var4];
}

- (const)hash_table
{
  return self->_hash_table;
}

- (const)hash_matrix
{
  return self->_hash_matrix_data;
}

- (const)blur_table
{
  return self->_blur_indices;
}

- (const)coord_indices
{
  return self->_coord_indices;
}

- (const)coord_table
{
  return self->_coord_table;
}

- (const)interp_indices
{
  return self->_interp_indices;
}

- (const)interp_table
{
  return self->_interp_table;
}

- (const)interp_pad
{
  return self->_interp_pad;
}

- (int)_computeBilateralSpaceYCC444:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  int v19;
  char *BaseAddress;
  char *v21;
  size_t v22;
  size_t v23;
  size_t BytesPerRow;
  unint64_t v25;
  size_t v26;
  int v27;
  uint8x8_t v28;
  int v29;
  unint64_t v30;
  int v31;
  uint8x8_t v32;
  long double v33;
  int v34;
  double v35;
  double v36;
  int v37;
  uint8x8_t v38;
  long double v39;
  unint64_t v40;
  unint64_t v41;
  BOOL v42;
  int v44;
  int v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unsigned __int8 *v49;
  unsigned int v50;
  int v51;
  unint64_t v52;
  unsigned __int8 *v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t (*v56)(unsigned __int8 *);
  unsigned __int8 *v57;
  unint64_t v58;
  unsigned __int8 *v60;
  unint64_t v61;
  size_t v62;
  IOSurfaceRef buffer;
  unsigned __int8 *v65;
  _BYTE v66[5];
  uint32_t seed;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4.size.height;
  v15 = a4.size.width;
  v16 = a4.origin.x;
  if (IOSurfaceGetPixelFormat(a3) != 1111970369)
    -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.6();
  seed = 0;
  if (IOSurfaceLock(a3, 1u, &seed))
    return 2;
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a3);
  buffer = a3;
  if (BaseAddress)
  {
    v21 = BaseAddress;
    v22 = IOSurfaceGetWidth(a3);
    v23 = IOSurfaceGetHeight(a3);
    BytesPerRow = IOSurfaceGetBytesPerRow(a3);
    if (v15 != (double)v22)
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.1();
    if (v14 != (double)v23)
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.2();
    v25 = (unint64_t)width;
    if (!(unint64_t)width || !(unint64_t)height)
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.3();
    if (v22 < v25)
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.4();
    if (v23 < (unint64_t)height)
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.5();
    v26 = BytesPerRow;
    v61 = (unint64_t)height;
    v27 = 0;
    if (a8)
    {
      v28 = (uint8x8_t)vcnt_s8((int8x8_t)a8);
      v28.i16[0] = vaddlv_u8(v28);
      if (v28.u32[0] <= 1uLL)
        v27 = (int)log2((double)a8);
    }
    v29 = 0;
    v30 = a6;
    v31 = a7;
    if (a6)
    {
      v32 = (uint8x8_t)vcnt_s8((int8x8_t)a6);
      v32.i16[0] = vaddlv_u8(v32);
      if (v32.u32[0] <= 1uLL)
      {
        v33 = log2((double)a6);
        v31 = a7;
        v29 = (int)v33;
      }
    }
    v34 = 0;
    v35 = x - v16;
    v36 = y - v16;
    v37 = v29;
    if (v31)
    {
      v38 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
      v38.i16[0] = vaddlv_u8(v38);
      if (v38.u32[0] <= 1uLL)
      {
        v39 = log2((double)v31);
        v31 = a7;
        v34 = (int)v39;
      }
    }
    v40 = (unint64_t)v35;
    v41 = (unint64_t)v36;
    if (v27)
      v42 = v37 == 0;
    else
      v42 = 1;
    v44 = !v42 && v34 != 0;
    self->_sigma_s = a6;
    self->_sigma_r_luma = v31;
    self->_sigma_r_chroma = a8;
    if (a8 == 255)
      v45 = 3;
    else
      v45 = 5;
    self->_n_dims = v45;
    v62 = v26;
    if (a8 == 255 && v44)
    {
      v46 = 0;
      v47 = (uint64_t)&v21[4 * v40 + 2 + v26 * v41];
LABEL_35:
      v48 = 0;
      v49 = (unsigned __int8 *)v47;
      while (1)
      {
        v50 = *v49;
        v49 += 4;
        v51 = -[CIBilateralGridHash _addHashKeyAtX:Y:key:isKeyExist:](self, "_addHashKeyAtX:Y:key:isKeyExist:", v48, v46, (v48 >> v37) | ((unint64_t)(v46 >> v37) << 8) | (v50 >> v34 << 16), 0);
        if (v51)
          break;
        if (v25 == ++v48)
        {
          v19 = 0;
          ++v46;
          v47 += v62;
          if (v46 != v61)
            goto LABEL_35;
          goto LABEL_58;
        }
      }
    }
    else if (v44)
    {
      v52 = 0;
      v53 = (unsigned __int8 *)&v21[4 * v40 + 1 + v26 * v41];
LABEL_43:
      v54 = 0;
      v65 = v53;
      while (1)
      {
        v51 = -[CIBilateralGridHash _addHashKeyAtX:Y:key:isKeyExist:](self, "_addHashKeyAtX:Y:key:isKeyExist:", v54, v52, (v54 >> v37) | ((unint64_t)((v52 >> v37) | (v53[1] >> v34 << 8) | (*v53 >> v27 << 16) | (*(v53 - 1) >> v27 << 24)) << 8), 0);
        if (v51)
          break;
        v53 += 4;
        if (v25 == ++v54)
        {
          v19 = 0;
          ++v52;
          v53 = &v65[v62];
          if (v52 != v61)
            goto LABEL_43;
          goto LABEL_58;
        }
      }
    }
    else
    {
      v55 = 0;
      if (a8 == 255)
        v56 = hash3;
      else
        v56 = hash5;
      v57 = (unsigned __int8 *)&v21[4 * v40 + 1 + v26 * v41];
LABEL_52:
      v58 = 0;
      v60 = v57;
      while (1)
      {
        v66[0] = v58 / v30;
        v66[1] = v55 / v30;
        v66[2] = v57[1] / v31;
        v66[3] = *v57 / a8;
        v66[4] = *(v57 - 1) / a8;
        v51 = -[CIBilateralGridHash _addHashKeyAtX:Y:key:isKeyExist:](self, "_addHashKeyAtX:Y:key:isKeyExist:", v58, v55, v56(v66), 0);
        if (v51)
          break;
        v57 += 4;
        ++v58;
        v31 = a7;
        if (v25 == v58)
        {
          v19 = 0;
          ++v55;
          v57 = &v60[v26];
          if (v55 != v61)
            goto LABEL_52;
          goto LABEL_58;
        }
      }
    }
    v19 = v51;
  }
  else
  {
    v19 = 3;
  }
LABEL_58:
  IOSurfaceUnlock(buffer, 1u, &seed);
  return v19;
}

- (void)_computeBlurIndices
{
  int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  $ABC56A0A3CBBD8239319071184D304B7 *hash_table;
  $ABC56A0A3CBBD8239319071184D304B7 *v8;
  int v9;
  uint64_t var0;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  int32x2_t v15;
  __int128 v16;
  $ABC56A0A3CBBD8239319071184D304B7 *v17;
  uint64_t v18;
  __int128 v19;
  unsigned int v20;

  v3 = -[CIBilateralGridHash countDims](self, "countDims");
  v4 = -[CIBilateralGridHash countVertices](self, "countVertices");
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v18 = v4;
    do
    {
      hash_table = self->_hash_table;
      v8 = &hash_table[v5];
      v19 = 2 * v3 * v8->var1;
      if (v3 >= 1)
      {
        v9 = 0;
        var0 = v8->var0.var0;
        do
        {
          v11 = 0;
          v12 = 1;
          do
          {
            v13 = v12;
            v14 = hash_shift(var0, v9, _computeBlurIndices_kOffsetTable[v11]);
            if (v14 != -1)
            {
              v20 = 0;
              if (-[CIBilateralGridHash _hashMapFindKey:to:](self, "_hashMapFindKey:to:", v14, &v20))
              {
                self->_blur_indices[v6] = v20;
                v15.i32[1] = 1;
                v15.i32[0] = self->_hash_table[v20].var1;
                *((_QWORD *)&v16 + 1) = *((_QWORD *)&v19 + 1);
                *(int32x2_t *)&v16 = vadd_s32(v15, *(int32x2_t *)&v19);
                v19 = v16;
                ++v6;
              }
            }
            v12 = 0;
            v11 = 1;
          }
          while ((v13 & 1) != 0);
          ++v9;
        }
        while (v9 != v3);
      }
      v17 = &hash_table[v5];
      *(_QWORD *)&v17->var2 = v19;
      v17->var4 = v6;
      ++v5;
    }
    while (v5 != v18);
  }
}

- (void)_computeCoordIndices
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int *coord_indices;
  unsigned int *p_var1;
  unsigned int v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unsigned int *coord_indices_off;
  unsigned int *coord_table;
  unsigned int *v16;
  uint64_t v17;

  v3 = -[CIBilateralGridHash width](self, "width");
  v4 = -[CIBilateralGridHash height](self, "height");
  v5 = -[CIBilateralGridHash countVertices](self, "countVertices");
  bzero(self->_coord_indices_off, 4 * v5);
  if (v5 <= 0)
  {
    v7 = 0;
    coord_indices = self->_coord_indices;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    coord_indices = self->_coord_indices;
    p_var1 = &self->_hash_table->var1;
    do
    {
      coord_indices[v6] = v7;
      v10 = *p_var1;
      p_var1 += 6;
      v7 += v10;
      ++v6;
    }
    while (v5 != v6);
  }
  coord_indices[v5] = v7;
  if (v4 >= 1)
  {
    v11 = 0;
    for (i = 0; i != v4; ++i)
    {
      if (v3 >= 1)
      {
        v13 = 0;
        coord_table = self->_coord_table;
        coord_indices_off = self->_coord_indices_off;
        v16 = &self->_hash_matrix_data[v11];
        do
        {
          v17 = v16[v13];
          coord_table[coord_indices_off[v17] + coord_indices[v17]] = (unsigned __int16)v13 | ((_DWORD)i << 16);
          ++coord_indices_off[v17];
          ++v13;
        }
        while (v3 != v13);
      }
      v11 += v3;
    }
  }
}

- (void)_computeInterpIndices
{
  int v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t var0;
  unsigned __int8 v7;
  unsigned int v8;
  unint64_t v9;
  char *interp_pad;
  unsigned int v11;

  v3 = -[CIBilateralGridHash countVertices](self, "countVertices");
  if (v3 < 1)
  {
    v5 = 0;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    do
    {
      self->_interp_indices[v4] = v5;
      var0 = self->_hash_table[v4].var0.var0;
      v7 = 1;
      do
      {
        v8 = v7;
        v9 = hash_pad(v7);
        v11 = 0;
        if (-[CIBilateralGridHash _hashMapFindKey:to:](self, "_hashMapFindKey:to:", v9 + var0, &v11))
        {
          interp_pad = self->_interp_pad;
          self->_interp_table[v5] = v11;
          interp_pad[v5++] = v7;
        }
        ++v7;
      }
      while (v8 < 7);
      ++v4;
    }
    while (v4 != v3);
  }
  self->_interp_indices[v3] = v5;
}

- (BOOL)_hashMapFindKey:(unint64_t)a3 to:(unsigned int *)a4
{
  return BGHashFindKey((uint64_t)self->_hash_map, a3, a4);
}

- (void)_hashMapAddKey:(unint64_t)a3 andValue:(unsigned int)a4
{
  BGHashSetValue((uint64_t)self->_hash_map, a3, a4);
}

- (int)_addHashKeyAtX:(int)a3 Y:(int)a4 key:(unint64_t)a5 isKeyExist:(BOOL *)a6
{
  $ABC56A0A3CBBD8239319071184D304B7 *hash_table;
  BOOL v12;
  unint64_t hash_table_size;
  $ABC56A0A3CBBD8239319071184D304B7 *v14;
  $ABC56A0A3CBBD8239319071184D304B7 *v15;
  int result;
  unsigned int v17;

  v17 = 0;
  if (-[CIBilateralGridHash _hashMapFindKey:to:](self, "_hashMapFindKey:to:", a5, &v17))
  {
    hash_table = self->_hash_table;
    self->_hash_matrix_data[a3 + self->_width * a4] = v17;
    ++hash_table[v17].var1;
    if (a6)
    {
      v12 = 1;
LABEL_6:
      result = 0;
      *a6 = v12;
      return result;
    }
    return 0;
  }
  hash_table_size = self->_hash_table_size;
  if (self->_max_hash_table_size > hash_table_size)
  {
    v14 = self->_hash_table;
    self->_hash_table_size = hash_table_size + 1;
    v15 = &v14[hash_table_size];
    v15->var0.var0 = a5;
    *(_OWORD *)&v15->var1 = xmmword_19248E020;
    self->_hash_matrix_data[a3 + self->_width * a4] = hash_table_size;
    -[CIBilateralGridHash _hashMapAddKey:andValue:](self, "_hashMapAddKey:andValue:", a5);
    v12 = 0;
    if (a6)
      goto LABEL_6;
    return 0;
  }
  return 4;
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.1()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 579, "region.size.width == surfaceW");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.2()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 580, "region.size.height == surfaceH");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.3()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 589, "w > 0 && h > 0");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.4()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 590, "w <= surfaceW");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.5()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 591, "h <= surfaceH");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.6()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 559, "t == kCVPixelFormatType_32BGRA");
}

@end
