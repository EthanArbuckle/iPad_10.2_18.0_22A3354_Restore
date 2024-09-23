@implementation VNHumanBodyPose3DSpecifier

- (VNHumanBodyPose3DSpecifier)initWithHumanBody3DOutput:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  VNHumanBodyRecognizedPoint3D *v29;
  double v43;
  float v44;
  double v49;
  float v52;
  double v53;
  VNHumanBodyRecognizedPoint3D *v54;
  int v55;
  VNHumanBodyPose3DSpecifier *v56;
  float v57;
  int v58;
  VNHumanBodyPose3DSpecifier *orderedHumanBodyPose3DKeypoints;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  int v71;
  int v72;
  uint64_t v73;
  CGFloat v74;
  CGFloat v75;
  uint64_t v76;
  id v78;
  void *v79;
  void *v80;
  VNHumanBodyPose3DSpecifier *v81;
  void *v82;
  id v83;
  float32x4_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  void *v91;
  objc_super v92;
  id v93;
  id v94[2];

  v6 = a3;
  v78 = a4;
  objc_msgSend(v6, "liftedSkeleton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "skeletonDefinition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "jointCount");

  v90 = objc_msgSend(v78, "requestRevision");
  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v82 = v7;
    v83 = v6;
    v81 = self;
    while (1)
    {
      v13 = objc_msgSend(v7, "modelPoses");
      v88 = *(_OWORD *)(v13 + v10 + 16);
      v89 = *(_OWORD *)(v13 + v10);
      v86 = *(_OWORD *)(v13 + v10 + 48);
      v87 = *(_OWORD *)(v13 + v10 + 32);
      v14 = objc_msgSend(v7, "localPoses");
      v84 = *(float32x4_t *)(v14 + v11);
      v85 = *(_OWORD *)(v14 + v11 + 16);
      objc_msgSend(v7, "skeletonDefinition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "jointName:", v12);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_opt_class();
      v94[0] = 0;
      objc_msgSend(v16, "_stringRepresentationForRequestRevision:abpkJoint:error:", v90, v91, v94);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v94[0];
      v19 = v18;
      if (v17)
      {
        objc_msgSend(v7, "skeletonDefinition");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "parentJoint:", v12);

        objc_msgSend(v7, "skeletonDefinition");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = v21 >= 0 ? v21 : v12;
        objc_msgSend(v22, "jointName:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)objc_opt_class();
        v93 = v19;
        objc_msgSend(v26, "_stringRepresentationForRequestRevision:abpkJoint:error:", v90, v25, &v93);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v93;

        if (v27)
        {
          v29 = [VNHumanBodyRecognizedPoint3D alloc];
          _Q19 = v84;
          _S0 = v84.i32[2];
          _S1 = v84.i32[1];
          _S2 = v84.i32[3];
          __asm
          {
            FMLA            S3, S19, V19.S[2]
            FMLA            S5, S0, V19.S[1]
            FMLA            S16, S0, V19.S[2]
            FMLS            S16, S19, V19.S[0]
            FMLS            S16, S1, V19.S[1]
          }
          *(float *)&v43 = _S3 + _S3;
          *((float *)&v43 + 1) = _S5 + _S5;
          v44 = vmlas_n_f32(-(float)(v84.f32[2] * v84.f32[3]), v84.f32[1], v84.f32[0]);
          __asm
          {
            FMLA            S17, S1, V19.S[1]
            FMLA            S17, S2, V19.S[3]
            FMLS            S17, S19, V19.S[0]
            FMLA            S4, S0, V19.S[1]
          }
          *(float *)&v49 = v44 + v44;
          HIDWORD(v49) = _S17;
          __asm
          {
            FMLS            S16, S0, V19.S[2]
            FMLA            S16, S2, V19.S[3]
          }
          v52 = vmlas_n_f32(vmuls_lane_f32(v84.f32[2], v84, 3), v84.f32[1], v84.f32[0]);
          LODWORD(v53) = _S16;
          *((float *)&v53 + 1) = v52 + v52;
          v54 = -[VNHumanBodyRecognizedPoint3D initWithModelPosition:localPosition:jointName:parentJoint:](v29, "initWithModelPosition:localPosition:jointName:parentJoint:", v17, v27, *(double *)&v89, *(double *)&v88, *(double *)&v87, *(double *)&v86, v53, v49, v43, *(double *)&v85);
          objc_msgSend(v80, "setObject:forKey:", v54, v17);
          objc_msgSend(v79, "addObject:", v54);
          v55 = 0;
        }
        else
        {
          objc_msgSend(v28, "localizedDescription");
          v54 = (VNHumanBodyRecognizedPoint3D *)objc_claimAutoreleasedReturnValue();
          +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, v54);
          v55 = 1;
        }

      }
      else
      {
        objc_msgSend(v18, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, v25);
        v55 = 1;
        v28 = v19;
      }

      if (v55)
        break;
      ++v12;
      v11 += 32;
      v10 += 64;
      v7 = v82;
      v6 = v83;
      self = v81;
      if (v9 == v12)
        goto LABEL_14;
    }
    v56 = 0;
    v7 = v82;
    v6 = v83;
    orderedHumanBodyPose3DKeypoints = v81;
    goto LABEL_20;
  }
