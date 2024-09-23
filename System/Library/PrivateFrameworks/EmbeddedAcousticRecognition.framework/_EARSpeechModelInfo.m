@implementation _EARSpeechModelInfo

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (id)_initWithSpeechModelInfo:(const void *)a3
{
  _EARSpeechModelInfo *v4;
  _EARSpeechModelInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_EARSpeechModelInfo;
  v4 = -[_EARSpeechModelInfo init](&v7, sel_init);
  v5 = v4;
  if (v4)
    quasar::SpeechModelInfo::operator=((uint64_t)&v4->_speechModelInfo, (uint64_t)a3);
  return v5;
}

- (_EARSpeechModelInfo)initWithConfig:(id)a3
{
  id v4;
  _EARSpeechModelInfo *v5;
  _EARSpeechModelInfo *v6;
  void *v7;
  int v8;
  EARLogger *v9;
  NSObject *v10;
  _EARSpeechModelInfo *v11;
  void *__p[2];
  uint64_t v14;
  std::string v15[11];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_EARSpeechModelInfo;
  v5 = -[_EARSpeechModelInfo init](&v16, sel_init);
  v6 = v5;
  if (!v5)
  {
LABEL_11:
    v11 = v5;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v4);

  if (v8)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v14 = 0;
    }
    quasar::SpeechRecognizer::GetSpeechModelInfo((uint64_t)__p, v15);
    quasar::SpeechModelInfo::operator=((uint64_t)&v5->_speechModelInfo, (__int128 *)v15);
    quasar::SpeechModelInfo::~SpeechModelInfo((quasar::SpeechModelInfo *)v15);
    if (SHIBYTE(v14) < 0)
      operator delete(__p[0]);
    goto LABEL_11;
  }
  EARLogger::QuasarOSLogger(v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[_EARSpeechModelInfo initWithConfig:].cold.3();

  v11 = 0;
LABEL_12:

  return v11;
}

- (NSString)version
{
  SpeechModelInfo *p_speechModelInfo;

  p_speechModelInfo = &self->_speechModelInfo;
  if (*((char *)&self->_speechModelInfo.version.__r_.__value_.var0.var1 + 23) < 0)
    p_speechModelInfo = (SpeechModelInfo *)p_speechModelInfo->version.__r_.__value_.var0.var1.__data_;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_speechModelInfo);
}

- (NSString)acousticModelVersion
{
  int *p_var0;

  p_var0 = &self->_speechModelInfo.version.__r_.var0;
  if (SHIBYTE(self[1].super.isa) < 0)
    p_var0 = *(int **)p_var0;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_var0);
}

- (NSSet)samplingRates
{
  void *v3;
  char *data;
  char *v5;
  void *v6;
  char *v7;
  char *v8;
  BOOL v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", *((_QWORD *)&self[1]._speechModelInfo.version.__r_.__value_.var0.var1 + 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  data = self[1]._speechModelInfo.version.__r_.__value_.var0.var1.__data_;
  v5 = &self[1]._speechModelInfo.version.__r_.__value_.var0.var0.__data_[8];
  if (data != (char *)&self[1]._speechModelInfo.version.__r_.__value_.var0.var1.__size_)
  {
    do
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", *((unsigned int *)data + 7));
      objc_msgSend(v3, "addObject:", v6);

      v7 = (char *)*((_QWORD *)data + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (char *)*((_QWORD *)data + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)data;
          data = v8;
        }
        while (!v9);
      }
      data = v8;
    }
    while (v8 != v5);
  }
  return (NSSet *)v3;
}

- (NSSet)tasks
{
  void *v3;
  int64_t *v4;
  int64_t *p_var0;
  _QWORD *v6;
  void *v7;
  int64_t *v8;
  int64_t *v9;
  BOOL v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", self[2].super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(int64_t **)&self[1]._speechModelInfo.version.__r_.var0;
  p_var0 = &self[1]._speechModelInfo.version.var0;
  if (v4 != &self[1]._speechModelInfo.version.var0)
  {
    do
    {
      v6 = v4 + 4;
      if (*((char *)v4 + 55) < 0)
        v6 = (_QWORD *)*v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      v8 = (int64_t *)v4[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (int64_t *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (int64_t *)v4[2];
          v10 = *v9 == (_QWORD)v4;
          v4 = v9;
        }
        while (!v10);
      }
      v4 = v9;
    }
    while (v9 != p_var0);
  }
  return (NSSet *)v3;
}

- (NSString)language
{
  int *p_var0;

  p_var0 = &self[2]._speechModelInfo.version.__r_.var0;
  if (SHIBYTE(self[3].super.isa) < 0)
    p_var0 = *(int **)p_var0;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_var0);
}

- (NSString)phoneSetVersion
{
  __long *p_speechModelInfo;

  p_speechModelInfo = (__long *)&self[3]._speechModelInfo;
  if (*((char *)&self[3]._speechModelInfo.version.__r_.__value_.var0.var1 + 23) < 0)
    p_speechModelInfo = (__long *)p_speechModelInfo->__data_;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_speechModelInfo);
}

- (NSString)acousticProfileVersion
{
  int *p_var0;

  p_var0 = &self[3]._speechModelInfo.version.__r_.var0;
  if (SHIBYTE(self[4].super.isa) < 0)
    p_var0 = *(int **)p_var0;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_var0);
}

- (void).cxx_destruct
{
  quasar::SpeechModelInfo::~SpeechModelInfo((quasar::SpeechModelInfo *)&self->_speechModelInfo);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_QWORD *)self + 7) = (char *)self + 64;
  *((_QWORD *)self + 11) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 88;
  *((_QWORD *)self + 14) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = (char *)self + 208;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = (char *)self + 232;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = (char *)self + 256;
  return self;
}

- (void)initWithConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_2(&dword_1AD756000, v0, v1, "Unexpected exception while initializing EARSpeechModelInfo from configuration file at %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithConfig:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_2(&dword_1AD756000, v0, v1, "Configuration file %@ does not exist", v2);
  OUTLINED_FUNCTION_1();
}

@end
