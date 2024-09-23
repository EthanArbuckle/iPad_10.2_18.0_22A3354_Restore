@implementation CSUVisualGenerationTextEncoderV1Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  return a3;
}

+ (id)pathForResource:(id)a3 ofType:(id)a4 inDirectory:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  const char *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _QWORD v71[5];

  v71[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD1488];
  v62 = v7;
  v63 = v8;
  v11 = objc_opt_class();
  objc_msgSend_bundleForClass_(v10, v12, v11, v13, v14);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v9, v15, (uint64_t)v7, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathExtension_(v18, v19, (uint64_t)v8, v20, v21);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pathForResource_ofType_inDirectory_(v64, v22, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v23;
  if (v23)
  {
    v28 = v23;
  }
  else
  {
    objc_msgSend_stringByAppendingPathComponent_(CFSTR("/Library/Application Support/com.apple.CoreSceneUnderstanding"), v24, (uint64_t)v65, v25, v26, v7, v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v29;
    NSHomeDirectory();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(CFSTR("Library/Application Support/com.apple.CoreSceneUnderstanding"), v31, (uint64_t)v65, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v30, v35, (uint64_t)v34, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v38;
    objc_msgSend_stringByAppendingPathComponent_(CFSTR("/var/mobile/Library/Application Support/com.apple.CoreSceneUnderstanding"), v39, (uint64_t)v65, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v42;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v43, (uint64_t)v71, 3, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v46 = v45;
    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v66, (uint64_t)v70, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v67;
LABEL_5:
      v50 = 0;
      while (1)
      {
        if (*(_QWORD *)v67 != v49)
          objc_enumerationMutation(v46);
        v28 = *(id *)(*((_QWORD *)&v66 + 1) + 8 * v50);
        objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v51, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend_fileExistsAtPath_(v55, v56, (uint64_t)v28, v57, v58);

        if ((v59 & 1) != 0)
          break;

        if (v48 == ++v50)
        {
          v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v60, (uint64_t)&v66, (uint64_t)v70, 16);
          if (v48)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v28 = 0;
    }

  }
  return v28;
}

+ (id)VisualGenerationTextEncoderV1ConfigurationForRevision:(int64_t)a3 error:(id *)a4
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
  id v22;
  const char *v23;
  void *inited;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15) == 1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(a1, v16, (uint64_t)CFSTR("spiece"), (uint64_t)CFSTR("model"), (uint64_t)CFSTR("models/VisualGeneration/v1.0/"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_inDirectory_(a1, v20, (uint64_t)CFSTR("dreamotorch_2kbcv9xagr_100_clip_embedder"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("models/VisualGeneration/v1.0/"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc((Class)a1);
    inited = (void *)objc_msgSend_initVisualGenerationTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_(v22, v23, 1, (uint64_t)v19, 0, v21);
  }
  else
  {
    if (!a4)
    {
      inited = 0;
      goto LABEL_6;
    }
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, a3, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v25, v26, (uint64_t)CFSTR("Unsupported VisualGenerationTextEncoderV1 revision %@"), v27, v28, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v29, (uint64_t)v21, v30, v31);
    inited = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return inited;
}

- (id)initVisualGenerationTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6
{
  id v9;
  id v10;
  CSUVisualGenerationTextEncoderV1Configuration *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CSUVisualGenerationTextEncoderV1Configuration *v16;
  uint64_t v17;
  NSString *vocabularyModelPath;
  NSString *inputTextIDTensorName;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *textEncoderNetworkPath;
  NSString *outputLastHiddenState;
  NSString *outputCLIPPooledLayer;
  CSUVisualGenerationTextEncoderV1Configuration *v28;
  objc_super v30;

  v9 = a4;
  v10 = a6;
  v30.receiver = self;
  v30.super_class = (Class)CSUVisualGenerationTextEncoderV1Configuration;
  v11 = -[CSUVisualGenerationTextEncoderV1Configuration init](&v30, sel_init);
  v16 = v11;
  if (v11)
  {
    v11->_revision = a3;
    v17 = objc_msgSend_copy(v9, v12, v13, v14, v15);
    vocabularyModelPath = v16->_vocabularyModelPath;
    v16->_vocabularyModelPath = (NSString *)v17;

    v16->_maximumSequenceLength = 77;
    v16->_inputIsLowerCase = 1;
    inputTextIDTensorName = v16->_inputTextIDTensorName;
    v16->_inputTextIDTensorName = (NSString *)CFSTR("ids");

    v24 = objc_msgSend_copy(v10, v20, v21, v22, v23);
    textEncoderNetworkPath = v16->_textEncoderNetworkPath;
    v16->_textEncoderNetworkPath = (NSString *)v24;

    outputLastHiddenState = v16->_outputLastHiddenState;
    v16->_outputLastHiddenState = (NSString *)CFSTR("last_hidden_state");

    outputCLIPPooledLayer = v16->_outputCLIPPooledLayer;
    v16->_outputCLIPPooledLayer = (NSString *)CFSTR("pooled_embedding");

    v28 = v16;
  }

  return v16;
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
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_supportedComputeDevices(self, a2, v2, v3, v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            LODWORD(v8) = sub_23A00ACE4(v11);
            goto LABEL_11;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v8);
  }
LABEL_11:

  return v8;
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

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (unint64_t)tokenEmbeddingLength
{
  return self->_tokenEmbeddingLength;
}

- (BOOL)inputIsLowerCase
{
  return self->_inputIsLowerCase;
}

- (NSString)inputTextIDTensorName
{
  return self->_inputTextIDTensorName;
}

- (NSString)outputLastHiddenState
{
  return self->_outputLastHiddenState;
}

- (NSString)outputCLIPPooledLayer
{
  return self->_outputCLIPPooledLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputCLIPPooledLayer, 0);
  objc_storeStrong((id *)&self->_outputLastHiddenState, 0);
  objc_storeStrong((id *)&self->_inputTextIDTensorName, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end
