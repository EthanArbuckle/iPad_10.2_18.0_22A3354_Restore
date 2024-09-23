@implementation CSUCLIPTextEncoderV3Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1)
    return 1;
  else
    return a3;
}

+ (id)CLIPTextEncoderV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  void *inited;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15) == 1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v16, (uint64_t)CFSTR("vocab"), (uint64_t)CFSTR("model"), (uint64_t)CFSTR("clip/v3.1/"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v20, (uint64_t)CFSTR("text_encoder_lookup_unilm_quantized"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("clip/v3.1/"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v22, (uint64_t)CFSTR("text_encoder_main"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("clip/v3.1/"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc((Class)a1);
    inited = (void *)objc_msgSend_initCLIPTextEncoderV3ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_(v24, v25, 1, (uint64_t)v19, (uint64_t)v21, v23);

  }
  else
  {
    if (!a4)
    {
      inited = 0;
      goto LABEL_6;
    }
    v27 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, a3, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v27, v28, (uint64_t)CFSTR("Unsupported CLIPTextEncoderV3 revision %@"), v29, v30, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v31, (uint64_t)v21, v32, v33);
    inited = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return inited;
}

- (id)initCLIPTextEncoderV3ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  CSUCLIPTextEncoderV3Configuration *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CSUCLIPTextEncoderV3Configuration *v18;
  uint64_t v19;
  NSString *vocabularyModelPath;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *tokenEmbeddingNetworkPath;
  NSString *inputTextIDTensorName;
  NSString *inputTextIDMaskTensorName;
  NSString *outputTokenEmbeddingIDTensorName;
  NSString *outputTokenEmbeddingMaskTensorName;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSString *textEncoderNetworkPath;
  NSString *inputTokenEmbeddingIDTensorName;
  NSString *inputTokenEmbeddingMaskTensorName;
  NSString *outputTextEmbeddingTensorName;
  CSUCLIPTextEncoderV3Configuration *v40;
  objc_super v42;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v42.receiver = self;
  v42.super_class = (Class)CSUCLIPTextEncoderV3Configuration;
  v13 = -[CSUCLIPTextEncoderV3Configuration init](&v42, sel_init);
  v18 = v13;
  if (v13)
  {
    v13->_revision = a3;
    v19 = objc_msgSend_copy(v10, v14, v15, v16, v17);
    vocabularyModelPath = v18->_vocabularyModelPath;
    v18->_vocabularyModelPath = (NSString *)v19;

    v18->_maximumSequenceLength = 60;
    v18->_inputIsLowerCase = 1;
    v25 = objc_msgSend_copy(v11, v21, v22, v23, v24);
    tokenEmbeddingNetworkPath = v18->_tokenEmbeddingNetworkPath;
    v18->_tokenEmbeddingNetworkPath = (NSString *)v25;

    inputTextIDTensorName = v18->_inputTextIDTensorName;
    v18->_inputTextIDTensorName = (NSString *)CFSTR("text_ids");

    inputTextIDMaskTensorName = v18->_inputTextIDMaskTensorName;
    v18->_inputTextIDMaskTensorName = (NSString *)CFSTR("text_ids_mask");

    outputTokenEmbeddingIDTensorName = v18->_outputTokenEmbeddingIDTensorName;
    v18->_outputTokenEmbeddingIDTensorName = (NSString *)CFSTR("t1_1_cast");

    outputTokenEmbeddingMaskTensorName = v18->_outputTokenEmbeddingMaskTensorName;
    v18->_outputTokenEmbeddingMaskTensorName = (NSString *)CFSTR("k_mask_1_cast");

    v35 = objc_msgSend_copy(v12, v31, v32, v33, v34);
    textEncoderNetworkPath = v18->_textEncoderNetworkPath;
    v18->_textEncoderNetworkPath = (NSString *)v35;

    inputTokenEmbeddingIDTensorName = v18->_inputTokenEmbeddingIDTensorName;
    v18->_inputTokenEmbeddingIDTensorName = (NSString *)CFSTR("t1_1_cast");

    inputTokenEmbeddingMaskTensorName = v18->_inputTokenEmbeddingMaskTensorName;
    v18->_inputTokenEmbeddingMaskTensorName = (NSString *)CFSTR("k_mask_1_cast");

    outputTextEmbeddingTensorName = v18->_outputTextEmbeddingTensorName;
    v18->_outputTextEmbeddingTensorName = (NSString *)CFSTR("text_embed_normalize");

    v40 = v18;
  }

  return v18;
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
  uint64_t v9;
  void *v10;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  v10 = (void *)objc_msgSend_copy(v2, v6, v7, v8, v9);

  return v10;
}

- (int)espressoExecutionEngine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;

  objc_msgSend_computeDevice(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_23A00ACE4(v5);

  return v6;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
  objc_storeStrong((id *)&self->_computeDevice, a3);
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)vocabularyModelPath
{
  return self->_vocabularyModelPath;
}

- (NSString)tokenEmbeddingNetworkPath
{
  return self->_tokenEmbeddingNetworkPath;
}

- (NSString)textEncoderNetworkPath
{
  return self->_textEncoderNetworkPath;
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (BOOL)inputIsLowerCase
{
  return self->_inputIsLowerCase;
}

- (NSString)inputTextIDTensorName
{
  return self->_inputTextIDTensorName;
}

- (NSString)inputTextIDMaskTensorName
{
  return self->_inputTextIDMaskTensorName;
}

- (NSString)outputTokenEmbeddingIDTensorName
{
  return self->_outputTokenEmbeddingIDTensorName;
}

- (NSString)outputTokenEmbeddingMaskTensorName
{
  return self->_outputTokenEmbeddingMaskTensorName;
}

- (NSString)inputTokenEmbeddingIDTensorName
{
  return self->_inputTokenEmbeddingIDTensorName;
}

- (NSString)inputTokenEmbeddingMaskTensorName
{
  return self->_inputTokenEmbeddingMaskTensorName;
}

- (NSString)outputTextEmbeddingTensorName
{
  return self->_outputTextEmbeddingTensorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTextEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingMaskTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_outputTokenEmbeddingMaskTensorName, 0);
  objc_storeStrong((id *)&self->_outputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_inputTextIDMaskTensorName, 0);
  objc_storeStrong((id *)&self->_inputTextIDTensorName, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end
