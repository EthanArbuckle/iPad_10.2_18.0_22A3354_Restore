@implementation CVNLPCaptionEncoderLSTM

- (CVNLPCaptionEncoderLSTM)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6;
  id v7;
  CVNLPCaptionEncoderLSTM *v8;
  const char *v9;
  uint64_t v10;
  CVNLPCaptionEncoderLSTM *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  std::runtime_error *exception;
  const char *v26;
  std::runtime_error *v27;
  const char *v28;
  std::runtime_error *v29;
  const char *v30;
  std::runtime_error *v31;
  const char *v32;
  std::runtime_error *v33;
  const char *v34;
  std::runtime_error *v35;
  const char *v36;
  std::runtime_error *v37;
  const char *v38;
  objc_super v39;

  v6 = a3;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CVNLPCaptionEncoderLSTM;
  v8 = -[CVNLPCaptionModelBase initWithOptions:runTimeParams:](&v39, sel_initWithOptions_runTimeParams_, v6, v7);
  v11 = v8;
  if (v8)
  {
    v8->meanFeaturesPresent = 0;
    objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CVNLPCaptionModelPath, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v12, v13, (uint64_t)CFSTR("encoder_opt.espresso.net"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11->encoderCtx = (void *)espresso_create_context();
    v11->encoderPlan = (void *)espresso_create_plan();
    objc_msgSend_path(v15, v16, v17, v18);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend_UTF8String(v19, v20, v21, v22);
    v23 = espresso_plan_add_network();

    if (v23)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(exception, v26);
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_plan_build())
    {
      v27 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v27, v28);
      __cxa_throw(v27, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_query_blob_dimensions())
    {
      v29 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v29, v30);
      __cxa_throw(v29, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (c_network_get_output_names())
    {
      v31 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v31, v32);
      __cxa_throw(v31, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (v11->meanFeaturesPresent && espresso_network_bind_buffer())
    {
      v37 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v37, v38);
      __cxa_throw(v37, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v33 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v33, v34);
      __cxa_throw(v33, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    if (espresso_network_bind_buffer())
    {
      v35 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v35, v36);
      __cxa_throw(v35, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)CVNLPCaptionEncoderLSTM;
  -[CVNLPCaptionEncoderLSTM dealloc](&v3, sel_dealloc);
}

- (void)computeCaptionForImage:(vImage_Buffer *)a3 outputs:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = 0;
  v10 = 0;
  objc_msgSend__run_meanFeatures_attnFeatures_projectedAttnFeatures_(self, a2, (uint64_t)a3, (uint64_t)&v12, &v11, &v10);
  v6 = v12;
  v7 = v11;
  v9 = v10;
  if (a3->data)
    MEMORY[0x1B5E07CB4](a3->data, 0x1000C8077774924);
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v13, 3);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)_run:(vImage_Buffer *)a3 meanFeatures:(id *)a4 attnFeatures:(id *)a5 projectedAttnFeatures:(id *)a6
{
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const char *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  const char *v32;
  const char *v33;
  std::runtime_error *exception;
  const char *v35;
  _OWORD v36[10];
  uint64_t v37;
  void *__p;
  _BYTE *v39;
  uint64_t v40;
  _OWORD v41[10];
  uint64_t v42;
  _OWORD v43[10];
  uint64_t v44;
  _BYTE *v45;
  _BYTE *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;

  v51 = 0;
  v10 = *(_OWORD *)&a3->width;
  v48 = *(_OWORD *)&a3->data;
  v49 = v10;
  v50 = xmmword_1B03B0E40;
  if (espresso_network_bind_input_vimagebuffer_rgba8() || espresso_plan_execute_sync())
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(exception, v35);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (self->meanFeaturesPresent)
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v14 = *(_OWORD *)&self->meanFeatsBlob.stride_batch_number;
    v43[8] = *(_OWORD *)&self->meanFeatsBlob.stride_height;
    v43[9] = v14;
    v44 = *(_QWORD *)&self->meanFeatsBlob.storage_type;
    v15 = *(_OWORD *)&self->meanFeatsBlob.width;
    v43[4] = *(_OWORD *)&self->meanFeatsBlob.stride[2];
    v43[5] = v15;
    v16 = *(_OWORD *)&self->meanFeatsBlob.sequence_length;
    v43[6] = *(_OWORD *)&self->meanFeatsBlob.channels;
    v43[7] = v16;
    v17 = *(_OWORD *)self->meanFeatsBlob.dim;
    v43[0] = *(_OWORD *)&self->meanFeatsBlob.data;
    v43[1] = v17;
    v18 = *(_OWORD *)self->meanFeatsBlob.stride;
    v43[2] = *(_OWORD *)&self->meanFeatsBlob.dim[2];
    v43[3] = v18;
    objc_msgSend__copy_data_from_blob_to_(self, v11, (uint64_t)v43, (uint64_t)&v45);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v19, (uint64_t)v45, v46 - v45);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = v45;
      operator delete(v45);
    }
  }
  else
  {
    objc_msgSend_data(MEMORY[0x1E0C99D50], v11, v12, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v21 = *(_OWORD *)&self->attFeatsBlob.stride_batch_number;
  v41[8] = *(_OWORD *)&self->attFeatsBlob.stride_height;
  v41[9] = v21;
  v42 = *(_QWORD *)&self->attFeatsBlob.storage_type;
  v22 = *(_OWORD *)&self->attFeatsBlob.width;
  v41[4] = *(_OWORD *)&self->attFeatsBlob.stride[2];
  v41[5] = v22;
  v23 = *(_OWORD *)&self->attFeatsBlob.sequence_length;
  v41[6] = *(_OWORD *)&self->attFeatsBlob.channels;
  v41[7] = v23;
  v24 = *(_OWORD *)self->attFeatsBlob.dim;
  v41[0] = *(_OWORD *)&self->attFeatsBlob.data;
  v41[1] = v24;
  v25 = *(_OWORD *)self->attFeatsBlob.stride;
  v41[2] = *(_OWORD *)&self->attFeatsBlob.dim[2];
  v41[3] = v25;
  objc_msgSend__copy_data_from_blob_to_(self, v20, (uint64_t)v41, (uint64_t)&v45);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v26, (uint64_t)v45, v46 - v45);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  __p = 0;
  v39 = 0;
  v40 = 0;
  v27 = *(_OWORD *)&self->pAttFeatsBlob.stride_batch_number;
  v36[8] = *(_OWORD *)&self->pAttFeatsBlob.stride_height;
  v36[9] = v27;
  v37 = *(_QWORD *)&self->pAttFeatsBlob.storage_type;
  v28 = *(_OWORD *)&self->pAttFeatsBlob.width;
  v36[4] = *(_OWORD *)&self->pAttFeatsBlob.stride[2];
  v36[5] = v28;
  v29 = *(_OWORD *)&self->pAttFeatsBlob.sequence_length;
  v36[6] = *(_OWORD *)&self->pAttFeatsBlob.channels;
  v36[7] = v29;
  v30 = *(_OWORD *)self->pAttFeatsBlob.dim;
  v36[0] = *(_OWORD *)&self->pAttFeatsBlob.data;
  v36[1] = v30;
  v31 = *(_OWORD *)self->pAttFeatsBlob.stride;
  v36[2] = *(_OWORD *)&self->pAttFeatsBlob.dim[2];
  v36[3] = v31;
  objc_msgSend__copy_data_from_blob_to_(self, v32, (uint64_t)v36, (uint64_t)&__p);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v33, (uint64_t)__p, v39 - (_BYTE *)__p);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v39 = __p;
    operator delete(__p);
  }
  if (v45)
  {
    v46 = v45;
    operator delete(v45);
  }
}

@end
