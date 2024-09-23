@implementation AMDBaseRecoModel

- (AMDBaseRecoModel)initWithId:(id)a3
{
  AMDBaseRecoModel *v3;
  AMDBaseRecoModel *v5;
  objc_super v6;
  id location[2];
  AMDBaseRecoModel *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDBaseRecoModel;
  v8 = -[AMDBaseRecoModel init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  -[AMDBaseRecoModel setModelId:](v8, "setModelId:", location[0]);
  -[AMDBaseRecoModel setVersion:](v8, "setVersion:", -1);
  -[AMDBaseRecoModel setAssetCreationTimestamp:](v8, "setAssetCreationTimestamp:", 0);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (AMDBaseRecoModel)initWithId:(id)a3 andVersion:(unint64_t)a4
{
  AMDBaseRecoModel *v4;
  AMDBaseRecoModel *v7;
  objc_super v8;
  unint64_t v9;
  id location[2];
  AMDBaseRecoModel *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AMDBaseRecoModel;
  v11 = -[AMDBaseRecoModel init](&v8, sel_init);
  objc_storeStrong((id *)&v11, v11);
  -[AMDBaseRecoModel setModelId:](v11, "setModelId:", location[0]);
  -[AMDBaseRecoModel setVersion:](v11, "setVersion:", v9);
  -[AMDBaseRecoModel setAssetCreationTimestamp:](v11, "setAssetCreationTimestamp:", 0);
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)isValid
{
  MLModel *v2;
  BOOL v4;
  BOOL v5;
  AMDModelMetadata *v6;
  BOOL v7;
  char v8;
  AMDModelMetadata *v9;

  v6 = -[AMDBaseRecoModel modelMetadata](self, "modelMetadata");
  v8 = 0;
  v7 = 0;
  if (v6)
  {
    v9 = -[AMDBaseRecoModel modelMetadata](self, "modelMetadata");
    v8 = 1;
    v7 = -[AMDModelMetadata isValid](v9, "isValid");
  }
  if ((v8 & 1) != 0)

  v2 = -[AMDBaseRecoModel model](self, "model");
  v4 = v2 != 0;

  v5 = 0;
  if (v4)
  {
    v5 = 0;
    if (v7)
      return -[AMDBaseRecoModel version](self, "version") != 0;
  }
  return v5;
}

- (id)getId
{
  return -[AMDBaseRecoModel modelId](self, "modelId", a2, self);
}

- (unint64_t)getVersion
{
  return -[AMDBaseRecoModel version](self, "version", a2, self);
}

- (int64_t)getAssetCreationTimestamp
{
  return -[AMDBaseRecoModel assetCreationTimestamp](self, "assetCreationTimestamp", a2, self);
}

- (id)getPredictions:(unint64_t)a3 andInputBuilder:(id)a4 andOutputBuilder:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id location[4];

  location[3] = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = 0;
  objc_storeStrong(&v11, a6);
  *a7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 24, CFSTR("Programmer error"));
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return 0;
}

