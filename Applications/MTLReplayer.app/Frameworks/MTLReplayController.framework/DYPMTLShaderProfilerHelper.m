@implementation DYPMTLShaderProfilerHelper

- (DYPMTLShaderProfilerHelper)init
{
  id v2;
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DYPMTLShaderProfilerHelper;
  v2 = -[DYPMTLShaderProfilerHelper init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("GPUShaderProfilerIgnoreBlockSamplingBiasAdjustment"));

    if (v4)
      *((_BYTE *)v2 + 8) = 1;
    v5 = objc_alloc_init((Class)NSOperationQueue);
    v6 = (void *)*((_QWORD *)v2 + 92);
    *((_QWORD *)v2 + 92) = v5;

    objc_msgSend(*((id *)v2 + 92), "setName:", CFSTR("gputools.GPUToolsDebugger.GPUToolsPlatform.ShaderProfiler.ParallelQueue"));
    objc_msgSend(*((id *)v2 + 92), "setMaxConcurrentOperationCount:", std::thread::hardware_concurrency());
    v7 = objc_alloc_init((Class)NSOperationQueue);
    v8 = (void *)*((_QWORD *)v2 + 93);
    *((_QWORD *)v2 + 93) = v7;

    objc_msgSend(*((id *)v2 + 93), "setName:", CFSTR("gputools.GPUToolsDebugger.GPUToolsPlatform.ShaderProfiler.SerialQueue"));
    objc_msgSend(*((id *)v2 + 93), "setMaxConcurrentOperationCount:", 1);
  }
  return (DYPMTLShaderProfilerHelper *)v2;
}

- (id)_eventTypesForTarget:(int)a3
{
  if (a3 >= 2)
    return &off_738B68;
  else
    return &off_738B50;
}

- (id)_traceHeaders
{
  return &off_738B80;
}

- (id)_costHeaders
{
  return &off_738B98;
}

- (void)_dumpTraceBufferPacketsInFile:(__sFILE *)a3 usingTracePackets:(unsigned int *)a4 withExtractedSamples:(const void *)a5 withTraceBufferCount:(unsigned int)a6 forTargetIndex:(int)a7
{
  uint64_t v7;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t i;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  std::string *v24;
  std::string *v25;
  uint64_t v26;
  uint64_t v27;
  std::string *v28;
  std::string *data;
  uint64_t v30;
  unsigned int v31;
  const char *v32;
  char *v33;
  BOOL v34;
  unsigned int *v35;
  unsigned int *v36;
  uint64_t v37;
  std::string *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  std::string *v42[3];
  std::string *v43[3];
  __int128 v44;
  _QWORD v45[3];
  _QWORD v46[3];
  __int128 v47;
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  __int128 v52;

  if ((*a4 & 3) != 1)
    return;
  v7 = *(_QWORD *)&a7;
  fprintf(a3, "[%u]Trace Buffer\n", a6);
  std::string::basic_string[abi:nn180100]<0>(&v44, "");
  std::string::basic_string[abi:nn180100]<0>(v45, "");
  std::string::basic_string[abi:nn180100]<0>(v46, "");
  std::string::basic_string[abi:nn180100]<0>(&v47, "");
  std::string::basic_string[abi:nn180100]<0>(v48, "");
  std::string::basic_string[abi:nn180100]<0>(v49, "");
  std::string::basic_string[abi:nn180100]<0>(v50, "");
  std::string::basic_string[abi:nn180100]<0>(v51, "");
  v43[0] = (std::string *)operator new(0xC0uLL);
  v43[2] = v43[0] + 8;
  v12 = 0;
  v43[1] = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(&v44, &v52, v43[0]);
  do
  {
    if (SHIBYTE(v51[v12 + 2]) < 0)
      operator delete((void *)v51[v12]);
    v12 -= 3;
  }
  while (v12 != -24);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYPMTLShaderProfilerHelper _eventTypesForTarget:](self, "_eventTypesForTarget:", v7));
  if (v13)
  {
    v14 = 0;
    for (i = 0; i < (unint64_t)objc_msgSend(v13, "count"); ++i)
    {
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", i)));
      std::string::assign(&v43[0][v14], (const std::string::value_type *)objc_msgSend(v16, "UTF8String"));

      ++v14;
    }
  }
  std::string::basic_string[abi:nn180100]<0>(&v44, "%1u %s %4u %4u");
  std::string::basic_string[abi:nn180100]<0>(v45, "%6u %4u %4u");
  std::string::basic_string[abi:nn180100]<0>(v46, "%d 0x%X %u,%u, %u,%u");
  v42[0] = (std::string *)operator new(0x48uLL);
  v42[2] = v42[0] + 3;
  v17 = 0;
  v42[1] = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(&v44, &v47, v42[0]);
  do
  {
    if (SHIBYTE(v46[v17 + 2]) < 0)
      operator delete((void *)v46[v17]);
    v17 -= 3;
  }
  while (v17 != -9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYPMTLShaderProfilerHelper _traceHeaders](self, "_traceHeaders"));
  v19 = (uint64_t)v18;
  if (v18)
  {
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 0)));
    std::string::assign(v42[0], (const std::string::value_type *)objc_msgSend(v20, "UTF8String"));

    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19, "objectAtIndexedSubscript:", 1)));
    std::string::assign(v42[0] + 1, (const std::string::value_type *)objc_msgSend(v21, "UTF8String"));

    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19, "objectAtIndexedSubscript:", 2)));
    std::string::assign(v42[0] + 2, (const std::string::value_type *)objc_msgSend(v22, "UTF8String"));

  }
  v41 = (void *)v19;
  LODWORD(v19) = 0;
  do
  {
    v23 = a4[(int)v19];
    if ((v23 & 1) == 0)
    {
      if ((a4[(int)v19] & 3) == 2)
      {
        v24 = &v43[0][(v23 >> 2) & 7];
        if (SHIBYTE(v24->__r_.__value_.__r.__words[2]) < 0)
          v24 = (std::string *)v24->__r_.__value_.__r.__words[0];
        v25 = &v43[0][(v23 >> 17) & 7];
        if (SHIBYTE(v25->__r_.__value_.__r.__words[2]) < 0)
          v25 = (std::string *)v25->__r_.__value_.__r.__words[0];
        fprintf(a3, "A [%s %4u] : B [%s %4u]\n", (const char *)v24, (v23 >> 5) & 0xFFF, (const char *)v25, v23 >> 20);
      }
      else
      {
        fwrite("Invalid Packet Type\n", 0x14uLL, 1uLL, a3);
      }
      goto LABEL_39;
    }
    v26 = (v23 >> 8) & 0x3FF;
    v27 = (v23 >> 18) & 0x3FF;
    if ((int)v7 <= 0)
    {
      data = v42[0];
      if (SHIBYTE(v42[0]->__r_.__value_.__r.__words[2]) < 0)
        data = (std::string *)v42[0]->__r_.__value_.__l.__data_;
      v30 = (v23 >> 4) & 1;
      v31 = (v23 >> 5) & 3;
      v32 = "CDM";
      if (v31 == 1)
        v32 = "PDM";
      v33 = v31 ? (char *)v32 : "VDM";
      fprintf(a3, (const char *)data, v30, v33, v26, v27);
    }
    else
    {
      v28 = v42[0] + 1;
      if (SHIBYTE(v42[0][1].__r_.__value_.__r.__words[2]) < 0)
        v28 = (std::string *)v28->__r_.__value_.__r.__words[0];
      fprintf(a3, (const char *)v28, (v23 >> 22) & 0x3C0 | (v23 >> 2) & 0x1F | (((v23 >> 4) & 1) << 13), (v23 >> 8) & 0x3FF, (v23 >> 18) & 0x3FF, v40);
    }
    if ((int)v19 > 6)
      break;
    v19 = (int)v19 + 1;
    fprintf(a3, "PC = 0x%X\n", a4[v19]);
LABEL_39:
    v34 = (int)v19 < 7;
    LODWORD(v19) = v19 + 1;
  }
  while (v34);
  v35 = *(unsigned int **)a5;
  v36 = (unsigned int *)*((_QWORD *)a5 + 1);
  if (*(unsigned int **)a5 != v36)
  {
    v37 = 0;
    do
    {
      v38 = v42[0] + 2;
      if (SHIBYTE(v42[0][2].__r_.__value_.__r.__words[2]) < 0)
        v38 = (std::string *)v38->__r_.__value_.__r.__words[0];
      v39 = (v37 + 1);
      fprintf(a3, (const char *)v38, v37, v35[3], v35[8], *v35, v35[2], v35[6] & 0xFFF, v41);
      v35 += 10;
      v37 = v39;
    }
    while (v35 != v36);
  }

  *(_QWORD *)&v44 = v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v44);

  *(_QWORD *)&v44 = v43;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v44);
}

- (void)_cleanup
{
  uint64_t v3;
  uint64_t i;
  void **v5;
  void **v6;
  uint64_t j;
  uint64_t v8;
  uint64_t v9;
  uint64_t k;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  void **v17;
  void **v18;
  void **v19;
  void **v20;
  void **v21;
  void **v22;
  void **v23;
  uint64_t m;
  uint64_t v25;
  char *v26;
  void *v27;
  void *v28;
  void *v29;
  void **v30;

  if (*((_QWORD *)self + 5))
  {
    std::__hash_table<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::__unordered_map_hasher<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>>>::__deallocate_node(*((_QWORD **)self + 4));
    *((_QWORD *)self + 4) = 0;
    v3 = *((_QWORD *)self + 3);
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*((_QWORD *)self + 2) + 8 * i) = 0;
    }
    *((_QWORD *)self + 5) = 0;
  }
  v5 = (void **)*((_QWORD *)self + 7);
  v6 = (void **)*((_QWORD *)self + 8);
  while (v6 != v5)
  {
    v6 -= 3;
    v30 = v6;
    std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((_QWORD *)self + 8) = v5;
  v8 = *((_QWORD *)self + 10);
  for (j = *((_QWORD *)self + 11);
        j != v8;
  *((_QWORD *)self + 11) = v8;
  if (*((_QWORD *)self + 17))
  {
    std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__deallocate_node(*((_QWORD **)self + 16));
    *((_QWORD *)self + 16) = 0;
    v9 = *((_QWORD *)self + 15);
    if (v9)
    {
      for (k = 0; k != v9; ++k)
        *(_QWORD *)(*((_QWORD *)self + 14) + 8 * k) = 0;
    }
    *((_QWORD *)self + 17) = 0;
  }
  v11 = (void *)*((_QWORD *)self + 19);
  *((_QWORD *)self + 19) = 0;

  v12 = (void *)*((_QWORD *)self + 20);
  *((_QWORD *)self + 20) = 0;

  objc_msgSend(*((id *)self + 22), "removeAllObjects");
  v13 = (void *)*((_QWORD *)self + 22);
  *((_QWORD *)self + 22) = 0;

  objc_msgSend(*((id *)self + 23), "removeAllObjects");
  v14 = (void *)*((_QWORD *)self + 23);
  *((_QWORD *)self + 23) = 0;

  objc_msgSend(*((id *)self + 24), "removeAllObjects");
  v15 = (void *)*((_QWORD *)self + 24);
  *((_QWORD *)self + 24) = 0;

  v16 = (void **)*((_QWORD *)self + 25);
  v17 = (void **)*((_QWORD *)self + 26);
  while (v17 != v16)
  {
    v17 -= 3;
    v30 = v17;
    std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((_QWORD *)self + 26) = v16;
  v18 = (void **)*((_QWORD *)self + 28);
  v19 = (void **)*((_QWORD *)self + 29);
  while (v19 != v18)
  {
    v19 -= 3;
    v30 = v19;
    std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((_QWORD *)self + 29) = v18;
  v20 = (void **)*((_QWORD *)self + 31);
  v21 = (void **)*((_QWORD *)self + 32);
  while (v21 != v20)
  {
    v21 -= 3;
    v30 = v21;
    std::vector<std::unique_ptr<std::vector<double>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((_QWORD *)self + 32) = v20;
  v22 = (void **)*((_QWORD *)self + 34);
  v23 = (void **)*((_QWORD *)self + 35);
  while (v23 != v22)
  {
    v23 -= 3;
    v30 = v23;
    std::vector<std::unique_ptr<std::vector<double>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
  *((_QWORD *)self + 35) = v22;
  v25 = *((_QWORD *)self + 37);
  for (m = *((_QWORD *)self + 38);
        m != v25;
  *((_QWORD *)self + 38) = v25;
  *((_QWORD *)self + 41) = *((_QWORD *)self + 40);
  v26 = (char *)self + 344;
  do
  {
    *((_QWORD *)v26 + 1) = *(_QWORD *)v26;
    v26 += 24;
  }
  while (v26 != (char *)self + 416);
  v27 = (void *)*((_QWORD *)self + 57);
  *((_QWORD *)self + 57) = 0;

  *((_QWORD *)self + 59) = *((_QWORD *)self + 58);
  v28 = (void *)*((_QWORD *)self + 61);
  *((_QWORD *)self + 61) = 0;

  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear((_QWORD *)self + 62);
  objc_msgSend(*((id *)self + 21), "removeAllObjects");
  v29 = (void *)*((_QWORD *)self + 21);
  *((_QWORD *)self + 21) = 0;

}

- (unsigned)_computeSampleNormFactorForSample:(const ShaderProfilerUSCSampleInfo *)a3 forProgramStartAddress:(unint64_t)a4 forProgramEndAddress:(unint64_t)a5
{
  unint64_t var1;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  unsigned int v9;
  unint64_t var4;
  unint64_t var0;

  var1 = a3->var6.var1;
  v6 = (var1 >> 36) & 3;
  if ((_DWORD)v6 == 3)
  {
    var4 = a3->var4;
    if (var4 <= a4 || var4 >= a5)
      goto LABEL_17;
    var0 = a3->var5.var0;
    v8 = var0 < a4 || var0 >= a5;
    v9 = var1 >> 12;
    var1 >>= 24;
  }
  else
  {
    if ((_DWORD)v6 != 2)
      goto LABEL_17;
    v7 = a3->var4;
    v8 = v7 < a5 && v7 >= a4;
    v9 = var1 >> 12;
  }
  if (v8)
    LOWORD(var1) = v9;
LABEL_17:
  if ((var1 & 0xFFE) != 0)
    return var1 & 0xFFF;
  else
    return 1;
}

- (void)_processTracePackets:(unsigned int *)a3 forRenderIndex:(unsigned int)a4 andGenerateSampleList:(void *)a5 forTargetIndex:(int)a6 forLimiterIndex:(unsigned int)a7
{
  _OWORD *v10;
  unint64_t v11;
  char v12;
  unsigned int v13;
  unsigned int v14;
  _QWORD *v15;
  _QWORD *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  _QWORD v21[6];
  _QWORD v22[6];
  unsigned int *v23[12];
  _BYTE v24[32];
  int v25;
  _QWORD v26[3];
  uint64_t v27;
  _QWORD v28[9];
  int v29;
  unsigned int v30;
  _BYTE v31[48];
  _BYTE v32[48];
  _QWORD v33[6];
  unsigned int v34;
  unsigned int v35;
  DYPMTLShaderProfilerHelper *v36;

  v36 = self;
  v34 = a7;
  v35 = a4;
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  v29 = 1;
  v30 = -1;
  v28[0] = v32;
  v28[1] = &v30;
  v28[2] = v31;
  v28[3] = &v29;
  v28[4] = v33;
  v28[5] = &v35;
  v28[6] = &v34;
  v28[7] = &v36;
  v28[8] = a5;
  v27 = 0;
  v10 = operator new(0x1B0uLL);
  v26[2] = v10 + 27;
  *v10 = 0u;
  v10[1] = 0u;
  v10[2] = 0u;
  v10[3] = 0u;
  v10[4] = 0u;
  v10[5] = 0u;
  v10[6] = 0u;
  v10[7] = 0u;
  v10[8] = 0u;
  v10[9] = 0u;
  v10[10] = 0u;
  v10[11] = 0u;
  v10[12] = 0u;
  v10[13] = 0u;
  v10[14] = 0u;
  v10[15] = 0u;
  v10[16] = 0u;
  v10[17] = 0u;
  v10[18] = 0u;
  v10[19] = 0u;
  v10[20] = 0u;
  v10[21] = 0u;
  v10[22] = 0u;
  v10[23] = 0u;
  v10[24] = 0u;
  v10[25] = 0u;
  v10[26] = 0u;
  v26[0] = v10;
  v26[1] = v10 + 27;
  memset(v24, 0, sizeof(v24));
  v25 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v24, 0x24uLL);
  v11 = 0;
  v23[0] = (unsigned int *)&v27 + 1;
  v23[1] = (unsigned int *)v32;
  v23[2] = &v30;
  v23[3] = (unsigned int *)v31;
  v23[4] = (unsigned int *)&v29;
  v23[5] = (unsigned int *)&v27;
  v23[6] = (unsigned int *)v26;
  v23[7] = (unsigned int *)v24;
  v23[8] = (unsigned int *)v33;
  v23[9] = &v35;
  v12 = 1;
  v23[10] = (unsigned int *)&v36;
  v23[11] = (unsigned int *)a5;
  do
  {
    v13 = a3[v11];
    if ((v13 & 1) != 0)
    {
      if (v11)
      {
        if (a6 > 1)
        {
          std::deque<ProfileEvent>::deque((uint64_t)v21, v33);
          v15 = v21;
          -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator()(v23, v21);
        }
        else
        {
          std::deque<ProfileEvent>::deque((uint64_t)v22, v33);
          v15 = v22;
          -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_0::operator()((uint64_t)v28, v22);
        }
        std::deque<ProfileEvent>::~deque[abi:nn180100](v15);
        v12 = 1;
      }
      v30 = a3[++v11];
    }
    else if ((a3[v11] & 3) == 2)
    {
      LODWORD(v20) = ((v13 << 26) | (v13 >> 5)) & 0x70000FFF;
      HIDWORD(v20) = -1;
      std::deque<ProfileEvent>::emplace_back<ProfileEvent&>(v33, &v20);
      if ((v12 & 1) != 0)
      {
        v14 = (v13 >> 5) & 0xFFF;
        if (v14 <= 1)
          v14 = 1;
        v29 = v14;
      }
      LODWORD(v20) = (v13 >> 20) & 0x8FFFFFFF | (((v13 >> 17) & 7) << 28);
      HIDWORD(v20) = -1;
      std::deque<ProfileEvent>::emplace_back<ProfileEvent&>(v33, &v20);
      v12 = 0;
    }
  }
  while (v11++ < 7);
  if (a6 >= 2)
  {
    std::deque<ProfileEvent>::deque((uint64_t)v18, v33);
    v17 = v18;
    -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator()(v23, v18);
  }
  else
  {
    std::deque<ProfileEvent>::deque((uint64_t)v19, v33);
    v17 = v19;
    -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_0::operator()((uint64_t)v28, v19);
  }
  std::deque<ProfileEvent>::~deque[abi:nn180100](v17);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v24);
  v23[0] = (unsigned int *)v26;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v23);
  std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)v31);
  std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)v32);
  std::deque<ProfileEvent>::~deque[abi:nn180100](v33);
}

- (void)_setupShaderBinaryInfo:(id)a3 withBinaryKey:(const void *)a4 andNumDraws:(unsigned int)a5
{
  void *v7;
  id v8;

  v8 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "binary"));

  if (v7
    && !std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]((_QWORD *)self + 14, (uint64_t)a4))
  {
    operator new();
  }

}

- (void)setupDataForEvaluatingStreamingSamples:(id)a3 forRingBufferCount:(unsigned int)a4 forTargetIndex:(int)a5
{
  void *v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  size_t v22;
  char *v23;
  __int128 v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  unint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  size_t v75;
  char *v76;
  __int128 v77;
  _QWORD *v78;
  _QWORD *v79;
  unint64_t v80;
  _QWORD *v81;
  _QWORD *v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  size_t v92;
  char *v93;
  __int128 v94;
  _QWORD *v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD *v98;
  unint64_t i;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  char **v109;
  uint64_t *v110;
  char *v111;
  uint64_t v112;
  char **v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  uint64_t v120;
  int64x2_t v121;
  uint64_t v122;
  uint64_t v123;
  char **v124;
  uint64_t *v125;
  char *v126;
  uint64_t v127;
  char **v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  uint64_t v136;
  int64x2_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  unsigned int v143;
  void *v144;
  BOOL v145;
  void *v146;
  void *v147;
  void *v148;
  BOOL v149;
  unsigned int v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t *v153;
  unint64_t v154;
  unint64_t *v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  _QWORD *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  std::string *v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  uint64_t v172;
  __int128 v173;
  int64x2_t v174;
  unint64_t v175;
  std::string *v176;
  uint64_t v177;
  __int128 v178;
  uint64_t v179;
  __int128 v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  BOOL v194;
  id v195;
  uint64_t *v196;
  _QWORD *v197;
  void *j;
  id v199;
  unint64_t v200;
  void *v201;
  uint64_t v202;
  id v203;
  char *v204;
  unint64_t v205;
  uint8x8_t v206;
  _QWORD *v207;
  _QWORD *k;
  unint64_t v209;
  _QWORD *v210;
  uint64_t v211;
  float v212;
  float v213;
  _BOOL8 v214;
  unint64_t v215;
  unint64_t v216;
  int8x8_t prime;
  void *v218;
  void *v219;
  uint64_t v220;
  _QWORD *v221;
  unint64_t v222;
  uint8x8_t v223;
  unint64_t v224;
  uint8x8_t v225;
  uint64_t v226;
  _QWORD *v227;
  unint64_t v228;
  uint64_t v229;
  _QWORD *v230;
  unint64_t v231;
  void *v232;
  void *context;
  uint64_t v234;
  _QWORD *v235;
  id obj;
  uint64_t v237;
  id v238;
  _QWORD *v239;
  DYPMTLShaderProfilerHelper *v240;
  id *v241;
  id v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  std::string::size_type v247;
  __int128 __p;
  std::string::size_type v249;
  unsigned int *v250;
  unsigned int v251;
  _BYTE v252[32];
  _QWORD *v253;
  _BYTE v254[128];

  v241 = (id *)a3;
  v251 = a4;
  context = objc_autoreleasePoolPush();
  objc_storeStrong((id *)self + 20, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "drawCallInfoList"));
  v10 = (unint64_t)objc_msgSend(v9, "count");
  v11 = (_QWORD *)*((_QWORD *)self + 7);
  v12 = (_QWORD *)*((_QWORD *)self + 8);
  v13 = 0xAAAAAAAAAAAAAAABLL * (v12 - v11);
  v14 = v10 - v13;
  if (v10 > v13)
  {
    v15 = *((_QWORD *)self + 9);
    if (0xAAAAAAAAAAAAAAABLL * ((v15 - (uint64_t)v12) >> 3) >= v14)
    {
      bzero(*((void **)self + 8), 24 * ((24 * v14 - 24) / 0x18) + 24);
      *((_QWORD *)self + 8) = &v12[3 * ((24 * v14 - 24) / 0x18) + 3];
      goto LABEL_25;
    }
    if (v10 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v16 = 0xAAAAAAAAAAAAAAABLL * ((v15 - (uint64_t)v11) >> 3);
    v17 = 2 * v16;
    if (2 * v16 <= v10)
      v17 = v10;
    if (v16 >= 0x555555555555555)
      v18 = 0xAAAAAAAAAAAAAAALL;
    else
      v18 = v17;
    if (v18 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v19 = (char *)operator new(24 * v18);
    v20 = &v19[8 * (v12 - v11)];
    v21 = &v19[24 * v18];
    v22 = 24 * ((24 * v14 - 24) / 0x18) + 24;
    bzero(v20, v22);
    v23 = &v20[v22];
    if (v12 == v11)
    {
      *((_QWORD *)self + 7) = v20;
      *((_QWORD *)self + 8) = v23;
      *((_QWORD *)self + 9) = v21;
      if (!v12)
        goto LABEL_25;
    }
    else
    {
      do
      {
        *((_QWORD *)v20 - 3) = 0;
        *((_QWORD *)v20 - 2) = 0;
        v20 -= 24;
        *((_QWORD *)v20 + 2) = 0;
        v24 = *(_OWORD *)(v12 - 3);
        v12 -= 3;
        *(_OWORD *)v20 = v24;
        *((_QWORD *)v20 + 2) = v12[2];
        *v12 = 0;
        v12[1] = 0;
        v12[2] = 0;
      }
      while (v12 != v11);
      v25 = (_QWORD *)*((_QWORD *)self + 7);
      v12 = (_QWORD *)*((_QWORD *)self + 8);
      *((_QWORD *)self + 7) = v20;
      *((_QWORD *)self + 8) = v23;
      *((_QWORD *)self + 9) = v21;
      if (v12 != v25)
      {
        do
        {
          v12 -= 3;
          *(_QWORD *)v252 = v12;
          std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
        }
        while (v12 != v25);
        v12 = v25;
      }
      if (!v12)
        goto LABEL_25;
    }
    operator delete(v12);
    goto LABEL_25;
  }
  if (v10 < v13)
  {
    v26 = &v11[3 * v10];
    while (v12 != v26)
    {
      v12 -= 3;
      *(_QWORD *)v252 = v12;
      std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
    }
    *((_QWORD *)self + 8) = v26;
  }
LABEL_25:

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "drawCallInfoList"));
  v28 = objc_msgSend(v27, "count");
  v29 = (unint64_t)v28 + 1;
  v30 = *((_QWORD *)self + 10);
  v31 = *((_QWORD *)self + 11);
  v32 = 0xCCCCCCCCCCCCCCCDLL * ((v31 - v30) >> 3);
  v33 = (unint64_t)v28 - v32 + 1;
  if ((unint64_t)v28 + 1 <= v32)
  {
    if ((unint64_t)v28 + 1 < v32)
    {
      v53 = v30 + 40 * v29;
      while (v31 != v53)
      {
        v31 -= 40;
        std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>>>::~__hash_table(v31);
      }
      *((_QWORD *)self + 11) = v53;
    }
  }
  else
  {
    v34 = *((_QWORD *)self + 12);
    if (0xCCCCCCCCCCCCCCCDLL * ((v34 - v31) >> 3) >= v33)
    {
      v54 = v31 + 40 * v33;
      do
      {
        *(_OWORD *)v31 = 0uLL;
        *(_OWORD *)(v31 + 16) = 0uLL;
        *(_DWORD *)(v31 + 32) = 1065353216;
        v31 += 40;
      }
      while (v31 != v54);
      *((_QWORD *)self + 11) = v54;
    }
    else
    {
      if (v29 > 0x666666666666666)
        abort();
      v35 = 0xCCCCCCCCCCCCCCCDLL * ((v34 - v30) >> 3);
      v36 = 2 * v35;
      if (2 * v35 <= v29)
        v36 = (uint64_t)v28 + 1;
      if (v35 >= 0x333333333333333)
        v37 = 0x666666666666666;
      else
        v37 = v36;
      if (v37 > 0x666666666666666)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v38 = (char *)operator new(40 * v37);
      v39 = &v38[8 * ((v31 - v30) >> 3)];
      v40 = &v38[40 * v29];
      v41 = v39;
      do
      {
        *(_OWORD *)v41 = 0uLL;
        *((_OWORD *)v41 + 1) = 0uLL;
        *((_DWORD *)v41 + 8) = 1065353216;
        v41 += 40;
      }
      while (v41 != v40);
      v42 = &v38[40 * v37];
      if (v31 != v30)
      {
        v43 = 0;
        do
        {
          v44 = &v39[v43];
          v45 = v31 + v43;
          v46 = *(_QWORD *)(v31 + v43 - 40);
          *(_QWORD *)(v45 - 40) = 0;
          *((_QWORD *)v44 - 5) = v46;
          *((_QWORD *)v44 - 4) = *(_QWORD *)(v31 + v43 - 32);
          *(_QWORD *)(v45 - 32) = 0;
          v47 = *(_QWORD *)(v31 + v43 - 24);
          *(_QWORD *)&v39[v43 - 24] = v47;
          v48 = *(_QWORD *)(v31 + v43 - 16);
          *((_QWORD *)v44 - 2) = v48;
          *((_DWORD *)v44 - 2) = *(_DWORD *)(v31 + v43 - 8);
          if (v48)
          {
            v49 = *(_QWORD *)(v47 + 8);
            v50 = *((_QWORD *)v44 - 4);
            if ((v50 & (v50 - 1)) != 0)
            {
              if (v49 >= v50)
                v49 %= v50;
            }
            else
            {
              v49 &= v50 - 1;
            }
            *(_QWORD *)(v46 + 8 * v49) = &v39[v43 - 24];
            *(_QWORD *)(v31 + v43 - 24) = 0;
            *(_QWORD *)(v31 + v43 - 16) = 0;
          }
          v43 -= 40;
        }
        while (v31 + v43 != v30);
        v39 += v43;
      }
      v52 = (void *)*((_QWORD *)self + 10);
      v51 = *((_QWORD *)self + 11);
      *((_QWORD *)self + 10) = v39;
      *((_QWORD *)self + 11) = v40;
      *((_QWORD *)self + 12) = v42;
      while ((void *)v51 != v52)
        v51 = std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>>>::~__hash_table(v51 - 40);
      if (v52)
        operator delete(v52);
    }
  }

  v55 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v251));
  v56 = (void *)*((_QWORD *)self + 21);
  *((_QWORD *)self + 21) = v55;

  v57 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v251));
  v58 = (void *)*((_QWORD *)self + 22);
  *((_QWORD *)self + 22) = v57;

  v59 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v251));
  v60 = (void *)*((_QWORD *)self + 23);
  *((_QWORD *)self + 23) = v59;

  v61 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v251));
  v62 = (void *)*((_QWORD *)self + 24);
  *((_QWORD *)self + 24) = v61;

  v63 = v251;
  v65 = (_QWORD *)*((_QWORD *)self + 25);
  v64 = (_QWORD *)*((_QWORD *)self + 26);
  v66 = 0xAAAAAAAAAAAAAAABLL * (v64 - v65);
  v67 = v251 - v66;
  if (v251 > v66)
  {
    v68 = *((_QWORD *)self + 27);
    if (0xAAAAAAAAAAAAAAABLL * ((v68 - (uint64_t)v64) >> 3) >= v67)
    {
      bzero(*((void **)self + 26), 24 * ((24 * v67 - 24) / 0x18) + 24);
      *((_QWORD *)self + 26) = &v64[3 * ((24 * v67 - 24) / 0x18) + 3];
      goto LABEL_82;
    }
    v69 = 0xAAAAAAAAAAAAAAABLL * ((v68 - (uint64_t)v65) >> 3);
    v70 = 0x5555555555555556 * ((v68 - (uint64_t)v65) >> 3);
    if (v70 > v251)
      v63 = v70;
    if (v69 >= 0x555555555555555)
      v71 = 0xAAAAAAAAAAAAAAALL;
    else
      v71 = v63;
    if (v71 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_270;
    v72 = (char *)operator new(24 * v71);
    v73 = &v72[8 * (v64 - v65)];
    v74 = &v72[24 * v71];
    v75 = 24 * ((24 * v67 - 24) / 0x18) + 24;
    bzero(v73, v75);
    v76 = &v73[v75];
    if (v64 == v65)
    {
      *((_QWORD *)self + 25) = v73;
      *((_QWORD *)self + 26) = v76;
      *((_QWORD *)self + 27) = v74;
      if (!v64)
        goto LABEL_82;
    }
    else
    {
      do
      {
        *((_QWORD *)v73 - 3) = 0;
        *((_QWORD *)v73 - 2) = 0;
        v73 -= 24;
        *((_QWORD *)v73 + 2) = 0;
        v77 = *(_OWORD *)(v64 - 3);
        v64 -= 3;
        *(_OWORD *)v73 = v77;
        *((_QWORD *)v73 + 2) = v64[2];
        *v64 = 0;
        v64[1] = 0;
        v64[2] = 0;
      }
      while (v64 != v65);
      v78 = (_QWORD *)*((_QWORD *)self + 25);
      v64 = (_QWORD *)*((_QWORD *)self + 26);
      *((_QWORD *)self + 25) = v73;
      *((_QWORD *)self + 26) = v76;
      *((_QWORD *)self + 27) = v74;
      if (v64 != v78)
      {
        do
        {
          v64 -= 3;
          *(_QWORD *)v252 = v64;
          std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
        }
        while (v64 != v78);
        v64 = v78;
      }
      if (!v64)
        goto LABEL_82;
    }
    operator delete(v64);
    goto LABEL_82;
  }
  if (v251 < v66)
  {
    v79 = &v65[3 * v251];
    while (v64 != v79)
    {
      v64 -= 3;
      *(_QWORD *)v252 = v64;
      std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
    }
    *((_QWORD *)self + 26) = v79;
  }
LABEL_82:
  v80 = v251;
  v82 = (_QWORD *)*((_QWORD *)self + 28);
  v81 = (_QWORD *)*((_QWORD *)self + 29);
  v83 = 0xAAAAAAAAAAAAAAABLL * (v81 - v82);
  v84 = v251 - v83;
  if (v251 <= v83)
  {
    if (v251 < v83)
    {
      v96 = &v82[3 * v251];
      while (v81 != v96)
      {
        v81 -= 3;
        *(_QWORD *)v252 = v81;
        std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
      }
      *((_QWORD *)self + 29) = v96;
    }
    goto LABEL_105;
  }
  v85 = *((_QWORD *)self + 30);
  if (0xAAAAAAAAAAAAAAABLL * ((v85 - (uint64_t)v81) >> 3) >= v84)
  {
    bzero(*((void **)self + 29), 24 * ((24 * v84 - 24) / 0x18) + 24);
    *((_QWORD *)self + 29) = &v81[3 * ((24 * v84 - 24) / 0x18) + 3];
    goto LABEL_105;
  }
  v86 = 0xAAAAAAAAAAAAAAABLL * ((v85 - (uint64_t)v82) >> 3);
  v87 = 0x5555555555555556 * ((v85 - (uint64_t)v82) >> 3);
  if (v87 > v251)
    v80 = v87;
  if (v86 >= 0x555555555555555)
    v88 = 0xAAAAAAAAAAAAAAALL;
  else
    v88 = v80;
  if (v88 > 0xAAAAAAAAAAAAAAALL)
LABEL_270:
    std::__throw_bad_array_new_length[abi:nn180100]();
  v89 = (char *)operator new(24 * v88);
  v90 = &v89[8 * (v81 - v82)];
  v91 = &v89[24 * v88];
  v92 = 24 * ((24 * v84 - 24) / 0x18) + 24;
  bzero(v90, v92);
  v93 = &v90[v92];
  if (v81 != v82)
  {
    do
    {
      *((_QWORD *)v90 - 3) = 0;
      *((_QWORD *)v90 - 2) = 0;
      v90 -= 24;
      *((_QWORD *)v90 + 2) = 0;
      v94 = *(_OWORD *)(v81 - 3);
      v81 -= 3;
      *(_OWORD *)v90 = v94;
      *((_QWORD *)v90 + 2) = v81[2];
      *v81 = 0;
      v81[1] = 0;
      v81[2] = 0;
    }
    while (v81 != v82);
    v95 = (_QWORD *)*((_QWORD *)self + 28);
    v81 = (_QWORD *)*((_QWORD *)self + 29);
    *((_QWORD *)self + 28) = v90;
    *((_QWORD *)self + 29) = v93;
    *((_QWORD *)self + 30) = v91;
    if (v81 != v95)
    {
      do
      {
        v81 -= 3;
        *(_QWORD *)v252 = v81;
        std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
      }
      while (v81 != v95);
      v81 = v95;
    }
    if (!v81)
      goto LABEL_105;
    goto LABEL_104;
  }
  *((_QWORD *)self + 28) = v90;
  *((_QWORD *)self + 29) = v93;
  *((_QWORD *)self + 30) = v91;
  if (v81)
LABEL_104:
    operator delete(v81);
LABEL_105:
  v97 = (_QWORD *)((char *)self + 248);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::resize((char **)self + 31, v251);
  v98 = (_QWORD *)((char *)self + 272);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::resize((char **)self + 34, v251);
  *((_DWORD *)self + 182) = a5;
  v240 = self;
  if (v251)
  {
    for (i = 0; i < v251; ++i)
    {
      v100 = (void *)*((_QWORD *)self + 21);
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 20));
      objc_msgSend(v100, "addObject:", v101);

      v102 = (void *)*((_QWORD *)v240 + 22);
      v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 20));
      objc_msgSend(v102, "addObject:", v103);

      v104 = (void *)*((_QWORD *)v240 + 23);
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 20));
      objc_msgSend(v104, "addObject:", v105);

      v106 = (void *)*((_QWORD *)v240 + 24);
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 20));
      objc_msgSend(v106, "addObject:", v107);

      v108 = *((_QWORD *)v240 + 25);
      v109 = (char **)(v108 + 24 * i);
      v110 = (uint64_t *)(v109 + 2);
      v111 = *v109;
      if ((unint64_t)(v109[2] - *v109) <= 0x9F)
      {
        v112 = v108 + 24 * i;
        v115 = *(_QWORD *)(v112 + 8);
        v113 = (char **)(v112 + 8);
        v114 = v115;
        v253 = v109 + 2;
        v116 = (char *)operator new(0xA0uLL);
        v117 = *v113;
        v118 = *v109;
        if (*v113 == *v109)
        {
          v121 = vdupq_n_s64((unint64_t)v117);
          v119 = &v116[(v114 - (_QWORD)v111) & 0xFFFFFFFFFFFFFFF8];
        }
        else
        {
          v119 = &v116[(v114 - (_QWORD)v111) & 0xFFFFFFFFFFFFFFF8];
          do
          {
            v120 = *((_QWORD *)v117 - 1);
            v117 -= 8;
            *(_QWORD *)v117 = 0;
            *((_QWORD *)v119 - 1) = v120;
            v119 -= 8;
          }
          while (v117 != v118);
          v121 = *(int64x2_t *)v109;
        }
        *v109 = v119;
        *v113 = &v116[(v114 - (_QWORD)v111) & 0xFFFFFFFFFFFFFFF8];
        *(int64x2_t *)&v252[8] = v121;
        v122 = *v110;
        *v110 = (uint64_t)(v116 + 160);
        *(_QWORD *)&v252[24] = v122;
        *(_QWORD *)v252 = v121.i64[0];
        std::__split_buffer<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::~__split_buffer((uint64_t)v252);
      }
      std::vector<std::unique_ptr<std::vector<double>>>::reserve((int64x2_t *)(*v97 + 24 * i));
      std::vector<std::unique_ptr<std::vector<double>>>::reserve((int64x2_t *)(*v98 + 24 * i));
      self = v240;
      v123 = *((_QWORD *)v240 + 28);
      v124 = (char **)(v123 + 24 * i);
      v125 = (uint64_t *)(v124 + 2);
      v126 = *v124;
      if ((unint64_t)(v124[2] - *v124) <= 0x9F)
      {
        v127 = v123 + 24 * i;
        v130 = *(_QWORD *)(v127 + 8);
        v128 = (char **)(v127 + 8);
        v129 = v130;
        v253 = v124 + 2;
        v131 = (char *)operator new(0xA0uLL);
        v132 = &v131[(v130 - (_QWORD)v126) & 0xFFFFFFFFFFFFFFF8];
        v133 = *v128;
        v134 = *v124;
        if (*v128 == *v124)
        {
          v137 = vdupq_n_s64((unint64_t)v133);
          v135 = &v131[(v129 - (_QWORD)v126) & 0xFFFFFFFFFFFFFFF8];
        }
        else
        {
          v135 = &v131[(v129 - (_QWORD)v126) & 0xFFFFFFFFFFFFFFF8];
          do
          {
            v136 = *((_QWORD *)v133 - 1);
            v133 -= 8;
            *(_QWORD *)v133 = 0;
            *((_QWORD *)v135 - 1) = v136;
            v135 -= 8;
          }
          while (v133 != v134);
          v137 = *(int64x2_t *)v124;
        }
        self = v240;
        *v124 = v135;
        *v128 = v132;
        *(int64x2_t *)&v252[8] = v137;
        v138 = *v125;
        *v125 = (uint64_t)(v131 + 160);
        *(_QWORD *)&v252[24] = v138;
        *(_QWORD *)v252 = v137.i64[0];
        std::__split_buffer<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::~__split_buffer((uint64_t)v252);
      }
    }
  }
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "drawCallInfoList"));
  v238 = objc_msgSend(v139, "count");

  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "programInfoList"));
  v141 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v140, "count")));
  v142 = (void *)*((_QWORD *)self + 19);
  *((_QWORD *)self + 19) = v141;

  v143 = 0;
  v250 = &v251;
  *((_DWORD *)self + 26) = 0;
  v239 = (_QWORD *)((char *)self + 16);
  while (1)
  {
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "drawCallInfoList"));
    v234 = v143;
    v145 = (unint64_t)objc_msgSend(v144, "count") > v143;

    if (!v145)
      break;
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241, "drawCallInfoList"));
    v235 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "objectAtIndexedSubscript:", v234));

    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "programInfo"));
    if (v147)
    {
      v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "programInfo"));
      v149 = objc_msgSend(v148, "programId") == (id)-1;

      if (v149)
        goto LABEL_266;
    }
    v150 = *((_DWORD *)self + 26);
    v151 = *((_QWORD *)self + 10);
    *((_DWORD *)self + 26) = v150 + 1;
    v152 = *((_QWORD *)self + 7);
    v247 = 0;
    std::string::basic_string[abi:nn180100]<0>(&__p, "");
    v153 = (unint64_t *)(v152 + 24 * v150);
    v155 = v153 + 1;
    v154 = v153[1];
    v156 = *v153;
    v157 = v154 - *v153;
    if ((unint64_t)v157 > 0xBF)
    {
      if (v157 == 192)
        goto LABEL_157;
      v175 = v156 + 192;
      while (v154 != v175)
      {
        if (*(char *)(v154 - 1) < 0)
          operator delete(*(void **)(v154 - 24));
        v154 -= 32;
      }
      goto LABEL_154;
    }
    v158 = v157 >> 5;
    v159 = 6 - (v157 >> 5);
    v160 = v152 + 24 * v150;
    v163 = *(_QWORD *)(v160 + 16);
    v162 = (_QWORD *)(v160 + 16);
    v161 = v163;
    if (v159 <= (uint64_t)(v163 - v154) >> 5)
    {
      v175 = v154 + 32 * v159;
      v176 = (std::string *)(v154 + 8);
      v177 = 192 - 32 * v158;
      do
      {
        v176[-1].__r_.__value_.__r.__words[2] = v247;
        if (SHIBYTE(v249) < 0)
        {
          std::string::__init_copy_ctor_external(v176, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
        }
        else
        {
          v178 = __p;
          v176->__r_.__value_.__r.__words[2] = v249;
          *(_OWORD *)&v176->__r_.__value_.__l.__data_ = v178;
        }
        v176 = (std::string *)((char *)v176 + 32);
        v177 -= 32;
      }
      while (v177);
LABEL_154:
      *v155 = v175;
      goto LABEL_157;
    }
    v164 = v161 - v156;
    v165 = v164 >> 4;
    if ((unint64_t)(v164 >> 4) <= 6)
      v165 = 6;
    if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFE0)
      v166 = 0x7FFFFFFFFFFFFFFLL;
    else
      v166 = v165;
    v253 = v162;
    if (v166 >> 59)
      std::__throw_bad_array_new_length[abi:nn180100]();
    *(_QWORD *)v252 = operator new(32 * v166);
    *(_QWORD *)&v252[8] = *(_QWORD *)v252 + 32 * v158;
    *(_QWORD *)&v252[16] = *(_QWORD *)&v252[8];
    *(_QWORD *)&v252[24] = *(_QWORD *)v252 + 32 * v166;
    v167 = *(_QWORD *)v252 + 192;
    v168 = (std::string *)(*(_QWORD *)&v252[8] + 8);
    do
    {
      v168[-1].__r_.__value_.__r.__words[2] = v247;
      if (SHIBYTE(v249) < 0)
      {
        std::string::__init_copy_ctor_external(v168, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
      }
      else
      {
        *(_OWORD *)&v168->__r_.__value_.__l.__data_ = __p;
        v168->__r_.__value_.__r.__words[2] = v249;
      }
      ++v158;
      v168 = (std::string *)((char *)v168 + 32);
    }
    while (v158 != 6);
    *(_QWORD *)&v252[16] = v167;
    v169 = *v155;
    v170 = *v153;
    v171 = *(_QWORD *)&v252[8];
    if (*v155 == *v153)
    {
      v174 = vdupq_n_s64(v169);
      self = v240;
    }
    else
    {
      self = v240;
      do
      {
        v172 = *(_QWORD *)(v169 - 32);
        v169 -= 32;
        *(_QWORD *)(v171 - 32) = v172;
        v171 -= 32;
        v173 = *(_OWORD *)(v169 + 8);
        *(_QWORD *)(v171 + 24) = *(_QWORD *)(v169 + 24);
        *(_OWORD *)(v171 + 8) = v173;
        *(_QWORD *)(v169 + 16) = 0;
        *(_QWORD *)(v169 + 24) = 0;
        *(_QWORD *)(v169 + 8) = 0;
      }
      while (v169 != v170);
      v174 = *(int64x2_t *)v153;
    }
    *v153 = v171;
    v179 = *v162;
    v180 = *(_OWORD *)&v252[16];
    *(int64x2_t *)&v252[8] = v174;
    *(_OWORD *)v155 = v180;
    *(_QWORD *)&v252[24] = v179;
    *(_QWORD *)v252 = v174.i64[0];
    std::__split_buffer<std::pair<ShaderBinaryStatsInfo *,std::string>>::~__split_buffer((uint64_t)v252);
LABEL_157:
    if (SHIBYTE(v249) < 0)
      operator delete((void *)__p);
    v181 = (void *)v235[1];
    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241[30], "objectForKeyedSubscript:", v181));
    *(_QWORD *)(*v153 + 32) = -[DYPMTLShaderProfilerHelper setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:]::$_2::operator()((uint64_t)&v250, v181, v182, v239, *((void **)self + 19));

    v183 = (void *)v235[1];
    if (v183)
    {
      std::string::basic_string[abi:nn180100]<0>(v252, (char *)objc_msgSend(v183, "UTF8String"));
      v184 = *v153 + 40;
      if (*(char *)(*v153 + 63) < 0)
        operator delete(*(void **)v184);
      *(_OWORD *)v184 = *(_OWORD *)v252;
      *(_QWORD *)(v184 + 16) = *(_QWORD *)&v252[16];
      -[DYPMTLShaderProfilerHelper _setupShaderBinaryInfo:withBinaryKey:andNumDraws:](self, "_setupShaderBinaryInfo:withBinaryKey:andNumDraws:", *(_QWORD *)(*(_QWORD *)(*v153 + 32) + 8), *v153 + 40, v238);
    }
    v185 = (void *)v235[2];
    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241[31], "objectForKeyedSubscript:", v185));
    *(_QWORD *)(*v153 + 64) = -[DYPMTLShaderProfilerHelper setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:]::$_2::operator()((uint64_t)&v250, v185, v186, v239, *((void **)self + 19));

    v187 = (void *)v235[2];
    if (v187)
    {
      std::string::basic_string[abi:nn180100]<0>(v252, (char *)objc_msgSend(v187, "UTF8String"));
      v188 = *v153 + 72;
      if (*(char *)(*v153 + 95) < 0)
        operator delete(*(void **)v188);
      *(_OWORD *)v188 = *(_OWORD *)v252;
      *(_QWORD *)(v188 + 16) = *(_QWORD *)&v252[16];
      -[DYPMTLShaderProfilerHelper _setupShaderBinaryInfo:withBinaryKey:andNumDraws:](self, "_setupShaderBinaryInfo:withBinaryKey:andNumDraws:", *(_QWORD *)(*(_QWORD *)(*v153 + 64) + 8), *v153 + 72, v238);
    }
    v189 = (void *)v235[3];
    v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241[32], "objectForKeyedSubscript:", v189));
    *(_QWORD *)(*v153 + 96) = -[DYPMTLShaderProfilerHelper setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:]::$_2::operator()((uint64_t)&v250, v189, v190, v239, *((void **)self + 19));

    v191 = (void *)v235[3];
    if (v191)
    {
      std::string::basic_string[abi:nn180100]<0>(v252, (char *)objc_msgSend(v191, "UTF8String"));
      v192 = *v153 + 104;
      if (*(char *)(*v153 + 127) < 0)
        operator delete(*(void **)v192);
      *(_OWORD *)v192 = *(_OWORD *)v252;
      *(_QWORD *)(v192 + 16) = *(_QWORD *)&v252[16];
      -[DYPMTLShaderProfilerHelper _setupShaderBinaryInfo:withBinaryKey:andNumDraws:](self, "_setupShaderBinaryInfo:withBinaryKey:andNumDraws:", *(_QWORD *)(*(_QWORD *)(*v153 + 96) + 8), *v153 + 104, v238);
    }
    v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "allShaderKeys"));
    v194 = v193 == 0;

    if (!v194)
    {
      v245 = 0u;
      v246 = 0u;
      v243 = 0u;
      v244 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "allShaderKeys"));
      v195 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v243, v254, 16);
      if (v195)
      {
        v196 = (uint64_t *)(v151 + 40 * v150);
        v237 = *(_QWORD *)v244;
        v197 = v196 + 2;
        do
        {
          v242 = v195;
          for (j = 0; j != v242; j = (char *)j + 1)
          {
            if (*(_QWORD *)v244 != v237)
              objc_enumerationMutation(obj);
            v199 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v243 + 1) + 8 * (_QWORD)j));
            v200 = strtoull((const char *)objc_msgSend(v199, "UTF8String"), 0, 16);
            v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v241[33], "objectForKeyedSubscript:", v199));
            v202 = -[DYPMTLShaderProfilerHelper setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:]::$_2::operator()((uint64_t)&v250, v199, v201, v239, *((void **)self + 19));
            v203 = objc_retainAutorelease(v199);
            v204 = (char *)objc_msgSend(v203, "UTF8String");
            *(_QWORD *)v252 = v202;
            std::string::basic_string[abi:nn180100]<0>(&v252[8], v204);
            v205 = v196[1];
            if (v205)
            {
              v206 = (uint8x8_t)vcnt_s8((int8x8_t)v205);
              v206.i16[0] = vaddlv_u8(v206);
              if (v206.u32[0] > 1uLL)
              {
                v202 = v200;
                if (v200 >= v205)
                  v202 = v200 % v205;
              }
              else
              {
                v202 = (v205 - 1) & v200;
              }
              v207 = *(_QWORD **)(*v196 + 8 * v202);
              if (v207)
              {
                for (k = (_QWORD *)*v207; k; k = (_QWORD *)*k)
                {
                  v209 = k[1];
                  if (v209 == v200)
                  {
                    if (k[2] == v200)
                      goto LABEL_249;
                  }
                  else
                  {
                    if (v206.u32[0] > 1uLL)
                    {
                      if (v209 >= v205)
                        v209 %= v205;
                    }
                    else
                    {
                      v209 &= v205 - 1;
                    }
                    if (v209 != v202)
                      break;
                  }
                }
              }
            }
            v210 = operator new(0x38uLL);
            *v210 = 0;
            v210[1] = v200;
            v211 = *(_QWORD *)v252;
            v210[2] = v200;
            v210[3] = v211;
            *((_OWORD *)v210 + 2) = *(_OWORD *)&v252[8];
            v210[6] = *(_QWORD *)&v252[24];
            memset(&v252[8], 0, 24);
            v212 = (float)(unint64_t)(v196[3] + 1);
            v213 = *((float *)v196 + 8);
            if (!v205 || (float)(v213 * (float)v205) < v212)
            {
              v214 = (v205 & (v205 - 1)) != 0;
              if (v205 < 3)
                v214 = 1;
              v215 = v214 | (2 * v205);
              v216 = vcvtps_u32_f32(v212 / v213);
              if (v215 <= v216)
                prime = (int8x8_t)v216;
              else
                prime = (int8x8_t)v215;
              if (*(_QWORD *)&prime == 1)
              {
                prime = (int8x8_t)2;
              }
              else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
              {
                prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
              }
              v205 = v196[1];
              if (*(_QWORD *)&prime <= v205)
              {
                if (*(_QWORD *)&prime < v205)
                {
                  v224 = vcvtps_u32_f32((float)(unint64_t)v196[3] / *((float *)v196 + 8));
                  if (v205 < 3
                    || (v225 = (uint8x8_t)vcnt_s8((int8x8_t)v205), v225.i16[0] = vaddlv_u8(v225), v225.u32[0] > 1uLL))
                  {
                    v224 = std::__next_prime(v224);
                  }
                  else
                  {
                    v226 = 1 << -(char)__clz(v224 - 1);
                    if (v224 >= 2)
                      v224 = v226;
                  }
                  if (*(_QWORD *)&prime <= v224)
                    prime = (int8x8_t)v224;
                  if (*(_QWORD *)&prime >= v205)
                  {
                    v205 = v196[1];
                  }
                  else
                  {
                    if (prime)
                      goto LABEL_205;
                    v232 = (void *)*v196;
                    *v196 = 0;
                    if (v232)
                      operator delete(v232);
                    v205 = 0;
                    v196[1] = 0;
                  }
                }
              }
              else
              {
LABEL_205:
                if (*(_QWORD *)&prime >> 61)
                  std::__throw_bad_array_new_length[abi:nn180100]();
                v218 = operator new(8 * *(_QWORD *)&prime);
                v219 = (void *)*v196;
                *v196 = (uint64_t)v218;
                if (v219)
                  operator delete(v219);
                v220 = 0;
                v196[1] = (uint64_t)prime;
                do
                  *(_QWORD *)(*v196 + 8 * v220++) = 0;
                while (*(_QWORD *)&prime != v220);
                v221 = (_QWORD *)*v197;
                if (*v197)
                {
                  v222 = v221[1];
                  v223 = (uint8x8_t)vcnt_s8(prime);
                  v223.i16[0] = vaddlv_u8(v223);
                  if (v223.u32[0] > 1uLL)
                  {
                    if (v222 >= *(_QWORD *)&prime)
                      v222 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v222 &= *(_QWORD *)&prime - 1;
                  }
                  *(_QWORD *)(*v196 + 8 * v222) = v197;
                  v227 = (_QWORD *)*v221;
                  if (*v221)
                  {
                    do
                    {
                      v228 = v227[1];
                      if (v223.u32[0] > 1uLL)
                      {
                        if (v228 >= *(_QWORD *)&prime)
                          v228 %= *(_QWORD *)&prime;
                      }
                      else
                      {
                        v228 &= *(_QWORD *)&prime - 1;
                      }
                      if (v228 != v222)
                      {
                        if (!*(_QWORD *)(*v196 + 8 * v228))
                        {
                          *(_QWORD *)(*v196 + 8 * v228) = v221;
                          goto LABEL_230;
                        }
                        *v221 = *v227;
                        *v227 = **(_QWORD **)(*v196 + 8 * v228);
                        **(_QWORD **)(*v196 + 8 * v228) = v227;
                        v227 = v221;
                      }
                      v228 = v222;
LABEL_230:
                      v221 = v227;
                      v227 = (_QWORD *)*v227;
                      v222 = v228;
                    }
                    while (v227);
                  }
                }
                v205 = (unint64_t)prime;
              }
              if ((v205 & (v205 - 1)) != 0)
              {
                if (v200 >= v205)
                  v202 = v200 % v205;
                else
                  v202 = v200;
              }
              else
              {
                v202 = (v205 - 1) & v200;
              }
            }
            v229 = *v196;
            v230 = *(_QWORD **)(*v196 + 8 * v202);
            if (v230)
            {
              *v210 = *v230;
LABEL_247:
              *v230 = v210;
              goto LABEL_248;
            }
            *v210 = *v197;
            *v197 = v210;
            *(_QWORD *)(v229 + 8 * v202) = v197;
            if (*v210)
            {
              v231 = *(_QWORD *)(*v210 + 8);
              if ((v205 & (v205 - 1)) != 0)
              {
                if (v231 >= v205)
                  v231 %= v205;
              }
              else
              {
                v231 &= v205 - 1;
              }
              v230 = (_QWORD *)(*v196 + 8 * v231);
              goto LABEL_247;
            }
LABEL_248:
            ++v196[3];
LABEL_249:
            if ((v252[31] & 0x80000000) != 0)
              operator delete(*(void **)&v252[8]);
            self = v240;
            std::string::basic_string[abi:nn180100]<0>(v252, (char *)objc_msgSend(objc_retainAutorelease(v203), "UTF8String"));
            -[DYPMTLShaderProfilerHelper _setupShaderBinaryInfo:withBinaryKey:andNumDraws:](v240, "_setupShaderBinaryInfo:withBinaryKey:andNumDraws:", v201, v252, v238);
            if ((v252[23] & 0x80000000) != 0)
              operator delete(*(void **)v252);

          }
          v195 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v243, v254, 16);
        }
        while (v195);
      }

    }
LABEL_266:

    v143 = v234 + 1;
  }
  objc_autoreleasePoolPop(context);

}

- (double)_conservativeLatencyAdjustment:(double)a3 withLimiter:(double)a4
{
  double v4;
  double v5;
  BOOL v6;
  double result;

  v4 = a3 / (a4 + 1.0 + 0.00001);
  v5 = 1.0 - v4;
  v6 = v4 < 1.0;
  result = 0.0;
  if (v6)
    return v5;
  return result;
}

- (double)_latencyAdjustmentEstimate:(double)a3 withLimiter:(double)a4
{
  double v5;
  double v6;
  double v7;

  v5 = a3 / (a4 + 0.00001);
  if (v5 >= 1.0)
    v6 = 0.0;
  else
    v6 = 1.0 - v5;
  -[DYPMTLShaderProfilerHelper _conservativeLatencyAdjustment:withLimiter:](self, "_conservativeLatencyAdjustment:withLimiter:", a3);
  return (1.0 - (a3 + (1.0 - a3) * 0.5)) * v7 + (a3 + (1.0 - a3) * 0.5) * v6;
}

- (double)_waitLatencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  double v5;
  double result;

  v5 = a3[*(unsigned int *)(*(_QWORD *)a5 + 8) + a4] * 0.01;
  if (a3[**(unsigned int **)a5 + a4] * 0.01 >= v5)
    v5 = a3[**(unsigned int **)a5 + a4] * 0.01;
  -[DYPMTLShaderProfilerHelper _latencyAdjustmentEstimate:withLimiter:](self, "_latencyAdjustmentEstimate:withLimiter:", a3[*(unsigned int *)(*(_QWORD *)a5 + 4) + a4] * 0.01, v5);
  return result;
}

- (double)_latencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  uint64_t v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  BOOL v10;
  double result;

  v5 = 0;
  v6 = 0.0;
  do
  {
    v7 = *(unsigned int *)(*(_QWORD *)a5 + v5) + a4;
    if (v6 < a3[v7])
      v6 = a3[v7];
    v5 += 4;
  }
  while (v5 != 40);
  v8 = v6 * 0.01;
  v9 = 1.0 - v8;
  v10 = v8 < 1.0;
  result = 0.0;
  if (v10)
    return v9;
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  double result;

  -[DYPMTLShaderProfilerHelper _conservativeLatencyAdjustment:withLimiter:](self, "_conservativeLatencyAdjustment:withLimiter:", a3[*(unsigned int *)(*(_QWORD *)a5 + 4) + a4] * 0.01, a3[*(unsigned int *)(*(_QWORD *)a5 + 4 * a6) + a4] * 0.01);
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterDataWithLerp:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  double result;

  -[DYPMTLShaderProfilerHelper _latencyAdjustmentEstimate:withLimiter:](self, "_latencyAdjustmentEstimate:withLimiter:", a3[*(unsigned int *)(*(_QWORD *)a5 + 4) + a4] * 0.01, a3[*(unsigned int *)(*(_QWORD *)a5 + 4 * a6) + a4] * 0.01);
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterTypeLoad:(unsigned int)a6 forLimiterTypeStore:(unsigned int)a7
{
  double v7;
  double result;

  v7 = a3[*(unsigned int *)(*(_QWORD *)a5 + 4 * a7) + a4] * 0.01;
  if (a3[*(unsigned int *)(*(_QWORD *)a5 + 4 * a6) + a4] * 0.01 >= v7)
    v7 = a3[*(unsigned int *)(*(_QWORD *)a5 + 4 * a6) + a4] * 0.01;
  -[DYPMTLShaderProfilerHelper _latencyAdjustmentEstimate:withLimiter:](self, "_latencyAdjustmentEstimate:withLimiter:", a3[*(unsigned int *)(*(_QWORD *)a5 + 4) + a4] * 0.01, v7);
  return result;
}

- (void)evaluateStreamingSamples:(unint64_t *)a3 withUSCSampleNum:(unsigned int)a4 withProgramAddressLUT:(void *)a5 targetIndex:(int)a6 forRingBufferIndex:(unsigned int)a7 withMinEncoderIndex:(unsigned int)a8 withMaxEncoderIndex:(unsigned int)a9 withEncoderIdToEncoderIndexMap:(void *)a10 withProfilingData:(id)a11
{
  unint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint8x8_t v19;
  void **v20;
  unint64_t v21;
  float v22;
  float v23;
  _BOOL8 v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v51;
  DYPMTLShaderProfilerHelper *val;
  id v53;
  unsigned int v54;
  _QWORD v55[5];
  id v56;

  v49 = a11;
  v12 = *((_QWORD *)a10 + 3);
  if (v12 <= objc_msgSend(*((id *)self + 20), "encoderCount")
    && objc_msgSend(*((id *)self + 21), "count") > a7)
  {
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = __Block_byref_object_copy__3220;
    v55[4] = __Block_byref_object_dispose__3221;
    v56 = 0;
    if (objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("usc sample data thread offsets"))))
    {
      std::mutex::lock((std::mutex *)((char *)self + 536));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("frame index")));
      val = self;
      v14 = objc_msgSend(v13, "unsignedIntValue");

      v15 = (uint64_t *)((char *)self + 416);
      v16 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((_QWORD *)self + 52, v14);
      if (v16)
        goto LABEL_44;
      v17 = *((_QWORD *)self + 55);
      v18 = *((_QWORD *)self + 53);
      if (v18)
      {
        v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
        v19.i16[0] = vaddlv_u8(v19);
        if (v19.u32[0] > 1uLL)
        {
          self = (DYPMTLShaderProfilerHelper *)v14;
          if (v18 <= v14)
            self = (DYPMTLShaderProfilerHelper *)(v14 % v18);
        }
        else
        {
          self = (DYPMTLShaderProfilerHelper *)(((_DWORD)v18 - 1) & v14);
        }
        v20 = *(void ***)(*v15 + 8 * (_QWORD)self);
        if (v20)
        {
          v16 = *v20;
          if (*v20)
          {
            do
            {
              v21 = v16[1];
              if (v21 == v14)
              {
                if (*((_DWORD *)v16 + 4) == v14)
                {
                  self = val;
                  goto LABEL_44;
                }
              }
              else
              {
                if (v19.u32[0] > 1uLL)
                {
                  if (v21 >= v18)
                    v21 %= v18;
                }
                else
                {
                  v21 &= v18 - 1;
                }
                if ((DYPMTLShaderProfilerHelper *)v21 != self)
                  break;
              }
              v16 = (_QWORD *)*v16;
            }
            while (v16);
          }
        }
      }
      v16 = operator new(0x18uLL);
      *v16 = 0;
      v16[1] = v14;
      *((_DWORD *)v16 + 4) = v14;
      *((_DWORD *)v16 + 5) = v17;
      v22 = (float)(unint64_t)(v17 + 1);
      v23 = *((float *)val + 112);
      if (!v18 || (float)(v23 * (float)v18) < v22)
      {
        v24 = 1;
        if (v18 >= 3)
          v24 = (v18 & (v18 - 1)) != 0;
        v25 = v24 | (2 * v18);
        v26 = vcvtps_u32_f32(v22 / v23);
        if (v25 <= v26)
          v27 = v26;
        else
          v27 = v25;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v15, v27);
        v18 = *((_QWORD *)val + 53);
        if ((v18 & (v18 - 1)) != 0)
        {
          if (v18 <= v14)
            self = (DYPMTLShaderProfilerHelper *)(v14 % v18);
          else
            self = (DYPMTLShaderProfilerHelper *)v14;
        }
        else
        {
          self = (DYPMTLShaderProfilerHelper *)(((_DWORD)v18 - 1) & v14);
        }
      }
      v28 = *v15;
      v29 = *(_QWORD **)(*v15 + 8 * (_QWORD)self);
      if (v29)
      {
        *v16 = *v29;
        self = val;
      }
      else
      {
        *v16 = *((_QWORD *)val + 54);
        *((_QWORD *)val + 54) = v16;
        *(_QWORD *)(v28 + 8 * (_QWORD)self) = (char *)val + 432;
        self = val;
        if (!*v16)
        {
LABEL_43:
          ++*((_QWORD *)self + 55);
LABEL_44:
          v54 = *((_DWORD *)v16 + 5);
          *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)self + 496, v54, &v54)+ 5) = v14;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 21), "objectAtIndexedSubscript:", a7));
          v32 = objc_msgSend(v31, "count");
          v33 = v54;
          v34 = (unint64_t)v32 > v54;

          if (!v34)
          {
            v35 = objc_autoreleasePoolPush();
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)val + 21), "objectAtIndexedSubscript:", a7));
            v38 = (void *)objc_opt_new(NSMutableArray, v37);
            objc_msgSend(v36, "addObject:", v38);

            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)val + 22), "objectAtIndexedSubscript:", a7));
            v41 = (void *)objc_opt_new(NSData, v40);
            objc_msgSend(v39, "addObject:", v41);

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)val + 23), "objectAtIndexedSubscript:", a7));
            v44 = (void *)objc_opt_new(NSData, v43);
            objc_msgSend(v42, "addObject:", v44);

            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)val + 24), "objectAtIndexedSubscript:", a7));
            v47 = (void *)objc_opt_new(NSData, v46);
            objc_msgSend(v45, "addObject:", v47);

            objc_autoreleasePoolPop(v35);
            operator new();
          }
          v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("limiter data")));
          objc_msgSend(v51, "length");
          v53 = objc_retainAutorelease(v51);
          objc_msgSend(v53, "bytes");
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)val + 22), "objectAtIndexedSubscript:", a7));
          objc_msgSend(v48, "setObject:atIndexedSubscript:", v53, v33);

          operator new();
        }
        v30 = *(_QWORD *)(*v16 + 8);
        if ((v18 & (v18 - 1)) != 0)
        {
          if (v30 >= v18)
            v30 %= v18;
        }
        else
        {
          v30 &= v18 - 1;
        }
        v29 = (_QWORD *)(*v15 + 8 * v30);
      }
      *v29 = v16;
      goto LABEL_43;
    }

    _Block_object_dispose(v55, 8);
  }

}

- (void)_calculateAndAppendPerBatchCosts:(void *)a3 forFrameIndex:(unsigned int)a4 atTimestamp:(unint64_t)a5 withLimiterIndices:(void *)a6 withTimestampBuffers:(void *)a7 withActiveBatches:(const void *)a8 withPerRingBufferLimiterEncoderCosts:(void *)a9
{
  uint64_t v9;
  unint64_t v11;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  _QWORD *v29;
  double *v30;
  unsigned int *v31;
  unint64_t v32;
  uint64_t v33;
  unsigned int *v34;
  double *v35;
  unint64_t v36;
  _QWORD *v37;
  int8x8_t v38;
  uint8x8_t v39;
  unint64_t v40;
  uint64_t **v41;
  uint64_t *j;
  unint64_t v43;
  double v44;
  double v45;
  double *v46;
  double *__p;

  v9 = *(_QWORD *)a6;
  if (*((_QWORD *)a6 + 1) != *(_QWORD *)a6)
  {
    v11 = a5;
    v13 = 0;
    do
    {
      v14 = (_QWORD *)(*(_QWORD *)a3 + 40 * v13);
      if (v14[3])
      {
        v15 = (_QWORD *)v14[2];
        if (v15)
        {
          do
          {
            v16 = (_QWORD *)*v15;
            operator delete(v15);
            v15 = v16;
          }
          while (v16);
        }
        v14[2] = 0;
        v17 = v14[1];
        if (v17)
        {
          for (i = 0; i != v17; ++i)
            *(_QWORD *)(*v14 + 8 * i) = 0;
        }
        v14[3] = 0;
        v9 = *(_QWORD *)a6;
      }
      v19 = (uint64_t *)(*(_QWORD *)a7 + 24 * v13);
      v20 = *(unsigned int *)(v9 + 4 * v13);
      v21 = v19[2];
      v22 = *v19;
      if (v21 <= v20)
      {
        v25 = *(_DWORD *)(v9 + 4 * v13);
        v23 = v25;
      }
      else
      {
        v23 = *(unsigned int *)(v9 + 4 * v13);
        v24 = *(_DWORD *)(v9 + 4 * v13);
        while (*(_QWORD *)(v22 + 8 * v23) < v11)
        {
          v23 = v24 + 1;
          v24 = v23;
          v25 = v23;
          if (v21 <= v23)
            goto LABEL_17;
        }
        v25 = v24;
      }
LABEL_17:
      v26 = *(_QWORD *)(v22 + 8 * v23);
      if (v26 == v11)
      {
        *(_DWORD *)(v9 + 4 * v13) = v25;
        v27 = 1.0;
        LODWORD(v20) = v25;
      }
      else
      {
        v27 = 0.0;
        if (v25 > v20)
        {
          LODWORD(v20) = v25 - 1;
          *(_DWORD *)(v9 + 4 * v13) = v25 - 1;
          v28 = *(_QWORD *)(v22 + 8 * (v25 - 1));
          v27 = (double)(v11 - v28) / (double)(unint64_t)(v26 - v28);
        }
      }
      v29 = *(_QWORD **)(*(_QWORD *)a9 + 8 * v13);
      v30 = (double *)operator new(0x20uLL);
      *(_DWORD *)v30 = v20;
      v30[1] = 1.0 - v27;
      *((_DWORD *)v30 + 4) = v25;
      v30[3] = v27;
      v31 = (unsigned int *)(v30 + 4);
      __p = v30;
      do
      {
        v32 = *(unsigned int *)v30;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29[1] - *v29) >> 3) <= v32)
          abort();
        v33 = *v29 + 24 * v32;
        v35 = *(double **)v33;
        v34 = *(unsigned int **)(v33 + 8);
        while (v35 != (double *)v34)
        {
          v36 = *(unsigned int *)v35;
          if ((_DWORD)v36 == -1)
          {
LABEL_43:
            v44 = v35[1];
            v45 = v30[1];
            v46 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)(*(_QWORD *)a3 + 40 * v13), v36, v35);
            v46[3] = v46[3] + v44 * v45;
          }
          else
          {
            v37 = (_QWORD *)(*(_QWORD *)a8 + 40 * v13);
            v38 = (int8x8_t)v37[1];
            if (v38)
            {
              v39 = (uint8x8_t)vcnt_s8(v38);
              v39.i16[0] = vaddlv_u8(v39);
              if (v39.u32[0] > 1uLL)
              {
                v40 = *(unsigned int *)v35;
                if (*(_QWORD *)&v38 <= v36)
                  v40 = v36 % *(_QWORD *)&v38;
              }
              else
              {
                v40 = (v38.i32[0] - 1) & v36;
              }
              v41 = *(uint64_t ***)(*v37 + 8 * v40);
              if (v41)
              {
                for (j = *v41; j; j = (uint64_t *)*j)
                {
                  v43 = j[1];
                  if (v43 == v36)
                  {
                    if (*((_DWORD *)j + 4) == (_DWORD)v36)
                      goto LABEL_43;
                  }
                  else
                  {
                    if (v39.u32[0] > 1uLL)
                    {
                      if (v43 >= *(_QWORD *)&v38)
                        v43 %= *(_QWORD *)&v38;
                    }
                    else
                    {
                      v43 &= *(_QWORD *)&v38 - 1;
                    }
                    if (v43 != v40)
                      break;
                  }
                }
              }
            }
          }
          v35 += 2;
        }
        v30 += 2;
      }
      while (v30 != (double *)v31);
      operator delete(__p);
      ++v13;
      v9 = *(_QWORD *)a6;
      v11 = a5;
    }
    while (v13 < (uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 2);
  }
}

- (void)_dumpAggregatedGPUTimePerBatchForFrame:(unsigned int)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t end;
  FILE *v10;
  uint64_t v11;
  uint64_t *v12;
  unsigned int *begin;
  unsigned int *value;
  unsigned int v15;
  unsigned int *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  std::vector<unsigned int>::pointer v23;
  unint64_t v24;
  unint64_t v25;
  uint8x8_t v26;
  void **v27;
  char *v28;
  unint64_t v29;
  float v30;
  float v31;
  _BOOL8 v32;
  unint64_t v33;
  unint64_t v34;
  int8x8_t prime;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  uint8x8_t v41;
  unint64_t v42;
  uint8x8_t v43;
  uint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  unint64_t v49;
  unsigned int v50;
  double *v51;
  double v52;
  _QWORD *v53;
  std::vector<unsigned int>::pointer __p;
  _QWORD *v55;
  std::vector<unsigned int>::pointer v56;
  unsigned int v57;
  std::vector<unsigned int> v58;
  unsigned int v59;
  char v60;

  v59 = a3;
  if (*((_BYTE *)self + 752))
  {
    v57 = objc_msgSend(*((id *)self + 20), "encoderCount");
    if (v57)
    {
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/AggregatedEffectiveGPUTimePerBatch.txt"), *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)self + 496, a3, &v59)+ 5));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingLastPathComponent"));
      objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

      end = objc_retainAutorelease(v6);
      v10 = fopen((const char *)objc_msgSend((id)end, "UTF8String"), "wb");

      v11 = *((_QWORD *)self + 37) + 40 * a3;
      memset(&v58, 0, sizeof(v58));
      std::vector<unsigned int>::reserve(&v58, *(_QWORD *)(v11 + 24));
      v12 = *(uint64_t **)(v11 + 16);
      v55 = (_QWORD *)(v11 + 16);
      begin = v58.__begin_;
      if (v12)
      {
        value = v58.__end_cap_.__value_;
        do
        {
          v15 = *((_DWORD *)v12 + 4);
          if (v15 != -1)
          {
            end = (unint64_t)v58.__end_;
            if (v58.__end_ >= value)
            {
              v17 = v58.__end_ - begin;
              v18 = v17 + 1;
              if ((unint64_t)(v17 + 1) >> 62)
              {
                v58.__end_cap_.__value_ = value;
                v58.__begin_ = begin;
                abort();
              }
              if (((char *)value - (char *)begin) >> 1 > v18)
                v18 = ((char *)value - (char *)begin) >> 1;
              if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
                v19 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v19 = v18;
              if (v19)
              {
                v19 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v19);
                v15 = *((_DWORD *)v12 + 4);
              }
              else
              {
                v20 = 0;
              }
              v21 = (unsigned int *)(v19 + 4 * v17);
              *v21 = v15;
              v16 = v21 + 1;
              while ((unsigned int *)end != begin)
              {
                v22 = *(_DWORD *)(end - 4);
                end -= 4;
                *--v21 = v22;
              }
              value = (unsigned int *)(v19 + 4 * v20);
              v58.__end_ = v16;
              if (begin)
                operator delete(begin);
              begin = v21;
            }
            else
            {
              *v58.__end_ = v15;
              end += 4;
              v16 = (unsigned int *)end;
            }
            v58.__end_ = v16;
          }
          v12 = (uint64_t *)*v12;
        }
        while (v12);
        v58.__end_cap_.__value_ = value;
        v58.__begin_ = begin;
      }
      std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>(begin, v58.__end_, &v60);
      __p = v58.__begin_;
      v56 = v58.__end_;
      if (v58.__begin_ != v58.__end_)
      {
        v23 = v58.__begin_;
        while (1)
        {
          v24 = *v23;
          v25 = *(_QWORD *)(v11 + 8);
          if (v25)
          {
            v26 = (uint8x8_t)vcnt_s8((int8x8_t)v25);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              end = *v23;
              if (v25 <= v24)
                end = v24 % v25;
            }
            else
            {
              end = ((_DWORD)v25 - 1) & v24;
            }
            v27 = *(void ***)(*(_QWORD *)v11 + 8 * end);
            if (v27)
            {
              v28 = (char *)*v27;
              if (*v27)
              {
                do
                {
                  v29 = *((_QWORD *)v28 + 1);
                  if (v29 == v24)
                  {
                    if (*((_DWORD *)v28 + 4) == (_DWORD)v24)
                      goto LABEL_100;
                  }
                  else
                  {
                    if (v26.u32[0] > 1uLL)
                    {
                      if (v29 >= v25)
                        v29 %= v25;
                    }
                    else
                    {
                      v29 &= v25 - 1;
                    }
                    if (v29 != end)
                      break;
                  }
                  v28 = *(char **)v28;
                }
                while (v28);
              }
            }
          }
          v28 = (char *)operator new(0x50uLL);
          *(_QWORD *)v28 = 0;
          *((_QWORD *)v28 + 1) = v24;
          *((_DWORD *)v28 + 4) = *v23;
          *(_OWORD *)(v28 + 24) = 0u;
          *(_OWORD *)(v28 + 40) = 0u;
          *(_OWORD *)(v28 + 56) = 0u;
          *((_QWORD *)v28 + 9) = 0;
          v30 = (float)(unint64_t)(*(_QWORD *)(v11 + 24) + 1);
          v31 = *(float *)(v11 + 32);
          if (!v25 || (float)(v31 * (float)v25) < v30)
            break;
LABEL_90:
          v47 = *(_QWORD **)v11;
          v48 = *(_QWORD **)(*(_QWORD *)v11 + 8 * end);
          if (v48)
          {
            *(_QWORD *)v28 = *v48;
          }
          else
          {
            *(_QWORD *)v28 = *v55;
            *v55 = v28;
            v47[end] = v55;
            if (!*(_QWORD *)v28)
              goto LABEL_99;
            v49 = *(_QWORD *)(*(_QWORD *)v28 + 8);
            if ((v25 & (v25 - 1)) != 0)
            {
              if (v49 >= v25)
                v49 %= v25;
            }
            else
            {
              v49 &= v25 - 1;
            }
            v48 = (_QWORD *)(*(_QWORD *)v11 + 8 * v49);
          }
          *v48 = v28;
LABEL_99:
          ++*(_QWORD *)(v11 + 24);
          LODWORD(v24) = *v23;
LABEL_100:
          end = 0;
          v50 = v24 % v57;
          do
          {
            v51 = (double *)&v28[8 * end];
            v52 = v51[3];
            if (v52 > 2.22044605e-16)
              fprintf(v10, "%u %u\t%f µs / %f µs = %f %% \n", v50, end, v51[6] * 0.001, v52 * 0.001, v51[6] * 100.0 / v52);
            ++end;
          }
          while (end != 3);
          if (++v23 == v56)
            goto LABEL_115;
        }
        v32 = (v25 & (v25 - 1)) != 0;
        if (v25 < 3)
          v32 = 1;
        v33 = v32 | (2 * v25);
        v34 = vcvtps_u32_f32(v30 / v31);
        if (v33 <= v34)
          prime = (int8x8_t)v34;
        else
          prime = (int8x8_t)v33;
        if (*(_QWORD *)&prime == 1)
        {
          prime = (int8x8_t)2;
        }
        else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
        {
          prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        }
        v25 = *(_QWORD *)(v11 + 8);
        if (*(_QWORD *)&prime > v25)
          goto LABEL_56;
        if (*(_QWORD *)&prime < v25)
        {
          v42 = vcvtps_u32_f32((float)*(unint64_t *)(v11 + 24) / *(float *)(v11 + 32));
          if (v25 < 3 || (v43 = (uint8x8_t)vcnt_s8((int8x8_t)v25), v43.i16[0] = vaddlv_u8(v43), v43.u32[0] > 1uLL))
          {
            v42 = std::__next_prime(v42);
          }
          else
          {
            v44 = 1 << -(char)__clz(v42 - 1);
            if (v42 >= 2)
              v42 = v44;
          }
          if (*(_QWORD *)&prime <= v42)
            prime = (int8x8_t)v42;
          if (*(_QWORD *)&prime >= v25)
          {
            v25 = *(_QWORD *)(v11 + 8);
          }
          else
          {
            if (prime)
            {
LABEL_56:
              if (*(_QWORD *)&prime >> 61)
                std::__throw_bad_array_new_length[abi:nn180100]();
              v36 = operator new(8 * *(_QWORD *)&prime);
              v37 = *(_QWORD **)v11;
              *(_QWORD *)v11 = v36;
              if (v37)
                operator delete(v37);
              v38 = 0;
              *(int8x8_t *)(v11 + 8) = prime;
              do
                *(_QWORD *)(*(_QWORD *)v11 + 8 * v38++) = 0;
              while (*(_QWORD *)&prime != v38);
              v39 = (_QWORD *)*v55;
              if (*v55)
              {
                v40 = v39[1];
                v41 = (uint8x8_t)vcnt_s8(prime);
                v41.i16[0] = vaddlv_u8(v41);
                if (v41.u32[0] > 1uLL)
                {
                  if (v40 >= *(_QWORD *)&prime)
                    v40 %= *(_QWORD *)&prime;
                }
                else
                {
                  v40 &= *(_QWORD *)&prime - 1;
                }
                *(_QWORD *)(*(_QWORD *)v11 + 8 * v40) = v55;
                v45 = (_QWORD *)*v39;
                if (*v39)
                {
                  do
                  {
                    v46 = v45[1];
                    if (v41.u32[0] > 1uLL)
                    {
                      if (v46 >= *(_QWORD *)&prime)
                        v46 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v46 &= *(_QWORD *)&prime - 1;
                    }
                    if (v46 != v40)
                    {
                      if (!*(_QWORD *)(*(_QWORD *)v11 + 8 * v46))
                      {
                        *(_QWORD *)(*(_QWORD *)v11 + 8 * v46) = v39;
                        goto LABEL_81;
                      }
                      *v39 = *v45;
                      *v45 = **(_QWORD **)(*(_QWORD *)v11 + 8 * v46);
                      **(_QWORD **)(*(_QWORD *)v11 + 8 * v46) = v45;
                      v45 = v39;
                    }
                    v46 = v40;
LABEL_81:
                    v39 = v45;
                    v45 = (_QWORD *)*v45;
                    v40 = v46;
                  }
                  while (v45);
                }
              }
              v25 = (unint64_t)prime;
              goto LABEL_85;
            }
            v53 = *(_QWORD **)v11;
            *(_QWORD *)v11 = 0;
            if (v53)
              operator delete(v53);
            v25 = 0;
            *(_QWORD *)(v11 + 8) = 0;
          }
        }
LABEL_85:
        if ((v25 & (v25 - 1)) != 0)
        {
          if (v25 <= v24)
            end = v24 % v25;
          else
            end = v24;
        }
        else
        {
          end = ((_DWORD)v25 - 1) & v24;
        }
        goto LABEL_90;
      }
LABEL_115:
      fclose(v10);
      if (__p)
        operator delete(__p);
    }
  }
}

- (void)_calculateAverageGPUCommandDuration
{
  DYPMTLShaderProfilerHelper *v2;
  char *v3;
  char *v4;
  char *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  __int128 *v10;
  void **v11;
  void **v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  __int128 **v16;
  void **v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t **i;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  double v35;
  void *v36;
  uint64_t j;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  BOOL v45;
  unint64_t v46;
  void *v47;
  void *v48;
  DYPMTLShaderProfilerHelper *v49;
  __int128 **v50;
  void **v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  void ***v56;

  v2 = self;
  v3 = (char *)self + 344;
  v4 = (char *)self + 416;
  v5 = (char *)self + 344;
  do
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)v5;
    std::vector<double>::resize((char **)v5, *((unsigned int *)v2 + 26));
    v5 += 24;
  }
  while (v5 != v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v2 + 24), "objectAtIndexedSubscript:", 0));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", *((unsigned int *)v2 + 26)));
    objc_msgSend(*((id *)v2 + 20), "setAveragePerDrawKickDurations:", v8);

    v9 = *((unsigned int *)v2 + 26);
    v10 = (__int128 *)operator new(0x30uLL);
    *v10 = xmmword_4AA540;
    v10[1] = xmmword_4AA540;
    v10[2] = xmmword_4AA540;
    v51 = 0;
    v52 = 0;
    v50 = 0;
    std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100](&v50, v7);
    v11 = v51;
    v12 = &v51[3 * v7];
    v13 = 24 * v7;
    do
    {
      *v11 = 0;
      v11[1] = 0;
      v11[2] = 0;
      std::vector<std::pair<unsigned long long,unsigned long long>>::__init_with_size[abi:nn180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>(v11, v10, v10 + 3, 3uLL);
      v11 += 3;
      v13 -= 24;
    }
    while (v13);
    v51 = v12;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v49 = v2;
    if ((_DWORD)v9)
    {
      v14 = operator new(24 * v9);
      v15 = &v14[3 * v9];
      v53 = v14;
      v55 = v15;
      do
      {
        *v14 = 0;
        v14[1] = 0;
        v14[2] = 0;
        v16 = v50;
        v17 = v51;
        if (v51 != (void **)v50)
        {
          std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100](v14, 0xAAAAAAAAAAAAAAABLL * (((char *)v51 - (char *)v50) >> 3));
          v18 = v14[1];
          do
          {
            *(_QWORD *)v18 = 0;
            *(_QWORD *)(v18 + 8) = 0;
            *(_QWORD *)(v18 + 16) = 0;
            std::vector<std::pair<unsigned long long,unsigned long long>>::__init_with_size[abi:nn180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>((_OWORD *)v18, *v16, v16[1], v16[1] - *v16);
            v18 += 24;
            v16 += 3;
          }
          while (v16 != (__int128 **)v17);
          v14[1] = v18;
        }
        v14 += 3;
      }
      while (v14 != v15);
      v54 = v15;
      v2 = v49;
    }
    v56 = (void ***)&v50;
    std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v56);
    operator delete(v10);
    v19 = (uint64_t *)*((_QWORD *)v2 + 28);
    v20 = (uint64_t *)*((_QWORD *)v2 + 29);
    if (v19 != v20)
    {
      if (v7 <= 1)
        v21 = 1;
      else
        v21 = v7;
      do
      {
        v22 = 0;
        v23 = *v19;
        do
        {
          v24 = 0;
          v25 = **(_QWORD **)(v23 + 8 * v22);
          v26 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(v23 + 8 * v22) + 8) - v25) >> 3);
          v27 = v53;
          do
          {
            if (v24 == v26)
              abort();
            for (i = *(uint64_t ***)(v25 + 40 * v24 + 16); i; i = (uint64_t **)*i)
            {
              v29 = (uint64_t *)(*(_QWORD *)(v27[3 * *((unsigned int *)i + 4)] + 24 * v22) + 16 * v24);
              v30 = (uint64_t *)*v29;
              v31 = v29[1];
              if ((unint64_t)i[3] < *v29)
                v30 = i[3];
              *v29 = (uint64_t)v30;
              v32 = (unint64_t)i[4];
              if (v31 > v32)
                v32 = v31;
              v29[1] = v32;
            }
            ++v24;
          }
          while (v24 != 3);
          ++v22;
        }
        while (v22 != v21);
        v19 += 3;
      }
      while (v19 != v20);
    }
    if (*((_DWORD *)v2 + 26))
    {
      v33 = 0;
      if (v7 <= 1)
        v34 = 1;
      else
        v34 = v7;
      v35 = 1.0 / (double)v7;
      do
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3, v49));
        for (j = 0; j != 3; ++j)
        {
          v38 = 0;
          v39 = (uint64_t *)v53[3 * v33];
          v40 = v34;
          do
          {
            v41 = *v39;
            v39 += 3;
            v42 = (unint64_t *)(v41 + 16 * j);
            v44 = *v42;
            v43 = v42[1];
            v45 = v43 >= v44;
            v46 = v43 - v44;
            if (!v45)
              v46 = 0;
            v38 += v46;
            --v40;
          }
          while (v40);
          *(double *)(*(_QWORD *)&v3[24 * j] + 8 * v33) = v35 * (double)(125 * v38 / 3uLL);
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v36, "addObject:", v47);

        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v49 + 20), "averagePerDrawKickDurations"));
        objc_msgSend(v48, "addObject:", v36);

        ++v33;
      }
      while (v33 < *((unsigned int *)v49 + 26));
    }
    v50 = (__int128 **)&v53;
    std::vector<std::vector<std::vector<GRCInfo::MergeCounterData(NSArray *,NSArray*<NSArray*<NSString *>>,NSArray *,std::vector<std::unordered_map<unsigned int,GRCInfo::EncoderCounterInfo>> &,NSMutableDictionary<NSArray*,NSNumber *> *)::CounterValueData,std::allocator<GRCInfo::MergeCounterData(NSArray *,NSArray*<NSArray*<NSString *>>,NSArray *,std::vector<std::unordered_map<unsigned int,GRCInfo::EncoderCounterInfo>> &,NSMutableDictionary<NSArray*,NSNumber *> *)::CounterValueData>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v50);
  }
}

- (void)_calculateAggregatedEffectiveGPUEncoderCost
{
  unsigned int v3;
  unsigned int v4;
  unint64_t v5;
  char *v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  uint64_t v23;
  uint64_t i;
  uint64_t *j;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t k;
  uint64_t v37;
  unsigned int v38;
  double *v39;
  double v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void **p_cache;
  void **v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  double ***v51;
  double ***v52;
  void *v53;
  double *v54;
  uint64_t v55;
  unint64_t v56;
  double *v57;
  double v58;
  double ***v59;
  double ***m;
  double *v61;
  uint64_t v62;
  unint64_t v63;
  double *v64;
  double v65;
  uint64_t n;
  void *v67;
  void *v68;
  void *v69;
  uint64_t ii;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;

  *((_QWORD *)self + 41) = *((_QWORD *)self + 40);
  v3 = objc_msgSend(*((id *)self + 20), "encoderCount");
  if (!v3)
    return;
  v4 = v3;
  v5 = v3;
  v7 = (_BYTE *)*((_QWORD *)self + 40);
  v6 = (char *)*((_QWORD *)self + 41);
  v8 = 0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 3);
  v9 = v3 - v8;
  v75 = v3;
  if (v3 > v8)
  {
    v10 = *((_QWORD *)self + 42);
    if (0x6DB6DB6DB6DB6DB7 * ((v10 - (uint64_t)v6) >> 3) < v9)
    {
      v11 = 0x6DB6DB6DB6DB6DB7 * ((v10 - (uint64_t)v7) >> 3);
      v12 = 0xDB6DB6DB6DB6DB6ELL * ((v10 - (uint64_t)v7) >> 3);
      if (v12 <= v3)
        v12 = v3;
      if (v11 >= 0x249249249249249)
        v13 = 0x492492492492492;
      else
        v13 = v12;
      if (v13 > 0x492492492492492)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v14 = 56 * v13;
      v15 = (char *)operator new(56 * v13);
      v16 = &v15[8 * ((v6 - v7) >> 3)];
      v17 = &v15[v14];
      bzero(v16, 56 * ((56 * v9 - 56) / 0x38) + 56);
      v18 = &v16[56 * ((56 * v9 - 56) / 0x38) + 56];
      if (v6 != v7)
      {
        do
        {
          v19 = *(_OWORD *)(v6 - 56);
          v20 = *(_OWORD *)(v6 - 40);
          v21 = *(_OWORD *)(v6 - 24);
          *((_QWORD *)v16 - 1) = *((_QWORD *)v6 - 1);
          *(_OWORD *)(v16 - 24) = v21;
          *(_OWORD *)(v16 - 40) = v20;
          *(_OWORD *)(v16 - 56) = v19;
          v16 -= 56;
          v6 -= 56;
        }
        while (v6 != v7);
        v6 = (char *)*((_QWORD *)self + 40);
      }
      *((_QWORD *)self + 40) = v16;
      *((_QWORD *)self + 41) = v18;
      *((_QWORD *)self + 42) = v17;
      v5 = v75;
      if (v6)
        operator delete(v6);
      goto LABEL_19;
    }
    bzero(v6, 56 * ((56 * v9 - 56) / 0x38) + 56);
    v22 = &v6[56 * ((56 * v9 - 56) / 0x38) + 56];
    goto LABEL_18;
  }
  if (v3 < v8)
  {
    v22 = &v7[56 * v3];
LABEL_18:
    *((_QWORD *)self + 41) = v22;
  }
LABEL_19:
  v23 = *((_QWORD *)self + 37);
  for (i = *((_QWORD *)self + 38); v23 != i; v23 += 40)
  {
    for (j = *(uint64_t **)(v23 + 16); j; j = (uint64_t *)*j)
    {
      v26 = *((_DWORD *)j + 4);
      if (v26 != -1)
      {
        v27 = 0;
        v28 = 0;
        v29 = v26 % v4;
        v30 = *((_QWORD *)self + 40);
        do
        {
          v31 = (double *)(v30 + 56 * v29 + 8 * v28);
          v31[3] = *(double *)&j[v27 + 6] + v31[3];
          *v31 = *(double *)&j[v27 + 3] + *v31;
          ++v28;
          ++v27;
        }
        while (v27 != 3);
        ++*(_DWORD *)(v30 + 56 * v29 + 48);
      }
    }
  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v5));
  v32 = 0;
  v33 = 0;
  if (v4 <= 1)
    v34 = 1;
  else
    v34 = v4;
  do
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
    for (k = 0; k != 24; k += 8)
    {
      v37 = *((_QWORD *)self + 40);
      v38 = *(_DWORD *)(v37 + 56 * v33 + 48);
      if (v38)
      {
        v39 = (double *)(v37 + v32 + k);
        v40 = v39[3] / (double)v38;
        v39[3] = v40;
        *v39 = *v39 / (double)v38;
      }
      else
      {
        v40 = *(double *)(v37 + v32 + k + 24);
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40));
      objc_msgSend(v35, "addObject:", v41);

    }
    objc_msgSend(v76, "addObject:", v35);

    ++v33;
    v32 += 56;
  }
  while (v33 != v34);
  objc_msgSend(*((id *)self + 20), "setEffectiveKickTimes:", v76);
  v42 = v75;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v75));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v75));
  v45 = 0;
  p_cache = GTMTLReplayActivityLoadArchive.cache;
  v74 = 8 * v75;
  while (v45 < (unint64_t)objc_msgSend(*((id *)self + 23), "count", v74))
  {
    v47 = p_cache;
    v48 = *((_QWORD *)self + 31);
    v78 = *((_QWORD *)self + 34);
    v49 = std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v42);
    bzero(v49, v74);
    v77 = std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v42);
    bzero(v77, v74);
    v51 = *(double ****)(v48 + 24 * v45);
    v52 = *(double ****)(v48 + 24 * v45 + 8);
    v53 = v49;
    for (p_cache = v47; v51 != v52; ++v51)
    {
      v54 = **v51;
      v55 = (char *)(*v51)[1] - (char *)v54;
      if (v55)
      {
        v56 = v55 >> 3;
        if (v56 <= 1)
          v56 = 1;
        v57 = (double *)v49;
        do
        {
          v58 = *v54++;
          *v57 = v58 + *v57;
          ++v57;
          --v56;
        }
        while (v56);
      }
    }
    v59 = *(double ****)(v78 + 24 * v45);
    for (m = *(double ****)(v78 + 24 * v45 + 8); v59 != m; ++v59)
    {
      v61 = **v59;
      v62 = (char *)(*v59)[1] - (char *)v61;
      if (v62)
      {
        v63 = v62 >> 3;
        if (v63 <= 1)
          v63 = 1;
        v64 = (double *)v77;
        do
        {
          v65 = *v61++;
          *v64 = v65 + *v64;
          ++v64;
          --v63;
        }
        while (v63);
      }
    }
    for (n = 0; n != v34; ++n)
    {
      if (!v45)
      {
        v67 = (void *)objc_opt_new(v47 + 113, v50);
        objc_msgSend(v43, "addObject:", v67);

      }
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", n));
      v69 = v68;
      if (v68)
      {
        objc_msgSend(v68, "timing");
        objc_msgSend(v69, "timing");
      }

    }
    for (ii = 0; ii != v34; ++ii)
    {
      if (!v45)
      {
        v71 = (void *)objc_opt_new(v47 + 113, v50);
        objc_msgSend(v44, "addObject:", v71);

      }
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", ii));
      v73 = v72;
      if (v72)
      {
        objc_msgSend(v72, "timing");
        objc_msgSend(v73, "timing");
      }

    }
    if (v77)
      operator delete(v77);
    if (v53)
      operator delete(v53);
    ++v45;
    v42 = v75;
  }
  objc_msgSend(*((id *)self + 20), "setLoadActionTimes:", v43);
  objc_msgSend(*((id *)self + 20), "setStoreActionTimes:", v44);

}

- (void)_dumpLimiterBatchInfoCosts:(void *)a3 forRingBuffer:(unsigned int)a4 forFrame:(unsigned int)a5
{
  NSString *v6;
  id v7;
  FILE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double **v12;
  double *v13;
  int *v14;
  double v15;
  int v16;
  unsigned int v17;

  v17 = a5;
  if (*((_BYTE *)self + 752))
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/perLimiterBatchCosts.txt"), *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)self + 496, a5, &v17)+ 5), *(_QWORD *)&a4);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
    v8 = fopen((const char *)objc_msgSend(v7, "UTF8String"), "wt");
    if (v8)
    {
      fwrite("Limiter Index : BatchIdx Cost\n", 0x1EuLL, 1uLL, v8);
      v10 = *(_QWORD *)a3;
      v9 = *((_QWORD *)a3 + 1);
      if (v9 != *(_QWORD *)a3)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)(v10 + 24 * v11) != *(_QWORD *)(v10 + 24 * v11 + 8))
          {
            fprintf(v8, "%lu: ", v11);
            v12 = (double **)(*(_QWORD *)a3 + 24 * v11);
            v13 = *v12;
            v14 = (int *)v12[1];
            while (v13 != (double *)v14)
            {
              v15 = v13[1];
              v16 = *(_DWORD *)v13;
              v13 += 2;
              fprintf(v8, "\t%u %f, ", v16, v15);
            }
            fputc(10, v8);
            v10 = *(_QWORD *)a3;
            v9 = *((_QWORD *)a3 + 1);
          }
          ++v11;
        }
        while (v11 < 0xAAAAAAAAAAAAAAABLL * ((v9 - v10) >> 3));
      }
      fclose(v8);
    }

  }
}

- (void)adjustHWBiasAndFinalizeResult
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 3);
        if (v5)
        {
          *((_QWORD *)v3 - 2) = v5;
          operator delete(v5);
        }
        v3 -= 48;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

- (void)generateTargetSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a6 withUSCSampleBuffer:(unint64_t *)a7 withUSCSampleNum:(unsigned int)a8 withBatchIDToEncoderIndex:(void *)a9 andEncoderIndexToBatchIdMap:(void *)a10 targetIndex:(int)a11
{
  void *v13;
  unint64_t v14;
  char *v15;
  size_t v16;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char **v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  int64x2_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  BOOL v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  unsigned int v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  dispatch_queue_global_t global_queue;
  _DWORD *v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  FILE *v92;
  uint64_t *v93;
  void *v94;
  uint64_t v95;
  FILE *v96;
  __int128 v97;
  uint64_t v98;
  unsigned int v99;
  unint64_t *v100;
  unint64_t v101;
  void **v102;
  char *v103;
  void **v104;
  char *v105;
  __int128 v106;
  void *v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  __int128 v114;
  char *v115;
  char *v116;
  unint64_t v117;
  __int128 v118;
  uint64_t *v119;
  uint64_t i;
  uint64_t v121;
  double *v122;
  unint64_t v123;
  uint64_t v124;
  size_t v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t j;
  uint64_t v130;
  char **v131;
  char *v132;
  char **v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  char *v141;
  uint64_t v142;
  char *v143;
  size_t v144;
  char *v145;
  char *v146;
  char *v147;
  uint64_t v148;
  char *v149;
  size_t v150;
  char *v151;
  int v152;
  char *v153;
  char *v154;
  char *v155;
  char *v156;
  char *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t *v161;
  unint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t *v168;
  unint64_t v169;
  int v170;
  unsigned int v171;
  int v172;
  int v173;
  char *v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t k;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  _BOOL4 v181;
  uint64_t v182;
  void *v183;
  void *v184;
  uint64_t m;
  unsigned int *v186;
  uint64_t v187;
  unsigned int v188;
  uint64_t v189;
  uint64_t *v190;
  unsigned __int8 *v191;
  uint64_t *v192;
  uint64_t *v193;
  _QWORD *v194;
  unint64_t v195;
  int32x2_t *v196;
  uint8x8_t v197;
  uint64_t **v198;
  uint64_t *n;
  unint64_t v200;
  _QWORD *v201;
  __int128 v202;
  float v203;
  float v204;
  _BOOL8 v205;
  unint64_t v206;
  unint64_t v207;
  size_t v208;
  uint64_t v209;
  _QWORD *v210;
  unint64_t v211;
  int v212;
  uint64_t *v213;
  unint64_t v214;
  unint64_t v215;
  unint64_t *v216;
  size_t v217;
  uint8x8_t v218;
  unsigned __int8 **v219;
  unsigned __int8 *ii;
  unint64_t v221;
  char *v222;
  std::string *v223;
  __int128 v224;
  uint64_t *v225;
  _QWORD *v226;
  unint64_t v227;
  unint64_t v228;
  uint8x8_t v229;
  uint64_t **v230;
  uint64_t *jj;
  unint64_t v232;
  _QWORD *v233;
  __int128 v234;
  float v235;
  float v236;
  _BOOL8 v237;
  unint64_t v238;
  unint64_t v239;
  size_t v240;
  uint64_t v241;
  _QWORD *v242;
  unint64_t v243;
  float v244;
  size_t v245;
  unint64_t v246;
  _BOOL8 v247;
  unint64_t v248;
  unint64_t v249;
  size_t v250;
  uint64_t v251;
  _QWORD *v252;
  size_t v253;
  FILE *p_lbfsize;
  double v255;
  uint64_t *v256;
  int v257;
  unint64_t v258;
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  unint64_t v262;
  uint8x8_t v263;
  unint64_t v264;
  unint64_t v265;
  _OWORD *v266;
  unint64_t v267;
  void **v268;
  char *v269;
  unint64_t v270;
  uint8x8_t v271;
  unint64_t v272;
  void **v273;
  unint64_t v274;
  std::string *v275;
  __int128 v276;
  float v277;
  _BOOL8 v278;
  unint64_t v279;
  unint64_t v280;
  size_t v281;
  uint64_t v282;
  _QWORD *v283;
  unint64_t v284;
  uint64_t v285;
  uint64_t v286;
  unint64_t v287;
  uint64_t v288;
  uint64_t v290;
  uint64_t *v291;
  uint64_t v292;
  uint64_t v293;
  float64x2_t *v294;
  float64x2_t v295;
  float64x2_t v296;
  uint64_t v297;
  float64x2_t v298;
  float64x2_t *v299;
  float64x2_t *v300;
  float64x2_t v301;
  char v302;
  FILE *v303;
  unsigned __int8 *p;
  _QWORD *v305;
  GPUToolsPlatformLLVMShaderProfilerHelperImpl **v306;
  uint64_t *TargetClauseAnalysis;
  const char *v308;
  uint64_t v309;
  unsigned int **v310;
  uint64_t v311;
  _QWORD *v312;
  uint64_t *v313;
  uint64_t *v314;
  void **v315;
  const char *v316;
  unsigned int *v317;
  unsigned int *v318;
  int v319;
  uint64_t *v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  _QWORD *kk;
  unint64_t v326;
  char *v327;
  uint64_t v328;
  void *v329;
  unsigned int v330;
  unsigned int v331;
  uint64_t v332;
  char *v333;
  uint64_t *v334;
  _QWORD *v335;
  unint64_t v336;
  uint64_t v337;
  char *v338;
  void **v339;
  uint64_t v340;
  uint64_t v341;
  char *v342;
  uint64_t v343;
  char *v344;
  char *v345;
  char *v346;
  __int128 v347;
  uint64_t *v348;
  char *v349;
  void **v350;
  _OWORD *mm;
  _OWORD *v352;
  __int128 *v353;
  __int128 v354;
  uint64_t v355;
  unint64_t v356;
  unint64_t v357;
  uint64_t v358;
  _OWORD *v359;
  __int128 v360;
  char *v361;
  char *v362;
  _OWORD *v363;
  __int128 v364;
  unint64_t v365;
  uint64_t v366;
  uint64_t v367;
  void *v368;
  uint64_t v369;
  uint64_t nn;
  id v371;
  const std::string::value_type *v372;
  FILE *v373;
  FILE *v374;
  const char *v375;
  int *v376;
  int *v377;
  uint64_t v378;
  int v379;
  int *v380;
  int *v381;
  uint64_t v382;
  int v383;
  const char *v384;
  uint64_t v385;
  unsigned int v386;
  double v387;
  const char *v388;
  uint64_t *v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  const char *v394;
  char *v395;
  unsigned int *v396;
  unsigned int *v397;
  unsigned int v398;
  unsigned int v399;
  double v400;
  unsigned int v401;
  unsigned int v402;
  double v403;
  GPUToolsPlatformLLVMShaderProfilerHelperImpl **v404;
  uint64_t v405;
  _QWORD *v406;
  unint64_t v407;
  GPUToolsPlatformLLVMShaderProfilerHelperImpl *v408;
  uint64_t **v409;
  const char *v410;
  uint64_t v411;
  uint64_t *v412;
  void **v413;
  unsigned __int8 *v414;
  std::string::value_type *v415;
  unsigned __int8 *v416;
  char *v417;
  _BYTE *v418;
  int v419;
  void *v420;
  std::string *v421;
  unint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  uint64_t v426;
  uint64_t v427;
  unsigned int *v428;
  void *v429;
  id *v430;
  void *v431;
  uint64_t v432;
  unsigned int *v433;
  _BYTE *v434;
  unsigned int *v435;
  NSObject *group;
  dispatch_group_t groupa;
  unint64_t *v439;
  uint64_t v440;
  NSObject *queue;
  NSObject *v442;
  DYPMTLShaderProfilerHelper *v443;
  uint64_t v444;
  void *v445;
  unsigned int v447;
  uint64_t *v448;
  uint64_t v449;
  uint64_t *v450;
  id *v451;
  FILE *v452;
  unint64_t v453;
  FILE *v454;
  FILE *v455;
  FILE *v456;
  FILE *v457;
  unsigned int v458;
  unint64_t *v459;
  FILE *v460;
  unsigned int **v461;
  unsigned int *v462;
  size_t __lena;
  size_t __lenb;
  int __lenc;
  size_t __lend;
  std::string v468;
  void *v469[2];
  __int128 v470;
  int v471;
  std::string *v472;
  std::string *v473;
  void **p_data;
  void *v475;
  char *v476;
  char *v477;
  __int128 v478;
  __int128 v479;
  float v480;
  __int128 v481;
  __int128 v482;
  float v483;
  _QWORD v484[11];
  void *v485;
  char *v486;
  char *v487;
  void *v488;
  id v489[3];
  char v490;
  _QWORD v491[3];
  _QWORD v492[3];
  int v493;
  int v494;
  unsigned int v495;
  int v496;
  int v497;
  unint64_t *v498;
  unint64_t *v499;
  unint64_t v500;
  uint64_t v501;
  uint64_t *v502;
  uint64_t v503;
  __n128 (*v504)(__n128 *, __n128 *);
  void (*v505)(uint64_t);
  void *v506;
  char *v507;
  char *v508;
  char *v509;
  uint64_t v510;
  uint64_t *v511;
  uint64_t v512;
  __n128 (*v513)(__n128 *, __n128 *);
  void (*v514)(uint64_t);
  void *v515;
  char *v516;
  char *v517;
  char *v518;
  uint64_t v519;
  uint64_t *v520;
  uint64_t v521;
  __n128 (*v522)(__n128 *, __n128 *);
  void (*v523)(uint64_t);
  void *v524;
  char *v525;
  char *v526;
  char *v527;
  uint64_t v528;
  uint64_t *v529;
  uint64_t v530;
  __n128 (*v531)(__n128 *, __n128 *);
  void (*v532)(uint64_t);
  void *v533;
  char *v534;
  char *v535;
  char *v536;
  uint64_t v537;
  uint64_t *v538;
  uint64_t v539;
  __n128 (*v540)(__n128 *, __n128 *);
  void (*v541)(uint64_t);
  void *v542;
  char *v543;
  char *v544;
  char *v545;
  _QWORD block[13];
  int v547;
  uint64_t v548;
  unsigned int v549;
  int v550;
  unsigned int v551;
  BOOL v552;
  _QWORD v553[6];
  void *v554;
  void *v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t *v558;
  uint64_t v559;
  __n128 (*v560)(__n128 *, __n128 *);
  void (*v561)(uint64_t);
  void *v562;
  _QWORD v563[3];
  uint64_t v564;
  uint64_t *v565;
  uint64_t v566;
  __n128 (*v567)(__n128 *, __n128 *);
  void (*v568)(uint64_t);
  void *v569;
  void *v570;
  char *v571;
  char *v572;
  uint64_t v573;
  uint64_t *v574;
  uint64_t v575;
  __n128 (*v576)(__n128 *, __n128 *);
  void (*v577)(uint64_t);
  void *v578;
  void *v579;
  char *v580;
  char *v581;
  uint64_t *v582;
  uint64_t *v583;
  uint64_t v584;
  _QWORD v585[5];
  id v586;
  void *__p[2];
  uint64_t (*v588)(uint64_t, _QWORD *);
  uint64_t (*v589)(uint64_t);
  _BYTE v590[32];
  uint64_t v591;
  int v592;
  id v593;
  void *v594;
  char v595;
  uint64_t *v596;
  void *v597;
  uint64_t v598;
  void *v599[2];
  uint64_t v600;
  _BYTE v601[24];
  char *v602;
  char **v603;
  char v604;
  uint64_t v605;
  int v606;
  void **v607;
  _QWORD v608[3];
  __int128 v609;

  v451 = (id *)a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v451, "drawCallInfoList"));
  v14 = (unint64_t)objc_msgSend(v13, "count");
  v597 = 0;
  v596 = 0;
  v598 = 0;
  if (v14)
  {
    std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100](&v596, v14);
    v15 = (char *)v597;
    v16 = 24 * ((24 * v14 - 24) / 0x18) + 24;
    bzero(v597, v16);
    v597 = &v15[v16];
  }
  v443 = self;

  v18 = 0;
  v458 = 0;
  while (1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v451, "drawCallInfoList"));
    v20 = v18;
    v21 = (unint64_t)objc_msgSend(v19, "count") > v18;

    if (!v21)
      break;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v451, "drawCallInfoList"));
    v23 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v20));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "programInfo"));
    if (!v24
      || (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "programInfo")),
          v26 = objc_msgSend(v25, "programId") == (id)-1,
          v25,
          v24,
          !v26))
    {
      v27 = v596;
      v586 = 0;
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      v28 = &v27[3 * v458];
      v29 = (unint64_t *)(v28 + 1);
      v30 = (_QWORD *)v28[1];
      v31 = *v28;
      v32 = (uint64_t)v30 - *v28;
      if ((unint64_t)v32 > 0xBF)
      {
        if (v32 != 192)
        {
          v55 = (_QWORD *)(v31 + 192);
          while (v30 != v55)
          {
            v30 -= 4;
            std::allocator<std::pair<ShaderBinaryInfo * {__strong},std::string>>::destroy[abi:nn180100]((uint64_t)v30);
          }
          *v29 = (unint64_t)v55;
        }
      }
      else
      {
        v33 = a9;
        v34 = v32 >> 5;
        v35 = 6 - (v32 >> 5);
        v36 = &v27[3 * v458];
        v39 = v36[2];
        v38 = (char **)(v36 + 2);
        v37 = v39;
        if (v35 <= (v39 - (uint64_t)v30) >> 5)
        {
          v56 = &v30[4 * v35];
          v57 = 192 - 32 * v34;
          a9 = v33;
          do
          {
            std::pair<ShaderBinaryInfo * {__strong},std::string>::pair[abi:nn180100](v30, (uint64_t)&v586);
            v30 += 4;
            v57 -= 32;
          }
          while (v57);
          *v29 = (unint64_t)v56;
        }
        else
        {
          v603 = v38;
          v40 = v37 - v31;
          v41 = v40 >> 4;
          if ((unint64_t)(v40 >> 4) <= 6)
            v41 = 6;
          if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFE0)
            v42 = 0x7FFFFFFFFFFFFFFLL;
          else
            v42 = v41;
          v43 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTable>>(v42);
          v44 = &v43[32 * v34];
          *(_QWORD *)v601 = v43;
          *(_QWORD *)&v601[8] = v44;
          *(_QWORD *)&v601[16] = v44;
          v602 = &v43[32 * v45];
          v46 = v43 + 192;
          v47 = v34 - 6;
          do
          {
            std::pair<ShaderBinaryInfo * {__strong},std::string>::pair[abi:nn180100](v44, (uint64_t)&v586);
            v44 += 32;
          }
          while (!__CFADD__(v47++, 1));
          v49 = *v29;
          v50 = *v28;
          v51 = *(_QWORD *)&v601[8];
          if (*v29 == *v28)
          {
            v54 = vdupq_n_s64(v49);
          }
          else
          {
            do
            {
              v52 = *(_QWORD *)(v49 - 32);
              v49 -= 32;
              *(_QWORD *)v49 = 0;
              *(_QWORD *)(v51 - 32) = v52;
              v51 -= 32;
              v53 = *(_OWORD *)(v49 + 8);
              *(_QWORD *)(v51 + 24) = *(_QWORD *)(v49 + 24);
              *(_OWORD *)(v51 + 8) = v53;
              *(_QWORD *)(v49 + 16) = 0;
              *(_QWORD *)(v49 + 24) = 0;
              *(_QWORD *)(v49 + 8) = 0;
            }
            while (v49 != v50);
            v54 = *(int64x2_t *)v28;
          }
          *v28 = v51;
          *v29 = (unint64_t)v46;
          *(int64x2_t *)&v601[8] = v54;
          v58 = *v38;
          *v38 = v602;
          v602 = v58;
          *(_QWORD *)v601 = v54.i64[0];
          std::__split_buffer<std::pair<ShaderBinaryInfo * {__strong},std::string>>::~__split_buffer((uint64_t)v601);
          a9 = v33;
        }
      }
      if (SHIBYTE(v588) < 0)
        operator delete(__p[0]);

      v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v451[30], "objectForKeyedSubscript:", v23[1]));
      v60 = *(void **)(*v28 + 32);
      *(_QWORD *)(*v28 + 32) = v59;

      v61 = (void *)v23[1];
      if (v61)
      {
        std::string::basic_string[abi:nn180100]<0>(v601, (char *)objc_msgSend(v61, "UTF8String"));
        v62 = *v28 + 40;
        if (*(char *)(*v28 + 63) < 0)
          operator delete(*(void **)v62);
        *(_OWORD *)v62 = *(_OWORD *)v601;
        *(_QWORD *)(v62 + 16) = *(_QWORD *)&v601[16];
      }
      v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v451[31], "objectForKeyedSubscript:", v23[2]));
      v64 = *(void **)(*v28 + 64);
      *(_QWORD *)(*v28 + 64) = v63;

      v65 = (void *)v23[2];
      if (v65)
      {
        std::string::basic_string[abi:nn180100]<0>(v601, (char *)objc_msgSend(v65, "UTF8String"));
        v66 = *v28 + 72;
        if (*(char *)(*v28 + 95) < 0)
          operator delete(*(void **)v66);
        *(_OWORD *)v66 = *(_OWORD *)v601;
        *(_QWORD *)(v66 + 16) = *(_QWORD *)&v601[16];
      }
      v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v451[32], "objectForKeyedSubscript:", v23[3]));
      v68 = *(void **)(*v28 + 96);
      *(_QWORD *)(*v28 + 96) = v67;

      ++v458;
      v69 = (void *)v23[3];
      if (v69)
      {
        std::string::basic_string[abi:nn180100]<0>(v601, (char *)objc_msgSend(v69, "UTF8String"));
        v70 = *v28;
        v71 = *v28 + 104;
        if (*(char *)(v70 + 127) < 0)
          operator delete(*(void **)v71);
        *(_OWORD *)v71 = *(_OWORD *)v601;
        *(_QWORD *)(v71 + 16) = *(_QWORD *)&v601[16];
      }
    }

    v18 = v20 + 1;
  }
  v593 = 0;
  std::string::basic_string[abi:nn180100]<0>(&v594, "");
  v586 = 0;
  __p[0] = &v586;
  __p[1] = (void *)0x5812000000;
  v588 = __Block_byref_object_copy__549;
  v589 = __Block_byref_object_dispose__550;
  memset(v590, 0, sizeof(v590));
  v591 = 0;
  v592 = 1065353216;
  v72 = v451[33];
  v585[0] = _NSConcreteStackBlock;
  v585[1] = 3221225472;
  v585[2] = __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke;
  v585[3] = &unk_725C48;
  v585[4] = &v586;
  objc_msgSend(v72, "enumerateKeysAndObjectsUsingBlock:", v585);
  if (*((__int16 *)a7 + 3) == -275)
  {
    v73 = 1;
  }
  else
  {
    v74 = 1;
    v75 = 1023;
    while (v74 != 1024)
    {
      v76 = SHIWORD(a7[v74++]);
      if (v76 == -275)
      {
        v75 = v74 - 2;
        break;
      }
    }
    v73 = v75 < 0x3FF;
  }
  v77 = a9;
  v583 = 0;
  v582 = 0;
  v584 = 0;
  v78 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  std::vector<std::vector<ShaderProfilerUSCSampleInfo>>::resize((uint64_t)&v582, v78);
  v79 = std::thread::hardware_concurrency();
  v573 = 0;
  v574 = &v573;
  if (v79 <= 1)
    v80 = 1;
  else
    v80 = v79 >> 1;
  v575 = 0x4812000000;
  v576 = __Block_byref_object_copy__552;
  v577 = __Block_byref_object_dispose__553;
  v578 = &unk_4C2897;
  v579 = 0;
  v581 = 0;
  v580 = 0;
  v81 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v80);
  v579 = v81;
  v581 = &v81[4 * v82];
  bzero(v81, 4 * v80);
  v580 = &v81[4 * v80];
  v564 = 0;
  v565 = &v564;
  v566 = 0x4812000000;
  v567 = __Block_byref_object_copy__552;
  v568 = __Block_byref_object_dispose__553;
  v569 = &unk_4C2897;
  v570 = 0;
  v572 = 0;
  v571 = 0;
  v83 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v80);
  v570 = v83;
  v572 = &v83[4 * v84];
  bzero(v83, 4 * v80);
  v571 = &v83[4 * v80];
  v557 = 0;
  v558 = &v557;
  v559 = 0x4812000000;
  v560 = __Block_byref_object_copy__509;
  v561 = __Block_byref_object_dispose__510;
  v562 = &unk_4C2897;
  memset(v563, 0, sizeof(v563));
  v553[0] = 0;
  v553[1] = v553;
  v553[3] = __Block_byref_object_copy__513;
  v553[4] = __Block_byref_object_dispose__514;
  v553[2] = 0x4812000000;
  v553[5] = &unk_4C2897;
  v554 = 0;
  v556 = 0;
  v555 = 0;
  std::vector<ShaderProfilerUSCSampleInfo>::reserve(&v554, 0x100000uLL);
  std::vector<std::vector<ShaderProfilerUSCSampleInfo>>::resize((uint64_t)(v558 + 6), v80);
  global_queue = dispatch_get_global_queue(0, 0);
  queue = objc_claimAutoreleasedReturnValue(global_queue);
  group = dispatch_group_create();
  v86 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>((v80 + 1));
  bzero(v86, 4 * (v80 + 1));
  v448 = (uint64_t *)v86;
  v452 = (FILE *)v80;
  if ((_DWORD)v80)
  {
    v87 = 0;
    v88 = v80;
    do
    {
      *v86++ = a8 / v80 * v87++;
      --v88;
    }
    while (v88);
    *((_DWORD *)v448 + v80) = a8;
    if (!v73)
    {
      v89 = 0;
      do
      {
        v90 = v89;
        v91 = *((unsigned int *)v448 + v89++);
        if (v91 < *((_DWORD *)v448 + v89))
        {
          while (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(a10, a7[v91]))
          {
            if (++v91 >= (unint64_t)*((unsigned int *)v448 + v89))
              goto LABEL_65;
          }
          *((_DWORD *)v448 + v90) = v91;
        }
LABEL_65:
        ;
      }
      while (v89 != v80);
    }
    v92 = 0;
    v93 = v448;
    v94 = v77;
    do
    {
      v95 = *v93;
      v93 = (uint64_t *)((char *)v93 + 4);
      v96 = (FILE *)((char *)&v92->_p + 1);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_558;
      block[3] = &unk_725C70;
      v547 = (int)v92;
      v548 = v95;
      v552 = v73;
      v549 = a8;
      v550 = a11;
      block[4] = v443;
      block[5] = &v573;
      block[6] = &v564;
      block[7] = v553;
      v551 = a5;
      block[10] = a10;
      block[11] = v78;
      block[12] = v94;
      block[9] = a7;
      block[8] = &v557;
      dispatch_group_async(group, queue, block);
      v92 = v96;
    }
    while (v452 != v96);
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    v98 = 0;
    a7 = (_QWORD *)(&stru_20 + 8);
    v99 = a5;
    do
    {
      v449 = v98;
      v100 = (unint64_t *)(v558[6] + 24 * v98);
      v78 = *v100;
      v101 = v100[1];
      while (v78 != v101)
      {
        v102 = (void **)&v582[3 * (*(_DWORD *)v78 - v99)];
        v104 = v102 + 1;
        v103 = (char *)v102[1];
        v105 = (char *)v102[2];
        if (v103 >= v105)
        {
          v108 = 0xCCCCCCCCCCCCCCCDLL * ((v103 - (_BYTE *)*v102) >> 3);
          v109 = v108 + 1;
          if (v108 + 1 > 0x666666666666666)
            abort();
          v110 = 0xCCCCCCCCCCCCCCCDLL * ((v105 - (_BYTE *)*v102) >> 3);
          if (2 * v110 > v109)
            v109 = 2 * v110;
          if (v110 >= 0x333333333333333)
            v111 = 0x666666666666666;
          else
            v111 = v109;
          if (v111)
            v111 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v111);
          else
            v112 = 0;
          v113 = v111 + 40 * v108;
          v97 = *(_OWORD *)v78;
          v114 = *(_OWORD *)(v78 + 16);
          *(_QWORD *)(v113 + 32) = *(_QWORD *)(v78 + 32);
          *(_OWORD *)v113 = v97;
          *(_OWORD *)(v113 + 16) = v114;
          v115 = (char *)*v104;
          v116 = (char *)*v102;
          v117 = v113;
          if (*v104 != *v102)
          {
            do
            {
              v97 = *(_OWORD *)(v115 - 40);
              v118 = *(_OWORD *)(v115 - 24);
              *(_QWORD *)(v117 - 8) = *((_QWORD *)v115 - 1);
              *(_OWORD *)(v117 - 24) = v118;
              *(_OWORD *)(v117 - 40) = v97;
              v117 -= 40;
              v115 -= 40;
            }
            while (v115 != v116);
            v115 = (char *)*v102;
          }
          *v102 = (void *)v117;
          v107 = (void *)(v113 + 40);
          *v104 = (void *)(v113 + 40);
          v102[2] = (void *)(v111 + 40 * v112);
          if (v115)
            operator delete(v115);
          v99 = a5;
        }
        else
        {
          v97 = *(_OWORD *)v78;
          v106 = *(_OWORD *)(v78 + 16);
          *((_QWORD *)v103 + 4) = *(_QWORD *)(v78 + 32);
          *(_OWORD *)v103 = v97;
          *((_OWORD *)v103 + 1) = v106;
          v107 = v103 + 40;
        }
        *v104 = v107;
        v78 += 40;
      }
      v98 = v449 + 1;
      v80 = (unint64_t)v452;
    }
    while ((FILE *)(v449 + 1) != v452);
  }
  else
  {
    *v86 = a8;
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  }
  v119 = v582;
  for (i = (uint64_t)v583;
        v119 != (uint64_t *)i;
        *(double *)&v97 = std::__introsort<std::_ClassicAlgPolicy,USCSampleComparator &,ShaderProfilerUSCSampleInfo *,false>(v121, v122, v124, 1, *(double *)&v97))
  {
    v121 = *v119;
    v122 = (double *)v119[1];
    v119 += 3;
    v123 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v122 - v121) >> 3));
    if (v122 == (double *)v121)
      v124 = 0;
    else
      v124 = v123;
  }
  v125 = 8 * v458;
  if (v458)
  {
    v126 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v458);
    bzero(v126, v125);
    v435 = (unsigned int *)v126;
    v433 = (unsigned int *)&v126[8 * v458];
  }
  else
  {
    v435 = 0;
    v433 = 0;
  }
  v537 = 0;
  v538 = &v537;
  v539 = 0x4812000000;
  v540 = __Block_byref_object_copy__560;
  v541 = __Block_byref_object_dispose__561;
  v542 = &unk_4C2897;
  v543 = 0;
  v545 = 0;
  v544 = 0;
  if ((_DWORD)v80)
  {
    v127 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v80);
    v543 = v127;
    v545 = &v127[24 * v128];
    bzero(v127, 24 * ((24 * (unint64_t)v80 - 24) / 0x18) + 24);
    v544 = &v127[24 * ((24 * (unint64_t)v80 - 24) / 0x18) + 24];
    v434 = (char *)v443 + 752;
    if (*((_BYTE *)v443 + 752))
    {
      for (j = 0; j != v80; ++j)
      {
        v130 = v538[6];
        v131 = (char **)(v130 + 24 * j);
        v133 = v131 + 1;
        v132 = v131[1];
        v134 = *v131;
        v78 = (v132 - *v131) >> 3;
        if (v458 <= v78)
        {
          if (v458 < v78)
            *v133 = &v134[8 * v458];
        }
        else
        {
          v135 = v130 + 24 * j;
          v137 = *(_QWORD *)(v135 + 16);
          a7 = (unint64_t *)(v135 + 16);
          v136 = v137;
          if (v458 - v78 <= (v137 - (uint64_t)v132) >> 3)
          {
            v149 = &v132[8 * (v458 - v78)];
            v150 = v125 - 8 * v78;
            do
            {
              *(_QWORD *)v132 = 0;
              v132 += 8;
              v150 -= 8;
            }
            while (v150);
            *v133 = v149;
          }
          else
          {
            v138 = v136 - (_QWORD)v134;
            v139 = (v136 - (uint64_t)v134) >> 2;
            if (v139 <= v458)
              v139 = v458;
            if (v138 >= 0x7FFFFFFFFFFFFFF8)
              v140 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v140 = v139;
            v141 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v140);
            v143 = &v141[8 * v78];
            v144 = v125 - 8 * v78;
            v145 = v143;
            do
            {
              *(_QWORD *)v145 = 0;
              v145 += 8;
              v144 -= 8;
            }
            while (v144);
            v146 = *v133;
            v147 = *v131;
            if (*v133 != *v131)
            {
              do
              {
                v148 = *((_QWORD *)v146 - 1);
                v146 -= 8;
                *((_QWORD *)v143 - 1) = v148;
                v143 -= 8;
              }
              while (v146 != v147);
              v146 = *v131;
            }
            *v131 = v143;
            *v133 = &v141[8 * v458];
            *a7 = (unint64_t)&v141[8 * v142];
            if (v146)
              operator delete(v146);
          }
        }
      }
    }
  }
  else
  {
    v434 = (char *)v443 + 752;
  }
  v528 = 0;
  v529 = &v528;
  v530 = 0x4812000000;
  v531 = __Block_byref_object_copy__563;
  v532 = __Block_byref_object_dispose__564;
  v533 = &unk_4C2897;
  v534 = 0;
  v536 = 0;
  v535 = 0;
  if ((_DWORD)v80)
  {
    v151 = (char *)operator new(24 * v80);
    bzero(v151, 24 * ((24 * v80 - 24) / 0x18) + 24);
    v534 = v151;
    v535 = &v151[24 * ((24 * v80 - 24) / 0x18) + 24];
    v536 = &v151[24 * v80];
  }
  v442 = dispatch_group_create();

  v519 = 0;
  v520 = &v519;
  v521 = 0x4812000000;
  v522 = __Block_byref_object_copy__566;
  v523 = __Block_byref_object_dispose__567;
  v524 = &unk_4C2897;
  v525 = 0;
  v527 = 0;
  v526 = 0;
  v152 = (int)v452;
  if (*v434 && (_DWORD)v452)
  {
    v153 = (char *)operator new(40 * (_QWORD)v452);
    v154 = v153;
    do
    {
      *(_OWORD *)v154 = 0uLL;
      *((_OWORD *)v154 + 1) = 0uLL;
      *((_DWORD *)v154 + 8) = 1065353216;
      v154 += 40;
    }
    while (v154 != &v153[40 * v452]);
    v525 = v153;
    v526 = &v153[40 * v452];
    v527 = v526;
  }
  v510 = 0;
  v511 = &v510;
  v512 = 0x4812000000;
  v513 = __Block_byref_object_copy__569;
  v514 = __Block_byref_object_dispose__570;
  v515 = &unk_4C2897;
  v516 = 0;
  v518 = 0;
  v517 = 0;
  if ((_DWORD)v452)
  {
    v155 = (char *)operator new(40 * (_QWORD)v452);
    v156 = v155;
    do
    {
      *(_OWORD *)v156 = 0uLL;
      *((_OWORD *)v156 + 1) = 0uLL;
      *((_DWORD *)v156 + 8) = 1065353216;
      v156 += 40;
    }
    while (v156 != &v155[40 * v452]);
    v516 = v155;
    v517 = &v155[40 * v452];
    v518 = v517;
  }
  v501 = 0;
  v502 = &v501;
  v503 = 0x4812000000;
  v504 = __Block_byref_object_copy__572;
  v505 = __Block_byref_object_dispose__573;
  v506 = &unk_4C2897;
  v507 = 0;
  v509 = 0;
  v508 = 0;
  if ((_DWORD)v452)
  {
    v157 = (char *)operator new(40 * (_QWORD)v452);
    v158 = v157;
    do
    {
      *(_OWORD *)v158 = 0uLL;
      *((_OWORD *)v158 + 1) = 0uLL;
      *((_DWORD *)v158 + 8) = 1065353216;
      v158 += 40;
    }
    while (v158 != &v157[40 * v452]);
    v507 = v157;
    v508 = &v157[40 * v452];
    v509 = v508;
  }
  v499 = 0;
  v498 = 0;
  v500 = 0;
  std::vector<unsigned long long>::reserve((void **)&v498, 0xAAAAAAAAAAAAAAABLL * (v583 - v582));
  v159 = (uint64_t)v583;
  v160 = (uint64_t)v582;
  v161 = v498;
  if (v583 != v582)
  {
    v162 = 0;
    v163 = v500;
    do
    {
      if (*(_QWORD *)(v160 + 24 * v162) != *(_QWORD *)(v160 + 24 * v162 + 8))
      {
        a7 = v499;
        if ((unint64_t)v499 >= v163)
        {
          v164 = v499 - v161;
          v165 = v164 + 1;
          if ((unint64_t)(v164 + 1) >> 61)
            abort();
          if ((uint64_t)(v163 - (_QWORD)v161) >> 2 > v165)
            v165 = (uint64_t)(v163 - (_QWORD)v161) >> 2;
          if (v163 - (unint64_t)v161 >= 0x7FFFFFFFFFFFFFF8)
            v166 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v166 = v165;
          if (v166)
            v166 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v166);
          else
            v167 = 0;
          v168 = (unint64_t *)(v166 + 8 * v164);
          *v168 = v162;
          v78 = (unint64_t)(v168 + 1);
          while (a7 != v161)
          {
            v169 = *--a7;
            *--v168 = v169;
          }
          v163 = v166 + 8 * v167;
          v498 = v168;
          v499 = (unint64_t *)v78;
          v500 = v163;
          if (v161)
            operator delete(v161);
          v161 = v168;
          v152 = (int)v452;
        }
        else
        {
          *v499 = v162;
          v78 = (unint64_t)++a7;
        }
        v499 = (unint64_t *)v78;
        v159 = (uint64_t)v583;
        v160 = (uint64_t)v582;
      }
      ++v162;
    }
    while (v162 < 0xAAAAAAAAAAAAAAABLL * ((v159 - v160) >> 3));
    v161 = v498;
  }
  if (v152)
  {
    v170 = 0;
    v439 = v499;
    a7 = v491;
    __lena = (char *)v499 - (char *)v161;
    v78 = v499 - v161;
    groupa = (dispatch_group_t)((unint64_t)((char *)v499 - (char *)v161) >> 3);
    v171 = groupa / v452;
    do
    {
      v172 = v170 + 1;
      v484[0] = _NSConcreteStackBlock;
      v484[1] = 3321888768;
      v484[2] = __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_575;
      v484[3] = &unk_725C98;
      if (v170 - (_DWORD)v452 == -1)
        v173 = (int)groupa;
      else
        v173 = (v170 + 1) * v171;
      v493 = v170 * v171;
      v494 = v173;
      v486 = 0;
      v487 = 0;
      v485 = 0;
      if (v439 != v161)
      {
        if ((__lena & 0x8000000000000000) != 0)
          abort();
        v174 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v78);
        v485 = v174;
        v486 = v174;
        v487 = &v174[8 * v175];
        memmove(v174, v161, __lena);
        v486 = &v174[8 * v78];
      }
      v495 = v458;
      v488 = a4;
      v484[5] = &v586;
      std::pair<ShaderBinaryInfo * {__strong},std::string>::pair[abi:nn180100](v489, (uint64_t)&v593);
      memset(v491, 0, sizeof(v491));
      std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__init_with_size[abi:nn180100]<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>*,std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>*>(v491, v596, (uint64_t *)v597, 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v597 - (_BYTE *)v596) >> 3));
      v484[6] = &v510;
      v496 = v170;
      v497 = a11;
      memset(v492, 0, sizeof(v492));
      std::vector<std::vector<ShaderProfilerUSCSampleInfo>>::__init_with_size[abi:nn180100]<std::vector<ShaderProfilerUSCSampleInfo>*,std::vector<ShaderProfilerUSCSampleInfo>*>(v492, (uint64_t)v582, (uint64_t)v583, 0xAAAAAAAAAAAAAAABLL * (v583 - v582));
      v484[7] = &v528;
      v484[4] = v443;
      v484[8] = &v519;
      v484[9] = &v537;
      v484[10] = &v501;
      dispatch_group_async(v442, queue, v484);
      *(_QWORD *)v601 = v492;
      std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
      *(_QWORD *)v601 = v491;
      std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
      if (v490 < 0)
        operator delete(v489[1]);

      if (v485)
      {
        v486 = (char *)v485;
        operator delete(v485);
      }
      ++v170;
    }
    while (v172 != (_DWORD)v452);
  }
  dispatch_group_wait(v442, 0xFFFFFFFFFFFFFFFFLL);
  v176 = v529[6];
  for (k = v529[7]; v176 != k; v176 += 24)
  {
    v178 = *(_QWORD *)v176;
    v179 = *(_QWORD *)(v176 + 8);
    while (v178 != v179)
    {
      v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)v178, "uscSamples"));
      v181 = v180 == 0;

      if (v181)
      {
        v183 = (void *)objc_opt_new(NSMutableData, v182);
        objc_msgSend(*(id *)v178, "setUscSamples:", v183);

      }
      v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)v178, "uscSamples"));
      objc_msgSend(v184, "appendBytes:length:", *(_QWORD *)(v178 + 8), *(_QWORD *)(v178 + 16) - *(_QWORD *)(v178 + 8));

      v178 += 32;
    }
  }
  if (*v434)
  {
    if (v458)
    {
      for (m = 0; m != v458; ++m)
      {
        v186 = &v435[2 * m];
        v186[1] = m;
        if ((_DWORD)v452)
        {
          v187 = 0;
          v188 = *v186;
          do
          {
            v188 += *(_DWORD *)(*(_QWORD *)(v538[6] + v187) + 8 * m);
            *v186 = v188;
            v187 += 24;
          }
          while (24 * (_QWORD)v452 != v187);
        }
      }
    }
    v481 = 0u;
    v482 = 0u;
    v483 = 1.0;
    v189 = v520[6];
    v440 = v520[7];
    if (v189 != v440)
    {
      while (1)
      {
        v444 = v189;
        v190 = *(uint64_t **)(v189 + 16);
        if (v190)
          break;
LABEL_326:
        v189 = v444 + 40;
        if (v444 + 40 == v440)
          goto LABEL_327;
      }
      while (1)
      {
        v191 = std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](&v481, (uint64_t)(v190 + 2));
        if (!v191)
          break;
        v192 = (uint64_t *)v190[7];
        if (v192)
        {
          v176 = (unint64_t)v191;
          v193 = (uint64_t *)(v191 + 40);
          v194 = v191 + 56;
          while (1)
          {
            v195 = *((unsigned int *)v192 + 4);
            v196 = (int32x2_t *)std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v193, *((_DWORD *)v192 + 4));
            if (!v196)
              break;
            v196[3] = vadd_s32(v196[3], (int32x2_t)v192[3]);
            v196[5].i32[1] += *((_DWORD *)v192 + 11);
LABEL_235:
            v192 = (uint64_t *)*v192;
            if (!v192)
              goto LABEL_325;
          }
          a7 = *(unint64_t **)(v176 + 48);
          if (a7)
          {
            v197 = (uint8x8_t)vcnt_s8((int8x8_t)a7);
            v197.i16[0] = vaddlv_u8(v197);
            if (v197.u32[0] > 1uLL)
            {
              v78 = v195;
              if ((unint64_t)a7 <= v195)
                v78 = v195 % (unint64_t)a7;
            }
            else
            {
              v78 = ((_DWORD)a7 - 1) & v195;
            }
            v198 = *(uint64_t ***)(*v193 + 8 * v78);
            if (v198)
            {
              for (n = *v198; n; n = (uint64_t *)*n)
              {
                v200 = n[1];
                if (v200 == v195)
                {
                  if (*((_DWORD *)n + 4) == (_DWORD)v195)
                    goto LABEL_235;
                }
                else
                {
                  if (v197.u32[0] > 1uLL)
                  {
                    if (v200 >= (unint64_t)a7)
                      v200 %= (unint64_t)a7;
                  }
                  else
                  {
                    v200 &= (unint64_t)a7 - 1;
                  }
                  if (v200 != v78)
                    break;
                }
              }
            }
          }
          v201 = operator new(0x30uLL);
          *v201 = 0;
          v201[1] = v195;
          v202 = *((_OWORD *)v192 + 2);
          *((_OWORD *)v201 + 1) = *((_OWORD *)v192 + 1);
          *((_OWORD *)v201 + 2) = v202;
          v203 = (float)(unint64_t)(*(_QWORD *)(v176 + 64) + 1);
          v204 = *(float *)(v176 + 72);
          if (!a7 || (float)(v204 * (float)(unint64_t)a7) < v203)
          {
            v205 = ((unint64_t)a7 & ((unint64_t)a7 - 1)) != 0;
            if ((unint64_t)a7 < 3)
              v205 = 1;
            v206 = v205 | (2 * (_QWORD)a7);
            v207 = vcvtps_u32_f32(v203 / v204);
            if (v206 <= v207)
              v208 = v207;
            else
              v208 = v206;
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v193, v208);
            a7 = *(unint64_t **)(v176 + 48);
            if (((unint64_t)a7 & ((unint64_t)a7 - 1)) != 0)
            {
              if ((unint64_t)a7 <= v195)
                v78 = v195 % (unint64_t)a7;
              else
                v78 = v195;
            }
            else
            {
              v78 = ((_DWORD)a7 - 1) & v195;
            }
          }
          v209 = *v193;
          v210 = *(_QWORD **)(*v193 + 8 * v78);
          if (v210)
          {
            *v201 = *v210;
          }
          else
          {
            *v201 = *v194;
            *v194 = v201;
            *(_QWORD *)(v209 + 8 * v78) = v194;
            if (!*v201)
            {
LABEL_234:
              ++*(_QWORD *)(v176 + 64);
              goto LABEL_235;
            }
            v211 = *(_QWORD *)(*v201 + 8);
            if (((unint64_t)a7 & ((unint64_t)a7 - 1)) != 0)
            {
              if (v211 >= (unint64_t)a7)
                v211 %= (unint64_t)a7;
            }
            else
            {
              v211 &= (unint64_t)a7 - 1;
            }
            v210 = (_QWORD *)(*v193 + 8 * v211);
          }
          *v210 = v201;
          goto LABEL_234;
        }
LABEL_325:
        v190 = (uint64_t *)*v190;
        if (!v190)
          goto LABEL_326;
      }
      v212 = *((char *)v190 + 39);
      if (v212 >= 0)
        v213 = v190 + 2;
      else
        v213 = (uint64_t *)v190[2];
      if (v212 >= 0)
        v214 = *((unsigned __int8 *)v190 + 39);
      else
        v214 = v190[3];
      v215 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v213, v214);
      v216 = (unint64_t *)v215;
      v217 = *((_QWORD *)&v481 + 1);
      if (*((_QWORD *)&v481 + 1))
      {
        v218 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v481 + 8));
        v218.i16[0] = vaddlv_u8(v218);
        v176 = v218.u32[0];
        if (v218.u32[0] > 1uLL)
        {
          a7 = (unint64_t *)v215;
          if (v215 >= *((_QWORD *)&v481 + 1))
            a7 = (unint64_t *)(v215 % *((_QWORD *)&v481 + 1));
        }
        else
        {
          a7 = (unint64_t *)((*((_QWORD *)&v481 + 1) - 1) & v215);
        }
        v219 = *(unsigned __int8 ***)(v481 + 8 * (_QWORD)a7);
        if (v219)
        {
          for (ii = *v219; ii; ii = *(unsigned __int8 **)ii)
          {
            v221 = *((_QWORD *)ii + 1);
            if ((unint64_t *)v221 == v216)
            {
              if (std::equal_to<std::string>::operator()[abi:nn180100](ii + 16, (unsigned __int8 *)v190 + 16))
                goto LABEL_325;
            }
            else
            {
              if (v176 > 1)
              {
                if (v221 >= v217)
                  v221 %= v217;
              }
              else
              {
                v221 &= v217 - 1;
              }
              if ((unint64_t *)v221 != a7)
                break;
            }
          }
        }
      }
      v222 = (char *)operator new(0x50uLL);
      *(_QWORD *)v601 = v222;
      *(_QWORD *)&v601[8] = &v482;
      v601[16] = 0;
      *(_QWORD *)v222 = 0;
      *((_QWORD *)v222 + 1) = v216;
      v223 = (std::string *)(v222 + 16);
      if (*((char *)v190 + 39) < 0)
      {
        std::string::__init_copy_ctor_external(v223, (const std::string::value_type *)v190[2], v190[3]);
      }
      else
      {
        v224 = *((_OWORD *)v190 + 1);
        *((_QWORD *)v222 + 4) = v190[4];
        *(_OWORD *)&v223->__r_.__value_.__l.__data_ = v224;
      }
      v453 = (unint64_t)v216;
      v459 = a7;
      __lenb = v217;
      *(_OWORD *)(v222 + 40) = 0u;
      v225 = (uint64_t *)(v222 + 40);
      *(_OWORD *)(v222 + 56) = 0u;
      *((_DWORD *)v222 + 18) = *((_DWORD *)v190 + 18);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)(v222 + 40), v190[6]);
      a7 = (unint64_t *)v190[7];
      if (a7)
      {
        v226 = v222 + 56;
        v227 = *((_QWORD *)v222 + 6);
        do
        {
          v78 = (unint64_t)(a7 + 2);
          v228 = *((unsigned int *)a7 + 4);
          if (v227)
          {
            v229 = (uint8x8_t)vcnt_s8((int8x8_t)v227);
            v229.i16[0] = vaddlv_u8(v229);
            if (v229.u32[0] > 1uLL)
            {
              v176 = *((unsigned int *)a7 + 4);
              if (v227 <= v228)
                v176 = v228 % v227;
            }
            else
            {
              v176 = ((_DWORD)v227 - 1) & v228;
            }
            v230 = *(uint64_t ***)(*v225 + 8 * v176);
            if (v230)
            {
              for (jj = *v230; jj; jj = (uint64_t *)*jj)
              {
                v232 = jj[1];
                if (v232 == v228)
                {
                  if (*((_DWORD *)jj + 4) == (_DWORD)v228)
                    goto LABEL_302;
                }
                else
                {
                  if (v229.u32[0] > 1uLL)
                  {
                    if (v232 >= v227)
                      v232 %= v227;
                  }
                  else
                  {
                    v232 &= v227 - 1;
                  }
                  if (v232 != v176)
                    break;
                }
              }
            }
          }
          v233 = operator new(0x30uLL);
          *v233 = 0;
          v233[1] = v228;
          v234 = *((_OWORD *)a7 + 2);
          *((_OWORD *)v233 + 1) = *(_OWORD *)v78;
          *((_OWORD *)v233 + 2) = v234;
          v235 = (float)(unint64_t)(*((_QWORD *)v222 + 8) + 1);
          v236 = *((float *)v222 + 18);
          if (!v227 || (float)(v236 * (float)v227) < v235)
          {
            v237 = (v227 & (v227 - 1)) != 0;
            if (v227 < 3)
              v237 = 1;
            v238 = v237 | (2 * v227);
            v239 = vcvtps_u32_f32(v235 / v236);
            if (v238 <= v239)
              v240 = v239;
            else
              v240 = v238;
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)(v222 + 40), v240);
            v227 = *((_QWORD *)v222 + 6);
            if ((v227 & (v227 - 1)) != 0)
            {
              if (v227 <= v228)
                v176 = v228 % v227;
              else
                v176 = v228;
            }
            else
            {
              v176 = ((_DWORD)v227 - 1) & v228;
            }
          }
          v241 = *v225;
          v242 = *(_QWORD **)(*v225 + 8 * v176);
          if (v242)
          {
            *v233 = *v242;
          }
          else
          {
            *v233 = *v226;
            *v226 = v233;
            *(_QWORD *)(v241 + 8 * v176) = v226;
            if (!*v233)
              goto LABEL_301;
            v243 = *(_QWORD *)(*v233 + 8);
            if ((v227 & (v227 - 1)) != 0)
            {
              if (v243 >= v227)
                v243 %= v227;
            }
            else
            {
              v243 &= v227 - 1;
            }
            v242 = (_QWORD *)(*v225 + 8 * v243);
          }
          *v242 = v233;
LABEL_301:
          ++*((_QWORD *)v222 + 8);
LABEL_302:
          a7 = (unint64_t *)*a7;
        }
        while (a7);
      }
      v601[16] = 1;
      v244 = (float)(unint64_t)(*((_QWORD *)&v482 + 1) + 1);
      v246 = (unint64_t)v459;
      v245 = __lenb;
      if (!__lenb || (float)(v483 * (float)__lenb) < v244)
      {
        v247 = (__lenb & (__lenb - 1)) != 0;
        if (__lenb < 3)
          v247 = 1;
        v248 = v247 | (2 * __lenb);
        v249 = vcvtps_u32_f32(v244 / v483);
        if (v248 <= v249)
          v250 = v249;
        else
          v250 = v248;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v481, v250);
        v245 = *((_QWORD *)&v481 + 1);
        if ((*((_QWORD *)&v481 + 1) & (*((_QWORD *)&v481 + 1) - 1)) != 0)
        {
          if (v453 >= *((_QWORD *)&v481 + 1))
            v246 = v453 % *((_QWORD *)&v481 + 1);
          else
            v246 = v453;
        }
        else
        {
          v246 = (*((_QWORD *)&v481 + 1) - 1) & v453;
        }
      }
      v251 = v481;
      v252 = *(_QWORD **)(v481 + 8 * v246);
      if (v252)
      {
        *(_QWORD *)v222 = *v252;
      }
      else
      {
        *(_QWORD *)v222 = v482;
        *(_QWORD *)&v482 = v222;
        *(_QWORD *)(v251 + 8 * v246) = &v482;
        if (!*(_QWORD *)v222)
        {
LABEL_324:
          *(_QWORD *)v601 = 0;
          ++*((_QWORD *)&v482 + 1);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,void *>>>>::reset[abi:nn180100]((uint64_t)v601);
          goto LABEL_325;
        }
        v253 = *(_QWORD *)(*(_QWORD *)v222 + 8);
        if ((v245 & (v245 - 1)) != 0)
        {
          if (v253 >= v245)
            v253 %= v245;
        }
        else
        {
          v253 &= v245 - 1;
        }
        v252 = (_QWORD *)(v481 + 8 * v253);
      }
      *v252 = v222;
      goto LABEL_324;
    }
LABEL_327:
    v478 = 0u;
    v479 = 0u;
    v480 = 1.0;
    p_lbfsize = (FILE *)v502[6];
    v454 = (FILE *)v502[7];
    if (p_lbfsize != v454)
    {
      v255 = 0.0;
      while (1)
      {
        v460 = p_lbfsize;
        v256 = *(uint64_t **)&p_lbfsize->_flags;
        if (v256)
          break;
LABEL_413:
        p_lbfsize = (FILE *)&v460->_lbfsize;
        if (&v460->_lbfsize == (int *)v454)
          goto LABEL_416;
      }
      while (1)
      {
        v257 = *((char *)v256 + 39);
        if (v257 >= 0)
          v258 = (unint64_t)(v256 + 2);
        else
          v258 = v256[2];
        if (v257 >= 0)
          v259 = *((unsigned __int8 *)v256 + 39);
        else
          v259 = v256[3];
        v260 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v258, v259);
        v261 = *((_QWORD *)&v478 + 1);
        if (!*((_QWORD *)&v478 + 1))
        {
          v266 = v256 + 5;
          v267 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v258, v259);
          goto LABEL_371;
        }
        v262 = v260;
        v263 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v478 + 8));
        v263.i16[0] = vaddlv_u8(v263);
        v264 = v263.u32[0];
        if (v263.u32[0] > 1uLL)
        {
          v265 = v260;
          if (v260 >= *((_QWORD *)&v478 + 1))
            v265 = v260 % *((_QWORD *)&v478 + 1);
        }
        else
        {
          v265 = (*((_QWORD *)&v478 + 1) - 1) & v260;
        }
        v268 = *(void ***)(v478 + 8 * v265);
        if (v268)
        {
          v269 = (char *)*v268;
          if (*v268)
          {
            while (1)
            {
              v270 = *((_QWORD *)v269 + 1);
              if (v270 == v262)
              {
                if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v269 + 16, (unsigned __int8 *)v256 + 16))
                {
                  v302 = 0;
                  goto LABEL_397;
                }
              }
              else
              {
                if (v264 > 1)
                {
                  if (v270 >= v261)
                    v270 %= v261;
                }
                else
                {
                  v270 &= v261 - 1;
                }
                if (v270 != v265)
                {
LABEL_353:
                  v266 = v256 + 5;
                  v267 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v258, v259);
                  if (!v261)
                    goto LABEL_371;
                  goto LABEL_356;
                }
              }
              v269 = *(char **)v269;
              if (!v269)
                goto LABEL_353;
            }
          }
        }
        v266 = v256 + 5;
        v267 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v258, v259);
LABEL_356:
        v271 = (uint8x8_t)vcnt_s8((int8x8_t)v261);
        v271.i16[0] = vaddlv_u8(v271);
        v272 = v271.u32[0];
        if (v271.u32[0] > 1uLL)
        {
          v258 = v267;
          if (v267 >= v261)
            v258 = v267 % v261;
        }
        else
        {
          v258 = (v261 - 1) & v267;
        }
        v273 = *(void ***)(v478 + 8 * v258);
        if (v273)
        {
          v269 = (char *)*v273;
          if (*v273)
          {
            do
            {
              v274 = *((_QWORD *)v269 + 1);
              if (v274 == v267)
              {
                if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v269 + 16, (unsigned __int8 *)v256 + 16))
                {
                  v302 = 1;
                  goto LABEL_397;
                }
              }
              else
              {
                if (v272 > 1)
                {
                  if (v274 >= v261)
                    v274 %= v261;
                }
                else
                {
                  v274 &= v261 - 1;
                }
                if (v274 != v258)
                  break;
              }
              v269 = *(char **)v269;
            }
            while (v269);
          }
        }
LABEL_371:
        v269 = (char *)operator new(0x58uLL);
        *(_QWORD *)v601 = v269;
        *(_QWORD *)&v601[8] = &v479;
        v601[16] = 0;
        *(_QWORD *)v269 = 0;
        *((_QWORD *)v269 + 1) = v267;
        v275 = (std::string *)(v269 + 16);
        if (*((char *)v256 + 39) < 0)
        {
          std::string::__init_copy_ctor_external(v275, (const std::string::value_type *)v256[2], v256[3]);
        }
        else
        {
          v276 = *((_OWORD *)v256 + 1);
          *((_QWORD *)v269 + 4) = v256[4];
          *(_OWORD *)&v275->__r_.__value_.__l.__data_ = v276;
        }
        *(_OWORD *)(v269 + 40) = *v266;
        *((_QWORD *)v269 + 8) = 0;
        *((_QWORD *)v269 + 9) = 0;
        *((_QWORD *)v269 + 7) = 0;
        *(_OWORD *)(v269 + 56) = *(_OWORD *)(v256 + 7);
        *((_QWORD *)v269 + 9) = v256[9];
        v256[7] = 0;
        v256[8] = 0;
        v256[9] = 0;
        *((_QWORD *)v269 + 10) = v256[10];
        v601[16] = 1;
        v277 = (float)(unint64_t)(*((_QWORD *)&v479 + 1) + 1);
        if (!v261 || (float)(v480 * (float)v261) < v277)
        {
          v278 = v261 < 3 || (v261 & (v261 - 1)) != 0;
          v279 = v278 | (2 * v261);
          v280 = vcvtps_u32_f32(v277 / v480);
          if (v279 <= v280)
            v281 = v280;
          else
            v281 = v279;
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v478, v281);
          v261 = *((_QWORD *)&v478 + 1);
          if ((*((_QWORD *)&v478 + 1) & (*((_QWORD *)&v478 + 1) - 1)) != 0)
          {
            if (v267 >= *((_QWORD *)&v478 + 1))
              v258 = v267 % *((_QWORD *)&v478 + 1);
            else
              v258 = v267;
          }
          else
          {
            v258 = (*((_QWORD *)&v478 + 1) - 1) & v267;
          }
        }
        v282 = v478;
        v283 = *(_QWORD **)(v478 + 8 * v258);
        if (v283)
        {
          *(_QWORD *)v269 = *v283;
        }
        else
        {
          *(_QWORD *)v269 = v479;
          *(_QWORD *)&v479 = v269;
          *(_QWORD *)(v282 + 8 * v258) = &v479;
          if (!*(_QWORD *)v269)
            goto LABEL_396;
          v284 = *(_QWORD *)(*(_QWORD *)v269 + 8);
          if ((v261 & (v261 - 1)) != 0)
          {
            if (v284 >= v261)
              v284 %= v261;
          }
          else
          {
            v284 &= v261 - 1;
          }
          v283 = (_QWORD *)(v478 + 8 * v284);
        }
        *v283 = v269;
LABEL_396:
        *(_QWORD *)v601 = 0;
        ++*((_QWORD *)&v479 + 1);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,BinaryInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,BinaryInfo>,void *>>>>::reset[abi:nn180100]((uint64_t)v601);
        v302 = 1;
LABEL_397:
        v285 = v256[7];
        v286 = v256[8];
        v287 = 0x6DB6DB6DB6DB6DB7 * ((v286 - v285) >> 3);
        v288 = *((_QWORD *)v269 + 7);
        if (v287 == 0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)v269 + 8) - v288) >> 3) && v286 != v285)
        {
          v290 = 0;
          if (v287 <= 1)
            v287 = 1;
          do
          {
            v291 = (uint64_t *)(v288 + 56 * v290);
            *((_DWORD *)v291 + 8) += *(_DWORD *)(v285 + 56 * v290 + 32);
            v292 = *v291;
            v293 = v291[1] - *v291;
            if (v293)
            {
              v295 = *(float64x2_t *)(v291 + 5);
              v294 = (float64x2_t *)(v291 + 5);
              v296 = v295;
              v297 = v293 / 24;
              v298 = *(float64x2_t *)(v269 + 40);
              if ((unint64_t)(v293 / 24) <= 1)
                v297 = 1;
              v299 = (float64x2_t *)(*(_QWORD *)(v285 + 56 * v290) + 8);
              v300 = (float64x2_t *)(v292 + 8);
              do
              {
                if ((v302 & 1) == 0)
                {
                  LODWORD(v300[-1].f64[1]) += LODWORD(v299[-1].f64[1]);
                  *v300 = vaddq_f64(*v299, *v300);
                }
                v301 = *v299;
                v299 = (float64x2_t *)((char *)v299 + 24);
                v296 = vaddq_f64(v301, v296);
                v298 = vaddq_f64(v301, v298);
                v255 = v255 + v301.f64[1];
                v300 = (float64x2_t *)((char *)v300 + 24);
                --v297;
              }
              while (v297);
              *v294 = v296;
              *(float64x2_t *)(v269 + 40) = v298;
            }
            ++v290;
          }
          while (v290 != v287);
        }
        v256 = (uint64_t *)*v256;
        if (!v256)
          goto LABEL_413;
      }
    }
    v255 = 0.0;
LABEL_416:
    v303 = fopen("/tmp/com.apple.gputools.profiling/shaderProfilerResults/bblCostInfo.txt", "wt");
    std::string::basic_string[abi:nn180100]<0>(v601, "Binary 0x%s : Num Basic Blocks = %u : Total Cost = %.4f %% Weight = %.4f\n\n");
    std::string::basic_string[abi:nn180100]<0>(v469, "Index   PC  NumInst  Mean Occurences  Total Original Cost Total Cost  Block Weight %%\n");
    std::string::basic_string[abi:nn180100]<0>(v599, "%d      0x%x %4d %10u  %15.2f %15.2f %15.4f\n\n");
    std::string::basic_string[abi:nn180100]<0>(&v475, "%d      0x%x %15u %15.4f %15.4f %15.5f\n");
    p = (unsigned __int8 *)v479;
    if ((_QWORD)v479)
    {
      do
      {
        v305 = p + 16;
        v306 = (GPUToolsPlatformLLVMShaderProfilerHelperImpl **)*((_QWORD *)p + 10);
        TargetClauseAnalysis = (uint64_t *)GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(*v306);
        if (v601[23] >= 0)
          v308 = v601;
        else
          v308 = *(const char **)v601;
        if ((char)p[39] < 0)
          v305 = (_QWORD *)*v305;
        v309 = *TargetClauseAnalysis;
        fprintf(v303, v308, v305, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)p + 8) - *((_QWORD *)p + 7)) >> 3), *((_QWORD *)p + 6), *((double *)p + 6) * 100.0 / v255);
        v310 = (unsigned int **)*((_QWORD *)p + 7);
        v455 = (FILE *)p;
        v461 = (unsigned int **)*((_QWORD *)p + 8);
        if (v310 != v461)
        {
          v311 = 0;
          v312 = (_QWORD *)(v309 + 160);
          do
          {
            v313 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v312, *((_DWORD *)v310 + 6));
            if (v313)
            {
              v314 = v313;
              if ((SBYTE7(v470) & 0x80u) == 0)
                v315 = v469;
              else
                v315 = (void **)v469[0];
              fputs((const char *)v315, v303);
              if (v600 >= 0)
                v316 = (const char *)v599;
              else
                v316 = (const char *)v599[0];
              __lenc = v311;
              fprintf(v303, v316, v311, v314[3], 0xAAAAAAAAAAAAAAABLL * (((char *)v310[1] - (char *)*v310) >> 3), *((unsigned int *)v310 + 8), v310[5], v310[6], *((double *)v310 + 6) * 100.0 / v255);
              v317 = *v310;
              v318 = v310[1];
              if (*v310 != v318)
              {
                v319 = 0;
                do
                {
                  v320 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v312, *((_DWORD *)v310 + 6) + v319);
                  if (v320)
                  {
                    v321 = v320[3];
                    GPUToolsPlatformLLVMShaderProfilerHelper::ShaderInstructionInfoFromBinary((void ***)&v472, (uint64_t)*v306, v321, v321 + *((unsigned int *)v320 + 8));
                    if (v472 != v473)
                    {
                      v322 = &v472->__r_.__value_.__s.__data_[8];
                      if (v472[1].__r_.__value_.__s.__data_[7] < 0)
                        v322 = *(const char **)v322;
                      fprintf(v303, "%s\n", v322);
                      if (SHIBYTE(v477) >= 0)
                        fprintf(v303, (const char *)&v475, (*((_DWORD *)v310 + 6) + v319), v321, *v317, *((_QWORD *)v317 + 1), *((_QWORD *)v317 + 2), *((double *)v317 + 2) * 100.0 / v255);
                      else
                        fprintf(v303, (const char *)v475, (*((_DWORD *)v310 + 6) + v319), v321, *v317, *((_QWORD *)v317 + 1), *((_QWORD *)v317 + 2), *((double *)v317 + 2) * 100.0 / v255);
                      ++v319;
                    }
                    v468.__r_.__value_.__r.__words[0] = (std::string::size_type)&v472;
                    std::vector<InstructionInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&v468);
                  }
                  v317 += 6;
                }
                while (v317 != v318);
              }
              v311 = (__lenc + 1);
              fputc(10, v303);
            }
            v310 += 7;
          }
          while (v310 != v461);
        }
        fputc(10, v303);
        p = v455->_p;
      }
      while (v455->_p);
    }
    fclose(v303);
    if (SHIBYTE(v477) < 0)
      operator delete(v475);
    if (SHIBYTE(v600) < 0)
      operator delete(v599[0]);
    if (SBYTE7(v470) < 0)
      operator delete(v469[0]);
    if ((v601[23] & 0x80000000) != 0)
      operator delete(*(void **)v601);
    *(_OWORD *)v469 = 0u;
    v470 = 0u;
    v471 = 1065353216;
    v323 = v511[6];
    v324 = v511[7];
    while (v323 != v324)
    {
      for (kk = *(_QWORD **)(v323 + 16); kk; kk = (_QWORD *)*kk)
      {
        if (!std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](v469, (uint64_t)(kk + 2)))std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>((uint64_t)v469, (uint64_t)(kk + 2), (uint64_t)(kk + 2), kk + 5);
      }
      v323 += 40;
    }
    v326 = *((_QWORD *)&v482 + 1);
    v476 = 0;
    v477 = 0;
    v475 = 0;
    if (*((_QWORD *)&v482 + 1))
    {
      if (*((_QWORD *)&v482 + 1) >= 0xAAAAAAAAAAAAAABuLL)
        abort();
      v327 = (char *)operator new(24 * *((_QWORD *)&v482 + 1));
      v475 = v327;
      v477 = &v327[24 * v326];
      bzero(v327, 24 * ((24 * v326 - 24) / 0x18) + 24);
      v476 = &v327[24 * ((24 * v326 - 24) / 0x18) + 24];
      v462 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v326);
      bzero(v462, 4 * v326);
      v328 = *((_QWORD *)&v482 + 1);
      if (*((_QWORD *)&v482 + 1))
      {
        if (*((_QWORD *)&v482 + 1) >> 62)
          abort();
        v326 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(*((unint64_t *)&v482 + 1));
        bzero((void *)v326, 4 * v328);
      }
      else
      {
        v326 = 0;
      }
    }
    else
    {
      v462 = 0;
    }
    __lend = v326;
    v329 = (void *)v482;
    if ((_QWORD)v482)
    {
      v330 = 0;
      v331 = 0;
      do
      {
        v332 = v330;
        v333 = (char *)v475;
        v334 = (uint64_t *)((char *)v475 + 24 * v330);
        v335 = v334 + 2;
        v336 = *((_QWORD *)v329 + 8);
        v337 = *v334;
        v456 = (FILE *)v329;
        if (0x6DB6DB6DB6DB6DB7 * ((v334[2] - *v334) >> 2) < v336)
        {
          if (v336 > 0x924924924924924)
            abort();
          v338 = (char *)v475 + 24 * v330;
          v341 = *((_QWORD *)v338 + 1);
          v339 = (void **)(v338 + 8);
          v340 = v341;
          v342 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<ClauseData>>(v336);
          v344 = (char *)*v339;
          v345 = (char *)*v334;
          v346 = &v342[28 * ((v341 - v337) / 28)];
          if (*v339 != (void *)*v334)
          {
            do
            {
              v347 = *(_OWORD *)(v344 - 28);
              *((_OWORD *)v346 - 1) = *((_OWORD *)v344 - 1);
              *(_OWORD *)(v346 - 28) = v347;
              v346 -= 28;
              v344 -= 28;
            }
            while (v344 != v345);
            v344 = (char *)*v334;
          }
          *v334 = (uint64_t)v346;
          *v339 = &v342[28 * ((v340 - v337) / 28)];
          *v335 = &v342[28 * v343];
          v329 = v456;
          if (v344)
            operator delete(v344);
        }
        v348 = (uint64_t *)*((_QWORD *)v329 + 7);
        v349 = &v333[24 * v332];
        v352 = (_OWORD *)*((_QWORD *)v349 + 1);
        v350 = (void **)(v349 + 8);
        for (mm = v352; v348; v348 = (uint64_t *)*v348)
        {
          v353 = (__int128 *)((char *)v348 + 20);
          if ((unint64_t)mm >= *v335)
          {
            v355 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)mm - *v334) >> 2);
            v356 = v355 + 1;
            if ((unint64_t)(v355 + 1) > 0x924924924924924)
              abort();
            if (0xDB6DB6DB6DB6DB6ELL * ((*v335 - *v334) >> 2) > v356)
              v356 = 0xDB6DB6DB6DB6DB6ELL * ((*v335 - *v334) >> 2);
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((*v335 - *v334) >> 2)) >= 0x492492492492492)
              v357 = 0x924924924924924;
            else
              v357 = v356;
            if (v357)
              v357 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ClauseData>>(v357);
            else
              v358 = 0;
            v359 = (_OWORD *)(v357 + 28 * v355);
            v360 = *v353;
            *(_OWORD *)((char *)v359 + 12) = *((_OWORD *)v348 + 2);
            *v359 = v360;
            v361 = (char *)*v350;
            v362 = (char *)*v334;
            v363 = v359;
            if (*v350 != (void *)*v334)
            {
              do
              {
                v364 = *(_OWORD *)(v361 - 28);
                *(v363 - 1) = *((_OWORD *)v361 - 1);
                *(_OWORD *)((char *)v363 - 28) = v364;
                v363 = (_OWORD *)((char *)v363 - 28);
                v361 -= 28;
              }
              while (v361 != v362);
              v361 = (char *)*v334;
            }
            *v334 = (uint64_t)v363;
            mm = (_OWORD *)((char *)v359 + 28);
            *v350 = (char *)v359 + 28;
            *v335 = v357 + 28 * v358;
            if (v361)
              operator delete(v361);
          }
          else
          {
            v354 = *v353;
            *(_OWORD *)((char *)mm + 12) = *((_OWORD *)v348 + 2);
            *mm = v354;
            mm = (_OWORD *)((char *)mm + 28);
          }
          *v350 = mm;
          v331 += *((_DWORD *)v348 + 7);
          v462[v332] += *((_DWORD *)v348 + 6);
          *(_DWORD *)(__lend + 4 * v332) += *((_DWORD *)v348 + 7);
        }
        v365 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (((uint64_t)mm - *v334) >> 2));
        if (mm == (_OWORD *)*v334)
          v366 = 0;
        else
          v366 = v365;
        std::__introsort<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *,false>(*v334, (unsigned int *)mm, v366, 1);
        v330 = v332 + 1;
        v329 = v456->_p;
      }
      while (v456->_p);
    }
    else
    {
      v331 = 0;
    }
    std::string::basic_string[abi:nn180100]<0>(v601, "%u%u");
    std::string::basic_string[abi:nn180100]<0>(&v602, "");
    std::string::basic_string[abi:nn180100]<0>(&v605, "%s%s%u%u%.2f");
    std::string::basic_string[abi:nn180100]<0>(v608, "");
    v472 = 0;
    v473 = 0;
    p_data = 0;
    v472 = (std::string *)operator new(0x60uLL);
    v473 = v472;
    p_data = (void **)&v472[4].__r_.__value_.__l.__data_;
    v367 = 0;
    v473 = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((__int128 *)v601, &v609, v472);
    do
    {
      if (SHIBYTE(v608[v367 + 2]) < 0)
        operator delete((void *)v608[v367]);
      v367 -= 3;
    }
    while (v367 != -12);
    v368 = (void *)objc_claimAutoreleasedReturnValue(-[DYPMTLShaderProfilerHelper _costHeaders](v443, "_costHeaders"));
    if (v368)
    {
      v369 = 0;
      for (nn = 0; nn != 3; ++nn)
      {
        v371 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v368, "objectAtIndexedSubscript:", nn)));
        v372 = (const std::string::value_type *)objc_msgSend(v371, "UTF8String");
        std::string::assign(&v472[v369], v372);

        ++v369;
      }
    }
    v373 = fopen("/tmp/com.apple.gputools.profiling/shaderProfilerResults/segLikeCost.txt", "wt");
    v374 = fopen("/tmp/com.apple.gputools.profiling/shaderProfilerResults/segLikeCostOnly.txt", "wt");
    v375 = (const char *)v472;
    if (SHIBYTE(v472->__r_.__value_.__r.__words[2]) < 0)
      v375 = (const char *)v472->__r_.__value_.__r.__words[0];
    v376 = (int *)v574[6];
    v377 = (int *)v574[7];
    if (v376 == v377)
    {
      v378 = 0;
    }
    else
    {
      LODWORD(v378) = 0;
      do
      {
        v379 = *v376++;
        v378 = (v379 + v378);
      }
      while (v376 != v377);
    }
    v380 = (int *)v565[6];
    v381 = (int *)v565[7];
    if (v380 == v381)
    {
      v382 = 0;
    }
    else
    {
      LODWORD(v382) = 0;
      do
      {
        v383 = *v380++;
        v382 = (v383 + v382);
      }
      while (v380 != v381);
    }
    v445 = v368;
    fprintf(v373, v375, v378, v382);
    v384 = (const char *)&v472[1];
    if (SHIBYTE(v472[1].__r_.__value_.__r.__words[2]) < 0)
      v384 = *(const char **)v384;
    fputs(v384, v374);
    v385 = v482;
    v457 = v374;
    if ((_QWORD)v482)
    {
      v386 = 0;
      v387 = (double)v331;
      do
      {
        v388 = (const char *)&v472[2];
        if (SHIBYTE(v472[2].__r_.__value_.__r.__words[2]) < 0)
          v388 = *(const char **)v388;
        v389 = (uint64_t *)(v385 + 16);
        v390 = v385 + 16;
        if (*(char *)(v385 + 39) < 0)
          v390 = *v389;
        v391 = v386;
        v447 = v386;
        v432 = *(unsigned int *)(__lend + 4 * v386);
        fprintf(v373, v388, off_725CC8[*(unsigned int *)(*((_QWORD *)v475 + 3 * v386) + 20)], v390, v462[v386], v432, (double)v432 * 100.0 / v387);
        v392 = (const char *)&v472[2];
        if (SHIBYTE(v472[2].__r_.__value_.__r.__words[2]) < 0)
          v392 = *(const char **)v392;
        v393 = v385 + 16;
        if (*(char *)(v385 + 39) < 0)
          v393 = *v389;
        fprintf(v374, v392, off_725CC8[*(unsigned int *)(*((_QWORD *)v475 + 3 * v391) + 20)], v393, v462[v391], *(unsigned int *)(__lend + 4 * v391), (double)*(unsigned int *)(__lend + 4 * v391) * 100.0 / v387);
        v394 = (const char *)&v472[1];
        v450 = (uint64_t *)v385;
        if (SHIBYTE(v472[1].__r_.__value_.__r.__words[2]) < 0)
          v394 = *(const char **)v394;
        fputs(v394, v373);
        v395 = (char *)v475 + 24 * v391;
        v397 = *(unsigned int **)v395;
        v396 = (unsigned int *)*((_QWORD *)v395 + 1);
        if (*(unsigned int **)v395 != v396)
        {
          do
          {
            v398 = v397[1];
            v399 = v397[2];
            v400 = (double)v399 / (double)v398;
            if (!v398)
              v400 = 0.0;
            fprintf(v373, "0x%0.8x %6u %10u %10u %10u %10.2g %10u %10.2g\n", *v397, *v397, v397[3], v398, v397[6], v400, v397[2], (double)v399 * 100.0 / v387);
            v401 = v397[1];
            v402 = v397[2];
            v403 = (double)v402 / (double)v401;
            if (!v401)
              v403 = 0.0;
            fprintf(v374, "0x%0.8x %6u %10u %10u %10u %10.2g %10u %10.2g\n", *v397, *v397, v397[3], v401, v397[6], v403, v397[2], (double)v402 * 100.0 / v387);
            v404 = (GPUToolsPlatformLLVMShaderProfilerHelperImpl **)*((_QWORD *)std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](v469, (uint64_t)v389)+ 5);
            v405 = GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(*v404);
            v406 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((_QWORD *)(*(_QWORD *)v405 + 56), *v397);
            if (v406)
              v407 = *((unsigned int *)v406 + 6);
            else
              v407 = 0xFFFFFFFFLL;
            v408 = *v404;
            v599[0] = 0;
            v599[1] = 0;
            v600 = 0;
            *(_DWORD *)&v601[8] = 0;
            v604 = 0;
            v605 = 0;
            v606 = 1;
            v602 = 0;
            v603 = 0;
            *(_QWORD *)&v601[16] = 0;
            v607 = v599;
            llvm::raw_ostream::SetUnbuffered((llvm::raw_ostream *)v601);
            v409 = (uint64_t **)GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(v408);
            v411 = **v409;
            if (0x2E8BA2E8BA2E8BA3 * (((*v409)[1] - v411) >> 3) > v407)
            {
              v412 = (uint64_t *)(v411 + 88 * *(_QWORD *)((*v409)[3] + 48 * v407));
              GPUToolsPlatformLLVMShaderProfilerHelperImpl::_DumpInstructionsToOStream(v408, (llvm::raw_ostream *)v601, *v412, v412[1] + *v412, v410);
            }
            v413 = v607;
            if (*((char *)v607 + 23) < 0)
            {
              v415 = (std::string::value_type *)*v607;
              v414 = (unsigned __int8 *)v607[1];
            }
            else
            {
              v414 = (unsigned __int8 *)*((unsigned __int8 *)v607 + 23);
              v415 = (std::string::value_type *)v607;
            }
            v468.__r_.__value_.__s.__data_[0] = 9;
            v416 = std::remove[abi:nn180100]<std::__wrap_iter<char *>,char>(v415, &v414[(_QWORD)v415], (unsigned __int8 *)&v468);
            if (*((char *)v413 + 23) < 0)
            {
              v418 = *v413;
              v417 = (char *)v413[1] + (_QWORD)*v413;
            }
            else
            {
              v417 = (char *)v413 + *((unsigned __int8 *)v413 + 23);
              v418 = v413;
            }
            std::string::erase((std::string *)v413, v416 - v418, v417 - (char *)v416);
            if (*((char *)v607 + 23) < 0)
              std::string::__init_copy_ctor_external(&v468, (const std::string::value_type *)*v607, (std::string::size_type)v607[1]);
            else
              v468 = *(std::string *)v607;
            llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)v601);
            if (SHIBYTE(v600) < 0)
              operator delete(v599[0]);
            v419 = SHIBYTE(v468.__r_.__value_.__r.__words[2]);
            v420 = (void *)v468.__r_.__value_.__r.__words[0];
            if ((v468.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v421 = &v468;
            else
              v421 = (std::string *)v468.__r_.__value_.__r.__words[0];
            fputs((const char *)v421, v373);
            fputc(10, v373);
            if (v419 < 0)
              operator delete(v420);
            v397 += 7;
            v374 = v457;
          }
          while (v397 != v396);
        }
        v386 = v447 + 1;
        v385 = *v450;
      }
      while (*v450);
    }
    if (v373)
      fclose(v373);
    v422 = 126 - 2 * __clz(((char *)v433 - (char *)v435) >> 3);
    v423 = (char *)v433 - (char *)v435;
    if (v433 == v435)
      v424 = 0;
    else
      v424 = v422;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>((unint64_t)v435, v433, v424, 1);
    fwrite("\nDraw Call Costs\n", 0x11uLL, 1uLL, v374);
    fprintf(v374, "Idx   drawIdx  function vertex key  fragment key  Cost    %%Weight\n");
    v425 = (void *)__lend;
    if ((int)((unint64_t)v423 >> 3) >= 1)
    {
      v426 = 0;
      if ((int)(v423 >> 3) <= 1)
        v427 = 1;
      else
        v427 = (int)(v423 >> 3);
      v428 = v435;
      do
      {
        v429 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v451, "drawCallInfoList"));
        v430 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v429, "objectAtIndexedSubscript:", v426));

        fprintf(v457, "%d : %8u %8u   0x%s   0x%s    0x%s : %8u  : %4.2f\n", v426, objc_msgSend(v430, "drawCallIndex"), objc_msgSend(v430, "functionIndex"), (const char *)objc_msgSend(v430[1], "UTF8String"), (const char *)objc_msgSend(v430[2], "UTF8String"), (const char *)objc_msgSend(v430[3], "UTF8String"), *v428, (double)*v428 * 100.0 / (double)v331);
        v425 = (void *)__lend;
        v368 = v445;
        ++v426;
        v428 += 2;
      }
      while (v427 != v426);
    }
    if (v457)
      fclose(v457);

    *(_QWORD *)v601 = &v472;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
    if (v425)
      operator delete(v425);
    if (v462)
      operator delete(v462);
    *(_QWORD *)v601 = &v475;
    std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
    std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__deallocate_node((_QWORD *)v470);
    v431 = v469[0];
    v469[0] = 0;
    if (v431)
      operator delete(v431);
    std::__hash_table<std::__hash_value_type<std::string,BinaryInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BinaryInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BinaryInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BinaryInfo>>>::~__hash_table((uint64_t)&v478);
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>>>::~__hash_table((uint64_t)&v481);
    v161 = v498;
  }
  if (v161)
  {
    v499 = v161;
    operator delete(v161);
  }
  _Block_object_dispose(&v501, 8);
  *(_QWORD *)v601 = &v507;
  std::vector<std::unordered_map<std::string,BinaryInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
  _Block_object_dispose(&v510, 8);
  *(_QWORD *)v601 = &v516;
  std::vector<std::unordered_map<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
  _Block_object_dispose(&v519, 8);
  *(_QWORD *)v601 = &v525;
  std::vector<std::unordered_map<std::string,std::unordered_map<unsigned int,ClauseData>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
  _Block_object_dispose(&v528, 8);
  *(_QWORD *)v601 = &v534;
  std::vector<std::vector<InstructionPCInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
  _Block_object_dispose(&v537, 8);
  *(_QWORD *)v601 = &v543;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
  if (v435)
    operator delete(v435);
  if (v448)
    operator delete(v448);

  _Block_object_dispose(v553, 8);
  if (v554)
  {
    v555 = v554;
    operator delete(v554);
  }
  _Block_object_dispose(&v557, 8);
  *(_QWORD *)v601 = v563;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
  _Block_object_dispose(&v564, 8);
  if (v570)
  {
    v571 = (char *)v570;
    operator delete(v570);
  }
  _Block_object_dispose(&v573, 8);
  if (v579)
  {
    v580 = (char *)v579;
    operator delete(v579);
  }
  *(_QWORD *)v601 = &v582;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);
  _Block_object_dispose(&v586, 8);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>>>::~__hash_table((uint64_t)&v590[8]);
  if (v595 < 0)
    operator delete(v594);

  *(_QWORD *)v601 = &v596;
  std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__destroy_vector::operator()[abi:nn180100]((void ***)v601);

}

- (BOOL)dumpInstructions
{
  return *((_BYTE *)self + 752);
}

- (void)setDumpInstructions:(BOOL)a3
{
  *((_BYTE *)self + 752) = a3;
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void **v10;
  void **v11;
  void *v12;
  void **v13;
  void **v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void **v19;
  void **v20;
  void *v21;
  void *v22;
  void **v23;

  objc_storeStrong((id *)self + 93, 0);
  objc_storeStrong((id *)self + 92, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 664));
  std::mutex::~mutex((std::mutex *)((char *)self + 600));
  std::mutex::~mutex((std::mutex *)((char *)self + 536));
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)self + 496);
  objc_storeStrong((id *)self + 61, 0);
  v3 = (void *)*((_QWORD *)self + 58);
  if (v3)
  {
    *((_QWORD *)self + 59) = v3;
    operator delete(v3);
  }
  objc_storeStrong((id *)self + 57, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)self + 416);
  for (i = 0; i != -72; i -= 24)
  {
    v5 = *(void **)((char *)self + i + 392);
    if (v5)
    {
      *(_QWORD *)((char *)self + i + 400) = v5;
      operator delete(v5);
    }
  }
  v6 = (void *)*((_QWORD *)self + 40);
  if (v6)
  {
    *((_QWORD *)self + 41) = v6;
    operator delete(v6);
  }
  v7 = *((_QWORD *)self + 37);
  if (v7)
  {
    v8 = *((_QWORD *)self + 38);
    v9 = (void *)*((_QWORD *)self + 37);
    if (v8 != v7)
    {
      do
        v8 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(v8 - 40);
      while (v8 != v7);
      v9 = (void *)*((_QWORD *)self + 37);
    }
    *((_QWORD *)self + 38) = v7;
    operator delete(v9);
  }
  v23 = (void **)((char *)self + 272);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
  v23 = (void **)((char *)self + 248);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
  v10 = (void **)*((_QWORD *)self + 28);
  if (v10)
  {
    v11 = (void **)*((_QWORD *)self + 29);
    v12 = (void *)*((_QWORD *)self + 28);
    if (v11 != v10)
    {
      do
      {
        v11 -= 3;
        v23 = v11;
        std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }
      while (v11 != v10);
      v12 = (void *)*((_QWORD *)self + 28);
    }
    *((_QWORD *)self + 29) = v10;
    operator delete(v12);
  }
  v13 = (void **)*((_QWORD *)self + 25);
  if (v13)
  {
    v14 = (void **)*((_QWORD *)self + 26);
    v15 = (void *)*((_QWORD *)self + 25);
    if (v14 != v13)
    {
      do
      {
        v14 -= 3;
        v23 = v14;
        std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }
      while (v14 != v13);
      v15 = (void *)*((_QWORD *)self + 25);
    }
    *((_QWORD *)self + 26) = v13;
    operator delete(v15);
  }
  objc_storeStrong((id *)self + 24, 0);
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 21, 0);
  objc_storeStrong((id *)self + 20, 0);
  objc_storeStrong((id *)self + 19, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::~__hash_table((uint64_t)self + 112);
  v16 = *((_QWORD *)self + 10);
  if (v16)
  {
    v17 = *((_QWORD *)self + 11);
    v18 = (void *)*((_QWORD *)self + 10);
    if (v17 != v16)
    {
      do
        v17 = std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>>>::~__hash_table(v17 - 40);
      while (v17 != v16);
      v18 = (void *)*((_QWORD *)self + 10);
    }
    *((_QWORD *)self + 11) = v16;
    operator delete(v18);
  }
  v19 = (void **)*((_QWORD *)self + 7);
  if (v19)
  {
    v20 = (void **)*((_QWORD *)self + 8);
    v21 = (void *)*((_QWORD *)self + 7);
    if (v20 != v19)
    {
      do
      {
        v20 -= 3;
        v23 = v20;
        std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }
      while (v20 != v19);
      v21 = (void *)*((_QWORD *)self + 7);
    }
    *((_QWORD *)self + 8) = v19;
    operator delete(v21);
  }
  std::__hash_table<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::__unordered_map_hasher<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>>>::__deallocate_node(*((_QWORD **)self + 4));
  v22 = (void *)*((_QWORD *)self + 2);
  *((_QWORD *)self + 2) = 0;
  if (v22)
    operator delete(v22);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((_QWORD *)self + 55) = 0;
  *((_DWORD *)self + 112) = 1065353216;
  *((_QWORD *)self + 59) = 0;
  *((_QWORD *)self + 60) = 0;
  *((_QWORD *)self + 58) = 0;
  *((_OWORD *)self + 31) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((_DWORD *)self + 132) = 1065353216;
  *((_QWORD *)self + 67) = 850045863;
  *((_OWORD *)self + 34) = 0u;
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((_QWORD *)self + 74) = 0;
  *((_QWORD *)self + 75) = 850045863;
  *((_QWORD *)self + 82) = 0;
  *((_OWORD *)self + 39) = 0u;
  *((_OWORD *)self + 40) = 0u;
  *((_OWORD *)self + 38) = 0u;
  *((_QWORD *)self + 83) = 850045863;
  *((_QWORD *)self + 90) = 0;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 42) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  return self;
}

void __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v3;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  char *v12;
  id v13;
  unint64_t v14;
  uint8x8_t v15;
  _QWORD *v16;
  _QWORD *i;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  int8x8_t prime;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  __int128 __p;
  uint64_t v45;
  _QWORD v46[2];
  char v47;

  v6 = a2;
  v7 = a3;
  v8 = objc_retainAutorelease(v6);
  v9 = strtoull((const char *)objc_msgSend(v8, "UTF8String"), 0, 16);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = objc_retainAutorelease(v8);
  v12 = (char *)objc_msgSend(v11, "UTF8String");
  v13 = v7;
  v43 = v13;
  std::string::basic_string[abi:nn180100]<0>(&__p, v12);
  v14 = *(_QWORD *)(v10 + 56);
  if (v14)
  {
    v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      v3 = v9;
      if (v9 >= v14)
        v3 = v9 % v14;
    }
    else
    {
      v3 = (v14 - 1) & v9;
    }
    v16 = *(_QWORD **)(*(_QWORD *)(v10 + 48) + 8 * v3);
    if (v16)
    {
      for (i = (_QWORD *)*v16; i; i = (_QWORD *)*i)
      {
        v18 = i[1];
        if (v18 == v9)
        {
          if (i[2] == v9)
            goto LABEL_74;
        }
        else
        {
          if (v15.u32[0] > 1uLL)
          {
            if (v18 >= v14)
              v18 %= v14;
          }
          else
          {
            v18 &= v14 - 1;
          }
          if (v18 != v3)
            break;
        }
      }
    }
  }
  v19 = operator new(0x38uLL);
  v20 = (_QWORD *)(v10 + 64);
  v46[0] = v19;
  v46[1] = v10 + 64;
  *v19 = 0;
  v19[1] = v9;
  v43 = 0;
  v19[2] = v9;
  v19[3] = v13;
  v19[6] = v45;
  *((_OWORD *)v19 + 2) = __p;
  __p = 0uLL;
  v45 = 0;
  v47 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(v10 + 72) + 1);
  v22 = *(float *)(v10 + 80);
  if (!v14 || (float)(v22 * (float)v14) < v21)
  {
    v23 = 1;
    if (v14 >= 3)
      v23 = (v14 & (v14 - 1)) != 0;
    v24 = v23 | (2 * v14);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      prime = (int8x8_t)v25;
    else
      prime = (int8x8_t)v24;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v14 = *(_QWORD *)(v10 + 56);
    if (*(_QWORD *)&prime > v14)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v14)
    {
      v33 = vcvtps_u32_f32((float)*(unint64_t *)(v10 + 72) / *(float *)(v10 + 80));
      if (v14 < 3 || (v34 = (uint8x8_t)vcnt_s8((int8x8_t)v14), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        v33 = std::__next_prime(v33);
      }
      else
      {
        v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2)
          v33 = v35;
      }
      if (*(_QWORD *)&prime <= v33)
        prime = (int8x8_t)v33;
      if (*(_QWORD *)&prime >= v14)
      {
        v14 = *(_QWORD *)(v10 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v27 = operator new(8 * *(_QWORD *)&prime);
          v28 = *(void **)(v10 + 48);
          *(_QWORD *)(v10 + 48) = v27;
          if (v28)
            operator delete(v28);
          v29 = 0;
          *(int8x8_t *)(v10 + 56) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v29++) = 0;
          while (*(_QWORD *)&prime != v29);
          v30 = (_QWORD *)*v20;
          if (*v20)
          {
            v31 = v30[1];
            v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(_QWORD *)&prime)
                v31 %= *(_QWORD *)&prime;
            }
            else
            {
              v31 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v31) = v20;
            v36 = (_QWORD *)*v30;
            if (*v30)
            {
              do
              {
                v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(_QWORD *)&prime)
                    v37 %= *(_QWORD *)&prime;
                }
                else
                {
                  v37 &= *(_QWORD *)&prime - 1;
                }
                if (v37 != v31)
                {
                  v38 = *(_QWORD *)(v10 + 48);
                  if (!*(_QWORD *)(v38 + 8 * v37))
                  {
                    *(_QWORD *)(v38 + 8 * v37) = v30;
                    goto LABEL_55;
                  }
                  *v30 = *v36;
                  *v36 = **(_QWORD **)(*(_QWORD *)(v10 + 48) + 8 * v37);
                  **(_QWORD **)(*(_QWORD *)(v10 + 48) + 8 * v37) = v36;
                  v36 = v30;
                }
                v37 = v31;
LABEL_55:
                v30 = v36;
                v36 = (_QWORD *)*v36;
                v31 = v37;
              }
              while (v36);
            }
          }
          v14 = (unint64_t)prime;
          goto LABEL_59;
        }
        v42 = *(void **)(v10 + 48);
        *(_QWORD *)(v10 + 48) = 0;
        if (v42)
          operator delete(v42);
        v14 = 0;
        *(_QWORD *)(v10 + 56) = 0;
      }
    }
LABEL_59:
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v9 >= v14)
        v3 = v9 % v14;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v14 - 1) & v9;
    }
  }
  v39 = *(_QWORD **)(*(_QWORD *)(v10 + 48) + 8 * v3);
  v40 = v46[0];
  if (v39)
  {
    *(_QWORD *)v46[0] = *v39;
LABEL_72:
    *v39 = v40;
    goto LABEL_73;
  }
  *(_QWORD *)v46[0] = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v10 + 64) = v40;
  *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v3) = v20;
  if (*(_QWORD *)v40)
  {
    v41 = *(_QWORD *)(*(_QWORD *)v40 + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v41 >= v14)
        v41 %= v14;
    }
    else
    {
      v41 &= v14 - 1;
    }
    v39 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v41);
    goto LABEL_72;
  }
LABEL_73:
  v46[0] = 0;
  ++*(_QWORD *)(v10 + 72);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryInfo * {__strong},std::string>>,void *>>>>::reset[abi:nn180100]((uint64_t)v46);
LABEL_74:
  if (SHIBYTE(v45) < 0)
    operator delete((void *)__p);

}

id __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_558(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v28;
  BOOL v29;
  unint64_t v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  void **v35;
  unint64_t v36;
  _QWORD *v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  char *v56;
  char *v57;
  unint64_t v58;
  __int128 v59;
  __int128 v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  __int128 v67;
  __int128 v68;
  char *v69;
  char *v70;
  unint64_t v71;
  __int128 v72;
  __int128 v73;
  id result;
  unsigned int v75;
  FILE *v76;
  unsigned int v77;
  unsigned int v78;
  uint64_t v79;
  unsigned int v80;
  unsigned int v81;
  _OWORD *v82;
  _OWORD *v83;
  uint64_t v84;
  char __str[4];
  unsigned int v86;

  if (objc_msgSend(*(id *)(a1 + 32), "dumpInstructions"))
  {
    snprintf(__str, 0x80uLL, "/tmp/com.apple.gputools.profiling/shaderProfilerResults/uscSamplingProcessedSample_%d.txt", *(_DWORD *)(a1 + 104));
    v76 = fopen(__str, "wt");
  }
  else
  {
    v76 = 0;
  }
  v2 = *(_DWORD *)(a1 + 108);
  if (v2 < *(_DWORD *)(a1 + 112))
  {
    while (1)
    {
      v3 = *(_QWORD *)(a1 + 72);
      v4 = v2;
      if (!*(_BYTE *)(a1 + 128))
        break;
      if (*(__int16 *)(v3 + 8 * v2 + 6) == -275)
      {
        v5 = 0;
        v6 = *(_DWORD *)(a1 + 116);
        do
        {
          *(_QWORD *)&__str[8 * v5] = *(_QWORD *)(v3 + 8 * ((v2 + v5) % v6));
          ++v5;
        }
        while (v5 != 3);
        v80 = v86;
        v7 = ((*(_DWORD *)__str >> 4) & 7) + v2;
        LODWORD(v8) = (*(_DWORD *)__str >> 7) & 0x7F;
        v2 = v7 + v8;
        v79 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }
LABEL_79:
      if (++v2 >= *(_DWORD *)(a1 + 112))
        goto LABEL_80;
    }
    v9 = *(_QWORD *)(v3 + 8 * v2);
    if ((_DWORD)v9 == -1)
    {
      v80 = -1;
      v10 = *(_QWORD *)(v3 + 8 * v2);
    }
    else
    {
      v11 = v2;
      v12 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)__str = *(_QWORD *)(v3 + 8 * v2);
      v80 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v12, v9, __str)+ 5);
      v10 = *(_QWORD *)(v3 + 8 * v4);
      v2 = v11;
    }
    v7 = v2 + 1;
    v8 = (v9 >> 30) & 0x1FC;
    v79 = v10 >> 39;
    v2 += v8;
LABEL_14:
    if ((v8 & 3) == 0 && v8 >= 4)
    {
      v75 = v2;
      v13 = 0;
      v14 = v8 >> 2;
      v77 = v8 >> 2;
      v78 = v7;
      do
      {
        v15 = 0;
        v16 = 0;
        v17 = *(_DWORD *)(a1 + 116);
        v18 = *(_QWORD *)(a1 + 72);
        do
        {
          v19 = v18 + 8 * (((v7 + 4 * v13) % v17 + v16) % v17);
          v20 = &__str[v15];
          *(_DWORD *)v20 = *(_QWORD *)v19;
          *((_DWORD *)v20 + 1) = *(_DWORD *)(v19 + 4);
          ++v16;
          v15 += 8;
        }
        while (v15 != 32);
        if ((__str[0] & 0xF) == 1)
        {
          v82 = 0;
          v83 = 0;
          v84 = 0;
          objc_msgSend(*(id *)(a1 + 32), "_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:", __str, v80, &v82, *(unsigned int *)(a1 + 120), v79);
          if ((objc_msgSend(*(id *)(a1 + 32), "dumpInstructions") & 1) != 0)
          {
            v21 = *(void **)(a1 + 32);
            v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
            ++*(_DWORD *)(v22 + 4 * *(unsigned int *)(a1 + 104));
            objc_msgSend(v21, "_dumpTraceBufferPacketsInFile:usingTracePackets:withExtractedSamples:withTraceBufferCount:forTargetIndex:", v76, __str, &v82);
            v24 = v82;
            v23 = v83;
            v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
            *(_DWORD *)(v25 + 4 * *(unsigned int *)(a1 + 104)) -= 858993459
                                                                  * ((unint64_t)((char *)v83 - (char *)v82) >> 3);
          }
          else
          {
            v24 = v82;
            v23 = v83;
          }
          if (v24 != v23)
          {
            do
            {
              v26 = *(_DWORD *)v24;
              if (*(_DWORD *)v24 != -1 || *((_DWORD *)v24 + 3) == -1)
              {
                v28 = *(_DWORD *)(a1 + 124);
                v29 = v26 >= v28;
                v30 = v26 - v28;
                if (v29 && *(_QWORD *)(a1 + 88) > v30)
                {
                  v31 = *(_DWORD *)(**(_QWORD **)(a1 + 96) + 4 * v30);
                  v81 = v31;
                  if (v31 != -1)
                  {
                    if (*(_BYTE *)(a1 + 128))
                    {
                      v31 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(*(_QWORD *)(a1 + 80), v31, &v81)+ 5);
                      v28 = *(_DWORD *)(a1 + 124);
                    }
                    v29 = v31 >= v28;
                    v32 = v31 - v28;
                    if (v29 && *(_QWORD *)(a1 + 88) > v32)
                    {
                      v33 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48)
                                               + 24 * *(unsigned int *)(a1 + 104));
                      v35 = (void **)(v33 + 1);
                      v34 = v33[1];
                      v37 = v33 + 2;
                      v36 = v33[2];
                      if (v34 >= v36)
                      {
                        v61 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v34 - *v33) >> 3);
                        v62 = v61 + 1;
                        if (v61 + 1 > 0x666666666666666)
                          abort();
                        v63 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v36 - *v33) >> 3);
                        if (2 * v63 > v62)
                          v62 = 2 * v63;
                        if (v63 >= 0x333333333333333)
                          v64 = 0x666666666666666;
                        else
                          v64 = v62;
                        if (v64)
                          v64 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v64);
                        else
                          v65 = 0;
                        v66 = v64 + 40 * v61;
                        v67 = *v24;
                        v68 = v24[1];
                        *(_QWORD *)(v66 + 32) = *((_QWORD *)v24 + 4);
                        *(_OWORD *)v66 = v67;
                        *(_OWORD *)(v66 + 16) = v68;
                        v69 = (char *)*v35;
                        v70 = (char *)*v33;
                        v71 = v66;
                        if (*v35 != (void *)*v33)
                        {
                          do
                          {
                            v72 = *(_OWORD *)(v69 - 40);
                            v73 = *(_OWORD *)(v69 - 24);
                            *(_QWORD *)(v71 - 8) = *((_QWORD *)v69 - 1);
                            *(_OWORD *)(v71 - 24) = v73;
                            *(_OWORD *)(v71 - 40) = v72;
                            v71 -= 40;
                            v69 -= 40;
                          }
                          while (v69 != v70);
                          v69 = (char *)*v33;
                        }
                        *v33 = v71;
                        v40 = (void *)(v66 + 40);
                        *v35 = (void *)(v66 + 40);
                        *v37 = v64 + 40 * v65;
                        if (v69)
                          operator delete(v69);
                      }
                      else
                      {
                        v38 = *v24;
                        v39 = v24[1];
                        *(_QWORD *)(v34 + 32) = *((_QWORD *)v24 + 4);
                        *(_OWORD *)v34 = v38;
                        *(_OWORD *)(v34 + 16) = v39;
                        v40 = (void *)(v34 + 40);
                      }
                      *v35 = v40;
                    }
                  }
                }
              }
              else
              {
                v41 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
                v42 = v41[7];
                v43 = v41[8];
                if (v42 >= v43)
                {
                  v47 = v41[6];
                  v48 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v42 - v47) >> 3);
                  v49 = v48 + 1;
                  if (v48 + 1 > 0x666666666666666)
                    abort();
                  v50 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v43 - v47) >> 3);
                  if (2 * v50 > v49)
                    v49 = 2 * v50;
                  if (v50 >= 0x333333333333333)
                    v51 = 0x666666666666666;
                  else
                    v51 = v49;
                  if (v51)
                    v51 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v51);
                  else
                    v52 = 0;
                  v53 = v51 + 40 * v48;
                  v54 = *v24;
                  v55 = v24[1];
                  *(_QWORD *)(v53 + 32) = *((_QWORD *)v24 + 4);
                  *(_OWORD *)v53 = v54;
                  *(_OWORD *)(v53 + 16) = v55;
                  v57 = (char *)v41[6];
                  v56 = (char *)v41[7];
                  v58 = v53;
                  if (v56 != v57)
                  {
                    do
                    {
                      v59 = *(_OWORD *)(v56 - 40);
                      v60 = *(_OWORD *)(v56 - 24);
                      *(_QWORD *)(v58 - 8) = *((_QWORD *)v56 - 1);
                      *(_OWORD *)(v58 - 24) = v60;
                      *(_OWORD *)(v58 - 40) = v59;
                      v58 -= 40;
                      v56 -= 40;
                    }
                    while (v56 != v57);
                    v56 = (char *)v41[6];
                  }
                  v46 = v53 + 40;
                  v41[6] = v58;
                  v41[7] = v53 + 40;
                  v41[8] = v51 + 40 * v52;
                  if (v56)
                    operator delete(v56);
                }
                else
                {
                  v44 = *v24;
                  v45 = v24[1];
                  *(_QWORD *)(v42 + 32) = *((_QWORD *)v24 + 4);
                  *(_OWORD *)v42 = v44;
                  *(_OWORD *)(v42 + 16) = v45;
                  v46 = v42 + 40;
                }
                v41[7] = v46;
              }
              v24 = (_OWORD *)((char *)v24 + 40);
            }
            while (v24 != v23);
            v23 = v82;
          }
          if (v23)
          {
            v83 = v23;
            operator delete(v23);
          }
          v14 = v77;
          v7 = v78;
        }
        ++v13;
      }
      while (v13 != v14);
      v2 = v75;
    }
    goto LABEL_79;
  }
LABEL_80:
  result = objc_msgSend(*(id *)(a1 + 32), "dumpInstructions");
  if ((result & 1) != 0)
    return (id)fclose(v76);
  return result;
}

void __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_575(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t *v5;
  unsigned __int8 *v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  int8x8_t *v10;
  int8x8_t v11;
  uint8x8_t v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *i;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  char **v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  char *v26;
  unint64_t v27;
  void *v28;
  uint64_t TargetClauseAnalysis;
  uint64_t *v30;
  _QWORD *v31;
  char *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  char *v38;
  int v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;
  int v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  BOOL v53;
  unint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  _BYTE *v60;
  size_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  __int128 v71;
  int v72;
  unint64_t v73;
  std::string *v74;
  std::string::size_type size;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint8x8_t v79;
  unint64_t v80;
  unint64_t v81;
  void **v82;
  unint64_t v83;
  float v84;
  float v85;
  _BOOL8 v86;
  unint64_t v87;
  unint64_t v88;
  size_t v89;
  uint64_t v90;
  _QWORD *v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t *v95;
  int v96;
  unint64_t v97;
  uint8x8_t v98;
  unint64_t v99;
  uint64_t **v100;
  uint64_t *j;
  unint64_t v102;
  _QWORD *v103;
  float v104;
  float v105;
  _BOOL8 v106;
  unint64_t v107;
  unint64_t v108;
  size_t v109;
  uint64_t v110;
  _QWORD *v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char **v115;
  char *v116;
  char **v117;
  unint64_t v118;
  char **v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  char *v139;
  char *v140;
  char *v141;
  __int128 v142;
  int v143;
  unsigned int v144;
  unsigned int *v145;
  int v146;
  unsigned int v147;
  unsigned int *v148;
  unint64_t v149;
  _DWORD *v150;
  uint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint64_t v156;
  unsigned int *v157;
  char *v158;
  char *v159;
  unsigned int *v160;
  __int128 v161;
  id *v162;
  uint64_t *v163;
  TargetClauseAnalysis **v164;
  uint64_t *TargetBlocks;
  uint64_t *v166;
  __int128 *v167;
  uint64_t *v168;
  TargetClauseAnalysis *v169;
  uint64_t v170;
  int v171;
  uint64_t *v172;
  unint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  uint8x8_t v177;
  unint64_t v178;
  uint64_t **v179;
  uint64_t *v180;
  unint64_t v181;
  _QWORD *v182;
  std::string *v183;
  __int128 v184;
  _QWORD *v185;
  float v186;
  float v187;
  _BOOL8 v188;
  unint64_t v189;
  unint64_t v190;
  size_t v191;
  _QWORD *v192;
  unint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  unint64_t v197;
  unint64_t v198;
  uint64_t v199;
  unint64_t v200;
  uint64_t v201;
  char *v202;
  char *v203;
  char *v204;
  char *v205;
  char *v206;
  char *v207;
  uint64_t v208;
  char *v209;
  char *v210;
  __int128 v211;
  char *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  uint64_t v218;
  unsigned int v219;
  unsigned int v220;
  uint64_t v221;
  char **v222;
  int v223;
  uint64_t v224;
  int v225;
  unint64_t v226;
  char *v227;
  char *v228;
  unint64_t v229;
  unint64_t v230;
  char *v231;
  unint64_t v232;
  uint64_t v233;
  unint64_t v234;
  char *v235;
  char *v236;
  char *v237;
  char *v238;
  char *v239;
  char *v240;
  __int128 v241;
  char **v242;
  char *v243;
  _QWORD *v244;
  unsigned int v245;
  unsigned int v246;
  int *v247;
  char *v248;
  unsigned int v249;
  int v250;
  int *v251;
  unsigned int v252;
  int *v253;
  int v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  unsigned int data;
  char *v259;
  unint64_t *v260;
  unint64_t v261;
  uint64_t v262;
  _DWORD *v263;
  unint64_t v264;
  uint64_t v265;
  unint64_t v266;
  int v268;
  uint64_t *v269;
  unint64_t v270;
  uint64_t v271;
  uint64_t *v272;
  unint64_t v273;
  unint64_t v274;
  unint64_t v275;
  double v276;
  unint64_t v277;
  uint64x2_t v278;
  unint64_t v279;
  int v280;
  id *v281;
  unint64_t v282;
  uint64_t v283;
  uint64_t **v284;
  uint64_t v285;
  int v286;
  uint64_t v287;
  id *v288;
  _QWORD *v289;
  uint64_t v290;
  unsigned int v291;
  uint64_t v292;
  TargetClauseAnalysis **v293;
  unsigned __int8 *v294;
  uint64_t *v295;
  uint64_t v296;
  int v297;
  unsigned int v298;
  uint64_t v299;
  char *v300;
  char *v301;
  uint64_t *v302;
  unint64_t v303;
  char **v304;
  id v305;
  unint64_t *k;
  unsigned int *v307;
  GPUToolsPlatformLLVMShaderProfilerHelperImpl **v308;
  __int128 v310;
  __int128 v311;
  int v312;
  std::string v313;
  uint64_t v314[2];
  _QWORD v315[2];
  int v316;
  unsigned int v317;
  _OWORD v318[2];
  uint64_t v319;
  _QWORD v320[2];
  char v321;

  v2 = a1;
  v319 = 0;
  memset(v318, 0, sizeof(v318));
  v4 = *(unsigned int *)(a1 + 200);
  v3 = *(unsigned int *)(a1 + 204);
  if (v4 >= v3)
    goto LABEL_230;
  v281 = (id *)(a1 + 120);
  do
  {
    v279 = v4;
    v5 = (unint64_t *)(**(_QWORD **)(v2 + 112) + 24 * *(_QWORD *)(*(_QWORD *)(v2 + 88) + 8 * v4));
    v1 = *v5;
    v282 = v5[1];
    v283 = *(_QWORD *)(*(_QWORD *)(v2 + 88) + 8 * v4);
    if (*v5 == v282)
      goto LABEL_229;
    do
    {
      v6 = *(unsigned __int8 **)v1;
      v7 = *(_DWORD *)(*(_QWORD *)v1 + 4) % *(_DWORD *)(v2 + 208);
      v317 = v7;
      v8 = *v6;
      if (v8 == 98)
      {
        v8 = v6[40];
        v9 = *((_QWORD *)v6 + 4);
      }
      else
      {
        v9 = -1;
      }
      v10 = *(int8x8_t **)(*(_QWORD *)(v2 + 40) + 8);
      v11 = v10[7];
      if (v11)
      {
        v12 = (uint8x8_t)vcnt_s8(v11);
        v12.i16[0] = vaddlv_u8(v12);
        if (v12.u32[0] > 1uLL)
        {
          v13 = v9;
          if (v9 >= *(_QWORD *)&v11)
            v13 = v9 % *(_QWORD *)&v11;
        }
        else
        {
          v13 = (*(_QWORD *)&v11 - 1) & v9;
        }
        v14 = *(_QWORD **)(*(_QWORD *)&v10[6] + 8 * v13);
        if (v14)
        {
          for (i = (_QWORD *)*v14; i; i = (_QWORD *)*i)
          {
            v16 = i[1];
            if (v16 == v9)
            {
              if (i[2] == v9)
              {
                v162 = (id *)(i + 3);
                goto LABEL_25;
              }
            }
            else
            {
              if (v12.u32[0] > 1uLL)
              {
                if (v16 >= *(_QWORD *)&v11)
                  v16 %= *(_QWORD *)&v11;
              }
              else
              {
                v16 &= *(_QWORD *)&v11 - 1;
              }
              if (v16 != v13)
                break;
            }
          }
        }
      }
      v162 = v281;
      if (v8 <= 5)
        v162 = (id *)(*(_QWORD *)(*(_QWORD *)(v2 + 152) + 24 * v7) + 32 * v8);
LABEL_25:
      v286 = v8;
      v288 = v162;
      v292 = (uint64_t)(v162 + 1);
      v305 = *v162;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v305, "binary"));

      if (v17)
      {
        v294 = std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]((_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 48)+ 40 * *(unsigned int *)(v2 + 212)), v292);
        if (!v294)
          operator new();
      }
      else
      {
        v294 = 0;
      }
      v303 = v1;
      v18 = *(_QWORD *)v1;
      HIDWORD(v318[0]) = *(_QWORD *)(*(_QWORD *)v1 + 8);
      v19 = (char **)(*(_QWORD *)(v2 + 176) + 24 * v283);
      v21 = *v19;
      v20 = v19[1];
      v22 = v20 - *v19;
      if (v22)
      {
        v23 = 0xCCCCCCCCCCCCCCCDLL * (v22 >> 3);
        v300 = v21;
        do
        {
          v24 = (uint64_t)&v21[40 * (v23 >> 1)];
          v25 = USCSampleComparator::operator()(v24, (uint64_t)v318);
          if (v25)
            v23 += ~(v23 >> 1);
          else
            v23 >>= 1;
          if (v25)
            v21 = (char *)(v24 + 40);
        }
        while (v23);
        v26 = v300;
        if (v20 != v21)
        {
          HIDWORD(v318[0]) = *(_QWORD *)(v18 + 16);
          if (v20 != v300)
          {
            v27 = 0xCCCCCCCCCCCCCCCDLL * ((v20 - v300) >> 3);
            do
            {
              if (USCSampleComparator::operator()((uint64_t)v318, (uint64_t)&v26[40 * (v27 >> 1)]))
              {
                v27 >>= 1;
              }
              else
              {
                v26 += 40 * (v27 >> 1) + 40;
                v27 += ~(v27 >> 1);
              }
            }
            while (v27);
          }
          if (v21 != v26)
          {
            v301 = v26;
            while (1)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v305, "binary", v279));

              if (!v28)
              {
                v46 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(1uLL);
                *(_DWORD *)v46 = *((_DWORD *)v21 + 3);
                *(_QWORD *)(v46 + 4) = 1;
                *((_DWORD *)v46 + 3) = 0;
                v307 = (unsigned int *)v46;
                v47 = (uint64_t)(v46 + 16);
                v48 = 1;
                goto LABEL_171;
              }
              TargetClauseAnalysis = GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(**((GPUToolsPlatformLLVMShaderProfilerHelperImpl ***)v294 + 5));
              v30 = *(uint64_t **)TargetClauseAnalysis;
              v31 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((_QWORD *)(*(_QWORD *)TargetClauseAnalysis + 56), (*((_DWORD *)v21 + 3) - *(_DWORD *)(*(_QWORD *)v303 + 8)));
              v32 = v301;
              if (v31)
              {
                v33 = *((_DWORD *)v31 + 6);
                if (v33 != -1)
                  break;
              }
LABEL_226:
              v21 += 40;
              if (v21 == v32)
                goto LABEL_227;
            }
            v34 = *(_QWORD *)(v30[3] + 48 * v33 + 8 * *((unsigned int *)v21 + 8));
            v35 = *v30;
            v36 = *v30 + 88 * v34 + 24;
            v37 = v317;
            v38 = std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v36, v317, &v317);
            v39 = *((_DWORD *)v38 + 7) + *((_DWORD *)v21 + 2);
            ++*((_DWORD *)v38 + 6);
            *((_DWORD *)v38 + 7) = v39;
            v40 = std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v36, v37, &v317);
            v41 = v40;
            v42 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 48)
                                            + 24 * *(unsigned int *)(v2 + 212)
                                            + 8)
                                - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 48)
                                            + 24 * *(unsigned int *)(v2 + 212))) >> 5);
            v44 = (char *)*((_QWORD *)v40 + 5);
            v43 = *((_QWORD *)v40 + 6);
            if ((unint64_t)v44 >= v43)
            {
              v49 = (char *)*((_QWORD *)v40 + 4);
              v50 = (v44 - v49) >> 3;
              v51 = v50 + 1;
              if ((unint64_t)(v50 + 1) >> 61)
                abort();
              v52 = v43 - (_QWORD)v49;
              if (v52 >> 2 > v51)
                v51 = v52 >> 2;
              v53 = (unint64_t)v52 >= 0x7FFFFFFFFFFFFFF8;
              v54 = 0x1FFFFFFFFFFFFFFFLL;
              if (!v53)
                v54 = v51;
              if (v54)
              {
                v54 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v54);
                v49 = (char *)*((_QWORD *)v41 + 4);
                v44 = (char *)*((_QWORD *)v41 + 5);
              }
              else
              {
                v55 = 0;
              }
              v56 = (_QWORD *)(v54 + 8 * v50);
              *v56 = v42;
              v45 = v56 + 1;
              while (v44 != v49)
              {
                v57 = *((_QWORD *)v44 - 1);
                v44 -= 8;
                *--v56 = v57;
              }
              *((_QWORD *)v41 + 4) = v56;
              *((_QWORD *)v41 + 5) = v45;
              *((_QWORD *)v41 + 6) = v54 + 8 * v55;
              if (v49)
                operator delete(v49);
            }
            else
            {
              *(_QWORD *)v44 = v42;
              v45 = v44 + 8;
            }
            *((_QWORD *)v41 + 5) = v45;
            v58 = **(_QWORD **)TargetClauseAnalysis
                + 88
                * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)TargetClauseAnalysis + 24)
                            + 48 * v33
                            + 8 * *((unsigned int *)v21 + 8));
            v60 = *(_BYTE **)(v58 + 64);
            v59 = *(_BYTE **)(v58 + 72);
            v61 = v59 - v60;
            v62 = (v59 - v60) >> 4;
            v296 = v35;
            if (v59 == v60)
            {
              v307 = 0;
              v48 = 0;
              v47 = 16 * v62;
            }
            else
            {
              if ((v61 & 0x8000000000000000) != 0)
                abort();
              v63 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>((v59 - v60) >> 4);
              memmove(v63, v60, v61);
              v64 = 0;
              v48 = 0;
              v47 = (uint64_t)&v63[16 * v62];
              do
              {
                v48 += *(_DWORD *)&v63[v64 + 4];
                v64 += 16;
              }
              while (16 * v62 != v64);
              v307 = (unsigned int *)v63;
            }
            if (!objc_msgSend(*(id *)(v2 + 32), "dumpInstructions"))
            {
LABEL_171:
              if (objc_msgSend(*(id *)(v2 + 32), "dumpInstructions"))
              {
                v113 = v317;
                v114 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 72) + 8) + 48)
                                 + 24 * *(unsigned int *)(v2 + 212));
                *(_DWORD *)(v114 + 8 * v317) += *((_DWORD *)v21 + 2);
                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 72) + 8) + 48)
                                      + 24 * *(unsigned int *)(v2 + 212))
                          + 8 * v113
                          + 4) = v113;
              }
              v298 = objc_msgSend(*(id *)(v2 + 32), "_computeSampleNormFactorForSample:forProgramStartAddress:forProgramEndAddress:", v21, *(_QWORD *)(*(_QWORD *)v303 + 8), *(_QWORD *)(*(_QWORD *)v303 + 16));
              v115 = (char **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 48)
                             + 24 * *(unsigned int *)(v2 + 212));
              v117 = v115 + 1;
              v116 = v115[1];
              v119 = v115 + 2;
              v118 = (unint64_t)v115[2];
              if ((unint64_t)v116 < v118)
              {
                *(_QWORD *)v116 = v305;
                *((_QWORD *)v116 + 1) = 0;
                *((_QWORD *)v116 + 2) = 0;
                *((_QWORD *)v116 + 3) = 0;
                v120 = v116 + 32;
                *v117 = v116 + 32;
LABEL_196:
                *v117 = v120;
                v133 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 48)
                                 + 24 * *(unsigned int *)(v2 + 212)
                                 + 8);
                v134 = v47 - (_QWORD)v307;
                v135 = *(_QWORD *)(v133 - 24);
                if (0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(v133 - 8) - v135) >> 2) < (v47 - (uint64_t)v307) >> 4)
                {
                  if (v134 < 0)
                    abort();
                  v136 = *(_QWORD *)(v133 - 16);
                  v137 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<DYMTLShaderProfilerProcessedUSCSample>>(v134 >> 4);
                  v140 = *(char **)(v133 - 24);
                  v139 = *(char **)(v133 - 16);
                  v141 = &v137[20 * ((v136 - v135) / 20)];
                  if (v139 != v140)
                  {
                    do
                    {
                      v142 = *(_OWORD *)(v139 - 20);
                      *((_DWORD *)v141 - 1) = *((_DWORD *)v139 - 1);
                      *(_OWORD *)(v141 - 20) = v142;
                      v141 -= 20;
                      v139 -= 20;
                    }
                    while (v139 != v140);
                    v139 = *(char **)(v133 - 24);
                  }
                  *(_QWORD *)(v133 - 24) = v141;
                  *(_QWORD *)(v133 - 16) = &v137[20 * ((v136 - v135) / 20)];
                  *(_QWORD *)(v133 - 8) = &v137[20 * v138];
                  if (v139)
                    operator delete(v139);
                }
                if (v307 != (unsigned int *)v47)
                {
                  v143 = v48 * v298;
                  v144 = v317;
                  v145 = v307;
                  do
                  {
                    v146 = v145[1] * *((_DWORD *)v21 + 2);
                    if (v146)
                    {
                      v147 = *v145;
                      v148 = *(unsigned int **)(v133 - 16);
                      v149 = *(_QWORD *)(v133 - 8);
                      if ((unint64_t)v148 >= v149)
                      {
                        v151 = *(_QWORD *)(v133 - 24);
                        v152 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v148 - v151) >> 2);
                        v153 = v152 + 1;
                        if (v152 + 1 > 0xCCCCCCCCCCCCCCCLL)
                          abort();
                        v154 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v149 - v151) >> 2);
                        if (2 * v154 > v153)
                          v153 = 2 * v154;
                        if (v154 >= 0x666666666666666)
                          v155 = 0xCCCCCCCCCCCCCCCLL;
                        else
                          v155 = v153;
                        if (v155)
                          v155 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<DYMTLShaderProfilerProcessedUSCSample>>(v155);
                        else
                          v156 = 0;
                        v157 = (unsigned int *)(v155 + 20 * v152);
                        *v157 = v144;
                        v157[1] = v146;
                        v157[2] = v147;
                        v157[3] = v146;
                        v157[4] = v143;
                        v159 = *(char **)(v133 - 24);
                        v158 = *(char **)(v133 - 16);
                        v160 = v157;
                        if (v158 != v159)
                        {
                          do
                          {
                            v161 = *(_OWORD *)(v158 - 20);
                            *(v160 - 1) = *((_DWORD *)v158 - 1);
                            *(_OWORD *)(v160 - 5) = v161;
                            v160 -= 5;
                            v158 -= 20;
                          }
                          while (v158 != v159);
                          v158 = *(char **)(v133 - 24);
                        }
                        v150 = v157 + 5;
                        *(_QWORD *)(v133 - 24) = v160;
                        *(_QWORD *)(v133 - 16) = v157 + 5;
                        *(_QWORD *)(v133 - 8) = v155 + 20 * v156;
                        if (v158)
                          operator delete(v158);
                      }
                      else
                      {
                        *v148 = v144;
                        v148[1] = v146;
                        v148[2] = v147;
                        v148[3] = v146;
                        v150 = v148 + 5;
                        v148[4] = v143;
                      }
                      *(_QWORD *)(v133 - 16) = v150;
                    }
                    v145 += 4;
                  }
                  while (v145 != (unsigned int *)v47);
                }
                v2 = a1;
                v32 = v301;
                if (v307)
                  operator delete(v307);
                goto LABEL_226;
              }
              v121 = (v116 - *v115) >> 5;
              if ((unint64_t)(v121 + 1) >> 59)
                abort();
              v122 = v118 - (_QWORD)*v115;
              v123 = v122 >> 4;
              if (v122 >> 4 <= (unint64_t)(v121 + 1))
                v123 = v121 + 1;
              if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFE0)
                v124 = 0x7FFFFFFFFFFFFFFLL;
              else
                v124 = v123;
              if (v124)
              {
                if (v124 >> 59)
                  std::__throw_bad_array_new_length[abi:nn180100]();
                v125 = (char *)operator new(32 * v124);
              }
              else
              {
                v125 = 0;
              }
              v126 = &v125[32 * v121];
              v127 = &v125[32 * v124];
              *(_QWORD *)v126 = v305;
              *((_QWORD *)v126 + 1) = 0;
              *((_QWORD *)v126 + 2) = 0;
              *((_QWORD *)v126 + 3) = 0;
              v120 = v126 + 32;
              v128 = *v117;
              v129 = *v115;
              if (*v117 == *v115)
              {
                *v115 = v126;
                *v117 = v120;
                *v119 = v127;
              }
              else
              {
                v130 = v127;
                do
                {
                  v131 = *((_QWORD *)v128 - 4);
                  v128 -= 32;
                  *(_QWORD *)v128 = 0;
                  *((_QWORD *)v126 - 4) = v131;
                  v126 -= 32;
                  *((_QWORD *)v126 + 2) = 0;
                  *((_QWORD *)v126 + 3) = 0;
                  *((_QWORD *)v126 + 1) = 0;
                  *(_OWORD *)(v126 + 8) = *(_OWORD *)(v128 + 8);
                  *((_QWORD *)v126 + 3) = *((_QWORD *)v128 + 3);
                  *((_QWORD *)v128 + 1) = 0;
                  *((_QWORD *)v128 + 2) = 0;
                  *((_QWORD *)v128 + 3) = 0;
                }
                while (v128 != v129);
                v132 = *v115;
                v128 = *v117;
                *v115 = v126;
                *v117 = v120;
                *v119 = v130;
                if (v128 != v132)
                {
                  v2 = a1;
                  do
                  {
                    v128 -= 32;
                    std::allocator<InstructionPCInfo>::destroy[abi:nn180100]((uint64_t)v128);
                  }
                  while (v128 != v132);
                  v128 = v132;
LABEL_194:
                  if (v128)
                    operator delete(v128);
                  goto LABEL_196;
                }
              }
              v2 = a1;
              goto LABEL_194;
            }
            v285 = v34;
            v65 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 64) + 8) + 48) + 40 * *(unsigned int *)(v2 + 212);
            v66 = (char *)std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]((_QWORD *)v65, v292);
            if (!v66)
            {
              v310 = 0u;
              v311 = 0u;
              v312 = 1065353216;
              if (*((char *)v288 + 31) < 0)
              {
                std::string::__init_copy_ctor_external(&v313, (const std::string::value_type *)v288[1], (std::string::size_type)v288[2]);
                v69 = *((_QWORD *)&v310 + 1);
                v70 = v310;
                v67 = *((_QWORD *)&v311 + 1);
                v68 = v311;
                v72 = v312;
              }
              else
              {
                v67 = 0;
                v68 = 0;
                v69 = 0;
                v70 = 0;
                v71 = *(_OWORD *)v292;
                v313.__r_.__value_.__r.__words[2] = *(_QWORD *)(v292 + 16);
                *(_OWORD *)&v313.__r_.__value_.__l.__data_ = v71;
                v72 = 1065353216;
              }
              v310 = 0uLL;
              v314[0] = v70;
              v314[1] = v69;
              v315[0] = v68;
              v315[1] = v67;
              v316 = v72;
              if (v67)
              {
                v73 = *(_QWORD *)(v68 + 8);
                if ((v69 & (v69 - 1)) != 0)
                {
                  if (v73 >= v69)
                    v73 %= v69;
                }
                else
                {
                  v73 &= v69 - 1;
                }
                *(_QWORD *)(v70 + 8 * v73) = v315;
                v311 = 0uLL;
              }
              if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v74 = &v313;
              else
                v74 = (std::string *)v313.__r_.__value_.__r.__words[0];
              if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                size = HIBYTE(v313.__r_.__value_.__r.__words[2]);
              else
                size = v313.__r_.__value_.__l.__size_;
              v76 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v74, size);
              v77 = v76;
              v78 = *(_QWORD *)(v65 + 8);
              if (v78)
              {
                v79 = (uint8x8_t)vcnt_s8((int8x8_t)v78);
                v79.i16[0] = vaddlv_u8(v79);
                v80 = v79.u32[0];
                if (v79.u32[0] > 1uLL)
                {
                  v81 = v76;
                  if (v76 >= v78)
                    v81 = v76 % v78;
                }
                else
                {
                  v81 = (v78 - 1) & v76;
                }
                v290 = v81;
                v82 = *(void ***)(*(_QWORD *)v65 + 8 * v81);
                if (v82)
                {
                  v66 = (char *)*v82;
                  if (*v82)
                  {
                    do
                    {
                      v83 = *((_QWORD *)v66 + 1);
                      if (v83 == v77)
                      {
                        if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v66 + 16, (unsigned __int8 *)&v313))
                        {
                          goto LABEL_127;
                        }
                      }
                      else
                      {
                        if (v80 > 1)
                        {
                          if (v83 >= v78)
                            v83 %= v78;
                        }
                        else
                        {
                          v83 &= v78 - 1;
                        }
                        if (v83 != v290)
                          break;
                      }
                      v66 = *(char **)v66;
                    }
                    while (v66);
                  }
                }
              }
              v66 = (char *)operator new(0x50uLL);
              v320[0] = v66;
              v320[1] = v65 + 16;
              *(_QWORD *)v66 = 0;
              *((_QWORD *)v66 + 1) = v77;
              *(std::string *)(v66 + 16) = v313;
              memset(&v313, 0, sizeof(v313));
              std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)(v66 + 40), v314);
              v321 = 1;
              v84 = (float)(unint64_t)(*(_QWORD *)(v65 + 24) + 1);
              v85 = *(float *)(v65 + 32);
              if (!v78 || (float)(v85 * (float)v78) < v84)
              {
                v86 = (v78 & (v78 - 1)) != 0;
                if (v78 < 3)
                  v86 = 1;
                v87 = v86 | (2 * v78);
                v88 = vcvtps_u32_f32(v84 / v85);
                if (v87 <= v88)
                  v89 = v88;
                else
                  v89 = v87;
                std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(v65, v89);
                v78 = *(_QWORD *)(v65 + 8);
                if ((v78 & (v78 - 1)) == 0)
                {
                  v90 = (v78 - 1) & v77;
                  goto LABEL_116;
                }
                if (v77 >= v78)
                {
                  v90 = v77 % v78;
LABEL_116:
                  v290 = v90;
                }
                else
                {
                  v290 = v77;
                }
              }
              v91 = *(_QWORD **)(*(_QWORD *)v65 + 8 * v290);
              if (v91)
              {
                *(_QWORD *)v66 = *v91;
                goto LABEL_125;
              }
              *(_QWORD *)v66 = *(_QWORD *)(v65 + 16);
              *(_QWORD *)(v65 + 16) = v66;
              *(_QWORD *)(*(_QWORD *)v65 + 8 * v290) = v65 + 16;
              if (*(_QWORD *)v66)
              {
                v92 = *(_QWORD *)(*(_QWORD *)v66 + 8);
                if ((v78 & (v78 - 1)) != 0)
                {
                  if (v92 >= v78)
                    v92 %= v78;
                }
                else
                {
                  v92 &= v78 - 1;
                }
                v91 = (_QWORD *)(*(_QWORD *)v65 + 8 * v92);
LABEL_125:
                *v91 = v66;
              }
              v320[0] = 0;
              ++*(_QWORD *)(v65 + 24);
              std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<unsigned int,ClauseData>>,void *>>>>::reset[abi:nn180100]((uint64_t)v320);
LABEL_127:
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v314);
              v2 = a1;
              if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v313.__r_.__value_.__l.__data_);
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v310);
            }
            v93 = (unint64_t)(v66 + 40);
            v94 = *v307;
            v95 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((_QWORD *)v66 + 5, *v307);
            if (v95)
            {
              v96 = *((_DWORD *)v95 + 7);
              ++*((_DWORD *)v95 + 6);
              *((_DWORD *)v95 + 7) = v96 + *((_DWORD *)v21 + 2);
              *((_DWORD *)v95 + 11) += *((_DWORD *)v21 + 9);
              goto LABEL_171;
            }
            v290 = (uint64_t)(v66 + 40);
            v280 = *(_DWORD *)(v296 + 88 * v285 + 8);
            v297 = *((_DWORD *)v21 + 2);
            v97 = *((_QWORD *)v66 + 6);
            if (v97)
            {
              v98 = (uint8x8_t)vcnt_s8((int8x8_t)v97);
              v98.i16[0] = vaddlv_u8(v98);
              if (v98.u32[0] > 1uLL)
              {
                v99 = v94;
                if (v97 <= v94)
                  v99 = v94 % v97;
              }
              else
              {
                v99 = ((_DWORD)v97 - 1) & v94;
              }
              v93 = v99;
              v100 = *(uint64_t ***)(*(_QWORD *)v290 + 8 * v99);
              if (v100)
              {
                for (j = *v100; j; j = (uint64_t *)*j)
                {
                  v102 = j[1];
                  if (v102 == v94)
                  {
                    if (*((_DWORD *)j + 4) == (_DWORD)v94)
                      goto LABEL_170;
                  }
                  else
                  {
                    if (v98.u32[0] > 1uLL)
                    {
                      if (v102 >= v97)
                        v102 %= v97;
                    }
                    else
                    {
                      v102 &= v97 - 1;
                    }
                    if (v102 != v99)
                      break;
                  }
                }
              }
            }
            v103 = operator new(0x30uLL);
            *v103 = 0;
            v103[1] = v94;
            *((_DWORD *)v103 + 4) = v94;
            *((_DWORD *)v103 + 5) = v94;
            *((_DWORD *)v103 + 6) = 1;
            *((_DWORD *)v103 + 7) = v297;
            *((_DWORD *)v103 + 8) = v61 >> 4;
            *((_DWORD *)v103 + 9) = v280;
            *((_DWORD *)v103 + 10) = v286;
            *((_DWORD *)v103 + 11) = v297 == 0;
            v104 = (float)(unint64_t)(*((_QWORD *)v66 + 8) + 1);
            v105 = *((float *)v66 + 18);
            if (!v97 || (float)(v105 * (float)v97) < v104)
            {
              v106 = (v97 & (v97 - 1)) != 0;
              if (v97 < 3)
                v106 = 1;
              v107 = v106 | (2 * v97);
              v108 = vcvtps_u32_f32(v104 / v105);
              if (v107 <= v108)
                v109 = v108;
              else
                v109 = v107;
              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(v290, v109);
              v97 = *((_QWORD *)v66 + 6);
              if ((v97 & (v97 - 1)) != 0)
              {
                if (v97 <= v94)
                  v93 = v94 % v97;
                else
                  v93 = v94;
              }
              else
              {
                v93 = ((_DWORD)v97 - 1) & v94;
              }
            }
            v110 = *(_QWORD *)v290;
            v111 = *(_QWORD **)(*(_QWORD *)v290 + 8 * v93);
            if (v111)
            {
              *v103 = *v111;
            }
            else
            {
              *v103 = *((_QWORD *)v66 + 7);
              *((_QWORD *)v66 + 7) = v103;
              *(_QWORD *)(v110 + 8 * v93) = v66 + 56;
              if (!*v103)
                goto LABEL_169;
              v112 = *(_QWORD *)(*v103 + 8);
              if ((v97 & (v97 - 1)) != 0)
              {
                if (v112 >= v97)
                  v112 %= v97;
              }
              else
              {
                v112 &= v97 - 1;
              }
              v111 = (_QWORD *)(*(_QWORD *)v290 + 8 * v112);
            }
            *v111 = v103;
LABEL_169:
            ++*((_QWORD *)v66 + 8);
LABEL_170:
            v2 = a1;
            goto LABEL_171;
          }
        }
      }
LABEL_227:

      v1 = v303 + 8;
    }
    while (v303 + 8 != v282);
    v3 = *(unsigned int *)(v2 + 204);
LABEL_229:
    v4 = v279 + 1;
  }
  while (v279 + 1 < v3);
LABEL_230:
  if (!*(_BYTE *)(*(_QWORD *)(v2 + 32) + 8))
  {
    v163 = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 48)
                       + 40 * *(unsigned int *)(v2 + 212)
                       + 16);
    if (v163)
    {
      while (1)
      {
        v308 = (GPUToolsPlatformLLVMShaderProfilerHelperImpl **)v163[5];
        v164 = (TargetClauseAnalysis **)GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(*v308);
        TargetBlocks = (uint64_t *)TargetClauseAnalysis::GetTargetBlocks(*v164);
        v284 = (uint64_t **)v163;
        v168 = (uint64_t *)v163[2];
        v167 = (__int128 *)(v163 + 2);
        v166 = v168;
        v293 = v164;
        v169 = *v164;
        v170 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 80) + 8) + 48) + 40 * *(unsigned int *)(v2 + 212);
        v171 = *((char *)v167 + 23);
        if (v171 >= 0)
          v172 = (uint64_t *)v167;
        else
          v172 = v166;
        if (v171 >= 0)
          v173 = *((unsigned __int8 *)v167 + 23);
        else
          v173 = *((_QWORD *)v167 + 1);
        v174 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v172, v173);
        v175 = v174;
        v176 = *(_QWORD *)(v170 + 8);
        if (v176)
        {
          v177 = (uint8x8_t)vcnt_s8((int8x8_t)v176);
          v177.i16[0] = vaddlv_u8(v177);
          v178 = v177.u32[0];
          if (v177.u32[0] > 1uLL)
          {
            v1 = v174;
            if (v174 >= v176)
              v1 = v174 % v176;
          }
          else
          {
            v1 = (v176 - 1) & v174;
          }
          v179 = *(uint64_t ***)(*(_QWORD *)v170 + 8 * v1);
          if (v179)
          {
            v180 = *v179;
            if (*v179)
            {
              while (1)
              {
                v181 = v180[1];
                if (v181 == v175)
                {
                  if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v180 + 16, (unsigned __int8 *)v167))
                  {
                    v289 = v180;
                    v2 = a1;
                    goto LABEL_281;
                  }
                }
                else
                {
                  if (v178 > 1)
                  {
                    if (v181 >= v176)
                      v181 %= v176;
                  }
                  else
                  {
                    v181 &= v176 - 1;
                  }
                  if (v181 != v1)
                  {
LABEL_255:
                    v2 = a1;
                    break;
                  }
                }
                v180 = (uint64_t *)*v180;
                if (!v180)
                  goto LABEL_255;
              }
            }
          }
        }
        v182 = operator new(0x58uLL);
        v313.__r_.__value_.__r.__words[0] = (std::string::size_type)v182;
        v313.__r_.__value_.__l.__size_ = v170 + 16;
        v313.__r_.__value_.__s.__data_[16] = 0;
        *v182 = 0;
        v182[1] = v175;
        v289 = v182;
        v183 = (std::string *)(v182 + 2);
        if (*((char *)v284 + 39) < 0)
        {
          std::string::__init_copy_ctor_external(v183, (const std::string::value_type *)v284[2], (std::string::size_type)v284[3]);
        }
        else
        {
          v184 = *v167;
          v183->__r_.__value_.__r.__words[2] = *((_QWORD *)v167 + 2);
          *(_OWORD *)&v183->__r_.__value_.__l.__data_ = v184;
        }
        v185 = v289;
        *(_OWORD *)(v289 + 9) = 0u;
        *(_OWORD *)(v289 + 7) = 0u;
        *(_OWORD *)(v289 + 5) = 0u;
        v313.__r_.__value_.__s.__data_[16] = 1;
        v186 = (float)(unint64_t)(*(_QWORD *)(v170 + 24) + 1);
        v187 = *(float *)(v170 + 32);
        if (!v176 || (float)(v187 * (float)v176) < v186)
        {
          v188 = (v176 & (v176 - 1)) != 0;
          if (v176 < 3)
            v188 = 1;
          v189 = v188 | (2 * v176);
          v190 = vcvtps_u32_f32(v186 / v187);
          if (v189 <= v190)
            v191 = v190;
          else
            v191 = v189;
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(v170, v191);
          v176 = *(_QWORD *)(v170 + 8);
          v185 = v289;
          if ((v176 & (v176 - 1)) != 0)
          {
            if (v175 >= v176)
              v1 = v175 % v176;
            else
              v1 = v175;
          }
          else
          {
            v1 = (v176 - 1) & v175;
          }
        }
        v192 = *(_QWORD **)(*(_QWORD *)v170 + 8 * v1);
        if (v192)
          break;
        *v185 = *(_QWORD *)(v170 + 16);
        *(_QWORD *)(v170 + 16) = v185;
        *(_QWORD *)(*(_QWORD *)v170 + 8 * v1) = v170 + 16;
        if (*v185)
        {
          v193 = *(_QWORD *)(*v185 + 8);
          if ((v176 & (v176 - 1)) != 0)
          {
            if (v193 >= v176)
              v193 %= v176;
          }
          else
          {
            v193 &= v176 - 1;
          }
          v192 = (_QWORD *)(*(_QWORD *)v170 + 8 * v193);
          goto LABEL_279;
        }
LABEL_280:
        v313.__r_.__value_.__r.__words[0] = 0;
        ++*(_QWORD *)(v170 + 24);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,BinaryInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,BinaryInfo>,void *>>>>::reset[abi:nn180100]((uint64_t)&v313);
LABEL_281:
        v289[10] = v308;
        v194 = TargetBlocks[1] - *TargetBlocks;
        v195 = v194 >> 7;
        v196 = v289[7];
        v197 = v289[8];
        v198 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v197 - v196) >> 3);
        v1 = (v194 >> 7) - v198;
        if (v194 >> 7 <= v198)
        {
          if (v194 >> 7 < v198)
          {
            v215 = v196 + 56 * v195;
            if (v197 != v215)
            {
              v1 = v289[8];
              do
              {
                v217 = *(void **)(v1 - 56);
                v1 -= 56;
                v216 = v217;
                if (v217)
                {
                  *(_QWORD *)(v197 - 48) = v216;
                  operator delete(v216);
                }
                v197 = v1;
              }
              while (v1 != v215);
            }
            v289[8] = v215;
          }
          goto LABEL_310;
        }
        v199 = v289[9];
        if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v199 - v197) >> 3) >= v1)
        {
          bzero((void *)v289[8], 56 * ((56 * v1 - 56) / 0x38) + 56);
          v289[8] = v197 + 56 * ((56 * v1 - 56) / 0x38) + 56;
        }
        else
        {
          if (v194 < 0)
            abort();
          v200 = 0x6DB6DB6DB6DB6DB7 * ((v199 - v196) >> 3);
          if (2 * v200 > v195)
            v195 = 2 * v200;
          if (v200 >= 0x249249249249249)
            v195 = 0x492492492492492;
          if (v195 > 0x492492492492492)
LABEL_375:
            std::__throw_bad_array_new_length[abi:nn180100]();
          v201 = 56 * v195;
          v202 = (char *)operator new(56 * v195);
          v203 = &v202[56 * v198];
          v204 = &v202[v201];
          bzero(v203, 56 * ((56 * v1 - 56) / 0x38) + 56);
          v205 = &v203[56 * ((56 * v1 - 56) / 0x38) + 56];
          v207 = (char *)v289[7];
          v206 = (char *)v289[8];
          if (v206 != v207)
          {
            v208 = 0;
            do
            {
              v209 = &v203[v208];
              v210 = &v206[v208];
              *((_QWORD *)v209 - 7) = 0;
              *((_QWORD *)v209 - 6) = 0;
              *((_QWORD *)v209 - 5) = 0;
              *(_OWORD *)(v209 - 56) = *(_OWORD *)&v206[v208 - 56];
              *((_QWORD *)v209 - 5) = *(_QWORD *)&v206[v208 - 40];
              *((_QWORD *)v210 - 7) = 0;
              *((_QWORD *)v210 - 6) = 0;
              *((_QWORD *)v210 - 5) = 0;
              v211 = *(_OWORD *)&v206[v208 - 16];
              *((_OWORD *)v209 - 2) = *(_OWORD *)&v206[v208 - 32];
              *((_OWORD *)v209 - 1) = v211;
              v208 -= 56;
            }
            while (&v206[v208] != v207);
            v1 = v289[7];
            v206 = (char *)v289[8];
            v289[7] = &v203[v208];
            v289[8] = v205;
            v289[9] = v204;
            if (v206 != (char *)v1)
            {
              v212 = v206;
              do
              {
                v214 = (void *)*((_QWORD *)v212 - 7);
                v212 -= 56;
                v213 = v214;
                if (v214)
                {
                  *((_QWORD *)v206 - 6) = v213;
                  operator delete(v213);
                }
                v206 = v212;
              }
              while (v212 != (char *)v1);
              v206 = (char *)v1;
            }
            if (!v206)
              goto LABEL_310;
LABEL_309:
            operator delete(v206);
            goto LABEL_310;
          }
          v289[7] = v203;
          v289[8] = v205;
          v289[9] = v204;
          if (v206)
            goto LABEL_309;
        }
LABEL_310:
        v218 = *TargetBlocks;
        v287 = TargetBlocks[1];
        if (*TargetBlocks != v287)
        {
          v219 = 0;
          do
          {
            v220 = v219;
            v221 = v289[7];
            v222 = (char **)(v221 + 56 * v219);
            v304 = v222;
            if (objc_msgSend(*(id *)(v2 + 32), "dumpInstructions", v279))
            {
              v223 = *(_DWORD *)(v218 + 80);
              v224 = v221 + 56 * v220;
              *(_DWORD *)(v224 + 24) = v223;
              v1 = v224 + 24;
              v225 = *(_DWORD *)(v218 + 84);
              *(_DWORD *)(v1 + 4) = v225;
              v226 = (v225 - v223 + 1);
              v228 = *v222;
              v227 = v222[1];
              v229 = 0xAAAAAAAAAAAAAAABLL * ((v227 - *v222) >> 3);
              v230 = v226 - v229;
              if (v226 <= v229)
              {
                if (v226 < v229)
                  v222[1] = &v228[24 * v226];
              }
              else
              {
                v231 = v222[2];
                if (0xAAAAAAAAAAAAAAABLL * ((v231 - v227) >> 3) >= v230)
                {
                  v243 = &v227[24 * v230];
                  do
                  {
                    *(_QWORD *)v227 = 0;
                    *(_OWORD *)(v227 + 8) = xmmword_4AA510;
                    v227 += 24;
                  }
                  while (v227 != v243);
                  v222[1] = v243;
                }
                else
                {
                  v232 = 0xAAAAAAAAAAAAAAABLL * ((v231 - v228) >> 3);
                  v233 = 2 * v232;
                  if (2 * v232 <= v226)
                    v233 = v226;
                  if (v232 >= 0x555555555555555)
                    v234 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v234 = v233;
                  if (v234 > 0xAAAAAAAAAAAAAAALL)
                    goto LABEL_375;
                  v235 = (char *)operator new(24 * v234);
                  v236 = &v235[24 * v229];
                  v237 = &v235[24 * v226];
                  v238 = v236;
                  do
                  {
                    *(_QWORD *)v238 = 0;
                    *(_OWORD *)(v238 + 8) = xmmword_4AA510;
                    v238 += 24;
                  }
                  while (v238 != v237);
                  v240 = *v304;
                  v239 = v304[1];
                  if (v239 == *v304)
                  {
                    v242 = v304;
                  }
                  else
                  {
                    do
                    {
                      v241 = *(_OWORD *)(v239 - 24);
                      *((_QWORD *)v236 - 1) = *((_QWORD *)v239 - 1);
                      *(_OWORD *)(v236 - 24) = v241;
                      v236 -= 24;
                      v239 -= 24;
                    }
                    while (v239 != v240);
                    v242 = v304;
                    v239 = *v304;
                  }
                  *v242 = v236;
                  v242[1] = v237;
                  v242[2] = &v235[24 * v234];
                  v222 = v242;
                  if (v239)
                    operator delete(v239);
                }
              }
              v244 = *(_QWORD **)(v218 + 56);
              if (v244)
              {
                v245 = *(_DWORD *)v1;
                v246 = *(_DWORD *)(v1 + 4);
                do
                {
                  if (v245 <= v246)
                  {
                    v247 = (int *)v244[3];
                    v248 = *v222;
                    v249 = v245;
                    do
                    {
                      v250 = *v247++;
                      *(_DWORD *)v248 += v250;
                      v248 += 24;
                      ++v249;
                    }
                    while (v249 <= v246);
                  }
                  v244 = (_QWORD *)*v244;
                }
                while (v244);
              }
              v251 = (int *)v222[1];
              if (*v222 == (char *)v251)
              {
                v252 = 0;
              }
              else
              {
                v252 = 0;
                v253 = (int *)*v222;
                do
                {
                  v254 = *v253;
                  v253 += 6;
                  v252 += v254;
                }
                while (v253 != v251);
              }
              *(_DWORD *)(v221 + 56 * v220 + 32) = v252 / (0xAAAAAAAAAAAAAAABLL * (((char *)v251 - *v222) >> 3));
            }
            v291 = v220;
            v255 = *(_QWORD *)(v218 + 16);
            if (v255)
            {
              do
              {
                v295 = (uint64_t *)v255;
                v256 = *(_QWORD *)*v293
                     + 88 * *(_QWORD *)(*((_QWORD *)*v293 + 3) + 48 * *(unsigned int *)(v255 + 16));
                v257 = *(_QWORD *)(v256 + 40);
                if (v257)
                {
                  v299 = v256 + 24;
                  do
                  {
                    v302 = (uint64_t *)v257;
                    LODWORD(v313.__r_.__value_.__l.__data_) = *(_DWORD *)(v257 + 16);
                    data = v313.__r_.__value_.__l.__data_;
                    v259 = std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v299, v313.__r_.__value_.__l.__data_, &v313);
                    v260 = (unint64_t *)*((_QWORD *)v259 + 4);
                    for (k = (unint64_t *)*((_QWORD *)v259 + 5); v260 != k; v2 = a1)
                    {
                      v261 = *v260;
                      v262 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 48)
                                       + 24 * *(unsigned int *)(v2 + 212))
                           + 32 * *v260;
                      v263 = *(_DWORD **)(v262 + 8);
                      v1 = *(_QWORD *)(v262 + 16);
                      while (v263 != (_DWORD *)v1)
                      {
                        v264 = v263[2];
                        v265 = *((_QWORD *)v169 + 17);
                        if (v264 < (*((_QWORD *)v169 + 18) - v265) >> 2)
                        {
                          v266 = *(unsigned int *)(v218 + 80);
                          if (v261 >= v266 && v261 <= *(unsigned int *)(v218 + 84))
                          {
                            v268 = *(_DWORD *)(v265 + 4 * v264);
                            v269 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((_QWORD *)(v218 + 40), data);
                            if (v269)
                            {
                              v270 = (v268 - v266);
                              v271 = v269[3];
                              if (v270 < (v269[4] - v271) >> 2)
                              {
                                v272 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>((_QWORD *)(v218 + 88), data);
                                if (v272)
                                {
                                  LODWORD(v273) = *((_DWORD *)v272 + 5);
                                  LODWORD(v274) = *(_DWORD *)(v271 + 4 * v270);
                                  *(double *)&v275 = (double)v274;
                                  v276 = (double)v273 / *(double *)&v275;
                                  LODWORD(v275) = v263[1];
                                  v263[1] = (v276 * (double)v275);
                                  if (objc_msgSend(*(id *)(a1 + 32), "dumpInstructions"))
                                  {
                                    LODWORD(v277) = v263[4];
                                    v278.i64[0] = v263[3];
                                    v278.i64[1] = v263[1];
                                    *(float64x2_t *)&(*v304)[24 * v270 + 8] = vaddq_f64(*(float64x2_t *)&(*v304)[24 * v270 + 8], vdivq_f64(vcvtq_f64_u64(v278), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v277), 0)));
                                  }
                                }
                              }
                            }
                          }
                        }
                        v263 += 5;
                      }
                      ++v260;
                    }
                    v257 = *v302;
                  }
                  while (*v302);
                }
                v255 = *v295;
              }
              while (*v295);
            }
            v219 = v291 + 1;
            v218 += 128;
          }
          while (v218 != v287);
        }
        v163 = *v284;
        if (!*v284)
          return;
      }
      *v185 = *v192;
LABEL_279:
      *v192 = v185;
      goto LABEL_280;
    }
  }
}

- (void)generateTargetSamplesForResult:(uint64_t)a3 withProgramAddressLUT:(char)a4 withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:
{
  unsigned int *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int *v15;
  int *v16;
  __int128 v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  BOOL v26;
  unsigned int *v27;
  unsigned int v28;
  _BOOL4 v29;
  unsigned int v30;
  BOOL v31;
  unint64_t v32;
  __int128 v33;
  unsigned int v34;
  BOOL v35;
  unsigned int v36;
  _BOOL4 v37;
  __int128 v38;
  BOOL v39;
  unsigned int v40;
  BOOL v41;
  unsigned int v42;
  BOOL v43;
  unsigned int *v44;
  unsigned int v45;
  _BOOL4 v46;
  _BOOL4 v47;
  unsigned int *v48;
  unsigned int v49;
  BOOL v50;
  int v51;
  __int128 v52;
  unsigned int v53;
  _BOOL4 v54;
  unsigned int v55;
  BOOL v56;
  __int128 v57;
  unsigned int v58;
  _BOOL4 v59;
  __int128 v60;
  _OWORD *v61;
  _OWORD *v62;
  _OWORD *v63;
  unsigned int v64;
  unsigned int v65;
  _BOOL4 v66;
  __int128 v67;
  unsigned int v68;
  unsigned int v69;
  _BOOL4 v70;
  unsigned int v71;
  unsigned int v72;
  _BOOL4 v73;
  unsigned int v74;
  _BOOL4 v75;
  unsigned int *v76;
  BOOL v77;
  char v78;
  uint64_t v79;
  unint64_t v80;
  unsigned int *v81;
  unsigned int v82;
  unsigned int v83;
  _BOOL4 v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  BOOL v89;
  BOOL v90;
  uint64_t v91;
  int64_t v92;
  int64_t v93;
  int64_t v94;
  uint64_t v95;
  unint64_t v96;
  unsigned int v97;
  _BOOL4 v98;
  unint64_t v99;
  unsigned int v100;
  unsigned int v101;
  BOOL v102;
  int v103;
  _OWORD *v104;
  __int128 v105;
  uint64_t v106;
  unsigned int v107;
  unsigned int v108;
  _BOOL4 v109;
  _BOOL4 v110;
  _BOOL4 v111;
  int64_t v112;
  uint64_t v113;
  _OWORD *v114;
  uint64_t v115;
  unsigned int *v116;
  uint64_t v117;
  uint64_t v118;
  unsigned int v119;
  _BOOL4 v120;
  _BOOL4 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unsigned int v127;
  unsigned int v128;
  _BOOL4 v129;
  unsigned int v130;
  unsigned int *v131;
  __int128 v132;
  BOOL v133;
  uint64_t v135;
  unsigned int v136;
  unsigned int v137;
  _BOOL4 v138;
  int v139;
  uint64_t v140;
  unsigned int v141;
  unsigned int v142;
  BOOL v143;
  BOOL v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[28];
  _BYTE v149[28];
  _BYTE v150[28];
  _BYTE v151[28];
  _BYTE v152[28];
  _BYTE v153[28];
  _BYTE v154[28];
  _BYTE v155[28];
  __int128 v156;
  __int128 v157;
  _BYTE v158[28];
  __int128 v159;

- (uint64_t)adjustHWBiasAndFinalizeResult
{
  uint64_t *v2;
  _QWORD v3[5];

  if (0xAAAAAAAAAAAAAAABLL * ((result[2] - *result) >> 4) < a2)
  {
    if (a2 >= 0x555555555555556)
      abort();
    v2 = result;
    std::__split_buffer<-[DYPMTLShaderProfilerHelper adjustHWBiasAndFinalizeResult]::ClauseInfo>::__split_buffer(v3, a2, 0xAAAAAAAAAAAAAAABLL * ((result[1] - *result) >> 4), (uint64_t)(result + 2));
    std::vector<DynamicBuffer>::__swap_out_circular_buffer(v2, v3);
    return (uint64_t *)std::__split_buffer<DynamicBuffer>::~__split_buffer((uint64_t)v3);
  }
  return result;
}

- (_QWORD)adjustHWBiasAndFinalizeResult
{
  char *v7;
  char *v8;

  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x1555555555555556)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v7 = (char *)operator new(12 * a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[12 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[12 * a2];
  return a1;
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int *v12;
  double *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  _QWORD *v26;
  _QWORD *v27;
  unsigned int *v28;
  uint64_t *v29;
  _QWORD *v30;
  id *WeakRetained;
  uint64_t v32;
  unsigned int *v33;
  _QWORD *v34;
  unsigned int v35;
  unsigned int v36;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) + 24 * *(unsigned int *)(a1 + 48);
  v3 = *(_QWORD **)v2;
  v26 = *(_QWORD **)(v2 + 8);
  if (*(_QWORD **)v2 != v26)
  {
    do
    {
      v4 = (unsigned int *)v3[3];
      v27 = v3;
      v28 = (unsigned int *)v3[4];
      if (v4 != v28)
      {
        v5 = *v3;
        v32 = v3[1] + 24;
        v34 = (_QWORD *)(*v3 + 40);
        v29 = (uint64_t *)v3[2];
        v30 = (_QWORD *)(*v3 + 88);
        do
        {
          v35 = *v4;
          v36 = *v4;
          if (v4[2])
          {
            v6 = 0;
            v33 = v4;
            do
            {
              v7 = v4[1];
              v8 = *(_QWORD *)(*((_QWORD *)std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v32, v35, &v36)+ 4)+ 8 * (v7 + v6));
              v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[21], "objectAtIndexedSubscript:", v8 & 0x1F));
              v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v8 >> 5));

              v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", HIDWORD(v8)));
              v13 = *(double **)(v11 + 48);
              v12 = *(unsigned int **)(v11 + 56);
              if (v13 != (double *)v12)
              {
                v14 = *v29;
                v15 = (v29[1] - *v29) >> 2;
                do
                {
                  v16 = *(unsigned int *)v13;
                  if (v15 > v16)
                  {
                    v17 = *(_DWORD *)(v14 + 4 * v16);
                    v18 = *(_DWORD *)(v5 + 80);
                    v19 = v17 - v18;
                    if (v17 >= v18 && v17 <= *(_DWORD *)(v5 + 84))
                    {
                      v20 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v34, v35);
                      if (v20)
                      {
                        v21 = v20[3];
                        if (v19 < (v20[4] - v21) >> 2)
                        {
                          v22 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v30, v35);
                          if (v22)
                          {
                            LODWORD(v23) = *((_DWORD *)v22 + 5);
                            LODWORD(v24) = *(_DWORD *)(v21 + 4 * v19);
                            v25 = (double)v23 / (double)v24;
                            if (v25 > 1.0)
                              v25 = 1.0 - *(double *)(v11 + 32) + v25 * *(double *)(v11 + 32);
                            if (v25 > 50.0)
                              v25 = 50.0;
                            v13[1] = v13[1] * v25;
                          }
                        }
                      }
                    }
                  }
                  v13 += 2;
                }
                while (v13 != (double *)v12);
              }

              ++v6;
              v4 = v33;
            }
            while (v6 < v33[2]);
          }
          v4 += 3;
        }
        while (v4 != v28);
      }
      v3 = v27 + 6;
    }
    while (v27 + 6 != v26);
  }

}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_2(uint64_t a1)
{
  _QWORD *i;
  uint64_t v2;
  unint64_t **v3;
  unint64_t **v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  void *v11;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  for (i = (_QWORD *)WeakRetained[4]; i; i = (_QWORD *)*i)
  {
    v2 = i[3];
    v3 = *(unint64_t ***)(v2 + 16);
    v4 = *(unint64_t ***)(v2 + 24);
    if (v3 != v4)
    {
      v5 = 0;
      do
      {
        v6 = *v3;
        v7 = v3[1];
        while (v6 != v7)
        {
          do
            v8 = __ldaxr(v6);
          while (__stlxr(v5, v6));
          v9 = atomic_load(v6);
          v5 = v9 + v8;
          ++v6;
        }
        v3 += 3;
      }
      while (v3 != v4);
      v2 = i[3];
    }
    v10 = atomic_load((unsigned int *)(v2 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 16 * v10));
    objc_msgSend(*(id *)(i[3] + 8), "setUscSamples:", v11);

  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  char **v11;
  uint64_t v12;
  uint64_t v13;
  char **i;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  uint64_t v21;
  char *v22;
  char *v23;
  __int128 v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  __int128 v49;
  char *v50;
  id WeakRetained;
  id obj;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  id v57;
  uint64_t v58;
  char **v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v1 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_DWORD *)(v1 + 40))
  {
    v2 = 0;
    v53 = v1;
    do
    {
      v56 = *(_QWORD **)(*(_QWORD *)(*((_QWORD *)WeakRetained + 25) + 24 * v2) + 8 * *(unsigned int *)(v1 + 44));
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)WeakRetained + 21), "objectAtIndexedSubscript:", v2, WeakRetained));
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", *(unsigned int *)(v1 + 44)));

      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (!v4)
        goto LABEL_58;
      v54 = v2;
      v55 = *(_QWORD *)v62;
      do
      {
        v57 = v4;
        v5 = 0;
        do
        {
          if (*(_QWORD *)v62 != v55)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v5);
          v7 = *(_DWORD *)(v6 + 16);
          v8 = (_QWORD *)(*v56 + 24 * v7);
          v9 = (char *)*v8;
          v11 = (char **)(v8 + 1);
          v10 = (char *)v8[1];
          v58 = v5;
          if ((char *)*v8 != v10)
          {
            while (*(_DWORD *)v9 != *(_DWORD *)(v6 + 20))
            {
              v9 += 16;
              if (v9 == v10)
              {
                v9 = (char *)v8[1];
                break;
              }
            }
          }
          v13 = *(_QWORD *)(v6 + 48);
          v12 = *(_QWORD *)(v6 + 56);
          if (v13 != v12)
          {
            i = (char **)(*v56 + 24 * v7 + 16);
            v59 = i;
            v60 = *(_QWORD *)(v6 + 56);
            do
            {
              if (v9 == *v11)
              {
                v16 = (char *)*v8;
                v17 = (uint64_t)&v9[-*v8];
                v18 = v17 >> 4;
                v15 = (char *)(*v8 + (v17 & 0xFFFFFFFFFFFFFFF0));
                v19 = *i;
                if (v9 >= *i)
                {
                  v25 = v8;
                  v26 = v6;
                  v27 = v18 + 1;
                  if ((unint64_t)(v18 + 1) >> 60)
                    abort();
                  v28 = v19 - v16;
                  v29 = (v19 - v16) >> 3;
                  if (v29 <= v27)
                    v29 = v18 + 1;
                  if (v28 >= 0x7FFFFFFFFFFFFFF0)
                    v30 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v30 = v29;
                  if (v30)
                  {
                    v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v30);
                  }
                  else
                  {
                    v32 = 0;
                    v31 = 0;
                  }
                  v36 = &v32[16 * v18];
                  v37 = &v32[16 * v31];
                  if (v18 == v31)
                  {
                    if ((uint64_t)(v17 & 0xFFFFFFFFFFFFFFF0) < 1)
                    {
                      if ((unint64_t)v17 < 0x10)
                        v39 = 1;
                      else
                        v39 = (v17 >> 3) & 0xFFFFFFFFFFFFFFFELL;
                      v40 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v39);
                      v36 = &v40[16 * (v39 >> 2)];
                      v37 = &v40[16 * v41];
                      if (v32)
                      {
                        v42 = &v40[16 * v41];
                        operator delete(v32);
                        v37 = v42;
                      }
                    }
                    else
                    {
                      if (v27 >= 0)
                        v38 = v18 + 1;
                      else
                        v38 = v18 + 2;
                      v36 -= 16 * (v38 >> 1);
                    }
                  }
                  v6 = v26;
                  *(_DWORD *)v36 = *(_DWORD *)(v26 + 20);
                  *((_QWORD *)v36 + 1) = *(_QWORD *)(v13 + 8);
                  v8 = v25;
                  v43 = (char *)*v25;
                  v44 = v36;
                  if ((char *)*v25 != v15)
                  {
                    v45 = v15;
                    v46 = v36;
                    do
                    {
                      v44 = v46 - 16;
                      *((_OWORD *)v46 - 1) = *((_OWORD *)v45 - 1);
                      v45 -= 16;
                      v46 -= 16;
                    }
                    while (v45 != v43);
                  }
                  v47 = v36 + 16;
                  v48 = *v11;
                  for (i = v59; v15 != v48; v47 += 16)
                  {
                    v49 = *(_OWORD *)v15;
                    v15 += 16;
                    *(_OWORD *)v47 = v49;
                  }
                  v50 = (char *)*v8;
                  *v8 = v44;
                  *v11 = v47;
                  *v59 = v37;
                  if (v50)
                    operator delete(v50);
                  v15 = v36;
                  v12 = v60;
                  goto LABEL_55;
                }
                v20 = *(_DWORD *)(v6 + 20);
                if (v15 != v9)
                {
                  v21 = *(_QWORD *)(v13 + 8);
                  v22 = v9 - 16;
                  v23 = v9;
                  while (v22 < v9)
                  {
                    v24 = *(_OWORD *)v22;
                    v22 += 16;
                    *(_OWORD *)v23 = v24;
                    v23 += 16;
                  }
                  *v11 = v23;
                  if (v9 != v15 + 16)
                  {
                    v33 = (v9 - (v15 + 16)) >> 4;
                    v34 = v9 - 8;
                    v35 = 16 * v33;
                    do
                    {
                      *((_DWORD *)v34 - 2) = *(_DWORD *)&v15[v35 - 16];
                      *(_QWORD *)v34 = *(_QWORD *)&v15[v35 - 8];
                      v34 -= 16;
                      v35 -= 16;
                    }
                    while (v35);
                  }
                  *(_DWORD *)v15 = v20;
                  *(_QWORD *)&v16[16 * v18 + 8] = v21;
                  goto LABEL_55;
                }
                *(_DWORD *)v9 = v20;
                *(_QWORD *)&v16[16 * v18 + 8] = *(_QWORD *)(v13 + 8);
                *v11 = v9 + 16;
              }
              else
              {
                *((double *)v9 + 1) = *(double *)(v13 + 8) + *((double *)v9 + 1);
              }
              v15 = v9;
LABEL_55:
              v13 += 16;
              v9 = v15;
            }
            while (v13 != v12);
          }
          v5 = v58 + 1;
          v1 = v53;
          v2 = v54;
        }
        while ((id)(v58 + 1) != v57);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v4);
LABEL_58:

      ++v2;
    }
    while (v2 < *(unsigned int *)(v1 + 40));
  }

}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_calculateAverageGPUCommandDuration");

}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_calculateAggregatedEffectiveGPUEncoderCost");

}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_calculateEffectiveGPUEncoderCostForFrameIndex:", *(unsigned int *)(a1 + 40));

}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_7(uint64_t a1)
{
  unint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  id *WeakRetained;
  _QWORD v20[4];
  id v21[4];

  v17 = std::thread::hardware_concurrency();
  v2 = v17 >> 1;
  v18 = a1;
  v3 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = 0;
  v16 = v2 - 1;
  if (v2 <= 1)
    v5 = 1;
  else
    v5 = v17 >> 1;
  v15 = v5;
  while (v4 < objc_msgSend(WeakRetained[21], "count", v15))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[21], "objectAtIndexedSubscript:", v4));
    v7 = (unint64_t)objc_msgSend(v6, "count");

    if (v17 >= 2)
    {
      v8 = 0;
      v9 = v15;
      v10 = (v16 + v7) / (v17 >> 1);
      do
      {
        v11 = v8 + 1;
        v12 = v8 * v10;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        if (v7 >= (v8 + 1) * v10)
          v13 = (v8 + 1) * v10;
        else
          v13 = v7;
        v20[2] = __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_8;
        v20[3] = &unk_725BF8;
        objc_copyWeak(v21, v3);
        v21[1] = (id)v12;
        v21[2] = (id)v13;
        v21[3] = v4;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v20));
        objc_msgSend(WeakRetained[92], "addOperation:", v14);
        objc_msgSend(*(id *)(v18 + 32), "addDependency:", v14);

        objc_destroyWeak(v21);
        v8 = v11;
        --v9;
      }
      while (v9);
    }
    ++v4;
  }

}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_8(uint64_t a1)
{
  unint64_t i;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id *WeakRetained;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  for (i = *(_QWORD *)(a1 + 40); i < *(_QWORD *)(a1 + 48); ++i)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[21], "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56)));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", i));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v7);
          v9 = v8[1];
          if (v9)
          {
            v10 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(v9 + 16) + 24 * *(_QWORD *)(a1 + 56)) + 8 * i);
            v11 = (uint64_t)(v8[7] - v8[6]) >> 4;
            do
              v12 = __ldaxr(v10);
            while (__stlxr(v12 + v11, v10));
            v13 = v8[6];
            v14 = v8[7];
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v8[1] + 8), "uscSamples"));
            objc_msgSend(v15, "replaceBytesInRange:withBytes:", 16 * v12, v14 - v13, v8[6]);

          }
          v7 = (char *)v7 + 1;
        }
        while (v7 != v5);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v5);
    }

  }
}

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke(uint64_t a1)
{
  NSString *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  _DWORD *v27;
  void **v28;
  unint64_t v29;
  uint64_t v30;
  void **v31;
  unint64_t v32;
  uint64_t v33;
  void **v34;
  unint64_t v35;
  uint64_t v36;
  void **v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  char v46;
  unsigned int v47;
  int v48;
  BOOL v49;
  int *v50;
  unsigned int *i;
  unsigned int v52;
  BOOL v53;
  unsigned int v54;
  unsigned int v55;
  unint64_t *v56;
  unint64_t v57;
  void **v58;
  unint64_t v59;
  _QWORD *v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  __int128 v70;
  __int128 v71;
  char *v72;
  char *v73;
  unint64_t v74;
  __int128 v75;
  __int128 v76;
  void **v77;
  char *v78;
  void **v79;
  char *v80;
  __int128 v81;
  __int128 v82;
  void *v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  __int128 v90;
  __int128 v91;
  char *v92;
  char *v93;
  unint64_t v94;
  __int128 v95;
  __int128 v96;
  id WeakRetained;
  unsigned int v98;
  FILE *v99;
  unint64_t v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  _OWORD v106[6];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  int v116;
  int v117;
  _OWORD v118[3];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _OWORD v122[2];
  int v123;
  __int128 v124;
  __int128 v125;
  float v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  unint64_t v130;
  float v131;
  uint64_t v132;
  BOOL v133;
  unsigned int v134;
  int v135;
  int v136;
  int v137;
  _DWORD v138[8];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 32), "dumpInstructions"))
  {
    v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/evaluateStreamingSamples_%lu.txt"), *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)WeakRetained + 496, *(_DWORD *)(a1 + 120), (_DWORD *)(a1 + 120))+ 5), *(unsigned int *)(a1 + 124), *(_QWORD *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByDeletingLastPathComponent"));
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

    v6 = objc_retainAutorelease(v3);
    v99 = fopen((const char *)objc_msgSend(v6, "UTF8String"), "wt");

  }
  else
  {
    v99 = 0;
  }
  v7 = *(_DWORD *)(a1 + 128);
  memset(v106, 0, sizeof(v106));
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  memset(v118, 0, sizeof(v118));
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  memset(v122, 0, sizeof(v122));
  v124 = 0u;
  v125 = 0u;
  v126 = 1.0;
  v130 = 0;
  v128 = 0u;
  v129 = 0u;
  v127 = 0u;
  v131 = 1.0;
  v133 = v7 < 2;
  v123 = 1050253722;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v122, 0x36uLL);
  if (*((_QWORD *)&v124 + 1))
    v8 = (float)*((unint64_t *)&v125 + 1) / (float)*((unint64_t *)&v124 + 1);
  else
    v8 = 0.0;
  v126 = fmaxf(v8, 0.3);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v124, vcvtps_u32_f32(16.0 / v126));
  std::vector<ShaderProfilerUSCSampleInfo>::reserve((void **)v118, 0x10uLL);
  if ((_QWORD)v129)
    v9 = (float)v130 / (float)(unint64_t)v129;
  else
    v9 = 0.0;
  v131 = fmaxf(v9, 0.3);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v128 + 8, vcvtps_u32_f32(18.0 / v131));
  std::vector<std::vector<ProfileEvent>>::resize((uint64_t)&v127);
  std::vector<ShaderProfilerUSCSampleInfo>::reserve((void **)&v118[1] + 1, 0x10uLL);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  v12 = (unsigned int *)(v11 + 8 * v10);
  v13 = *v12;
  if (*v12 < v12[1])
  {
    while (1)
    {
      v14 = *(_QWORD *)(a1 + 104);
      v103 = v14;
      v15 = *(_QWORD *)(v14 + 8 * v13);
      if ((_DWORD)v15 == -1
        || (v16 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(*(_QWORD **)(a1 + 112), *(_QWORD *)(v14 + 8 * v13))) == 0)
      {
        v17 = -1;
      }
      else
      {
        v17 = *((_DWORD *)v16 + 5);
      }
      v101 = v17;
      v18 = v13 + 1;
      v19 = (v15 >> 30) & 0x1FC;
      v20 = *(_DWORD *)(v11 + 8 * v10 + 4);
      v98 = v19 + v13 + 1;
      if (v98 >= v20)
        goto LABEL_127;
      if ((_DWORD)v19 && (v15 & 0x7F00000000) != 0)
        break;
LABEL_126:
      v13 = v98;
      if (v98 >= v20)
        goto LABEL_127;
    }
    v22 = 0;
    v100 = v15 >> 39;
    v102 = v13;
LABEL_21:
    v104 = v22;
    v23 = 0;
    v24 = *(_QWORD *)(a1 + 104);
    v25 = v18;
    do
    {
      v26 = v24 + 8 * v25;
      v27 = &v138[v23];
      *v27 = *(_QWORD *)v26;
      v27[1] = *(_DWORD *)(v26 + 4);
      v23 += 2;
      ++v25;
    }
    while (v23 != 8);
    if ((v138[0] & 0xF) != 1)
      goto LABEL_124;
    v116 = v101;
    v117 = v100;
    v132 = 0x1FFFFFFFFLL;
    v28 = (void **)*((_QWORD *)&v110 + 1);
    *((_QWORD *)&v112 + 1) = 0;
    v29 = v111 - *((_QWORD *)&v110 + 1);
    if ((_QWORD)v111 - *((_QWORD *)&v110 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v28);
        v28 = (void **)(*((_QWORD *)&v110 + 1) + 8);
        *((_QWORD *)&v110 + 1) = v28;
        v29 = v111 - (_QWORD)v28;
      }
      while ((_QWORD)v111 - (_QWORD)v28 > 0x10uLL);
    }
    if (v29 >> 3 == 1)
    {
      v30 = 512;
    }
    else
    {
      if (v29 >> 3 != 2)
        goto LABEL_31;
      v30 = 1024;
    }
    *(_QWORD *)&v112 = v30;
LABEL_31:
    v31 = (void **)*((_QWORD *)&v113 + 1);
    *((_QWORD *)&v115 + 1) = 0;
    v32 = v114 - *((_QWORD *)&v113 + 1);
    if ((_QWORD)v114 - *((_QWORD *)&v113 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v31);
        v31 = (void **)(*((_QWORD *)&v113 + 1) + 8);
        *((_QWORD *)&v113 + 1) = v31;
        v32 = v114 - (_QWORD)v31;
      }
      while ((_QWORD)v114 - (_QWORD)v31 > 0x10uLL);
    }
    if (v32 >> 3 == 1)
    {
      v33 = 512;
    }
    else
    {
      if (v32 >> 3 != 2)
        goto LABEL_38;
      v33 = 1024;
    }
    *(_QWORD *)&v115 = v33;
LABEL_38:
    v34 = (void **)*((_QWORD *)&v119 + 1);
    *((_QWORD *)&v121 + 1) = 0;
    v35 = v120 - *((_QWORD *)&v119 + 1);
    if ((_QWORD)v120 - *((_QWORD *)&v119 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v34);
        v34 = (void **)(*((_QWORD *)&v119 + 1) + 8);
        *((_QWORD *)&v119 + 1) = v34;
        v35 = v120 - (_QWORD)v34;
      }
      while ((_QWORD)v120 - (_QWORD)v34 > 0x10uLL);
    }
    if (v35 >> 3 == 1)
    {
      v36 = 256;
    }
    else
    {
      if (v35 >> 3 != 2)
        goto LABEL_45;
      v36 = 512;
    }
    *(_QWORD *)&v121 = v36;
LABEL_45:
    v37 = (void **)*((_QWORD *)&v107 + 1);
    *((_QWORD *)&v109 + 1) = 0;
    v38 = v108 - *((_QWORD *)&v107 + 1);
    if ((_QWORD)v108 - *((_QWORD *)&v107 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v37);
        v37 = (void **)(*((_QWORD *)&v107 + 1) + 8);
        *((_QWORD *)&v107 + 1) = v37;
        v38 = v108 - (_QWORD)v37;
      }
      while ((_QWORD)v108 - (_QWORD)v37 > 0x10uLL);
    }
    if (v38 >> 3 == 1)
    {
      v39 = 256;
    }
    else
    {
      if (v38 >> 3 != 2)
      {
LABEL_52:
        v40 = *((_QWORD *)&v127 + 1);
        v41 = v127;
        if (*((_QWORD *)&v127 + 1) != (_QWORD)v127)
        {
          v42 = *((_QWORD *)&v127 + 1);
          do
          {
            v44 = *(void **)(v42 - 24);
            v42 -= 24;
            v43 = v44;
            if (v44)
            {
              *(_QWORD *)(v40 - 16) = v43;
              operator delete(v43);
            }
            v40 = v42;
          }
          while (v42 != v41);
        }
        *((_QWORD *)&v127 + 1) = v41;
        std::vector<std::vector<ProfileEvent>>::resize((uint64_t)&v127);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(v122);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(&v124);
        *((_QWORD *)&v118[0] + 1) = *(_QWORD *)&v118[0];
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear((_QWORD *)&v128 + 1);
        v45 = 0;
        v105 = 0;
        v46 = 1;
        while (1)
        {
          v47 = v138[v45];
          if ((v47 & 1) != 0)
          {
            if (v45)
            {
              if (v133)
                ProfileEventHelper::ProcessQueueLegacy((ProfileEventHelper *)&v105);
              else
                ProfileEventHelper::ProcessQueue((ProfileEventHelper *)&v105);
              if (v45 == 7)
              {
LABEL_75:
                if (v133)
                  ProfileEventHelper::ProcessQueueLegacy((ProfileEventHelper *)&v105);
                else
                  ProfileEventHelper::ProcessQueue((ProfileEventHelper *)&v105);
                if (objc_msgSend(*(id *)(a1 + 32), "dumpInstructions"))
                  objc_msgSend(*(id *)(a1 + 32), "_dumpTraceBufferPacketsInFile:usingTracePackets:withExtractedSamples:withTraceBufferCount:forTargetIndex:", v99, v138, v118, ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned int *)(a1 + 128));
                v50 = (int *)*((_QWORD *)&v118[0] + 1);
                for (i = *(unsigned int **)&v118[0]; i != (unsigned int *)v50; i += 10)
                {
                  v52 = *i;
                  v53 = *i != -1 || i[3] == -1;
                  if (v53
                    && v52 <= *(_DWORD *)(a1 + 132)
                    && (v54 = *(_DWORD *)(a1 + 136), v49 = v52 >= v54, v55 = v52 - v54, v49))
                  {
                    v77 = (void **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48)
                                              + 24 * *(_QWORD *)(a1 + 72))
                                  + 24 * v55);
                    v79 = v77 + 1;
                    v78 = (char *)v77[1];
                    v80 = (char *)v77[2];
                    if (v78 >= v80)
                    {
                      v84 = 0xCCCCCCCCCCCCCCCDLL * ((v78 - (_BYTE *)*v77) >> 3);
                      v85 = v84 + 1;
                      if (v84 + 1 > 0x666666666666666)
LABEL_130:
                        abort();
                      v86 = 0xCCCCCCCCCCCCCCCDLL * ((v80 - (_BYTE *)*v77) >> 3);
                      if (2 * v86 > v85)
                        v85 = 2 * v86;
                      if (v86 >= 0x333333333333333)
                        v87 = 0x666666666666666;
                      else
                        v87 = v85;
                      if (v87)
                        v87 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v87);
                      else
                        v88 = 0;
                      v89 = v87 + 40 * v84;
                      v90 = *(_OWORD *)i;
                      v91 = *((_OWORD *)i + 1);
                      *(_QWORD *)(v89 + 32) = *((_QWORD *)i + 4);
                      *(_OWORD *)v89 = v90;
                      *(_OWORD *)(v89 + 16) = v91;
                      v92 = (char *)*v79;
                      v93 = (char *)*v77;
                      v94 = v89;
                      if (*v79 != *v77)
                      {
                        do
                        {
                          v95 = *(_OWORD *)(v92 - 40);
                          v96 = *(_OWORD *)(v92 - 24);
                          *(_QWORD *)(v94 - 8) = *((_QWORD *)v92 - 1);
                          *(_OWORD *)(v94 - 24) = v96;
                          *(_OWORD *)(v94 - 40) = v95;
                          v94 -= 40;
                          v92 -= 40;
                        }
                        while (v92 != v93);
                        v92 = (char *)*v77;
                      }
                      *v77 = (void *)v94;
                      v83 = (void *)(v89 + 40);
                      *v79 = (void *)(v89 + 40);
                      v77[2] = (void *)(v87 + 40 * v88);
                      if (v92)
                        operator delete(v92);
                    }
                    else
                    {
                      v81 = *(_OWORD *)i;
                      v82 = *((_OWORD *)i + 1);
                      *((_QWORD *)v78 + 4) = *((_QWORD *)i + 4);
                      *(_OWORD *)v78 = v81;
                      *((_OWORD *)v78 + 1) = v82;
                      v83 = v78 + 40;
                    }
                    *v79 = v83;
                  }
                  else
                  {
                    v56 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48)
                                             + 24 * *(_QWORD *)(a1 + 72));
                    v58 = (void **)(v56 + 1);
                    v57 = v56[1];
                    v60 = v56 + 2;
                    v59 = v56[2];
                    if (v57 >= v59)
                    {
                      v64 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v57 - *v56) >> 3);
                      v65 = v64 + 1;
                      if (v64 + 1 > 0x666666666666666)
                        goto LABEL_130;
                      v66 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v59 - *v56) >> 3);
                      if (2 * v66 > v65)
                        v65 = 2 * v66;
                      if (v66 >= 0x333333333333333)
                        v67 = 0x666666666666666;
                      else
                        v67 = v65;
                      if (v67)
                        v67 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v67);
                      else
                        v68 = 0;
                      v69 = v67 + 40 * v64;
                      v70 = *(_OWORD *)i;
                      v71 = *((_OWORD *)i + 1);
                      *(_QWORD *)(v69 + 32) = *((_QWORD *)i + 4);
                      *(_OWORD *)v69 = v70;
                      *(_OWORD *)(v69 + 16) = v71;
                      v72 = (char *)*v58;
                      v73 = (char *)*v56;
                      v74 = v69;
                      if (*v58 != (void *)*v56)
                      {
                        do
                        {
                          v75 = *(_OWORD *)(v72 - 40);
                          v76 = *(_OWORD *)(v72 - 24);
                          *(_QWORD *)(v74 - 8) = *((_QWORD *)v72 - 1);
                          *(_OWORD *)(v74 - 24) = v76;
                          *(_OWORD *)(v74 - 40) = v75;
                          v74 -= 40;
                          v72 -= 40;
                        }
                        while (v72 != v73);
                        v72 = (char *)*v56;
                      }
                      *v56 = v74;
                      v63 = (void *)(v69 + 40);
                      *v58 = (void *)(v69 + 40);
                      *v60 = v67 + 40 * v68;
                      if (v72)
                        operator delete(v72);
                    }
                    else
                    {
                      v61 = *(_OWORD *)i;
                      v62 = *((_OWORD *)i + 1);
                      *(_QWORD *)(v57 + 32) = *((_QWORD *)i + 4);
                      *(_OWORD *)v57 = v61;
                      *(_OWORD *)(v57 + 16) = v62;
                      v63 = (void *)(v57 + 40);
                    }
                    *v58 = v63;
                  }
                }
LABEL_124:
                v22 = v104 + 1;
                v18 += 4;
                if (v104 + 1 >= (*(_DWORD *)(v103 + 8 * v102 + 4) & 0x7Fu))
                {
                  v10 = *(_QWORD *)(a1 + 72);
                  v11 = *(_QWORD *)(a1 + 80);
                  v20 = *(_DWORD *)(v11 + 8 * v10 + 4);
                  goto LABEL_126;
                }
                goto LABEL_21;
              }
              v46 = 1;
            }
            LODWORD(v132) = v138[++v45];
          }
          else if ((v138[v45] & 3) == 2)
          {
            v136 = (v47 >> 5) & 0xFFF;
            v137 = (v47 >> 2) & 7;
            std::deque<ProfileEvent>::emplace_back<unsigned int &,unsigned int &>(v106, &v136, &v137);
            if ((v46 & 1) != 0)
            {
              if (((v47 >> 5) & 0xFFF) <= 1)
                v48 = 1;
              else
                v48 = (v47 >> 5) & 0xFFF;
              HIDWORD(v132) = v48;
            }
            v134 = v47 >> 20;
            v135 = (v47 >> 17) & 7;
            std::deque<ProfileEvent>::emplace_back<unsigned int &,unsigned int &>(v106, &v134, &v135);
            v46 = 0;
          }
          v49 = v45++ >= 7;
          if (v49)
            goto LABEL_75;
        }
      }
      v39 = 512;
    }
    *(_QWORD *)&v109 = v39;
    goto LABEL_52;
  }
LABEL_127:
  if (objc_msgSend(*(id *)(a1 + 32), "dumpInstructions"))
    fclose(v99);
  ProfileEventHelper::~ProfileEventHelper((ProfileEventHelper *)&v105);

}

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_524(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char **v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char **v9;

  if (*(_DWORD *)(a1 + 88))
  {
    v2 = 0;
    v3 = 0;
    do
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        std::vector<ShaderProfilerUSCSampleInfo>::reserve((void **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) + v2), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48)+ 24 * *(_QWORD *)(a1 + 72)+ 8)- *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48)+ 24 * *(_QWORD *)(a1 + 72))) >> 3)* *(_QWORD *)(a1 + 80));
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) + v2;
      v5 = (char **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48)
                               + 24 * *(_QWORD *)(a1 + 72))
                   + v2);
      std::vector<ShaderProfilerUSCSampleInfo>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ShaderProfilerUSCSampleInfo*>,std::__wrap_iter<ShaderProfilerUSCSampleInfo*>>(v4, *(char **)(v4 + 8), *v5, v5[1], 0xCCCCCCCCCCCCCCCDLL * ((v5[1] - *v5) >> 3));
      ++v3;
      v2 += 24;
    }
    while (v3 < *(unsigned int *)(a1 + 88));
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = v6 + 48;
  v8 = *(char **)(v6 + 56);
  v9 = (char **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48) + 24 * *(_QWORD *)(a1 + 72));
  std::vector<ShaderProfilerUSCSampleInfo>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ShaderProfilerUSCSampleInfo*>,std::__wrap_iter<ShaderProfilerUSCSampleInfo*>>(v7, v8, *v9, v9[1], 0xCCCCCCCCCCCCCCCDLL * ((v9[1] - *v9) >> 3));
}

- (void)evaluateStreamingSamples:(_QWORD *)a1 withUSCSampleNum:(unint64_t)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  char *v3;
  char *v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;

  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[2] - *a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667)
      abort();
    std::__split_buffer<-[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:]::ThreadRangeInfo>::__split_buffer(&v10, a2, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[1] - *a1) >> 3), (uint64_t)(a1 + 2));
    v4 = (char *)*a1;
    v3 = (char *)a1[1];
    v5 = v11;
    if (v3 == (char *)*a1)
    {
      v8 = (char *)a1[1];
    }
    else
    {
      do
      {
        v6 = *(_OWORD *)(v3 - 40);
        v7 = *(_OWORD *)(v3 - 24);
        *((_QWORD *)v5 - 1) = *((_QWORD *)v3 - 1);
        *(_OWORD *)(v5 - 24) = v7;
        *(_OWORD *)(v5 - 40) = v6;
        v5 -= 40;
        v3 -= 40;
      }
      while (v3 != v4);
      v8 = (char *)*a1;
      v3 = (char *)a1[1];
    }
    *a1 = v5;
    v9 = a1[2];
    *(_OWORD *)(a1 + 1) = v12;
    *(_QWORD *)&v12 = v3;
    *((_QWORD *)&v12 + 1) = v9;
    v10 = v8;
    v11 = v8;
    if (v3 != v8)
      *(_QWORD *)&v12 = &v8[(v3 - v8 - 40) % 0x28uLL];
    if (v8)
      operator delete(v8);
  }
}

- (_QWORD)evaluateStreamingSamples:(uint64_t)a3 withUSCSampleNum:(uint64_t)a4 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  char *v7;
  char *v8;

  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x666666666666667)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v7 = (char *)operator new(40 * a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[40 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[40 * a2];
  return a1;
}

- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(__int128 *)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  char *v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  char *v21;
  void *v22;
  char *v23;
  char *v24;
  char *v25;
  void *v26;

  v4 = (char *)a1[2];
  v5 = (char *)a1[1];
  if (v5 >= v4)
  {
    v9 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (_BYTE *)*a1) >> 3);
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) > 0x666666666666666)
      abort();
    v11 = 0xCCCCCCCCCCCCCCCDLL * ((v4 - (_BYTE *)*a1) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x333333333333333)
      v12 = 0x666666666666666;
    else
      v12 = v10;
    std::__split_buffer<-[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:]::ThreadRangeInfo>::__split_buffer(&v23, v12, v9, (uint64_t)(a1 + 2));
    v13 = v25;
    v14 = *a2;
    v15 = a2[1];
    *((_QWORD *)v25 + 4) = *((_QWORD *)a2 + 4);
    *(_OWORD *)v13 = v14;
    *((_OWORD *)v13 + 1) = v15;
    v16 = v24;
    v8 = v25 + 40;
    v25 += 40;
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 == *a1)
    {
      v21 = (char *)a1[1];
    }
    else
    {
      do
      {
        v19 = *(_OWORD *)(v17 - 40);
        v20 = *(_OWORD *)(v17 - 24);
        *((_QWORD *)v16 - 1) = *((_QWORD *)v17 - 1);
        *(_OWORD *)(v16 - 24) = v20;
        *(_OWORD *)(v16 - 40) = v19;
        v16 -= 40;
        v17 -= 40;
      }
      while (v17 != v18);
      v21 = (char *)*a1;
      v17 = (char *)a1[1];
      v8 = v25;
    }
    *a1 = v16;
    a1[1] = v8;
    v22 = a1[2];
    a1[2] = v26;
    v25 = v17;
    v26 = v22;
    v23 = v21;
    v24 = v21;
    if (v17 != v21)
      v25 = &v21[(v17 - v21 - 40) % 0x28uLL];
    if (v21)
      operator delete(v21);
  }
  else
  {
    v6 = *a2;
    v7 = a2[1];
    *((_QWORD *)v5 + 4) = *((_QWORD *)a2 + 4);
    *(_OWORD *)v5 = v6;
    *((_OWORD *)v5 + 1) = v7;
    v8 = v5 + 40;
  }
  a1[1] = v8;
}

uint64_t __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_532(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double *v4;
  uint64_t v5;
  unint64_t v6;
  double *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  unint64_t v14;
  double *v15;
  double v16;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(_QWORD *)(v1 + 48);
  v3 = *(_QWORD *)(v1 + 56);
  while (v2 != v3)
  {
    v4 = *(double **)v2;
    v5 = *(_QWORD *)(v2 + 8) - *(_QWORD *)v2;
    if (v5)
    {
      v6 = v5 >> 3;
      v7 = **(double ***)(result + 48);
      if (v6 <= 1)
        v6 = 1;
      do
      {
        v8 = *v4++;
        *v7 = v8 + *v7;
        ++v7;
        --v6;
      }
      while (v6);
    }
    v2 += 24;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v10 = *(_QWORD *)(v9 + 48);
  v11 = *(_QWORD *)(v9 + 56);
  while (v10 != v11)
  {
    v12 = *(double **)v10;
    v13 = *(_QWORD *)(v10 + 8) - *(_QWORD *)v10;
    if (v13)
    {
      v14 = v13 >> 3;
      v15 = **(double ***)(result + 56);
      if (v14 <= 1)
        v14 = 1;
      do
      {
        v16 = *v12++;
        *v15 = v16 + *v15;
        ++v15;
        --v14;
      }
      while (v14);
    }
    v10 += 24;
  }
  return result;
}

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_2(unint64_t a1)
{
  unint64_t v1;
  uint64_t **v2;
  uint64_t *v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  _QWORD *v7;
  unsigned int v8;
  unsigned int v9;
  _QWORD *v10;
  unint64_t v11;
  int8x8_t v12;
  uint8x8_t v13;
  unint64_t v14;
  _QWORD *i;
  unint64_t v16;
  uint64_t v17;
  _QWORD **v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t TargetClauseAnalysis;
  _QWORD *v29;
  _QWORD *v30;
  unsigned int v31;
  uint64_t v32;
  int *v33;
  int **v34;
  int *v35;
  int *v36;
  int **v37;
  double v38;
  int v40;
  double v41;
  int v42;
  int *v43;
  unint64_t v44;
  unint64_t v45;
  uint8x8_t v46;
  unint64_t v47;
  void **v48;
  float *v49;
  unint64_t v50;
  void **v51;
  unint64_t v52;
  float v53;
  float v54;
  _BOOL8 v55;
  unint64_t v56;
  unint64_t v57;
  size_t v58;
  uint64_t v59;
  float **v60;
  unint64_t v61;
  unint64_t v62;
  float v63;
  float v64;
  char *v65;
  char *v66;
  int v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  _QWORD *v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  BOOL v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t *v79;
  unint64_t v80;
  unsigned int v81;
  unsigned int v82;
  uint64_t v83;
  __int128 v84;
  double v85;
  uint64_t v86;
  int v87;
  int v88;
  unsigned int v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  _QWORD *v99;
  unsigned int v100;
  uint64_t *v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int *v106;
  int *v107;
  unsigned int v108;
  double v109;
  unsigned int v110;
  double v111;
  int v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  char *v124;
  unint64_t v125;
  uint64_t v126;
  unsigned int *v127;
  unsigned int v128;
  unint64_t *v129;
  unint64_t v130;
  double v131;
  unint64_t v132;
  double v133;
  unint64_t v134;
  double v135;
  uint64_t v136;
  int v137;
  unsigned int v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  char *v149;
  char *v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t *v156;
  int v157;
  _QWORD *v158;
  uint64_t *v159;
  float **v160;
  _QWORD *v161;
  int v162;
  uint64_t v163;
  void *v164;
  unsigned __int8 *v165;
  _QWORD *v166;
  unsigned int v167;
  _DWORD *v168;
  unint64_t v169;
  uint64_t v170;
  char *WeakRetained;
  __int128 v172;
  __int128 v173;
  int v174;
  unsigned int v175;
  unsigned int v176;
  _QWORD v177[2];
  char v178;

  v1 = a1;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 80));
  v2 = *(uint64_t ***)(v1 + 88);
  v3 = *v2;
  v156 = v2[1];
  if (*v2 != v156)
  {
    v4 = *(_DWORD *)(v1 + 168);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 48) + 40 * v4;
    v161 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 48) + 24 * v4);
    v154 = v1 + 112;
    v155 = WeakRetained + 464;
    v153 = v1 + 72;
    v152 = v1 + 64;
    v160 = (float **)(v5 + 16);
    v169 = v1;
    v163 = v5;
    while (1)
    {
      v6 = *((_DWORD *)v3 + 2);
      v176 = v6;
      v7 = std::__hash_table<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(*(_QWORD *)(v1 + 96), v6, &v176);
      v8 = *((_DWORD *)v3 + 4);
      v170 = *(_QWORD *)(v7[3] + 8 * *((unsigned int *)v3 + 3));
      v175 = v8;
      v9 = *(_DWORD *)(v1 + 172);
      if (v8 < v9)
        v9 = v8;
      v10 = (_QWORD *)(**(_QWORD **)(v1 + 104) + 40 * v9);
      v11 = *v3;
      v12 = (int8x8_t)v10[1];
      if (v12)
      {
        v13 = (uint8x8_t)vcnt_s8(v12);
        v13.i16[0] = vaddlv_u8(v13);
        if (v13.u32[0] > 1uLL)
        {
          v14 = *v3;
          if (v11 >= *(_QWORD *)&v12)
            v14 = v11 % *(_QWORD *)&v12;
        }
        else
        {
          v14 = (*(_QWORD *)&v12 - 1) & v11;
        }
        i = *(_QWORD **)(*v10 + 8 * v14);
        if (i)
        {
          for (i = (_QWORD *)*i; i; i = (_QWORD *)*i)
          {
            v16 = i[1];
            if (v16 == v11)
            {
              if (i[2] == v11)
                break;
            }
            else
            {
              if (v13.u32[0] > 1uLL)
              {
                if (v16 >= *(_QWORD *)&v12)
                  v16 %= *(_QWORD *)&v12;
              }
              else
              {
                v16 &= *(_QWORD *)&v12 - 1;
              }
              if (v16 != v14)
                goto LABEL_22;
            }
          }
        }
      }
      else
      {
LABEL_22:
        i = 0;
      }
      v17 = *((unsigned int *)v3 + 5);
      v18 = (_QWORD **)(i + 3);
      v19 = v154;
      if (!i)
        v18 = (_QWORD **)v154;
      if (v17 <= 3)
        v19 = *(_QWORD *)(**(_QWORD **)(v1 + 144) + 24 * v8) + 32 * v17;
      if (v11 == -1)
        v20 = (_QWORD **)v19;
      else
        v20 = v18;
      v166 = v20;
      v21 = *v20;
      if (v21)
        v21 = (_QWORD *)v21[1];
      v158 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "binary"));

      v157 = v17;
      v165 = v22
           ? std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]((_QWORD *)WeakRetained + 14, (uint64_t)(v166 + 1)): 0;
      v23 = *((_DWORD *)v3 + 6);
      v24 = *((_DWORD *)v3 + 7);
      v159 = v3;
      if (v23 != v24)
        break;
LABEL_36:

      v3 = v159 + 5;
      if (v159 + 5 == v156)
        goto LABEL_224;
    }
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 48) + 24 * (v6 - *(_DWORD *)(v1 + 176)));
    v168 = (_DWORD *)(v25 + 40 * v24);
    v26 = (_DWORD *)(v25 + 40 * v23);
    v27 = *((unsigned int *)v3 + 8);
    v167 = v17 - 1;
    v162 = (_DWORD)v17 << 28;
    v164 = v22;
    while (1)
    {
      if (!v22)
      {
        v40 = 0;
        v34 = 0;
        v38 = 1.0;
        goto LABEL_135;
      }
      TargetClauseAnalysis = GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(**((GPUToolsPlatformLLVMShaderProfilerHelperImpl ***)v165 + 5));
      v29 = *(_QWORD **)TargetClauseAnalysis;
      v30 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((_QWORD *)(*(_QWORD *)TargetClauseAnalysis + 56), (v26[3] - *(_DWORD *)(v170 + 8)));
      if (!v30)
        goto LABEL_194;
      v31 = *((_DWORD *)v30 + 6);
      if (v31 == -1)
        goto LABEL_194;
      v32 = *v29 + 88 * *(_QWORD *)(v29[3] + 48 * v31 + 8 * v26[8]);
      v35 = *(int **)(v32 + 64);
      v34 = (int **)(v32 + 64);
      v33 = v35;
      v37 = v34 + 1;
      v36 = v34[1];
      v38 = 1.0;
      if (v35 != v36 && (unint64_t)((char *)v36 - (char *)v33) <= 0x2F && *(_QWORD *)(v1 + 152) != 0)
      {
        v38 = 0.0;
        switch(v33[3])
        {
          case 6:
          case 7:
          case 8:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
            objc_msgSend(WeakRetained, "_latencyAdjustmentFactorWithLimiterData:forIndex:withLimiterTypeIndexMap:forLimiterType:");
            goto LABEL_55;
          case 9:
            objc_msgSend(WeakRetained, "_latencyAdjustmentFactorWithLimiterData:forIndex:withLimiterTypeIndexMap:forLimiterTypeLoad:forLimiterTypeStore:");
            goto LABEL_55;
          case 15:
            goto LABEL_53;
          case 17:
            objc_msgSend(WeakRetained, "_waitLatencyAdjustmentWithLimiterData:forIndex:withLimiterTypeIndexMap:");
            goto LABEL_55;
          case 18:
          case 19:
            break;
          default:
            v42 = v33[2];
            if (v42 == 3)
            {
LABEL_53:
              objc_msgSend(WeakRetained, "_latencyAdjustmentFactorWithLimiterDataWithLerp:forIndex:withLimiterTypeIndexMap:forLimiterType:");
            }
            else
            {
              v38 = 1.0;
              if (v42 != 4)
                break;
              objc_msgSend(WeakRetained, "_latencyAdjustmentWithLimiterData:forIndex:withLimiterTypeIndexMap:");
            }
LABEL_55:
            v38 = v41;
            break;
        }
      }
      v43 = *v34;
      if (*v34 == *v37)
      {
        v40 = 0;
      }
      else
      {
        v40 = 0;
        do
        {
          v40 += v43[1];
          v43 += 4;
        }
        while (v43 != *v37);
      }
      v44 = **(_QWORD **)TargetClauseAnalysis
          + 88
          * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)TargetClauseAnalysis + 24) + 48 * v31 + 8 * v26[8]);
      v45 = *(_QWORD *)(v5 + 8);
      if (v45)
      {
        v46 = (uint8x8_t)vcnt_s8((int8x8_t)v45);
        v46.i16[0] = vaddlv_u8(v46);
        if (v46.u32[0] > 1uLL)
        {
          v47 = v44;
          if (v45 <= v44)
            v47 = v44 % v45;
        }
        else
        {
          v47 = (v45 - 1) & v44;
        }
        v48 = *(void ***)(*(_QWORD *)v5 + 8 * v47);
        if (v48)
        {
          v49 = (float *)*v48;
          if (*v48)
          {
            do
            {
              v50 = *((_QWORD *)v49 + 1);
              if (v50 == v44)
              {
                if (*((_QWORD *)v49 + 2) == v44)
                  goto LABEL_119;
              }
              else
              {
                if (v46.u32[0] > 1uLL)
                {
                  if (v50 >= v45)
                    v50 %= v45;
                }
                else
                {
                  v50 &= v45 - 1;
                }
                if (v50 != v47)
                  break;
              }
              v49 = *(float **)v49;
            }
            while (v49);
          }
        }
        v172 = 0u;
        v173 = 0u;
        v174 = 1065353216;
        if (v46.u32[0] > 1uLL)
        {
          v1 = v44;
          if (v45 <= v44)
            v1 = v44 % v45;
        }
        else
        {
          v1 = (v45 - 1) & v44;
        }
        v51 = *(void ***)(*(_QWORD *)v5 + 8 * v1);
        if (v51)
        {
          v49 = (float *)*v51;
          if (*v51)
          {
            do
            {
              v52 = *((_QWORD *)v49 + 1);
              if (v52 == v44)
              {
                if (*((_QWORD *)v49 + 2) == v44)
                {
                  v1 = v169;
                  goto LABEL_115;
                }
              }
              else
              {
                if (v46.u32[0] > 1uLL)
                {
                  if (v52 >= v45)
                    v52 %= v45;
                }
                else
                {
                  v52 &= v45 - 1;
                }
                if (v52 != v1)
                  break;
              }
              v49 = *(float **)v49;
            }
            while (v49);
          }
        }
      }
      else
      {
        v172 = 0u;
        v173 = 0u;
        v174 = 1065353216;
      }
      v49 = (float *)operator new(0x40uLL);
      v177[0] = v49;
      v177[1] = v160;
      *(_QWORD *)v49 = 0;
      *((_QWORD *)v49 + 1) = v44;
      *((_QWORD *)v49 + 2) = v44;
      std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table((uint64_t)(v49 + 6), (uint64_t *)&v172);
      v178 = 1;
      v53 = (float)(unint64_t)(*(_QWORD *)(v5 + 24) + 1);
      v54 = *(float *)(v5 + 32);
      if (!v45 || (float)(v54 * (float)v45) < v53)
      {
        v55 = (v45 & (v45 - 1)) != 0;
        if (v45 < 3)
          v55 = 1;
        v56 = v55 | (2 * v45);
        v57 = vcvtps_u32_f32(v53 / v54);
        if (v56 <= v57)
          v58 = v57;
        else
          v58 = v56;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(v5, v58);
        v45 = *(_QWORD *)(v5 + 8);
        if ((v45 & (v45 - 1)) != 0)
        {
          if (v45 <= v44)
            v1 = v44 % v45;
          else
            v1 = v44;
        }
        else
        {
          v1 = (v45 - 1) & v44;
        }
      }
      v59 = *(_QWORD *)v5;
      v60 = *(float ***)(*(_QWORD *)v5 + 8 * v1);
      if (v60)
        break;
      *(_QWORD *)v49 = *v160;
      *v160 = v49;
      *(_QWORD *)(v59 + 8 * v1) = v160;
      v1 = v169;
      if (*(_QWORD *)v49)
      {
        v61 = *(_QWORD *)(*(_QWORD *)v49 + 8);
        if ((v45 & (v45 - 1)) != 0)
        {
          if (v61 >= v45)
            v61 %= v45;
        }
        else
        {
          v61 &= v45 - 1;
        }
        v60 = (float **)(*(_QWORD *)v5 + 8 * v61);
        goto LABEL_113;
      }
LABEL_114:
      v177[0] = 0;
      ++*(_QWORD *)(v5 + 24);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<long,std::unordered_map<unsigned int,DrawDurationInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long,std::unordered_map<unsigned int,DrawDurationInfo>>,void *>>>>::reset[abi:nn180100]((uint64_t)v177);
LABEL_115:
      std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::~__hash_table((uint64_t)&v172);
      v62 = *((_QWORD *)v49 + 4);
      if (v62)
        v63 = (float)*((unint64_t *)v49 + 6) / (float)v62;
      else
        v63 = 0.0;
      v64 = fmaxf(v63, 0.3);
      v49[14] = v64;
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)(v49 + 6), vcvtps_u32_f32(32.0 / v64));
LABEL_119:
      v65 = std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)(v49 + 6), v175, &v175);
      v66 = v65;
      v67 = *((_DWORD *)v65 + 7) + v26[2];
      ++*((_DWORD *)v65 + 6);
      *((_DWORD *)v65 + 7) = v67;
      v68 = *(_DWORD *)(v1 + 184) & 0x1F | (32 * *(_DWORD *)(v1 + 188)) | (unint64_t)(v27 << 32);
      v70 = (char *)*((_QWORD *)v65 + 5);
      v69 = *((_QWORD *)v65 + 6);
      if ((unint64_t)v70 >= v69)
      {
        v72 = (char *)*((_QWORD *)v65 + 4);
        v73 = (v70 - v72) >> 3;
        v74 = v73 + 1;
        if ((unint64_t)(v73 + 1) >> 61)
          abort();
        v75 = v69 - (_QWORD)v72;
        if (v75 >> 2 > v74)
          v74 = v75 >> 2;
        v76 = (unint64_t)v75 >= 0x7FFFFFFFFFFFFFF8;
        v77 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v76)
          v77 = v74;
        if (v77)
        {
          v77 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v77);
          v72 = (char *)*((_QWORD *)v66 + 4);
          v70 = (char *)*((_QWORD *)v66 + 5);
        }
        else
        {
          v78 = 0;
        }
        v79 = (unint64_t *)(v77 + 8 * v73);
        *v79 = v68;
        v71 = v79 + 1;
        while (v70 != v72)
        {
          v80 = *((_QWORD *)v70 - 1);
          v70 -= 8;
          *--v79 = v80;
        }
        *((_QWORD *)v66 + 4) = v79;
        *((_QWORD *)v66 + 5) = v71;
        *((_QWORD *)v66 + 6) = v77 + 8 * v78;
        if (v72)
          operator delete(v72);
      }
      else
      {
        *(_QWORD *)v70 = v68;
        v71 = v70 + 8;
      }
      *((_QWORD *)v66 + 5) = v71;
LABEL_135:
      v81 = sqrt((double)objc_msgSend(WeakRetained, "_computeSampleNormFactorForSample:forProgramStartAddress:forProgramEndAddress:", v26, *(_QWORD *)(v170 + 8), *(_QWORD *)(v170 + 16)));
      if (v81 <= 1)
        v82 = 1;
      else
        v82 = v81;
      v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40), "objectAtIndexedSubscript:", v27));
      v86 = v83;
      *(_QWORD *)(v83 + 8) = *v166;
      *(_DWORD *)(v83 + 16) = v26[1];
      v87 = *(_DWORD *)(v1 + 188);
      *(_DWORD *)(v83 + 24) = *(_DWORD *)(v83 + 24) & 0xF8000000 | v87 & 0x7FFFFFF;
      v88 = v87 & 0x7FFFFFF | (*(_DWORD *)(v1 + 184) << 27);
      v89 = v176;
      *(_DWORD *)(v83 + 20) = v176;
      *(_DWORD *)(v83 + 24) = v88;
      *(double *)(v83 + 32) = v38;
      if (v34)
      {
        v90 = (char *)v34[1] - (char *)*v34;
        v91 = v90 >> 4;
        v92 = *(_QWORD *)(v86 + 48);
        if (v90 >> 4 <= (unint64_t)((*(_QWORD *)(v86 + 64) - v92) >> 4))
          goto LABEL_149;
        if (v90 < 0)
          abort();
      }
      else
      {
        v92 = *(_QWORD *)(v83 + 48);
        if (*(_QWORD *)(v83 + 64) != v92)
          goto LABEL_149;
        v91 = 1;
      }
      v93 = *(_QWORD *)(v86 + 56);
      v94 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v91);
      v97 = *(char **)(v86 + 48);
      v96 = *(char **)(v86 + 56);
      v98 = &v94[(v93 - v92) & 0xFFFFFFFFFFFFFFF0];
      if (v96 != v97)
      {
        do
        {
          v84 = *((_OWORD *)v96 - 1);
          *((_OWORD *)v98 - 1) = v84;
          v98 -= 16;
          v96 -= 16;
        }
        while (v96 != v97);
        v96 = *(char **)(v86 + 48);
      }
      *(_QWORD *)(v86 + 48) = v98;
      *(_QWORD *)(v86 + 56) = &v94[(v93 - v92) & 0xFFFFFFFFFFFFFFF0];
      *(_QWORD *)(v86 + 64) = &v94[16 * v95];
      if (v96)
        operator delete(v96);
LABEL_149:
      if (v167 <= 2)
      {
        v99 = (_QWORD *)(*v161 + 40 * v167);
        v100 = v175;
        v101 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v99, v175);
        if (v101)
        {
          v102 = v26[1];
          LODWORD(v103) = v102 - 1;
          if ((_DWORD)v102)
            v103 = v103;
          else
            v103 = 0;
          if (v101[3] < v103)
            v103 = v101[3];
          if (v101[4] > v102)
            v102 = v101[4];
          v101[3] = v103;
          v101[4] = v102;
        }
        else
        {
          v104 = v26[1];
          LODWORD(v105) = v104 - 1;
          if ((_DWORD)v104)
            v105 = v105;
          else
            v105 = 0;
          LODWORD(v172) = v100;
          *((_QWORD *)&v172 + 1) = v105;
          *(_QWORD *)&v173 = v104;
          std::__hash_table<std::__hash_value_type<unsigned int,std::pair<unsigned long long,unsigned long long>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::pair<unsigned long long,unsigned long long>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::pair<unsigned long long,unsigned long long>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::pair<unsigned long long,unsigned long long>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,std::pair<unsigned long long,unsigned long long>>>((uint64_t)v99, v100, (uint64_t)&v172);
        }
      }
      if (v34)
      {
        v107 = *v34;
        v106 = v34[1];
        if (v107 == v106)
          goto LABEL_193;
        v108 = 0;
        v109 = (double)(v82 * v40);
        v110 = v175 & 0xFFFFFFF | v162;
        do
        {
          LODWORD(v84) = v26[2];
          LODWORD(v85) = v107[1];
          v85 = (double)*(unint64_t *)&v85;
          v111 = v38 * (double)(unint64_t)v84 * v85 / v109;
          DWORD1(v84) = 1018167296;
          if (v111 > 2.22044605e-16)
          {
            v112 = *v107;
            v114 = *(_QWORD *)(v86 + 56);
            v113 = *(_QWORD *)(v86 + 64);
            if (v114 >= v113)
            {
              v116 = *(_QWORD *)(v86 + 48);
              v117 = (uint64_t)(v114 - v116) >> 4;
              v118 = v117 + 1;
              if ((unint64_t)(v117 + 1) >> 60)
                abort();
              v119 = v113 - v116;
              if (v119 >> 3 > v118)
                v118 = v119 >> 3;
              if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0)
                v120 = 0xFFFFFFFFFFFFFFFLL;
              else
                v120 = v118;
              if (v120)
                v120 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v120);
              else
                v121 = 0;
              v122 = v120 + 16 * v117;
              *(_DWORD *)v122 = v112;
              *(_DWORD *)(v122 + 4) = v110;
              *(double *)(v122 + 8) = v111;
              v124 = *(char **)(v86 + 48);
              v123 = *(char **)(v86 + 56);
              v125 = v122;
              if (v123 != v124)
              {
                do
                {
                  v84 = *((_OWORD *)v123 - 1);
                  *(_OWORD *)(v125 - 16) = v84;
                  v125 -= 16;
                  v123 -= 16;
                }
                while (v123 != v124);
                v123 = *(char **)(v86 + 48);
              }
              v115 = v122 + 16;
              *(_QWORD *)(v86 + 48) = v125;
              *(_QWORD *)(v86 + 56) = v122 + 16;
              *(_QWORD *)(v86 + 64) = v120 + 16 * v121;
              if (v123)
                operator delete(v123);
            }
            else
            {
              *(_DWORD *)v114 = v112;
              *(_DWORD *)(v114 + 4) = v110;
              v115 = v114 + 16;
              *(double *)(v114 + 8) = v111;
            }
            *(_QWORD *)(v86 + 56) = v115;
            ++v108;
            if (WeakRetained[752])
            {
              LODWORD(v85) = v107[1];
              fprintf(*(FILE **)(v169 + 160), "%u %u:0x%llx %u %10u %10u %10u %10u %15f %15f %15f\n", v27, *(_DWORD *)(v115 - 16), *(_QWORD *)(v170 + 8), *(_DWORD *)(v115 - 12) >> 28, v89, *(_DWORD *)(v115 - 12) & 0xFFFFFFF, *(_DWORD *)(v86 + 16), v26[2], *(double *)(v115 - 8), v38, (double)*(unint64_t *)&v85 / v109);
            }
          }
          v107 += 4;
        }
        while (v107 != v106);
        if (!v108)
          goto LABEL_193;
        goto LABEL_187;
      }
      LODWORD(v84) = v26[2];
      v131 = (double)(unint64_t)v84 / (double)v82;
      if (v131 > 2.22044605e-16)
      {
        if (v157 != 5)
        {
          if (v157 == 4)
          {
            v132 = v169;
            if (!v26[5])
            {
              objc_msgSend(WeakRetained, "_waitLatencyAdjustmentWithLimiterData:forIndex:withLimiterTypeIndexMap:", *(_QWORD *)(v169 + 152), (*(_DWORD *)(v169 + 180) * v26[1]), v155);
              v131 = v131 * v133;
            }
            v134 = v152;
LABEL_206:
            v136 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v134 + 8) + 48)
                             + 24 * *(unsigned int *)(v132 + 168));
            *(double *)(v136 + 8 * (*v26 % *(_DWORD *)(v132 + 192))) = v131
                                                                                     + *(double *)(v136
                                                                                                 + 8
                                                                                                 * (*v26 % *(_DWORD *)(v132 + 192)));
          }
          v137 = v26[3];
          v138 = v175 & 0xFFFFFFF | v162;
          v140 = *(_QWORD *)(v86 + 56);
          v139 = *(_QWORD *)(v86 + 64);
          if (v140 >= v139)
          {
            v142 = *(_QWORD *)(v86 + 48);
            v143 = (uint64_t)(v140 - v142) >> 4;
            v144 = v143 + 1;
            if ((unint64_t)(v143 + 1) >> 60)
              abort();
            v145 = v139 - v142;
            if (v145 >> 3 > v144)
              v144 = v145 >> 3;
            if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFF0)
              v146 = 0xFFFFFFFFFFFFFFFLL;
            else
              v146 = v144;
            if (v146)
              v146 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v146);
            else
              v147 = 0;
            v148 = v146 + 16 * v143;
            *(_DWORD *)v148 = v137;
            *(_DWORD *)(v148 + 4) = v138;
            *(double *)(v148 + 8) = v131;
            v150 = *(char **)(v86 + 48);
            v149 = *(char **)(v86 + 56);
            v151 = v148;
            if (v149 != v150)
            {
              do
              {
                *(_OWORD *)(v151 - 16) = *((_OWORD *)v149 - 1);
                v151 -= 16;
                v149 -= 16;
              }
              while (v149 != v150);
              v149 = *(char **)(v86 + 48);
            }
            v141 = v148 + 16;
            *(_QWORD *)(v86 + 48) = v151;
            *(_QWORD *)(v86 + 56) = v148 + 16;
            *(_QWORD *)(v86 + 64) = v146 + 16 * v147;
            if (v149)
              operator delete(v149);
          }
          else
          {
            *(_DWORD *)v140 = v137;
            *(_DWORD *)(v140 + 4) = v138;
            v141 = v140 + 16;
            *(double *)(v140 + 8) = v131;
          }
          *(_QWORD *)(v86 + 56) = v141;
          v108 = 1;
LABEL_187:
          v126 = *(_QWORD *)(v86 + 8);
          if (v126 && *(_QWORD *)(v126 + 8))
          {
            v127 = (unsigned int *)(v126 + 40);
            do
              v128 = __ldaxr(v127);
            while (__stlxr(v128 + v108, v127));
            v129 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v86 + 8) + 16)
                                                  + 24 * *(unsigned int *)(v169 + 184))
                                      + 8 * *(unsigned int *)(v169 + 188));
            do
              v130 = __ldaxr(v129);
            while (__stlxr(v130 + v108, v129));
          }
          goto LABEL_193;
        }
        if (v26[5])
        {
          v134 = v153;
          v132 = v169;
        }
        else
        {
          v132 = v169;
          objc_msgSend(WeakRetained, "_latencyAdjustmentFactorWithLimiterData:forIndex:withLimiterTypeIndexMap:forLimiterType:", *(_QWORD *)(v169 + 152), (*(_DWORD *)(v169 + 180) * v26[1]), v155, 4);
          v131 = v131 * v135;
          v134 = v153;
        }
        goto LABEL_206;
      }
LABEL_193:

      v1 = v169;
      v5 = v163;
      v22 = v164;
LABEL_194:
      v26 += 10;
      v27 = (v27 + 1);
      if (v26 == v168)
        goto LABEL_36;
    }
    *(_QWORD *)v49 = *v60;
    v1 = v169;
LABEL_113:
    *v60 = v49;
    goto LABEL_114;
  }
LABEL_224:

}

- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  char *v2;
  char *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      v5 = (char *)a1[1];
      do
      {
        v7 = (void *)*((_QWORD *)v5 - 3);
        v5 -= 24;
        v6 = v7;
        if (v7)
        {
          *((_QWORD *)v3 - 2) = v6;
          operator delete(v6);
        }
        v3 = v5;
      }
      while (v5 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

- (uint64_t)setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:
{
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  int8x8_t v12;
  uint8x8_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v8)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8, v10);
    v12 = (int8x8_t)a4[1];
    if (!*(_QWORD *)&v12)
      goto LABEL_21;
    v13 = (uint8x8_t)vcnt_s8(v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      v14 = v9;
      if (*(_QWORD *)&v12 <= v9)
        v14 = v9 % *(_QWORD *)&v12;
    }
    else
    {
      v14 = (*(_QWORD *)&v12 - 1) & v9;
    }
    v16 = *(_QWORD **)(*a4 + 8 * v14);
    if (!v16 || (v17 = (_QWORD *)*v16) == 0)
LABEL_21:
      operator new();
    while (1)
    {
      v18 = v17[1];
      if (v18 == v9)
      {
        if (v17[2] == v9)
        {
          v15 = v17[3];
          goto LABEL_22;
        }
      }
      else
      {
        if (v13.u32[0] > 1uLL)
        {
          if (v18 >= *(_QWORD *)&v12)
            v18 %= *(_QWORD *)&v12;
        }
        else
        {
          v18 &= *(_QWORD *)&v12 - 1;
        }
        if (v18 != v14)
          goto LABEL_21;
      }
      v17 = (_QWORD *)*v17;
      if (!v17)
        goto LABEL_21;
    }
  }
  v15 = 0;
LABEL_22:

  return v15;
}

- (uint64_t)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:
{
  unsigned int v4;
  uint64_t i;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  void **v17;
  unint64_t *v18;
  void **v19;
  unint64_t v20;
  _QWORD *v21;
  unsigned int *v22;
  _QWORD *v23;
  _QWORD *v24;
  _DWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  char *v32;
  char *v33;
  unint64_t v34;
  uint64_t j;
  _QWORD *v36;
  unsigned int *v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  int v42;
  unint64_t v43;
  unsigned int v44;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  uint64_t *v48;
  unint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  unsigned int v54;
  int v55;
  _QWORD *v56;
  unsigned int *v57;
  unint64_t v58;
  unsigned int *v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unsigned int v67;
  int v68;
  int v69;
  _BOOL4 v70;
  int v71;
  _BOOL4 v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  __int128 v80;
  __int128 v81;
  void *v82;
  unint64_t v83;
  uint64_t v84;
  int v85;
  _DWORD *v86;
  void **v87;
  char *v88;
  _OWORD *v89;
  char *v90;
  __int128 v91;
  __int128 v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  __int128 v99;
  __int128 v100;
  char *v101;
  char *v102;
  char *v103;
  __int128 v104;
  __int128 v105;
  int v107;
  _BOOL4 v108;
  _BOOL4 v109;
  int v110;
  uint64_t v111;
  int v112;
  int v113;
  unint64_t v114;
  int v115;
  uint64_t v116;
  _OWORD v117[2];
  int v118;
  int64x2_t v119;
  __int128 v120;
  __int128 v121;
  _OWORD v122[2];
  int v123;

  v4 = **a1;
  memset(v122, 0, sizeof(v122));
  v123 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v122, 0x24uLL);
  std::deque<unsigned int>::push_front((char **)a1[1], a1[2]);
  std::deque<unsigned int>::push_front((char **)a1[3], a1[4]);
  for (i = a2[5]; i; i = a2[5])
  {
    ++**a1;
    v6 = *(_QWORD *)(*(_QWORD *)(a2[1] + ((a2[4] >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (a2[4] & 0x1FFLL));
    ++a2[4];
    a2[5] = i - 1;
    std::deque<ProfileEvent>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)a2);
    if (v6 >> 28)
    {
      if (v6 >> 28 == 2 && *a1[5] == 6)
        LODWORD(v6) = v6 & 0xFFFFFFF | 0x80000000;
      v7 = v6 >> 28;
      v8 = (v6 >> 28) - 3;
      if (v8 >= 6)
      {
        if (v7 == 2)
        {
          v22 = a1[6];
          v24 = *(_QWORD **)v22;
          v23 = (_QWORD *)*((_QWORD *)v22 + 1);
          while (v24 != v23)
          {
            v25 = (_DWORD *)*v24;
            if (*v24 != v24[1] && *v25 >> 28 == 1)
            {
              std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v122, v25[1], v25[1]);
              *(_DWORD *)*v24 = *(_DWORD *)*v24 & 0xFFFFFFF | 0x20000000;
              *(_DWORD *)(*v24 + 4) = **a1;
              break;
            }
            v24 += 3;
          }
        }
        else if (v7 == 1)
        {
          v13 = **a1;
          v15 = a1[5];
          v14 = a1[6];
          v16 = (*v15)++;
          v17 = (void **)(*(_QWORD *)v14 + 24 * v16);
          v19 = v17 + 1;
          v18 = (unint64_t *)v17[1];
          v20 = (unint64_t)v17[2];
          if ((unint64_t)v18 >= v20)
          {
            v26 = ((char *)v18 - (_BYTE *)*v17) >> 3;
            if ((unint64_t)(v26 + 1) >> 61)
              abort();
            v27 = v20 - (_QWORD)*v17;
            v28 = v27 >> 2;
            if (v27 >> 2 <= (unint64_t)(v26 + 1))
              v28 = v26 + 1;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
              v29 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v29 = v28;
            if (v29)
              v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v29);
            else
              v30 = 0;
            v31 = (unint64_t *)(v29 + 8 * v26);
            *v31 = v6 | (unint64_t)(v13 << 32);
            v21 = v31 + 1;
            v32 = (char *)*v19;
            v33 = (char *)*v17;
            if (*v19 != *v17)
            {
              do
              {
                v34 = *((_QWORD *)v32 - 1);
                v32 -= 8;
                *--v31 = v34;
              }
              while (v32 != v33);
              v32 = (char *)*v17;
            }
            *v17 = v31;
            *v19 = v21;
            v17[2] = (void *)(v29 + 8 * v30);
            if (v32)
              operator delete(v32);
          }
          else
          {
            *v18 = v6 | (unint64_t)(v13 << 32);
            v21 = v18 + 1;
          }
          *v19 = v21;
        }
      }
      else
      {
        v9 = (_QWORD *)(*(_QWORD *)a1[6] + 24 * v8);
        if (*v9 == v9[1])
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v122, **a1, **a1);
        }
        else
        {
          v10 = *(_DWORD *)(*v9 + 4);
          v11 = (uint64_t)a1[7];
          v119.i32[0] = v6 >> 28;
          *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v11, v7, &v119)+ 5) = v10;
          v12 = *(_QWORD *)a1[6] + 24 * v8;
          *(_QWORD *)(v12 + 8) -= 8;
        }
      }
    }
  }
  for (j = 0; j != 144; j += 24)
  {
    v36 = (_QWORD *)(*(_QWORD *)a1[6] + j);
    if (*v36 != v36[1])
      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v122, *(_DWORD *)(*v36 + 4), *(_DWORD *)(*v36 + 4));
  }
  v120 = 0u;
  v121 = 0u;
  v119 = 0u;
  memset(v117, 0, sizeof(v117));
  v118 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)v117, 0x24uLL);
  *a1[5] = 0;
  v37 = a1[8];
  v38 = *((_QWORD *)v37 + 5);
  if (v38)
  {
    v39 = 0;
    v40 = 0;
    v114 = 0;
    v41 = 0;
    v42 = 0;
    while (1)
    {
      v43 = *((_QWORD *)v37 + 4);
      ++v4;
      v116 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v37 + 1) + ((v43 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v43 & 0x1FF));
      v44 = v116;
      *((_QWORD *)v37 + 4) = v43 + 1;
      *((_QWORD *)v37 + 5) = v38 - 1;
      std::deque<ProfileEvent>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v37);
      if ((v44 & 0xF0000000) == 0x10000000)
      {
        ++*a1[5];
        if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v122, v4))goto LABEL_44;
      }
      else if (v44 >> 28
             && !std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v122, v4))
      {
        if ((v44 & 0xF0000000) == 0x20000000 && *a1[5] == 6)
        {
          LODWORD(v116) = v44 & 0xFFFFFFF | 0x80000000;
          v44 = v116;
        }
LABEL_44:
        v45 = v44 & 0xFFFFFFF;
        if (*((_QWORD *)&v121 + 1))
          v42 += (unint64_t)(v45 - v41) / *((_QWORD *)&v121 + 1);
        v115 = v44 & 0xFFFFFFF;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v117, v44 & 0xFFFFFFF, &v115)+ 5) = v42;
        v46 = v44 >> 28;
        v47 = (v44 >> 28) - 3;
        if (v47 >= 6)
        {
          if (v46 - 1 < 2)
          {
            HIDWORD(v116) = v4;
            std::deque<ProfileEvent>::emplace_back<ProfileEvent&>(&v119, &v116);
          }
        }
        else
        {
          v48 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(a1[7], v46);
          if (v48)
          {
            if ((_QWORD)v120 != v119.i64[1])
            {
              v49 = v119.i64[1] + 8 * ((unint64_t)v121 >> 9);
              v50 = *(char **)v49;
              v51 = (char *)(*(_QWORD *)v49 + 8 * (v121 & 0x1FF));
              v52 = *(_QWORD *)(v119.i64[1] + (((*((_QWORD *)&v121 + 1) + (_QWORD)v121) >> 6) & 0x3FFFFFFFFFFFFF8))
                  + 8 * ((*((_QWORD *)&v121 + 1) + v121) & 0x1FF);
              if (v51 != (char *)v52)
              {
                while (*((_DWORD *)v51 + 1) != *((_DWORD *)v48 + 5))
                {
                  v51 += 8;
                  if (v51 - v50 == 4096)
                  {
                    v53 = *(char **)(v49 + 8);
                    v49 += 8;
                    v50 = v53;
                    v51 = v53;
                  }
                  if (v51 == (char *)v52)
                    goto LABEL_58;
                }
                v54 = *(_DWORD *)v51;
                std::deque<ProfileEvent>::erase(&v119, (char *)v49, (uint64_t)v51);
                v55 = v54 & 0xFFFFFFF;
                v115 = v54 & 0xFFFFFFF;
                v112 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v117, v54 & 0xFFFFFFF, &v115)+ 5);
                v115 = v45;
                v56 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v117, v45, &v115);
                v57 = a1[1];
                v58 = *((_QWORD *)v57 + 5);
                if (v58 < 2 || (v59 = a1[3], v60 = *((_QWORD *)v59 + 5), v60 <= 1))
                {
                  v67 = v54;
                  v111 = (*a1[4] | (v58 << 36)) & 0x3000000FFFLL;
                  v110 = 0;
                  v61 = 0;
                }
                else
                {
                  v61 = 0;
                  v62 = *((_QWORD *)v57 + 4);
                  v63 = *((_QWORD *)v57 + 1);
                  v110 = *(_DWORD *)(*(_QWORD *)(v63 + (((unint64_t)(v62 + 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                                   + 4 * ((v62 + 1) & 0x3FF));
                  v64 = *((_QWORD *)v59 + 4);
                  v65 = *((_QWORD *)v59 + 1);
                  v66 = (*a1[4] | (v58 << 36)) & 0x3000000FFFLL | ((unint64_t)(*(_DWORD *)(*(_QWORD *)(v65 + (((unint64_t)(v64 + 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                                                                + 4
                                                                                                * ((v64 + 1) & 0x3FF)) & 0xFFF) << 12);
                  if (v58 < 3 || v60 == 2)
                  {
                    v67 = v54;
                  }
                  else
                  {
                    v67 = v54;
                    v61 = *(_DWORD *)(*(_QWORD *)(v63 + (((unint64_t)(v62 + 2) >> 7) & 0x1FFFFFFFFFFFFF8))
                                    + 4 * ((v62 + 2) & 0x3FF));
                    v66 |= (unint64_t)(*(_DWORD *)(*(_QWORD *)(v65
                                                                    + (((unint64_t)(v64 + 2) >> 7) & 0x1FFFFFFFFFFFFF8))
                                                        + 4 * ((v64 + 2) & 0x3FF)) & 0xFFF) << 24;
                  }
                  v111 = v66;
                }
                v68 = *((_DWORD *)v56 + 5) - v112;
                v69 = *a1[9];
                if (v69 == -1)
                  v70 = v67 >> 28 == 2;
                else
                  v70 = v61;
                v71 = *a1[2];
                v74 = (v55 == 4095 || (_DWORD)v45 == 4095) && *(_BYTE *)(*(_QWORD *)a1[10] + 752) != 0;
                if (v40 >= v114)
                {
                  v107 = *a1[2];
                  v108 = v70;
                  v109 = v74;
                  v113 = *((_DWORD *)v56 + 5) - v112;
                  v75 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v40 - (_QWORD)v39) >> 3) + 1;
                  if (v75 > 0x666666666666666)
                    abort();
                  if (0x999999999999999ALL * ((uint64_t)(v114 - (_QWORD)v39) >> 3) > v75)
                    v75 = 0x999999999999999ALL * ((uint64_t)(v114 - (_QWORD)v39) >> 3);
                  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v114 - (_QWORD)v39) >> 3) >= 0x333333333333333)
                    v76 = 0x666666666666666;
                  else
                    v76 = v75;
                  if (v76)
                    v76 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v76);
                  else
                    v77 = 0;
                  v78 = v76 + 8 * ((uint64_t)(v40 - (_QWORD)v39) >> 3);
                  *(_DWORD *)v78 = v69;
                  *(_DWORD *)(v78 + 4) = 0;
                  *(_DWORD *)(v78 + 8) = v113;
                  *(_DWORD *)(v78 + 12) = v107;
                  *(_DWORD *)(v78 + 16) = v110;
                  *(_DWORD *)(v78 + 20) = v108;
                  *(_QWORD *)(v78 + 24) = v111;
                  *(_DWORD *)(v78 + 32) = v47;
                  *(_DWORD *)(v78 + 36) = v109;
                  if ((void *)v40 == v39)
                  {
                    v82 = (void *)(v76 + 8 * ((uint64_t)(v40 - (_QWORD)v39) >> 3));
                  }
                  else
                  {
                    v79 = v76 + 8 * ((uint64_t)(v40 - (_QWORD)v39) >> 3);
                    do
                    {
                      v80 = *(_OWORD *)(v40 - 40);
                      v81 = *(_OWORD *)(v40 - 24);
                      v82 = (void *)(v79 - 40);
                      *(_QWORD *)(v79 - 8) = *(_QWORD *)(v40 - 8);
                      *(_OWORD *)(v79 - 24) = v81;
                      *(_OWORD *)(v79 - 40) = v80;
                      v40 -= 40;
                      v79 -= 40;
                    }
                    while ((void *)v40 != v39);
                  }
                  v114 = v76 + 40 * v77;
                  v40 = v78 + 40;
                  if (v39)
                    operator delete(v39);
                  v39 = v82;
                }
                else
                {
                  *(_DWORD *)v40 = v69;
                  *(_DWORD *)(v40 + 4) = 0;
                  *(_DWORD *)(v40 + 8) = v68;
                  *(_DWORD *)(v40 + 12) = v71;
                  *(_DWORD *)(v40 + 16) = v110;
                  *(_DWORD *)(v40 + 20) = v70;
                  *(_QWORD *)(v40 + 24) = v111;
                  *(_DWORD *)(v40 + 32) = v47;
                  *(_DWORD *)(v40 + 36) = v74;
                  v40 += 40;
                }
              }
            }
          }
        }
        goto LABEL_58;
      }
      v45 = v41;
LABEL_58:
      v37 = a1[8];
      v38 = *((_QWORD *)v37 + 5);
      v41 = v45;
      if (!v38)
        goto LABEL_105;
    }
  }
  v39 = 0;
  v40 = 0;
LABEL_105:
  v83 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v40 - (_QWORD)v39) >> 3));
  if ((void *)v40 == v39)
    v84 = 0;
  else
    v84 = v83;
  std::__introsort<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator() const(std::queue<ProfileEvent>)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*,false>((uint64_t)v39, v40, v84, 1);
  if ((void *)v40 != v39)
  {
    v85 = 0;
    v86 = v39;
    do
    {
      v86[8] = v85++;
      v86 += 10;
    }
    while (v86 != (_DWORD *)v40);
    if ((void *)v40 != v39)
    {
      v87 = (void **)a1[11];
      v88 = (char *)v87[1];
      v89 = v39;
      do
      {
        v90 = (char *)v87[2];
        if (v88 >= v90)
        {
          v93 = 0xCCCCCCCCCCCCCCCDLL * ((v88 - (_BYTE *)*v87) >> 3);
          v94 = v93 + 1;
          if (v93 + 1 > 0x666666666666666)
            abort();
          v95 = 0xCCCCCCCCCCCCCCCDLL * ((v90 - (_BYTE *)*v87) >> 3);
          if (2 * v95 > v94)
            v94 = 2 * v95;
          if (v95 >= 0x333333333333333)
            v96 = 0x666666666666666;
          else
            v96 = v94;
          if (v96)
            v96 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v96);
          else
            v97 = 0;
          v98 = v96 + 40 * v93;
          v99 = *v89;
          v100 = v89[1];
          *(_QWORD *)(v98 + 32) = *((_QWORD *)v89 + 4);
          *(_OWORD *)v98 = v99;
          *(_OWORD *)(v98 + 16) = v100;
          v102 = (char *)*v87;
          v101 = (char *)v87[1];
          v103 = (char *)v98;
          if (v101 != *v87)
          {
            do
            {
              v104 = *(_OWORD *)(v101 - 40);
              v105 = *(_OWORD *)(v101 - 24);
              *((_QWORD *)v103 - 1) = *((_QWORD *)v101 - 1);
              *(_OWORD *)(v103 - 24) = v105;
              *(_OWORD *)(v103 - 40) = v104;
              v103 -= 40;
              v101 -= 40;
            }
            while (v101 != v102);
            v101 = (char *)*v87;
          }
          v88 = (char *)(v98 + 40);
          *v87 = v103;
          v87[1] = (void *)(v98 + 40);
          v87[2] = (void *)(v96 + 40 * v97);
          if (v101)
            operator delete(v101);
        }
        else
        {
          v91 = *v89;
          v92 = v89[1];
          *((_QWORD *)v88 + 4) = *((_QWORD *)v89 + 4);
          *(_OWORD *)v88 = v91;
          *((_OWORD *)v88 + 1) = v92;
          v88 += 40;
        }
        v87[1] = v88;
        v89 = (_OWORD *)((char *)v89 + 40);
      }
      while (v89 != (_OWORD *)v40);
    }
  }
  if (v39)
    operator delete(v39);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v117);
  std::deque<ProfileEvent>::~deque[abi:nn180100](&v119);
  return std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v122);
}

- (void)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:
{
  __int128 *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 *v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  unsigned int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  unsigned int v33;
  unsigned int v34;
  __int128 *v35;
  __int128 v36;
  __int128 v37;
  BOOL v38;
  uint64_t v39;
  unsigned int v40;
  unint64_t v41;
  unsigned int v42;
  unint64_t v43;
  unint64_t v44;
  unsigned int v45;
  int v46;
  __int128 v47;
  __int128 v48;
  unsigned int v49;
  unsigned int v50;
  __int128 *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 *v56;
  __int128 *v57;
  __int128 *v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _OWORD *v72;
  BOOL v74;
  uint64_t v75;
  _DWORD *v76;
  _OWORD *v77;
  unsigned int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  int64_t v84;
  int64_t v85;
  int64_t v86;
  uint64_t v87;
  unint64_t v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unint64_t v92;
  int v93;
  unint64_t v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  unsigned int v99;
  unsigned int v100;
  int64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unsigned int v108;
  unsigned int v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  unint64_t v115;
  unsigned int v116;
  int v117;
  unint64_t v118;
  __int128 v119;
  __int128 v120;
  _OWORD *v122;
  unsigned int v123;
  int v124;
  _OWORD *v125;
  __int128 v126;
  unsigned int v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;

@end
