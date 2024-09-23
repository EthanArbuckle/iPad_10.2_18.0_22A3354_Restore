@implementation ARVisualLocalizationResultData

- (ARVisualLocalizationResultData)initWithVLLocalizationResult:(id)a3 errorCode:(int64_t)a4 debugInfo:(id)a5 heading:(double)a6 inputLocation:(id)a7 algorithmVersion:(int64_t)a8 undulation:(double)a9
{
  id v17;
  id v18;
  id v19;
  ARVisualLocalizationResultData *v20;
  ARVisualLocalizationResultData *v21;
  double v22;
  id v23;
  CLLocationCoordinate2D v24;
  void *v25;
  uint64_t v26;
  CLLocation *location;
  CLLocationDegrees latitude[2];
  int8x16_t v30;
  double v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a5;
  v19 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ARVisualLocalizationResultData;
  v20 = -[ARVisualLocalizationResultData init](&v32, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_localizationResult, a3);
    v21->_errorCode = a4;
    objc_storeStrong((id *)&v21->_debugInfo, a5);
    v21->_heading = a6;
    objc_storeStrong((id *)&v21->_inputLocation, a7);
    v21->_algorithmVersion = a8;
    v21->_undulation = a9;
    if (v21->_localizationResult)
    {
      if (v17)
      {
        objc_msgSend(v17, "location");
      }
      else
      {
        v34 = 0u;
        v35 = 0u;
        v33 = 0u;
      }
      ARECEFToLLA(&v30);
      *(int8x16_t *)latitude = v30;
      v22 = ARWGS84ToMSLAltitude(v31, v21->_undulation);
      v23 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      v24 = CLLocationCoordinate2DMake(latitude[0], latitude[1]);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v23, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v25, v24.latitude, v24.longitude, v22, 0.0, 0.0);
      location = v21->_location;
      v21->_location = (CLLocation *)v26;

    }
  }

  return v21;
}

- (double)timestamp
{
  double result;

  -[VLLocalizationResult inputTimestamp](self->_localizationResult, "inputTimestamp");
  return result;
}

- (BOOL)isSecure
{
  return -[ARLocationData isSecure](self->_inputLocation, "isSecure");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ARVisualLocalizationResultData heading](self, "heading");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("ARVisualLocalizationResultData_headingKey"));
  -[ARVisualLocalizationResultData localizationResult](self, "localizationResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("ARVisualLocalizationResultData_localizationResultKey"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[ARVisualLocalizationResultData errorCode](self, "errorCode"), CFSTR("ARVisualLocalizationResultData_errorCodeKey"));
  -[ARVisualLocalizationResultData debugInfo](self, "debugInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("ARVisualLocalizationResultData_debugInfoKey"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_inputLocation, CFSTR("ARVisualLocalizationResultData_inputLocationKey"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[ARVisualLocalizationResultData algorithmVersion](self, "algorithmVersion"), CFSTR("ARVisualLocalizationResultData_algorithmVersionKey"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("ARVisualLocalizationResultData_undulationKey"), self->_undulation);

}

- (ARVisualLocalizationResultData)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  ARVisualLocalizationResultData *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ARVisualLocalizationResultData_headingKey"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ARVisualLocalizationResultData_localizationResultKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ARVisualLocalizationResultData_errorCodeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ARVisualLocalizationResultData_debugInfoKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ARVisualLocalizationResultData_inputLocationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ARVisualLocalizationResultData_algorithmVersionKey"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ARVisualLocalizationResultData_undulationKey"));
  v13 = v12;

  v14 = -[ARVisualLocalizationResultData initWithVLLocalizationResult:errorCode:debugInfo:heading:inputLocation:algorithmVersion:undulation:](self, "initWithVLLocalizationResult:errorCode:debugInfo:heading:inputLocation:algorithmVersion:undulation:", v7, v8, v9, v10, v11, v6, v13);
  return v14;
}

- (VLLocalizationResult)localizationResult
{
  return self->_localizationResult;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (VLLocalizationDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)heading
{
  return self->_heading;
}

- (int64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (double)undulation
{
  return self->_undulation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_localizationResult, 0);
  objc_storeStrong((id *)&self->_inputLocation, 0);
}

@end
