@implementation VNRecognizedAnimalBodyPointsSpecifier

- (VNRecognizedAnimalBodyPointsSpecifier)initWithVCPPetsObservation:(id)a3 originatingRequestSpecifier:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  VNRecognizedPoint *v24;
  double v25;
  VNRecognizedPoint *v26;
  id v27;
  uint64_t v28;
  id v30;
  id v31;
  void *v32;
  objc_super v33;
  id v34;

  v30 = a3;
  v31 = a4;
  objc_msgSend(v30, "keypoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v6;
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v7);
  v10 = objc_msgSend(v31, "requestRevision");
  if (v7)
  {
    v11 = v10;
    v12 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "location");
      v15 = v14;
      v17 = v16;
      objc_msgSend(v13, "confidence");
      v19 = v18;
      v20 = (void *)objc_opt_class();
      v34 = 0;
      objc_msgSend(v20, "_stringRepresentationForRequestRevision:petsKeypointType:error:", v11, v12, &v34);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v34;
      v23 = v22;
      if (!v21)
        break;
      v24 = [VNRecognizedPoint alloc];
      LODWORD(v25) = v19;
      v26 = -[VNRecognizedPoint initWithLocation:confidence:identifier:](v24, "initWithLocation:confidence:identifier:", v21, v15, v17, v25);
      objc_msgSend(v9, "setObject:forKey:", v26, v21);
      objc_msgSend(v8, "addObject:", v26);

      ++v12;
      v6 = v32;
      if (v7 == v12)
        goto LABEL_5;
    }

    v27 = 0;
    v6 = v32;
    goto LABEL_8;
  }
LABEL_5:
  v33.receiver = self;
  v33.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
  v27 = -[VNRecognizedPointsSpecifier initWithOriginatingRequestSpecifier:allRecognizedPoints:](&v33, sel_initWithOriginatingRequestSpecifier_allRecognizedPoints_, v31, v9);
  if (v27)
  {
    v28 = objc_msgSend(v8, "copy");
    self = (VNRecognizedAnimalBodyPointsSpecifier *)*((_QWORD *)v27 + 3);
    *((_QWORD *)v27 + 3) = v28;
LABEL_8:

  }
  return (VNRecognizedAnimalBodyPointsSpecifier *)v27;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
  return -[NSArray hash](self->_orderedAnimalKeypoints, "hash") ^ __ROR8__(-[VNRecognizedPointsSpecifier hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNRecognizedAnimalBodyPointsSpecifier *v4;
  BOOL v5;
  objc_super v7;

  v4 = (VNRecognizedAnimalBodyPointsSpecifier *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
    v5 = -[VNRecognizedPointsSpecifier isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NSArray isEqualToArray:](self->_orderedAnimalKeypoints, "isEqualToArray:", v4->_orderedAnimalKeypoints);
  }

  return v5;
}

- (id)availableGroupKeys
{
  if (-[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::onceToken != -1)
    dispatch_once(&-[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::onceToken, &__block_literal_global_37);
  return (id)-[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::groupKeys;
}

- (id)pointKeyGroupLabelsMapping
{
  if (-[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::onceToken != -1)
    dispatch_once(&-[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::onceToken, &__block_literal_global_39);
  return (id)-[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::mapping;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
  -[VNRecognizedPointsSpecifier encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_orderedAnimalKeypoints, CFSTR("OrderedAnimalKeypoints"));

}

- (VNRecognizedAnimalBodyPointsSpecifier)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedAnimalBodyPointsSpecifier *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *orderedAnimalKeypoints;
  VNRecognizedAnimalBodyPointsSpecifier *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNRecognizedAnimalBodyPointsSpecifier;
  v5 = -[VNRecognizedPointsSpecifier initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("OrderedAnimalKeypoints"));
    v10 = objc_claimAutoreleasedReturnValue();
    orderedAnimalKeypoints = v5->_orderedAnimalKeypoints;
    v5->_orderedAnimalKeypoints = (NSArray *)v10;

    if (v5->_orderedAnimalKeypoints)
    {
      v12 = v5;
    }
    else
    {
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("ordered animal keypoints are not available"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v13);

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedAnimalKeypoints, 0);
}

void __67__VNRecognizedAnimalBodyPointsSpecifier_pointKeyGroupLabelsMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("animal_joint_left_ear_top"), CFSTR("animal_joint_right_ear_top"), CFSTR("animal_joint_left_ear_middle"), CFSTR("animal_joint_right_ear_middle"), CFSTR("animal_joint_left_ear_bottom"), CFSTR("animal_joint_right_ear_bottom"), CFSTR("animal_joint_left_eye"), CFSTR("animal_joint_right_eye"), CFSTR("animal_joint_nose"), 0, CFSTR("animal_joint_group_head"));
  v8[0] = v0;
  v7[1] = CFSTR("animal_joint_group_trunk");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("animal_joint_heck"), 0);
  v8[1] = v1;
  v7[2] = CFSTR("animal_joint_group_gorelegs");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("animal_joint_left_front_elbow"), CFSTR("animal_joint_right_front_elbow"), CFSTR("animal_joint_left_front_knee"), CFSTR("animal_joint_right_front_knee"), CFSTR("animal_joint_left_front_paw"), CFSTR("animal_joint_right_front_paw"), 0);
  v8[2] = v2;
  v7[3] = CFSTR("animal_joint_group_hindlegs");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("animal_joint_left_back_elbow"), CFSTR("animal_joint_right_back_elbow"), CFSTR("animal_joint_left_back_knee"), CFSTR("animal_joint_right_back_knee"), CFSTR("animal_joint_left_back_paw"), CFSTR("animal_joint_right_back_paw"), 0);
  v8[3] = v3;
  v7[4] = CFSTR("animal_joint_group_tail");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("animal_joint_tail_top"), CFSTR("animal_joint_tail_middle"), CFSTR("animal_joint_tail_bottom"), 0);
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::mapping;
  -[VNRecognizedAnimalBodyPointsSpecifier pointKeyGroupLabelsMapping]::mapping = v5;

}

