@implementation VNRecognizedBodyPointsSpecifier

- (VNRecognizedBodyPointsSpecifier)initWithVCPPersonObservation:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  float v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float v25;
  __CFString *v26;
  VNDetectedPoint *v27;
  VNRecognizedPoint *v28;
  double v29;
  VNRecognizedPoint *v30;
  VNDetectedPoint *v31;
  double v32;
  VNRecognizedPoint *v33;
  double v34;
  VNRecognizedPoint *v35;
  VNRecognizedPoint *v36;
  double v37;
  VNRecognizedPoint *v38;
  VNRecognizedBodyPointsSpecifier *v39;
  uint64_t v40;
  NSArray *orderedPersonKeypoints;
  VNRecognizedBodyPointsSpecifier *v43;
  id v44;
  float v45;
  int v46;
  double v47;
  void *v48;
  int v49;
  objc_super v50;

  v6 = a4;
  objc_msgSend(a3, "keypoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8 + 2);
  v12 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v13 = objc_msgSend(v6, "requestRevision");
  if (v8)
  {
    v14 = v13;
    v48 = v10;
    v43 = self;
    v44 = v6;
    v15 = 0;
    v46 = 0;
    v16 = 0;
    v49 = 0;
    v45 = 0.0;
    v47 = v12;
    v17 = v11;
    v18 = 0.0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v16, v43, v44);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "location");
      v21 = v20;
      v23 = v22;
      objc_msgSend(v19, "confidence");
      v25 = fminf(v24, 1.0);
      if ((v14 == 3737841664 || v14 == 1)
        && v16 <= 0x10
        && (v26 = **(__CFString ***)((char *)off_1E4541DC8 + (v15 >> 29))) != 0)
      {
        v27 = (VNDetectedPoint *)v26;
        if ((-[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("left_upLeg_joint")) & 1) != 0
          || -[VNDetectedPoint isEqualToString:](v27, "isEqualToString:", CFSTR("right_upLeg_joint")))
        {
          v12 = v12 + v21;
          v17 = v17 + v23;
          v18 = v18 + v25;
          ++v49;
        }
        else if ((-[VNDetectedPoint isEqualToString:](v27, "isEqualToString:", CFSTR("left_shoulder_1_joint")) & 1) != 0
               || -[VNDetectedPoint isEqualToString:](v27, "isEqualToString:", CFSTR("right_shoulder_1_joint")))
        {
          v47 = v47 + v21;
          v11 = v11 + v23;
          v45 = v45 + v25;
          ++v46;
        }
        v28 = [VNRecognizedPoint alloc];
        *(float *)&v29 = v25;
        v30 = -[VNRecognizedPoint initWithLocation:confidence:identifier:](v28, "initWithLocation:confidence:identifier:", v27, v21, v23, v29);
        objc_msgSend(v48, "setObject:forKey:", v30, v27);
        objc_msgSend(v9, "addObject:", v30);

      }
      else
      {
        v31 = [VNDetectedPoint alloc];
        *(float *)&v32 = v25;
        v27 = -[VNDetectedPoint initWithLocation:confidence:](v31, "initWithLocation:confidence:", v21, v23, v32);
        objc_msgSend(v9, "addObject:", v27);
      }

      ++v16;
      v15 += 0x100000000;
    }
    while (v8 != v16);
    v10 = v48;
    if (v49 == 2)
    {
      v33 = [VNRecognizedPoint alloc];
      *(float *)&v34 = v18 * 0.5;
      v35 = -[VNRecognizedPoint initWithLocation:confidence:identifier:](v33, "initWithLocation:confidence:identifier:", CFSTR("root"), v12 * 0.5, v17 * 0.5, v34);
      objc_msgSend(v48, "setObject:forKey:", v35, CFSTR("root"));

    }
    self = v43;
    v6 = v44;
    if (v46 == 2)
    {
      v36 = [VNRecognizedPoint alloc];
      *(float *)&v37 = v45 * 0.5;
      v38 = -[VNRecognizedPoint initWithLocation:confidence:identifier:](v36, "initWithLocation:confidence:identifier:", CFSTR("neck_1_joint"), v47 * 0.5, v11 * 0.5, v37);
      objc_msgSend(v48, "setObject:forKey:", v38, CFSTR("neck_1_joint"));

    }
  }
  v50.receiver = self;
  v50.super_class = (Class)VNRecognizedBodyPointsSpecifier;
  v39 = -[VNRecognizedPointsSpecifier initWithOriginatingRequestSpecifier:allRecognizedPoints:](&v50, sel_initWithOriginatingRequestSpecifier_allRecognizedPoints_, v6, v10);
  if (v39)
  {
    v40 = objc_msgSend(v9, "copy");
    orderedPersonKeypoints = v39->_orderedPersonKeypoints;
    v39->_orderedPersonKeypoints = (NSArray *)v40;

  }
  return v39;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedBodyPointsSpecifier;
  return -[NSArray hash](self->_orderedPersonKeypoints, "hash") ^ __ROR8__(-[VNRecognizedPointsSpecifier hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNRecognizedBodyPointsSpecifier *v4;
  BOOL v5;
  objc_super v7;

  v4 = (VNRecognizedBodyPointsSpecifier *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VNRecognizedBodyPointsSpecifier;
    v5 = -[VNRecognizedPointsSpecifier isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NSArray isEqualToArray:](self->_orderedPersonKeypoints, "isEqualToArray:", v4->_orderedPersonKeypoints);
  }

  return v5;
}

- (id)availableGroupKeys
{
  if (availableGroupKeys_onceToken != -1)
    dispatch_once(&availableGroupKeys_onceToken, &__block_literal_global_1);
  return (id)availableGroupKeys_groupKeys;
}

- (id)pointKeyGroupLabelsMapping
{
  if (pointKeyGroupLabelsMapping_onceToken != -1)
    dispatch_once(&pointKeyGroupLabelsMapping_onceToken, &__block_literal_global_27);
  return (id)pointKeyGroupLabelsMapping_mapping;
}

- (id)populatedMLMultiArrayAndReturnError:(id *)a3
{
  void *v5;
  uint64_t v6;
  NSUInteger v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  id *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];

  v47[3] = *MEMORY[0x1E0C80C00];
  -[VNRecognizedPointsSpecifier originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requestRevision");
  if (v6 == 3737841664 || v6 == 1)
  {
    v8 = -[NSArray count](self->_orderedPersonKeypoints, "count");
    v9 = objc_alloc(MEMORY[0x1E0C9E970]);
    v47[0] = &unk_1E459C370;
    v47[1] = &unk_1E459C388;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithShape:dataType:error:", v11, 65600, a3);

    if (v12)
    {
      v42 = a3;
      v45 = v12;
      v46 = v5;
      v13 = objc_retainAutorelease(v12);
      v14 = objc_msgSend(v13, "dataPointer");
      v43 = v13;
      objc_msgSend(v13, "strides");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "intValue");

      v44 = v15;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");

      v20 = v17;
      v21 = v19;
      v22 = 2 * v19;
      if (v8)
      {
        v23 = 0;
        v24 = 0.0;
        v25 = 3.40282347e38;
        v26 = 0.0;
        while (2)
        {
          -[NSArray objectAtIndex:](self->_orderedPersonKeypoints, "objectAtIndex:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "location");
          v29 = v28;
          v31 = v30;
          objc_msgSend(v27, "confidence");
          v33 = v32;
          v34 = v23;
          switch((int)v23)
          {
            case 0:
              goto LABEL_30;
            case 1:
              v34 = 15;
              goto LABEL_30;
            case 2:
              v34 = 14;
              goto LABEL_30;
            case 3:
              v34 = 17;
              goto LABEL_30;
            case 4:
              v34 = 16;
              goto LABEL_30;
            case 5:
              if (v25 > v33)
                v25 = v33;
              v26 = v26 + v29;
              v24 = v24 + v31;
              v34 = 5;
              goto LABEL_30;
            case 6:
              if (v25 > v33)
                v25 = v33;
              v26 = v26 + v29;
              v24 = v24 + v31;
              v34 = 2;
              goto LABEL_30;
            case 7:
              v34 = 6;
              goto LABEL_30;
            case 8:
              v34 = 3;
              goto LABEL_30;
            case 9:
              v34 = 7;
              goto LABEL_30;
            case 10:
              v34 = 4;
              goto LABEL_30;
            case 11:
              v34 = 11;
              goto LABEL_30;
            case 12:
              v34 = 8;
              goto LABEL_30;
            case 13:
              v34 = 12;
              goto LABEL_30;
            case 14:
              v34 = 9;
              goto LABEL_30;
            case 15:
              v34 = 13;
              goto LABEL_30;
            case 16:
              v34 = 10;
LABEL_30:
              v35 = v34 * v20;
              *(double *)(v14 + 8 * v35) = v29;
              *(double *)(v14 + 8 * (v35 + v21)) = v31;
              *(double *)(v14 + 8 * (v35 + v22)) = v33;

              if (v8 == ++v23)
                goto LABEL_36;
              continue;
            default:
              v37 = v15;
              if (v42)
              {
                v39 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23, v33);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "stringWithFormat:", CFSTR("unexpected keypoint type %@"), v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", v41);
                *v42 = (id)objc_claimAutoreleasedReturnValue();

              }
              v36 = 0;
              v12 = v45;
              v5 = v46;
              goto LABEL_37;
          }
        }
      }
      v26 = 0.0;
      v25 = 3.40282347e38;
      v24 = 0.0;
LABEL_36:
      *(double *)(v14 + 8 * v20) = v26 * 0.5;
      *(double *)(v14 + 8 * (v21 + v20)) = v24 * 0.5;
      *(double *)(v14 + 8 * (v22 + v20)) = v25;
      v36 = v43;
      v12 = v45;
      v5 = v46;
      v37 = v44;
LABEL_37:

    }
    else
    {
      v36 = 0;
    }

  }
  else if (a3)
  {
    +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v5);
    v36 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedBodyPointsSpecifier;
  v4 = a3;
  -[VNRecognizedPointsSpecifier encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_orderedPersonKeypoints, CFSTR("OrderedKeypoints"), v5.receiver, v5.super_class);

}

