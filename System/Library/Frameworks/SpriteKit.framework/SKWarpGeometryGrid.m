@implementation SKWarpGeometryGrid

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKWarpGeometryGrid)grid
{
  return (SKWarpGeometryGrid *)objc_msgSend((id)objc_opt_class(), "gridWithColumns:rows:sourcePositions:destPositions:", 1, 1, 0, 0);
}

+ (SKWarpGeometryGrid)gridWithColumns:(NSInteger)cols rows:(NSInteger)rows
{
  return (SKWarpGeometryGrid *)objc_msgSend((id)objc_opt_class(), "gridWithColumns:rows:sourcePositions:destPositions:", cols, rows, 0, 0);
}

+ (SKWarpGeometryGrid)gridWithColumns:(NSInteger)cols rows:(NSInteger)rows sourcePositions:(const vector_float2 *)sourcePositions destPositions:(const vector_float2 *)destPositions
{
  return (SKWarpGeometryGrid *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColumns:rows:sourcePositions:destPositions:", cols, rows, sourcePositions, destPositions);
}

- (SKWarpGeometryGrid)init
{
  return -[SKWarpGeometryGrid initWithColumns:rows:sourcePositions:destPositions:](self, "initWithColumns:rows:sourcePositions:destPositions:", 1, 1, 0, 0);
}

- (SKWarpGeometryGrid)initWithColumns:(NSInteger)cols rows:(NSInteger)rows sourcePositions:(const vector_float2 *)sourcePositions destPositions:(const vector_float2 *)destPositions
{
  SKWarpGeometryGrid *v10;
  SKWarpGeometryGrid *v11;
  SKWarpGeometryGrid *v12;
  int32x2_t *dimensions;
  int v14;
  void **anon_8;
  void **anon_20;
  SKWarpGeometryGrid *v17;
  int v18;
  int32x2_t v19;
  int v20;
  uint64_t v21;
  float32x2_t v22;
  BOOL v23;
  int v24;
  int32x2_t v25;
  int v26;
  uint64_t v27;
  float32x2_t v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SKWarpGeometryGrid;
  v10 = -[SKWarpGeometryGrid init](&v30, sel_init);
  v11 = v10;
  v12 = v10;
  if (!v10)
  {
LABEL_26:
    v17 = v12;
    goto LABEL_27;
  }
  dimensions = (int32x2_t *)v10->_dimensions;
  *(_QWORD *)v10->_dimensions = __PAIR64__(rows, cols);
  if (cols >= 1 && rows > 0)
  {
    if ((int)rows * (int)cols < 1)
      v14 = 1;
    else
      v14 = cols + 1 + (cols + 1) * rows;
    v10->_vertexCount = v14;
    anon_8 = (void **)v10->_anon_8;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10->_anon_8, v14);
    anon_20 = (void **)v11->_anon_20;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)anon_20, v12->_vertexCount);
    if ((unint64_t)sourcePositions | (unint64_t)destPositions)
    {
      v12->_isIdentityWarp = 0;
      if (sourcePositions)
      {
        memcpy(*anon_8, sourcePositions, 8 * v12->_vertexCount);
LABEL_18:
        if (destPositions)
        {
          memcpy(*anon_20, destPositions, 8 * v12->_vertexCount);
        }
        else if ((dimensions->i32[1] & 0x80000000) == 0)
        {
          v24 = 0;
          v25 = *dimensions;
          do
          {
            v26 = v25.i32[0];
            if ((v25.i32[0] & 0x80000000) == 0)
            {
              v27 = 0;
              do
              {
                v28.f32[0] = (float)(int)v27;
                v25.i32[0] = v26;
                v28.f32[1] = (float)v24;
                *((float32x2_t *)*anon_20 + v27 + v24 + v24 * v26) = vdiv_f32(v28, vcvt_f32_s32(v25));
                v25 = *dimensions;
                v26 = (int)*dimensions;
                ++v27;
              }
              while ((int)v27 - 1 < v26);
            }
            v23 = v24++ < v25.i32[1];
          }
          while (v23);
        }
        goto LABEL_26;
      }
    }
    else
    {
      v12->_isIdentityWarp = 1;
    }
    if ((dimensions->i32[1] & 0x80000000) == 0)
    {
      v18 = 0;
      v19 = *dimensions;
      do
      {
        v20 = v19.i32[0];
        if ((v19.i32[0] & 0x80000000) == 0)
        {
          v21 = 0;
          do
          {
            v22.f32[0] = (float)(int)v21;
            v19.i32[0] = v20;
            v22.f32[1] = (float)v18;
            *((float32x2_t *)*anon_8 + v21 + v18 + v18 * v20) = vdiv_f32(v22, vcvt_f32_s32(v19));
            v19 = *dimensions;
            v20 = (int)*dimensions;
            ++v21;
          }
          while ((int)v21 - 1 < v20);
        }
        v23 = v18++ < v19.i32[1];
      }
      while (v23);
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKWarpGeometryGrid: numberOfColumns and numberOfRows must be greater than or equal to 1"));
  v17 = 0;
LABEL_27:

  return v17;
}

