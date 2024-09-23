@implementation PHFace

- (BOOL)isTorsoOnly
{
  double v3;
  double v4;

  -[PHFace centerX](self, "centerX");
  if (v3 != 0.0)
    return 0;
  -[PHFace bodyCenterX](self, "bodyCenterX");
  return v4 != 0.0;
}

- (NSString)personLocalIdentifier
{
  void *v2;

  if (self->_personUUID)
  {
    +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHFace)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHFace *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id adjustmentVersion;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  void *v77;
  float v78;
  void *v79;
  float v80;
  void *v81;
  double v82;
  void *v83;
  double v84;
  uint64_t v85;
  NSString *personUUID;
  uint64_t v87;
  NSString *v88;
  void *v89;
  __int16 v90;
  BOOL v91;
  id v92;
  objc_super v94;

  v8 = a3;
  v94.receiver = self;
  v94.super_class = (Class)PHFace;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v94, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (!v9)
    goto LABEL_8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("size"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v9->_size = v11;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("centerX"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v9->_centerX = v13;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("centerY"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v9->_centerY = v15;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bodyCenterX"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v9->_bodyCenterX = v17;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bodyCenterY"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v9->_bodyCenterY = v19;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bodyWidth"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v9->_bodyWidth = v21;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bodyHeight"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v9->_bodyHeight = v23;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("detectionType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_detectionType = objc_msgSend(v24, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sourceWidth"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_sourceWidth = objc_msgSend(v25, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sourceHeight"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_sourceHeight = objc_msgSend(v26, "longLongValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("roll"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v9->_roll = v28;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hidden"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_hidden = objc_msgSend(v29, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isInTrash"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_inTrash = objc_msgSend(v30, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("manual"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_manual = objc_msgSend(v31, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hasSmile"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_hasSmile = objc_msgSend(v32, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("blurScore"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  v9->_blurScore = v34;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isLeftEyeClosed"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_leftEyeClosed = objc_msgSend(v35, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isRightEyeClosed"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_rightEyeClosed = objc_msgSend(v36, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("adjustmentVersion"));
  v37 = objc_claimAutoreleasedReturnValue();
  adjustmentVersion = v9->_adjustmentVersion;
  v9->_adjustmentVersion = (id)v37;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nameSource"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_nameSource = objc_msgSend(v39, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trainingType"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_trainingType = objc_msgSend(v40, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("confirmedFaceCropGenerationState"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_confirmedFaceCropGenerationState = objc_msgSend(v41, "intValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("poseYaw"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "doubleValue");
  v9->_poseYaw = v43;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("faceAlgorithmVersion"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_faceAlgorithmVersion = objc_msgSend(v44, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clusterSequenceNumber"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_clusterSequenceNumber = objc_msgSend(v45, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("qualityMeasure"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_qualityMeasure = objc_msgSend(v46, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("quality"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  v9->_quality = v48;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("vuObservationID"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_vuObservationID = objc_msgSend(v49, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ageType"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_ageType = objc_msgSend(v50, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("genderType"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_sexType = objc_msgSend(v51, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eyesState"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_eyesState = objc_msgSend(v52, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("smileType"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_smileType = objc_msgSend(v53, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("facialHairType"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_facialHairType = objc_msgSend(v54, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hairColorType"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_hairColorType = objc_msgSend(v55, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("glassesType"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_glassesType = objc_msgSend(v56, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eyeMakeupType"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_eyeMakeupType = objc_msgSend(v57, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lipMakeupType"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_lipMakeupType = objc_msgSend(v58, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("faceExpressionType"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_faceExpressionType = objc_msgSend(v59, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("headgearType"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_headgearType = objc_msgSend(v60, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hairType"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_hairType = objc_msgSend(v61, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("poseType"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_poseType = objc_msgSend(v62, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("skintoneType"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_skintoneType = objc_msgSend(v63, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ethnicityType"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_ethnicityType = objc_msgSend(v64, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hasFaceMask"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_hasFaceMask = objc_msgSend(v65, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("gazeType"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_gazeType = objc_msgSend(v66, "integerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("gazeCenterX"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "doubleValue");
  v9->_gazeCenterX = v68;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("gazeCenterY"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "doubleValue");
  v9->_gazeCenterY = v70;

  v71 = (void *)MEMORY[0x1E0D716C8];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("gazeRectString"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "cgRectFromGazeRectString:", v72);
  v9->_gazeRect.origin.x = v73;
  v9->_gazeRect.origin.y = v74;
  v9->_gazeRect.size.width = v75;
  v9->_gazeRect.size.height = v76;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("gazeAngle"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "floatValue");
  v9->_gazeAngle = v78;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("gazeConfidence"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "floatValue");
  v9->_gazeConfidence = v80;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startTime"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "doubleValue");
  v9->_startTime = v82;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("duration"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "doubleValue");
  v9->_duration = v84;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personForFace.personUUID"));
  v85 = objc_claimAutoreleasedReturnValue();
  personUUID = v9->_personUUID;
  v9->_personUUID = (NSString *)v85;

  if (!v9->_personUUID)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("personForTemporalDetectedFaces.personUUID"));
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = v9->_personUUID;
    v9->_personUUID = (NSString *)v87;

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("vipModelType"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "integerValue");

  if (!v90)
  {
    v91 = 0;
LABEL_10:
    v9->_isInVIPModel = v91;
    if ((a4 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v91 = v90;
  if (v90 == 1)
    goto LABEL_10;
  if ((a4 & 4) != 0)
LABEL_7:
    v92 = -[PHFace _createPropertyObjectOfClass:preFetchedProperties:](v9, "_createPropertyObjectOfClass:preFetchedProperties:", objc_opt_class(), v8);
LABEL_8:

  return v9;
}

- (id)_createPropertyObjectOfClass:(Class)a3 preFetchedProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  __CFString *v30;
  id v31;
  id v32;
  id v33;
  PHFace *v34;
  uint64_t *v35;
  Class v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v6 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__28508;
  v41 = __Block_byref_object_dispose__28509;
  ph_objc_getAssociatedObject(self, a3);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v38[5];
  if (!v7)
  {
    -[objc_class keyPathToPrimaryObject](a3, "keyPathToPrimaryObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = objc_msgSend([a3 alloc], "initWithFetchDictionary:face:prefetched:", v6, self, 1);
      v10 = (__CFString *)v38[5];
      v38[5] = v9;
    }
    else
    {
      -[objc_class entityName](a3, "entityName");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("DetectedFace");
      if (v11)
        v13 = (__CFString *)v11;
      v14 = v13;

      v15 = (void *)MEMORY[0x1E0CB3880];
      -[PHObject objectID](self, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K == %@"), v8, v16);
      else
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("self == %@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[objc_class propertiesToFetch](a3, "propertiesToFetch");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHObject photoLibrary](self, "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class propertySetName](a3, "propertySetName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectFetchingManagedObjectContextForObject:propertySet:", self, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __60__PHFace__createPropertyObjectOfClass_preFetchedProperties___block_invoke;
      v29[3] = &unk_1E35DC028;
      v10 = v14;
      v30 = v10;
      v22 = v17;
      v31 = v22;
      v23 = v18;
      v32 = v23;
      v24 = v21;
      v35 = &v37;
      v36 = a3;
      v33 = v24;
      v34 = self;
      objc_msgSend(v24, "performBlockAndWait:", v29);

    }
    ph_objc_setAssociatedObjectIfNotSet(self, a3, (void *)v38[5]);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v38[5];
    v38[5] = v25;

    v7 = (void *)v38[5];
  }
  v27 = v7;
  _Block_object_dispose(&v37, 8);

  return v27;
}

- (id)_createPropertyObjectOfClass:(Class)a3
{
  return -[PHFace _createPropertyObjectOfClass:preFetchedProperties:](self, "_createPropertyObjectOfClass:preFetchedProperties:", a3, 0);
}

- (id)faceClusteringProperties
{
  -[PHObject assertRequiredFetchPropertyHints:](self, "assertRequiredFetchPropertyHints:", 4);
  return -[PHFace _createPropertyObjectOfClass:](self, "_createPropertyObjectOfClass:", objc_opt_class());
}

- (BOOL)isConfirmedFaceCropGenerationPending
{
  return -[PHFace confirmedFaceCropGenerationState](self, "confirmedFaceCropGenerationState") == 1;
}

- (double)size
{
  return self->_size;
}

- (double)centerX
{
  return self->_centerX;
}

- (double)centerY
{
  return self->_centerY;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (int64_t)clusterSequenceNumber
{
  return self->_clusterSequenceNumber;
}

- (int64_t)qualityMeasure
{
  return self->_qualityMeasure;
}

- (double)quality
{
  return self->_quality;
}

- (int64_t)vuObservationID
{
  return self->_vuObservationID;
}

- (NSString)personUUID
{
  return self->_personUUID;
}

- (signed)confirmedFaceCropGenerationState
{
  return self->_confirmedFaceCropGenerationState;
}

- (int64_t)sourceWidth
{
  return self->_sourceWidth;
}

- (int64_t)sourceHeight
{
  return self->_sourceHeight;
}

- (double)roll
{
  return self->_roll;
}

- (BOOL)isInVIPModel
{
  return self->_isInVIPModel;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isInTrash
{
  return self->_inTrash;
}

- (BOOL)manual
{
  return self->_manual;
}

- (BOOL)hasSmile
{
  return self->_hasSmile;
}

- (double)blurScore
{
  return self->_blurScore;
}

- (BOOL)isLeftEyeClosed
{
  return self->_leftEyeClosed;
}

- (BOOL)isRightEyeClosed
{
  return self->_rightEyeClosed;
}

- (id)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (int64_t)nameSource
{
  return self->_nameSource;
}

- (int)trainingType
{
  return self->_trainingType;
}

- (double)poseYaw
{
  return self->_poseYaw;
}

- (void)setPoseYaw:(double)a3
{
  self->_poseYaw = a3;
}

- (int64_t)faceAlgorithmVersion
{
  return self->_faceAlgorithmVersion;
}

- (void)setFaceAlgorithmVersion:(int64_t)a3
{
  self->_faceAlgorithmVersion = a3;
}

- (unsigned)ageType
{
  return self->_ageType;
}

- (unsigned)sexType
{
  return self->_sexType;
}

- (unsigned)eyesState
{
  return self->_eyesState;
}

- (unsigned)smileType
{
  return self->_smileType;
}

- (unsigned)facialHairType
{
  return self->_facialHairType;
}

- (unsigned)hairColorType
{
  return self->_hairColorType;
}

- (unsigned)glassesType
{
  return self->_glassesType;
}

- (unsigned)eyeMakeupType
{
  return self->_eyeMakeupType;
}

- (unsigned)lipMakeupType
{
  return self->_lipMakeupType;
}

- (unsigned)faceExpressionType
{
  return self->_faceExpressionType;
}

- (unsigned)headgearType
{
  return self->_headgearType;
}

- (unsigned)hairType
{
  return self->_hairType;
}

- (unsigned)poseType
{
  return self->_poseType;
}

- (unsigned)skintoneType
{
  return self->_skintoneType;
}

- (unsigned)ethnicityType
{
  return self->_ethnicityType;
}

- (BOOL)hasFaceMask
{
  return self->_hasFaceMask;
}

- (unsigned)gazeType
{
  return self->_gazeType;
}

- (double)gazeCenterX
{
  return self->_gazeCenterX;
}

- (double)gazeCenterY
{
  return self->_gazeCenterY;
}

- (CGRect)gazeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gazeRect.origin.x;
  y = self->_gazeRect.origin.y;
  width = self->_gazeRect.size.width;
  height = self->_gazeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)gazeAngle
{
  return self->_gazeAngle;
}

- (float)gazeConfidence
{
  return self->_gazeConfidence;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_adjustmentVersion, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
}

void __60__PHFace__createPropertyObjectOfClass_preFetchedProperties___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setPropertiesToFetch:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v7, "setResultType:", 2);
  objc_msgSend(*(id *)(a1 + 56), "executeFetchRequest:error:", v7, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 80)), "initWithFetchDictionary:face:prefetched:", v3, *(_QWORD *)(a1 + 64), 0);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(CFSTR("PHFacePropertySetIdentifier"), "length"))
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("PHFacePropertySetIdentifier"));
  else
    v4 = 0;
  if (objc_msgSend(CFSTR("PHFacePropertySetCore"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHFacePropertySetCore")))
  {
    v4 |= 2uLL;
  }
  if (objc_msgSend(CFSTR("PHFacePropertySetClustering"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHFacePropertySetClustering")))
  {
    v4 |= 4uLL;
  }
  if (objc_msgSend(CFSTR("PHFacePropertySetCropping"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHFacePropertySetCropping")))
  {
    v4 |= 8uLL;
  }
  if (objc_msgSend(CFSTR("PHFacePropertySetPersonBuilder"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHFacePropertySetPersonBuilder")))
  {
    v4 |= 0x10uLL;
  }
  if (objc_msgSend(CFSTR("PHFacePropertySetSexAge"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHFacePropertySetSexAge")))
  {
    v4 |= 0x20uLL;
  }
  if (objc_msgSend(CFSTR("PHFacePropertySetAnalytics"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHFacePropertySetAnalytics")))
  {
    v4 |= 0x40uLL;
  }
  if (!objc_msgSend(v3, "containsObject:", CFSTR("PHFacePropertySetIdentifier")))
    v4 |= 2uLL;

  return v4;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("PHFacePropertySetIdentifier"), "length");
  if ((v3 & 1) != 0 && v5)
    objc_msgSend(v4, "addObject:", CFSTR("PHFacePropertySetIdentifier"));
  v6 = objc_msgSend(CFSTR("PHFacePropertySetCore"), "length");
  if ((v3 & 2) != 0 && v6)
    objc_msgSend(v4, "addObject:", CFSTR("PHFacePropertySetCore"));
  v7 = objc_msgSend(CFSTR("PHFacePropertySetClustering"), "length");
  if ((v3 & 4) != 0 && v7)
    objc_msgSend(v4, "addObject:", CFSTR("PHFacePropertySetClustering"));
  v8 = objc_msgSend(CFSTR("PHFacePropertySetCropping"), "length");
  if ((v3 & 8) != 0 && v8)
    objc_msgSend(v4, "addObject:", CFSTR("PHFacePropertySetCropping"));
  v9 = objc_msgSend(CFSTR("PHFacePropertySetPersonBuilder"), "length");
  if ((v3 & 0x10) != 0 && v9)
    objc_msgSend(v4, "addObject:", CFSTR("PHFacePropertySetPersonBuilder"));
  v10 = objc_msgSend(CFSTR("PHFacePropertySetSexAge"), "length");
  if ((v3 & 0x20) != 0 && v10)
    objc_msgSend(v4, "addObject:", CFSTR("PHFacePropertySetSexAge"));
  v11 = objc_msgSend(CFSTR("PHFacePropertySetAnalytics"), "length");
  if ((v3 & 0x40) != 0 && v11)
    objc_msgSend(v4, "addObject:", CFSTR("PHFacePropertySetAnalytics"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)identifierCode
{
  return CFSTR("080");
}

+ (id)managedEntityName
{
  return CFSTR("DetectedFace");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHFace");
  return CFSTR("PHFace");
}

+ (BOOL)managedObjectSupportsFaceState
{
  return 1;
}

+ (BOOL)managedObjectSupportsDetectionType
{
  return 1;
}

+ (BOOL)managedObjectSupportsBodyDetection
{
  return 1;
}

+ (id)corePropertiesToFetch
{
  if (corePropertiesToFetch_onceToken_28724 != -1)
    dispatch_once(&corePropertiesToFetch_onceToken_28724, &__block_literal_global_28725);
  return (id)corePropertiesToFetch_array_28726;
}

+ (id)croppingPropertiesToFetch
{
  if (croppingPropertiesToFetch_onceToken != -1)
    dispatch_once(&croppingPropertiesToFetch_onceToken, &__block_literal_global_152);
  return (id)croppingPropertiesToFetch_array;
}

+ (id)personBuilderPropertiesToFetch
{
  if (personBuilderPropertiesToFetch_onceToken != -1)
    dispatch_once(&personBuilderPropertiesToFetch_onceToken, &__block_literal_global_153);
  return (id)personBuilderPropertiesToFetch_array;
}

+ (id)genderAgePropertiesToFetch
{
  if (genderAgePropertiesToFetch_onceToken != -1)
    dispatch_once(&genderAgePropertiesToFetch_onceToken, &__block_literal_global_154_28723);
  return (id)genderAgePropertiesToFetch_array;
}

+ (id)analyticsPropertiesToFetch
{
  pl_dispatch_once();
  return (id)analyticsPropertiesToFetch_pl_once_object_15;
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "identifierPropertiesToFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v8);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "corePropertiesToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v9);

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(a1, "extendPropertiesToFetch:withPropertySetClass:", v5, objc_opt_class());
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(a1, "croppingPropertiesToFetch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v10);

  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(a1, "genderAgePropertiesToFetch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v12);

    if ((v3 & 0x40) == 0)
      return v5;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(a1, "personBuilderPropertiesToFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v11);

  if ((v3 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    objc_msgSend(a1, "analyticsPropertiesToFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "extendPropertiesToFetch:withProperties:", v5, v6);

  }
  return v5;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (propertiesToFetchWithHint__onceToken_28718 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_28718, &__block_literal_global_157_28719);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__28508;
  v9 = __Block_byref_object_dispose__28509;
  v10 = 0;
  pl_dispatch_sync();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_16_28714;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PHFace_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_28704 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_28704, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_28705, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)fetchFacesWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_176);
}

+ (id)fetchFacesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PHFace_fetchFacesWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchFacesWithVuObservationIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PHFace_fetchFacesWithVuObservationIDs_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchFacesInAsset:(id)a3 options:(id)a4
{
  void *v4;
  PHFetchResult *v5;

  if (a3)
  {
    +[PHQuery queryForFacesInAsset:options:](PHQuery, "queryForFacesInAsset:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(PHFetchResult);
  }
  return v5;
}

+ (id)fetchFacesInAssets:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PHFetchResult *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    +[PHQuery queryForFacesInAssets:options:](PHQuery, "queryForFacesInAssets:options:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeQuery");
    v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = objc_alloc_init(PHFetchResult);
  }

  return v8;
}

+ (id)fetchFacesForPerson:(id)a3 options:(id)a4
{
  void *v4;
  PHFetchResult *v5;

  if (a3)
  {
    +[PHQuery queryForFacesForPerson:options:](PHQuery, "queryForFacesForPerson:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(PHFetchResult);
  }
  return v5;
}

+ (id)fetchKeyFaceForPerson:(id)a3 options:(id)a4
{
  void *v4;
  PHFetchResult *v5;

  if (a3)
  {
    +[PHQuery queryForKeyFaceOnPerson:options:](PHQuery, "queryForKeyFaceOnPerson:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(PHFetchResult);
  }
  return v5;
}

+ (id)fetchFacesOnAssetWithFace:(id)a3 options:(id)a4
{
  void *v4;
  PHFetchResult *v5;

  if (a3)
  {
    +[PHQuery queryForFacesOnAssetWithFace:options:](PHQuery, "queryForFacesOnAssetWithFace:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(PHFetchResult);
  }
  return v5;
}

+ (id)fetchFacesInFaceGroup:(id)a3 options:(id)a4
{
  void *v4;
  PHFetchResult *v5;

  if (a3)
  {
    +[PHQuery queryForFacesInFaceGroup:options:](PHQuery, "queryForFacesInFaceGroup:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(PHFetchResult);
  }
  return v5;
}

+ (id)fetchKeyFaceForFaceGroup:(id)a3 options:(id)a4
{
  void *v4;
  PHFetchResult *v5;

  if (a3)
  {
    +[PHQuery queryForKeyFaceForFaceGroup:options:](PHQuery, "queryForKeyFaceForFaceGroup:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(PHFetchResult);
  }
  return v5;
}

+ (id)fetchSingletonFacesWithOptions:(id)a3
{
  void *v3;
  void *v4;

  +[PHQuery queryForSingletonFacesWithOptions:](PHQuery, "queryForSingletonFacesWithOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fetchRejectedFacesForPerson:(id)a3 options:(id)a4
{
  void *v4;
  PHFetchResult *v5;

  if (a3)
  {
    +[PHQuery queryForRejectedFacesOnPerson:options:](PHQuery, "queryForRejectedFacesOnPerson:options:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeQuery");
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = objc_alloc_init(PHFetchResult);
  }
  return v5;
}

+ (id)fetchFacesForFaceCrop:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;

  +[PHQuery queryForFacesOnFaceCrop:options:](PHQuery, "queryForFacesOnFaceCrop:options:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchKeyFaceByPersonLocalIdentifierForPersons:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  const __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v14, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);
        objc_msgSend(v14, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v15);

        if (!v11)
        {
          objc_msgSend(v14, "photoLibrary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v26, "fetchPropertySets");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v36 = CFSTR("PHFacePropertySetCore");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0D716C8];
    objc_msgSend(v11, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __64__PHFace_fetchKeyFaceByPersonLocalIdentifierForPersons_options___block_invoke;
    v27[3] = &unk_1E35DBFC0;
    v28 = v11;
    v29 = v17;
    v30 = v7;
    v21 = v18;
    v31 = v21;
    v22 = v17;
    objc_msgSend(v19, "batchFetchKeyFaceByPersonObjectIDWithPersonObjectIDs:library:completion:", v6, v20, v27);

    v23 = v31;
    v24 = v21;

  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AA70];
  }

  return v24;
}

+ (int64_t)faceFetchTypeForOptions:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  if (objc_msgSend(v3, "includeTorsoAndFaceDetectionData")
    && !objc_msgSend(v4, "includeOnlyTorsoDetectionData"))
  {
    v5 = 2;
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "includeTorsoAndFaceDetectionData") & 1) == 0)
    v5 = objc_msgSend(v4, "includeOnlyTorsoDetectionData");
  else
LABEL_5:
    v5 = 0;
LABEL_8:

  return v5;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = propertySetClassForPropertySet__onceToken_28699;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&propertySetClassForPropertySet__onceToken_28699, &__block_literal_global_182);
  objc_msgSend((id)propertySetClassForPropertySet__propertySetClassByPropertySetName_28700, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (id)propertySetAccessorsByPropertySet
{
  if (propertySetAccessorsByPropertySet_onceToken_28692 != -1)
    dispatch_once(&propertySetAccessorsByPropertySet_onceToken_28692, &__block_literal_global_184);
  return (id)propertySetAccessorsByPropertySet_accessorByPropertySetName_28693;
}

+ (id)fetchFacesGroupedByAssetLocalIdentifierForAssets:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[4];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__28508;
  v39 = __Block_byref_object_dispose__28509;
  v40 = 0;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    memset(v34, 0, sizeof(v34));
    v8 = v5;
    if (objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v34, v42, 16))
    {
      objc_msgSend(**((id **)&v34[0] + 1), "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
    else
    {
      v7 = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    }
    while (v12);
  }

  if (v6)
  {
    +[PHQuery queryForFacesWithOptions:](PHQuery, "queryForFacesWithOptions:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v18 = +[PHFace faceFetchTypeForOptions:](PHFace, "faceFetchTypeForOptions:", v6);
  v19 = (void *)MEMORY[0x1E0D716C8];
  objc_msgSend(v17, "predicate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibraryForCurrentQueueQoS");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__PHFace_fetchFacesGroupedByAssetLocalIdentifierForAssets_options___block_invoke;
  v26[3] = &unk_1E35DC078;
  v29 = &v35;
  v22 = v7;
  v27 = v22;
  v23 = v6;
  v28 = v23;
  objc_msgSend(v19, "batchFetchDetectedFacesByAssetUUIDWithAssetUUIDs:predicate:fetchType:library:completion:", v10, v20, v18, v21, v26);

  v24 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v24;
}

+ (id)fetchSuggestedFacesForPerson:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  PHManualFetchResult *v65;
  void *v66;
  void *v67;
  void *v68;
  PHManualFetchResult *v69;
  NSObject *v70;
  uint64_t v71;
  double v72;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id obj;
  uint64_t v86;
  unint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  double v114;
  _BYTE v115[128];
  void *v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _QWORD v119[5];

  v119[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v74 = v7;
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFetchLimit:", 250);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v12);

  objc_msgSend(v9, "setWantsIncrementalChangeDetails:", 0);
  v75 = v9;
  +[PHAsset fetchAssetsForPerson:options:](PHAsset, "fetchAssetsForPerson:options:", v5, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v6;
  v14 = (void *)objc_msgSend(v6, "copy");
  +[PHFace fetchFacesGroupedByAssetLocalIdentifierForAssets:options:](PHFace, "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v13, v14);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v5;
  objc_msgSend(v5, "localIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v13;
  v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
  if (v89)
  {
    v86 = *(_QWORD *)v106;
    v16 = 0.75;
    do
    {
      for (i = 0; i != v89; ++i)
      {
        if (*(_QWORD *)v106 != v86)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v18, "localIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
        v24 = v22;
        if (v23)
        {
          v25 = v23;
          v91 = v20;
          v93 = v19;
          v26 = *(_QWORD *)v102;
LABEL_8:
          v27 = 0;
          while (1)
          {
            if (*(_QWORD *)v102 != v26)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v27);
            objc_msgSend(v28, "personLocalIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", v15);

            if ((v30 & 1) != 0)
              break;
            if (v25 == ++v27)
            {
              v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
              if (v25)
                goto LABEL_8;
              v24 = v22;
              v20 = v91;
              v19 = v93;
              goto LABEL_32;
            }
          }
          v24 = v28;

          v20 = v91;
          v19 = v93;
          if (!v24)
            goto LABEL_33;
          objc_msgSend(v83, "addObject:", v18);
          objc_msgSend(v84, "setObject:forKeyedSubscript:", v24, v91);
          objc_msgSend(v24, "roll");
          if (v31 < 0.0)
            v31 = -v31;
          v32 = 0.0;
          if (v31 <= 3.142)
            v33 = (3.142 - v31) / 3.142;
          else
            v33 = 0.0;
          objc_msgSend(v24, "size");
          if (v34 >= 0.05 && v34 <= v16)
          {
            if (v34 <= 0.4)
            {
              v32 = v34 / 0.4;
            }
            else
            {
              v16 = 0.75;
              if (v34 >= 0.75)
                v32 = 0.0;
              else
                v32 = (0.75 - v34) / 0.35;
            }
          }
          objc_msgSend(v18, "overallAestheticScore");
          v37 = ceil(v36 * 10.0) / 10.0;
          objc_msgSend(v18, "curationScore");
          v39 = 1.0 / (double)(unint64_t)objc_msgSend(v22, "count")
              + v33 * 10.0
              + ceil(v32 * 4.0) * 0.25 * 0.1
              + v37 * 0.01
              + ceil(v38 * 10.0) / 10.0 * 0.01;
          objc_msgSend(v24, "quality");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39 + fmax(v40, 0.0) * 0.001);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v41, v91);

        }
LABEL_32:

LABEL_33:
        objc_autoreleasePoolPop(v19);
      }
      v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
    }
    while (v89);
  }

  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __47__PHFace_fetchSuggestedFacesForPerson_options___block_invoke;
  v99[3] = &unk_1E35DC0A0;
  v82 = v81;
  v100 = v82;
  objc_msgSend(v83, "sortedArrayUsingComparator:", v99);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76 && objc_msgSend(v76, "fetchLimit"))
    v43 = objc_msgSend(v76, "fetchLimit");
  else
    v43 = 4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v43);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "photoLibrary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "librarySpecificFetchOptions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "setFetchLimit:", 1);
  objc_msgSend(v45, "setWantsIncrementalChangeDetails:", 0);
  v80 = v45;
  +[PHFace fetchKeyFaceForPerson:options:](PHFace, "fetchKeyFaceForPerson:options:", v77, v45);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "firstObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localIdentifier");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v43;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v43);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    objc_msgSend(v90, "addObject:", v46);
    v116 = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAsset fetchAssetsForFaces:options:](PHAsset, "fetchAssetsForFaces:options:", v49, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "firstObject");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v51, "creationDate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "pl_startOfDayForDate:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "addObject:", v53);
    }

  }
  v78 = v46;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v94 = v42;
  v54 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v96;
    while (2)
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v96 != v56)
          objc_enumerationMutation(v94);
        v58 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
        objc_msgSend(v58, "creationDate");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "pl_startOfDayForDate:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v47, "containsObject:", v60) & 1) == 0)
        {
          objc_msgSend(v47, "addObject:", v60);
          objc_msgSend(v58, "localIdentifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKeyedSubscript:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62)
          {
            objc_msgSend(v62, "localIdentifier");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "isEqualToString:", v92);

            if ((v64 & 1) == 0)
            {
              objc_msgSend(v90, "addObject:", v62);
              if (objc_msgSend(v90, "count") >= v87)
              {

                goto LABEL_57;
              }
            }
          }

        }
      }
      v55 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
      if (v55)
        continue;
      break;
    }
  }
LABEL_57:

  v65 = [PHManualFetchResult alloc];
  objc_msgSend(v75, "photoLibrary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFace fetchType](PHFace, "fetchType");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "fetchPropertySetsAsSet");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v65, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v90, v66, v67, v68, 0, 0);

  PLPhotoKitGetLog();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    v71 = -[PHFetchResult count](v69, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 138412802;
    v110 = v15;
    v111 = 2048;
    v112 = v71;
    v113 = 2048;
    v114 = (v72 - v74) * 1000.0;
    _os_log_impl(&dword_1991EC000, v70, OS_LOG_TYPE_DEFAULT, "Finished running suggested faces for: %@. Found %lu assets, took %f ms", buf, 0x20u);
  }

  return v69;
}

uint64_t __47__PHFace_fetchSuggestedFacesForPerson_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

void __67__PHFace_fetchFacesGroupedByAssetLocalIdentifierForAssets_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__PHFace_fetchFacesGroupedByAssetLocalIdentifierForAssets_options___block_invoke_2;
    v13[3] = &unk_1E35DC050;
    v14 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v15 = v10;
    v16 = v11;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
  else
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Error batch fetching person groups by asset: %@", buf, 0xCu);
    }

  }
}

void __67__PHFace_fetchFacesGroupedByAssetLocalIdentifierForAssets_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PHFacePLAdapter *v12;
  void *v13;
  id v14;
  PHManualFetchResult *v15;
  uint64_t v16;
  void *v17;
  PHManualFetchResult *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHFacePLAdapter alloc], "initWithPLManagedObject:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11), *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "fetchPropertySets");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[PHFacePLAdapter newObjectWithPropertySets:](v12, "newObjectWithPropertySets:", v13);

        objc_msgSend(v6, "addObject:", v14);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v15 = [PHManualFetchResult alloc];
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fetchPropertySetsAsSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PHManualFetchResult initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v15, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v6, v16, CFSTR("PHFace"), v17, 0, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v18, v19);
}

void __43__PHFace_propertySetAccessorsByPropertySet__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHFacePropertySetIdentifier");
  v2[1] = CFSTR("PHFacePropertySetCore");
  v3[0] = CFSTR("self");
  v3[1] = CFSTR("self");
  v2[2] = CFSTR("PHFacePropertySetClustering");
  v2[3] = CFSTR("PHFacePropertySetCropping");
  v3[2] = CFSTR("faceClusteringProperties");
  v3[3] = CFSTR("self");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName_28693;
  propertySetAccessorsByPropertySet_accessorByPropertySetName_28693 = v0;

}

void __41__PHFace_propertySetClassForPropertySet___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHFacePropertySetIdentifier");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("PHFacePropertySetCore");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("PHFacePropertySetClustering");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("PHFacePropertySetCropping");
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertySetClassForPropertySet__propertySetClassByPropertySetName_28700;
  propertySetClassForPropertySet__propertySetClassByPropertySetName_28700 = v0;

}

void __64__PHFace_fetchKeyFaceByPersonLocalIdentifierForPersons_options___block_invoke(id *a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PHFace_fetchKeyFaceByPersonLocalIdentifierForPersons_options___block_invoke_2;
  v4[3] = &unk_1E35DBF98;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __64__PHFace_fetchKeyFaceByPersonLocalIdentifierForPersons_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  PHFacePLAdapter *v9;

  v5 = a3;
  v6 = a2;
  v9 = -[PHObjectPLAdapter initWithPLManagedObject:photoLibrary:]([PHFacePLAdapter alloc], "initWithPLManagedObject:photoLibrary:", v5, *(_QWORD *)(a1 + 32));

  v7 = -[PHFacePLAdapter newObjectWithPropertySets:](v9, "newObjectWithPropertySets:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v7)
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v7, v8);

}

id __49__PHFace_fetchFacesWithVuObservationIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForFacesWithVuObservationIDs:options:](PHQuery, "queryForFacesWithVuObservationIDs:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __49__PHFace_fetchFacesWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForFacesWithLocalIdentifiers:options:](PHQuery, "queryForFacesWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __32__PHFace_fetchFacesWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForFacesWithOptions:](PHQuery, "queryForFacesWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __46__PHFace_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[54];

  v4[53] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("uuid");
  v4[1] = CFSTR("size");
  v4[2] = CFSTR("centerX");
  v4[3] = CFSTR("centerY");
  v4[4] = CFSTR("detectionType");
  v4[5] = CFSTR("bodyCenterX");
  v4[6] = CFSTR("bodyCenterY");
  v4[7] = CFSTR("bodyWidth");
  v4[8] = CFSTR("bodyHeight");
  v4[9] = CFSTR("sourceWidth");
  v4[10] = CFSTR("sourceHeight");
  v4[11] = CFSTR("roll");
  v4[12] = CFSTR("hidden");
  v4[13] = CFSTR("manual");
  v4[14] = CFSTR("isInVIPModel");
  v4[15] = CFSTR("hasSmile");
  v4[16] = CFSTR("blurScore");
  v4[17] = CFSTR("isLeftEyeClosed");
  v4[18] = CFSTR("isRightEyeClosed");
  v4[19] = CFSTR("nameSource");
  v4[20] = CFSTR("adjustmentVersion");
  v4[21] = CFSTR("poseYaw");
  v4[22] = CFSTR("faceAlgorithmVersion");
  v4[23] = CFSTR("clusterSequenceNumber");
  v4[24] = CFSTR("qualityMeasure");
  v4[25] = CFSTR("quality");
  v4[26] = CFSTR("vuObservationID");
  v4[27] = CFSTR("confirmedFaceCropGenerationState");
  v4[28] = CFSTR("trainingType");
  v4[29] = CFSTR("ageType");
  v4[30] = CFSTR("sexType");
  v4[31] = CFSTR("eyesState");
  v4[32] = CFSTR("smileType");
  v4[33] = CFSTR("facialHairType");
  v4[34] = CFSTR("hairColorType");
  v4[35] = CFSTR("glassesType");
  v4[36] = CFSTR("eyeMakeupType");
  v4[37] = CFSTR("lipMakeupType");
  v4[38] = CFSTR("faceExpressionType");
  v4[39] = CFSTR("headgearType");
  v4[40] = CFSTR("hairType");
  v4[41] = CFSTR("poseType");
  v4[42] = CFSTR("skintoneType");
  v4[43] = CFSTR("ethnicityType");
  v4[44] = CFSTR("hasFaceMask");
  v4[45] = CFSTR("gazeType");
  v4[46] = CFSTR("gazeCenterX");
  v4[47] = CFSTR("gazeCenterY");
  v4[48] = CFSTR("gazeAngle");
  v4[49] = CFSTR("gazeConfidence");
  v4[50] = CFSTR("startTime");
  v4[51] = CFSTR("duration");
  v4[52] = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 53);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_28705;
  transformValueExpression_forKeyPath___passThroughSet_28705 = v2;

}

void __22__PHFace_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PHEntityKeyMap *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  const __CFString *v105;
  const __CFString *v106;
  const __CFString *v107;
  const __CFString *v108;
  const __CFString *v109;
  const __CFString *v110;
  const __CFString *v111;
  _QWORD v112[54];
  _QWORD v113[56];

  v113[54] = *MEMORY[0x1E0C80C00];
  v44 = [PHEntityKeyMap alloc];
  v112[0] = CFSTR("uuid");
  v111 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v57;
  v112[1] = CFSTR("size");
  v110 = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v56;
  v112[2] = CFSTR("centerX");
  v109 = CFSTR("centerX");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v55;
  v112[3] = CFSTR("centerY");
  v108 = CFSTR("centerY");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v54;
  v112[4] = CFSTR("detectionType");
  v107 = CFSTR("detectionType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v53;
  v112[5] = CFSTR("bodyCenterX");
  v106 = CFSTR("bodyCenterX");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v52;
  v112[6] = CFSTR("bodyCenterY");
  v105 = CFSTR("bodyCenterY");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v113[6] = v51;
  v112[7] = CFSTR("bodyWidth");
  v104 = CFSTR("bodyWidth");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v113[7] = v50;
  v112[8] = CFSTR("bodyHeight");
  v103 = CFSTR("bodyHeight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v113[8] = v49;
  v112[9] = CFSTR("sourceWidth");
  v102 = CFSTR("sourceWidth");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v113[9] = v48;
  v112[10] = CFSTR("sourceHeight");
  v101 = CFSTR("sourceHeight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v113[10] = v47;
  v112[11] = CFSTR("roll");
  v100 = CFSTR("roll");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v113[11] = v46;
  v112[12] = CFSTR("hidden");
  v99 = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v113[12] = v45;
  v112[13] = CFSTR("manual");
  v98 = CFSTR("manual");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v113[13] = v43;
  v112[14] = CFSTR("vipModelType");
  v97 = CFSTR("isInVIPModel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v113[14] = v42;
  v112[15] = CFSTR("hasSmile");
  v96 = CFSTR("hasSmile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v113[15] = v41;
  v112[16] = CFSTR("blurScore");
  v95 = CFSTR("blurScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v113[16] = v40;
  v112[17] = CFSTR("isLeftEyeClosed");
  v94 = CFSTR("isLeftEyeClosed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v113[17] = v39;
  v112[18] = CFSTR("isRightEyeClosed");
  v93 = CFSTR("isRightEyeClosed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v113[18] = v38;
  v112[19] = CFSTR("nameSource");
  v92 = CFSTR("nameSource");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v113[19] = v37;
  v112[20] = CFSTR("adjustmentVersion");
  v91 = CFSTR("adjustmentVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v113[20] = v36;
  v112[21] = CFSTR("poseYaw");
  v90 = CFSTR("poseYaw");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v113[21] = v35;
  v112[22] = CFSTR("faceAlgorithmVersion");
  v89 = CFSTR("faceAlgorithmVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v113[22] = v34;
  v112[23] = CFSTR("clusterSequenceNumber");
  v88 = CFSTR("clusterSequenceNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v113[23] = v33;
  v112[24] = CFSTR("qualityMeasure");
  v87 = CFSTR("qualityMeasure");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v113[24] = v32;
  v112[25] = CFSTR("quality");
  v86 = CFSTR("quality");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v113[25] = v31;
  v112[26] = CFSTR("vuObservationID");
  v85 = CFSTR("vuObservationID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v113[26] = v30;
  v112[27] = CFSTR("confirmedFaceCropGenerationState");
  v84 = CFSTR("confirmedFaceCropGenerationState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v113[27] = v29;
  v112[28] = CFSTR("trainingType");
  v83 = CFSTR("trainingType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v113[28] = v28;
  v112[29] = CFSTR("ageType");
  v82 = CFSTR("ageType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v113[29] = v27;
  v112[30] = CFSTR("genderType");
  v81 = CFSTR("sexType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v113[30] = v26;
  v112[31] = CFSTR("eyesState");
  v80 = CFSTR("eyesState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v113[31] = v25;
  v112[32] = CFSTR("smileType");
  v79 = CFSTR("smileType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v113[32] = v24;
  v112[33] = CFSTR("facialHairType");
  v78 = CFSTR("facialHairType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v113[33] = v23;
  v112[34] = CFSTR("hairColorType");
  v77 = CFSTR("hairColorType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v113[34] = v22;
  v112[35] = CFSTR("glassesType");
  v76 = CFSTR("glassesType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v113[35] = v21;
  v112[36] = CFSTR("eyeMakeupType");
  v75 = CFSTR("eyeMakeupType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v113[36] = v20;
  v112[37] = CFSTR("lipMakeupType");
  v74 = CFSTR("lipMakeupType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v113[37] = v19;
  v112[38] = CFSTR("faceExpressionType");
  v73 = CFSTR("faceExpressionType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v113[38] = v18;
  v112[39] = CFSTR("headgearType");
  v72 = CFSTR("headgearType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v113[39] = v17;
  v112[40] = CFSTR("hairType");
  v71 = CFSTR("hairType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v113[40] = v16;
  v112[41] = CFSTR("poseType");
  v70 = CFSTR("poseType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v113[41] = v15;
  v112[42] = CFSTR("skintoneType");
  v69 = CFSTR("skintoneType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v113[42] = v14;
  v112[43] = CFSTR("ethnicityType");
  v68 = CFSTR("ethnicityType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v113[43] = v13;
  v112[44] = CFSTR("hasFaceMask");
  v67 = CFSTR("hasFaceMask");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v113[44] = v12;
  v112[45] = CFSTR("gazeType");
  v66 = CFSTR("gazeType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v113[45] = v0;
  v112[46] = CFSTR("gazeCenterX");
  v65 = CFSTR("gazeCenterX");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v113[46] = v1;
  v112[47] = CFSTR("gazeCenterY");
  v64 = CFSTR("gazeCenterY");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v113[47] = v2;
  v112[48] = CFSTR("gazeRectString");
  v63 = CFSTR("gazeRect");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v113[48] = v3;
  v112[49] = CFSTR("gazeAngle");
  v62 = CFSTR("gazeAngle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v113[49] = v4;
  v112[50] = CFSTR("gazeConfidence");
  v61 = CFSTR("gazeConfidence");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v113[50] = v5;
  v112[51] = CFSTR("startTime");
  v60 = CFSTR("startTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v113[51] = v6;
  v112[52] = CFSTR("duration");
  v59 = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v113[52] = v7;
  v112[53] = CFSTR("personForFace.personUUID");
  v58 = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v113[53] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 54);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v44, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_16_28714;
  entityKeyMap_pl_once_object_16_28714 = v10;

}

void __36__PHFace_propertiesToFetchWithHint___block_invoke_160(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_28721;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_composePropertiesToFetchWithHint:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_28721;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v11);

  }
}

void __36__PHFace_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint_28721;
  propertiesToFetchWithHint__propertiesToFetchByHint_28721 = v0;

  v2 = dispatch_queue_create("com.apple.photos.facepropertyhints", 0);
  v3 = (void *)propertiesToFetchWithHint__propertyQueue_28720;
  propertiesToFetchWithHint__propertyQueue_28720 = (uint64_t)v2;

}

void __36__PHFace_analyticsPropertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ageType");
  v3[1] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)analyticsPropertiesToFetch_pl_once_object_15;
  analyticsPropertiesToFetch_pl_once_object_15 = v1;

}

void __36__PHFace_genderAgePropertiesToFetch__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("genderType");
  v2[1] = CFSTR("ageType");
  v2[2] = CFSTR("personForFace.personUUID");
  v2[3] = CFSTR("personForTemporalDetectedFaces.personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)genderAgePropertiesToFetch_array;
  genderAgePropertiesToFetch_array = v0;

}

void __40__PHFace_personBuilderPropertiesToFetch__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("clusterSequenceNumber");
  v2[1] = CFSTR("vuObservationID");
  v2[2] = CFSTR("confirmedFaceCropGenerationState");
  v2[3] = CFSTR("trainingType");
  v2[4] = CFSTR("nameSource");
  v2[5] = CFSTR("personForFace.personUUID");
  v2[6] = CFSTR("personForTemporalDetectedFaces.personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)personBuilderPropertiesToFetch_array;
  personBuilderPropertiesToFetch_array = v0;

}

void __35__PHFace_croppingPropertiesToFetch__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("size");
  v2[1] = CFSTR("centerX");
  v2[2] = CFSTR("centerY");
  v2[3] = CFSTR("sourceWidth");
  v2[4] = CFSTR("sourceHeight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)croppingPropertiesToFetch_array;
  croppingPropertiesToFetch_array = v0;

}

void __31__PHFace_corePropertiesToFetch__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[54];

  v2[53] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("size");
  v2[1] = CFSTR("centerX");
  v2[2] = CFSTR("centerY");
  v2[3] = CFSTR("detectionType");
  v2[4] = CFSTR("bodyCenterX");
  v2[5] = CFSTR("bodyCenterY");
  v2[6] = CFSTR("bodyWidth");
  v2[7] = CFSTR("bodyHeight");
  v2[8] = CFSTR("sourceWidth");
  v2[9] = CFSTR("sourceHeight");
  v2[10] = CFSTR("roll");
  v2[11] = CFSTR("hidden");
  v2[12] = CFSTR("isInTrash");
  v2[13] = CFSTR("vipModelType");
  v2[14] = CFSTR("manual");
  v2[15] = CFSTR("hasSmile");
  v2[16] = CFSTR("blurScore");
  v2[17] = CFSTR("isLeftEyeClosed");
  v2[18] = CFSTR("isRightEyeClosed");
  v2[19] = CFSTR("nameSource");
  v2[20] = CFSTR("adjustmentVersion");
  v2[21] = CFSTR("poseYaw");
  v2[22] = CFSTR("faceAlgorithmVersion");
  v2[23] = CFSTR("clusterSequenceNumber");
  v2[24] = CFSTR("qualityMeasure");
  v2[25] = CFSTR("quality");
  v2[26] = CFSTR("vuObservationID");
  v2[27] = CFSTR("ageType");
  v2[28] = CFSTR("genderType");
  v2[29] = CFSTR("eyesState");
  v2[30] = CFSTR("smileType");
  v2[31] = CFSTR("facialHairType");
  v2[32] = CFSTR("hairColorType");
  v2[33] = CFSTR("glassesType");
  v2[34] = CFSTR("eyeMakeupType");
  v2[35] = CFSTR("lipMakeupType");
  v2[36] = CFSTR("faceExpressionType");
  v2[37] = CFSTR("headgearType");
  v2[38] = CFSTR("hairType");
  v2[39] = CFSTR("poseType");
  v2[40] = CFSTR("skintoneType");
  v2[41] = CFSTR("ethnicityType");
  v2[42] = CFSTR("hasFaceMask");
  v2[43] = CFSTR("gazeType");
  v2[44] = CFSTR("gazeCenterX");
  v2[45] = CFSTR("gazeCenterY");
  v2[46] = CFSTR("gazeRectString");
  v2[47] = CFSTR("gazeAngle");
  v2[48] = CFSTR("gazeConfidence");
  v2[49] = CFSTR("startTime");
  v2[50] = CFSTR("duration");
  v2[51] = CFSTR("personForFace.personUUID");
  v2[52] = CFSTR("personForTemporalDetectedFaces.personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 53);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)corePropertiesToFetch_array_28726;
  corePropertiesToFetch_array_28726 = v0;

}

@end
