@implementation CRXFAppClipCodeBuilder

- (CRXFAppClipCodeBuilder)init
{
  CRXFAppClipCodeBuilder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRXFAppClipCodeBuilder;
  result = -[CRXFAppClipCodeBuilder init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_version = xmmword_239FD8E70;
  return result;
}

- (CRXFAppClipCodeBuilder)initWithAppClipCode:(id)a3
{
  id v4;
  CRXFAppClipCodeBuilder *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  uint64_t v17;
  NSData *secret;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRXFAppClipCodeBuilder;
  v5 = -[CRXFAppClipCodeBuilder init](&v20, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "version");
    v5->_lensType = objc_msgSend(v4, "lensType");
    v5->_cylLeftSignFlipped = objc_msgSend(v4, "cylLeftSignFlipped");
    v5->_cylRightSignFlipped = objc_msgSend(v4, "cylRightSignFlipped");
    v5->_leftRXID = objc_msgSend(v4, "leftRXID");
    v5->_leftCalibrationRXID = objc_msgSend(v4, "leftCalibrationRXID");
    objc_msgSend(v4, "leftDisplaySphere");
    v5->_leftDisplaySphere = v6;
    objc_msgSend(v4, "leftDisplayCylinder");
    v5->_leftDisplayCylinder = v7;
    objc_msgSend(v4, "leftCalibrationSphere");
    v5->_leftCalibrationSphere = v8;
    objc_msgSend(v4, "leftCalibrationCylinder");
    v5->_leftCalibrationCylinder = v9;
    objc_msgSend(v4, "leftAddVR");
    v5->_leftAddVR = v10;
    v5->_leftAxisID = objc_msgSend(v4, "leftAxisID");
    v5->_leftCalibrationAxis = objc_msgSend(v4, "leftCalibrationAxis");
    v5->_leftClamping = objc_msgSend(v4, "leftClamping");
    v5->_rightRXID = objc_msgSend(v4, "rightRXID");
    v5->_rightCalibrationRXID = objc_msgSend(v4, "rightCalibrationRXID");
    objc_msgSend(v4, "rightDisplaySphere");
    v5->_rightDisplaySphere = v11;
    objc_msgSend(v4, "rightDisplayCylinder");
    v5->_rightDisplayCylinder = v12;
    objc_msgSend(v4, "rightCalibrationSphere");
    v5->_rightCalibrationSphere = v13;
    objc_msgSend(v4, "rightCalibrationCylinder");
    v5->_rightCalibrationCylinder = v14;
    objc_msgSend(v4, "rightAddVR");
    v5->_rightAddVR = v15;
    v5->_rightAxisID = objc_msgSend(v4, "rightAxisID");
    v5->_rightDisplayAxis = objc_msgSend(v4, "rightDisplayAxis");
    v5->_rightCalibrationAxis = objc_msgSend(v4, "rightCalibrationAxis");
    v5->_rightClamping = objc_msgSend(v4, "rightClamping");
    v5->_identifyingColor = objc_msgSend(v4, "identifyingColor");
    objc_msgSend(v4, "secret");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    secret = v5->_secret;
    v5->_secret = (NSData *)v17;

  }
  return v5;
}

