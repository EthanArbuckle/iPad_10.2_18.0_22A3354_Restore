@implementation MLNeuralNetworkEngine

- (id)multiArrayFeatureValueFromEbuf:(id *)a3 backingMultiArray:(id)a4 description:(id)a5 outputName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  MLMultiArray *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  MLMultiArray *v25;
  id v26;
  MLMultiArray *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  void *v34;
  char v35;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v43 = a4;
  v12 = a5;
  v42 = a6;
  v45 = 0;
  v46 = 0;
  -[MLNeuralNetworkEngine populateMultiArrayShape:strides:forEbuf:featureDescription:ndArrayInterpretation:](self, "populateMultiArrayShape:strides:forEbuf:featureDescription:ndArrayInterpretation:", &v46, &v45, a3, v12, BYTE1(self->_transferSession));
  v13 = v46;
  v14 = v45;
  v15 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:]([MLMultiArray alloc], "initWithDataPointer:shape:dataType:strides:deallocator:error:", a3->var0, v13, 65568, v14, 0, a7);
  v41 = v13;
  if (v15)
  {
    -[MLNeuralNetworkEngine activeFunction](self, "activeFunction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    v19 = 65600;
    if (v18)
      v20 = 65600;
    else
      v20 = 65568;
    if (v12)
    {
      objc_msgSend(v12, "multiArrayConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (!v22)
      {
        objc_msgSend(v12, "multiArrayConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "dataType");
        if ((unint64_t)(v24 - 65552) <= 0x30 && ((1 << (v24 - 16)) & 0x1000000010001) != 0
          || v24 == 131104)
        {
          v19 = objc_msgSend(v23, "dataType");
        }
        else
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v39 = objc_msgSend(v23, "dataType");
            *(_DWORD *)buf = 134217984;
            v48 = v39;
            _os_log_error_impl(&dword_19C486000, v37, OS_LOG_TYPE_ERROR, "Model description's MLMultiArrayConstraint states unknown data type (%ld), which should never happen, but the framework falls back to use Double.", buf, 0xCu);
          }

        }
        v20 = v19;
      }
    }
    if (v43)
    {
      v25 = (MLMultiArray *)v43;
    }
    else
    {
      v27 = [MLMultiArray alloc];
      -[MLMultiArray shape](v15, "shape");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[MLMultiArray initWithShape:dataType:error:](v27, "initWithShape:dataType:error:", v28, v20, a7);

      if (!v25)
        goto LABEL_25;
    }
    if (-[MLMultiArray copyIntoMultiArray:error:](v15, "copyIntoMultiArray:error:", v25, a7))
    {
      +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (BYTE1(self->_transferSession))
      {
        -[MLNeuralNetworkEngine modelVersionInfo](self, "modelVersionInfo");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "majorVersion");
        if (!v12 || v31 < 5)
        {
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(v12, "multiArrayConstraint");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32 == 0;

        if (!v33)
        {
          objc_msgSend(v12, "multiArrayConstraint");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0;
          v35 = objc_msgSend(v34, "isAllowedValue:isNeuralNetworkInputOrOutput:usingRank5Mapping:featureName:error:", v29, 1, 0, v42, &v44);
          v30 = v44;

          if ((v35 & 1) == 0)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v30, "localizedDescription");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v48 = (uint64_t)v42;
              v49 = 2112;
              v50 = v40;
              _os_log_error_impl(&dword_19C486000, v38, OS_LOG_TYPE_ERROR, "Invalid shape for output feature '%@'. (Underlying error: %@)", buf, 0x16u);

            }
            if (a7)
            {
              +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 1, v30, CFSTR("Invalid shape for output feature '%@'."), v42);
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }

            v26 = 0;
            goto LABEL_24;
          }
          goto LABEL_22;
        }
      }
LABEL_23:
      v26 = v29;
LABEL_24:

LABEL_26:
      goto LABEL_27;
    }
LABEL_25:
    v26 = 0;
    goto LABEL_26;
  }
  v26 = 0;
LABEL_27:

  return v26;
}

- (MLVersionInfo)modelVersionInfo
{
  return (MLVersionInfo *)self->_espressoInputShapes;
}

- (NSString)activeFunction
{
  return (NSString *)&self->_defaultOptionalValues->super.isa;
}

- (void)populateMultiArrayShape:(id *)a3 strides:(id *)a4 forEbuf:(id *)a5 featureDescription:(id)a6 ndArrayInterpretation:(BOOL)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t var8;
  unint64_t var7;
  unint64_t var6;
  unint64_t var5;
  unint64_t var4;
  void *v21;
  id v22;
  id v23;
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
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  void *v48;
  _QWORD v49[6];
  id v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[5];
  void *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[7];

  v61[5] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = v10;
  v45 = v10;
  if (!v10)
  {
    v48 = 0;
    if (a7)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v25;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v26;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61[4] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = 0;
    v51 = 0;
    +[MLDataConversionUtils populateShapeAndStrideFor:inputShape:outputShape:outputStrides:error:](MLDataConversionUtils, "populateShapeAndStrideFor:inputShape:outputShape:outputStrides:error:", v45, v29, &v51, &v50, 0);
    v22 = v51;
    v23 = v50;

    goto LABEL_15;
  }
  objc_msgSend(v10, "multiArrayConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shapeConstraint");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a7)
    goto LABEL_10;
LABEL_3:
  -[MLNeuralNetworkEngine modelVersionInfo](self, "modelVersionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "majorVersion");
  if (v11 && v14 <= 4 && v48)
  {
    v15 = objc_msgSend(v48, "type");

    if (v15 != 1)
    {
      var7 = a5->var7;
      var8 = a5->var8;
      var5 = a5->var5;
      var6 = a5->var6;
      var4 = a5->var4;
      v55 = 0;
      v56 = &v55;
      v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__2979;
      v59 = __Block_byref_object_dispose__2980;
      v60 = 0;
      objc_msgSend(v48, "shapeSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __106__MLNeuralNetworkEngine_populateMultiArrayShape_strides_forEbuf_featureDescription_ndArrayInterpretation___block_invoke;
      v49[3] = &unk_1E3D65238;
      v49[4] = &v55;
      v49[5] = var8 * var7 * var6 * var5 * var4;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v49);

      v22 = (id)v56[5];
      if (v22)
      {
        +[MLDataConversionUtils stridesForShape:](MLDataConversionUtils, "stridesForShape:", v22);
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      _Block_object_dispose(&v55, 8);

LABEL_15:
      if (v22)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else
  {

  }
  espresso_buffer_unpack_tensor_shape();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[MLDataConversionUtils stridesForShape:](MLDataConversionUtils, "stridesForShape:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v23 = 0;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 5);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v38;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var10);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a5->var9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend(v41, "mutableCopy");
  v23 = (id)v42;
LABEL_21:
  if (a3)
  {
    v43 = objc_retainAutorelease(v22);
    *a3 = v43;

    v22 = 0;
  }
  if (a4)
  {
    v44 = objc_retainAutorelease(v23);
    *a4 = v44;

    v23 = 0;
  }

}

- (BOOL)_matchEngineToOptions:(id)a3 error:(id *)a4
{
  id v6;
  MLPredictionOptions *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  BOOL v14;

  v6 = a3;
  if ((objc_msgSend(v6, "predictionUsesCPU") & 1) != 0)
    goto LABEL_9;
  +[MLInternalSettings globalSettings](MLInternalSettings, "globalSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "restrictNeuralNetworksToUseCPUOnly") & 1) != 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  -[MLModelEngine configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "computeUnits"))
  {

    goto LABEL_8;
  }
  if (LOBYTE(self->_compilerOutput))
  {
    v10 = BYTE1(self->_compilerOutput);

    if (!v10)
      goto LABEL_19;
LABEL_9:
    v11 = 1;
    v12 = 1;
    if (!BYTE3(self->_transferSession))
      goto LABEL_13;
    goto LABEL_10;
  }

LABEL_19:
  v11 = 0;
LABEL_10:
  if (BYTE3(self->_transferSession))
    v12 = v11 ^ 1;
  else
    v12 = 0;
LABEL_13:
  if ((v12 & 1) != 0 || (_DWORD)v13 != -[MLNeuralNetworkEngine priority](self, "priority"))
  {
    -[MLNeuralNetworkEngine _deallocContextAndPlan](self, "_deallocContextAndPlan");
    v14 = -[MLNeuralNetworkEngine _setupContextAndPlanWithForceCPU:priority:error:](self, "_setupContextAndPlanWithForceCPU:priority:error:", v11, v13, a4);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (NSMutableDictionary)inputBlobNameToLastBackingMode
{
  return (NSMutableDictionary *)self->_predictionsQueue;
}

- (int)_espressoDeviceForConfiguration:(id)a3 error:(id *)a4
{
  return -3;
}

- (BOOL)rebuildPlan:(BOOL)a3 error:(id *)a4
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;
  void *v54;
  _BYTE buf[18];
  _BYTE v56[128];
  uint64_t v57;

  v41 = a3;
  v57 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = self->_classLabels;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[MLNeuralNetworkEngine network](self, "network");
        v11 = objc_retainAutorelease(v10);
        objc_msgSend(v11, "UTF8String");
        v12 = espresso_network_declare_input();
        if ((_DWORD)v12)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v39 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = v39;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v12;
            _os_log_error_impl(&dword_19C486000, v30, OS_LOG_TYPE_ERROR, "Error in declaring input %s with error %d.", buf, 0x12u);
          }

          if (a4)
          {
            v31 = (void *)MEMORY[0x1E0CB35C8];
            v53 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in declaring input %s with error %d."), objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), v12);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v33);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          return 0;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v7)
        continue;
      break;
    }
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = self->_classScoreVectorName;
  v14 = -[NSString countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v43;
    while (2)
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        -[MLNeuralNetworkEngine network](self, "network");
        v18 = objc_retainAutorelease(v17);
        objc_msgSend(v18, "UTF8String");
        v19 = espresso_network_declare_output();
        if ((_DWORD)v19)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v40 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = v40;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            _os_log_error_impl(&dword_19C486000, v34, OS_LOG_TYPE_ERROR, "Error in declaring output %s with error %d.", buf, 0x12u);
          }

          if (a4)
          {
            v35 = (void *)MEMORY[0x1E0CB35C8];
            v50 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in declaring output %s with error %d."), objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), v19);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v37);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          return 0;
        }
      }
      v14 = -[NSString countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v14)
        continue;
      break;
    }
  }

  Espresso::get_internal_network();
  v20 = -[MLNeuralNetworkEngine copyImagePreprocessingParametersTo:error:](self, "copyImagePreprocessingParametersTo:error:", *(_QWORD *)buf, a4);
  v21 = v20;
  v22 = *(std::__shared_weak_count **)&buf[8];
  if (!*(_QWORD *)&buf[8])
    goto LABEL_21;
  v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (v24)
  {
LABEL_21:
    if (v20)
      goto LABEL_22;
    return 0;
  }
  ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
  std::__shared_weak_count::__release_weak(v22);
  if (!v21)
    return 0;
LABEL_22:
  -[MLNeuralNetworkEngine plan](self, "plan");
  v25 = espresso_plan_build();
  if (!v25)
    return 1;
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v25;
    _os_log_error_impl(&dword_19C486000, v26, OS_LOG_TYPE_ERROR, "Error plan build: %d.", buf, 8u);
  }

  if (-[MLNeuralNetworkEngine engine](self, "engine") != 10007)
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Error in building plan."));
      v29 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v29;
    }
    return 0;
  }
  -[MLNeuralNetworkEngine setIsANEPathForbidden:](self, "setIsANEPathForbidden:", 1);
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C486000, v27, OS_LOG_TYPE_INFO, "Hardware fall back after plan build failure.", buf, 2u);
  }

  -[MLNeuralNetworkEngine setHardwareFallbackDetected:](self, "setHardwareFallbackDetected:", 1);
  -[MLModelEngine configuration](self, "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[MLNeuralNetworkEngine _setupContextAndPlanWithConfiguration:usingCPU:priority:reshapeWithContainer:error:](self, "_setupContextAndPlanWithConfiguration:usingCPU:priority:reshapeWithContainer:error:", v28, 0, -[MLNeuralNetworkEngine priority](self, "priority"), v41, a4);

  return v29;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  MLVersionInfo **p_compilerVersionInfo;
  MLVersionInfo *compilerVersionInfo;
  MLVersionInfo *v4;
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  p_compilerVersionInfo = &self->_compilerVersionInfo;
  compilerVersionInfo = self->_compilerVersionInfo;
  v4 = p_compilerVersionInfo[1];
  result.var1 = (int)v4;
  result.var0 = compilerVersionInfo;
  return result;
}

- (void)plan
{
  return (void *)self->_numInputs;
}

- (BOOL)rebuildPlan:(id *)a3
{
  return -[MLNeuralNetworkEngine rebuildPlan:error:](self, "rebuildPlan:error:", 0, a3);
}

- (BOOL)modelIsEncrypted
{
  return BYTE6(self->_transferSession);
}

- (BOOL)copyImagePreprocessingParametersTo:(void *)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t **v11;
  uint64_t i;
  char *v18;
  void **v19;
  char *v20;
  uint64_t **v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, Espresso::vimage2espresso_param>, void *>>> *begin_node;
  _BYTE *v27;
  char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  MLNeuralNetworkEngine *left;
  MLNeuralNetworkEngine *v33;
  char v34;
  std::string::size_type size;
  NSObject *v36;
  void *v37;
  std::string *v38;
  void *v39;
  void *v40;
  std::string *v42;
  id obj;
  void *__p[2];
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  std::string v51;
  std::string *p_buf;
  uint64_t v53;
  void *v54;
  std::string buf;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  memset(&v51, 0, sizeof(v51));
  if (-[MLNeuralNetworkEngine isEspressoBiasPreprocessingShared](self, "isEspressoBiasPreprocessingShared"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[MLNeuralNetworkEngine inputLayers](self, "inputLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v48;
      v9 = (char *)a3 + 232;
      v10 = (char *)a3 + 240;
      v11 = (uint64_t **)((char *)a3 + 328);
      __asm { FMOV            V9.2S, #1.0 }
      obj = v6;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v48 != v8)
            objc_enumerationMutation(obj);
          std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i)), "UTF8String"));
          v18 = (char *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)v9, &buf);
          if (v10 == v18 || !v18[56])
          {
            if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v51.__r_.__value_.__l.__data_);
            v51 = buf;
            v6 = obj;
            goto LABEL_31;
          }
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("placeHolderInputName"), "UTF8String"));
          v19 = (void **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)&self->_params, &p_buf, __p);
          v20 = (char *)*v19;
          if (!*v19)
          {
            v21 = (uint64_t **)v19;
            v20 = (char *)operator new(0x88uLL);
            *((_OWORD *)v20 + 2) = *(_OWORD *)__p;
            *((_QWORD *)v20 + 6) = v46;
            __p[1] = 0;
            v46 = 0;
            __p[0] = 0;
            *((_DWORD *)v20 + 14) = 1065353216;
            *(_QWORD *)(v20 + 76) = 0;
            *(_QWORD *)(v20 + 68) = 0;
            *((_DWORD *)v20 + 21) = 0;
            *(_QWORD *)(v20 + 60) = 0x100000000;
            *((_DWORD *)v20 + 32) = 0;
            *((_QWORD *)v20 + 14) = 0;
            *((_QWORD *)v20 + 15) = 0;
            *((_QWORD *)v20 + 11) = 0;
            *((_QWORD *)v20 + 12) = 0;
            *((_QWORD *)v20 + 13) = _D9;
            std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at((uint64_t **)&self->_params, (uint64_t)p_buf, v21, (uint64_t *)v20);
          }
          p_buf = &buf;
          v22 = std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v11, &buf, (__int128 **)&p_buf);
          *(_OWORD *)(v22 + 56) = *(_OWORD *)(v20 + 56);
          v23 = *(_OWORD *)(v20 + 72);
          v24 = *(_OWORD *)(v20 + 88);
          v25 = *(_OWORD *)(v20 + 104);
          *(_OWORD *)(v22 + 116) = *(_OWORD *)(v20 + 116);
          *(_OWORD *)(v22 + 104) = v25;
          *(_OWORD *)(v22 + 88) = v24;
          *(_OWORD *)(v22 + 72) = v23;
          if (SHIBYTE(v46) < 0)
            operator delete(__p[0]);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf.__r_.__value_.__l.__data_);
        }
        v6 = obj;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_31:

  }
  else
  {
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, Espresso::vimage2espresso_param>, void *>>> *)self->_params.__tree_.__begin_node_;
    if (begin_node != &self->_params.__tree_.__pair1_)
    {
      while (1)
      {
        v27 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)a3 + 232, &begin_node[4].__value_.__left_);
        if ((char *)a3 + 240 == v27 || !v27[56])
          break;
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&begin_node[4];
        v28 = std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 41, &begin_node[4].__value_.__left_, (__int128 **)&buf);
        *(_OWORD *)(v28 + 56) = *(_OWORD *)&begin_node[7].__value_.__left_;
        v29 = *(_OWORD *)&begin_node[9].__value_.__left_;
        v30 = *(_OWORD *)&begin_node[11].__value_.__left_;
        v31 = *(_OWORD *)&begin_node[13].__value_.__left_;
        *(_OWORD *)(v28 + 116) = *(_OWORD *)((char *)&begin_node[14].__value_.__left_ + 4);
        *(_OWORD *)(v28 + 104) = v31;
        *(_OWORD *)(v28 + 88) = v30;
        *(_OWORD *)(v28 + 72) = v29;
        left = (MLNeuralNetworkEngine *)begin_node[1].__value_.__left_;
        if (left)
        {
          do
          {
            v33 = left;
            left = (MLNeuralNetworkEngine *)left->super.super.isa;
          }
          while (left);
        }
        else
        {
          do
          {
            v33 = (MLNeuralNetworkEngine *)begin_node[2].__value_.__left_;
            _ZF = v33->super.super.isa == (Class)begin_node;
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, Espresso::vimage2espresso_param>, void *>>> *)v33;
          }
          while (!_ZF);
        }
        begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, Espresso::vimage2espresso_param>, void *>>> *)v33;
        if (v33 == (MLNeuralNetworkEngine *)&self->_params.__tree_.__pair1_)
          goto LABEL_33;
      }
      std::string::operator=(&v51, (const std::string *)&begin_node[4]);
    }
  }
LABEL_33:
  v34 = HIBYTE(v51.__r_.__value_.__r.__words[2]);
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v51.__r_.__value_.__r.__words[2]);
  else
    size = v51.__r_.__value_.__l.__size_;
  if (size)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v42 = &v51;
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v42 = (std::string *)v51.__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
      _os_log_error_impl(&dword_19C486000, v36, OS_LOG_TYPE_ERROR, "Error in passing image pre-processing parameters for %s to network.", (uint8_t *)&buf, 0xCu);
    }

    v34 = HIBYTE(v51.__r_.__value_.__r.__words[2]);
    if (a4)
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      v38 = &v51;
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v38 = (std::string *)v51.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in passing image pre-processing parameters for %s to network."), v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v34 = HIBYTE(v51.__r_.__value_.__r.__words[2]);
    }
  }
  if (v34 < 0)
    operator delete(v51.__r_.__value_.__l.__data_);
  return size == 0;
}

- (BOOL)isEspressoBiasPreprocessingShared
{
  return BYTE4(self->_transferSession);
}

- (BOOL)_setMultipleBuffersOnPlan:(void *)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_handleAddNetworkToPlanStatus:(int)a3 error:(id *)a4
{
  uint64_t v4;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *context;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;
  _QWORD v28[2];

  v4 = *(_QWORD *)&a3;
  v28[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = v4;
        _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Failed to build the model execution plan using in-memory model with error code: %d.", buf, 8u);
      }

      if (a4)
      {
        v8 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to build the model execution plan using in-memory model with error code: %d."), v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        *a4 = v11;

      }
    }
    else
    {
      v12 = self->_context == 0;
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v24) = v4;
          _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Failed to build the model execution plan with error code: %d.", buf, 8u);
        }

        if (a4)
        {
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v19 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to build the model execution plan with error code: %d."), v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      else
      {
        if (v14)
        {
          context = self->_context;
          *(_DWORD *)buf = 138412546;
          v24 = context;
          v25 = 1024;
          v26 = v4;
          _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Failed to build the model execution plan using a model architecture file '%@' with error code: %d.", buf, 0x12u);
        }

        if (a4)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v21 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to build the model execution plan using a model architecture file '%@' with error code: %d."), self->_context, v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
    }
  }
  return (_DWORD)v4 == 0;
}

- (BOOL)_addNetworkToPlan:(void *)a3 error:(id *)a4
{
  void *context;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_)
    return -[MLNeuralNetworkEngine _addCompiledNetworkOrProgramToPlan:error:](self, "_addCompiledNetworkOrProgramToPlan:error:", a3, a4);
  context = self->_context;
  if (context)
  {
    objc_msgSend(context, "UTF8String", a3);
    return -[MLNeuralNetworkEngine _handleAddNetworkToPlanStatus:error:](self, "_handleAddNetworkToPlanStatus:error:", espresso_plan_add_network(), a4);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "The model file path was not specified.", v12, 2u);
    }

    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The model file path was not specified."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

- (id)populateOutputs:(unint64_t)a3 outputBackings:(id)a4 directlyBoundOutputFeatureNames:(id)a5 error:(id *)a6
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  char v21;
  CFTypeID v22;
  char v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void **v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v37)(_QWORD);
  id v38;
  MLDictionaryFeatureProvider *v39;
  void *v40;
  id v41;
  id v42;
  NSString *obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  void *__p[2];
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD aBlock[5];
  _BYTE v55[128];
  uint64_t v56;
  void *v57;
  _BYTE buf[12];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v41 = a4;
  v42 = a5;
  v10 = -[MLModelEngine signpostID](self, "signpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__MLNeuralNetworkEngine_populateOutputs_outputBackings_directlyBoundOutputFeatureNames_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v10;
  v37 = (void (**)(_QWORD))_Block_copy(aBlock);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_modelVersionInfo);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = self->_classScoreVectorName;
  v11 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v11)
  {
    v38 = *(id *)v51;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(id *)v51 != v38)
        objc_enumerationMutation(obj);
      v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v12));
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));
      v14 = *(_QWORD *)std::map<std::string,std::string>::at((uint64_t)self->_outputBuffers.__begin_ + 24 * a3, __p);
      -[MLModelEngine modelDescription](self, "modelDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "outputDescriptionsByName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "objectForKeyedSubscript:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v42, "containsObject:", v13);
      if (v17 && objc_msgSend(v17, "type") == 4)
      {
        v20 = v18 != 0;
        if (v18)
          v21 = v19;
        else
          v21 = 1;
        if ((v21 & 1) == 0)
        {
          v22 = CFGetTypeID(v18);
          if (v22 != CVPixelBufferGetTypeID())
            goto LABEL_46;
LABEL_21:
          -[MLNeuralNetworkEngine imageFeatureValueFromEbuf:backingCVPixelBuffer:description:error:](self, "imageFeatureValueFromEbuf:backingCVPixelBuffer:description:error:", v14, v18, v17, a6);
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
      }
      else
      {
        if (v18)
          v23 = v19;
        else
          v23 = 1;
        v20 = 3;
        if (v18)
          v20 = 4;
        if ((v23 & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_46:
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v13;
              _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "The specified output backing object is not compatible with the output feature named '%@'.", buf, 0xCu);
            }

            if (a6)
            {
              v33 = (void *)MEMORY[0x1E0CB35C8];
              v56 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The specified output backing object is not compatible with the output feature named '%@'."), v13, 296);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = v34;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v35);
              *a6 = (id)objc_claimAutoreleasedReturnValue();

            }
LABEL_50:

            if (v49 < 0)
              operator delete(__p[0]);
            v39 = 0;
            goto LABEL_53;
          }
LABEL_23:
          -[MLNeuralNetworkEngine multiArrayFeatureValueFromEbuf:backingMultiArray:description:outputName:error:](self, "multiArrayFeatureValueFromEbuf:backingMultiArray:description:outputName:error:", v14, v18, v17, v13, a6);
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
      }
      switch(v20)
      {
        case 0:
          goto LABEL_21;
        case 1:
          objc_msgSend(v17, "imageConstraint");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "pixelType");

          if (v26 != 10
            && v26 != 40
            && !-[MLNeuralNetworkEngine opacifyAndPermutePixelBuffer:bufferContainsBGRA:error:](self, "opacifyAndPermutePixelBuffer:bufferContainsBGRA:error:", v18, v26 == 30, a6))
          {
            goto LABEL_50;
          }
          +[MLFeatureValue featureValueWithPixelBuffer:](MLFeatureValue, "featureValueWithPixelBuffer:", v18);
          v24 = objc_claimAutoreleasedReturnValue();
          break;
        case 3:
          goto LABEL_23;
        case 4:
          +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v18);
          v24 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          goto LABEL_50;
      }
LABEL_29:
      v27 = (void *)v24;
      if (!v24)
        goto LABEL_50;
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v24, v13);

      if (v49 < 0)
        operator delete(__p[0]);
      if (v11 == ++v12)
      {
        v11 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

  v39 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:]([MLDictionaryFeatureProvider alloc], "initWithFeatureValueDictionary:", v40);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = self->_classScoreVectorName;
  v28 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(obj);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i)), "UTF8String"));
        v31 = *(void ***)std::map<std::string,std::string>::at((uint64_t)self->_outputBuffers.__begin_ + 24 * a3, __p);
        *(_QWORD *)buf = __p;
        if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (__int128 **)buf)[56])free(*v31);
        if (v49 < 0)
          operator delete(__p[0]);
      }
      v28 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v28);
  }
LABEL_53:

  v37[2](v37);
  return v39;
}

