@implementation ARLocationData

- (ARLocationData)initWithLocation:(id)a3
{
  id v4;
  ARLocationData *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARLocationData;
  v5 = -[ARLocationData init](&v11, sel_init);
  if (v5)
  {
    if (initWithLocation__onceToken != -1)
      dispatch_once(&initWithLocation__onceToken, &__block_literal_global_77);
    v6 = (double)mach_absolute_time();
    v7 = *(double *)&initWithLocation__machTimeFactor;
    objc_msgSend(v4, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceNow");
    v5->_timestamp = v9 + v6 * v7;

    v5->_secure = 1;
    -[ARLocationData setLocation:](v5, "setLocation:", v4);
  }

  return v5;
}

double __35__ARLocationData_initWithLocation___block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 * 0.000000001;
  initWithLocation__machTimeFactor = *(_QWORD *)&result;
  return result;
}

- (ARLocationData)initWithLocation:(id)a3 timestamp:(double)a4 secure:(BOOL)a5
{
  ARLocationData *result;

  result = -[ARLocationData initWithLocation:](self, "initWithLocation:", a3);
  if (result)
  {
    result->_timestamp = a4;
    result->_secure = a5;
  }
  return result;
}

- (void)setLocation:(id)a3
{
  id v4;
  CLLocation *v5;
  CLLocation *location;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  _OWORD v33[4];
  _OWORD v34[2];
  _BYTE buf[32];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (CLLocation *)objc_msgSend(v4, "copy");
  location = self->_location;
  self->_location = v5;

  objc_msgSend(v4, "altitudeWgs84");
  v32 = v7;
  if ((objc_msgSend(v4, "isAltitudeWgs84Available") & 1) != 0)
  {
    objc_msgSend(v4, "altitudeWgs84");
    v9 = v8;
    objc_msgSend(v4, "altitude");
    self->_undulation = v9 - v10;
  }
  else
  {
    self->_undulation = NAN;
    if (_ARLogTechnique_onceToken_14 != -1)
      dispatch_once(&_ARLogTechnique_onceToken_14, &__block_literal_global_180);
    v11 = (void *)_ARLogTechnique_logObj_14;
    if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_14, OS_LOG_TYPE_DEBUG))
    {
      v12 = v11;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "coordinate");
      v16 = v15;
      objc_msgSend(v4, "coordinate");
      *(_DWORD *)buf = 138544131;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2049;
      *(_QWORD *)&buf[24] = v16;
      LOWORD(v36) = 2049;
      *(_QWORD *)((char *)&v36 + 2) = v17;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Getting fallback undulation for location: %{private}.06f, %{private}.06f", buf, 0x2Au);

    }
    objc_msgSend(v4, "coordinate");
    v20 = ARGetFallbackUndulationValue(v18, v19);
    self->_undulation = v20;
    *(double *)&v21 = ARMSLToWGS84Altitude(*(double *)&v32, v20);
    v32 = v21;
  }
  objc_msgSend(v4, "coordinate");
  v31 = v22;
  objc_msgSend(v4, "coordinate");
  *(_QWORD *)&v23 = v31;
  *((_QWORD *)&v23 + 1) = v24;
  *(_OWORD *)self->_locationLLA = v23;
  *(_OWORD *)&self->_locationLLA[16] = v32;
  v33[2] = v23;
  v33[3] = v32;
  ARLLAToECEF(v34);
  v25 = v34[1];
  *(_OWORD *)self->_locationECEF = v34[0];
  *(_OWORD *)&self->_locationECEF[16] = v25;
  v26 = *(_OWORD *)&self->_locationLLA[16];
  v33[0] = *(_OWORD *)self->_locationLLA;
  v33[1] = v26;
  ARAnchorToECEFTransform(v33, buf);
  v27 = v39;
  *(_OWORD *)&self[1]._locationLLA[16] = v38;
  *(_OWORD *)self[1]._locationECEF = v27;
  v28 = v41;
  *(_OWORD *)&self[1]._locationECEF[16] = v40;
  *(_OWORD *)&self[2].super.isa = v28;
  v29 = *(_OWORD *)&buf[16];
  *(_OWORD *)&self[1].super.isa = *(_OWORD *)buf;
  *(_OWORD *)&self[1]._timestamp = v29;
  v30 = v37;
  *(_OWORD *)&self[1]._undulation = v36;
  *(_OWORD *)self[1]._locationLLA = v30;

}

- (BOOL)isUndulationValid
{
  return 1;
}

- (BOOL)isAltitudeValid
{
  return +[ARLocationData isAltitudeValid:](ARLocationData, "isAltitudeValid:", self->_location);
}

- (double)enuFromLocation:(void *)a1@<X2>
{
  double result;
  __int128 v4;
  _OWORD v5[2];

  if (a1)
    objc_msgSend(a1, "locationECEF");
  ARECEFToENU(v5);
  result = *(double *)v5;
  v4 = v5[1];
  *a2 = v5[0];
  a2[1] = v4;
  return result;
}

+ (BOOL)isAltitudeValid:(id)a3
{
  id v3;
  double v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "altitude");
  objc_msgSend(v3, "verticalAccuracy");
  v5 = v4 >= 0.0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[ARLocationData timestamp](self, "timestamp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, CFSTR("location"));

}

