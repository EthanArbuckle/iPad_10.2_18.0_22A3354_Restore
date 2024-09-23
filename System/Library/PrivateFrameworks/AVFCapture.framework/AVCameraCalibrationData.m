@implementation AVCameraCalibrationData

- (id)debugDescription
{
  void *v2;
  AVCameraCalibrationDataInternal *internal;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float pixelSize;
  double y;
  const __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v2 = (void *)MEMORY[0x1E0CB3940];
  internal = self->_internal;
  v5 = *(_OWORD *)internal->_anon_10;
  v4 = *(_OWORD *)&internal->_anon_10[16];
  v6 = *(_OWORD *)&internal->_anon_10[32];
  v8 = *(_OWORD *)internal->_anon_50;
  v7 = *(_OWORD *)&internal->_anon_50[16];
  v10 = *(_OWORD *)&internal->_anon_50[32];
  v9 = *(_OWORD *)&internal->_anon_50[48];
  pixelSize = internal->pixelSize;
  y = internal->lensDistortionCenter.y;
  if (internal->lensDistortionCenter.x == *MEMORY[0x1E0C9D538] && y == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v15 = &stru_1E421DB28;
  }
  else
  {
    v22 = *(_OWORD *)&internal->_anon_10[16];
    v23 = *(_OWORD *)internal->_anon_10;
    v20 = *(_OWORD *)internal->_anon_50;
    v21 = *(_OWORD *)&internal->_anon_10[32];
    v18 = *(_OWORD *)&internal->_anon_50[32];
    v19 = *(_OWORD *)&internal->_anon_50[16];
    v17 = *(_OWORD *)&internal->_anon_50[48];
    v15 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", distortionCenter:{%.2f,%.2f}"), *(_QWORD *)&internal->lensDistortionCenter.x, *(_QWORD *)&y);
    v9 = v17;
    v10 = v18;
    v7 = v19;
    v8 = v20;
    v6 = v21;
    v4 = v22;
    v5 = v23;
    internal = self->_internal;
  }
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("intrinsicMatrix: [%.2f %.2f %.2f | %.2f %.2f %.2f | %.2f %.2f %.2f], extrinsicMatrix: [%.2f %.2f %.2f %.2f | %.2f %.2f %.2f %.2f | %.2f %.2f %.2f %.2f] pixelSize:%.3f mm%@, ref:{%.0fx%.0f}"), *(float *)&v5, *(float *)&v4, *(float *)&v6, *((float *)&v5 + 1), *((float *)&v4 + 1), *((float *)&v6 + 1), *((float *)&v5 + 2), *((float *)&v4 + 2), *((float *)&v6 + 2), *(float *)&v8, *(float *)&v7, *(float *)&v10, *(float *)&v9, *((float *)&v8 + 1), *((float *)&v7 + 1), *((float *)&v10 + 1),
               *((float *)&v9 + 1),
               *((float *)&v8 + 2),
               *((float *)&v7 + 2),
               *((float *)&v10 + 2),
               *((float *)&v9 + 2),
               pixelSize,
               v15,
               *(_QWORD *)&internal->intrinsicMatrixReferenceDimensions.width,
               *(_QWORD *)&internal->intrinsicMatrixReferenceDimensions.height);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCameraCalibrationData debugDescription](self, "debugDescription"));
}

