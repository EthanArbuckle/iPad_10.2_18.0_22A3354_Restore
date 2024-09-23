@implementation _MLVNDetectionPrintCustomModel

- (_MLVNDetectionPrintCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _MLVNDetectionPrintCustomModel *v40;
  _MLVNDetectionPrintCustomModel *v41;
  uint64_t v42;
  MLModelConfiguration *configuration;
  MLModelConfiguration *v44;
  MLModelConfiguration *v45;
  _MLVNDetectionPrintCustomModel *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void **v62;
  uint64_t *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  _MLVNDetectionPrintCustomModel *v80;
  objc_super v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  _BYTE v92[128];
  uint64_t v93;
  void *v94;
  uint64_t v95;
  const __CFString *v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  const __CFString *v100;
  uint64_t v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[_MLVNFrameworkHandle sharedHandle](_MLVNFrameworkHandle, "sharedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isValid") & 1) == 0)
  {
    if (a5)
    {
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v101 = *MEMORY[0x1E0CB2D50];
      v102[0] = CFSTR("DetectionPrint not available on this version");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, &v101, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v12);
      v46 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
    v46 = 0;
    goto LABEL_45;
  }
  objc_msgSend(v11, "detectionPrintSupportedRevisions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (a5)
    {
      v48 = (void *)MEMORY[0x1E0CB35C8];
      v99 = *MEMORY[0x1E0CB2D50];
      v100 = CFSTR("DetectionPrint unable to get supported revisions");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v27);
      v46 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    v12 = 0;
    v46 = 0;
    goto LABEL_44;
  }
  v80 = self;
  v13 = v10;
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v12, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MLDetectionPrintRequestRevision"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "unsignedIntegerValue");
      v19 = v77;
      if (v18 <= v16 && v18 >= v77)
        v19 = v18;
      v77 = v19;
    }

  }
  objc_msgSend(v9, "inputDescriptionsByName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count") != 1)
  {

    goto LABEL_38;
  }
  objc_msgSend(v9, "inputDescriptionsByName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allValues");
  v76 = v9;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v75 = v10;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "type");

  v10 = v75;
  v9 = v76;

  if (v25 != 4)
  {
LABEL_38:
    if (!a5)
    {
      v46 = 0;
      self = v80;
      goto LABEL_44;
    }
    v49 = (void *)MEMORY[0x1E0CB35C8];
    v97 = *MEMORY[0x1E0CB2D50];
    v98 = CFSTR("Must only have one input feature of image type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v27);
    v46 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:
    self = v80;
    goto LABEL_41;
  }
  objc_msgSend(v11, "detectionPrintShapes:", v77);
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    if (a5)
    {
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v95 = *MEMORY[0x1E0CB2D50];
      v96 = CFSTR("DetectionPrint unable to get expected shapes");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v52);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v75;
    }
    v27 = 0;
    v46 = 0;
    goto LABEL_40;
  }
  v27 = (void *)v26;
  objc_msgSend(v76, "outputDescriptionsByName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");
  v30 = objc_msgSend(v27, "count");

  if (v29 != v30)
  {
    if (a5)
    {
      v53 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v76, "outputDescriptionsByName");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringWithFormat:", CFSTR("Output count %lu does not match expected %lu in the request revision %lu"), objc_msgSend(v54, "count"), objc_msgSend(v27, "count"), v77);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = (void *)MEMORY[0x1E0CB35C8];
      v93 = *MEMORY[0x1E0CB2D50];
      v94 = v55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v57);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v46 = 0;
    v10 = v75;
    goto LABEL_40;
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend(v76, "outputDescriptionsByName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v32;
  v73 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
  if (!v73)
    goto LABEL_28;
  v74 = *(_QWORD *)v83;
  while (2)
  {
    for (i = 0; i != v73; ++i)
    {
      if (*(_QWORD *)v83 != v74)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
      if (objc_msgSend(v34, "type") != 5)
      {
        v10 = v75;
        self = v80;
        if (!a5)
          goto LABEL_61;
        v37 = v27;
        v58 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v34, "name");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringWithFormat:", CFSTR("Output %@ is not a MultiArray"), v59);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v75;
        v60 = (void *)MEMORY[0x1E0CB35C8];
        v90 = *MEMORY[0x1E0CB2D50];
        v91 = v36;
        v61 = (void *)MEMORY[0x1E0C99D80];
        v62 = &v91;
        v63 = &v90;
LABEL_56:
        objc_msgSend(v61, "dictionaryWithObjects:forKeys:count:", v62, v63, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v39);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      }
      objc_msgSend(v34, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        v10 = v75;
        self = v80;
        if (!a5)
          goto LABEL_61;
        v37 = v27;
        v64 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v34, "name");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringWithFormat:", CFSTR("Output feature %@ not expected"), v65);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v75;
        v60 = (void *)MEMORY[0x1E0CB35C8];
        v86 = *MEMORY[0x1E0CB2D50];
        v87 = v36;
        v61 = (void *)MEMORY[0x1E0C99D80];
        v62 = &v87;
        v63 = &v86;
        goto LABEL_56;
      }
      v37 = v27;
      objc_msgSend(v34, "multiArrayConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38 && (objc_msgSend(v38, "isAllowedShape:error:", v36, 0) & 1) == 0)
      {
        if (a5)
        {
          v78 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", 2);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "name");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "stringWithFormat:", CFSTR("Must allow (%@, %@, %@) vector for output feature %@"), v66, v67, v68, v69);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          v70 = (void *)MEMORY[0x1E0CB35C8];
          v88 = *MEMORY[0x1E0CB2D50];
          v89 = v79;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v71);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v10 = v75;
        self = v80;
LABEL_60:

        v27 = v37;
LABEL_61:

        v46 = 0;
        v9 = v76;
        goto LABEL_41;
      }

      v9 = v76;
      v27 = v37;
    }
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    if (v73)
      continue;
    break;
  }
