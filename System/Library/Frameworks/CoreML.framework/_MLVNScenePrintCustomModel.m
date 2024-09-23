@implementation _MLVNScenePrintCustomModel

- (_MLVNScenePrintCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  _MLVNScenePrintCustomModel *v35;
  _MLVNScenePrintCustomModel *v36;
  uint64_t v37;
  MLModelConfiguration *configuration;
  MLModelConfiguration *v39;
  MLModelConfiguration *v40;
  _MLVNScenePrintCustomModel *v41;
  void *v42;
  const __CFString **v43;
  uint64_t *v44;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  _MLVNScenePrintCustomModel *v51;
  objc_super v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[_MLVNFrameworkHandle sharedHandle](_MLVNFrameworkHandle, "sharedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isValid") & 1) != 0)
  {
    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MLScenePrintRequestRevision"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "unsignedIntegerValue");
        if (v13 <= 1)
          v14 = 1;
        else
          v14 = v13;
      }
      else
      {
        v14 = 1;
      }

    }
    else
    {
      v14 = 1;
    }
    objc_msgSend(v9, "inputDescriptionsByName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count") == 1)
    {
      v50 = v14;
      objc_msgSend(v9, "inputDescriptionsByName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = self;
      v22 = objc_msgSend(v21, "type");

      v23 = v22 == 4;
      self = v51;
      if (v23)
      {
        objc_msgSend(v9, "outputDescriptionsByName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count") == 1)
        {
          objc_msgSend(v9, "outputDescriptionsByName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "allValues");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "type");

          self = v51;
          if (v28 == 5)
          {
            v49 = objc_msgSend(v11, "elementCountForScenePrintRequestRevision:", v50);
            objc_msgSend(v9, "outputDescriptionsByName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "allValues");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "multiArrayConstraint");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31)
              goto LABEL_19;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v49);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v32;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v31, "isAllowedShape:error:", v33, 0);

            if ((v34 & 1) == 0)
            {
              if (a5)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must allow %lu-element vector as output"), v49);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = (void *)MEMORY[0x1E0CB35C8];
                v53 = *MEMORY[0x1E0CB2D50];
                v54 = v46;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v48);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

              }
              v41 = 0;
              self = v51;
            }
            else
            {
LABEL_19:
              v52.receiver = v51;
              v52.super_class = (Class)_MLVNScenePrintCustomModel;
              v35 = -[_MLVNScenePrintCustomModel init](&v52, sel_init);
              v36 = v35;
              if (v35)
              {
                objc_storeStrong((id *)&v35->_modelDescription, a3);
                v36->_scenePrintRequestRevision = v50;
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MLScenePrintConfiguration"));
                v37 = objc_claimAutoreleasedReturnValue();
                configuration = v36->_configuration;
                v36->_configuration = (MLModelConfiguration *)v37;

                if (!v36->_configuration)
                {
                  v39 = objc_alloc_init(MLModelConfiguration);
                  v40 = v36->_configuration;
                  v36->_configuration = v39;

                }
              }
              self = v36;
              v41 = self;
            }

            goto LABEL_28;
          }
        }
        else
        {

        }
        if (a5)
        {
          v56 = *MEMORY[0x1E0CB2D50];
          v57 = CFSTR("Must only have one output multiarray feature");
          v42 = (void *)MEMORY[0x1E0C99D80];
          v43 = &v57;
          v44 = &v56;
          goto LABEL_26;
        }
LABEL_32:
        v41 = 0;
        goto LABEL_33;
      }
    }
    else
    {

    }
    if (a5)
    {
      v58 = *MEMORY[0x1E0CB2D50];
      v59 = CFSTR("Must only have one input image feature");
      v42 = (void *)MEMORY[0x1E0C99D80];
      v43 = &v59;
      v44 = &v58;
LABEL_26:
      objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB35C8];
      goto LABEL_27;
    }
    goto LABEL_32;
  }
  if (!a5)
    goto LABEL_32;
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v60 = *MEMORY[0x1E0CB2D50];
  v61[0] = CFSTR("ScenePrint not available on this version");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