- (SKWarpGeometryGrid)initWithCoder:(NSCoder *)aDecoder
{
  char *v4;
  __int32 v5;
  int32x2_t v6;
  int8x8_t v7;
  int8x8_t v8;
  int32x2_t v9;
  int8x8_t v10;
  int8x8_t v11;
  int8x8_t v12;
  int v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t i;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t j;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  NSCoder *v45;
  objc_super v46;
  _QWORD v47[3];
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  v45 = aDecoder;
  v46.receiver = self;
  v46.super_class = (Class)SKWarpGeometryGrid;
  v4 = -[SKWarpGeometryGrid init](&v46, sel_init);
  if (v4)
  {
    *((_DWORD *)v4 + 14) = -[NSCoder decodeIntegerForKey:](v45, "decodeIntegerForKey:", CFSTR("_numberOfColumns"));
    v5 = -[NSCoder decodeIntegerForKey:](v45, "decodeIntegerForKey:", CFSTR("_numberOfRows"));
    v6.i32[0] = 0;
    v7.i32[0] = *((_QWORD *)v4 + 7);
    v7.i32[1] = v5;
    v8.i32[1] = v5;
    v8.i32[0] = 0;
    v9 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v6, *(int32x2_t *)(v4 + 56)), 0), v8, v7);
    v10 = (int8x8_t)vdup_lane_s32(vcgt_s32(v6, vdup_lane_s32(v9, 1)), 0);
    v11 = vbsl_s8(v10, (int8x8_t)v9.u32[0], (int8x8_t)v9);
    v12 = vbic_s8((int8x8_t)v9, v10);
    *((int8x8_t *)v4 + 7) = v11;
    v13 = v12.i32[1] + 1 + (v12.i32[1] + 1) * v11.i32[0];
    if (v11.i32[0] * v12.i32[1] < 1)
      v13 = 1;
    *((_DWORD *)v4 + 16) = v13;
    v14 = v4 + 8;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v4 + 8), v13);
    v15 = v4 + 32;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v4 + 32), *((int *)v4 + 16));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    v48[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v45, "decodeObjectOfClasses:forKey:", v18, CFSTR("_sourcePositions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    for (i = 0; ; ++i)
    {
      v22 = objc_msgSend(v19, "count");
      v23 = *((int *)v4 + 16);
      if (v22 < v23)
        v23 = v22;
      if (v23 <= i)
        break;
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");
      *(_DWORD *)(*v14 + v20) = v26;

      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      *(_DWORD *)(*v14 + v20 + 4) = v29;

      v20 += 8;
    }
    v30 = (void *)MEMORY[0x1E0C99E60];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    v47[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v45, "decodeObjectOfClasses:forKey:", v32, CFSTR("_destPositions"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    for (j = 0; ; ++j)
    {
      v36 = objc_msgSend(v19, "count");
      v37 = *((int *)v4 + 16);
      if (v36 < v37)
        v37 = v36;
      if (v37 <= j)
        break;
      objc_msgSend(v33, "objectAtIndexedSubscript:", j);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      *(_DWORD *)(*v15 + v34) = v40;

      objc_msgSend(v33, "objectAtIndexedSubscript:", j);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "floatValue");
      *(_DWORD *)(*v15 + v34 + 4) = v43;

      v34 += 8;
    }

  }
  return (SKWarpGeometryGrid *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSInteger v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  NSInteger v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "encodeInteger:forKey:", 1, CFSTR("_SKWarpGeometryGridVersion"));
  objc_msgSend(v17, "encodeInteger:forKey:", -[SKWarpGeometryGrid numberOfColumns](self, "numberOfColumns"), CFSTR("_numberOfColumns"));
  objc_msgSend(v17, "encodeInteger:forKey:", -[SKWarpGeometryGrid numberOfRows](self, "numberOfRows"), CFSTR("_numberOfRows"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[SKWarpGeometryGrid vertexCount](self, "vertexCount"));
  v4 = 0;
  v5 = 4;
  while (-[SKWarpGeometryGrid vertexCount](self, "vertexCount") > v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)(*(_QWORD *)self->_anon_8 + 8 * v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    LODWORD(v7) = *(_DWORD *)(*(_QWORD *)self->_anon_8 + v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v9);

    ++v4;
    v5 += 8;
  }
  objc_msgSend(v17, "encodeObject:forKey:", v18, CFSTR("_sourcePositions"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[SKWarpGeometryGrid vertexCount](self, "vertexCount"));
  v11 = 0;
  v12 = 4;
  while (-[SKWarpGeometryGrid vertexCount](self, "vertexCount") > v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)(*(_QWORD *)self->_anon_20 + 8 * v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    LODWORD(v14) = *(_DWORD *)(*(_QWORD *)self->_anon_20 + v12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

    ++v11;
    v12 += 8;
  }
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("_destPositions"));

}

- (BOOL)isEqualToGrid:(id)a3
{
  float32x2_t **v4;
  NSInteger v5;
  NSInteger v6;
  float32x2_t *v7;
  uint64_t v8;
  unint64_t v9;
  float32x2_t *v10;
  float32x2_t v11;
  float32x2_t *v12;
  uint64_t v13;
  unint64_t v14;
  float32x2_t *v15;
  uint64_t v16;
  float32x2_t v17;
  float32x2_t v18;
  BOOL v19;
  unint64_t v21;

  v4 = (float32x2_t **)a3;
  if (self == (SKWarpGeometryGrid *)v4)
    goto LABEL_16;
  v5 = -[SKWarpGeometryGrid numberOfColumns](self, "numberOfColumns");
  if (v5 != objc_msgSend(v4, "numberOfColumns")
    || (v6 = -[SKWarpGeometryGrid numberOfRows](self, "numberOfRows"), v6 != objc_msgSend(v4, "numberOfRows")))
  {
LABEL_15:
    v19 = 0;
    goto LABEL_17;
  }
  v7 = *(float32x2_t **)self->_anon_8;
  v8 = *(_QWORD *)&self->_anon_8[8] - (_QWORD)v7;
  if (v8)
  {
    v9 = v8 >> 3;
    v10 = v4[1];
    if (v9 <= 1)
      v9 = 1;
    do
    {
      v11 = vsub_f32(*v7, *v10);
      if ((v11.i32[0] & 0x60000000) != 0 || (v11.i32[1] & 0x60000000) != 0)
        goto LABEL_15;
      ++v10;
      ++v7;
    }
    while (--v9);
  }
  v12 = *(float32x2_t **)self->_anon_20;
  v13 = *(_QWORD *)&self->_anon_20[8] - (_QWORD)v12;
  if (!v13)
  {
LABEL_16:
    v19 = 1;
    goto LABEL_17;
  }
  v14 = v13 >> 3;
  v15 = v4[4];
  if (v14 <= 1)
    v16 = 1;
  else
    v16 = v14;
  v17 = *v12;
  v18 = *v15;
  if ((vsub_f32(*v12, *v15).u32[0] & 0x60000000) != 0)
    goto LABEL_15;
  v19 = 0;
  v21 = 1;
  do
  {
    if ((vsub_f32(v17, v18).i32[1] & 0x60000000) != 0)
      break;
    v19 = v14 <= v21;
    if (v16 == v21)
      break;
    v17 = v12[v21];
    v18 = v15[v21++];
  }
  while ((vsub_f32(v17, v18).u32[0] & 0x60000000) == 0);
LABEL_17:

  return v19;
}

- (BOOL)isIdentityWarp
{
  return self->_isIdentityWarp;
}

- (NSInteger)vertexCount
{
  return self->_vertexCount;
}

- (vector_float2)sourcePositionAtIndex:(NSInteger)index
{
  if (index < 0 || self->_vertexCount <= index)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKWarpGeometryGrid: index must be in the range [0, vertexCount - 1]"));
    return 0;
  }
  else
  {
    return *(vector_float2 *)(*(_QWORD *)self->_anon_8 + 8 * index);
  }
}

- (vector_float2)destPositionAtIndex:(NSInteger)index
{
  if (index < 0 || self->_vertexCount <= index)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKWarpGeometryGrid: index must be in the range [0, vertexCount - 1]"));
    return 0;
  }
  else
  {
    return *(vector_float2 *)(*(_QWORD *)self->_anon_20 + 8 * index);
  }
}

- (NSInteger)numberOfRows
{
  return *(int *)&self->_dimensions[4];
}

- (NSInteger)numberOfColumns
{
  return (int)*(_QWORD *)self->_dimensions;
}

- (uint64_t)sourcePositions
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)destPositions
{
  return *(_QWORD *)(a1 + 32);
}

