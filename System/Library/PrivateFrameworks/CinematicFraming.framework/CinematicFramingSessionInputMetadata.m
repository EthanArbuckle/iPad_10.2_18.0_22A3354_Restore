@implementation CinematicFramingSessionInputMetadata

- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7 filteredFaceIDs:(id)a8 filteredBodyIDs:(id)a9 calibrationDistortionCoefficientsSupported:(BOOL)a10 calibrationValidMaxRadiusSupported:(BOOL)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  CinematicFramingSessionInputMetadata *v23;
  CinematicFramingSessionInputMetadata *v24;
  uint64_t v25;
  NSDictionary *calibrationDictionary;
  uint64_t v27;
  NSDictionary *v28;
  __int128 v29;
  NSString *portType;
  CinematicFramingSessionInputMetadata *v31;

  v19 = a3;
  v20 = a4;
  v21 = a8;
  v22 = a9;
  v23 = -[CinematicFramingSessionInputMetadata init](self, "init");
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_detectedObjectsInfo, a3);
    -[CinematicFramingSessionInputMetadata _parseDetectedObjectsInfoWithFilteredFaceIDs:filteredBodyIDs:](v24, "_parseDetectedObjectsInfoWithFilteredFaceIDs:filteredBodyIDs:", v21, v22);
    v24->_calibrationDistortionCoefficientsSupported = a10;
    v24->_calibrationValidMaxRadiusSupported = a11;
    if (v20)
    {
      -[CinematicFramingSessionInputMetadata _validateCalibrationDictionary:](v24, "_validateCalibrationDictionary:", v20);
      v25 = objc_claimAutoreleasedReturnValue();
      calibrationDictionary = v24->_calibrationDictionary;
      v24->_calibrationDictionary = (NSDictionary *)v25;

    }
    if (!v24->_calibrationDictionary)
    {
      if (a7 == 1906)
      {
        defaultCalibrationDictionaryForPictou();
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a7 != 1556)
        {
          v31 = 0;
          goto LABEL_12;
        }
        defaultCalibrationDictionaryForPennsylvania();
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v28 = v24->_calibrationDictionary;
      v24->_calibrationDictionary = (NSDictionary *)v27;

    }
    v29 = *(_OWORD *)&a5->var0;
    v24->_timestamp.epoch = a5->var3;
    *(_OWORD *)&v24->_timestamp.value = v29;
    v24->_aspectRatio = a6;
    v24->_sensorID = a7;
    v24->_additionalCameraRotation = 0.0;
    v24->_cameraOrientation = -1;
    portType = v24->_portType;
    v24->_portType = 0;

    *(_WORD *)&v24->_hasDeviceToCameraSpaceTransform = 256;
  }
  v31 = v24;
LABEL_12:

  return v31;
}

- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7 filteredFaceIDs:(id)a8 filteredBodyIDs:(id)a9
{
  uint64_t v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  v11 = *a5;
  LOWORD(v10) = 257;
  return -[CinematicFramingSessionInputMetadata initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:](self, "initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:", a3, a4, &v11, *(_QWORD *)&a7, a8, a9, v10);
}

- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7
{
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v9 = *a5;
  LOWORD(v8) = 257;
  return -[CinematicFramingSessionInputMetadata initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:](self, "initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:", a3, a4, &v9, *(_QWORD *)&a7, 0, 0, v8);
}

- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a5;
  return -[CinematicFramingSessionInputMetadata initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:](self, "initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:", a3, a4, &v7, 0);
}

