@implementation MPSGraphCaptureContext

- (MPSGraphCaptureContext)initWithOutputFolderPath:(id)a3 graphName:(id)a4
{
  id v6;
  id v7;
  MPSGraphCaptureContext *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *nodes;
  uint64_t v12;
  NSMutableArray *links;
  uint64_t v14;
  NSMutableArray *functions;
  uint64_t v16;
  NSMutableArray *data;
  uint64_t v18;
  NSMutableArray *portLinks;
  uint64_t v20;
  NSMutableDictionary *pipelineReflectionDictionary;
  uint64_t v22;
  NSMutableDictionary *pipelineFunctionNameDictionary;
  uint64_t v24;
  NSMutableDictionary *constantBuffers;
  uint64_t v26;
  uint64_t v27;
  NSString *outputFolderPath;
  uint64_t v29;
  NSMutableDictionary *lastNodeWrittingToBuffer;
  uint64_t v31;
  NSString *graphName;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MPSGraphCaptureContext;
  v8 = -[MPSGraphCaptureContext init](&v34, sel_init);
  v9 = (void *)MEMORY[0x186DA1C20]();
  v10 = objc_opt_new();
  nodes = v8->_nodes;
  v8->_nodes = (NSMutableArray *)v10;

  v12 = objc_opt_new();
  links = v8->_links;
  v8->_links = (NSMutableArray *)v12;

  v14 = objc_opt_new();
  functions = v8->_functions;
  v8->_functions = (NSMutableArray *)v14;

  v16 = objc_opt_new();
  data = v8->_data;
  v8->_data = (NSMutableArray *)v16;

  v18 = objc_opt_new();
  portLinks = v8->_portLinks;
  v8->_portLinks = (NSMutableArray *)v18;

  v20 = objc_opt_new();
  pipelineReflectionDictionary = v8->_pipelineReflectionDictionary;
  v8->_pipelineReflectionDictionary = (NSMutableDictionary *)v20;

  v22 = objc_opt_new();
  pipelineFunctionNameDictionary = v8->_pipelineFunctionNameDictionary;
  v8->_pipelineFunctionNameDictionary = (NSMutableDictionary *)v22;

  v24 = objc_opt_new();
  constantBuffers = v8->_constantBuffers;
  v8->_constantBuffers = (NSMutableDictionary *)v24;

  v26 = operator new();
  *(_OWORD *)v26 = 0u;
  *(_OWORD *)(v26 + 16) = 0u;
  *(_DWORD *)(v26 + 32) = 1065353216;
  *(_OWORD *)(v26 + 40) = 0u;
  *(_OWORD *)(v26 + 56) = 0u;
  *(_DWORD *)(v26 + 72) = 1065353216;
  v8->_context = (void *)v26;
  v27 = objc_msgSend(v6, "copy");
  outputFolderPath = v8->_outputFolderPath;
  v8->_outputFolderPath = (NSString *)v27;

  v29 = objc_opt_new();
  lastNodeWrittingToBuffer = v8->_lastNodeWrittingToBuffer;
  v8->_lastNodeWrittingToBuffer = (NSMutableDictionary *)v29;

  v31 = objc_msgSend(v7, "copy");
  graphName = v8->_graphName;
  v8->_graphName = (NSString *)v31;

  objc_autoreleasePoolPop(v9);
  return v8;
}

- (void)dealloc
{
  void **context;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  objc_super v10;

  context = (void **)self->_context;
  if (context)
  {
    v4 = context[7];
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)*v4;
        operator delete(v4);
        v4 = v5;
      }
      while (v5);
    }
    v6 = context[5];
    context[5] = 0;
    if (v6)
      operator delete(v6);
    v7 = context[2];
    if (v7)
    {
      do
      {
        v8 = (_QWORD *)*v7;
        operator delete(v7);
        v7 = v8;
      }
      while (v8);
    }
    v9 = *context;
    *context = 0;
    if (v9)
      operator delete(v9);
    MEMORY[0x186DA1680](context, 0x10A0C40864A76ABLL);
  }
  self->_context = 0;
  v10.receiver = self;
  v10.super_class = (Class)MPSGraphCaptureContext;
  -[MPSGraphCaptureContext dealloc](&v10, sel_dealloc);
}

