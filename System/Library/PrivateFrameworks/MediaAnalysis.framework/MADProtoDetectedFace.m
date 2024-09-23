@implementation MADProtoDetectedFace

+ (id)protoFromPhotosFace:(id)a3
{
  id v3;
  MADProtoDetectedFace *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(MADProtoDetectedFace);
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoDetectedFace setFaceLocalIdentifier:](v4, "setFaceLocalIdentifier:", v5);

  objc_msgSend(v3, "size");
  -[MADProtoDetectedFace setSize:](v4, "setSize:");
  objc_msgSend(v3, "centerX");
  -[MADProtoDetectedFace setCenterX:](v4, "setCenterX:");
  objc_msgSend(v3, "centerY");
  -[MADProtoDetectedFace setCenterY:](v4, "setCenterY:");
  objc_msgSend(v3, "bodyCenterX");
  -[MADProtoDetectedFace setBodyCenterX:](v4, "setBodyCenterX:");
  objc_msgSend(v3, "bodyCenterY");
  -[MADProtoDetectedFace setBodyCenterY:](v4, "setBodyCenterY:");
  objc_msgSend(v3, "bodyWidth");
  -[MADProtoDetectedFace setBodyWidth:](v4, "setBodyWidth:");
  objc_msgSend(v3, "bodyHeight");
  -[MADProtoDetectedFace setBodyHeight:](v4, "setBodyHeight:");
  -[MADProtoDetectedFace setDetectionType:](v4, "setDetectionType:", objc_msgSend(v3, "detectionType"));
  -[MADProtoDetectedFace setClusterSequenceNumber:](v4, "setClusterSequenceNumber:", objc_msgSend(v3, "clusterSequenceNumber"));
  -[MADProtoDetectedFace setQualityMeasure:](v4, "setQualityMeasure:", objc_msgSend(v3, "qualityMeasure"));
  objc_msgSend(v3, "quality");
  -[MADProtoDetectedFace setQuality:](v4, "setQuality:");
  -[MADProtoDetectedFace setSourceWidth:](v4, "setSourceWidth:", objc_msgSend(v3, "sourceWidth"));
  -[MADProtoDetectedFace setSourceHeight:](v4, "setSourceHeight:", objc_msgSend(v3, "sourceHeight"));
  objc_msgSend(v3, "roll");
  -[MADProtoDetectedFace setRoll:](v4, "setRoll:");
  -[MADProtoDetectedFace setHidden:](v4, "setHidden:", objc_msgSend(v3, "isHidden"));
  -[MADProtoDetectedFace setIsInTrash:](v4, "setIsInTrash:", objc_msgSend(v3, "isInTrash"));
  -[MADProtoDetectedFace setManual:](v4, "setManual:", objc_msgSend(v3, "manual"));
  -[MADProtoDetectedFace setHasSmile:](v4, "setHasSmile:", objc_msgSend(v3, "hasSmile"));
  objc_msgSend(v3, "blurScore");
  -[MADProtoDetectedFace setBlurScore:](v4, "setBlurScore:");
  -[MADProtoDetectedFace setIsLeftEyeClosed:](v4, "setIsLeftEyeClosed:", objc_msgSend(v3, "isLeftEyeClosed"));
  -[MADProtoDetectedFace setIsRightEyeClosed:](v4, "setIsRightEyeClosed:", objc_msgSend(v3, "isRightEyeClosed"));
  objc_msgSend(v3, "adjustmentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  -[MADProtoDetectedFace setAdjustmentVersion:](v4, "setAdjustmentVersion:");

  objc_msgSend(v3, "poseYaw");
  -[MADProtoDetectedFace setPoseYaw:](v4, "setPoseYaw:");
  -[MADProtoDetectedFace setFaceAlgorithmVersion:](v4, "setFaceAlgorithmVersion:", objc_msgSend(v3, "faceAlgorithmVersion"));
  -[MADProtoDetectedFace setAgeType:](v4, "setAgeType:", objc_msgSend(v3, "ageType"));
  -[MADProtoDetectedFace setSexType:](v4, "setSexType:", objc_msgSend(v3, "sexType"));
  -[MADProtoDetectedFace setEyesState:](v4, "setEyesState:", objc_msgSend(v3, "eyesState"));
  -[MADProtoDetectedFace setSmileType:](v4, "setSmileType:", objc_msgSend(v3, "smileType"));
  -[MADProtoDetectedFace setFacialHairType:](v4, "setFacialHairType:", objc_msgSend(v3, "facialHairType"));
  -[MADProtoDetectedFace setHairColorType:](v4, "setHairColorType:", objc_msgSend(v3, "hairColorType"));
  -[MADProtoDetectedFace setGlassesType:](v4, "setGlassesType:", objc_msgSend(v3, "glassesType"));
  -[MADProtoDetectedFace setFaceExpressionType:](v4, "setFaceExpressionType:", objc_msgSend(v3, "faceExpressionType"));
  -[MADProtoDetectedFace setHeadgearType:](v4, "setHeadgearType:", objc_msgSend(v3, "headgearType"));
  -[MADProtoDetectedFace setHairType:](v4, "setHairType:", objc_msgSend(v3, "hairType"));
  -[MADProtoDetectedFace setPoseType:](v4, "setPoseType:", objc_msgSend(v3, "poseType"));
  -[MADProtoDetectedFace setSkintoneType:](v4, "setSkintoneType:", objc_msgSend(v3, "skintoneType"));
  -[MADProtoDetectedFace setEthnicityType:](v4, "setEthnicityType:", objc_msgSend(v3, "ethnicityType"));
  -[MADProtoDetectedFace setHasFaceMask:](v4, "setHasFaceMask:", objc_msgSend(v3, "hasFaceMask"));
  -[MADProtoDetectedFace setGazeType:](v4, "setGazeType:", objc_msgSend(v3, "gazeType"));
  objc_msgSend(v3, "gazeCenterX");
  -[MADProtoDetectedFace setGazeCenterX:](v4, "setGazeCenterX:");
  objc_msgSend(v3, "gazeCenterY");
  -[MADProtoDetectedFace setGazeCenterY:](v4, "setGazeCenterY:");
  objc_msgSend(v3, "gazeRect");
  +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoDetectedFace setGazeRect:](v4, "setGazeRect:", v7);

  objc_msgSend(v3, "gazeAngle");
  -[MADProtoDetectedFace setGazeAngle:](v4, "setGazeAngle:");
  objc_msgSend(v3, "gazeConfidence");
  -[MADProtoDetectedFace setGazeConfidence:](v4, "setGazeConfidence:");
  objc_msgSend(v3, "faceClusteringProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "faceprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MADProtoFaceprint protoFromPhotosFaceprint:](MADProtoFaceprint, "protoFromPhotosFaceprint:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoDetectedFace setFaceprint:](v4, "setFaceprint:", v10);

  objc_msgSend(v8, "groupingIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoDetectedFace setGroupingIdentifier:](v4, "setGroupingIdentifier:", v11);

  return v4;
}

- (id)vcpPhotosFace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MADProtoDetectedFace faceLocalIdentifier](self, "faceLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VCPPhotosFace faceWithLocalIdentifier:](VCPPhotosFace, "faceWithLocalIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MADProtoDetectedFace size](self, "size");
  objc_msgSend(v4, "setSize:");
  -[MADProtoDetectedFace centerX](self, "centerX");
  objc_msgSend(v4, "setCenterX:");
  -[MADProtoDetectedFace centerY](self, "centerY");
  objc_msgSend(v4, "setCenterY:");
  -[MADProtoDetectedFace bodyCenterX](self, "bodyCenterX");
  objc_msgSend(v4, "setBodyCenterX:");
  -[MADProtoDetectedFace bodyCenterY](self, "bodyCenterY");
  objc_msgSend(v4, "setBodyCenterY:");
  -[MADProtoDetectedFace bodyWidth](self, "bodyWidth");
  objc_msgSend(v4, "setBodyWidth:");
  -[MADProtoDetectedFace bodyHeight](self, "bodyHeight");
  objc_msgSend(v4, "setBodyHeight:");
  objc_msgSend(v4, "setDetectionType:", (__int16)-[MADProtoDetectedFace detectionType](self, "detectionType"));
  objc_msgSend(v4, "setClusterSequenceNumber:", -[MADProtoDetectedFace clusterSequenceNumber](self, "clusterSequenceNumber"));
  objc_msgSend(v4, "setQualityMeasure:", -[MADProtoDetectedFace qualityMeasure](self, "qualityMeasure"));
  -[MADProtoDetectedFace quality](self, "quality");
  objc_msgSend(v4, "setQuality:");
  objc_msgSend(v4, "setSourceWidth:", -[MADProtoDetectedFace sourceWidth](self, "sourceWidth"));
  objc_msgSend(v4, "setSourceHeight:", -[MADProtoDetectedFace sourceHeight](self, "sourceHeight"));
  -[MADProtoDetectedFace roll](self, "roll");
  objc_msgSend(v4, "setRoll:");
  objc_msgSend(v4, "setHidden:", -[MADProtoDetectedFace hidden](self, "hidden"));
  objc_msgSend(v4, "setIsInTrash:", -[MADProtoDetectedFace isInTrash](self, "isInTrash"));
  objc_msgSend(v4, "setManual:", -[MADProtoDetectedFace manual](self, "manual"));
  objc_msgSend(v4, "setHasSmile:", -[MADProtoDetectedFace hasSmile](self, "hasSmile"));
  -[MADProtoDetectedFace blurScore](self, "blurScore");
  objc_msgSend(v4, "setBlurScore:");
  objc_msgSend(v4, "setIsLeftEyeClosed:", -[MADProtoDetectedFace isLeftEyeClosed](self, "isLeftEyeClosed"));
  objc_msgSend(v4, "setIsRightEyeClosed:", -[MADProtoDetectedFace isRightEyeClosed](self, "isRightEyeClosed"));
  v5 = (void *)MEMORY[0x1E0C99D68];
  -[MADProtoDetectedFace adjustmentVersion](self, "adjustmentVersion");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustmentVersion:", v6);

  -[MADProtoDetectedFace poseYaw](self, "poseYaw");
  objc_msgSend(v4, "setPoseYaw:");
  objc_msgSend(v4, "setAlgorithmVersion:", -[MADProtoDetectedFace faceAlgorithmVersion](self, "faceAlgorithmVersion"));
  objc_msgSend(v4, "setAgeType:", (unsigned __int16)-[MADProtoDetectedFace ageType](self, "ageType"));
  objc_msgSend(v4, "setSexType:", (unsigned __int16)-[MADProtoDetectedFace sexType](self, "sexType"));
  objc_msgSend(v4, "setEyesState:", (unsigned __int16)-[MADProtoDetectedFace eyesState](self, "eyesState"));
  objc_msgSend(v4, "setSmileType:", (unsigned __int16)-[MADProtoDetectedFace smileType](self, "smileType"));
  objc_msgSend(v4, "setFacialHairType:", (unsigned __int16)-[MADProtoDetectedFace facialHairType](self, "facialHairType"));
  objc_msgSend(v4, "setHairColorType:", (unsigned __int16)-[MADProtoDetectedFace hairColorType](self, "hairColorType"));
  objc_msgSend(v4, "setGlassesType:", (unsigned __int16)-[MADProtoDetectedFace glassesType](self, "glassesType"));
  objc_msgSend(v4, "setExpressionType:", (unsigned __int16)-[MADProtoDetectedFace faceExpressionType](self, "faceExpressionType"));
  objc_msgSend(v4, "setHeadgearType:", (unsigned __int16)-[MADProtoDetectedFace headgearType](self, "headgearType"));
  objc_msgSend(v4, "setHairType:", (unsigned __int16)-[MADProtoDetectedFace hairType](self, "hairType"));
  objc_msgSend(v4, "setPoseType:", (unsigned __int16)-[MADProtoDetectedFace poseType](self, "poseType"));
  objc_msgSend(v4, "setSkintoneType:", (unsigned __int16)-[MADProtoDetectedFace skintoneType](self, "skintoneType"));
  objc_msgSend(v4, "setEthnicityType:", (unsigned __int16)-[MADProtoDetectedFace ethnicityType](self, "ethnicityType"));
  objc_msgSend(v4, "setHasFaceMask:", -[MADProtoDetectedFace hasFaceMask](self, "hasFaceMask"));
  objc_msgSend(v4, "setGazeType:", (unsigned __int16)-[MADProtoDetectedFace gazeType](self, "gazeType"));
  -[MADProtoDetectedFace gazeCenterX](self, "gazeCenterX");
  objc_msgSend(v4, "setGazeCenterX:");
  -[MADProtoDetectedFace gazeCenterY](self, "gazeCenterY");
  objc_msgSend(v4, "setGazeCenterY:");
  -[MADProtoDetectedFace gazeRect](self, "gazeRect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rectValue");
  objc_msgSend(v4, "setGazeRect:");

  -[MADProtoDetectedFace gazeAngle](self, "gazeAngle");
  objc_msgSend(v4, "setGazeAngle:");
  -[MADProtoDetectedFace gazeConfidence](self, "gazeConfidence");
  objc_msgSend(v4, "setGazeConfidence:");
  -[MADProtoDetectedFace faceprint](self, "faceprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vcpFaceprintWithDetectionType:", (__int16)-[MADProtoDetectedFace detectionType](self, "detectionType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageprintWrapper:", v9);

  -[MADProtoDetectedFace groupingIdentifier](self, "groupingIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupingIdentifier:", v10);

  return v4;
}