- (CinematicFramingSessionInputMetadata)initWithCoder:(id)a3
{
  id v4;
  CinematicFramingSessionInputMetadata *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *bodyDetections;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  NSArray *faceDetections;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFDictionary *v19;
  float v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *calibrationDictionary;
  float v27;
  CMTime v29;

  v4 = a3;
  v5 = -[CinematicFramingSessionInputMetadata init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bodyDetections"));
    v9 = objc_claimAutoreleasedReturnValue();
    bodyDetections = v5->_bodyDetections;
    v5->_bodyDetections = (NSArray *)v9;

    if (!v5->_bodyDetections)
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("detections"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v5->_bodyDetections;
      v5->_bodyDetections = (NSArray *)v11;

    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("faceDetections"));
    v13 = objc_claimAutoreleasedReturnValue();
    faceDetections = v5->_faceDetections;
    v5->_faceDetections = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("timestamp"));
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CMTimeMakeFromDictionary(&v29, v19);
    v5->_timestamp = ($95D729B680665BEAEFA1D6FCA8238556)v29;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("aspectRatio"));
    v5->_aspectRatio = v20;
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("calibrationDataDictionary"));
    v25 = objc_claimAutoreleasedReturnValue();
    calibrationDictionary = v5->_calibrationDictionary;
    v5->_calibrationDictionary = (NSDictionary *)v25;

    v5->_sensorID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sensorID"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("additionalCameraRotation"));
    v5->_additionalCameraRotation = v27;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  double v7;
  double v8;
  $95D729B680665BEAEFA1D6FCA8238556 timestamp;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodyDetections, CFSTR("bodyDetections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceDetections, CFSTR("faceDetections"));
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  timestamp = self->_timestamp;
  v6 = CMTimeCopyAsDictionary((CMTime *)&timestamp, v5);
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("timestamp"));
  if (v6)
    CFRelease(v6);
  *(float *)&v7 = self->_aspectRatio;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("aspectRatio"), v7);
  objc_msgSend(v4, "encodeObject:forKey:", self->_calibrationDictionary, CFSTR("calibrationDataDictionary"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_sensorID, CFSTR("sensorID"));
  *(float *)&v8 = self->_additionalCameraRotation;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("additionalCameraRotation"), v8);

}

- (void)setGravityX:(float)a3 y:(float)a4 z:(float)a5
{
  self->_hasGravity = 1;
  self->_gravityX = a3;
  self->_gravityY = a4;
  self->_gravityZ = a5;
}

- (__n128)setDeviceToCameraSpaceTransform:(__n128)a3
{
  result[10].n128_u8[0] = 1;
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

- (void)setAdditionalCameraRotation:(float)a3
{
  self->_additionalCameraRotation = a3;
}

- (void)_parseDetectedObjectsInfoWithFilteredFaceIDs:(id)a3 filteredBodyIDs:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  Detection *v18;
  const __CFDictionary *v19;
  void *v20;
  int v21;
  NSArray *v22;
  NSArray *bodyDetections;
  NSArray *v24;
  NSArray *faceDetections;
  NSArray *v26;
  CinematicFramingSessionInputMetadata *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSDictionary *obj;
  uint64_t v32;
  NSArray *v33;
  uint64_t v34;
  id v35;
  NSArray *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  CGRect rect;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  v33 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = self;
  obj = self->_detectedObjectsInfo;
  if (obj)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v30 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v47;
      v28 = *MEMORY[0x1E0D064D0];
      v7 = *MEMORY[0x1E0D06D58];
      v8 = *MEMORY[0x1E0D064A0];
      v38 = *MEMORY[0x1E0D06498];
      v34 = *MEMORY[0x1E0D06460];
      v37 = *MEMORY[0x1E0D08498];
      v39 = v6;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v47 != v29)
            objc_enumerationMutation(obj);
          v32 = v9;
          v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v9);
          -[NSDictionary objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v10, v27);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v28);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v40 = v12;
          v13 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v43;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v43 != v15)
                  objc_enumerationMutation(v40);
                v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                v18 = objc_alloc_init(Detection);
                memset(&rect, 0, sizeof(rect));
                objc_msgSend(v17, "objectForKeyedSubscript:", v7);
                v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                CGRectMakeWithDictionaryRepresentation(v19, &rect);
                if (objc_msgSend(v10, "isEqualToString:", v8))
                {
                  objc_msgSend(v17, "objectForKeyedSubscript:", v37);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v6 && !objc_msgSend(v6, "containsObject:", v20))
                    goto LABEL_21;
                  v21 = 2 * objc_msgSend(v20, "intValue");
                  v22 = v36;
                  goto LABEL_20;
                }
                if (!objc_msgSend(v10, "isEqualToString:", v38))
                  goto LABEL_22;
                objc_msgSend(v17, "objectForKeyedSubscript:", v34);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v35 || objc_msgSend(v35, "containsObject:", v20))
                {
                  v21 = (2 * objc_msgSend(v20, "intValue")) | 1;
                  v22 = v33;
LABEL_20:
                  -[Detection setOid:](v18, "setOid:", v21);
                  -[Detection setBounds:](v18, "setBounds:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
                  -[NSArray addObject:](v22, "addObject:", v18);
                  v6 = v39;
                }
LABEL_21:

LABEL_22:
              }
              v14 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            }
            while (v14);
          }

          v9 = v32 + 1;
        }
        while (v32 + 1 != v30);
        v30 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v30);
    }
  }
  bodyDetections = v27->_bodyDetections;
  v27->_bodyDetections = v33;
  v24 = v33;

  faceDetections = v27->_faceDetections;
  v27->_faceDetections = v36;
  v26 = v36;

}