LABEL_14:
  v92.receiver = self;
  v92.super_class = (Class)VNHumanBodyPose3DSpecifier;
  v56 = -[VNRecognizedPoints3DSpecifier initWithOriginatingRequestSpecifier:allRecognizedPoints:](&v92, sel_initWithOriginatingRequestSpecifier_allRecognizedPoints_, v78, v80);
  if (v56)
  {
    objc_msgSend(v7, "estimatedScale");
    v56->_heightEstimatedScale = v57;
    if (v57 == -1.0)
      v58 = 1072064102;
    else
      objc_msgSend(v7, "computeHeight");
    LODWORD(v56->_humanHeight) = v58;
    objc_msgSend(v7, "cameraRootTransform");
    *(_OWORD *)v56->_anon_20 = v60;
    *(_OWORD *)&v56->_anon_20[16] = v61;
    *(_OWORD *)&v56->_anon_20[32] = v62;
    *(_OWORD *)&v56->_anon_20[48] = v63;
    objc_msgSend(v7, "renderingCameraRootTransform");
    *(_OWORD *)&v56[1].super.super.isa = v64;
    *(_OWORD *)&v56[1].super._allRecognizedPoints = v65;
    *(_OWORD *)v56[1]._anon_20 = v66;
    *(_OWORD *)&v56[1]._anon_20[16] = v67;
    objc_msgSend(v6, "cameraIntrinsics");
    *(_QWORD *)v56->_anon_80 = v68;
    *(_DWORD *)&v56->_anon_80[8] = v69;
    *(_QWORD *)&v56->_anon_80[16] = v70;
    *(_DWORD *)&v56->_anon_80[24] = v71;
    *(_DWORD *)&v56->_anon_80[40] = v72;
    *(_QWORD *)&v56->_anon_80[32] = v73;
    objc_msgSend(v6, "inputSize");
    v56->_inputSize.width = v74;
    v56->_inputSize.height = v75;
    v76 = objc_msgSend(v79, "copy");
    orderedHumanBodyPose3DKeypoints = (VNHumanBodyPose3DSpecifier *)v56->_orderedHumanBodyPose3DKeypoints;
    v56->_orderedHumanBodyPose3DKeypoints = (NSArray *)v76;
LABEL_20:

  }
  return v56;
}

