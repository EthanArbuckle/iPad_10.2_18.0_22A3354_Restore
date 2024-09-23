@implementation CSUSmileySpotterConfiguration

+ (id)getConfigurationForCSUSmileySpotter_v1_0_EnglishWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  double v23;
  const char *v24;
  uint64_t v25;
  void *inited;

  v5 = (void *)objc_opt_new();
  objc_msgSend_fetchAndReturnError_(v5, v6, (uint64_t)a3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (v9)
  {
    objc_msgSend_URLByAppendingPathComponent_(v9, v10, (uint64_t)CFSTR("md1_e5_smiley_spotter.mlmodelc"), v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v22 = objc_alloc((Class)a1);
      LODWORD(v23) = 1062836634;
      inited = (void *)objc_msgSend_initCSUSmileySpotterConfigurationForRevision_modelPath_threshold_(v22, v24, 1, (uint64_t)v19, v25, v23);
    }
    else if (a3)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v20, (uint64_t)CFSTR("Smiley Spotter model file not found in bundle!"), 0, v21);
      inited = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      inited = 0;
    }

  }
  else if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v10, (uint64_t)CFSTR("Model Catalog asset base url for text and token encoders is nil!"), (uint64_t)*a3, v12);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }

  return inited;
}

+ (id)CSUSmileySpotterConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 == 1)
  {
    objc_msgSend_getConfigurationForCSUSmileySpotter_v1_0_EnglishWithError_(a1, a2, (uint64_t)a4, (uint64_t)a4, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a3, (uint64_t)a4, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v6, v8, (uint64_t)CFSTR("Unsupported CSUSmileySpotter revision %@"), v9, v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v12, (uint64_t)v11, v13, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

- (id)initCSUSmileySpotterConfigurationForRevision:(int64_t)a3 modelPath:(id)a4 threshold:(float)a5
{
  objc_storeStrong((id *)&self->_headModelPath, a4);
  self->_revision = a3;
  self->_threshold = a5;
  return self;
}

- (NSString)headModelPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHeadModelPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headModelPath, 0);
}

@end
