@implementation WFSpeechSynthesizer

- (WFSpeechSynthesizer)init
{
  WFSpeechSynthesizer *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMapTable *avUtteranceOutputTable;
  WFSpeechSynthesizer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFSpeechSynthesizer;
  v2 = -[WFSpeechSynthesizer init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.WFSpeechSynthesizer", v3, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    avUtteranceOutputTable = v2->_avUtteranceOutputTable;
    v2->_avUtteranceOutputTable = (NSMapTable *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)speakUtterance:(id)a3 usingVoice:(id)a4 rate:(double)a5 pitch:(double)a6
{
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD block[4];
  id v19;
  WFSpeechSynthesizer *v20;
  id v21;
  double v22;
  double v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpeechSynthesizer.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utterance"));

  }
  getWFTextToSpeechLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v25 = "-[WFSpeechSynthesizer speakUtterance:usingVoice:rate:pitch:]";
    v26 = 2112;
    v27 = v11;
    v28 = 2048;
    v29 = a5;
    v30 = 2048;
    v31 = a6;
    v32 = 2112;
    v33 = v12;
    _os_log_impl(&dword_22D353000, v13, OS_LOG_TYPE_INFO, "%s Asked to synthesize '%@' at rate %f, pitch %f using voice %@", buf, 0x34u);
  }

  -[WFSpeechSynthesizer queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__WFSpeechSynthesizer_speakUtterance_usingVoice_rate_pitch___block_invoke;
  block[3] = &unk_24F8B36A8;
  v19 = v12;
  v20 = self;
  v21 = v11;
  v22 = a5;
  v23 = a6;
  v15 = v11;
  v16 = v12;
  dispatch_async(v14, block);

}

- (void)speakUtteranceIntoFile:(id)a3 usingVoice:(id)a4 rate:(double)a5 pitch:(double)a6
{
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  double v21;
  double v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpeechSynthesizer.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utterance"));

  }
  getWFTextToSpeechLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v24 = "-[WFSpeechSynthesizer speakUtteranceIntoFile:usingVoice:rate:pitch:]";
    v25 = 2112;
    v26 = v11;
    v27 = 2048;
    v28 = a5;
    v29 = 2048;
    v30 = a6;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_22D353000, v13, OS_LOG_TYPE_INFO, "%s Asked to synthesize '%@' into file at rate %f, pitch %f using voice %@", buf, 0x34u);
  }

  -[WFSpeechSynthesizer queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WFSpeechSynthesizer_speakUtteranceIntoFile_usingVoice_rate_pitch___block_invoke;
  block[3] = &unk_24F8B36A8;
  block[4] = self;
  v19 = v12;
  v20 = v11;
  v21 = a5;
  v22 = a6;
  v15 = v11;
  v16 = v12;
  dispatch_async(v14, block);

}

- (void)stop
{
  -[AVSpeechSynthesizer stopSpeakingAtBoundary:](self->_avSynthesizer, "stopSpeakingAtBoundary:", 0);
}

- (AVSpeechSynthesizer)avSynthesizer
{
  AVSpeechSynthesizer *avSynthesizer;
  void *v4;
  objc_class *v5;
  AVSpeechSynthesizer *v6;
  AVSpeechSynthesizer *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  avSynthesizer = self->_avSynthesizer;
  if (!avSynthesizer)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getAVSpeechSynthesizerClass_softClass;
    v13 = getAVSpeechSynthesizerClass_softClass;
    if (!getAVSpeechSynthesizerClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getAVSpeechSynthesizerClass_block_invoke;
      v9[3] = &unk_24F8BB430;
      v9[4] = &v10;
      __getAVSpeechSynthesizerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (AVSpeechSynthesizer *)objc_alloc_init(v5);
    -[AVSpeechSynthesizer setIsInternalSynth:](v6, "setIsInternalSynth:", 1);
    -[AVSpeechSynthesizer setDelegate:](v6, "setDelegate:", self);
    v7 = self->_avSynthesizer;
    self->_avSynthesizer = v6;

    avSynthesizer = self->_avSynthesizer;
  }
  return avSynthesizer;
}