- (id)build
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CRXFAppClipCode *v39;
  unint64_t v41;
  unint64_t v42;
  int v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  _BOOL4 v47;
  unint64_t v48;
  _BOOL4 v49;
  CRXFAppClipCode *v50;
  unint64_t v51;

  v50 = [CRXFAppClipCode alloc];
  v48 = -[CRXFAppClipCodeBuilder version](self, "version");
  v51 = -[CRXFAppClipCodeBuilder lensType](self, "lensType");
  v49 = -[CRXFAppClipCodeBuilder cylLeftSignFlipped](self, "cylLeftSignFlipped");
  v47 = -[CRXFAppClipCodeBuilder cylRightSignFlipped](self, "cylRightSignFlipped");
  v46 = -[CRXFAppClipCodeBuilder leftRXID](self, "leftRXID");
  v45 = -[CRXFAppClipCodeBuilder leftCalibrationRXID](self, "leftCalibrationRXID");
  -[CRXFAppClipCodeBuilder leftDisplaySphere](self, "leftDisplaySphere");
  v44 = v3;
  -[CRXFAppClipCodeBuilder leftDisplayCylinder](self, "leftDisplayCylinder");
  v43 = v4;
  -[CRXFAppClipCodeBuilder leftCalibrationSphere](self, "leftCalibrationSphere");
  v6 = v5;
  -[CRXFAppClipCodeBuilder leftCalibrationCylinder](self, "leftCalibrationCylinder");
  v8 = v7;
  -[CRXFAppClipCodeBuilder leftAddVR](self, "leftAddVR");
  v10 = v9;
  v42 = -[CRXFAppClipCodeBuilder leftAxisID](self, "leftAxisID");
  v41 = -[CRXFAppClipCodeBuilder leftDisplayAxis](self, "leftDisplayAxis");
  v11 = -[CRXFAppClipCodeBuilder leftCalibrationAxis](self, "leftCalibrationAxis");
  v12 = -[CRXFAppClipCodeBuilder leftClamping](self, "leftClamping");
  v13 = -[CRXFAppClipCodeBuilder rightRXID](self, "rightRXID");
  v14 = -[CRXFAppClipCodeBuilder rightCalibrationRXID](self, "rightCalibrationRXID");
  -[CRXFAppClipCodeBuilder rightDisplaySphere](self, "rightDisplaySphere");
  v16 = v15;
  -[CRXFAppClipCodeBuilder rightDisplayCylinder](self, "rightDisplayCylinder");
  v18 = v17;
  -[CRXFAppClipCodeBuilder rightCalibrationSphere](self, "rightCalibrationSphere");
  v20 = v19;
  -[CRXFAppClipCodeBuilder rightCalibrationCylinder](self, "rightCalibrationCylinder");
  v22 = v21;
  -[CRXFAppClipCodeBuilder rightAddVR](self, "rightAddVR");
  v24 = v23;
  v25 = -[CRXFAppClipCodeBuilder rightAxisID](self, "rightAxisID");
  v26 = -[CRXFAppClipCodeBuilder rightDisplayAxis](self, "rightDisplayAxis");
  v27 = -[CRXFAppClipCodeBuilder rightCalibrationAxis](self, "rightCalibrationAxis");
  v28 = -[CRXFAppClipCodeBuilder rightClamping](self, "rightClamping");
  v29 = -[CRXFAppClipCodeBuilder identifyingColor](self, "identifyingColor");
  -[CRXFAppClipCodeBuilder secret](self, "secret");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = v43;
  LODWORD(v31) = v44;
  LODWORD(v33) = v6;
  LODWORD(v34) = v8;
  LODWORD(v35) = v10;
  LODWORD(v36) = v16;
  LODWORD(v37) = v18;
  LODWORD(v38) = v20;
  v39 = -[CRXFAppClipCode initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:](v50, "initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:", v48, v51, v49, v47, v46, v45, v31, v32, v33, v34, v35, v36, v37,
          v38,
          v42,
          v41,
          v11,
          v12,
          v13,
          v14,
          __PAIR64__(v24, v22),
          v25,
          v26,
          v27,
          v28,
          v29,
          v30);

  return v39;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)lensType
{
  return self->_lensType;
}

- (void)setLensType:(unint64_t)a3
{
  self->_lensType = a3;
}

- (BOOL)cylLeftSignFlipped
{
  return self->_cylLeftSignFlipped;
}

- (void)setCylLeftSignFlipped:(BOOL)a3
{
  self->_cylLeftSignFlipped = a3;
}

- (BOOL)cylRightSignFlipped
{
  return self->_cylRightSignFlipped;
}

- (void)setCylRightSignFlipped:(BOOL)a3
{
  self->_cylRightSignFlipped = a3;
}

- (unint64_t)leftRXID
{
  return self->_leftRXID;
}

- (void)setLeftRXID:(unint64_t)a3
{
  self->_leftRXID = a3;
}

- (unint64_t)leftCalibrationRXID
{
  return self->_leftCalibrationRXID;
}

- (void)setLeftCalibrationRXID:(unint64_t)a3
{
  self->_leftCalibrationRXID = a3;
}

- (float)leftDisplaySphere
{
  return self->_leftDisplaySphere;
}

