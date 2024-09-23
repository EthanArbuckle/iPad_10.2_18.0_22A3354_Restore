@implementation NTKKaleidoscopePathfinder

- (NTKKaleidoscopePathfinder)initWithImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v13;
  NTKKaleidoscopePathfinder *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  signed int v19;
  signed int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  float v27;
  float v28;
  float *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  void *v39;
  unsigned int v40;
  void *v41;
  NSObject *v42;
  float *v44;
  unsigned int v45;
  objc_super v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (v46.receiver = self,
        v46.super_class = (Class)NTKKaleidoscopePathfinder,
        (self = -[NTKKaleidoscopePathfinder init](&v46, sel_init)) != 0))
  {
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "scale");
    v10 = v6 * v9;
    v11 = v8 * v9;
    if (v10 < 2.0 || v11 < 2.0)
    {
      _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v48 = v4;
        v49 = 1024;
        v50 = (int)v10;
        v51 = 1024;
        v52 = (int)v11;
        _os_log_error_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_ERROR, "[kaleidoscope pathfinder cache] nil pathfinder for image %@ (%d x %d), returning early", buf, 0x18u);
      }
      v14 = 0;
    }
    else
    {
      v15 = (int)v10;
      v16 = (int)v11;
      if ((int)v10 < 188 || v16 <= 187)
      {
        _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v48 = v4;
          v49 = 1024;
          v50 = (int)v10;
          v51 = 1024;
          v52 = (int)v11;
          _os_log_impl(&dword_1B72A3000, v26, OS_LOG_TYPE_DEFAULT, "[kaleidoscope pathfinder cache] poor quality pathfinder for image %@ (%d x %d)", buf, 0x18u);
        }

        v23 = 0;
        v24 = 2;
        v25 = 2;
      }
      else
      {
        v17 = v15 - 156;
        v18 = v16 - 156;
        v19 = (v15 - 156) >> 4;
        v20 = (v16 - 156) >> 4;
        if ((v19 * v20) >= 0x259)
        {
          v20 = (int)sqrtf((float)((float)v18 * 600.0) / (float)v17);
          v19 = 600 / v20;
        }
        v21 = v17 / v19;
        v22 = v18 / v20;
        if (v21 <= v22)
          v21 = v22;
        v23 = (v21 + 77) / v21;
        v24 = (v15 / v21);
        v25 = (v16 / v21);
      }
      v27 = 156.0 / v10;
      v28 = 156.0 / v11;
      self->_sampleRadiusX = v27;
      self->_sampleRadiusY = v28;
      v29 = (float *)malloc_type_malloc(4 * (int)v25 * (int)v24, 0x100004052888210uLL);
      +[NTKRawImage rawImageWithImage:width:height:](NTKRawImage, "rawImageWithImage:width:height:", v4, (16 * v24), (16 * v25));
      v13 = objc_claimAutoreleasedReturnValue();
      NTKAnalyzeInterestingness(v13, v29, v24, v25, v23);
      self->_cellGridWidth = v24;
      self->_cellGridHeight = v25;
      NTKGeneratePathFromInterestingness((uint64_t)v29, v24, v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v44 = v29;
        v32 = objc_msgSend(v30, "count");
        if (v32 >= 0)
          v33 = v32;
        else
          v33 = v32 + 1;
        v34 = v33 >> 1;
        self->_pathLength = v34;
        *(_QWORD *)&self->_path[4] = malloc_type_malloc(8 * v34, 0x100004000313F17uLL);
        if (self->_pathLength >= 1)
        {
          v35 = 0;
          v36 = 1;
          do
          {
            objc_msgSend(v31, "objectAtIndexedSubscript:", v36 - 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "floatValue");
            v45 = v38;
            objc_msgSend(v31, "objectAtIndexedSubscript:", v36);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "floatValue");
            *(_QWORD *)(*(_QWORD *)&self->_path[4] + 8 * v35) = __PAIR64__(v40, v45);

            ++v35;
            v36 += 2;
          }
          while (v35 < self->_pathLength);
        }
        free(v44);
        v41 = malloc_type_malloc(16 * (int)v25 * (int)v24, 0x1000040451B5BE8uLL);
        *(_QWORD *)&self->_dominanceGrid[4] = v41;
        NTKAnalyzeDominance((uint64_t)v13, (uint64_t)v41, v24);
        v14 = self;
      }
      else
      {
        _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[NTKKaleidoscopePathfinder initWithImage:].cold.1();

        v14 = 0;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NTKKaleidoscopePathfinder)initWithCoder:(id)a3
{
  id v4;
  NTKKaleidoscopePathfinder *v5;
  float v6;
  float v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;
  NTKKaleidoscopePathfinder *v12;
  const void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  const void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NTKKaleidoscopePathfinder;
  v5 = -[NTKKaleidoscopePathfinder init](&v22, sel_init);
  if (v5 && objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version")) == 4098)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("sampleRadiusX"));
    v5->_sampleRadiusX = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("sampleRadiusY"));
    v5->_sampleRadiusY = v7;
    v5->_cellGridWidth = objc_msgSend(v4, "decodeIntForKey:", CFSTR("cellGridWidth"));
    v8 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("cellGridHeight"));
    v5->_cellGridHeight = v8;
    v9 = v5->_cellGridWidth * v8;
    v21 = 0;
    v10 = objc_retainAutorelease(v4);
    v11 = objc_msgSend(v10, "decodeBytesForKey:returnedLength:", CFSTR("dominanceGrid"), &v21);
    v12 = 0;
    if (v21 == 16 * v9)
    {
      v13 = (const void *)v11;
      v14 = malloc_type_malloc(16 * v9, 0x520B1CFEuLL);
      *(_QWORD *)&v5->_dominanceGrid[4] = v14;
      memcpy(v14, v13, 16 * v9);
      v15 = objc_msgSend(v10, "decodeIntForKey:", CFSTR("pathLength"));
      v5->_pathLength = v15;
      v20 = 0;
      v16 = objc_msgSend(objc_retainAutorelease(v10), "decodeBytesForKey:returnedLength:", CFSTR("path"), &v20);
      v12 = 0;
      if (v20 == 8 * v15)
      {
        v17 = (const void *)v16;
        v18 = malloc_type_malloc(8 * v15, 0x30D66936uLL);
        *(_QWORD *)&v5->_path[4] = v18;
        memcpy(v18, v17, 8 * v15);
        v12 = v5;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(*(void **)&self->_dominanceGrid[4]);
  free(*(void **)&self->_path[4]);
  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopePathfinder;
  -[NTKKaleidoscopePathfinder dealloc](&v3, sel_dealloc);
}

+ (id)pathfinderWithImage:(id)a3
{
  id v3;
  NTKKaleidoscopePathfinder *v4;

  v3 = a3;
  v4 = -[NTKKaleidoscopePathfinder initWithImage:]([NTKKaleidoscopePathfinder alloc], "initWithImage:", v3);

  return v4;
}

+ (id)pathfinderFromDirectory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("image-%X.pathfinder"), 4098);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB2AD8];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AD8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2AE0]);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(a1, "pathfinderFromFile:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "[kaleidoscope pathfinder cache] path %@ has the wrong protection class (%@)", buf, 0x16u);

    }
    v13 = 0;
  }

  return v13;
}