- (void)failSpeakingAVUtterance:(id)a3 withError:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpeechSynthesizer.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utterance"));

  }
  -[WFSpeechSynthesizer avUtteranceOutputTable](self, "avUtteranceOutputTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v11);

  objc_msgSend(v11, "speechString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSpeechSynthesizer failSpeakingUtterance:withError:](self, "failSpeakingUtterance:withError:", v9, v7);

}

- (void)failSpeakingUtterance:(id)a3 withError:(id)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpeechSynthesizer.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utterance"));

  }
  -[WFSpeechSynthesizer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WFSpeechSynthesizer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "speechSynthesizer:didFailSpeakingUtterance:error:", self, v12, v7);

  }
}

- (id)outputFileURLForUtterance:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpeechSynthesizer.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utterance"));

  }
  objc_msgSend(MEMORY[0x24BE194F8], "sanitizedFilename:withExtension:", v5, CFSTR("caf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19628], "proposedSharedTemporaryFileURLForFilename:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (VSSpeechSynthesizer)vsSynthesizer
{
  VSSpeechSynthesizer *vsSynthesizer;
  void *v4;
  objc_class *v5;
  id v6;
  VSSpeechSynthesizer *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  vsSynthesizer = self->_vsSynthesizer;
  if (!vsSynthesizer)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getVSSpeechSynthesizerClass_softClass;
    v13 = getVSSpeechSynthesizerClass_softClass;
    if (!getVSSpeechSynthesizerClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getVSSpeechSynthesizerClass_block_invoke;
      v9[3] = &unk_24F8BB430;
      v9[4] = &v10;
      __getVSSpeechSynthesizerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = objc_alloc_init(v5);
    objc_msgSend(v6, "setDelegate:", self);
    v7 = self->_vsSynthesizer;
    self->_vsSynthesizer = (VSSpeechSynthesizer *)v6;

    vsSynthesizer = self->_vsSynthesizer;
  }
  return vsSynthesizer;
}

- (id)vsSpeechRequestForVoice:(id)a3 utterance:(id)a4 rate:(double)a5 pitch:(double)a6 intoFile:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  objc_msgSend(v12, "vsVoiceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "avVoice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "gender");

  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v17 = (void *)getVSSpeechRequestClass_softClass;
  v33 = getVSSpeechRequestClass_softClass;
  if (!getVSSpeechRequestClass_softClass)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __getVSSpeechRequestClass_block_invoke;
    v29[3] = &unk_24F8BB430;
    v29[4] = &v30;
    __getVSSpeechRequestClass_block_invoke((uint64_t)v29);
    v17 = (void *)v31[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v30, 8);
  v19 = objc_alloc_init(v18);
  objc_msgSend(v12, "languageCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLanguageCode:", v20);

  objc_msgSend(v19, "setGender:", v16);
  objc_msgSend(v19, "setVoiceName:", v14);
  if (a5 < 0.0 || a5 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat WFScaledValue(CGFloat, CGFloat, CGFloat, CGFloat)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("WFSpeechSynthesizer.m"), 71, CFSTR("unitValue must be [0, 1]"));

  }
  v21 = a5 + -0.5;
  v22 = 0.5;
  if (a5 < 0.5)
    v21 = a5;
  v23 = 1.0;
  if (a5 < 0.5)
    v23 = 0.5;
  v24 = v21 + v21;
  if (a5 >= 0.5)
    v22 = 3.0;
  objc_msgSend(v19, "setRate:", v23 + v22 * v24);
  objc_msgSend(v19, "setPitch:", a6);
  objc_msgSend(v19, "setText:", v13);
  objc_msgSend(v19, "setShouldCache:", 0);
  if (v7)
  {
    -[WFSpeechSynthesizer outputFileURLForUtterance:](self, "outputFileURLForUtterance:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOutputPath:", v25);

  }
  return v19;
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 forRequest:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  length = a4.length;
  location = a4.location;
  v12 = a5;
  -[WFSpeechSynthesizer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WFSpeechSynthesizer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "speechSynthesizer:willSpeakRangeOfUtterance:utterance:", self, location, length, v11);

  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7
{
  _BOOL4 v7;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = a7;
  objc_msgSend(a4, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WFSpeechSynthesizer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[WFSpeechSynthesizer delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "speechSynthesizer:didFinishSpeakingUtterance:", self, v10);

    }
  }
  else
  {
    -[WFSpeechSynthesizer failSpeakingUtterance:withError:](self, "failSpeakingUtterance:withError:", v10, v14);
  }

}

