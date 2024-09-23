@implementation ABPK2DDetection

- (ABPK2DDetection)initWithNetworkConfig:(id)a3
{
  id v5;
  NSObject *v6;
  ABPK2DDetection *v7;
  ABPK2DDetection *v8;
  uint64_t v9;
  ABPKMLModelConfiguration2D *mlConfig;
  CGFloat v11;
  CGFloat v12;
  float v13;
  float v14;
  float v15;
  float v16;
  ABPK2DDetection *v17;
  objc_super v19;
  uint8_t buf[16];

  v5 = a3;
  __ABPKLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " ABPK2DDetection: Initializing ", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)ABPK2DDetection;
  v7 = -[ABPK2DDetection init](&v19, sel_init);
  v8 = v7;
  if (v7
    && (objc_storeStrong((id *)&v7->_config2D, a3),
        +[ABPK2DMLModelConfigSelector getModelWithNetworkConfig:](ABPK2DMLModelConfigSelector, "getModelWithNetworkConfig:", v8->_config2D), v9 = objc_claimAutoreleasedReturnValue(), mlConfig = v8->_mlConfig, v8->_mlConfig = (ABPKMLModelConfiguration2D *)v9, mlConfig, -[ABPK2DDetection setUseEspressoZeroCopyOutput:](v8, "setUseEspressoZeroCopyOutput:", 1), -[ABPK2DDetection initMLNetwork](v8, "initMLNetwork")))
  {
    -[ABPKMLModelConfiguration2D inputDimensions](v8->_mlConfig, "inputDimensions");
    v8->_parameters.input.resolution.width = v11;
    v8->_parameters.input.resolution.height = v12;
    -[ABPKMLModelConfiguration2D biasR](v8->_mlConfig, "biasR");
    v8->_parameters.input.preprocessor.bias_r = v13;
    -[ABPKMLModelConfiguration2D biasG](v8->_mlConfig, "biasG");
    v8->_parameters.input.preprocessor.bias_g = v14;
    -[ABPKMLModelConfiguration2D biasB](v8->_mlConfig, "biasB");
    v8->_parameters.input.preprocessor.bias_b = v15;
    -[ABPKMLModelConfiguration2D scale](v8->_mlConfig, "scale");
    v8->_parameters.input.preprocessor.scale = v16;
    v8->_parameters.input.preprocessor.network_wants_bgr = -[ABPKMLModelConfiguration2D networkWantsBGR](v8->_mlConfig, "networkWantsBGR");
    v17 = v8;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (CGSize)inputDimensionsForDeviceOrientation:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a3, "inputDimensions");
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)createException:(void *)a3 forNetwork:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  espresso_plan_get_error_info();
  v7 = (void *)objc_msgSend(v5, "initWithUTF8String:", v6);
  v8 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ in %@"), v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", CFSTR("EspressoPlanFailure"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)initMLNetwork
{
  NSObject *v3;
  NSArray *v4;
  NSArray *inputTensorNames;
  NSArray *v6;
  NSArray *outputTensorNames;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  ABPKMLNetworkV2 *v11;
  ABPKMLNetworkV2 *networkV2;
  NSMutableDictionary *v13;
  NSMutableDictionary *inputBufferDict;
  NSMutableDictionary *v15;
  NSMutableDictionary *outputBufferDict;
  void *context;
  const char *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  char v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  NSArray *v29;
  id v30;
  NSArray *v31;
  id v32;
  NSArray *v33;
  id v34;
  NSArray *v35;
  NSObject *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  BOOL v40;
  NSObject *v41;
  NSObject *v43;
  id v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  ABPK2DDetection *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  uint8_t v59[4];
  void *v60;
  __int128 buf;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  -[ABPK2DDetection _startLoadingMLModelSignpost](self, "_startLoadingMLModelSignpost");
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPK2DDetection: Initializing ML Network ", (uint8_t *)&buf, 2u);
  }

  -[ABPKMLModelConfiguration inputTensorNames](self->_mlConfig, "inputTensorNames");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputTensorNames = self->_inputTensorNames;
  self->_inputTensorNames = v4;

  -[ABPKMLModelConfiguration outputTensorNames](self->_mlConfig, "outputTensorNames");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputTensorNames = self->_outputTensorNames;
  self->_outputTensorNames = v6;

  self->_useEspressoV2 = 0;
  -[ABPKMLModelConfiguration compiledMLModelPath](self->_mlConfig, "compiledMLModelPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    __ABPKLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = 0;
      _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_ERROR, " Network path is nil: %@ ", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_39;
  }
  -[ABPKMLModelConfiguration2D configStringForABPKDeviceOrientation:](self->_mlConfig, "configStringForABPKDeviceOrientation:", 3);
  v9 = objc_claimAutoreleasedReturnValue();
  __ABPKLogSharedInstance();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_DEBUG, " \t Select network config: %@ ", (uint8_t *)&buf, 0xCu);
  }

  if (!objc_msgSend(v8, "hasSuffix:", CFSTR(".bundle")))
  {
    context = (void *)espresso_create_context();
    self->_context = context;
    if (context)
    {
      v18 = "ANE";
    }
    else
    {
      v19 = (void *)espresso_create_context();
      self->_context = v19;
      if (!v19)
      {
        __ABPKLogSharedInstance();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_210836000, v41, OS_LOG_TYPE_ERROR, " ANE not available. GPU not available. Espresso context creation failed for 2d detection model. ", (uint8_t *)&buf, 2u);
        }

        goto LABEL_39;
      }
      v18 = "GPU";
    }
    __ABPKLogSharedInstance();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_210836000, v20, OS_LOG_TYPE_DEFAULT, " \t Deploying 2d detection model on %s ", (uint8_t *)&buf, 0xCu);
    }

    Espresso::get_internal_context((Espresso *)self->_context, v21);
    *(_DWORD *)(buf + 68) = 1;
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    __ABPKLogSharedInstance();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 138412290;
      v60 = v22;
      _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEFAULT, " %@ ", v59, 0xCu);
    }

    v24 = objc_alloc_init(MEMORY[0x24BDD1580]);
    v25 = objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v22, 0);
    if ((v25 & 1) != 0)
    {
      self->_plan = (void *)espresso_create_plan();
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      if (!espresso_plan_add_network())
      {
        -[NSObject UTF8String](objc_retainAutorelease(v9), "UTF8String");
        if (!espresso_network_select_configuration())
        {
          if (!-[ABPKMLModelConfiguration2D applyPreProcessing](self->_mlConfig, "applyPreProcessing")
            || (-[NSArray objectAtIndexedSubscript:](self->_inputTensorNames, "objectAtIndexedSubscript:", 0),
                v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
                objc_msgSend(v26, "UTF8String"),
                v27 = espresso_set_image_preprocessing_params() == 0,
                v26,
                v27))
          {
            v28 = MEMORY[0x24BDAC760];
            v29 = self->_inputTensorNames;
            v57[0] = MEMORY[0x24BDAC760];
            v57[1] = 3221225472;
            v57[2] = __32__ABPK2DDetection_initMLNetwork__block_invoke;
            v57[3] = &unk_24CA6E968;
            v57[4] = self;
            v30 = v8;
            v58 = v30;
            -[NSArray enumerateObjectsUsingBlock:](v29, "enumerateObjectsUsingBlock:", v57);
            std::vector<espresso_buffer_t>::resize((uint64_t)&self->_espressoOutputTensors, -[NSArray count](self->_outputTensorNames, "count"));
            std::vector<__CVPixelBufferPool *>::resize((uint64_t)&self->_espressoOutputBufferPools, -[NSArray count](self->_outputTensorNames, "count"));
            std::vector<__CVPixelBufferPool *>::resize((uint64_t)&self->_outputBuffers, -[NSArray count](self->_outputTensorNames, "count"));
            v31 = self->_outputTensorNames;
            v55[0] = v28;
            v55[1] = 3221225472;
            v55[2] = __32__ABPK2DDetection_initMLNetwork__block_invoke_14;
            v55[3] = &unk_24CA6E968;
            v55[4] = self;
            v32 = v30;
            v56 = v32;
            -[NSArray enumerateObjectsUsingBlock:](v31, "enumerateObjectsUsingBlock:", v55);
            if (espresso_plan_build())
            {
              __ABPKLogSharedInstance();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v59 = 0;
                _os_log_impl(&dword_210836000, v43, OS_LOG_TYPE_ERROR, " Could not build plan ", v59, 2u);
              }

              -[ABPK2DDetection createException:forNetwork:](self, "createException:forNetwork:", self->_plan, v32);
              v44 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v44);
            }
            -[ABPK2DDetection _bindOutputTensor](self, "_bindOutputTensor");
            v33 = self->_inputTensorNames;
            v53[0] = v28;
            v53[1] = 3221225472;
            v53[2] = __32__ABPK2DDetection_initMLNetwork__block_invoke_15;
            v53[3] = &unk_24CA6E968;
            v53[4] = self;
            v34 = v32;
            v54 = v34;
            -[NSArray enumerateObjectsUsingBlock:](v33, "enumerateObjectsUsingBlock:", v53);
            v35 = self->_outputTensorNames;
            v47 = v28;
            v48 = 3221225472;
            v49 = __32__ABPK2DDetection_initMLNetwork__block_invoke_16;
            v50 = &unk_24CA6E968;
            v51 = self;
            v52 = v34;
            -[NSArray enumerateObjectsUsingBlock:](v35, "enumerateObjectsUsingBlock:", &v47);

            goto LABEL_28;
          }
          __ABPKLogSharedInstance();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v59 = 0;
            _os_log_impl(&dword_210836000, v45, OS_LOG_TYPE_ERROR, " Could not set preprocessing parameters for the input image ", v59, 2u);
          }

        }
      }
      -[ABPK2DDetection createException:forNetwork:](self, "createException:forNetwork:", self->_plan, v8);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v46);
    }
    __ABPKLogSharedInstance();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v59 = 138412290;
      v60 = v22;
      _os_log_impl(&dword_210836000, v36, OS_LOG_TYPE_ERROR, " Network path is invalid: %@ ", v59, 0xCu);
    }