- (BOOL)hasFaceLocalIdentifier
{
  return self->_faceLocalIdentifier != 0;
}

- (void)setSize:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSize
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCenterX:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_centerX = a3;
}

- (void)setHasCenterX:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCenterX
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCenterY:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_centerY = a3;
}

- (void)setHasCenterY:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCenterY
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setBodyCenterX:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_bodyCenterX = a3;
}

- (void)setHasBodyCenterX:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBodyCenterX
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBodyCenterY:(double)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_bodyCenterY = a3;
}

- (void)setHasBodyCenterY:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBodyCenterY
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBodyWidth:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_bodyWidth = a3;
}

- (void)setHasBodyWidth:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBodyWidth
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBodyHeight:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_bodyHeight = a3;
}

- (void)setHasBodyHeight:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasBodyHeight
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDetectionType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_detectionType = a3;
}

- (void)setHasDetectionType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasDetectionType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setClusterSequenceNumber:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_clusterSequenceNumber = a3;
}

- (void)setHasClusterSequenceNumber:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasClusterSequenceNumber
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setQualityMeasure:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_qualityMeasure = a3;
}

- (void)setHasQualityMeasure:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasQualityMeasure
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setQuality:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasQuality
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSourceWidth:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_sourceWidth = a3;
}

- (void)setHasSourceWidth:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSourceWidth
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSourceHeight:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_sourceHeight = a3;
}

- (void)setHasSourceHeight:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSourceHeight
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRoll:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_roll = a3;
}

- (void)setHasRoll:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasRoll
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHidden:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_hidden = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasHidden
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setIsInTrash:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_isInTrash = a3;
}

- (void)setHasIsInTrash:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasIsInTrash
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setManual:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_manual = a3;
}

- (void)setHasManual:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasManual
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setHasSmile:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_hasSmile = a3;
}

- (void)setHasHasSmile:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasHasSmile
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setBlurScore:(double)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_blurScore = a3;
}

- (void)setHasBlurScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasBlurScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsLeftEyeClosed:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_isLeftEyeClosed = a3;
}

- (void)setHasIsLeftEyeClosed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsLeftEyeClosed
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setIsRightEyeClosed:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_isRightEyeClosed = a3;
}

- (void)setHasIsRightEyeClosed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsRightEyeClosed
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setAdjustmentVersion:(double)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_adjustmentVersion = a3;
}

- (void)setHasAdjustmentVersion:(BOOL)a3
{
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAdjustmentVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPoseYaw:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_poseYaw = a3;
}

- (void)setHasPoseYaw:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasPoseYaw
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFaceAlgorithmVersion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_faceAlgorithmVersion = a3;
}

- (void)setHasFaceAlgorithmVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasFaceAlgorithmVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAgeType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_ageType = a3;
}