- (matrix_float3x3)intrinsicMatrix
{
  AVCameraCalibrationDataInternal *internal;
  simd_float3 v3;
  simd_float3 v4;
  simd_float3 v5;
  matrix_float3x3 result;

  internal = self->_internal;
  v3 = *(simd_float3 *)internal->_anon_10;
  v4 = *(simd_float3 *)&internal->_anon_10[16];
  v5 = *(simd_float3 *)&internal->_anon_10[32];
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

- (CGSize)intrinsicMatrixReferenceDimensions
{
  AVCameraCalibrationDataInternal *internal;
  double width;
  double height;
  CGSize result;

  internal = self->_internal;
  width = internal->intrinsicMatrixReferenceDimensions.width;
  height = internal->intrinsicMatrixReferenceDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (matrix_float4x3)extrinsicMatrix
{
  AVCameraCalibrationDataInternal *internal;
  simd_float3 v3;
  simd_float3 v4;
  simd_float3 v5;
  simd_float3 v6;
  matrix_float4x3 result;

  internal = self->_internal;
  v3 = *(simd_float3 *)internal->_anon_50;
  v4 = *(simd_float3 *)&internal->_anon_50[16];
  v5 = *(simd_float3 *)&internal->_anon_50[32];
  v6 = *(simd_float3 *)&internal->_anon_50[48];
  result.columns[3] = v6;
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

- (float)pixelSize
{
  return self->_internal->pixelSize;
}

- (NSData)lensDistortionLookupTable
{
  double v2;
  AVCameraCalibrationDataInternal *internal;
  NSData *lensDistortionLookupTable;
  NSData *lensDistortionCoefficients;

  internal = self->_internal;
  lensDistortionLookupTable = internal->lensDistortionLookupTable;
  if (!lensDistortionLookupTable)
  {
    lensDistortionCoefficients = internal->lensDistortionCoefficients;
    if (lensDistortionCoefficients)
    {
      *(float *)&v2 = internal->pixelSize;
      self->_internal->lensDistortionLookupTable = (NSData *)-[AVCameraCalibrationData _distortionLookupTableFromCoefficients:distortionCenter:pixelSize:referenceDimensions:lookupTableLength:](self, "_distortionLookupTableFromCoefficients:distortionCenter:pixelSize:referenceDimensions:lookupTableLength:", lensDistortionCoefficients, 42, internal->lensDistortionCenter.x, internal->lensDistortionCenter.y, v2, internal->intrinsicMatrixReferenceDimensions.width, internal->intrinsicMatrixReferenceDimensions.height);
      lensDistortionLookupTable = self->_internal->lensDistortionLookupTable;
    }
    else
    {
      lensDistortionLookupTable = 0;
    }
  }
  return lensDistortionLookupTable;
}

- (NSData)inverseLensDistortionLookupTable
{
  double v2;
  AVCameraCalibrationDataInternal *internal;
  NSData *inverseLensDistortionLookupTable;
  NSData *inverseLensDistortionCoefficients;

  internal = self->_internal;
  inverseLensDistortionLookupTable = internal->inverseLensDistortionLookupTable;
  if (!inverseLensDistortionLookupTable)
  {
    inverseLensDistortionCoefficients = internal->inverseLensDistortionCoefficients;
    if (inverseLensDistortionCoefficients)
    {
      *(float *)&v2 = internal->pixelSize;
      self->_internal->inverseLensDistortionLookupTable = (NSData *)-[AVCameraCalibrationData _distortionLookupTableFromCoefficients:distortionCenter:pixelSize:referenceDimensions:lookupTableLength:](self, "_distortionLookupTableFromCoefficients:distortionCenter:pixelSize:referenceDimensions:lookupTableLength:", inverseLensDistortionCoefficients, 42, internal->lensDistortionCenter.x, internal->lensDistortionCenter.y, v2, internal->intrinsicMatrixReferenceDimensions.width, internal->intrinsicMatrixReferenceDimensions.height);
      inverseLensDistortionLookupTable = self->_internal->inverseLensDistortionLookupTable;
    }
    else
    {
      inverseLensDistortionLookupTable = 0;
    }
  }
  return inverseLensDistortionLookupTable;
}

- (CGPoint)lensDistortionCenter
{
  AVCameraCalibrationDataInternal *internal;
  double x;
  double y;
  CGPoint result;

  internal = self->_internal;
  x = internal->lensDistortionCenter.x;
  y = internal->lensDistortionCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (AVCameraCalibrationData)initWithCameraCalibrationDataDictionary:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  AVCameraCalibrationData *result;

  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("VersionMajor"));
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("VersionMinor"));
  if (objc_msgSend(v7, "intValue") != 1
    || objc_msgSend(v8, "intValue")
    || (result = -[AVCameraCalibrationData initWithDepthMetadataDictionary:](self, "initWithDepthMetadataDictionary:", a3)) == 0)
  {
    v9 = (void *)AVLocalizedError();
    result = 0;
    if (a4)
    {
      if (v9)
      {
        result = 0;
        *a4 = v9;
      }
    }
  }
  return result;
}

- (id)cameraCalibrationDataDictionary
{
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  AVCameraCalibrationDataInternal *internal;
  NSData *lensDistortionCoefficients;
  id v11;
  NSData *inverseLensDistortionCoefficients;
  id v13;
  double x;
  double y;

  result = self->_internal->cameraCalibrationDataDictionary;
  if (!result)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E424D038, CFSTR("VersionMajor"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E424D050, CFSTR("VersionMinor"));
    v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_internal->_anon_10, 48);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D03EE8]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CGSizeCreateDictionaryRepresentation(self->_internal->intrinsicMatrixReferenceDimensions), *MEMORY[0x1E0D03EF0]);
    v6 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_internal->_anon_50, 64);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D03EE0]);
    *(float *)&v7 = self->_internal->pixelSize;
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D03F10]);
    internal = self->_internal;
    lensDistortionCoefficients = internal->lensDistortionCoefficients;
    if (lensDistortionCoefficients)
    {
      v11 = (id)-[NSData copy](lensDistortionCoefficients, "copy");
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D03F08]);
      internal = self->_internal;
    }
    inverseLensDistortionCoefficients = internal->inverseLensDistortionCoefficients;
    if (inverseLensDistortionCoefficients)
    {
      v13 = (id)-[NSData copy](inverseLensDistortionCoefficients, "copy");
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D03EF8]);
      internal = self->_internal;
    }
    x = internal->lensDistortionCenter.x;
    y = internal->lensDistortionCenter.y;
    if (x != *MEMORY[0x1E0C9D538] || y != *(double *)(MEMORY[0x1E0C9D538] + 8))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CGPointCreateDictionaryRepresentation(*(CGPoint *)&x), *MEMORY[0x1E0D03F00]);
    self->_internal->cameraCalibrationDataDictionary = (NSDictionary *)objc_msgSend(v4, "copy");
    return self->_internal->cameraCalibrationDataDictionary;
  }
  return result;
}