LABEL_28:

  v81.receiver = v80;
  v81.super_class = (Class)_MLVNDetectionPrintCustomModel;
  v40 = -[_MLVNDetectionPrintCustomModel init](&v81, sel_init);
  v41 = v40;
  if (v40)
  {
    objc_storeStrong((id *)&v40->_modelDescription, a3);
    v41->_detectionPrintRequestRevision = v77;
    objc_storeStrong((id *)&v41->_expectedOutputShapeV1, v27);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MLDetectionPrintConfiguration"));
    v42 = objc_claimAutoreleasedReturnValue();
    configuration = v41->_configuration;
    v41->_configuration = (MLModelConfiguration *)v42;

    if (!v41->_configuration)
    {
      v44 = objc_alloc_init(MLModelConfiguration);
      v45 = v41->_configuration;
      v41->_configuration = v44;

    }
  }
  self = v41;
  v46 = self;
  v10 = v75;
LABEL_41:

LABEL_44:
LABEL_45:

  return v46;
}

- (id)featureValueFromDetectionPrint:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  MLMultiArray *v13;
  uint64_t v14;
  void *v15;
  MLMultiArray *v16;
  void *v17;
  _QWORD aBlock[5];
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__18434;
    v20[4] = __Block_byref_object_dispose__18435;
    v10 = v8;
    v21 = v10;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77___MLVNDetectionPrintCustomModel_featureValueFromDetectionPrint_featureName___block_invoke;
    aBlock[3] = &unk_1E3D66D00;
    aBlock[4] = v20;
    v11 = _Block_copy(aBlock);
    -[NSDictionary objectForKey:](self->_expectedOutputShapeV1, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [MLMultiArray alloc];
    v14 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
    +[MLDataConversionUtils stridesForShape:](MLDataConversionUtils, "stridesForShape:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v13, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v14, v12, 65568, v15, v11, 0);

    +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v20, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
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
  void *v22;
  unint64_t detectionPrintRequestRevision;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id *v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[_MLVNFrameworkHandle sharedHandle](_MLVNFrameworkHandle, "sharedHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isValid") & 1) != 0)
  {
    if (!v9)
    {
      +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
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
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_msgSend(v22, "restrictNeuralNetworksToUseCPUOnly") & 1) != 0
           || -[MLModelConfiguration computeUnits](self->_configuration, "computeUnits") == MLComputeUnitsCPUOnly;

      }
      detectionPrintRequestRevision = self->_detectionPrintRequestRevision;
      v48 = 0;
      objc_msgSend(v10, "detectionPrintsFromPixelBuffers:version:augmentationOptions:useCPUOnly:error:", v15, detectionPrintRequestRevision, 0, v16, &v48);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v48;
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to compute detection print"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v50 = *MEMORY[0x1E0CB2D50];
        v51 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v26);
        v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = v13;
        v40 = a5;
        v41 = v10;
        v42 = v9;
        v43 = v8;
        v38 = v21;
        objc_msgSend(v21, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[MLModelDescription outputDescriptionsByName](self->_modelDescription, "outputDescriptionsByName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "allValues");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v45 != v31)
                objc_enumerationMutation(v28);
              v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              objc_msgSend(v33, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MLVNDetectionPrintCustomModel featureValueFromDetectionPrint:featureName:](self, "featureValueFromDetectionPrint:featureName:", v24, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v33, "name");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v35, v36);

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          }
          while (v30);
        }

        v18 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v26, v40);
        v9 = v42;
        v8 = v43;
        v10 = v41;
        v19 = 0;
        v13 = v39;
        v21 = v38;
      }

    }
    else
    {
      if (!a5)
      {
        v18 = 0;
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input image feature '%@' not found"), v13);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D50];
      v53 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v21);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_28:
    goto LABEL_29;
  }
  if (a5)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB2D50];
    v55[0] = CFSTR("DetectionPrint not available on this version");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v13);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v18 = 0;
LABEL_29:

  return v18;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (unint64_t)detectionPrintRequestRevision
{
  return self->_detectionPrintRequestRevision;
}

- (NSDictionary)expectedOutputShapeV1
{
  return self->_expectedOutputShapeV1;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_expectedOutputShapeV1, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end
