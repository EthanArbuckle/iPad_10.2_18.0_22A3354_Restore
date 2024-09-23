@implementation ARDepthSensorSettings

- (ARDepthSensorSettings)initWithVideoFormat:(id)a3
{
  ARDepthSensorSettings *v3;
  int64_t v4;
  __CFString *v5;
  __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSString *timeOfFlightProjectorMode;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARDepthSensorSettings *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)ARDepthSensorSettings;
  v3 = -[ARImageSensorSettings initWithVideoFormat:](&v15, sel_initWithVideoFormat_, a3);
  if (v3)
  {
    v4 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.jasper.timeOfFlightProjectorMode"));
    v5 = CFSTR("ARTimeOfFlightProjectorModeNone");
    v6 = v5;
    v7 = v4 - 1;
    v8 = v5;
    if (v7 <= 5)
    {
      v8 = v5;
      if (((0x27u >> v7) & 1) != 0)
      {
        v8 = *off_1E66721D8[v7];

      }
    }
    if (-[__CFString isEqualToString:](v8, "isEqualToString:", v6))
    {
      v9 = CFSTR("ARTimeOfFlightProjectorModeNormalShortHybrid");

      _ARLogGeneral_0();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v12;
        v18 = 2048;
        v19 = v3;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Invalid default for ARJasperTimeOfFlightProjectorMode, falling back to %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v9 = v8;
    }
    timeOfFlightProjectorMode = v3->_timeOfFlightProjectorMode;
    v3->_timeOfFlightProjectorMode = &v9->isa;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)ARDepthSensorSettings;
  -[ARImageSensorSettings description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("TimeOfFlightProjectorMode: %@\n"), self->_timeOfFlightProjectorMode);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARDepthSensorSettings;
  if (-[ARImageSensorSettings isEqual:](&v8, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "timeOfFlightProjectorMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", self->_timeOfFlightProjectorMode);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARDepthSensorSettings;
  v5 = -[ARImageSensorSettings copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_timeOfFlightProjectorMode, "copyWithZone:", a3);
  v7 = (void *)v5[9];
  v5[9] = v6;

  return v5;
}

- (NSString)timeOfFlightProjectorMode
{
  return self->_timeOfFlightProjectorMode;
}

- (void)setTimeOfFlightProjectorMode:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfFlightProjectorMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfFlightProjectorMode, 0);
}

@end
