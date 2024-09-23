@implementation CSUVideoCaptioner

- (CSUVideoCaptioner)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  CSUVideoCaptioner *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_23A016E78();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_configPath(v6, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v12;
    _os_log_impl(&dword_239FE9000, v7, OS_LOG_TYPE_INFO, "Begin CSUVideoCaptioner init configPath=%@", buf, 0xCu);

  }
  v20 = 0;
  v15 = (CSUVideoCaptioner *)objc_msgSend__initWithConfiguration_error_(self, v13, (uint64_t)v6, (uint64_t)&v20, v14);
  v16 = v20;
  if (v15)
  {
    sub_23A016E78();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239FE9000, v17, OS_LOG_TYPE_INFO, "End CSUVideoCaptioner init", buf, 2u);
    }

  }
  else
  {
    sub_23A016E78();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_23A09DFF4((uint64_t)v16, v18);

    if (a4)
      *a4 = objc_retainAutorelease(v16);
  }

  return v15;
}

- (id)_initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7;
  CSUVideoCaptioner *v8;
  CSUVideoCaptioner *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  CSUImageCaptioningDecoder *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CSUImageCaptioningDecoder *imageCaptionDecoder;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  CSUVideoCaptioner *v40;
  objc_super v42;

  v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CSUVideoCaptioner;
  v8 = -[CSUVideoCaptioner init](&v42, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_6;
  objc_storeStrong((id *)&v8->_config, a3);
  objc_msgSend_configPath(v7, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (a4)
    {
      objc_msgSend_errorForUnknownErrorWithLocalizedDescription_(CSUError, v15, (uint64_t)CFSTR("CSUVideoCaptioner nil config path"), v17, v18);
      v40 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    v40 = 0;
    goto LABEL_13;
  }
  objc_msgSend_configPath(v7, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(CSUImageCaptioningDecoderConfiguration, v20, (uint64_t)v19, (uint64_t)a4, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
LABEL_11:

    goto LABEL_12;
  }
  v27 = objc_msgSend_saveDecoderFeatures(v7, v23, v24, v25, v26);
  objc_msgSend_setSaveDecoderFeatures_(v22, v28, v27, v29, v30);
  v31 = [CSUImageCaptioningDecoder alloc];
  v35 = objc_msgSend_initWithConfiguration_(v31, v32, (uint64_t)v22, v33, v34);
  imageCaptionDecoder = v9->_imageCaptionDecoder;
  v9->_imageCaptionDecoder = (CSUImageCaptioningDecoder *)v35;

  if (!v9->_imageCaptionDecoder)
  {
    if (a4)
    {
      objc_msgSend_errorForUnknownErrorWithLocalizedDescription_(CSUError, v37, (uint64_t)CFSTR("Failed to init video decoder"), v38, v39);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }

LABEL_6:
  v40 = v9;
LABEL_13:

  return v40;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  objc_msgSend_imageCaptionDecoder(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend_loadResources_(v6, v7, (uint64_t)v5, v8, v9);

  return (char)v5;
}

- (id)computeCaptionForVideoEmbedding:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;

  v6 = a3;
  objc_msgSend_config(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beamSearch(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beamWidth(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_intValue(v21, v22, v23, v24, v25);

  objc_msgSend_imageCaptionDecoder(self, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_error_(v31, v32, (uint64_t)v6, v26 != 1, (uint64_t)a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (CSUVideoCaptionerConfiguration)config
{
  return self->_config;
}

- (CSUImageCaptioningDecoder)imageCaptionDecoder
{
  return self->_imageCaptionDecoder;
}

- (void)setImageCaptionDecoder:(id)a3
{
  objc_storeStrong((id *)&self->_imageCaptionDecoder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCaptionDecoder, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