LABEL_28:
    v37 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
    if (!*((_QWORD *)&buf + 1))
      goto LABEL_32;
    v38 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
      if ((v25 & 1) != 0)
        goto LABEL_33;
    }
    else
    {
LABEL_32:
      if ((v25 & 1) != 0)
        goto LABEL_33;
    }
LABEL_39:
    v40 = 0;
    goto LABEL_40;
  }
  self->_useEspressoV2 = 1;
  v11 = -[ABPKMLNetworkV2 initWithNetworkPath:networkConfig:inputNames:outputNames:useSurface:]([ABPKMLNetworkV2 alloc], "initWithNetworkPath:networkConfig:inputNames:outputNames:useSurface:", v8, v9, self->_inputTensorNames, self->_outputTensorNames, 1);
  networkV2 = self->_networkV2;
  self->_networkV2 = v11;

  -[ABPKMLNetworkV2 inputBuffers](self->_networkV2, "inputBuffers");
  v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  inputBufferDict = self->_inputBufferDict;
  self->_inputBufferDict = v13;

  -[ABPKMLNetworkV2 outputBuffers](self->_networkV2, "outputBuffers");
  v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  outputBufferDict = self->_outputBufferDict;
  self->_outputBufferDict = v15;

LABEL_33:
  -[ABPK2DDetection _endLoadingMLModelSignpost](self, "_endLoadingMLModelSignpost", v47, v48, v49, v50, v51);
  v40 = 1;
