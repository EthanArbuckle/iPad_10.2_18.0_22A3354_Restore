@implementation _EARSpeechRecognitionActiveConfiguration

+ (id)activeConfigurationForEverything
{
  return (id)objc_opt_new();
}

+ (id)activeConfigurationForNothing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSamplingRateFilter:", v3);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTaskTypeFilter:", v4);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFarFieldFilter:", v5);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeviceIdFilter:", v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAneContextFilter:", v7);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCpuContextFilter:", v8);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGpuContextFilter:", v9);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAtypicalSpeechFilter:", v10);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_opt_new();
  -[_EARSpeechRecognitionActiveConfiguration samplingRateFilter](self, "samplingRateFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSamplingRateFilter:", v5);

  -[_EARSpeechRecognitionActiveConfiguration taskTypeFilter](self, "taskTypeFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTaskTypeFilter:", v6);

  -[_EARSpeechRecognitionActiveConfiguration farFieldFilter](self, "farFieldFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFarFieldFilter:", v7);

  -[_EARSpeechRecognitionActiveConfiguration deviceIdFilter](self, "deviceIdFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceIdFilter:", v8);

  -[_EARSpeechRecognitionActiveConfiguration aneContextFilter](self, "aneContextFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAneContextFilter:", v9);

  -[_EARSpeechRecognitionActiveConfiguration cpuContextFilter](self, "cpuContextFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCpuContextFilter:", v10);

  -[_EARSpeechRecognitionActiveConfiguration gpuContextFilter](self, "gpuContextFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGpuContextFilter:", v11);

  -[_EARSpeechRecognitionActiveConfiguration atypicalSpeechFilter](self, "atypicalSpeechFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAtypicalSpeechFilter:", v12);

  return v4;
}

- (id)_initWithActiveConfiguration:(const void *)a3
{
  _EARSpeechRecognitionActiveConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_EARSpeechRecognitionActiveConfiguration;
  v4 = -[_EARSpeechRecognitionActiveConfiguration init](&v14, sel_init);
  if (*((_BYTE *)a3 + 24))
  {
    EARHelpers::ContainerToNSSet<std::set<unsigned int>>(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeechRecognitionActiveConfiguration setSamplingRateFilter:](v4, "setSamplingRateFilter:", v5);

  }
  if (*((_BYTE *)a3 + 56))
  {
    EARHelpers::ContainerToNSSet<std::set<std::string>>((_QWORD *)a3 + 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeechRecognitionActiveConfiguration setTaskTypeFilter:](v4, "setTaskTypeFilter:", v6);

  }
  if (*((_BYTE *)a3 + 120))
  {
    EARHelpers::ContainerToNSSet<std::set<BOOL>>((_QWORD *)a3 + 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeechRecognitionActiveConfiguration setFarFieldFilter:](v4, "setFarFieldFilter:", v7);

  }
  if (*((_BYTE *)a3 + 88))
  {
    EARHelpers::ContainerToNSSet<std::set<std::string>>((_QWORD *)a3 + 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeechRecognitionActiveConfiguration setDeviceIdFilter:](v4, "setDeviceIdFilter:", v8);

  }
  if (*((_BYTE *)a3 + 152))
  {
    EARHelpers::ContainerToNSSet<std::set<BOOL>>((_QWORD *)a3 + 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeechRecognitionActiveConfiguration setAtypicalSpeechFilter:](v4, "setAtypicalSpeechFilter:", v9);

  }
  if (*((_BYTE *)a3 + 184))
  {
    EARHelpers::ContainerToNSSet<std::set<std::string>>((_QWORD *)a3 + 20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeechRecognitionActiveConfiguration setAneContextFilter:](v4, "setAneContextFilter:", v10);

  }
  if (*((_BYTE *)a3 + 216))
  {
    EARHelpers::ContainerToNSSet<std::set<std::string>>((_QWORD *)a3 + 24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeechRecognitionActiveConfiguration setCpuContextFilter:](v4, "setCpuContextFilter:", v11);

  }
  if (*((_BYTE *)a3 + 248))
  {
    EARHelpers::ContainerToNSSet<std::set<std::string>>((_QWORD *)a3 + 28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeechRecognitionActiveConfiguration setGpuContextFilter:](v4, "setGpuContextFilter:", v12);

  }
  return v4;
}

