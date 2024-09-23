@implementation CHStyleEncoderModelE5ML

+ (id)defaultURLOfModelInThisBundle
{
  CHModelCatalog *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = objc_alloc_init(CHModelCatalog);
  objc_msgSend_getModelURL_(v2, v3, 0, v4, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_URLWithString_relativeToURL_(MEMORY[0x1E0C99E98], v7, (uint64_t)CFSTR("diffusion_latn_style_encoder.bundle"), (uint64_t)v10, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)inputNames
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("input_labels");
  v5[1] = CFSTR("input_labels_length");
  v5[2] = CFSTR("input_length");
  v5[3] = CFSTR("input_style_labels_len");
  v5[4] = CFSTR("input_style_labels");
  v5[5] = CFSTR("input_style_features");
  v5[6] = CFSTR("input_style_features_len");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v5, 7, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)outputNames
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("diffusion_pooled_style_encoding");
  v5[1] = CFSTR("diffusion_style_encoding");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v5, 2, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CHStyleEncoderModelE5ML)initWithProgramLibrary:(id)a3 width:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  const char *v54;
  VisionCoreE5RTInferenceFunctionDescriptor *v55;
  VisionCoreE5RTInferenceFunctionDescriptor *functionDescriptor;
  CHStyleEncoderModelE5ML *v57;
  id v59;
  objc_super v60;
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("main_%zu"), v8, v9, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = v11;
  if (!self)
    goto LABEL_16;
  v60.receiver = self;
  v60.super_class = (Class)CHStyleEncoderModelE5ML;
  self = -[CHStyleEncoderModelE5ML init](&v60, sel_init);
  if (!self)
    goto LABEL_16;
  v14 = v13;
  v59 = v12;
  objc_opt_self();
  objc_msgSend_visionCoreProgramLibrary(v59, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_functionNamed_error_(v20, v21, (uint64_t)v14, 0, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v35 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v14;
      _os_log_impl(&dword_1BE607000, v35, OS_LOG_TYPE_ERROR, "Failed to load function named '%@'.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v25 = (void *)objc_opt_class();
  objc_msgSend_inputNames(v25, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptorsForInputs_error_(v24, v32, (uint64_t)v31, 0, v33, v34);
  v35 = objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
LABEL_11:
    v55 = 0;
    goto LABEL_14;
  }
  v36 = (void *)objc_opt_class();
  objc_msgSend_outputNames(v36, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptorsForOutputs_error_(v24, v43, (uint64_t)v42, 0, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = objc_alloc(MEMORY[0x1E0DC6CC0]);
    v52 = (void *)objc_msgSend_initWithMajor_(v47, v48, 1, v49, v50, v51);
    v53 = objc_alloc(MEMORY[0x1E0DC6C30]);
    v55 = (VisionCoreE5RTInferenceFunctionDescriptor *)objc_msgSend_initWithFunction_inputDescriptors_inputImageDescriptors_outputDescriptors_confidencesOutputDescriptors_networkVersion_(v53, v54, (uint64_t)v24, (uint64_t)v35, MEMORY[0x1E0C9AA60], (uint64_t)v46, 0, v52);

  }
  else
  {
    v55 = 0;
  }

LABEL_14:
  functionDescriptor = self->_functionDescriptor;
  self->_functionDescriptor = v55;

  if (!self->_functionDescriptor)
  {
LABEL_16:
    v57 = 0;
    goto LABEL_17;
  }
  self = self;
  v57 = self;
LABEL_17:

  return v57;
}

- (id)createExecutionContext
{
  CHStyleEncoderModelE5MLExecutionContext *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = [CHStyleEncoderModelE5MLExecutionContext alloc];
  return (id)objc_msgSend_initWithFunction_(v3, v4, (uint64_t)self->_functionDescriptor, v5, v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionDescriptor, 0);
}

@end