- (VNRecognizedBodyPointsSpecifier)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedBodyPointsSpecifier *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *orderedPersonKeypoints;
  VNRecognizedBodyPointsSpecifier *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNRecognizedBodyPointsSpecifier;
  v5 = -[VNRecognizedPointsSpecifier initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("OrderedKeypoints"));
    v10 = objc_claimAutoreleasedReturnValue();
    orderedPersonKeypoints = v5->_orderedPersonKeypoints;
    v5->_orderedPersonKeypoints = (NSArray *)v10;

    if (!v5->_orderedPersonKeypoints)
    {
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("ordered keypoints are not available"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v13);

      v12 = 0;
      goto LABEL_6;
    }

  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedPersonKeypoints, 0);
}

void __61__VNRecognizedBodyPointsSpecifier_pointKeyGroupLabelsMapping__block_invoke()
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
  v8[0] = CFSTR("VNBLKFACE");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("head_joint"), CFSTR("left_eye_joint"), CFSTR("right_eye_joint"), CFSTR("left_ear_joint"), CFSTR("right_ear_joint"), 0);
  v9[0] = v0;
  v8[1] = CFSTR("VNBLKTORSO");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("left_shoulder_1_joint"), CFSTR("right_shoulder_1_joint"), CFSTR("neck_1_joint"), CFSTR("left_upLeg_joint"), CFSTR("right_upLeg_joint"), CFSTR("root"), 0);
  v9[1] = v1;
  v8[2] = CFSTR("VNBLKLARM");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("left_shoulder_1_joint"), CFSTR("left_forearm_joint"), CFSTR("left_hand_joint"), 0);
  v9[2] = v2;
  v8[3] = CFSTR("VNBLKRARM");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("right_shoulder_1_joint"), CFSTR("right_forearm_joint"), CFSTR("right_hand_joint"), 0);
  v9[3] = v3;
  v8[4] = CFSTR("VNBLKLLEG");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("left_upLeg_joint"), CFSTR("left_leg_joint"), CFSTR("left_foot_joint"), 0);
  v9[4] = v4;
  v8[5] = CFSTR("VNBLKRLEG");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("right_upLeg_joint"), CFSTR("right_leg_joint"), CFSTR("right_foot_joint"), 0);
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)pointKeyGroupLabelsMapping_mapping;
  pointKeyGroupLabelsMapping_mapping = v6;

}

void __53__VNRecognizedBodyPointsSpecifier_availableGroupKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("VNBLKFACE");
  v2[1] = CFSTR("VNBLKTORSO");
  v2[2] = CFSTR("VNBLKLARM");
  v2[3] = CFSTR("VNBLKRARM");
  v2[4] = CFSTR("VNBLKLLEG");
  v2[5] = CFSTR("VNBLKRLEG");
  v2[6] = CFSTR("VNIPOAll");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)availableGroupKeys_groupKeys;
  availableGroupKeys_groupKeys = v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
