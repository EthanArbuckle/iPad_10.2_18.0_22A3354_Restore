@implementation BWInferenceEngine

- (int)prepareForInputInferenceVideoFormat:(id)a3 attachedMediaKey:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int result;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_lazyInputVideoRequirementsByAttachedMediaKey, "objectForKey:", a4);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v7);
      result = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "prepareForInputInferenceVideoFormat:", a3);
      if (result)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v13 = (void *)-[NSMutableDictionary objectForKey:](self->_lazyOutputVideoRequirementsByAttachedMediaKey, "objectForKey:", a4);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
LABEL_11:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17), "prepareForInputInferenceVideoFormat:", a3);
        if (result)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v15)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      -[NSMutableSet removeObject:](self->_unresolvedAttachedMediaKeysPreventingProvidedVideoRequirements, "removeObject:", a4);
      -[BWInferenceEngine _prepareProvidedVideoRequirementsIfNecessary]((uint64_t)self);
      return 0;
    }
  }
  return result;
}

- (NSDictionary)providedVideoRequirementsByAttachedMediaKey
{
  return -[BWInferenceDependencyProvider providedVideoRequirementsByAttachedMediaKey](self->_dependencyProvider, "providedVideoRequirementsByAttachedMediaKey");
}

- (int)prepareForInputVideoFormat:(id)a3 attachedMediaKey:(id)a4
{
  uint64_t v5;

  LODWORD(v5) = 0;
  return -[BWInferenceEngine prepareForInputInferenceVideoFormat:attachedMediaKey:](self, "prepareForInputInferenceVideoFormat:attachedMediaKey:", -[BWInferenceVideoFormat initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:]([BWInferenceVideoFormat alloc], "initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:", a3, 0, 0, 1, 0, 0, v5), a4);
}

