@implementation ARAccelerometerData

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("temperature"), self->_temperature);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("accelerationX"), self->_acceleration.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("accelerationY"), self->_acceleration.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("accelerationZ"), self->_acceleration.z);

}

- (ARAccelerometerData)initWithCoder:(id)a3
{
  id v4;
  ARAccelerometerData *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARAccelerometerData;
  v5 = -[ARAccelerometerData init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    -[ARAccelerometerData setTimestamp:](v5, "setTimestamp:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("temperature"));
    -[ARAccelerometerData setTemperature:](v5, "setTemperature:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accelerationX"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accelerationY"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accelerationZ"));
    -[ARAccelerometerData setAcceleration:](v5, "setAcceleration:", v7, v9, v10);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_acceleration.x);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_acceleration.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("z");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_acceleration.z);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("t");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("p");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_temperature);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ARAccelerometerData)initWithDictionary:(id)a3
{
  id v4;
  ARAccelerometerData *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARAccelerometerData;
  v5 = -[ARAccelerometerData init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_timestamp = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_temperature = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_acceleration.x = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_acceleration.y = v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("z"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_acceleration.z = v15;

  }
  return v5;
}

- (id)encodeToMetadataWrapper
{
  void *v3;
  double temperature;
  float x;
  void *v6;
  double v7;
  float y;
  void *v9;
  double v10;
  float z;
  void *v12;
  double v13;
  void *v14;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTimestamp:", self->_timestamp);
  temperature = self->_temperature;
  *(float *)&temperature = temperature;
  objc_msgSend(v3, "setTemperature:", temperature);
  x = self->_acceleration.x;
  objc_msgSend(v3, "acceleration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = x;
  objc_msgSend(v6, "setX:", v7);

  y = self->_acceleration.y;
  objc_msgSend(v3, "acceleration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = y;
  objc_msgSend(v9, "setY:", v10);

  z = self->_acceleration.z;
  objc_msgSend(v3, "acceleration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = z;
  objc_msgSend(v12, "setZ:", v13);

  objc_msgSend(MEMORY[0x1E0CFCB40], "encodeAccelerometerData:andAdditionalData:", v3, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (ARAccelerometerData)initWithMetadataWrapper:(id)a3
{
  void *v4;
  ARAccelerometerData *v5;

  objc_msgSend(MEMORY[0x1E0CFCB40], "decodeAccel:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ARAccelerometerData initWithAccelData:](self, "initWithAccelData:", v4);

  return v5;
}

- (ARAccelerometerData)initWithAccelData:(id)a3
{
  id v4;
  ARAccelerometerData *v5;
  double v6;
  float v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  ARAccelerometerData *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARAccelerometerData;
  v5 = -[ARAccelerometerData init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v6;
    objc_msgSend(v4, "temperature");
    v5->_temperature = v7;
    objc_msgSend(v4, "acceleration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "x");
    v5->_acceleration.x = v9;

    objc_msgSend(v4, "acceleration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "y");
    v5->_acceleration.y = v11;

    objc_msgSend(v4, "acceleration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "z");
    v5->_acceleration.z = v13;

    v14 = v5;
  }

  return v5;
}

- (void)appendToWriter:(id)a3
{
  id v4;
  double temperature;
  float x;
  void *v7;
  double v8;
  float y;
  void *v10;
  double v11;
  float z;
  void *v13;
  double v14;
  id v15;

  v4 = a3;
  v15 = (id)objc_opt_new();
  objc_msgSend(v15, "setTimestamp:", self->_timestamp);
  temperature = self->_temperature;
  *(float *)&temperature = temperature;
  objc_msgSend(v15, "setTemperature:", temperature);
  x = self->_acceleration.x;
  objc_msgSend(v15, "acceleration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = x;
  objc_msgSend(v7, "setX:", v8);

  y = self->_acceleration.y;
  objc_msgSend(v15, "acceleration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = y;
  objc_msgSend(v10, "setY:", v11);

  z = self->_acceleration.z;
  objc_msgSend(v15, "acceleration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = z;
  objc_msgSend(v13, "setZ:", v14);

  objc_msgSend(v4, "processAccelerometerData:andAdditionalData:", v15, 0);
}

+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CMTime v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1B5E2DDB0]();
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v21 = *MEMORY[0x1E0CA2E50];
  v22 = v8;
  v23 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "grabNextRawAccelData:location:", &v21, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAccelData:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
        objc_msgSend(v6, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v11);
  }

  *(_OWORD *)&v16.value = v21;
  v16.epoch = v22;
  *a4 = CMTimeGetSeconds(&v16);
  objc_autoreleasePoolPop(v7);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (result)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_timestamp;
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_temperature;
    v5 = *(_OWORD *)&self->_acceleration.x;
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_acceleration.z;
    *(_OWORD *)((char *)result + 24) = v5;
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (double *)v4;
    v6 = vabdd_f64(self->_timestamp, v5[1]) < 0.00000011920929
      && vabdd_f64(self->_acceleration.x, v5[3]) < 0.00000011920929
      && vabdd_f64(self->_acceleration.y, v5[4]) < 0.00000011920929
      && vabdd_f64(self->_acceleration.z, v5[5]) < 0.00000011920929
      && vabdd_f64(self->_temperature, v5[2]) < 0.00000011920929;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARAccelerometerData timestamp](self, "timestamp");
  objc_msgSend(v6, "appendFormat:", CFSTR(" timestamp=%f"), v7);
  -[ARAccelerometerData acceleration](self, "acceleration");
  v9 = v8;
  -[ARAccelerometerData acceleration](self, "acceleration");
  v11 = v10;
  -[ARAccelerometerData acceleration](self, "acceleration");
  objc_msgSend(v6, "appendFormat:", CFSTR(" acceleration=(%f, %f, %f)"), v9, v11, v12);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)acceleration
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_acceleration.x;
  y = self->_acceleration.y;
  z = self->_acceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setAcceleration:(id)a3
{
  self->_acceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  self->_temperature = a3;
}

@end
