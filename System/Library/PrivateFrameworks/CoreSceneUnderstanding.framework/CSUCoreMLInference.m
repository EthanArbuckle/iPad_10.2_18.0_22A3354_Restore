@implementation CSUCoreMLInference

- (void)getMLModelConfigWithFuncName:(id)a3 ComputeUnit:(int64_t)a4 PrecompiledE5Bundle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  MLModelConfiguration *v9;
  MLModelConfiguration *config;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  id v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (MLModelConfiguration *)objc_opt_new();
  config = self->_config;
  self->_config = v9;

  objc_msgSend_setComputeUnits_(self->_config, v11, a4, v12, v13);
  objc_msgSend_setUsePrecompiledE5Bundle_(self->_config, v14, v5, v15, v16);
  if (objc_msgSend_usePrecompiledE5Bundle(self->_config, v17, v18, v19, v20))
  {
    sub_23A016E78();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    LOWORD(v27) = 0;
    v22 = "Using precompiled bundle";
  }
  else
  {
    sub_23A016E78();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    LOWORD(v27) = 0;
    v22 = "Not using precompiled bundle";
  }
  _os_log_impl(&dword_239FE9000, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v27, 2u);
LABEL_7:

  if (v8)
  {
    objc_msgSend_setFunctionName_(self->_config, v23, (uint64_t)v8, v24, v25);
    sub_23A016E78();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = 138412290;
      v28 = v8;
      _os_log_impl(&dword_239FE9000, v26, OS_LOG_TYPE_INFO, "Using function = %@", (uint8_t *)&v27, 0xCu);
    }

  }
}

- (CSUCoreMLInference)initWithCompiledModelFromUri:(id)a3 useComputeUnit:(int64_t)a4 usePrecompiledE5Bundle:(BOOL)a5 error:(id *)a6
{
  return (CSUCoreMLInference *)objc_msgSend_initWithCompiledModelFromUri_useFunction_useComputeUnit_usePrecompiledE5Bundle_error_(self, a2, (uint64_t)a3, 0, a4, a5, a6);
}

- (CSUCoreMLInference)initWithCompiledModelFromUri:(id)a3 useFunction:(id)a4 useComputeUnit:(int64_t)a5 usePrecompiledE5Bundle:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  CSUCoreMLInference *v14;
  const char *v15;
  CSUCoreMLInference *v16;
  NSDictionary *pixelBufferAttributesForIOSurfaceBacking;
  NSMutableDictionary *outputBackings;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSURL *modelURL;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  MLModel *model;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSURL *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSDictionary *inputDescriptionsByName;
  CSUCoreMLInference *v56;
  objc_super v58;
  uint8_t buf[4];
  NSURL *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v8 = a6;
  v63 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v58.receiver = self;
  v58.super_class = (Class)CSUCoreMLInference;
  v14 = -[CSUCoreMLInference init](&v58, sel_init);
  v16 = v14;
  if (v14)
  {
    objc_msgSend_getMLModelConfigWithFuncName_ComputeUnit_PrecompiledE5Bundle_(v14, v15, (uint64_t)v13, a5, v8);
    pixelBufferAttributesForIOSurfaceBacking = v16->_pixelBufferAttributesForIOSurfaceBacking;
    v16->_pixelBufferAttributesForIOSurfaceBacking = 0;

    outputBackings = v16->_outputBackings;
    v16->_outputBackings = 0;

    v19 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, (uint64_t)CFSTR("file://%@"), v21, v22, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLWithString_(v19, v24, (uint64_t)v23, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    modelURL = v16->_modelURL;
    v16->_modelURL = (NSURL *)v27;

    objc_msgSend_date(MEMORY[0x24BDBCE60], v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modelWithContentsOfURL_configuration_error_(MEMORY[0x24BDBFFC8], v34, (uint64_t)v16->_modelURL, (uint64_t)v16->_config, (uint64_t)a7);
    v35 = objc_claimAutoreleasedReturnValue();
    model = v16->_model;
    v16->_model = (MLModel *)v35;

    if (!v16->_model)
    {

      v56 = 0;
      goto LABEL_8;
    }
    objc_msgSend_timeIntervalSinceNow(v33, v37, v38, v39, v40);
    v42 = v41;
    sub_23A016E78();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = v16->_modelURL;
      *(_DWORD *)buf = 138412546;
      v60 = v44;
      v61 = 2048;
      v62 = v42;
      _os_log_impl(&dword_239FE9000, v43, OS_LOG_TYPE_INFO, "Time to load CoreML model %@ = %f", buf, 0x16u);
    }

    objc_msgSend_modelDescription(v16->_model, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputDescriptionsByName(v49, v50, v51, v52, v53);
    v54 = objc_claimAutoreleasedReturnValue();
    inputDescriptionsByName = v16->_inputDescriptionsByName;
    v16->_inputDescriptionsByName = (NSDictionary *)v54;

  }
  v56 = v16;
LABEL_8:

  return v56;
}

- (id)getInputMLMutliArrayFor:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  id v64;

  v6 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiArrayConstraint(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_dataType(v15, v16, v17, v18, v19);

  objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v21, (uint64_t)v6, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiArrayConstraint(v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shape(v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v35, (uint64_t)v6, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiArrayConstraint(v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shapeConstraint(v43, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumeratedShapes(v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = objc_alloc(MEMORY[0x24BDBFFF0]);
  v56 = objc_msgSend_initWithShape_dataType_error_(v54, v55, (uint64_t)v34, v20, (uint64_t)a4);
  v60 = (void *)v56;
  if (a4 && !v56)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v57, (uint64_t)CFSTR("Could not create input MLMultiArray of type %ld and shape %@"), v58, v59, v20, v34);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (id)objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v62, (uint64_t)v61, (uint64_t)*a4, v63);

  }
  return v60;
}

- (id)getInputMLMutliArrayFor:(id)a3 WithShape:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  char isEqualToArray;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  id v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  id v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v10, (uint64_t)v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiArrayConstraint(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_dataType(v18, v19, v20, v21, v22);

  objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v24, (uint64_t)v8, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiArrayConstraint(v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shapeConstraint(v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumeratedShapes(v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v43 = v42;
  v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v73, (uint64_t)v77, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v74;
    while (2)
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v74 != v46)
          objc_enumerationMutation(v43);
        v48 = *(id *)(*((_QWORD *)&v73 + 1) + 8 * i);
        isEqualToArray = objc_msgSend_isEqualToArray_(v9, v49, (uint64_t)v48, v50, v51);

        if ((isEqualToArray & 1) != 0)
        {
          v57 = v43;
          goto LABEL_11;
        }
      }
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v53, (uint64_t)&v73, (uint64_t)v77, 16);
      if (v45)
        continue;
      break;
    }
  }

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v54, (uint64_t)CFSTR("Specified shape %@ for input %@ is invalid, allowed shapes are %@ "), v55, v56, v9, v8, v43);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (id)objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v58, (uint64_t)v57, (uint64_t)*a5, v59);
LABEL_11:

  v61 = objc_alloc(MEMORY[0x24BDBFFF0]);
  v63 = objc_msgSend_initWithShape_dataType_error_(v61, v62, (uint64_t)v9, v23, (uint64_t)a5);
  v67 = (void *)v63;
  if (a5 && !v63)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v64, (uint64_t)CFSTR("Could not create input MLMultiArray of type %ld and shape %@"), v65, v66, v23, v9);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (id)objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v69, (uint64_t)v68, (uint64_t)*a5, v70);

  }
  return v67;
}