- (uint64_t)_prepareDependenciesByRequirementIfNecessary
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  id v14;
  BWInferenceDataDependency *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  id v22;
  id v23;
  id v24;
  BWInferenceDataDependency *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  id v32;
  BWInferenceDataDependency *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  unsigned int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "dependenciesByInputVideoRequirements"), "count");
    if (!result)
    {
      result = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "count");
      if (!result)
      {
        v40 = objc_msgSend(*(id *)(v1 + 32), "supportedPixelBufferCompressionType");
        objc_opt_self();
        v39 = FigCapturePlatformSupportsUniversalLossyCompression() != 0;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        obj = *(id *)(v1 + 136);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        v36 = result;
        if (result)
        {
          v35 = *(_QWORD *)v54;
          do
          {
            v2 = 0;
            do
            {
              if (*(_QWORD *)v54 != v35)
                objc_enumerationMutation(obj);
              v37 = v2;
              v3 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v2);
              v4 = (void *)objc_msgSend(v3, "provider");
              v5 = objc_msgSend(v4, "allowedPixelBufferCompressionDirection");
              v38 = v4;
              v6 = (void *)objc_msgSend(v4, "inputVideoRequirements");
              v49 = 0u;
              v50 = 0u;
              v51 = 0u;
              v52 = 0u;
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
              if (v7)
              {
                v8 = v7;
                v9 = *(_QWORD *)v50;
                do
                {
                  for (i = 0; i != v8; ++i)
                  {
                    if (*(_QWORD *)v50 != v9)
                      objc_enumerationMutation(v6);
                    v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                    if ((v5 & 1) != 0)
                    {
                      v12 = +[BWInferenceCompressedVideoRequirement newRequirementWithUncompressedRequirement:supportedCompressionType:supportedLossyCompressionLevel:](BWInferenceCompressedVideoRequirement, "newRequirementWithUncompressedRequirement:supportedCompressionType:supportedLossyCompressionLevel:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i), v40, v39);
                      if (v12)
                      {
                        v13 = v12;
                        objc_msgSend(*(id *)(v1 + 144), "addObject:", v12);
                        v11 = v13;
                      }
                    }
                    v14 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByInputVideoRequirements"), "objectForKey:", v11);
                    if (!v14)
                    {
                      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByInputVideoRequirements"), "setObject:forKey:", v14, v11);

                    }
                    v15 = -[BWInferenceDataDependency initWithInferenceRequirement:dependentOnDataRequirement:]([BWInferenceDataDependency alloc], "initWithInferenceRequirement:dependentOnDataRequirement:", v3, v11);
                    objc_msgSend(v14, "addObject:", v15);

                    if (!*(_BYTE *)(v1 + 192))
                      *(_BYTE *)(v1 + 192) = objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "deviceOriented");
                  }
                  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
                }
                while (v8);
              }
              v16 = (void *)objc_msgSend(v38, "outputVideoRequirements");
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v48 = 0u;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v46;
                do
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v46 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(id *)(*((_QWORD *)&v45 + 1) + 8 * j);
                    if ((v5 & 2) != 0)
                    {
                      v22 = +[BWInferenceCompressedVideoRequirement newRequirementWithUncompressedRequirement:supportedCompressionType:supportedLossyCompressionLevel:](BWInferenceCompressedVideoRequirement, "newRequirementWithUncompressedRequirement:supportedCompressionType:supportedLossyCompressionLevel:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j), v40, v39);
                      if (v22)
                      {
                        v23 = v22;
                        objc_msgSend(*(id *)(v1 + 144), "addObject:", v22);
                        v21 = v23;
                      }
                    }
                    v24 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "objectForKey:", v21);
                    if (!v24)
                    {
                      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "setObject:forKey:", v24, v21);

                    }
                    v25 = -[BWInferenceDataDependency initWithInferenceRequirement:dependentOnDataRequirement:]([BWInferenceDataDependency alloc], "initWithInferenceRequirement:dependentOnDataRequirement:", v3, v21);
                    objc_msgSend(v24, "addObject:", v25);

                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
                }
                while (v18);
              }
              v26 = (void *)objc_msgSend(v38, "cloneVideoRequirements");
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v42;
                do
                {
                  for (k = 0; k != v28; ++k)
                  {
                    if (*(_QWORD *)v42 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
                    v32 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "objectForKey:", v31);
                    if (!v32)
                    {
                      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "dependenciesByOutputVideoRequirements"), "setObject:forKey:", v32, v31);

                    }
                    v33 = -[BWInferenceDataDependency initWithInferenceRequirement:dependentOnDataRequirement:]([BWInferenceDataDependency alloc], "initWithInferenceRequirement:dependentOnDataRequirement:", v3, objc_msgSend(v31, "sourceVideoRequirement"));
                    objc_msgSend(v32, "addObject:", v33);

                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
                }
                while (v28);
              }
              v2 = v37 + 1;
            }
            while (v37 + 1 != v36);
            result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
            v36 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (void)_prepareProvidedVideoRequirementsIfNecessary
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1
    && !objc_msgSend(*(id *)(a1 + 32), "providedVideoRequirementsByAttachedMediaKey")
    && !objc_msgSend(*(id *)(a1 + 184), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSupportedPixelBufferCompressionType:", +[BWInferenceEngine allowedPixelBufferCompressionType]());
    -[BWInferenceEngine _prepareDependenciesByRequirementIfNecessary](a1);
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v3 = *(void **)(a1 + 152);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dependenciesByInputVideoRequirements"), "objectForKey:", v8);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dependenciesByOutputVideoRequirements"), "objectForKey:", v8), "count")&& !objc_msgSend(v9, "count"))
          {
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, objc_msgSend(v8, "attachedMediaKey"));
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "setProvidedVideoRequirementsByAttachedMediaKey:", (id)objc_msgSend(v2, "copy"));

    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = *(void **)(a1 + 144);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
          v17 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dependenciesByInputVideoRequirements"), "objectForKey:", v16);
          if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dependenciesByOutputVideoRequirements"), "objectForKey:", v16), "count"))
          {
            if (objc_msgSend(v17, "count"))
              objc_msgSend(v10, "addObject:", objc_msgSend(v16, "attachedMediaKey"));
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v13);
    }
    objc_msgSend(*(id *)(a1 + 32), "setConsumedVideoAttachedMediaKeys:", (id)objc_msgSend(v10, "copy"));

  }
}

