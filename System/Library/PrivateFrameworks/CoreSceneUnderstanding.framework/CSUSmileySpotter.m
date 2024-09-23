@implementation CSUSmileySpotter

+ (id)availableSmileySpotterRevisionsForTextEncoder:(int64_t)a3
{
  return 0;
}

- (CSUSmileySpotter)initWithConfiguration:(id)a3
{
  id v5;
  CSUSmileySpotter *v6;
  CSUSmileySpotter *v7;
  CSUCoreMLInference *smileySpotterHead;
  CSUSmileySpotter *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSUSmileySpotter;
  v6 = -[CSUSmileySpotter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    smileySpotterHead = v7->_smileySpotterHead;
    v7->_smileySpotterHead = 0;

    v9 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
{
  CSUCoreMLInference *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  CSUCoreMLInference *v13;
  CSUCoreMLInference *smileySpotterHead;

  if (!self->_smileySpotterHead)
  {
    v6 = [CSUCoreMLInference alloc];
    objc_msgSend_headModelPath(self->_configuration, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (CSUCoreMLInference *)objc_msgSend_initWithCompiledModelFromUri_useComputeUnit_usePrecompiledE5Bundle_error_(v6, v12, (uint64_t)v11, 2, 1, a3);
    smileySpotterHead = self->_smileySpotterHead;
    self->_smileySpotterHead = v13;

  }
  return 1;
}

- (id)runSmileySpotterOnTextEncoding:(id)a3 error:(id *)a4
{
  id v6;
  CSUCoreMLInference *smileySpotterHead;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  CSUSmileySpotterModelOutput *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  const __CFString *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  smileySpotterHead = self->_smileySpotterHead;
  v50 = CFSTR("pooled_out");
  objc_msgSend_textEncoding(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v51, (uint64_t)&v50, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(smileySpotterHead) = objc_msgSend_setInputFeatures_error_(smileySpotterHead, v15, (uint64_t)v14, (uint64_t)a4, v16);

  if ((smileySpotterHead & 1) != 0
    && objc_msgSend_predict_(self->_smileySpotterHead, v17, (uint64_t)a4, v18, v19))
  {
    objc_msgSend_getOutputFor_(self->_smileySpotterHead, v20, (uint64_t)CFSTR("fc_dense2_post_act"), v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23;
    if (v23)
    {
      objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)&unk_250B1CBB8, v25, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v28, v29, v30, v31, v32);
      v34 = v33;
      objc_msgSend_threshold(self->_configuration, v35, v36, v37, v38);
      v40 = v39;

      v41 = [CSUSmileySpotterModelOutput alloc];
      v46 = objc_msgSend_revision(self->_configuration, v42, v43, v44, v45);
      v48 = (void *)objc_msgSend_initWithOutput_Probability_smileySpotterRevision_(v41, v47, v34 > v40, (uint64_t)v27, v46);
    }
    else if (a4)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v24, (uint64_t)CFSTR("Could not get output tensor for smiley spotter head"), v25, v26);
      v48 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = 0;
    }

  }
  else
  {
    v48 = 0;
  }

  return v48;
}

- (int64_t)baseModelRevision
{
  return self->_baseModelRevision;
}

- (CSUSmileySpotterConfiguration)configuration
{
  return (CSUSmileySpotterConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_smileySpotterHead, 0);
}

@end
