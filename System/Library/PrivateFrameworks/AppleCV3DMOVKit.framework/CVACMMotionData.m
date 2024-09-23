@implementation CVACMMotionData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EF10 != -1)
    dispatch_once(&qword_254A6EF10, &unk_24CA36040);
  return (id)qword_254A6EF08;
}

- (CVACMMotionData)init
{
  CVACMMotionData *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CVACMMotionData;
  v2 = -[CVACMMotionData init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CVACMMotionData setQuaternion:](v2, "setQuaternion:", v3);

    v4 = (void *)objc_opt_new();
    -[CVACMMotionData setAcceleration:](v2, "setAcceleration:", v4);

    v5 = (void *)objc_opt_new();
    -[CVACMMotionData setRotationRate:](v2, "setRotationRate:", v5);

  }
  return v2;
}

- (CVACMMotionData)initWithCoder:(id)a3
{
  id v4;
  CVACMMotionData *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  double v21;
  int v22;
  void *v23;
  double v24;
  int v25;
  void *v26;
  double v27;
  int v28;
  void *v29;
  double v30;
  int v31;
  void *v32;
  double v33;
  int v34;
  void *v35;
  double v36;

  v4 = a3;
  v5 = -[CVACMMotionData init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("qx"));
    v8 = v7;
    -[CVACMMotionData quaternion](v5, "quaternion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setX:", v8);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("qy"));
    v11 = v10;
    -[CVACMMotionData quaternion](v5, "quaternion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setY:", v11);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("qz"));
    v14 = v13;
    -[CVACMMotionData quaternion](v5, "quaternion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setZ:", v14);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("qw"));
    v17 = v16;
    -[CVACMMotionData quaternion](v5, "quaternion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setW:", v17);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ax"));
    LODWORD(v17) = v19;
    -[CVACMMotionData acceleration](v5, "acceleration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = LODWORD(v17);
    objc_msgSend(v20, "setX:", v21);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ay"));
    LODWORD(v17) = v22;
    -[CVACMMotionData acceleration](v5, "acceleration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = LODWORD(v17);
    objc_msgSend(v23, "setY:", v24);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("az"));
    LODWORD(v17) = v25;
    -[CVACMMotionData acceleration](v5, "acceleration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = LODWORD(v17);
    objc_msgSend(v26, "setZ:", v27);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rx"));
    LODWORD(v17) = v28;
    -[CVACMMotionData rotationRate](v5, "rotationRate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = LODWORD(v17);
    objc_msgSend(v29, "setX:", v30);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ry"));
    LODWORD(v17) = v31;
    -[CVACMMotionData rotationRate](v5, "rotationRate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = LODWORD(v17);
    objc_msgSend(v32, "setY:", v33);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rz"));
    LODWORD(v17) = v34;
    -[CVACMMotionData rotationRate](v5, "rotationRate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = LODWORD(v17);
    objc_msgSend(v35, "setZ:", v36);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVACMMotionData setTimestamp:](v5, "setTimestamp:");
    -[CVACMMotionData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    -[CVACMMotionData setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sn")));
    -[CVACMMotionData setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVACMMotionData quaternion](self, "quaternion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "x");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("qx"));

  -[CVACMMotionData quaternion](self, "quaternion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "y");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("qy"));

  -[CVACMMotionData quaternion](self, "quaternion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "z");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("qz"));

  -[CVACMMotionData quaternion](self, "quaternion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "w");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("qw"));

  -[CVACMMotionData acceleration](self, "acceleration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "x");
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("ax"));

  -[CVACMMotionData acceleration](self, "acceleration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "y");
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("ay"));

  -[CVACMMotionData acceleration](self, "acceleration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "z");
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("az"));

  -[CVACMMotionData rotationRate](self, "rotationRate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "x");
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("rx"));

  -[CVACMMotionData rotationRate](self, "rotationRate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "y");
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("ry"));

  -[CVACMMotionData rotationRate](self, "rotationRate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "z");
  objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("rz"));

  -[CVACMMotionData timestamp](self, "timestamp");
  objc_msgSend(v15, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[CVACMMotionData syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[CVACMMotionData sequenceNumber](self, "sequenceNumber"), CFSTR("sn"));
  objc_msgSend(v15, "encodeInt64:forKey:", -[CVACMMotionData frameId](self, "frameId"), CFSTR("fi"));
  objc_autoreleasePoolPop(v4);

}

- (CVACLMotionTypeDoubleVector4)quaternion
{
  return self->_quaternion;
}

- (void)setQuaternion:(id)a3
{
  objc_storeStrong((id *)&self->_quaternion, a3);
}

- (CVACLMotionTypeVector3)acceleration
{
  return self->_acceleration;
}

- (void)setAcceleration:(id)a3
{
  objc_storeStrong((id *)&self->_acceleration, a3);
}

- (CVACLMotionTypeVector3)rotationRate
{
  return self->_rotationRate;
}

- (void)setRotationRate:(id)a3
{
  objc_storeStrong((id *)&self->_rotationRate, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationRate, 0);
  objc_storeStrong((id *)&self->_acceleration, 0);
  objc_storeStrong((id *)&self->_quaternion, 0);
}

@end