- (uint64_t)_addInferenceRequirementForProvider:(uint64_t)a3 configuration:
{
  id *v4;
  BWInferenceRequirement *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BWInferenceCompressibleLazyVideoRequirement *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = (id *)result;
    v5 = -[BWInferenceRequirement initWithProvider:configuration:]([BWInferenceRequirement alloc], "initWithProvider:configuration:", a2, a3);
    objc_msgSend(v4[17], "addObject:", v5);

    v6 = objc_msgSend(a2, "allowedPixelBufferCompressionDirection");
    v23 = a2;
    v7 = (void *)objc_msgSend(a2, "inputVideoRequirements");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v7);
          v12 = *(BWInferenceCompressibleLazyVideoRequirement **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v4[18], "addObject:", v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = -[BWInferenceLazyVideoRequirement preparedByAttachedMediaKey](v12, "preparedByAttachedMediaKey");
            if ((v6 & 1) != 0)
              v12 = -[BWInferenceCompressibleLazyVideoRequirement initWithLazyVideoRequirement:]([BWInferenceCompressibleLazyVideoRequirement alloc], "initWithLazyVideoRequirement:", v12);
            v14 = (id)objc_msgSend(v4[20], "objectForKey:", v13);
            if (!v14)
            {
              v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v4[20], "setObject:forKey:", v14, v13);

            }
            objc_msgSend(v14, "addObject:", v12);
            objc_msgSend(v4[23], "addObject:", v13);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }
    v15 = (void *)objc_msgSend(v23, "outputVideoRequirements");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_msgSend(v4[19], "addObject:", v20);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = objc_msgSend(v20, "preparedByAttachedMediaKey");
            v22 = (id)objc_msgSend(v4[21], "objectForKey:", v21);
            if (!v22)
            {
              v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v4[21], "setObject:forKey:", v22, v21);

            }
            objc_msgSend(v22, "addObject:", v20);
            objc_msgSend(v4[23], "addObject:", v21);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);
    }
    return objc_msgSend(v4[19], "addObjectsFromArray:", objc_msgSend(v23, "cloneVideoRequirements"));
  }
  return result;
}

- (id)defaultDeviceMetalContext
{
  return self->_defaultDeviceMetalContext;
}

+ (unsigned)allowedBufferCompressionDirectionForExecutionTarget:(int)a3
{
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  BOOL v9;
  int v10;

  v4 = +[BWInferenceEngine allowedPixelBufferCompressionType]();
  v5 = FigCapturePlatformSupportsUniversalCompression();
  v6 = FigCapturePlatformSupportsHTPC16x8Compression();
  v7 = 0;
  v8 = FigCapturePlatformIdentifier();
  switch(a3)
  {
    case 1:
    case 5:
      v9 = v4 != 4 || v5 == 0;
      v10 = 3;
      goto LABEL_12;
    case 3:
      if (v8 <= 8)
        v10 = 1;
      else
        v10 = 3;
      v9 = v4 != 4 || v5 == 0;
LABEL_12:
      if (v9)
        v7 = 0;
      else
        v7 = v10;
      break;
    case 4:
      v7 = 3;
      if (!v5 || v4 != 4)
      {
        if (v4 != 1 || v6 == 0)
          v7 = 0;
        else
          v7 = 3;
      }
      break;
    default:
      return v7;
  }
  return v7;
}

