@implementation PHASEProcedureNodeDefinition

- (PHASEProcedureNodeDefinition)init
{
  -[PHASEProcedureNodeDefinition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)initInternal:(id)a3 maxPolyphony:(int)a4 voiceStealingType:(int64_t)a5
{
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  Phase::Logger *v16;
  Phase::Logger *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PHASEProcedureNodeDefinition;
  v10 = -[PHASEGeneratorNodeDefinition initInternal:](&v22, sel_initInternal_, v9);
  v11 = v10;
  if (v10)
  {
    v10[14] = 0x4052C00000000000;
    v10[11] = 0;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = v14;
    v17 = v16;
    if (a4 <= 0)
    {
      v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v16)
                                                                                          + 432)));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
        v20 = -[Phase::Logger UTF8String](objc_retainAutorelease(v17), "UTF8String");
        *(_DWORD *)buf = 136316674;
        v24 = "PHASEGetProperty.h";
        v25 = 1024;
        v26 = 34;
        v27 = 2080;
        v28 = v19;
        v29 = 2080;
        v30 = v20;
        v31 = 1024;
        v32 = a4;
        v33 = 1024;
        v34 = 1;
        v35 = 1024;
        v36 = 0x7FFFFFFF;
        _os_log_impl(&dword_2164CC000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s:%s Value is out of bounds. Clamping %d to range [%d, %d]", buf, 0x38u);
      }

      a4 = 1;
    }

    *((_DWORD *)v11 + 20) = a4;
    v11[13] = a5;
  }

  return v11;
}

- (int64_t)cullOption
{
  return self->_cullOption;
}

- (void)setCullOption:(int64_t)a3
{
  self->_cullOption = a3;
}

- (int64_t)playbackMode
{
  return self->_playbackMode;
}

- (void)setPlaybackMode:(int64_t)a3
{
  self->_playbackMode = a3;
}

- (int)maxPolyphony
{
  return self->_maxPolyphony;
}

- (int64_t)voiceStealingType
{
  return self->_voiceStealingType;
}

- (void)setVoiceStealingType:(int64_t)a3
{
  self->_voiceStealingType = a3;
}

- (double)referenceGainDbSpl
{
  return self->_referenceGainDbSpl;
}

- (void)setReferenceGainDbSpl:(double)a3
{
  self->_referenceGainDbSpl = a3;
}

@end