- (void)speechSynthesizer:(id)a3 didFinishSynthesisRequest:(id)a4 withInstrumentMetrics:(id)a5 error:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a6;
  v8 = a4;
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    -[WFSpeechSynthesizer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v10, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSpeechSynthesizer delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "speechSynthesizer:didFinishSpeakingUtterance:intoFile:", self, v9, v13);

    }
    else
    {
      -[WFSpeechSynthesizer delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0)
        goto LABEL_8;
      -[WFSpeechSynthesizer delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "speechSynthesizer:didFinishSpeakingUtterance:", self, v9);
    }

    goto LABEL_8;
  }
  -[WFSpeechSynthesizer failSpeakingUtterance:withError:](self, "failSpeakingUtterance:withError:", v9, v17);
LABEL_8:

}

- (id)avSpeechUtteranceForVoice:(id)a3 utterance:(id)a4 rate:(double)a5 pitch:(double)a6
{
  float v6;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  float v18;
  _DWORD *v19;
  void *v20;
  float *v21;
  void *v22;
  float *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v12 = a3;
  v13 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpeechSynthesizer.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utterance"));

  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x2050000000;
  v14 = (void *)getAVSpeechUtteranceClass_softClass;
  v46 = getAVSpeechUtteranceClass_softClass;
  if (!getAVSpeechUtteranceClass_softClass)
  {
    v38 = MEMORY[0x24BDAC760];
    v39 = 3221225472;
    v40 = (uint64_t)__getAVSpeechUtteranceClass_block_invoke;
    v41 = &unk_24F8BB430;
    v42 = &v43;
    __getAVSpeechUtteranceClass_block_invoke((uint64_t)&v38);
    v14 = (void *)v44[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v43, 8);
  objc_msgSend(v15, "speechUtteranceWithString:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = a6;
  objc_msgSend(v16, "setPitchMultiplier:", v17);
  v38 = 0;
  v39 = (uint64_t)&v38;
  v18 = 1.0842e-19;
  v40 = 0x2020000000;
  v19 = (_DWORD *)getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_ptr;
  v41 = (void *)getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_ptr;
  if (!getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_ptr)
  {
    v20 = AVFoundationLibrary();
    v19 = dlsym(v20, "AVSpeechUtteranceMinimumSpeechRate");
    *(_QWORD *)(v39 + 24) = v19;
    getAVSpeechUtteranceMinimumSpeechRateSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v38, 8);
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "float getAVSpeechUtteranceMinimumSpeechRate(void)");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("WFSpeechSynthesizer.m"), 46, CFSTR("%s"), dlerror(), v38);
LABEL_32:

    __break(1u);
LABEL_33:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat WFScaledValue(CGFloat, CGFloat, CGFloat, CGFloat)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("WFSpeechSynthesizer.m"), 71, CFSTR("unitValue must be [0, 1]"));

    goto LABEL_16;
  }
  LODWORD(a6) = *v19;
  v38 = 0;
  v39 = (uint64_t)&v38;
  v40 = 0x2020000000;
  v21 = (float *)getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_ptr;
  v41 = (void *)getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_ptr;
  if (!getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_ptr)
  {
    v22 = AVFoundationLibrary();
    v21 = (float *)dlsym(v22, "AVSpeechUtteranceMaximumSpeechRate");
    *(_QWORD *)(v39 + 24) = v21;
    getAVSpeechUtteranceMaximumSpeechRateSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v38, 8);
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "float getAVSpeechUtteranceMaximumSpeechRate(void)");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("WFSpeechSynthesizer.m"), 47, CFSTR("%s"), dlerror(), v38);
    goto LABEL_32;
  }
  v6 = *v21;
  v38 = 0;
  v39 = (uint64_t)&v38;
  v40 = 0x2020000000;
  v23 = (float *)getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_ptr;
  v41 = (void *)getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_ptr;
  if (!getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_ptr)
  {
    v24 = AVFoundationLibrary();
    v23 = (float *)dlsym(v24, "AVSpeechUtteranceDefaultSpeechRate");
    *(_QWORD *)(v39 + 24) = v23;
    getAVSpeechUtteranceDefaultSpeechRateSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v38, 8);
  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "float getAVSpeechUtteranceDefaultSpeechRate(void)");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("WFSpeechSynthesizer.m"), 48, CFSTR("%s"), dlerror(), v38);
    goto LABEL_32;
  }
  v18 = *v23;
  if (a5 < 0.0 || a5 > 1.0)
    goto LABEL_33;
