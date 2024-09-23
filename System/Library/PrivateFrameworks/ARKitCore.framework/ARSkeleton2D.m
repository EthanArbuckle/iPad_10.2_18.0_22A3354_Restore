@implementation ARSkeleton2D

- (id)definition
{
  return +[ARSkeletonDefinition defaultBody2DSkeletonDefinition](ARSkeletonDefinition, "defaultBody2DSkeletonDefinition");
}

- (ARSkeleton2D)initWithDetectedSkeleton:(id)a3
{
  id v5;
  id *v6;
  ARSkeleton2D *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSkeleton2D;
  v6 = -[ARSkeleton initPrivate](&v9, sel_initPrivate);
  v7 = (ARSkeleton2D *)v6;
  if (v6)
    objc_storeStrong(v6 + 3, a3);

  return v7;
}

- (const)jointLandmarks
{
  return (const simd_float2 *)-[ABPK2DDetectionResult joints](self->_skeleton, "joints");
}

- (unint64_t)jointCount
{
  return -[ABPK2DDetectionResult jointCount](self->_skeleton, "jointCount");
}

- (BOOL)isJointTracked:(int64_t)a3
{
  if (a3 < 0)
    return 0;
  if (-[ABPK2DDetectionResult jointCount](self->_skeleton, "jointCount") - 1 >= (unint64_t)a3)
    return *(_DWORD *)(-[ABPK2DDetectionResult jointTrackingStates](self->_skeleton, "jointTrackingStates") + 4 * a3) != 0;
  return 0;
}

- (simd_float2)landmarkForJointNamed:(ARSkeletonJointName)jointName
{
  NSString *v4;
  void *v5;
  unint64_t v6;

  v4 = jointName;
  -[ARSkeleton2D definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForJointName:", v4);

  if (v6 >= -[ARSkeleton2D jointCount](self, "jointCount"))
    return (simd_float2)vdup_n_s32(0x7FC00000u);
  return -[ARSkeleton2D jointLandmarks](self, "jointLandmarks")[8 * v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_skeleton, CFSTR("skeleton"));
}

- (ARSkeleton2D)initWithCoder:(id)a3
{
  id v4;
  ARSkeleton2D *v5;
  uint64_t v6;
  ABPK2DDetectionResult *skeleton;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSkeleton2D;
  v5 = -[ARSkeleton initPrivate](&v9, sel_initPrivate);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skeleton"));
    v6 = objc_claimAutoreleasedReturnValue();
    skeleton = v5->_skeleton;
    v5->_skeleton = (ABPK2DDetectionResult *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[ABPK2DDetectionResult isEqual:](self->_skeleton, "isEqual:", v4[3]);
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton, 0);
}

@end