- (void)setInputBuffers:(id)a3 names:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *inputPorts;
  id v9;

  v9 = a3;
  v6 = a4;
  getGraphPorts((uint64_t)"input", v9, v6, (uint64_t)self->_context);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputPorts = self->_inputPorts;
  self->_inputPorts = v7;

}

- (void)setOutputBuffers:(id)a3 names:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *outputPorts;
  id v9;

  v9 = a3;
  v6 = a4;
  getGraphPorts((uint64_t)"output", v9, v6, (uint64_t)self->_context + 40);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputPorts = self->_outputPorts;
  self->_outputPorts = v7;

}

- (void)setFeeds:(id)a3 names:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  getBuffersFromTensorDatas(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphCaptureContext setInputBuffers:names:](self, "setInputBuffers:names:", v6, v7);

}

- (void)setResults:(id)a3 names:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  getBuffersFromTensorDatas(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphCaptureContext setOutputBuffers:names:](self, "setOutputBuffers:names:", v6, v7);

}

- (id)dataWithBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  const char *v9;
  size_t v10;
  std::string::size_type v11;
  std::string *p_dst;
  uint64_t v13;
  uint64_t v14;
  id v15;
  std::string *v16;
  FILE *v17;
  void *v18;
  id v19;
  std::string __dst;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v7 = -[NSMutableArray count](self->_data, "count");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("data%u"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSString UTF8String](self->_outputFolderPath, "UTF8String");
  v10 = strlen(v9);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v11 = v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    p_dst = (std::string *)operator new(v13 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_8;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v10;
  p_dst = &__dst;
  if (v10)
LABEL_8:
    memmove(p_dst, v9, v11);
  p_dst->__r_.__value_.__s.__data_[v11] = 0;
  v15 = objc_retainAutorelease(v8);
  std::string::append(&__dst, (const std::string::value_type *)objc_msgSend(v15, "UTF8String"));
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = &__dst;
  else
    v16 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  v17 = fopen((const char *)v16, "wb");
  if (!v17 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  fwrite(a3, 1uLL, a4, v17);
  fclose(v17);
  v22[0] = CFSTR("Name");
  v22[1] = CFSTR("FilePath");
  v23[0] = v15;
  v23[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_data, "addObject:", v18);
  v19 = v15;

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);

  return v19;
}

- (void)setConstantBuffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v4);
  -[MPSGraphCaptureContext dataWithBytes:length:](self, "dataWithBytes:length:", objc_msgSend(v7, "contents"), objc_msgSend(v7, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_constantBuffers, "setObject:forKeyedSubscript:", v6, v5);

}

- (id)constantBufferName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_constantBuffers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)addFunctionWithBitCode:(id)a3 metalFunctionName:(id)a4 reflection:(id)a5
{
  uint64_t v8;
  const char *v9;
  size_t v10;
  std::string::size_type v11;
  std::string *p_dst;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  size_t v16;
  std::string *v17;
  FILE *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  MPSGraphCaptureContext *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  std::string __dst;
  _QWORD v45[4];
  _QWORD v46[4];
  const __CFString *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v35 = a4;
  v38 = a5;
  v8 = -[NSMutableArray count](self->_functions, "count");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("function%u"), v8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.bc"), v36);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[NSString UTF8String](self->_outputFolderPath, "UTF8String");
  v10 = strlen(v9);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v11 = v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    p_dst = (std::string *)operator new(v13 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_8;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v10;
  p_dst = &__dst;
  if (v10)
LABEL_8:
    memmove(p_dst, v9, v11);
  v31 = self;
  p_dst->__r_.__value_.__s.__data_[v11] = 0;
  v34 = objc_retainAutorelease(v33);
  std::string::append(&__dst, (const std::string::value_type *)objc_msgSend(v34, "UTF8String"));
  v37 = objc_retainAutorelease(v32);
  v15 = (const void *)objc_msgSend(v37, "bytes");
  v16 = objc_msgSend(v37, "length");
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v17 = &__dst;
  else
    v17 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  v18 = fopen((const char *)v17, "wb");
  fwrite(v15, 1uLL, v16, v18);
  fclose(v18);
  v39 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v38, "arguments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (!objc_msgSend(v23, "type"))
        {
          v49[0] = CFSTR("Name");
          objc_msgSend(v23, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v49[1] = CFSTR("Buffer");
          v50[0] = v24;
          v47 = CFSTR("BindIndex");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "index"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v50[1] = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "addObject:", v27);
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v20);
  }

  v45[0] = CFSTR("Name");
  v45[1] = CFSTR("AirBitcodeFile");
  v46[0] = v36;
  v46[1] = v34;
  v45[2] = CFSTR("MetalFunctionName");
  v45[3] = CFSTR("Ports");
  v46[2] = v35;
  v46[3] = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v31->_functions, "addObject:", v28);
  v29 = v36;

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);

  return v29;
}