- (void)setHasAgeType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasAgeType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSexType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_sexType = a3;
}

- (void)setHasSexType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSexType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setEyesState:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_eyesState = a3;
}

- (void)setHasEyesState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasEyesState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSmileType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_smileType = a3;
}

- (void)setHasSmileType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSmileType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setFacialHairType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_facialHairType = a3;
}

- (void)setHasFacialHairType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasFacialHairType
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHairColorType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_hairColorType = a3;
}

- (void)setHasHairColorType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasHairColorType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setGlassesType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_glassesType = a3;
}

- (void)setHasGlassesType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasGlassesType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setFaceExpressionType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_faceExpressionType = a3;
}

- (void)setHasFaceExpressionType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasFaceExpressionType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHeadgearType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_headgearType = a3;
}

- (void)setHasHeadgearType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasHeadgearType
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setHairType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_hairType = a3;
}

- (void)setHasHairType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasHairType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setPoseType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_poseType = a3;
}

- (void)setHasPoseType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasPoseType
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setSkintoneType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_skintoneType = a3;
}

- (void)setHasSkintoneType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSkintoneType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setEthnicityType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_ethnicityType = a3;
}

- (void)setHasEthnicityType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasEthnicityType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasFaceMask:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_hasFaceMask = a3;
}

- (void)setHasHasFaceMask:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasHasFaceMask
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setGazeType:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_gazeType = a3;
}

- (void)setHasGazeType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasGazeType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setGazeCenterX:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_gazeCenterX = a3;
}

- (void)setHasGazeCenterX:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasGazeCenterX
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setGazeCenterY:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_gazeCenterY = a3;
}

- (void)setHasGazeCenterY:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasGazeCenterY
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasGazeRect
{
  return self->_gazeRect != 0;
}

- (void)setGazeAngle:(float)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_gazeAngle = a3;
}

- (void)setHasGazeAngle:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasGazeAngle
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setGazeConfidence:(float)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_gazeConfidence = a3;
}

- (void)setHasGazeConfidence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($328DD4DCDDD95E438D2690214D11354C)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasGazeConfidence
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasFaceprint
{
  return self->_faceprint != 0;
}

- (BOOL)hasGroupingIdentifier
{
  return self->_groupingIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MADProtoDetectedFace;
  -[MADProtoDetectedFace description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADProtoDetectedFace dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *faceLocalIdentifier;
  $328DD4DCDDD95E438D2690214D11354C has;
  void *v8;
  VCPProtoBounds *gazeRect;
  void *v10;
  $328DD4DCDDD95E438D2690214D11354C v11;
  void *v12;
  void *v13;
  MADProtoFaceprint *faceprint;
  void *v15;
  NSString *groupingIdentifier;
  id v17;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  faceLocalIdentifier = self->_faceLocalIdentifier;
  if (faceLocalIdentifier)
    objc_msgSend(v3, "setObject:forKey:", faceLocalIdentifier, CFSTR("faceLocalIdentifier"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_size);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("size"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_58;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_centerX);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("centerX"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_centerY);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("centerY"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bodyCenterX);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("bodyCenterX"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bodyCenterY);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("bodyCenterY"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bodyWidth);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("bodyWidth"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bodyHeight);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("bodyHeight"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_detectionType);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("detectionType"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_clusterSequenceNumber);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("clusterSequenceNumber"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_qualityMeasure);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("qualityMeasure"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_quality);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("quality"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sourceWidth);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("sourceWidth"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sourceHeight);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("sourceHeight"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_18;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_roll);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("roll"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_19;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("hidden"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_20;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInTrash);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("isInTrash"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_manual);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v35, CFSTR("manual"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_22;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasSmile);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("hasSmile"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_blurScore);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v37, CFSTR("blurScore"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLeftEyeClosed);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v38, CFSTR("isLeftEyeClosed"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRightEyeClosed);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v39, CFSTR("isRightEyeClosed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_adjustmentVersion);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v40, CFSTR("adjustmentVersion"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_poseYaw);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v41, CFSTR("poseYaw"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_faceAlgorithmVersion);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v42, CFSTR("faceAlgorithmVersion"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ageType);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v43, CFSTR("ageType"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sexType);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v44, CFSTR("sexType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_eyesState);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v45, CFSTR("eyesState"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_smileType);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v46, CFSTR("smileType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_facialHairType);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v47, CFSTR("facialHairType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hairColorType);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v48, CFSTR("hairColorType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_glassesType);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v49, CFSTR("glassesType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_faceExpressionType);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v50, CFSTR("faceExpressionType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_headgearType);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v51, CFSTR("headgearType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hairType);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v52, CFSTR("hairType"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_poseType);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v53, CFSTR("poseType"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_skintoneType);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v54, CFSTR("skintoneType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ethnicityType);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v55, CFSTR("ethnicityType"));

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasFaceMask);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v56, CFSTR("hasFaceMask"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gazeType);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v57, CFSTR("gazeType"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_gazeCenterX);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v58, CFSTR("gazeCenterX"));

  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_44:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_gazeCenterY);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("gazeCenterY"));

  }
LABEL_45:
  gazeRect = self->_gazeRect;
  if (gazeRect)
  {
    -[VCPProtoBounds dictionaryRepresentation](gazeRect, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("gazeRect"));

  }
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x2000000) != 0)
  {
    *(float *)&v4 = self->_gazeAngle;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("gazeAngle"));

    v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x4000000) != 0)
  {
    *(float *)&v4 = self->_gazeConfidence;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("gazeConfidence"));

  }
  faceprint = self->_faceprint;
  if (faceprint)
  {
    -[MADProtoFaceprint dictionaryRepresentation](faceprint, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("faceprint"));

  }
  groupingIdentifier = self->_groupingIdentifier;
  if (groupingIdentifier)
    objc_msgSend(v5, "setObject:forKey:", groupingIdentifier, CFSTR("groupingIdentifier"));
  v17 = v5;

  return v17;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoDetectedFaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $328DD4DCDDD95E438D2690214D11354C has;
  $328DD4DCDDD95E438D2690214D11354C v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_faceLocalIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_58;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_18;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_19;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_20;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_22;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_95:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_44:
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
LABEL_45:
  if (self->_gazeRect)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v7;
    v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x4000000) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v7;
  }
  if (self->_faceprint)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_groupingIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  char *v4;
  $328DD4DCDDD95E438D2690214D11354C has;
  $328DD4DCDDD95E438D2690214D11354C v6;
  char *v7;

  v4 = (char *)a3;
  v7 = v4;
  if (self->_faceLocalIdentifier)
  {
    objc_msgSend(v4, "setFaceLocalIdentifier:");
    v4 = v7;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *((_QWORD *)v4 + 17) = *(_QWORD *)&self->_size;
    *(_QWORD *)(v4 + 276) |= 0x10000uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_58;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_centerX;
  *(_QWORD *)(v4 + 276) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_7;
    goto LABEL_59;
  }
LABEL_58:
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_centerY;
  *(_QWORD *)(v4 + 276) |= 0x80uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_8;
    goto LABEL_60;
  }
LABEL_59:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_bodyCenterX;
  *(_QWORD *)(v4 + 276) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_61;
  }
LABEL_60:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_bodyCenterY;
  *(_QWORD *)(v4 + 276) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_62;
  }
LABEL_61:
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_bodyWidth;
  *(_QWORD *)(v4 + 276) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_11;
    goto LABEL_63;
  }
LABEL_62:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_bodyHeight;
  *(_QWORD *)(v4 + 276) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 41) = self->_detectionType;
  *(_QWORD *)(v4 + 276) |= 0x100000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_65;
  }
LABEL_64:
  *((_QWORD *)v4 + 9) = self->_clusterSequenceNumber;
  *(_QWORD *)(v4 + 276) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_66;
  }
LABEL_65:
  *((_QWORD *)v4 + 15) = self->_qualityMeasure;
  *(_QWORD *)(v4 + 276) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_67;
  }
LABEL_66:
  *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_quality;
  *(_QWORD *)(v4 + 276) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_68;
  }
LABEL_67:
  *((_QWORD *)v4 + 19) = self->_sourceWidth;
  *(_QWORD *)(v4 + 276) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_69;
  }
