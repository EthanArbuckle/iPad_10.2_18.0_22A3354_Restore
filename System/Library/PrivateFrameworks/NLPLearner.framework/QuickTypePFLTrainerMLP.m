@implementation QuickTypePFLTrainerMLP

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLP", "QuickTypePFLTrainerMLP");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

+ (__CFData)copyToFlatBuffer:(void *)a3
{
  const __CFArray *v3;
  const __CFData *ValueAtIndex;
  CFIndex Length;
  __CFData *MutableCopy;
  CFTypeRef cf;

  cf = 0;
  v3 = (const __CFArray *)NLModelContainerCopySplitContainerData();
  if (CFArrayGetCount(v3) != 2)
    __assert_rtn("+[QuickTypePFLTrainerMLP copyToFlatBuffer:]", "QuickTypePFLTrainerMLP.mm", 64, "CFArrayGetCount(containerDataArray) == 2 && \"NLModelContainerCopySplitContainerData is expected to return an array of size 2\");
  ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(v3, 1);
  Length = CFDataGetLength(ValueAtIndex);
  MutableCopy = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], Length, ValueAtIndex);
  if (v3)
    CFRelease(v3);
  return MutableCopy;
}

+ (id)reportingStringForModelUpdates:(float *)a3 count:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  float *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  if (a4 >= 3)
    v7 = 3;
  else
    v7 = a4;
  if (v7)
  {
    v8 = a3;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), *v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      ++v8;
      --v7;
    }
    while (v7);
  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ .. %f"), v10, a3[a4 - 1]);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  v26[0] = CFSTR("ModelUpdate");
  v26[1] = CFSTR("ModelShape");
  v27[0] = v10;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%zu,)"), a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v13, 0, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  if (!objc_msgSend(v14, "length") || v15)
  {
    v17 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      +[QuickTypePFLTrainerMLP reportingStringForModelUpdates:count:].cold.1((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
    v16 = 0;
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
  }

  return v16;
}

- (QuickTypePFLTrainerMLP)initWithSeedModelPath:(id)a3 andPrivacyIdentifier:(id)a4
{
  id v6;
  id v7;
  QuickTypePFLTrainerMLP *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSURL *seedModelPath;
  uint64_t v13;
  NSNumber *clippingNorm;
  uint64_t v15;
  NSString *privacyIdentifier;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)QuickTypePFLTrainerMLP;
  v8 = -[QuickTypePFLTrainerMLP init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCF48]);
    objc_msgSend(v6, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithString:", v10);
    seedModelPath = v8->_seedModelPath;
    v8->_seedModelPath = (NSURL *)v11;

    nlp::CFScopedPtr<void *>::reset((const void **)&v8->_model.m_ref, 0);
    v8->_batchSize = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 5.0);
    v13 = objc_claimAutoreleasedReturnValue();
    clippingNorm = v8->_clippingNorm;
    v8->_clippingNorm = (NSNumber *)v13;

    v8->_normBinCount = 30;
    v15 = objc_msgSend(v7, "copy");
    privacyIdentifier = v8->_privacyIdentifier;
    v8->_privacyIdentifier = (NSString *)v15;

  }
  return v8;
}

