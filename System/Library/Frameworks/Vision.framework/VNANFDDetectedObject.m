@implementation VNANFDDetectedObject

- (VNANFDDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5 rotationAngle:(float)a6 yawAngle:(float)a7 pitchAngle:(float)a8 labelKey:(int)a9 groupId:(int)a10
{
  VNANFDDetectedObject *v15;
  VNANFDDetectedObject *v16;
  VNANFDDetectedObject *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VNANFDDetectedObject;
  v15 = -[VNEspressoDetectedObject initWithObjectType:boundingBox:confidence:](&v19, sel_initWithObjectType_boundingBox_confidence_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v16 = v15;
  if (v15)
  {
    v15->_rotationAngle = a6;
    v15->_yawAngle = a7;
    v15->_pitchAngle = a8;
    v15->_labelKey = a9;
    v15->_groupId = a10;
    v17 = v15;
  }

  return v16;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  objc_super v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)VNANFDDetectedObject;
  -[VNEspressoDetectedObject description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VNANFDDetectedObject labelKey](self, "labelKey");
  -[VNANFDDetectedObject rotationAngle](self, "rotationAngle");
  v7 = v6;
  -[VNANFDDetectedObject yawAngle](self, "yawAngle");
  v9 = v8;
  -[VNANFDDetectedObject pitchAngle](self, "pitchAngle");
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ labelKey = %d; rotationAngle = %f; yawAngle = %f, pitchAngle = %f, groupID = %d"),
                  v4,
                  v5,
                  v7,
                  v9,
                  v10,
                  -[VNANFDDetectedObject groupId](self, "groupId"));

  return v11;
}

- (float)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(float)a3
{
  self->_rotationAngle = a3;
}

- (float)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(float)a3
{
  self->_yawAngle = a3;
}

- (float)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(float)a3
{
  self->_pitchAngle = a3;
}

- (int)labelKey
{
  return self->_labelKey;
}

- (void)setLabelKey:(int)a3
{
  self->_labelKey = a3;
}

- (int)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(int)a3
{
  self->_groupId = a3;
}

@end