- (SKWarpGeometryGrid)gridByReplacingSourcePositions:(const vector_float2 *)sourcePositions
{
  return (SKWarpGeometryGrid *)objc_msgSend((id)objc_opt_class(), "gridWithColumns:rows:sourcePositions:destPositions:", -[SKWarpGeometryGrid numberOfColumns](self, "numberOfColumns"), -[SKWarpGeometryGrid numberOfRows](self, "numberOfRows"), sourcePositions, -[SKWarpGeometryGrid destPositions](self, "destPositions"));
}

- (SKWarpGeometryGrid)gridByReplacingDestPositions:(const vector_float2 *)destPositions
{
  return (SKWarpGeometryGrid *)objc_msgSend((id)objc_opt_class(), "gridWithColumns:rows:sourcePositions:destPositions:", -[SKWarpGeometryGrid numberOfColumns](self, "numberOfColumns"), -[SKWarpGeometryGrid numberOfRows](self, "numberOfRows"), -[SKWarpGeometryGrid sourcePositions](self, "sourcePositions"), destPositions);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend((id)objc_opt_class(), "gridWithColumns:rows:sourcePositions:destPositions:", -[SKWarpGeometryGrid numberOfColumns](self, "numberOfColumns"), -[SKWarpGeometryGrid numberOfRows](self, "numberOfRows"), -[SKWarpGeometryGrid sourcePositions](self, "sourcePositions"), -[SKWarpGeometryGrid destPositions](self, "destPositions"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  unsigned __int8 *anon_20;
  void *v4;
  void *v5;

  anon_20 = self->_anon_20;
  v4 = *(void **)self->_anon_20;
  if (v4)
  {
    *((_QWORD *)anon_20 + 1) = v4;
    operator delete(v4);
  }
  v5 = *(void **)self->_anon_8;
  if (v5)
  {
    *(_QWORD *)&self->_anon_8[8] = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