- (BOOL)collectParametersFromContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  int v8;
  uint64_t context;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  MLNeuralNetworkEngine *v14;
  uint64_t v15;
  NSDictionary *defaultOptionalValues;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *classLabels;
  uint64_t v21;
  NSString *classScoreVectorName;
  uint64_t v23;
  NSArray *inputLayers;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  MLFeatureProviderConformer *inputFeatureConformer;
  uint64_t v31;
  void *plan;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  id v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  int v46;
  int v47;
  id v48;
  void *v49;
  int v50;
  int v51;
  id v52;
  void *v53;
  int v54;
  int v55;
  id v56;
  void *v57;
  int v58;
  int v59;
  id v60;
  void *v61;
  int v62;
  int v63;
  BOOL v64;
  uint64_t *v65;
  int v66;
  uint64_t **p_params;
  uint64_t v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  char *v75;
  char **v76;
  BOOL v77;
  dispatch_semaphore_t v78;
  id probabilityDictionarySharedKeySet;
  NSObject *v80;
  dispatch_queue_t v81;
  NSString *modelFilePath;
  NSObject *v83;
  dispatch_queue_t v84;
  OS_dispatch_semaphore *bufferSemaphore;
  void **p_begin;
  unint64_t size;
  unint64_t value;
  unint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  __int128 v97;
  dispatch_semaphore_t v98;
  OS_dispatch_queue *espressoQueue;
  uint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t j;
  id v105;
  void *v106;
  void *begin;
  id v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t k;
  id v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  uint64_t v119;
  NSMutableDictionary *outputBlobNameToLastBackingMode;
  uint64_t v121;
  NSDictionary *espressoInputShapes;
  uint64_t v123;
  MLPixelBufferPool *pixelBufferPool;
  _BOOL4 v125;
  _anonymous_namespace_ *v126;
  MLPredictionOptions *v127;
  OS_dispatch_queue *v128;
  OS_dispatch_queue *predictionsQueue;
  OS_dispatch_semaphore *v130;
  OS_dispatch_semaphore *submitSemaphore;
  MLPixelBufferPool *v132;
  NSDictionary *optionalInputTypes;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  BOOL v138;
  MLFeatureProviderConformer *v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  void *v144;
  uint64_t v145;
  EspressoProfilingNetworkInfo *espressoProfileInfo;
  id v148;
  id v149;
  char v150;
  char v151;
  MLNeuralNetworkEngine *v152;
  id obj;
  NSArray *v154;
  NSString *v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  char **v168;
  char *v169[2];
  char **v170;
  char *v171[2];
  char **v172;
  char *v173[2];
  char **v174;
  char *v175[2];
  char **v176;
  char *v177[2];
  char **v178;
  char *v179[2];
  char **v180;
  char *v181[2];
  std::string __p;
  std::string *p_p;
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  uint64_t v187;

  v187 = *MEMORY[0x1E0C80C00];
  v149 = a3;
  v148 = a4;
  v152 = self;
  if (objc_msgSend(v148, "computeUnits") && objc_msgSend(v148, "computeUnits") != 3)
  {
    v8 = -[MLNeuralNetworkEngine _espressoDeviceForConfiguration:error:](self, "_espressoDeviceForConfiguration:error:", v148, a5);
    if (a5 && v8 == -1)
      *a5 = 0;
    objc_msgSend((id)objc_opt_class(), "gpuEngine");
    context = espresso_create_context();
    LOBYTE(self->_compilerOutput) = context == 0;
    if (context)
      espresso_context_destroy();
  }
  else
  {
    LOBYTE(self->_compilerOutput) = 1;
  }
  if ((objc_msgSend(v148, "computeUnits") == 2 || objc_msgSend(v148, "computeUnits") == 3)
    && (+[MLNeuralEngineComputeDeviceRegistry sharedRegistry](MLNeuralEngineComputeDeviceRegistry, "sharedRegistry"), v10 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v10, "registeredAndAccessibleComputeDevices"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v12 = objc_msgSend(v11, "count"), v11, v10, v12))
  {
    v13 = espresso_create_context();
    v14 = self;
    BYTE1(self->_compilerOutput) = v13 == 0;
    if (v13)
      espresso_context_destroy();
  }
  else
  {
    v14 = self;
    BYTE1(self->_compilerOutput) = 1;
  }
  BYTE2(v14->_transferSession) = objc_msgSend(v149, "modelIsMIL");
  objc_msgSend(v149, "activeFunction");
  v15 = objc_claimAutoreleasedReturnValue();
  defaultOptionalValues = v14->_defaultOptionalValues;
  v14->_defaultOptionalValues = (NSDictionary *)v15;

  BYTE6(v14->_transferSession) = objc_msgSend(v149, "modelIsEncrypted");
  objc_msgSend(v149, "modelFilePath");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v14->_context;
  v14->_context = (void *)v17;

  objc_msgSend(v149, "inputLayerNames");
  v19 = objc_claimAutoreleasedReturnValue();
  classLabels = v14->_classLabels;
  v14->_classLabels = (NSArray *)v19;

  objc_msgSend(v149, "outputLayerNames");
  v21 = objc_claimAutoreleasedReturnValue();
  classScoreVectorName = v14->_classScoreVectorName;
  v14->_classScoreVectorName = (NSString *)v21;

  v14->_espressoInputStrides = (NSDictionary *)-[NSArray count](v14->_classLabels, "count");
  v14->_modelVersionInfo = (MLVersionInfo *)-[NSString count](v14->_classScoreVectorName, "count");
  objc_msgSend(v149, "imagePreprocessingParams");
  v23 = objc_claimAutoreleasedReturnValue();
  inputLayers = v14->_inputLayers;
  v14->_inputLayers = (NSArray *)v23;

  objc_msgSend(v149, "classScoreVectorName");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(void **)&v14->_priority;
  *(_QWORD *)&v14->_priority = v25;

  objc_msgSend(v149, "classLabels");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = *(void **)&v14->_engine;
  *(_QWORD *)&v14->_engine = v27;

  objc_msgSend(v149, "optionalInputDefaultValues");
  v29 = objc_claimAutoreleasedReturnValue();
  inputFeatureConformer = v14->_inputFeatureConformer;
  v14->_inputFeatureConformer = (MLFeatureProviderConformer *)v29;

  if (*(_QWORD *)&v14->_engine)
  {
    +[MLProbabilityDictionary sharedKeySetForLabels:](MLProbabilityDictionary, "sharedKeySetForLabels:");
    v31 = objc_claimAutoreleasedReturnValue();
    plan = v14->_plan;
    v14->_plan = (void *)v31;
  }
  else
  {
    plan = v14->_plan;
    v14->_plan = 0;
  }

  espresso_tmp_enable_montreal();
  objc_msgSend(v149, "imageParameters");
  v181[0] = 0;
  v181[1] = 0;
  v179[1] = 0;
  v180 = v181;
  v178 = v179;
  v179[0] = 0;
  v177[0] = 0;
  v177[1] = 0;
  v175[1] = 0;
  v176 = v177;
  v174 = v175;
  v175[0] = 0;
  v173[0] = 0;
  v173[1] = 0;
  v171[1] = 0;
  v172 = v173;
  v170 = v171;
  v171[0] = 0;
  v169[0] = 0;
  v169[1] = 0;
  v168 = v169;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, v186, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v165;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v165 != v35)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "BOOLValue");
        v41 = objc_retainAutorelease(v37);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v41, "UTF8String"));
        p_p = &__p;
        *((_BYTE *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v180, &__p, (_OWORD **)&p_p)+ 56) = v40;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);

        objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "BOOLValue");
        v44 = objc_retainAutorelease(v41);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v44, "UTF8String"));
        p_p = &__p;
        *((_BYTE *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v178, &__p, (_OWORD **)&p_p)+ 56) = v43;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);

        objc_msgSend(v38, "objectAtIndexedSubscript:", 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "floatValue");
        v47 = v46;
        v48 = objc_retainAutorelease(v44);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v48, "UTF8String"));
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v176, &__p, (_OWORD **)&p_p)+ 14) = v47;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);

        objc_msgSend(v38, "objectAtIndexedSubscript:", 3);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "floatValue");
        v51 = v50;
        v52 = objc_retainAutorelease(v48);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v52, "UTF8String"));
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v174, &__p, (_OWORD **)&p_p)+ 14) = v51;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);

        objc_msgSend(v38, "objectAtIndexedSubscript:", 4);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "floatValue");
        v55 = v54;
        v56 = objc_retainAutorelease(v52);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v56, "UTF8String"));
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v172, &__p, (_OWORD **)&p_p)+ 14) = v55;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);

        objc_msgSend(v38, "objectAtIndexedSubscript:", 5);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "floatValue");
        v59 = v58;
        v60 = objc_retainAutorelease(v56);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v60, "UTF8String"));
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v170, &__p, (_OWORD **)&p_p)+ 14) = v59;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);

        objc_msgSend(v38, "objectAtIndexedSubscript:", 6);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "floatValue");
        v63 = v62;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v60), "UTF8String"));
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v168, &__p, (_OWORD **)&p_p)+ 14) = v63;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);

        v64 = (unint64_t)objc_msgSend(v38, "count") > 7;
        v33 |= v64;
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v164, v186, 16);
    }
    while (v34);
  }

  v65 = (uint64_t *)v168;
  if (v168 != v169)
  {
    do
    {
      if (*((char *)v65 + 55) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v65[4], v65[5]);
      else
        __p = *(std::string *)(v65 + 4);
      v66 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v168, &__p);
      p_params = (uint64_t **)&v152->_params;
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v152->_params, &__p, (__int128 **)&p_p)+ 14) = v66;
      v68 = *std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)&v180, &p_p, &__p);
      if (!v68)
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      v69 = *(unsigned __int8 *)(v68 + 56);
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (__int128 **)&p_p)+ 17) = v69;
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (__int128 **)&p_p)+ 15) = 0;
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (__int128 **)&p_p)+ 16) = 1;
      v70 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v174, &__p);
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (__int128 **)&p_p)+ 19) = v70;
      p_p = &__p;
      if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v180, &__p, (__int128 **)&p_p)[56])
      {
        v71 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v172, &__p);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (__int128 **)&p_p)+ 18) = v71;
        v72 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v176, &__p);
      }
      else
      {
        v73 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v176, &__p);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (__int128 **)&p_p)+ 18) = v73;
        v72 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v172, &__p);
      }
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (__int128 **)&p_p)+ 20) = v72;
      p_p = &__p;
      if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v178, &__p, (__int128 **)&p_p)[56])
      {
        v74 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v170, &__p);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (__int128 **)&p_p)+ 18) = v74;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v75 = (char *)v65[1];
      if (v75)
      {
        do
        {
          v76 = (char **)v75;
          v75 = *(char **)v75;
        }
        while (v75);
      }
      else
      {
        do
        {
          v76 = (char **)v65[2];
          v77 = *v76 == (char *)v65;
          v65 = (uint64_t *)v76;
        }
        while (!v77);
      }
      v65 = (uint64_t *)v76;
    }
    while (v76 != v169);
  }
  v78 = dispatch_semaphore_create(2);
  probabilityDictionarySharedKeySet = v152->_probabilityDictionarySharedKeySet;
  v152->_probabilityDictionarySharedKeySet = v78;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = dispatch_queue_create("com.apple.CoreMLBatchProcessingQueue", v80);
  modelFilePath = v152->_modelFilePath;
  v152->_modelFilePath = (NSString *)&v81->isa;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v83 = objc_claimAutoreleasedReturnValue();
  v84 = dispatch_queue_create("com.apple.CoreMLNNProcessingQueue", v83);
  bufferSemaphore = v152->_bufferSemaphore;
  v152->_bufferSemaphore = (OS_dispatch_semaphore *)v84;

  p_begin = (void **)&v152->_bufferAvailable.__begin_;
  size = v152->_bufferAvailable.__size_;
  if (size > 1)
  {
    v152->_bufferAvailable.__size_ = 2;
  }
  else
  {
    value = v152->_bufferAvailable.__cap_alloc_.__value_;
    v89 = 2 - size;
    if (value << 6 < 2 - size || size > (value << 6) - (2 - size))
    {
      memset(&__p, 0, sizeof(__p));
      v92 = value << 7;
      if (value << 7 <= 0x40)
        v92 = 64;
      if (value << 6 >= 0x3FFFFFFFFFFFFFFFLL)
        v93 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v93 = v92;
      std::vector<BOOL>::reserve(&__p.__r_.__value_.__l.__data_, v93);
      v95 = *p_begin;
      v94 = v152->_bufferAvailable.__size_;
      __p.__r_.__value_.__l.__size_ = v94 + v89;
      v90 = (_QWORD *)__p.__r_.__value_.__r.__words[0];
      if (v94 < 1)
      {
        LODWORD(v91) = 0;
      }
      else
      {
        v96 = v94 >> 6;
        if ((unint64_t)(v94 + 63) >= 0x7F)
          memmove(__p.__r_.__value_.__l.__data_, v95, 8 * v96);
        v91 = v94 - (v96 << 6);
        v90 += v96;
        if (v91 < 1)
          LODWORD(v91) = 0;
        else
          *v90 = *v90 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v91) | *((_QWORD *)v95 + v96) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v91);
        v95 = *p_begin;
      }
      *p_begin = (void *)__p.__r_.__value_.__r.__words[0];
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v95;
      v97 = *(_OWORD *)&v152->_bufferAvailable.__size_;
      *(_OWORD *)&v152->_bufferAvailable.__size_ = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
      *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = v97;
      if (v95)
        operator delete(v95);
    }
    else
    {
      v90 = *p_begin;
      LODWORD(v91) = size & 0x3F;
      v152->_bufferAvailable.__size_ = 2;
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v90;
    LODWORD(__p.__r_.__value_.__r.__words[1]) = v91;
    std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&__p, v89);
  }
  v98 = dispatch_semaphore_create(1);
  espressoQueue = v152->_espressoQueue;
  v152->_espressoQueue = (OS_dispatch_queue *)v98;

  BYTE4(v152->_transferSession) = v33 & 1;
  std::vector<std::map<std::string,espresso_buffer_t *>>::resize((char ***)&v152->_inputBuffers);
  v100 = 0;
  v101 = 1;
  do
  {
    v150 = v101;
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v154 = v152->_classLabels;
    v102 = -[NSArray countByEnumeratingWithState:objects:count:](v154, "countByEnumeratingWithState:objects:count:", &v160, v185, 16);
    if (v102)
    {
      v103 = *(_QWORD *)v161;
      do
      {
        for (j = 0; j != v102; ++j)
        {
          if (*(_QWORD *)v161 != v103)
            objc_enumerationMutation(v154);
          v105 = *(id *)(*((_QWORD *)&v160 + 1) + 8 * j);
          v106 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
          begin = v152->_inputBuffers.__begin_;
          v108 = objc_retainAutorelease(v105);
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v108, "UTF8String"));
          p_p = &__p;
          *((_QWORD *)std::__tree<std::__value_type<std::string,espresso_buffer_t *>,std::__map_value_compare<std::string,std::__value_type<std::string,espresso_buffer_t *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,espresso_buffer_t *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)begin + 24 * v100, &__p, (_OWORD **)&p_p)+ 7) = v106;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);

        }
        v102 = -[NSArray countByEnumeratingWithState:objects:count:](v154, "countByEnumeratingWithState:objects:count:", &v160, v185, 16);
      }
      while (v102);
    }

    v101 = 0;
    v100 = 1;
  }
  while ((v150 & 1) != 0);
  std::vector<std::map<std::string,espresso_buffer_t *>>::resize((char ***)&v152->_outputBuffers);
  v109 = 0;
  v110 = 1;
  do
  {
    v151 = v110;
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v155 = v152->_classScoreVectorName;
    v111 = -[NSString countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v156, v184, 16);
    if (v111)
    {
      v112 = *(_QWORD *)v157;
      do
      {
        for (k = 0; k != v111; ++k)
        {
          if (*(_QWORD *)v157 != v112)
            objc_enumerationMutation(v155);
          v114 = *(id *)(*((_QWORD *)&v156 + 1) + 8 * k);
          v115 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
          v116 = v152->_outputBuffers.__begin_;
          v117 = objc_retainAutorelease(v114);
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v117, "UTF8String"));
          p_p = &__p;
          *((_QWORD *)std::__tree<std::__value_type<std::string,espresso_buffer_t *>,std::__map_value_compare<std::string,std::__value_type<std::string,espresso_buffer_t *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,espresso_buffer_t *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v116 + 24 * v109, &__p, (_OWORD **)&p_p)+ 7) = v115;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);

        }
        v111 = -[NSString countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v156, v184, 16);
      }
      while (v111);
    }

    v110 = 0;
    v109 = 1;
  }
  while ((v151 & 1) != 0);
  HIBYTE(v152->_transferSession) = objc_msgSend(v149, "hasOptionalInputSequenceConcat");
  BYTE5(v152->_transferSession) = objc_msgSend(v149, "hasBidirectionalLayer");
  objc_msgSend(v149, "optionalInputTypes");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "copy");
  outputBlobNameToLastBackingMode = v152->_outputBlobNameToLastBackingMode;
  v152->_outputBlobNameToLastBackingMode = (NSMutableDictionary *)v119;

  BYTE1(v152->_transferSession) = objc_msgSend(v149, "ndArrayInterpretation");
  objc_msgSend(v149, "modelVersionInfo");
  v121 = objc_claimAutoreleasedReturnValue();
  espressoInputShapes = v152->_espressoInputShapes;
  v152->_espressoInputShapes = (NSDictionary *)v121;

  objc_msgSend(v149, "compilerVersionInfo");
  v123 = objc_claimAutoreleasedReturnValue();
  pixelBufferPool = v152->_pixelBufferPool;
  v152->_pixelBufferPool = (MLPixelBufferPool *)v123;

  v125 = !LOBYTE(v152->_compilerOutput) && (objc_msgSend(v148, "allowBackgroundGPUCompute") & 1) != 0;
  *(_DWORD *)&v152->_isEspressoBiasPreprocessingShared = v125;
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v126 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();

  v128 = (OS_dispatch_queue *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  predictionsQueue = v152->_predictionsQueue;
  v152->_predictionsQueue = v128;

  v130 = (OS_dispatch_semaphore *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  submitSemaphore = v152->_submitSemaphore;
  v152->_submitSemaphore = v130;

  v132 = objc_alloc_init(MLPixelBufferPool);
  optionalInputTypes = v152->_optionalInputTypes;
  v152->_optionalInputTypes = (NSDictionary *)v132;

  objc_msgSend(v149, "compilerOutput");
  v134 = objc_claimAutoreleasedReturnValue();
  v135 = (void *)v152->_OutputBlobIsDynamic.__tree_.__pair3_.__value_;
  v152->_OutputBlobIsDynamic.__tree_.__pair3_.__value_ = v134;

  objc_msgSend(v149, "modelDescription");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "inputDescriptionsByName");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v137 == 0;

  if (!v138)
  {
    v139 = [MLFeatureProviderConformer alloc];
    objc_msgSend(v136, "inputDescriptionsByName");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "allValues");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "optionalInputDefaultValues");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v149, "ndArrayInterpretation");
    objc_msgSend(v149, "optionalInputTypes");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = -[MLFeatureProviderConformer initWithFeatureDescriptions:defaultValues:usingRank5Mapping:optionalInputTypes:passthroughStateFeatures:](v139, "initWithFeatureDescriptions:defaultValues:usingRank5Mapping:optionalInputTypes:passthroughStateFeatures:", v141, v142, v143 ^ 1u, v144, 0);
    espressoProfileInfo = v152->_espressoProfileInfo;
    v152->_espressoProfileInfo = (EspressoProfilingNetworkInfo *)v145;

  }
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v169[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v171[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v173[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v175[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v177[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v179[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v181[0]);

  return 1;
}

uint64_t __94__MLNeuralNetworkEngine_populateOutputs_outputBackings_directlyBoundOutputFeatureNames_error___block_invoke()
{
  return kdebug_trace();
}

+ (int)gpuEngine
{
  return 5;
}

- (unint64_t)predictionTypeForKTrace
{
  return 41;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  kdebug_trace();
  objc_msgSend((id)objc_msgSend(a1, "containerClass"), "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v12, v13, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainer:configuration:error:", v15, v14, a7);
  else
    v16 = 0;

  kdebug_trace();
  return v16;
}

- (MLNeuralNetworkEngine)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t **v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t **v20;
  uint64_t **v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t **v30;
  BOOL v31;
  MLNeuralNetworkEngine *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t **v38;
  uint64_t **v39;
  uint64_t **v40;
  uint64_t **v41;
  uint64_t **v42;
  uint64_t **v43;
  id v44;
  uint64_t **v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  void *v52;
  uint8_t buf[8];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t **)a3;
  v44 = a4;
  v45 = v8;
  objc_msgSend(v8, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46.receiver = self;
  v46.super_class = (Class)MLNeuralNetworkEngine;
  v10 = -[MLModelEngine initWithDescription:configuration:](&v46, sel_initWithDescription_configuration_, v9, v44);

  if (v10)
  {
    objc_msgSend(v8, "modelDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputDescriptionsByName");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v48 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "type") == 8;

          if (v18)
          {

            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19C486000, v33, OS_LOG_TYPE_ERROR, "The model uses stateful prediction, but this model engine doesn't support it.", buf, 2u);
            }

            if (a5)
            {
              v34 = (void *)MEMORY[0x1E0CB35C8];
              v51 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The model uses stateful prediction, but this model engine doesn't support it."));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v35;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v36);
              *a5 = (id)objc_claimAutoreleasedReturnValue();

            }
            v32 = 0;
            goto LABEL_27;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
        if (v14)
          continue;
        break;
      }
    }

    v19 = v44;
    if (!objc_msgSend(v10, "collectParametersFromContainer:configuration:error:", v8, v44, a5)
      || (objc_msgSend(v10, "_setupContextAndPlanWithConfiguration:priority:error:", v44, objc_msgSend(v10, "priority"), a5) & 1) == 0)
    {
      v32 = 0;
      goto LABEL_28;
    }
    v21 = v8 + 1;
    v20 = (uint64_t **)v8[1];
    v43 = v8 + 2;
    if (v20 != v8 + 2)
    {
      v41 = v8 + 7;
      v42 = v8 + 4;
      v39 = v8 + 13;
      v40 = v8 + 10;
      v38 = v8 + 16;
      do
      {
        *(_QWORD *)buf = v20 + 4;
        v22 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v21, v20 + 4, (__int128 **)buf)+ 14);
        *(_QWORD *)buf = v20 + 4;
        v23 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v42, v20 + 4, (__int128 **)buf)+ 14);
        *(_QWORD *)buf = v20 + 4;
        v24 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v41, v20 + 4, (__int128 **)buf)+ 14);
        *(_QWORD *)buf = v20 + 4;
        v25 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v40, v20 + 4, (__int128 **)buf)+ 14);
        *(_QWORD *)buf = v20 + 4;
        v26 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v39, v20 + 4, (__int128 **)buf)+ 14);
        *(_QWORD *)buf = v20 + 4;
        v27 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v38, v20 + 4, (__int128 **)buf)+ 14);
        *(_QWORD *)buf = v20 + 4;
        v28 = std::__tree<std::__value_type<std::string,_BlobShape>,std::__map_value_compare<std::string,std::__value_type<std::string,_BlobShape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,_BlobShape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)v10 + 13, v20 + 4, (__int128 **)buf);
        *((_DWORD *)v28 + 14) = v22;
        *((_DWORD *)v28 + 15) = v23;
        *((_DWORD *)v28 + 16) = v24;
        *((_DWORD *)v28 + 17) = v25;
        *((_DWORD *)v28 + 18) = v26;
        *((_DWORD *)v28 + 19) = v27;
        v29 = v20[1];
        if (v29)
        {
          do
          {
            v30 = (uint64_t **)v29;
            v29 = (uint64_t *)*v29;
          }
          while (v29);
        }
        else
        {
          do
          {
            v30 = (uint64_t **)v20[2];
            v31 = *v30 == (uint64_t *)v20;
            v20 = v30;
          }
          while (!v31);
        }
        v20 = v30;
        v8 = v45;
      }
      while (v30 != v43);
    }
  }
  v32 = (MLNeuralNetworkEngine *)v10;
LABEL_27:
  v19 = v44;
LABEL_28:

  return v32;
}

- (BOOL)recordsPredictionEvent
{
  void *v2;
  void *v3;
  char v4;

  -[MLNeuralNetworkEngine activeFunction](self, "activeFunction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *bufferSemaphore;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2979;
  v31 = __Block_byref_object_dispose__2980;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2979;
  v25 = __Block_byref_object_dispose__2980;
  bufferSemaphore = self->_bufferSemaphore;
  v26 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MLNeuralNetworkEngine_predictionFromFeatures_options_error___block_invoke;
  block[3] = &unk_1E3D65300;
  block[4] = self;
  v11 = v9;
  v17 = v11;
  v19 = &v21;
  v20 = &v27;
  v12 = v8;
  v18 = v12;
  dispatch_sync(bufferSemaphore, block);
  if (a5)
  {
    v13 = (void *)v22[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (int64_t)inputBindStateForFeatureValue:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CVBuffer *v9;
  signed int PixelFormatType;
  unsigned int v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  _BYTE v39[10];
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
LABEL_16:
    v12 = 2;
    goto LABEL_42;
  }
  v7 = objc_msgSend(v5, "type");
  v8 = v7;
  if (v7 == 5)
  {
    objc_msgSend(v6, "multiArrayValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "dataType");
    v15 = v14;
    if (v14 > 65599)
    {
      if (v14 == 65600)
      {
        v12 = 10;
        goto LABEL_41;
      }
      if (v14 == 131104)
      {
        v12 = 11;
        goto LABEL_41;
      }
    }
    else
    {
      if (v14 == 65552)
      {
        if (objc_msgSend(v13, "pixelBuffer")
          && CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v13, "pixelBuffer")))
        {
          v12 = 8;
        }
        else
        {
          v12 = 9;
        }
        goto LABEL_41;
      }
      if (v14 == 65568)
      {
        v12 = 12;
LABEL_41:

        goto LABEL_42;
      }
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v39 = v15;
      _os_log_error_impl(&dword_19C486000, v26, OS_LOG_TYPE_ERROR, "Invalid multi-array data type: %08x.", buf, 8u);
    }

    if (a4)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid multi-array data type: %08x."), v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = 2;
    goto LABEL_41;
  }
  if (v7 != 4)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v39 = v31;
      _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "Unsupported input feature type: %@", buf, 0xCu);

    }
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v18 = (void *)MEMORY[0x1E0CB3940];
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Unsupported input feature type: %@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_16;
  }
  v9 = (__CVBuffer *)objc_msgSend(v6, "imageBufferValue");
  PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
  v11 = PixelFormatType;
  if (PixelFormatType <= 1278226487)
  {
    if (PixelFormatType == 32)
    {
      v12 = 3;
      goto LABEL_42;
    }
    if (PixelFormatType == 1111970369)
    {
      v12 = 4;
      goto LABEL_42;
    }
    goto LABEL_25;
  }
  if (PixelFormatType == 1278226488)
  {
    v12 = 5;
    goto LABEL_42;
  }
  if (PixelFormatType != 1278226536)
  {
LABEL_25:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v39 = HIBYTE(v11);
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = BYTE2(v11);
      v40 = 1024;
      v41 = BYTE1(v11);
      v42 = 1024;
      v43 = v11;
    }

    if (a4)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v25);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_16;
  }
  if (CVPixelBufferGetIOSurface(v9))
    v12 = 6;
  else
    v12 = 7;
LABEL_42:

  return v12;
}

- (BOOL)bindInputFeatureNamed:(id)a3 convertingMultiArray:(id)a4 bufferIndex:(unint64_t)a5 error:(id *)a6
{
  void *begin;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  char v25;
  MLMultiArray *v26;
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
  id v38;
  id v39;
  id v41;
  _OWORD *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  uint64_t v45;
  void *v46;
  _BYTE buf[12];
  __int16 v48;
  int v49;
  char v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v39 = a4;
  -[MLNeuralNetworkEngine prepareBlobNamed:forNewBlobBackingMode:bindMode:](self, "prepareBlobNamed:forNewBlobBackingMode:bindMode:", v38, 0x10000, 0x10000);
  begin = self->_inputBuffers.__begin_;
  v10 = objc_retainAutorelease(v38);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v10, "UTF8String"));
  v42 = buf;
  v11 = (_QWORD *)*((_QWORD *)std::__tree<std::__value_type<std::string,espresso_buffer_t *>,std::__map_value_compare<std::string,std::__value_type<std::string,espresso_buffer_t *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,espresso_buffer_t *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)begin + 24 * a5, buf, &v42)+ 7);
  if (v50 < 0)
    operator delete(*(void **)buf);
  v41 = objc_retainAutorelease(v10);
  objc_msgSend(v41, "UTF8String");
  v12 = espresso_network_bind_buffer();
  if (!(_DWORD)v12)
  {
    if (BYTE1(self->_transferSession))
    {
      objc_msgSend(v39, "shape");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v20 = 1;
      v21 = -1;
      while (v19 < objc_msgSend(v17, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:atIndexedSubscript:", v22, v21 + objc_msgSend(v17, "count"));

        objc_msgSend(v17, "objectAtIndexedSubscript:", v21 + objc_msgSend(v17, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "integerValue");

        v20 = (v20 * v24);
        ++v19;
        --v21;
      }
      v26 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:]([MLMultiArray alloc], "initWithDataPointer:shape:dataType:strides:deallocator:error:", *v11, v17, 65568, v18, 0, a6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[14]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v27;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[13]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v28;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[12]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v29;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[11]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v44[3] = v30;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[10]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44[4] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[19]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v32;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[18]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v33;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[17]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = v34;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[16]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v43[3] = v35;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11[15]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v43[4] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:]([MLMultiArray alloc], "initWithDataPointer:shape:dataType:strides:deallocator:error:", *v11, v17, 65568, v18, 0, a6);
    }
    v15 = v26;

    if (v15)
    {
      -[MLModelEngine signpostID](self, "signpostID");
      kdebug_trace();
      v25 = objc_msgSend(v39, "copyIntoMultiArray:error:", v15, a6);
      kdebug_trace();
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    v25 = 0;
    goto LABEL_18;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v41;
    v48 = 1024;
    v49 = v12;
    _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Failed to bind the input feature named '%@' to the underlying inference engine due to an error: %d.", buf, 0x12u);
  }

  if (a6)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to bind the input feature named '%@' to the underlying inference engine due to an error: %d."), v41, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v25 = 0;
LABEL_19:

  return v25;
}

- (BOOL)bindDynamicOutputBuffers:(const void *)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v17;
  NSString *obj;
  void *__p[2];
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  uint8_t v29[128];
  uint8_t buf[8];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_classScoreVectorName;
  v5 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    v17 = *MEMORY[0x1E0CB2D50];
    v7 = 1;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v6)
        objc_enumerationMutation(obj);
      v9 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8));
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v9, "UTF8String"));
      *(_QWORD *)buf = __p;
      if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (__int128 **)buf)[56]&& (-[MLNeuralNetworkEngine prepareBlobNamed:forNewBlobBackingMode:bindMode:](self, "prepareBlobNamed:forNewBlobBackingMode:bindMode:", v9, 0x10000, 0x20000), std::map<std::string,std::string>::at((uint64_t)a3, __p), v10 = espresso_network_bind_buffer(), (_DWORD)v10))
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v10;
          _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Unable to bind dynamic shape outputs with error code: %d.", buf, 8u);
        }

        if (a4)
        {
          v12 = (void *)MEMORY[0x1E0CB35C8];
          v27 = v17;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to bind dynamic shape outputs with error code: %d."), v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v14);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v7 = 0;
        v15 = 0;
      }
      else
      {
        v15 = 1;
      }
      if (v22 < 0)
        operator delete(__p[0]);
      if (!v15)
        break;
      if (v5 == ++v8)
      {
        v5 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v7 = 1;
  }

  return v7 & 1;
}

- (void)prepareBlobNamed:(id)a3 forNewBlobBackingMode:(int64_t)a4 bindMode:(int)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (a5 == 0x10000)
    -[MLNeuralNetworkEngine inputBlobNameToLastBackingMode](self, "inputBlobNameToLastBackingMode");
  else
    -[MLNeuralNetworkEngine outputBlobNameToLastBackingMode](self, "outputBlobNameToLastBackingMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "integerValue") != a4)
  {
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    espresso_network_unbind_buffer();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v12);

}

- (NSMutableDictionary)outputBlobNameToLastBackingMode
{
  return (NSMutableDictionary *)self->_submitSemaphore;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 10) = (char *)self + 88;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 19) = (char *)self + 160;
  *(_OWORD *)((char *)self + 184) = 0uLL;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 25) = (char *)self + 208;
  return self;
}

- (id)evaluateInputs:(id)a3 bufferIndex:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *begin;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0;
  v13 = -[MLNeuralNetworkEngine bindInputFeatures:bufferIndex:cleanUpBlocks:directlyBoundFeatureNames:error:](self, "bindInputFeatures:bufferIndex:cleanUpBlocks:directlyBoundFeatureNames:error:", v10, a4, v12, &v37, a6);
  v14 = v37;
  if (v13
    && -[MLNeuralNetworkEngine updateDynamicOutputBlobIndicatorCacheAndReturnError:](self, "updateDynamicOutputBlobIndicatorCacheAndReturnError:", a6))
  {
    objc_msgSend(v11, "outputBackings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "automaticOutputBackingMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLNeuralNetworkEngine completeOutputBackings:automaticOutputBackingMode:error:](self, "completeOutputBackings:automaticOutputBackingMode:error:", v15, v16, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = v11;
      v30 = v11;
      begin = (char *)self->_outputBuffers.__begin_;
      objc_msgSend(v18, "automaticOutputBackingMode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v21 = -[MLNeuralNetworkEngine bindOutputBuffers:outputBackings:automaticOutputBackingMode:directlyBoundOutputFeatureNames:error:](self, "bindOutputBuffers:outputBackings:automaticOutputBackingMode:directlyBoundOutputFeatureNames:error:", &begin[24 * a4], v17, v20, &v36, a6);
      v31 = v36;

      v11 = v30;
      if (v21)
      {
        if (!-[MLNeuralNetworkEngine executePlan:error:](self, "executePlan:error:", -[MLNeuralNetworkEngine plan](self, "plan"), a6))goto LABEL_22;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v29 = v17;
        objc_msgSend(v12, "reverseObjectEnumerator");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v33 != v24)
                objc_enumerationMutation(v22);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i) + 16))();
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          }
          while (v23);
        }

        v17 = v29;
        if (-[MLNeuralNetworkEngine bindDynamicOutputBuffers:error:](self, "bindDynamicOutputBuffers:error:", (char *)self->_outputBuffers.__begin_ + 24 * a4, a6))
        {
          v11 = v30;
          -[MLNeuralNetworkEngine populateOutputs:outputBackings:directlyBoundOutputFeatureNames:error:](self, "populateOutputs:outputBackings:directlyBoundOutputFeatureNames:error:", a4, v29, v31, a6);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26
            && objc_msgSend(v30, "hasDirectBindingExpectations")
            && (objc_msgSend(v30, "validateExpectationsWithDirectlyBoundInputs:outputs:error:", v14, v31, a6) & 1) == 0)
          {
            v27 = 0;
          }
          else
          {
            v27 = v26;
          }

        }
        else
        {
LABEL_22:
          v27 = 0;
          v11 = v30;
        }
        goto LABEL_23;
      }
    }
    else
    {
      v31 = 0;
    }
    v27 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v27 = 0;