LABEL_68:
  *((_QWORD *)v4 + 18) = self->_sourceHeight;
  *(_QWORD *)(v4 + 276) |= 0x20000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_18;
    goto LABEL_70;
  }
LABEL_69:
  *((_QWORD *)v4 + 16) = *(_QWORD *)&self->_roll;
  *(_QWORD *)(v4 + 276) |= 0x8000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_19;
    goto LABEL_71;
  }
LABEL_70:
  v4[270] = self->_hidden;
  *(_QWORD *)(v4 + 276) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_20;
    goto LABEL_72;
  }
LABEL_71:
  v4[271] = self->_isInTrash;
  *(_QWORD *)(v4 + 276) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_72:
  v4[274] = self->_manual;
  *(_QWORD *)(v4 + 276) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_22;
    goto LABEL_74;
  }
LABEL_73:
  v4[269] = self->_hasSmile;
  *(_QWORD *)(v4 + 276) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_23;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_blurScore;
  *(_QWORD *)(v4 + 276) |= 2uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_24;
    goto LABEL_76;
  }
LABEL_75:
  v4[272] = self->_isLeftEyeClosed;
  *(_QWORD *)(v4 + 276) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_25;
    goto LABEL_77;
  }
LABEL_76:
  v4[273] = self->_isRightEyeClosed;
  *(_QWORD *)(v4 + 276) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_78;
  }
LABEL_77:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_adjustmentVersion;
  *(_QWORD *)(v4 + 276) |= 1uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_79;
  }
LABEL_78:
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_poseYaw;
  *(_QWORD *)(v4 + 276) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_80;
  }
LABEL_79:
  *((_QWORD *)v4 + 10) = self->_faceAlgorithmVersion;
  *(_QWORD *)(v4 + 276) |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v4 + 40) = self->_ageType;
  *(_QWORD *)(v4 + 276) |= 0x80000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_30;
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v4 + 64) = self->_sexType;
  *(_QWORD *)(v4 + 276) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_31;
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v4 + 43) = self->_eyesState;
  *(_QWORD *)(v4 + 276) |= 0x400000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)v4 + 66) = self->_smileType;
  *(_QWORD *)(v4 + 276) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v4 + 50) = self->_facialHairType;
  *(_QWORD *)(v4 + 276) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v4 + 60) = self->_hairColorType;
  *(_QWORD *)(v4 + 276) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_35;
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v4 + 57) = self->_glassesType;
  *(_QWORD *)(v4 + 276) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v4 + 44) = self->_faceExpressionType;
  *(_QWORD *)(v4 + 276) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_37;
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v4 + 62) = self->_headgearType;
  *(_QWORD *)(v4 + 276) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_37:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_38;
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v4 + 61) = self->_hairType;
  *(_QWORD *)(v4 + 276) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_39;
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v4 + 63) = self->_poseType;
  *(_QWORD *)(v4 + 276) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_40;
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v4 + 65) = self->_skintoneType;
  *(_QWORD *)(v4 + 276) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_41;
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 42) = self->_ethnicityType;
  *(_QWORD *)(v4 + 276) |= 0x200000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_42;
    goto LABEL_94;
  }
LABEL_93:
  v4[268] = self->_hasFaceMask;
  *(_QWORD *)(v4 + 276) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v4 + 56) = self->_gazeType;
  *(_QWORD *)(v4 + 276) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_95:
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_gazeCenterX;
  *(_QWORD *)(v4 + 276) |= 0x400uLL;
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_44:
    *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_gazeCenterY;
    *(_QWORD *)(v4 + 276) |= 0x800uLL;
  }
LABEL_45:
  if (self->_gazeRect)
  {
    objc_msgSend(v7, "setGazeRect:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    *((_DWORD *)v4 + 51) = LODWORD(self->_gazeAngle);
    *(_QWORD *)(v4 + 276) |= 0x2000000uLL;
    v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x4000000) != 0)
  {
    *((_DWORD *)v4 + 52) = LODWORD(self->_gazeConfidence);
    *(_QWORD *)(v4 + 276) |= 0x4000000uLL;
  }
  if (self->_faceprint)
  {
    objc_msgSend(v7, "setFaceprint:");
    v4 = v7;
  }
  if (self->_groupingIdentifier)
  {
    objc_msgSend(v7, "setGroupingIdentifier:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $328DD4DCDDD95E438D2690214D11354C has;
  id v9;
  void *v10;
  $328DD4DCDDD95E438D2690214D11354C v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_faceLocalIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v6;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(double *)(v5 + 136) = self->_size;
    *(_QWORD *)(v5 + 276) |= 0x10000uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 56) = self->_centerX;
  *(_QWORD *)(v5 + 276) |= 0x40uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_51;
  }
LABEL_50:
  *(double *)(v5 + 64) = self->_centerY;
  *(_QWORD *)(v5 + 276) |= 0x80uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 24) = self->_bodyCenterX;
  *(_QWORD *)(v5 + 276) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 32) = self->_bodyCenterY;
  *(_QWORD *)(v5 + 276) |= 8uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_54;
  }
LABEL_53:
  *(double *)(v5 + 48) = self->_bodyWidth;
  *(_QWORD *)(v5 + 276) |= 0x20uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_9;
    goto LABEL_55;
  }
LABEL_54:
  *(double *)(v5 + 40) = self->_bodyHeight;
  *(_QWORD *)(v5 + 276) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 164) = self->_detectionType;
  *(_QWORD *)(v5 + 276) |= 0x100000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_57;
  }
LABEL_56:
  *(_QWORD *)(v5 + 72) = self->_clusterSequenceNumber;
  *(_QWORD *)(v5 + 276) |= 0x100uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_58;
  }
LABEL_57:
  *(_QWORD *)(v5 + 120) = self->_qualityMeasure;
  *(_QWORD *)(v5 + 276) |= 0x4000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_59;
  }
LABEL_58:
  *(double *)(v5 + 112) = self->_quality;
  *(_QWORD *)(v5 + 276) |= 0x2000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_60;
  }
LABEL_59:
  *(_QWORD *)(v5 + 152) = self->_sourceWidth;
  *(_QWORD *)(v5 + 276) |= 0x40000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_61;
  }
LABEL_60:
  *(_QWORD *)(v5 + 144) = self->_sourceHeight;
  *(_QWORD *)(v5 + 276) |= 0x20000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&has & 0x4000000000) == 0)
      goto LABEL_16;
    goto LABEL_62;
  }
LABEL_61:
  *(double *)(v5 + 128) = self->_roll;
  *(_QWORD *)(v5 + 276) |= 0x8000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x4000000000) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x8000000000) == 0)
      goto LABEL_17;
    goto LABEL_63;
  }
LABEL_62:
  *(_BYTE *)(v5 + 270) = self->_hidden;
  *(_QWORD *)(v5 + 276) |= 0x4000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x8000000000) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_18;
    goto LABEL_64;
  }
LABEL_63:
  *(_BYTE *)(v5 + 271) = self->_isInTrash;
  *(_QWORD *)(v5 + 276) |= 0x8000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x40000000000) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&has & 0x2000000000) == 0)
      goto LABEL_19;
    goto LABEL_65;
  }
LABEL_64:
  *(_BYTE *)(v5 + 274) = self->_manual;
  *(_QWORD *)(v5 + 276) |= 0x40000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_20;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v5 + 269) = self->_hasSmile;
  *(_QWORD *)(v5 + 276) |= 0x2000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&has & 0x10000000000) == 0)
      goto LABEL_21;
    goto LABEL_67;
  }
LABEL_66:
  *(double *)(v5 + 16) = self->_blurScore;
  *(_QWORD *)(v5 + 276) |= 2uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x10000000000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&has & 0x20000000000) == 0)
      goto LABEL_22;
    goto LABEL_68;
  }
LABEL_67:
  *(_BYTE *)(v5 + 272) = self->_isLeftEyeClosed;
  *(_QWORD *)(v5 + 276) |= 0x10000000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_23;
    goto LABEL_69;
  }
LABEL_68:
  *(_BYTE *)(v5 + 273) = self->_isRightEyeClosed;
  *(_QWORD *)(v5 + 276) |= 0x20000000000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_70;
  }
