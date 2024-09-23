@implementation ARBodyAnchor

- (ARBodyAnchor)initWithIdentifier:(double)a3 transform:(double)a4 tracked:(double)a5 skeletonData:(uint64_t)a6
{
  id v13;
  ARBodyAnchor *v14;
  ARBodyAnchor *v15;
  ARSkeleton3D *v16;
  ARSkeleton3D *skeleton;
  double v18;
  ARSkeleton2D *v19;
  void *v20;
  void *v21;
  ARSkeleton2D *v22;
  ARBody2D *v23;
  ARBody2D *referenceBody;
  objc_super v30;

  v13 = a9;
  v30.receiver = a1;
  v30.super_class = (Class)ARBodyAnchor;
  v14 = -[ARAnchor initWithIdentifier:transform:](&v30, sel_initWithIdentifier_transform_, a7, a2, a3, a4, a5);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_skeletonData, a9);
    v16 = -[ARSkeleton3D initWithCoreRESkeletonResult:]([ARSkeleton3D alloc], "initWithCoreRESkeletonResult:", v15->_skeletonData);
    skeleton = v15->_skeleton;
    v15->_skeleton = v16;

    v15->_tracked = a8;
    objc_msgSend(v13, "estimatedScaleFactor");
    v15->_estimatedScaleFactor = v18;
    v19 = [ARSkeleton2D alloc];
    objc_msgSend(v13, "liftedSkeletonData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "skeletonDetectionResult2D");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ARSkeleton2D initWithDetectedSkeleton:](v19, "initWithDetectedSkeleton:", v21);

    v23 = -[ARBody2D initWithSkeleton2D:]([ARBody2D alloc], "initWithSkeleton2D:", v22);
    referenceBody = v15->_referenceBody;
    v15->_referenceBody = v23;

  }
  return v15;
}

- (BOOL)isTracked
{
  return self->_tracked;
}

- (CGFloat)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (ARBody2D)referenceBody
{
  return self->_referenceBody;
}

- (id)copyWithTrackedState:(BOOL)a3
{
  _BOOL8 v3;
  ARBodyAnchor *v5;
  void *v6;
  ARBodyAnchor *v7;

  v3 = a3;
  v5 = [ARBodyAnchor alloc];
  -[ARAnchor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARAnchor transform](self, "transform");
  v7 = -[ARBodyAnchor initWithIdentifier:transform:tracked:skeletonData:](v5, "initWithIdentifier:transform:tracked:skeletonData:", v6, v3, self->_skeletonData);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARBodyAnchor;
  v4 = a3;
  -[ARAnchor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_tracked, CFSTR("tracked"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_skeletonData, CFSTR("skeletonData"));

}

- (ARBodyAnchor)initWithCoder:(id)a3
{
  id v4;
  ARBodyAnchor *v5;
  uint64_t v6;
  ARCoreRESkeletonResult *skeletonData;
  ARSkeleton3D *v8;
  ARSkeleton3D *skeleton;
  ARSkeleton2D *v10;
  void *v11;
  void *v12;
  ARSkeleton2D *v13;
  ARBody2D *v14;
  ARBody2D *referenceBody;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARBodyAnchor;
  v5 = -[ARAnchor initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_tracked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tracked"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("skeletonData"));
    v6 = objc_claimAutoreleasedReturnValue();
    skeletonData = v5->_skeletonData;
    v5->_skeletonData = (ARCoreRESkeletonResult *)v6;

    v8 = -[ARSkeleton3D initWithCoreRESkeletonResult:]([ARSkeleton3D alloc], "initWithCoreRESkeletonResult:", v5->_skeletonData);
    skeleton = v5->_skeleton;
    v5->_skeleton = v8;

    v10 = [ARSkeleton2D alloc];
    -[ARCoreRESkeletonResult liftedSkeletonData](v5->_skeletonData, "liftedSkeletonData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "skeletonDetectionResult2D");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ARSkeleton2D initWithDetectedSkeleton:](v10, "initWithDetectedSkeleton:", v12);

    v14 = -[ARBody2D initWithSkeleton2D:]([ARBody2D alloc], "initWithSkeleton2D:", v13);
    referenceBody = v5->_referenceBody;
    v5->_referenceBody = v14;

  }
  return v5;
}

- (BOOL)isEqualToARBodyAnchor:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  char v9;

  v4 = (id *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_4;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARAnchor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_4;
  v8 = objc_msgSend(v4, "isTracked");
  if (v8 == -[ARBodyAnchor isTracked](self, "isTracked"))
    v9 = objc_msgSend(v4[24], "isEqual:", self->_skeletonData);
  else
LABEL_4:
    v9 = 0;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = -[ARBodyAnchor isEqualToARBodyAnchor:](self, "isEqualToARBodyAnchor:", v4);
  else
    v5 = 0;

  return v5;
}

- (ARBodyAnchor)initWithAnchor:(id)a3
{
  id *v4;
  ARBodyAnchor *v5;
  uint64_t v6;
  ARCoreRESkeletonResult *skeletonData;
  ARSkeleton3D *v8;
  ARSkeleton3D *skeleton;
  objc_super v11;

  v4 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)ARBodyAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v11, sel_initWithAnchor_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4[24], "copy");
    skeletonData = v5->_skeletonData;
    v5->_skeletonData = (ARCoreRESkeletonResult *)v6;

    v8 = -[ARSkeleton3D initWithCoreRESkeletonResult:]([ARSkeleton3D alloc], "initWithCoreRESkeletonResult:", v5->_skeletonData);
    skeleton = v5->_skeleton;
    v5->_skeleton = v8;

    v5->_tracked = objc_msgSend(v4, "isTracked");
  }

  return v5;
}

- (ARSkeleton3D)skeleton
{
  return self->_skeleton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton, 0);
  objc_storeStrong((id *)&self->_referenceBody, 0);
  objc_storeStrong((id *)&self->_skeletonData, 0);
}

@end