- (ARLocationData)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  ARLocationData *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ARLocationData initWithLocation:](self, "initWithLocation:", v7);
  -[ARLocationData setTimestamp:](v8, "setTimestamp:", v6);
  v8->_secure = 0;

  return v8;
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
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_location, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("timestamp");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[ARLocationData timestamp](self, "timestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("location");
  v10[0] = v6;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ARLocationData)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ARLocationData *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E6676798);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), &stru_1E6676798);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 1);
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ARLocationData initWithLocation:](self, "initWithLocation:", v12);
  -[ARLocationData setTimestamp:](v13, "setTimestamp:", v7);
  v13->_secure = 0;

  return v13;
}

- (id)encodeToMetadataWrapper
{
  return (id)objc_msgSend(MEMORY[0x1E0CFCB40], "encodeCoreLocationData:timestamp:andAdditionalData:", self->_location, 0, self->_timestamp);
}

- (ARLocationData)initWithMetadataWrapper:(id)a3
{
  void *v4;
  ARLocationData *v5;
  double v7;

  v7 = 0.0;
  objc_msgSend(MEMORY[0x1E0CFCB40], "decodeCLLocation:timestamp:", a3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ARLocationData initWithLocation:](self, "initWithLocation:", v4);
  -[ARLocationData setTimestamp:](v5, "setTimestamp:", v7);
  v5->_secure = 0;

  return v5;
}

- (void)appendToWriter:(id)a3
{
  objc_msgSend(a3, "processCoreLocationData:timestamp:andAdditionalData:", self->_location, 0, self->_timestamp);
}

+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime time;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1B5E2DDB0]();
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v25 = *MEMORY[0x1E0CA2E50];
  v26 = v8;
  v27 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  v24 = 0;
  objc_msgSend(v5, "grabNextCLLocation:location:timestamps:", &v25, 0, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;
  v11 = objc_msgSend(v9, "count");
  if (v11 == objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:timestamp:secure:", v13, 0, v16);
        objc_msgSend(v6, "addObject:", v17);

        ++v12;
      }
      while (objc_msgSend(v9, "count") > v12);
    }
    *(_OWORD *)&time.value = v25;
    time.epoch = v26;
    *a4 = CMTimeGetSeconds(&time);

    objc_autoreleasePoolPop(v7);
    v18 = v6;
  }
  else
  {
    _ARLogGeneral_30();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v21;
      _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_ERROR, "%{public}@ error: Couldn't get timestamps for location data.", (uint8_t *)&time, 0xCu);

    }
    v22 = v6;

    objc_autoreleasePoolPop(v7);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ARLocationData *v4;

  v4 = -[ARLocationData initWithLocation:](+[ARLocationData allocWithZone:](ARLocationData, "allocWithZone:", a3), "initWithLocation:", self->_location);
  -[ARLocationData timestamp](self, "timestamp");
  -[ARLocationData setTimestamp:](v4, "setTimestamp:");
  v4->_secure = self->_secure;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLLocation **v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (CLLocation **)v4;
    if (self->_location == v5[3])
    {
      v9 = 1;
    }
    else
    {
      -[ARLocationData timestamp](self, "timestamp");
      v7 = v6;
      objc_msgSend(v5, "timestamp");
      v9 = vabdd_f64(v7, v8) < 2.22044605e-16;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARLocationData timestamp](self, "timestamp");
  objc_msgSend(v6, "appendFormat:", CFSTR(" timestamp=%f"), v7);
  -[CLLocation coordinate](self->_location, "coordinate");
  v9 = v8;
  -[CLLocation coordinate](self->_location, "coordinate");
  objc_msgSend(v6, "appendFormat:", CFSTR(" coordinates=(%f, %f)"), v9, v10);
  -[CLLocation altitude](self->_location, "altitude");
  objc_msgSend(v6, "appendFormat:", CFSTR(" altitude=%.3f m"), v11);
  -[CLLocation horizontalAccuracy](self->_location, "horizontalAccuracy");
  objc_msgSend(v6, "appendFormat:", CFSTR(" horizontalAccuracy=%.1f m"), v12);
  -[CLLocation verticalAccuracy](self->_location, "verticalAccuracy");
  objc_msgSend(v6, "appendFormat:", CFSTR(" verticalAccuracy=%.1fm"), v13);
  -[CLLocation altitudeWgs84](self->_location, "altitudeWgs84");
  objc_msgSend(v6, "appendFormat:", CFSTR(" altitudeWgs84=%.3fm"), v14);
  if (-[CLLocation isAltitudeWgs84Available](self->_location, "isAltitudeWgs84Available"))
    v15 = CFSTR("yes");
  else
    v15 = CFSTR("no");
  objc_msgSend(v6, "appendFormat:", CFSTR(" wgs84Available=%@"), v15);
  -[CLLocation horizontalAccuracy](self->_location, "horizontalAccuracy");
  objc_msgSend(v6, "appendFormat:", CFSTR(" accuracy=%.02fm"), v16);
  if (-[CLLocation isCoordinateFused](self->_location, "isCoordinateFused"))
    v17 = CFSTR("yes");
  else
    v17 = CFSTR("no");
  objc_msgSend(v6, "appendFormat:", CFSTR(" fused=%@"), v17);
  if (self->_secure)
    v18 = CFSTR("yes");
  else
    v18 = CFSTR("no");
  objc_msgSend(v6, "appendFormat:", CFSTR(" isSecure=%@"), v18);
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

- (CLLocation)location
{
  return self->_location;
}

- (double)undulation
{
  return self->_undulation;
}

- (__n128)locationLLA
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 64);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)locationECEF
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 80);
  v3 = *(_OWORD *)(a1 + 96);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (__n128)ecefFromlocation
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 144);
  v6 = *(_OWORD *)(a1 + 160);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
