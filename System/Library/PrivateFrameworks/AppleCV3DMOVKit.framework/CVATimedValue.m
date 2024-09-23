@implementation CVATimedValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EE70 != -1)
    dispatch_once(&qword_254A6EE70, &unk_24CA35F00);
  return (id)qword_254A6EE68;
}

- (CVATimedValue)initWithDictionary:(id)a3
{
  id v4;
  CVATimedValue *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CVATimedValue;
  v5 = -[CVATimedValue init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("v"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVATimedValue setValue:](v5, "setValue:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    -[CVATimedValue setTimestamp:](v5, "setTimestamp:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("st"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVATimedValue setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v8, "unsignedLongLongValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fi"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVATimedValue setFrameId:](v5, "setFrameId:", objc_msgSend(v9, "unsignedLongLongValue"));

  }
  return v5;
}

- (CVATimedValue)initWithCoder:(id)a3
{
  id v4;
  CVATimedValue *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVATimedValue;
  v5 = -[CVATimedValue init](&v9, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("v"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVATimedValue setValue:](v5, "setValue:", v7);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVATimedValue setTimestamp:](v5, "setTimestamp:");
    -[CVATimedValue setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    -[CVATimedValue setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVATimedValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("v"));

  -[CVATimedValue timestamp](self, "timestamp");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[CVATimedValue syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[CVATimedValue frameId](self, "frameId"), CFSTR("fi"));
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
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("v");
  -[CVATimedValue value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("t");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CVATimedValue timestamp](self, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("st");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVATimedValue syncTimestamp](self, "syncTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = CFSTR("fi");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[CVATimedValue frameId](self, "frameId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (NSSecureCoding)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
