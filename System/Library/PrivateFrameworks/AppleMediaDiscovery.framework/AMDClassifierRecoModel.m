@implementation AMDClassifierRecoModel

- (AMDClassifierRecoModel)initWithId:(id)a3 andVersion:(unint64_t)a4
{
  AMDClassifierRecoModel *v4;
  AMDClassifierRecoModel *v7;
  objc_super v8;
  unint64_t v9;
  id location[2];
  AMDClassifierRecoModel *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AMDClassifierRecoModel;
  v11 = -[AMDBaseRecoModel initWithId:andVersion:](&v8, sel_initWithId_andVersion_, location[0], a4);
  objc_storeStrong((id *)&v11, v11);
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (id)getPredictions:(unint64_t)a3 andInputBuilder:(id)a4 andOutputBuilder:(id)a5 withColdstartModelId:(id)a6 error:(id *)a7
{
  id v8;
  unint64_t v9;
  id v10;
  AMDModelAssets *v11;
  id v12;
  void *v13;
  id v14;
  MLModel *v15;
  id v16;
  id v17;
  AMDModelAssets *v18;
  id v19;
  AMDModelMetadata *v20;
  os_log_t v24;
  __CFString *v25;
  os_log_type_t v26;
  os_log_t v27;
  id v28;
  os_log_type_t v29;
  os_log_t v30;
  __CFString *v31;
  os_log_type_t v32;
  os_log_t v33;
  id v34;
  id v35;
  os_log_type_t v36;
  os_log_t oslog;
  __CFString *v38;
  os_log_type_t v39;
  id v40;
  id v41;
  int v42;
  os_log_type_t v43;
  id v44;
  __CFString *v45;
  id *v46;
  id v47;
  id v48;
  id location;
  unint64_t v50;
  SEL v51;
  AMDClassifierRecoModel *v52;
  id v53;
  uint8_t v54[16];
  uint8_t v55[16];
  uint8_t v56[16];
  uint8_t v57[16];
  uint8_t v58[16];
  uint8_t v59[16];
  uint8_t v60[24];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v52 = self;
  v51 = a2;
  v50 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v48 = 0;
  objc_storeStrong(&v48, a5);
  v47 = 0;
  objc_storeStrong(&v47, a6);
  v46 = a7;
  if (-[AMDBaseRecoModel isValid](v52, "isValid"))
  {
    v17 = location;
    v20 = -[AMDBaseRecoModel modelMetadata](v52, "modelMetadata");
    v19 = -[AMDModelMetadata getInputsMetadata](v20, "getInputsMetadata");
    v18 = -[AMDBaseRecoModel modelAssets](v52, "modelAssets");
    v41 = (id)objc_msgSend(v17, "getInputsWithMetadata:andModelAssets:error:", v19);

    if (*v46)
    {
      v40 = MEMORY[0x1E0C81028];
      v39 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
      {
        v16 = (id)objc_msgSend(*v46, "localizedDescription");
        __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v16);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v40, v39, "could not build the inputs provider, %@", v59, 0xCu);

      }
      objc_storeStrong(&v40, 0);
      v53 = 0;
      v42 = 1;
    }
    else if (v41)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = -[AMDBaseRecoModel getId](v52, "getId");
      v35 = (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("CoreMLCall__%@"), v14);

      +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:", v35);
      v15 = -[AMDBaseRecoModel model](v52, "model");
      v34 = -[MLModel predictionFromFeatures:error:](v15, "predictionFromFeatures:error:", v41, v46);

      if (*v46)
      {
        v33 = (os_log_t)MEMORY[0x1E0C81028];
        v32 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v12 = (id)objc_msgSend(*v46, "localizedDescription");
          __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v12);
          _os_log_error_impl(&dword_1DC678000, v33, v32, "error running inference, %@", v57, 0xCu);

        }
        objc_storeStrong((id *)&v33, 0);
        v53 = 0;
        v42 = 1;
      }
      else if (v34)
      {
        +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", v35);
        v10 = v48;
        v9 = v50;
        v11 = -[AMDBaseRecoModel modelAssets](v52, "modelAssets");
        v28 = (id)objc_msgSend(v10, "getPredictions:fromMLProvider:andModelAssets:withColdstartModelId:error:", v9, v34);

        if (*v46)
        {
          v27 = (os_log_t)MEMORY[0x1E0C81028];
          v26 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v8 = (id)objc_msgSend(*v46, "localizedDescription");
            __os_log_helper_16_2_1_8_64((uint64_t)v55, (uint64_t)v8);
            _os_log_error_impl(&dword_1DC678000, v27, v26, "error building output, %@", v55, 0xCu);

          }
          objc_storeStrong((id *)&v27, 0);
          v53 = 0;
          v42 = 1;
        }
        else if (v28)
        {
          v53 = v28;
          v42 = 1;
        }
        else
        {
          v25 = CFSTR("nil inference builder result");
          v24 = (os_log_t)MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)v25);
            _os_log_debug_impl(&dword_1DC678000, v24, OS_LOG_TYPE_DEBUG, "%@", v54, 0xCu);
          }
          objc_storeStrong((id *)&v24, 0);
          *v46 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 24, v25);
          v53 = 0;
          v42 = 1;
          objc_storeStrong((id *)&v25, 0);
        }
        objc_storeStrong(&v28, 0);
      }
      else
      {
        v31 = CFSTR("nil inference result");
        v30 = (os_log_t)MEMORY[0x1E0C81028];
        v29 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v56, (uint64_t)v31);
          _os_log_debug_impl(&dword_1DC678000, v30, v29, "%@", v56, 0xCu);
        }
        objc_storeStrong((id *)&v30, 0);
        *v46 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 24, v31);
        v53 = 0;
        v42 = 1;
        objc_storeStrong((id *)&v31, 0);
      }
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
    }
    else
    {
      v38 = CFSTR("nil inputs provider");
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      v36 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v38);
        _os_log_debug_impl(&dword_1DC678000, oslog, v36, "%@", v58, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      *v46 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 24, v38);
      v53 = 0;
      v42 = 1;
      objc_storeStrong((id *)&v38, 0);
    }
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v45 = CFSTR("model is not ready for predictions");
    v44 = MEMORY[0x1E0C81028];
    v43 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v60, (uint64_t)v45);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v44, v43, "%@", v60, 0xCu);
    }
    objc_storeStrong(&v44, 0);
    *v46 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 24, v45);
    v53 = 0;
    v42 = 1;
    objc_storeStrong((id *)&v45, 0);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&location, 0);
  return v53;
}

@end