LABEL_16:
  if (v6 < *(float *)&a6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat WFScaledValue(CGFloat, CGFloat, CGFloat, CGFloat)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFSpeechSynthesizer.m"), 72, CFSTR("max must be >= min"));

  }
  if (v18 < *(float *)&a6 || v18 > v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat WFScaledValue(CGFloat, CGFloat, CGFloat, CGFloat)");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("WFSpeechSynthesizer.m"), 73, CFSTR("default must be >= min, <= max"));

  }
  v25 = a5 + -0.5;
  if (a5 >= 0.5)
  {
    v26 = v18;
  }
  else
  {
    v25 = a5;
    v26 = *(float *)&a6;
  }
  if (a5 >= 0.5)
    v27 = v6;
  else
    v27 = v18;
  v28 = v26 + (v27 - v26) * (v25 + v25);
  *(float *)&v28 = v28;
  objc_msgSend(v16, "setRate:", v28);
  objc_msgSend(v12, "avVoice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v16, "setVoice:", v29);

  return v16;
}

- (unint64_t)audioFormatForSettings:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t result;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v4 = (_QWORD *)getAVLinearPCMIsFloatKeySymbolLoc_ptr;
  v23 = getAVLinearPCMIsFloatKeySymbolLoc_ptr;
  if (!getAVLinearPCMIsFloatKeySymbolLoc_ptr)
  {
    v5 = AVFoundationLibrary();
    v4 = dlsym(v5, "AVLinearPCMIsFloatKey");
    v21[3] = (uint64_t)v4;
    getAVLinearPCMIsFloatKeySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v20, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMIsFloatKey(void)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFSpeechSynthesizer.m"), 43, CFSTR("%s"), dlerror());
LABEL_22:

    __break(1u);
    return result;
  }
  objc_msgSend(v3, "objectForKey:", *v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v8 = (_QWORD *)getAVLinearPCMBitDepthKeySymbolLoc_ptr;
  v23 = getAVLinearPCMBitDepthKeySymbolLoc_ptr;
  if (!getAVLinearPCMBitDepthKeySymbolLoc_ptr)
  {
    v9 = AVFoundationLibrary();
    v8 = dlsym(v9, "AVLinearPCMBitDepthKey");
    v21[3] = (uint64_t)v8;
    getAVLinearPCMBitDepthKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v20, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMBitDepthKey(void)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFSpeechSynthesizer.m"), 42, CFSTR("%s"), dlerror());
    goto LABEL_22;
  }
  objc_msgSend(v3, "objectForKey:", *v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v12 = 16;
  if (v7)
    v12 = 64;
  v13 = 2;
  if (!v7)
    v13 = 3;
  v14 = 4;
  if (v7)
    v14 = 1;
  if (v11 == v12)
    v15 = v13;
  else
    v15 = 0;
  if (v11 == 32)
    v16 = v14;
  else
    v16 = v15;

  return v16;
}

- (id)invalidAudioBufferError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Unable to Make Spoken Audio from Text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFSpeechSynthesizerErrorDomain"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 utterance:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  length = a4.length;
  location = a4.location;
  v12 = a5;
  -[WFSpeechSynthesizer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WFSpeechSynthesizer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "speechString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "speechSynthesizer:willSpeakRangeOfUtterance:utterance:", self, location, length, v11);

  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v15 = a4;
  -[WFSpeechSynthesizer avUtteranceOutputTable](self, "avUtteranceOutputTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSpeechSynthesizer avUtteranceOutputTable](self, "avUtteranceOutputTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v15);

  if (v6)
  {
    -[WFSpeechSynthesizer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v6, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSpeechSynthesizer delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "speechString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "speechSynthesizer:didFinishSpeakingUtterance:intoFile:", self, v12, v10);

LABEL_6:
      goto LABEL_7;
    }
  }
  -[WFSpeechSynthesizer delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WFSpeechSynthesizer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "speechString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "speechSynthesizer:didFinishSpeakingUtterance:", self, v11);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  -[WFSpeechSynthesizer failSpeakingAVUtterance:withError:](self, "failSpeakingAVUtterance:withError:", a4, 0);
}

- (WFSpeechSynthesizerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (WFSpeechSynthesizerDelegate *)a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)avUtteranceOutputTable
{
  return self->_avUtteranceOutputTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avUtteranceOutputTable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vsSynthesizer, 0);
  objc_storeStrong((id *)&self->_avSynthesizer, 0);
}

void __68__WFSpeechSynthesizer_speakUtteranceIntoFile_usingVoice_rate_pitch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  objc_class *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id location;
  uint64_t p_location;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  objc_msgSend(*(id *)(a1 + 32), "avSpeechUtteranceForVoice:utterance:rate:pitch:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "avVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioFileSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "defaultAudioFileSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");

    v5 = (void *)v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "outputFileURLForUtterance:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avUtteranceOutputTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v2);

  location = 0;
  p_location = (uint64_t)&location;
  v31 = 0x2020000000;
  v10 = (_QWORD *)getAVAudioFileTypeKeySymbolLoc_ptr;
  v32 = (void *)getAVAudioFileTypeKeySymbolLoc_ptr;
  if (!getAVAudioFileTypeKeySymbolLoc_ptr)
  {
    v11 = AVFoundationLibrary();
    v10 = dlsym(v11, "AVAudioFileTypeKey");
    *(_QWORD *)(p_location + 24) = v10;
    getAVAudioFileTypeKeySymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&location, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAudioFileTypeKey(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WFSpeechSynthesizer.m"), 38, CFSTR("%s"), dlerror());
LABEL_17:

    __break(1u);
    return;
  }
  objc_msgSend(v5, "setObject:forKey:", &unk_24F93A418, *v10);
  v12 = objc_msgSend(*(id *)(a1 + 32), "audioFormatForSettings:", v5);
  location = 0;
  p_location = (uint64_t)&location;
  v31 = 0x2020000000;
  v13 = (_QWORD *)getAVLinearPCMIsNonInterleavedSymbolLoc_ptr;
  v32 = (void *)getAVLinearPCMIsNonInterleavedSymbolLoc_ptr;
  if (!getAVLinearPCMIsNonInterleavedSymbolLoc_ptr)
  {
    v14 = AVFoundationLibrary();
    v13 = dlsym(v14, "AVLinearPCMIsNonInterleaved");
    *(_QWORD *)(p_location + 24) = v13;
    getAVLinearPCMIsNonInterleavedSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&location, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMIsNonInterleaved(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WFSpeechSynthesizer.m"), 44, CFSTR("%s"), dlerror());
    goto LABEL_17;
  }
  objc_msgSend(v5, "objectForKey:", *v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v17 = (void *)getAVAudioFileClass_softClass;
  v37 = getAVAudioFileClass_softClass;
  if (!getAVAudioFileClass_softClass)
  {
    location = (id)MEMORY[0x24BDAC760];
    p_location = 3221225472;
    v31 = (uint64_t)__getAVAudioFileClass_block_invoke;
    v32 = &unk_24F8BB430;
    v33 = &v34;
    __getAVAudioFileClass_block_invoke((uint64_t)&location);
    v17 = (void *)v35[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v34, 8);
  v28 = 0;
  v19 = (void *)objc_msgSend([v18 alloc], "initForWriting:settings:commonFormat:interleaved:error:", v8, v5, v12, v16 ^ 1u, &v28);
  v20 = v28;
  if (v19)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "avSynthesizer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __68__WFSpeechSynthesizer_speakUtteranceIntoFile_usingVoice_rate_pitch___block_invoke_126;
    v24[3] = &unk_24F8B36D0;
    objc_copyWeak(&v27, &location);
    v25 = v2;
    v26 = v19;
    objc_msgSend(v21, "writeUtterance:toBufferCallback:", v25, v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failSpeakingAVUtterance:withError:", v2, v20);
  }

}

void __68__WFSpeechSynthesizer_speakUtteranceIntoFile_usingVoice_rate_pitch___block_invoke_126(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  char isKindOfClass;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v5 = (void *)getAVAudioPCMBufferClass_softClass;
  v19 = getAVAudioPCMBufferClass_softClass;
  if (!getAVAudioPCMBufferClass_softClass)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __getAVAudioPCMBufferClass_block_invoke;
    v15[3] = &unk_24F8BB430;
    v15[4] = &v16;
    __getAVAudioPCMBufferClass_block_invoke((uint64_t)v15);
    v5 = (void *)v17[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v16, 8);
  isKindOfClass = objc_opt_isKindOfClass();
  if (!v3 || (isKindOfClass & 1) == 0)
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "invalidAudioBufferError");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v12 = WeakRetained;
    v11 = v13;
    goto LABEL_8;
  }
  v8 = *(void **)(a1 + 40);
  v14 = 0;
  v9 = objc_msgSend(v8, "writeFromBuffer:error:", v3, &v14);
  v10 = v14;
  if ((v9 & 1) == 0)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = WeakRetained;
LABEL_8:
    objc_msgSend(v12, "failSpeakingAVUtterance:withError:", v11, v10);
  }

}

void __60__WFSpeechSynthesizer_speakUtterance_usingVoice_rate_pitch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "isSiriVoice")
    && (objc_msgSend(*(id *)(a1 + 40), "vsSpeechRequestForVoice:utterance:rate:pitch:intoFile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0, *(double *)(a1 + 56), *(double *)(a1 + 64)), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    getWFActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFSpeechSynthesizer speakUtterance:usingVoice:rate:pitch:]_block_invoke";
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_INFO, "%s voiced is available, and we are using a Siri voice - let's use it. Assembled VS request %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "vsSynthesizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startSpeakingRequest:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "speechSynthesizer:didFailSpeakingUtterance:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);

      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "avSpeechUtteranceForVoice:utterance:rate:pitch:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "avSynthesizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "speakUtterance:", v11);

  }
}

+ (id)defaultAudioFileSettings
{
  void *v2;
  void *v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = 32;
  v5 = 0x40D5888000000000;
  v7 = 0x100000004;
  v6 = xmmword_22D6AD5A0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", &v5);
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
