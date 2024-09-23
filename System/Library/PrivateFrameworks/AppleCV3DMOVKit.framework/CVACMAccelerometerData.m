@implementation CVACMAccelerometerData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CVACMAccelerometerData)init
{
  CVACMAccelerometerData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CVACMAccelerometerData;
  v2 = -[CVACMAccelerometerData init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CVACMAccelerometerData setAcceleration:](v2, "setAcceleration:", v3);

  }
  return v2;
}

- (CVACMAccelerometerData)initWithDictionary:(id)a3
{
  id v4;
  CVACMAccelerometerData *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  double v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CVACMAccelerometerData;
  v5 = -[CVACMAccelerometerData init](&v28, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[CVACMAccelerometerData setAcceleration:](v5, "setAcceleration:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;
    -[CVACMAccelerometerData acceleration](v5, "acceleration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = v9;
    objc_msgSend(v10, "setX:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;
    -[CVACMAccelerometerData acceleration](v5, "acceleration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = v14;
    objc_msgSend(v15, "setY:", v16);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("z"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;
    -[CVACMAccelerometerData acceleration](v5, "acceleration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = v19;
    objc_msgSend(v20, "setZ:", v21);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    -[CVACMAccelerometerData setTemperature:](v5, "setTemperature:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    -[CVACMAccelerometerData setTimestamp:](v5, "setTimestamp:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("st"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMAccelerometerData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v24, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sn"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMAccelerometerData setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v25, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fi"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMAccelerometerData setFrameId:](v5, "setFrameId:", objc_msgSend(v26, "unsignedLongLongValue"));

  }
  return v5;
}

- (CVACMAccelerometerData)initWithCoder:(id)a3
{
  id v4;
  CVACMAccelerometerData *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  double v11;
  int v12;
  int v13;
  void *v14;
  double v15;
  int v16;
  int v17;
  void *v18;
  double v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CVACMAccelerometerData;
  v5 = -[CVACMAccelerometerData init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    v7 = (void *)objc_opt_new();
    -[CVACMAccelerometerData setAcceleration:](v5, "setAcceleration:", v7);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("x"));
    v9 = v8;
    -[CVACMAccelerometerData acceleration](v5, "acceleration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = v9;
    objc_msgSend(v10, "setX:", v11);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("y"));
    v13 = v12;
    -[CVACMAccelerometerData acceleration](v5, "acceleration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = v13;
    objc_msgSend(v14, "setY:", v15);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("z"));
    v17 = v16;
    -[CVACMAccelerometerData acceleration](v5, "acceleration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = v17;
    objc_msgSend(v18, "setZ:", v19);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("p"));
    -[CVACMAccelerometerData setTemperature:](v5, "setTemperature:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVACMAccelerometerData setTimestamp:](v5, "setTimestamp:");
    -[CVACMAccelerometerData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    -[CVACMAccelerometerData setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sn")));
    -[CVACMAccelerometerData setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
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
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVACMAccelerometerData acceleration](self, "acceleration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "x");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("x"));

  -[CVACMAccelerometerData acceleration](self, "acceleration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "y");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("y"));

  -[CVACMAccelerometerData acceleration](self, "acceleration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "z");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("z"));

  -[CVACMAccelerometerData temperature](self, "temperature");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("p"));
  -[CVACMAccelerometerData timestamp](self, "timestamp");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMAccelerometerData syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMAccelerometerData sequenceNumber](self, "sequenceNumber"), CFSTR("sn"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMAccelerometerData frameId](self, "frameId"), CFSTR("fi"));
  objc_autoreleasePoolPop(v4);

}

- (id)dictionary
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[8];
  _QWORD v22[10];

  v22[8] = *MEMORY[0x24BDAC8D0];
  v21[0] = CFSTR("x");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMAccelerometerData acceleration](self, "acceleration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "x");
  objc_msgSend(v3, "numberWithFloat:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  v21[1] = CFSTR("y");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMAccelerometerData acceleration](self, "acceleration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "y");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("z");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMAccelerometerData acceleration](self, "acceleration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "z");
  objc_msgSend(v6, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  v21[3] = CFSTR("p");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMAccelerometerData temperature](self, "temperature");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v10;
  v21[4] = CFSTR("t");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMAccelerometerData timestamp](self, "timestamp");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v12;
  v21[5] = CFSTR("st");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVACMAccelerometerData syncTimestamp](self, "syncTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v13;
  v21[6] = CFSTR("sn");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVACMAccelerometerData sequenceNumber](self, "sequenceNumber"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = CFSTR("fi");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVACMAccelerometerData frameId](self, "frameId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CVACLMotionTypeVector3)acceleration
{
  return self->_acceleration;
}

- (void)setAcceleration:(id)a3
{
  objc_storeStrong((id *)&self->_acceleration, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
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
  objc_storeStrong((id *)&self->_acceleration, 0);
}

@end