- (void)addPipeline:(id)a3 functionName:(id)a4 withReflection:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pipelineReflectionDictionary, "setObject:forKeyedSubscript:", v8, v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pipelineFunctionNameDictionary, "setObject:forKeyedSubscript:", v10, v9);

}

- (id)reflectionForPipeline:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pipelineReflectionDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)functionNameForPipeline:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pipelineFunctionNameDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wrapComputeEncoder:(id)a3
{
  id v4;
  MPSCaptureCommandEncoder *v5;

  v4 = a3;
  v5 = -[MPSCaptureCommandEncoder initWithCommandEncoder:captureContext:]([MPSCaptureCommandEncoder alloc], "initWithCommandEncoder:captureContext:", v4, self);

  return v5;
}

- (void)createNodeWithDispatchInfo:(id)a3 encoderContext:(void *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  const char *v13;
  size_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD *context;
  id v33;
  _QWORD *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  NSMutableDictionary *lastNodeWrittingToBuffer;
  void *v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD *v60;
  id v61;
  _QWORD *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id obj;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  void *v100;
  uint64_t v101;
  MPSGraphCaptureContext *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  _QWORD v107[5];
  _QWORD v108[2];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  id v122;
  id v123;
  _QWORD v124[3];
  _QWORD v125[3];
  _BYTE v126[128];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[2];
  _QWORD v141[3];
  _QWORD v142[3];
  _BYTE v143[128];
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[3];
  _QWORD v149[3];
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[3];
  _QWORD v155[3];
  _QWORD v156[2];
  _QWORD v157[2];
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v88 = a3;
  v93 = (void *)objc_opt_new();
  v96 = (uint64_t *)a4;
  v86 = *((id *)a4 + 3);
  MPSLibrary::getComputePipelineStateInfo();
  v90 = v122;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pipelineFileNameDictionary, "objectForKeyedSubscript:");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = self;
  if (!v89)
  {
    v6 = v121;
    -[MPSGraphCaptureContext addFunctionWithBitCode:metalFunctionName:reflection:](self, "addFunctionWithBitCode:metalFunctionName:reflection:", v123, v6, v90);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pipelineFileNameDictionary, "setObject:forKeyedSubscript:", v7, v87);
    v89 = (void *)v7;
    objc_msgSend(v90, "performanceStatistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CC69B0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && (int)objc_msgSend(v10, "intValue") >= 1)
      {
        v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E0DE4A50], (uint64_t)"Function ", 9);
        v13 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        v14 = strlen(v13);
        v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)v13, v14);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" spilled ", 9);
        v16 = (_QWORD *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" bytes\n", 7);
        v102->_doNotWriteJsonFile = 1;
      }

    }
    self = v102;
  }
  v17 = -[NSMutableArray count](self->_nodes, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("node%u"), v17);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setObject:forKeyedSubscript:");
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v89, CFSTR("Function"));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v91, CFSTR("OutputPortStorage"));
  objc_msgSend(v93, "setObject:forKeyedSubscript:", v88, CFSTR("Dispatch"));
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  objc_msgSend(v90, "arguments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v158, 16);
  if (v98)
  {
    v97 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v98; ++i)
      {
        if (*(_QWORD *)v118 != v97)
          objc_enumerationMutation(obj);
        v103 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        if (objc_msgSend(v103, "type") == 1)
        {
          if (!*(_QWORD *)(v96[4] + 8 * objc_msgSend(v103, "index")))
            continue;
          v156[0] = CFSTR("Size");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v157[0] = v18;
          v156[1] = CFSTR("BindIndex");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v103, "index"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v157[1] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v156, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v94, "addObject:", v20);
          goto LABEL_20;
        }
        if (objc_msgSend(v103, "type"))
          continue;
        v21 = objc_msgSend(v103, "index");
        v22 = v21;
        v23 = *v96;
        v24 = *v96 + 32 * v21;
        v101 = *(_QWORD *)(v24 + 8);
        if (*(_BYTE *)(v24 + 16))
        {
          v154[0] = CFSTR("Source");
          v152[0] = CFSTR("Data");
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v153[0] = v25;
          v152[1] = CFSTR("Port");
          v153[1] = *(_QWORD *)(v23 + 32 * v22 + 24);
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v153, v152, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v155[0] = v26;
          v154[1] = CFSTR("Offset");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v155[1] = v27;
          v154[2] = CFSTR("Dest");
          v151[0] = v100;
          v150[0] = CFSTR("Node");
          v150[1] = CFSTR("Port");
          objc_msgSend(v103, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v151[1] = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v155[2] = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableArray addObject:](v102->_links, "addObject:", v20);
          goto LABEL_20;
        }
        v30 = *(void **)(v23 + 32 * v21);
        if (v30)
        {
          v31 = v30;
          context = self->_context;
          v33 = v31;
          v34 = std::__hash_table<std::__hash_value_type<void *,void *>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,void *>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,void *>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,void *>>>::find<void *>(context, (unint64_t)v33);
          v106 = v33;
          if (v34)
          {
            v35 = (id)v34[3];

            if (v35)
            {
              v148[0] = CFSTR("Source");
              v147[0] = v102->_graphName;
              v146[0] = CFSTR("Graph");
              v146[1] = CFSTR("Port");
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Name"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v147[1] = v36;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, v146, 2);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v149[0] = v37;
              v148[1] = CFSTR("Offset");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v149[1] = v38;
              v148[2] = CFSTR("Dest");
              v145[0] = v100;
              v144[0] = CFSTR("Node");
              v144[1] = CFSTR("Port");
              objc_msgSend(v103, "name");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v145[1] = v39;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 2);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v149[2] = v40;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 3);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSMutableArray addObject:](v102->_portLinks, "addObject:", v41);
              v42 = 1;
              goto LABEL_26;
            }
            v42 = 0;
          }
          else
          {
            v42 = 0;
            v35 = v33;
LABEL_26:

          }
          lastNodeWrittingToBuffer = v102->_lastNodeWrittingToBuffer;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v106);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](lastNodeWrittingToBuffer, "objectForKeyedSubscript:", v44);
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          if (v92)
          {
            v115 = 0u;
            v116 = 0u;
            v114 = 0u;
            v113 = 0u;
            v104 = v92;
            v45 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
            if (v45)
            {
              v105 = *(_QWORD *)v114;
              do
              {
                for (j = 0; j != v45; ++j)
                {
                  if (*(_QWORD *)v114 != v105)
                    objc_enumerationMutation(v104);
                  v47 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BufferInfo"));
                  v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v49 = (uint64_t *)objc_msgSend(v48, "bytes");

                  v50 = *v49;
                  if (v50 == objc_msgSend(v106, "length"))
                  {
                    v51 = v49[1];
                    if (v51 == objc_msgSend(v106, "gpuAddress"))
                    {
                      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("Node"));
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      v141[0] = CFSTR("Source");
                      v139[0] = CFSTR("Node");
                      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("Name"));
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      v140[0] = v53;
                      v139[1] = CFSTR("Port");
                      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("Argument"));
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v140[1] = v54;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, v139, 2);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      v142[0] = v55;
                      v141[1] = CFSTR("Offset");
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101);
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      v142[1] = v56;
                      v141[2] = CFSTR("Dest");
                      v138[0] = v100;
                      v137[0] = CFSTR("Node");
                      v137[1] = CFSTR("Port");
                      objc_msgSend(v103, "name");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      v138[1] = v57;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, v137, 2);
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      v142[2] = v58;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 3);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();

                      -[NSMutableArray addObject:](v102->_links, "addObject:", v59);
                      v42 = 1;
                    }
                  }
                }
                v45 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v113, v143, 16);
              }
              while (v45);
            }

          }
          v20 = v106;
          if (objc_msgSend(v103, "access") == 1)
          {
            v60 = (char *)v102->_context + 40;
            v61 = v106;
            v62 = std::__hash_table<std::__hash_value_type<void *,void *>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,void *>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,void *>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,void *>>>::find<void *>(v60, (unint64_t)v61);
            if (v62)
            {
              v63 = (id)v62[3];

              if (v63)
              {
                v135[0] = CFSTR("Dest");
                v134[0] = v102->_graphName;
                v133[0] = CFSTR("Graph");
                v133[1] = CFSTR("Port");
                objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("Name"));
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v134[1] = v64;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 2);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v136[0] = v65;
                v135[1] = CFSTR("Source");
                v132[0] = v100;
                v131[0] = CFSTR("Node");
                v131[1] = CFSTR("Port");
                objc_msgSend(v103, "name");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v132[1] = v66;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v136[1] = v67;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 2);
                v68 = (void *)objc_claimAutoreleasedReturnValue();

                -[NSMutableArray addObject:](v102->_portLinks, "addObject:", v68);
                goto LABEL_46;
              }
            }
            else
            {

            }
            if ((v42 & 1) == 0)
            {
LABEL_46:
              v129[0] = CFSTR("Port");
              objc_msgSend(v103, "name");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v130[0] = v69;
              v129[1] = CFSTR("Buffer");
              v127[0] = CFSTR("Size");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v61, "length"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v128[0] = v70;
              v127[1] = CFSTR("Offset");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v128[1] = v71;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, v127, 2);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v130[1] = v72;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v91, "addObject:", v73);
            }
            v20 = v106;
          }