+ (id)getModelforId:(id)a3 useMinimalMap:(id)a4 error:(id *)a5
{
  double v5;
  BOOL v6;
  id v8;
  id v9;
  id v10;
  AMDModelAssets *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AMDModelMetadata *v17;
  BOOL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  id v25;
  os_log_t v28;
  char v29;
  os_log_type_t v30;
  os_log_t v31;
  char v32;
  id v33;
  os_log_type_t v34;
  os_log_t v35;
  id v36;
  id v37;
  id v38;
  os_log_type_t v39;
  os_log_t oslog;
  id v41;
  id v42;
  id v43;
  os_log_type_t v44;
  id v45;
  id v46;
  os_log_type_t v47;
  id v48;
  id v49;
  id v50[2];
  uint64_t v51;
  unint64_t v52;
  os_log_type_t type;
  id v54;
  id v55;
  id v56;
  int v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id *v63;
  id v64;
  id location[3];
  id v66;
  uint8_t v67[32];
  uint8_t v68[32];
  uint8_t v69[16];
  uint8_t v70[32];
  uint8_t v71[16];
  uint8_t v72[32];
  uint8_t v73[24];
  _QWORD v74[2];
  _QWORD v75[3];

  v75[2] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = 0;
  objc_storeStrong(&v64, a4);
  v63 = a5;
  v62 = +[AMDModel getModelInfo:error:](AMDModel, "getModelInfo:error:", location[0], a5);
  v61 = (id)objc_msgSend(v62, "objectForKey:", 0x1EA4C2A68);
  v60 = (id)objc_msgSend(v62, "objectForKey:", 0x1EA4BDFC8);
  v59 = (id)objc_msgSend(v62, "objectForKey:", 0x1EA4B7368);
  v58 = (id)objc_msgSend(v62, "objectForKey:", 0x1EA4BB0A8);
  if (*a5)
  {
    v66 = 0;
    v57 = 1;
  }
  else
  {
    v74[0] = 0x1EA4B7368;
    v75[0] = v59;
    v74[1] = 0x1EA4B8F88;
    v75[1] = location[0];
    v56 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v56, CFSTR("inferenceModelInfo"), 0);
    if (v62)
    {
      v23 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
      objc_msgSend(v23, "timeIntervalSince1970");
      v24 = (unint64_t)v5;

      v52 = v24;
      v51 = objc_msgSend(v61, "longLongValue");
      v50[1] = (id)(v24 - v51);
      v50[0] = (id)objc_msgSend(location[0], "stringByAppendingString:", CFSTR("_modelAge"));
      v25 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24 - v51);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

      +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("InferenceLoadModelAndMetadata"));
      v49 = (id)objc_msgSend(v58, "stringByAppendingPathComponent:", v60);
      v48 = MEMORY[0x1E0C81028];
      v47 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v72, (uint64_t)location[0], (uint64_t)v58, (uint64_t)v49);
        _os_log_impl(&dword_1DC678000, (os_log_t)v48, v47, "Loading model, modelId: %@, dir: %@, path: %@", v72, 0x20u);
      }
      objc_storeStrong(&v48, 0);
      if (v49)
      {
        v43 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v49, 1);
        v42 = objc_alloc_init(MEMORY[0x1E0C9E958]);
        objc_msgSend(v42, "setComputeUnits:", 0);
        v41 = -[AMDClassifierRecoModel initWithId:andVersion:]([AMDClassifierRecoModel alloc], "initWithId:andVersion:", location[0], objc_msgSend(v59, "longLongValue"));
        v22 = (id)objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v43, v42, v63);
        objc_msgSend(v41, "setModel:");

        if (*v63)
        {
          oslog = (os_log_t)MEMORY[0x1E0C81028];
          v39 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            v21 = (id)objc_msgSend(v43, "path");
            v20 = (id)objc_msgSend(*v63, "localizedDescription");
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v70, (uint64_t)v21, (uint64_t)v20);
            _os_log_error_impl(&dword_1DC678000, oslog, v39, "Error loading model from %@: %@", v70, 0x16u);

          }
          objc_storeStrong((id *)&oslog, 0);
          v66 = 0;
          v57 = 1;
        }
        else
        {
          v19 = (id)objc_msgSend(v58, "stringByAppendingPathComponent:", CFSTR("model_metadata"));
          v38 = (id)objc_msgSend(v19, "stringByAppendingPathExtension:", CFSTR("json"));

          v37 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v38);
          if (v37)
          {
            v17 = -[AMDModelMetadata initWithMetadataJSON:error:]([AMDModelMetadata alloc], "initWithMetadataJSON:error:", v37, v63);
            objc_msgSend(v41, "setModelMetadata:");

            v6 = *v63 != 0;
            v32 = 0;
            v18 = 1;
            if (!v6)
            {
              v33 = (id)objc_msgSend(v41, "modelMetadata");
              v32 = 1;
              v18 = v33 == 0;
            }
            if ((v32 & 1) != 0)

            if (v18)
            {
              v31 = (os_log_t)MEMORY[0x1E0C81028];
              v30 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v15 = v58;
                v16 = (id)objc_msgSend(*v63, "localizedDescription");
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v68, (uint64_t)v15, (uint64_t)v16);
                _os_log_error_impl(&dword_1DC678000, v31, v30, "error while loading metadata from %@: %@", v68, 0x16u);

              }
              objc_storeStrong((id *)&v31, 0);
              v66 = 0;
              v57 = 1;
            }
            else
            {
              +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("InferenceLoadAssets"));
              v29 = 0;
              if (v64)
                v29 = objc_msgSend(v64, "BOOLValue") & 1;
              v11 = [AMDModelAssets alloc];
              v10 = v58;
              v14 = (id)objc_msgSend(v41, "modelMetadata");
              v13 = (id)objc_msgSend(v14, "getAssetsMetadata");
              v12 = -[AMDModelAssets initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:](v11, "initFromDir:andMetadata:useBinaryInputMap:useBinaryOutputMap:withModelId:isInference:error:", v10, v63);
              objc_msgSend(v41, "setModelAssets:");

              if (*v63)
              {
                v28 = (os_log_t)MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  v8 = v58;
                  v9 = (id)objc_msgSend(*v63, "localizedDescription");
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v67, (uint64_t)v8, (uint64_t)v9);
                  _os_log_error_impl(&dword_1DC678000, v28, OS_LOG_TYPE_ERROR, "Error loading assets from %@: %@", v67, 0x16u);

                }
                objc_storeStrong((id *)&v28, 0);
                v66 = 0;
                v57 = 1;
              }
              else
              {
                +[AMDPerf sampleForKey:](AMDPerf, "sampleForKey:", CFSTR("InferencLoadedAssets"));
                v66 = v41;
                v57 = 1;
              }
            }
          }
          else
          {
            v36 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No metadata for modelId '%@'!"), location[0]);
            v35 = (os_log_t)MEMORY[0x1E0C81028];
            v34 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v36);
              _os_log_error_impl(&dword_1DC678000, v35, v34, "%@", v69, 0xCu);
            }
            objc_storeStrong((id *)&v35, 0);
            *v63 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v36);
            v66 = 0;
            v57 = 1;
            objc_storeStrong(&v36, 0);
          }
          objc_storeStrong(&v37, 0);
          objc_storeStrong(&v38, 0);
        }
        objc_storeStrong(&v41, 0);
        objc_storeStrong(&v42, 0);
        objc_storeStrong(&v43, 0);
      }
      else
      {
        v46 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model path for modelId '%@' is nil!"), location[0]);
        v45 = MEMORY[0x1E0C81028];
        v44 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v46);
          _os_log_error_impl(&dword_1DC678000, (os_log_t)v45, v44, "%@", v71, 0xCu);
        }
        objc_storeStrong(&v45, 0);
        *v63 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v46);
        v66 = 0;
        v57 = 1;
        objc_storeStrong(&v46, 0);
      }
      objc_storeStrong(&v49, 0);
      objc_storeStrong(v50, 0);
    }
    else
    {
      v55 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No model found for modelId '%@'"), location[0]);
      v54 = MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v55);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v54, type, "%@", v73, 0xCu);
      }
      objc_storeStrong(&v54, 0);
      *v63 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 16, v55);
      v66 = 0;
      v57 = 1;
      objc_storeStrong(&v55, 0);
    }
    objc_storeStrong(&v56, 0);
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
  return v66;
}