LABEL_24:

  return v27;
}

- (BOOL)updateDynamicOutputBlobIndicatorCacheAndReturnError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t is_dynamic;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  NSString *obj;
  void *__p[2];
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  _BYTE buf[12];
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_classScoreVectorName;
  v5 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    v16 = *MEMORY[0x1E0CB2D50];
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7));
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
        is_dynamic = espresso_blob_is_dynamic();
        if ((_DWORD)is_dynamic)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v8;
            v27 = 1024;
            v28 = is_dynamic;
            _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Failed to determine whether the output feature named '%@' has a dynamic shape with error: %d.", buf, 0x12u);
          }

          if (a3)
          {
            v11 = (void *)MEMORY[0x1E0CB35C8];
            v24 = v16;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to determine whether the output feature named '%@' has a dynamic shape with error: %d."), v8, is_dynamic);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v13);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          *(_QWORD *)buf = __p;
          std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (__int128 **)buf)[56] = 0;
        }
        if (v19 < 0)
          operator delete(__p[0]);
        if ((_DWORD)is_dynamic)
        {
          v14 = 0;
          goto LABEL_19;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v5)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_19:

  return v14;
}

- (BOOL)executePlan:(void *)a3 error:(id *)a4
{
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  int v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[MLNeuralNetworkEngine submitSemaphore](self, "submitSemaphore");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  kdebug_trace();
  v7 = espresso_plan_execute_sync();
  if ((_DWORD)v7)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v7;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Unable to compute the prediction using a neural network model. It can be an invalid input data or broken/unsupported model (error code: %d).", buf, 8u);
    }

    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to compute the prediction using a neural network model. It can be an invalid input data or broken/unsupported model (error code: %d)."), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  kdebug_trace();
  -[MLNeuralNetworkEngine submitSemaphore](self, "submitSemaphore");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v12);

  return (_DWORD)v7 == 0;
}

- (OS_dispatch_semaphore)submitSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 408, 1);
}

- (id)completeOutputBackings:(id)a3 automaticOutputBackingMode:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  char v25;
  int blob_shape;
  void **v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  NSString *obj;
  NSString *obja;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  void *__p[2];
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  void *v65;
  uint8_t v66[128];
  _BYTE buf[12];
  __int16 buf_12;
  int buf_14;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v49 = a4;
  v50 = v7;
  v47 = (void *)objc_msgSend(v7, "mutableCopy");
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = self->_classScoreVectorName;
  v8 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v61 != v9)
          objc_enumerationMutation(obj);
        v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i));
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
        *(_QWORD *)buf = __p;
        if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (__int128 **)buf)[56])goto LABEL_29;
        objc_msgSend(v50, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (!v13)
          goto LABEL_29;
        objc_msgSend(v49, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", CFSTR("MLAutomaticOutputBackingModeDisabled"));

        if ((v15 & 1) != 0)
          goto LABEL_29;
        -[MLNeuralNetworkEngine activeFunction](self, "activeFunction");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if ((v18 & 1) != 0)
        {
          -[MLModelEngine modelDescription](self, "modelDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "outputDescriptionsByName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "multiArrayConstraint");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "imageConstraint");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            -[MLNeuralNetworkEngine outputBackingMultiArrayForFeatureName:](self, "outputBackingMultiArrayForFeatureName:", v11);
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v21, "isAllowedValue:", v24);

              if ((v25 & 1) != 0)
                goto LABEL_23;
            }
            goto LABEL_28;
          }
          if (!v48)
          {
            v23 = 0;
LABEL_23:

LABEL_24:
            objc_msgSend(v47, "setObject:forKeyedSubscript:", v23, v11);
            goto LABEL_30;
          }
          v57 = 0;
          objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          blob_shape = espresso_network_query_blob_shape();
          if (blob_shape)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v27 = __p;
              if (v59 < 0)
                v27 = (void **)__p[0];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v27;
              buf_12 = 1024;
              buf_14 = blob_shape;
              v28 = v23;
              v29 = "Failed to get the output shape for feature: %s to fabricate the output backing buffer (err: %d). Thi"
                    "s is not expected but we go on without output backing.";
              v30 = 18;
LABEL_27:
              _os_log_error_impl(&dword_19C486000, v28, OS_LOG_TYPE_ERROR, v29, buf, v30);
            }
          }
          else
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v57;
              v28 = v23;
              v29 = "The output shape's rank is %lu but it only supports rank-4 for image output. Proceeding without output backing.";
              v30 = 12;
              goto LABEL_27;
            }
          }
LABEL_28:

LABEL_29:
          v23 = 0;
          goto LABEL_30;
        }
        -[MLNeuralNetworkEngine outputBackingMultiArrayForFeatureName:](self, "outputBackingMultiArrayForFeatureName:", v11);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
          goto LABEL_24;
LABEL_30:

        if (v59 < 0)
          operator delete(__p[0]);
      }
      v8 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v8);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obja = self->_classScoreVectorName;
  v31 = -[NSString countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v54;
    while (2)
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v54 != v32)
          objc_enumerationMutation(obja);
        v34 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
        objc_msgSend(v49, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v35, "isEqual:", CFSTR("MLAutomaticOutputBackingModeForced")) & 1) != 0)
        {
          objc_msgSend(v47, "objectForKeyedSubscript:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36 == 0;

          if (v37)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v34;
              _os_log_error_impl(&dword_19C486000, v40, OS_LOG_TYPE_ERROR, "Forced automatic output backings was requested but we couldn't fabricate the output buffer for feature named '%@'.", buf, 0xCu);
            }

            if (a5)
            {
              v42 = (void *)MEMORY[0x1E0CB35C8];
              v64 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forced automatic output backings was requested but we couldn't fabricate the output buffer for feature named '%@'."), v34);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v43;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v44);
              *a5 = (id)objc_claimAutoreleasedReturnValue();

            }
            v39 = 0;
            v38 = v47;
            goto LABEL_51;
          }
        }
        else
        {

        }
      }
      v31 = -[NSString countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      if (v31)
        continue;
      break;
    }
  }

  v38 = v47;
  v39 = v47;
LABEL_51:

  return v39;
}

- (BOOL)bindOutputBuffers:(const void *)a3 outputBackings:(id)a4 automaticOutputBackingMode:(id)a5 directlyBoundOutputFeatureNames:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  __CVBuffer *v23;
  id v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v44;
  id v45;
  uint64_t v46;
  NSString *obj;
  uint64_t v49;
  id v50;
  unsigned int v52;
  void *__p[2];
  char v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  _BYTE buf[12];
  __int16 v64;
  int v65;
  uint64_t v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v50 = a4;
  v44 = a5;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = self->_classScoreVectorName;
  v9 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (!v9)
  {
    v29 = 0;
    v45 = 0;
    goto LABEL_54;
  }
  v45 = 0;
  v49 = *(_QWORD *)v56;
  v46 = *MEMORY[0x1E0CB2D50];
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v56 != v49)
        objc_enumerationMutation(obj);
      v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v10));
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
      *(_QWORD *)buf = __p;
      if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (__int128 **)buf)[56])
      {
        objc_msgSend(v50, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {
          v29 = 3;
          goto LABEL_41;
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v11;
          _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "Output backings cannot be used for a dynamic output feature named '%@'.", buf, 0xCu);
        }

        if (!a7)
        {
          v29 = 1;
          goto LABEL_41;
        }
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v66 = v46;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Output backings cannot be used for a dynamic output feature named '%@'."), v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v17);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      objc_msgSend(v50, "objectForKeyedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLModelEngine modelDescription](self, "modelDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "outputDescriptionsByName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[MLNeuralNetworkEngine activeFunction](self, "activeFunction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToString:", v21);

      if (v22)
      {
        v23 = -[MLNeuralNetworkEngine pixelBufferFromOutputBacking:forFeature:](self, "pixelBufferFromOutputBacking:forFeature:", v16, v17);
        if (v23)
        {
          if (CVPixelBufferGetPixelFormatType(v23) == 1278226536)
          {
            -[MLNeuralNetworkEngine prepareBlobNamed:forNewBlobBackingMode:bindMode:](self, "prepareBlobNamed:forNewBlobBackingMode:bindMode:", v11, -1, 0x20000);
            v24 = objc_retainAutorelease(v11);
            objc_msgSend(v24, "UTF8String");
            v25 = espresso_network_bind_cvpixelbuffer();
            if (!v25)
            {
              v40 = v45;
              if (!v45)
                v40 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
              v45 = v40;
              objc_msgSend(v40, "addObject:", v24);
              v29 = 3;
              goto LABEL_40;
            }
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v24;
              v64 = 1024;
              v65 = v25;
              _os_log_impl(&dword_19C486000, v26, OS_LOG_TYPE_INFO, "Performance warning: Failed to directly bind output pixel buffer for output feature named '%@' with error: %i. Continuing with non-direct output binding.", buf, 0x12u);
            }

          }
        }
      }
      v52 = 0x10000;
      v27 = *(_QWORD *)std::map<std::string,std::string>::at((uint64_t)a3, __p);
      if (!-[MLNeuralNetworkEngine tryToSetOutputBacking:forFeatureName:toEbuf:reportPointerFlags:error:](self, "tryToSetOutputBacking:forFeatureName:toEbuf:reportPointerFlags:error:", v16, v11, v27, &v52, a7))goto LABEL_39;
      if (v52 == 0x10000)
      {
        objc_msgSend(v44, "objectForKeyedSubscript:", v11);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqual:", CFSTR("MLAutomaticOutputBackingModeForced"));

        if (v31)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v11;
            _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "Forced automatic output backings was requested but we couldn't bind the fabricate output buffer for feature named '%@'.", buf, 0xCu);
          }

          if (!a7)
            goto LABEL_39;
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v61 = v46;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forced automatic output backings was requested but we couldn't bind the fabricate output buffer for feature named '%@'."), v11);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_38;
        }
        *(_QWORD *)(v27 + 160) = 0;
        *(_OWORD *)(v27 + 128) = 0u;
        *(_OWORD *)(v27 + 144) = 0u;
        *(_OWORD *)(v27 + 96) = 0u;
        *(_OWORD *)(v27 + 112) = 0u;
        *(_OWORD *)(v27 + 64) = 0u;
        *(_OWORD *)(v27 + 80) = 0u;
        *(_OWORD *)(v27 + 32) = 0u;
        *(_OWORD *)(v27 + 48) = 0u;
        *(_OWORD *)v27 = 0u;
        *(_OWORD *)(v27 + 16) = 0u;
      }
      else if (v52 == 0x20000)
      {
        v28 = v45;
        if (!v45)
          v28 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v45 = v28;
        objc_msgSend(v28, "addObject:", v11);
      }
      -[MLNeuralNetworkEngine prepareBlobNamed:forNewBlobBackingMode:bindMode:](self, "prepareBlobNamed:forNewBlobBackingMode:bindMode:", v11, v52, 0x20000);
      v37 = espresso_network_bind_buffer();
      if (!(_DWORD)v37)
      {
        v29 = 0;
        goto LABEL_40;
      }
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v11;
        v64 = 1024;
        v65 = v37;
        _os_log_error_impl(&dword_19C486000, v38, OS_LOG_TYPE_ERROR, "Failed to bind output feature named '%@' with error: %d.", buf, 0x12u);
      }

      if (a7)
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v59 = v46;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to bind output feature named '%@' with error: %d."), v11, v37);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:
        *a7 = v36;

      }
LABEL_39:
      v29 = 1;
LABEL_40:

LABEL_41:
      if (v54 < 0)
        operator delete(__p[0]);
      if (v29 != 3 && v29)
        goto LABEL_54;
      ++v10;
    }
    while (v9 != v10);
    v41 = -[NSString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    v9 = v41;
  }
  while (v41);
  v29 = 0;
LABEL_54:

  if (a6 && !v29)
    *a6 = objc_retainAutorelease(v45);

  return v29 == 0;
}

void __62__MLNeuralNetworkEngine_predictionFromFeatures_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  _QWORD aBlock[5];
  id v28;
  id obj;

  v2 = (void *)MEMORY[0x1A1AD6ED8]();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "_matchEngineToOptions:error:", v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if ((v6 & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(id *)(v10 + 40);
    objc_msgSend(v7, "evaluateInputs:options:error:", v9, v8, &v28);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v10 + 40), v28);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "classLabels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);

    if (v16)
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
      kdebug_trace();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__MLNeuralNetworkEngine_predictionFromFeatures_options_error___block_invoke_2;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v17;
      v18 = (void (**)(_QWORD))_Block_copy(aBlock);
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v20 = *(void **)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v26 = *(id *)(v22 + 40);
      objc_msgSend(v20, "addClassifierInformationToOutput:options:error:", v19, v21, &v26);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v22 + 40), v26);
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

      v18[2](v18);
    }
  }
  objc_autoreleasePoolPop(v2);
}

- (id)evaluateInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  -[MLNeuralNetworkEngine activeFunction](self, "activeFunction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);
  if (v8)
    v13 = v12;
  else
    v13 = 0;

  -[MLNeuralNetworkEngine evaluateInputs:options:verifyInputs:error:](self, "evaluateInputs:options:verifyInputs:error:", v8, v9, v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)evaluateInputs:(id)a3 options:(id)a4 verifyInputs:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  NSObject *modelFilePath;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  MLNeuralNetworkEngine *v24;
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  kdebug_trace();
  v12 = v10;
  v13 = v12;
  if (v7)
  {
    -[MLNeuralNetworkEngine verifyInputs:error:](self, "verifyInputs:error:", v12, a6);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v14;
    if (!v14)
      goto LABEL_7;
  }
  else
  {
    v15 = v12;
    if (!v12)
      goto LABEL_6;
  }
  if (!-[MLNeuralNetworkEngine resetSizes:error:](self, "resetSizes:error:", v15, a6))
  {
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
LABEL_6:
  v16 = -[MLNeuralNetworkEngine obtainBuffer](self, "obtainBuffer");
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2979;
  v34 = __Block_byref_object_dispose__2980;
  v35 = 0;
  modelFilePath = self->_modelFilePath;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __67__MLNeuralNetworkEngine_evaluateInputs_options_verifyInputs_error___block_invoke_131;
  v23 = &unk_1E3D651E8;
  v27 = &v30;
  v24 = self;
  v15 = v15;
  v25 = v15;
  v28 = v16;
  v26 = v11;
  v29 = a6;
  dispatch_sync(modelFilePath, &v20);
  -[MLNeuralNetworkEngine releaseBuffer:](self, "releaseBuffer:", v16, v20, v21, v22, v23, v24);
  v18 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
LABEL_8:

  kdebug_trace();
  return v18;
}

- (id)verifyInputs:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  id v11;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = -[MLModelEngine signpostID](self, "signpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__MLNeuralNetworkEngine_verifyInputs_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLNeuralNetworkEngine inputFeatureConformer](self, "inputFeatureConformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MLNeuralNetworkEngine inputFeatureConformer](self, "inputFeatureConformer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conformFeatures:error:", v6, a4);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v6;
  }
  v8[2](v8);

  return v11;
}

- (MLFeatureProviderConformer)inputFeatureConformer
{
  return (MLFeatureProviderConformer *)objc_getProperty(self, a2, 448, 1);
}

uint64_t __44__MLNeuralNetworkEngine_verifyInputs_error___block_invoke()
{
  return kdebug_trace();
}

- (BOOL)resetSizes:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v10;
  BOOL v11;
  id v12;
  id v14;
  id v15;

  v6 = a3;
  v7 = kdebug_trace();
  v8 = (void *)MEMORY[0x1A1AD6ED8](v7);
  if (!-[MLNeuralNetworkEngine usingEspressoConfigurations](self, "usingEspressoConfigurations"))
  {
    v10 = 0;
    goto LABEL_5;
  }
  v15 = 0;
  v9 = -[MLNeuralNetworkEngine resetSizesWithEspressoConfigurations:error:](self, "resetSizesWithEspressoConfigurations:error:", v6, &v15);
  v10 = v15;
  if (!v9)
  {
LABEL_5:
    v14 = v10;
    v11 = -[MLNeuralNetworkEngine resetSizesNoAutoRelease:error:](self, "resetSizesNoAutoRelease:error:", v6, &v14);
    v12 = v14;

    v10 = v12;
    goto LABEL_6;
  }
  v11 = 1;
LABEL_6:
  objc_autoreleasePoolPop(v8);
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);

  kdebug_trace();
  return v11;
}

- (BOOL)usingEspressoConfigurations
{
  return self->_flexibleShapesConfigNamesInNet.__tree_.__pair3_.__value_ != 0;
}

- (BOOL)resetSizesNoAutoRelease:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  map<std::string, _BlobShape, std::less<std::string>, std::allocator<std::pair<const std::string, _BlobShape>>> *p_currentBlobShapes;
  __CVBuffer *v8;
  int Width;
  int Height;
  OSType PixelFormatType;
  int v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  BOOL v66;
  uint64_t v67;
  Class begin_node;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  _DWORD *v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  _DWORD *v89;
  int v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  char *v99;
  int v100;
  char *v101;
  char *v102;
  char *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  char *v109;
  int v110;
  char *v111;
  char *v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  char *v119;
  int v120;
  char *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  char *v129;
  int v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  char *v144;
  int v145;
  int v146;
  MLNeuralNetworkEngine *isa;
  MLNeuralNetworkEngine *v148;
  BOOL v149;
  void *v150;
  NSObject *v151;
  map<std::string, _BlobShape, std::less<std::string>, std::allocator<std::pair<const std::string, _BlobShape>>> *v152;
  void *v153;
  void *v154;
  void *v155;
  BOOL v156;
  char v157;
  NSObject *v158;
  void *v159;
  uint64_t v160;
  int v161;
  char v162;
  id obj;
  char v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  map<std::string, _BlobShape, std::less<std::string>, std::allocator<std::pair<const std::string, _BlobShape>>> *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v176;
  uint64_t *v177;
  void *v178;
  int v179;
  int v180;
  unsigned int v181;
  void *v182;
  uint8_t v183[8];
  void *v184;
  char *v185;
  unint64_t v186;
  void *v187;
  char *v188;
  unint64_t v189;
  void *v190;
  char *v191;
  unint64_t v192;
  void *v193;
  char *v194;
  unint64_t v195;
  void *__p;
  char *v197;
  unint64_t v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  MLNeuralNetworkEngine *v203;
  uint64_t v204;
  void *v205;
  __int128 buf;
  unint64_t v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  void *v215;
  uint8_t v216[8];
  _QWORD *v217;
  unint64_t v218;
  _BYTE v219[128];
  uint64_t v220;

  v220 = *MEMORY[0x1E0C80C00];
  v168 = a3;
  objc_msgSend(v168, "featureNames");
  v203 = 0;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
  if (!v4)
  {

    goto LABEL_88;
  }
  v170 = 0;
  v171 = 0;
  v162 = 0;
  v165 = 0;
  v166 = *(_QWORD *)v200;
  v160 = *MEMORY[0x1E0CB2D50];
LABEL_3:
  v5 = 0;
  v167 = v4;
  while (1)
  {
    if (*(_QWORD *)v200 != v166)
      objc_enumerationMutation(obj);
    v176 = v5;
    v6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v199 + 1) + 8 * v5));
    std::string::basic_string[abi:ne180100]<0>(v216, (char *)objc_msgSend(v6, "UTF8String"));
    p_currentBlobShapes = &self->_currentBlobShapes;
    *(_QWORD *)&buf = v216;
    v177 = std::__tree<std::__value_type<std::string,_BlobShape>,std::__map_value_compare<std::string,std::__value_type<std::string,_BlobShape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,_BlobShape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentBlobShapes, v216, (__int128 **)&buf);
    objc_msgSend(v168, "featureValueForName:", v6);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = &self->_currentBlobShapes;
    if (objc_msgSend(v178, "type") != 4)
    {
      objc_msgSend(v178, "multiArrayValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shape");
      v182 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v182, "count");
      v16 = v15;
      if (BYTE1(self->_transferSession))
      {
        if (v15)
        {
          v161 = v15;
          if ((int)v15 < 1)
          {
            v12 = 1;
            v179 = 1;
            v180 = 1;
            v181 = 1;
            v13 = 1;
          }
          else
          {
            v17 = 0;
            v18 = (v15 - 1);
            v19 = (int)v15 - 5;
            v172 = (v15 - 4);
            v173 = (v15 - 3);
            v174 = (v15 - 2);
            v13 = 1;
            v180 = 1;
            v181 = 1;
            v179 = 1;
            v12 = 1;
            do
            {
              if (!v17)
              {
                objc_msgSend(v182, "objectAtIndexedSubscript:", v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v180 = objc_msgSend(v20, "integerValue");

              }
              if (!(v18 - v174 + v17))
              {
                objc_msgSend(v182, "objectAtIndexedSubscript:", v174);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v179 = objc_msgSend(v21, "integerValue");

              }
              if (!(v18 - v173 + v17))
              {
                objc_msgSend(v182, "objectAtIndexedSubscript:", v173);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v22, "integerValue");

              }
              if (!(v18 - v172 + v17))
              {
                objc_msgSend(v182, "objectAtIndexedSubscript:", v172);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v23, "integerValue");

              }
              if (v18 + v17 <= v19)
              {
                objc_msgSend(v182, "objectAtIndexedSubscript:");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "integerValue");

                v181 *= v25;
              }
              --v17;
            }
            while (v18 + v17 + 1 > 0);
          }
          if (*((_DWORD *)v177 + 19) != v161)
          {
            if (!v203)
            {
              v34 = operator new();
              std::map<std::string,_BlobShape>::map[abi:ne180100](v34, v169);
              *(_QWORD *)&buf = 0;
              std::unique_ptr<std::map<std::string,_BlobShape>>::reset[abi:ne180100]((uint64_t *)&v203, v34);
              std::unique_ptr<std::map<std::string,_BlobShape>>::reset[abi:ne180100]((uint64_t *)&buf, 0);
            }
            *((_DWORD *)v177 + 19) = v161;
          }
LABEL_50:

          p_currentBlobShapes = &self->_currentBlobShapes;
          goto LABEL_51;
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = 0;
          _os_log_error_impl(&dword_19C486000, v31, OS_LOG_TYPE_ERROR, "Incorrect input number of dimensions %lul (must be 1 or greater).", (uint8_t *)&buf, 0xCu);
        }

        if (!a4)
        {
LABEL_38:

          v33 = 0;
          goto LABEL_69;
        }
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v212 = v160;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incorrect input number of dimensions %lul (must be 1 or greater)."), 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v213 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v213, &v212, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((unint64_t)(v15 - 6) >= 0xFFFFFFFFFFFFFFFBLL)
        {
          switch(v15)
          {
            case 1:
              objc_msgSend(v182, "objectAtIndexedSubscript:", 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v35, "integerValue");

              v13 = 1;
              v180 = 1;
              v181 = 1;
              v179 = 1;
              goto LABEL_50;
            case 2:
            case 4:
              break;
            case 3:
              -[MLModelEngine modelDescription](self, "modelDescription");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v36)
                goto LABEL_49;
              -[MLModelEngine modelDescription](self, "modelDescription");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "inputDescriptionsByName");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "objectForKeyedSubscript:", v6);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "multiArrayConstraint");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "shape");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "count") == 3;

              if (v42)
              {
                objc_msgSend(v182, "objectAtIndexedSubscript:", 0);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v43, "integerValue");

                objc_msgSend(v182, "objectAtIndexedSubscript:", 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v43) = objc_msgSend(v44, "integerValue");

                objc_msgSend(v182, "objectAtIndexedSubscript:", 2);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v45, "integerValue");

                v179 = (int)v43;
                v180 = v46;
                v181 = 1;
                v13 = 1;
              }
              else
              {
LABEL_49:
                objc_msgSend(v182, "objectAtIndexedSubscript:", 2);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v53, "integerValue");

                objc_msgSend(v182, "objectAtIndexedSubscript:", 1);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v54, "integerValue");

                objc_msgSend(v182, "objectAtIndexedSubscript:", 0);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v181 = objc_msgSend(v55, "integerValue");

                v179 = 1;
                v180 = 1;
              }
              goto LABEL_50;
            default:
              objc_msgSend(v182, "objectAtIndexedSubscript:", 2);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v47, "integerValue");

              objc_msgSend(v182, "objectAtIndexedSubscript:", 4);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "integerValue");

              objc_msgSend(v182, "objectAtIndexedSubscript:", 3);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v48) = objc_msgSend(v50, "integerValue");

              objc_msgSend(v182, "objectAtIndexedSubscript:", 1);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v51, "integerValue");

              objc_msgSend(v182, "objectAtIndexedSubscript:", 0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v51) = objc_msgSend(v52, "integerValue");

              v179 = (int)v48;
              v180 = v49;
              v181 = v51;
              goto LABEL_50;
          }
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = v16;
          _os_log_error_impl(&dword_19C486000, v26, OS_LOG_TYPE_ERROR, "Incorrect input number of dimensions %lul (must be 1, 3, or 5 dimensions).", (uint8_t *)&buf, 0xCu);
        }

        if (!a4)
          goto LABEL_38;
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v214 = v160;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incorrect input number of dimensions %lul (must be 1, 3, or 5 dimensions)."), v16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v215 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *a4 = v30;

      goto LABEL_38;
    }
    v8 = (__CVBuffer *)objc_msgSend(v178, "imageBufferValue");
    Width = CVPixelBufferGetWidth(v8);
    Height = CVPixelBufferGetHeight(v8);
    PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
    v179 = Height;
    v180 = Width;
    if (PixelFormatType == 1278226536 || PixelFormatType == 1278226488)
    {
      v12 = 1;
      v181 = 1;
      v13 = 1;
    }
    else
    {
      v181 = 1;
      v12 = 3;
      v13 = 1;
    }
LABEL_51:
    v56 = v177;
    if (*((_DWORD *)v177 + 14) != v180
      || *((_DWORD *)v177 + 15) != v179
      || *((_DWORD *)v177 + 16) != v12
      || *((_DWORD *)v177 + 18) != v181)
    {
      if (!v203)
      {
        v57 = operator new();
        std::map<std::string,_BlobShape>::map[abi:ne180100](v57, p_currentBlobShapes);
        *(_QWORD *)&buf = 0;
        std::unique_ptr<std::map<std::string,_BlobShape>>::reset[abi:ne180100]((uint64_t *)&v203, v57);
        std::unique_ptr<std::map<std::string,_BlobShape>>::reset[abi:ne180100]((uint64_t *)&buf, 0);
      }
      v56 = v177;
      *((_DWORD *)v177 + 14) = v180;
      *((_DWORD *)v177 + 15) = v179;
      *((_DWORD *)v177 + 16) = v12;
      v162 = 1;
      v165 = 1;
      *((_DWORD *)v177 + 18) = v181;
    }
    if (*((_DWORD *)v56 + 17) != v13)
    {
      if (!v203)
      {
        v58 = operator new();
        std::map<std::string,_BlobShape>::map[abi:ne180100](v58, p_currentBlobShapes);
        *(_QWORD *)&buf = 0;
        std::unique_ptr<std::map<std::string,_BlobShape>>::reset[abi:ne180100]((uint64_t *)&v203, v58);
        std::unique_ptr<std::map<std::string,_BlobShape>>::reset[abi:ne180100]((uint64_t *)&buf, 0);
      }
      *((_DWORD *)v177 + 17) = v13;
      v165 = 1;
    }
    v59 = v13 <= v170 ? v170 : v13;
    v170 = v59;
    v60 = v181 <= v171 ? v171 : v181;
    v171 = v60;
    v33 = 1;