LABEL_69:
  *(double *)(v5 + 8) = self->_adjustmentVersion;
  *(_QWORD *)(v5 + 276) |= 1uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_71;
  }
LABEL_70:
  *(double *)(v5 + 104) = self->_poseYaw;
  *(_QWORD *)(v5 + 276) |= 0x1000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_26;
    goto LABEL_72;
  }
LABEL_71:
  *(_QWORD *)(v5 + 80) = self->_faceAlgorithmVersion;
  *(_QWORD *)(v5 + 276) |= 0x200uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&has & 0x200000000) == 0)
      goto LABEL_27;
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 160) = self->_ageType;
  *(_QWORD *)(v5 + 276) |= 0x80000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_28;
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 256) = self->_sexType;
  *(_QWORD *)(v5 + 276) |= 0x200000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&has & 0x800000000) == 0)
      goto LABEL_29;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 172) = self->_eyesState;
  *(_QWORD *)(v5 + 276) |= 0x400000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_30;
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 264) = self->_smileType;
  *(_QWORD *)(v5 + 276) |= 0x800000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x20000000) == 0)
      goto LABEL_31;
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 200) = self->_facialHairType;
  *(_QWORD *)(v5 + 276) |= 0x1000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_32;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 240) = self->_hairColorType;
  *(_QWORD *)(v5 + 276) |= 0x20000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_33;
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v5 + 228) = self->_glassesType;
  *(_QWORD *)(v5 + 276) |= 0x10000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x80000000) == 0)
      goto LABEL_34;
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 176) = self->_faceExpressionType;
  *(_QWORD *)(v5 + 276) |= 0x800000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x40000000) == 0)
      goto LABEL_35;
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v5 + 248) = self->_headgearType;
  *(_QWORD *)(v5 + 276) |= 0x80000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&has & 0x100000000) == 0)
      goto LABEL_36;
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v5 + 244) = self->_hairType;
  *(_QWORD *)(v5 + 276) |= 0x40000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&has & 0x400000000) == 0)
      goto LABEL_37;
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 252) = self->_poseType;
  *(_QWORD *)(v5 + 276) |= 0x100000000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_38;
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v5 + 260) = self->_skintoneType;
  *(_QWORD *)(v5 + 276) |= 0x400000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_38:
    if ((*(_QWORD *)&has & 0x1000000000) == 0)
      goto LABEL_39;
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v5 + 168) = self->_ethnicityType;
  *(_QWORD *)(v5 + 276) |= 0x200000uLL;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_40;
    goto LABEL_86;
  }
LABEL_85:
  *(_BYTE *)(v5 + 268) = self->_hasFaceMask;
  *(_QWORD *)(v5 + 276) |= 0x1000000000uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v5 + 224) = self->_gazeType;
  *(_QWORD *)(v5 + 276) |= 0x8000000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_87:
  *(double *)(v5 + 88) = self->_gazeCenterX;
  *(_QWORD *)(v5 + 276) |= 0x400uLL;
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_42:
    *(double *)(v5 + 96) = self->_gazeCenterY;
    *(_QWORD *)(v5 + 276) |= 0x800uLL;
  }
LABEL_43:
  v9 = -[VCPProtoBounds copyWithZone:](self->_gazeRect, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v9;

  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x2000000) != 0)
  {
    *(float *)(v5 + 204) = self->_gazeAngle;
    *(_QWORD *)(v5 + 276) |= 0x2000000uLL;
    v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x4000000) != 0)
  {
    *(float *)(v5 + 208) = self->_gazeConfidence;
    *(_QWORD *)(v5 + 276) |= 0x4000000uLL;
  }
  v12 = -[MADProtoFaceprint copyWithZone:](self->_faceprint, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v12;

  v14 = -[NSString copyWithZone:](self->_groupingIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v14;

  v16 = (id)v5;
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *faceLocalIdentifier;
  $328DD4DCDDD95E438D2690214D11354C has;
  uint64_t v7;
  VCPProtoBounds *gazeRect;
  uint64_t v9;
  MADProtoFaceprint *faceprint;
  NSString *groupingIdentifier;
  char v12;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_247;
  faceLocalIdentifier = self->_faceLocalIdentifier;
  if ((unint64_t)faceLocalIdentifier | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](faceLocalIdentifier, "isEqual:"))
      goto LABEL_247;
  }
  has = self->_has;
  v7 = *(_QWORD *)(v4 + 276);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_size != *((double *)v4 + 17))
      goto LABEL_247;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_centerX != *((double *)v4 + 7))
      goto LABEL_247;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_centerY != *((double *)v4 + 8))
      goto LABEL_247;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bodyCenterX != *((double *)v4 + 3))
      goto LABEL_247;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_bodyCenterY != *((double *)v4 + 4))
      goto LABEL_247;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_bodyWidth != *((double *)v4 + 6))
      goto LABEL_247;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_bodyHeight != *((double *)v4 + 5))
      goto LABEL_247;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_detectionType != *((_DWORD *)v4 + 41))
      goto LABEL_247;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_clusterSequenceNumber != *((_QWORD *)v4 + 9))
      goto LABEL_247;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_qualityMeasure != *((_QWORD *)v4 + 15))
      goto LABEL_247;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_quality != *((double *)v4 + 14))
      goto LABEL_247;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_sourceWidth != *((_QWORD *)v4 + 19))
      goto LABEL_247;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_sourceHeight != *((_QWORD *)v4 + 18))
      goto LABEL_247;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_roll != *((double *)v4 + 16))
      goto LABEL_247;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_247;
    if (self->_hidden)
    {
      if (!v4[270])
        goto LABEL_247;
    }
    else if (v4[270])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_247;
    if (self->_isInTrash)
    {
      if (!v4[271])
        goto LABEL_247;
    }
    else if (v4[271])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_247;
    if (self->_manual)
    {
      if (!v4[274])
        goto LABEL_247;
    }
    else if (v4[274])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_247;
    if (self->_hasSmile)
    {
      if (!v4[269])
        goto LABEL_247;
    }
    else if (v4[269])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_blurScore != *((double *)v4 + 2))
      goto LABEL_247;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_247;
    if (self->_isLeftEyeClosed)
    {
      if (!v4[272])
        goto LABEL_247;
    }
    else if (v4[272])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0)
      goto LABEL_247;
    if (self->_isRightEyeClosed)
    {
      if (!v4[273])
        goto LABEL_247;
    }
    else if (v4[273])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_adjustmentVersion != *((double *)v4 + 1))
      goto LABEL_247;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_poseYaw != *((double *)v4 + 13))
      goto LABEL_247;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_faceAlgorithmVersion != *((_QWORD *)v4 + 10))
      goto LABEL_247;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_ageType != *((_DWORD *)v4 + 40))
      goto LABEL_247;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_sexType != *((_DWORD *)v4 + 64))
      goto LABEL_247;
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_eyesState != *((_DWORD *)v4 + 43))
      goto LABEL_247;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_smileType != *((_DWORD *)v4 + 66))
      goto LABEL_247;
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_facialHairType != *((_DWORD *)v4 + 50))
      goto LABEL_247;
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_hairColorType != *((_DWORD *)v4 + 60))
      goto LABEL_247;
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_glassesType != *((_DWORD *)v4 + 57))
      goto LABEL_247;
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_faceExpressionType != *((_DWORD *)v4 + 44))
      goto LABEL_247;
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_headgearType != *((_DWORD *)v4 + 62))
      goto LABEL_247;
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_hairType != *((_DWORD *)v4 + 61))
      goto LABEL_247;
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_poseType != *((_DWORD *)v4 + 63))
      goto LABEL_247;
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_skintoneType != *((_DWORD *)v4 + 65))
      goto LABEL_247;
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_ethnicityType != *((_DWORD *)v4 + 42))
      goto LABEL_247;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_247;
    if (self->_hasFaceMask)
    {
      if (!v4[268])
        goto LABEL_247;
    }
    else if (v4[268])
    {
      goto LABEL_247;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_gazeType != *((_DWORD *)v4 + 56))
      goto LABEL_247;
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_gazeCenterX != *((double *)v4 + 11))
      goto LABEL_247;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_gazeCenterY != *((double *)v4 + 12))
      goto LABEL_247;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_247;
  }
  gazeRect = self->_gazeRect;
  if ((unint64_t)gazeRect | *((_QWORD *)v4 + 27))
  {
    if (-[VCPProtoBounds isEqual:](gazeRect, "isEqual:"))
    {
      has = self->_has;
      goto LABEL_233;
    }
LABEL_247:
    v12 = 0;
    goto LABEL_248;
  }
