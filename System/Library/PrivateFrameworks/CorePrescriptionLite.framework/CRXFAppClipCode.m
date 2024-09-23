@implementation CRXFAppClipCode

- (CRXFAppClipCode)initWithVersion:(unint64_t)a3 lensType:(unint64_t)a4 cylLeftSignFlipped:(BOOL)a5 cylRightSignFlipped:(BOOL)a6 leftRXID:(unint64_t)a7 leftCalibrationRXID:(unint64_t)a8 leftDisplaySphere:(float)a9 leftDisplayCylinder:(float)a10 leftCalibrationSphere:(float)a11 leftCalibrationCylinder:(float)a12 leftAddVR:(float)a13 leftAxisID:(unint64_t)a14 leftDisplayAxis:(unint64_t)a15 leftCalibrationAxis:(unint64_t)a16 leftClamping:(unint64_t)a17 rightRXID:(unint64_t)a18 rightCalibrationRXID:(unint64_t)a19 rightDisplaySphere:(float)a20 rightDisplayCylinder:(float)a21 rightCalibrationSphere:(float)a22 rightCalibrationCylinder:(float)a23 rightAddVR:(float)a24 rightAxisID:(unint64_t)a25 rightDisplayAxis:(unint64_t)a26 rightCalibrationAxis:(unint64_t)a27 rightClamping:(unint64_t)a28 identifyingColor:(unint64_t)a29 secret:(id)a30
{
  id v45;
  CRXFAppClipCode *v46;
  objc_super v48;

  v45 = a30;
  v48.receiver = self;
  v48.super_class = (Class)CRXFAppClipCode;
  v46 = -[CRXFAppClipCode init](&v48, sel_init);
  if (v46)
  {
    v46->_version = a3;
    v46->_lensType = a4;
    v46->_cylLeftSignFlipped = a5;
    v46->_cylRightSignFlipped = a6;
    v46->_leftRXID = a7;
    v46->_leftCalibrationRXID = a8;
    v46->_leftDisplaySphere = a9;
    v46->_leftDisplayCylinder = a10;
    v46->_leftCalibrationSphere = a11;
    v46->_leftCalibrationCylinder = a12;
    v46->_leftAxisID = a14;
    v46->_leftCalibrationAxis = a16;
    v46->_leftDisplayAxis = a15;
    v46->_leftClamping = a17;
    v46->_rightRXID = a18;
    v46->_rightCalibrationRXID = a19;
    v46->_leftAddVR = a13;
    v46->_rightDisplaySphere = a20;
    v46->_rightDisplayCylinder = a21;
    v46->_rightCalibrationSphere = a22;
    v46->_rightCalibrationCylinder = a23;
    v46->_rightAddVR = a24;
    v46->_rightAxisID = a25;
    v46->_rightCalibrationAxis = a27;
    v46->_rightDisplayAxis = a26;
    v46->_rightClamping = a28;
    v46->_identifyingColor = a29;
    objc_storeStrong((id *)&v46->_secret, a30);
  }

  return v46;
}

