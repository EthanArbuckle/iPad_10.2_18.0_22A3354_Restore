@implementation DeskCamSessionInputMetadata

- (DeskCamSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 cameraCalibrationData:(id)a4 cameraOrientation:(int)a5 timestamp:(id *)a6 aspectRatio:(float)a7 sensorID:(int)a8 gravity:
{
  __int128 v8;
  id v15;
  id v16;
  DeskCamSessionInputMetadata *v17;
  DeskCamSessionInputMetadata *v18;
  NSDictionary *v19;
  NSDictionary *cameraCalibrationDictionary;
  NSDictionary *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v25;

  v25 = v8;
  v15 = a3;
  v16 = a4;
  v17 = -[DeskCamSessionInputMetadata init](self, "init");
  v18 = v17;
  if (v17)
  {
    -[DeskCamSessionInputMetadata _parseDetectedObjectsInfo:](v17, "_parseDetectedObjectsInfo:", v15);
    if (v16
      && (-[DeskCamSessionInputMetadata _createCameraCalibrationDictionary:](v18, "_createCameraCalibrationDictionary:", v16), (v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      cameraCalibrationDictionary = v18->_cameraCalibrationDictionary;
      v18->_cameraCalibrationDictionary = v19;
      v21 = v19;

    }
    else
    {
      if (a8 == 1906)
        defaultCalibrationDictionaryForPictou();
      else
        defaultCalibrationDictionaryForPennsylvania();
      v22 = objc_claimAutoreleasedReturnValue();
      v21 = v18->_cameraCalibrationDictionary;
      v18->_cameraCalibrationDictionary = (NSDictionary *)v22;
    }

    v18->_cameraOrientation = a5;
    v23 = *(_OWORD *)&a6->var0;
    *(_QWORD *)&v18->_timestamp.flags = a6->var3;
    *(_OWORD *)(&v18->_cameraOrientation + 1) = v23;
    *((float *)&v18->_timestamp.epoch + 1) = a7;
    LODWORD(v18->_aspectRatio) = a8;
    *(_OWORD *)&v18->_anon_44[8] = v25;
  }

  return v18;
}

- (DeskCamSessionInputMetadata)initWithCoder:(id)a3
{
  id v4;
  DeskCamSessionInputMetadata *v5;
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
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *cameraCalibrationDictionary;
  uint64_t v27;
  int v28;
  __int128 v29;
  int v30;
  int v32;
  __int128 v33;
  CMTime v34;

  v4 = a3;
  v5 = -[DeskCamSessionInputMetadata init](self, "init");
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

    CMTimeMakeFromDictionary(&v34, v19);
    *(CMTime *)(&v5->_cameraOrientation + 1) = v34;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("aspectRatio"));
    HIDWORD(v5->_timestamp.epoch) = v20;
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("cameraCalibrationDictionary"));
    v25 = objc_claimAutoreleasedReturnValue();
    cameraCalibrationDictionary = v5->_cameraCalibrationDictionary;
    v5->_cameraCalibrationDictionary = (NSDictionary *)v25;

    v5->_cameraOrientation = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cameraOrientation"));
    LODWORD(v5->_aspectRatio) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sensorID"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("gravityX"));
    *(_QWORD *)&v33 = v27;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("gravityY"));
    v32 = v28;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("gravityZ"));
    v29 = v33;
    DWORD1(v29) = v32;
    DWORD2(v29) = v30;
    *(_OWORD *)&v5->_anon_44[8] = v29;

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
  double v9;
  double v10;
  CMTime v11;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodyDetections, CFSTR("bodyDetections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceDetections, CFSTR("faceDetections"));
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *(_OWORD *)&v11.value = *(_OWORD *)(&self->_cameraOrientation + 1);
  v11.epoch = *(_QWORD *)&self->_timestamp.flags;
  v6 = CMTimeCopyAsDictionary(&v11, v5);
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("timestamp"));
  if (v6)
    CFRelease(v6);
  LODWORD(v7) = HIDWORD(self->_timestamp.epoch);
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("aspectRatio"), v7);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cameraCalibrationDictionary, CFSTR("cameraCalibrationDictionary"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_cameraOrientation, CFSTR("cameraOrientation"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_aspectRatio), CFSTR("sensorID"));
  LODWORD(v8) = *(_DWORD *)&self->_anon_44[8];
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("gravityX"), v8);
  LODWORD(v9) = *(_DWORD *)self->_gravity;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("gravityY"), v9);
  LODWORD(v10) = *(_DWORD *)&self->_gravity[4];
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("gravityZ"), v10);

}