+ (uint64_t)allowedPixelBufferCompressionType
{
  objc_opt_self();
  if (FigCapturePlatformSupportsUniversalCompression())
    return 4;
  FigCapturePlatformSupportsHTPC16x8Compression();
  return 0;
}

- (BWInferenceEngine)initWithScheduler:(id)a3 priority:(unsigned int)a4 shareIntermediateBuffer:(BOOL)a5
{
  return (BWInferenceEngine *)-[BWInferenceEngine _initWithScheduler:priority:shareIntermediateBuffer:](self, a3, *(uint64_t *)&a4, a5);
}

- (_QWORD)_initWithScheduler:(uint64_t)a3 priority:(uint64_t)a4 shareIntermediateBuffer:
{
  _QWORD *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)BWInferenceEngine;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = objc_msgSend(a2, "registerInferenceConnection");
    *((_DWORD *)v7 + 6) = a3;
    v7[5] = objc_alloc_init(BWEspressoInferenceAdapter);
    v7[6] = objc_alloc_init(BWTiledEspressoInferenceAdapter);
    v7[7] = objc_alloc_init(BWTiledInferenceAdapter);
    v7[12] = objc_alloc_init(BWVisionInferenceAdapter);
    v7[14] = objc_alloc_init(BWVideoDepthInferenceAdapter);
    v7[15] = objc_alloc_init(BWFusionTrackerInferenceAdapter);
    v7[8] = -[BWEspressoInferenceContext initWithExecutionTarget:]([BWEspressoInferenceContext alloc], "initWithExecutionTarget:", 0);
    v7[9] = -[BWEspressoInferenceContext initWithExecutionTarget:]([BWEspressoInferenceContext alloc], "initWithExecutionTarget:", 1);
    v7[10] = -[BWEspressoInferenceContext initWithExecutionTarget:shareIntermediateBuffer:]([BWEspressoInferenceContext alloc], "initWithExecutionTarget:shareIntermediateBuffer:", 3, a4);
    v7[13] = objc_alloc_init(BWVisionInferenceContext);
    v7[11] = -[BWMetalInferenceContext initWithScheduler:priority:]([BWMetalInferenceContext alloc], "initWithScheduler:priority:", a2, a3);
    v7[16] = objc_alloc_init(BWVideoProcessingInferenceAdapter);
    v7[17] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7[18] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7[19] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7[20] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7[21] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7[23] = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7[4] = objc_alloc_init(BWInferenceDependencyProvider);
  }
  return v7;
}

- (BWInferenceEngine)initWithScheduler:(id)a3 priority:(unsigned int)a4
{
  return -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:](self, "initWithScheduler:priority:shareIntermediateBuffer:", a3, *(_QWORD *)&a4, 0);
}

+ (BOOL)isNeuralEngineSupported
{
  if (isNeuralEngineSupported_onceToken != -1)
    dispatch_once(&isNeuralEngineSupported_onceToken, &__block_literal_global_92);
  return isNeuralEngineSupported_neuralEngineSupported;
}

- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *fusionTrackerAdapter;
  uint64_t v11;
  uint64_t v12;
  void *visionAdapter;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v23;
  __objc2_class *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v6 = *(_QWORD *)&a4.var0;
  v7 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  objc_msgSend(a5, "setPriority:", self->_priority);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((int)v7 > 149)
  {
    if ((int)v7 <= 200)
    {
      switch((int)v7)
      {
        case 150:
          fusionTrackerAdapter = self->_fusionTrackerAdapter;
          v11 = v6 & 0xFFFFFFFFFFFFLL;
          v12 = 150;
          goto LABEL_23;
        case 151:
        case 161:
          goto LABEL_20;
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 157:
        case 158:
          goto LABEL_34;
        case 159:
        case 160:
          goto LABEL_30;
        default:
          if ((v7 - 170) < 2)
            goto LABEL_30;
          goto LABEL_34;
      }
    }
    if ((v7 - 801) < 4)
    {
      if ((os_variant_has_factory_content() & 1) != 0)
        return v29;
      visionAdapter = self->_visionAdapter;
LABEL_31:
      v15 = v6 & 0xFFFFFFFFFFFFLL;
      v16 = v7;
LABEL_32:
      v17 = (id)objc_msgSend(visionAdapter, "inferenceProviderForType:version:configuration:resourceProvider:status:", v16, v15, a5, self, &v29);
      if (v17)
      {
LABEL_33:
        objc_msgSend(v9, "addObject:", v17);
        goto LABEL_34;
      }
      return -31701;
    }
    if ((_DWORD)v7 == 201)
    {
      if ((unsigned __int16)v6 == 1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = a5;
        else
          v23 = 0;
        v24 = BWMattingInferenceProvider;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = a5;
        else
          v23 = 0;
        v24 = BWMattingV2InferenceProvider;
      }
      v17 = (id)objc_msgSend([v24 alloc], "initWithConfiguration:", v23);
      if (v17)
        goto LABEL_33;
      return -31701;
    }
    if ((_DWORD)v7 == 2001)
    {
      visionAdapter = self->_videoProcessingAdapter;
      v15 = v6 & 0xFFFFFFFFFFFFLL;
      v16 = 2001;
      goto LABEL_32;
    }
LABEL_34:
    if (objc_msgSend(v9, "count"))
    {
      if (!v29)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v26 != v20)
                objc_enumerationMutation(v9);
              -[BWInferenceEngine _addInferenceRequirementForProvider:configuration:]((uint64_t)self, *(void **)(*((_QWORD *)&v25 + 1) + 8 * i), (uint64_t)a5);
            }
            v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          }
          while (v19);
        }
      }
    }
    return v29;
  }
  if ((int)v7 <= 107)
  {
    if ((v7 - 101) >= 6)
    {
      if ((_DWORD)v7 != 107)
        goto LABEL_34;
LABEL_30:
      visionAdapter = self->_tiledEspressoAdapter;
      goto LABEL_31;
    }
    goto LABEL_20;
  }
  if ((int)v7 > 115)
  {
    if ((_DWORD)v7 != 116)
    {
      if ((_DWORD)v7 == 117)
        goto LABEL_21;
      if ((_DWORD)v7 != 118)
        goto LABEL_34;
    }
  }
  else if ((_DWORD)v7 != 108)
  {
    if ((_DWORD)v7 != 109 && (_DWORD)v7 != 111)
      goto LABEL_34;
LABEL_21:
    fusionTrackerAdapter = self->_videoDepthAdapter;
    goto LABEL_22;
  }
LABEL_20:
  fusionTrackerAdapter = self->_espressoAdapter;
LABEL_22:
  v11 = v6 & 0xFFFFFFFFFFFFLL;
  v12 = v7;
LABEL_23:
  v14 = objc_msgSend(fusionTrackerAdapter, "inferenceProvidersForType:version:configuration:resourceProvider:status:", v12, v11, a5, self, &v29);
  if (v14 && !v29)
  {
    objc_msgSend(v9, "addObjectsFromArray:", v14);
    goto LABEL_34;
  }
  return v29;
}

- (BOOL)isConfiguredForInference
{
  return -[NSMutableArray count](self->_inferenceRequirements, "count") != 0;
}

- (int)performInferencesOnSampleBuffer:(opaqueCMSampleBuffer *)a3 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a4 skippingInferencesWithTypes:(id)a5
{
  return -[BWInferenceScheduler performInferencesForConnection:usingInputSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:](self->_scheduler, "performInferencesForConnection:usingInputSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", self->_connection, a3, a4, a5);
}

- (id)visionContextForExecutionTarget:(int)a3
{
  return self->_visionContext;
}

