@implementation CVAPRDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EF60 != -1)
    dispatch_once(&qword_254A6EF60, &unk_24CA36338);
  return (id)qword_254A6EF58;
}

- (void)addTimes
{
  double v3;
  unint64_t v4;
  unint64_t v5;

  mach_get_times();
  if (dword_254A6EF6C)
  {
    v3 = *(double *)&qword_254A6EF70;
  }
  else
  {
    mach_timebase_info((mach_timebase_info_t)&dword_254A6EF68);
    LODWORD(v4) = dword_254A6EF68;
    LODWORD(v5) = dword_254A6EF6C;
    v3 = (double)v4 / (double)v5 / 1000000000.0;
    qword_254A6EF70 = *(_QWORD *)&v3;
  }
  -[CVAPRDevice setMach_continuous_time:](self, "setMach_continuous_time:", v3 * (double)0, 0, 0);
  -[CVAPRDevice setUtc_time:](self, "setUtc_time:", (double)0 / 1000000000.0 + (double)0);
  -[CVAPRDevice setTimestamp:](self, "setTimestamp:", CACurrentMediaTime());
}

- (CVAPRDevice)init
{
  CVAPRDevice *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CVAPRDevice;
  v2 = -[CVAPRDevice init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CVAPRDevice setRange:](v2, "setRange:", v3);

    v4 = (void *)objc_opt_new();
    -[CVAPRDevice setAzimuth:](v2, "setAzimuth:", v4);

    v5 = (void *)objc_opt_new();
    -[CVAPRDevice setElevation:](v2, "setElevation:", v5);

    -[CVAPRDevice addTimes](v2, "addTimes");
  }
  return v2;
}

- (CVAPRDevice)initWithCoder:(id)a3
{
  id v4;
  CVAPRDevice *v5;
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
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  v5 = -[CVAPRDevice init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    -[CVAPRDevice setReferenceFrame:](v5, "setReferenceFrame:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reff")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rngm"));
    v8 = v7;
    -[CVAPRDevice range](v5, "range");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMeasurement:", v8);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rngu"));
    v11 = v10;
    -[CVAPRDevice range](v5, "range");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUncertainty:", v11);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("azmm"));
    v14 = v13;
    -[CVAPRDevice azimuth](v5, "azimuth");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMeasurement:", v14);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("azmu"));
    v17 = v16;
    -[CVAPRDevice azimuth](v5, "azimuth");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUncertainty:", v17);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("elvm"));
    v20 = v19;
    -[CVAPRDevice elevation](v5, "elevation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMeasurement:", v20);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("elvu"));
    v23 = v22;
    -[CVAPRDevice elevation](v5, "elevation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUncertainty:", v23);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("uuid"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAPRDevice setUUID:](v5, "setUUID:", v25);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sid"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAPRDevice setSessionID:](v5, "setSessionID:", v26);

    -[CVAPRDevice setMeasurementNumber:](v5, "setMeasurementNumber:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mesn")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mest"));
    -[CVAPRDevice setMeasurementTimestamp:](v5, "setMeasurementTimestamp:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVAPRDevice setTimestamp:](v5, "setTimestamp:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mct"));
    -[CVAPRDevice setMach_continuous_time:](v5, "setMach_continuous_time:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ut"));
    -[CVAPRDevice setUtc_time:](v5, "setUtc_time:");
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
  id v13;

  v13 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  objc_msgSend(v13, "encodeInteger:forKey:", -[CVAPRDevice referenceFrame](self, "referenceFrame"), CFSTR("reff"));
  -[CVAPRDevice range](self, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "measurement");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("rngm"));

  -[CVAPRDevice range](self, "range");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uncertainty");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("rngu"));

  -[CVAPRDevice azimuth](self, "azimuth");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "measurement");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("azmm"));

  -[CVAPRDevice azimuth](self, "azimuth");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uncertainty");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("azmu"));

  -[CVAPRDevice elevation](self, "elevation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "measurement");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("elvm"));

  -[CVAPRDevice elevation](self, "elevation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uncertainty");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("elvu"));

  -[CVAPRDevice UUID](self, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("uuid"));

  -[CVAPRDevice sessionID](self, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("sid"));

  objc_msgSend(v13, "encodeInteger:forKey:", -[CVAPRDevice measurementNumber](self, "measurementNumber"), CFSTR("mesn"));
  -[CVAPRDevice measurementTimestamp](self, "measurementTimestamp");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("mest"));
  -[CVAPRDevice timestamp](self, "timestamp");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("t"));
  -[CVAPRDevice mach_continuous_time](self, "mach_continuous_time");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("mct"));
  -[CVAPRDevice utc_time](self, "utc_time");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("ut"));
  objc_autoreleasePoolPop(v4);

}

- (int64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int64_t)a3
{
  self->_referenceFrame = a3;
}

- (CVAPRRangeMeasurement)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
  objc_storeStrong((id *)&self->_range, a3);
}

- (CVAPRAngleMeasurement)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(id)a3
{
  objc_storeStrong((id *)&self->_azimuth, a3);
}

- (CVAPRAngleMeasurement)elevation
{
  return self->_elevation;
}

- (void)setElevation:(id)a3
{
  objc_storeStrong((id *)&self->_elevation, a3);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (int64_t)measurementNumber
{
  return self->_measurementNumber;
}

- (void)setMeasurementNumber:(int64_t)a3
{
  self->_measurementNumber = a3;
}

- (double)measurementTimestamp
{
  return self->_measurementTimestamp;
}

- (void)setMeasurementTimestamp:(double)a3
{
  self->_measurementTimestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)mach_continuous_time
{
  return self->_mach_continuous_time;
}

- (void)setMach_continuous_time:(double)a3
{
  self->_mach_continuous_time = a3;
}

- (double)utc_time
{
  return self->_utc_time;
}

- (void)setUtc_time:(double)a3
{
  self->_utc_time = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_elevation, 0);
  objc_storeStrong((id *)&self->_azimuth, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end