- (BOOL)isEqual:(id)a3
{
  VNHumanBodyPose3DSpecifier *v4;
  VNHumanBodyPose3DSpecifier *v5;
  VNHumanBodyPose3DSpecifier *v6;
  BOOL v7;
  uint32x4_t v8;
  BOOL v9;
  objc_super v11;

  v4 = (VNHumanBodyPose3DSpecifier *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VNHumanBodyPose3DSpecifier;
    if (-[VNRecognizedPoints3DSpecifier isEqual:](&v11, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = v5;
      v7 = self->_inputSize.width == v5->_inputSize.width && self->_inputSize.height == v5->_inputSize.height;
      v9 = v7
        && self->_heightEstimatedScale == v5->_heightEstimatedScale
        && self->_humanHeight == v5->_humanHeight
        && (v8 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_80[16], *(float32x4_t *)&v5->_anon_80[16]), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_80, *(float32x4_t *)v5->_anon_80)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_80[32], *(float32x4_t *)&v5->_anon_80[32])), v8.i32[3] = v8.i32[2], (vminvq_u32(v8) & 0x80000000) != 0)&& (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_20[16], *(float32x4_t *)&v5->_anon_20[16]), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_20, *(float32x4_t *)v5->_anon_20)), vandq_s8(
                                       (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_20[32], *(float32x4_t *)&v5->_anon_20[32]), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_20[48], *(float32x4_t *)&v5->_anon_20[48])))) & 0x80000000) != 0&& -[NSArray isEqualToArray:](self->_orderedHumanBodyPose3DKeypoints, "isEqualToArray:", v5->_orderedHumanBodyPose3DKeypoints);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)availableGroupKeys
{
  if (-[VNHumanBodyPose3DSpecifier availableGroupKeys]::onceToken != -1)
    dispatch_once(&-[VNHumanBodyPose3DSpecifier availableGroupKeys]::onceToken, &__block_literal_global_8);
  return (id)-[VNHumanBodyPose3DSpecifier availableGroupKeys]::groupKeys;
}

- (id)pointKeyGroupLabelsMapping
{
  if (-[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::onceToken != -1)
    dispatch_once(&-[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::onceToken, &__block_literal_global_10);
  return (id)-[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::mapping;
}

- (float)bodyHeight
{
  return self->_humanHeight;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNHumanBodyPose3DSpecifier;
  -[VNRecognizedPoints3DSpecifier encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_orderedHumanBodyPose3DKeypoints, CFSTR("OrderedHuman3DKeypoints"));
  objc_msgSend(v4, "vn_encode3x3Matrix:forKey:", CFSTR("CameraIntrinsics"), *(double *)self->_anon_80, *(double *)&self->_anon_80[16], *(double *)&self->_anon_80[32]);
  objc_msgSend(v4, "vn_encode4x4Matrix:forKey:", CFSTR("CameraTransform"), *(double *)self->_anon_20, *(double *)&self->_anon_20[16], *(double *)&self->_anon_20[32], *(double *)&self->_anon_20[48]);
  *(float *)&v5 = self->_heightEstimatedScale;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("HeightEstimatedScale"), v5);
  *(float *)&v6 = self->_humanHeight;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("HumanHeight"), v6);
  objc_msgSend(v4, "vn_encodeSize:forKey:", CFSTR("InputSize"), self->_inputSize.width, self->_inputSize.height);

}

- (VNHumanBodyPose3DSpecifier)initWithCoder:(id)a3
{
  id v4;
  VNHumanBodyPose3DSpecifier *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *orderedHumanBodyPose3DKeypoints;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  float v23;
  float v24;
  CGFloat v25;
  CGFloat v26;
  VNHumanBodyPose3DSpecifier *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VNHumanBodyPose3DSpecifier;
  v5 = -[VNRecognizedPoints3DSpecifier initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("OrderedHuman3DKeypoints"));
    v9 = objc_claimAutoreleasedReturnValue();
    orderedHumanBodyPose3DKeypoints = v5->_orderedHumanBodyPose3DKeypoints;
    v5->_orderedHumanBodyPose3DKeypoints = (NSArray *)v9;

    if (v5->_orderedHumanBodyPose3DKeypoints)
    {
      objc_msgSend(v4, "vn_decode3x3MatrixForKey:", CFSTR("CameraIntrinsics"));
      *(_QWORD *)v5->_anon_80 = v11;
      *(_DWORD *)&v5->_anon_80[8] = v12;
      *(_QWORD *)&v5->_anon_80[16] = v13;
      *(_DWORD *)&v5->_anon_80[24] = v14;
      *(_DWORD *)&v5->_anon_80[40] = v15;
      *(_QWORD *)&v5->_anon_80[32] = v16;
      objc_msgSend(v4, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(v4, "vn_decode4x4MatrixForKey:", CFSTR("CameraTransform"));
        *(_OWORD *)v5->_anon_20 = v18;
        *(_OWORD *)&v5->_anon_20[16] = v19;
        *(_OWORD *)&v5->_anon_20[32] = v20;
        *(_OWORD *)&v5->_anon_20[48] = v21;
        objc_msgSend(v4, "error");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(v4, "decodeFloatForKey:", CFSTR("HeightEstimatedScale"));
          v5->_heightEstimatedScale = v23;
          objc_msgSend(v4, "decodeFloatForKey:", CFSTR("HumanHeight"));
          v5->_humanHeight = v24;
          objc_msgSend(v4, "vn_decodeSizeForKey:", CFSTR("InputSize"));
          v5->_inputSize.width = v25;
          v5->_inputSize.height = v26;
          v27 = v5;
LABEL_9:

          goto LABEL_10;
        }
      }
    }
    else
    {
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("ordered model human keypoints were not available"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v28);

    }
    v27 = 0;
    goto LABEL_9;
  }
  v27 = 0;