void __59__VNRecognizedAnimalBodyPointsSpecifier_availableGroupKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("animal_joint_group_head");
  v2[1] = CFSTR("animal_joint_group_trunk");
  v2[2] = CFSTR("animal_joint_group_gorelegs");
  v2[3] = CFSTR("animal_joint_group_hindlegs");
  v2[4] = CFSTR("animal_joint_group_tail");
  v2[5] = CFSTR("VNIPOAll");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::groupKeys;
  -[VNRecognizedAnimalBodyPointsSpecifier availableGroupKeys]::groupKeys = v0;

}

+ (id)supportedAnimalPoseKeypointsRev1
{
  if (+[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::onceToken != -1)
    dispatch_once(&+[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::onceToken, &__block_literal_global_1051);
  return (id)+[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::supportedAnimalPoseKeypointsRev1;
}

+ (id)_stringRepresentationForRequestRevision:(unint64_t)a3 petsKeypointType:(int)a4 error:(id *)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 == 1)
  {
    v5 = *(_QWORD *)&a4;
    objc_msgSend((id)objc_opt_class(), "supportedAnimalPoseKeypointsRev1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", a3, objc_opt_class());
    v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __73__VNRecognizedAnimalBodyPointsSpecifier_supportedAnimalPoseKeypointsRev1__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[25];
  _QWORD v3[26];

  v3[25] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E459C430;
  v2[1] = &unk_1E459C448;
  v3[0] = CFSTR("animal_joint_left_ear_top");
  v3[1] = CFSTR("animal_joint_left_ear_middle");
  v2[2] = &unk_1E459C460;
  v2[3] = &unk_1E459C478;
  v3[2] = CFSTR("animal_joint_left_ear_bottom");
  v3[3] = CFSTR("animal_joint_right_ear_top");
  v2[4] = &unk_1E459C490;
  v2[5] = &unk_1E459C4A8;
  v3[4] = CFSTR("animal_joint_right_ear_middle");
  v3[5] = CFSTR("animal_joint_right_ear_bottom");
  v2[6] = &unk_1E459C4C0;
  v2[7] = &unk_1E459C4D8;
  v3[6] = CFSTR("animal_joint_left_eye");
  v3[7] = CFSTR("animal_joint_right_eye");
  v2[8] = &unk_1E459C4F0;
  v2[9] = &unk_1E459C508;
  v3[8] = CFSTR("animal_joint_nose");
  v3[9] = CFSTR("animal_joint_heck");
  v2[10] = &unk_1E459C520;
  v2[11] = &unk_1E459C538;
  v3[10] = CFSTR("animal_joint_left_front_elbow");
  v3[11] = CFSTR("animal_joint_left_front_knee");
  v2[12] = &unk_1E459C550;
  v2[13] = &unk_1E459C568;
  v3[12] = CFSTR("animal_joint_left_front_paw");
  v3[13] = CFSTR("animal_joint_right_front_elbow");
  v2[14] = &unk_1E459C580;
  v2[15] = &unk_1E459C598;
  v3[14] = CFSTR("animal_joint_right_front_knee");
  v3[15] = CFSTR("animal_joint_right_front_paw");
  v2[16] = &unk_1E459C5B0;
  v2[17] = &unk_1E459C5C8;
  v3[16] = CFSTR("animal_joint_left_back_elbow");
  v3[17] = CFSTR("animal_joint_left_back_knee");
  v2[18] = &unk_1E459C5E0;
  v2[19] = &unk_1E459C5F8;
  v3[18] = CFSTR("animal_joint_left_back_paw");
  v3[19] = CFSTR("animal_joint_right_back_elbow");
  v2[20] = &unk_1E459C610;
  v2[21] = &unk_1E459C628;
  v3[20] = CFSTR("animal_joint_right_back_knee");
  v3[21] = CFSTR("animal_joint_right_back_paw");
  v2[22] = &unk_1E459C640;
  v2[23] = &unk_1E459C658;
  v3[22] = CFSTR("animal_joint_tail_top");
  v3[23] = CFSTR("animal_joint_tail_middle");
  v2[24] = &unk_1E459C670;
  v3[24] = CFSTR("animal_joint_tail_bottom");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::supportedAnimalPoseKeypointsRev1;
  +[VNRecognizedAnimalBodyPointsSpecifier supportedAnimalPoseKeypointsRev1]::supportedAnimalPoseKeypointsRev1 = v0;

}

@end
