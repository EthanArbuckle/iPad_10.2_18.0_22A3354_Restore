@implementation ARFaceAnchor

- (ARFaceAnchor)initWithIdentifier:(id)a3 faceTrackingData:(id)a4
{
  id v6;
  ARFaceAnchor *v7;
  ARFaceAnchor *v8;
  ARFaceAnchor *v9;
  id *p_trackingData;
  ARFaceGeometry *v11;
  ARFaceGeometry *geometry;
  NSDictionary *v13;
  uint64_t v14;
  unint64_t i;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  ARFaceAnchor *v24;
  NSError *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSError *trackingError;
  NSDictionary *blendShapeCoefficientsDictionary;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  ARFaceAnchor *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  if (ARFaceAnchorInitializeMaps(void)::onceToken != -1)
    dispatch_once(&ARFaceAnchorInitializeMaps(void)::onceToken, &__block_literal_global_238);
  if (!+[ARFaceTrackingTechnique isSupported](ARFaceTrackingTechnique, "isSupported")
    && !+[ARFaceTrackingInternalTechnique isSupported](ARFaceTrackingInternalTechnique, "isSupported"))
  {
    if (_ARLogGeneral(void)::onceToken != -1)
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_240);
    v21 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      v36 = 2048;
      v37 = self;
      _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Face tracking is not available.", buf, 0x16u);

    }
    goto LABEL_17;
  }
  if (!objc_msgSend(v6, "isValid"))
  {
LABEL_17:
    v24 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v6, "transform");
  v33.receiver = self;
  v33.super_class = (Class)ARFaceAnchor;
  v7 = -[ARAnchor initWithIdentifier:transform:](&v33, sel_initWithIdentifier_transform_, v32);
  v8 = v7;
  v9 = v7;
  if (v7)
  {
    -[ARFaceAnchor setIsTracked:](v7, "setIsTracked:", 1);
    p_trackingData = (id *)&v8->_trackingData;
    objc_storeStrong(p_trackingData, a4);
    v11 = -[ARFaceGeometry initWithFaceTrackingDataProtocol:]([ARFaceGeometry alloc], "initWithFaceTrackingDataProtocol:", *p_trackingData);
    geometry = v9->_geometry;
    v9->_geometry = v11;

    v13 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*p_trackingData, "blendShapeCoefficientsCount"));
    v14 = objc_msgSend(*p_trackingData, "blendShapeCoefficients");
    for (i = 0; objc_msgSend(*p_trackingData, "blendShapeCoefficientsCount") > i; ++i)
    {
      v16 = (void *)_indexToBlendShapeLocationMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        LODWORD(v19) = *(_DWORD *)(v14 + 4 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", v20, v18);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (NSError *)v6;
      v26 = (void *)MEMORY[0x1E0CB37E8];
      -[NSError tongueOut](v25, "tongueOut");
      objc_msgSend(v26, "numberWithFloat:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSError trackingError](v25, "trackingError");
      v28 = objc_claimAutoreleasedReturnValue();
      trackingError = v9->_trackingError;
      v9->_trackingError = (NSError *)v28;

    }
    else
    {
      v25 = v9->_trackingError;
      v9->_trackingError = 0;
      v27 = &unk_1E66CE068;
    }

    -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", v27, CFSTR("tongueOut"));
    blendShapeCoefficientsDictionary = v9->_blendShapeCoefficientsDictionary;
    v9->_blendShapeCoefficientsDictionary = v13;

  }
  self = v9;
  v24 = self;
LABEL_23:

  return v24;
}

- (ARFaceAnchor)initWithExistingFaceAnchor:(id)a3 tracked:(BOOL)a4 trackingError:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  ARFaceAnchor *v10;
  ARFaceAnchor *v11;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = -[ARFaceAnchor initWithAnchor:](self, "initWithAnchor:", v8);
  v11 = v10;
  if (v10)
  {
    -[ARFaceAnchor setIsTracked:](v10, "setIsTracked:", v6);
    objc_storeStrong((id *)&v11->_trackingError, a5);
  }

  return v11;
}