LABEL_69:

    if (SHIBYTE(v218) < 0)
      operator delete(*(void **)v216);
    if (!v33)
      break;
    v5 = v176 + 1;
    if (v176 + 1 == v167)
    {
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
      if (!v4)
      {

        if (v170 >= 0x191 && !BYTE3(self->_transferSession) && !BYTE1(self->_transferSession))
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v158 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v216 = 67109376;
            *(_DWORD *)&v216[4] = v170;
            LOWORD(v217) = 1024;
            *(_DWORD *)((char *)&v217 + 2) = 400;
            _os_log_error_impl(&dword_19C486000, v158, OS_LOG_TYPE_ERROR, "Cannot evaluate a batch of size %d on GPU, which is larger than maximum of %d.", v216, 0xEu);
          }

          if (!a4)
            goto LABEL_86;
          v159 = (void *)MEMORY[0x1E0CB35C8];
          v210 = v160;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot evaluate a batch of size %d on GPU, which is larger than maximum of %d."), v170, 400);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v211 = v63;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_83:
          *a4 = v65;

          goto LABEL_85;
        }
        if (v171 >= 0x2329 && BYTE5(self->_transferSession))
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v216 = 67109376;
            *(_DWORD *)&v216[4] = v171;
            LOWORD(v217) = 1024;
            *(_DWORD *)((char *)&v217 + 2) = 9000;
            _os_log_error_impl(&dword_19C486000, v61, OS_LOG_TYPE_ERROR, "Cannot evaluate a sequence of length %d, which is longer than maximum of %d for bidirectional models.", v216, 0xEu);
          }

          if (!a4)
            goto LABEL_86;
          v62 = (void *)MEMORY[0x1E0CB35C8];
          v208 = v160;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot evaluate a sequence of length %d, which is longer than maximum of %d for bidirectional models."), v171, 9000);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v209 = v63;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_83;
        }
        if ((v165 & 1) != 0)
        {
          *(_QWORD *)v216 = 0;
          v217 = 0;
          v218 = 0;
          buf = 0uLL;
          v207 = 0;
          __p = 0;
          v197 = 0;
          v198 = 0;
          v193 = 0;
          v194 = 0;
          v195 = 0;
          v190 = 0;
          v191 = 0;
          v192 = 0;
          v187 = 0;
          v188 = 0;
          v189 = 0;
          v184 = 0;
          v185 = 0;
          v186 = 0;
          begin_node = (Class)v169->__tree_.__begin_node_;
          if (self->_currentBlobShapes.__tree_.__begin_node_ != &self->_currentBlobShapes.__tree_.__pair1_)
          {
            while (1)
            {
              v70 = (_QWORD *)((char *)begin_node + 32);
              if (*((char *)begin_node + 55) < 0)
                v70 = (_QWORD *)*v70;
              v71 = v217;
              if ((unint64_t)v217 >= v218)
              {
                v73 = ((uint64_t)v217 - *(_QWORD *)v216) >> 3;
                if ((unint64_t)(v73 + 1) >> 61)
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                v74 = (uint64_t)(v218 - *(_QWORD *)v216) >> 2;
                if (v74 <= v73 + 1)
                  v74 = v73 + 1;
                if (v218 - *(_QWORD *)v216 >= 0x7FFFFFFFFFFFFFF8)
                  v75 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v75 = v74;
                if (v75)
                  v75 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v75);
                else
                  v76 = 0;
                v77 = (_QWORD *)(v75 + 8 * v73);
                *v77 = v70;
                v72 = v77 + 1;
                v79 = *(char **)v216;
                v78 = (char *)v217;
                if (v217 != *(_QWORD **)v216)
                {
                  do
                  {
                    v80 = *((_QWORD *)v78 - 1);
                    v78 -= 8;
                    *--v77 = v80;
                  }
                  while (v78 != v79);
                  v78 = *(char **)v216;
                }
                *(_QWORD *)v216 = v77;
                v217 = v72;
                v218 = v75 + 8 * v76;
                if (v78)
                  operator delete(v78);
              }
              else
              {
                *v217 = v70;
                v72 = v71 + 1;
              }
              v217 = v72;
              v81 = (char *)*((_QWORD *)&buf + 1);
              if (*((_QWORD *)&buf + 1) >= v207)
              {
                v83 = (char *)buf;
                v84 = (uint64_t)(*((_QWORD *)&buf + 1) - buf) >> 2;
                v85 = v84 + 1;
                if ((unint64_t)(v84 + 1) >> 62)
                  goto LABEL_270;
                v86 = v207 - buf;
                if ((uint64_t)(v207 - buf) >> 1 > v85)
                  v85 = v86 >> 1;
                if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFFCLL)
                  v87 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v87 = v85;
                if (v87)
                {
                  v87 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v87);
                  v81 = (char *)*((_QWORD *)&buf + 1);
                  v83 = (char *)buf;
                }
                else
                {
                  v88 = 0;
                }
                v89 = (_DWORD *)(v87 + 4 * v84);
                *v89 = *((_DWORD *)begin_node + 14);
                v82 = v89 + 1;
                while (v81 != v83)
                {
                  v90 = *((_DWORD *)v81 - 1);
                  v81 -= 4;
                  *--v89 = v90;
                }
                *(_QWORD *)&buf = v89;
                *((_QWORD *)&buf + 1) = v82;
                v207 = v87 + 4 * v88;
                if (v83)
                  operator delete(v83);
              }
              else
              {
                **((_DWORD **)&buf + 1) = *((_DWORD *)begin_node + 14);
                v82 = v81 + 4;
              }
              *((_QWORD *)&buf + 1) = v82;
              v91 = v197;
              if ((unint64_t)v197 >= v198)
              {
                v93 = (char *)__p;
                v94 = (v197 - (_BYTE *)__p) >> 2;
                v95 = v94 + 1;
                if ((unint64_t)(v94 + 1) >> 62)
                  goto LABEL_270;
                v96 = v198 - (_QWORD)__p;
                if ((uint64_t)(v198 - (_QWORD)__p) >> 1 > v95)
                  v95 = v96 >> 1;
                if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFFCLL)
                  v97 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v97 = v95;
                if (v97)
                {
                  v97 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v97);
                  v93 = (char *)__p;
                  v91 = v197;
                }
                else
                {
                  v98 = 0;
                }
                v99 = (char *)(v97 + 4 * v94);
                *(_DWORD *)v99 = *((_DWORD *)begin_node + 15);
                v92 = v99 + 4;
                while (v91 != v93)
                {
                  v100 = *((_DWORD *)v91 - 1);
                  v91 -= 4;
                  *((_DWORD *)v99 - 1) = v100;
                  v99 -= 4;
                }
                __p = v99;
                v197 = v92;
                v198 = v97 + 4 * v98;
                if (v93)
                  operator delete(v93);
              }
              else
              {
                *(_DWORD *)v197 = *((_DWORD *)begin_node + 15);
                v92 = v91 + 4;
              }
              v197 = v92;
              v101 = v194;
              if ((unint64_t)v194 >= v195)
              {
                v103 = (char *)v193;
                v104 = (v194 - (_BYTE *)v193) >> 2;
                v105 = v104 + 1;
                if ((unint64_t)(v104 + 1) >> 62)
                  goto LABEL_270;
                v106 = v195 - (_QWORD)v193;
                if ((uint64_t)(v195 - (_QWORD)v193) >> 1 > v105)
                  v105 = v106 >> 1;
                if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFFCLL)
                  v107 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v107 = v105;
                if (v107)
                {
                  v107 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v107);
                  v103 = (char *)v193;
                  v101 = v194;
                }
                else
                {
                  v108 = 0;
                }
                v109 = (char *)(v107 + 4 * v104);
                *(_DWORD *)v109 = *((_DWORD *)begin_node + 16);
                v102 = v109 + 4;
                while (v101 != v103)
                {
                  v110 = *((_DWORD *)v101 - 1);
                  v101 -= 4;
                  *((_DWORD *)v109 - 1) = v110;
                  v109 -= 4;
                }
                v193 = v109;
                v194 = v102;
                v195 = v107 + 4 * v108;
                if (v103)
                  operator delete(v103);
              }
              else
              {
                *(_DWORD *)v194 = *((_DWORD *)begin_node + 16);
                v102 = v101 + 4;
              }
              v194 = v102;
              v111 = v191;
              if ((unint64_t)v191 >= v192)
              {
                v113 = (char *)v190;
                v114 = (v191 - (_BYTE *)v190) >> 2;
                v115 = v114 + 1;
                if ((unint64_t)(v114 + 1) >> 62)
                  goto LABEL_270;
                v116 = v192 - (_QWORD)v190;
                if ((uint64_t)(v192 - (_QWORD)v190) >> 1 > v115)
                  v115 = v116 >> 1;
                if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL)
                  v117 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v117 = v115;
                if (v117)
                {
                  v117 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v117);
                  v113 = (char *)v190;
                  v111 = v191;
                }
                else
                {
                  v118 = 0;
                }
                v119 = (char *)(v117 + 4 * v114);
                *(_DWORD *)v119 = *((_DWORD *)begin_node + 17);
                v112 = v119 + 4;
                while (v111 != v113)
                {
                  v120 = *((_DWORD *)v111 - 1);
                  v111 -= 4;
                  *((_DWORD *)v119 - 1) = v120;
                  v119 -= 4;
                }
                v190 = v119;
                v191 = v112;
                v192 = v117 + 4 * v118;
                if (v113)
                  operator delete(v113);
              }
              else
              {
                *(_DWORD *)v191 = *((_DWORD *)begin_node + 17);
                v112 = v111 + 4;
              }
              v191 = v112;
              v121 = v188;
              if ((unint64_t)v188 >= v189)
              {
                v123 = (char *)v187;
                v124 = (v188 - (_BYTE *)v187) >> 2;
                v125 = v124 + 1;
                if ((unint64_t)(v124 + 1) >> 62)
                  goto LABEL_270;
                v126 = v189 - (_QWORD)v187;
                if ((uint64_t)(v189 - (_QWORD)v187) >> 1 > v125)
                  v125 = v126 >> 1;
                if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFFCLL)
                  v127 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v127 = v125;
                if (v127)
                {
                  v127 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v127);
                  v123 = (char *)v187;
                  v121 = v188;
                }
                else
                {
                  v128 = 0;
                }
                v129 = (char *)(v127 + 4 * v124);
                *(_DWORD *)v129 = *((_DWORD *)begin_node + 18);
                v122 = v129 + 4;
                while (v121 != v123)
                {
                  v130 = *((_DWORD *)v121 - 1);
                  v121 -= 4;
                  *((_DWORD *)v129 - 1) = v130;
                  v129 -= 4;
                }
                v187 = v129;
                v188 = v122;
                v189 = v127 + 4 * v128;
                if (v123)
                  operator delete(v123);
              }
              else
              {
                *(_DWORD *)v188 = *((_DWORD *)begin_node + 18);
                v122 = v121 + 4;
              }
              v188 = v122;
              if (BYTE1(self->_transferSession))
                break;
              if (BYTE2(self->_transferSession))
              {
                v133 = v185;
                if ((unint64_t)v185 < v186)
                {
                  *(_DWORD *)v185 = 5;
                  v132 = v133 + 4;
LABEL_202:
                  v134 = v132;
LABEL_229:
                  v185 = v134;
                  goto LABEL_230;
                }
                v135 = (char *)v184;
                v141 = (v185 - (_BYTE *)v184) >> 2;
                v142 = v141 + 1;
                if ((unint64_t)(v141 + 1) >> 62)
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                v143 = v186 - (_QWORD)v184;
                if ((uint64_t)(v186 - (_QWORD)v184) >> 1 > v142)
                  v142 = v143 >> 1;
                if ((unint64_t)v143 >= 0x7FFFFFFFFFFFFFFCLL)
                  v139 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v139 = v142;
                if (v139)
                {
                  v139 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v139);
                  v135 = (char *)v184;
                  v133 = v185;
                }
                else
                {
                  v140 = 0;
                }
                v144 = (char *)(v139 + 4 * v141);
                *(_DWORD *)v144 = 5;
                v134 = v144 + 4;
                while (v133 != v135)
                {
                  v146 = *((_DWORD *)v133 - 1);
                  v133 -= 4;
                  *((_DWORD *)v144 - 1) = v146;
                  v144 -= 4;
                }
LABEL_227:
                v184 = v144;
                v185 = v134;
                v186 = v139 + 4 * v140;
                if (v135)
                  operator delete(v135);
                goto LABEL_229;
              }
LABEL_230:
              isa = (MLNeuralNetworkEngine *)*((_QWORD *)begin_node + 1);
              if (isa)
              {
                do
                {
                  v148 = isa;
                  isa = (MLNeuralNetworkEngine *)isa->super.super.isa;
                }
                while (isa);
              }
              else
              {
                do
                {
                  v148 = (MLNeuralNetworkEngine *)*((_QWORD *)begin_node + 2);
                  v149 = v148->super.super.isa == begin_node;
                  begin_node = (Class)v148;
                }
                while (!v149);
              }
              begin_node = (Class)v148;
              if (v148 == (MLNeuralNetworkEngine *)&self->_currentBlobShapes.__tree_.__pair1_)
                goto LABEL_236;
            }
            v131 = v185;
            if ((unint64_t)v185 < v186)
            {
              *(_DWORD *)v185 = *((_DWORD *)begin_node + 19);
              v132 = v131 + 4;
              goto LABEL_202;
            }
            v135 = (char *)v184;
            v136 = (v185 - (_BYTE *)v184) >> 2;
            v137 = v136 + 1;
            if ((unint64_t)(v136 + 1) >> 62)
LABEL_270:
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            v138 = v186 - (_QWORD)v184;
            if ((uint64_t)(v186 - (_QWORD)v184) >> 1 > v137)
              v137 = v138 >> 1;
            if ((unint64_t)v138 >= 0x7FFFFFFFFFFFFFFCLL)
              v139 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v139 = v137;
            if (v139)
            {
              v139 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v139);
              v135 = (char *)v184;
              v131 = v185;
            }
            else
            {
              v140 = 0;
            }
            v144 = (char *)(v139 + 4 * v136);
            *(_DWORD *)v144 = *((_DWORD *)begin_node + 19);
            v134 = v144 + 4;
            while (v131 != v135)
            {
              v145 = *((_DWORD *)v131 - 1);
              v131 -= 4;
              *((_DWORD *)v144 - 1) = v145;
              v144 -= 4;
            }
            goto LABEL_227;
          }
LABEL_236:
          if ((v162 & 1) != 0)
          {
            BYTE1(self->_compilerOutput) = 1;
            if (*(_DWORD *)&self->_hardwareFallbackDetected == 10007)
            {
              -[MLModelEngine configuration](self, "configuration");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLNeuralNetworkEngine _setupContextAndPlanWithConfiguration:usingCPU:priority:reshapeWithContainer:error:](self, "_setupContextAndPlanWithConfiguration:usingCPU:priority:reshapeWithContainer:error:", v150, 0, -[MLNeuralNetworkEngine priority](self, "priority"), 1, a4);

            }
          }
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_.__value_.__left_);
          self->_flexibleShapesConfigNamesInNet.__tree_.__begin_node_ = &self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_;
          self->_flexibleShapesConfigNamesInNet.__tree_.__pair3_.__value_ = 0;
          self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_.__value_.__left_ = 0;
          MEMORY[0x1A1AD5EAC](&self->_currentConfigurationName, &unk_19CB39696);
          -[MLNeuralNetworkEngine plan](self, "plan");
          if (espresso_plan_get_phase() == 1
            && (-[MLNeuralNetworkEngine plan](self, "plan"), espresso_plan_build_clean()))
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v151 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v183 = 0;
              _os_log_error_impl(&dword_19C486000, v151, OS_LOG_TYPE_ERROR, "Failure in setting up to dynamically allocate for sequence size.", v183, 2u);
            }

            v152 = &self->_currentBlobShapes;
            if (a4)
            {
              v153 = (void *)MEMORY[0x1E0CB35C8];
              v204 = v160;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failure in setting up to dynamically allocate for sequence size."));
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              v205 = v154;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v153, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v155);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              v152 = &self->_currentBlobShapes;
            }
          }
          else
          {
            v156 = -[MLNeuralNetworkEngine setEspressoBlobShapes:widths:heights:ks:batches:sequences:ranks:error:](self, "setEspressoBlobShapes:widths:heights:ks:batches:sequences:ranks:error:", v216, &buf, &__p, &v193, &v190, &v187, &v184, a4);
            v152 = &self->_currentBlobShapes;
            if (v156)
            {
              v157 = 1;
LABEL_250:
              if (v184)
              {
                v185 = (char *)v184;
                operator delete(v184);
              }
              if (v187)
              {
                v188 = (char *)v187;
                operator delete(v187);
              }
              if (v190)
              {
                v191 = (char *)v190;
                operator delete(v190);
              }
              if (v193)
              {
                v194 = (char *)v193;
                operator delete(v193);
              }
              if (__p)
              {
                v197 = (char *)__p;
                operator delete(__p);
              }
              if ((_QWORD)buf)
              {
                *((_QWORD *)&buf + 1) = buf;
                operator delete((void *)buf);
              }
              if (*(_QWORD *)v216)
              {
                v217 = *(_QWORD **)v216;
                operator delete(*(void **)v216);
              }
              if ((v157 & 1) == 0)
                goto LABEL_86;
              v67 = 1;
              goto LABEL_89;
            }
          }
          v157 = 0;
          if (v203
            && v152 != (map<std::string, _BlobShape, std::less<std::string>, std::allocator<std::pair<const std::string, _BlobShape>>> *)v203)
          {
            std::__tree<std::__value_type<std::string,_BlobShape>,std::__map_value_compare<std::string,std::__value_type<std::string,_BlobShape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,_BlobShape>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,_BlobShape>,std::__tree_node<std::__value_type<std::string,_BlobShape>,void *> *,long>>(v152, v203->super.super.isa, &v203->super._signpostID);
            v157 = 0;
          }
          goto LABEL_250;
        }
LABEL_88:
        v67 = 0;
LABEL_89:
        if (!espresso_plan_get_phase()
          && !-[MLNeuralNetworkEngine rebuildPlan:error:](self, "rebuildPlan:error:", v67, a4))
        {
          if (v203
            && &self->_currentBlobShapes != (map<std::string, _BlobShape, std::less<std::string>, std::allocator<std::pair<const std::string, _BlobShape>>> *)v203)
          {
            std::__tree<std::__value_type<std::string,_BlobShape>,std::__map_value_compare<std::string,std::__value_type<std::string,_BlobShape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,_BlobShape>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,_BlobShape>,std::__tree_node<std::__value_type<std::string,_BlobShape>,void *> *,long>>(&self->_currentBlobShapes.__tree_.__begin_node_, v203->super.super.isa, &v203->super._signpostID);
          }
          goto LABEL_86;
        }
        v66 = 1;
        goto LABEL_92;
      }
      goto LABEL_3;
    }
  }
  v63 = obj;
LABEL_85:

LABEL_86:
  v66 = 0;
LABEL_92:
  std::unique_ptr<std::map<std::string,_BlobShape>>::reset[abi:ne180100]((uint64_t *)&v203, 0);

  return v66;
}

- (void)releaseBuffer:(unint64_t)a3
{
  MLNeuralNetworkEngine *v4;

  v4 = self;
  objc_sync_enter(v4);
  *(unint64_t *)((char *)v4->_bufferAvailable.__begin_ + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a3;
  objc_sync_exit(v4);

  dispatch_semaphore_signal((dispatch_semaphore_t)v4->_probabilityDictionarySharedKeySet);
}

- (unint64_t)obtainBuffer
{
  MLNeuralNetworkEngine *v3;
  uint64_t *begin;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_probabilityDictionarySharedKeySet, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self;
  objc_sync_enter(v3);
  begin = (uint64_t *)v3->_bufferAvailable.__begin_;
  v5 = *begin;
  if ((*begin & 1) != 0)
  {
    v6 = 0;
    v7 = -2;
LABEL_6:
    *begin = v5 & v7;
    goto LABEL_7;
  }
  if ((v5 & 2) != 0)
  {
    v7 = -3;
    v6 = 1;
    goto LABEL_6;
  }
  v6 = 3;
LABEL_7:
  objc_sync_exit(v3);

  return v6;
}

- (NSArray)classLabels
{
  return *(NSArray **)&self->_engine;
}

- (BOOL)sequenceConcatConsumesOptionalInputNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[MLNeuralNetworkEngine optionalInputTypes](self, "optionalInputTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", &unk_1E3DA1F18);

  return v7;
}

- (int)sequenceNamed:(id)a3
{
  id v4;
  uint64_t **p_currentBlobShapes;
  void **v6;
  void *v7;
  uint64_t **v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *__p[2];
  uint64_t v14;
  uint64_t v15;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  p_currentBlobShapes = (uint64_t **)&self->_currentBlobShapes;
  v6 = (void **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)p_currentBlobShapes, &v15, __p);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x50uLL);
    *((_OWORD *)v7 + 2) = *(_OWORD *)__p;
    v10 = v14;
    v9 = v15;
    __p[1] = 0;
    v14 = 0;
    __p[0] = 0;
    *((_QWORD *)v7 + 6) = v10;
    *((_QWORD *)v7 + 7) = 0;
    *((_QWORD *)v7 + 8) = 0;
    *((_QWORD *)v7 + 9) = 0;
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(p_currentBlobShapes, v9, v8, (uint64_t *)v7);
  }
  v11 = *((_DWORD *)v7 + 18);
  if (SHIBYTE(v14) < 0)
    operator delete(__p[0]);

  return v11;
}

- (id)convertPredictionToClassifierResult:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  MLMultiArray *v22;
  void *v23;
  MLMultiArray *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  MLProbabilityDictionary *v28;
  void *v29;
  MLProbabilityDictionary *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  int v55;
  uint64_t v56;
  double v57;
  double v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t *v64;
  double v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  double v73;
  double v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  _QWORD v106[2];
  id v107;
  id v108;
  id v109;
  id v110;
  _BYTE buf[22];
  uint64_t v112;
  MLProbabilityDictionary *v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  _QWORD v119[2];

  v119[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v110 = a4;
  if (!v8)
  {
LABEL_17:
    v33 = 0;
    goto LABEL_111;
  }
  -[MLNeuralNetworkEngine classLabels](self, "classLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v31, OS_LOG_TYPE_ERROR, "Unable to construct a classification result because the classifier model doesn't declare the class labels.", buf, 2u);
    }

    if (a5)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v118 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to construct a classification result because the classifier model doesn't declare the class labels."));
      v109 = (id)objc_claimAutoreleasedReturnValue();
      v119[0] = v109;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v17);
      v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_109;
    }
    goto LABEL_17;
  }
  v11 = objc_msgSend(v110, "classifyTopK");
  -[MLNeuralNetworkEngine classLabels](self, "classLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 > v13)
  {
    -[MLNeuralNetworkEngine classLabels](self, "classLabels");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v14, "count");

  }
  -[MLNeuralNetworkEngine classScoreVectorName](self, "classScoreVectorName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureValueForName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = v16;
  if (!v16)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[MLNeuralNetworkEngine classScoreVectorName](self, "classScoreVectorName");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v85;
      _os_log_error_impl(&dword_19C486000, v34, OS_LOG_TYPE_ERROR, "Unable to construct a classification result because the model doesn't report a class score vector named '%@'.", buf, 0xCu);

    }
    if (a5)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v116 = *MEMORY[0x1E0CB2D50];
      v36 = (void *)MEMORY[0x1E0CB3940];
      -[MLNeuralNetworkEngine classScoreVectorName](self, "classScoreVectorName");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("Unable to construct a classification result because the model doesn't report a class score vector named '%@'."), v17);
      v107 = (id)objc_claimAutoreleasedReturnValue();
      v117 = v107;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v30 = (MLProbabilityDictionary *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v30);
      v37 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
      v33 = 0;
      *a5 = v37;
      goto LABEL_107;
    }
    v109 = 0;
LABEL_32:
    v33 = 0;
    goto LABEL_110;
  }
  if (objc_msgSend(v16, "type") != 5)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      -[MLNeuralNetworkEngine classScoreVectorName](self, "classScoreVectorName");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v86;
      _os_log_error_impl(&dword_19C486000, v38, OS_LOG_TYPE_ERROR, "Unable to construct a classification result because the class score vector named '%@' is not MLMultiArray.", buf, 0xCu);

    }
    if (a5)
    {
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v114 = *MEMORY[0x1E0CB2D50];
      v40 = (void *)MEMORY[0x1E0CB3940];
      -[MLNeuralNetworkEngine classScoreVectorName](self, "classScoreVectorName");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("Unable to construct a classification result because the class score vector named '%@' is not MLMultiArray."), v17);
      v107 = (id)objc_claimAutoreleasedReturnValue();
      v115 = v107;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
      v30 = (MLProbabilityDictionary *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v30);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    goto LABEL_32;
  }
  objc_msgSend(v109, "multiArrayValue");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  -[MLNeuralNetworkEngine classLabels](self, "classLabels");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v18 != v20)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v87 = objc_msgSend(v17, "count");
      -[MLNeuralNetworkEngine classLabels](self, "classLabels");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v87;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v88, "count");
      _os_log_error_impl(&dword_19C486000, v41, OS_LOG_TYPE_ERROR, "Unable to construct a classification result because the class score vector's size (=%zd) doesn't match the number of classes (= %tu).", buf, 0x16u);

    }
    if (a5)
    {
      v42 = (void *)MEMORY[0x1E0CB35C8];
      v112 = *MEMORY[0x1E0CB2D50];
      v43 = (void *)MEMORY[0x1E0CB3940];
      v44 = objc_msgSend(v17, "count");
      -[MLNeuralNetworkEngine classLabels](self, "classLabels");
      v107 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", CFSTR("Unable to construct a classification result because the class score vector's size (=%zd) doesn't match the number of classes (= %tu)."), v44, objc_msgSend(v107, "count"));
      v30 = (MLProbabilityDictionary *)objc_claimAutoreleasedReturnValue();
      v113 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v45);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v33 = 0;
      goto LABEL_107;
    }
    v33 = 0;
    goto LABEL_109;
  }
  v21 = v17;
  v108 = v21;
  if (objc_msgSend(v21, "dataType") != 65600)
  {
    v22 = [MLMultiArray alloc];
    objc_msgSend(v108, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MLMultiArray initWithShape:dataType:error:](v22, "initWithShape:dataType:error:", v23, 65600, a5);

    v107 = v24;
    if (!objc_msgSend(v108, "vectorizeIntoMultiArray:storageOrder:error:", v24, 0, a5))
    {
      v33 = 0;
      goto LABEL_108;
    }
    v21 = v107;
  }
  v107 = objc_retainAutorelease(v21);
  v25 = objc_msgSend(v107, "bytes");
  -[MLNeuralNetworkEngine classLabels](self, "classLabels");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v11 == v27)
  {
    v28 = [MLProbabilityDictionary alloc];
    -[MLNeuralNetworkEngine probabilityDictionarySharedKeySet](self, "probabilityDictionarySharedKeySet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MLProbabilityDictionary initWithSharedKeySet:probabilities:](v28, "initWithSharedKeySet:probabilities:", v29, v25);

    goto LABEL_106;
  }
  -[MLNeuralNetworkEngine classLabels](self, "classLabels");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(buf, objc_msgSend(v46, "count"));

  v48 = *(uint64_t **)buf;
  v47 = *(uint64_t **)&buf[8];
  if (*(_QWORD *)buf != *(_QWORD *)&buf[8])
  {
    v49 = 0;
    v50 = *(uint64_t **)buf;
    do
      *v50++ = v49++;
    while (v50 != v47);
  }
  v51 = &v48[v11];
  if (v51 == v47)
    goto LABEL_101;
  while (1)
  {
    v52 = v47 - v48;
    if (v52 < 2)
      goto LABEL_101;
    if (v52 == 3)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLNeuralNetworkEngine convertPredictionToClassifierResult:withOptions:error:]::$_0 &,std::__wrap_iter<unsigned long *>>(v48, v48 + 1, v47 - 1, v25);
      goto LABEL_101;
    }
    if (v52 == 2)
    {
      v89 = *(v47 - 1);
      v90 = *v48;
      if (*(double *)(v25 + 8 * (int)v89) > *(double *)(v25 + (*v48 << 32 >> 29)))
      {
        *v48 = v89;
        *(v47 - 1) = v90;
      }
      goto LABEL_101;
    }
    if ((char *)v47 - (char *)v48 <= 63)
    {
      if (v47 - 1 == v48)
        goto LABEL_101;
      while (1)
      {
        v91 = v47;
        if (v48 == v47)
          goto LABEL_98;
        v92 = v48 + 1;
        if (v48 + 1 != v47)
          break;
LABEL_100:
        if (++v48 == v47 - 1)
          goto LABEL_101;
      }
      v93 = *v48;
      v91 = v48;
      v94 = v48 + 1;
      do
      {
        v96 = *v94++;
        v95 = v96;
        if (*(double *)(v25 + 8 * (int)v96) > *(double *)(v25 + 8 * (int)v93))
        {
          LODWORD(v93) = v95;
          v91 = v92;
        }
        v92 = v94;
      }
      while (v94 != v47);
LABEL_98:
      if (v91 != v48)
      {
        v97 = *v48;
        *v48 = *v91;
        *v91 = v97;
      }
      goto LABEL_100;
    }
    v53 = &v48[v52 >> 1];
    v54 = v47 - 1;
    v55 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLNeuralNetworkEngine convertPredictionToClassifierResult:withOptions:error:]::$_0 &,std::__wrap_iter<unsigned long *>>(v48, v53, v47 - 1, v25);
    v56 = *v48;
    v57 = *(double *)(v25 + (*v48 << 32 >> 29));
    v58 = *(double *)(v25 + (*v53 << 32 >> 29));
    if (v57 <= v58)
      break;
LABEL_47:
    v63 = v48 + 1;
    if (v48 + 1 >= v54)
    {
      v66 = v48 + 1;
    }
    else
    {
      v64 = v48 + 1;
      while (1)
      {
        v65 = *(double *)(v25 + (*v53 << 32 >> 29));
        do
        {
          v66 = v64;
          v68 = *v64++;
          v67 = v68;
        }
        while (*(double *)(v25 + 8 * (int)v68) > v65);
        do
        {
          v70 = *--v54;
          v69 = v70;
        }
        while (*(double *)(v25 + 8 * (int)v70) <= v65);
        if (v66 >= v54)
          break;
        *v66 = v69;
        *v54 = v67;
        ++v55;
        if (v53 == v66)
          v53 = v54;
      }
    }
    if (v66 != v53)
    {
      v71 = *v66;
      if (*(double *)(v25 + (*v53 << 32 >> 29)) > *(double *)(v25 + (*v66 << 32 >> 29)))
      {
        *v66 = *v53;
        *v53 = v71;
        ++v55;
      }
    }
    if (v66 == v51)
      goto LABEL_101;
    if (!v55)
    {
      if (v66 <= v51)
      {
        v77 = v66 + 1;
        while (v77 != v47)
        {
          v78 = *(double *)(v25 + (*v77 << 32 >> 29));
          v79 = *(double *)(v25 + (*(v77++ - 1) << 32 >> 29));
          if (v78 > v79)
            goto LABEL_62;
        }
      }
      else
      {
        while (v63 != v66)
        {
          v73 = *(double *)(v25 + (*v63 << 32 >> 29));
          v74 = *(double *)(v25 + (*(v63++ - 1) << 32 >> 29));
          if (v73 > v74)
            goto LABEL_62;
        }
      }
      goto LABEL_101;
    }
LABEL_62:
    if (v66 <= v51)
    {
      v72 = v66 + 1;
    }
    else
    {
      v47 = v66;
      v72 = v48;
    }
LABEL_85:
    v48 = v72;
    if (v47 == v51)
      goto LABEL_101;
  }
  v59 = v47 - 2;
  while (v59 != v48)
  {
    v60 = v59;
    v62 = *v59--;
    v61 = v62;
    if (*(double *)(v25 + 8 * (int)v62) > v58)
    {
      *v48 = v61;
      *v60 = v56;
      ++v55;
      v54 = v60;
      goto LABEL_47;
    }
  }
  v75 = v48 + 1;
  if (v57 > *(double *)(v25 + (*v54 << 32 >> 29)))
  {
LABEL_78:
    if (v75 == v54)
      goto LABEL_101;
    while (1)
    {
      v80 = *(double *)(v25 + (*v48 << 32 >> 29));
      do
      {
        v72 = v75;
        v82 = *v75++;
        v81 = v82;
      }
      while (v80 <= *(double *)(v25 + 8 * (int)v82));
      do
      {
        v84 = *--v54;
        v83 = v84;
      }
      while (v80 > *(double *)(v25 + 8 * (int)v84));
      if (v72 >= v54)
        break;
      *v72 = v83;
      *v54 = v81;
    }
    if (v72 > v51)
      goto LABEL_101;
    goto LABEL_85;
  }
  while (v75 != v54)
  {
    v76 = *v75;
    if (v57 > *(double *)(v25 + (*v75 << 32 >> 29)))
    {
      *v75++ = *v54;
      *v54 = v76;
      goto LABEL_78;
    }
    ++v75;
  }