+ (id)pathfinderFromFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 1, &v11);
  v5 = v11;
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
    objc_msgSend(v6, "setDecodingFailurePolicy:", 0);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "[kaleidoscope pathfinder cache] using %@", buf, 0xCu);
      }
    }
    else
    {
      _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[NTKKaleidoscopePathfinder pathfinderFromFile:].cold.2();
    }

  }
  else
  {
    _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[NTKKaleidoscopePathfinder pathfinderFromFile:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (NTKKaleidoscopePathfinderPoint)pointForTime:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  int pathLength;
  float v6;
  signed int v7;
  uint64_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float v11;
  uint64_t v12;
  double v13;
  double v14;
  __int128 v15;
  double v16;
  double v17;
  float32x2_t v18;
  NTKKaleidoscopePathfinderPoint result;

  v4 = v3;
  pathLength = self->_pathLength;
  v6 = (float)pathLength * a3;
  v7 = vcvtms_s32_f32(v6);
  v8 = *(_QWORD *)&self->_path[4];
  v9 = *(float32x2_t *)(v8 + 8 * (v7 % pathLength));
  v10 = *(float32x2_t *)(v8 + 8 * ((v7 + 1) % pathLength));
  v11 = v6 - (float)(int)floorf(v6);
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  v18 = vmla_n_f32(vmul_n_f32(v10, v11), v9, 1.0 - v11);
  v12 = *(_QWORD *)&self->_sampleRadiusX;
  *(float32x2_t *)v4 = v18;
  *(_QWORD *)(v4 + 8) = v12;
  CLKUIConvertToSRGBfFromRGBf_fast();
  *(_OWORD *)(v4 + 16) = v15;
  *(float64x2_t *)(v4 + 32) = vcvtq_f64_f32(*(float32x2_t *)&v15);
  v16 = *((float *)&v15 + 2);
  *(double *)(v4 + 48) = *((float *)&v15 + 2);
  *(_QWORD *)(v4 + 56) = 0x3FF0000000000000;
  LODWORD(v17) = v18.i32[0];
  *(float *)&v16 = 1.0 - v18.f32[1];
  *((float *)&v17 + 1) = 1.0 - v18.f32[1];
  *(double *)v4 = v17;
  result.var0[3] = v14;
  result.var0[2] = v13;
  result.var0[1] = v17;
  result.var0[0] = v16;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  id v8;

  v4 = 16 * self->_cellGridHeight * self->_cellGridWidth;
  v5 = 8 * self->_pathLength;
  v8 = a3;
  objc_msgSend(v8, "encodeInt32:forKey:", 4098, CFSTR("version"));
  *(float *)&v6 = self->_sampleRadiusX;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("sampleRadiusX"), v6);
  *(float *)&v7 = self->_sampleRadiusY;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("sampleRadiusY"), v7);
  objc_msgSend(v8, "encodeInt32:forKey:", self->_cellGridWidth, CFSTR("cellGridWidth"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_cellGridHeight, CFSTR("cellGridHeight"));
  objc_msgSend(v8, "encodeBytes:length:forKey:", *(_QWORD *)&self->_dominanceGrid[4], v4, CFSTR("dominanceGrid"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_pathLength, CFSTR("pathLength"));
  objc_msgSend(v8, "encodeBytes:length:forKey:", *(_QWORD *)&self->_path[4], v5, CFSTR("path"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)writeToDirectory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("image-%X.pathfinder"), 4098);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[NTKKaleidoscopePathfinder writeToFile:](self, "writeToFile:", v7);
  return (char)self;
}

- (BOOL)writeToFile:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unlockedSinceBoot");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[NSObject writeToFile:options:error:](v7, "writeToFile:options:error:", v4, 1, &v17);
    v8 = v17;
    if (v8)
    {
      v9 = v8;
      _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[NTKKaleidoscopePathfinder writeToFile:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0CB2AD8];
      v19[0] = *MEMORY[0x1E0CB2AE0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v13 = -[NSObject setAttributes:ofItemAtPath:error:](v10, "setAttributes:ofItemAtPath:error:", v12, v4, &v16);
      v9 = v16;

      if ((v13 & 1) == 0)
      {
        _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[NTKKaleidoscopePathfinder writeToFile:].cold.1();

        -[NSObject removeItemAtPath:error:](v10, "removeItemAtPath:error:", v4, 0);
      }
    }

    v11 = v9 == 0;
  }
  else
  {
    _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NTKKaleidoscopePathfinder writeToFile:].cold.3();
    v11 = 0;
  }

  return v11;
}

