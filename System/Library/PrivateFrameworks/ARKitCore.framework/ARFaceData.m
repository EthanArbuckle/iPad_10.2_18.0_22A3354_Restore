@implementation ARFaceData

- (ARFaceData)init
{
  ARFaceData *v2;
  ARFaceData *v3;
  NSArray *detectedFaces;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARFaceData;
  v2 = -[ARFaceData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    detectedFaces = v2->_detectedFaces;
    v2->_detectedFaces = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (ARFaceData)initWithMetadataObjects:(id)a3 mirroredVideoInput:(BOOL)a4 stripDetectionData:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  ARHWFaceDetection *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  ARHWFaceDetection *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  int v27;
  double v28;
  double v29;
  ARHWFaceDetection *v30;
  void *v31;
  int v32;
  ARHWFaceDetection *v33;
  ARHWFaceDetection *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  ARFaceData *v41;
  ARFaceData *v42;
  ARFaceData *v44;
  _BOOL4 v45;
  _BOOL4 v46;
  void *v47;
  id obj;
  objc_super v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v46 = a5;
  v5 = a4;
  v44 = self;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  v45 = v5;
  if (!v7)
  {
    v9 = 0;
    goto LABEL_28;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v55;
  v11 = *MEMORY[0x1E0C8AA38];
  v12 = *MEMORY[0x1E0C8AA68];
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v55 != v10)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v13);
      objc_msgSend(v14, "type", v44);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v11);

      if (v16)
      {
        v17 = v14;
        -[ARHWFaceDetection bounds](v17, "bounds");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v26 = -[ARHWFaceDetection faceID](v17, "faceID");
        v27 = -[ARHWFaceDetection hasRollAngle](v17, "hasRollAngle");
        v28 = 0.0;
        if (v27)
          -[ARHWFaceDetection rollAngle](v17, "rollAngle", 0.0);
        if (v5)
          v29 = 180.0 - v28;
        else
          v29 = v28;
        if (v5)
          v21 = 1.0 - v21 - v25;
        v30 = objc_alloc_init(ARHWFaceDetection);
        -[ARHWFaceDetection setID:](v30, "setID:", v26);
        -[ARHWFaceDetection setRollAngleInDegrees:](v30, "setRollAngleInDegrees:", v29);
        -[ARHWFaceDetection setBoundingBox:](v30, "setBoundingBox:", v19, v21, v23, v25);
        -[ARHWFaceDetection setDetectionOrientation:](v30, "setDetectionOrientation:", 3);
        if (v17)
        {
          -[ARHWFaceDetection time](v17, "time");
        }
        else
        {
          v52 = 0uLL;
          v53 = 0;
        }
        v50 = v52;
        v51 = v53;
        -[ARHWFaceDetection setTime:](v30, "setTime:", &v50);
        objc_msgSend(v47, "addObject:", v30);
      }
      else
      {
        objc_msgSend(v14, "type");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqual:", v12);

        if (!v32)
          goto LABEL_22;
        v17 = v14;
        -[ARHWFaceDetection payload](v17, "payload");
        v33 = (ARHWFaceDetection *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v46)
        {
          ARFilterFaceTrackingPayload(v33);
          v35 = objc_claimAutoreleasedReturnValue();

          v30 = v17;
          v17 = v34;
          v9 = (ARHWFaceDetection *)v35;
          v5 = v45;
        }
        else
        {
          v30 = v9;
          v9 = v33;
        }
      }

LABEL_22:
      ++v13;
    }
    while (v8 != v13);
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    v8 = v36;
  }
  while (v36);
LABEL_28:

  if (!objc_msgSend(v47, "count"))
  {
    -[ARHWFaceDetection objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCCF0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "count"))
    {
      v38 = 0;
      do
      {
        objc_msgSend(v37, "objectAtIndexedSubscript:", v38, v44);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[ARHWFaceDetection faceDetectionFromDictionary:](ARHWFaceDetection, "faceDetectionFromDictionary:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
          objc_msgSend(v47, "addObject:", v40);

        ++v38;
      }
      while (objc_msgSend(v37, "count") > v38);
    }

    LOBYTE(v5) = v45;
  }
  v49.receiver = v44;
  v49.super_class = (Class)ARFaceData;
  v41 = -[ARFaceData init](&v49, sel_init, v44);
  v42 = v41;
  if (v41)
  {
    objc_storeStrong((id *)&v41->_detectedFaces, v47);
    objc_storeStrong((id *)&v42->_faceMeshPayload, v9);
    v42->_mirrored = v5;
  }

  return v42;
}

- (ARFaceData)initWithCoder:(id)a3
{
  id v4;
  ARFaceData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ARFaceData;
  v5 = -[ARFaceData init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("AVTFaceDetection"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("detectedFaces"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_13;
            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v12)
            continue;
          break;
        }
      }

      -[ARFaceData setDetectedFaces:](v5, "setDetectedFaces:", v10);
    }
LABEL_13:
    ARApprovedDecoderClasses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("faceMeshPayload"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mirrored")))
      v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mirrored"));
    else
      v17 = 1;
    v5->_mirrored = v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ARFaceData setFaceMeshPayload:](v5, "setFaceMeshPayload:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *detectedFaces;
  id v5;

  detectedFaces = self->_detectedFaces;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", detectedFaces, CFSTR("detectedFaces"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_faceMeshPayload, CFSTR("faceMeshPayload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_mirrored, CFSTR("mirrored"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  NSDictionary *faceMeshPayload;
  void *v7;
  NSArray *detectedFaces;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    faceMeshPayload = self->_faceMeshPayload;
    objc_msgSend(v5, "faceMeshPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDictionary isEqual:](faceMeshPayload, "isEqual:", v7))
    {
      detectedFaces = self->_detectedFaces;
      objc_msgSend(v5, "detectedFaces");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray isEqual:](detectedFaces, "isEqual:", v9))
        v10 = self->_mirrored == v5[8];
      else
        v10 = 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
  objc_storeStrong((id *)&self->_detectedFaces, a3);
}

- (NSDictionary)faceMeshPayload
{
  return self->_faceMeshPayload;
}

- (void)setFaceMeshPayload:(id)a3
{
  objc_storeStrong((id *)&self->_faceMeshPayload, a3);
}

- (BOOL)isMirrored
{
  return self->_mirrored;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceMeshPayload, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
}

@end
