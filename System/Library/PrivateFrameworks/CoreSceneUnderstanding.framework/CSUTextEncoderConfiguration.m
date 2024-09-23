@implementation CSUTextEncoderConfiguration

+ (id)availableRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 7, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 2, v7, v8);
  objc_msgSend_addIndex_(v2, v9, 8, v10, v11);
  return v2;
}

+ (id)availableContextLengthsForRevision:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) > 2)
    return 0;
  else
    return (id)qword_250B0E3C8[a3 - 6];
}

+ (id)defaultContextLengthForRevision:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) > 2)
    return 0;
  else
    return (id)qword_250B0E3E0[a3 - 6];
}

+ (id)createForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  CSUTextEncoderConfiguration *v14;
  const char *v15;
  uint64_t v16;
  uint64_t inited;
  CSUTextEncoderConfiguration *v18;
  const char *v19;
  uint64_t v20;
  void *v21;

  *a4 = 0;
  if ((unint64_t)(a3 - 6) >= 2)
  {
    if (a3 != 8)
    {
      sub_23A016E78();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_23A09DC58(a3, v10, v12);
      goto LABEL_7;
    }
    objc_msgSend_TextEncoderE5MLConfigurationForRevision_error_(CSUTextEncoderE5MLConfiguration, a2, 3, (uint64_t)a4, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *a4;
    if (*a4)
    {
LABEL_6:
      objc_msgSend_logInternalError_(CSUError, v7, (uint64_t)v11, v8, v9);
LABEL_7:

      return 0;
    }
    v18 = [CSUTextEncoderConfiguration alloc];
    inited = objc_msgSend_initTextEncoderE5ML_forRevision_(v18, v19, (uint64_t)v10, 8, v20);
  }
  else
  {
    objc_msgSend_TextEncoderE5MLConfigurationForRevision_error_(CSUTextEncoderE5MLConfiguration, a2, 2, (uint64_t)a4, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *a4;
    if (*a4)
      goto LABEL_6;
    v14 = [CSUTextEncoderConfiguration alloc];
    inited = objc_msgSend_initTextEncoderE5ML_forRevision_(v14, v15, (uint64_t)v10, a3, v16);
  }
  v21 = (void *)inited;

  return v21;
}

- (id)initSystemSearchTextEncoderV1:(id)a3 forRevision:(int64_t)a4
{
  id v7;
  CSUTextEncoderConfiguration *v8;
  CSUTextEncoderConfiguration *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CSUTextEncoderE5MLConfiguration *textEncoderE5MLConfig;
  CSUTextEncoderConfiguration *v15;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSUTextEncoderConfiguration;
  v8 = -[CSUTextEncoderConfiguration init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_revision = a4;
    objc_storeStrong((id *)&v8->_systemSearchTextEncoderConfig, a3);
    v9->_tokenEmbeddingLength = objc_msgSend_tokenEmbeddingLength(v9->_systemSearchTextEncoderConfig, v10, v11, v12, v13);
    textEncoderE5MLConfig = v9->_textEncoderE5MLConfig;
    v9->_textEncoderE5MLConfig = 0;

    v15 = v9;
  }

  return v9;
}

- (id)initTextEncoderE5ML:(id)a3 forRevision:(int64_t)a4
{
  id v7;
  CSUTextEncoderConfiguration *v8;
  CSUTextEncoderConfiguration *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CSUSystemSearchTextEncoderV1Configuration *systemSearchTextEncoderConfig;
  CSUTextEncoderConfiguration *v15;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSUTextEncoderConfiguration;
  v8 = -[CSUTextEncoderConfiguration init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_revision = a4;
    objc_storeStrong((id *)&v8->_textEncoderE5MLConfig, a3);
    v9->_tokenEmbeddingLength = objc_msgSend_tokenEmbeddingLength(v9->_textEncoderE5MLConfig, v10, v11, v12, v13);
    systemSearchTextEncoderConfig = v9->_systemSearchTextEncoderConfig;
    v9->_systemSearchTextEncoderConfig = 0;

    v15 = v9;
  }

  return v9;
}

- (void)setAdditionalLayerNames:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CSUSystemSearchTextEncoderV1Configuration *systemSearchTextEncoderConfig;
  CSUTextEncoderE5MLConfiguration *textEncoderE5MLConfig;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_additionalLayerNames, a3);
  systemSearchTextEncoderConfig = self->_systemSearchTextEncoderConfig;
  if (systemSearchTextEncoderConfig)
    objc_msgSend_setAdditionalLayerNames_(systemSearchTextEncoderConfig, v5, (uint64_t)v10, v6, v7);
  textEncoderE5MLConfig = self->_textEncoderE5MLConfig;
  if (textEncoderE5MLConfig)
    objc_msgSend_setAdditionalLayerNames_(textEncoderE5MLConfig, v5, (uint64_t)v10, v6, v7);

}