LABEL_101:
  v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
  v106[1] = v106;
  MEMORY[0x1E0C80A78](v98);
  v100 = (char *)v106 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v11)
  {
    v101 = 0;
    v102 = *(_QWORD *)buf;
    do
    {
      objc_msgSend(*(id *)&self->_engine, "objectAtIndexedSubscript:", *(_QWORD *)(v102 + 8 * v101));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setObject:atIndexedSubscript:", v103, v101);

      v102 = *(_QWORD *)buf;
      *(_QWORD *)&v100[8 * v101] = *(_QWORD *)(v25 + 8 * *(_QWORD *)(*(_QWORD *)buf + 8 * v101));
      ++v101;
    }
    while (v11 != v101);
  }
  v30 = -[MLProbabilityDictionary initWithLabels:probabilities:]([MLProbabilityDictionary alloc], "initWithLabels:probabilities:", v98, v100);

  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
LABEL_106:
  -[MLProbabilityDictionary classLabelOfMaxProbability](v30, "classLabelOfMaxProbability");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLClassifierResult resultWithClassProbability:additionalFeatures:classLabelOfMaxProbability:](MLClassifierResult, "resultWithClassProbability:additionalFeatures:classLabelOfMaxProbability:", v30, v8, v104);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v108;
LABEL_107:

  v108 = v17;
LABEL_108:

  v17 = v108;
LABEL_109:

LABEL_110:
LABEL_111:

  return v33;
}

- (id)addClassifierInformationToOutput:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MLNeuralNetworkEngine convertPredictionToClassifierResult:withOptions:error:](self, "convertPredictionToClassifierResult:withOptions:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelEngine modelDescription](self, "modelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictedClassFeatureDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelEngine modelDescription](self, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "classProbabilityFeatureDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asFeatureDictionaryWithPredictedClassDescription:classProbabilityDescription:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v23[8];
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  kdebug_trace();
  -[MLModelEngine modelDescription](self, "modelDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictedFeatureName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MLNeuralNetworkEngine classLabels](self, "classLabels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MLNeuralNetworkEngine predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v8, v9, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[MLNeuralNetworkEngine convertPredictionToClassifierResult:withOptions:error:](self, "convertPredictionToClassifierResult:withOptions:error:", v13, v9, a5);
        a5 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a5 = 0;
      }

      goto LABEL_16;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Unable to use this model as a classifier because the model doesn't have class labels.", v23, 2u);
    }

    if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to use this model as a classifier because the model doesn't have class labels."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "Unable to use this model as a classifier because the model description doesn't specify a predicted feature name.", v23, 2u);
    }

    if (a5)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to use this model as a classifier because the model description doesn't specify a predicted feature name."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
      a5 = 0;
    }
  }
LABEL_16:
  kdebug_trace();

  return a5;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v23[8];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MLModelEngine modelDescription](self, "modelDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictedFeatureName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MLNeuralNetworkEngine predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v8, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[MLModelEngine modelDescription](self, "modelDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predictedFeatureName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "featureValueForName:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "multiArrayValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLRegressorResult resultWithValue:](MLRegressorResult, "resultWithValue:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Unable to use this model as a regressor because the model description doesn't specify a predicted feature name.", v23, 2u);
    }

    if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to use this model as a regressor because the model description doesn't specify a predicted feature name."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }

  return v17;
}

- (id)availableOutputBlobList
{
  id v2;
  uint64_t *i;
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  -[MLNeuralNetworkEngine network](self, "network");
  Espresso::get_internal_network();
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = *(uint64_t **)(v11 + 152); i; i = (uint64_t *)*i)
  {
    if (*((char *)i + 39) < 0)
    {
      if (i[3])
      {
LABEL_6:
        v4 = objc_alloc(MEMORY[0x1E0CB3940]);
        v5 = i + 2;
        if (*((char *)i + 39) < 0)
          v5 = (_QWORD *)*v5;
        v6 = (void *)objc_msgSend(v4, "initWithUTF8String:", v5);
        objc_msgSend(v2, "addObject:", v6);

      }
    }
    else if (*((_BYTE *)i + 39))
    {
      goto LABEL_6;
    }
  }
  v7 = (void *)objc_msgSend(v2, "copy");

  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v7;
}

- (id)imageFeatureValueFromPixelBuffer:(__CVBuffer *)a3 usingPixelFormat:(unsigned int)a4
{
  __CVBuffer *v4;
  void *v5;

  v4 = -[MLNeuralNetworkEngine copyPixelBufferFromPixelBuffer:usingPixelFormat:](self, "copyPixelBufferFromPixelBuffer:usingPixelFormat:", a3, *(_QWORD *)&a4);
  if (v4)
  {
    +[MLFeatureValue featureValueWithPixelBuffer:](MLFeatureValue, "featureValueWithPixelBuffer:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (__CVBuffer)copyPixelBufferFromPixelBuffer:(__CVBuffer *)a3 usingPixelFormat:(unsigned int)a4
{
  uint64_t v4;
  double Width;
  double Height;
  void *v9;
  __CVBuffer *v10;

  v4 = *(_QWORD *)&a4;
  Width = (double)CVPixelBufferGetWidth(a3);
  Height = (double)CVPixelBufferGetHeight(a3);
  -[MLNeuralNetworkEngine pixelBufferPool](self, "pixelBufferPool");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (__CVBuffer *)objc_msgSend(v9, "createPixelBufferWithSize:pixelFormatType:error:", v4, 0, Width, Height);

  if (!v10)
    return 0;
  if (-[MLNeuralNetworkEngine transferPixelBuffer:toPixelBuffer:](self, "transferPixelBuffer:toPixelBuffer:", a3, v10))
    return v10;
  return 0;
}

- (BOOL)transferPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BOOL>, void *>>> *p_pair1;
  OpaqueVTPixelTransferSession *left;
  OSStatus v8;
  OSStatus v9;
  OSType PixelFormatType;
  OSType v11;
  NSObject *v12;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v14;
  const char *v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  OSStatus v20;
  OSStatus v21;
  int v23;
  const char *v24;
  __int16 v25;
  OSType v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  OSType v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  OSStatus v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  p_pair1 = &self->_OutputBlobIsDynamic.__tree_.__pair1_;
  left = (OpaqueVTPixelTransferSession *)self->_OutputBlobIsDynamic.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
    v20 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)p_pair1);
    if (v20)
    {
      v21 = v20;
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v23 = 67109120;
        LODWORD(v24) = v21;
        v17 = "Failed to initialize VTPixelTransferSession with error %i.";
        v18 = v12;
        v19 = 8;
LABEL_17:
        _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v23, v19);
      }
LABEL_12:

      return 0;
    }
    left = (OpaqueVTPixelTransferSession *)p_pair1->__value_.__left_;
  }
  v8 = VTPixelTransferSessionTransferImage(left, a3, a4);
  if (v8)
  {
    v9 = v8;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v11 = CVPixelBufferGetPixelFormatType(a4);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      IOSurface = CVPixelBufferGetIOSurface(a3);
      v14 = CVPixelBufferGetIOSurface(a4);
      v15 = "YES";
      v23 = 136317698;
      if (IOSurface)
        v16 = "YES";
      else
        v16 = "NO";
      v24 = v16;
      v25 = 1024;
      v26 = HIBYTE(PixelFormatType);
      v27 = 1024;
      v28 = BYTE2(PixelFormatType);
      if (!v14)
        v15 = "NO";
      v29 = 1024;
      v30 = BYTE1(PixelFormatType);
      v31 = 1024;
      v32 = PixelFormatType;
      v33 = 2080;
      v34 = v15;
      v35 = 1024;
      v36 = HIBYTE(v11);
      v37 = 1024;
      v38 = BYTE2(v11);
      v39 = 1024;
      v40 = BYTE1(v11);
      v41 = 1024;
      v42 = v11;
      v43 = 1024;
      v44 = v9;
      v17 = "Failed to transfer a pixel buffer (IOSurface-backed: %s, format: %c%c%c%c) to destination pixel buffer [IOSu"
            "rface-backed: %s: format: %c%c%c%c] with error %i.";
      v18 = v12;
      v19 = 76;
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  return 1;
}

- (__CVBuffer)pixelBufferFromOutputBacking:(id)a3 forFeature:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CVBuffer *v8;
  CFTypeID v9;
  NSObject *v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *ClassName;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
    goto LABEL_12;
  if (objc_msgSend(v6, "type") != 5)
  {
    if (objc_msgSend(v7, "type") != 4)
    {
LABEL_12:
      v8 = 0;
      goto LABEL_13;
    }
    v9 = CFGetTypeID(v5);
    v8 = (__CVBuffer *)v5;
    if (v9 == CVPixelBufferGetTypeID())
      goto LABEL_13;
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "The output backing for feature named '%@' must be CVPixelBuffer, but it is not. It will fail when the inference engine populates the backing with the prediction.", (uint8_t *)&v14, 0xCu);

    }
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v13;
      v16 = 2080;
      ClassName = object_getClassName(v5);
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "The type of output backing for feature named '%@' is '%s', which is not MLMultiArray. It will fail when the inference engine populates the backing with the prediction.", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_11;
  }
  v8 = (__CVBuffer *)objc_msgSend(v5, "pixelBuffer");
LABEL_13:

  return v8;
}

- (BOOL)opacifyAndPermutePixelBuffer:(__CVBuffer *)a3 bufferContainsBGRA:(BOOL)a4 error:(id *)a5
{
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t permuteMap[4];
  vImage_Buffer dest;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = CVPixelBufferLockBaseAddress(a3, 0);
  if ((_DWORD)v8)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(dest.data) = 67109120;
      HIDWORD(dest.data) = v8;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Failed to output BGRA / ARGB pixel buffer because it was unable to access the underlying frame buffer due to CoreVideo error: %d.", (uint8_t *)&dest, 8u);
    }

    if (a5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to output BGRA / ARGB pixel buffer because it was unable to access the underlying frame buffer due to CoreVideo error: %d."), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    dest.width = CVPixelBufferGetWidth(a3);
    dest.height = CVPixelBufferGetHeight(a3);
    dest.rowBytes = CVPixelBufferGetBytesPerRow(a3);
    dest.data = CVPixelBufferGetBaseAddress(a3);
    if (!a4)
    {
      *(_DWORD *)permuteMap = 50331906;
      vImagePermuteChannels_ARGB8888(&dest, &dest, permuteMap, 0);
    }
    *(_DWORD *)permuteMap = -16777216;
    vImageOverwriteChannelsWithPixel_ARGB8888(permuteMap, &dest, &dest, 1u, 0);
    CVPixelBufferUnlockBaseAddress(a3, 0);
  }
  return (_DWORD)v8 == 0;
}

- (MLNeuralNetworkEngine)initWithContainer:(id)a3 error:(id *)a4
{
  id v6;
  MLModelConfiguration *v7;
  MLNeuralNetworkEngine *v8;

  v6 = a3;
  v7 = objc_alloc_init(MLModelConfiguration);
  v8 = -[MLNeuralNetworkEngine initWithContainer:configuration:error:](self, "initWithContainer:configuration:error:", v6, v7, a4);

  return v8;
}

- (BOOL)_setupContextAndPlanWithForceCPU:(BOOL)a3 priority:(int)a4 error:(id *)a5
{
  uint64_t v6;
  _BOOL8 v7;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  -[MLModelEngine configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[MLNeuralNetworkEngine _setupContextAndPlanWithConfiguration:usingCPU:priority:error:](self, "_setupContextAndPlanWithConfiguration:usingCPU:priority:error:", v9, v7, v6, a5);

  return (char)a5;
}

- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 priority:(int)a4 error:(id *)a5
{
  return -[MLNeuralNetworkEngine _setupContextAndPlanWithConfiguration:usingCPU:priority:error:](self, "_setupContextAndPlanWithConfiguration:usingCPU:priority:error:", a3, 0, *(_QWORD *)&a4, a5);
}

- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 usingCPU:(BOOL)a4 priority:(int)a5 error:(id *)a6
{
  return -[MLNeuralNetworkEngine _setupContextAndPlanWithConfiguration:usingCPU:priority:reshapeWithContainer:error:](self, "_setupContextAndPlanWithConfiguration:usingCPU:priority:reshapeWithContainer:error:", a3, a4, *(_QWORD *)&a5, 0, a6);
}

- (BOOL)_addCompiledNetworkOrProgramToPlan:(void *)a3 error:(id *)a4
{
  void *value;
  uint64_t *p_shared_owners;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint8_t buf[8];
  std::__shared_weak_count *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  value = (void *)self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_;
  if (!value)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The in-memory compiled model is neither ML Program nor NNv1. This is a logic error."));
    v21 = 0;
    return -[MLNeuralNetworkEngine _handleAddNetworkToPlanStatus:error:](self, "_handleAddNetworkToPlanStatus:error:", v21, a4, v24);
  }
  objc_msgSend(value, "program");
  if (!v27)
    goto LABEL_6;
  p_shared_owners = &v27->__shared_owners_;
  do
    v8 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v8 - 1, (unint64_t *)p_shared_owners));
  if (v8)
  {
LABEL_6:
    if (*(_QWORD *)buf)
      goto LABEL_7;
    goto LABEL_16;
  }
  ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
  std::__shared_weak_count::__release_weak(v27);
  if (!*(_QWORD *)buf)
  {
LABEL_16:
    v18 = (void *)self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_;
    if (v18)
    {
      objc_msgSend(v18, "network");
      if (v27)
      {
        v19 = &v27->__shared_owners_;
        do
          v20 = __ldaxr((unint64_t *)v19);
        while (__stlxr(v20 - 1, (unint64_t *)v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
    }
    goto LABEL_22;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNeuralNetworkEngine activeFunction](self, "activeFunction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = (void *)self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_;
    if (v12)
      objc_msgSend(v12, "program");
    else
      v25 = 0;
    v21 = espresso_plan_add_cpp_net_from_mil_program_and_reload();
    if (v25)
    {
      v22 = (unint64_t *)&v25->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    return -[MLNeuralNetworkEngine _handleAddNetworkToPlanStatus:error:](self, "_handleAddNetworkToPlanStatus:error:", v21, a4, v24);
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "In-memory ML Program with non-main function is not supported.", buf, 2u);
  }

  if (a4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("In-memory ML Program with non-main function is not supported."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 usingCPU:(BOOL)a4 priority:(int)a5 reshapeWithContainer:(BOOL)a6 error:(id *)a7
{
  uint64_t v8;
  id v10;
  uint64_t v11;
  _BYTE *v12;
  unint64_t context;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  int v28;
  NSObject *v29;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *left;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> **v38;
  char *v39;
  char *v40;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  int v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  int v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  int v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  int v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char *v90;
  int v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  char *v100;
  int v101;
  MLNeuralNetworkEngine *isa;
  MLNeuralNetworkEngine *v103;
  BOOL v104;
  BOOL v105;
  void *v106;
  void *v107;
  void *v108;
  BOOL v109;
  void *v110;
  int additional_configuration_names;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  void *v116;
  char v117;
  void *v118;
  int v119;
  void *v120;
  _BOOL4 v121;
  void *v123;
  char *v124;
  unint64_t v125;
  void *v126;
  char *v127;
  unint64_t v128;
  void *v129;
  char *v130;
  unint64_t v131;
  void *v132;
  char *v133;
  unint64_t v134;
  void *v135;
  char *v136;
  unint64_t v137;
  void *__p;
  char *v139;
  unint64_t v140;
  uint8_t buf[24];
  uint64_t v142;
  _QWORD v143[4];

  v121 = a6;
  v8 = a4;
  v143[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  kdebug_trace();
  if (self->_numOutputs)
  {
    espresso_context_destroy();
    self->_numOutputs = 0;
  }
  if (self->_numInputs)
  {
    espresso_plan_destroy();
    self->_numInputs = 0;
  }
  if ((v8 & 1) != 0
    || !objc_msgSend(v10, "computeUnits")
    || objc_msgSend(v10, "computeUnits") == 3 && BYTE1(self->_compilerOutput))
  {
    goto LABEL_14;
  }
  v11 = objc_msgSend(v10, "computeUnits");
  if (v11 != 3)
  {
    if (!HIBYTE(self->_transferSession))
      goto LABEL_207;
LABEL_14:
    v12 = (char *)&self->_transferSession + 3;
    BYTE3(self->_transferSession) = 1;
LABEL_15:
    *(_DWORD *)&self->_hardwareFallbackDetected = 0;
    HIDWORD(self->_compilerOutput) = 65568;
    goto LABEL_16;
  }
  +[MLInternalSettings globalSettings](MLInternalSettings, "globalSettings");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v8, "restrictNeuralNetworksFromUsingANE") & 1) != 0 || HIBYTE(self->_transferSession))
  {
    v12 = (char *)&self->_transferSession + 3;
    BYTE3(self->_transferSession) = 1;
LABEL_212:

    goto LABEL_213;
  }
LABEL_207:
  +[MLInternalSettings globalSettings](MLInternalSettings, "globalSettings");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v116, "restrictNeuralNetworksToUseCPUOnly");
  if ((v117 & 1) != 0 || !LOBYTE(self->_compilerOutput))
  {
    v12 = (char *)&self->_transferSession + 3;
    BYTE3(self->_transferSession) = v117;
  }
  else
  {
    v12 = (char *)&self->_transferSession + 3;
    BYTE3(self->_transferSession) = BYTE1(self->_compilerOutput);
  }

  if (v11 == 3)
    goto LABEL_212;
LABEL_213:
  if (*v12)
    goto LABEL_15;
  +[MLInternalSettings globalSettings](MLInternalSettings, "globalSettings");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v118, "restrictNeuralNetworksFromUsingANE") & 1) != 0 || objc_msgSend(v10, "computeUnits") == 1)
  {

  }
  else
  {
    v119 = BYTE1(self->_compilerOutput);

    if (!v119)
    {
      *(_DWORD *)&self->_hardwareFallbackDetected = 10007;
      HIDWORD(self->_compilerOutput) = 65552;
      goto LABEL_16;
    }
  }
  if (objc_msgSend(v10, "computeUnits") == 3)
  {
    *(_DWORD *)&self->_hardwareFallbackDetected = 0;
    HIDWORD(self->_compilerOutput) = 65568;
    *v12 = 1;
  }
  else
  {
    *(_DWORD *)&self->_hardwareFallbackDetected = objc_msgSend((id)objc_opt_class(), "gpuEngine");
    HIDWORD(self->_compilerOutput) = objc_msgSend((id)objc_opt_class(), "gpuPrecision");
  }
LABEL_16:
  if (-[MLNeuralNetworkEngine _espressoDeviceForConfiguration:error:](self, "_espressoDeviceForConfiguration:error:", v10, a7) == -1)goto LABEL_205;
  context = espresso_create_context();
  self->_numOutputs = context;
  if (!context)
  {
    if (*(_DWORD *)&self->_hardwareFallbackDetected != 10007
      || (objc_msgSend(v10, "computeUnits") != 3
        ? (*(_DWORD *)&self->_hardwareFallbackDetected = objc_msgSend((id)objc_opt_class(), "gpuEngine"),
           HIDWORD(self->_compilerOutput) = objc_msgSend((id)objc_opt_class(), "gpuPrecision"))
        : (*(_DWORD *)&self->_hardwareFallbackDetected = 0, HIDWORD(self->_compilerOutput) = 65568, *v12 = 1),
          v14 = espresso_create_context(),
          (self->_numOutputs = v14) == 0))
    {
      *(_DWORD *)&self->_hardwareFallbackDetected = 0;
      HIDWORD(self->_compilerOutput) = 65568;
      *v12 = 1;
      self->_numOutputs = espresso_create_context();
    }
  }
  if (objc_msgSend(v10, "computeUnits") == 3)
  {
    v15 = espresso_context_set_int_option();
    if ((_DWORD)v15)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v15;
        _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "Failed to configure the model to use CPU and NeuralEngine due to error code: %d.", buf, 8u);
      }

      if (a7)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v142 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to configure the model to use CPU and NeuralEngine due to error code: %d."), v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v143[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, &v142, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v19);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_30;
      }
LABEL_205:
      v20 = 0;
      goto LABEL_206;
    }
  }
  if (objc_msgSend(v10, "allowLowPrecisionAccumulationOnGPU"))
  {
    Espresso::get_internal_context((Espresso *)self->_numOutputs, v21);
    v22 = *(std::__shared_weak_count **)&buf[8];
    *(_DWORD *)(*(_QWORD *)buf + 68) = 1;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v24 = __ldaxr(p_shared_owners);
      while (__stlxr(v24 - 1, p_shared_owners));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
  }
  if (objc_msgSend(v10, "enableTestVectorMode"))
    espresso_enable_test_vector_mode();
  -[MLNeuralNetworkEngine modelIsEncrypted](self, "modelIsEncrypted");
  self->_numInputs = espresso_create_plan();
  *(_DWORD *)&self->_isGPUPathForbidden = a5;
  if (*(_DWORD *)&self->_hardwareFallbackDetected == 10007)
  {
    espresso_plan_set_priority();
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19C486000, v25, OS_LOG_TYPE_DEBUG, "Unable to set priority when the backend is not ANE", buf, 2u);
    }

  }
  if (!-[MLNeuralNetworkEngine _setMultipleBuffersOnPlan:error:](self, "_setMultipleBuffersOnPlan:error:", self->_numInputs, a7)|| !-[MLNeuralNetworkEngine _addNetworkToPlan:error:](self, "_addNetworkToPlan:error:", self->_numInputs, a7))
  {
    goto LABEL_205;
  }
  -[MLModelEngine configuration](self, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "modelDisplayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (objc_msgSend(v18, "length"))
    {
      if (objc_msgSend(v10, "allowsInstrumentation"))
      {
        v27 = objc_retainAutorelease(v18);
        objc_msgSend(v27, "UTF8String");
        v28 = espresso_network_set_tracing_name();
        if (v28)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v27;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v28;
            _os_log_error_impl(&dword_19C486000, v29, OS_LOG_TYPE_ERROR, "Unable to set tracing name ('%@') to the underlying inference engine due to error: %d.", buf, 0x12u);
          }

        }
      }
    }
  }
  if (!v121)
    goto LABEL_192;
  v120 = v18;
  memset(buf, 0, sizeof(buf));
  __p = 0;
  v139 = 0;
  v140 = 0;
  v135 = 0;
  v136 = 0;
  v137 = 0;
  v132 = 0;
  v133 = 0;
  v134 = 0;
  v129 = 0;
  v130 = 0;
  v131 = 0;
  v126 = 0;
  v127 = 0;
  v128 = 0;
  v123 = 0;
  v124 = 0;
  v125 = 0;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)self->_currentBlobShapes.__tree_.__begin_node_;
  if (begin_node != &self->_currentBlobShapes.__tree_.__pair1_)
  {
    do
    {
      left = begin_node + 4;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)left->__value_.__left_;
      v32 = *(_QWORD *)&buf[8];
      if (*(_QWORD *)&buf[8] >= *(_QWORD *)&buf[16])
      {
        v34 = (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3;
        if ((unint64_t)(v34 + 1) >> 61)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        v35 = (uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 2;
        if (v35 <= v34 + 1)
          v35 = v34 + 1;
        if (*(_QWORD *)&buf[16] - *(_QWORD *)buf >= 0x7FFFFFFFFFFFFFF8uLL)
          v36 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v36 = v35;
        if (v36)
          v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v36);
        else
          v37 = 0;
        v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> **)(v36 + 8 * v34);
        *v38 = left;
        v33 = v38 + 1;
        v40 = *(char **)buf;
        v39 = *(char **)&buf[8];
        if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
        {
          do
          {
            v41 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)*((_QWORD *)v39 - 1);
            v39 -= 8;
            *--v38 = v41;
          }
          while (v39 != v40);
          v39 = *(char **)buf;
        }
        *(_QWORD *)buf = v38;
        *(_QWORD *)&buf[8] = v33;
        *(_QWORD *)&buf[16] = v36 + 8 * v37;
        if (v39)
          operator delete(v39);
      }
      else
      {
        **(_QWORD **)&buf[8] = left;
        v33 = (_QWORD *)(v32 + 8);
      }
      *(_QWORD *)&buf[8] = v33;
      v42 = v139;
      if ((unint64_t)v139 >= v140)
      {
        v44 = (char *)__p;
        v45 = (v139 - (_BYTE *)__p) >> 2;
        v46 = v45 + 1;
        if ((unint64_t)(v45 + 1) >> 62)
          goto LABEL_222;
        v47 = v140 - (_QWORD)__p;
        if ((uint64_t)(v140 - (_QWORD)__p) >> 1 > v46)
          v46 = v47 >> 1;
        if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL)
          v48 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v48 = v46;
        if (v48)
        {
          v48 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v48);
          v44 = (char *)__p;
          v42 = v139;
        }
        else
        {
          v49 = 0;
        }
        v50 = (char *)(v48 + 4 * v45);
        *(_DWORD *)v50 = begin_node[7].__value_.__left_;
        v43 = v50 + 4;
        while (v42 != v44)
        {
          v51 = *((_DWORD *)v42 - 1);
          v42 -= 4;
          *((_DWORD *)v50 - 1) = v51;
          v50 -= 4;
        }
        __p = v50;
        v139 = v43;
        v140 = v48 + 4 * v49;
        if (v44)
          operator delete(v44);
      }
      else
      {
        *(_DWORD *)v139 = begin_node[7].__value_.__left_;
        v43 = v42 + 4;
      }
      v139 = v43;
      v52 = v136;
      if ((unint64_t)v136 >= v137)
      {
        v54 = (char *)v135;
        v55 = (v136 - (_BYTE *)v135) >> 2;
        v56 = v55 + 1;
        if ((unint64_t)(v55 + 1) >> 62)
          goto LABEL_222;
        v57 = v137 - (_QWORD)v135;
        if ((uint64_t)(v137 - (_QWORD)v135) >> 1 > v56)
          v56 = v57 >> 1;
        if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFFCLL)
          v58 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v58 = v56;
        if (v58)
        {
          v58 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v58);
          v54 = (char *)v135;
          v52 = v136;
        }
        else
        {
          v59 = 0;
        }
        v60 = (char *)(v58 + 4 * v55);
        *(_DWORD *)v60 = HIDWORD(begin_node[7].__value_.__left_);
        v53 = v60 + 4;
        while (v52 != v54)
        {
          v61 = *((_DWORD *)v52 - 1);
          v52 -= 4;
          *((_DWORD *)v60 - 1) = v61;
          v60 -= 4;
        }
        v135 = v60;
        v136 = v53;
        v137 = v58 + 4 * v59;
        if (v54)
          operator delete(v54);
      }
      else
      {
        *(_DWORD *)v136 = HIDWORD(begin_node[7].__value_.__left_);
        v53 = v52 + 4;
      }
      v136 = v53;
      v62 = v133;
      if ((unint64_t)v133 >= v134)
      {
        v64 = (char *)v132;
        v65 = (v133 - (_BYTE *)v132) >> 2;
        v66 = v65 + 1;
        if ((unint64_t)(v65 + 1) >> 62)
          goto LABEL_222;
        v67 = v134 - (_QWORD)v132;
        if ((uint64_t)(v134 - (_QWORD)v132) >> 1 > v66)
          v66 = v67 >> 1;
        if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFFCLL)
          v68 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v68 = v66;
        if (v68)
        {
          v68 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v68);
          v64 = (char *)v132;
          v62 = v133;
        }
        else
        {
          v69 = 0;
        }
        v70 = (char *)(v68 + 4 * v65);
        *(_DWORD *)v70 = begin_node[8].__value_.__left_;
        v63 = v70 + 4;
        while (v62 != v64)
        {
          v71 = *((_DWORD *)v62 - 1);
          v62 -= 4;
          *((_DWORD *)v70 - 1) = v71;
          v70 -= 4;
        }
        v132 = v70;
        v133 = v63;
        v134 = v68 + 4 * v69;
        if (v64)
          operator delete(v64);
      }
      else
      {
        *(_DWORD *)v133 = begin_node[8].__value_.__left_;
        v63 = v62 + 4;
      }
      v133 = v63;
      v72 = v130;
      if ((unint64_t)v130 >= v131)
      {
        v74 = (char *)v129;
        v75 = (v130 - (_BYTE *)v129) >> 2;
        v76 = v75 + 1;
        if ((unint64_t)(v75 + 1) >> 62)
          goto LABEL_222;
        v77 = v131 - (_QWORD)v129;
        if ((uint64_t)(v131 - (_QWORD)v129) >> 1 > v76)
          v76 = v77 >> 1;
        if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFFCLL)
          v78 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v78 = v76;
        if (v78)
        {
          v78 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v78);
          v74 = (char *)v129;
          v72 = v130;
        }
        else
        {
          v79 = 0;
        }
        v80 = (char *)(v78 + 4 * v75);
        *(_DWORD *)v80 = HIDWORD(begin_node[8].__value_.__left_);
        v73 = v80 + 4;
        while (v72 != v74)
        {
          v81 = *((_DWORD *)v72 - 1);
          v72 -= 4;
          *((_DWORD *)v80 - 1) = v81;
          v80 -= 4;
        }
        v129 = v80;
        v130 = v73;
        v131 = v78 + 4 * v79;
        if (v74)
          operator delete(v74);
      }
      else
      {
        *(_DWORD *)v130 = HIDWORD(begin_node[8].__value_.__left_);
        v73 = v72 + 4;
      }
      v130 = v73;
      v82 = v127;
      if ((unint64_t)v127 >= v128)
      {
        v84 = (char *)v126;
        v85 = (v127 - (_BYTE *)v126) >> 2;
        v86 = v85 + 1;
        if ((unint64_t)(v85 + 1) >> 62)
          goto LABEL_222;
        v87 = v128 - (_QWORD)v126;
        if ((uint64_t)(v128 - (_QWORD)v126) >> 1 > v86)
          v86 = v87 >> 1;
        if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFFCLL)
          v88 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v88 = v86;
        if (v88)
        {
          v88 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v88);
          v84 = (char *)v126;
          v82 = v127;
        }
        else
        {
          v89 = 0;
        }
        v90 = (char *)(v88 + 4 * v85);
        *(_DWORD *)v90 = begin_node[9].__value_.__left_;
        v83 = v90 + 4;
        while (v82 != v84)
        {
          v91 = *((_DWORD *)v82 - 1);
          v82 -= 4;
          *((_DWORD *)v90 - 1) = v91;
          v90 -= 4;
        }
        v126 = v90;
        v127 = v83;
        v128 = v88 + 4 * v89;
        if (v84)
          operator delete(v84);
      }
      else
      {
        *(_DWORD *)v127 = begin_node[9].__value_.__left_;
        v83 = v82 + 4;
      }
      v127 = v83;
      if (BYTE1(self->_transferSession))
      {
        v92 = v124;
        if ((unint64_t)v124 >= v125)
        {
          v94 = (char *)v123;
          v95 = (v124 - (_BYTE *)v123) >> 2;
          v96 = v95 + 1;
          if ((unint64_t)(v95 + 1) >> 62)
LABEL_222:
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v97 = v125 - (_QWORD)v123;
          if ((uint64_t)(v125 - (_QWORD)v123) >> 1 > v96)
            v96 = v97 >> 1;
          if ((unint64_t)v97 >= 0x7FFFFFFFFFFFFFFCLL)
            v98 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v98 = v96;
          if (v98)
          {
            v98 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v98);
            v94 = (char *)v123;
            v92 = v124;
          }
          else
          {
            v99 = 0;
          }
          v100 = (char *)(v98 + 4 * v95);
          *(_DWORD *)v100 = HIDWORD(begin_node[9].__value_.__left_);
          v93 = v100 + 4;
          while (v92 != v94)
          {
            v101 = *((_DWORD *)v92 - 1);
            v92 -= 4;
            *((_DWORD *)v100 - 1) = v101;
            v100 -= 4;
          }
          v123 = v100;
          v124 = v93;
          v125 = v98 + 4 * v99;
          if (v94)
            operator delete(v94);
        }
        else
        {
          *(_DWORD *)v124 = HIDWORD(begin_node[9].__value_.__left_);
          v93 = v92 + 4;
        }
        v124 = v93;
      }
      isa = (MLNeuralNetworkEngine *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          v103 = isa;
          isa = (MLNeuralNetworkEngine *)isa->super.super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          v103 = (MLNeuralNetworkEngine *)begin_node[2].__value_.__left_;
          v104 = v103->super.super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)v103;
        }
        while (!v104);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)v103;
    }
    while (v103 != (MLNeuralNetworkEngine *)&self->_currentBlobShapes.__tree_.__pair1_);
  }
  v105 = -[MLNeuralNetworkEngine setEspressoBlobShapes:widths:heights:ks:batches:sequences:ranks:error:](self, "setEspressoBlobShapes:widths:heights:ks:batches:sequences:ranks:error:", buf, &__p, &v135, &v132, &v129, &v126, &v123, a7);
  v18 = v120;
  if (v123)
  {
    v124 = (char *)v123;
    operator delete(v123);
  }
  if (v126)
  {
    v127 = (char *)v126;
    operator delete(v126);
  }
  if (v129)
  {
    v130 = (char *)v129;
    operator delete(v129);
  }
  if (v132)
  {
    v133 = (char *)v132;
    operator delete(v132);
  }
  if (v135)
  {
    v136 = (char *)v135;
    operator delete(v135);
  }
  if (__p)
  {
    v139 = (char *)__p;
    operator delete(__p);
  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }
  if (v105)
  {
LABEL_192:
    -[MLNeuralNetworkEngine inputBlobNameToLastBackingMode](self, "inputBlobNameToLastBackingMode");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "removeAllObjects");

    -[MLNeuralNetworkEngine outputBlobNameToLastBackingMode](self, "outputBlobNameToLastBackingMode");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "removeAllObjects");

    -[MLModelEngine configuration](self, "configuration");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (objc_msgSend(v108, "profilingOptions") & 1) == 0;

    if (!v109)
    {
      espresso_plan_static_profiling_info();
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLNeuralNetworkEngine setEspressoProfileInfo:](self, "setEspressoProfileInfo:", v110);

    }
    memset(buf, 0, sizeof(buf));
    additional_configuration_names = espresso_get_additional_configuration_names();
    v113 = *(_QWORD **)buf;
    v112 = *(_QWORD **)&buf[8];
    if (additional_configuration_names)
    {
      v114 = *(_QWORD **)buf;
      if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
      {
        do
        {
          if (*((char *)v112 - 1) < 0)
            operator delete((void *)*(v112 - 3));
          v112 -= 3;
        }
        while (v112 != v113);
        v114 = *(_QWORD **)buf;
      }
      *(_QWORD *)&buf[8] = v113;
      v112 = v113;
      v113 = v114;
    }
    for (; v113 != v112; v113 += 3)
      std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&self->_flexibleShapesConfigNamesInNet, v113, (uint64_t)v113);
    MEMORY[0x1A1AD5EAC](&self->_currentConfigurationName, &unk_19CB39696);
    v20 = -[MLNeuralNetworkEngine rebuildPlan:](self, "rebuildPlan:", a7);
    __p = buf;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    goto LABEL_204;
  }