- (BOOL)setInputFeatures:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  MLDictionaryFeatureProvider *v10;
  MLDictionaryFeatureProvider *featsProvider;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x24BDBFF80]);
  v10 = (MLDictionaryFeatureProvider *)objc_msgSend_initWithDictionary_error_(v7, v8, (uint64_t)v6, (uint64_t)a4, v9);
  featsProvider = self->_featsProvider;
  self->_featsProvider = v10;

  LOBYTE(self) = self->_featsProvider != 0;
  return (char)self;
}

- (void)setOutputBufferWithLayerName:(id)a3 withWidth:(unint64_t)a4 withHeight:(unint64_t)a5 withShape:(id)a6 withPixelFormat:(unsigned int)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSDictionary *v24;
  NSDictionary *pixelBufferAttributesForIOSurfaceBacking;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *outputBackings;
  NSMutableDictionary *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  CVPixelBufferRef pixelBufferOut;

  v13 = a3;
  v14 = a6;
  pixelBufferOut = 0;
  v15 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend_dictionary(MEMORY[0x24BDBCE70], v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithObjectsAndKeys_(v15, v21, (uint64_t)v20, v22, v23, *MEMORY[0x24BDC5668], 0);
  v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  pixelBufferAttributesForIOSurfaceBacking = self->_pixelBufferAttributesForIOSurfaceBacking;
  self->_pixelBufferAttributesForIOSurfaceBacking = v24;

  v26 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, a5, 0x4C303068u, (CFDictionaryRef)self->_pixelBufferAttributesForIOSurfaceBacking, &pixelBufferOut);
  if ((_DWORD)v26)
    v30 = 1;
  else
    v30 = pixelBufferOut == 0;
  if (v30)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v27, (uint64_t)CFSTR("Could not create CVPixelBuffer - return status is %d"), v28, v29, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v32, (uint64_t)v31, v33, v34);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = (NSMutableDictionary *)objc_opt_new();
    outputBackings = self->_outputBackings;
    self->_outputBackings = v35;

    v37 = self->_outputBackings;
    v38 = objc_alloc(MEMORY[0x24BDBFFF0]);
    v41 = (void *)objc_msgSend_initWithPixelBuffer_shape_(v38, v39, (uint64_t)pixelBufferOut, (uint64_t)v14, v40);
    objc_msgSend_setObject_forKey_(v37, v42, (uint64_t)v41, (uint64_t)v13, v43);

    CFRelease(pixelBufferOut);
  }

}

- (BOOL)predict:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  MLFeatureProvider *v15;
  MLFeatureProvider *outputs;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  MLFeatureProvider *v23;

  v5 = (void *)objc_opt_new();
  objc_msgSend_setOutputBackings_(v5, v6, (uint64_t)self->_outputBackings, v7, v8);
  objc_msgSend_date(MEMORY[0x24BDBCE60], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predictionFromFeatures_options_error_(self->_model, v14, (uint64_t)self->_featsProvider, (uint64_t)v5, (uint64_t)a3);
  v15 = (MLFeatureProvider *)objc_claimAutoreleasedReturnValue();
  outputs = self->_outputs;
  self->_outputs = v15;

  objc_msgSend_timeIntervalSinceNow(v13, v17, v18, v19, v20);
  v23 = self->_outputs;
  if (a3 && !v23)
  {
    objc_msgSend_errorWithCode_message_(CSUError, v21, 12, (uint64_t)CFSTR("Model could not generate the output"), v22);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23 != 0;
}

- (id)getOutputFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_featureValueForName_(self->_outputs, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiArrayValue(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_outputBackings, 0);
  objc_storeStrong((id *)&self->_pixelBufferAttributesForIOSurfaceBacking, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_featsProvider, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end