- (id)_validateCalibrationDictionary:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PixelSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_22:
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
LABEL_23:
    v14 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LensDistortionCenter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    fig_log_get_emitter();
    v17 = v3;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  if (self->_calibrationDistortionCoefficientsSupported)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LensDistortionCoefficients"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      fig_log_get_emitter();
      v17 = v3;
      LODWORD(v16) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("InverseLensDistortionCoefficients"), v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      fig_log_get_emitter();
      v17 = v3;
      LODWORD(v16) = 0;
      FigDebugAssert3();
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrix"), v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OriginalCameraIntrinsicMatrix"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_23;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrixReferenceDimensions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_23;
  }
  if (self->_calibrationValidMaxRadiusSupported)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DistortionCalibrationValidMaxRadiusInPixels"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("PixelSize"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("IntrinsicMatrix"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("IntrinsicMatrixReferenceDimensions"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("LensDistortionCenter"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("LensDistortionCoefficients"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("InverseLensDistortionCoefficients"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("DistortionCalibrationValidMaxRadiusInPixels"));

LABEL_20:
  return v14;
}

- (NSDictionary)detectedObjectsInfo
{
  return self->_detectedObjectsInfo;
}

- (NSArray)bodyDetections
{
  return self->_bodyDetections;
}

- (NSArray)faceDetections
{
  return self->_faceDetections;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (float)aspectRatio
{
  return self->_aspectRatio;
}

- (NSDictionary)calibrationDataDictionary
{
  return self->_calibrationDictionary;
}

- (int)sensorID
{
  return self->_sensorID;
}

- (BOOL)hasGravity
{
  return self->_hasGravity;
}

- (float)gravityX
{
  return self->_gravityX;
}

- (float)gravityY
{
  return self->_gravityY;
}

- (float)gravityZ
{
  return self->_gravityZ;
}

- (float)additionalCameraRotation
{
  return self->_additionalCameraRotation;
}

- (__n128)deviceToCameraSpaceTransform
{
  return a1[7];
}

- (BOOL)hasDeviceToCameraSpaceTransform
{
  return self->_hasDeviceToCameraSpaceTransform;
}

- (BOOL)frontCameraHas180DegreesRotation
{
  return self->_frontCameraHas180DegreesRotation;
}

- (void)setFrontCameraHas180DegreesRotation:(BOOL)a3
{
  self->_frontCameraHas180DegreesRotation = a3;
}

- (int)cameraOrientation
{
  return self->_cameraOrientation;
}

- (void)setCameraOrientation:(int)a3
{
  self->_cameraOrientation = a3;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (float)additionalInputCameraRotation
{
  return self->_additionalInputCameraRotation;
}

- (void)setAdditionalInputCameraRotation:(float)a3
{
  self->_additionalInputCameraRotation = a3;
}

- (float)additionalOutputCameraRotation
{
  return self->_additionalOutputCameraRotation;
}

- (void)setAdditionalOutputCameraRotation:(float)a3
{
  self->_additionalOutputCameraRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_calibrationDictionary, 0);
  objc_storeStrong((id *)&self->_faceDetections, 0);
  objc_storeStrong((id *)&self->_bodyDetections, 0);
  objc_storeStrong((id *)&self->_detectedObjectsInfo, 0);
}

@end