- (void)adjustRotationStart:(float)a3
{
  *(float *)&self[1].super.isa = a3;
}

- (void)adjustSampleRadius:(float)a3
{
  *(float32x2_t *)&self->_sampleRadiusX = vmul_n_f32(*(float32x2_t *)&self->_sampleRadiusX, a3);
}

- (void)adjustPathStart:(NTKKaleidoscopePathfinder *)self
{
  float32x2_t v2;
  uint64_t pathLength;
  NSObject *v4;
  float32x2_t v5;
  int v7;
  float32x2_t *v8;
  float32x2_t v9;
  float v10;
  uint64_t i;
  float32x2_t v12;
  float v13;
  float32x2_t *v14;
  float32x2_t *v15;
  uint64_t j;
  float32x2_t v17;
  signed int v18;
  int v19;
  int v20;
  float v21;

  pathLength = self->_pathLength;
  if ((int)pathLength > 4)
  {
    v5 = v2;
    v7 = 0;
    v8 = *(float32x2_t **)&self->_path[4];
    v9 = vsub_f32(v2, *v8);
    v10 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v9, v9).i32[1]), v9.f32[0], v9.f32[0]));
    for (i = 1; i != pathLength; ++i)
    {
      v12 = vsub_f32(v5, v8[i]);
      v13 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v12, v12).i32[1]), v12.f32[0], v12.f32[0]));
      if (v13 < v10)
      {
        v10 = v13;
        v7 = i;
      }
    }
    v14 = (float32x2_t *)malloc_type_malloc(8 * pathLength, 0x100004000313F17uLL);
    v15 = v14;
    for (j = 0; j != pathLength; ++j)
      v14[j] = *(float32x2_t *)(*(_QWORD *)&self->_path[4] + 8 * ((v7 + (int)j) % (int)pathLength));
    v17 = vsub_f32(v5, *v14);
    if ((int)(pathLength / 0x1E) <= 2)
      v18 = 2;
    else
      v18 = pathLength / 0x1E;
    memcpy(*(void **)&self->_path[4], v14, 8 * pathLength);
    v19 = 1 - v18;
    v20 = 2 * v18 - 1;
    do
    {
      v21 = 1.0 - fabsf((float)v19 / (float)v18);
      v15[((int)pathLength + v19) % (int)pathLength] = vmla_n_f32(v15[((int)pathLength + v19) % (int)pathLength], v17, (float)(v21 * v21) * (float)((float)(v21 * -2.0) + 3.0));
      ++v19;
      --v20;
    }
    while (v20);
    *v15 = v5;
    free(*(void **)&self->_path[4]);
    *(_QWORD *)&self->_path[4] = v15;
  }
  else
  {
    _NTKKaleidoscopeLoggingObjectForDomain(0, (uint64_t)"NTKKaleidoscopeLoggingDomainDefault");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NTKKaleidoscopePathfinder adjustPathStart:].cold.1(pathLength, v4);

  }
}

- (int)cellGridWidth
{
  return self->_cellGridWidth;
}

- (int)cellGridHeight
{
  return self->_cellGridHeight;
}

- (int)pathLength
{
  return self->_pathLength;
}

- (float)startRotation
{
  return *(float *)&self[1].super.isa;
}

- (void)initWithImage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "[kaleidoscope pathfinder cache] nil path generated by pathfinder for image %@, returning early", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)pathfinderFromFile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "[kaleidoscope pathfinder cache] unable to unarchive: %@ due to %@");
  OUTLINED_FUNCTION_1();
}

+ (void)pathfinderFromFile:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "[kaleidoscope pathfinder cache] unknown error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)pathfinderFromFile:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "[kaleidoscope pathfinder cache] error during load: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeToFile:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "[kaleidoscope pathfinder cache] cannot set class D on file %@: error %@");
  OUTLINED_FUNCTION_1();
}

- (void)writeToFile:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "[kaleidoscope pathfinder cache] error writing archive %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)writeToFile:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "[kaleidoscope pathfinder cache] skip writing %@ before first unlock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)adjustPathStart:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "[kaleidoscope pathfinder cache] insufficent path length %d", (uint8_t *)v2, 8u);
}

@end
