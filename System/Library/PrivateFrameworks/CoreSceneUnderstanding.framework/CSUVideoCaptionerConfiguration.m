@implementation CSUVideoCaptionerConfiguration

- (CSUVideoCaptionerConfiguration)initWithConfigPath:(id)a3
{
  id v5;
  CSUVideoCaptionerConfiguration *v6;
  CSUVideoCaptionerConfiguration *v7;
  MLComputeDeviceProtocol *espressoDevice;
  CSUBeamSearchConfiguration *v9;
  CSUBeamSearchConfiguration *beamSearch;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSUVideoCaptionerConfiguration;
  v6 = -[CSUVideoCaptionerConfiguration init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    espressoDevice = v6->_espressoDevice;
    v6->_espressoDevice = 0;

    v9 = objc_alloc_init(CSUBeamSearchConfiguration);
    beamSearch = v7->_beamSearch;
    v7->_beamSearch = v9;

    objc_storeStrong((id *)&v7->_configPath, a3);
  }

  return v7;
}

+ (id)CSUVideoCaptionerConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;

  switch(a3)
  {
    case 4:
      goto LABEL_4;
    case 3:
      v6 = CFSTR("VideoCaptioning_v3.0.0_nm8r5qngqf-94830");
      goto LABEL_6;
    case -1:
LABEL_4:
      v6 = CFSTR("VideoCaptioning_v4.0.0_gb48ze3dvh-98100");
LABEL_6:
      v7 = (void *)MEMORY[0x24BDD1488];
      v8 = objc_opt_class();
      objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathForResource_ofType_(v12, v13, (uint64_t)CFSTR("video_captioning"), (uint64_t)&stru_250B0F248, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v15, v16, (uint64_t)v6, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v19, v20, (uint64_t)CFSTR("VideoCaptioning.config.json"), v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CSUVideoCaptioningConfigurationWithConfigPath_error_(CSUVideoCaptionerConfiguration, v24, (uint64_t)v23, (uint64_t)a4, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
  }
  if (!a4)
  {
    v26 = 0;
    return v26;
  }
  v28 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a3, (uint64_t)a4, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v28, v29, (uint64_t)CFSTR("Unsupported CSUVideoCaptionerConfigurationRevision %@"), v30, v31, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorForUnsupportedRevision_(CSUError, v32, (uint64_t)v15, v33, v34);
  v26 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v26;
}

+ (id)CSUVideoCaptioningConfigurationWithConfigPath:(id)a3 error:(id *)a4
{
  id v4;
  CSUVideoCaptionerConfiguration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = [CSUVideoCaptionerConfiguration alloc];
  v9 = (void *)objc_msgSend_initWithConfigPath_(v5, v6, (uint64_t)v4, v7, v8);

  return v9;
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
  objc_msgSend_addIndex_(v2, v3, 3, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 4, v7, v8);
  return v2;
}

- (MLComputeDeviceProtocol)espressoDevice
{
  return self->_espressoDevice;
}

- (void)setEspressoDevice:(id)a3
{
  objc_storeStrong((id *)&self->_espressoDevice, a3);
}

- (CSUBeamSearchConfiguration)beamSearch
{
  return self->_beamSearch;
}

- (void)setBeamSearch:(id)a3
{
  objc_storeStrong((id *)&self->_beamSearch, a3);
}

- (NSString)configPath
{
  return self->_configPath;
}

- (void)setConfigPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)saveDecoderFeatures
{
  return self->_saveDecoderFeatures;
}

- (void)setSaveDecoderFeatures:(BOOL)a3
{
  self->_saveDecoderFeatures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_beamSearch, 0);
  objc_storeStrong((id *)&self->_espressoDevice, 0);
}

@end