LABEL_40:

  return v40;
}

void __32__ABPK2DDetection_initMLNetwork__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(a2);
  objc_msgSend(v5, "UTF8String");
  if (espresso_network_declare_input())
  {
    __ABPKLogSharedInstance();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_ERROR, " Could not declare input tensor: %@ ", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "createException:forNetwork:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }

}

void __32__ABPK2DDetection_initMLNetwork__block_invoke_14(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(a2);
  objc_msgSend(v5, "UTF8String");
  if (espresso_network_declare_output())
  {
    __ABPKLogSharedInstance();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_ERROR, " Could not declare output tensor: %@ ", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "createException:forNetwork:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }

}

void __32__ABPK2DDetection_initMLNetwork__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    __ABPKLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Could not obtain dimension for input tensor: %@ ", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "createException:forNetwork:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  __ABPKLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138413314;
    v8 = v3;
    v9 = 2048;
    v10 = v17;
    v11 = 2048;
    v12 = *((_QWORD *)&v17 + 1);
    v13 = 2048;
    v14 = v18;
    v15 = 2048;
    v16 = *((_QWORD *)&v18 + 1);
    _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " \t Tensor %@ dimensions %zu %zu %zu %zu ", (uint8_t *)&v7, 0x34u);
  }

}

void __32__ABPK2DDetection_initMLNetwork__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    __ABPKLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Could not obtain dimension for output tensor: %@ ", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "createException:forNetwork:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  __ABPKLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138413314;
    v8 = v3;
    v9 = 2048;
    v10 = v17;
    v11 = 2048;
    v12 = *((_QWORD *)&v17 + 1);
    v13 = 2048;
    v14 = v18;
    v15 = 2048;
    v16 = *((_QWORD *)&v18 + 1);
    _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " \t Tensor %@ dimensions %zu %zu %zu %zu ", (uint8_t *)&v7, 0x34u);
  }

}

- (void)_bindOutputTensor
{
  NSArray *outputTensorNames;
  _QWORD v3[5];

  outputTensorNames = self->_outputTensorNames;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__ABPK2DDetection__bindOutputTensor__block_invoke;
  v3[3] = &unk_24CA6E8C8;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](outputTensorNames, "enumerateObjectsUsingBlock:", v3);
}

void __36__ABPK2DDetection__bindOutputTensor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  __IOSurface *v6;
  const __CFDictionary *v7;
  CVReturn v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  _QWORD *exception;
  CVPixelBufferRef pixelBufferOut;
  uint8_t v19[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  CVReturn v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD buf[22];

  buf[21] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "useEspressoZeroCopyOutput"))
  {
    __ABPKLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v3;
      _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " \t Bind Output Tensor %@  ", (uint8_t *)buf, 0xCu);
    }

    v5 = objc_retainAutorelease(v3);
    objc_msgSend(v5, "UTF8String");
    espresso_network_bind_buffer();
    pixelBufferOut = 0;
    v6 = (__IOSurface *)buf[0];
    v25 = *MEMORY[0x24BDC56A8];
    v26 = MEMORY[0x24BDBD1B8];
    v7 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v8 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, v7, &pixelBufferOut);
    if (!CVPixelBufferGetIOSurface(pixelBufferOut))
    {
      __ABPKLogSharedInstance();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v19 = 138412546;
        v20 = v11;
        v21 = 2048;
        v22 = v12;
        _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_ERROR, " %@ (%p): Could not get IOSurface ", v19, 0x16u);

      }
    }
    if (v8)
    {
      __ABPKLogSharedInstance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v19 = 138412802;
        v20 = v15;
        v21 = 2048;
        v22 = v16;
        v23 = 1024;
        v24 = v8;
        _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_ERROR, " %@ (%p): Could not create CVPixelBuffer for neural network: %d ", v19, 0x1Cu);

      }
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Error: Could not create CVPixelBuffer for neural network";
      __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    espresso_network_bind_direct_cvpixelbuffer();
    CVPixelBufferRelease(pixelBufferOut);
  }
  else
  {
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    espresso_network_bind_buffer();
  }

}