+ (id)getCurrentDirURLForName:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_msgSend(v11, "URLsForDirectory:inDomains:", 14, 1);
  v10 = (id)objc_msgSend(v4, "lastObject");

  v9 = (id)objc_msgSend(v10, "URLByAppendingPathComponent:", 0x1EA4BD648);
  v8 = (id)objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("models"));
  v7 = (id)objc_msgSend(v8, "URLByAppendingPathComponent:", location[0]);
  v6 = (id)objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("current"));
  v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)loadModelMetadataFromDir:(id)a3 error:(id *)a4
{
  id v4;
  AMDModelMetadata *v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id location[2];
  AMDBaseRecoModel *v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v8 = (id)objc_msgSend(location[0], "URLByAppendingPathComponent:", CFSTR("model_metadata"));
  v7 = (id)objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("json"));
  v12 = (id)objc_msgSend(v7, "path");

  v11 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v12);
  if (v11)
  {
    v5 = -[AMDModelMetadata initWithMetadataJSON:error:]([AMDModelMetadata alloc], "initWithMetadataJSON:error:", v11, v13);
    -[AMDBaseRecoModel setModelMetadata:](v15, "setModelMetadata:");

  }
  else
  {
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model metadata could not be loaded from directory %@"), location[0]);
    v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)v10);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%@", v16, 0xCu);
    }
    objc_storeStrong(&v9, 0);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v10);
    *v13 = v4;
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)parseModelInfoFromBuffer:(id)a3 error:(id *)a4
{
  __int16 v4;
  uint64_t v5;
  NSObject *log;
  os_log_type_t v8;
  uint8_t v10[7];
  os_log_type_t type;
  os_log_t oslog;
  int v13;
  id *v14;
  id location[2];
  AMDBaseRecoModel *v16;
  char v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  v4 = objc_msgSend(location[0], "getShortWithError:", a4);
  -[AMDBaseRecoModel setVersion:](v16, "setVersion:", v4);
  if (a4 && *v14)
  {
    v17 = 0;
    v13 = 1;
  }
  else
  {
    v5 = objc_msgSend(location[0], "getLongWithError:", v14);
    -[AMDBaseRecoModel setAssetCreationTimestamp:](v16, "setAssetCreationTimestamp:", v5);
    if (v14 && *v14)
    {
      v17 = 0;
      v13 = 1;
    }
    else if (-[AMDBaseRecoModel version](v16, "version")
           && -[AMDBaseRecoModel assetCreationTimestamp](v16, "assetCreationTimestamp") > 0)
    {
      v17 = 1;
      v13 = 1;
    }
    else
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        v8 = type;
        __os_log_helper_16_0_0(v10);
        _os_log_error_impl(&dword_1DC678000, log, v8, "invalid value for version/timestamp", v10, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v17 = 0;
      v13 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (MLModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (AMDModelMetadata)modelMetadata
{
  return self->_modelMetadata;
}

- (void)setModelMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_modelMetadata, a3);
}

- (AMDModelAssets)modelAssets
{
  return self->_modelAssets;
}

- (void)setModelAssets:(id)a3
{
  objc_storeStrong((id *)&self->_modelAssets, a3);
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
  objc_storeStrong((id *)&self->_modelId, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (int64_t)assetCreationTimestamp
{
  return self->_assetCreationTimestamp;
}

- (void)setAssetCreationTimestamp:(int64_t)a3
{
  self->_assetCreationTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_modelAssets, 0);
  objc_storeStrong((id *)&self->_modelMetadata, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
