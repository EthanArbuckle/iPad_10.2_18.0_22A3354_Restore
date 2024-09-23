@implementation CSUSystemSearchTextEncoderV1Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  return a3;
}

+ (id)SystemSearchTextEncoderV1ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend__resolvedRevision_(a1, a2, a3, (uint64_t)a4, v4);
  if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v7, a3, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("Unsupported SystemSearchTextEncoderV1 revision %@"), v13, v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v16, (uint64_t)v15, v17, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)initSystemSearchTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6 encoderParams:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CSUSystemSearchTextEncoderV1Configuration *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CSUSystemSearchTextEncoderV1Configuration *v21;
  uint64_t v22;
  NSString *vocabularyModelPath;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *inputTextIDTensorName;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSString *tokenEmbeddingNetworkPath;
  NSString *outputTokenEmbeddingIDTensorName;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSString *textEncoderNetworkPath;
  NSString *inputTokenEmbeddingIDTensorName;
  NSString *inputTokenEmbeddingMaskTensorName;
  NSString *outputTextEmbeddingTensorName;
  NSString *outputLastHiddenStateTensorName;
  CSUSystemSearchTextEncoderV1Configuration *v61;
  objc_super v63;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v63.receiver = self;
  v63.super_class = (Class)CSUSystemSearchTextEncoderV1Configuration;
  v16 = -[CSUSystemSearchTextEncoderV1Configuration init](&v63, sel_init);
  v21 = v16;
  if (v16)
  {
    v16->_revision = a3;
    v22 = objc_msgSend_copy(v12, v17, v18, v19, v20);
    vocabularyModelPath = v21->_vocabularyModelPath;
    v21->_vocabularyModelPath = (NSString *)v22;

    objc_msgSend_objectForKeyedSubscript_(v15, v24, (uint64_t)CFSTR("maxSeqLen"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v21->_maximumSequenceLength = objc_msgSend_unsignedLongValue(v27, v28, v29, v30, v31);

    v21->_inputIsLowerCase = 1;
    inputTextIDTensorName = v21->_inputTextIDTensorName;
    v21->_inputTextIDTensorName = (NSString *)CFSTR("text_ids");

    v37 = objc_msgSend_copy(v13, v33, v34, v35, v36);
    tokenEmbeddingNetworkPath = v21->_tokenEmbeddingNetworkPath;
    v21->_tokenEmbeddingNetworkPath = (NSString *)v37;

    outputTokenEmbeddingIDTensorName = v21->_outputTokenEmbeddingIDTensorName;
    v21->_outputTokenEmbeddingIDTensorName = (NSString *)CFSTR("token_embed");

    objc_msgSend_objectForKeyedSubscript_(v15, v40, (uint64_t)CFSTR("tokenEmbedLen"), v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v21->_tokenEmbeddingLength = objc_msgSend_unsignedLongValue(v43, v44, v45, v46, v47);

    v50 = (id)objc_msgSend_CSUAssert_log_(CSUError, v48, v21->_maximumSequenceLength != v21->_tokenEmbeddingLength, (uint64_t)CFSTR("Implementation of checkIfSrcBufferisContiguousForCopyToDestBuffer might fail"), v49);
    v55 = objc_msgSend_copy(v14, v51, v52, v53, v54);
    textEncoderNetworkPath = v21->_textEncoderNetworkPath;
    v21->_textEncoderNetworkPath = (NSString *)v55;

    inputTokenEmbeddingIDTensorName = v21->_inputTokenEmbeddingIDTensorName;
    v21->_inputTokenEmbeddingIDTensorName = (NSString *)CFSTR("token_embed");

    inputTokenEmbeddingMaskTensorName = v21->_inputTokenEmbeddingMaskTensorName;
    v21->_inputTokenEmbeddingMaskTensorName = (NSString *)CFSTR("indices");

    outputTextEmbeddingTensorName = v21->_outputTextEmbeddingTensorName;
    v21->_outputTextEmbeddingTensorName = (NSString *)CFSTR("text_embed");

    outputLastHiddenStateTensorName = v21->_outputLastHiddenStateTensorName;
    v21->_outputLastHiddenStateTensorName = (NSString *)CFSTR("input_tranpose");

    v61 = v21;
  }

  return v21;
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
  objc_msgSend_addIndex_(v2, v3, 2, v4, v5);
  v10 = (void *)objc_msgSend_copy(v2, v6, v7, v8, v9);

  return v10;
}

- (int)espressoExecutionEngine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  int v17;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_BOOLForKey_(v6, v7, (uint64_t)CFSTR("CSU_UseEspressoCPUEngine"), v8, v9);

  if ((v10 & 1) != 0)
    return 0;
  objc_msgSend_computeDevice(self, v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = sub_23A00ACE4(v16);

  return v17;
}

- (void)setEspressoExecutionEngine:(int)a3
{
  ((void (*)(CSUSystemSearchTextEncoderV1Configuration *, char *, _QWORD))MEMORY[0x24BEDD108])(self, sel_setEspressoExecutionEngine_, *(_QWORD *)&a3);
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
  objc_storeStrong((id *)&self->_computeDevice, a3);
}

- (NSArray)additionalLayerNames
{
  return self->_additionalLayerNames;
}

- (void)setAdditionalLayerNames:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLayerNames, a3);
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)vocabularyModelPath
{
  return self->_vocabularyModelPath;
}

- (void)setVocabularyModelPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)tokenEmbeddingNetworkPath
{
  return self->_tokenEmbeddingNetworkPath;
}

- (void)setTokenEmbeddingNetworkPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)textEncoderNetworkPath
{
  return self->_textEncoderNetworkPath;
}

- (void)setTextEncoderNetworkPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (void)setMaximumSequenceLength:(unint64_t)a3
{
  self->_maximumSequenceLength = a3;
}

- (unint64_t)tokenEmbeddingLength
{
  return self->_tokenEmbeddingLength;
}

- (void)setTokenEmbeddingLength:(unint64_t)a3
{
  self->_tokenEmbeddingLength = a3;
}

- (BOOL)inputIsLowerCase
{
  return self->_inputIsLowerCase;
}

- (void)setInputIsLowerCase:(BOOL)a3
{
  self->_inputIsLowerCase = a3;
}

- (NSString)inputTextIDTensorName
{
  return self->_inputTextIDTensorName;
}

- (void)setInputTextIDTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)outputTokenEmbeddingIDTensorName
{
  return self->_outputTokenEmbeddingIDTensorName;
}

- (void)setOutputTokenEmbeddingIDTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)inputTokenEmbeddingIDTensorName
{
  return self->_inputTokenEmbeddingIDTensorName;
}

- (void)setInputTokenEmbeddingIDTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)inputTokenEmbeddingMaskTensorName
{
  return self->_inputTokenEmbeddingMaskTensorName;
}

- (void)setInputTokenEmbeddingMaskTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)outputTextEmbeddingTensorName
{
  return self->_outputTextEmbeddingTensorName;
}

- (void)setOutputTextEmbeddingTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)outputLastHiddenStateTensorName
{
  return self->_outputLastHiddenStateTensorName;
}

- (void)setOutputLastHiddenStateTensorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputLastHiddenStateTensorName, 0);
  objc_storeStrong((id *)&self->_outputTextEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingMaskTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_outputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_inputTextIDTensorName, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_additionalLayerNames, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end