- (id)runWithImageDataForNeuralNetwork:(id)a3 originalImageData:(id)a4 abpkOrientation:(int64_t)a5 atTimestamp:(double)a6 rotationOfResultTensor:(int64_t)a7
{
  __CVBuffer *v10;
  __CVBuffer *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  size_t Height;
  size_t Width;
  NSMutableDictionary *inputBufferDict;
  void *v20;
  IOSurfaceRef IOSurface;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  NSMutableDictionary *outputBufferDict;
  void *v26;
  void *v27;
  CVPixelBufferRef v28;
  CVPixelBufferRef v29;
  __int128 v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  CVPixelBufferRef *v36;
  char *v37;
  char *v38;
  __CVBuffer *v39;
  const char *v40;
  void *v41;
  unint64_t v43;
  id v44;
  unint64_t v45;
  __int128 v46;
  _BOOL4 v47;
  double v48;
  double v49;
  CVPixelBufferPoolRef *v50;
  CVPixelBufferRef v51;
  CVPixelBufferRef v52;
  char *v53;
  CVPixelBufferRef v54;
  CVPixelBufferRef v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  CVPixelBufferRef *v65;
  char *v66;
  __CVBuffer *v67;
  id v68;
  CVPixelBufferRef *v69;
  char *v70;
  __CVBuffer *v71;
  id v72;
  BOOL v73;
  unint64_t i;
  unint64_t j;
  NSObject *v76;
  id v77;
  NSObject *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  char *__p;
  char *v84;
  char *v85;
  uint8_t buf[40];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v81 = a3;
  v82 = a4;
  v10 = (__CVBuffer *)objc_msgSend(v81, "pixelBuffer");
  v11 = v10;
  if (!v10)
  {
    __ABPKLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v40 = " Input image is nil ";
LABEL_42:
    _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_ERROR, v40, buf, 2u);
    goto LABEL_43;
  }
  if (CVPixelBufferGetPixelFormatType(v10) != 1111970369)
  {
    __ABPKLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v40 = " Input image format is not valid ";
    goto LABEL_42;
  }
  if (!CVPixelBufferGetIOSurface(v11))
  {
    __ABPKLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v40 = " Input image pixelbuffer not backed by IOSurface ";
      goto LABEL_42;
    }
