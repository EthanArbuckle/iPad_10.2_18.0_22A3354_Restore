@implementation ARGyroscopeData

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("rotationX"), self->_rotationRate.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("rotationY"), self->_rotationRate.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("rotationZ"), self->_rotationRate.z);

}

- (ARGyroscopeData)initWithCoder:(id)a3
{
  id v4;
  ARGyroscopeData *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARGyroscopeData;
  v5 = -[ARGyroscopeData init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    -[ARGyroscopeData setTimestamp:](v5, "setTimestamp:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rotationX"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rotationY"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rotationZ"));
    -[ARGyroscopeData setRotationRate:](v5, "setRotationRate:", v7, v9, v10);
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
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rotationRate.x);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rotationRate.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("z");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rotationRate.z);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("t");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ARGyroscopeData)initWithDictionary:(id)a3
{
  id v4;
  ARGyroscopeData *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARGyroscopeData;
  v5 = -[ARGyroscopeData init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_timestamp = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_rotationRate.x = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("y"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_rotationRate.y = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("z"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_rotationRate.z = v13;

  }
  return v5;
}

- (id)encodeToMetadataWrapper
{
  void *v3;
  float x;
  void *v5;
  double v6;
  float y;
  void *v8;
  double v9;
  float z;
  void *v11;
  double v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTimestamp:", self->_timestamp);
  x = self->_rotationRate.x;
  objc_msgSend(v3, "rotationRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = x;
  objc_msgSend(v5, "setX:", v6);

  y = self->_rotationRate.y;
  objc_msgSend(v3, "rotationRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = y;
  objc_msgSend(v8, "setY:", v9);

  z = self->_rotationRate.z;
  objc_msgSend(v3, "rotationRate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = z;
  objc_msgSend(v11, "setZ:", v12);

  objc_msgSend(MEMORY[0x1E0CFCB40], "encodeGyroscopeData:andAdditionalData:", v3, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (ARGyroscopeData)initWithMetadataWrapper:(id)a3
{
  void *v4;
  ARGyroscopeData *v5;

  objc_msgSend(MEMORY[0x1E0CFCB40], "decodeGyro:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ARGyroscopeData initWithGyroData:](self, "initWithGyroData:", v4);

  return v5;
}

- (ARGyroscopeData)initWithGyroData:(id)a3
{
  id v4;
  ARGyroscopeData *v5;
  double v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARGyroscopeData;
  v5 = -[ARGyroscopeData init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v6;
    objc_msgSend(v4, "rotationRate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "x");
    v5->_rotationRate.x = v8;

    objc_msgSend(v4, "rotationRate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "y");
    v5->_rotationRate.y = v10;

    objc_msgSend(v4, "rotationRate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "z");
    v5->_rotationRate.z = v12;

  }
  return v5;
}

- (void)appendToWriter:(id)a3
{
  id v4;
  float x;
  void *v6;
  double v7;
  float y;
  void *v9;
  double v10;
  float z;
  void *v12;
  double v13;
  id v14;

  v4 = a3;
  v14 = (id)objc_opt_new();
  objc_msgSend(v14, "setTimestamp:", self->_timestamp);
  x = self->_rotationRate.x;
  objc_msgSend(v14, "rotationRate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = x;
  objc_msgSend(v6, "setX:", v7);

  y = self->_rotationRate.y;
  objc_msgSend(v14, "rotationRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = y;
  objc_msgSend(v9, "setY:", v10);

  z = self->_rotationRate.z;
  objc_msgSend(v14, "rotationRate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = z;
  objc_msgSend(v12, "setZ:", v13);

  objc_msgSend(v4, "processGyroscopeData:andAdditionalData:", v14, 0);
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
  objc_msgSend(v5, "grabNextRawGyroData:location:", &v21, 0);
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
        v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGyroData:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
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
    v5 = *(_OWORD *)&self->_rotationRate.x;
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_rotationRate.z;
    *((_OWORD *)result + 1) = v5;
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
    v6 = vabdd_f64(self->_timestamp, v5[1]) < 2.22044605e-16
      && vabdd_f64(self->_rotationRate.x, v5[2]) < 0.00000011920929
      && vabdd_f64(self->_rotationRate.y, v5[3]) < 0.00000011920929
      && vabdd_f64(self->_rotationRate.z, v5[4]) < 0.00000011920929;

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

  -[ARGyroscopeData timestamp](self, "timestamp");
  objc_msgSend(v6, "appendFormat:", CFSTR(" timestamp=%f"), v7);
  -[ARGyroscopeData rotationRate](self, "rotationRate");
  v9 = v8;
  -[ARGyroscopeData rotationRate](self, "rotationRate");
  v11 = v10;
  -[ARGyroscopeData rotationRate](self, "rotationRate");
  objc_msgSend(v6, "appendFormat:", CFSTR(" rotationRate=(%f, %f, %f)"), v9, v11, v12);
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

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_rotationRate.x;
  y = self->_rotationRate.y;
  z = self->_rotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setRotationRate:(id)a3
{
  self->_rotationRate = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

@end