LABEL_233:
  v9 = *(_QWORD *)(v4 + 276);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v9 & 0x2000000) == 0 || self->_gazeAngle != *((float *)v4 + 51))
      goto LABEL_247;
  }
  else if ((v9 & 0x2000000) != 0)
  {
    goto LABEL_247;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v9 & 0x4000000) == 0 || self->_gazeConfidence != *((float *)v4 + 52))
      goto LABEL_247;
  }
  else if ((v9 & 0x4000000) != 0)
  {
    goto LABEL_247;
  }
  faceprint = self->_faceprint;
  if ((unint64_t)faceprint | *((_QWORD *)v4 + 24) && !-[MADProtoFaceprint isEqual:](faceprint, "isEqual:"))
    goto LABEL_247;
  groupingIdentifier = self->_groupingIdentifier;
  if ((unint64_t)groupingIdentifier | *((_QWORD *)v4 + 29))
    v12 = -[NSString isEqual:](groupingIdentifier, "isEqual:");
  else
    v12 = 1;
LABEL_248:

  return v12;
}

- (unint64_t)hash
{
  $328DD4DCDDD95E438D2690214D11354C has;
  unint64_t v4;
  double size;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double centerX;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double centerY;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double bodyCenterX;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double bodyCenterY;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double bodyWidth;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double bodyHeight;
  double v36;
  long double v37;
  double v38;
  double quality;
  double v40;
  long double v41;
  double v42;
  unint64_t v43;
  double roll;
  double v45;
  long double v46;
  double v47;
  unint64_t v48;
  double blurScore;
  double v50;
  long double v51;
  double v52;
  unint64_t v53;
  double adjustmentVersion;
  double v55;
  long double v56;
  double v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  double poseYaw;
  double v62;
  long double v63;
  double v64;
  unint64_t v65;
  unint64_t v66;
  double gazeCenterX;
  double v68;
  long double v69;
  double v70;
  unint64_t v71;
  unint64_t v72;
  double gazeCenterY;
  double v74;
  long double v75;
  double v76;
  unint64_t v77;
  unint64_t v78;
  $328DD4DCDDD95E438D2690214D11354C v79;
  unint64_t v80;
  float gazeAngle;
  float v82;
  float v83;
  float v84;
  unint64_t v85;
  float gazeConfidence;
  float v87;
  float v88;
  float v89;
  unint64_t v90;
  NSUInteger v91;
  unint64_t v92;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  NSUInteger v130;
  unint64_t v131;

  v130 = -[NSString hash](self->_faceLocalIdentifier, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    size = self->_size;
    v6 = -size;
    if (size >= 0.0)
      v6 = self->_size;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    centerX = self->_centerX;
    v11 = -centerX;
    if (centerX >= 0.0)
      v11 = self->_centerX;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    centerY = self->_centerY;
    v16 = -centerY;
    if (centerY >= 0.0)
      v16 = self->_centerY;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    bodyCenterX = self->_bodyCenterX;
    v21 = -bodyCenterX;
    if (bodyCenterX >= 0.0)
      v21 = self->_bodyCenterX;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    bodyCenterY = self->_bodyCenterY;
    v26 = -bodyCenterY;
    if (bodyCenterY >= 0.0)
      v26 = self->_bodyCenterY;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    bodyWidth = self->_bodyWidth;
    v31 = -bodyWidth;
    if (bodyWidth >= 0.0)
      v31 = self->_bodyWidth;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    bodyHeight = self->_bodyHeight;
    v36 = -bodyHeight;
    if (bodyHeight >= 0.0)
      v36 = self->_bodyHeight;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v126 = v34;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v125 = 2654435761 * self->_detectionType;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_59:
      v124 = 2654435761 * self->_clusterSequenceNumber;
      if ((*(_WORD *)&has & 0x4000) != 0)
        goto LABEL_60;
LABEL_67:
      v123 = 0;
      if ((*(_WORD *)&has & 0x2000) != 0)
        goto LABEL_61;
LABEL_68:
      v43 = 0;
      goto LABEL_71;
    }
  }
  else
  {
    v125 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_59;
  }
  v124 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0)
    goto LABEL_67;
LABEL_60:
  v123 = 2654435761 * self->_qualityMeasure;
  if ((*(_WORD *)&has & 0x2000) == 0)
    goto LABEL_68;
LABEL_61:
  quality = self->_quality;
  v40 = -quality;
  if (quality >= 0.0)
    v40 = self->_quality;
  v41 = floor(v40 + 0.5);
  v42 = (v40 - v41) * 1.84467441e19;
  v43 = 2654435761u * (unint64_t)fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    if (v42 > 0.0)
      v43 += (unint64_t)v42;
  }
  else
  {
    v43 -= (unint64_t)fabs(v42);
  }
LABEL_71:
  v122 = v43;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
    v121 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_73;
LABEL_79:
    v120 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_74;
LABEL_80:
    v48 = 0;
    goto LABEL_83;
  }
  v121 = 2654435761 * self->_sourceWidth;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_79;
LABEL_73:
  v120 = 2654435761 * self->_sourceHeight;
  if ((*(_WORD *)&has & 0x8000) == 0)
    goto LABEL_80;
LABEL_74:
  roll = self->_roll;
  v45 = -roll;
  if (roll >= 0.0)
    v45 = self->_roll;
  v46 = floor(v45 + 0.5);
  v47 = (v45 - v46) * 1.84467441e19;
  v48 = 2654435761u * (unint64_t)fmod(v46, 1.84467441e19);
  if (v47 >= 0.0)
  {
    if (v47 > 0.0)
      v48 += (unint64_t)v47;
  }
  else
  {
    v48 -= (unint64_t)fabs(v47);
  }
LABEL_83:
  v119 = v48;
  if ((*(_QWORD *)&has & 0x4000000000) != 0)
  {
    v118 = 2654435761 * self->_hidden;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
    {
LABEL_85:
      v117 = 2654435761 * self->_isInTrash;
      if ((*(_QWORD *)&has & 0x40000000000) != 0)
        goto LABEL_86;
      goto LABEL_94;
    }
  }
  else
  {
    v118 = 0;
    if ((*(_QWORD *)&has & 0x8000000000) != 0)
      goto LABEL_85;
  }
  v117 = 0;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
LABEL_86:
    v116 = 2654435761 * self->_manual;
    if ((*(_QWORD *)&has & 0x2000000000) != 0)
      goto LABEL_87;
LABEL_95:
    v115 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_88;
LABEL_96:
    v53 = 0;
    goto LABEL_99;
  }
LABEL_94:
  v116 = 0;
  if ((*(_QWORD *)&has & 0x2000000000) == 0)
    goto LABEL_95;
LABEL_87:
  v115 = 2654435761 * self->_hasSmile;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_96;
LABEL_88:
  blurScore = self->_blurScore;
  v50 = -blurScore;
  if (blurScore >= 0.0)
    v50 = self->_blurScore;
  v51 = floor(v50 + 0.5);
  v52 = (v50 - v51) * 1.84467441e19;
  v53 = 2654435761u * (unint64_t)fmod(v51, 1.84467441e19);
  if (v52 >= 0.0)
  {
    if (v52 > 0.0)
      v53 += (unint64_t)v52;
  }
  else
  {
    v53 -= (unint64_t)fabs(v52);
  }
LABEL_99:
  v114 = v53;
  if ((*(_QWORD *)&has & 0x10000000000) != 0)
  {
    v113 = 2654435761 * self->_isLeftEyeClosed;
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
    {
LABEL_101:
      v112 = 2654435761 * self->_isRightEyeClosed;
      if ((*(_BYTE *)&has & 1) != 0)
        goto LABEL_102;
LABEL_108:
      v131 = 0;
      goto LABEL_112;
    }
  }
  else
  {
    v113 = 0;
    if ((*(_QWORD *)&has & 0x20000000000) != 0)
      goto LABEL_101;
  }
  v112 = 0;
  if ((*(_BYTE *)&has & 1) == 0)
    goto LABEL_108;