LABEL_43:
    v41 = 0;
    goto LABEL_44;
  }
  __ABPKLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    convertABPKDeviceOrientationEnumToString(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " \t Device Orientation: %@ ", buf, 0xCu);

  }
  -[ABPKMLModelConfiguration2D configStringForABPKDeviceOrientation:](self->_mlConfig, "configStringForABPKDeviceOrientation:", a5);
  v14 = objc_claimAutoreleasedReturnValue();
  __ABPKLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_210836000, v15, OS_LOG_TYPE_DEBUG, " \t Selected network mode: %@ ", buf, 0xCu);
  }

  if (!v14)
  {
    __ABPKLogSharedInstance();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v76, OS_LOG_TYPE_ERROR, " Invalid network mode specified ", buf, 2u);
    }

    -[ABPK2DDetection createException:forNetwork:](self, "createException:forNetwork:", self->_plan, self->_netSubPath);
    v77 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v77);
  }
  __ABPKLogSharedInstance();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    Height = CVPixelBufferGetHeight(v11);
    Width = CVPixelBufferGetWidth(v11);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = Height;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = Width;
    _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_DEBUG, " \t Binding image with (height,width) = (%zu,%zu) ", buf, 0x16u);
  }

  -[ABPK2DDetection changeEspressoConfig:](self, "changeEspressoConfig:", v14);
  if (self->_useEspressoV2)
  {
    inputBufferDict = self->_inputBufferDict;
    -[NSArray objectAtIndexedSubscript:](self->_inputTensorNames, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](inputBufferDict, "objectForKeyedSubscript:", v20);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    CVPixelBufferLockBaseAddress(v11, 0);
    IOSurface = CVPixelBufferGetIOSurface(v11);
    -[NSArray objectAtIndexedSubscript:](self->_inputTensorNames, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setInput:FromIOSurface:", v22, IOSurface);

    -[ABPKMLNetworkV2 execute](self->_networkV2, "execute");
    CVPixelBufferUnlockBaseAddress(v11, 0);
    __ABPKLogSharedInstance();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " \t Creating AR2DSkeletonRawEspressoResult with heatmap only ", buf, 2u);
    }

    v24 = 0;
    memset(buf, 0, 24);
    while (v24 < -[NSArray count](self->_outputTensorNames, "count"))
    {
      outputBufferDict = self->_outputBufferDict;
      -[NSArray objectAtIndexedSubscript:](self->_outputTensorNames, "objectAtIndexedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](outputBufferDict, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v27, "pixelBuffer"));
      v29 = v28;
      v30 = *(_OWORD *)&buf[8];
      if (*(_QWORD *)&buf[8] >= *(_QWORD *)&buf[16])
      {
        v32 = (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3;
        if ((unint64_t)(v32 + 1) >> 61)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v33 = (uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 2;
        if (v33 <= v32 + 1)
          v33 = v32 + 1;
        if (*(_QWORD *)&buf[16] - *(_QWORD *)buf >= 0x7FFFFFFFFFFFFFF8uLL)
          v34 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v34 = v33;
        if (v34)
          v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&buf[16], v34);
        else
          v35 = 0;
        v36 = (CVPixelBufferRef *)&v35[8 * v32];
        *v36 = v29;
        v31 = v36 + 1;
        v38 = *(char **)buf;
        v37 = *(char **)&buf[8];
        if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
        {
          do
          {
            v39 = (__CVBuffer *)*((_QWORD *)v37 - 1);
            v37 -= 8;
            *--v36 = v39;
          }
          while (v37 != v38);
          v37 = *(char **)buf;
        }
        *(_QWORD *)buf = v36;
        *(_QWORD *)&buf[8] = v31;
        *(_QWORD *)&buf[16] = &v35[8 * v34];
        if (v37)
          operator delete(v37);
      }
      else
      {
        **(_QWORD **)&buf[8] = v28;
        v31 = (_QWORD *)(v30 + 8);
      }
      *(_QWORD *)&buf[8] = v31;

      ++v24;
    }
    -[ABPK2DDetection _createResultDataFromImageDataForNeuralNetwork:originalImageData:outputPixelBuffer:numberOfOutputTensors:rotationOfResultTensor:](self, "_createResultDataFromImageDataForNeuralNetwork:originalImageData:outputPixelBuffer:numberOfOutputTensors:rotationOfResultTensor:", v81, v82);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }

    goto LABEL_44;
  }
  CVPixelBufferLockBaseAddress(v11, 0);
  v43 = 0;
  __p = 0;
  v84 = 0;
  v85 = 0;
  while (v43 < -[NSArray count](self->_outputTensorNames, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputTensorNames, "objectAtIndexedSubscript:", v43);
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v44, "UTF8String");
    espresso_network_query_blob_dimensions();

    v45 = *(_QWORD *)buf;
    v46 = *(_OWORD *)&buf[8];
    v47 = -[ABPK2DDetection useEspressoZeroCopyOutput](self, "useEspressoZeroCopyOutput");
    v48 = (double)(unint64_t)(*((_QWORD *)&v46 + 1) * v46);
    v49 = (double)v45;
    v50 = &self->_espressoOutputBufferPools.__begin_[v43];
    if (v47)
    {
      v51 = ABPKCreateCVPixelBufferFromPoolWithZeroCopyOption(v50, 1278226536, self, CFSTR("Espresso Output"), 1, v49, v48);
      v52 = v51;
      if (v84 >= v85)
      {
        v57 = (v84 - __p) >> 3;
        if ((unint64_t)(v57 + 1) >> 61)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v58 = (v85 - __p) >> 2;
        if (v58 <= v57 + 1)
          v58 = v57 + 1;
        if ((unint64_t)(v85 - __p) >= 0x7FFFFFFFFFFFFFF8)
          v59 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v59 = v58;
        if (v59)
          v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v85, v59);
        else
          v60 = 0;
        v65 = (CVPixelBufferRef *)&v60[8 * v57];
        *v65 = v52;
        v53 = (char *)(v65 + 1);
        v66 = v84;
        if (v84 != __p)
        {
          do
          {
            v67 = (__CVBuffer *)*((_QWORD *)v66 - 1);
            v66 -= 8;
            *--v65 = v67;
          }
          while (v66 != __p);
          v66 = __p;
        }
        __p = (char *)v65;
        v85 = &v60[8 * v59];
        if (v66)
          operator delete(v66);
      }
      else
      {
        *(_QWORD *)v84 = v51;
        v53 = v84 + 8;
      }
      v84 = v53;
      -[NSArray objectAtIndexedSubscript:](self->_outputTensorNames, "objectAtIndexedSubscript:", v43);
      v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v68, "UTF8String");
      espresso_network_bind_direct_cvpixelbuffer();
    }
    else
    {
      v54 = ABPKCreateCVPixelBufferFromPoolWithZeroCopyOption(v50, 1278226536, self, CFSTR("Espresso Output"), 0, v49, v48);
      v55 = v54;
      if (v84 >= v85)
      {
        v61 = (v84 - __p) >> 3;
        if ((unint64_t)(v61 + 1) >> 61)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v62 = (v85 - __p) >> 2;
        if (v62 <= v61 + 1)
          v62 = v61 + 1;
        if ((unint64_t)(v85 - __p) >= 0x7FFFFFFFFFFFFFF8)
          v63 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v63 = v62;
        if (v63)
          v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v85, v63);
        else
          v64 = 0;
        v69 = (CVPixelBufferRef *)&v64[8 * v61];
        *v69 = v55;
        v56 = (char *)(v69 + 1);
        v70 = v84;
        if (v84 != __p)
        {
          do
          {
            v71 = (__CVBuffer *)*((_QWORD *)v70 - 1);
            v70 -= 8;
            *--v69 = v71;
          }
          while (v70 != __p);
          v70 = __p;
        }
        __p = (char *)v69;
        v85 = &v64[8 * v63];
        if (v70)
          operator delete(v70);
      }
      else
      {
        *(_QWORD *)v84 = v54;
        v56 = v84 + 8;
      }
      v84 = v56;
      -[NSArray objectAtIndexedSubscript:](self->_outputTensorNames, "objectAtIndexedSubscript:", v43);
      v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v68, "UTF8String");
      espresso_network_bind_cvpixelbuffer();
    }

    ++v43;
  }
  -[NSArray objectAtIndexedSubscript:](self->_inputTensorNames, "objectAtIndexedSubscript:", 0);
  v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v72, "UTF8String");
  v73 = espresso_network_bind_direct_cvpixelbuffer() == 0;

  if (!v73)
  {
    __ABPKLogSharedInstance();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v78, OS_LOG_TYPE_ERROR, " Could not direct bind input image as CVPixelBuffer ", buf, 2u);
    }
