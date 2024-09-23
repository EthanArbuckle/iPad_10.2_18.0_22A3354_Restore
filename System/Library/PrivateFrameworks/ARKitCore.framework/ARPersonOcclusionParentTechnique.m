@implementation ARPersonOcclusionParentTechnique

- (ARPersonOcclusionParentTechnique)initWithTechniques:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  ARPersonOcclusionParentTechnique *v17;
  ARPersonOcclusionParentTechnique *v18;
  ARTechniqueForwardingStrategy *depthTechniqueProcessingStrategy;
  uint64_t v20;
  NSHashTable *personDetectionTechniques;
  objc_super v23;
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARPersonOcclusionParentTechnique *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_54) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (_ARLogTechnique_onceToken_9 != -1)
      dispatch_once(&_ARLogTechnique_onceToken_9, &__block_literal_global_117);
    v8 = (void *)_ARLogTechnique_logObj_9;
    if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_9, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v11;
      v27 = 2048;
      v28 = self;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: This parent technique is designed to contain one of the following person detection techniques: %@", buf, 0x20u);

    }
    v17 = 0;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)ARPersonOcclusionParentTechnique;
    v18 = -[ARParentTechnique initWithTechniques:delegate:](&v23, sel_initWithTechniques_delegate_, v6, v7);
    if (v18)
    {
      v18->_shouldSkipFramesWhenBusy = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.personocclusion.skipFrameWhenBusy"));
      depthTechniqueProcessingStrategy = v18->_depthTechniqueProcessingStrategy;
      v18->_depthTechniqueProcessingStrategy = 0;

      v18->_detectedPerson = 1;
      v18->_lastDetectedPersonTimeStamp = 0.0;
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 5);
      personDetectionTechniques = v18->_personDetectionTechniques;
      v18->_personDetectionTechniques = (NSHashTable *)v20;

      -[ARPersonOcclusionParentTechnique updatePersonDetectionTechniques](v18, "updatePersonDetectionTechniques");
    }
    self = v18;
    v17 = self;
  }

  return v17;
}

uint64_t __64__ARPersonOcclusionParentTechnique_initWithTechniques_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_placeholderDepthBuffer);
  self->_placeholderDepthBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)ARPersonOcclusionParentTechnique;
  -[ARPersonOcclusionParentTechnique dealloc](&v3, sel_dealloc);
}

- (void)setOptimizationStrategy:(int64_t)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int64_t optimizationStrategy;
  int v8;
  void *v9;
  __int16 v10;
  ARPersonOcclusionParentTechnique *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_optimizationStrategy = a3;
  _ARLogGeneral_19();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    optimizationStrategy = self->_optimizationStrategy;
    v8 = 138543874;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    v12 = 2048;
    v13 = optimizationStrategy;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _optimizationStrategy = %ld", (uint8_t *)&v8, 0x20u);

  }
  -[ARPersonOcclusionParentTechnique updatePrimaryPersonDetectionTechnique](self, "updatePrimaryPersonDetectionTechnique");
}

- (void)setTechniques:(id)a3
{
  id v4;
  void *v5;
  ARMLDepthDataSourceProvider *v6;
  ARMLDepthDataSourceProvider *depthTechnique;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARPersonOcclusionParentTechnique;
  v4 = a3;
  -[ARParentTechnique setTechniques:](&v8, sel_setTechniques_, v4);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_11_0, v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARTechnique techniqueMatchingPredicate:inArray:](ARTechnique, "techniqueMatchingPredicate:inArray:", v5, v4);
  v6 = (ARMLDepthDataSourceProvider *)objc_claimAutoreleasedReturnValue();

  depthTechnique = self->_depthTechnique;
  self->_depthTechnique = v6;

  -[ARPersonOcclusionParentTechnique updatePrimaryPersonDetectionTechnique](self, "updatePrimaryPersonDetectionTechnique");
  -[ARPersonOcclusionParentTechnique updatePersonDetectionTechniques](self, "updatePersonDetectionTechniques");

}