+ (id)appClipCodeWithBlock:(id)a3
{
  void (**v3)(id, CRXFAppClipCodeBuilder *);
  CRXFAppClipCodeBuilder *v4;
  void *v5;

  v3 = (void (**)(id, CRXFAppClipCodeBuilder *))a3;
  v4 = objc_alloc_init(CRXFAppClipCodeBuilder);
  v3[2](v3, v4);

  -[CRXFAppClipCodeBuilder build](v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasLeftRX
{
  return self->_leftRXID != 0;
}

- (BOOL)hasRightRX
{
  return self->_rightRXID != 0;
}

- (BOOL)hasOnlyLeftRX
{
  _BOOL4 v3;

  v3 = -[CRXFAppClipCode hasLeftRX](self, "hasLeftRX");
  if (v3)
    LOBYTE(v3) = !-[CRXFAppClipCode hasRightRX](self, "hasRightRX");
  return v3;
}

- (BOOL)hasOnlyRightRX
{
  _BOOL4 v3;

  v3 = -[CRXFAppClipCode hasRightRX](self, "hasRightRX");
  if (v3)
    LOBYTE(v3) = !-[CRXFAppClipCode hasLeftRX](self, "hasLeftRX");
  return v3;
}

- (BOOL)hasSingleLensRX
{
  return -[CRXFAppClipCode hasOnlyLeftRX](self, "hasOnlyLeftRX")
      || -[CRXFAppClipCode hasOnlyRightRX](self, "hasOnlyRightRX");
}

- (BOOL)hasLeftAndRightRX
{
  _BOOL4 v3;

  v3 = -[CRXFAppClipCode hasLeftRX](self, "hasLeftRX");
  if (v3)
    LOBYTE(v3) = -[CRXFAppClipCode hasRightRX](self, "hasRightRX");
  return v3;
}

- (BOOL)isLeftRXOutsideSupportedRange
{
  return self->_leftRXID == 1023;
}

- (BOOL)isRightRXOutsideSupportedRange
{
  return self->_rightRXID == 1023;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRXFAppClipCode *v5;
  float leftCalibrationSphere;
  float leftCalibrationCylinder;
  float leftAddVR;
  unint64_t leftClamping;
  unint64_t rightRXID;
  unint64_t rightCalibrationRXID;
  float rightDisplaySphere;
  float rightDisplayCylinder;
  float rightCalibrationCylinder;
  float rightCalibrationSphere;
  float rightAddVR;
  unint64_t rightAxisID;
  unint64_t rightCalibrationAxis;
  unint64_t rightClamping;
  unint64_t rightDisplayAxis;
  unint64_t identifyingColor;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CRXFAppClipCode *v31;
  unint64_t leftCalibrationAxis;
  unint64_t leftDisplayAxis;
  unint64_t leftAxisID;
  float leftDisplayCylinder;
  float leftDisplaySphere;
  unint64_t version;
  CRXFAppClipCode *v39;
  unint64_t leftCalibrationRXID;
  unint64_t leftRXID;
  _BOOL4 cylRightSignFlipped;
  _BOOL4 cylLeftSignFlipped;
  unint64_t lensType;

  v5 = +[CRXFAppClipCode allocWithZone:](CRXFAppClipCode, "allocWithZone:");
  version = self->_version;
  v39 = v5;
  lensType = self->_lensType;
  cylLeftSignFlipped = self->_cylLeftSignFlipped;
  cylRightSignFlipped = self->_cylRightSignFlipped;
  leftCalibrationRXID = self->_leftCalibrationRXID;
  leftRXID = self->_leftRXID;
  leftCalibrationSphere = self->_leftCalibrationSphere;
  leftDisplayCylinder = self->_leftDisplayCylinder;
  leftDisplaySphere = self->_leftDisplaySphere;
  leftCalibrationCylinder = self->_leftCalibrationCylinder;
  leftAddVR = self->_leftAddVR;
  leftCalibrationAxis = self->_leftCalibrationAxis;
  leftClamping = self->_leftClamping;
  leftDisplayAxis = self->_leftDisplayAxis;
  leftAxisID = self->_leftAxisID;
  rightRXID = self->_rightRXID;
  rightCalibrationRXID = self->_rightCalibrationRXID;
  rightDisplaySphere = self->_rightDisplaySphere;
  rightDisplayCylinder = self->_rightDisplayCylinder;
  rightCalibrationSphere = self->_rightCalibrationSphere;
  rightCalibrationCylinder = self->_rightCalibrationCylinder;
  rightAddVR = self->_rightAddVR;
  rightAxisID = self->_rightAxisID;
  rightCalibrationAxis = self->_rightCalibrationAxis;
  rightDisplayAxis = self->_rightDisplayAxis;
  rightClamping = self->_rightClamping;
  identifyingColor = self->_identifyingColor;
  v22 = (void *)-[NSData copyWithZone:](self->_secret, "copyWithZone:", a3);
  *(float *)&v24 = leftDisplayCylinder;
  *(float *)&v23 = leftDisplaySphere;
  *(float *)&v25 = leftCalibrationSphere;
  *(float *)&v26 = leftCalibrationCylinder;
  *(float *)&v27 = leftAddVR;
  *(float *)&v28 = rightDisplaySphere;
  *(float *)&v29 = rightDisplayCylinder;
  *(float *)&v30 = rightCalibrationSphere;
  v31 = -[CRXFAppClipCode initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:](v39, "initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:", version, lensType, cylLeftSignFlipped, cylRightSignFlipped, leftRXID, leftCalibrationRXID, v23, v24, v25, v26, v27, v28, v29,
          v30,
          leftAxisID,
          leftDisplayAxis,
          leftCalibrationAxis,
          leftClamping,
          rightRXID,
          rightCalibrationRXID,
          __PAIR64__(LODWORD(rightAddVR), LODWORD(rightCalibrationCylinder)),
          rightAxisID,
          rightDisplayAxis,
          rightCalibrationAxis,
          rightClamping,
          identifyingColor,
          v22);

  return v31;
}

- (id)description
{
  float v3;
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;

  v39 = (void *)MEMORY[0x24BDD17C8];
  v38 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode lensType](self, "lensType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRXUFormatters BOOLAsString:](CRXUFormatters, "BOOLAsString:", -[CRXFAppClipCode cylLeftSignFlipped](self, "cylLeftSignFlipped"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRXUFormatters BOOLAsString:](CRXUFormatters, "BOOLAsString:", -[CRXFAppClipCode cylRightSignFlipped](self, "cylRightSignFlipped"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode leftRXID](self, "leftRXID"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode leftCalibrationRXID](self, "leftCalibrationRXID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRXFAppClipCode leftDisplaySphere](self, "leftDisplaySphere");
  v4 = v3;
  -[CRXFAppClipCode leftDisplayCylinder](self, "leftDisplayCylinder");
  v6 = v5;
  -[CRXFAppClipCode leftCalibrationSphere](self, "leftCalibrationSphere");
  v8 = v7;
  -[CRXFAppClipCode leftCalibrationCylinder](self, "leftCalibrationCylinder");
  v10 = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode leftAxisID](self, "leftAxisID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[CRXFAppClipCode leftDisplayAxis](self, "leftDisplayAxis");
  v31 = -[CRXFAppClipCode leftCalibrationAxis](self, "leftCalibrationAxis");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode leftClamping](self, "leftClamping"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode rightRXID](self, "rightRXID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode rightCalibrationRXID](self, "rightCalibrationRXID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRXFAppClipCode rightDisplaySphere](self, "rightDisplaySphere");
  v12 = v11;
  -[CRXFAppClipCode rightDisplayCylinder](self, "rightDisplayCylinder");
  v14 = v13;
  -[CRXFAppClipCode rightCalibrationSphere](self, "rightCalibrationSphere");
  v16 = v15;
  -[CRXFAppClipCode rightCalibrationCylinder](self, "rightCalibrationCylinder");
  v18 = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode rightAxisID](self, "rightAxisID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[CRXFAppClipCode rightDisplayAxis](self, "rightDisplayAxis");
  v20 = -[CRXFAppClipCode rightCalibrationAxis](self, "rightCalibrationAxis");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode rightClamping](self, "rightClamping"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRXFAppClipCode identifyingColor](self, "identifyingColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRXFAppClipCode secret](self, "secret");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "crxu_asHexString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("%@<%p> lensType:%@, cylLeftSignFlipped: %@, cylRightSignFlipped: %@, leftRXID: %@, leftCalibrationRXID: %@, leftDisplaySphere:%.02f, leftDisplayCylinder:%.02f, leftCalibrationSphere:%.02f, leftCalibrationCylinder:%.02f, leftAxisID: %@, leftDisplayAxis: %lu, leftCalibrationAxis: %lu, leftClamping: %@ rightRXID: %@, rightCalibrationRXID: %@, rightDisplaySphere: %.02f, rightDisplayCylinder: %.02f, rightCalibrationSphere:%.02f, rightCalibrationCylinder:%.02f, rightAxisID: %@, rightDisplayAxis: %lu, rightCalibrationAxis: %lu, rightClamping: %@ identifyingColor: %@, secret: %@"), v38, self, v37, v36, v35, v40, v34, *(_QWORD *)&v4, *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10, v33, v32, v31, v29, v30,
    v27,
    *(_QWORD *)&v12,
    *(_QWORD *)&v14,
    *(_QWORD *)&v16,
    *(_QWORD *)&v18,
    v28,
    v19,
    v20,
    v26,
    v21,
    v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)lensType
{
  return self->_lensType;
}

