@implementation AMDModelMetadata

- (AMDModelMetadata)initWithMetadataJSON:(id)a3 error:(id *)a4
{
  id v4;
  AMDModelOutputMetadata *v5;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  AMDModelAssetsMetadata *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  os_log_t v34;
  os_log_type_t v35;
  os_log_t oslog;
  id v37;
  id v38;
  _QWORD v39[8];
  uint64_t v40;
  id v41;
  os_log_type_t v42;
  id v43;
  id v44;
  id v45;
  _QWORD __b[8];
  uint64_t v47;
  id v48;
  id v49;
  os_log_type_t type;
  id v51;
  __CFString *v52;
  int v53;
  id v54[2];
  objc_super v55;
  id *v56;
  id location[2];
  id v58;
  AMDModelMetadata *v59;
  uint8_t v60[32];
  uint8_t v61[32];
  _BYTE v62[128];
  uint8_t v63[32];
  _BYTE v64[128];
  uint8_t v65[24];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = a4;
  v4 = v58;
  v58 = 0;
  v55.receiver = v4;
  v55.super_class = (Class)AMDModelMetadata;
  v58 = -[AMDModelMetadata init](&v55, sel_init);
  objc_storeStrong(&v58, v58);
  objc_msgSend(v58, "setModelArchType:", 0);
  v54[1] = (id)4;
  v54[0] = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", location[0], 4, v56);
  if (*v56)
  {
    v59 = 0;
    v53 = 1;
  }
  else if (v54[0])
  {
    v29 = (id)objc_msgSend(v54[0], "objectForKey:", CFSTR("model_id"));
    objc_msgSend(v58, "setModelId:");

    v30 = (id)objc_msgSend(v54[0], "objectForKey:", CFSTR("model_uid"));
    objc_msgSend(v58, "setModelUid:");

    v31 = (id)objc_msgSend(v54[0], "objectForKey:", CFSTR("arch_type"));
    objc_msgSend(v58, "setModelArchType:", (char)objc_msgSend(v31, "unsignedCharValue"));

    v32 = (id)objc_msgSend(v54[0], "objectForKey:", CFSTR("mapping_files_required"));
    objc_msgSend(v58, "setMappingFilesRequired:");

    v49 = (id)objc_msgSend(v54[0], "objectForKey:", CFSTR("assets"));
    if (v49)
    {
      v28 = -[AMDModelAssetsMetadata initWithDictionary:]([AMDModelAssetsMetadata alloc], "initWithDictionary:", v49);
      objc_msgSend(v58, "setAssetsMetadata:");

    }
    v48 = (id)objc_msgSend(v54[0], "objectForKey:", CFSTR("model_inputs"));
    if (v48)
    {
      v25 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
      objc_msgSend(v58, "setInputsMetadata:");

      memset(__b, 0, sizeof(__b));
      v26 = v48;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
      if (v27)
      {
        v22 = *(_QWORD *)__b[2];
        v23 = 0;
        v24 = v27;
        while (1)
        {
          v21 = v23;
          if (*(_QWORD *)__b[2] != v22)
            objc_enumerationMutation(v26);
          v47 = *(_QWORD *)(__b[1] + 8 * v23);
          v45 = (id)objc_msgSend(v48, "objectForKey:", v47);
          v44 = -[AMDModelInputMetadata initWithDictionary:]([AMDModelInputMetadata alloc], "initWithDictionary:", v45);
          if ((objc_msgSend(v44, "isValid") & 1) != 0)
          {
            v20 = (id)objc_msgSend(v58, "inputsMetadata");
            objc_msgSend(v20, "setObject:forKey:", v44, v47);

          }
          else
          {
            v43 = MEMORY[0x1E0C81028];
            v42 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
            {
              v19 = v43;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v63, (uint64_t)v45, v47);
              _os_log_error_impl(&dword_1DC678000, v19, v42, "invalid input metadata in %@ for %@", v63, 0x16u);
            }
            objc_storeStrong(&v43, 0);
          }
          objc_storeStrong(&v44, 0);
          objc_storeStrong(&v45, 0);
          ++v23;
          if (v21 + 1 >= v24)
          {
            v23 = 0;
            v24 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v64, 16);
            if (!v24)
              break;
          }
        }
      }

    }
    v41 = (id)objc_msgSend(v54[0], "objectForKey:", CFSTR("model_outputs"));
    if (v41)
    {
      v16 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      objc_msgSend(v58, "setOutputsMetadata:");

      memset(v39, 0, sizeof(v39));
      v17 = v41;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v39, v62, 16);
      if (v18)
      {
        v13 = *(_QWORD *)v39[2];
        v14 = 0;
        v15 = v18;
        while (1)
        {
          v12 = v14;
          if (*(_QWORD *)v39[2] != v13)
            objc_enumerationMutation(v17);
          v40 = *(_QWORD *)(v39[1] + 8 * v14);
          v38 = (id)objc_msgSend(v41, "objectForKey:", v40);
          v5 = [AMDModelOutputMetadata alloc];
          v37 = -[AMDModelOutputMetadata initWithDictionary:](v5, "initWithDictionary:", v38);
          if ((objc_msgSend(v37, "isValid") & 1) != 0)
          {
            v11 = (id)objc_msgSend(v58, "outputsMetadata");
            objc_msgSend(v11, "setObject:forKey:", v37, v40);

          }
          else
          {
            oslog = (os_log_t)MEMORY[0x1E0C81028];
            v35 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              v10 = oslog;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v61, (uint64_t)v38, v40);
              _os_log_error_impl(&dword_1DC678000, v10, v35, "invalid output metadata in %@ for %@", v61, 0x16u);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          objc_storeStrong(&v37, 0);
          objc_storeStrong(&v38, 0);
          ++v14;
          if (v12 + 1 >= v15)
          {
            v14 = 0;
            v15 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v39, v62, 16);
            if (!v15)
              break;
          }
        }
      }

    }
    v34 = (os_log_t)MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v9 = (id)objc_msgSend(v58, "inputsMetadata");
      v7 = objc_msgSend(v9, "count");
      v8 = (id)objc_msgSend(v58, "outputsMetadata");
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v60, v7, objc_msgSend(v8, "count"));
      _os_log_debug_impl(&dword_1DC678000, v34, OS_LOG_TYPE_DEBUG, "From JSON metadata: %lu inputs, %lu outputs", v60, 0x16u);

    }
    objc_storeStrong((id *)&v34, 0);
    v59 = (AMDModelMetadata *)v58;
    v53 = 1;
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v49, 0);
  }
  else
  {
    v52 = CFSTR("Model Metadata json could not be deserialized");
    v51 = MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v65, (uint64_t)v52);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v51, type, "%@", v65, 0xCu);
    }
    objc_storeStrong(&v51, 0);
    *v56 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 15, v52);
    v59 = 0;
    v53 = 1;
    objc_storeStrong((id *)&v52, 0);
  }
  objc_storeStrong(v54, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v58, 0);
  return v59;
}