- (id)faceTrackingData
{
  return self->_trackingData;
}

- (id)copyWithTrackedState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)-[ARFaceAnchor copy](self, "copy");
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isTracked") != v3)
    objc_msgSend(v5, "setIsTracked:", v3);
  return v5;
}

- (NSDictionary)blendShapes
{
  return self->_blendShapeCoefficientsDictionary;
}

- (uint64_t)imageVertices
{
  return objc_msgSend(*(id *)(a1 + 200), "imageVertices");
}

- (ARFaceTrackingDataProtocol)trackingData
{
  return (ARFaceTrackingDataProtocol *)-[ARFaceTrackingDataProtocol trackingData](self->_trackingData, "trackingData");
}

+ (id)blendShapeMapping
{
  if (ARFaceAnchorInitializeMaps(void)::onceToken != -1)
    dispatch_once(&ARFaceAnchorInitializeMaps(void)::onceToken, &__block_literal_global_238);
  return (id)_blendShapeLocationToIndexMap;
}

+ (id)mirroredBlendShapeMapping
{
  if (+[ARFaceAnchor mirroredBlendShapeMapping]::onceToken != -1)
    dispatch_once(&+[ARFaceAnchor mirroredBlendShapeMapping]::onceToken, &__block_literal_global_105);
  return (id)+[ARFaceAnchor mirroredBlendShapeMapping]::mirroredBlendShapeMapping;
}