uint64_t __50__ARPersonOcclusionParentTechnique_setTechniques___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)techniquesToRunWithForwardedDepth:(BOOL)a3
{
  void *v4;
  _BOOL4 v6;
  void *v7;
  objc_super v8;

  if (self->_detectedPerson || !self->_optimizationStrategy)
  {
    v8.receiver = self;
    v8.super_class = (Class)ARPersonOcclusionParentTechnique;
    -[ARParentTechnique techniques](&v8, sel_techniques, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a3;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", self->_primaryPersonDetectionTechnique, 0);
    v4 = v7;
    if (v6 && self->_depthTechnique)
      objc_msgSend(v7, "addObject:");
  }
  return v4;
}

- (void)reconfigureFrom:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ARPersonOcclusionParentTechnique;
  -[ARParentTechnique reconfigureFrom:](&v7, sel_reconfigureFrom_, v4);
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[ARPersonOcclusionParentTechnique setOptimizationStrategy:](self, "setOptimizationStrategy:", objc_msgSend(v5, "optimizationStrategy"));
    objc_msgSend(v5, "depthTechniqueProcessingStrategy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ARPersonOcclusionParentTechnique setDepthTechniqueProcessingStrategy:](self, "setDepthTechniqueProcessingStrategy:", v6);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARPersonOcclusionParentTechnique;
  if (-[ARParentTechnique isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[ARPersonOcclusionParentTechnique optimizationStrategy](self, "optimizationStrategy");
    if (v6 == objc_msgSend(v5, "optimizationStrategy"))
    {
      -[ARPersonOcclusionParentTechnique depthTechniqueProcessingStrategy](self, "depthTechniqueProcessingStrategy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "depthTechniqueProcessingStrategy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        v11 = 1;
      }
      else
      {
        -[ARPersonOcclusionParentTechnique depthTechniqueProcessingStrategy](self, "depthTechniqueProcessingStrategy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "depthTechniqueProcessingStrategy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)processData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char isKindOfClass;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ARParentTechnique techniques](self, "techniques", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "isBusy") & 1) != 0)
        {
          LODWORD(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((_DWORD)v6 && (isKindOfClass & 1) == 0 && self->_shouldSkipFramesWhenBusy)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "timestamp");
      kdebug_trace();
    }
    v11 = v4;
  }
  else
  {
    -[ARPersonOcclusionParentTechnique depthTechniqueProcessingStrategy](self, "depthTechniqueProcessingStrategy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[ARPersonOcclusionParentTechnique depthTechniqueProcessingStrategy](self, "depthTechniqueProcessingStrategy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "shouldProcessData:", v4);

    }
    else
    {
      v14 = 0;
    }

    -[ARPersonOcclusionParentTechnique techniquesToRunWithForwardedDepth:](self, "techniquesToRunWithForwardedDepth:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARParentTechnique processData:onTechniques:](self, "processData:onTechniques:", v4, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  -[ARPersonOcclusionParentTechnique depthTechniqueProcessingStrategy](self, "depthTechniqueProcessingStrategy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ARPersonOcclusionParentTechnique depthTechniqueProcessingStrategy](self, "depthTechniqueProcessingStrategy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldRequestResultDataAtTimestamp:context:", v10, a3);

  }
  else
  {
    v8 = 0;
  }

  -[ARPersonOcclusionParentTechnique techniquesToRunWithForwardedDepth:](self, "techniquesToRunWithForwardedDepth:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARParentTechnique requestResultDataAtTimestamp:context:onTechniques:](self, "requestResultDataAtTimestamp:context:onTechniques:", v10, v9, a3);

}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  ARTechnique *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  double v18;
  uint64_t v19;
  void *i;
  void *v21;
  __CVBuffer **p_placeholderDepthBuffer;
  ARPlaceholderMLDepthData *v23;
  ARPlaceholderMLDepthData *v24;
  uint64_t v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double lastDetectedPersonTimeStamp;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  objc_super v40;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  ARPersonOcclusionParentTechnique *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = (ARTechnique *)a3;
  v11 = a4;
  v12 = a6;
  -[ARPersonOcclusionParentTechnique depthTechniqueProcessingStrategy](self, "depthTechniqueProcessingStrategy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ARPersonOcclusionParentTechnique depthTechniqueProcessingStrategy](self, "depthTechniqueProcessingStrategy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldRequestResultDataAtTimestamp:context:", v12, a5);

  }
  else
  {
    v15 = 0;
  }

  -[ARPersonOcclusionParentTechnique techniquesToRunWithForwardedDepth:](self, "techniquesToRunWithForwardedDepth:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSHashTable containsObject:](self->_personDetectionTechniques, "containsObject:", v10))
  {
    v41.receiver = self;
    v41.super_class = (Class)ARPersonOcclusionParentTechnique;
    -[ARParentTechnique technique:didOutputResultData:timestamp:context:onTechniques:](&v41, sel_technique_didOutputResultData_timestamp_context_onTechniques_, v10, v11, v12, v16, a5);
    goto LABEL_49;
  }
  if (self->_primaryPersonDetectionTechnique == v10)
  {
    if (self->_depthTechnique)
    {
      if (self->_optimizationStrategy)
      {
        if (!self->_detectedPerson)
        {
          p_placeholderDepthBuffer = &self->_placeholderDepthBuffer;
          if (self->_placeholderDepthBuffer
            || (CVPixelBufferCreate(0, 1uLL, 1uLL, 0x66646570u, 0, &self->_placeholderDepthBuffer),
                *p_placeholderDepthBuffer))
          {
            v23 = -[ARMLDepthData initWithTimestamp:depthBuffer:source:]([ARPlaceholderMLDepthData alloc], "initWithTimestamp:depthBuffer:source:", *p_placeholderDepthBuffer, -[ARMLDepthDataSourceProvider depthDataSource](self->_depthTechnique, "depthDataSource"), a5);
            if (v23)
            {
              v24 = v23;
              objc_msgSend(v11, "arrayByAddingObject:", v23);
              v25 = objc_claimAutoreleasedReturnValue();

              v11 = (id)v25;
            }
          }
        }
      }
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)ARPersonOcclusionParentTechnique;
  -[ARParentTechnique technique:didOutputResultData:timestamp:context:onTechniques:](&v40, sel_technique_didOutputResultData_timestamp_context_onTechniques_, v10, v11, v12, v16, a5);
  v11 = v11;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v17 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, buf, 16);
  v18 = 0.0;
  if (!v17)
    goto LABEL_35;
  v19 = *(_QWORD *)v43;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v43 != v19)
        objc_enumerationMutation(v11);
      v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v21;
        objc_msgSend(v17, "timestamp");
        v18 = v26;
        objc_msgSend(v17, "detectedObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v27, "count") != 0;

LABEL_34:
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v21;
        objc_msgSend(v17, "timestamp");
        v18 = v28;
        LODWORD(v17) = objc_msgSend(v17, "hasSegmentedPeople");
        goto LABEL_34;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v21;
        objc_msgSend(v17, "timestamp");
        v18 = v29;
        objc_msgSend(v17, "rawDetectionResult");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          LODWORD(v17) = 1;
        }
        else
        {
          objc_msgSend(v17, "alignedDetectionResult");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            LODWORD(v17) = 1;
          }
          else
          {
            objc_msgSend(v17, "alignedDetectionResult");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v17) = v32 != 0;

          }
        }

        goto LABEL_34;
      }
    }
    v17 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, buf, 16);
    if (v17)
      continue;
    break;
  }