LABEL_30:
  v20 = 0;
LABEL_204:

LABEL_206:
  kdebug_trace();

  return v20;
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AD6ED8]();
  +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[MLNeuralNetworkEngine evaluateInputs:options:error:](self, "evaluateInputs:options:error:", v6, v8, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;

  objc_autoreleasePoolPop(v7);
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

- (BOOL)bindInputsAndOutputs:(id)a3 cleanUpBlocks:(id)a4 bufferIndex:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  BOOL v13;

  v11 = a3;
  v12 = a4;
  v13 = -[MLNeuralNetworkEngine bindInputFeatures:bufferIndex:cleanUpBlocks:directlyBoundFeatureNames:error:](self, "bindInputFeatures:bufferIndex:cleanUpBlocks:directlyBoundFeatureNames:error:", v11, a5, v12, 0, a7)&& -[MLNeuralNetworkEngine bindOutputBuffers:outputBackings:automaticOutputBackingMode:directlyBoundOutputFeatureNames:error:](self, "bindOutputBuffers:outputBackings:automaticOutputBackingMode:directlyBoundOutputFeatureNames:error:", (char *)self->_outputBuffers.__begin_ + 24 * a5, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], 0, a7);

  return v13;
}

- (BOOL)bindInputFeatureNamed:(id)a3 featureValue:(id)a4 bufferIndex:(unint64_t)a5 cleanUpBlocks:(id)a6 boundDirectly:(BOOL *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  int64_t v17;
  _BOOL4 v18;
  unint64_t v19;
  void (**v20)(_QWORD);
  uint64_t v21;
  unint64_t v22;
  void (**v23)(_QWORD);
  uint64_t v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v30;
  _QWORD v31[5];
  _QWORD aBlock[5];
  BOOL v33;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = v14;
  v17 = 0;
  v33 = 0;
  v30 = v16;
  while (1)
  {
    switch(v17)
    {
      case 0:
        v17 = -[MLNeuralNetworkEngine inputBindStateForFeatureValue:error:](self, "inputBindStateForFeatureValue:error:", v16, a8);
        continue;
      case 1:
      case 2:
        if (a7 && v17 == 1)
          *a7 = v33;

        return v17 == 1;
      case 3:
        v19 = -[MLModelEngine signpostID](self, "signpostID");
        kdebug_trace();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __106__MLNeuralNetworkEngine_bindInputFeatureNamed_featureValue_bufferIndex_cleanUpBlocks_boundDirectly_error___block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v19;
        v20 = (void (**)(_QWORD))_Block_copy(aBlock);
        -[MLNeuralNetworkEngine imageFeatureValueFromPixelBuffer:usingPixelFormat:](self, "imageFeatureValueFromPixelBuffer:usingPixelFormat:", objc_msgSend(v16, "imageBufferValue"), 1111970369);
        v21 = objc_claimAutoreleasedReturnValue();

        v20[2](v20);
        v17 = 0;
        v16 = (id)v21;
        continue;
      case 4:
      case 5:
        v18 = -[MLNeuralNetworkEngine bindInputFeatureNamed:pixelBuffer:cleanUpBlocks:error:](self, "bindInputFeatureNamed:pixelBuffer:cleanUpBlocks:error:", v13, objc_msgSend(v16, "imageBufferValue"), v15, a8);
        goto LABEL_8;
      case 6:
        goto LABEL_7;
      case 7:
        v22 = -[MLModelEngine signpostID](self, "signpostID");
        kdebug_trace();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __106__MLNeuralNetworkEngine_bindInputFeatureNamed_featureValue_bufferIndex_cleanUpBlocks_boundDirectly_error___block_invoke_2;
        v31[3] = &__block_descriptor_40_e5_v8__0l;
        v31[4] = v22;
        v23 = (void (**)(_QWORD))_Block_copy(v31);
        -[MLNeuralNetworkEngine imageFeatureValueFromPixelBuffer:usingPixelFormat:](self, "imageFeatureValueFromPixelBuffer:usingPixelFormat:", objc_msgSend(v16, "imageBufferValue"), 1278226536);
        v24 = objc_claimAutoreleasedReturnValue();

        v23[2](v23);
        v16 = (id)v24;
LABEL_7:
        v18 = -[MLNeuralNetworkEngine bindDirectlyInputFeatureNamed:pixelBuffer:cleanUpBlocks:boundDirectly:error:](self, "bindDirectlyInputFeatureNamed:pixelBuffer:cleanUpBlocks:boundDirectly:error:", v13, objc_msgSend(v16, "imageBufferValue"), v15, &v33, a8);
LABEL_8:
        if (v18)
          v17 = 1;
        else
          v17 = 2;
        continue;
      case 8:
        objc_msgSend(v16, "multiArrayValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[MLNeuralNetworkEngine bindDirectlyInputFeatureNamed:pixelBuffer:cleanUpBlocks:boundDirectly:error:](self, "bindDirectlyInputFeatureNamed:pixelBuffer:cleanUpBlocks:boundDirectly:error:", v13, objc_msgSend(v25, "pixelBuffer"), v15, &v33, a8);

        v17 = 1;
        if (!v26)
          goto LABEL_12;
        continue;
      case 9:
      case 10:
      case 11:
      case 12:
LABEL_12:
        objc_msgSend(v16, "multiArrayValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[MLNeuralNetworkEngine bindInputFeatureNamed:convertingMultiArray:bufferIndex:error:](self, "bindInputFeatureNamed:convertingMultiArray:bufferIndex:error:", v13, v27, a5, a8))
        {
          v17 = 1;
        }
        else
        {
          v17 = 2;
        }

        break;
      default:
        continue;
    }
  }
}

- (BOOL)bindDirectlyInputFeatureNamed:(id)a3 pixelBuffer:(__CVBuffer *)a4 cleanUpBlocks:(id)a5 boundDirectly:(BOOL *)a6 error:(id *)a7
{
  id v12;
  id v13;
  __CVBuffer *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD aBlock[5];
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  int v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = -[MLNeuralNetworkEngine copyPixelBufferByApplyingImagePreprocessingForFeatureNamed:toPixelBuffer:](self, "copyPixelBufferByApplyingImagePreprocessingForFeatureNamed:toPixelBuffer:", v12, a4);
  if (v14)
  {
    if (a6)
      *a6 = v14 == a4;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__MLNeuralNetworkEngine_bindDirectlyInputFeatureNamed_pixelBuffer_cleanUpBlocks_boundDirectly_error___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v14;
    v15 = _Block_copy(aBlock);
    objc_msgSend(v13, "addObject:", v15);

    -[MLNeuralNetworkEngine prepareBlobNamed:forNewBlobBackingMode:bindMode:](self, "prepareBlobNamed:forNewBlobBackingMode:bindMode:", v12, -1, 0x10000);
    v16 = objc_retainAutorelease(v12);
    objc_msgSend(v16, "UTF8String");
    v17 = espresso_network_bind_cvpixelbuffer();
    if (!(_DWORD)v17)
    {
      LOBYTE(a7) = 1;
      goto LABEL_15;
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v16;
      v31 = 1024;
      v32 = v17;
      _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Failed to bind pixel buffer directly to the feature named '%@' due to error: %d.", buf, 0x12u);
    }

    if (a7)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to bind pixel buffer directly to the feature named '%@' due to error: %d."), v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      *a7 = v22;

      LOBYTE(a7) = 0;
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "Failed to apply image preprocessing parameters to pixel buffer for the feature named '%@'.", buf, 0xCu);
    }

    if (a7)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to apply image preprocessing parameters to pixel buffer for the feature named '%@'."), v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
LABEL_15:

  return (char)a7;
}

- (__CVBuffer)copyPixelBufferByApplyingImagePreprocessingForFeatureNamed:(id)a3 toPixelBuffer:(__CVBuffer *)a4
{
  id v6;
  _QWORD *v7;
  uint64_t *p_shared_owners;
  unint64_t v9;
  id v10;
  char *v11;
  _QWORD *v12;
  char *v13;
  _BOOL4 v14;
  _QWORD *v15;
  __CVBuffer *v16;
  __CVBuffer *v17;
  void *__p;
  std::__shared_weak_count *v20;
  char v21;

  v6 = a3;
  -[MLNeuralNetworkEngine network](self, "network");
  Espresso::get_internal_network();
  v7 = __p;
  if (v20)
  {
    p_shared_owners = &v20->__shared_owners_;
    do
      v9 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v9 - 1, (unint64_t *)p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v10 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v10, "UTF8String"));
  v11 = (char *)(v7 + 42);
  v12 = (_QWORD *)v7[42];
  if (!v12)
    goto LABEL_13;
  v13 = (char *)(v7 + 42);
  do
  {
    v14 = google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(v12 + 4, &__p);
    v15 = v12 + 1;
    if (!v14)
    {
      v15 = v12;
      v13 = (char *)v12;
    }
    v12 = (_QWORD *)*v15;
  }
  while (*v15);
  if (v13 == v11
    || google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(&__p, (_QWORD *)v13 + 4))
  {
LABEL_13:
    v13 = v11;
  }
  if (v21 < 0)
    operator delete(__p);
  if (v11 == v13)
    v16 = CVPixelBufferRetain(a4);
  else
    v16 = -[MLNeuralNetworkEngine copyPixelBufferByApplyingImagePreprocessing:toPixelBuffer:](self, "copyPixelBufferByApplyingImagePreprocessing:toPixelBuffer:", v13 + 56, a4);
  v17 = v16;

  return v17;
}

- (__CVBuffer)copyPixelBufferByApplyingImagePreprocessing:(const vimage2espresso_param *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  uint64_t PixelFormatType;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CVBuffer *v13;
  size_t Width;
  size_t Height;
  void *v16;
  double v17;
  double v18;
  uint8_t buf[4];
  unsigned int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  if ((_DWORD)PixelFormatType != 1278226536)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      v9 = BYTE3(PixelFormatType);
      v21 = BYTE3(PixelFormatType);
      v10 = BYTE2(PixelFormatType);
      v22 = 1024;
      v12 = BYTE1(PixelFormatType);
      v11 = PixelFormatType;
      v23 = BYTE2(PixelFormatType);
      v24 = 1024;
      v25 = BYTE1(PixelFormatType);
      v26 = 1024;
      v27 = PixelFormatType;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Only pixel buffers with OneComponent16Half format can use the direct binding path, but the pixel buffer's pixel format type is %c%c%c%c. This is a logic error.", buf, 0x1Au);
    }
    else
    {
      v9 = BYTE3(PixelFormatType);
      v10 = BYTE2(PixelFormatType);
      v11 = PixelFormatType;
      v12 = BYTE1(PixelFormatType);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Only pixel buffers with OneComponent16Half format can use the direct binding path, but the pixel buffer's pixel format type is %c%c%c%c. This is a logic error."), v9, v10, v12, v11);
  }
  if (a3->var0 == 1.0 && a3->var4 == 0.0)
    return CVPixelBufferRetain(a4);
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  -[MLNeuralNetworkEngine pixelBufferPool](self, "pixelBufferPool");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__CVBuffer *)objc_msgSend(v16, "createPixelBufferWithSize:pixelFormatType:error:", PixelFormatType, 0, (double)Width, (double)Height);

  if (v13)
  {
    *(float *)&v17 = a3->var0;
    *(float *)&v18 = a3->var4;
    if (!-[MLNeuralNetworkEngine transferOneComponent16HalfPixelBuffer:toPixelBuffer:withScale:bias:](self, "transferOneComponent16HalfPixelBuffer:toPixelBuffer:withScale:bias:", a4, v13, v17, v18))
    {
      CVPixelBufferRelease(v13);
      return 0;
    }
  }
  return v13;
}

- (BOOL)transferOneComponent16HalfPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 withScale:(float)a5 bias:(float)a6
{
  unint64_t v10;
  void (**v11)(_QWORD);
  CVReturn v12;
  NSObject *v13;
  CVReturn v14;
  NSObject *v15;
  BOOL v16;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v21;
  size_t v22;
  size_t v23;
  void *v24;
  void *BaseAddress;
  void *v26;
  int v27;
  NSObject *v28;
  _QWORD aBlock[5];
  uint8_t v30[4];
  int v31;
  uint8_t buf[8];
  size_t v33;
  size_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  size_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  int v44;
  __int128 v45;
  __int128 v46;
  int v47;
  size_t v48;
  size_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  size_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  float v64;
  float v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = -[MLModelEngine signpostID](self, "signpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__MLNeuralNetworkEngine_transferOneComponent16HalfPixelBuffer_toPixelBuffer_withScale_bias___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  v12 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (v12)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Failed to apply the image preprocessing on OneComponent16Half pixel buffer because it was unable to access the source frame buffer due to CoreVideo error: %d.", buf, 8u);
    }

LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v14 = CVPixelBufferLockBaseAddress(a4, 0);
  if (v14)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v14;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Failed to apply the image preprocessing on OneComponent16Half pixel buffer because it was unable to access the destination frame buffer due to CoreVideo error: %d.", buf, 8u);
    }

    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    goto LABEL_9;
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v21 = CVPixelBufferGetWidth(a4);
  v22 = CVPixelBufferGetHeight(a4);
  v23 = CVPixelBufferGetBytesPerRow(a4);
  *(_QWORD *)buf = 0x2000000000000;
  v33 = Width;
  v34 = Height;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 1;
  v39 = BytesPerRow >> 1;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0;
  v45 = 0u;
  v46 = 0u;
  v44 = 65552;
  v47 = 0x20000;
  v48 = v21;
  v49 = v22;
  v52 = 0u;
  v51 = 0u;
  v50 = 0u;
  v53 = 1;
  v54 = v23 >> 1;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0;
  v59 = 65552;
  v61 = 0;
  v60 = 0;
  v62 = 0;
  v63 = 0x1400000000;
  v64 = a5;
  v65 = a6;
  v66 = 0u;
  v67 = 0u;
  v68 = 0;
  v24 = (void *)MEMORY[0x1A1AD4F1C](buf, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  v26 = CVPixelBufferGetBaseAddress(a4);
  v27 = BNNSFilterApply(v24, BaseAddress, v26);
  v16 = v27 == 0;
  if (v27)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v30 = 67109120;
      v31 = v27;
      _os_log_error_impl(&dword_19C486000, v28, OS_LOG_TYPE_ERROR, "Failed to apply the image preprocessing (scale and bias) due to BNNS error: %d.", v30, 8u);
    }

  }
  BNNSFilterDestroy(v24);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
LABEL_10:
  v11[2](v11);

  return v16;
}

- (BOOL)lockPixelBuffer:(__CVBuffer *)a3 cleanUpBlocks:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[MLModelEngine signpostID](self, "signpostID");
  kdebug_trace();
  v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if ((_DWORD)v9)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v9;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Failed to access the source frame buffer due to CoreVideo error: %d.", buf, 8u);
    }

    if (a5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to access the source frame buffer due to CoreVideo error: %d."), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    kdebug_trace();
  }
  else
  {
    CVPixelBufferGetBaseAddress(a3);
    kdebug_trace();
    CVPixelBufferRetain(a3);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__MLNeuralNetworkEngine_lockPixelBuffer_cleanUpBlocks_error___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = a3;
    v14 = _Block_copy(aBlock);
    objc_msgSend(v8, "addObject:", v14);

  }
  return (_DWORD)v9 == 0;
}

- (BOOL)bindInputFeatureNamed:(id)a3 pixelBuffer:(__CVBuffer *)a4 cleanUpBlocks:(id)a5 error:(id *)a6
{
  id v10;
  OSType PixelFormatType;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  OSType v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!-[MLNeuralNetworkEngine lockPixelBuffer:cleanUpBlocks:error:](self, "lockPixelBuffer:cleanUpBlocks:error:", a4, a5, a6))
  {
    LOBYTE(a6) = 0;
    goto LABEL_22;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  CVPixelBufferGetBaseAddress(a4);
  CVPixelBufferGetWidth(a4);
  CVPixelBufferGetHeight(a4);
  CVPixelBufferGetBytesPerRow(a4);
  -[MLModelEngine modelDescription](self, "modelDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputDescriptionsByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v14;
  objc_msgSend(v14, "imageConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "pixelType");

  if (-[MLNeuralNetworkEngine modelIsMIL](self, "modelIsMIL"))
  {
    v17 = operator new();
    *(_DWORD *)(v17 + 16) = 0;
    *(_OWORD *)v17 = xmmword_19CB398D0;
    *(_BYTE *)(v17 + 16) = v16 == 30;
  }
  else
  {
    v17 = 0;
  }
  -[MLNeuralNetworkEngine prepareBlobNamed:forNewBlobBackingMode:bindMode:](self, "prepareBlobNamed:forNewBlobBackingMode:bindMode:", v10, 0x20000, 0x10000);
  if (PixelFormatType == 1111970369)
  {
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    v18 = espresso_network_bind_input_vimagebuffer_bgra8();
  }
  else
  {
    if (PixelFormatType != 1278226488)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      v20 = v14;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109888;
        v26 = HIBYTE(PixelFormatType);
        v35 = HIBYTE(PixelFormatType);
        v27 = BYTE2(PixelFormatType);
        v36 = 1024;
        v29 = BYTE1(PixelFormatType);
        v28 = PixelFormatType;
        v37 = BYTE2(PixelFormatType);
        v38 = 1024;
        v39 = BYTE1(PixelFormatType);
        v40 = 1024;
        v41 = PixelFormatType;
        _os_log_error_impl(&dword_19C486000, v25, OS_LOG_TYPE_ERROR, "Unexpected pixel format type %c%c%c%c.", buf, 0x1Au);
      }
      else
      {
        v26 = HIBYTE(PixelFormatType);
        v27 = BYTE2(PixelFormatType);
        v28 = PixelFormatType;
        v29 = BYTE1(PixelFormatType);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected pixel format type %c%c%c%c."), v26, v27, v29, v28);
      goto LABEL_18;
    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    v18 = espresso_network_bind_input_vimagebuffer_planar8();
  }
  v19 = v18;
  v20 = v14;
  if ((_DWORD)v18)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v35 = v19;
      _os_log_error_impl(&dword_19C486000, v21, OS_LOG_TYPE_ERROR, "Failed to bind image using vImage framework with error: %d.", buf, 8u);
    }

    if (a6)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to bind image using vImage framework with error: %d."), v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v31;
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a6) = 0;
    }
    goto LABEL_19;
  }
LABEL_18:
  LOBYTE(a6) = 1;
LABEL_19:
  if (v17)
    MEMORY[0x1A1AD6260](v17, 0x1000C40C46099A0);

LABEL_22:
  return (char)a6;
}

- (BOOL)bindInputFeatures:(id)a3 bufferIndex:(unint64_t)a4 cleanUpBlocks:(id)a5 directlyBoundFeatureNames:(id *)a6 error:(id *)a7
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  BOOL v20;
  void *v21;
  BOOL v22;
  id obj;
  id v29;
  void *v30;
  id v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = a5;
  v30 = v8;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v8, "featureNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v9;
  v10 = 0;
  v11 = 0;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1A1AD6ED8]();
        objc_msgSend(v30, "featureValueForName:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        v31 = v11;
        v18 = -[MLNeuralNetworkEngine bindInputFeatureNamed:featureValue:bufferIndex:cleanUpBlocks:boundDirectly:error:](self, "bindInputFeatureNamed:featureValue:bufferIndex:cleanUpBlocks:boundDirectly:error:", v15, v17, a4, v29, &v32, &v31);
        v19 = v31;

        v11 = v19;
        if (v32)
          v20 = v18;
        else
          v20 = 0;
        if (v20)
        {
          if (!v10)
            v10 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          objc_msgSend(v10, "addObject:", v15);
        }

        objc_autoreleasePoolPop(v16);
        if (!v18)
        {

          if (a7)
          {
            v11 = objc_retainAutorelease(v19);
            v22 = 0;
            *a7 = v11;
          }
          else
          {
            v22 = 0;
          }
          goto LABEL_25;
        }
      }
      v9 = obj;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (a6)
  {
    if (v10)
      v21 = v10;
    else
      v21 = (void *)MEMORY[0x1E0C9AA60];
    *a6 = objc_retainAutorelease(v21);
  }
  v22 = 1;
LABEL_25:

  return v22;
}

- (BOOL)_setMultiArrayOutputBacking:(id)a3 forOutputFeatureName:(id)a4 toEbuf:(id *)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t blob_shape;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  char *v33;
  void *v34;
  char *v35;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t i;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  _QWORD *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v71;
  char *v72;
  char *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint8_t buf[4];
  int64_t v78;
  __int16 v79;
  uint64_t v80;
  void *__p[4];
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  _OWORD v86[2];
  uint64_t v87;
  _OWORD v88[2];
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v69 = a4;
  *(_OWORD *)&a5->var0 = 0u;
  *(_OWORD *)a5->var2 = 0u;
  *(_OWORD *)&a5->var2[2] = 0u;
  *(_OWORD *)a5->var3 = 0u;
  *(_OWORD *)&a5->var3[2] = 0u;
  *(_OWORD *)&a5->var4 = 0u;
  *(_OWORD *)&a5->var6 = 0u;
  *(_OWORD *)&a5->var8 = 0u;
  *(_OWORD *)&a5->var10 = 0u;
  *(_OWORD *)&a5->var12 = 0u;
  *(_QWORD *)&a5->var14 = 0;
  v9 = objc_retainAutorelease(v8);
  v10 = (void *)objc_msgSend(v9, "mutableBytes");
  v11 = 0;
  a5->var0 = v10;
  v88[0] = xmmword_19CB398E0;
  v88[1] = xmmword_19CB398F0;
  v89 = 112;
  v86[0] = xmmword_19CB39900;
  v86[1] = xmmword_19CB39910;
  v87 = 152;
  do
  {
    *(void **)((char *)&a5->var0 + *(_QWORD *)((char *)v88 + v11)) = (void *)1;
    *(void **)((char *)&a5->var0 + *(_QWORD *)((char *)v86 + v11)) = 0;
    v11 += 8;
  }
  while (v11 != 40);
  v74 = 0;
  v12 = objc_retainAutorelease(v69);
  objc_msgSend(v12, "UTF8String");
  blob_shape = espresso_network_query_blob_shape();
  if ((_DWORD)blob_shape)
    v14 = 1;
  else
    v14 = v74 == 0;
  if (v14)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p[0]) = 67109120;
      HIDWORD(__p[0]) = blob_shape;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Failed to get the output shape due to an error: %d. The framework could not validate the output backing's shape.", (uint8_t *)__p, 8u);
    }

    if (a6)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v84 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get the output shape due to an error: %d. The framework could not validate the output backing's shape."), blob_shape);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v18);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_17;
  }
  v19 = espresso_buffer_pack_tensor_shape();
  v20 = v19;
  if ((_DWORD)v19)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p[0]) = 134218240;
      *(void **)((char *)__p + 4) = v74;
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = v20;
      _os_log_error_impl(&dword_19C486000, v21, OS_LOG_TYPE_ERROR, "Failed to configure the indernal buffer to use the output shape of rank %zu due to an error: %d", (uint8_t *)__p, 0x12u);
    }

    if (a6)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v82 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to configure the indernal buffer to use the output shape of rank %zu due to an error: %d"), v74, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_17:
    v25 = 0;
    goto LABEL_18;
  }
  memset(__p, 0, 24);
  objc_msgSend(v9, "shape");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::reserve(__p, objc_msgSend(v27, "count"));

  objc_msgSend(v9, "shape");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  while (v29)
  {
    objc_msgSend(v9, "shape");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", --v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "unsignedIntValue") == 1;

    if (!v32)
    {
      v33 = (char *)__p[1];
      if (__p[1] >= __p[2])
      {
        v35 = (char *)__p[0];
        v36 = ((char *)__p[1] - (char *)__p[0]) >> 3;
        v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) >> 61)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        v38 = (char *)__p[2] - (char *)__p[0];
        if (((char *)__p[2] - (char *)__p[0]) >> 2 > v37)
          v37 = v38 >> 2;
        if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
          v39 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v39 = v37;
        if (v39)
        {
          v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&__p[2], v39);
          v35 = (char *)__p[0];
          v33 = (char *)__p[1];
        }
        else
        {
          v40 = 0;
        }
        v41 = (uint64_t *)&v40[8 * v36];
        *v41 = v29;
        v34 = v41 + 1;
        while (v33 != v35)
        {
          v42 = *((_QWORD *)v33 - 1);
          v33 -= 8;
          *--v41 = v42;
        }
        __p[0] = v41;
        __p[1] = v34;
        __p[2] = &v40[8 * v39];
        if (v35)
          operator delete(v35);
      }
      else
      {
        *(_QWORD *)__p[1] = v29;
        v34 = v33 + 8;
      }
      __p[1] = v34;
    }
  }
  v71 = 0;
  v72 = 0;
  v73 = 0;
  std::vector<unsigned long>::reserve(&v71, 5uLL);
  for (i = 0; i != 5; ++i)
  {
    if (*(void **)((char *)&a5->var0 + *((_QWORD *)v88 + i)) != (void *)1)
    {
      v44 = v72;
      if (v72 >= v73)
      {
        v46 = (char *)v71;
        v47 = (v72 - (_BYTE *)v71) >> 3;
        v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 61)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        v49 = v73 - (_BYTE *)v71;
        if ((v73 - (_BYTE *)v71) >> 2 > v48)
          v48 = v49 >> 2;
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
          v50 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v50 = v48;
        if (v50)
        {
          v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v73, v50);
          v46 = (char *)v71;
          v44 = v72;
        }
        else
        {
          v51 = 0;
        }
        v52 = &v51[8 * v47];
        *(_QWORD *)v52 = i;
        v45 = v52 + 8;
        while (v44 != v46)
        {
          v53 = *((_QWORD *)v44 - 1);
          v44 -= 8;
          *((_QWORD *)v52 - 1) = v53;
          v52 -= 8;
        }
        v71 = v52;
        v72 = v45;
        v73 = &v51[8 * v50];
        if (v46)
          operator delete(v46);
      }
      else
      {
        *(_QWORD *)v72 = i;
        v45 = v44 + 8;
      }
      v72 = v45;
    }
  }
  v54 = __p[0];
  v25 = (char *)__p[1] - (char *)__p[0] == v72 - (_BYTE *)v71;
  if ((char *)__p[1] - (char *)__p[0] == v72 - (_BYTE *)v71)
  {
    if (__p[1] != __p[0])
    {
      v55 = 0;
      do
      {
        v56 = *((_QWORD *)v71 + v55);
        v57 = v54[v55];
        objc_msgSend(v9, "strides");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(void **)((char *)&a5->var0 + *((_QWORD *)v86 + v56)) = (void *)objc_msgSend(v59, "unsignedIntValue");

        ++v55;
        v54 = __p[0];
      }
      while (v55 < ((char *)__p[1] - (char *)__p[0]) >> 3);
    }
    v60 = 0;
    v61 = 1;
    do
    {
      v62 = *(_QWORD *)((char *)v86 + v60);
      v63 = *(uint64_t *)((char *)&a5->var0 + v62);
      if (!v63)
      {
        *(void **)((char *)&a5->var0 + v62) = (void *)v61;
        v63 = v61;
      }
      v61 = v63 * *(uint64_t *)((char *)&a5->var0 + *(_QWORD *)((char *)v88 + v60));
      v60 += 8;
    }
    while (v60 != 40);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v78 = ((char *)__p[1] - (char *)__p[0]) >> 3;
      v79 = 2048;
      v80 = (v72 - (_BYTE *)v71) >> 3;
      _os_log_error_impl(&dword_19C486000, v64, OS_LOG_TYPE_ERROR, "The output backing MLMultiArray's shape (shape.count = %zu) doesn't match to expected output shape (shape.count = %zu) even after squeezed. This is most likely a framework programming error.", buf, 0x16u);
    }

    if (a6)
    {
      v66 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The output backing MLMultiArray's shape (shape.count = %zu) doesn't match to expected output shape (shape.count = %zu) even after squeezed. This is most likely a framework programming error."), ((char *)__p[1] - (char *)__p[0]) >> 3, (v72 - (_BYTE *)v71) >> 3);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v67;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v68);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  if (v71)
  {
    v72 = (char *)v71;
    operator delete(v71);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_18:

  return v25;
}

- (BOOL)_espressoOutputShapeForFeatureName:(id)a3 matchesShapeOfMLMultiArray:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *__p;
  char *v43;
  char *v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE __s1[80];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v45 = 0;
  v36 = objc_retainAutorelease(v5);
  objc_msgSend(v36, "UTF8String");
  if (espresso_network_query_blob_shape())
    v7 = 1;
  else
    v7 = v45 == 0;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v37 = v6;
    v9 = 0;
    v10 = &__s1[8 * v45];
    v11 = 8 * v45;
    while (*(_QWORD *)&__s1[v9] != 1)
    {
      v9 += 8;
      if (v11 == v9)
      {
        v12 = &__s1[8 * v45];
        goto LABEL_11;
      }
    }
    v12 = &__s1[v9];
LABEL_11:
    v13 = (v12 - __s1) >> 3;
    if (v13 != v45)
    {
      v14 = &__s1[8 * v13 + 8];
      if (v14 == (_QWORD *)v10)
      {
        v10 = &__s1[8 * v13];
      }
      else
      {
        v15 = v11 - 8 * v13 - 8;
        v10 = &__s1[8 * v13];
        do
        {
          if (*v14 != 1)
          {
            *(_QWORD *)v10 = *v14;
            v10 += 8;
          }
          ++v14;
          v15 -= 8;
        }
        while (v15);
      }
    }
    __p = 0;
    v43 = 0;
    v44 = 0;
    objc_msgSend(v6, "shape");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned long>::reserve(&__p, objc_msgSend(v16, "count"));

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v6, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (objc_msgSend(v21, "unsignedIntValue") != 1)
          {
            v22 = objc_msgSend(v21, "unsignedIntValue");
            v23 = v22;
            v24 = v43;
            if (v43 >= v44)
            {
              v26 = (char *)__p;
              v27 = (v43 - (_BYTE *)__p) >> 3;
              v28 = v27 + 1;
              if ((unint64_t)(v27 + 1) >> 61)
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              v29 = v44 - (_BYTE *)__p;
              if ((v44 - (_BYTE *)__p) >> 2 > v28)
                v28 = v29 >> 2;
              if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
                v30 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v30 = v28;
              if (v30)
              {
                v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v44, v30);
                v26 = (char *)__p;
                v24 = v43;
              }
              else
              {
                v31 = 0;
              }
              v32 = &v31[8 * v27];
              *(_QWORD *)v32 = v23;
              v25 = v32 + 8;
              while (v24 != v26)
              {
                v33 = *((_QWORD *)v24 - 1);
                v24 -= 8;
                *((_QWORD *)v32 - 1) = v33;
                v32 -= 8;
              }
              __p = v32;
              v43 = v25;
              v44 = &v31[8 * v30];
              if (v26)
                operator delete(v26);
            }
            else
            {
              *(_QWORD *)v43 = v22;
              v25 = v24 + 8;
            }
            v43 = v25;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v18);
    }

    v34 = (char *)__p;
    v8 = v10 - __s1 == v43 - (_BYTE *)__p && memcmp(__s1, __p, v10 - __s1) == 0;
    v6 = v37;
    if (v34)
    {
      v43 = v34;
      operator delete(v34);
    }
  }

  return v8;
}

