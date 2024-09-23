@implementation ARSkeletonDefinition

+ (ARSkeletonDefinition)defaultBody3DSkeletonDefinition
{
  if (+[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::onceToken != -1)
    dispatch_once(&+[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::onceToken, &__block_literal_global_96);
  return (ARSkeletonDefinition *)(id)+[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::_defaultSkeletonDefinition;
}

void __55__ARSkeletonDefinition_defaultBody3DSkeletonDefinition__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ARSkeletonDefinition initDefault3DSkeletonDefinition]([ARSkeletonDefinition alloc], "initDefault3DSkeletonDefinition");
  v1 = (void *)+[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::_defaultSkeletonDefinition;
  +[ARSkeletonDefinition defaultBody3DSkeletonDefinition]::_defaultSkeletonDefinition = (uint64_t)v0;

}

- (id)initDefault3DSkeletonDefinition
{
  ARSkeletonDefinition *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t TargetBufferSize;
  uint64_t v9;
  uint64_t TargetName;
  void *v11;
  uint64_t TargetParentName;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *jointNames;
  uint64_t v23;
  NSArray *parentIndices;
  ARCoreRESkeletonResult *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  ARCoreRESkeletonResult *v43;
  ARSkeleton3D *v44;
  ARSkeleton3D *neutralBodySkeleton3D;
  ARSkeletonDefinition *v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)ARSkeletonDefinition;
  v2 = -[ARSkeletonDefinition init](&v48, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_opt_new();
    v47 = v2;
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v7 = CoreIKCreateAltruisticSolverInstance();
    TargetBufferSize = CoreIKSolverGetTargetBufferSize();
    if (TargetBufferSize)
    {
      v9 = 0;
      do
      {
        TargetName = CoreIKSolverGetTargetName();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", TargetName);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        TargetParentName = CoreIKSolverGetTargetParentName();
        if (TargetParentName)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", TargetParentName);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", TargetName);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v13, v14);

        }
        ++v9;
      }
      while (TargetBufferSize != v9);
      if (TargetBufferSize)
      {
        for (i = 0; i != TargetBufferSize; ++i)
        {
          objc_msgSend(v6, "objectAtIndex:", i);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "containsObject:", v17))
          {
            v18 = objc_msgSend(v6, "indexOfObject:", v17);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v19);

          }
          else
          {
            objc_msgSend(v4, "addObject:", &unk_1E66CDE10);
          }
          objc_msgSend(v16, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v20);

        }
      }
    }
    MEMORY[0x1B5E2CF94](v7);
    v21 = objc_msgSend(v3, "copy");
    jointNames = v47->_jointNames;
    v47->_jointNames = (NSArray *)v21;

    v23 = objc_msgSend(v4, "copy");
    parentIndices = v47->_parentIndices;
    v47->_parentIndices = (NSArray *)v23;

    v25 = [ARCoreRESkeletonResult alloc];
    v33 = ARNeutralBodySkeleton3DModelTransforms((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);
    v41 = ARNeutralBodySkeleton3DLocalTransforms(v33, v34, v35, v36, v37, v38, v39, v40);
    v42 = (void *)objc_opt_new();
    v43 = -[ARCoreRESkeletonResult initWithModelJointTransforms:localJointTransformsSRT:numberOfTransforms:liftedSkeletonData:identifier:](v25, "initWithModelJointTransforms:localJointTransformsSRT:numberOfTransforms:liftedSkeletonData:identifier:", v33, v41, 91, 0, v42);

    v44 = -[ARSkeleton3D initWithCoreRESkeletonResult:]([ARSkeleton3D alloc], "initWithCoreRESkeletonResult:", v43);
    neutralBodySkeleton3D = v47->_neutralBodySkeleton3D;
    v47->_neutralBodySkeleton3D = v44;

    v2 = v47;
  }
  return v2;
}

