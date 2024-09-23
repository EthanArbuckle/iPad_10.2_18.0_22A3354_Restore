@implementation CSUImageCaptioner

- (CSUImageCaptioner)initWithConfiguration:(id)a3
{
  id v5;
  CSUImageCaptioner *v6;
  CSUImageCaptioner *v7;
  CSUImageCaptioningEncoder *encoder;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CSUImageCaptioningEncoder *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CSUImageCaptioningEncoder *v24;
  CSUImageCaptioningDecoder *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CSUImageCaptioningDecoder *decoder;
  CSUImageCaptioner *v36;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CSUImageCaptioner;
  v6 = -[CSUImageCaptioner init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    encoder = v7->_encoder;
    v7->_encoder = 0;

    objc_msgSend_captioningEncoderConfiguration(v7->_configuration, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = [CSUImageCaptioningEncoder alloc];
      objc_msgSend_captioningEncoderConfiguration(v5, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_initWithConfiguration_(v14, v20, (uint64_t)v19, v21, v22);
      v24 = v7->_encoder;
      v7->_encoder = (CSUImageCaptioningEncoder *)v23;

    }
    v25 = [CSUImageCaptioningDecoder alloc];
    objc_msgSend_captioningDecoderConfiguration(v5, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_initWithConfiguration_(v25, v31, (uint64_t)v30, v32, v33);
    decoder = v7->_decoder;
    v7->_decoder = (CSUImageCaptioningDecoder *)v34;

    v36 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int Resources;

  objc_msgSend_captioningEncoderConfiguration(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (Resources = objc_msgSend_loadResources_(self->_encoder, v8, (uint64_t)a3, v9, v10)) != 0)
    LOBYTE(Resources) = objc_msgSend_loadResources_(self->_decoder, v8, (uint64_t)a3, v9, v10);
  return Resources;
}

- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5
{
  return MEMORY[0x24BEDD108](self->_encoder, sel_resampleImage_intoInputImage_error_, a3, a4, a5);
}

- (id)computeCaptionForImage:(__CVBuffer *)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CSUImageCaptioningEncoder *encoder;
  const char *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v28[3];
  _QWORD *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  sub_23A016E78();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  sub_23A016E78();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v28[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CSUComputeCaptionForImage", ", (uint8_t *)v28, 2u);
  }

  v28[0] = &off_250B0BE20;
  v28[1] = v10;
  v29 = v28;
  v18 = (void *)MEMORY[0x23B840290](v13, v14);
  encoder = self->_encoder;
  if (encoder)
  {
    objc_msgSend_computeEncodedCaptioningFeaturesForImage_error_(encoder, v15, (uint64_t)a3, (uint64_t)a5, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (*a5)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend_computeDecodedCaptionsForFeaturesWithCSUBuffer_withDecodingMethod_error_(self->_decoder, v20, (uint64_t)v21, a4, (uint64_t)a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (*a5)
        v22 = 0;
      else
        v22 = v23;

    }
  }
  else
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v15, (uint64_t)CFSTR("Encoder not configured!"), v16, v17);
    v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v18);
  if (!v29)
    sub_239FF19E8();
  (*(void (**)(_QWORD *))(*v29 + 48))(v29);
  v25 = v29;
  if (v29 == v28)
  {
    v26 = 4;
    v25 = v28;
    goto LABEL_18;
  }
  if (v29)
  {
    v26 = 5;
LABEL_18:
    (*(void (**)(void))(*v25 + 8 * v26))();
  }
  return v22;
}

- (id)computeCaptionForEmbedding:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  CSUImageCaptioningDecoder *decoder;
  void *v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  id v44;
  uint8_t *v45;
  uint64_t v46;
  id v48;
  uint8_t v49[16];
  uint8_t buf[8];
  os_signpost_id_t v51;
  uint8_t *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  sub_23A016E78();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  sub_23A016E78();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CSUComputeCaptionForEmbeddingNSData", ", buf, 2u);
  }

  *(_QWORD *)buf = &off_250B0BE78;
  v51 = v10;
  v52 = buf;
  v14 = (void *)MEMORY[0x23B840290]();
  if (v8)
  {
    decoder = self->_decoder;
    v48 = 0;
    objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_error_(decoder, v13, (uint64_t)v8, a4, (uint64_t)&v48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v48;
    if (!v16)
    {
      v18 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend_domain(v17, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend_initWithString_(v18, v24, (uint64_t)v23, v25, v26);

      v32 = objc_msgSend_code(v17, v28, v29, v30, v31);
      v33 = objc_alloc(MEMORY[0x24BDBCE70]);
      objc_msgSend_userInfo(v17, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend_initWithDictionary_(v33, v39, (uint64_t)v38, v40, v41);

      goto LABEL_11;
    }
  }
  else
  {
    sub_23A016E78();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_239FE9000, v17, OS_LOG_TYPE_INFO, "Input to computeCaptionForEmbedding is null", v49, 2u);
    }
    v16 = 0;
  }
  v32 = 0;
  v42 = 0;
  v27 = 0;
LABEL_11:

  objc_autoreleasePoolPop(v14);
  if (v8)
  {
    if (a5 && v27)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(CSUError, v43, (uint64_t)v27, v32, (uint64_t)v42);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v44 = v16;
  }
  else
  {
    v44 = 0;
  }

  if (!v52)
    sub_239FF19E8();
  (*(void (**)(uint8_t *))(*(_QWORD *)v52 + 48))(v52);
  v45 = v52;
  if (v52 == buf)
  {
    v46 = 4;
    v45 = buf;
    goto LABEL_22;
  }
  if (v52)
  {
    v46 = 5;
LABEL_22:
    (*(void (**)(void))(*(_QWORD *)v45 + 8 * v46))();
  }

  return v44;
}

- (id)computeCaptionForCSUBufferEmbedding:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v21[3];
  _QWORD *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  sub_23A016E78();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  sub_23A016E78();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v21[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CSUComputeCaptionForEmbeddingCSUBuffer", ", (uint8_t *)v21, 2u);
  }

  v21[0] = &off_250B0BED0;
  v21[1] = v10;
  v22 = v21;
  v15 = (void *)MEMORY[0x23B840290](v13, v14);
  objc_msgSend_computeDecodedCaptionsForFeaturesWithCSUBuffer_withDecodingMethod_error_(self->_decoder, v16, (uint64_t)v8, a4, (uint64_t)a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v15);
  if (!v22)
    sub_239FF19E8();
  (*(void (**)(_QWORD *))(*v22 + 48))(v22);
  v18 = v22;
  if (v22 == v21)
  {
    v19 = 4;
    v18 = v21;
    goto LABEL_9;
  }
  if (v22)
  {
    v19 = 5;
LABEL_9:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }

  return v17;
}

- (CSUImageCaptionerConfiguration)configuration
{
  return self->_configuration;
}

- (CSUImageCaptioningEncoder)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_encoder, a3);
}

- (CSUImageCaptioningDecoder)decoder
{
  return self->_decoder;
}

- (void)setDecoder:(id)a3
{
  objc_storeStrong((id *)&self->_decoder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
