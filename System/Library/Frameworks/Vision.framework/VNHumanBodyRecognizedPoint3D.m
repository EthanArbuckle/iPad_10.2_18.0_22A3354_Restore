@implementation VNHumanBodyRecognizedPoint3D

- (__n128)initWithModelPosition:(double)a3 localPosition:(double)a4 jointName:(double)a5 parentJoint:(__n128)a6
{
  id v15;
  VNHumanBodyRecognizedPoint3D *v16;
  __n128 *v17;
  __n128 *v18;
  objc_super v28;

  v15 = a12;
  v28.receiver = a1;
  v28.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  v16 = -[VNRecognizedPoint3D initWithPosition:identifier:](&v28, sel_initWithPosition_identifier_, a11, a2, a3, a4, a5);
  v17 = (__n128 *)v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parentJoint, a12);
    v17[6] = a6;
    v17[7] = a7;
    v17[8] = a8;
    v17[9] = a9;
    v18 = v17;
  }

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  v3 = -[NSString hash](self->_parentJoint, "hash") ^ __ROR8__(-[VNRecognizedPoint3D hash](&v5, sel_hash), 51);
  return VNHashMatrixFloat4x4((__n128)self[1].super.super, *(__n128 *)self[1].super._anon_10, *(__n128 *)&self[1].super._anon_10[16], *(__n128 *)&self[1].super._anon_10[32]) ^ __ROR8__(v3, 51);
}

- (VNHumanBodyRecognizedPoint3D)initWithCoder:(id)a3
{
  id v4;
  VNHumanBodyRecognizedPoint3D *v5;
  VNHumanBodyRecognizedPoint3D *v6;
  VNHumanBodyRecognizedPoint3D *v7;
  VNPoint3D v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  NSString *parentJoint;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  v5 = -[VNRecognizedPoint3D initWithCoder:](&v15, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5 + 1;
    objc_msgSend(v4, "vn_decode4x4MatrixForKey:", CFSTR("localPositionMatrix"));
    v7->super.super = v8;
    *(_OWORD *)v6[1].super._anon_10 = v9;
    *(_OWORD *)&v6[1].super._anon_10[16] = v10;
    *(_OWORD *)&v6[1].super._anon_10[32] = v11;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("parentJoint"));
    v12 = objc_claimAutoreleasedReturnValue();
    parentJoint = v6->_parentJoint;
    v6->_parentJoint = (NSString *)v12;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  v4 = a3;
  -[VNRecognizedPoint3D encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentJoint, CFSTR("parentJoint"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "vn_encode4x4Matrix:forKey:", CFSTR("localPositionMatrix"), *(double *)&self[1].super.super.super.isa, *(double *)self[1].super._anon_10, *(double *)&self[1].super._anon_10[16], *(double *)&self[1].super._anon_10[32]);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  unsigned int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNHumanBodyRecognizedPoint3D;
  if (-[VNRecognizedPoint3D isEqual:](&v13, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "parentJoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (VisionCoreEqualOrNilObjects())
    {
      objc_msgSend(v5, "localPosition");
      v11 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v8, *(float32x4_t *)self[1].super._anon_10), (int8x16_t)vceqq_f32(v7, (float32x4_t)self[1].super.super)), vandq_s8((int8x16_t)vceqq_f32(v9, *(float32x4_t *)&self[1].super._anon_10[16]), (int8x16_t)vceqq_f32(v10, *(float32x4_t *)&self[1].super._anon_10[32])))) >> 31;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (simd_float4x4)localPosition
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  _OWORD v6[4];
  simd_float4x4 result;

  objc_copyStruct(v6, &self[1], 64, 1, 0);
  v2 = (simd_float4)v6[0];
  v3 = (simd_float4)v6[1];
  v4 = (simd_float4)v6[2];
  v5 = (simd_float4)v6[3];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (VNHumanBodyPose3DObservationJointName)parentJoint
{
  return (VNHumanBodyPose3DObservationJointName)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentJoint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