+ (ARSkeletonDefinition)defaultBody2DSkeletonDefinition
{
  if (+[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::onceToken != -1)
    dispatch_once(&+[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::onceToken, &__block_literal_global_24_0);
  return (ARSkeletonDefinition *)(id)+[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::_defaultSkeletonDefinition;
}

void __55__ARSkeletonDefinition_defaultBody2DSkeletonDefinition__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ARSkeletonDefinition initDefault2DSkeletonDefinition]([ARSkeletonDefinition alloc], "initDefault2DSkeletonDefinition");
  v1 = (void *)+[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::_defaultSkeletonDefinition;
  +[ARSkeletonDefinition defaultBody2DSkeletonDefinition]::_defaultSkeletonDefinition = (uint64_t)v0;

}

- (id)initDefault2DSkeletonDefinition
{
  ARSkeletonDefinition *v2;
  uint64_t v3;
  NSArray *jointNames;
  NSArray *parentIndices;
  NSArray *v6;
  uint64_t v7;
  NSArray *v8;
  objc_super v10;
  _QWORD v11[17];
  _QWORD v12[20];

  v12[19] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)ARSkeletonDefinition;
  v2 = -[ARSkeletonDefinition init](&v10, sel_init);
  if (v2)
  {
    if (ARLinkedOnOrAfterSydney())
    {
      v12[0] = CFSTR("head_joint");
      v12[1] = CFSTR("neck_1_joint");
      v12[2] = CFSTR("right_shoulder_1_joint");
      v12[3] = CFSTR("right_forearm_joint");
      v12[4] = CFSTR("right_hand_joint");
      v12[5] = CFSTR("left_shoulder_1_joint");
      v12[6] = CFSTR("left_forearm_joint");
      v12[7] = CFSTR("left_hand_joint");
      v12[8] = CFSTR("right_upLeg_joint");
      v12[9] = CFSTR("right_leg_joint");
      v12[10] = CFSTR("right_foot_joint");
      v12[11] = CFSTR("left_upLeg_joint");
      v12[12] = CFSTR("left_leg_joint");
      v12[13] = CFSTR("left_foot_joint");
      v12[14] = CFSTR("right_eye_joint");
      v12[15] = CFSTR("left_eye_joint");
      v12[16] = CFSTR("root");
      v12[17] = CFSTR("right_ear_joint");
      v12[18] = CFSTR("left_ear_joint");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 19);
      v3 = objc_claimAutoreleasedReturnValue();
      jointNames = v2->_jointNames;
      v2->_jointNames = (NSArray *)v3;

      parentIndices = v2->_parentIndices;
      v6 = (NSArray *)&unk_1E66CEDA8;
    }
    else
    {
      v11[0] = CFSTR("head_joint");
      v11[1] = CFSTR("neck_1_joint");
      v11[2] = CFSTR("right_shoulder_1_joint");
      v11[3] = CFSTR("right_forearm_joint");
      v11[4] = CFSTR("right_hand_joint");
      v11[5] = CFSTR("left_shoulder_1_joint");
      v11[6] = CFSTR("left_forearm_joint");
      v11[7] = CFSTR("left_hand_joint");
      v11[8] = CFSTR("right_upLeg_joint");
      v11[9] = CFSTR("right_leg_joint");
      v11[10] = CFSTR("right_foot_joint");
      v11[11] = CFSTR("left_upLeg_joint");
      v11[12] = CFSTR("left_leg_joint");
      v11[13] = CFSTR("left_foot_joint");
      v11[14] = CFSTR("right_eye_joint");
      v11[15] = CFSTR("left_eye_joint");
      v11[16] = CFSTR("root");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 17);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v2->_jointNames;
      v2->_jointNames = (NSArray *)v7;

      parentIndices = v2->_parentIndices;
      v6 = (NSArray *)&unk_1E66CEDC0;
    }
    v2->_parentIndices = v6;

  }
  return v2;
}

- (NSUInteger)indexForJointName:(ARSkeletonJointName)jointName
{
  NSString *v4;
  void *v5;
  NSUInteger v6;

  v4 = jointName;
  -[ARSkeletonDefinition jointNames](self, "jointNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (NSUInteger)jointCount
{
  void *v2;
  NSUInteger v3;

  -[ARSkeletonDefinition jointNames](self, "jointNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)jointNames
{
  return self->_jointNames;
}

- (NSArray)parentIndices
{
  return self->_parentIndices;
}

- (ARSkeleton3D)neutralBodySkeleton3D
{
  return self->_neutralBodySkeleton3D;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neutralBodySkeleton3D, 0);
  objc_storeStrong((id *)&self->_parentIndices, 0);
  objc_storeStrong((id *)&self->_jointNames, 0);
}

@end
