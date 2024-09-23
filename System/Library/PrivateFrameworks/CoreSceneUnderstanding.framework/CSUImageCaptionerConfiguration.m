@implementation CSUImageCaptionerConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1)
    return 1;
  else
    return a3;
}

+ (id)availableRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 5, v7, v8);
  return v2;
}

+ (id)CSUImageCaptionerConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  CSUImageCaptionerConfiguration *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CSUImageCaptionerConfiguration *v27;
  const char *v28;
  uint64_t v29;

  v7 = objc_msgSend__resolvedRevision_(CSUImageCaptionerConfiguration, a2, a3, (uint64_t)a4, v4);
  if (v7 == 1)
  {
    v11 = 0;
    objc_msgSend_CSUImageCaptioningDecoderConfigurationForRevision_error_(CSUImageCaptioningDecoderConfiguration, v8, 1, (uint64_t)a4, v10);
    goto LABEL_5;
  }
  if (v7 == 5)
  {
    v11 = 1;
    objc_msgSend_CSUImageCaptioningDecoderConfigurationForRevision_error_(CSUImageCaptioningDecoderConfiguration, v8, 7, (uint64_t)a4, v10);
LABEL_5:
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v18 = 0;
      goto LABEL_17;
    }
    if ((v11 & 1) != 0)
    {
      v15 = [CSUImageCaptionerConfiguration alloc];
      v18 = (void *)objc_msgSend_initWithCaptioningEncoderConfiguration_captioningDecoderConfiguration_(v15, v16, 0, (uint64_t)v14, v17);
LABEL_17:

      return v18;
    }
    objc_msgSend_CSUImageCaptioningEncoderConfigurationForRevision_error_(CSUImageCaptioningEncoderConfiguration, v12, 1, (uint64_t)a4, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v27 = [CSUImageCaptionerConfiguration alloc];
      v18 = (void *)objc_msgSend_initWithCaptioningEncoderConfiguration_captioningDecoderConfiguration_(v27, v28, (uint64_t)v23, (uint64_t)v14, v29);
    }
    else
    {
      v18 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (a4)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, a3, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v20, (uint64_t)CFSTR("Unsupported Image captioning revision %@"), v21, v22, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v24, (uint64_t)v23, v25, v26);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  return 0;
}

+ (id)createCSUImageCaptionerConfigurationWithConfigPath:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  char v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  char v30;
  const char *v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  char v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  CSUImageCaptionerConfiguration *v46;
  const char *v47;
  uint64_t v48;
  void *v49;

  v5 = a3;
  *a4 = 0;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v5, v12, v13);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("Config file does not exist at path %@"), v16, v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v19, v14, (uint64_t)a4, (uint64_t)v18);

  if ((v20 & 1) != 0)
  {
    objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v21, (uint64_t)v5, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, (uint64_t)CFSTR("Config path %@ could not be read!"), v26, v27, v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v29, v24 != 0, (uint64_t)a4, (uint64_t)v28);

    if ((v30 & 1) != 0)
    {
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v31, (uint64_t)v24, 0, (uint64_t)a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *a4;
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, (uint64_t)CFSTR("Config path %@ could not be read!"), v35, v36, v5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v38, v33 == 0, (uint64_t)a4, (uint64_t)v37);

      if ((v39 & 1) != 0)
      {
        objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(CSUImageCaptioningDecoderConfiguration, v40, (uint64_t)v5, (uint64_t)a4, v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          objc_msgSend_createCSUImageCaptioningEncoderConfigurationWithConfigPath_error_(CSUImageCaptioningEncoderConfiguration, v42, (uint64_t)v5, (uint64_t)a4, v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = [CSUImageCaptionerConfiguration alloc];
          v49 = (void *)objc_msgSend_initWithCaptioningEncoderConfiguration_captioningDecoderConfiguration_(v46, v47, (uint64_t)v45, (uint64_t)v44, v48);

        }
        else
        {
          v49 = 0;
        }

        goto LABEL_11;
      }
    }
    else
    {
      v32 = 0;
    }
    v49 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v49 = 0;
LABEL_12:

  return v49;
}

+ (id)createCSUImageCaptionerConfigurationWithEncoderConfiguration:(id)a3 DecoderConfiguration:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  CSUImageCaptionerConfiguration *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = [CSUImageCaptionerConfiguration alloc];
  v11 = (void *)objc_msgSend_initWithCaptioningEncoderConfiguration_captioningDecoderConfiguration_(v8, v9, (uint64_t)v6, (uint64_t)v7, v10);

  return v11;
}

- (CSUImageCaptionerConfiguration)initWithCaptioningEncoderConfiguration:(id)a3 captioningDecoderConfiguration:(id)a4
{
  id v7;
  id v8;
  CSUImageCaptionerConfiguration *v9;
  CSUImageCaptionerConfiguration *v10;
  CSUImageCaptionerConfiguration *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CSUImageCaptionerConfiguration;
  v9 = -[CSUImageCaptionerConfiguration init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captioningEncoderConfiguration, a3);
    objc_storeStrong((id *)&v10->_captioningDecoderConfiguration, a4);
    v11 = v10;
  }

  return v10;
}

- (CSUImageCaptioningEncoderConfiguration)captioningEncoderConfiguration
{
  return self->_captioningEncoderConfiguration;
}

- (CSUImageCaptioningDecoderConfiguration)captioningDecoderConfiguration
{
  return self->_captioningDecoderConfiguration;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captioningDecoderConfiguration, 0);
  objc_storeStrong((id *)&self->_captioningEncoderConfiguration, 0);
}

@end