- (BOOL)trainOn:(id)a3 forNEpochs:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  const void *v18;
  const void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  NSNumber *v25;
  NSNumber *initialLoss;
  NSObject *v27;
  float v28;
  id v29;
  void *v30;
  NSObject *v31;
  const void *v32;
  void *v33;
  NSNumber *v34;
  NSNumber *trainingLoss;
  NSObject *v36;
  float v37;
  BOOL v38;
  id v40;
  _QWORD v41[4];
  id v42;
  char *v43;
  char v44;
  _QWORD v45[4];
  id v46;
  const void *v47;
  const void *v48;
  CFTypeRef cf;
  uint8_t buf[4];
  double v51;
  _QWORD v52[3];
  _QWORD v53[5];

  v53[3] = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v52[0] = *MEMORY[0x24BE68F28];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v6;
  v52[1] = *MEMORY[0x24BE68EE8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_batchSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = *MEMORY[0x24BE68EF0];
  v53[1] = v7;
  v53[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[QuickTypePFLTrainerMLP learningRate](self, "learningRate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    -[QuickTypePFLTrainerMLP learningRate](self, "learningRate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE68F18]);

  }
  -[QuickTypePFLTrainerMLP gradientClipMax](self, "gradientClipMax");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[QuickTypePFLTrainerMLP gradientClipMin](self, "gradientClipMin");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      -[QuickTypePFLTrainerMLP gradientClipMin](self, "gradientClipMin");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE68F10]);

      -[QuickTypePFLTrainerMLP gradientClipMax](self, "gradientClipMax");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE68F08]);

    }
  }
  cf = 0;
  v18 = (const void *)NLModelContainerCreateWithContentsOfURL();
  v48 = v18;
  if (v18 && (v19 = (const void *)MLPModelTrainerCreateWithModel(), v47 = v19, CFRelease(v18), v48 = 0, v19))
  {
    v20 = MEMORY[0x24BDAC760];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke;
    v45[3] = &unk_24EDB9338;
    v21 = v40;
    v46 = v21;
    v22 = (void *)MEMORY[0x227695280](v45);
    v23 = (void *)MLPModelTrainerEvaluateModel();
    v24 = (_QWORD *)MEMORY[0x24BE68F20];
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BE68F20]);
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    initialLoss = self->_initialLoss;
    self->_initialLoss = v25;

    v27 = (id)sLog;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      -[NSNumber floatValue](self->_initialLoss, "floatValue");
      *(_DWORD *)buf = 134217984;
      v51 = v28;
      _os_log_impl(&dword_22630F000, v27, OS_LOG_TYPE_INFO, "Initial loss: %.2f", buf, 0xCu);
    }

    objc_msgSend(v21, "rewind");
    v44 = 1;
    v41[0] = v20;
    v41[1] = 3221225472;
    v41[2] = __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke_54;
    v41[3] = &unk_24EDB9360;
    v29 = v21;
    v42 = v29;
    v43 = &v44;
    v30 = (void *)MEMORY[0x227695280](v41);
    v31 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22630F000, v31, OS_LOG_TYPE_INFO, "Started training", buf, 2u);
    }
    v32 = (const void *)MLPModelTrainerTrainModel();
    nlp::CFScopedPtr<void *>::reset((const void **)&self->_model.m_ref, v32);
    objc_msgSend(v29, "rewind");
    v33 = (void *)MLPModelTrainerEvaluateModel();
    objc_msgSend(v33, "objectForKeyedSubscript:", *v24);
    v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    trainingLoss = self->_trainingLoss;
    self->_trainingLoss = v34;

    v36 = (id)sLog;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      -[NSNumber floatValue](self->_trainingLoss, "floatValue");
      *(_DWORD *)buf = 134217984;
      v51 = v37;
      _os_log_impl(&dword_22630F000, v36, OS_LOG_TYPE_INFO, "Training loss: %.2f", buf, 0xCu);
    }

    v38 = self->_model.m_ref != 0;
    CFRelease(v19);
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

uint64_t __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "nextTrainingDataBatch:", a3);
  result = objc_claimAutoreleasedReturnValue();
  if (!result)
    *a5 = 1;
  return result;
}

uint64_t __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke_54(uint64_t a1, uint64_t a2, unsigned int a3, int a4, _BYTE *a5)
{
  uint64_t result;

  if (a4)
    objc_msgSend(*(id *)(a1 + 32), "rewind");
  if (*(_QWORD *)(a1 + 40) != a2)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "nextTrainingDataBatch:", a3);
  result = objc_claimAutoreleasedReturnValue();
  if (!result)
    *a5 = 1;
  return result;
}