LABEL_35:

  lastDetectedPersonTimeStamp = self->_lastDetectedPersonTimeStamp;
  if (lastDetectedPersonTimeStamp == 0.0)
  {
    self->_lastDetectedPersonTimeStamp = v18;
    lastDetectedPersonTimeStamp = v18;
  }
  if ((_DWORD)v17)
  {
    if (!self->_detectedPerson)
    {
      _ARLogGeneral_19();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = v36;
        v48 = 2048;
        v49 = self;
        _os_log_impl(&dword_1B3A68000, v34, OS_LOG_TYPE_INFO, "%{public}@ <%p>: detected a person when there were none", buf, 0x16u);

      }
    }
    self->_detectedPerson = 1;
    self->_lastDetectedPersonTimeStamp = v18;
  }
  else if (v18 - lastDetectedPersonTimeStamp > 0.5)
  {
    if (self->_detectedPerson)
    {
      _ARLogGeneral_19();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = (objc_class *)objc_opt_class();
        NSStringFromClass(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v39;
        v48 = 2048;
        v49 = self;
        v50 = 2048;
        v51 = 0x3FE0000000000000;
        _os_log_impl(&dword_1B3A68000, v37, OS_LOG_TYPE_INFO, "%{public}@ <%p>: detected no person for %f seconds", buf, 0x20u);

      }
    }
    self->_detectedPerson = 0;
  }
LABEL_49:

}

- (void)updatePersonDetectionTechniques
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id obj;
  ARPersonOcclusionParentTechnique *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[NSHashTable removeAllObjects](self->_personDetectionTechniques, "removeAllObjects");
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self;
  -[ARParentTechnique techniques](self, "techniques");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", objc_opt_class()))
        {
          -[NSHashTable addObject:](v19->_personDetectionTechniques, "addObject:", v11);
        }
        else
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v12 = v6;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v21;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v21 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v11, "techniqueOfClass:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v17)
                {
                  -[NSHashTable addObject:](v19->_personDetectionTechniques, "addObject:", v11);
                  goto LABEL_18;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v14)
                continue;
              break;
            }
          }
LABEL_18:

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

}

- (void)updatePrimaryPersonDetectionTechnique
{
  int64_t optimizationStrategy;
  void *v4;
  char v5;
  id v6;

  optimizationStrategy = self->_optimizationStrategy;
  if (optimizationStrategy == 1 || optimizationStrategy == 2)
  {
    v4 = (void *)objc_opt_class();
    if (v4)
    {
      -[ARParentTechnique techniques](self, "techniques");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", v4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = 1;
LABEL_7:
  objc_storeStrong((id *)&self->_primaryPersonDetectionTechnique, v4);
  if ((v5 & 1) == 0)
  {

  }
}

- (ARTechniqueForwardingStrategy)depthTechniqueProcessingStrategy
{
  return self->_depthTechniqueProcessingStrategy;
}

- (void)setDepthTechniqueProcessingStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_depthTechniqueProcessingStrategy, a3);
}

- (int64_t)optimizationStrategy
{
  return self->_optimizationStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthTechniqueProcessingStrategy, 0);
  objc_storeStrong((id *)&self->_personDetectionTechniques, 0);
  objc_storeStrong((id *)&self->_primaryPersonDetectionTechnique, 0);
  objc_storeStrong((id *)&self->_depthTechnique, 0);
}

@end