LABEL_10:

  return v27;
}

- (float)heightEstimatedScale
{
  return self->_heightEstimatedScale;
}

- (__n128)cameraTransformMatrix
{
  return a1[2];
}

- (__n128)cameraRenderTransformMatrix
{
  return a1[11];
}

- (__n128)cameraIntrinsics
{
  return a1[8];
}

- (CGSize)inputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_inputSize.width;
  height = self->_inputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedHumanBodyPose3DKeypoints, 0);
}

void __56__VNHumanBodyPose3DSpecifier_pointKeyGroupLabelsMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("human_top_head_3D"), CFSTR("human_center_head_3D"), 0);
  v9[0] = v0;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("human_left_shoulder_3D"), CFSTR("human_right_shoulder_3D"), CFSTR("human_center_shoulder_3D"), CFSTR("human_spine_3D"), CFSTR("human_left_hip_3D"), CFSTR("human_root_3D"), CFSTR("human_right_hip_3D"), 0, CFSTR("human_joint_group_head_3D"), CFSTR("human_joint_group_torso_3D"));
  v9[1] = v1;
  v8[2] = CFSTR("human_joint_group_left_arm_3D");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("human_left_shoulder_3D"), CFSTR("human_left_elbow_3D"), CFSTR("human_left_wrist_3D"), 0);
  v9[2] = v2;
  v8[3] = CFSTR("human_joint_group_right_arm_3D");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("human_right_shoulder_3D"), CFSTR("human_right_elbow_3D"), CFSTR("human_right_wrist_3D"), 0);
  v9[3] = v3;
  v8[4] = CFSTR("human_joint_group_left_leg_3D");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("human_left_hip_3D"), CFSTR("human_left_knee_3D"), CFSTR("human_left_ankle_3D"), 0);
  v9[4] = v4;
  v8[5] = CFSTR("human_joint_group_right_leg_3D");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("human_right_hip_3D"), CFSTR("human_right_knee_3D"), CFSTR("human_right_ankle_3D"), 0);
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)-[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::mapping;
  -[VNHumanBodyPose3DSpecifier pointKeyGroupLabelsMapping]::mapping = v6;

}