LABEL_27:
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v16);
  v41 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_33:
  return v41;
}

- (id)featureValueFromScenePrint:(id)a3 elementSize:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  MLMultiArray *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  MLMultiArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MLMultiArray *v24;
  MLMultiArray *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 <= 4)
    v8 = 65568;
  else
    v8 = 65600;
  v9 = objc_msgSend(v6, "length");
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__8324;
  v31[4] = __Block_byref_object_dispose__8325;
  v10 = v7;
  v32 = v10;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __69___MLVNScenePrintCustomModel_featureValueFromScenePrint_elementSize___block_invoke;
  v30[3] = &unk_1E3D66D00;
  v30[4] = v31;
  v11 = _Block_copy(v30);
  v12 = [MLMultiArray alloc];
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v13, "bytes");
  v15 = v9 / a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v12, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v14, v17, v8, &unk_1E3DA2948, v11, 0);

  -[MLModelDescription outputDescriptionsByName](self->_modelDescription, "outputDescriptionsByName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "multiArrayConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "dataType");

  if (v23 == v8)
  {
    v24 = v18;
  }
  else
  {
    v25 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MLMultiArray initWithShape:dataType:error:](v25, "initWithShape:dataType:error:", v27, v23, 0);

    -[MLMultiArray copyIntoMultiArray:error:](v18, "copyIntoMultiArray:error:", v24, 0);
  }
  +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v31, 8);
  return v28;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  MLDictionaryFeatureProvider *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  unint64_t scenePrintRequestRevision;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MLDictionaryFeatureProvider *v29;
  void *v30;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[_MLVNFrameworkHandle sharedHandle](_MLVNFrameworkHandle, "sharedHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isValid") & 1) != 0)
  {
    -[MLModelDescription inputDescriptionsByName](self->_modelDescription, "inputDescriptionsByName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "featureValueForName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "imageBufferValue");

    if (v15)
    {
      if ((objc_msgSend(v9, "predictionUsesCPU") & 1) != 0)
      {
        v16 = 1;
      }
      else
      {
        +[MLInternalSettings globalSettings](MLInternalSettings, "globalSettings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_msgSend(v23, "restrictNeuralNetworksToUseCPUOnly") & 1) != 0
           || -[MLModelConfiguration computeUnits](self->_configuration, "computeUnits") == MLComputeUnitsCPUOnly;

      }
      scenePrintRequestRevision = self->_scenePrintRequestRevision;
      v33 = 0;
      objc_msgSend(v10, "scenePrintsFromPixelBuffers:version:augmentationOptions:useCPUOnly:error:", v15, scenePrintRequestRevision, 0, v16, &v33);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v33;
      if (!v19 && objc_msgSend(v21, "count"))
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MLVNScenePrintCustomModel featureValueFromScenePrint:elementSize:](self, "featureValueFromScenePrint:elementSize:", v32, objc_msgSend(v32, "length")/ (unint64_t)objc_msgSend(v10, "elementCountForScenePrintRequestRevision:", self->_scenePrintRequestRevision));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLModelDescription outputDescriptionsByName](self->_modelDescription, "outputDescriptionsByName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allKeys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = [MLDictionaryFeatureProvider alloc];
        v34 = v28;
        v35 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v29, "initWithDictionary:error:", v30, a5);

        v19 = 0;
        goto LABEL_23;
      }
      if (!a5)
      {
        v18 = 0;
        goto LABEL_23;
      }
      v22 = objc_retainAutorelease(v19);
      v19 = v22;
    }
    else
    {
      if (!a5)
      {
        v18 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input image feature '%@' not found"), v13);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = 0;
    *a5 = v22;
LABEL_23:

    goto LABEL_24;
  }
  if (a5)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("ScenePrint not available on this version");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v13);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  v18 = 0;
LABEL_25:

  return v18;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (unint64_t)scenePrintRequestRevision
{
  return self->_scenePrintRequestRevision;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end