void __41__ARFaceAnchor_mirroredBlendShapeMapping__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[51];
  _QWORD v55[53];

  v55[51] = *MEMORY[0x1E0C80C00];
  +[ARFaceAnchor blendShapeMapping](ARFaceAnchor, "blendShapeMapping");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = CFSTR("browDown_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("browDown_R"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v53;
  v54[1] = CFSTR("browDown_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("browDown_L"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v52;
  v54[2] = CFSTR("browInnerUp");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v51;
  v54[3] = CFSTR("browOuterUp_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("browOuterUp_R"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v50;
  v54[4] = CFSTR("browOuterUp_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("browOuterUp_L"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v49;
  v54[5] = CFSTR("cheekPuff");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v48;
  v54[6] = CFSTR("cheekSquint_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("cheekSquint_R"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v47;
  v54[7] = CFSTR("cheekSquint_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("cheekSquint_L"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v46;
  v54[8] = CFSTR("eyeBlink_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeBlink_R"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v45;
  v54[9] = CFSTR("eyeBlink_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeBlink_L"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v44;
  v54[10] = CFSTR("eyeLookDown_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeLookDown_R"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v43;
  v54[11] = CFSTR("eyeLookDown_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeLookDown_L"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v42;
  v54[12] = CFSTR("eyeLookIn_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeLookIn_R"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v41;
  v54[13] = CFSTR("eyeLookIn_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeLookIn_L"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v40;
  v54[14] = CFSTR("eyeLookOut_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeLookOut_R"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[14] = v39;
  v54[15] = CFSTR("eyeLookOut_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeLookOut_L"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[15] = v38;
  v54[16] = CFSTR("eyeLookUp_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeLookUp_R"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[16] = v37;
  v54[17] = CFSTR("eyeLookUp_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeLookUp_L"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[17] = v36;
  v54[18] = CFSTR("eyeSquint_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeSquint_R"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[18] = v35;
  v54[19] = CFSTR("eyeSquint_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeSquint_L"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[19] = v34;
  v54[20] = CFSTR("eyeWide_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeWide_R"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[20] = v33;
  v54[21] = CFSTR("eyeWide_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("eyeWide_L"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55[21] = v32;
  v54[22] = CFSTR("jawForward");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[22] = v31;
  v54[23] = CFSTR("jawLeft");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("jawRight"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[23] = v30;
  v54[24] = CFSTR("jawOpen");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[24] = v29;
  v54[25] = CFSTR("jawRight");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("jawLeft"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[25] = v28;
  v54[26] = CFSTR("mouthClose");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[26] = v27;
  v54[27] = CFSTR("mouthDimple_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthDimple_R"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55[27] = v26;
  v54[28] = CFSTR("mouthDimple_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthDimple_L"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[28] = v25;
  v54[29] = CFSTR("mouthFrown_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthFrown_R"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[29] = v24;
  v54[30] = CFSTR("mouthFrown_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthFrown_L"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[30] = v23;
  v54[31] = CFSTR("mouthFunnel");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v55[31] = v22;
  v54[32] = CFSTR("mouthLeft");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthRight"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[32] = v21;
  v54[33] = CFSTR("mouthLowerDown_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthLowerDown_R"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[33] = v20;
  v54[34] = CFSTR("mouthLowerDown_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthLowerDown_L"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[34] = v19;
  v54[35] = CFSTR("mouthPress_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthPress_R"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55[35] = v18;
  v54[36] = CFSTR("mouthPress_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthPress_L"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[36] = v17;
  v54[37] = CFSTR("mouthPucker");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55[37] = v16;
  v54[38] = CFSTR("mouthRight");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthLeft"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[38] = v15;
  v54[39] = CFSTR("mouthRollLower");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[39] = v14;
  v54[40] = CFSTR("mouthRollUpper");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[40] = v13;
  v54[41] = CFSTR("mouthShrugLower");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[41] = v12;
  v54[42] = CFSTR("mouthShrugUpper");
  objc_msgSend(v0, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v55[42] = v1;
  v54[43] = CFSTR("mouthSmile_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthSmile_R"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v55[43] = v2;
  v54[44] = CFSTR("mouthSmile_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthSmile_L"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v55[44] = v3;
  v54[45] = CFSTR("mouthStretch_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthStretch_R"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v55[45] = v4;
  v54[46] = CFSTR("mouthStretch_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthStretch_L"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55[46] = v5;
  v54[47] = CFSTR("mouthUpperUp_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthUpperUp_R"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55[47] = v6;
  v54[48] = CFSTR("mouthUpperUp_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("mouthUpperUp_L"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55[48] = v7;
  v54[49] = CFSTR("noseSneer_L");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("noseSneer_R"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55[49] = v8;
  v54[50] = CFSTR("noseSneer_R");
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("noseSneer_L"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55[50] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 51);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)+[ARFaceAnchor mirroredBlendShapeMapping]::mirroredBlendShapeMapping;
  +[ARFaceAnchor mirroredBlendShapeMapping]::mirroredBlendShapeMapping = v10;

}

+ (id)blendShapeToMirroredBlendShapeMapping
{
  if (+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::onceToken != -1)
    dispatch_once(&+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::onceToken, &__block_literal_global_112_0);
  return (id)+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::blendShapeToMirroredBlendShapeMapping;
}

void __53__ARFaceAnchor_blendShapeToMirroredBlendShapeMapping__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  +[ARFaceAnchor blendShapeMapping](ARFaceAnchor, "blendShapeMapping");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[ARFaceAnchor mirroredBlendShapeMapping](ARFaceAnchor, "mirroredBlendShapeMapping");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = (void *)+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::blendShapeToMirroredBlendShapeMapping;
  +[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::blendShapeToMirroredBlendShapeMapping = (uint64_t)v1;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ARFaceAnchor_blendShapeToMirroredBlendShapeMapping__block_invoke_2;
  v5[3] = &unk_1E6675C08;
  v3 = v0;
  v6 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __53__ARFaceAnchor_blendShapeToMirroredBlendShapeMapping__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)+[ARFaceAnchor blendShapeToMirroredBlendShapeMapping]::blendShapeToMirroredBlendShapeMapping, "setObject:forKeyedSubscript:", v5, v6);

}

- (simd_float4x4)leftEyeTransform
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  simd_float4x4 result;

  -[ARFaceTrackingDataProtocol leftEyeTransform](self->_trackingData, "leftEyeTransform");
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  result.columns[0].i64[0] = v2;
  return result;
}

- (simd_float4x4)rightEyeTransform
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  simd_float4x4 result;

  -[ARFaceTrackingDataProtocol rightEyeTransform](self->_trackingData, "rightEyeTransform");
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  result.columns[0].i64[0] = v2;
  return result;
}

- (simd_float3)lookAtPoint
{
  simd_float3 result;

  -[ARFaceTrackingDataProtocol gazePoint](self->_trackingData, "gazePoint");
  return result;
}

- (uint64_t)gazePoint
{
  return objc_msgSend(*(id *)(a1 + 200), "gazePoint");
}

- (ARFaceAnchor)initWithAnchor:(id)a3
{
  id v4;
  ARFaceAnchor *v5;
  ARFaceAnchor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARFaceAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v8, sel_initWithAnchor_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_isTracked = *((_BYTE *)v4 + 184);
    objc_storeStrong((id *)&v5->_trackingData, *((id *)v4 + 25));
    objc_storeStrong((id *)&v6->_geometry, *((id *)v4 + 24));
    objc_storeStrong((id *)&v6->_blendShapeCoefficientsDictionary, *((id *)v4 + 22));
    objc_storeStrong((id *)&v6->_trackingError, *((id *)v4 + 26));
  }

  return v6;
}

- (NSString)debugDescription
{
  return (NSString *)&stru_1E6676798;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ARFaceAnchor;
  -[ARAnchor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_blendShapeCoefficientsDictionary, CFSTR("blendShapeCoefficientsDictionary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trackingData, CFSTR("trackingData"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTracked, CFSTR("isTracked"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trackingError, CFSTR("trackingError"));

}

- (ARFaceAnchor)initWithCoder:(id)a3
{
  id v4;
  ARFaceAnchor *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *blendShapeCoefficientsDictionary;
  uint64_t v13;
  ARFaceTrackingDataProtocol *trackingData;
  uint64_t v15;
  ARFaceGeometry *geometry;
  ARFaceGeometry *v17;
  ARFaceGeometry *v18;
  uint64_t v19;
  NSError *trackingError;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ARFaceAnchor;
  v5 = -[ARAnchor initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("blendShapeCoefficientsDictionary"));
    v11 = objc_claimAutoreleasedReturnValue();
    blendShapeCoefficientsDictionary = v5->_blendShapeCoefficientsDictionary;
    v5->_blendShapeCoefficientsDictionary = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingData"));
    v13 = objc_claimAutoreleasedReturnValue();
    trackingData = v5->_trackingData;
    v5->_trackingData = (ARFaceTrackingDataProtocol *)v13;

    v5->_isTracked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTracked"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geometry"));
    v15 = objc_claimAutoreleasedReturnValue();
    geometry = v5->_geometry;
    v5->_geometry = (ARFaceGeometry *)v15;

    if (!v5->_geometry)
    {
      v17 = -[ARFaceGeometry initWithFaceTrackingDataProtocol:]([ARFaceGeometry alloc], "initWithFaceTrackingDataProtocol:", v5->_trackingData);
      v18 = v5->_geometry;
      v5->_geometry = v17;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingError"));
    v19 = objc_claimAutoreleasedReturnValue();
    trackingError = v5->_trackingError;
    v5->_trackingError = (NSError *)v19;

  }
  return v5;
}

- (BOOL)isEqualToFaceAnchor:(id)a3
{
  id *v4;
  int v5;
  int v6;

  v4 = (id *)a3;
  if (objc_msgSend(v4[22], "isEqualToDictionary:", self->_blendShapeCoefficientsDictionary)
    && objc_msgSend(v4[25], "isEqual:", self->_trackingData)
    && objc_msgSend(v4[24], "isEqual:", self->_geometry))
  {
    v5 = objc_msgSend(v4, "isTracked");
    v6 = v5 ^ -[ARFaceAnchor isTracked](self, "isTracked") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (ARFaceGeometry)geometry
{
  return self->_geometry;
}

- (void)setTrackingData:(id)a3
{
  objc_storeStrong((id *)&self->_trackingData, a3);
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (NSError)trackingError
{
  return self->_trackingError;
}

- (void)setTrackingError:(id)a3
{
  objc_storeStrong((id *)&self->_trackingError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingError, 0);
  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_blendShapeCoefficientsDictionary, 0);
}

@end