- (void)_parseDetectedObjectsInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  Detection *v16;
  const __CFDictionary *v17;
  void *v18;
  int v19;
  int v20;
  NSArray *v21;
  void *v22;
  int v23;
  NSArray *bodyDetections;
  NSArray *v25;
  NSArray *faceDetections;
  DeskCamSessionInputMetadata *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  NSArray *v38;
  id v39;
  CGRect rect;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v27 = self;
    v28 = v4;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v4;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (!v31)
      goto LABEL_21;
    v30 = *(_QWORD *)v46;
    v29 = *MEMORY[0x1E0D064D0];
    v5 = *MEMORY[0x1E0D06D58];
    v6 = *MEMORY[0x1E0D064A0];
    v37 = *MEMORY[0x1E0D06498];
    v34 = *MEMORY[0x1E0D06460];
    v36 = *MEMORY[0x1E0D08498];
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v46 != v30)
          objc_enumerationMutation(obj);
        v33 = v7;
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
        objc_msgSend(obj, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = v10;
        v11 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v42 != v13)
                objc_enumerationMutation(v39);
              v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              v16 = objc_alloc_init(Detection);
              memset(&rect, 0, sizeof(rect));
              objc_msgSend(v15, "objectForKeyedSubscript:", v5);
              v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
              CGRectMakeWithDictionaryRepresentation(v17, &rect);
              if (objc_msgSend(v8, "isEqualToString:", v6))
              {
                objc_msgSend(v15, "objectForKeyedSubscript:", v36);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "intValue");

                v20 = 2 * v19;
                v21 = v38;
              }
              else
              {
                if (!objc_msgSend(v8, "isEqualToString:", v37))
                  goto LABEL_17;
                objc_msgSend(v15, "objectForKeyedSubscript:", v34);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "intValue");

                v20 = (2 * v23) | 1;
                v21 = v35;
              }
              -[Detection setOid:](v16, "setOid:", v20);
              -[Detection setBounds:](v16, "setBounds:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
              -[NSArray addObject:](v21, "addObject:", v16);
LABEL_17:

            }
            v12 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v12);
        }

        v7 = v33 + 1;
      }
      while (v33 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (!v31)
      {
LABEL_21:

        self = v27;
        v4 = v28;
        break;
      }
    }
  }
  bodyDetections = self->_bodyDetections;
  self->_bodyDetections = v35;
  v25 = v35;

  faceDetections = self->_faceDetections;
  self->_faceDetections = v38;

}

- (id)_createCameraCalibrationDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PixelSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LensDistortionCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LensDistortionCoefficients"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InverseLensDistortionCoefficients"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_17:
    v9 = 0;
LABEL_18:
    v10 = 0;
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrix"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OriginalCameraIntrinsicMatrix"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_18;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrixReferenceDimensions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_19;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DistortionCalibrationValidMaxRadiusInPixels"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_20:
    v12 = 0;
    goto LABEL_12;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("PixelSize"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("IntrinsicMatrix"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("IntrinsicMatrixReferenceDimensions"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, CFSTR("LensDistortionCenter"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("LensDistortionCoefficients"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("InverseLensDistortionCoefficients"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("DistortionCalibrationValidMaxRadiusInPixels"));
LABEL_12:

  return v12;
}

- (NSArray)bodyDetections
{
  return self->_bodyDetections;
}

- (NSArray)faceDetections
{
  return self->_faceDetections;
}

- (NSDictionary)cameraCalibrationDictionary
{
  return self->_cameraCalibrationDictionary;
}

- (int)cameraOrientation
{
  return self->_cameraOrientation;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  retstr->var3 = *(int64_t *)((char *)&self[2].var0 + 4);
  return self;
}

- (float)aspectRatio
{
  return *((float *)&self->_timestamp.epoch + 1);
}

- (int)sensorID
{
  return LODWORD(self->_aspectRatio);
}

- (__n128)gravity
{
  return a1[5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraCalibrationDictionary, 0);
  objc_storeStrong((id *)&self->_faceDetections, 0);
  objc_storeStrong((id *)&self->_bodyDetections, 0);
}

@end