LABEL_102:
  adjustmentVersion = self->_adjustmentVersion;
  v55 = -adjustmentVersion;
  if (adjustmentVersion >= 0.0)
    v55 = self->_adjustmentVersion;
  v56 = floor(v55 + 0.5);
  v57 = (v55 - v56) * 1.84467441e19;
  v58 = 2654435761u * (unint64_t)fmod(v56, 1.84467441e19);
  if (v57 >= 0.0)
  {
    v131 = v58;
    if (v57 <= 0.0)
      goto LABEL_112;
    v59 = v58 + (unint64_t)v57;
  }
  else
  {
    v59 = v58 - (unint64_t)fabs(v57);
  }
  v131 = v59;
LABEL_112:
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    poseYaw = self->_poseYaw;
    v62 = -poseYaw;
    if (poseYaw >= 0.0)
      v62 = self->_poseYaw;
    v63 = floor(v62 + 0.5);
    v64 = (v62 - v63) * 1.84467441e19;
    v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0)
        v60 += (unint64_t)v64;
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    v60 = 0;
  }
  v111 = v60;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    v110 = 2654435761 * self->_faceAlgorithmVersion;
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
LABEL_122:
      v109 = 2654435761 * self->_ageType;
      if ((*(_QWORD *)&has & 0x200000000) != 0)
        goto LABEL_123;
      goto LABEL_137;
    }
  }
  else
  {
    v110 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_122;
  }
  v109 = 0;
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
LABEL_123:
    v108 = 2654435761 * self->_sexType;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_124;
    goto LABEL_138;
  }
LABEL_137:
  v108 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_124:
    v107 = 2654435761 * self->_eyesState;
    if ((*(_QWORD *)&has & 0x800000000) != 0)
      goto LABEL_125;
    goto LABEL_139;
  }
LABEL_138:
  v107 = 0;
  if ((*(_QWORD *)&has & 0x800000000) != 0)
  {
LABEL_125:
    v106 = 2654435761 * self->_smileType;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_126;
    goto LABEL_140;
  }
LABEL_139:
  v106 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_126:
    v105 = 2654435761 * self->_facialHairType;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_127;
    goto LABEL_141;
  }
LABEL_140:
  v105 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_127:
    v104 = 2654435761 * self->_hairColorType;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_128;
    goto LABEL_142;
  }
LABEL_141:
  v104 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_128:
    v103 = 2654435761 * self->_glassesType;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_129;
    goto LABEL_143;
  }
LABEL_142:
  v103 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_129:
    v102 = 2654435761 * self->_faceExpressionType;
    if ((*(_DWORD *)&has & 0x80000000) != 0)
      goto LABEL_130;
    goto LABEL_144;
  }
LABEL_143:
  v102 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_130:
    v101 = 2654435761 * self->_headgearType;
    if ((*(_DWORD *)&has & 0x40000000) != 0)
      goto LABEL_131;
    goto LABEL_145;
  }
LABEL_144:
  v101 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_131:
    v100 = 2654435761 * self->_hairType;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_132;
    goto LABEL_146;
  }
LABEL_145:
  v100 = 0;
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
LABEL_132:
    v99 = 2654435761 * self->_poseType;
    if ((*(_QWORD *)&has & 0x400000000) != 0)
      goto LABEL_133;
LABEL_147:
    v98 = 0;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_134;
    goto LABEL_148;
  }
LABEL_146:
  v99 = 0;
  if ((*(_QWORD *)&has & 0x400000000) == 0)
    goto LABEL_147;
LABEL_133:
  v98 = 2654435761 * self->_skintoneType;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_134:
    v97 = 2654435761 * self->_ethnicityType;
    goto LABEL_149;
  }
LABEL_148:
  v97 = 0;
LABEL_149:
  v129 = v9;
  if ((*(_QWORD *)&has & 0x1000000000) != 0)
  {
    v96 = 2654435761 * self->_hasFaceMask;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_151;
  }
  else
  {
    v96 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_151:
      v94 = 2654435761 * self->_gazeType;
      goto LABEL_154;
    }
  }
  v94 = 0;
LABEL_154:
  v127 = v29;
  v128 = v4;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    gazeCenterX = self->_gazeCenterX;
    v68 = -gazeCenterX;
    if (gazeCenterX >= 0.0)
      v68 = self->_gazeCenterX;
    v69 = floor(v68 + 0.5);
    v70 = (v68 - v69) * 1.84467441e19;
    v66 = 2654435761u * (unint64_t)fmod(v69, 1.84467441e19);
    v65 = v19;
    if (v70 >= 0.0)
    {
      if (v70 > 0.0)
        v66 += (unint64_t)v70;
    }
    else
    {
      v66 -= (unint64_t)fabs(v70);
    }
  }
  else
  {
    v65 = v19;
    v66 = 0;
  }
  v71 = v14;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    gazeCenterY = self->_gazeCenterY;
    v74 = -gazeCenterY;
    if (gazeCenterY >= 0.0)
      v74 = self->_gazeCenterY;
    v75 = floor(v74 + 0.5);
    v76 = (v74 - v75) * 1.84467441e19;
    v72 = 2654435761u * (unint64_t)fmod(v75, 1.84467441e19);
    if (v76 >= 0.0)
    {
      if (v76 > 0.0)
        v72 += (unint64_t)v76;
    }
    else
    {
      v72 -= (unint64_t)fabs(v76);
    }
  }
  else
  {
    v72 = 0;
  }
  v77 = v24;
  v78 = -[VCPProtoBounds hash](self->_gazeRect, "hash", v94);
  v79 = self->_has;
  if ((*(_DWORD *)&v79 & 0x2000000) != 0)
  {
    gazeAngle = self->_gazeAngle;
    v82 = -gazeAngle;
    if (gazeAngle >= 0.0)
      v82 = self->_gazeAngle;
    v83 = floorf(v82 + 0.5);
    v84 = (float)(v82 - v83) * 1.8447e19;
    v80 = 2654435761u * (unint64_t)fmodf(v83, 1.8447e19);
    if (v84 >= 0.0)
    {
      if (v84 > 0.0)
        v80 += (unint64_t)v84;
    }
    else
    {
      v80 -= (unint64_t)fabsf(v84);
    }
  }
  else
  {
    v80 = 0;
  }
  if ((*(_DWORD *)&v79 & 0x4000000) == 0)
  {
    v85 = 0;
LABEL_184:
    v90 = v131;
    goto LABEL_185;
  }
  gazeConfidence = self->_gazeConfidence;
  v87 = -gazeConfidence;
  if (gazeConfidence >= 0.0)
    v87 = self->_gazeConfidence;
  v88 = floorf(v87 + 0.5);
  v89 = (float)(v87 - v88) * 1.8447e19;
  v85 = 2654435761u * (unint64_t)fmodf(v88, 1.8447e19);
  if (v89 < 0.0)
  {
    v85 -= (unint64_t)fabsf(v89);
    goto LABEL_184;
  }
  v90 = v131;
  if (v89 > 0.0)
    v85 += (unint64_t)v89;
