@implementation VNImageHomographicAlignmentObservation

- (VNImageHomographicAlignmentObservation)init
{
  VNImageHomographicAlignmentObservation *v2;
  VNImageHomographicAlignmentObservation *v3;
  __int128 v4;
  __int128 v5;
  VNImageHomographicAlignmentObservation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNImageHomographicAlignmentObservation;
  v2 = -[VNObservation init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    v4 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
    *(_OWORD *)&v2[1].super.super.super.isa = *MEMORY[0x1E0C83FE8];
    *(_OWORD *)&v2[1].super.super._confidence = v5;
    *(_OWORD *)&v2[1].super.super._requestImageBuffers = v4;
    v6 = v2;
  }

  return v3;
}

- (VNImageHomographicAlignmentObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageHomographicAlignmentObservation *v5;
  objc_class *v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  NSPointerArray *v11;
  VNImageHomographicAlignmentObservation *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNImageHomographicAlignmentObservation;
  v5 = -[VNImageAlignmentObservation initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "vn_decode3x3MatrixForKey:", CFSTR("warpTransform"));
    v5[1].super.super.super.isa = v6;
    LODWORD(v5[1].super.super._originatingRequestSpecifier) = v7;
    *(_QWORD *)&v5[1].super.super._confidence = v8;
    LODWORD(v5[1].super.super._uuid) = v9;
    LODWORD(v5[1].super.super._requestImageBuffersCacheKeys) = v10;
    v5[1].super.super._requestImageBuffers = v11;
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageHomographicAlignmentObservation;
  -[VNImageAlignmentObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encode3x3Matrix:forKey:", CFSTR("warpTransform"), *(double *)&self[1].super.super.super.isa, *(double *)&self[1].super.super._confidence, *(double *)&self[1].super.super._requestImageBuffers);

}

- (id)vn_cloneObject
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageHomographicAlignmentObservation;
  -[VNImageAlignmentObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_OWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = *(_OWORD *)&self[1].super.super._confidence;
    v4 = *(_OWORD *)&self[1].super.super._requestImageBuffers;
    v3[7] = *(_OWORD *)&self[1].super.super.super.isa;
    v3[8] = v5;
    v3[9] = v4;
  }
  return v3;
}

- (unint64_t)hash
{
  id v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)VNImageHomographicAlignmentObservation;
  v3 = -[VNImageAlignmentObservation hash](&v30, sel_hash);
  -[VNImageHomographicAlignmentObservation warpTransform](self, "warpTransform");
  v13 = (unint64_t)LODWORD(v12) << 13;
  if (v12 == 0.0)
    v13 = 0;
  v14 = LODWORD(v4);
  if (v4 == 0.0)
    v14 = 0;
  v15 = v13 ^ v14;
  v16 = LODWORD(v5);
  if (v5 == 0.0)
    v16 = 0;
  v17 = v16 ^ (v15 << 13);
  v18 = LODWORD(v6);
  if (v6 == 0.0)
    v18 = 0;
  v19 = v18 ^ __ROR8__(v17, 51);
  v20 = LODWORD(v7);
  if (v7 == 0.0)
    v20 = 0;
  v21 = v20 ^ __ROR8__(v19, 51);
  v22 = LODWORD(v8);
  if (v8 == 0.0)
    v22 = 0;
  v23 = v22 ^ __ROR8__(v21, 51);
  v24 = LODWORD(v9);
  if (v9 == 0.0)
    v24 = 0;
  v25 = v24 ^ __ROR8__(v23, 51);
  v26 = LODWORD(v10);
  if (v10 == 0.0)
    v26 = 0;
  v27 = v26 ^ __ROR8__(v25, 51);
  v28 = LODWORD(v11);
  if (v11 == 0.0)
    v28 = 0;
  return v28 ^ __ROR8__(v27, 51) ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNImageHomographicAlignmentObservation *v4;
  VNImageHomographicAlignmentObservation *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  uint32x4_t v12;
  unsigned int v13;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  objc_super v18;

  v4 = (VNImageHomographicAlignmentObservation *)a3;
  if (self == v4)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VNImageHomographicAlignmentObservation;
    if (-[VNImageAlignmentObservation isEqual:](&v18, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNImageHomographicAlignmentObservation warpTransform](self, "warpTransform");
      v15 = v7;
      v16 = v6;
      v17 = v8;
      -[VNImageHomographicAlignmentObservation warpTransform](v5, "warpTransform");
      v12 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v16, v9), (int8x16_t)vceqq_f32(v15, v10)), (int8x16_t)vceqq_f32(v17, v11));
      v12.i32[3] = v12.i32[2];
      v13 = vminvq_u32(v12) >> 31;

    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (matrix_float3x3)warpTransform
{
  simd_float3 v2;
  simd_float3 v3;
  simd_float3 v4;
  matrix_float3x3 result;

  v2 = *(simd_float3 *)&self[1].super.super.super.isa;
  v3 = *(simd_float3 *)&self[1].super.super._confidence;
  v4 = *(simd_float3 *)&self[1].super.super._requestImageBuffers;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setWarpTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNHomographicImageRegistrationRequest");
}

@end
