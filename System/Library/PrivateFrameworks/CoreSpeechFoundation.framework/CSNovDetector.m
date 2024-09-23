@implementation CSNovDetector

- (CSNovDetector)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  CSNovDetector *v8;
  NSObject *v9;
  int v10;
  int v11;
  void *v12;
  CSNovDetector *v13;
  NSObject *v15;
  uint64_t v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BYTE v21[18];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSNovDetector;
  v8 = -[CSNovDetector init](&v17, sel_init);
  if (!v8)
    goto LABEL_8;
  v8->_novDetect = (void *)nd_create();
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[CSNovDetector initWithConfigPath:resourcePath:]";
    v20 = 2114;
    *(_QWORD *)v21 = v6;
    *(_WORD *)&v21[8] = 2114;
    *(_QWORD *)&v21[10] = v7;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Initializing NDAPI using %{public}@, %{public}@", buf, 0x20u);
  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4);
  v10 = nd_initialize();
  if (v10)
  {
    v11 = v10;
    v12 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v15 = v12;
      v16 = nd_error();
      *(_DWORD *)buf = 136315650;
      v19 = "-[CSNovDetector initWithConfigPath:resourcePath:]";
      v20 = 1026;
      *(_DWORD *)v21 = v11;
      *(_WORD *)&v21[4] = 2082;
      *(_QWORD *)&v21[6] = v16;
      _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to initialize NDAPI: err=[%{public}d]:%{public}s", buf, 0x1Cu);

    }
    v13 = 0;
  }
  else
  {
LABEL_8:
    v13 = v8;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_novDetect)
  {
    nd_close();
    self->_novDetect = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CSNovDetector;
  -[CSNovDetector dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  nd_reset();
}

- (void)resetBest
{
  nd_resetbest();
}

- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  objc_msgSend(objc_retainAutorelease(a3), "bytes");
  nd_wavedata();
}

- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4
{
  objc_msgSend(objc_retainAutorelease(a3), "bytes");
  nd_wavedataf();
}

- (unsigned)numResultsAvailable
{
  return nd_phrasecount();
}

- (id)getAnalyzedResultForPhId:(unsigned int)a3
{
  void *novDetect;
  uint64_t v5;

  novDetect = self->_novDetect;
  if (novDetect)
  {
    if ((int)nd_phrasecount() < 1)
      v5 = nd_getresults();
    else
      v5 = nd_getphraseresults();
    -[CSNovDetector _getAnalyzedResultFromNdresult:](self, "_getAnalyzedResultFromNdresult:", v5);
    novDetect = (void *)objc_claimAutoreleasedReturnValue();
  }
  return novDetect;
}

- (id)getBestAnalyzedResult
{
  void *novDetect;

  novDetect = self->_novDetect;
  if (novDetect)
  {
    -[CSNovDetector _getAnalyzedResultFromNdresult:](self, "_getAnalyzedResultFromNdresult:", nd_getresults());
    novDetect = (void *)objc_claimAutoreleasedReturnValue();
  }
  return novDetect;
}

- (id)_getAnalyzedResultFromNdresult:(_ndresult *)a3
{
  CSNovDetectorResult *v4;
  double v5;

  if (a3)
  {
    v4 = objc_alloc_init(CSNovDetectorResult);
    -[CSNovDetectorResult setSampleFed:](v4, "setSampleFed:", a3->var0);
    -[CSNovDetectorResult setBestPhrase:](v4, "setBestPhrase:", a3->var3);
    -[CSNovDetectorResult setBestStart:](v4, "setBestStart:", a3->var1);
    -[CSNovDetectorResult setBestEnd:](v4, "setBestEnd:", a3->var2);
    *(float *)&v5 = a3->var4;
    -[CSNovDetectorResult setBestScore:](v4, "setBestScore:", v5);
    -[CSNovDetectorResult setEarlyWarning:](v4, "setEarlyWarning:", a3->var5);
    -[CSNovDetectorResult setIsRescoring:](v4, "setIsRescoring:", a3->var6);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  unsigned int *novDetect;

  novDetect = (unsigned int *)self->_novDetect;
  if (novDetect)
  {
    novDetect = (unsigned int *)nd_getsupervector();
    if (novDetect)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)novDetect, 4 * novDetect[2]);
      novDetect = (unsigned int *)objc_claimAutoreleasedReturnValue();
    }
  }
  return novDetect;
}

- (id)getOptionValue:(id)a3
{
  void *v4;

  v4 = 0;
  if (a3)
  {
    if (self->_novDetect)
    {
      objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
      v4 = (void *)nd_getoption();
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v4;
}

@end