- (id)getAssetsMetadata
{
  return -[AMDModelMetadata assetsMetadata](self, "assetsMetadata", a2, self);
}

- (id)getInputsMetadata
{
  return -[AMDModelMetadata inputsMetadata](self, "inputsMetadata", a2, self);
}

- (id)getOutputsMetadata
{
  return -[AMDModelMetadata outputsMetadata](self, "outputsMetadata", a2, self);
}

- (char)getModelArchType
{
  return -[AMDModelMetadata modelArchType](self, "modelArchType", a2, self);
}

- (id)getModelUid
{
  return -[AMDModelMetadata modelUid](self, "modelUid", a2, self);
}

- (id)getMappingFileRequirement
{
  return -[AMDModelMetadata mappingFilesRequired](self, "mappingFilesRequired", a2, self);
}

- (BOOL)isValid
{
  NSString *v2;
  BOOL v4;
  BOOL v5;
  AMDModelAssetsMetadata *v6;
  BOOL v7;
  NSMutableDictionary *v8;
  BOOL v9;
  NSMutableDictionary *v10;
  BOOL v11;
  BOOL v12;
  char v13;
  AMDModelAssetsMetadata *v14;
  char v15;
  NSMutableDictionary *v16;
  char v17;
  NSMutableDictionary *v18;

  v10 = -[AMDModelMetadata inputsMetadata](self, "inputsMetadata");
  v17 = 0;
  v11 = 0;
  if (v10)
  {
    v18 = -[AMDModelMetadata inputsMetadata](self, "inputsMetadata");
    v17 = 1;
    v11 = -[NSMutableDictionary count](v18, "count") != 0;
  }
  if ((v17 & 1) != 0)

  v8 = -[AMDModelMetadata outputsMetadata](self, "outputsMetadata");
  v15 = 0;
  v9 = 0;
  if (v8)
  {
    v16 = -[AMDModelMetadata outputsMetadata](self, "outputsMetadata");
    v15 = 1;
    v9 = -[NSMutableDictionary count](v16, "count") != 0;
  }
  if ((v15 & 1) != 0)

  v6 = -[AMDModelMetadata assetsMetadata](self, "assetsMetadata");
  v13 = 0;
  v7 = 0;
  if (v6)
  {
    v14 = -[AMDModelMetadata assetsMetadata](self, "assetsMetadata");
    v13 = 1;
    v7 = -[AMDModelAssetsMetadata isValid](v14, "isValid");
  }
  if ((v13 & 1) != 0)

  v12 = -[AMDModelMetadata modelArchType](self, "modelArchType") != 0;
  v2 = -[AMDModelMetadata modelUid](self, "modelUid");
  v4 = v2 != 0;

  v5 = 0;
  if (v11)
  {
    v5 = 0;
    if (v9)
    {
      v5 = 0;
      if (v7)
      {
        v5 = 0;
        if (v12)
          return v4;
      }
    }
  }
  return v5;
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
  objc_storeStrong((id *)&self->_modelId, a3);
}

- (NSString)modelUid
{
  return self->_modelUid;
}

- (void)setModelUid:(id)a3
{
  objc_storeStrong((id *)&self->_modelUid, a3);
}

- (char)modelArchType
{
  return self->_modelArchType;
}

- (void)setModelArchType:(char)a3
{
  self->_modelArchType = a3;
}

- (NSMutableDictionary)inputsMetadata
{
  return self->_inputsMetadata;
}

- (void)setInputsMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_inputsMetadata, a3);
}

- (NSMutableDictionary)outputsMetadata
{
  return self->_outputsMetadata;
}

- (void)setOutputsMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_outputsMetadata, a3);
}

- (AMDModelAssetsMetadata)assetsMetadata
{
  return self->_assetsMetadata;
}

- (void)setAssetsMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_assetsMetadata, a3);
}

- (NSNumber)mappingFilesRequired
{
  return self->_mappingFilesRequired;
}

- (void)setMappingFilesRequired:(id)a3
{
  objc_storeStrong((id *)&self->_mappingFilesRequired, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingFilesRequired, 0);
  objc_storeStrong((id *)&self->_assetsMetadata, 0);
  objc_storeStrong((id *)&self->_outputsMetadata, 0);
  objc_storeStrong((id *)&self->_inputsMetadata, 0);
  objc_storeStrong((id *)&self->_modelUid, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
}

@end
