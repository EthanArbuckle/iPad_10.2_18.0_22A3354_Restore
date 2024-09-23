@implementation CVACMCompassData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EF00 != -1)
    dispatch_once(&qword_254A6EF00, &unk_24CA36020);
  return (id)qword_254A6EEF8;
}

- (CVACMCompassData)init
{
  CVACMCompassData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CVACMCompassData;
  v2 = -[CVACMCompassData init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CVACMCompassData setFieldValues:](v2, "setFieldValues:", v3);

  }
  return v2;
}

- (CVACMCompassData)initWithDictionary:(id)a3
{
  id v4;
  CVACMCompassData *v5;
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
  v5 = -[CVACMCompassData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;
    -[CVACMCompassData fieldValues](v5, "fieldValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = v8;
    objc_msgSend(v9, "setX:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;
    -[CVACMCompassData fieldValues](v5, "fieldValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = v13;
    objc_msgSend(v14, "setY:", v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("z"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;
    -[CVACMCompassData fieldValues](v5, "fieldValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = v18;
    objc_msgSend(v19, "setZ:", v20);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    -[CVACMCompassData setTemperature:](v5, "setTemperature:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    -[CVACMCompassData setTimestamp:](v5, "setTimestamp:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("st"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMCompassData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v23, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sn"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMCompassData setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v24, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fi"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMCompassData setFrameId:](v5, "setFrameId:", objc_msgSend(v25, "unsignedLongLongValue"));

  }
  return v5;
}

- (CVACMCompassData)initWithCoder:(id)a3
{
  id v4;
  CVACMCompassData *v5;
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
  v5 = -[CVACMCompassData init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("x"));
    v8 = v7;
    -[CVACMCompassData fieldValues](v5, "fieldValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = v8;
    objc_msgSend(v9, "setX:", v10);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("y"));
    v12 = v11;
    -[CVACMCompassData fieldValues](v5, "fieldValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = v12;
    objc_msgSend(v13, "setY:", v14);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("z"));
    v16 = v15;
    -[CVACMCompassData fieldValues](v5, "fieldValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = v16;
    objc_msgSend(v17, "setZ:", v18);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVACMCompassData setTimestamp:](v5, "setTimestamp:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("p"));
    -[CVACMCompassData setTemperature:](v5, "setTemperature:");
    -[CVACMCompassData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    -[CVACMCompassData setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sn")));
    -[CVACMCompassData setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
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
  -[CVACMCompassData fieldValues](self, "fieldValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "x");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("x"));

  -[CVACMCompassData fieldValues](self, "fieldValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "y");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("y"));

  -[CVACMCompassData fieldValues](self, "fieldValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "z");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("z"));

  -[CVACMCompassData temperature](self, "temperature");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("p"));
  -[CVACMCompassData timestamp](self, "timestamp");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMCompassData syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMCompassData sequenceNumber](self, "sequenceNumber"), CFSTR("sn"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[CVACMCompassData frameId](self, "frameId"), CFSTR("fi"));
  objc_autoreleasePoolPop(v4);

}

- (CVACLMotionTypeVector3)fieldValues
{
  return self->_fieldValues;
}

- (void)setFieldValues:(id)a3
{
  objc_storeStrong((id *)&self->_fieldValues, a3);
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
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
  objc_storeStrong((id *)&self->_fieldValues, 0);
}

@end