- (AVCameraCalibrationData)initWithAuxiliaryMetadata:(CGImageMetadata *)a3
{
  AVCameraCalibrationData *v4;
  AVCameraCalibrationDataInternal *v5;
  uint64_t v6;
  CGImageMetadataTag *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  id v17;
  float v18;
  id v19;
  float v20;
  CGImageMetadataTag *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  id v34;
  float v35;
  CGImageMetadataTag *v36;
  NSData *v37;
  _DWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  int v43;
  CGImageMetadataTag *v44;
  NSData *v45;
  _DWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  int v51;
  id v52;
  double v53;
  double v54;
  float v55;
  id v56;
  float v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)AVCameraCalibrationData;
  v4 = -[AVCameraCalibrationData init](&v67, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVCameraCalibrationDataInternal);
    v4->_internal = v5;
    if (!v5)
      goto LABEL_35;
    v6 = *MEMORY[0x1E0D05210];
    v7 = AVAuxiliaryMetadataArrayTagWithPrefixedKey(a3, *MEMORY[0x1E0D05210], *MEMORY[0x1E0D05230]);
    if (-[CGImageMetadataTag count](v7, "count") != 9)
      goto LABEL_35;
    if (v7 && -[CGImageMetadataTag count](v7, "count") == 9)
    {
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0), "floatValue");
      *(_DWORD *)v4->_internal->_anon_10 = v8;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 1), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[4] = v9;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 2), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[8] = v10;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 3), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[16] = v11;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 4), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[20] = v12;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 5), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[24] = v13;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 6), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[32] = v14;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 7), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[36] = v15;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 8), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[40] = v16;
    }
    v17 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E0D05240]);
    if (!v17)
      goto LABEL_35;
    objc_msgSend(v17, "floatValue");
    v4->_internal->intrinsicMatrixReferenceDimensions.width = v18;
    v19 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E0D05238]);
    if (!v19)
      goto LABEL_35;
    objc_msgSend(v19, "floatValue");
    v4->_internal->intrinsicMatrixReferenceDimensions.height = v20;
    v21 = AVAuxiliaryMetadataArrayTagWithPrefixedKey(a3, v6, *MEMORY[0x1E0D05220]);
    if (-[CGImageMetadataTag count](v21, "count") != 12)
      goto LABEL_35;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 0), "floatValue");
    *(_DWORD *)v4->_internal->_anon_50 = v22;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 1), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[4] = v23;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 2), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[8] = v24;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 3), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[16] = v25;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 4), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[20] = v26;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 5), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[24] = v27;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 6), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[32] = v28;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 7), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[36] = v29;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 8), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[40] = v30;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 9), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[48] = v31;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 10), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[52] = v32;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 11), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[56] = v33;
    v34 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E0D05268]);
    if (v34)
    {
      objc_msgSend(v34, "floatValue");
      v4->_internal->pixelSize = v35;
      v36 = AVAuxiliaryMetadataArrayTagWithPrefixedKey(a3, v6, *MEMORY[0x1E0D05260]);
      if (-[CGImageMetadataTag count](v36, "count") == 8)
      {
        v37 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
        v38 = (_DWORD *)-[NSData mutableBytes](v37, "mutableBytes");
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v39 = -[CGImageMetadataTag countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v64 != v41)
                objc_enumerationMutation(v36);
              objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "floatValue");
              *v38++ = v43;
            }
            v40 = -[CGImageMetadataTag countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
          }
          while (v40);
        }
        v4->_internal->lensDistortionCoefficients = v37;
      }
      v44 = AVAuxiliaryMetadataArrayTagWithPrefixedKey(a3, v6, *MEMORY[0x1E0D05248]);
      if (-[CGImageMetadataTag count](v44, "count") == 8)
      {
        v45 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
        v46 = (_DWORD *)-[NSData mutableBytes](v45, "mutableBytes");
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v47 = -[CGImageMetadataTag countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v60;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v60 != v49)
                objc_enumerationMutation(v44);
              objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "floatValue");
              *v46++ = v51;
            }
            v48 = -[CGImageMetadataTag countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          }
          while (v48);
        }
        v4->_internal->inverseLensDistortionCoefficients = v45;
      }
      v52 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E0D05250]);
      v53 = 0.0;
      v54 = 0.0;
      if (v52)
      {
        objc_msgSend(v52, "floatValue", 0.0);
        v54 = v55;
      }
      v4->_internal->lensDistortionCenter.x = v54;
      v56 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E0D05258]);
      if (v56)
      {
        objc_msgSend(v56, "floatValue");
        v53 = v57;
      }
      v4->_internal->lensDistortionCenter.y = v53;
    }
    else
    {
LABEL_35:

      return 0;
    }
  }
  return v4;
}