- (void)setContextLength:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CSUTextEncoderE5MLConfiguration *textEncoderE5MLConfig;
  unint64_t contextLength;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t v31[16];
  uint8_t buf[16];

  self->_contextLength = a3;
  if (self->_systemSearchTextEncoderConfig)
  {
    sub_23A016E78();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_23A09DCF8(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    textEncoderE5MLConfig = self->_textEncoderE5MLConfig;
    if (textEncoderE5MLConfig)
    {
      objc_msgSend_setContextLength_(textEncoderE5MLConfig, a2, a3, v3, v4);
      contextLength = self->_contextLength;
      if (contextLength == 512)
      {
        sub_23A016E78();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_239FE9000, v17, OS_LOG_TYPE_INFO, "Setting e5Function to be used as main_ctx_512", v31, 2u);
        }

        objc_msgSend_setE5function_(self->_textEncoderE5MLConfig, v18, (uint64_t)CFSTR("main_ctx_512"), v19, v20);
      }
      else
      {
        if (contextLength == 77)
        {
          sub_23A016E78();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_239FE9000, v16, OS_LOG_TYPE_INFO, "Setting e5Function to be used as main_ctx_77", buf, 2u);
          }
        }
        else
        {
          sub_23A016E78();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            sub_23A09DCC4(v16, v21, v22, v23, v24, v25, v26, v27);
        }

        objc_msgSend_setE5function_(self->_textEncoderE5MLConfig, v28, (uint64_t)CFSTR("main_ctx_77"), v29, v30);
      }
    }
  }
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSArray)additionalLayerNames
{
  return self->_additionalLayerNames;
}

- (unint64_t)tokenEmbeddingLength
{
  return self->_tokenEmbeddingLength;
}

- (NSArray)availableContextLengths
{
  return self->_availableContextLengths;
}

- (void)setAvailableContextLengths:(id)a3
{
  objc_storeStrong((id *)&self->_availableContextLengths, a3);
}

- (unint64_t)contextLength
{
  return self->_contextLength;
}

- (CSUSystemSearchTextEncoderV1Configuration)systemSearchTextEncoderConfig
{
  return self->_systemSearchTextEncoderConfig;
}

- (void)setSystemSearchTextEncoderConfig:(id)a3
{
  objc_storeStrong((id *)&self->_systemSearchTextEncoderConfig, a3);
}

- (CSUTextEncoderE5MLConfiguration)textEncoderE5MLConfig
{
  return self->_textEncoderE5MLConfig;
}

- (void)setTextEncoderE5MLConfig:(id)a3
{
  objc_storeStrong((id *)&self->_textEncoderE5MLConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoderE5MLConfig, 0);
  objc_storeStrong((id *)&self->_systemSearchTextEncoderConfig, 0);
  objc_storeStrong((id *)&self->_availableContextLengths, 0);
  objc_storeStrong((id *)&self->_additionalLayerNames, 0);
}

@end