- (void)setLeftDisplaySphere:(float)a3
{
  self->_leftDisplaySphere = a3;
}

- (float)leftDisplayCylinder
{
  return self->_leftDisplayCylinder;
}

- (void)setLeftDisplayCylinder:(float)a3
{
  self->_leftDisplayCylinder = a3;
}

- (float)leftCalibrationSphere
{
  return self->_leftCalibrationSphere;
}

- (void)setLeftCalibrationSphere:(float)a3
{
  self->_leftCalibrationSphere = a3;
}

- (float)leftCalibrationCylinder
{
  return self->_leftCalibrationCylinder;
}

- (void)setLeftCalibrationCylinder:(float)a3
{
  self->_leftCalibrationCylinder = a3;
}

- (float)leftAddVR
{
  return self->_leftAddVR;
}

- (void)setLeftAddVR:(float)a3
{
  self->_leftAddVR = a3;
}

- (unint64_t)leftAxisID
{
  return self->_leftAxisID;
}

- (void)setLeftAxisID:(unint64_t)a3
{
  self->_leftAxisID = a3;
}

- (unint64_t)leftCalibrationAxis
{
  return self->_leftCalibrationAxis;
}

- (void)setLeftCalibrationAxis:(unint64_t)a3
{
  self->_leftCalibrationAxis = a3;
}

- (unint64_t)leftDisplayAxis
{
  return self->_leftDisplayAxis;
}

- (void)setLeftDisplayAxis:(unint64_t)a3
{
  self->_leftDisplayAxis = a3;
}

- (unint64_t)leftClamping
{
  return self->_leftClamping;
}

- (void)setLeftClamping:(unint64_t)a3
{
  self->_leftClamping = a3;
}

- (unint64_t)rightRXID
{
  return self->_rightRXID;
}

- (void)setRightRXID:(unint64_t)a3
{
  self->_rightRXID = a3;
}

- (unint64_t)rightCalibrationRXID
{
  return self->_rightCalibrationRXID;
}

- (void)setRightCalibrationRXID:(unint64_t)a3
{
  self->_rightCalibrationRXID = a3;
}

- (float)rightDisplaySphere
{
  return self->_rightDisplaySphere;
}

- (void)setRightDisplaySphere:(float)a3
{
  self->_rightDisplaySphere = a3;
}

- (float)rightDisplayCylinder
{
  return self->_rightDisplayCylinder;
}

- (void)setRightDisplayCylinder:(float)a3
{
  self->_rightDisplayCylinder = a3;
}

- (float)rightCalibrationSphere
{
  return self->_rightCalibrationSphere;
}

- (void)setRightCalibrationSphere:(float)a3
{
  self->_rightCalibrationSphere = a3;
}

- (float)rightCalibrationCylinder
{
  return self->_rightCalibrationCylinder;
}

- (void)setRightCalibrationCylinder:(float)a3
{
  self->_rightCalibrationCylinder = a3;
}

- (float)rightAddVR
{
  return self->_rightAddVR;
}

- (void)setRightAddVR:(float)a3
{
  self->_rightAddVR = a3;
}

- (unint64_t)rightAxisID
{
  return self->_rightAxisID;
}

- (void)setRightAxisID:(unint64_t)a3
{
  self->_rightAxisID = a3;
}

- (unint64_t)rightCalibrationAxis
{
  return self->_rightCalibrationAxis;
}

- (void)setRightCalibrationAxis:(unint64_t)a3
{
  self->_rightCalibrationAxis = a3;
}

- (unint64_t)rightDisplayAxis
{
  return self->_rightDisplayAxis;
}

- (void)setRightDisplayAxis:(unint64_t)a3
{
  self->_rightDisplayAxis = a3;
}

- (unint64_t)rightClamping
{
  return self->_rightClamping;
}

- (void)setRightClamping:(unint64_t)a3
{
  self->_rightClamping = a3;
}

- (unint64_t)identifyingColor
{
  return self->_identifyingColor;
}

- (void)setIdentifyingColor:(unint64_t)a3
{
  self->_identifyingColor = a3;
}

- (NSData)secret
{
  return self->_secret;
}

- (void)setSecret:(id)a3
{
  objc_storeStrong((id *)&self->_secret, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
}

@end