LABEL_105:

    -[ABPK2DDetection createException:forNetwork:](self, "createException:forNetwork:", self->_plan, self->_netSubPath);
    v79 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v79);
  }
  if (espresso_plan_execute_sync())
  {
    __ABPKLogSharedInstance();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v78, OS_LOG_TYPE_ERROR, " Could not execute plan ", buf, 2u);
    }
    goto LABEL_105;
  }
  CVPixelBufferUnlockBaseAddress(v11, 0);
  for (i = 0; i < -[NSArray count](self->_outputTensorNames, "count"); ++i)
    self->_outputBuffers.__begin_[i] = CVPixelBufferRetain(*(CVPixelBufferRef *)&__p[8 * i]);
  -[ABPK2DDetection _createResultDataFromImageDataForNeuralNetwork:originalImageData:outputPixelBuffer:numberOfOutputTensors:rotationOfResultTensor:](self, "_createResultDataFromImageDataForNeuralNetwork:originalImageData:outputPixelBuffer:numberOfOutputTensors:rotationOfResultTensor:", v81, v82);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ABPK2DDetection useEspressoZeroCopyOutput](self, "useEspressoZeroCopyOutput"))
  {
    for (j = 0; j < -[NSArray count](self->_outputTensorNames, "count"); ++j)
      CVPixelBufferRelease(*(CVPixelBufferRef *)&__p[8 * j]);
  }
  if (__p)
    operator delete(__p);
LABEL_44:

  return v41;
}

- (id)runWithMLImage:(id)a3 originalImage:(id)a4 abpkOrientation:(int64_t)a5 atTimestamp:(double)a6 rotationOfResultTensor:(int64_t)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  -[ABPK2DDetection _startEvaluateBodyPoseForImageSignpostWithTimestamp:](self, "_startEvaluateBodyPoseForImageSignpostWithTimestamp:", a6);
  CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v12, "pixelBuffer"));
  __ABPKLogSharedInstance();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134217984;
    v18 = a6;
    _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_DEBUG, " %f ABPK2DDetection: runWithImage ", (uint8_t *)&v17, 0xCu);
  }

  -[ABPK2DDetection runWithImageDataForNeuralNetwork:originalImageData:abpkOrientation:atTimestamp:rotationOfResultTensor:](self, "runWithImageDataForNeuralNetwork:originalImageData:abpkOrientation:atTimestamp:rotationOfResultTensor:", v12, v13, a5, a7, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABPK2DDetection _endEvaluateBodyPoseForImageSignpostWithTimestamp:](self, "_endEvaluateBodyPoseForImageSignpostWithTimestamp:", a6);
  CVPixelBufferRelease((CVPixelBufferRef)objc_msgSend(v12, "pixelBuffer"));

  return v15;
}

- (id)runWithImage:(__CVBuffer *)a3 abpkOrientation:(int64_t)a4 atTimestamp:(double)a5 rotationOfResultTensor:(int64_t)a6
{
  NSObject *v11;
  ABPKMLImageData *v12;
  void *v13;
  uint8_t v15[16];

  -[ABPK2DDetection _startEvaluateBodyPoseForImageSignpostWithTimestamp:](self, "_startEvaluateBodyPoseForImageSignpostWithTimestamp:");
  __ABPKLogSharedInstance();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEBUG, " ABPK2DDetection: runWithImage ", v15, 2u);
  }

  v12 = -[ABPKMLImageData initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:]([ABPKMLImageData alloc], "initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:", a3, a4, 0, a5);
  -[ABPK2DDetection runWithImageDataForNeuralNetwork:originalImageData:abpkOrientation:atTimestamp:rotationOfResultTensor:](self, "runWithImageDataForNeuralNetwork:originalImageData:abpkOrientation:atTimestamp:rotationOfResultTensor:", v12, 0, a4, a6, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABPK2DDetection _endEvaluateBodyPoseForImageSignpostWithTimestamp:](self, "_endEvaluateBodyPoseForImageSignpostWithTimestamp:", a5);

  return v13;
}