LABEL_20:

          self = v102;
          continue;
        }
      }
      v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v158, 16);
    }
    while (v98);
  }

  if (objc_msgSend(v94, "count"))
    objc_msgSend(v93, "setObject:forKeyedSubscript:", v94, CFSTR("ThreadgroupBuffers"));
  v74 = (void *)objc_opt_new();
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend(v90, "arguments");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
  if (v76)
  {
    v77 = *(_QWORD *)v110;
    do
    {
      for (k = 0; k != v76; ++k)
      {
        if (*(_QWORD *)v110 != v77)
          objc_enumerationMutation(v75);
        v79 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
        if (!objc_msgSend(v79, "type") && objc_msgSend(v79, "access") == 1)
        {
          v80 = *(id *)(*v96 + 32 * objc_msgSend(v79, "index"));
          v108[0] = objc_msgSend(v80, "length");
          v108[1] = objc_msgSend(v80, "gpuAddress");
          v125[0] = v93;
          v124[0] = CFSTR("Node");
          v124[1] = CFSTR("Argument");
          objc_msgSend(v79, "name");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v125[1] = v81;
          v124[2] = CFSTR("BufferInfo");
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v108, 16);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v125[2] = v82;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 3);
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v80);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v85)
          {
            v85 = (void *)objc_opt_new();
            objc_msgSend(v74, "setObject:forKeyedSubscript:", v85, v84);
          }
          objc_msgSend(v85, "addObject:", v83);

        }
      }
      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
    }
    while (v76);
  }

  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __68__MPSGraphCaptureContext_createNodeWithDispatchInfo_encoderContext___block_invoke;
  v107[3] = &unk_1E0E76D58;
  v107[4] = v102;
  objc_msgSend(v74, "enumerateKeysAndObjectsUsingBlock:", v107);
  -[NSMutableArray addObject:](v102->_nodes, "addObject:", v93);

}