- (AVCameraCalibrationData)initWithDepthMetadataDictionary:(id)a3
{
  AVCameraCalibrationData *v4;
  AVCameraCalibrationDataInternal *v5;
  void *v6;
  const __CFDictionary *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFDictionary *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVCameraCalibrationData;
  v4 = -[AVCameraCalibrationData init](&v17, sel_init);
  if (!v4)
    return v4;
  v5 = objc_alloc_init(AVCameraCalibrationDataInternal);
  v4->_internal = v5;
  if (!v5)
    goto LABEL_17;
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D052C0]);
  if (objc_msgSend(v6, "length") != 48)
    goto LABEL_17;
  objc_msgSend(v6, "getBytes:length:", v4->_internal->_anon_10, 48);
  v7 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D052C8]);
  if (!v7)
    goto LABEL_17;
  if (!CGSizeMakeWithDictionaryRepresentation(v7, &v4->_internal->intrinsicMatrixReferenceDimensions))
    goto LABEL_17;
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D052B0]);
  if (objc_msgSend(v8, "length") != 64)
    goto LABEL_17;
  objc_msgSend(v8, "getBytes:length:", v4->_internal->_anon_50, 64);
  v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D052E8]);
  if (!v9)
    goto LABEL_17;
  objc_msgSend(v9, "floatValue");
  v4->_internal->pixelSize = v10;
  v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D052E0]);
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(v11, "length") != 32)
      goto LABEL_17;
    v4->_internal->lensDistortionCoefficients = (NSData *)objc_msgSend(v12, "copy");
  }
  v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D052D0]);
  if (!v13)
    goto LABEL_14;
  v14 = v13;
  if (objc_msgSend(v13, "length") != 32)
  {
LABEL_17:

    return 0;
  }
  v4->_internal->inverseLensDistortionCoefficients = (NSData *)objc_msgSend(v14, "copy");
LABEL_14:
  v15 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D052D8]);
  if (v15)
    CGPointMakeWithDictionaryRepresentation(v15, &v4->_internal->lensDistortionCenter);
  return v4;
}

