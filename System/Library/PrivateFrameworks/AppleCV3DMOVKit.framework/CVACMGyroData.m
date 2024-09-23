@implementation CVACMGyroData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CVACMGyroData)init
{
  CVACMGyroData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CVACMGyroData;
  v2 = -[CVACMGyroData init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CVACMGyroData setRotationRate:](v2, "setRotationRate:", v3);

  }
  return v2;
}

- (CVACMGyroData)initWithDictionary:(id)a3
{
  id v4;
  CVACMGyroData *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = -[CVACMGyroData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;
    -[CVACMGyroData rotationRate](v5, "rotationRate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = v8;
    objc_msgSend(v9, "setX:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;
    -[CVACMGyroData rotationRate](v5, "rotationRate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = v13;
    objc_msgSend(v14, "setY:", v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("z"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;
    -[CVACMGyroData rotationRate](v5, "rotationRate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = v18;
    objc_msgSend(v19, "setZ:", v20);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    -[CVACMGyroData setTemperature:](v5, "setTemperature:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    -[CVACMGyroData setTimestamp:](v5, "setTimestamp:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("st"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMGyroData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v23, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sn"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMGyroData setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v24, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fi"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMGyroData setFrameId:](v5, "setFrameId:", objc_msgSend(v25, "unsignedLongLongValue"));

  }
  return v5;
}

- (CVACMGyroData)initWithCoder:(id)a3
{
  id v4;
  CVACMGyroData *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  int v11;
  int v12;
  void *v13;
  double v14;
  int v15;
  int v16;
  void *v17;
  double v18;

  v4 = a3;
  v5 = -[CVACMGyroData init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("x"));
    v8 = v7;
    -[CVACMGyroData rotationRate](v5, "rotationRate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = v8;
    objc_msgSend(v9, "setX:", v10);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("y"));
    v12 = v11;
    -[CVACMGyroData rotationRate](v5, "rotationRate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = v12;
    objc_msgSend(v13, "setY:", v14);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("z"));
    v16 = v15;
    -[CVACMGyroData rotationRate](v5, "rotationRate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = v16;
    objc_msgSend(v17, "setZ:", v18);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVACMGyroData setTimestamp:](v5, "setTimestamp:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("p"));
    -[CVACMGyroData setTemperature:](v5, "setTemperature:");
    -[CVACMGyroData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    -[CVACMGyroData setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sn")));
    -[CVACMGyroData setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
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
  -[CVACMGyroData rotationRate](self, "rotationRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "x");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("x"));

  -[CVACMGyroData rotationRate](self, "rotationRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "y");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("y"));

  -[CVACMGyroData rotationRate](self, "rotationRate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "z");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("z"));

  -[CVACMGyroData temperature](self, "temperature");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("p"));
  -[CVACMGyroData timestamp](self, "timestamp");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMGyroData syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMGyroData sequenceNumber](self, "sequenceNumber"), CFSTR("sn"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMGyroData frameId](self, "frameId"), CFSTR("fi"));
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
  -[CVACMGyroData rotationRate](self, "rotationRate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "x");
  objc_msgSend(v3, "numberWithFloat:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  v21[1] = CFSTR("y");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMGyroData rotationRate](self, "rotationRate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "y");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("z");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMGyroData rotationRate](self, "rotationRate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "z");
  objc_msgSend(v6, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v8;
  v21[3] = CFSTR("p");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMGyroData temperature](self, "temperature");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v10;
  v21[4] = CFSTR("t");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[CVACMGyroData timestamp](self, "timestamp");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v12;
  v21[5] = CFSTR("st");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVACMGyroData syncTimestamp](self, "syncTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v13;
  v21[6] = CFSTR("sn");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVACMGyroData sequenceNumber](self, "sequenceNumber"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = CFSTR("fi");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVACMGyroData frameId](self, "frameId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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
  objc_storeStrong((id *)&self->_rotationRate, 0);
}

@end
