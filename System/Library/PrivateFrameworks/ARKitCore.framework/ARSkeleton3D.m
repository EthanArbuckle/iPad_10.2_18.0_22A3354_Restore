@implementation ARSkeleton3D

- (id)definition
{
  return +[ARSkeletonDefinition defaultBody3DSkeletonDefinition](ARSkeletonDefinition, "defaultBody3DSkeletonDefinition");
}

- (ARSkeleton3D)initWithCoreRESkeletonResult:(id)a3
{
  id v5;
  id *v6;
  ARSkeleton3D *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSkeleton3D;
  v6 = -[ARSkeleton initPrivate](&v9, sel_initPrivate);
  v7 = (ARSkeleton3D *)v6;
  if (v6)
    objc_storeStrong(v6 + 3, a3);

  return v7;
}

- (unint64_t)jointCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[ARSkeleton3D definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jointNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (const)jointModelTransforms
{
  return (const simd_float4x4 *)-[ARCoreRESkeletonResult jointModelTransforms](self->_skeleton, "jointModelTransforms");
}

- (const)jointLocalTransforms
{
  return (const simd_float4x4 *)-[ARCoreRESkeletonResult jointLocalTransforms](self->_skeleton, "jointLocalTransforms");
}

- (ARCoreRESkeletonResult)coreRESkeleton
{
  return self->_skeleton;
}

- (BOOL)isJointTracked:(int64_t)a3
{
  return (a3 & 0x8000000000000000) == 0
      && -[ARCoreRESkeletonResult jointTransformCount](self->_skeleton, "jointTransformCount") - 1 >= a3
      && -[ARCoreRESkeletonResult isJointTracked:](self->_skeleton, "isJointTracked:", a3);
}

- (simd_float4x4)modelTransformForJointName:(ARSkeletonJointName)jointName
{
  NSString *v4;
  void *v5;
  unint64_t v6;
  const simd_float4x4 *v7;
  int32x4_t v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4x4 result;

  v4 = jointName;
  -[ARSkeleton3D definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForJointName:", v4);

  if (v6 >= -[ARSkeleton3D jointCount](self, "jointCount"))
  {
    v8 = vdupq_n_s32(0x7FC00000u);
    v9 = (simd_float4)v8;
    v10 = (simd_float4)v8;
    v11 = (simd_float4)v8;
  }
  else
  {
    v7 = -[ARSkeleton3D jointModelTransforms](self, "jointModelTransforms") + (v6 << 6);
    v8 = (int32x4_t)v7->columns[0];
    v9 = v7->columns[1];
    v10 = v7->columns[2];
    v11 = v7->columns[3];
  }
  result.columns[3] = v11;
  result.columns[2] = v10;
  result.columns[1] = v9;
  result.columns[0] = (simd_float4)v8;
  return result;
}

- (simd_float4x4)localTransformForJointName:(ARSkeletonJointName)jointName
{
  NSString *v4;
  void *v5;
  unint64_t v6;
  const simd_float4x4 *v7;
  int32x4_t v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4x4 result;

  v4 = jointName;
  -[ARSkeleton3D definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForJointName:", v4);

  if (v6 >= -[ARSkeleton3D jointCount](self, "jointCount"))
  {
    v8 = vdupq_n_s32(0x7FC00000u);
    v9 = (simd_float4)v8;
    v10 = (simd_float4)v8;
    v11 = (simd_float4)v8;
  }
  else
  {
    v7 = -[ARSkeleton3D jointLocalTransforms](self, "jointLocalTransforms") + (v6 << 6);
    v8 = (int32x4_t)v7->columns[0];
    v9 = v7->columns[1];
    v10 = v7->columns[2];
    v11 = v7->columns[3];
  }
  result.columns[3] = v11;
  result.columns[2] = v10;
  result.columns[1] = v9;
  result.columns[0] = (simd_float4)v8;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_skeleton, CFSTR("skeleton"));
}

- (ARSkeleton3D)initWithCoder:(id)a3
{
  id v4;
  ARSkeleton3D *v5;
  uint64_t v6;
  ARCoreRESkeletonResult *skeleton;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSkeleton3D;
  v5 = -[ARSkeleton initPrivate](&v9, sel_initPrivate);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("skeleton"));
    v6 = objc_claimAutoreleasedReturnValue();
    skeleton = v5->_skeleton;
    v5->_skeleton = (ARCoreRESkeletonResult *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[ARCoreRESkeletonResult isEqual:](self->_skeleton, "isEqual:", v4[3]);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton, 0);
}

@end