uint64_t __68__MPSGraphCaptureContext_createNodeWithDispatchInfo_encoderContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKeyedSubscript:", a3, a2);
}

- (void)writeToJsonFile:(__sFILE *)a3
{
  MPSGraphCaptureContext *v4;
  NSString *graphName;
  NSArray *outputPorts;
  void *v7;
  NSMutableArray *data;
  NSMutableArray *nodes;
  NSMutableArray *links;
  NSMutableArray *portLinks;
  void *v12;
  uint64_t v13;
  Class isa;
  Class v15;
  void *v16;
  id v17;
  id v18;
  const void *v19;
  unint64_t v20;
  size_t v21;
  void **p_dst;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void **__dst;
  unint64_t v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[8];
  _QWORD v32[8];
  const __CFString *v33;
  _QWORD v34[2];

  v4 = self;
  v34[1] = *MEMORY[0x1E0C80C00];
  v33 = CFSTR("Graph");
  graphName = self->_graphName;
  v31[0] = CFSTR("Name");
  v31[1] = CFSTR("MetalArguments");
  v32[0] = graphName;
  v32[1] = &stru_1E0E7A578;
  v32[2] = self->_functions;
  v31[2] = CFSTR("Functions");
  v31[3] = CFSTR("Ports");
  v29[0] = CFSTR("Inputs");
  v29[1] = CFSTR("Outputs");
  outputPorts = self->_outputPorts;
  v30[0] = self->_inputPorts;
  v30[1] = outputPorts;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  data = v4->_data;
  v32[3] = v7;
  v31[4] = CFSTR("Data");
  v31[5] = CFSTR("Nodes");
  nodes = v4->_nodes;
  v32[4] = data;
  v32[5] = nodes;
  links = v4->_links;
  v31[6] = CFSTR("Links");
  v31[7] = CFSTR("PortLinks");
  portLinks = v4->_portLinks;
  v32[6] = links;
  v32[7] = portLinks;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v13 = objc_claimAutoreleasedReturnValue();
  v4 = (MPSGraphCaptureContext *)((char *)v4 + 8);
  isa = v4->super.super.isa;
  v4->super.super.isa = (Class)v13;

  v15 = v4->super.super.isa;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 9, &v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28;
  v18 = objc_retainAutorelease(v16);
  v19 = (const void *)objc_msgSend(v18, "bytes");
  v20 = objc_msgSend(v18, "length");
  v21 = v20;
  if (v20 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v20 >= 0x17)
  {
    v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17)
      v23 = v20 | 7;
    v24 = v23 + 1;
    p_dst = (void **)operator new(v23 + 1);
    __dst = p_dst;
    v27 = v24 | 0x8000000000000000;
    goto LABEL_8;
  }
  HIBYTE(v27) = v20;
  p_dst = (void **)&__dst;
  if (v20)