- (unint64_t)leftRXID
{
  return self->_leftRXID;
}

- (unint64_t)leftCalibrationRXID
{
  return self->_leftCalibrationRXID;
}

- (float)leftDisplaySphere
{
  return self->_leftDisplaySphere;
}

- (float)leftDisplayCylinder
{
  return self->_leftDisplayCylinder;
}

- (float)leftCalibrationSphere
{
  return self->_leftCalibrationSphere;
}

- (float)leftCalibrationCylinder
{
  return self->_leftCalibrationCylinder;
}

- (float)leftAddVR
{
  return self->_leftAddVR;
}

- (unint64_t)leftAxisID
{
  return self->_leftAxisID;
}

- (unint64_t)leftCalibrationAxis
{
  return self->_leftCalibrationAxis;
}

- (unint64_t)leftDisplayAxis
{
  return self->_leftDisplayAxis;
}

- (unint64_t)leftClamping
{
  return self->_leftClamping;
}

- (unint64_t)rightRXID
{
  return self->_rightRXID;
}

- (unint64_t)rightCalibrationRXID
{
  return self->_rightCalibrationRXID;
}

- (float)rightDisplaySphere
{
  return self->_rightDisplaySphere;
}

- (float)rightDisplayCylinder
{
  return self->_rightDisplayCylinder;
}

- (float)rightCalibrationSphere
{
  return self->_rightCalibrationSphere;
}

- (float)rightCalibrationCylinder
{
  return self->_rightCalibrationCylinder;
}

- (float)rightAddVR
{
  return self->_rightAddVR;
}

- (unint64_t)rightAxisID
{
  return self->_rightAxisID;
}

- (unint64_t)rightCalibrationAxis
{
  return self->_rightCalibrationAxis;
}

- (unint64_t)rightDisplayAxis
{
  return self->_rightDisplayAxis;
}

- (unint64_t)rightClamping
{
  return self->_rightClamping;
}

- (unint64_t)identifyingColor
{
  return self->_identifyingColor;
}

- (NSData)secret
{
  return self->_secret;
}

- (BOOL)cylLeftSignFlipped
{
  return self->_cylLeftSignFlipped;
}

- (BOOL)cylRightSignFlipped
{
  return self->_cylRightSignFlipped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
}

@end