void __45__QuickTypePFLTrainerMLP_trainOn_forNEpochs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = a2;
    _os_log_impl(&dword_22630F000, v3, OS_LOG_TYPE_INFO, "PFL Training %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)getWeightUpdatesAddNoise:(BOOL)a3 encryptionKey:(id)a4 recipe:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  const void *v13;
  const __CFData *v14;
  const UInt8 *BytePtr;
  __CFData *v16;
  UInt8 *MutableBytePtr;
  unint64_t Length;
  unint64_t v19;
  double v20;
  float v21;
  uint64_t v22;
  float *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  double v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  QuickTypeWeightUpdates *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  void *v43;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  QuickTypeWeightUpdates *v54;
  void *v55;
  id v56;
  id v57;
  __CFData *v58;
  const __CFData *v59;
  const void *v60;
  uint8_t v61[16];
  uint8_t v62[32];
  uint8_t buf[32];
  uint64_t v64;

  v6 = a3;
  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v56 = a5;
  if (!self->_model.m_ref)
  {
    v55 = v8;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.1();
    goto LABEL_53;
  }
  if ((!v8 || !v6) && !+[NLPLearnerUtils isInternalInstall](NLPLearnerUtils, "isInternalInstall"))
  {
    v55 = v8;
LABEL_53:
    v35 = 0;
    goto LABEL_59;
  }
  v54 = objc_alloc_init(QuickTypeWeightUpdates);
  v9 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22630F000, v9, OS_LOG_TYPE_INFO, "Dumping updated model weights", buf, 2u);
  }
  if (objc_msgSend(v56, "pluginShouldAddNoiseAndEncryptResult"))
  {
    v10 = (id)sLog;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.9(v11, (uint64_t)v8, (uint64_t)buf, v10);
    }

    v12 = v8;
  }
  else
  {

    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
      -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.10();
    v12 = 0;
    LODWORD(v6) = 0;
  }
  v55 = v12;
  v13 = (const void *)NLModelContainerCreateWithContentsOfURL();
  v60 = v13;
  v14 = (const __CFData *)objc_msgSend((id)objc_opt_class(), "copyToFlatBuffer:", v13);
  v59 = v14;
  if (v13)
    CFRelease(v13);
  v60 = 0;
  BytePtr = CFDataGetBytePtr(v14);
  v16 = (__CFData *)objc_msgSend((id)objc_opt_class(), "copyToFlatBuffer:", self->_model.m_ref);
  v58 = v16;
  MutableBytePtr = CFDataGetMutableBytePtr(v16);
  Length = CFDataGetLength(v14);
  v19 = Length >> 2;
  if (Length >> 2 != (unint64_t)CFDataGetLength(v16) >> 2)
    __assert_rtn("-[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:]", "QuickTypePFLTrainerMLP.mm", 220, "weightCount == (CFDataGetLength(updatedModelData) / sizeof(float)) && \"Mismatching buffer lengths for seed model and updated model\");
  v52 = objc_msgSend(objc_alloc(MEMORY[0x24BE2D130]), "initWithRecipe:", v56);
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
    -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.8();
  LODWORD(v20) = 0;
  v21 = 0.0;
  if (Length >= 4)
  {
    if (v19 <= 1)
      v22 = 1;
    else
      v22 = Length >> 2;
    v23 = (float *)MutableBytePtr;
    do
    {
      v24 = *(float *)BytePtr;
      BytePtr += 4;
      v25 = *v23;
      v26 = *v23 - v24;
      *v23++ = v26;
      v20 = v26 * v26 + *(float *)&v20;
      *(float *)&v20 = v20;
      v27 = vabds_f32(v25, v24);
      if (v27 > v21)
        v21 = v27;
      --v22;
    }
    while (v22);
  }
  *(float *)&v20 = sqrtf(*(float *)&v20);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20, v52);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[QuickTypeWeightUpdates setL2Norm:](v54, "setL2Norm:", v28);

  *(float *)&v29 = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[QuickTypeWeightUpdates setMaxNorm:](v54, "setMaxNorm:", v30);

  if (v14)
    CFRelease(v14);
  v59 = 0;
  nlp::CFScopedPtr<void *>::reset((const void **)&self->_model.m_ref, 0);
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
    -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.7();
  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "reportingStringForModelUpdates:count:", MutableBytePtr, v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[QuickTypeWeightUpdates setWeightUpdatesDiagnosticReport:](v54, "setWeightUpdatesDiagnosticReport:", v36);

    v37 = (id)sLog;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      -[QuickTypeWeightUpdates weightUpdatesDiagnosticReport](v54, "weightUpdatesDiagnosticReport");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.6(v38, (uint64_t)v62, v37);
    }

    if (v55)
    {
      v57 = 0;
      objc_msgSend(v53, "encryptedDataWithPublicKey:inPlaceDataFloatNumbers:count:error:", v55, MutableBytePtr, v19, &v57);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v57;
      v34 = v39;
      if (!v33 || v39)
      {
        v45 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
          -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.4((uint64_t)v34, v45, v46, v47, v48, v49, v50, v51);
        goto LABEL_39;
      }
      if (v16)
        CFRelease(v16);
      v58 = 0;
      v40 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v61 = 0;
        _os_log_impl(&dword_22630F000, v40, OS_LOG_TYPE_INFO, "Privatization and encryption completed", v61, 2u);
      }
      v41 = (id)sLog;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.5((uint64_t)v61, objc_msgSend(v33, "length"), v41);

      -[QuickTypeWeightUpdates setWeightUpdates:](v54, "setWeightUpdates:", v33);
      v35 = v54;
      v16 = 0;
    }
    else
    {
      v42 = objc_alloc_init(MEMORY[0x24BE2D138]);
      objc_msgSend(v42, "setVersion:", 1);
      objc_msgSend(v42, "setData32s:count:", MutableBytePtr, v19);
      objc_msgSend(v42, "data");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[QuickTypeWeightUpdates setWeightUpdates:](v54, "setWeightUpdates:", v43);

      v35 = v54;
      v33 = 0;
    }
    v34 = 0;
    goto LABEL_56;
  }
  v31 = (id)sLog;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    -[QuickTypePFLTrainerMLP clippingNorm](self, "clippingNorm");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.3(v32, (uint64_t)v62, -[QuickTypePFLTrainerMLP normBinCount](self, "normBinCount"), v31);
  }

  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    -[QuickTypePFLTrainerMLP getWeightUpdatesAddNoise:encryptionKey:recipe:].cold.2();
  v33 = 0;
  v34 = 0;
