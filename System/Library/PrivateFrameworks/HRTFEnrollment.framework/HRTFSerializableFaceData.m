@implementation HRTFSerializableFaceData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFSerializableFaceData)initWithFaceObject:(id)a3
{
  id v4;
  HRTFSerializableFaceData *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HRTFSerializableFaceData;
  v5 = -[HRTFSerializableFaceData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bounds");
    v5->_bounds.origin.x = v6;
    v5->_bounds.origin.y = v7;
    v5->_bounds.size.width = v8;
    v5->_bounds.size.height = v9;
    v5->_faceID = objc_msgSend(v4, "faceID");
    v5->_yawAngleAvailable = objc_msgSend(v4, "hasYawAngle");
    objc_msgSend(v4, "yawAngle");
    v5->_yawAngle = v10;
    v5->_rollAngleAvailable = objc_msgSend(v4, "hasRollAngle");
    objc_msgSend(v4, "rollAngle");
    v5->_rollAngle = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &self->_bounds, 32);
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("Bounds"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_faceID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("FaceID"));

  if (self->_yawAngleAvailable)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_yawAngle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("YawAngle"));

  }
  if (self->_rollAngleAvailable)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_rollAngle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("RollAngle"));

  }
}

- (HRTFSerializableFaceData)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  _OWORD *v8;
  __int128 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  HRTFSerializableFaceData *v15;
  objc_super v17;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("Bounds"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("FaceID")))
  {
    v17.receiver = self;
    v17.super_class = (Class)HRTFSerializableFaceData;
    v5 = -[HRTFSerializableFaceData init](&v17, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Bounds"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length") != 32)
        -[HRTFSerializableFaceData initWithCoder:].cold.1();
      v7 = objc_retainAutorelease(v6);
      v8 = (_OWORD *)objc_msgSend(v7, "bytes");
      v9 = v8[1];
      *(_OWORD *)(v5 + 8) = *v8;
      *(_OWORD *)(v5 + 24) = v9;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FaceID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)v5 + 5) = objc_msgSend(v10, "integerValue");
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("YawAngle")))
      {
        v5[64] = 1;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("YawAngle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "doubleValue");
        *((_QWORD *)v5 + 6) = v12;
        v10 = v11;
      }
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("RollAngle")))
      {
        v5[65] = 1;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RollAngle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "doubleValue");
        *((_QWORD *)v5 + 7) = v14;
        v10 = v13;
      }

    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)faceID
{
  return self->_faceID;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (BOOL)yawAngleAvailable
{
  return self->_yawAngleAvailable;
}

- (BOOL)rollAngleAvailable
{
  return self->_rollAngleAvailable;
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[HRTFSerializableFaceData initWithCoder:]", "HRTFSerializableFaceData.m", 62, "data.length == sizeof(CGRect)");
}

@end
