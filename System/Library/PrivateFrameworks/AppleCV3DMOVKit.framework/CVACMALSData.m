@implementation CVACMALSData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EEF0 != -1)
    dispatch_once(&qword_254A6EEF0, &unk_24CA36000);
  return (id)qword_254A6EEE8;
}

- (CVACMALSData)init
{
  CVACMALSData *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CVACMALSData;
  v2 = -[CVACMALSData init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CVACMALSData setRawChannels:](v2, "setRawChannels:", v3);

    v4 = (void *)objc_opt_new();
    -[CVACMALSData setColorComponents:](v2, "setColorComponents:", v4);

  }
  return v2;
}

- (CVACMALSData)initWithCoder:(id)a3
{
  id v4;
  CVACMALSData *v5;
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
  int v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = a3;
  v5 = -[CVACMALSData init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    -[CVACMALSData setLuxValue:](v5, "setLuxValue:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("lux")));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rc0"));
    v8 = v7;
    -[CVACMALSData rawChannels](v5, "rawChannels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = v8;
    objc_msgSend(v9, "setX:", v10);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rc1"));
    v12 = v11;
    -[CVACMALSData rawChannels](v5, "rawChannels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = v12;
    objc_msgSend(v13, "setY:", v14);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rc2"));
    v16 = v15;
    -[CVACMALSData rawChannels](v5, "rawChannels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = v16;
    objc_msgSend(v17, "setZ:", v18);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rc3"));
    v20 = v19;
    -[CVACMALSData rawChannels](v5, "rawChannels");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = v20;
    objc_msgSend(v21, "setW:", v22);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cx"));
    v24 = v23;
    -[CVACMALSData colorComponents](v5, "colorComponents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setX:", v24);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cy"));
    v27 = v26;
    -[CVACMALSData colorComponents](v5, "colorComponents");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setY:", v27);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cz"));
    v30 = v29;
    -[CVACMALSData colorComponents](v5, "colorComponents");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setZ:", v30);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVACMALSData setTimestamp:](v5, "setTimestamp:");
    -[CVACMALSData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    -[CVACMALSData setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("g"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMALSData setGain:](v5, "setGain:", v32);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("e"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMALSData setIntegrationTime:](v5, "setIntegrationTime:", v33);

    -[CVACMALSData setVendorNumChannels:](v5, "setVendorNumChannels:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("vnc")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("vch"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMALSData setVendorRawChannels:](v5, "setVendorRawChannels:", v34);

    -[CVACMALSData setVendorStatus:](v5, "setVendorStatus:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("vstat")));
    -[CVACMALSData setVendorOrientation:](v5, "setVendorOrientation:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("vori")));
    -[CVACMALSData setVendorIntegrationTime:](v5, "setVendorIntegrationTime:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("vintt")));
    -[CVACMALSData setVendorReportInterval:](v5, "setVendorReportInterval:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("vrepi")));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("vlux"));
    -[CVACMALSData setVendorLux:](v5, "setVendorLux:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("vtemp"));
    -[CVACMALSData setVendorTemperature:](v5, "setVendorTemperature:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("vcct"));
    -[CVACMALSData setVendorCCT:](v5, "setVendorCCT:");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("vazo"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMALSData setVendorAZOffsets:](v5, "setVendorAZOffsets:", v35);

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
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  objc_msgSend(v16, "encodeInt:forKey:", -[CVACMALSData luxValue](self, "luxValue"), CFSTR("lux"));
  -[CVACMALSData rawChannels](self, "rawChannels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "x");
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("rc0"));

  -[CVACMALSData rawChannels](self, "rawChannels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "y");
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("rc1"));

  -[CVACMALSData rawChannels](self, "rawChannels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "z");
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("rc2"));

  -[CVACMALSData rawChannels](self, "rawChannels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "w");
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("rc3"));

  -[CVACMALSData colorComponents](self, "colorComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "x");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("cx"));

  -[CVACMALSData colorComponents](self, "colorComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "y");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("cy"));

  -[CVACMALSData colorComponents](self, "colorComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "z");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("cz"));

  -[CVACMALSData timestamp](self, "timestamp");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v16, "encodeInt64:forKey:", -[CVACMALSData syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_msgSend(v16, "encodeInt64:forKey:", -[CVACMALSData frameId](self, "frameId"), CFSTR("fi"));
  -[CVACMALSData gain](self, "gain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v12, CFSTR("g"));

  -[CVACMALSData integrationTime](self, "integrationTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("e"));

  objc_msgSend(v16, "encodeInt:forKey:", -[CVACMALSData vendorNumChannels](self, "vendorNumChannels"), CFSTR("vnc"));
  -[CVACMALSData vendorRawChannels](self, "vendorRawChannels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v14, CFSTR("vch"));

  objc_msgSend(v16, "encodeInt:forKey:", -[CVACMALSData vendorStatus](self, "vendorStatus"), CFSTR("vstat"));
  objc_msgSend(v16, "encodeInt:forKey:", -[CVACMALSData vendorOrientation](self, "vendorOrientation"), CFSTR("vori"));
  objc_msgSend(v16, "encodeInt:forKey:", -[CVACMALSData vendorIntegrationTime](self, "vendorIntegrationTime"), CFSTR("vintt"));
  objc_msgSend(v16, "encodeInt:forKey:", -[CVACMALSData vendorReportInterval](self, "vendorReportInterval"), CFSTR("vrepi"));
  -[CVACMALSData vendorLux](self, "vendorLux");
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("vlux"));
  -[CVACMALSData vendorTemperature](self, "vendorTemperature");
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("vtemp"));
  -[CVACMALSData vendorCCT](self, "vendorCCT");
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("vcct"));
  -[CVACMALSData vendorAZOffsets](self, "vendorAZOffsets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("vazo"));

  objc_autoreleasePoolPop(v4);
}

- (unsigned)luxValue
{
  return self->_luxValue;
}

- (void)setLuxValue:(unsigned int)a3
{
  self->_luxValue = a3;
}

- (CVACLMotionTypeVector4)rawChannels
{
  return self->_rawChannels;
}

- (void)setRawChannels:(id)a3
{
  objc_storeStrong((id *)&self->_rawChannels, a3);
}

- (CVACLMotionTypeDoubleVector3)colorComponents
{
  return self->_colorComponents;
}

- (void)setColorComponents:(id)a3
{
  objc_storeStrong((id *)&self->_colorComponents, a3);
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

- (NSNumber)gain
{
  return self->_gain;
}

- (void)setGain:(id)a3
{
  objc_storeStrong((id *)&self->_gain, a3);
}

- (NSNumber)integrationTime
{
  return self->_integrationTime;
}

- (void)setIntegrationTime:(id)a3
{
  objc_storeStrong((id *)&self->_integrationTime, a3);
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (unsigned)vendorNumChannels
{
  return self->_vendorNumChannels;
}

- (void)setVendorNumChannels:(unsigned int)a3
{
  self->_vendorNumChannels = a3;
}

- (NSArray)vendorRawChannels
{
  return self->_vendorRawChannels;
}

- (void)setVendorRawChannels:(id)a3
{
  objc_storeStrong((id *)&self->_vendorRawChannels, a3);
}

- (unsigned)vendorStatus
{
  return self->_vendorStatus;
}

- (void)setVendorStatus:(unsigned int)a3
{
  self->_vendorStatus = a3;
}

- (unsigned)vendorOrientation
{
  return self->_vendorOrientation;
}

- (void)setVendorOrientation:(unsigned __int8)a3
{
  self->_vendorOrientation = a3;
}

- (unsigned)vendorIntegrationTime
{
  return self->_vendorIntegrationTime;
}

- (void)setVendorIntegrationTime:(unsigned int)a3
{
  self->_vendorIntegrationTime = a3;
}

- (unsigned)vendorReportInterval
{
  return self->_vendorReportInterval;
}

- (void)setVendorReportInterval:(unsigned int)a3
{
  self->_vendorReportInterval = a3;
}

- (float)vendorLux
{
  return self->_vendorLux;
}

- (void)setVendorLux:(float)a3
{
  self->_vendorLux = a3;
}

- (float)vendorTemperature
{
  return self->_vendorTemperature;
}

- (void)setVendorTemperature:(float)a3
{
  self->_vendorTemperature = a3;
}

- (float)vendorCCT
{
  return self->_vendorCCT;
}

- (void)setVendorCCT:(float)a3
{
  self->_vendorCCT = a3;
}

- (NSArray)vendorAZOffsets
{
  return self->_vendorAZOffsets;
}

- (void)setVendorAZOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_vendorAZOffsets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorAZOffsets, 0);
  objc_storeStrong((id *)&self->_vendorRawChannels, 0);
  objc_storeStrong((id *)&self->_integrationTime, 0);
  objc_storeStrong((id *)&self->_gain, 0);
  objc_storeStrong((id *)&self->_colorComponents, 0);
  objc_storeStrong((id *)&self->_rawChannels, 0);
}

@end