- (BOOL)tryToSetOutputBacking:(id)a3 forFeatureName:(id)a4 toEbuf:(id *)a5 reportPointerFlags:(int *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v12;
      -[MLNeuralNetworkEngine activeFunction](self, "activeFunction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
      {
        -[MLModelEngine modelDescription](self, "modelDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "outputDescriptionsByName");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v19, "objectForKeyedSubscript:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v19) = objc_msgSend(v20, "isAllowedValue:", v21);

        if ((v19 & 1) == 0)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v20, "name");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v36 = v32;
            _os_log_error_impl(&dword_19C486000, v25, OS_LOG_TYPE_ERROR, "Output backing for feature named '%@' is not compatible with the model's output feature description.", buf, 0xCu);

          }
          if (a7)
          {
            v26 = (void *)MEMORY[0x1E0CB35C8];
            v33 = *MEMORY[0x1E0CB2D50];
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v20, "name");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("Output backing for feature named '%@' is not compatible with the model's output feature description."), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v29;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v30);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_17;
        }

      }
      if (!-[MLNeuralNetworkEngine _espressoOutputShapeForFeatureName:matchesShapeOfMLMultiArray:](self, "_espressoOutputShapeForFeatureName:matchesShapeOfMLMultiArray:", v13, v14)|| objc_msgSend(v14, "dataType") != 65568|| (v22 = objc_retainAutorelease(v14), v23 = objc_msgSend(v22, "mutableBytes"), v23 % *MEMORY[0x1E0C85AD8]))
      {
        *a6 = 0x10000;
        v24 = 1;
LABEL_18:

        goto LABEL_19;
      }
      if (-[MLNeuralNetworkEngine _setMultiArrayOutputBacking:forOutputFeatureName:toEbuf:error:](self, "_setMultiArrayOutputBacking:forOutputFeatureName:toEbuf:error:", v22, v13, a5, a7))
      {
        *a6 = 0x20000;

        goto LABEL_11;
      }
LABEL_17:
      v24 = 0;
      goto LABEL_18;
    }
  }
  *a6 = 0x10000;
LABEL_11:
  v24 = 1;
LABEL_19:

  return v24;
}

- (id)pixelBufferBackedMultiArrayWithShape:(id)a3
{
  id v4;
  id v5;
  void *v6;
  __CVBuffer *v7;
  MLMultiArray *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__MLNeuralNetworkEngine_pixelBufferBackedMultiArrayWithShape___block_invoke;
  v10[3] = &unk_1E3D65260;
  v5 = v4;
  v11 = v5;
  v12 = &v18;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  -[MLNeuralNetworkEngine pixelBufferPool](self, "pixelBufferPool");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CVBuffer *)objc_msgSend(v6, "createPixelBufferWithSize:pixelFormatType:error:", 1278226536, 0, (double)(unint64_t)v19[3], (double)(unint64_t)v15[3]);

  if (v7)
  {
    v8 = -[MLMultiArray initWithPixelBuffer:shape:]([MLMultiArray alloc], "initWithPixelBuffer:shape:", v7, v5);
    CVPixelBufferRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)outputBackingMultiArrayForFeatureName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int blob_shape;
  NSObject *v16;
  void *v17;
  int v19;
  NSObject *v20;
  uint64_t v21;
  MLMultiArray *v22;
  id v23[2];
  uint8_t v24[4];
  uint64_t v25;
  __int16 v26;
  int v27;
  uint8_t buf[32];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLNeuralNetworkEngine activeFunction](self, "activeFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[MLModelEngine modelDescription](self, "modelDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "outputDescriptionsByName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "multiArrayConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_9:
      v17 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v10, "multiArrayConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "dataType");

  }
  else
  {
    v10 = 0;
    v13 = 65568;
  }
  v23[1] = 0;
  v14 = objc_retainAutorelease(v4);
  objc_msgSend(v14, "UTF8String");
  blob_shape = espresso_network_query_blob_shape();
  if (blob_shape)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = blob_shape;
      _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "Failed to get the output shape for feature: %s to fabricate the output backing buffer (err: %d). This is not expected but we go on without output backing.", buf, 0x12u);
    }

    goto LABEL_9;
  }
  if (!is_mul_ok(1uLL, (unsigned __int16)v13 >> 3)
    || (v17 = 0, (unsigned __int16)((unsigned __int16)v13 >> 3) >= 0x80uLL))
  {
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    memset(buf, 0, sizeof(buf));
    v19 = espresso_buffer_pack_tensor_shape();
    if (v19)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v24 = 136315394;
        v25 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
        v26 = 1024;
        v27 = v19;
        _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "Failed to pack tensor shape for feature: %s to fabricate the output backing buffer (err: %d). This is not expected but we go on without output backing.", v24, 0x12u);
      }
      v17 = 0;
    }
    else
    {
      v23[0] = 0;
      -[MLNeuralNetworkEngine populateMultiArrayShape:strides:forEbuf:featureDescription:ndArrayInterpretation:](self, "populateMultiArrayShape:strides:forEbuf:featureDescription:ndArrayInterpretation:", v23, 0, buf, v10, BYTE1(self->_transferSession));
      v20 = v23[0];
      if (v13 == 65552)
      {
        -[MLNeuralNetworkEngine pixelBufferBackedMultiArrayWithShape:](self, "pixelBufferBackedMultiArrayWithShape:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = [MLMultiArray alloc];
        v21 = -[MLMultiArray initWithShape:dataType:storageOrder:bufferAlignment:](v22, "initWithShape:dataType:storageOrder:bufferAlignment:", v20, v13, 0, *MEMORY[0x1E0C85AD8]);
      }
      v17 = (void *)v21;
    }

  }
LABEL_10:

  return v17;
}

- (BOOL)copyEbuf:(id *)a3 ofPixelType:(unint64_t)a4 toPixelBuffer:(__CVBuffer *)a5 error:(id *)a6
{
  MLMultiArray *v8;
  void *var0;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MLMultiArray *v16;
  BOOL v17;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v8 = [MLMultiArray alloc];
  var0 = a3->var0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var6);
  v24[0] = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v24[0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v8, "initWithDataPointer:shape:dataType:strides:deallocator:error:", var0, v11, 65568, v15, 0, a6);

  if (v16)
    v17 = -[MLMultiArray renderToCVPixelBuffer:channelOrderIsBGR:error:](v16, "renderToCVPixelBuffer:channelOrderIsBGR:error:", a5, a4 == 30, a6);
  else
    v17 = 0;

  return v17;
}

- (id)imageFeatureValueFromEbuf:(id *)a3 backingCVPixelBuffer:(__CVBuffer *)a4 description:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  kdebug_trace();
  objc_msgSend(v10, "imageConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v34;
      _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Image output feature named '%@' is missing width, height, and pixel info in its description.", buf, 0xCu);

    }
    if (a6)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Image output feature named '%@' is missing width, height, and pixel info in its description."), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_15:
    v22 = 0;
    goto LABEL_16;
  }
  if (a3->var7 <= 1 && a3->var8 < 2)
  {
    objc_msgSend(v10, "imageConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sizeConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allowedImageSizeClosestToPixelsWide:pixelsHigh:preferDownScaling:preferInputAspectRatio:", a3->var4, a3->var5, 1, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v15, "pixelsWide");
    v27 = objc_msgSend(v15, "pixelsHigh");
    objc_msgSend(v10, "imageConstraint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "pixelType");

    v30 = v29 == 40 || v29 == 10;
    v31 = 3;
    if (v30)
      v31 = 1;
    if (a3->var4 != v26 || a3->var5 != v27 || a3->var6 != v31)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C486000, v32, OS_LOG_TYPE_INFO, "WARNING: The computed output shape does not match any output shape allowed in the model's description. Please update the model description.", buf, 2u);
      }

    }
    if (a4)
    {
      if (!-[MLNeuralNetworkEngine copyEbuf:ofPixelType:toPixelBuffer:error:](self, "copyEbuf:ofPixelType:toPixelBuffer:error:", a3, v29, a4, a6))goto LABEL_13;
      CFRetain(a4);
    }
    else
    {
      a4 = -[MLNeuralNetworkEngine _pixelBufferFromEbuf:description:error:](self, "_pixelBufferFromEbuf:description:error:", a3, v10, a6);
      if (!a4)
        goto LABEL_13;
    }
    +[MLFeatureValue featureValueWithPixelBuffer:](MLFeatureValue, "featureValueWithPixelBuffer:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(a4);
    goto LABEL_14;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v10, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v33;
    _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Batch or sequence image output is unsupported for image output feature named '%@'.", buf, 0xCu);

  }
  if (!a6)
    goto LABEL_15;
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v35 = *MEMORY[0x1E0CB2D50];
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Batch or sequence image output is unsupported for image output feature named '%@'."), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  *a6 = v18;

LABEL_13:
  v22 = 0;
LABEL_14:

LABEL_16:
  kdebug_trace();

  return v22;
}

- (__CVBuffer)_pixelBufferFromEbuf:(id *)a3 description:(id)a4 error:(id *)a5
{
  MLMultiArray *v7;
  void *var0;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  MLMultiArray *v17;
  void *v18;
  uint64_t v19;
  __CVBuffer *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  v34 = a4;
  kdebug_trace();
  v7 = [MLMultiArray alloc];
  var0 = a3->var0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var6);
  v46[0] = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v46[0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3->var9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = var0;
  v16 = a5;
  v17 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v7, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v15, v10, 65568, v14, 0, a5);

  if (v17)
  {
    objc_msgSend(v34, "imageConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "pixelType");

    if (v19 <= 19)
    {
      if (!v19)
      {
        v22 = 0;
        v20 = +[MLMultiArray pixelBufferBGRA8FromMultiArrayCHW:channelOrderIsBGR:error:](MLMultiArray, "pixelBufferBGRA8FromMultiArrayCHW:channelOrderIsBGR:error:", v17, 0, a5);
        goto LABEL_23;
      }
      if (v19 != 10)
        goto LABEL_20;
      v38 = 0;
      v20 = +[MLMultiArray pixelBufferGray8FromMultiArrayHW:error:](MLMultiArray, "pixelBufferGray8FromMultiArrayHW:error:", v17, &v38);
      v21 = v38;
    }
    else
    {
      switch(v19)
      {
        case 20:
          v36 = 0;
          v20 = +[MLMultiArray pixelBufferBGRA8FromMultiArrayCHW:channelOrderIsBGR:error:](MLMultiArray, "pixelBufferBGRA8FromMultiArrayCHW:channelOrderIsBGR:error:", v17, 0, &v36);
          v21 = v36;
          break;
        case 30:
          v37 = 0;
          v20 = +[MLMultiArray pixelBufferBGRA8FromMultiArrayCHW:channelOrderIsBGR:error:](MLMultiArray, "pixelBufferBGRA8FromMultiArrayCHW:channelOrderIsBGR:error:", v17, 1, &v37);
          v21 = v37;
          break;
        case 40:
          v35 = 0;
          v20 = +[MLMultiArray pixelBufferGray16HalfFromMultiArrayHW:error:](MLMultiArray, "pixelBufferGray16HalfFromMultiArrayHW:error:", v17, &v35);
          v21 = v35;
          break;
        default:
LABEL_20:
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v40 = v19;
            _os_log_error_impl(&dword_19C486000, v25, OS_LOG_TYPE_ERROR, "MLImagePixelType %tu is not supported.", buf, 0xCu);
          }

          v26 = (void *)MEMORY[0x1E0CB35C8];
          v43 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MLImagePixelType %tu is not supported."), v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v28);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          v20 = 0;
          if (!v22)
            goto LABEL_23;
          goto LABEL_14;
      }
    }
    v22 = v21;
    if (v22)
    {
LABEL_14:
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v34, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = (uint64_t)v30;
        v41 = 2112;
        v42 = v31;
        _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "Failed to convert the output feature named '%@' to a pixel buffer. (Underlying error: %@)", buf, 0x16u);

      }
      if (v16)
      {
        objc_msgSend(v34, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 1, v22, CFSTR("Failed to convert the output feature named '%@' to a pixel buffer."), v24);
        *v16 = (id)objc_claimAutoreleasedReturnValue();

      }
      v20 = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  v20 = 0;
LABEL_24:

  kdebug_trace();
  return v20;
}

- (void)_deallocContextAndPlan
{
  if (self->_numInputs)
  {
    espresso_plan_destroy();
    self->_numInputs = 0;
  }
  if (self->_numOutputs)
  {
    espresso_context_destroy();
    self->_numOutputs = 0;
  }
}

- (void)dealloc
{
  _BYTE *end;
  _BYTE *begin;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  _BYTE *v14;
  _BYTE *v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  OpaqueVTPixelTransferSession *left;
  objc_super v25;

  -[MLNeuralNetworkEngine _deallocContextAndPlan](self, "_deallocContextAndPlan");
  begin = self->_inputBuffers.__begin_;
  end = self->_inputBuffers.__end_;
  if (end != begin)
  {
    v5 = 0;
    do
    {
      v6 = &begin[24 * v5];
      v9 = (_QWORD *)*v6;
      v7 = v6 + 1;
      v8 = v9;
      if (v9 != v7)
      {
        do
        {
          v10 = (void *)v8[7];
          if (v10)
            free(v10);
          v11 = (_QWORD *)v8[1];
          if (v11)
          {
            do
            {
              v12 = v11;
              v11 = (_QWORD *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              v12 = (_QWORD *)v8[2];
              v13 = *v12 == (_QWORD)v8;
              v8 = v12;
            }
            while (!v13);
          }
          v8 = v12;
        }
        while (v12 != v7);
        begin = self->_inputBuffers.__begin_;
        end = self->_inputBuffers.__end_;
      }
      ++v5;
    }
    while (v5 < 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3));
  }
  v15 = self->_outputBuffers.__begin_;
  v14 = self->_outputBuffers.__end_;
  if (v14 != v15)
  {
    v16 = 0;
    do
    {
      v17 = &v15[24 * v16];
      v20 = (_QWORD *)*v17;
      v18 = v17 + 1;
      v19 = v20;
      if (v20 != v18)
      {
        do
        {
          v21 = (void *)v19[7];
          if (v21)
            free(v21);
          v22 = (_QWORD *)v19[1];
          if (v22)
          {
            do
            {
              v23 = v22;
              v22 = (_QWORD *)*v22;
            }
            while (v22);
          }
          else
          {
            do
            {
              v23 = (_QWORD *)v19[2];
              v13 = *v23 == (_QWORD)v19;
              v19 = v23;
            }
            while (!v13);
          }
          v19 = v23;
        }
        while (v23 != v18);
        v15 = self->_outputBuffers.__begin_;
        v14 = self->_outputBuffers.__end_;
      }
      ++v16;
    }
    while (v16 < 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3));
  }
  left = (OpaqueVTPixelTransferSession *)self->_OutputBlobIsDynamic.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    VTPixelTransferSessionInvalidate(left);
    CFRelease(self->_OutputBlobIsDynamic.__tree_.__pair1_.__value_.__left_);
  }
  v25.receiver = self;
  v25.super_class = (Class)MLNeuralNetworkEngine;
  -[MLNeuralNetworkEngine dealloc](&v25, sel_dealloc);
}

- (id)sortBatchByShape:(id)a3 withMap:(id *)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v65;
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  kdebug_trace();
  v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v68, "count"))
  {
    objc_msgSend(v68, "featuresAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "featureNames");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    -[MLModelEngine modelDescription](self, "modelDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDescriptionsByName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v83;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v83 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v12);
        -[MLModelEngine modelDescription](self, "modelDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "inputDescriptionsByName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isOptional") & 1) != 0)
        {

        }
        else
        {
          v17 = objc_msgSend(v65, "containsObject:", v13);

          if ((v17 & 1) != 0)
          {
            v69 = v13;

            if (!v69)
              goto LABEL_24;
            for (i = 0; i < objc_msgSend(v68, "count"); ++i)
            {
              objc_msgSend(v68, "featuresAtIndex:", i);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "featureValueForName:", v69);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "getFeatureSize:ndArrayMode:", a5, -[MLNeuralNetworkEngine ndArrayInterpretation](self, "ndArrayInterpretation"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (!v23 || a5 && *a5)
              {

                v19 = 0;
                goto LABEL_53;
              }
              objc_msgSend(v67, "objectForKey:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25 == 0;

              if (v26)
              {
                v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "addObject:", v29);

                objc_msgSend(v67, "setObject:forKey:", v27, v24);
              }
              else
              {
                objc_msgSend(v67, "objectForKey:", v24);
                v27 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "addObject:", v28);

              }
            }
            v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            objc_msgSend(v67, "allKeys");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
            if (v57)
            {
              v58 = *(_QWORD *)v71;
              do
              {
                for (j = 0; j != v57; ++j)
                {
                  if (*(_QWORD *)v71 != v58)
                    objc_enumerationMutation(v56);
                  v60 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
                  objc_msgSend(v67, "objectForKey:", v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MLBatchProviderUtils lazyBatchIndexIntoBatch:indices:error:](MLBatchProviderUtils, "lazyBatchIndexIntoBatch:indices:error:", v68, v61, a5);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v19, "setObject:forKey:", v62, v60);
                }
                v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
              }
              while (v57);
            }

            v54 = objc_retainAutorelease(v67);
            v55 = a4;
LABEL_52:
            *v55 = v54;
LABEL_53:

            goto LABEL_54;
          }
        }
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

LABEL_24:
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("None of the features required to evaulate this model are produced by the feature provider which is first among the batch of input feature providers.\n"));
      v69 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "appendString:", CFSTR("The model requires these input features:\n"));
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      -[MLModelEngine modelDescription](self, "modelDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "inputDescriptionsByName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v79;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v79 != v34)
              objc_enumerationMutation(v32);
            v36 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k);
            -[MLModelEngine modelDescription](self, "modelDescription");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "inputDescriptionsByName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", v36);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "isOptional");

            if ((v40 & 1) == 0)
            {
              -[MLModelEngine modelDescription](self, "modelDescription");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "inputDescriptionsByName");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectForKeyedSubscript:", v36);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v43, "description");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "appendFormat:", CFSTR("    %@\n"), v44);

            }
          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
        }
        while (v33);
      }

      objc_msgSend(v69, "appendString:", CFSTR("The first batch input feature provider provides these input features:\n"));
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v45 = v65;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v75;
        do
        {
          for (m = 0; m != v46; ++m)
          {
            if (*(_QWORD *)v75 != v47)
              objc_enumerationMutation(v45);
            v49 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m);
            -[MLModelEngine modelDescription](self, "modelDescription");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "inputDescriptionsByName");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v49);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v52, "description");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "appendFormat:", CFSTR("    %@\n"), v53);

          }
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
        }
        while (v46);
      }

      objc_msgSend(v69, "appendString:", CFSTR("Ensure that each of the batch input feature providers provides all the input features with types matching those required to evaluate the model."));
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@"), v69);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v55 = a5;
      goto LABEL_52;
    }
    v19 = 0;
LABEL_54:

    v18 = v67;
  }
  else
  {
    v18 = v67;
    *a4 = objc_retainAutorelease(v67);
    v19 = (id)MEMORY[0x1E0C9AA70];
  }

  kdebug_trace();
  return v19;
}

- (BOOL)resetSizesWithEspressoConfigurations:(id)a3 error:(id *)a4
{
  id v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v7;
  void *v8;
  void *v9;
  char v10;
  const void **p_left;
  uint64_t left_high;
  void *left;
  unint64_t size;
  int v15;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_currentConfigurationName;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *v28;
  std::string v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _BYTE __p[12];
  __int16 v35;
  int v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CoreML::MLNeuralNetworkUtilities::hashFeatureProviderToConfigurationName(&v29, v6, BYTE1(self->_transferSession), self->_pixelBufferPool);
  v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&self->_flexibleShapesConfigNamesInNet, &v29);
  +[MLNeuralNetworkCompiler iOS18CompilerVersionInfo](MLNeuralNetworkCompiler, "iOS18CompilerVersionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (&self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_ == v7)
  {
    -[MLNeuralNetworkEngine compilerVersionInfo](self, "compilerVersionInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "olderThan:", v8);

    if ((v10 & 1) == 0)
    {
      CoreML::MLNeuralNetworkUtilities::encodeConfigurationName(__p, (const void **)&v29.__r_.__value_.__l.__data_);
      v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&self->_flexibleShapesConfigNamesInNet, __p);
      if (v37 < 0)
        operator delete(*(void **)__p);
    }
  }
  if (v7 == &self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_)
    goto LABEL_34;
  p_left = (const void **)&v7[4].__value_.__left_;
  left_high = HIBYTE(v7[6].__value_.__left_);
  if ((left_high & 0x80u) == 0)
    left = (void *)HIBYTE(v7[6].__value_.__left_);
  else
    left = v7[5].__value_.__left_;
  size = *((unsigned __int8 *)&self->_currentConfigurationName.__r_.__value_.var0.__l + 23);
  v15 = (char)size;
  if ((size & 0x80u) != 0)
    size = self->_currentConfigurationName.__r_.__value_.var0.__l.__size_;
  if (left == (void *)size)
  {
    if (v15 >= 0)
      p_currentConfigurationName = &self->_currentConfigurationName;
    else
      p_currentConfigurationName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_currentConfigurationName.__r_.__value_.var0.__l.__data_;
    if ((left_high & 0x80) != 0)
    {
      if (memcmp(*p_left, p_currentConfigurationName, (size_t)v7[5].__value_.__left_))
        goto LABEL_22;
    }
    else if (HIBYTE(v7[6].__value_.__left_))
    {
      v17 = v7 + 4;
      while (LOBYTE(v17->__value_.__left_) == p_currentConfigurationName->__r_.__value_.var0.__s.__data_[0])
      {
        v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)((char *)v17 + 1);
        p_currentConfigurationName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)p_currentConfigurationName + 1);
        if (!--left_high)
          goto LABEL_37;
      }
      goto LABEL_22;
    }
LABEL_37:
    LOBYTE(a4) = 1;
    goto LABEL_38;
  }
LABEL_22:
  -[MLNeuralNetworkEngine plan](self, "plan");
  v18 = espresso_plan_build_clean();
  if ((_DWORD)v18)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 67109120;
      *(_DWORD *)&__p[4] = v18;
      _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Failed to reset the current plan in order to reshape the input features (Error: %d).", __p, 8u);
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to reset the current plan in order to reshape the input features (Error: %d)."), v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
      *a4 = v23;

LABEL_34:
      LOBYTE(a4) = 0;
      goto LABEL_38;
    }
    goto LABEL_38;
  }
  v24 = espresso_network_select_configuration();
  if (!(_DWORD)v24)
  {
    if (!-[MLNeuralNetworkEngine rebuildPlan:](self, "rebuildPlan:", a4))
      goto LABEL_34;
    std::string::operator=((std::string *)&self->_currentConfigurationName, (const std::string *)&v7[4]);
    goto LABEL_37;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v28 = v7 + 4;
    if (SHIBYTE(v7[6].__value_.__left_) < 0)
      v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)*p_left;
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = v28;
    v35 = 1024;
    v36 = v24;
    _os_log_error_impl(&dword_19C486000, v25, OS_LOG_TYPE_ERROR, "Unable to select network configuration for: %s (Error: %d).", __p, 0x12u);
  }

  if (a4)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    if (SHIBYTE(v7[6].__value_.__left_) < 0)
      p_left = (const void **)*p_left;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to select network configuration for: %s (Error: %d)."), p_left, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
LABEL_38:

  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);

  return (char)a4;
}