- (int)prepareForInferenceWithFormatProvider:(id)a3 pixelBufferPoolProvider:(id)a4
{
  int result;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;

  if (!a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    v10 = objc_msgSend(v8, "stringWithFormat:", CFSTR("Cannot prepare %@ with a nil formatProvider!"), NSStringFromClass(v9));
    goto LABEL_8;
  }
  if (!a4)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    v10 = objc_msgSend(v11, "stringWithFormat:", CFSTR("Cannot prepare %@ with a nil pixelBufferPoolProvider!"), NSStringFromClass(v12));
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0));
  }
  result = -[BWInferenceScheduler prepareForInferenceRequirements:dependencyProviderSource:formatProvider:pixelBufferPoolProvider:connection:backPressureDrivenPipelining:](self->_scheduler, "prepareForInferenceRequirements:dependencyProviderSource:formatProvider:pixelBufferPoolProvider:connection:backPressureDrivenPipelining:", self->_inferenceRequirements, self->_dependencyProvider, a3, a4, self->_connection, self->_backPressureDrivenPipelining);
  if (!result)
    return -[BWEspressoInferenceContext enableIntermediateBufferSharingWithNetworksLoadedFromPath:](self->_aneContext, "enableIntermediateBufferSharingWithNetworksLoadedFromPath:", 0);
  return result;
}

- (void)setBackPressureDrivenPipelining:(BOOL)a3
{
  self->_backPressureDrivenPipelining = a3;
}

- (int)enableIntermediateBufferSharingWithNetworksLoadedFromPath:(id)a3
{
  return -[BWEspressoInferenceContext enableIntermediateBufferSharingWithNetworksLoadedFromPath:](self->_aneContext, "enableIntermediateBufferSharingWithNetworksLoadedFromPath:", a3);
}

- (id)espressoContextForExecutionTarget:(int)a3
{
  uint64_t v3;

  switch(a3)
  {
    case 0:
      v3 = 64;
      return *(Class *)((char *)&self->super.isa + v3);
    case 3:
      v3 = 80;
      return *(Class *)((char *)&self->super.isa + v3);
    case 1:
      v3 = 72;
      return *(Class *)((char *)&self->super.isa + v3);
  }
  return 0;
}

uint64_t __44__BWInferenceEngine_isNeuralEngineSupported__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isNeuralEngineSupported_neuralEngineSupported = result;
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[BWInferenceScheduler unregisterInferenceConnection:](self->_scheduler, "unregisterInferenceConnection:", self->_connection);

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceEngine;
  -[BWInferenceEngine dealloc](&v3, sel_dealloc);
}

- (int)prepareForInferenceWithFormatProvider:(id)a3
{
  return -[BWInferenceEngine prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:](self, "prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:", a3, objc_alloc_init(BWInferenceSingleBufferPoolProvider));
}

- (int)performInferencesOnSampleBuffer:(opaqueCMSampleBuffer *)a3 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  return -[BWInferenceEngine performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:](self, "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", a3, a4, 0);
}

- (int)prewarmInferencesUsingLimitedMemory:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *inferenceRequirements;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  inferenceRequirements = self->_inferenceRequirements;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inferenceRequirements, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(inferenceRequirements);
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "provider"), "prewarmUsingLimitedMemory:", v3);
    }
    v10 = v9;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inferenceRequirements, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v6);
  return v10;
}

- (id)newMetalEvent
{
  return (id)-[MTLDevice newEvent](-[BWMetalInferenceContext device](self->_defaultDeviceMetalContext, "device"), "newEvent");
}

- (id)metalCommandBuffer
{
  return (id)-[MTLCommandQueue commandBuffer](-[BWMetalInferenceContext commandQueue](self->_defaultDeviceMetalContext, "commandQueue"), "commandBuffer");
}

- (BOOL)requiresDeviceOrientationMetadata
{
  return self->_requiresDeviceOrientationMetadata;
}

- (BOOL)backPressureDrivenPipelining
{
  return self->_backPressureDrivenPipelining;
}

@end