LABEL_8:
    memmove(p_dst, v19, v21);
  *((_BYTE *)p_dst + v21) = 0;
  v25 = objc_retainAutorelease(v18);
  fwrite((const void *)objc_msgSend(v25, "bytes"), objc_msgSend(v25, "length"), 1uLL, a3);
  if (SHIBYTE(v27) < 0)
    operator delete(__dst);

}

- (void)writejsonFile:(id)a3
{
  id v4;
  const char *v5;
  size_t v6;
  std::string::size_type v7;
  std::string *p_dst;
  uint64_t v9;
  uint64_t v10;
  std::string *v11;
  FILE *v12;
  std::string *v13;
  std::string *v14;
  std::string __dst;

  v4 = a3;
  if (self->_doNotWriteJsonFile)
    goto LABEL_16;
  v5 = -[NSString UTF8String](self->_outputFolderPath, "UTF8String");
  v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v6;
    p_dst = &__dst;
    if (!v6)
      goto LABEL_10;
  }
  memmove(p_dst, v5, v7);
LABEL_10:
  p_dst->__r_.__value_.__s.__data_[v7] = 0;
  std::string::append(&__dst, "/");
  std::string::append(&__dst, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = &__dst;
  else
    v11 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  v12 = fopen((const char *)v11, "w");
  if (!v12 && MTLReportFailureTypeEnabled())
  {
    v13 = &__dst;
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v13 = (std::string *)__dst.__r_.__value_.__r.__words[0];
    v14 = v13;
    MTLReportFailure();
  }
  -[MPSGraphCaptureContext writeToJsonFile:](self, "writeToJsonFile:", v12, v14);
  fclose(v12);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_16:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_outputFolderPath, 0);
  objc_storeStrong((id *)&self->_lastNodeWrittingToBuffer, 0);
  objc_storeStrong((id *)&self->_constantBuffers, 0);
  objc_storeStrong((id *)&self->_pipelineFileNameDictionary, 0);
  objc_storeStrong((id *)&self->_pipelineFunctionNameDictionary, 0);
  objc_storeStrong((id *)&self->_pipelineReflectionDictionary, 0);
  objc_storeStrong((id *)&self->_outputPorts, 0);
  objc_storeStrong((id *)&self->_inputPorts, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_portLinks, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_jsonData, 0);
}

@end