LABEL_39:
  v35 = 0;
LABEL_56:

  if (v16)
    CFRelease(v16);

LABEL_59:
  return v35;
}

- (void)writeModelToURL:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_model.m_ref)
  {
    if ((NLModelContainerWriteToURL() & 1) != 0)
    {
      v5 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_22630F000, v5, OS_LOG_TYPE_INFO, "Saved PFL model at %@", buf, 0xCu);
      }
    }
    else
    {
      v6 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        -[QuickTypePFLTrainerMLP writeModelToURL:].cold.2(0, v6, v7, v8, v9, v10, v11, v12);

    }
  }
  else if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    -[QuickTypePFLTrainerMLP writeModelToURL:].cold.1();
  }

}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(id)a3
{
  objc_storeStrong((id *)&self->_learningRate, a3);
}

- (NSNumber)gradientClipMin
{
  return self->_gradientClipMin;
}

- (void)setGradientClipMin:(id)a3
{
  objc_storeStrong((id *)&self->_gradientClipMin, a3);
}

- (NSNumber)gradientClipMax
{
  return self->_gradientClipMax;
}

- (void)setGradientClipMax:(id)a3
{
  objc_storeStrong((id *)&self->_gradientClipMax, a3);
}

- (NSNumber)clippingNorm
{
  return self->_clippingNorm;
}

- (void)setClippingNorm:(id)a3
{
  objc_storeStrong((id *)&self->_clippingNorm, a3);
}

- (unint64_t)normBinCount
{
  return self->_normBinCount;
}

- (void)setNormBinCount:(unint64_t)a3
{
  self->_normBinCount = a3;
}

- (NSNumber)initialLoss
{
  return self->_initialLoss;
}

- (NSNumber)trainingLoss
{
  return self->_trainingLoss;
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyIdentifier, 0);
  objc_storeStrong((id *)&self->_clippingNorm, 0);
  objc_storeStrong((id *)&self->_gradientClipMax, 0);
  objc_storeStrong((id *)&self->_gradientClipMin, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_trainingLoss, 0);
  objc_storeStrong((id *)&self->_initialLoss, 0);
  nlp::CFScopedPtr<void *>::reset((const void **)&self->_model.m_ref, 0);
  objc_storeStrong((id *)&self->_seedModelPath, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (void)copyToFlatBuffer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "PFL model flatening failure: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)reportingStringForModelUpdates:(uint64_t)a3 count:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "Diagnostic report serialization failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)trainOn:(uint64_t)a3 forNEpochs:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "PFL seed model loading error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)trainOn:(uint64_t)a3 forNEpochs:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "PFL training error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_22630F000, v0, v1, "PFL error: model is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_22630F000, v0, v1, "PFL privatization failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)getWeightUpdatesAddNoise:(uint64_t)a3 encryptionKey:(NSObject *)a4 recipe:.cold.3(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_7(&dword_22630F000, "Privacy parameters: norm = %@, binCount = %lu", (uint8_t *)a2, a4);

  OUTLINED_FUNCTION_8();
}

- (void)getWeightUpdatesAddNoise:(uint64_t)a3 encryptionKey:(uint64_t)a4 recipe:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "PFL encryption error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getWeightUpdatesAddNoise:(uint64_t)a1 encryptionKey:(uint64_t)a2 recipe:(NSObject *)a3 .cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1_0(&dword_22630F000, a2, a3, "Encrypted data size is : %{bytes}zu", (uint8_t *)a1);
}

- (void)getWeightUpdatesAddNoise:(void *)a1 encryptionKey:(uint64_t)a2 recipe:(NSObject *)a3 .cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_22630F000, a2, a3, "Added model diagnostic report: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_8();
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_22630F000, v0, v1, "Constructed protobuf from weight updates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_22630F000, v0, v1, "Computing weight updates from flatened models", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)getWeightUpdatesAddNoise:(uint64_t)a3 encryptionKey:(NSObject *)a4 recipe:.cold.9(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_7(&dword_22630F000, "Privatization : %@. Encryption : %@", (uint8_t *)a3, a4);

  OUTLINED_FUNCTION_8();
}

- (void)getWeightUpdatesAddNoise:encryptionKey:recipe:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_22630F000, v0, v1, "Task configured by platform to skip privatization and encryption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)writeModelToURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_22630F000, v0, v1, "Failed to save PFL model: nothing to save.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)writeModelToURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "Failed to save PFL model: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