- (AVCameraCalibrationData)cameraCalibrationDataWithExifOrientation:(unsigned int)a3
{
  _QWORD *v4;
  void *v5;
  AVCameraCalibrationDataInternal *internal;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = -[AVCameraCalibrationData _initEmpty]([AVCameraCalibrationData alloc], "_initEmpty");
  v5 = v4;
  if (!v4)
    return (AVCameraCalibrationData *)v5;
  internal = self->_internal;
  v7 = v4[1];
  v8 = *(_OWORD *)internal->_anon_10;
  v9 = *(_OWORD *)&internal->_anon_10[32];
  *(_OWORD *)(v7 + 32) = *(_OWORD *)&internal->_anon_10[16];
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)(v7 + 16) = v8;
  *(CGSize *)(v7 + 64) = internal->intrinsicMatrixReferenceDimensions;
  v10 = *(_OWORD *)internal->_anon_50;
  v11 = *(_OWORD *)&internal->_anon_50[16];
  v12 = *(_OWORD *)&internal->_anon_50[48];
  *(_OWORD *)(v7 + 112) = *(_OWORD *)&internal->_anon_50[32];
  *(_OWORD *)(v7 + 128) = v12;
  *(_OWORD *)(v7 + 80) = v10;
  *(_OWORD *)(v7 + 96) = v11;
  *(float *)(v7 + 144) = internal->pixelSize;
  *(_QWORD *)(v7 + 152) = internal->lensDistortionCoefficients;
  *(_QWORD *)(v7 + 160) = internal->inverseLensDistortionCoefficients;
  *(CGPoint *)(v7 + 168) = internal->lensDistortionCenter;
  *(_QWORD *)(v7 + 184) = internal->lensDistortionLookupTable;
  *(_QWORD *)(v7 + 192) = internal->inverseLensDistortionLookupTable;
  if (!FigDepthRotateCalibrationData())
    return (AVCameraCalibrationData *)v5;

  return 0;
}

- (CGImageMetadata)copyAuxiliaryMetadata
{
  CGImageMetadata *Mutable;
  CGImageMetadata *v4;
  const __CFString *v5;
  const __CFString *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const void *v29;
  double v30;
  void *v31;
  char *v32;
  double v33;
  uint64_t i;
  void *v35;
  char *v36;
  double v37;
  uint64_t j;
  AVCameraCalibrationDataInternal *internal;
  BOOL v40;
  _QWORD v42[12];
  _QWORD v43[10];

  v43[9] = *MEMORY[0x1E0C80C00];
  Mutable = CGImageMetadataCreateMutable();
  v4 = Mutable;
  if (!Mutable)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v4;
  }
  v5 = (const __CFString *)*MEMORY[0x1E0D05208];
  v6 = (const __CFString *)*MEMORY[0x1E0D05210];
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E0D05208], (CFStringRef)*MEMORY[0x1E0D05210], 0))
  {
    fig_log_get_emitter();
LABEL_27:
    FigDebugAssert3();
    CFRelease(v4);
    return 0;
  }
  LODWORD(v7) = *(_DWORD *)self->_internal->_anon_10;
  v43[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  LODWORD(v8) = *(_DWORD *)&self->_internal->_anon_10[4];
  v43[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  LODWORD(v9) = *(_DWORD *)&self->_internal->_anon_10[8];
  v43[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  LODWORD(v10) = *(_DWORD *)&self->_internal->_anon_10[16];
  v43[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  LODWORD(v11) = *(_DWORD *)&self->_internal->_anon_10[20];
  v43[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  LODWORD(v12) = *(_DWORD *)&self->_internal->_anon_10[24];
  v43[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  LODWORD(v13) = *(_DWORD *)&self->_internal->_anon_10[32];
  v43[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  LODWORD(v14) = *(_DWORD *)&self->_internal->_anon_10[36];
  v43[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  LODWORD(v15) = *(_DWORD *)&self->_internal->_anon_10[40];
  v43[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v16 = (const void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 9);
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05230], v16)
    || !AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05240], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_internal->intrinsicMatrixReferenceDimensions.width))|| !AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05238], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_internal->intrinsicMatrixReferenceDimensions.height)))
  {
    fig_log_get_emitter();
    goto LABEL_27;
  }
  LODWORD(v17) = *(_DWORD *)self->_internal->_anon_50;
  v42[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  LODWORD(v18) = *(_DWORD *)&self->_internal->_anon_50[4];
  v42[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  LODWORD(v19) = *(_DWORD *)&self->_internal->_anon_50[8];
  v42[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  LODWORD(v20) = *(_DWORD *)&self->_internal->_anon_50[16];
  v42[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  LODWORD(v21) = *(_DWORD *)&self->_internal->_anon_50[20];
  v42[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  LODWORD(v22) = *(_DWORD *)&self->_internal->_anon_50[24];
  v42[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  LODWORD(v23) = *(_DWORD *)&self->_internal->_anon_50[32];
  v42[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  LODWORD(v24) = *(_DWORD *)&self->_internal->_anon_50[36];
  v42[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  LODWORD(v25) = *(_DWORD *)&self->_internal->_anon_50[40];
  v42[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  LODWORD(v26) = *(_DWORD *)&self->_internal->_anon_50[48];
  v42[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  LODWORD(v27) = *(_DWORD *)&self->_internal->_anon_50[52];
  v42[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  LODWORD(v28) = *(_DWORD *)&self->_internal->_anon_50[56];
  v42[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v29 = (const void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 12);
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05220], v29))
    goto LABEL_26;
  *(float *)&v30 = self->_internal->pixelSize;
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05268], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30)))goto LABEL_26;
  if (-[NSData length](self->_internal->lensDistortionCoefficients, "length") == 32)
  {
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v32 = -[NSData bytes](self->_internal->lensDistortionCoefficients, "bytes");
    for (i = 0; i != 32; i += 4)
    {
      LODWORD(v33) = *(_DWORD *)&v32[i];
      objc_msgSend(v31, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33));
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05260], v31))
      goto LABEL_26;
  }
  if (-[NSData length](self->_internal->inverseLensDistortionCoefficients, "length") == 32)
  {
    v35 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = -[NSData bytes](self->_internal->inverseLensDistortionCoefficients, "bytes");
    for (j = 0; j != 32; j += 4)
    {
      LODWORD(v37) = *(_DWORD *)&v36[j];
      objc_msgSend(v35, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37));
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05248], v35))
      goto LABEL_26;
  }
  internal = self->_internal;
  v40 = internal->lensDistortionCenter.x == *MEMORY[0x1E0C9D538]
     && internal->lensDistortionCenter.y == *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!v40
    && (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05250], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"))|| !AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E0D05258], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_internal->lensDistortionCenter.y))))
  {
LABEL_26:
    fig_log_get_emitter();
    goto LABEL_27;
  }
  return v4;
}