LABEL_185:
  v91 = v128 ^ v130 ^ v129 ^ v71 ^ v65 ^ v77 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v90 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v66 ^ v72 ^ v78 ^ v80;
  v92 = v85 ^ -[MADProtoFaceprint hash](self->_faceprint, "hash");
  return v91 ^ v92 ^ -[NSString hash](self->_groupingIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  VCPProtoBounds *gazeRect;
  uint64_t v7;
  uint64_t v8;
  MADProtoFaceprint *faceprint;
  uint64_t v10;
  char *v11;

  v4 = (char *)a3;
  v11 = v4;
  if (*((_QWORD *)v4 + 23))
  {
    -[MADProtoDetectedFace setFaceLocalIdentifier:](self, "setFaceLocalIdentifier:");
    v4 = v11;
  }
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x10000) != 0)
  {
    self->_size = *((double *)v4 + 17);
    *(_QWORD *)&self->_has |= 0x10000uLL;
    v5 = *(_QWORD *)(v4 + 276);
    if ((v5 & 0x40) == 0)
    {
LABEL_5:
      if ((v5 & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_50;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_5;
  }
  self->_centerX = *((double *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_51;
  }
LABEL_50:
  self->_centerY = *((double *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_52;
  }
LABEL_51:
  self->_bodyCenterX = *((double *)v4 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_53;
  }
LABEL_52:
  self->_bodyCenterY = *((double *)v4 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_54;
  }
LABEL_53:
  self->_bodyWidth = *((double *)v4 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x100000) == 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_54:
  self->_bodyHeight = *((double *)v4 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x100000) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  self->_detectionType = *((_DWORD *)v4 + 41);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  self->_clusterSequenceNumber = *((_QWORD *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  self->_qualityMeasure = *((_QWORD *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_59;
  }
LABEL_58:
  self->_quality = *((double *)v4 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000) == 0)
      goto LABEL_16;
    goto LABEL_60;
  }
LABEL_59:
  self->_sourceWidth = *((_QWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_61;
  }
LABEL_60:
  self->_sourceHeight = *((_QWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_61:
  self->_roll = *((double *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_19;
    goto LABEL_63;
  }
LABEL_62:
  self->_hidden = v4[270];
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_20;
    goto LABEL_64;
  }
LABEL_63:
  self->_isInTrash = v4[271];
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x2000000000) == 0)
      goto LABEL_21;
    goto LABEL_65;
  }
LABEL_64:
  self->_manual = v4[274];
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_21:
    if ((v5 & 2) == 0)
      goto LABEL_22;
    goto LABEL_66;
  }
LABEL_65:
  self->_hasSmile = v4[269];
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 2) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_23;
    goto LABEL_67;
  }
LABEL_66:
  self->_blurScore = *((double *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x20000000000) == 0)
      goto LABEL_24;
    goto LABEL_68;
  }
LABEL_67:
  self->_isLeftEyeClosed = v4[272];
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_24:
    if ((v5 & 1) == 0)
      goto LABEL_25;
    goto LABEL_69;
  }
LABEL_68:
  self->_isRightEyeClosed = v4[273];
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 1) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_70;
  }
LABEL_69:
  self->_adjustmentVersion = *((double *)v4 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x1000) == 0)
  {
LABEL_26:
    if ((v5 & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_71;
  }
LABEL_70:
  self->_poseYaw = *((double *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x200) == 0)
  {
LABEL_27:
    if ((v5 & 0x80000) == 0)
      goto LABEL_28;
    goto LABEL_72;
  }
LABEL_71:
  self->_faceAlgorithmVersion = *((_QWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x80000) == 0)
  {
LABEL_28:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_29;
    goto LABEL_73;
  }
LABEL_72:
  self->_ageType = *((_DWORD *)v4 + 40);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x400000) == 0)
      goto LABEL_30;
    goto LABEL_74;
  }
LABEL_73:
  self->_sexType = *((_DWORD *)v4 + 64);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x400000) == 0)
  {
LABEL_30:
    if ((v5 & 0x800000000) == 0)
      goto LABEL_31;
    goto LABEL_75;
  }
LABEL_74:
  self->_eyesState = *((_DWORD *)v4 + 43);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_76;
  }
LABEL_75:
  self->_smileType = *((_DWORD *)v4 + 66);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_33;
    goto LABEL_77;
  }
LABEL_76:
  self->_facialHairType = *((_DWORD *)v4 + 50);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_34;
    goto LABEL_78;
  }
LABEL_77:
  self->_hairColorType = *((_DWORD *)v4 + 60);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x800000) == 0)
      goto LABEL_35;
    goto LABEL_79;
  }
LABEL_78:
  self->_glassesType = *((_DWORD *)v4 + 57);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x800000) == 0)
  {
LABEL_35:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_80;
  }
LABEL_79:
  self->_faceExpressionType = *((_DWORD *)v4 + 44);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_37;
    goto LABEL_81;
  }
LABEL_80:
  self->_headgearType = *((_DWORD *)v4 + 62);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_38;
    goto LABEL_82;
  }
LABEL_81:
  self->_hairType = *((_DWORD *)v4 + 61);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_39;
    goto LABEL_83;
  }
LABEL_82:
  self->_poseType = *((_DWORD *)v4 + 63);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x200000) == 0)
      goto LABEL_40;
    goto LABEL_84;
  }
LABEL_83:
  self->_skintoneType = *((_DWORD *)v4 + 65);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x200000) == 0)
  {
LABEL_40:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_41;
    goto LABEL_85;
  }
LABEL_84:
  self->_ethnicityType = *((_DWORD *)v4 + 42);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_42;
    goto LABEL_86;
  }
LABEL_85:
  self->_hasFaceMask = v4[268];
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x400) == 0)
      goto LABEL_43;
    goto LABEL_87;
  }
LABEL_86:
  self->_gazeType = *((_DWORD *)v4 + 56);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v5 = *(_QWORD *)(v4 + 276);
  if ((v5 & 0x400) == 0)
  {
LABEL_43:
    if ((v5 & 0x800) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_87:
  self->_gazeCenterX = *((double *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  if ((*(_QWORD *)(v4 + 276) & 0x800) != 0)
  {
LABEL_44:
    self->_gazeCenterY = *((double *)v4 + 12);
    *(_QWORD *)&self->_has |= 0x800uLL;
  }
LABEL_45:
  gazeRect = self->_gazeRect;
  v7 = *((_QWORD *)v4 + 27);
  if (gazeRect)
  {
    if (!v7)
      goto LABEL_92;
    -[VCPProtoBounds mergeFrom:](gazeRect, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_92;
    -[MADProtoDetectedFace setGazeRect:](self, "setGazeRect:");
  }
  v4 = v11;
LABEL_92:
  v8 = *(_QWORD *)(v4 + 276);
  if ((v8 & 0x2000000) != 0)
  {
    self->_gazeAngle = *((float *)v4 + 51);
    *(_QWORD *)&self->_has |= 0x2000000uLL;
    v8 = *(_QWORD *)(v4 + 276);
  }
  if ((v8 & 0x4000000) != 0)
  {
    self->_gazeConfidence = *((float *)v4 + 52);
    *(_QWORD *)&self->_has |= 0x4000000uLL;
  }
  faceprint = self->_faceprint;
  v10 = *((_QWORD *)v4 + 24);
  if (faceprint)
  {
    if (!v10)
      goto LABEL_102;
    -[MADProtoFaceprint mergeFrom:](faceprint, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_102;
    -[MADProtoDetectedFace setFaceprint:](self, "setFaceprint:");
  }
  v4 = v11;
LABEL_102:
  if (*((_QWORD *)v4 + 29))
  {
    -[MADProtoDetectedFace setGroupingIdentifier:](self, "setGroupingIdentifier:");
    v4 = v11;
  }

}

- (NSString)faceLocalIdentifier
{
  return self->_faceLocalIdentifier;
}

- (void)setFaceLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_faceLocalIdentifier, a3);
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

- (int)detectionType
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

- (BOOL)hidden
{
  return self->_hidden;
}

- (BOOL)isInTrash
{
  return self->_isInTrash;
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
  return self->_isLeftEyeClosed;
}

- (BOOL)isRightEyeClosed
{
  return self->_isRightEyeClosed;
}

- (double)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (double)poseYaw
{
  return self->_poseYaw;
}

- (int64_t)faceAlgorithmVersion
{
  return self->_faceAlgorithmVersion;
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

- (VCPProtoBounds)gazeRect
{
  return self->_gazeRect;
}

- (void)setGazeRect:(id)a3
{
  objc_storeStrong((id *)&self->_gazeRect, a3);
}

- (float)gazeAngle
{
  return self->_gazeAngle;
}

- (float)gazeConfidence
{
  return self->_gazeConfidence;
}

- (MADProtoFaceprint)faceprint
{
  return self->_faceprint;
}

- (void)setFaceprint:(id)a3
{
  objc_storeStrong((id *)&self->_faceprint, a3);
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setGroupingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupingIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_gazeRect, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_faceLocalIdentifier, 0);
}

@end