- (SpeechRecognizerActiveConfiguration)speechRecognizerActiveConfiguration
{
  optional<std::set<std::string>> *p_var1;
  optional<std::set<std::string>> *p_var2;
  optional<std::set<BOOL>> *p_var3;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  BOOL v15;
  EARHelpers *v16;
  void *v17;
  BOOL v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  BOOL v26;
  EARHelpers *v27;
  void *v28;
  BOOL v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  BOOL v37;
  EARHelpers *v38;
  void *v39;
  BOOL v40;
  EARHelpers *v41;
  void *v42;
  BOOL v43;
  SpeechRecognizerActiveConfiguration *result;
  EARHelpers *v45;
  optional<std::set<BOOL>> *p_var4;
  optional<std::set<std::string>> *p_var7;
  optional<std::set<std::string>> *p_var6;
  optional<std::set<std::string>> *p_var5;
  uint64_t *v50;
  _QWORD *v51;
  uint64_t v52;
  unsigned int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  retstr->var0.var0.var0 = 0;
  retstr->var0.var1 = 0;
  retstr->var1.var0.var0 = 0;
  p_var1 = &retstr->var1;
  retstr->var1.var1 = 0;
  retstr->var2.var0.var0 = 0;
  p_var2 = &retstr->var2;
  retstr->var3.var0.var0 = 0;
  p_var3 = &retstr->var3;
  retstr->var2.var1 = 0;
  retstr->var3.var1 = 0;
  retstr->var4.var0.var0 = 0;
  p_var4 = &retstr->var4;
  retstr->var4.var1 = 0;
  retstr->var5.var0.var0 = 0;
  p_var5 = &retstr->var5;
  retstr->var6.var0.var0 = 0;
  p_var6 = &retstr->var6;
  retstr->var5.var1 = 0;
  retstr->var6.var1 = 0;
  retstr->var7.var0.var0 = 0;
  p_var7 = &retstr->var7;
  retstr->var7.var1 = 0;
  -[_EARSpeechRecognitionActiveConfiguration samplingRateFilter](self, "samplingRateFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_EARSpeechRecognitionActiveConfiguration samplingRateFilter](self, "samplingRateFilter");
    v51 = 0;
    v52 = 0;
    v50 = (uint64_t *)&v51;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, &v58, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v55;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(v9);
          v13 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v12);
          v53 = objc_msgSend(v13, "unsignedIntegerValue");
          std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int>(&v50, &v53, &v53);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, &v58, 16);
      }
      while (v10);
    }

    std::optional<std::set<unsigned int>>::operator=[abi:ne180100]<std::set<unsigned int>,void>((uint64_t)retstr, &v50);
    std::__tree<int>::destroy((uint64_t)&v50, v51);

  }
  -[_EARSpeechRecognitionActiveConfiguration taskTypeFilter](self, "taskTypeFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (!v15)
  {
    -[_EARSpeechRecognitionActiveConfiguration taskTypeFilter](self, "taskTypeFilter");
    v16 = (EARHelpers *)objc_claimAutoreleasedReturnValue();
    EARHelpers::StdSetOfStringsFromNSSet(v16, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var1, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);

  }
  -[_EARSpeechRecognitionActiveConfiguration farFieldFilter](self, "farFieldFilter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    -[_EARSpeechRecognitionActiveConfiguration farFieldFilter](self, "farFieldFilter");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v52 = 0;
    v50 = (uint64_t *)&v51;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, &v58, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v55;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v55 != v22)
            objc_enumerationMutation(v20);
          v24 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v23);
          LOBYTE(v53) = objc_msgSend(v24, "BOOLValue");
          std::__tree<BOOL>::__emplace_unique_key_args<BOOL,BOOL>(&v50, (unsigned __int8 *)&v53, &v53);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, &v58, 16);
      }
      while (v21);
    }

    std::optional<std::set<unsigned int>>::operator=[abi:ne180100]<std::set<unsigned int>,void>((uint64_t)p_var3, &v50);
    std::__tree<int>::destroy((uint64_t)&v50, v51);

  }
  -[_EARSpeechRecognitionActiveConfiguration deviceIdFilter](self, "deviceIdFilter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (!v26)
  {
    -[_EARSpeechRecognitionActiveConfiguration deviceIdFilter](self, "deviceIdFilter");
    v27 = (EARHelpers *)objc_claimAutoreleasedReturnValue();
    EARHelpers::StdSetOfStringsFromNSSet(v27, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var2, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);

  }
  -[_EARSpeechRecognitionActiveConfiguration atypicalSpeechFilter](self, "atypicalSpeechFilter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (!v29)
  {
    -[_EARSpeechRecognitionActiveConfiguration atypicalSpeechFilter](self, "atypicalSpeechFilter");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v52 = 0;
    v50 = (uint64_t *)&v51;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, &v58, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v55;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v55 != v33)
            objc_enumerationMutation(v31);
          v35 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v34);
          LOBYTE(v53) = objc_msgSend(v35, "BOOLValue");
          std::__tree<BOOL>::__emplace_unique_key_args<BOOL,BOOL>(&v50, (unsigned __int8 *)&v53, &v53);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, &v58, 16);
      }
      while (v32);
    }

    std::optional<std::set<unsigned int>>::operator=[abi:ne180100]<std::set<unsigned int>,void>((uint64_t)p_var4, &v50);
    std::__tree<int>::destroy((uint64_t)&v50, v51);

  }
  -[_EARSpeechRecognitionActiveConfiguration aneContextFilter](self, "aneContextFilter");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36 == 0;

  if (!v37)
  {
    -[_EARSpeechRecognitionActiveConfiguration aneContextFilter](self, "aneContextFilter");
    v38 = (EARHelpers *)objc_claimAutoreleasedReturnValue();
    EARHelpers::StdSetOfStringsFromNSSet(v38, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var5, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);

  }
  -[_EARSpeechRecognitionActiveConfiguration cpuContextFilter](self, "cpuContextFilter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39 == 0;

  if (!v40)
  {
    -[_EARSpeechRecognitionActiveConfiguration cpuContextFilter](self, "cpuContextFilter");
    v41 = (EARHelpers *)objc_claimAutoreleasedReturnValue();
    EARHelpers::StdSetOfStringsFromNSSet(v41, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var6, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);

  }
  -[_EARSpeechRecognitionActiveConfiguration gpuContextFilter](self, "gpuContextFilter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42 == 0;

  if (!v43)
  {
    -[_EARSpeechRecognitionActiveConfiguration gpuContextFilter](self, "gpuContextFilter");
    v45 = (EARHelpers *)objc_claimAutoreleasedReturnValue();
    EARHelpers::StdSetOfStringsFromNSSet(v45, (uint64_t)&v58);
    std::optional<std::set<std::string>>::operator=[abi:ne180100]<std::set<std::string>,void>((uint64_t)p_var7, &v58);
    std::__tree<std::string>::destroy((uint64_t)&v58, v59);

  }
  return result;
}

- (id)description
{
  void *v3;
  void **v4;
  unint64_t v5;
  void *v6;
  void *__p[2];
  unsigned __int8 v9;
  _QWORD v10[11];
  char v11;
  uint64_t v12;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v10);
  -[_EARSpeechRecognitionActiveConfiguration speechRecognizerActiveConfiguration](self, "speechRecognizerActiveConfiguration");
  quasar::operator<<(v10, (uint64_t)__p);
  quasar::SpeechRecognizerActiveConfiguration::~SpeechRecognizerActiveConfiguration((char **)__p);
  v3 = (void *)MEMORY[0x1E0CB3940];
  std::stringbuf::str();
  if ((v9 & 0x80u) == 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  if ((v9 & 0x80u) == 0)
    v5 = v9;
  else
    v5 = (unint64_t)__p[1];
  objc_msgSend(v3, "ear_stringWithStringView:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((char)v9 < 0)
    operator delete(__p[0]);
  v10[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v10 + *(_QWORD *)(v10[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v10[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v11 < 0)
    operator delete((void *)v10[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1AF44D094](&v12);
  return v6;
}

- (NSSet)samplingRateFilter
{
  return self->_samplingRateFilter;
}

- (void)setSamplingRateFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)taskTypeFilter
{
  return self->_taskTypeFilter;
}

- (void)setTaskTypeFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)farFieldFilter
{
  return self->_farFieldFilter;
}

- (void)setFarFieldFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)deviceIdFilter
{
  return self->_deviceIdFilter;
}

- (void)setDeviceIdFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)bluetoothDeviceIdFilter
{
  return self->_bluetoothDeviceIdFilter;
}

- (void)setBluetoothDeviceIdFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)aneContextFilter
{
  return self->_aneContextFilter;
}

- (void)setAneContextFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)cpuContextFilter
{
  return self->_cpuContextFilter;
}

- (void)setCpuContextFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)gpuContextFilter
{
  return self->_gpuContextFilter;
}

- (void)setGpuContextFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)atypicalSpeechFilter
{
  return self->_atypicalSpeechFilter;
}

- (void)setAtypicalSpeechFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atypicalSpeechFilter, 0);
  objc_storeStrong((id *)&self->_gpuContextFilter, 0);
  objc_storeStrong((id *)&self->_cpuContextFilter, 0);
  objc_storeStrong((id *)&self->_aneContextFilter, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceIdFilter, 0);
  objc_storeStrong((id *)&self->_deviceIdFilter, 0);
  objc_storeStrong((id *)&self->_farFieldFilter, 0);
  objc_storeStrong((id *)&self->_taskTypeFilter, 0);
  objc_storeStrong((id *)&self->_samplingRateFilter, 0);
}

@end