- (id)_initEmpty
{
  AVCameraCalibrationData *v2;
  AVCameraCalibrationDataInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCameraCalibrationData;
  v2 = -[AVCameraCalibrationData init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVCameraCalibrationDataInternal);
    v2->_internal = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  AVCameraCalibrationDataInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVCameraCalibrationData;
  -[AVCameraCalibrationData dealloc](&v4, sel_dealloc);
}

- (id)_distortionLookupTableFromCoefficients:(id)a3 distortionCenter:(CGPoint)a4 pixelSize:(float)a5 referenceDimensions:(CGSize)a6 lookupTableLength:(int)a7
{
  double height;
  double width;
  double y;
  double x;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  void *v29;

  if (!a3 || (height = a6.height, width = a6.width, y = a4.y, x = a4.x, objc_msgSend(a3, "length") != 32))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
LABEL_19:
    v29 = 0;
    goto LABEL_16;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * a7);
  v15 = v14;
  if (!v14 || (v16 = objc_msgSend(v14, "mutableBytes")) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  v17 = v16;
  v18 = (float *)objc_msgSend(a3, "bytes");
  v19 = width - x;
  if (x > width - x)
    v19 = x;
  v20 = height - y;
  if (y > height - y)
    v20 = y;
  if (a7 >= 1)
  {
    v21 = 0;
    v22 = sqrt(v20 * v20 + v19 * v19);
    v19 = (double)(a7 - 1);
    v20 = v22 * a5;
    do
    {
      v23 = v20 * (double)(int)v21 / v19 * (v20 * (double)(int)v21 / v19);
      v24 = v23 * v23;
      v25 = v23 * (v23 * v23);
      v26 = (v23 * v18[1]
           + *v18
           + v18[2] * v24
           + v18[3] * v25
           + v18[4] * (v24 * v24)
           + v18[5] * (v23 * v23 * v25)
           + v18[6] * (v25 * v25)
           + v18[7] * (v24 * v24 * v25))
          / 100.0
          + 1.0;
      if (v26 <= 0.0)
        v27 = 0.0;
      else
        v27 = 1.0 / v26 + -1.0;
      v28 = v27;
      *(float *)(v17 + 4 * v21++) = v28;
    }
    while (a7 != v21);
  }
  v29 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v15, v19, v20);
LABEL_16:

  return v29;
}

@end