- (BOOL)setEspressoBlobShapes:(void *)a3 widths:(void *)a4 heights:(void *)a5 ks:(void *)a6 batches:(void *)a7 sequences:(void *)a8 ranks:(void *)a9 error:(id *)a10
{
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_WORD *)((char *)&self->_transferSession + 1))
  {
    -[MLNeuralNetworkEngine network](self, "network", a3, a4, a5, a6, a7);
    v18 = *(_QWORD *)a8;
    v17 = espresso_network_change_input_blob_shapes_seq_rank();
  }
  else
  {
    -[MLNeuralNetworkEngine network](self, "network", a3, a4, a5, a6, a7);
    v18 = *(_QWORD *)a8;
    v17 = espresso_network_change_input_blob_shapes_seq();
  }
  v11 = v17;
  if (!(_DWORD)v17)
    return 1;
  +[MLLogging coreChannel](MLLogging, "coreChannel", v18);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v22 = v11;
    _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Error in dynamically resizing for sequence length (error: %d).", buf, 8u);
  }

  if (a10)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in dynamically resizing for sequence length (error: %d)."), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v15);
    *a10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)evaluateBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *bufferSemaphore;
  id v15;
  id v16;
  id v17;
  void *v18;
  MLArrayBatchProvider *v19;
  MLArrayBatchProvider *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  MLNeuralNetworkEngine *v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  id *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v8 = a3;
  v9 = a4;
  kdebug_trace();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2979;
  v42 = __Block_byref_object_dispose__2980;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v10 = objc_msgSend(v8, "count");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  if (v10)
  {
    v12 = v10;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      --v12;
    }
    while (v12);
  }
  bufferSemaphore = self->_bufferSemaphore;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_2;
  v25 = &unk_1E3D652D8;
  v26 = self;
  v15 = v9;
  v27 = v15;
  v32 = a5;
  v16 = v8;
  v28 = v16;
  v30 = &v34;
  v33 = v10;
  v31 = &v38;
  v17 = v11;
  v29 = v17;
  dispatch_sync(bufferSemaphore, &v22);
  if (a5)
  {
    v18 = (void *)v39[5];
    if (v18)
      *a5 = objc_retainAutorelease(v18);
  }
  if (*((_BYTE *)v35 + 24))
  {
    v19 = 0;
  }
  else
  {
    v20 = [MLArrayBatchProvider alloc];
    v19 = -[MLArrayBatchProvider initWithFeatureProviderArray:](v20, "initWithFeatureProviderArray:", v17, v22, v23, v24, v25, v26, v27, v28);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  kdebug_trace();
  return v19;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *bufferSemaphore;
  NSObject *v11;
  void *v12;
  void *v13;
  MLArrayBatchProvider *v14;
  NSObject *v15;
  unint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t k;
  void *v30;
  void *v31;
  id obj;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[8];
  _QWORD block[7];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "copy");

    v9 = (void *)v8;
  }
  else
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setOutputBackings:", MEMORY[0x1E0C9AA70]);
  v37 = v9;
  bufferSemaphore = self->_bufferSemaphore;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MLNeuralNetworkEngine_predictionsFromBatch_options_error___block_invoke;
  block[3] = &unk_1E3D66D28;
  block[4] = self;
  block[5] = &v46;
  block[6] = &v50;
  dispatch_sync(bufferSemaphore, block);
  if (*((_DWORD *)v47 + 6))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Failed to check the availability of plan submit.", buf, 2u);
    }

    if (!a5)
    {
      v14 = 0;
      goto LABEL_17;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to check the availability of plan submit."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (*((_DWORD *)v51 + 6) && !BYTE3(self->_transferSession) && !objc_msgSend(v9, "predictionUsesCPU"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v33, "count"));
    for (i = 0; i < objc_msgSend(v33, "count"); ++i)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:atIndexedSubscript:", v18, i);

    }
    v43 = 0;
    -[MLNeuralNetworkEngine sortBatchByShape:withMap:error:](self, "sortBatchByShape:withMap:error:", v33, &v43, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v43;
    v14 = 0;
    v34 = v19;
    v35 = v20;
    if (v19 && v20)
    {
      if (a5 && *a5)
      {
        v14 = 0;
      }
      else
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v19, "allKeys");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v21;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v40 != v23)
                objc_enumerationMutation(obj);
              v25 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
              objc_msgSend(v34, "objectForKey:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKey:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLNeuralNetworkEngine evaluateBatch:options:error:](self, "evaluateBatch:options:error:", v26, v37, a5);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              for (k = 0; k < objc_msgSend(v28, "count"); ++k)
              {
                objc_msgSend(v28, "featuresAtIndex:", k);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectAtIndexedSubscript:", k);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setObject:atIndexedSubscript:", v30, objc_msgSend(v31, "unsignedIntegerValue"));

              }
            }
            v21 = obj;
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
          }
          while (v22);
        }

        v14 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v13);
      }
    }

LABEL_9:
    goto LABEL_17;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C486000, v15, OS_LOG_TYPE_INFO, "This model is not suitable for faster batch prediction, so it is falling back on a for-loop-based approach.", buf, 2u);
  }

  +[MLModel predictionsFromLoopingOverBatch:model:options:error:](MLModel, "predictionsFromLoopingOverBatch:model:options:error:", v33, self, v9, a5);
  v14 = (MLArrayBatchProvider *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  return v14;
}

- (void)dumpTestVectorsToPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[MLModelEngine configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableTestVectorMode");

  if ((v6 & 1) != 0)
  {
    -[MLNeuralNetworkEngine network](self, "network");
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    espresso_network_dump_test_vector();
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_19C486000, v7, OS_LOG_TYPE_DEBUG, "Called dumpTestVectors but configuration didn't specify enableTestVectorMode.", v8, 2u);
    }

  }
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "This neural network model does not have a parameter for requested key '%@'. Note: only updatable neural network models can provide parameter values and these values are only accessible in the context of an MLUpdateTask completion or progress handler.", buf, 0xCu);
  }

  if (a4)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This neural network model does not have a parameter for requested key '%@'. Note: only updatable neural network models can provide parameter values and these values are only accessible in the context of an MLUpdateTask completion or progress handler."), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 7, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (unint64_t)supportFromEspressoLayerInfo:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "per_platform_support", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v5)
  {

LABEL_21:
    objc_msgSend(v3, "main_engine_support");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v27, "isEqualToString:", CFSTR("context_transfer"));

    v6 = v6;
    goto LABEL_22;
  }
  v6 = 0;
  v7 = *(_QWORD *)v30;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v30 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
      objc_msgSend(v3, "per_platform_support");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "supported");

      if ((v12 & 1) != 0)
      {
        objc_msgSend(&unk_1E3DA1F30, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v9, "isEqualToString:", v13);

        if (v14)
          goto LABEL_10;
        objc_msgSend(&unk_1E3DA1F48, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v9, "isEqualToString:", v15);

        if (v16
          || (objc_msgSend(&unk_1E3DA1F60, "stringValue"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v9, "isEqualToString:", v17),
              v17,
              v18))
        {
LABEL_10:
          v6 |= 2uLL;
        }
        else
        {
          objc_msgSend(&unk_1E3DA1F78, "stringValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v9, "isEqualToString:", v19);

          if (v20
            || (objc_msgSend(&unk_1E3DA1F90, "stringValue"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v22 = objc_msgSend(v9, "isEqualToString:", v21),
                v21,
                v22))
          {
            v6 |= 4uLL;
          }
          else
          {
            objc_msgSend(&unk_1E3DA1FA8, "stringValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v9, "isEqualToString:", v23);

            v6 |= v24;
          }
        }
      }
      ++v8;
    }
    while (v5 != v8);
    v25 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v5 = v25;
  }
  while (v25);

  if (!v6)
    goto LABEL_21;
LABEL_22:

  return v6;
}

- (unint64_t)supportFromEspressoPlatform:(int)a3
{
  unint64_t result;

  result = 2;
  if (a3 > 49999)
  {
    if ((a3 - 50000) <= 8 && ((1 << (a3 - 80)) & 0x125) != 0 || a3 == 90000)
      return result;
    return a3 == 100000;
  }
  if (a3 <= 10006)
  {
    if (a3 && a3 != 100)
    {
      if (a3 != 10006)
        return 0;
      return 4;
    }
    return 1;
  }
  if (a3 == 10007 || a3 == 10008)
    return 4;
  if (a3 != 20000)
    return 0;
  return result;
}

- (id)executionSchedule
{
  NSObject *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *p_p;
  void *v16;
  void *v17;
  BOOL v18;
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
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  MLLayerExecutionSchedule *v35;
  void *v36;
  void *v37;
  MLLayerExecutionSchedule *v38;
  void *v39;
  void *v40;
  MLLayerPath *v41;
  void *v42;
  void *v43;
  MLLayerPath *v44;
  void *v45;
  void *v46;
  id v47;
  MLModelStructurePath *v48;
  NSObject *v49;
  void *v51;
  uint64_t v52;
  MLModelExecutionSchedule *v53;
  id v54;
  id v55;
  id obj;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *__p;
  char v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  MLLayerPath *v68;
  MLLayerExecutionSchedule *v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19C486000, v2, OS_LOG_TYPE_DEBUG, "Profiler: MLNeuralNetworkEngine::executionSchedule", buf, 2u);
  }

  v53 = objc_alloc_init(MLModelExecutionSchedule);
  -[MLModelEngine configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "profilingOptions") & 1) == 0;

  if (!v4)
  {
    v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MLModelEngine configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelDisplayName");
    v54 = (id)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[MLNeuralNetworkEngine espressoProfileInfo](self, "espressoProfileInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layers");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v7)
    {
      v60 = 0;
      v57 = *(_QWORD *)v65;
      do
      {
        v8 = 0;
        v59 = v7;
        do
        {
          if (*(_QWORD *)v65 != v57)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v8);
          objc_msgSend(v9, "selected_runtime_engine");
          Espresso::platform_to_string();
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = -[MLModelEngine signpostID](self, "signpostID");
          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            v12 = objc_msgSend(objc_retainAutorelease(v54), "UTF8String");
            objc_msgSend(v9, "name");
            v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v14 = objc_msgSend(v13, "UTF8String");
            p_p = &__p;
            if (v63 < 0)
              p_p = __p;
            *(_DWORD *)buf = 136315650;
            v71 = v12;
            v72 = 2080;
            v73 = v14;
            v74 = 2080;
            v75 = p_p;
            _os_signpost_emit_with_name_impl(&dword_19C486000, v10, OS_SIGNPOST_EVENT, v11, "Model Layer Info", "model-name:%slayer-name:%splatform:%s", buf, 0x20u);

          }
          objc_msgSend(v9, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "debug_name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length") == 0;

          if (v18)
          {
            v20 = 0;
          }
          else
          {
            objc_msgSend(v9, "debug_name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (-[MLNeuralNetworkEngine modelIsMIL](self, "modelIsMIL"))
            {
              objc_msgSend(v9, "debug_name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "debug_name");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "componentsSeparatedByString:", CFSTR(":"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v22, "count") == 3)
              {
                v23 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v9, "main_engine_support");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "type");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "stringWithFormat:", CFSTR("%@:%@:%@"), v25, v26, v27);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                v28 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "stringWithFormat:", CFSTR("%@:%@"), v29, v30);
                v31 = objc_claimAutoreleasedReturnValue();

                v20 = (void *)v31;
              }
              else
              {
                v16 = v19;
              }

            }
            else
            {
              v20 = 0;
              v16 = v19;
            }
          }
          v32 = -[MLNeuralNetworkEngine supportFromEspressoLayerInfo:](self, "supportFromEspressoLayerInfo:", v9);
          v33 = -[MLNeuralNetworkEngine supportFromEspressoPlatform:](self, "supportFromEspressoPlatform:", objc_msgSend(v9, "selected_runtime_engine"));
          if (v32)
          {
            v34 = v33;
            if (v33)
            {
              v35 = [MLLayerExecutionSchedule alloc];
              objc_msgSend(v9, "main_engine_support");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "type");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = -[MLLayerExecutionSchedule initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:](v35, "initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:", v34, v16, 0, v37, v32, v60, NAN, MEMORY[0x1E0C9AA70]);

              -[MLModelEngine modelPath](self, "modelPath");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "scopedModelNames");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              v41 = [MLLayerPath alloc];
              -[MLModelEngine modelPath](self, "modelPath");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "scopedModelNames");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = -[MLLayerPath initWithScopedModelAndLayerName:layerName:](v41, "initWithScopedModelAndLayerName:layerName:", v43, v16);

              objc_msgSend(v58, "setObject:forKeyedSubscript:", v38, v44);
              v68 = v44;
              v69 = v38;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "addEntriesFromDictionary:", v45);

              if (objc_msgSend(v20, "length"))
                v46 = v20;
              else
                v46 = v16;
              v47 = v46;
              v48 = -[MLModelStructurePath initWithNeuralNetworkLayerName:scopedModelNames:]([MLModelStructurePath alloc], "initWithNeuralNetworkLayerName:scopedModelNames:", v47, v40);
              objc_msgSend(v55, "setObject:forKeyedSubscript:", v38, v48);

              ++v60;
            }
          }

          if (v63 < 0)
            operator delete(__p);
          ++v8;
        }
        while (v59 != v8);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      }
      while (v7);
    }

    -[MLModelExecutionSchedule setModelExecutionSchedule:](v53, "setModelExecutionSchedule:", v58);
    -[MLModelExecutionSchedule setModelExecutionScheduleByModelStructurePath:](v53, "setModelExecutionScheduleByModelStructurePath:", v55);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      -[MLModelExecutionSchedule modelExecutionSchedule](v53, "modelExecutionSchedule");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");
      *(_DWORD *)buf = 134217984;
      v71 = v52;
      _os_log_debug_impl(&dword_19C486000, v49, OS_LOG_TYPE_DEBUG, "Profiler: MLNeuralNetworkEngine::executionSchedule %lu layers", buf, 0xCu);

    }
  }
  return v53;
}

- (void)enableInstrumentsTracing
{
  void *v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint8_t buf[4];
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  MLNeuralNetworkEngine *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MLNeuralNetworkEngine network](self, "network");
  Espresso::get_internal_network();
  -[MLModelEngine configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "modelDisplayName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E3D68DC8;
  }

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 134218754;
    v14 = -[MLModelEngine signpostID](self, "signpostID");
    v15 = 2082;
    v16 = -[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
    v17 = 2048;
    v18 = self;
    v19 = 2048;
    v20 = v11;
    _os_signpost_emit_with_name_impl(&dword_19C486000, v6, OS_SIGNPOST_EVENT, v8, "MLModel_Net_Discover", "Model-signpost-id:%lluModel-name:%{public}sModel-address:%lluEspresso-network-id:%llu", buf, 0x2Au);
  }

  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (void)setClassLabels:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (NSString)classScoreVectorName
{
  return *(NSString **)&self->_priority;
}

- (void)setClassScoreVectorName:(id)a3
{
  objc_storeStrong((id *)&self->_priority, a3);
}

- (NSArray)inputLayers
{
  return self->_classLabels;
}

- (NSArray)outputLayers
{
  return (NSArray *)self->_classScoreVectorName;
}

- (BOOL)hardwareFallbackDetected
{
  return (BOOL)self->_transferSession;
}

- (void)setHardwareFallbackDetected:(BOOL)a3
{
  LOBYTE(self->_transferSession) = a3;
}

- (NSDictionary)imagePreprocessingParameters
{
  return (NSDictionary *)self->_inputLayers;
}

- (void)setImagePreprocessingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_inputLayers, a3);
}

- (NSDictionary)espressoInputShapes
{
  return (NSDictionary *)self->_outputLayers;
}

- (void)setEspressoInputShapes:(id)a3
{
  objc_storeStrong((id *)&self->_outputLayers, a3);
}

- (NSDictionary)espressoInputStrides
{
  return self->_imagePreprocessingParameters;
}

- (void)setEspressoInputStrides:(id)a3
{
  objc_storeStrong((id *)&self->_imagePreprocessingParameters, a3);
}

- (BOOL)ndArrayInterpretation
{
  return BYTE1(self->_transferSession);
}

- (void)setNdArrayInterpretation:(BOOL)a3
{
  BYTE1(self->_transferSession) = a3;
}

- (BOOL)modelIsMIL
{
  return BYTE2(self->_transferSession);
}

- (void)setModelIsMIL:(BOOL)a3
{
  BYTE2(self->_transferSession) = a3;
}

- (unint64_t)numInputs
{
  return (unint64_t)self->_espressoInputStrides;
}

- (unint64_t)numOutputs
{
  return (unint64_t)self->_modelVersionInfo;
}

- (BOOL)usingCPU
{
  return BYTE3(self->_transferSession);
}

- (void)setUsingCPU:(BOOL)a3
{
  BYTE3(self->_transferSession) = a3;
}

- (void)setPlan:(void *)a3
{
  self->_numInputs = (unint64_t)a3;
}

- (int)precision
{
  return HIDWORD(self->_compilerOutput);
}

- (void)setPrecision:(int)a3
{
  HIDWORD(self->_compilerOutput) = a3;
}

- (int)engine
{
  return *(_DWORD *)&self->_hardwareFallbackDetected;
}

- (void)setEngine:(int)a3
{
  *(_DWORD *)&self->_hardwareFallbackDetected = a3;
}

- (int)qos
{
  return *(_DWORD *)&self->_isEspressoBiasPreprocessingShared;
}

- (void)setQos:(int)a3
{
  *(_DWORD *)&self->_isEspressoBiasPreprocessingShared = a3;
}

- (void)context
{
  return (void *)self->_numOutputs;
}

- (void)setContext:(void *)a3
{
  self->_numOutputs = (unint64_t)a3;
}

- (int)priority
{
  return *(_DWORD *)&self->_isGPUPathForbidden;
}

- (void)setPriority:(int)a3
{
  *(_DWORD *)&self->_isGPUPathForbidden = a3;
}

- (void)setIsEspressoBiasPreprocessingShared:(BOOL)a3
{
  BYTE4(self->_transferSession) = a3;
}

- (id)probabilityDictionarySharedKeySet
{
  return self->_plan;
}

- (void)setProbabilityDictionarySharedKeySet:(id)a3
{
  objc_storeStrong(&self->_plan, a3);
}

- (NSString)modelFilePath
{
  return (NSString *)self->_context;
}

- (void)setModelFilePath:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (BOOL)hasBidirectionalLayer
{
  return BYTE5(self->_transferSession);
}

- (void)setHasBidirectionalLayer:(BOOL)a3
{
  BYTE5(self->_transferSession) = a3;
}

- (BOOL)hasOptionalInputSequenceConcat
{
  return HIBYTE(self->_transferSession);
}

- (void)setHasOptionalInputSequenceConcat:(BOOL)a3
{
  HIBYTE(self->_transferSession) = a3;
}

- (OS_dispatch_semaphore)bufferSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 384, 1);
}

- (void)setBufferSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (OS_dispatch_queue)espressoQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 392, 1);
}

- (void)setEspressoQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (OS_dispatch_queue)predictionsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 400, 1);
}

- (void)setPredictionsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (void)setSubmitSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (BOOL)isGPUPathForbidden
{
  return (uint64_t)self->_compilerOutput & 1;
}

- (void)setIsGPUPathForbidden:(BOOL)a3
{
  LOBYTE(self->_compilerOutput) = a3;
}

- (BOOL)isANEPathForbidden
{
  return BYTE1(self->_compilerOutput) & 1;
}

- (void)setIsANEPathForbidden:(BOOL)a3
{
  BYTE1(self->_compilerOutput) = a3;
}

- (EspressoProfilingNetworkInfo)espressoProfileInfo
{
  return (EspressoProfilingNetworkInfo *)self->_inputBlobNameToLastBackingMode;
}

- (void)setEspressoProfileInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlobNameToLastBackingMode, a3);
}

- (NSDictionary)optionalInputTypes
{
  return &self->_outputBlobNameToLastBackingMode->super;
}

- (MLPixelBufferPool)pixelBufferPool
{
  return (MLPixelBufferPool *)self->_optionalInputTypes;
}

- (void)setNetwork:(id)a3
{
  *($C4732ECC957FA13B9B3DF4A51A95735B *)&self->_compilerVersionInfo = a3;
}

- (NSDictionary)defaultOptionalValues
{
  return (NSDictionary *)self->_inputFeatureConformer;
}

- (void)setDefaultOptionalValues:(id)a3
{
  objc_storeStrong((id *)&self->_inputFeatureConformer, a3);
}

- (MLVersionInfo)compilerVersionInfo
{
  return (MLVersionInfo *)self->_pixelBufferPool;
}

- (void)setActiveFunction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultOptionalValues, a3);
}

- (void).cxx_destruct
{
  unint64_t *begin;
  vector<std::map<std::string, espresso_buffer_t *>, std::allocator<std::map<std::string, espresso_buffer_t *>>> *p_outputBuffers;

  objc_storeStrong((id *)&self->_defaultOptionalValues, 0);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
  objc_storeStrong((id *)&self->_inputFeatureConformer, 0);
  objc_storeStrong((id *)&self->_optionalInputTypes, 0);
  objc_storeStrong((id *)&self->_espressoProfileInfo, 0);
  objc_storeStrong((id *)&self->_outputBlobNameToLastBackingMode, 0);
  objc_storeStrong((id *)&self->_inputBlobNameToLastBackingMode, 0);
  objc_storeStrong((id *)&self->_submitSemaphore, 0);
  objc_storeStrong((id *)&self->_predictionsQueue, 0);
  objc_storeStrong((id *)&self->_espressoQueue, 0);
  objc_storeStrong((id *)&self->_bufferSemaphore, 0);
  objc_storeStrong((id *)&self->_modelFilePath, 0);
  objc_storeStrong(&self->_probabilityDictionarySharedKeySet, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_plan, 0);
  objc_storeStrong((id *)&self->_espressoInputShapes, 0);
  objc_storeStrong((id *)&self->_imagePreprocessingParameters, 0);
  objc_storeStrong((id *)&self->_outputLayers, 0);
  objc_storeStrong((id *)&self->_inputLayers, 0);
  objc_storeStrong((id *)&self->_classScoreVectorName, 0);
  objc_storeStrong((id *)&self->_classLabels, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_OutputBlobIsDynamic.__tree_.__pair3_, 0);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_currentConfigurationName.var0);
  if (*((char *)&self->_currentConfigurationName.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_currentConfigurationName.__r_.__value_.var0.__l.__data_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_.__value_.__left_);
  begin = self->_bufferAvailable.__begin_;
  if (begin)
    operator delete(begin);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_currentBlobShapes.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_params.__tree_.__pair1_.__value_.__left_);
  p_outputBuffers = &self->_outputBuffers;
  std::vector<std::map<std::string,espresso_buffer_t *>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_outputBuffers);
  p_outputBuffers = &self->_inputBuffers;
  std::vector<std::map<std::string,espresso_buffer_t *>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_outputBuffers);
}

uint64_t __60__MLNeuralNetworkEngine_predictionsFromBatch_options_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "plan");
  result = espresso_plan_can_use_submit();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __62__MLNeuralNetworkEngine_predictionFromFeatures_options_error___block_invoke_2()
{
  return kdebug_trace();
}

void __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  void *v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  __int128 *p_buf;
  int8x16_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v26[3];
  uint64_t v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_matchEngineToOptions:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80)))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "featuresAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "verifyInputs:error:", v3, *(_QWORD *)(a1 + 80));
    v4 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v4;
    if (v4)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "resetSizes:error:", v4, *(_QWORD *)(a1 + 80)) & 1) != 0)
      {
        v5 = dispatch_group_create();
        if (*(_QWORD *)(a1 + 88))
        {
          v6 = 0;
          v7 = MEMORY[0x1E0C809B0];
          do
          {
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
              break;
            v26[0] = 0;
            v26[1] = v26;
            v26[2] = 0x2020000000;
            v27 = 0;
            v27 = objc_msgSend(*(id *)(a1 + 32), "obtainBuffer");
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v29 = 0x3032000000;
            v30 = __Block_byref_object_copy__2979;
            v31 = __Block_byref_object_dispose__2980;
            v32 = 0;
            dispatch_group_enter(v5);
            objc_msgSend(*(id *)(a1 + 32), "espressoQueue");
            v8 = objc_claimAutoreleasedReturnValue();
            block[0] = v7;
            block[1] = 3221225472;
            block[2] = __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_221;
            block[3] = &unk_1E3D652B0;
            block[4] = *(_QWORD *)(a1 + 32);
            v18 = *(id *)(a1 + 48);
            p_buf = &buf;
            v23 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
            v24 = v26;
            v25 = v6;
            v19 = v5;
            v20 = *(id *)(a1 + 40);
            v21 = *(id *)(a1 + 56);
            dispatch_async(v8, block);

            _Block_object_dispose(&buf, 8);
            _Block_object_dispose(v26, 8);
            ++v6;
          }
          while (v6 < *(_QWORD *)(a1 + 88));
        }
        dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

      }
      else
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(**(id **)(a1 + 80), "localizedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v15;
          _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Unable to reset sizes for an element of a batch computation. (Underlying error: %@)", (uint8_t *)&buf, 0xCu);

        }
        v13 = *(_QWORD **)(a1 + 80);
        if (v13)
        {
          +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, *v13, CFSTR("Unable to reset sizes for an element of a batch computation."));
          **(_QWORD **)(a1 + 80) = (id)objc_claimAutoreleasedReturnValue();
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(**(id **)(a1 + 80), "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Unable to verify the first input of the batch. (Underlying error: %@)", (uint8_t *)&buf, 0xCu);

      }
      v10 = *(_QWORD **)(a1 + 80);
      v11 = 0;
      if (!v10)
        goto LABEL_19;
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, *v10, CFSTR("Unable to verify the first input of the batch."));
      **(_QWORD **)(a1 + 80) = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v16;
LABEL_19:

  }
}

uint64_t __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_221(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v29;
  _QWORD aBlock[5];
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 *p_buf;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id obj;
  __int128 buf;
  uint64_t v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "featuresAtIndex:", *(_QWORD *)(a1 + 104));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "verifyInputs:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v6);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(a1 + 104);
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v29;
      _os_log_error_impl(&dword_19C486000, v25, OS_LOG_TYPE_ERROR, "Failed to validate %tu-th input feature provider in batch computation.", (uint8_t *)&buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "releaseBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v39 = *(id *)(v11 + 40);
    v12 = objc_msgSend(v8, "bindInputsAndOutputs:cleanUpBlocks:bufferIndex:options:error:", v5, v7, v9, v10, &v39);
    objc_storeStrong((id *)(v11 + 40), v39);
    if ((v12 & 1) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v42 = 0x2020000000;
      v43 = 0;
      objc_msgSend(*(id *)(a1 + 32), "submitSemaphore");
      v13 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

      kdebug_trace();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_224;
      aBlock[3] = &unk_1E3D65288;
      aBlock[4] = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 96);
      p_buf = &buf;
      v36 = v14;
      v15 = *(id *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 80);
      v31 = v15;
      v37 = v16;
      v32 = v7;
      v33 = *(id *)(a1 + 56);
      v17 = *(id *)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 104);
      v34 = v17;
      v38 = v18;
      v19 = _Block_copy(aBlock);
      objc_msgSend(*(id *)(a1 + 32), "plan");
      objc_msgSend(*(id *)(a1 + 32), "espressoQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = espresso_plan_submit();

      kdebug_trace();
      objc_msgSend(*(id *)(a1 + 32), "submitSemaphore");
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v21);

      if (*(_DWORD *)(*((_QWORD *)&buf + 1) + 24))
      {
        NSLog(CFSTR("Error calling plan_submit in batch processing."));
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Error calling plan submit for batch processing."));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;

        objc_msgSend(*(id *)(a1 + 32), "releaseBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_19C486000, v26, OS_LOG_TYPE_ERROR, "Failed to bind input / output features in batch computation.", (uint8_t *)&buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setObject:atIndexedSubscript:", v27, *(_QWORD *)(a1 + 104));

      objc_msgSend(*(id *)(a1 + 32), "releaseBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    }

  }
  return kdebug_trace();
}

uint64_t __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "releaseBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Error calling plan submit."));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      return kdebug_trace();
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v7);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }

    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v26 = 0;
    objc_msgSend(v11, "populateOutputs:outputBackings:directlyBoundOutputFeatureNames:error:", v12, MEMORY[0x1E0C9AA70], 0, &v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;
    v15 = v26;
    if (v13)
      v16 = v15 == 0;
    else
      v16 = 0;
    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "classLabels");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (!v19)
      {
        v20 = *(void **)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 56);
        v25 = 0;
        objc_msgSend(v20, "addClassifierInformationToOutput:options:error:", v13, v21, &v25);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v25;
        v17 = v25;

        if (!v22 || v17)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v23);
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
          v13 = (void *)v22;
          objc_msgSend(*(id *)(a1 + 32), "releaseBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
          goto LABEL_22;
        }
        v13 = (void *)v22;
      }
      objc_msgSend(*(id *)(a1 + 64), "setObject:atIndexedSubscript:", v13, *(_QWORD *)(a1 + 96));
      objc_msgSend(*(id *)(a1 + 32), "releaseBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      v17 = 0;
    }
    else
    {
      v17 = v15;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v14);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "releaseBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    }
LABEL_22:

  }
  return kdebug_trace();
}

void __62__MLNeuralNetworkEngine_pixelBufferBackedMultiArrayWithShape___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id v8;

  v8 = a2;
  if (a3 + 1 == objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = objc_msgSend(v8, "unsignedIntValue");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v7 = objc_msgSend(v8, "unsignedIntValue");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(_QWORD *)(v6 + 24) * v7;
  }
  *(_QWORD *)(v6 + 24) = v5;

}

void __106__MLNeuralNetworkEngine_populateMultiArrayShape_strides_forEbuf_featureDescription_ndArrayInterpretation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__MLNeuralNetworkEngine_populateMultiArrayShape_strides_forEbuf_featureDescription_ndArrayInterpretation___block_invoke_2;
  v8[3] = &unk_1E3D65210;
  v8[4] = &v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  if (*(_QWORD *)(a1 + 40) == v10[3])
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
  _Block_object_dispose(&v9, 8);

}

void __106__MLNeuralNetworkEngine_populateMultiArrayShape_strides_forEbuf_featureDescription_ndArrayInterpretation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4 * objc_msgSend(v3, "unsignedIntValue");

}

void __67__MLNeuralNetworkEngine_evaluateInputs_options_verifyInputs_error___block_invoke_131(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "evaluateInputs:bufferIndex:options:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__MLNeuralNetworkEngine_lockPixelBuffer_cleanUpBlocks_error___block_invoke(uint64_t a1)
{
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

uint64_t __92__MLNeuralNetworkEngine_transferOneComponent16HalfPixelBuffer_toPixelBuffer_withScale_bias___block_invoke()
{
  return kdebug_trace();
}

void __101__MLNeuralNetworkEngine_bindDirectlyInputFeatureNamed_pixelBuffer_cleanUpBlocks_boundDirectly_error___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

uint64_t __106__MLNeuralNetworkEngine_bindInputFeatureNamed_featureValue_bufferIndex_cleanUpBlocks_boundDirectly_error___block_invoke()
{
  return kdebug_trace();
}

uint64_t __106__MLNeuralNetworkEngine_bindInputFeatureNamed_featureValue_bufferIndex_cleanUpBlocks_boundDirectly_error___block_invoke_2()
{
  return kdebug_trace();
}

+ (int)gpuPrecision
{
  return 65552;
}

+ (Class)containerClass
{
  return (Class)objc_opt_class();
}

+ (id)neuralNetworkFromContainer:(id)a3 error:(id *)a4
{
  id v5;
  MLModelConfiguration *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(MLModelConfiguration);
  +[MLNeuralNetworkEngine neuralNetworkFromContainer:configuration:error:](MLNeuralNetworkEngine, "neuralNetworkFromContainer:configuration:error:", v5, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)neuralNetworkFromContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainer:configuration:error:", v8, v9, a5);

  return v10;
}

+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  MLModelAssetDescription *v16;
  void *v17;
  MLModelAssetDescription *v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend((id)objc_msgSend(a1, "containerClass"), "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v12, v13, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = [MLModelAssetDescription alloc];
    objc_msgSend(v15, "modelDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MLModelAssetDescription initWithModelDescription:](v16, "initWithModelDescription:", v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
