@implementation ARFaceTrackingTechnique

- (ARFaceTrackingTechnique)init
{
  return -[ARFaceTrackingTechnique initWithMaximumNumberOfTrackedFaces:](self, "initWithMaximumNumberOfTrackedFaces:", 1);
}

- (ARFaceTrackingTechnique)initWithMaximumNumberOfTrackedFaces:(int64_t)a3
{
  ARFaceTrackingTechnique *v4;
  ARFaceTrackingTechnique *v5;
  uint64_t v6;
  NSUUID *singleUserAnchorIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingTechnique;
  v4 = -[ARImageBasedTechnique init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isFaceTracked = 0;
    v4->_maximumNumberOfTrackedFaces = a3;
    v6 = objc_opt_new();
    singleUserAnchorIdentifier = v5->_singleUserAnchorIdentifier;
    v5->_singleUserAnchorIdentifier = (NSUUID *)v6;

  }
  return v5;
}

+ (BOOL)isSupported
{
  if (+[ARFaceTrackingTechnique isSupported]::onceToken != -1)
    dispatch_once(&+[ARFaceTrackingTechnique isSupported]::onceToken, &__block_literal_global_80);
  return +[ARFaceTrackingTechnique isSupported]::supported;
}

uint64_t __38__ARFaceTrackingTechnique_isSupported__block_invoke()
{
  uint64_t result;

  result = ARPearlCameraSupported();
  +[ARFaceTrackingTechnique isSupported]::supported = result;
  if ((result & 1) == 0)
  {
    result = ARRGBFaceTrackingEnabled();
    if ((_DWORD)result)
    {
      result = ARRGBFaceTrackingEnabled();
      +[ARFaceTrackingTechnique isSupported]::supported = result;
    }
  }
  return result;
}

- (unint64_t)requiredSensorDataTypes
{
  return 49;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  ARFaceTrackingData *v24;
  void *v25;
  ARFaceTrackingData *v26;
  void *v27;
  void *v28;
  id v29;
  void *v31;
  _QWORD v32[5];
  id v33;
  char v34;
  objc_super v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = v4;
    goto LABEL_13;
  }
  v35.receiver = self;
  v35.super_class = (Class)ARFaceTrackingTechnique;
  v5 = -[ARImageBasedTechnique processData:](&v35, sel_processData_, v4);
  v6 = v4;
  v31 = (void *)objc_opt_new();
  objc_msgSend(v6, "faceData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceMeshPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)MEMORY[0x1E0CFCD88];
  if (!v8)
  {

LABEL_7:
    objc_msgSend(v6, "timestamp");
    kdebug_trace();
    goto LABEL_8;
  }
  objc_msgSend(v6, "faceData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "faceMeshPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 0;

  if (v13)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v6, "faceData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isMirrored");
  v17 = objc_msgSend(v6, "isMirrored");

  objc_msgSend(v6, "faceData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "faceMeshPayload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v16 ^ v17;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __39__ARFaceTrackingTechnique_processData___block_invoke;
  v32[3] = &unk_1E6674F10;
  v32[4] = self;
  v34 = v21;
  v22 = v31;
  v33 = v22;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v32);

  if (-[ARFaceTrackingTechnique maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces") == 1)
  {
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v22, "removeAllObjects");
      v24 = [ARFaceTrackingData alloc];
      objc_msgSend(v23, "trackingData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[ARFaceTrackingData initWithTrackingData:transformToMirrored:anchorIdentifier:](v24, "initWithTrackingData:transformToMirrored:anchorIdentifier:", v25, v21, self->_singleUserAnchorIdentifier);

      objc_msgSend(v22, "addObject:", v26);
    }

  }
  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "setTrackedFaces:", v22);
  v36[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v28);

  v29 = v6;
LABEL_13:

  return v4;
}

void __39__ARFaceTrackingTechnique_processData___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  ARFaceTrackingData *v15;
  int v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  const __CFString *v22;
  unint64_t v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  _BYTE v27[22];
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
LABEL_5:
    _ARLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v27 = 138543874;
      *(_QWORD *)&v27[4] = v13;
      *(_WORD *)&v27[12] = 2048;
      *(_QWORD *)&v27[14] = v14;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tracking anchor with ID = %@", v27, 0x20u);

    }
    v15 = -[ARFaceTrackingData initWithTrackingData:transformToMirrored:anchorIdentifier:]([ARFaceTrackingData alloc], "initWithTrackingData:transformToMirrored:anchorIdentifier:", v6, *(unsigned __int8 *)(a1 + 48), v8);
    v16 = objc_msgSend(*(id *)(a1 + 32), "isFaceTracked");
    if (v16 != -[ARFaceTrackingData isValid](v15, "isValid"))
    {
      if (_ARLogTechnique(void)::onceToken != -1)
        dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_50_1);
      v17 = (id)_ARLogTechnique(void)::logObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        v21 = -[ARFaceTrackingData isValid](v15, "isValid");
        v22 = CFSTR("NO");
        *(_DWORD *)v27 = 138543874;
        *(_QWORD *)&v27[4] = v19;
        if (v21)
          v22 = CFSTR("YES");
        *(_WORD *)&v27[12] = 2048;
        *(_QWORD *)&v27[14] = v20;
        v28 = 2112;
        v29 = (void *)v22;
        _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Face is being tracked: %@", v27, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "setIsFaceTracked:", -[ARFaceTrackingData isValid](v15, "isValid"));
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v15, *(_OWORD *)v27);
    v23 = objc_msgSend(*(id *)(a1 + 40), "count");
    *a4 = v23 >= objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfTrackedFaces");

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    *(_DWORD *)v27 = 0;
    *(_DWORD *)v27 = objc_msgSend(v9, "intValue", *(_QWORD *)v27);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithData:", v10);
    v8 = objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  _ARLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v27 = 138543618;
    *(_QWORD *)&v27[4] = v25;
    *(_WORD *)&v27[12] = 2048;
    *(_QWORD *)&v27[14] = v26;
    _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Encountered invalid face ID", v27, 0x16u);

  }
LABEL_16:

}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (_QWORD)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingTechnique;
  if (-[ARTechnique isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[ARFaceTrackingTechnique maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces");
    v7 = v6 == objc_msgSend(v5, "maximumNumberOfTrackedFaces");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (BOOL)isFaceTracked
{
  return self->_isFaceTracked;
}

- (void)setIsFaceTracked:(BOOL)a3
{
  self->_isFaceTracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleUserAnchorIdentifier, 0);
}

@end
