@implementation FaceCoreFace

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FaceCoreFace;
  -[FaceCoreFace dealloc](&v2, sel_dealloc);
}

- (BOOL)hasLeftEyeBounds
{
  return 0;
}

- (BOOL)hasRightEyeBounds
{
  return 0;
}

- (BOOL)hasMouthBounds
{
  return 0;
}

- (NSDictionary)expressionFeatures
{
  return (NSDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setExpressionFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (double)faceAngle
{
  return self->faceAngle;
}

- (void)setFaceAngle:(double)a3
{
  self->faceAngle = a3;
}

- ($F1AE9FCED44F4662CE5879818CE4B69F)face
{
  $F1AE9FCED44F4662CE5879818CE4B69F *result;

  objc_copyStruct(retstr, &self->face, 48, 1, 0);
  return result;
}

- (void)setFace:(id *)a3
{
  objc_copyStruct(&self->face, a3, 48, 1, 0);
}

- (NSDictionary)faceLandmarkPoints
{
  return (NSDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setFaceLandmarkPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (double)faceSize
{
  return self->faceSize;
}

- (void)setFaceSize:(double)a3
{
  self->faceSize = a3;
}

- (int)faceType
{
  return self->faceType;
}

- (void)setFaceType:(int)a3
{
  self->faceType = a3;
}

- (NSData)faceprint
{
  return (NSData *)objc_getProperty(self, a2, 232, 1);
}

- (void)setFaceprint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- ($F1AE9FCED44F4662CE5879818CE4B69F)leftEye
{
  $F1AE9FCED44F4662CE5879818CE4B69F *result;

  objc_copyStruct(retstr, &self->leftEye, 48, 1, 0);
  return result;
}

- (void)setLeftEye:(id *)a3
{
  objc_copyStruct(&self->leftEye, a3, 48, 1, 0);
}

- ($F1AE9FCED44F4662CE5879818CE4B69F)mouth
{
  $F1AE9FCED44F4662CE5879818CE4B69F *result;

  objc_copyStruct(retstr, &self->mouth, 48, 1, 0);
  return result;
}

- (void)setMouth:(id *)a3
{
  objc_copyStruct(&self->mouth, a3, 48, 1, 0);
}

- ($F1AE9FCED44F4662CE5879818CE4B69F)rightEye
{
  $F1AE9FCED44F4662CE5879818CE4B69F *result;

  objc_copyStruct(retstr, &self->rightEye, 48, 1, 0);
  return result;
}

- (void)setRightEye:(id *)a3
{
  objc_copyStruct(&self->rightEye, a3, 48, 1, 0);
}

- (unint64_t)trackDuration
{
  return self->trackDuration;
}

- (void)setTrackDuration:(unint64_t)a3
{
  self->trackDuration = a3;
}

- (int64_t)trackID
{
  return self->trackID;
}

- (void)setTrackID:(int64_t)a3
{
  self->trackID = a3;
}

- (NSDictionary)additionalInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAdditionalInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->additionalInfo, 0);
  objc_storeStrong((id *)&self->expressionFeatures, 0);
  objc_storeStrong((id *)&self->faceLandmarkPoints, 0);
  objc_storeStrong((id *)&self->faceprint, 0);
}

@end