- (void)changeEspressoConfig:(id)a3
{
  NSString *v4;
  NSString *previous_network_configuration;
  NSObject *v6;
  NSString *v7;
  uint64_t v8;
  NSArray *inputTensorNames;
  NSArray *outputTensorNames;
  NSString *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  previous_network_configuration = self->_previous_network_configuration;
  if (previous_network_configuration != v4
    && !-[NSString isEqualToString:](previous_network_configuration, "isEqualToString:", v4))
  {
    if (self->_useEspressoV2)
    {
      -[ABPKMLNetworkV2 changeNetWorkConfig:](self->_networkV2, "changeNetWorkConfig:", v4);
      goto LABEL_10;
    }
    -[ABPK2DDetection _startLoadingMLModelSignpost](self, "_startLoadingMLModelSignpost");
    __ABPKLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " \t Changing network config to: %@ ", buf, 0xCu);
    }

    espresso_plan_build_clean();
    v7 = objc_retainAutorelease(v4);
    -[NSString UTF8String](v7, "UTF8String");
    if (espresso_network_select_configuration())
    {
      __ABPKLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      v13 = " Could not select network configuration: %@ ";
      v14 = v12;
      v15 = 12;
    }
    else
    {
      if (!espresso_plan_build())
      {
        -[ABPK2DDetection _bindOutputTensor](self, "_bindOutputTensor");
        v8 = MEMORY[0x24BDAC760];
        inputTensorNames = self->_inputTensorNames;
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __40__ABPK2DDetection_changeEspressoConfig___block_invoke;
        v18[3] = &unk_24CA6E8C8;
        v18[4] = self;
        -[NSArray enumerateObjectsUsingBlock:](inputTensorNames, "enumerateObjectsUsingBlock:", v18);
        outputTensorNames = self->_outputTensorNames;
        v17[0] = v8;
        v17[1] = 3221225472;
        v17[2] = __40__ABPK2DDetection_changeEspressoConfig___block_invoke_22;
        v17[3] = &unk_24CA6E8C8;
        v17[4] = self;
        -[NSArray enumerateObjectsUsingBlock:](outputTensorNames, "enumerateObjectsUsingBlock:", v17);
        -[ABPK2DDetection _endLoadingMLModelSignpost](self, "_endLoadingMLModelSignpost");
        goto LABEL_10;
      }
      __ABPKLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_16:

        -[ABPK2DDetection createException:forNetwork:](self, "createException:forNetwork:", self->_plan, self->_netSubPath);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v16);
      }
      *(_WORD *)buf = 0;
      v13 = " Could not build plan ";
      v14 = v12;
      v15 = 2;
    }
    _os_log_impl(&dword_210836000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_16;
  }
LABEL_10:
  v11 = self->_previous_network_configuration;
  self->_previous_network_configuration = v4;

}

void __40__ABPK2DDetection_changeEspressoConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    __ABPKLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Could not obtain dimension for input tensor: %@ ", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "createException:forNetwork:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  __ABPKLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138413314;
    v8 = v3;
    v9 = 2048;
    v10 = v17;
    v11 = 2048;
    v12 = *((_QWORD *)&v17 + 1);
    v13 = 2048;
    v14 = v18;
    v15 = 2048;
    v16 = *((_QWORD *)&v18 + 1);
    _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " \t Tensor %@ dimensions %zu %zu %zu %zu ", (uint8_t *)&v7, 0x34u);
  }

}

void __40__ABPK2DDetection_changeEspressoConfig___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v3 = objc_retainAutorelease(a2);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    __ABPKLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_ERROR, " Could not obtain dimension for output tensor: %@ ", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "createException:forNetwork:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  __ABPKLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138413314;
    v8 = v3;
    v9 = 2048;
    v10 = v17;
    v11 = 2048;
    v12 = *((_QWORD *)&v17 + 1);
    v13 = 2048;
    v14 = v18;
    v15 = 2048;
    v16 = *((_QWORD *)&v18 + 1);
    _os_log_impl(&dword_210836000, v4, OS_LOG_TYPE_DEBUG, " \t Tensor %@ dimensions %zu %zu %zu %zu ", (uint8_t *)&v7, 0x34u);
  }

}