void __48__VNHumanBodyPose3DSpecifier_availableGroupKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("human_joint_group_head_3D");
  v2[1] = CFSTR("human_joint_group_torso_3D");
  v2[2] = CFSTR("human_joint_group_left_arm_3D");
  v2[3] = CFSTR("human_joint_group_right_arm_3D");
  v2[4] = CFSTR("human_joint_group_left_leg_3D");
  v2[5] = CFSTR("human_joint_group_right_leg_3D");
  v2[6] = CFSTR("VNIPOAll");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[VNHumanBodyPose3DSpecifier availableGroupKeys]::groupKeys;
  -[VNHumanBodyPose3DSpecifier availableGroupKeys]::groupKeys = v0;

}

+ (id)supportedHumanBodyPose3DKeypointsRev1
{
  if (+[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::onceToken != -1)
    dispatch_once(&+[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::onceToken, &__block_literal_global_29720);
  return (id)+[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::supportedHumanBodyPose3DKeypointsRev1;
}

+ (id)_stringRepresentationForRequestRevision:(unint64_t)a3 abpkJoint:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  if (a3 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "supportedHumanBodyPose3DKeypointsRev1");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", a3, objc_opt_class());
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __67__VNHumanBodyPose3DSpecifier_supportedHumanBodyPose3DKeypointsRev1__block_invoke()
{
  void *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v0 = (void *)getABPKSkeletonDefinitionClass(void)::softClass;
  v28 = getABPKSkeletonDefinitionClass(void)::softClass;
  if (!getABPKSkeletonDefinitionClass(void)::softClass)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = ___ZL30getABPKSkeletonDefinitionClassv_block_invoke;
    v24[3] = &unk_1E4548FA8;
    v24[4] = &v25;
    ___ZL30getABPKSkeletonDefinitionClassv_block_invoke((uint64_t)v24);
    v0 = (void *)v26[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v25, 8);
  v2 = (void *)objc_msgSend([v1 alloc], "initWithType:", 3);
  v3 = objc_msgSend(v2, "jointCount");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v3);
  objc_msgSend(v2, "jointName:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_root_3D"), v5);

  objc_msgSend(v2, "jointName:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_right_hip_3D"), v6);

  objc_msgSend(v2, "jointName:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_right_knee_3D"), v7);

  objc_msgSend(v2, "jointName:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_right_ankle_3D"), v8);

  objc_msgSend(v2, "jointName:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_left_hip_3D"), v9);

  objc_msgSend(v2, "jointName:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_left_knee_3D"), v10);

  objc_msgSend(v2, "jointName:", 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_left_ankle_3D"), v11);

  objc_msgSend(v2, "jointName:", 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_spine_3D"), v12);

  objc_msgSend(v2, "jointName:", 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_center_shoulder_3D"), v13);

  objc_msgSend(v2, "jointName:", 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_center_head_3D"), v14);

  objc_msgSend(v2, "jointName:", 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_top_head_3D"), v15);

  objc_msgSend(v2, "jointName:", 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_left_shoulder_3D"), v16);

  objc_msgSend(v2, "jointName:", 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_left_elbow_3D"), v17);

  objc_msgSend(v2, "jointName:", 13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_left_wrist_3D"), v18);

  objc_msgSend(v2, "jointName:", 14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_right_shoulder_3D"), v19);

  objc_msgSend(v2, "jointName:", 15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_right_elbow_3D"), v20);

  objc_msgSend(v2, "jointName:", 16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("human_right_wrist_3D"), v21);

  v22 = objc_msgSend(v4, "copy");
  v23 = (void *)+[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::supportedHumanBodyPose3DKeypointsRev1;
  +[VNHumanBodyPose3DSpecifier supportedHumanBodyPose3DKeypointsRev1]::supportedHumanBodyPose3DKeypointsRev1 = v22;

}

@end