- (id)_createResultDataFromImageDataForNeuralNetwork:(id)a3 originalImageData:(id)a4 outputPixelBuffer:(__CVBuffer *)a5 numberOfOutputTensors:(unint64_t)a6 rotationOfResultTensor:(int64_t)a7
{
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  ABPKMLModelConfiguration2D *mlConfig;
  int v16;
  int v17;
  int Width;
  int Height;
  int64_t v20;
  int v21;
  int v22;
  NSObject *v23;
  ABPK2DSkeletonRawEspressoResult *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  ABPK2DSkeletonRawEspressoResult *v29;
  int v30;
  int v31;
  int v32;
  NSObject *v33;
  ABPK2DSkeletonRawEspressoResult *v34;
  double v35;
  double v36;
  id v38;
  uint8_t v39[16];
  uint8_t v40[16];
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " ABPK2DDetection: Create result data ", buf, 2u);
  }

  v14 = -[ABPKMLModelConfiguration2D networkEstimatesAffinityMaps](self->_mlConfig, "networkEstimatesAffinityMaps");
  mlConfig = self->_mlConfig;
  if (v14)
  {
    v38 = v11;
    v16 = -[ABPKMLModelConfiguration2D heatMapChannels](mlConfig, "heatMapChannels");
    v17 = -[ABPKMLModelConfiguration2D affinityMapChannels](self->_mlConfig, "affinityMapChannels");
    Width = CVPixelBufferGetWidth(*a5);
    Height = CVPixelBufferGetHeight(*a5);
    v20 = a7;
    v21 = CVPixelBufferGetWidth(a5[1]);
    v22 = CVPixelBufferGetHeight(a5[1]);
    __ABPKLogSharedInstance();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_210836000, v23, OS_LOG_TYPE_DEBUG, " \t Creating AR2DSkeletonRawEspressoResult with heatmap and affinitymap ", v40, 2u);
    }

    v24 = [ABPK2DSkeletonRawEspressoResult alloc];
    LODWORD(v25) = Width;
    LODWORD(v26) = 1;
    LODWORD(v27) = v21;
    HIDWORD(v25) = Height / v16;
    LODWORD(v28) = 1;
    HIDWORD(v28) = Width;
    HIDWORD(v27) = v22 / v17;
    HIDWORD(v26) = v21;
    v29 = -[ABPK2DSkeletonRawEspressoResult initWithMLImage:originalImageData:heatMapBuffer:heatMapShape:heatMapStrides:affinityMapBuffer:affinityMapShape:affinityMapStrides:rotationNeeded:](v24, "initWithMLImage:originalImageData:heatMapBuffer:heatMapShape:heatMapStrides:affinityMapBuffer:affinityMapShape:affinityMapStrides:rotationNeeded:", v38, v12, *a5, a5[1], v20, v25, v28, v27, v26);
    v11 = v38;
  }
  else
  {
    v30 = -[ABPKMLModelConfiguration2D heatMapChannels](mlConfig, "heatMapChannels");
    v31 = CVPixelBufferGetWidth(*a5);
    v32 = CVPixelBufferGetHeight(*a5);
    __ABPKLogSharedInstance();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_210836000, v33, OS_LOG_TYPE_DEBUG, " \t Creating AR2DSkeletonRawEspressoResult with heatmap only ", v39, 2u);
    }

    v34 = [ABPK2DSkeletonRawEspressoResult alloc];
    LODWORD(v35) = v31;
    LODWORD(v36) = 1;
    HIDWORD(v35) = v32 / v30;
    HIDWORD(v36) = v31;
    v29 = -[ABPK2DSkeletonRawEspressoResult initWithMLImage:originalImageData:heatMapBuffer:heatMapShape:heatMapStrides:rotationNeeded:](v34, "initWithMLImage:originalImageData:heatMapBuffer:heatMapShape:heatMapStrides:rotationNeeded:", v11, v12, *a5, a7, v35, v36);
  }

  return v29;
}

- (void)dealloc
{
  __CVPixelBufferPool **begin;
  __CVPixelBufferPool **end;
  objc_super v5;

  espresso_plan_destroy();
  espresso_context_destroy();
  begin = self->_espressoOutputBufferPools.__begin_;
  end = self->_espressoOutputBufferPools.__end_;
  while (begin != end)
  {
    if (*begin)
      CVPixelBufferPoolRelease(*begin);
    ++begin;
  }
  v5.receiver = self;
  v5.super_class = (Class)ABPK2DDetection;
  -[ABPK2DDetection dealloc](&v5, sel_dealloc);
}

- (void)_startLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_endLoadingMLModelSignpost
{
  kdebug_trace();
}

- (void)_startEvaluateBodyPoseForImageSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endEvaluateBodyPoseForImageSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (BOOL)useEspressoZeroCopyOutput
{
  return self->_useEspressoZeroCopyOutput;
}

- (void)setUseEspressoZeroCopyOutput:(BOOL)a3
{
  self->_useEspressoZeroCopyOutput = a3;
}

- (void).cxx_destruct
{
  __CVPixelBufferPool **begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;
  __CVBuffer **v5;

  objc_storeStrong((id *)&self->_outputBufferDict, 0);
  objc_storeStrong((id *)&self->_inputBufferDict, 0);
  objc_storeStrong((id *)&self->_networkV2, 0);
  begin = self->_espressoOutputBufferPools.__begin_;
  if (begin)
  {
    self->_espressoOutputBufferPools.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_espressoOutputTensors.__begin_;
  if (v4)
  {
    self->_espressoOutputTensors.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_outputBuffers.__begin_;
  if (v5)
  {
    self->_outputBuffers.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_netPath, 0);
  objc_storeStrong((id *)&self->_netSubPath, 0);
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
  objc_storeStrong((id *)&self->_previous_network_configuration, 0);
  objc_storeStrong((id *)&self->_mlConfig, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 68) = 0;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *((_OWORD *)self + 31) = 0u;
  return self;
}

@end
