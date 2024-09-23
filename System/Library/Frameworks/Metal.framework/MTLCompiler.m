@implementation MTLCompiler

- (void)compileRequest:(id)a3 pipelineCache:(id)a4 sync:(BOOL)a5 completionHandler:(id)a6
{
  -[MTLCompiler compileRequestInternal:binaryArchives:failOnBinaryArchiveMiss:pipelineCache:sync:completionHandler:](self, "compileRequestInternal:binaryArchives:failOnBinaryArchiveMiss:pipelineCache:sync:completionHandler:", a3, 0, 0, a4, a5, a6);
}

- (MTLHashKey)getFunctionId:(SEL)a3 airScript:(id)a4 vendorPluginFunctionId:(const void *)a5
{
  void *__p;
  void *v7;
  uint64_t v8;

  __p = 0;
  v7 = 0;
  v8 = 0;
  if (self)
  {
    -[MTLHashKey getFunctionId:airScript:vendorPluginFunctionId:bitcodeHashList:](self, "getFunctionId:airScript:vendorPluginFunctionId:bitcodeHashList:", a4, a5, a6, &__p);
    self = (MTLHashKey *)__p;
    if (__p)
    {
      v7 = __p;
      operator delete(__p);
    }
  }
  else
  {
    *(_OWORD *)&retstr->var1.var0[24] = 0u;
    *(_OWORD *)&retstr->var2.var1 = 0u;
    *(_OWORD *)&retstr->var0.var2 = 0u;
    *(_OWORD *)&retstr->var1.var0[8] = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }
  return self;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)getGPUCompilerHashForScript:(SEL)a3 type:(const void *)a4
{
  _OWORD *v6;
  uint64_t (*v7)(char *, SEL);
  __int128 v8;

  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[16] = 0u;
  if (a4)
  {
    switch(a5)
    {
      case 1uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1E0D23598];
        if (MEMORY[0x1E0D23598])
          goto LABEL_11;
        return self;
      case 2uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1E0D23578];
        if (MEMORY[0x1E0D23578])
          goto LABEL_11;
        return self;
      case 3uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1E0D23570];
        if (MEMORY[0x1E0D23570])
          goto LABEL_11;
        return self;
      case 5uLL:
      case 6uLL:
        v6 = (_OWORD *)MTLGPUCompilerHashFunctionScript();
        goto LABEL_12;
      case 7uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1E0D23588];
        if (MEMORY[0x1E0D23588])
          goto LABEL_11;
        return self;
      case 8uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1E0D23590];
        if (!MEMORY[0x1E0D23590])
          return self;
LABEL_11:
        v6 = (_OWORD *)v7((char *)a4 + *(unsigned int *)a4, a3);
LABEL_12:
        v8 = v6[1];
        *(_OWORD *)retstr->var0 = *v6;
        *(_OWORD *)&retstr->var0[16] = v8;
        free(v6);
        break;
      default:
        return self;
    }
  }
  return self;
}

- (void)compileFunctionRequest:(id)a3 completionHandler:(id)a4
{
  void *v7;

  v7 = (void *)objc_msgSend(a3, "function");
  if (objc_msgSend(v7, "functionType") == 5 || objc_msgSend(v7, "functionType") == 6)
    -[MTLCompiler compileStatelessFunctionRequest:reflectionOnly:completionHandler:](self, "compileStatelessFunctionRequest:reflectionOnly:completionHandler:", a3, 0, a4);
  else
    -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", a3, 0, 0, 0, a4);
}

- (void)compileFunctionRequestInternal:(id)a3 frameworkLinking:(BOOL)a4 linkDataSize:(unint64_t)a5 reflectionOnly:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v10;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v20;
  void *v21;
  unint64_t v22;
  unint64_t compilerFlags;
  unint64_t v24;
  unint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  char v29;
  int v30;
  int v31;
  char *v32;
  char *v33;
  char *v34;
  MTLBinaryKey *v35;
  NSObject *v36;
  NSObject *v37;
  void *Hash;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  int v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  int v50;
  int v51;
  id v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  int v58;
  int v59;
  id v60;
  uint64_t v61;
  _BOOL4 v62;
  dispatch_object_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  id v70;
  dispatch_object_t v71;
  NSObject *v72;
  dispatch_data_t subrange;
  dispatch_data_t v74;
  std::__shared_weak_count *v75;
  uint64_t v76;
  _QWORD *v77;
  id v78;
  uint64_t v79;
  _QWORD *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  _QWORD *v85;
  MTLBinaryEntry *v86;
  uint64_t v87;
  MTLBinaryEntry *v88;
  void *v89;
  NSObject *v90;
  uint64_t v91;
  _QWORD *v92;
  char v93;
  uint64_t v94;
  unint64_t *p_shared_owners;
  unint64_t v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD *v102;
  unsigned int v103;
  _QWORD *v104;
  _QWORD *v105;
  BOOL v106;
  unint64_t v107;
  int v108;
  int v109;
  uint64_t v110;
  void **v111;
  uint64_t v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  void *v117;
  int v118;
  int v119;
  int v120;
  char *v121;
  char *v122;
  uint64_t v123;
  unint64_t *v124;
  unint64_t v125;
  std::__shared_weak_count *v126;
  unint64_t *v127;
  unint64_t v128;
  void *v129;
  void *v130;
  MTLTargetDeviceArchitecture *v131;
  uint64_t v132;
  signed int v133;
  int v134;
  char v135;
  int v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  id v141;
  MTLCompilerConnectionManager *compilerConnectionManager;
  uint64_t compilerId;
  uint64_t v144;
  unint64_t *v145;
  unint64_t v146;
  unint64_t *v147;
  unint64_t v148;
  unint64_t *v149;
  unint64_t v150;
  unint64_t *v151;
  unint64_t v152;
  std::__shared_weak_count *v153;
  unint64_t *v154;
  unint64_t v155;
  std::__shared_weak_count *v156;
  unint64_t *v157;
  unint64_t v158;
  std::__shared_weak_count *v159;
  unint64_t *v160;
  unint64_t v161;
  std::__shared_weak_count *v162;
  unint64_t *v163;
  unint64_t v164;
  std::__shared_weak_count *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  std::__shared_weak_count *v169;
  unint64_t *v170;
  unint64_t v171;
  std::__shared_weak_count *v172;
  unint64_t *v173;
  unint64_t v174;
  std::__shared_weak_count *v175;
  unint64_t *v176;
  unint64_t v177;
  std::__shared_weak_count *v178;
  unint64_t *v179;
  unint64_t v180;
  BOOL v181;
  void *v182;
  char v183;
  unint64_t v184;
  int v185;
  uint64_t v186;
  const char *v187;
  unsigned int v188;
  _BOOL4 v189;
  int v190;
  _BOOL4 v191;
  int v192;
  dispatch_data_t v193;
  unsigned int v194;
  int v195;
  int v196;
  MTLBinaryKey *v197;
  void (**v198)(id, void **);
  _QWORD v199[12];
  std::__shared_weak_count *v200;
  char *v201;
  std::__shared_weak_count *v202;
  std::__shared_weak_count *v203;
  std::__shared_weak_count *v204;
  uint64_t v205;
  std::__shared_weak_count *v206;
  int v207;
  char v208;
  BOOL v209;
  std::__shared_weak_count *v210;
  std::__shared_weak_count *v211;
  std::__shared_weak_count *v212;
  std::__shared_weak_count *v213;
  uint64_t v214;
  uint64_t v215;
  size_t length;
  int *v217;
  size_t v218;
  void *v219;
  size_t v220;
  void *v221;
  size_t size_ptr;
  dispatch_object_t object;
  dispatch_object_t v224;
  void *buffer_ptr;
  uint64_t v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  CC_SHA256_CTX v233;
  id v234;
  char *v235;
  std::__shared_weak_count *v236;
  char *v237;
  std::__shared_weak_count *v238;
  char *v239;
  std::__shared_weak_count *v240;
  std::__shared_weak_count *v241;
  std::__shared_weak_count *v242;
  uint64_t v243;
  uint64_t *v244;
  uint64_t v245;
  char v246;
  uint64_t v247;
  uint64_t *v248;
  __int128 v249;
  __int128 v250;
  MTLHashKey v251;
  uint64_t v252;

  v8 = a6;
  v10 = a4;
  v252 = *MEMORY[0x1E0C80C00];
  v13 = objc_msgSend(a3, "function");
  if (!v13)
  {
    v247 = 2;
    v248 = (uint64_t *)CFSTR("function is nil");
    v249 = 0u;
    v250 = 0u;
    memset(&v251, 0, 64);
    (*((void (**)(id, uint64_t *))a7 + 2))(a7, &v247);
    return;
  }
  v14 = (void *)v13;
  v198 = (void (**)(id, void **))a7;
  if (!-[MTLCompiler validateLanguageAndAIRVersionForFunction:completionHandler:](self, "validateLanguageAndAIRVersionForFunction:completionHandler:", v13, a7))return;
  v15 = objc_msgSend(a3, "pipelineOptions");
  v16 = (void *)objc_msgSend(a3, "function");
  v17 = v16;
  v184 = a5;
  if (v16)
  {
    if (objc_msgSend(v16, "functionData"))
      LODWORD(v17) = *(_BYTE *)(objc_msgSend(v17, "functionData") + 88) != 0;
    else
      LODWORD(v17) = 0;
  }
  v18 = objc_msgSend(a3, "airScript");
  if ((v15 & 0xC1280000) != 0 || v18 == 0)
    v20 = 1;
  else
    v20 = (int)v17;
  v192 = v20;
  v21 = (void *)objc_msgSend(v14, "device");
  v22 = objc_msgSend(a3, "pipelineOptions");
  compilerFlags = self->_compilerFlags;
  v24 = objc_msgSend(v14, "functionType") - 1;
  v191 = v10;
  if (v24 > 7)
    v25 = -1;
  else
    v25 = qword_18281A6B8[v24];
  objc_msgSend(v14, "functionData");
  v26 = MTLGetCompilerOptions(v21, v22, compilerFlags, v25, v8);
  if ((v26 & 0x4000) != 0)
  {
    if (_MTLDebugIgnoreFailOnMissFlag())
      v27 = 0;
    else
      v27 = 2;
  }
  else
  {
    v27 = 0;
  }
  v28 = objc_msgSend((id)objc_msgSend(a3, "gpuCompilerSPIOptions"), "count");
  v186 = objc_msgSend(a3, "binaryArchives");
  v29 = (unint64_t)objc_msgSend(a3, "pipelineOptions") >> 32;
  v189 = 0;
  v195 = v26 & 0x102;
  if ((v26 & 2) == 0 && v191)
    v189 = (self->_compilerFlags & 0x20) == 0 && objc_msgSend(v14, "functionType") == 2;
  if (objc_msgSend(a3, "destinationBinaryArchive"))
    v183 = objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "supportsAIRNT");
  else
    v183 = 1;
  LOBYTE(v30) = 0;
  v243 = 0;
  v244 = &v243;
  v245 = 0x2020000000;
  v246 = 0;
  if ((v26 & 2) == 0)
  {
    if (objc_msgSend(a3, "destinationBinaryArchive"))
      v30 = objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "supportsAIRNT") & (v192 ^ 1);
    else
      LOBYTE(v30) = 0;
  }
  v246 = v30;
  if ((objc_msgSend(a3, "pipelineOptions") & 1) != 0)
  {
    if ((objc_msgSend(a3, "pipelineOptions") & 0x200008000) != 0)
      v31 = 1;
    else
      v31 = 5;
  }
  else
  {
    v31 = 1;
  }
  v185 = *((unsigned __int8 *)v244 + 24);
  if (*((_BYTE *)v244 + 24))
    v31 = 6;
  v188 = v31;
  MultiLevelCacheFactory::createBinaryCache(objc_msgSend(a3, "binaryArchives"), (void *)objc_msgSend(a3, "destinationBinaryArchive"), (void *)objc_msgSend(a3, "pipelineCache"), (uint64_t)self->_shaderCache.__ptr_, v29 & 4 | v27, &v241);
  v32 = (char *)operator new(0x40uLL);
  *((_QWORD *)v32 + 1) = 0;
  *((_QWORD *)v32 + 2) = 0;
  *(_QWORD *)v32 = &off_1E0FE21D0;
  *(_OWORD *)(v32 + 40) = 0u;
  *(_OWORD *)(v32 + 24) = 0u;
  *((_DWORD *)v32 + 14) = 1065353216;
  v239 = v32 + 24;
  v240 = (std::__shared_weak_count *)v32;
  v33 = (char *)operator new(0x40uLL);
  *((_QWORD *)v33 + 1) = 0;
  *((_QWORD *)v33 + 2) = 0;
  *(_QWORD *)v33 = &off_1E0FE21D0;
  *(_OWORD *)(v33 + 40) = 0u;
  *(_OWORD *)(v33 + 24) = 0u;
  *((_DWORD *)v33 + 14) = 1065353216;
  v237 = v33 + 24;
  v238 = (std::__shared_weak_count *)v33;
  v34 = (char *)operator new(0x40uLL);
  *((_QWORD *)v34 + 1) = 0;
  *((_QWORD *)v34 + 2) = 0;
  *(_QWORD *)v34 = &off_1E0FE2198;
  *(_OWORD *)(v34 + 40) = 0u;
  *(_OWORD *)(v34 + 24) = 0u;
  *((_DWORD *)v34 + 14) = 1065353216;
  v235 = v34 + 24;
  v236 = (std::__shared_weak_count *)v34;
  v247 = 0;
  v248 = &v247;
  *(_QWORD *)&v249 = 0x8012000000;
  *((_QWORD *)&v249 + 1) = __Block_byref_object_copy__1100;
  *(_QWORD *)&v250 = __Block_byref_object_dispose__1101;
  *((_QWORD *)&v250 + 1) = &unk_182827312;
  -[MTLCompiler getFunctionId:](self, "getFunctionId:", a3);
  v35 = [MTLBinaryKey alloc];
  v197 = -[MTLBinaryKey initWithHash:](v35, "initWithHash:", v248 + 6);
  FunctionHashFactory::FunctionHashFactory(&v233, v14, objc_msgSend(v14, "functionData"), v26, (void *)objc_msgSend(a3, "gpuCompilerSPIOptions"), (void *)objc_msgSend(a3, "visibleFunctions"), (void *)objc_msgSend(a3, "privateVisibleFunctions"));
  v190 = v26 & 0x1002;
  if (v190 == 4096)
  {
    v36 = objc_msgSend(a3, "driverKeyData");
    goto LABEL_45;
  }
  v36 = 0;
  v37 = 0;
  if (v28)
LABEL_45:
    v37 = objc_msgSend(a3, "frameworkData");
  Hash = FunctionHashFactory::createHash((uint64_t)&v233, 2, v36, v37);
  v181 = (v26 & 0x102) == 256;
  v39 = (uint64_t)v235;
  LOBYTE(object) = 2;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v235, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = Hash;
  v40 = FunctionHashFactory::createHash((uint64_t)&v233, 0, (dispatch_data_t)objc_msgSend(a3, "driverKeyData"), objc_msgSend(a3, "frameworkData"));
  LOBYTE(object) = 0;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v39, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v40;
  v41 = FunctionHashFactory::createHash((uint64_t)&v233, 1, (dispatch_data_t)objc_msgSend(a3, "driverKeyData"), objc_msgSend(a3, "frameworkData"));
  LOBYTE(object) = 1;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v39, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v41;
  v42 = FunctionHashFactory::createHash((uint64_t)&v233, 3, 0, 0, 0, 0);
  LOBYTE(object) = 3;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v39, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v42;
  v43 = FunctionHashFactory::createHash((uint64_t)&v233, 6, (dispatch_data_t)objc_msgSend(a3, "driverKeyData"), objc_msgSend(a3, "frameworkData"));
  LOBYTE(object) = 6;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v39, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v43;
  v182 = v40;
  if ((((uint64_t (*)(std::__shared_weak_count *))v241->__vftable[2].~__shared_weak_count_0)(v241) & 1) != 0)
  {
    v44 = "binary archives";
  }
  else
  {
    v45 = ((uint64_t (*)(std::__shared_weak_count *))v241->__get_deleter)(v241);
    v44 = "FS cache";
    if (v45)
      v44 = "pipeline library";
  }
  v187 = v44;
  if (v195 == 256)
  {
    v46 = v241;
    LOBYTE(object) = 3;
    buffer_ptr = &object;
    v47 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v39, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3];
    v48 = (uint64_t)v237;
    LOBYTE(size_ptr) = 3;
    buffer_ptr = &size_ptr;
    v49 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v237, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
    ((void (*)(std::__shared_weak_count *, uint64_t, _QWORD *))v46->__vftable[2].__on_zero_shared_weak)(v46, v47, v49 + 3);
    LOBYTE(object) = 3;
    buffer_ptr = &object;
    if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v48, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3])
    {
      v50 = ((uint64_t (*)(std::__shared_weak_count *))v241->__vftable[1].~__shared_weak_count)(v241);
      v51 = v186 ? 0 : v50;
      if (v51 == 1)
      {
        -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v48, v39);
        v52 = -[MTLCompiler createErrorMessageWithRequest:key:cacheType:itemLookedFor:](self, "createErrorMessageWithRequest:key:cacheType:itemLookedFor:", a3, v197, v187, "pipeline statistics");

        v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v52);
        buffer_ptr = (void *)2;
        v226 = v53;
        v227 = 0u;
        v228 = 0u;
        v229 = 0u;
        v230 = 0u;
        v231 = 0u;
        v232 = 0u;
        v198[2](v198, &buffer_ptr);
        goto LABEL_235;
      }
    }
  }
  if (v190 == 4096)
  {
    v54 = v241;
    LOBYTE(object) = 6;
    buffer_ptr = &object;
    v55 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v39, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3];
    v56 = (uint64_t)v237;
    LOBYTE(size_ptr) = 6;
    buffer_ptr = &size_ptr;
    v57 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v237, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
    ((void (*)(std::__shared_weak_count *, uint64_t, _QWORD *))v54->__vftable[2].__on_zero_shared_weak)(v54, v55, v57 + 3);
    LOBYTE(object) = 6;
    buffer_ptr = &object;
    if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v56, (char *)&object, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3])
    {
      v58 = ((uint64_t (*)(std::__shared_weak_count *))v241->__vftable[1].~__shared_weak_count)(v241);
      v59 = v186 ? 0 : v58;
      if (v59 == 1)
      {
        -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v56, v39);
        v60 = -[MTLCompiler createErrorMessageWithRequest:key:cacheType:itemLookedFor:](self, "createErrorMessageWithRequest:key:cacheType:itemLookedFor:", a3, v197, v187, "debug instrumentation data");

        v61 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v60);
        buffer_ptr = (void *)2;
        v226 = v61;
        v227 = 0u;
        v228 = 0u;
        v229 = 0u;
        v230 = 0u;
        v231 = 0u;
        v232 = 0u;
        v198[2](v198, &buffer_ptr);
        goto LABEL_235;
      }
    }
  }
  object = 0;
  v224 = 0;
  if ((v192 & 1) == 0)
  {
    if (*((_BYTE *)v244 + 24)
      && (((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, dispatch_object_t *, dispatch_object_t *, _QWORD))v241->__vftable[4].~__shared_weak_count)(v241, v197, &object, &v224, v188) & 1) != 0)
    {
      *((_BYTE *)v244 + 24) = 0;
LABEL_69:
      v62 = 1;
      goto LABEL_71;
    }
    if ((((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, dispatch_object_t *, dispatch_object_t *, _QWORD))v241->__vftable[2].__on_zero_shared)(v241, v197, &object, &v224, v188) & 1) != 0)goto LABEL_69;
  }
  ((void (*)(std::__shared_weak_count *, void *, dispatch_object_t *))v241->__vftable[2].__on_zero_shared_weak)(v241, Hash, &v224);
  v62 = 0;
LABEL_71:
  v63 = v224;
  if (!v224)
  {
    if ((((uint64_t (*)(std::__shared_weak_count *))v241->__vftable[1].~__shared_weak_count)(v241) & 1) != 0)
    {
      v64 = -[MTLCompiler createErrorMessageWithRequest:key:cacheType:itemLookedFor:](self, "createErrorMessageWithRequest:key:cacheType:itemLookedFor:", a3, v197, v187, 0);
      v65 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v64);
      buffer_ptr = (void *)2;
      v226 = v65;
      v227 = 0u;
      v228 = 0u;
      v229 = 0u;
      v230 = 0u;
      v231 = 0u;
      v232 = 0u;
      -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v237, v39);

      if (object)
        dispatch_release(object);
      v198[2](v198, &buffer_ptr);
      goto LABEL_235;
    }
    v63 = v224;
  }
  v66 = (uint64_t)v237;
  LOBYTE(v221) = 2;
  buffer_ptr = &v221;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v237, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v63;
  if ((v26 & 2) != 0 && v224)
  {
    FunctionReplyParameters::FunctionReplyParameters(&buffer_ptr, 0, 0, v66, v39);
    v198[2](v198, &buffer_ptr);
    if (object)
      dispatch_release(object);
    -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v66, v39);

    goto LABEL_235;
  }
  if (v224)
    v67 = v62;
  else
    v67 = 1;
  if ((v67 & 1) == 0)
  {
    if (*((_BYTE *)v244 + 24))
    {
      v68 = MTLGetReflectionFlags(v224);
      if (v68 > 1)
      {
        v62 = (~v68 & 6) == 0;
      }
      else
      {
        if (((unsigned int (*)(std::__shared_weak_count *))v241->__vftable[1].~__shared_weak_count)(v241))
        {
          -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v66, v39);
          v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Source and destination are not compatible. The request requires legacy data to be stored on a new binary archive"));

          if (object)
            dispatch_release(object);
          buffer_ptr = (void *)2;
          v226 = v69;
          v227 = 0u;
          v228 = 0u;
          v229 = 0u;
          v230 = 0u;
          v231 = 0u;
          v232 = 0u;
          v198[2](v198, &buffer_ptr);
          goto LABEL_235;
        }
        dispatch_release(v224);
        LOBYTE(v221) = 2;
        v224 = 0;
        buffer_ptr = &v221;
        v62 = 0;
        std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = 0;
      }
    }
    else
    {
      v62 = 0;
    }
  }
  if ((v26 & 2) == 0
    && !object
    && (((uint64_t (*)(std::__shared_weak_count *, void *, dispatch_object_t *))v241->__vftable[2].__on_zero_shared_weak)(v241, v182, &object) & 1) == 0&& ((unsigned int (*)(std::__shared_weak_count *))v241->__vftable[1].~__shared_weak_count)(v241))
  {
    -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v66, v39);
    v70 = -[MTLCompiler createErrorMessageWithRequest:key:cacheType:itemLookedFor:](self, "createErrorMessageWithRequest:key:cacheType:itemLookedFor:", a3, v197, v187, 0);

    buffer_ptr = (void *)2;
    v226 = (uint64_t)v70;
    v227 = 0u;
    v228 = 0u;
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v232 = 0u;
    v198[2](v198, &buffer_ptr);
    goto LABEL_235;
  }
  v71 = object;
  LOBYTE(v221) = 0;
  buffer_ptr = &v221;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v71;
  if (!v189)
  {
    v193 = 0;
    goto LABEL_116;
  }
  if (object)
  {
    buffer_ptr = 0;
    size_ptr = 0;
    v72 = dispatch_data_create_map(object, (const void **)&buffer_ptr, &size_ptr);
    v220 = 0;
    v221 = 0;
    v218 = 0;
    v219 = 0;
    if (_MTLDecodeLinkingInfo((int *)buffer_ptr, &v221, &v220, &v219, &v218))
    {
      subrange = dispatch_data_create_subrange(object, (size_t)v221, v220);
      v74 = dispatch_data_create_subrange(object, (size_t)v219, v218);
      dispatch_release(v72);
      v193 = subrange;
      if (subrange)
      {
        LOBYTE(v221) = 1;
        buffer_ptr = &v221;
        std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v74;
        goto LABEL_116;
      }
    }
    else
    {
      dispatch_release(v72);
    }
  }
  v75 = v241;
  LOBYTE(v221) = 1;
  buffer_ptr = &v221;
  v76 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v39, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3];
  LOBYTE(v220) = 1;
  buffer_ptr = &v220;
  v77 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v220, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
  ((void (*)(std::__shared_weak_count *, uint64_t, _QWORD *))v75->__vftable[2].__on_zero_shared_weak)(v75, v76, v77 + 3);
  LOBYTE(v221) = 1;
  buffer_ptr = &v221;
  if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3]&& ((unsigned int (*)(std::__shared_weak_count *))v241->__vftable[1].~__shared_weak_count)(v241))
  {
    -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v66, v39);
    v78 = -[MTLCompiler createErrorMessageWithRequest:key:cacheType:itemLookedFor:](self, "createErrorMessageWithRequest:key:cacheType:itemLookedFor:", a3, v197, v187, "linking data");

    v79 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v78);
    buffer_ptr = (void *)2;
    v226 = v79;
    v227 = 0u;
    v228 = 0u;
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v232 = 0u;
    v198[2](v198, &buffer_ptr);
    goto LABEL_235;
  }
  LOBYTE(v221) = 1;
  buffer_ptr = &v221;
  v80 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
  v193 = 0;
  if (v185)
  {
    if (object)
    {
      v81 = v80[3];
      if (v81)
      {
        v221 = 0;
        size_ptr = 0;
        v82 = dispatch_data_create_map(v81, (const void **)&v221, &size_ptr);
        v219 = 0;
        v220 = 0;
        v83 = dispatch_data_create_map(object, (const void **)&v219, &v220);
        v217 = 0;
        v218 = 0;
        _MTLEncodeLinkingInfo(v219, v220, v221, size_ptr, (uint64_t)&v217, &v218);
        dispatch_release(v82);
        dispatch_release(v83);
        v84 = dispatch_data_create(v217, v218, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
        LOBYTE(v215) = 0;
        buffer_ptr = &v215;
        if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v215, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3])
        {
          LOBYTE(v215) = 0;
          buffer_ptr = &v215;
          v85 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v215, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
          dispatch_release((dispatch_object_t)v85[3]);
        }
        dispatch_retain(v84);
        LOBYTE(v215) = 0;
        buffer_ptr = &v215;
        std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v215, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v84;
        buffer_ptr = 0;
        v215 = 0;
        length = 0;
        v214 = 0;
        _MTLDecodeLinkingInfo(v217, &buffer_ptr, &length, &v215, &v214);
        v193 = dispatch_data_create_subrange(v84, (size_t)buffer_ptr, length);
        dispatch_release(v84);
      }
    }
  }
LABEL_116:
  if (v185 && object && v62)
  {
    v86 = [MTLBinaryEntry alloc];
    LOBYTE(v221) = 0;
    buffer_ptr = &v221;
    v87 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3];
    LOBYTE(v220) = 2;
    buffer_ptr = &v220;
    v88 = -[MTLBinaryEntry initWithData:reflectionBlock:](v86, "initWithData:reflectionBlock:", v87, std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v220, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3]);
    v89 = (void *)objc_msgSend(a3, "function");
    -[MTLBinaryEntry setAirScript:](v88, "setAirScript:", objc_msgSend(a3, "airScript"));
    v90 = objc_msgSend(v89, "bitcodeDataInternal");
    -[MTLBinaryEntry setBitcode:](v88, "setBitcode:", v90);
    dispatch_release(v90);
    -[MTLBinaryEntry setLinkedBitcodes:](v88, "setLinkedBitcodes:", -[MTLCompiler newLinkedFunctionsBitcodeFromRequest:hashKey:](self, "newLinkedFunctionsBitcodeFromRequest:hashKey:", a3, v248 + 6));

    v91 = ((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, MTLBinaryEntry *, uint64_t, uint64_t))v241->__vftable[3].~__shared_weak_count_0)(v241, v197, v88, objc_msgSend(a3, "archiverId"), objc_msgSend(v89, "functionType"));
    LOBYTE(v221) = 7;
    buffer_ptr = &v221;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v91;

  }
  if (v193)
  {
    LOBYTE(v221) = 0;
    buffer_ptr = &v221;
    if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3])
    {
      LOBYTE(v221) = 0;
      buffer_ptr = &v221;
      v92 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
      dispatch_release((dispatch_object_t)v92[3]);
    }
    LOBYTE(v221) = 0;
    buffer_ptr = &v221;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] = v193;
  }
  LOBYTE(v221) = 0;
  buffer_ptr = &v221;
  if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3])
  {
    if (*((_BYTE *)v244 + 24))
      v93 = 1;
    else
      v93 = v183;
    if ((v93 & 1) == 0)
    {
      v94 = objc_msgSend(v14, "libraryData");
      v212 = v241;
      v213 = v242;
      if (v242)
      {
        p_shared_owners = (unint64_t *)&v242->__shared_owners_;
        do
          v96 = __ldxr(p_shared_owners);
        while (__stxr(v96 + 1, p_shared_owners));
      }
      -[MTLCompiler cacheLegacyCompilerData:cachedData:hashMap:libraryData:functionCache:](self, "cacheLegacyCompilerData:cachedData:hashMap:libraryData:functionCache:", v66, 0, v39, v94, &v212);
      v97 = v213;
      if (v213)
      {
        v98 = (unint64_t *)&v213->__shared_owners_;
        do
          v99 = __ldaxr(v98);
        while (__stlxr(v99 - 1, v98));
        if (!v99)
        {
          ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
          std::__shared_weak_count::__release_weak(v97);
        }
      }
    }
    v66 = (uint64_t)v237;
    LOBYTE(v221) = 2;
    buffer_ptr = &v221;
    v100 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v237, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
    if ((v26 & 1) == 0 || v100[3])
    {
      LOBYTE(v220) = 3;
      buffer_ptr = &v220;
      v101 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v220, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
      if (v195 != 256 || v101[3])
      {
        LOBYTE(v219) = 6;
        buffer_ptr = &v219;
        v102 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v219, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
        if ((v26 & 0x1000) == 0 || v102[3])
        {
          if (v185)
          {
            v165 = v241;
            LOBYTE(v221) = 7;
            buffer_ptr = &v221;
            v166 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3];
            ((void (*)(std::__shared_weak_count *, uint64_t, MTLBinaryKey *, uint64_t))v165->__vftable[3].__on_zero_shared)(v165, v166, v197, objc_msgSend(v14, "functionType"));
          }
          v167 = (uint64_t)v235;
          FunctionReplyParameters::FunctionReplyParameters(&buffer_ptr, 0, 0, v66, (uint64_t)v235);
          v198[2](v198, &buffer_ptr);
          -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v66, v167);

          goto LABEL_235;
        }
      }
    }
  }
  LOBYTE(v221) = 2;
  buffer_ptr = &v221;
  if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3])v103 = v26 & 0xFFFFFFFE;
  else
    v103 = v26;
  LOBYTE(v221) = 0;
  buffer_ptr = &v221;
  if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3])
  {
    LOBYTE(v220) = 3;
    buffer_ptr = &v220;
    v104 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v220, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
    if (v195 != 256 || v104[3])
    {
      LOBYTE(v219) = 6;
      buffer_ptr = &v219;
      v105 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v219, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr);
      if (v190 != 4096 || v105[3])
      {
        LOBYTE(v218) = 1;
        buffer_ptr = &v218;
        if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v66, (char *)&v218, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3] != 0|| !v189)
        {
          v103 |= 2u;
        }
      }
    }
  }
  v194 = v103;
  v106 = v191;
  if ((v26 & 0x10) != 0)
    v106 = 0;
  v107 = self->_compilerFlags;
  if ((v107 & 2) != 0)
    v108 = 12;
  else
    v108 = 4;
  if (v106 && (self->_compilerFlags & 0x20) == 0)
    v109 = v108;
  else
    v109 = 0;
  v196 = v109;
  v110 = operator new();
  *(_QWORD *)(v110 + 16) = 0;
  *(_QWORD *)(v110 + 32) = 0;
  v111 = (void **)(v110 + 32);
  *(_QWORD *)v110 = &off_1E0FE1100;
  *(_OWORD *)(v110 + 64) = 0u;
  *(_DWORD *)(v110 + 128) = 0;
  *(_BYTE *)(v110 + 132) = 0;
  *(_QWORD *)(v110 + 40) = 0;
  *(_OWORD *)(v110 + 109) = 0u;
  *(_OWORD *)(v110 + 80) = 0u;
  *(_OWORD *)(v110 + 96) = 0u;
  *(_OWORD *)(v110 + 136) = 0u;
  *(_OWORD *)(v110 + 152) = 0u;
  *(_OWORD *)(v110 + 168) = 0u;
  *(_DWORD *)(v110 + 8) = 1;
  *(_BYTE *)(v110 + 124) = 1;
  *(_DWORD *)(v110 + 128) = -[_MTLDevice llvmVersion](self->_device, "llvmVersion");
  v112 = (uint64_t)v235;
  LOBYTE(v221) = 0;
  buffer_ptr = &v221;
  objc_msgSend((id)std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v235, (char *)&v221, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3], "value");
  v113 = objc_msgSend(a3, "driverKeyData");
  v114 = v113;
  if (v113)
    dispatch_retain(v113);
  *(_QWORD *)(v110 + 16) = v114;
  *(_QWORD *)(v110 + 80) = v184;
  v115 = objc_msgSend(a3, "frameworkData");
  v116 = v115;
  if (v115)
    dispatch_retain(v115);
  *(_QWORD *)(v110 + 64) = v116;
  v117 = *v111;
  if (*v111 != v14)
  {
    if (v117)

    *v111 = v14;
  }
  *(_QWORD *)(v110 + 88) = (id)objc_msgSend(a3, "visibleFunctions");
  *(_QWORD *)(v110 + 104) = (id)objc_msgSend(a3, "visibleFunctionGroups");
  v118 = ((_DWORD)v107 << 8) & 0x8000 | v196 | v194;
  *(_QWORD *)(v110 + 96) = (id)objc_msgSend(a3, "privateVisibleFunctions");
  *(_DWORD *)(v110 + 48) = v118;
  v119 = (int)-[_MTLDevice limits](self->_device, "limits")[56];
  v120 = (int)-[_MTLDevice limits](self->_device, "limits")[188];
  *(_DWORD *)(v110 + 52) = v119;
  *(_DWORD *)(v110 + 56) = v120;
  *(_DWORD *)(v110 + 24) = objc_msgSend(a3, "maxAccelerationStructureTraversalDepth");
  size_ptr = 0;
  v121 = v239;
  if (*(_BYTE *)(v110 + 124))
    v122 = 0;
  else
    v122 = v239;
  if (-[MTLCompiler downgradeRequest:frameworkData:error:](self, "downgradeRequest:frameworkData:error:", v110, v122, &size_ptr))
  {
    v123 = objc_msgSend(v14, "libraryData");
    v210 = v241;
    v211 = v242;
    if (v242)
    {
      v124 = (unint64_t *)&v242->__shared_owners_;
      do
        v125 = __ldxr(v124);
      while (__stxr(v125 + 1, v124));
    }
    -[MTLCompiler cacheLegacyCompilerData:cachedData:hashMap:libraryData:functionCache:](self, "cacheLegacyCompilerData:cachedData:hashMap:libraryData:functionCache:", v121, v66, v112, v123, &v210);
    v126 = v211;
    if (v211)
    {
      v127 = (unint64_t *)&v211->__shared_owners_;
      do
        v128 = __ldaxr(v127);
      while (__stlxr(v128 - 1, v127));
      if (!v128)
      {
        ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
        std::__shared_weak_count::__release_weak(v126);
      }
    }
    v129 = (void *)objc_msgSend(a3, "gpuCompilerSPIOptions");
    v130 = *(void **)(v110 + 176);
    if (v130)

    *(_QWORD *)(v110 + 176) = v129;
    v131 = -[_MTLDevice targetDeviceArchitecture](self->_device, "targetDeviceArchitecture");
    v132 = -[MTLTargetDeviceArchitecture cpuType](v131, "cpuType");
    v133 = -[MTLTargetDeviceArchitecture subType](v131, "subType");
    if (objc_msgSend(a3, "airScript"))
      MTLCompilerFunctionRequest::setAirScript(v110, (dispatch_object_t)objc_msgSend(a3, "airScript"));
    *(_QWORD *)(v110 + 160) = v133 | (unint64_t)(v132 << 32);
    if (!objc_msgSend(a3, "destinationBinaryArchive"))
    {
      v135 = 0;
      goto LABEL_194;
    }
    v134 = objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "remoteInsertionBegin");
    v135 = v134;
    if (*((_BYTE *)v244 + 24))
      v136 = v134;
    else
      v136 = 0;
    if (v136 != 1)
      goto LABEL_194;
    *(_BYTE *)(v110 + 132) = 1;
    v221 = 0;
    v137 = (void *)objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "getArchiveIDWithErrorInternal:", &v221);
    if (v137)
    {
      MTLCompilerFunctionRequest::setBinaryArchiveID((MTLCompilerFunctionRequest *)v110, (const char *)objc_msgSend(v137, "UTF8String"));
      *(_QWORD *)(v110 + 144) = v248 + 6;
      v135 = 1;
LABEL_194:
      v139 = (uint64_t)v237;
      LOBYTE(v220) = 7;
      buffer_ptr = &v220;
      if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v237, (char *)&v220, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3])
      {
        LOBYTE(v220) = 7;
        buffer_ptr = &v220;
        v140 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v139, (char *)&v220, (uint64_t)&std::piecewise_construct, (_BYTE **)&buffer_ptr)[3];
      }
      else
      {
        v140 = objc_msgSend(a3, "archiverId");
      }
      *(_QWORD *)(v110 + 168) = v140;
      if (v140)
        dispatch_retain(v140);
      v141 = a3;
      compilerConnectionManager = self->_compilerConnectionManager;
      compilerId = self->_compilerId;
      v144 = objc_msgSend(a3, "sync");
      v199[0] = MEMORY[0x1E0C809B0];
      v199[1] = 3321888768;
      v199[2] = __109__MTLCompiler_compileFunctionRequestInternal_frameworkLinking_linkDataSize_reflectionOnly_completionHandler___block_invoke;
      v199[3] = &unk_1E0FE22A8;
      v199[4] = a3;
      v199[11] = v139;
      v200 = v238;
      if (v238)
      {
        v145 = (unint64_t *)&v238->__shared_owners_;
        do
          v146 = __ldxr(v145);
        while (__stxr(v146 + 1, v145));
      }
      v201 = v239;
      v202 = v240;
      if (v240)
      {
        v147 = (unint64_t *)&v240->__shared_owners_;
        do
          v148 = __ldxr(v147);
        while (__stxr(v148 + 1, v147));
      }
      v207 = v118;
      v199[9] = &v243;
      v199[5] = self;
      v208 = v135;
      v199[10] = &v247;
      v203 = v241;
      v204 = v242;
      if (v242)
      {
        v149 = (unint64_t *)&v242->__shared_owners_;
        do
          v150 = __ldxr(v149);
        while (__stxr(v150 + 1, v149));
      }
      v199[6] = v197;
      v199[7] = v14;
      v205 = (uint64_t)v235;
      v206 = v236;
      if (v236)
      {
        v151 = (unint64_t *)&v236->__shared_owners_;
        do
          v152 = __ldxr(v151);
        while (__stxr(v152 + 1, v151));
      }
      v209 = v181;
      v199[8] = v198;
      (*((void (**)(MTLCompilerConnectionManager *, uint64_t, uint64_t, uint64_t, _QWORD *))compilerConnectionManager->var0
       + 3))(compilerConnectionManager, compilerId, v110, v144, v199);
      v153 = v206;
      if (v206)
      {
        v154 = (unint64_t *)&v206->__shared_owners_;
        do
          v155 = __ldaxr(v154);
        while (__stlxr(v155 - 1, v154));
        if (!v155)
        {
          ((void (*)(std::__shared_weak_count *))v153->__on_zero_shared)(v153);
          std::__shared_weak_count::__release_weak(v153);
        }
      }
      v156 = v204;
      if (v204)
      {
        v157 = (unint64_t *)&v204->__shared_owners_;
        do
          v158 = __ldaxr(v157);
        while (__stlxr(v158 - 1, v157));
        if (!v158)
        {
          ((void (*)(std::__shared_weak_count *))v156->__on_zero_shared)(v156);
          std::__shared_weak_count::__release_weak(v156);
        }
      }
      v159 = v202;
      if (v202)
      {
        v160 = (unint64_t *)&v202->__shared_owners_;
        do
          v161 = __ldaxr(v160);
        while (__stlxr(v161 - 1, v160));
        if (!v161)
        {
          ((void (*)(std::__shared_weak_count *))v159->__on_zero_shared)(v159);
          std::__shared_weak_count::__release_weak(v159);
        }
      }
      v162 = v200;
      if (v200)
      {
        v163 = (unint64_t *)&v200->__shared_owners_;
        do
          v164 = __ldaxr(v163);
        while (__stlxr(v164 - 1, v163));
        if (!v164)
        {
          ((void (*)(std::__shared_weak_count *))v162->__on_zero_shared)(v162);
          std::__shared_weak_count::__release_weak(v162);
        }
      }
      goto LABEL_235;
    }
    objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "remoteInsertionEnd");
    -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v237, v235);

    v168 = objc_msgSend(v221, "localizedDescription");
    buffer_ptr = (void *)2;
    v226 = v168;
    v227 = 0u;
    v228 = 0u;
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v232 = 0u;
    v198[2](v198, &buffer_ptr);
    (*(void (**)(uint64_t))(*(_QWORD *)v110 + 8))(v110);
  }
  else
  {

    -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v66, v112);
    v138 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Downgrade failed with error: %@"), objc_msgSend((id)size_ptr, "localizedDescription"));
    buffer_ptr = (void *)2;
    v226 = v138;
    v227 = 0u;
    v228 = 0u;
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v232 = 0u;
    v198[2](v198, &buffer_ptr);
  }
LABEL_235:

  _Block_object_dispose(&v247, 8);
  MTLHashKey::~MTLHashKey(&v251);
  v169 = v236;
  if (v236)
  {
    v170 = (unint64_t *)&v236->__shared_owners_;
    do
      v171 = __ldaxr(v170);
    while (__stlxr(v171 - 1, v170));
    if (!v171)
    {
      ((void (*)(std::__shared_weak_count *))v169->__on_zero_shared)(v169);
      std::__shared_weak_count::__release_weak(v169);
    }
  }
  v172 = v238;
  if (v238)
  {
    v173 = (unint64_t *)&v238->__shared_owners_;
    do
      v174 = __ldaxr(v173);
    while (__stlxr(v174 - 1, v173));
    if (!v174)
    {
      ((void (*)(std::__shared_weak_count *))v172->__on_zero_shared)(v172);
      std::__shared_weak_count::__release_weak(v172);
    }
  }
  v175 = v240;
  if (v240)
  {
    v176 = (unint64_t *)&v240->__shared_owners_;
    do
      v177 = __ldaxr(v176);
    while (__stlxr(v177 - 1, v176));
    if (!v177)
    {
      ((void (*)(std::__shared_weak_count *))v175->__on_zero_shared)(v175);
      std::__shared_weak_count::__release_weak(v175);
    }
  }
  v178 = v242;
  if (v242)
  {
    v179 = (unint64_t *)&v242->__shared_owners_;
    do
      v180 = __ldaxr(v179);
    while (__stlxr(v180 - 1, v179));
    if (!v180)
    {
      ((void (*)(std::__shared_weak_count *))v178->__on_zero_shared)(v178);
      std::__shared_weak_count::__release_weak(v178);
    }
  }
  _Block_object_dispose(&v243, 8);
}

- (BOOL)validateLanguageAndAIRVersionForFunction:(id)a3 completionHandler:(id)a4
{
  unsigned __int16 *v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v12;
  _QWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v7 = (unsigned __int16 *)objc_msgSend(a3, "functionData");
  v8 = _MTLGetMTLCompilerLLVMVersionForDevice(self->_device);
  if ((v8 - 32023) >= 2)
    v9 = 0;
  else
    v9 = 131079;
  if ((v8 - 32023) >= 2)
    v10 = 0;
  else
    v10 = 196610;
  if (validateLanguageVersion(v7[27] | (v7[26] << 16), v10))
  {
    if (validateAIRVersion(v7[25] | (v7[24] << 16), v9))
      return 1;
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Function %@ has a deployment target (0x%08X) which is incompatible with this OS (0x%08X)."), objc_msgSend(a3, "name"), v7[25] | (v7[24] << 16), v9);
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Function %@ is using language version %u.%u which is incompatible with this OS."), objc_msgSend(a3, "name"), v7[26], v7[27]);
  }
  v13[0] = 2;
  v13[1] = v12;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  (*((void (**)(id, _QWORD *))a4 + 2))(a4, v13);
  return 0;
}

- (MTLHashKey)getFunctionId:(SEL)a3
{
  MTLHashKey *result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t *v20;
  char *v21;
  size_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t *v36;
  char *v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  MTLCompiler *v41;
  MTLHashKey *v42;
  NSObject *object;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  size_t size_ptr;
  char *v53;
  char *v54;
  void *buffer_ptr;
  _BYTE v56[128];
  _BYTE v57[128];
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "airScript"))
  {
    v58 = 0uLL;
    v59 = 0uLL;
    if (a4)
      objc_msgSend(a4, "vendorPluginFunctionId");
    buffer_ptr = 0;
    if (objc_msgSend(a4, "airScript"))
    {
      size_ptr = 0;
      object = dispatch_data_create_map((dispatch_data_t)objc_msgSend(a4, "airScript"), (const void **)&buffer_ptr, &size_ptr);
    }
    else
    {
      object = 0;
    }
    size_ptr = 0;
    v53 = 0;
    v54 = 0;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v8 = (void *)objc_msgSend(a4, "visibleFunctions");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    v41 = self;
    v42 = retstr;
    if (v9)
    {
      v10 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v8);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "bitCodeHash");
          v13 = v12;
          v14 = v53;
          if (v53 >= v54)
          {
            v16 = (uint64_t)&v53[-size_ptr] >> 3;
            if ((unint64_t)(v16 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v17 = (uint64_t)&v54[-size_ptr] >> 2;
            if (v17 <= v16 + 1)
              v17 = v16 + 1;
            if ((unint64_t)&v54[-size_ptr] >= 0x7FFFFFFFFFFFFFF8)
              v18 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v18 = v17;
            if (v18)
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v54, v18);
            else
              v19 = 0;
            v20 = (uint64_t *)&v19[8 * v16];
            *v20 = v13;
            v15 = (char *)(v20 + 1);
            v22 = size_ptr;
            v21 = v53;
            if (v53 != (char *)size_ptr)
            {
              do
              {
                v23 = *((_QWORD *)v21 - 1);
                v21 -= 8;
                *--v20 = v23;
              }
              while (v21 != (char *)v22);
              v21 = (char *)size_ptr;
            }
            size_ptr = (size_t)v20;
            v53 = v15;
            v54 = &v19[8 * v18];
            if (v21)
              operator delete(v21);
          }
          else
          {
            *(_QWORD *)v53 = v12;
            v15 = v14 + 8;
          }
          v53 = v15;
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v9);
    }
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v24 = (void *)objc_msgSend(a4, "privateVisibleFunctions");
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v24);
          v28 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "bitCodeHash");
          v29 = v28;
          v30 = v53;
          if (v53 >= v54)
          {
            v32 = (uint64_t)&v53[-size_ptr] >> 3;
            if ((unint64_t)(v32 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v33 = (uint64_t)&v54[-size_ptr] >> 2;
            if (v33 <= v32 + 1)
              v33 = v32 + 1;
            if ((unint64_t)&v54[-size_ptr] >= 0x7FFFFFFFFFFFFFF8)
              v34 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v34 = v33;
            if (v34)
              v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v54, v34);
            else
              v35 = 0;
            v36 = (uint64_t *)&v35[8 * v32];
            *v36 = v29;
            v31 = (char *)(v36 + 1);
            v38 = size_ptr;
            v37 = v53;
            if (v53 != (char *)size_ptr)
            {
              do
              {
                v39 = *((_QWORD *)v37 - 1);
                v37 -= 8;
                *--v36 = v39;
              }
              while (v37 != (char *)v38);
              v37 = (char *)size_ptr;
            }
            size_ptr = (size_t)v36;
            v53 = v31;
            v54 = &v35[8 * v34];
            if (v37)
              operator delete(v37);
          }
          else
          {
            *(_QWORD *)v53 = v28;
            v31 = v30 + 8;
          }
          v53 = v31;
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v25);
    }
    v40 = objc_msgSend(a4, "function");
    if (v41)
    {
      -[MTLCompiler getFunctionId:airScript:vendorPluginFunctionId:bitcodeHashList:](v41, "getFunctionId:airScript:vendorPluginFunctionId:bitcodeHashList:", v40, buffer_ptr, &v58, &size_ptr);
    }
    else
    {
      *(_OWORD *)&v42->var1.var0[24] = 0u;
      *(_OWORD *)&v42->var2.var1 = 0u;
      *(_OWORD *)&v42->var0.var2 = 0u;
      *(_OWORD *)&v42->var1.var0[8] = 0u;
      *(_OWORD *)&v42->var0.var0 = 0u;
    }
    dispatch_release(object);
    result = (MTLHashKey *)size_ptr;
    if (size_ptr)
    {
      v53 = (char *)size_ptr;
      operator delete((void *)size_ptr);
    }
  }
  else
  {
    v58 = 0uLL;
    v59 = 0uLL;
    MTLHashKey::MTLHashKey((uint64_t)retstr, (uint64_t)&v58);
  }
  return result;
}

- (void)releaseHashMaps:(void *)a3
{
  _QWORD *i;
  void *v5;

  for (i = (_QWORD *)*((_QWORD *)a3 + 2); i; i = (_QWORD *)*i)
  {
    v5 = (void *)i[3];
    if (v5)

  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(a3);
}

- (void)releaseCompilerOutputBlocks:(void *)a3 hashMap:(void *)a4
{
  -[MTLCompiler releaseHashMaps:](self, "releaseHashMaps:", a4);
  -[MTLCompiler releaseCompilerOutputBlocks:](self, "releaseCompilerOutputBlocks:", a3);
}

uint64_t __100__MTLCompiler_reflectionWithFunction_options_sync_pipelineLibrary_binaryArchives_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 pipelineLibrary:(id)a6 binaryArchives:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  int v11;
  uint64_t v14;
  void *v15;
  _OWORD *v16;
  __int128 v17;
  _OWORD *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _OWORD v21[2];
  _OWORD v22[2];
  uint64_t v23;

  v10 = a5;
  v11 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v14 = objc_msgSend(a6, "pipelineCache");
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setSync:", v10);
  objc_msgSend(v15, "setFunction:", a3);
  objc_msgSend(v15, "setPipelineOptions:", v11 & 0x20200000 | 0x10003);
  objc_msgSend(v15, "setPipelineCache:", v14);
  objc_msgSend(v15, "setBinaryArchives:", a7);
  v16 = (_OWORD *)objc_msgSend(a3, "bitCodeHash");
  if (v16)
  {
    v17 = v16[1];
    v22[0] = *v16;
    v22[1] = v17;
    v18 = v22;
  }
  else
  {
    memset(v21, 0, sizeof(v21));
    v18 = v21;
  }
  objc_msgSend(v15, "setArchiveHashKey:", v18);
  if (objc_msgSend(a3, "functionType") == 6 || objc_msgSend(a3, "functionType") == 5)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __100__MTLCompiler_reflectionWithFunction_options_sync_pipelineLibrary_binaryArchives_completionHandler___block_invoke;
    v20[3] = &unk_1E0FE44F0;
    v20[4] = a8;
    -[MTLCompiler compileStatelessFunctionRequest:reflectionOnly:completionHandler:](self, "compileStatelessFunctionRequest:reflectionOnly:completionHandler:", v15, 1, v20);
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __100__MTLCompiler_reflectionWithFunction_options_sync_pipelineLibrary_binaryArchives_completionHandler___block_invoke_2;
    v19[3] = &unk_1E0FE44F0;
    v19[4] = a8;
    -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v15, 0, 0, 1, v19);
  }

}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 binaryArchives:(id)a6 completionHandler:(id)a7
{
  -[MTLCompiler reflectionWithFunction:options:sync:pipelineLibrary:binaryArchives:completionHandler:](self, "reflectionWithFunction:options:sync:pipelineLibrary:binaryArchives:completionHandler:", a3, a4, a5, 0, a6, a7);
}

- (MTLCompiler)initWithTargetData:(id)a3 cacheUUID:(id *)a4 pluginPath:(id)a5 device:(id)a6 compilerFlags:(unint64_t)a7
{
  uint64_t v7;
  NSString *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  const __CFString *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  CC_SHA256_CTX c;
  unsigned __int8 md[16];
  __int128 v27;
  __int128 v28[2];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v20 = CFSTR("pluginPath is not a NSString.");
    v21 = 1;
    v22 = 11636;
  }
  else
  {
    v20 = CFSTR("pluginPath must not be nil.");
    v21 = 0;
    v22 = 11633;
  }
  MTLReportFailure(v21, "-[MTLCompiler initWithTargetData:cacheUUID:pluginPath:device:compilerFlags:]", v22, (uint64_t)v20, (uint64_t)a5, (uint64_t)a6, a7, v7, v23);
LABEL_3:
  CC_SHA256_Init(&c);
  if (!reuseCacheOnReboot())
  {
    CC_SHA256_Update(&c, "Aug  8 2024", 0xBu);
    CC_SHA256_Update(&c, "21:41:45", 8u);
  }
  CC_SHA256_Update(&c, a4, 0x20u);
  CC_SHA256_Final(md, &c);
  v14 = (NSString *)objc_msgSend(a5, "copy");
  self->_device = (_MTLDevice *)a6;
  self->_pluginPath = v14;
  self->_compilerFlags = a7;
  self->_compilerQueue = (OS_dispatch_queue *)dispatch_queue_create("compiler queue", 0);
  v15 = _MTLGetMTLCompilerLLVMVersionForDevice(a6);
  self->_compilerConnectionManager = (MTLCompilerConnectionManager *)getCompilerConnectionManager(self->_device, v15);
  self->_compilerId = (*((uint64_t (**)(MTLCompilerConnectionManager *, uint64_t, id))self->_compilerConnectionManager->var0
                       + 2))(self->_compilerConnectionManager, objc_msgSend(a5, "cStringUsingEncoding:", 4), a3);
  v28[0] = *(_OWORD *)md;
  v28[1] = v27;
  addOrRemoveShaderFunctionCache(v28, 0, &v24);
  std::shared_ptr<std::unordered_map<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*,UnorderedContainerHash,UnorderedContainerHash,std::allocator<std::pair<MTLUINT256_t const,NSObject  {objcproto16OS_dispatch_data}*>>>>::operator=[abi:ne180100]((uint64_t)&self->_shaderCache, &v24);
  v16 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  return self;
}

- (unint64_t)compilerFlags
{
  return self->_compilerFlags;
}

void __109__MTLCompiler_compileFunctionRequestInternal_frameworkLinking_linkDataSize_reflectionOnly_completionHandler___block_invoke(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  uint64_t v7;
  char *i;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MTLBinaryEntry *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MTLBinaryEntry *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *p_shared_owners;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  _BYTE *v45[15];
  uint64_t v46;
  std::__shared_weak_count *v47;
  char v48;
  size_t size_ptr;
  void *buffer_ptr;
  dispatch_object_t v51;

  v51 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "destinationBinaryArchive"))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationBinaryArchive"), "remoteInsertionEnd");
  if (!a2)
  {
    for (i = *(char **)(*(_QWORD *)(a1 + 88) + 16); i; i = *(char **)i)
    {
      v9 = *((_QWORD *)i + 3);
      if (v9)
      {
        v10 = *(_QWORD *)(a1 + 104);
        v45[0] = i + 16;
        std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType const&>,std::tuple<>>(v10, i + 16, (uint64_t)&std::piecewise_construct, v45)[3] = v9;
        dispatch_retain(*((dispatch_object_t *)i + 3));
      }
    }
    v11 = *(_DWORD *)(a1 + 152);
    if ((v11 & 2) != 0)
    {
      v13 = *(_QWORD *)(a1 + 104);
      LOBYTE(v45[0]) = 2;
    }
    else
    {
      if (v11)
      {
        v45[0] = 0;
        size_ptr = 0;
        buffer_ptr = 0;
        v12 = dispatch_data_create_map(v51, (const void **)&buffer_ptr, &size_ptr);
        deserializeCompilerOutputData(buffer_ptr, size_ptr, (uint64_t *)v45, *(_QWORD **)(a1 + 88), *(_QWORD *)(a1 + 104));
        dispatch_release(v12);
        goto LABEL_16;
      }
      v13 = *(_QWORD *)(a1 + 104);
      LOBYTE(v45[0]) = 0;
    }
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*&>(v13, (char *)v45, v45, &v51);
    dispatch_retain(v51);
LABEL_16:
    LOBYTE(v14) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if ((_BYTE)v14)
    {
      v15 = *(_QWORD *)(a1 + 104);
      LOBYTE(size_ptr) = 0;
      v45[0] = &size_ptr;
      v14 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v15, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v45)[3];
      if (v14)
      {
        v16 = *(_QWORD *)(a1 + 104);
        v48 = 2;
        v45[0] = &v48;
        LOBYTE(v14) = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v16, &v48, (uint64_t)&std::piecewise_construct, v45)[3] != 0;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v14;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v17 = [MTLBinaryEntry alloc];
      v18 = *(_QWORD *)(a1 + 104);
      LOBYTE(size_ptr) = 0;
      v45[0] = &size_ptr;
      v19 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v18, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v45)[3];
      v20 = *(_QWORD *)(a1 + 104);
      v48 = 2;
      v45[0] = &v48;
      v21 = -[MTLBinaryEntry initWithData:reflectionBlock:](v17, "initWithData:reflectionBlock:", v19, std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v20, &v48, (uint64_t)&std::piecewise_construct, v45)[3]);
      if ((*(_BYTE *)(a1 + 152) & 2) != 0)
      {
        v22 = (void *)objc_msgSend(*(id *)(a1 + 32), "function");
        -[MTLBinaryEntry setAirScript:](v21, "setAirScript:", objc_msgSend(*(id *)(a1 + 32), "airScript"));

        v23 = objc_msgSend(v22, "bitcodeDataInternal");
        -[MTLBinaryEntry setBitcode:](v21, "setBitcode:", v23);
        -[MTLBinaryEntry setLinkedBitcodes:](v21, "setLinkedBitcodes:", objc_msgSend(*(id *)(a1 + 40), "newLinkedFunctionsBitcodeFromRequest:hashKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 48));
        dispatch_release(v23);
      }
      if (!*(_BYTE *)(a1 + 156) || (*(_BYTE *)(a1 + 152) & 2) != 0)
      {
        v24 = (*(uint64_t (**)(_QWORD, _QWORD, MTLBinaryEntry *, uint64_t, uint64_t))(**(_QWORD **)(a1 + 120)
                                                                                            + 128))(*(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 48), v21, objc_msgSend(*(id *)(a1 + 32), "archiverId"), objc_msgSend(*(id *)(a1 + 56), "functionType"));
        v25 = *(_QWORD *)(a1 + 104);
        LOBYTE(size_ptr) = 7;
        v45[0] = &size_ptr;
        std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v25, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v45)[3] = v24;
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD, MTLBinaryEntry *))(**(_QWORD **)(a1 + 120) + 144))(*(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 48), v21);
      }
      v26 = *(_QWORD *)(a1 + 120);
      v27 = *(_QWORD *)(a1 + 104);
      LOBYTE(size_ptr) = 7;
      v45[0] = &size_ptr;
      v28 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v27, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v45)[3];
      (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)v26 + 136))(v26, v28, *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "functionType"));

    }
    else
    {
      v34 = *(void **)(a1 + 40);
      v35 = *(_QWORD *)(a1 + 104);
      v36 = *(_QWORD *)(a1 + 88);
      v37 = *(_QWORD *)(a1 + 136);
      v38 = objc_msgSend(*(id *)(a1 + 56), "libraryData");
      v39 = *(std::__shared_weak_count **)(a1 + 128);
      v46 = *(_QWORD *)(a1 + 120);
      v47 = v39;
      if (v39)
      {
        p_shared_owners = (unint64_t *)&v39->__shared_owners_;
        do
          v41 = __ldxr(p_shared_owners);
        while (__stxr(v41 + 1, p_shared_owners));
      }
      objc_msgSend(v34, "cacheLegacyCompilerData:cachedData:hashMap:libraryData:functionCache:", v35, v36, v37, v38, &v46);
      v42 = v47;
      if (v47)
      {
        v43 = (unint64_t *)&v47->__shared_owners_;
        do
          v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
    }
    if (*(_BYTE *)(a1 + 157))
    {
      v29 = *(_QWORD *)(a1 + 104);
      LOBYTE(size_ptr) = 3;
      v45[0] = &size_ptr;
      if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v29, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v45)[3])
      {
        v30 = *(_QWORD *)(a1 + 88);
        v48 = 3;
        v45[0] = &v48;
        if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v30, &v48, (uint64_t)&std::piecewise_construct, v45)[3])
        {
          LOBYTE(size_ptr) = 0;
          v31 = *(_QWORD *)(a1 + 120);
          v32 = *(_QWORD *)(a1 + 136);
          v48 = 3;
          v45[0] = &v48;
          v33 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v32, &v48, (uint64_t)&std::piecewise_construct, v45);
          (*(void (**)(uint64_t, _QWORD, size_t *, uint64_t))(*(_QWORD *)v31 + 56))(v31, v33[3], &size_ptr, 1);
        }
      }
    }
    goto LABEL_31;
  }
  if (!a4)
  {
LABEL_31:
    v7 = 0;
    goto LABEL_32;
  }
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
LABEL_32:
  FunctionReplyParameters::FunctionReplyParameters(v45, a2, v7, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 136));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  objc_msgSend(*(id *)(a1 + 40), "releaseCompilerOutputBlocks:hashMap:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 40), "releaseCompilerOutputBlocks:", *(_QWORD *)(a1 + 104));

}

- (void)releaseCompilerOutputBlocks:(void *)a3
{
  _QWORD *i;
  NSObject *v5;

  for (i = (_QWORD *)*((_QWORD *)a3 + 2); i; i = (_QWORD *)*i)
  {
    v5 = i[3];
    if (v5)
      dispatch_release(v5);
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(a3);
}

- (void)cacheLegacyCompilerData:(void *)a3 cachedData:(void *)a4 hashMap:(void *)a5 libraryData:(void *)a6 functionCache:(shared_ptr<MultiLevelBinaryCache>)a7
{
  uint64_t *v7;
  MultiLevelBinaryCache *var0;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  signed __int8 v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unsigned __int8 v28;
  unsigned __int8 *v29;

  v7 = (uint64_t *)*((_QWORD *)a3 + 2);
  if (v7)
  {
    var0 = a7.var0;
    while (1)
    {
      v28 = *((_BYTE *)v7 + 16);
      if (v28 > 7u || ((1 << v28) & 0xB0) == 0)
        break;
LABEL_7:
      v7 = (uint64_t *)*v7;
      if (!v7)
        return;
    }
    v12 = v7[3];
    if (a4)
    {
      v29 = &v28;
      v13 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType const&>,std::tuple<>>((uint64_t)a4, (char *)&v28, (uint64_t)&std::piecewise_construct, &v29)[3];
      if (v28)
      {
LABEL_11:
        v14 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v13 = 0;
      if (v28)
        goto LABEL_11;
    }
    v14 = (*(uint64_t (**)(void *))(*(_QWORD *)a6 + 64))(a6);
    if (!v28)
    {
      v15 = (*(uint64_t (**)(void *))(*(_QWORD *)a6 + 72))(a6);
      goto LABEL_15;
    }
LABEL_14:
    v15 = 0;
LABEL_15:
    v29 = &v28;
    v16 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType const&>,std::tuple<>>((uint64_t)a5, (char *)&v28, (uint64_t)&std::piecewise_construct, &v29)[3];
    v17 = v28;
    v18 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v26 = *(_QWORD *)var0;
    v27 = v18;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    -[MTLCompiler addLegacyCompiledOutput:cachedCompiledOutput:importedSymbols:importedLibraries:hashKey:type:functionCache:](self, "addLegacyCompiledOutput:cachedCompiledOutput:importedSymbols:importedLibraries:hashKey:type:functionCache:", v12, v13, v14, v15, v16, v17, &v26);
    v21 = v27;
    if (v27)
    {
      v22 = (unint64_t *)&v27->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    goto LABEL_7;
  }
}

- (void)addLegacyCompiledOutput:(id)a3 cachedCompiledOutput:(id)a4 importedSymbols:(id)a5 importedLibraries:(id)a6 hashKey:(id)a7 type:(char)a8 functionCache:(shared_ptr<MultiLevelBinaryCache>)a9
{
  MTLBinaryEntry *v10;

  if (a3)
  {
    if (a3 != a4)
    {
      v10 = -[MTLBinaryEntry initWithData:importedSymbols:importedLibraries:]([MTLBinaryEntry alloc], "initWithData:importedSymbols:importedLibraries:", a3, a5, a6);
      (*(void (**)(_QWORD, id, MTLBinaryEntry *))(**(_QWORD **)a9.var0 + 144))(*(_QWORD *)a9.var0, a7, v10);

    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 pipelineLibrary:(id)a6 completionHandler:(id)a7
{
  -[MTLCompiler reflectionWithFunction:options:sync:pipelineLibrary:binaryArchives:completionHandler:](self, "reflectionWithFunction:options:sync:pipelineLibrary:binaryArchives:completionHandler:", a3, a4, a5, a6, 0, a7);
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 completionHandler:(id)a6
{
  -[MTLCompiler reflectionWithFunction:options:sync:pipelineLibrary:completionHandler:](self, "reflectionWithFunction:options:sync:pipelineLibrary:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)unloadShaderCaches
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;

  v3 = (os_unfair_lock_s *)_MTLGetLibrariesCache(self->_device);
  if (v3)
  {
    v4 = v3;
    os_unfair_lock_lock(v3);
    std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::erase((uint64_t **)&v4[2], *(uint64_t **)&v4[2]._os_unfair_lock_opaque, (uint64_t *)&v4[4]);
    os_unfair_lock_unlock(v4);
    (*(void (**)(_QWORD))(**(_QWORD **)&v4[8]._os_unfair_lock_opaque + 24))(*(_QWORD *)&v4[8]._os_unfair_lock_opaque);
  }
  (*((void (**)(MTLCompilerCache *))self->_shaderCache.__ptr_->var0 + 3))(self->_shaderCache.__ptr_);
}

- (void)getShaderCacheKeys
{
  return (void *)(*((uint64_t (**)(MTLCompilerCache *))self->_shaderCache.__ptr_->var0 + 9))(self->_shaderCache.__ptr_);
}

- (BOOL)copyShaderCacheToPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  MTLCompilerCache *ptr;

  v5 = _MTLGetLibrariesCache(self->_device);
  if (!v5
    || (v6 = *(_QWORD *)(v5 + 32)) == 0
    || (v7 = (*(uint64_t (**)(uint64_t, id))(*(_QWORD *)v6 + 64))(v6, a3)) != 0)
  {
    ptr = self->_shaderCache.__ptr_;
    if (ptr)
      LOBYTE(v7) = (*((uint64_t (**)(MTLCompilerCache *, id))ptr->var0 + 8))(ptr, a3);
    else
      LOBYTE(v7) = 1;
  }
  return v7;
}

- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats
{
  uint64_t v2;

  v2 = *(_QWORD *)(_MTLGetLibrariesCache(self->_device) + 32);
  if (v2)
    return *($85CD2974BE96D4886BB301820D1C36C2 *)(v2 + 12);
  else
    return ($85CD2974BE96D4886BB301820D1C36C2)0;
}

- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats
{
  MTLCompilerCache *ptr;

  ptr = self->_shaderCache.__ptr_;
  if (ptr)
    return *($85CD2974BE96D4886BB301820D1C36C2 *)&ptr->var2;
  else
    return ($85CD2974BE96D4886BB301820D1C36C2)0;
}

- (void)dealloc
{
  objc_super v3;

  self->_compilerConnectionManager = 0;
  dispatch_release((dispatch_object_t)self->_compilerQueue);
  self->_compilerQueue = 0;
  -[MTLCompiler unloadShaderCaches](self, "unloadShaderCaches");
  std::shared_ptr<CompilerConnection>::reset[abi:ne180100](&self->_shaderCache.__ptr_);
  removeShaderFunctionCache();

  v3.receiver = self;
  v3.super_class = (Class)MTLCompiler;
  -[MTLCompiler dealloc](&v3, sel_dealloc);
}

- (MTLHashKey)getBuiltInFunctionId:(SEL)a3
{
  __int128 v6;
  uint64_t v8;
  _OWORD v9[4];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[MTLCompiler getBuiltInFunctionId:]::onceToken != -1)
    dispatch_once(&-[MTLCompiler getBuiltInFunctionId:]::onceToken, &__block_literal_global_1060);
  v9[0] = -[MTLCompiler getBuiltInFunctionId:]::NullHash;
  v9[1] = unk_1ECD45131;
  v6 = *(_OWORD *)&a4->var0[16];
  v9[2] = *(_OWORD *)a4->var0;
  v9[3] = v6;
  v8 = 0x40300000000;
  return (MTLHashKey *)MTLHashKey::MTLHashKey(retstr, v9, &v8, 2);
}

double __36__MTLCompiler_getBuiltInFunctionId___block_invoke()
{
  double result;

  result = *(double *)&AIR_NULL_HASH;
  -[MTLCompiler getBuiltInFunctionId:]::NullHash = AIR_NULL_HASH;
  unk_1ECD45131 = unk_18281A1F2;
  return result;
}

- (void)compileRequestInternal:(id)a3 binaryArchives:(id)a4 failOnBinaryArchiveMiss:(BOOL)a5 pipelineCache:(id)a6 sync:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  _BOOL4 v11;
  uint64_t v15;
  int v16;
  NSObject *v17;
  void *v18;
  CC_LONG v19;
  MTLBinaryKey *v20;
  dispatch_object_t v21;
  std::__shared_weak_count *v22;
  __n128 v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  const char *v27;
  MTLCompilerConnectionManager *compilerConnectionManager;
  uint64_t compilerId;
  unint64_t *p_shared_owners;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  dispatch_object_t object;
  dispatch_object_t v38;
  size_t size_ptr;
  void *buffer_ptr;
  std::__shared_weak_count *v41;
  std::__shared_weak_count *v42;
  _QWORD v43[6];
  std::__shared_weak_count *v44;
  __int128 v45;
  __int128 v46;
  __int128 md;
  __int128 v48;
  CC_SHA256_CTX c;
  uint64_t v50;

  v9 = a7;
  v11 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  dispatch_retain((dispatch_object_t)a3);
  v15 = operator new();
  *(_QWORD *)v15 = &off_1E0FE05F0;
  *(_QWORD *)(v15 + 16) = 0;
  *(_DWORD *)(v15 + 8) = 4;
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  *(_QWORD *)(v15 + 16) = a3;
  if (v11)
    v16 = 2;
  else
    v16 = 0;
  MultiLevelCacheFactory::createBinaryCache((uint64_t)a4, 0, a6, (uint64_t)self->_shaderCache.__ptr_, v16, &v41);
  size_ptr = 0;
  buffer_ptr = 0;
  v17 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v19 = size_ptr;
  v18 = buffer_ptr;
  md = 0u;
  v48 = 0u;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, v18, v19);
  CC_SHA256_Final((unsigned __int8 *)&md, &c);
  dispatch_release(v17);
  v38 = 0;
  -[MTLCompiler getBuiltInFunctionId:](self, "getBuiltInFunctionId:", &md);
  v20 = -[MTLBinaryKey initWithHash:]([MTLBinaryKey alloc], "initWithHash:", &c);
  object = 0;
  ((void (*)(std::__shared_weak_count *, MTLBinaryKey *, dispatch_object_t *, dispatch_object_t *, _QWORD))v41->__vftable[2].__on_zero_shared)(v41, v20, &v38, &object, 0);

  if (object)
    dispatch_release(object);
  MTLHashKey::~MTLHashKey((MTLHashKey *)&c);
  v21 = v38;
  if (v38
    || (v22 = v41,
        v23 = MTLHashKey::MTLHashKey((uint64_t)&c, (uint64_t)&md),
        ((void (*)(std::__shared_weak_count *, CC_SHA256_CTX *, dispatch_object_t *, __n128))v22->__vftable[3].~__shared_weak_count)(v22, &c, &v38, v23), MTLHashKey::~MTLHashKey((MTLHashKey *)&c), (v21 = v38) != 0))
  {
    *(_QWORD *)c.count = 0;
    *(_QWORD *)c.hash = 0;
    *(_QWORD *)&c.hash[2] = &md;
    *(_QWORD *)&c.hash[4] = v21;
    (*((void (**)(id, CC_SHA256_CTX *))a8 + 2))(a8, &c);
    dispatch_release(v38);
LABEL_11:
    dispatch_release((dispatch_object_t)a3);
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
    goto LABEL_12;
  }
  if (((unsigned int (*)(std::__shared_weak_count *))v41->__vftable[1].~__shared_weak_count)(v41))
  {
    if ((((uint64_t (*)(std::__shared_weak_count *))v41->__vftable[2].~__shared_weak_count_0)(v41) & 1) != 0)
    {
      v27 = "binary archives";
    }
    else
    {
      v35 = ((uint64_t (*)(std::__shared_weak_count *))v41->__get_deleter)(v41);
      v27 = "FS cache";
      if (v35)
        v27 = "pipeline library";
    }
    v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find precompiled data in %s"), v27);
    *(_QWORD *)c.count = 2;
    *(_QWORD *)c.hash = v36;
    *(_QWORD *)&c.hash[2] = 0;
    *(_QWORD *)&c.hash[4] = 0;
    (*((void (**)(id, CC_SHA256_CTX *))a8 + 2))(a8, &c);
    goto LABEL_11;
  }
  v43[1] = 3321888768;
  v45 = md;
  compilerConnectionManager = self->_compilerConnectionManager;
  compilerId = self->_compilerId;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[2] = __114__MTLCompiler_compileRequestInternal_binaryArchives_failOnBinaryArchiveMiss_pipelineCache_sync_completionHandler___block_invoke;
  v43[3] = &unk_1E0FE2318;
  v46 = v48;
  v43[5] = v41;
  v44 = v42;
  if (v42)
  {
    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
    do
      v31 = __ldxr(p_shared_owners);
    while (__stxr(v31 + 1, p_shared_owners));
  }
  v43[4] = a8;
  (*((void (**)(MTLCompilerConnectionManager *, uint64_t, uint64_t, _BOOL8, _QWORD *))compilerConnectionManager->var0
   + 3))(compilerConnectionManager, compilerId, v15, v9, v43);
  dispatch_release((dispatch_object_t)a3);
  v32 = v44;
  if (v44)
  {
    v33 = (unint64_t *)&v44->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
LABEL_12:
  v24 = v42;
  if (v42)
  {
    v25 = (unint64_t *)&v42->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
}

void __114__MTLCompiler_compileRequestInternal_binaryArchives_failOnBinaryArchiveMiss_pipelineCache_sync_completionHandler___block_invoke(uint64_t a1, void *a2, NSObject *a3, uint64_t a4)
{
  __int128 v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *buffer_ptr[4];
  size_t size_ptr;
  MTLHashKey v14;
  _OWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = *(_OWORD *)(a1 + 72);
  v15[0] = *(_OWORD *)(a1 + 56);
  v15[1] = v8;
  *(_QWORD *)&v9 = MTLHashKey::MTLHashKey((uint64_t)&v14, a1 + 56).n128_u64[0];
  if (!a2 && a3)
  {
    buffer_ptr[0] = 0;
    size_ptr = 0;
    v10 = dispatch_data_create_map(a3, (const void **)buffer_ptr, &size_ptr);
    (*(void (**)(_QWORD, MTLHashKey *, void *, size_t))(**(_QWORD **)(a1 + 40) + 48))(*(_QWORD *)(a1 + 40), &v14, buffer_ptr[0], size_ptr);
    dispatch_release(v10);
  }
  if (a4)
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4, v9);
  else
    v11 = 0;
  buffer_ptr[0] = a2;
  buffer_ptr[1] = v11;
  buffer_ptr[2] = v15;
  buffer_ptr[3] = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  MTLHashKey::~MTLHashKey(&v14);
}

- (void)compileRequest:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MTLCompiler_compileRequest_completionHandler___block_invoke;
  v4[3] = &unk_1E0FE4478;
  v4[4] = a4;
  -[MTLCompiler compileRequest:pipelineCache:completionHandler:](self, "compileRequest:pipelineCache:completionHandler:", a3, 0, v4);
}

uint64_t __48__MTLCompiler_compileRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)compileRequest:(id)a3 pipelineCache:(id)a4 completionHandler:(id)a5
{
  -[MTLCompiler compileRequest:pipelineCache:sync:completionHandler:](self, "compileRequest:pipelineCache:sync:completionHandler:", a3, a4, 0, a5);
}

- (void)compileRequest:(id)a3 binaryArchives:(id)a4 sync:(BOOL)a5 completionHandler:(id)a6
{
  -[MTLCompiler compileRequestInternal:binaryArchives:failOnBinaryArchiveMiss:pipelineCache:sync:completionHandler:](self, "compileRequestInternal:binaryArchives:failOnBinaryArchiveMiss:pipelineCache:sync:completionHandler:", a3, a4, 0, 0, a5, a6);
}

- (void)generateMachOWithID:(const char *)a3 binaryEntries:(shared_ptr<std:(const void *)a5 :(int)a6 vector<machOEntry>>)a4 machOSpecializedData:(id)a7 machOType:(unint64_t)a8 Path:()shared_ptr<std:(NSObject<OS_dispatch_data> *) :()UnorderedContainerHash unordered_map<MTLUINT256_t platform:(UnorderedContainerHash>>)a9 bitcodeList:(id)a10 completionHandler:
{
  void *v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  dispatch_data_t v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  uint64_t *v34;
  __int128 v35;
  NSObject *v36;
  dispatch_data_t map;
  unint64_t v38;
  NSObject *v39;
  unint64_t v40;
  size_t v41;
  char *v42;
  char *v43;
  int v44;
  size_t v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  void *v49;
  size_t v50;
  size_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  BOOL MachOFile;
  void *v77;
  const char *v78;
  char *v79;
  uint64_t v80;
  size_t v81;
  _QWORD *v82;
  unint64_t v83;
  const void *v84;
  size_t v85;
  unint64_t v86;
  unint64_t v87;
  char *v88;
  __int128 *v89;
  __int128 v90;
  __int128 v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t *v98;
  NSObject *v99;
  NSObject *v100;
  MTLCompilerConnectionManager *compilerConnectionManager;
  uint64_t compilerId;
  MTLCompiler *v103;
  int v104;
  NSObject *object;
  void *v106;
  uint64_t v108;
  uint64_t v109;
  __shared_weak_count *var1;
  unint64_t *v111;
  int v112;
  uint64_t **var0;
  void *v114;
  size_t size_ptr;
  void *buffer_ptr;
  char *v117;
  char *v118;
  char *v119;
  _QWORD v120[5];
  __int128 v121;
  __int128 v122;
  size_t v123[2];
  __int128 v124;
  CC_SHA256_CTX c;
  uint64_t v126;

  v11 = *(void **)&a6;
  v12 = (int)a5;
  var1 = a4.var1;
  v126 = *MEMORY[0x1E0C80C00];
  var0 = (uint64_t **)a4.var0;
  v15 = **(_QWORD **)a4.var0;
  v14 = *(_QWORD *)(*(_QWORD *)a4.var0 + 8);
  v117 = 0;
  v118 = 0;
  v119 = 0;
  *(_QWORD *)c.count = &v117;
  LOBYTE(c.hash[0]) = 0;
  v108 = v15;
  v109 = v14;
  v16 = (v14 - v15) / 72;
  if (v14 != v15)
  {
    if (v16 >= 0x2E8BA2E8BA2E8BBLL)
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    v17 = (char *)operator new(88 * v16);
    v117 = v17;
    v119 = &v17[88 * v16];
    bzero(v17, 88 * ((88 * v16 - 88) / 0x58) + 88);
    v118 = &v17[88 * ((88 * v16 - 88) / 0x58) + 88];
  }
  v18 = (unint64_t *)malloc_type_malloc(104 * v16 + 136, 0x7459055CuLL);
  bzero(v18, 104 * v16 + 136);
  *v18 = (unint64_t)a7;
  v106 = v11;
  *((_DWORD *)v18 + 31) = dyld_get_active_platform();
  v18[1] = v16;
  *((_BYTE *)v18 + 128) = v12;
  *((_DWORD *)v18 + 30) = -[MTLTargetDeviceArchitecture versionCombined](-[_MTLDevice targetDeviceArchitecture](self->_device, "targetDeviceArchitecture"), "versionCombined");
  v18[5] = 104 * v16 + 136;
  v19 = (const char *)objc_msgSend((id)MTLGetGPUArchiverCachePath(), "UTF8String");
  v20 = strlen(v19) + 1;
  *((_DWORD *)v18 + 23) = v20;
  v21 = 104 * v16 + v20 + 143;
  v22 = v21 & 0xFFFFFFFFFFFFFFF8;
  if (a3)
  {
    v23 = strlen(a3) + 1;
    *((_DWORD *)v18 + 22) = v23;
    v18[4] = v22;
    v22 = ((v21 | 7) + v23) & 0xFFFFFFFFFFFFFFF8;
  }
  size_ptr = 0;
  buffer_ptr = 0;
  if (v12)
  {
    if (v12 == 1)
    {
      v18[8] = v22;
      object = 0;
      v24 = strlen(*(const char **)var1) + 1;
      *((_DWORD *)v18 + 28) = v24;
      v22 = ((v22 | 7) + v24) & 0xFFFFFFFFFFFFFFF8;
      v112 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    v25 = *((_QWORD *)var1 + 1);
    if (v25)
    {
      v18[7] = v22;
      v26 = (40 * v25);
      *((_DWORD *)v18 + 25) = v26;
      v22 += v26;
    }
    v27 = *((_QWORD *)var1 + 2);
    if (v27)
    {
      v28 = dispatch_data_create_map(v27, (const void **)&buffer_ptr, &size_ptr);
      if (v28)
      {
        object = v28;
        v112 = 0;
        v18[9] = v22;
        v29 = size_ptr;
        *((_DWORD *)v18 + 29) = size_ptr;
        v22 = (v22 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
        goto LABEL_15;
      }
    }
  }
  v112 = 0;
  object = 0;
LABEL_15:
  v104 = v12;
  v30 = *(_QWORD *)a8;
  v111 = v18;
  v103 = self;
  if (*(_QWORD *)a8)
  {
    v18[10] = v22;
    v31 = *(_QWORD *)(v30 + 24);
    *((_DWORD *)v18 + 26) = 0;
    *((_DWORD *)v18 + 27) = v31;
    v32 = operator new();
    v33 = 292 * *(_QWORD *)(*(_QWORD *)a8 + 24);
    *(_QWORD *)(v32 + 16) = 0;
    *(_QWORD *)v32 = malloc_type_malloc(v33, 0xFA8FEB0CuLL);
    *(_QWORD *)(v32 + 8) = v33;
    v34 = *(uint64_t **)(*(_QWORD *)a8 + 16);
    if (v34)
    {
      while (1)
      {
        v35 = *((_OWORD *)v34 + 2);
        *(_OWORD *)c.count = *((_OWORD *)v34 + 1);
        *(_OWORD *)&c.hash[2] = v35;
        v36 = v34[6];
        v123[0] = 0;
        v114 = 0;
        map = dispatch_data_create_map(v36, (const void **)&v114, v123);
        v38 = *(_QWORD *)(v32 + 16);
        if (v38 >= 0xFFFFFFFFFFFFFFE0)
          break;
        v39 = map;
        v40 = v38 + 32;
        v41 = *(_QWORD *)(v32 + 8);
        if (v41 >= v38 + 32)
        {
          v42 = *(char **)v32;
        }
        else
        {
          if (!v41)
          {
            *(_QWORD *)(v32 + 8) = 128;
            v41 = 128;
          }
          while (v41 < v40)
          {
            if (v41 >> 1 >= ~v41)
              v41 = v38 + 32;
            else
              v41 += v41 >> 1;
          }
          v42 = (char *)malloc_type_realloc(*(void **)v32, v41, 0x227314A4uLL);
          *(_QWORD *)v32 = v42;
          if (!v42)
            break;
          *(_QWORD *)(v32 + 8) = v41;
          v38 = *(_QWORD *)(v32 + 16);
          v40 = v38 + 32;
        }
        v43 = &v42[v38];
        *(_OWORD *)v43 = *(_OWORD *)c.count;
        *((_OWORD *)v43 + 1) = *(_OWORD *)&c.hash[2];
        *(_QWORD *)(v32 + 16) = v40;
        if (v40 > 0xFFFFFFFFFFFFFFFBLL)
          break;
        v44 = v123[0];
        v45 = v38 + 36;
        if (v41 < v45)
        {
          if (!v41)
          {
            *(_QWORD *)(v32 + 8) = 128;
            v41 = 128;
          }
          while (v41 < v45)
          {
            if (v41 >> 1 >= ~v41)
              v41 = v45;
            else
              v41 += v41 >> 1;
          }
          v42 = (char *)malloc_type_realloc(v42, v41, 0x227314A4uLL);
          *(_QWORD *)v32 = v42;
          if (!v42)
            break;
          *(_QWORD *)(v32 + 8) = v41;
          v40 = *(_QWORD *)(v32 + 16);
        }
        *(_DWORD *)&v42[v40] = v44;
        v46 = *(_QWORD *)(v32 + 16);
        v47 = v46 + 4;
        *(_QWORD *)(v32 + 16) = v46 + 4;
        v48 = v123[0];
        if (-5 - v46 < v123[0])
          break;
        v49 = v114;
        v50 = v123[0] + v47;
        v51 = *(_QWORD *)(v32 + 8);
        if (v51 >= v123[0] + v47)
        {
          v52 = *(char **)v32;
        }
        else
        {
          if (!v51)
          {
            *(_QWORD *)(v32 + 8) = 128;
            v51 = 128;
          }
          while (v51 < v50)
          {
            if (v51 >> 1 >= ~v51)
              v51 = v50;
            else
              v51 += v51 >> 1;
          }
          v52 = (char *)malloc_type_realloc(*(void **)v32, v51, 0x227314A4uLL);
          *(_QWORD *)v32 = v52;
          if (!v52)
            break;
          *(_QWORD *)(v32 + 8) = v51;
          v47 = *(_QWORD *)(v32 + 16);
        }
        memcpy(&v52[v47], v49, v48);
        *(_QWORD *)(v32 + 16) += v48;
        dispatch_release(v39);
        v34 = (uint64_t *)*v34;
        if (!v34)
          goto LABEL_50;
      }
      abort();
    }
LABEL_50:
    v53 = *(_QWORD *)(v32 + 16);
    v18 = v111;
    *((_DWORD *)v111 + 26) = v53;
    v22 = (v22 + v53 + 7) & 0xFFFFFFFFFFFFFFF8;
  }
  else
  {
    v32 = 0;
  }
  if (v109 == v108)
  {
    v66 = v22;
  }
  else
  {
    v54 = 0;
    if (v16 <= 1)
      v55 = 1;
    else
      v55 = v16;
    v56 = v18 + 29;
    v57 = 32;
    do
    {
      v58 = v117;
      *(v56 - 10) = v22;
      v59 = **var0;
      v60 = *(NSObject **)(v59 + v57 - 16);
      if (v60)
      {
        *(_QWORD *)&v58[v54] = dispatch_data_create_map(v60, (const void **)&v58[v54 + 56], v56 - 9);
        v22 = (v22 + *(v56 - 9) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      *(v56 - 8) = v22;
      v61 = *(NSObject **)(v59 + v57 - 8);
      if (v61)
      {
        *(_QWORD *)&v58[v54 + 8] = dispatch_data_create_map(v61, (const void **)&v58[v54 + 64], v56 - 7);
        v22 = (v22 + *(v56 - 7) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      *(v56 - 6) = v22;
      v62 = *(NSObject **)(v59 + v57);
      if (v62)
      {
        *(_QWORD *)&v58[v54 + 16] = dispatch_data_create_map(v62, (const void **)&v58[v54 + 72], v56 - 5);
        v22 = (v22 + *(v56 - 5) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      v63 = *(_QWORD *)(v59 + v57 - 24);
      if (v63)
      {
        v63 = (*(_QWORD *)(v63 + 64) - *(_QWORD *)(v63 + 56)) >> 5;
        v64 = v22 + 4 * v63 + 7;
        v65 = v64 & 0xFFFFFFFFFFFFFFF8;
        v66 = (v64 + 32 * v63) & 0xFFFFFFFFFFFFFFF8;
      }
      else
      {
        v65 = v22;
        v66 = v22;
      }
      *((_DWORD *)v56 - 24) = v63;
      *(v56 - 4) = v22;
      *(v56 - 3) = v65;
      *(v56 - 2) = v66;
      v67 = v112;
      if (!*(_QWORD *)(v59 + v57 - 24))
        v67 = 1;
      if ((v67 & 1) == 0)
      {
        *(_QWORD *)&v58[v54 + 24] = dispatch_data_create_map(*(dispatch_data_t *)(v59 + v57 + 8), (const void **)&v58[v54 + 80], v56 - 1);
        v66 = (v66 + *(v56 - 1) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      v68 = v59 + v57;
      v71 = *(char **)(v59 + v57 + 16);
      v70 = (char *)(v59 + v57 + 16);
      v69 = v71;
      v72 = *(_QWORD *)(v68 + 24);
      v73 = v72 - (_QWORD)v71;
      if ((char *)v72 != v71)
      {
        v74 = &v58[v54 + 32];
        if (v74 != v70)
        {
          std::vector<MTLUINT256_t>::__assign_with_size[abi:ne180100]<MTLUINT256_t*,MTLUINT256_t*>(v74, v69, v72, v73 >> 5);
          v73 = *(_QWORD *)(v68 + 24) - *(_QWORD *)v70;
        }
        *((_DWORD *)v56 - 22) = (unint64_t)v73 >> 5;
        *v56 = v66;
        v66 = (v66 + v73 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      v54 += 88;
      v57 += 72;
      v56 += 13;
      v22 = v66;
      --v55;
    }
    while (v55);
  }
  v75 = operator new();
  *(_QWORD *)(v75 + 16) = 0;
  *(_QWORD *)v75 = &off_1E0FE0BF8;
  *(_DWORD *)(v75 + 28) = -1;
  *(_QWORD *)(v75 + 32) = 0;
  *(_DWORD *)(v75 + 8) = 16;
  MachOFile = MTLCompilerMachORequest::CreateMachOFile((MTLCompilerMachORequest *)v75, (const char *)objc_msgSend(v106, "UTF8String"));
  if (!MachOFile)
  {
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error: couldn't open file at: %@"), v106);
    *(_QWORD *)c.count = 2;
    *(_QWORD *)c.hash = v77;
    *(_QWORD *)&c.hash[2] = 0;
    *(_QWORD *)&c.hash[4] = 0;
    (*((void (**)(void *, CC_SHA256_CTX *))a9.__ptr_ + 2))(a9.__ptr_, &c);

  }
  objc_msgSend(v106, "UTF8String");
  v78 = (const char *)sandbox_extension_issue_file();
  v79 = (char *)v78;
  if (v78)
  {
    if (MachOFile)
    {
      v111[3] = 0;
      *((_BYTE *)v111 + 129) = 1;
      v80 = strlen(v78) + 1;
      *((_DWORD *)v111 + 24) = v80;
      v111[6] = v66;
      v81 = (v66 + v80 + 7) & 0xFFFFFFFFFFFFFFF8;
      v82 = malloc_type_malloc(v81, 0xDC804977uLL);
      v111[2] = v81;
      bzero(v82, v81);
      memcpy(v82, v111, 104 * v16 + 136);
      v83 = v111[5];
      v84 = (const void *)objc_msgSend((id)MTLGetGPUArchiverCachePath(), "UTF8String");
      memcpy((char *)v82 + v83, v84, *((unsigned int *)v111 + 23));
      v85 = *((unsigned int *)v111 + 22);
      if ((_DWORD)v85)
        memcpy((char *)v82 + v111[4], a3, v85);
      if (v112)
        memcpy((char *)v82 + v111[8], *(const void **)var1, *((unsigned int *)v111 + 28));
      memcpy((char *)v82 + v111[6], v79, *((unsigned int *)v111 + 24));
      free(v79);
      if (!v104)
      {
        v86 = v111[7];
        if (buffer_ptr)
          memcpy((char *)v82 + v111[9], buffer_ptr, size_ptr);
        if (object)
          dispatch_release(object);
        if (*((_QWORD *)var1 + 1))
        {
          v87 = 0;
          v88 = (char *)v82 + v86;
          do
          {
            v89 = *(__int128 **)(*(_QWORD *)var1 + 8 * v87);
            v90 = *v89;
            v91 = v89[1];
            *((_QWORD *)v88 + 4) = *((_QWORD *)v89 + 4);
            *(_OWORD *)v88 = v90;
            *((_OWORD *)v88 + 1) = v91;
            ++v87;
            v88 += 40;
          }
          while (v87 < *((_QWORD *)var1 + 1));
        }
      }
      if (*((_DWORD *)v111 + 27))
      {
        memcpy((char *)v82 + v111[10], *(const void **)v32, *(_QWORD *)(v32 + 16));
      }
      else if (!v32)
      {
LABEL_104:
        if (v109 != v108)
        {
          v93 = 0;
          if (v16 <= 1)
            v94 = 1;
          else
            v94 = v16;
          v95 = v111 + 29;
          v96 = 8;
          do
          {
            v97 = **var0;
            memcpy((char *)v82 + *(v95 - 10), *(const void **)&v117[v93 + 56], *(v95 - 9));
            memcpy((char *)v82 + *(v95 - 8), *(const void **)&v117[v93 + 64], *(v95 - 7));
            memcpy((char *)v82 + *(v95 - 6), *(const void **)&v117[v93 + 72], *(v95 - 5));
            memcpy((char *)v82 + *(v95 - 2), *(const void **)&v117[v93 + 80], *(v95 - 1));
            v98 = *(unint64_t **)(v97 + v96);
            if (v98)
              MTLHashKey::getHashTools(v98, (char *)v82 + *(v95 - 3), (char *)v82 + *(v95 - 4));
            if (*((_DWORD *)v95 - 22))
              memcpy((char *)v82 + *v95, *(const void **)&v117[v93 + 32], *(_QWORD *)&v117[v93 + 40] - *(_QWORD *)&v117[v93 + 32]);
            v93 += 88;
            v96 += 72;
            v95 += 13;
            --v94;
          }
          while (v94);
        }
        v124 = 0u;
        *(_OWORD *)v123 = 0u;
        CC_SHA256_Init(&c);
        CC_SHA256_Update(&c, v82, 0x88u);
        CC_SHA256_Final((unsigned __int8 *)v123, &c);
        v82[3] = *(int *)(v75 + 28);
        v99 = dispatch_data_create(v82, v81, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
        v100 = v99;
        if (v99)
          dispatch_retain(v99);
        *(_QWORD *)(v75 + 16) = v100;
        free(v111);
        compilerConnectionManager = v103->_compilerConnectionManager;
        compilerId = v103->_compilerId;
        v120[0] = MEMORY[0x1E0C809B0];
        v120[1] = 3221225472;
        v120[2] = __124__MTLCompiler_generateMachOWithID_binaryEntries_machOSpecializedData_machOType_Path_platform_bitcodeList_completionHandler___block_invoke;
        v120[3] = &unk_1E0FE44A0;
        v121 = *(_OWORD *)v123;
        v122 = v124;
        v120[4] = a9.__ptr_;
        (*((void (**)(MTLCompilerConnectionManager *, uint64_t, uint64_t, uint64_t, _QWORD *))compilerConnectionManager->var0
         + 3))(compilerConnectionManager, compilerId, v75, 1, v120);
        dispatch_release(v100);
        goto LABEL_117;
      }
      free(*(void **)v32);
      MEMORY[0x186DABFBC](v32, 0x1010C40113C0ABBLL);
      goto LABEL_104;
    }
  }
  else
  {
    v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error: unable to extend sandbox to: %@"), v106);
    *(_QWORD *)c.count = 2;
    *(_QWORD *)c.hash = v92;
    *(_QWORD *)&c.hash[2] = 0;
    *(_QWORD *)&c.hash[4] = 0;
    (*((void (**)(void *, CC_SHA256_CTX *))a9.__ptr_ + 2))(a9.__ptr_, &c);

  }
  (*(void (**)(uint64_t))(*(_QWORD *)v75 + 8))(v75);
  if (object)
    dispatch_release(object);
  free(v111);
  if (v79)
    free(v79);
  if (v32)
  {
    free(*(void **)v32);
    MEMORY[0x186DABFBC](v32, 0x1010C40113C0ABBLL);
  }
LABEL_117:
  *(_QWORD *)c.count = &v117;
  std::vector<-[MTLCompiler generateMachOWithID:binaryEntries:machOSpecializedData:machOType:Path:platform:bitcodeList:completionHandler:]::BinaryItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&c);
}

uint64_t __124__MTLCompiler_generateMachOWithID_binaryEntries_machOSpecializedData_machOType_Path_platform_bitcodeList_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD v9[4];

  if (a4)
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  else
    v7 = 0;
  v9[0] = a2;
  v9[1] = v7;
  v9[2] = a1 + 40;
  v9[3] = a3;
  return (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9, a3, a4);
}

- (void)createBinaryArchiveWithCompletionHanlder:(id)a3
{
  -[MTLCompiler createBinaryArchiveAsRecompileTarget:completionHandler:](self, "createBinaryArchiveAsRecompileTarget:completionHandler:", 0, a3);
}

- (void)createBinaryArchiveAsRecompileTarget:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  _BYTE *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v13;
  char *v14;
  const void *v15;
  NSObject *v16;
  NSObject *v17;
  MTLCompilerConnectionManager *compilerConnectionManager;
  uint64_t compilerId;
  CC_SHA256_CTX v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  unsigned __int8 md[16];
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = operator new();
  *(_QWORD *)v7 = &off_1E0FE05F0;
  *(_QWORD *)(v7 + 16) = 0;
  *(_DWORD *)(v7 + 8) = 17;
  v8 = malloc_type_malloc(0x18uLL, 0x100004057661CB1uLL);
  v8[16] = a3;
  *((_DWORD *)v8 + 2) = 24;
  v9 = (const char *)objc_msgSend((id)MTLGetGPUArchiverCachePath(), "UTF8String");
  v10 = strlen(v9) + 1;
  *((_DWORD *)v8 + 3) = v10;
  v11 = (v10 + 31) & 0x1FFFFFFF8;
  *(_QWORD *)v8 = v11;
  v12 = malloc_type_malloc(v11, 0xE52CF464uLL);
  v13 = *(_OWORD *)v8;
  v12[2] = *((_QWORD *)v8 + 2);
  *(_OWORD *)v12 = v13;
  v14 = (char *)v12 + *((unsigned int *)v8 + 2);
  v15 = (const void *)objc_msgSend((id)MTLGetGPUArchiverCachePath(), "UTF8String");
  memcpy(v14, v15, *((unsigned int *)v8 + 3));
  free(v8);
  v16 = dispatch_data_create(v12, v11, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
  v17 = v16;
  if (v16)
    dispatch_retain(v16);
  *(_QWORD *)(v7 + 16) = v17;
  *(_OWORD *)md = 0u;
  v25 = 0u;
  CC_SHA256_Init(&v20);
  CC_SHA256_Update(&v20, v12, v11);
  CC_SHA256_Final(md, &v20);
  v21[1] = 3221225472;
  v23 = v25;
  compilerConnectionManager = self->_compilerConnectionManager;
  compilerId = self->_compilerId;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[2] = __70__MTLCompiler_createBinaryArchiveAsRecompileTarget_completionHandler___block_invoke;
  v21[3] = &unk_1E0FE44A0;
  v22 = *(_OWORD *)md;
  v21[4] = a4;
  (*((void (**)(MTLCompilerConnectionManager *, uint64_t, uint64_t, uint64_t, _QWORD *))compilerConnectionManager->var0
   + 3))(compilerConnectionManager, compilerId, v7, 1, v21);
  dispatch_release(v17);
}

uint64_t __70__MTLCompiler_createBinaryArchiveAsRecompileTarget_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD v9[4];

  if (a4)
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  else
    v7 = 0;
  v9[0] = a2;
  v9[1] = v7;
  v9[2] = a1 + 40;
  v9[3] = a3;
  return (*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9, a3, a4);
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)hashKeyForLibraryRequest:(SEL)a3
{
  NSObject *var3;
  NSObject *v7;
  NSObject *var4;
  NSObject *v9;
  CC_SHA256_CTX c;
  size_t size_ptr;
  void *buffer_ptr;

  CC_SHA256_Init(&c);
  var3 = a4->var3;
  if (var3)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v7 = dispatch_data_create_map(var3, (const void **)&buffer_ptr, &size_ptr);
    CC_SHA256_Update(&c, buffer_ptr, size_ptr);
    dispatch_release(v7);
  }
  var4 = a4->var4;
  if (var4)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v9 = dispatch_data_create_map(var4, (const void **)&buffer_ptr, &size_ptr);
    CC_SHA256_Update(&c, buffer_ptr, size_ptr);
    dispatch_release(v9);
  }
  buffer_ptr = (void *)(a4->var2 & 0xE);
  CC_SHA256_Update(&c, &buffer_ptr, 8u);
  return ($2772B1D07D29A72E8557B2574C0AE5C1 *)CC_SHA256_Final(retstr->var0, &c);
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)hashKeyForStatelessCompilationRequest:(SEL)a3
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  CC_SHA256_CTX c;
  size_t size_ptr;
  void *buffer_ptr;

  CC_SHA256_Init(&c);
  v6 = objc_msgSend(a4, "frameworkData");
  if (v6)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v7 = dispatch_data_create_map(v6, (const void **)&buffer_ptr, &size_ptr);
    CC_SHA256_Update(&c, buffer_ptr, size_ptr);
    dispatch_release(v7);
  }
  v8 = objc_msgSend(a4, "driverKeyData");
  if (v8)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v9 = dispatch_data_create_map(v8, (const void **)&buffer_ptr, &size_ptr);
    CC_SHA256_Update(&c, buffer_ptr, size_ptr);
    dispatch_release(v9);
  }
  return ($2772B1D07D29A72E8557B2574C0AE5C1 *)CC_SHA256_Final(retstr->var0, &c);
}

- (void)addLegacyCompiledOutput:(id)a3 importedSymbols:(id)a4 importedLibraries:(id)a5 hashKey:(id)a6 type:(char)a7 functionCache:(shared_ptr<MultiLevelBinaryCache>)a8
{
  uint64_t *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  v9 = (std::__shared_weak_count *)v8[1];
  v15 = *v8;
  v16 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  -[MTLCompiler addLegacyCompiledOutput:cachedCompiledOutput:importedSymbols:importedLibraries:hashKey:type:functionCache:](self, "addLegacyCompiledOutput:cachedCompiledOutput:importedSymbols:importedLibraries:hashKey:type:functionCache:", a3, 0, a4, a5, a6, a7, &v15);
  v12 = v16;
  if (v16)
  {
    v13 = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (MTLHashKey)getFunctionId:(SEL)a3 airScript:(id)a4 vendorPluginFunctionId:(const void *)a5 bitcodeHashList:(id *)a6
{
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *PipelineFrameworkHash;
  __int128 v16;
  __int128 v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  MTLHashKey *result;
  __int128 v22;
  __int128 v23;
  unsigned __int8 md[16];
  __int128 v25;
  void *__p;
  void *v27;
  char *v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v13 = objc_msgSend(a4, "functionType");
  if (!strncmp((const char *)a5 + 4, "AIRP", 4uLL))
  {
    PipelineFrameworkHash = _getPipelineFrameworkHash((Air::PipelineScript *)((char *)a5 + *(unsigned int *)a5), v13);
  }
  else
  {
    if (strncmp((const char *)a5 + 4, "AIRF", 4uLL))
    {
      v14 = 0;
      goto LABEL_7;
    }
    PipelineFrameworkHash = _getFunctionHash((Air::PipelineScript *)((char *)a5 + *(unsigned int *)a5));
  }
  v14 = PipelineFrameworkHash;
LABEL_7:
  if (useRelaxedMath())
  {
    CC_SHA256(v14, 0x20u, md);
    v16 = v25;
    *(_OWORD *)v14 = *(_OWORD *)md;
    *((_OWORD *)v14 + 1) = v16;
  }
  v17 = *((_OWORD *)v14 + 1);
  v29 = *(_OWORD *)v14;
  v30 = v17;
  *(_QWORD *)md = objc_msgSend(a4, "bitCodeHash");
  *(_QWORD *)&md[8] = 0;
  v25 = 0uLL;
  std::vector<MTLUINT256_t const*>::__init_with_size[abi:ne180100]<MTLUINT256_t const**,MTLUINT256_t const**>(&md[8], *(const void **)a7, *((_QWORD *)a7 + 1), (uint64_t)(*((_QWORD *)a7 + 1) - *(_QWORD *)a7) >> 3);
  if (self)
  {
    -[MTLCompiler getGPUCompilerHashForScript:type:](self, "getGPUCompilerHashForScript:type:", a5, v13);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
  }
  __p = 0;
  v27 = 0;
  v28 = 0;
  v18 = (char *)operator new(0x6CuLL);
  *(_OWORD *)(v18 + 4) = v22;
  *(_OWORD *)(v18 + 20) = v23;
  v19 = *(_OWORD *)&a6->var0[16];
  *(_OWORD *)(v18 + 40) = *(_OWORD *)a6->var0;
  *(_OWORD *)(v18 + 56) = v19;
  v20 = v30;
  *(_OWORD *)(v18 + 76) = v29;
  v27 = v18 + 108;
  v28 = v18 + 108;
  *(_DWORD *)v18 = 1026;
  *((_DWORD *)v18 + 9) = 1027;
  *((_DWORD *)v18 + 18) = 1032;
  *(_OWORD *)(v18 + 92) = v20;
  __p = v18;
  free(v14);
  MTLHashKey::MTLHashKey(retstr, (const MTLFunctionToolList *)md);
  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }
  result = *(MTLHashKey **)&md[8];
  if (*(_QWORD *)&md[8])
  {
    *(_QWORD *)&v25 = *(_QWORD *)&md[8];
    operator delete(*(void **)&md[8]);
  }
  return result;
}

- (BOOL)initializeVendorPluginFunctionId:(id)a3 airScript:(const void *)a4 driverCompilerOptions:(id)a5 compiledNextStageVariant:(id)a6 vendorPlugin:(id *)a7
{
  char **v12;
  _MTLDevice *device;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v18;

  if (a4)
  {
    v18 = 0;
    v12 = -[_MTLDevice newTranslatedDriverCompilerOptions:compilerOptionsSize:](self->_device, "newTranslatedDriverCompilerOptions:compilerOptionsSize:", a5, &v18);
    device = self->_device;
    v14 = objc_msgSend(a3, "functionType");
    v15 = -[MTLCompiler getHashForScript:device:function:functionType:compilerOptions:compilerOptionsSize:compiledNextStageVariant:](self, "getHashForScript:device:function:functionType:compilerOptions:compilerOptionsSize:compiledNextStageVariant:", a4, device, a3, v14, v12, v18, a6);
    if (v15)
    {
      v16 = v15[1];
      *(_OWORD *)a7->var0 = *v15;
      *(_OWORD *)&a7->var0[16] = v16;
      free(v15);
    }
    -[_MTLDevice freeTranslatedDriverCompilerOptions:compilerOptionsSize:](self->_device, "freeTranslatedDriverCompilerOptions:compilerOptionsSize:", v12, v18);
  }
  return a4 != 0;
}

- (void)initializeFunctionRequestScriptAndFunctionId:(id)a3 script:(const void *)a4 driverCompilerOptions:(id)a5 compiledNextStageVariant:(id)a6
{
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  -[MTLCompiler initializeVendorPluginFunctionId:airScript:driverCompilerOptions:compiledNextStageVariant:vendorPlugin:](self, "initializeVendorPluginFunctionId:airScript:driverCompilerOptions:compiledNextStageVariant:vendorPlugin:", objc_msgSend(a3, "function"), a4, a5, a6, &v8);
  v7[0] = v8;
  v7[1] = v9;
  objc_msgSend(a3, "setVendorPluginFunctionId:", v7);
}

- (void)getHashForScript:(const void *)a3 device:(id)a4 function:(id)a5 functionType:(unint64_t)a6 compilerOptions:(char *)a7 compilerOptionsSize:(unint64_t)a8 compiledNextStageVariant:(id)a9
{
  const char *v15;
  char *v16;
  void *result;

  if (!a3)
    return 0;
  v15 = (char *)a3 + 4;
  if (!strncmp((const char *)a3 + 4, "AIRP", 4uLL) || !strncmp(v15, "AIRF", 4uLL))
    v16 = (char *)a3 + *(unsigned int *)a3;
  else
    v16 = 0;
  switch(a6)
  {
    case 1uLL:
      result = (void *)objc_msgSend(a4, "getVertexFunctionId:function:compilerOptions:compilerOptionsSize:compiledFragmentVariant:", v16, a5, a7, a8, a9);
      break;
    case 2uLL:
      result = (void *)objc_msgSend(a4, "getFragmentFunctionId:compilerOptions:compilerOptionsSize:", v16, a7, a8);
      break;
    case 3uLL:
      result = (void *)objc_msgSend(a4, "getComputeFunctionId:function:compilerOptions:compilerOptionsSize:", v16, a5, a7, a8);
      break;
    case 5uLL:
      result = (void *)objc_msgSend(a4, "getVisibleFunctionId:compilerOptions:compilerOptionsSize:", v16, a7, a8);
      break;
    case 6uLL:
      result = (void *)objc_msgSend(a4, "getIntersectionFunctionId:compilerOptions:compilerOptionsSize:", v16, a7, a8);
      break;
    case 7uLL:
      result = (void *)objc_msgSend(a4, "getMeshFunctionId:compilerOptions:compilerOptionsSize:", v16, a7, a8);
      break;
    case 8uLL:
      result = (void *)objc_msgSend(a4, "getObjectFunctionId:compilerOptions:compilerOptionsSize:", v16, a7, a8);
      break;
    default:
      return 0;
  }
  return result;
}

- (void)getDataForScript:(const void *)a3 device:(id)a4 function:(id)a5 functionType:(unint64_t)a6 compilerOptions:(char *)a7 compilerOptionsSize:(unint64_t)a8 compiledNextStageVariant:(id)a9 dataSize:(unint64_t *)a10
{
  char *v15;

  if (a3)
  {
    if (!strncmp((const char *)a3 + 4, "AIRP", 4uLL))
      v15 = (char *)a3 + *(unsigned int *)a3;
    else
      v15 = 0;
    switch(a6)
    {
      case 8uLL:
        return (void *)objc_msgSend(a4, "getObjectFunctionDriverData:function:compilerOptions:nextStageVariant:driverDataSize:", v15, a5, a7, a9, a10);
      case 7uLL:
        return (void *)objc_msgSend(a4, "getMeshFunctionDriverData:function:compilerOptions:nextStageVariant:driverDataSize:", v15, a5, a7, a9, a10);
      case 1uLL:
        return (void *)objc_msgSend(a4, "getVertexFunctionDriverData:function:compilerOptions:nextStageVariant:driverDataSize:", v15, a5, a7, a9, a10);
    }
    if (a10)
      *a10 = 0;
  }
  return 0;
}

- (void)getFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 unfilteredOptions:(unint64_t)a5 airScript:(const void *)a6 function:(id)a7 functionType:(unint64_t)a8 compiledNextStageVariant:(id)a9 keySize:(unint64_t *)a10 functionDriverData:(void *)a11 functionDriverSize:(unint64_t *)a12
{
  void *result;

  switch(a8)
  {
    case 1uLL:
      result = -[_MTLDevice vertexFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:vertexKeySize:](self->_device, "vertexFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:vertexKeySize:", a3, a4, a9, a10, a7);
      break;
    case 2uLL:
      result = -[_MTLDevice fragmentFunctionKeyWithRenderPipelineDescriptor:options:previousStateVariant:fragmentKeySize:](self->_device, "fragmentFunctionKeyWithRenderPipelineDescriptor:options:previousStateVariant:fragmentKeySize:", a3, a4, 0, a10, a7);
      break;
    case 7uLL:
      result = -[_MTLDevice meshFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:meshKeySize:](self->_device, "meshFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:meshKeySize:", a3, a4, a9, a10, a7);
      break;
    case 8uLL:
      result = -[_MTLDevice objectFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:objectKeySize:](self->_device, "objectFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:objectKeySize:", a3, a4, a9, a10, a7);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)getFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 unfilteredOptions:(unint64_t)a5 airScript:(const void *)a6 function:(id)a7 functionType:(unint64_t)a8 compiledNextStageVariant:(id)a9 keySize:(unint64_t *)a10
{
  return -[MTLCompiler getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:](self, "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

- (id)newLinkedFunctionsBitcodeFromRequest:(id)a3 hashKey:(void *)a4
{
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int k;
  unint64_t *Hash;
  void *v23;
  NSObject **v24;
  NSObject *v25;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  int v37;
  unint64_t *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a3, "visibleFunctions"), "count")
    && !objc_msgSend((id)objc_msgSend(a3, "privateVisibleFunctions"), "count"))
  {
    return 0;
  }
  v27 = objc_msgSend((id)objc_msgSend(a3, "visibleFunctions"), "count");
  v6 = objc_msgSend((id)objc_msgSend(a3, "privateVisibleFunctions"), "count");
  memset(v36, 0, sizeof(v36));
  v37 = 1065353216;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = (void *)objc_msgSend(a3, "visibleFunctions");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "bitcodeDataInternal");
        v38 = (unint64_t *)objc_msgSend(v11, "bitCodeHash");
        std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)v36, v38, (uint64_t)&std::piecewise_construct, (_OWORD **)&v38)[6] = v12;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v8);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = (void *)objc_msgSend(a3, "privateVisibleFunctions");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        v18 = objc_msgSend(v17, "bitcodeDataInternal");
        v38 = (unint64_t *)objc_msgSend(v17, "bitCodeHash");
        std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)v36, v38, (uint64_t)&std::piecewise_construct, (_OWORD **)&v38)[6] = v18;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v14);
  }
  v19 = (v6 + v27);
  v20 = operator new[]();
  for (k = 0; ; ++k)
  {
    Hash = (unint64_t *)MTLHashKey::getHash((uint64_t)a4, 0, k + 1);
    if (!Hash)
      break;
    *(_QWORD *)(v20 + 8 * k) = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(v36, Hash)[6];
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v20, v19);
  if ((_DWORD)v19)
  {
    v24 = (NSObject **)v20;
    do
    {
      v25 = *v24++;
      dispatch_release(v25);
      --v19;
    }
    while (v19);
  }
  MEMORY[0x186DABFA4](v20, 0x80C80B8603338);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v36);
  return v23;
}

- (id)createErrorMessageWithRequest:(id)a3 key:(id)a4 cacheType:(const char *)a5 itemLookedFor:(const char *)a6
{
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  unsigned int *v17;
  int *v18;
  void *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  unsigned __int8 v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v26;
  size_t size_ptr;
  void *buffer_ptr;

  v10 = (void *)objc_msgSend(a3, "function");
  v11 = objc_msgSend(a3, "airScript");
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_msgSend(v10, "name");
  if (a6)
    v14 = objc_msgSend(v12, "stringWithFormat:", CFSTR("Unable to find %s for function \"%@\"), a6, v13);
  else
    v14 = objc_msgSend(v12, "stringWithFormat:", CFSTR("Unable to find function \"%@\"), v13, v26);
  v15 = (void *)v14;
  if (v11)
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v16 = dispatch_data_create_map(v11, (const void **)&buffer_ptr, &size_ptr);
    v17 = (unsigned int *)buffer_ptr;
    if (!strncmp((const char *)buffer_ptr + 4, "AIRP", 4uLL))
    {
      v18 = (int *)((char *)v17 + *v17);
      v19 = (void *)objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(" ("));
      v20 = (unsigned __int16 *)((char *)v18 - *v18);
      if (*v20 >= 9u && (v21 = v20[4]) != 0 && (v22 = *((_BYTE *)v18 + v21) - 1, v22 <= 3u))
        v23 = (const __CFString *)*((_QWORD *)&off_1E0FE4A58 + (char)v22);
      else
        v23 = CFSTR("unknown pipeline type)");
      v15 = (void *)objc_msgSend(v19, "stringByAppendingFormat:", v23);
    }
    dispatch_release(v16);
  }
  if (a6)
    v24 = CFSTR(" in (legacy) %s.\n Expected ");
  else
    v24 = CFSTR(" in %s. \n Expected ");
  return (id)objc_msgSend((id)objc_msgSend(v15, "stringByAppendingFormat:", v24, a5), "stringByAppendingFormat:", CFSTR("%@"), objc_msgSend(a4, "description"));
}

- (void)compileStatelessFunctionRequest:(id)a3 reflectionOnly:(BOOL)a4 completionHandler:(id)a5
{
  unsigned int v6;
  char *v7;
  unint64_t *v8;
  char *v9;
  unint64_t *v10;
  void *v11;
  uint64_t Hash;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*on_zero_shared_weak)(void);
  int v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  MTLBinaryEntry *v25;
  MTLBinaryEntry *v26;
  NSObject *v27;
  int v28;
  const char *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  MTLCompilerFunctionRequest *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  int v45;
  char v46;
  void *v47;
  MTLTargetDeviceArchitecture *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t *p_shared_owners;
  unint64_t v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v66;
  int v67;
  NSObject *object;
  MTLBinaryKey *v69;
  void *v70;
  uint64_t v71;
  unsigned int v72;
  _QWORD v74[11];
  std::__shared_weak_count *v75;
  std::__shared_weak_count *v76;
  std::__shared_weak_count *v77;
  char *v78;
  std::__shared_weak_count *v79;
  char v80;
  char v81;
  id v82;
  size_t size_ptr;
  void *buffer_ptr;
  CC_SHA256_CTX v85;
  id v86;
  NSObject *v87;
  _QWORD v88[2];
  std::__shared_weak_count *v89;
  char *v90;
  std::__shared_weak_count *v91;
  std::__shared_weak_count *v92;
  std::__shared_weak_count *v93;
  _BYTE v94[32];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  MTLHashKey v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;

  v72 = a4;
  v105 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "pipelineOptions") & 4) != 0)
    v6 = ~(objc_msgSend(a3, "pipelineOptions") >> 28) & 2;
  else
    v6 = 0;
  MultiLevelCacheFactory::createBinaryCache(objc_msgSend(a3, "binaryArchives"), (void *)objc_msgSend(a3, "destinationBinaryArchive"), (void *)objc_msgSend(a3, "pipelineCache"), (uint64_t)self->_shaderCache.__ptr_, ((unint64_t)objc_msgSend(a3, "pipelineOptions") >> 32) & 4 | v6, &v92);
  v7 = (char *)operator new(0x40uLL);
  *((_QWORD *)v7 + 1) = 0;
  v8 = (unint64_t *)(v7 + 8);
  *((_QWORD *)v7 + 2) = 0;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_QWORD *)v7 = &off_1E0FE21D0;
  *(_OWORD *)(v7 + 40) = 0u;
  *((_DWORD *)v7 + 14) = 1065353216;
  v71 = (uint64_t)(v7 + 24);
  v90 = v7 + 24;
  v91 = (std::__shared_weak_count *)v7;
  v9 = (char *)operator new(0x40uLL);
  *((_QWORD *)v9 + 1) = 0;
  v10 = (unint64_t *)(v9 + 8);
  *((_QWORD *)v9 + 2) = 0;
  *(_QWORD *)v9 = &off_1E0FE2198;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *((_DWORD *)v9 + 14) = 1065353216;
  v88[1] = v9 + 24;
  v89 = (std::__shared_weak_count *)v9;
  v87 = 0;
  v88[0] = 0;
  v11 = (void *)objc_msgSend(a3, "function");
  v67 = MTLGetCompilerOptions((void *)objc_msgSend(v11, "device"), objc_msgSend(a3, "pipelineOptions"), self->_compilerFlags, 2uLL, v72);
  v70 = v11;
  FunctionHashFactory::FunctionHashFactory(&v85, v11, objc_msgSend(v11, "functionData"), v67, (void *)objc_msgSend(a3, "gpuCompilerSPIOptions"), (void *)objc_msgSend(a3, "visibleFunctions"), (void *)objc_msgSend(a3, "privateVisibleFunctions"));
  Hash = FunctionHashFactory::createHash((uint64_t)&v85, 2, 0, 0, 0, 0);
  v13 = FunctionHashFactory::createHash((uint64_t)&v85, 0, (dispatch_data_t)objc_msgSend(a3, "driverKeyData"), objc_msgSend(a3, "frameworkData"));
  LOBYTE(v103) = 2;
  *(_QWORD *)&v95 = &v103;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)(v9 + 24), (char *)&v103, (uint64_t)&std::piecewise_construct, (_BYTE **)&v95)[3] = Hash;
  LOBYTE(v103) = 0;
  *(_QWORD *)&v95 = &v103;
  v66 = (uint64_t)(v9 + 24);
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)(v9 + 24), (char *)&v103, (uint64_t)&std::piecewise_construct, (_BYTE **)&v95)[3] = v13;
  v14 = objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "supportsAIRNT");
  size_ptr = 0;
  buffer_ptr = 0;
  object = _MTLCreateFuncionScriptFromFunctionType((MTLFunctionType)objc_msgSend((id)objc_msgSend(a3, "function"), "functionType"));
  v15 = dispatch_data_create_map(object, (const void **)&buffer_ptr, &size_ptr);
  v103 = 0u;
  v104 = 0u;
  if (!-[_MTLDevice supportsFamily:](self->_device, "supportsFamily:", 1001))
  {
    -[MTLCompiler initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:](self, "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", a3, buffer_ptr, 0, 0);
    if (a3)
    {
      objc_msgSend(a3, "vendorPluginFunctionId");
    }
    else
    {
      v95 = 0u;
      v96 = 0u;
    }
    v103 = v95;
    v104 = v96;
  }
  v16 = objc_msgSend(a3, "function");
  -[MTLCompiler getFunctionId:airScript:vendorPluginFunctionId:](self, "getFunctionId:airScript:vendorPluginFunctionId:", v16, buffer_ptr, &v103);
  dispatch_release(v15);
  if ((objc_msgSend(a3, "pipelineOptions") & 1) != 0)
  {
    if ((objc_msgSend(a3, "pipelineOptions") & 0x200008000) != 0)
      v17 = 1;
    else
      v17 = 5;
  }
  else
  {
    v17 = 1;
  }
  v69 = -[MTLBinaryKey initWithHash:]([MTLBinaryKey alloc], "initWithHash:", &v102);
  v18 = v14 & (v72 ^ 1);
  if (v18)
  {
    if ((((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, _QWORD *, NSObject **, uint64_t))v92->__vftable[4].~__shared_weak_count)(v92, v69, v88, &v87, 6) & 1) != 0)
    {
      v18 = 0;
LABEL_19:
      v19 = 1;
      goto LABEL_32;
    }
    v17 = 6;
  }
  if ((((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, _QWORD *, NSObject **, uint64_t))v92->__vftable[2].__on_zero_shared)(v92, v69, v88, &v87, v17) & 1) != 0)goto LABEL_19;
  on_zero_shared_weak = (uint64_t (*)(void))v92->__vftable[2].__on_zero_shared_weak;
  if (!v18)
  {
    v19 = on_zero_shared_weak();
    v18 = 0;
    v72 = (v72 & 1) != 0;
    goto LABEL_32;
  }
  if (!on_zero_shared_weak())
    goto LABEL_28;
  if ((~MTLGetReflectionFlags(v87) & 6) != 0)
  {
    if (((unsigned int (*)(std::__shared_weak_count *))v92->__vftable[1].~__shared_weak_count)(v92))
    {
      *(_QWORD *)&v95 = 1;
      *((_QWORD *)&v95 + 1) = CFSTR("Fail on cache miss was set and failed to find aint-compatible reflection");
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      (*((void (**)(id, __int128 *))a5 + 2))(a5, &v95);
      if (object)
        dispatch_release(object);
    }
LABEL_28:
    v21 = 0;
    goto LABEL_29;
  }
  v21 = 1;
LABEL_29:
  v19 = v21 & ((uint64_t (*)(std::__shared_weak_count *, void *, _QWORD *))v92->__vftable[2].__on_zero_shared_weak)(v92, v13, v88);
  v22 = v19 ^ 1;
  if (!v88[0])
    v22 = 0;
  v72 |= v22;
  v18 = 1;
LABEL_32:
  v23 = v87;
  LOBYTE(v82) = 2;
  *(_QWORD *)&v95 = &v82;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v71, (char *)&v82, (uint64_t)&std::piecewise_construct, (_BYTE **)&v95)[3] = v23;
  v24 = v88[0];
  LOBYTE(v82) = 0;
  *(_QWORD *)&v95 = &v82;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v71, (char *)&v82, (uint64_t)&std::piecewise_construct, (_BYTE **)&v95)[3] = v24;
  if (v19)
  {
    if (v18)
    {
      v25 = [MTLBinaryEntry alloc];
      v26 = -[MTLBinaryEntry initWithData:reflectionBlock:](v25, "initWithData:reflectionBlock:", v88[0], v87);
      -[MTLBinaryEntry setAirScript:](v26, "setAirScript:", object);
      v27 = _MTLNSDataToDispatchData((void *)objc_msgSend(v70, "bitcodeData"), 0);
      -[MTLBinaryEntry setBitcode:](v26, "setBitcode:", v27);
      if (v27)
        dispatch_release(v27);
      ((void (*)(std::__shared_weak_count *, MTLBinaryKey *, MTLBinaryEntry *, _QWORD, uint64_t))v92->__vftable[3].~__shared_weak_count_0)(v92, v69, v26, 0, objc_msgSend(v70, "functionType"));

    }
    FunctionReplyParameters::FunctionReplyParameters(&v95, 0, 0, v71, v66);
    (*((void (**)(id, __int128 *))a5 + 2))(a5, &v95);
    -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v71, v66);
    goto LABEL_43;
  }
  if ((((uint64_t (*)(std::__shared_weak_count *))v92->__vftable[2].~__shared_weak_count_0)(v92) & 1) != 0
    || ((unsigned int (*)(std::__shared_weak_count *))v92->__on_zero_shared_weak)(v92))
  {
    v28 = ((uint64_t (*)(std::__shared_weak_count *))v92->__vftable[2].~__shared_weak_count_0)(v92);
    v29 = "FS cache";
    if (v28)
      v29 = "binary archives";
    v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find compiled function in %s."), v29);
    *(_QWORD *)&v95 = 1;
    *((_QWORD *)&v95 + 1) = v30;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    (*((void (**)(id, __int128 *))a5 + 2))(a5, &v95);
    -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v71, v66);
    goto LABEL_43;
  }
  if ((v72 & 1) == 0
    && (objc_msgSend(a3, "functionOptions") & 1) == 0
    && (objc_msgSend(a3, "pipelineOptions") & 0x20000000) == 0)
  {
    *(_QWORD *)&v95 = 4;
    *((_QWORD *)&v95 + 1) = CFSTR("Empty request.");
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    (*((void (**)(id, __int128 *))a5 + 2))(a5, &v95);
    -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v71, v66);
    goto LABEL_43;
  }
  v40 = (MTLCompilerFunctionRequest *)operator new();
  v40->var1 = 0;
  v40->var0 = (void **)&off_1E0FE1100;
  v40->var4 = 0;
  v40->var2 = 0;
  v40->var18 = 0;
  v40->var19 = 0;
  v40->var5 = 0;
  *(_OWORD *)&v40->var9 = 0u;
  *(_OWORD *)&v40->var11 = 0u;
  *(_OWORD *)&v40->var13 = 0u;
  *(_OWORD *)((char *)&v40->var14 + 5) = 0u;
  *(_OWORD *)&v40->var20 = 0u;
  *(_OWORD *)&v40->var22 = 0u;
  *(_OWORD *)&v40->var24 = 0u;
  if (v70)
    v40->var4 = v70;
  v41 = objc_msgSend(a3, "driverKeyData");
  v42 = v41;
  if (v41)
    dispatch_retain(v41);
  v40->var2 = v42;
  v43 = objc_msgSend(a3, "frameworkData");
  v44 = v43;
  if (v43)
    dispatch_retain(v43);
  v40->var9 = v44;
  v40->var6 = v67;
  memset(v94, 0, sizeof(v94));
  -[MTLCompiler hashKeyForStatelessCompilationRequest:](self, "hashKeyForStatelessCompilationRequest:", a3);
  objc_msgSend(a3, "pipelineOptions");
  v40->var17 = 1;
  v45 = objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "remoteInsertionBegin");
  v46 = v45;
  if ((v18 & v45) == 1)
  {
    v82 = 0;
    v47 = (void *)objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "getArchiveIDWithErrorInternal:", &v82);
    if (!v47)
    {
      objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "remoteInsertionEnd");
      v64 = objc_msgSend(v82, "localizedDescription");
      *(_QWORD *)&v95 = 2;
      *((_QWORD *)&v95 + 1) = v64;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      (*((void (**)(id, __int128 *))a5 + 2))(a5, &v95);
      (*((void (**)(MTLCompilerFunctionRequest *))v40->var0 + 1))(v40);
      -[MTLCompiler releaseCompilerOutputBlocks:hashMap:](self, "releaseCompilerOutputBlocks:hashMap:", v71, v66);
LABEL_43:
      if (object)
        dispatch_release(object);
      goto LABEL_45;
    }
    MTLCompilerFunctionRequest::setBinaryArchiveID(v40, (const char *)objc_msgSend(v47, "UTF8String"));
    v40->var19 = 1;
    v40->var21 = &v102;
    v48 = -[_MTLDevice targetDeviceArchitecture](self->_device, "targetDeviceArchitecture");
    v49 = -[MTLTargetDeviceArchitecture cpuType](v48, "cpuType");
    LODWORD(v48) = -[MTLTargetDeviceArchitecture subType](v48, "subType");
    MTLCompilerFunctionRequest::setAirScript((uint64_t)v40, object);
    v40->var23 = (int)v48 | (unint64_t)(v49 << 32);
  }
  v50 = objc_msgSend(a3, "sync");
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3321888768;
  v74[2] = __80__MTLCompiler_compileStatelessFunctionRequest_reflectionOnly_completionHandler___block_invoke;
  v74[3] = &unk_1E0FE2238;
  v74[4] = a3;
  v74[10] = v7 + 24;
  v75 = (std::__shared_weak_count *)v7;
  do
    v51 = __ldxr(v8);
  while (__stxr(v51 + 1, v8));
  v80 = v18;
  v81 = v46;
  v74[5] = object;
  v74[6] = v70;
  v76 = v92;
  v77 = v93;
  if (v93)
  {
    p_shared_owners = (unint64_t *)&v93->__shared_owners_;
    do
      v53 = __ldxr(p_shared_owners);
    while (__stxr(v53 + 1, p_shared_owners));
  }
  v74[7] = v69;
  v74[8] = self;
  v78 = v9 + 24;
  v79 = (std::__shared_weak_count *)v9;
  do
    v54 = __ldxr(v10);
  while (__stxr(v54 + 1, v10));
  v74[9] = a5;
  -[MTLCompiler statelessBackendCompileRequestInternal:sync:compilerHash:reflectionOnly:completionHandler:](self, "statelessBackendCompileRequestInternal:sync:compilerHash:reflectionOnly:completionHandler:", v40, v50, v94, v72, v74);
  objc_msgSend(a3, "setAirScript:", 0);
  v55 = v79;
  if (v79)
  {
    v56 = (unint64_t *)&v79->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  v58 = v77;
  if (v77)
  {
    v59 = (unint64_t *)&v77->__shared_owners_;
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  v61 = v75;
  if (v75)
  {
    v62 = (unint64_t *)&v75->__shared_owners_;
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
LABEL_45:
  MTLHashKey::~MTLHashKey(&v102);

  v31 = v89;
  if (v89)
  {
    v32 = (unint64_t *)&v89->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = v91;
  if (v91)
  {
    v35 = (unint64_t *)&v91->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  v37 = v93;
  if (v93)
  {
    v38 = (unint64_t *)&v93->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
}

uint64_t __80__MTLCompiler_compileStatelessFunctionRequest_reflectionOnly_completionHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLBinaryEntry *v8;
  MTLBinaryEntry *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v23;
  std::__shared_weak_count *v24;
  char v25;
  char v26;
  _OWORD v27[2];
  int v28;
  char *v29;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationBinaryArchive"), "remoteInsertionEnd");
  if (!*a2)
  {
    memset(v27, 0, sizeof(v27));
    v28 = 1065353216;
    v4 = a2[5];
    if (!v4)
    {
      v5 = *(_QWORD *)(a1 + 80);
      v26 = 2;
      v29 = &v26;
      v4 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v5, &v26, (uint64_t)&std::piecewise_construct, &v29)[3];
    }
    v25 = 2;
    v29 = &v25;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v27, &v25, (uint64_t)&std::piecewise_construct, &v29)[3] = v4;
    v6 = a2[3];
    if (!v6)
    {
      v7 = *(_QWORD *)(a1 + 80);
      v26 = 0;
      v29 = &v26;
      v6 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v7, &v26, (uint64_t)&std::piecewise_construct, &v29)[3];
    }
    v25 = 0;
    v29 = &v25;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v27, &v25, (uint64_t)&std::piecewise_construct, &v29)[3] = v6;
    if (!*(_BYTE *)(a1 + 128))
      goto LABEL_11;
    v8 = -[MTLBinaryEntry initWithData:reflectionBlock:]([MTLBinaryEntry alloc], "initWithData:reflectionBlock:", a2[3], a2[5]);
    v9 = v8;
    if (*(_BYTE *)(a1 + 129))
    {
      (*(void (**)(_QWORD, _QWORD, MTLBinaryEntry *))(**(_QWORD **)(a1 + 96) + 144))(*(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), v8);
    }
    else
    {
      -[MTLBinaryEntry setAirScript:](v8, "setAirScript:", *(_QWORD *)(a1 + 40));

      v10 = _MTLNSDataToDispatchData((void *)objc_msgSend(*(id *)(a1 + 48), "bitcodeData"), 0);
      -[MTLBinaryEntry setBitcode:](v9, "setBitcode:", v10);
      dispatch_release(v10);
      (*(void (**)(_QWORD, _QWORD, MTLBinaryEntry *, _QWORD, uint64_t))(**(_QWORD **)(a1 + 96) + 128))(*(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), v9, 0, objc_msgSend(*(id *)(a1 + 48), "functionType"));
    }

    if (!*(_BYTE *)(a1 + 128))
    {
LABEL_11:
      v11 = *(void **)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 80);
      v13 = *(_QWORD *)(a1 + 112);
      v14 = objc_msgSend(*(id *)(a1 + 48), "libraryData");
      v15 = *(std::__shared_weak_count **)(a1 + 104);
      v23 = *(_QWORD *)(a1 + 96);
      v24 = v15;
      if (v15)
      {
        p_shared_owners = (unint64_t *)&v15->__shared_owners_;
        do
          v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
      }
      objc_msgSend(v11, "cacheLegacyCompilerData:cachedData:hashMap:libraryData:functionCache:", v27, v12, v13, v14, &v23);
      v18 = v24;
      if (v24)
      {
        v19 = (unint64_t *)&v24->__shared_owners_;
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v27);
  }
  v21 = *(NSObject **)(a1 + 40);
  if (v21)
    dispatch_release(v21);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  return objc_msgSend(*(id *)(a1 + 64), "releaseHashMaps:", *(_QWORD *)(a1 + 112));
}

- (void)compileLibraryRequest:(MTLCompileLibraryRequestData *)a3 completionHandler:(id)a4
{
  id var1;
  uint64_t v8;
  size_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  unint64_t Options;
  int v15;
  uint64_t v16;
  id v17;
  id var4;
  id var3;
  NSObject *v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  var1 = a3->var1;
  v8 = objc_msgSend((id)objc_msgSend(var1, "device"), "pluginData");
  if (v8)
  {
    v9 = MTLSerializePluginDataDictionary((void *)objc_msgSend((id)objc_msgSend(var1, "device"), "pluginData"), 0)
       + 44;
    v10 = 44;
  }
  else
  {
    v10 = 0;
    v9 = 44;
  }
  v11 = (char *)malloc_type_calloc(v9, 1uLL, 0x97D4CAC6uLL);
  v12 = objc_msgSend(var1, "cacheEntry");
  v13 = *(_OWORD *)(v12 + 28);
  *(_OWORD *)(v11 + 8) = *(_OWORD *)(v12 + 12);
  *(_OWORD *)(v11 + 24) = v13;
  *(_DWORD *)v11 = v10;
  if (v8)
    MTLSerializePluginDataDictionary((void *)objc_msgSend((id)objc_msgSend(var1, "device"), "pluginData"), &v11[v10]);
  if (objc_msgSend(var1, "shaderValidationEnabled"))
    v11[40] = 1;
  a3->var3 = dispatch_data_create(v11, v9, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
  Options = MTLPipelineOptionsFromDynamicLibraryLoadOptions(a3->var2);
  if (objc_msgSend(var1, "shaderValidationEnabled"))
    Options |= 0x1000000uLL;
  v15 = MTLGetCompilerOptions((void *)objc_msgSend(var1, "device"), Options, self->_compilerFlags, 2uLL, 0);
  v16 = operator new();
  *(_DWORD *)(v16 + 8) = 0;
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)v16 = &off_1E0FE1100;
  *(_DWORD *)(v16 + 128) = 0;
  *(_BYTE *)(v16 + 132) = 0;
  *(_QWORD *)(v16 + 32) = 0;
  *(_QWORD *)(v16 + 40) = 0;
  *(_OWORD *)(v16 + 64) = 0u;
  *(_OWORD *)(v16 + 80) = 0u;
  *(_OWORD *)(v16 + 96) = 0u;
  *(_OWORD *)(v16 + 109) = 0u;
  *(_OWORD *)(v16 + 136) = 0u;
  *(_OWORD *)(v16 + 152) = 0u;
  *(_OWORD *)(v16 + 168) = 0u;
  v17 = a3->var1;
  if (v17)
    *(_QWORD *)(v16 + 40) = v17;
  var4 = a3->var4;
  if (var4)
    dispatch_retain((dispatch_object_t)a3->var4);
  *(_QWORD *)(v16 + 16) = var4;
  var3 = a3->var3;
  if (var3)
    dispatch_retain((dispatch_object_t)a3->var3);
  *(_QWORD *)(v16 + 64) = var3;
  *(_DWORD *)(v16 + 48) = v15;
  -[MTLCompiler hashKeyForLibraryRequest:](self, "hashKeyForLibraryRequest:", a3, 0, 0, 0, 0);
  *(_BYTE *)(v16 + 124) = 1;
  -[MTLCompiler statelessBackendCompileRequestInternal:sync:compilerHash:reflectionOnly:completionHandler:](self, "statelessBackendCompileRequestInternal:sync:compilerHash:reflectionOnly:completionHandler:", v16, 1, &v21, 0, a4);
  v20 = a3->var3;
  if (v20)
    dispatch_release(v20);
}

- (id)downgradeFunctionRequest:(const MTLCompilerFunctionRequest *)a3 targetLLVMVersion:(unsigned int)a4 frameworkData:(void *)a5 error:(id *)a6
{
  unsigned int var6;
  id var4;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  __n128 v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  dispatch_object_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  dispatch_object_t object;
  MTLHashKey v37;
  _QWORD v38[2];
  void (*v39)(uint64_t, uint64_t, NSObject *, uint64_t);
  void *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  id *v45;
  void *v46;
  unsigned int v47;
  __int128 v48;
  __int128 v49;
  _OWORD v50[2];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a3->var17)
    var6 = 0;
  else
    var6 = a3->var6;
  var4 = a3->var4;
  object = 0;
  downgradeRequestHashAndData(v50, &object, (MTLCompilerFunctionRequest *)a3, a4);
  v13 = _MTLGetLibrariesCache(self->_device);
  MultiLevelCacheFactory::createAirCache(0, 0, 0, *(_QWORD *)(v13 + 32), 0, &v34);
  v14 = objc_msgSend(var4, "device");
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__10;
  v32 = __Block_byref_object_dispose__10;
  v33 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3321888768;
  v39 = __78__MTLCompiler_downgradeFunctionRequest_targetLLVMVersion_frameworkData_error___block_invoke;
  v40 = &unk_1E0FDF5F0;
  v15 = v34;
  v41 = v14;
  v43 = v34;
  v44 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  v48 = v50[0];
  v49 = v50[1];
  v45 = a6;
  v46 = a5;
  v47 = var6;
  v42 = &v28;
  v27 = 0;
  v18 = MTLHashKey::MTLHashKey((uint64_t)&v37, (uint64_t)v50);
  (*(void (**)(uint64_t, MTLHashKey *, dispatch_object_t *, __n128))(*(_QWORD *)v15 + 96))(v15, &v37, &v27, v18);
  MTLHashKey::~MTLHashKey(&v37);
  if (v27)
  {
    dispatch_release(object);
    v39((uint64_t)v38, 0, v27, 0);
    dispatch_release(v27);
  }
  else
  {
    downgradeRequest((uint64_t)a3, a4, object, (uint64_t)v38);
  }
  v19 = (void *)v29[5];
  v20 = v44;
  if (v44)
  {
    v21 = (unint64_t *)&v44->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  _Block_object_dispose(&v28, 8);
  v23 = v35;
  if (v35)
  {
    v24 = (unint64_t *)&v35->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  return v19;
}

void __78__MTLCompiler_downgradeFunctionRequest_targetLLVMVersion_frameworkData_error___block_invoke(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  const __CFString *v6;
  id v8;
  id v9;
  _MTLDevice *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  int v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD v20[2];
  MTLHashKey v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = *(_MTLDevice **)(a1 + 32);
    v11 = *(std::__shared_weak_count **)(a1 + 56);
    v20[0] = *(_QWORD *)(a1 + 48);
    v20[1] = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    MTLHashKey::MTLHashKey((uint64_t)&v21, a1 + 84);
    v14 = processCompiledLibrary(a3, v10, 7, v20, (uint64_t)&v21, 1, 0, v8, v9, 0, *(uint64_t **)(a1 + 64), *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80));
    MTLHashKey::~MTLHashKey(&v21);
    if (!v11)
      goto LABEL_13;
    v15 = (unint64_t *)&v11->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
      if (v14)
      {
LABEL_14:
        if ((*(_BYTE *)(a1 + 80) & 2) != 0)
        {
          v18 = *(_QWORD *)(a1 + 72);
          if (v18)
          {
            v19 = 2;
            v21.var0.var0 = (unint64_t)&v19;
            std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v18, &v19, (uint64_t)&std::piecewise_construct, &v21);
          }
        }
        else if (objc_msgSend(v8, "count") == 1)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend((id)objc_msgSend(v8, "allKeys"), "objectAtIndexedSubscript:", 0));
        }
      }
    }
    else
    {
LABEL_13:
      if (v14)
        goto LABEL_14;
    }

    return;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    if (a4)
    {
      v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
      if (!v6)
        v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a4, 1);
    }
    else
    {
      v6 = CFSTR("empty error message");
    }
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E0CB2D50]);
    **(_QWORD **)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 3, v17);
  }
}

- (BOOL)downgradeRequest:(MTLCompilerFunctionRequest *)a3 frameworkData:(void *)a4 error:(id *)a5
{
  int var1;
  id v8;
  void *v9;
  id v10;
  id var5;
  id var4;
  char v14;
  char *v15;

  var1 = self->_compilerConnectionManager->var1;
  if (var1 >= 32023)
  {
    if (a5)
      *a5 = 0;
    return 1;
  }
  else
  {
    if (a3->var4)
    {
      v8 = -[MTLCompiler downgradeFunctionRequest:targetLLVMVersion:frameworkData:error:](self, "downgradeFunctionRequest:targetLLVMVersion:frameworkData:error:", a3, self->_compilerConnectionManager->var1, a4, a5);
      v9 = v8;
      if (a4 && (a3->var6 & 2) != 0)
      {
        v14 = 2;
        v15 = &v14;
        v10 = (id)std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)a4, &v14, (uint64_t)&std::piecewise_construct, &v15)[3];
      }
      else
      {
        var4 = a3->var4;
        v10 = v8;
        if (var4 != v8)
        {
          if (var4)

          a3->var4 = v9;
          v10 = v9;
        }
      }

    }
    else
    {
      v10 = (id)MTLLibraryBuilder::newDowngradedLibrary(*(MTLLibraryBuilder **)(objc_msgSend(a3->var5, "device") + 424), a3, var1, (NSError **)a5);
      var5 = a3->var5;
      if (var5 != v10)
      {
        if (var5)

        a3->var5 = v10;
      }

    }
    return v10 != 0;
  }
}

- (void)statelessBackendCompileRequestInternal:(MTLCompilerFunctionRequest *)a3 sync:(BOOL)a4 compilerHash:(id *)a5 reflectionOnly:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  BOOL v13;
  _BOOL4 v14;
  __int128 *v15;
  uint64_t **v16;
  uint64_t v17;
  __int128 v18;
  MTLCompilerConnectionManager *compilerConnectionManager;
  uint64_t compilerId;
  _QWORD v21[8];
  BOOL v22;
  __int128 v23;
  __int128 v24;
  int v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v10 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  a3->var1 = 10;
  a3->var18 = -[_MTLDevice llvmVersion](self->_device, "llvmVersion");
  v26 = 0;
  if (a6)
  {
    v13 = !a3->var17;
    v14 = !a3->var17;
    v23 = 0u;
    v24 = 0u;
    if (v13)
      v15 = &v23;
    else
      v15 = 0;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v23 = 0u;
    v24 = 0u;
  }
  v25 = 1065353216;
  if (-[MTLCompiler downgradeRequest:frameworkData:error:](self, "downgradeRequest:frameworkData:error:", a3, v15, &v26))
  {
    if (v14)
    {
      LOBYTE(v27) = 2;
      v16 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::find<CompilerOutputType>(&v23, (char *)&v27);
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v27 = 0u;
      *((_QWORD *)&v29 + 1) = v16[3];
      (*((void (**)(id, __int128 *))a7 + 2))(a7, &v27);
    }
    else
    {
      if (_MTLCompilePerformanceStatisticsEnabled())
        a3->var6 |= 0x200u;
      *(_QWORD *)&v27 = 0;
      *((_QWORD *)&v27 + 1) = &v27;
      *(_QWORD *)&v28 = 0x5012000000;
      *((_QWORD *)&v28 + 1) = __Block_byref_object_copy__1117;
      *(_QWORD *)&v29 = __Block_byref_object_dispose__1118;
      *((_QWORD *)&v29 + 1) = &unk_182827312;
      v18 = *(_OWORD *)&a5->var0[16];
      v30 = *(_OWORD *)a5->var0;
      v31 = v18;
      compilerConnectionManager = self->_compilerConnectionManager;
      compilerId = self->_compilerId;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __105__MTLCompiler_statelessBackendCompileRequestInternal_sync_compilerHash_reflectionOnly_completionHandler___block_invoke;
      v21[3] = &unk_1E0FE44C8;
      v22 = a6;
      v21[6] = &v27;
      v21[7] = a3;
      v21[4] = self;
      v21[5] = a7;
      (*((void (**)(MTLCompilerConnectionManager *, uint64_t, MTLCompilerFunctionRequest *, _BOOL8, _QWORD *))compilerConnectionManager->var0
       + 3))(compilerConnectionManager, compilerId, a3, v10, v21);
      _Block_object_dispose(&v27, 8);
    }
  }
  else
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Downgrade failed with error: %@"), objc_msgSend(v26, "localizedDescription"));
    *(_QWORD *)&v27 = 2;
    *((_QWORD *)&v27 + 1) = v17;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    (*((void (**)(id, __int128 *))a7 + 2))(a7, &v27);
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v23);
}

uint64_t __105__MTLCompiler_statelessBackendCompileRequestInternal_sync_compilerHash_reflectionOnly_completionHandler___block_invoke(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD *i;
  NSObject *v19;
  char v21;
  _OWORD v22[2];
  int v23;
  uint64_t v24;
  size_t size_ptr;
  void *buffer_ptr;
  __int128 v27;
  __int128 v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  dispatch_object_t v39;
  char *v40;

  v39 = a3;
  if (a4)
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  else
    v7 = 0;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v30 = a2;
  v31 = v7;
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48;
  v27 = 0u;
  v28 = 0u;
  v29 = 1065353216;
  if (a2)
  {
    v8 = 0;
    v9 = 0;
  }
  else if (*(_BYTE *)(a1 + 64))
  {
    LOBYTE(v22[0]) = 2;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*&>((uint64_t)&v27, (char *)v22, v22, &v39);
    dispatch_retain(v39);
    v8 = 0;
    v9 = 0;
    *(_QWORD *)&v34 = v39;
  }
  else
  {
    size_ptr = 0;
    buffer_ptr = 0;
    v10 = dispatch_data_create_map(a3, (const void **)&buffer_ptr, &size_ptr);
    v24 = 0;
    memset(v22, 0, sizeof(v22));
    v23 = 1065353216;
    deserializeCompilerOutputData(buffer_ptr, size_ptr, &v24, v22, (uint64_t)&v27);
    v21 = 0;
    v40 = &v21;
    *(_QWORD *)&v33 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    v21 = 3;
    v40 = &v21;
    *(_QWORD *)&v36 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    v21 = 6;
    v40 = &v21;
    *(_QWORD *)&v38 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    v21 = 4;
    v40 = &v21;
    v8 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    *((_QWORD *)&v36 + 1) = v8;
    v21 = 4;
    v40 = &v21;
    v9 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    *(_QWORD *)&v37 = v9;
    v21 = 2;
    v40 = &v21;
    *(_QWORD *)&v34 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    dispatch_release(v10);
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v22);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 56) + 49) & 2) != 0)
  {
    v11 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = v11;
    if (v9)
      _MTLAddCompilerServiceCompileTimeStats(v11, v9);
    if (v8)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deserializeCompileTimeStats:addToDictionary:", v8, v12);
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(void **)(v13 + 32);
    if (v14)
    {
      v15 = objc_msgSend(v14, "name");
      -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v15, MTLBinaryFunctionPerformanceKeyFunctionName);
      _MTLAddCompileBinaryFunctionPerformanceStatistics(v12);
    }
    else
    {
      v16 = *(void **)(v13 + 40);
      if (v16)
      {
        v17 = objc_msgSend(v16, "installName");
        -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v17, MTLDynamicLibraryPerformanceKeyInstallName);
        _MTLAddCompileDynamicLibraryPerformanceStatistics(v12);
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  for (i = (_QWORD *)v28; i; i = (_QWORD *)*i)
  {
    v19 = i[3];
    if (v19)
      dispatch_release(v19);
  }
  return std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v27);
}

- (void)compileFunction:(id)a3 serializedPipelineData:(id)a4 stateData:(id)a5 linkDataSize:(unint64_t)a6 frameworkLinking:(BOOL)a7 options:(unsigned int)a8 sync:(BOOL)a9 completionHandler:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  -[MTLCompiler compileFunction:serializedPipelineData:stateData:linkDataSize:frameworkLinking:options:pipelineCache:sync:completionHandler:](self, "compileFunction:serializedPipelineData:stateData:linkDataSize:frameworkLinking:options:pipelineCache:sync:completionHandler:", a3, a4, a5, a6, a7, *(_QWORD *)&a8, 0, v10, a10);
}

- (void)compileFunction:(id)a3 serializedPipelineData:(id)a4 stateData:(id)a5 linkDataSize:(unint64_t)a6 frameworkLinking:(BOOL)a7 options:(unsigned int)a8 pipelineCache:(id)a9 sync:(BOOL)a10 completionHandler:(id)a11
{
  void *v17;
  _BOOL4 v18;
  _QWORD v19[5];

  v18 = a7;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setSync:", a10);
  objc_msgSend(v17, "setFunction:", a3);
  objc_msgSend(v17, "setPipelineOptions:", a8);
  objc_msgSend(v17, "setFrameworkData:", a4);
  objc_msgSend(v17, "setDriverKeyData:", a5);
  objc_msgSend(v17, "setPipelineCache:", a9);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __139__MTLCompiler_compileFunction_serializedPipelineData_stateData_linkDataSize_frameworkLinking_options_pipelineCache_sync_completionHandler___block_invoke;
  v19[3] = &unk_1E0FE44F0;
  v19[4] = a11;
  -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v17, v18, a6, 0, v19);

}

uint64_t __139__MTLCompiler_compileFunction_serializedPipelineData_stateData_linkDataSize_frameworkLinking_options_pipelineCache_sync_completionHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *a2);
}

- (void)compileFunction:(id)a3 frameworkData:(id)a4 driverKeyData:(id)a5 options:(unint64_t)a6 pipelineCache:(id)a7 completionHandler:(id)a8
{
  id v15;

  v15 = (id)objc_opt_new();
  objc_msgSend(v15, "setSync:", 0);
  objc_msgSend(v15, "setFunction:", a3);
  objc_msgSend(v15, "setPipelineOptions:", a6);
  objc_msgSend(v15, "setFrameworkData:", a4);
  objc_msgSend(v15, "setDriverKeyData:", a5);
  objc_msgSend(v15, "setPipelineCache:", a7);
  -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v15, 0, 0, 0, a8);

}

- (void)compileFunction:(id)a3 frameworkData:(id)a4 driverKeyData:(id)a5 options:(unint64_t)a6 pipelineCache:(id)a7 sync:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  id v16;

  v9 = a8;
  v16 = (id)objc_opt_new();
  objc_msgSend(v16, "setSync:", v9);
  objc_msgSend(v16, "setFunction:", a3);
  objc_msgSend(v16, "setPipelineOptions:", a6);
  objc_msgSend(v16, "setFrameworkData:", a4);
  objc_msgSend(v16, "setDriverKeyData:", a5);
  objc_msgSend(v16, "setPipelineCache:", a7);
  -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v16, 0, 0, 0, a9);

}

- (void)compileFunction:(id)a3 visibleFunctions:(id)a4 privateVisibleFunctions:(id)a5 visibleFunctionGroups:(id)a6 frameworkData:(id)a7 driverKeyData:(id)a8 options:(unint64_t)a9 pipelineCache:(id)a10 sync:(BOOL)a11 completionHandler:(id)a12
{
  id v19;

  v19 = (id)objc_opt_new();
  objc_msgSend(v19, "setSync:", a11);
  objc_msgSend(v19, "setFunction:", a3);
  objc_msgSend(v19, "setPipelineOptions:", a9);
  objc_msgSend(v19, "setFrameworkData:", a7);
  objc_msgSend(v19, "setDriverKeyData:", a8);
  objc_msgSend(v19, "setPipelineCache:", a10);
  objc_msgSend(v19, "setVisibleFunctions:", a4);
  objc_msgSend(v19, "setVisibleFunctionGroups:", a6);
  objc_msgSend(v19, "setPrivateVisibleFunctions:", a5);
  -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v19, 0, 0, 0, a12);

}

- (void)compileFunction:(id)a3 visibleFunctions:(id)a4 visibleFunctionGroups:(id)a5 frameworkData:(id)a6 driverKeyData:(id)a7 options:(unint64_t)a8 pipelineCache:(id)a9 sync:(BOOL)a10 completionHandler:(id)a11
{
  uint64_t v11;

  LOBYTE(v11) = a10;
  -[MTLCompiler compileFunction:visibleFunctions:privateVisibleFunctions:visibleFunctionGroups:frameworkData:driverKeyData:options:pipelineCache:sync:completionHandler:](self, "compileFunction:visibleFunctions:privateVisibleFunctions:visibleFunctionGroups:frameworkData:driverKeyData:options:pipelineCache:sync:completionHandler:", a3, a4, 0, a5, a6, a7, a8, a9, v11, a11);
}

- (void)compileDynamicLibraryWithDescriptor:(id)a3 computePipelineDescriptor:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v7;

  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Compiling dynamic libraries is not supported!"), *MEMORY[0x1E0CB2D50]);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLDynamicLibraryDomain"), 2, v6);
  (*((void (**)(id, _QWORD, id))a5 + 2))(a5, 0, v7);

}

- (id)compileDynamicLibraryWithDescriptor:(id)a3 computePipelineDescriptor:(id)a4 error:(id *)a5
{
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__MTLCompiler_compileDynamicLibraryWithDescriptor_computePipelineDescriptor_error___block_invoke;
  v8[3] = &unk_1E0FE4518;
  v8[4] = &v15;
  v8[5] = &v9;
  -[MTLCompiler compileDynamicLibraryWithDescriptor:computePipelineDescriptor:completionHandler:](self, "compileDynamicLibraryWithDescriptor:computePipelineDescriptor:completionHandler:", a3, a4, v8);
  if (a5)
    *a5 = (id)v10[5];
  v6 = (void *)v16[5];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

id __83__MTLCompiler_compileDynamicLibraryWithDescriptor_computePipelineDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id result;

  if (a2)
  {
    dispatch_retain(*(dispatch_object_t *)(a2 + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = *(_QWORD *)(a2 + 24);
  }
  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)addComputePipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  void *v7;
  void *v9;

  v9 = 0;
  -[MTLCompiler newComputePipelineStateWithDescriptorInternal:options:pipelineCache:destinationBinaryArchive:reflection:error:completionHandler:](self, "newComputePipelineStateWithDescriptorInternal:options:pipelineCache:destinationBinaryArchive:reflection:error:completionHandler:", a3, a5 | 3, 0, a4, 0, &v9, 0);
  v7 = v9;
  if (a6)
    *a6 = v9;
  return v7 == 0;
}

- (BOOL)addRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  void *v7;
  void *v9;

  v9 = 0;
  -[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:](self, "newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:", a3, a5 | 3, 0, a4, &v9, 0);
  v7 = v9;
  if (a6)
    *a6 = v9;
  return v7 == 0;
}

- (BOOL)addTileRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  void *v7;
  void *v9;

  v9 = 0;
  -[MTLCompiler newRenderPipelineStateWithTileDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:](self, "newRenderPipelineStateWithTileDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:", a3, a5 | 3, 0, a4, &v9, 0);
  v7 = v9;
  if (a6)
    *a6 = v9;
  return v7 == 0;
}

- (BOOL)addMeshRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7;

  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Compiling mesh pipelines for binary archives is not supported!"), *MEMORY[0x1E0CB2D50], a5);
  if (a6)
    *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLBinaryArchiveDomain"), 3, v7);
  return 0;
}

- (void)compileFunction:(id)a3 serializedData:(id)a4 stateData:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  void *v13;
  unint64_t compilerFlags;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v13 = (void *)objc_msgSend(a3, "device");
  compilerFlags = self->_compilerFlags;
  v15 = objc_msgSend(a3, "functionType") - 1;
  if (v15 > 7)
    v16 = -1;
  else
    v16 = qword_18281A6B8[v15];
  LOBYTE(v17) = 0;
  -[MTLCompiler compileFunction:serializedPipelineData:stateData:linkDataSize:frameworkLinking:options:sync:completionHandler:](self, "compileFunction:serializedPipelineData:stateData:linkDataSize:frameworkLinking:options:sync:completionHandler:", a3, a4, a5, 0, 0, MTLGetCompilerOptions(v13, a6, compilerFlags, v16, 0), v17, a7);
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  -[MTLCompiler reflectionWithFunction:options:sync:completionHandler:](self, "reflectionWithFunction:options:sync:completionHandler:", a3, a4, 0, a5);
}

uint64_t __100__MTLCompiler_reflectionWithFunction_options_sync_pipelineLibrary_binaryArchives_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (RequiredFunctionKeys)requiredKeysForFunction:(SEL)a3 variantKey:(id)a4 frameworkData:(const VariantKey *)a5 compilerOptions:(id)a6 driverCompilerOptions:(int)a7 airScript:(id)a8 archives:(const void *)a9 compiledNextStageVariant:(id)a10
{
  RequiredFunctionKeys *result;
  uint64_t v16;
  size_t var2;
  size_t var3;
  size_t var6;
  NSObject *v23;
  MTLHashKey buffer;
  _OWORD v25[2];
  uint64_t v26;

  result = (RequiredFunctionKeys *)a10;
  v26 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var1[4] = 0u;
  *(_OWORD *)&retstr->var1[6] = 0u;
  *(_OWORD *)retstr->var1 = 0u;
  *(_OWORD *)&retstr->var1[2] = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  *(_OWORD *)&retstr->var0[6] = 0u;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  if (a10)
  {
    v16 = *(_QWORD *)&a7;
    result = (RequiredFunctionKeys *)objc_msgSend(a10, "count");
    if (result)
    {
      if (a9)
      {
        memset(v25, 0, sizeof(v25));
        -[MTLCompiler initializeVendorPluginFunctionId:airScript:driverCompilerOptions:compiledNextStageVariant:vendorPlugin:](self, "initializeVendorPluginFunctionId:airScript:driverCompilerOptions:compiledNextStageVariant:vendorPlugin:", a4, a9, a8, a11, v25);
        if (self)
          -[MTLCompiler getFunctionId:airScript:vendorPluginFunctionId:](self, "getFunctionId:airScript:vendorPluginFunctionId:", a4, a9, v25);
        else
          memset(&buffer, 0, sizeof(buffer));
        retstr->var1[0] = -[MTLBinaryKey initWithHash:]([MTLBinaryKey alloc], "initWithHash:", &buffer);
        MTLHashKey::~MTLHashKey(&buffer);
      }
      memset(&buffer, 0, 36);
      memset(&buffer.var1.var0[16], 0, 40);
      var2 = a5->var2;
      var3 = a5->var3;
      var6 = a5->var6;
      buffer.var0.var0 = (unint64_t)malloc_type_malloc(var6 + var3 + var2, 0xBCECD5BEuLL);
      memcpy((void *)buffer.var0.var0, a5->var0, var2);
      memcpy((void *)(buffer.var0.var0 + var2), a5->var1, var3);
      memcpy((void *)(buffer.var0.var0 + var2 + var3), a5->var5, var6);
      buffer.var0.var1 = var2;
      *(_QWORD *)&buffer.var0.var2 = var3;
      *(_QWORD *)buffer.var1.var0 = var6 + var3;
      *(_QWORD *)&buffer.var1.var0[16] = dispatch_group_create();
      dispatch_group_enter(*(dispatch_group_t *)&buffer.var1.var0[16]);
      v23 = dispatch_data_create((const void *)buffer.var0.var0, *(_QWORD *)&buffer.var0.var2 + buffer.var0.var1, 0, 0);
      -[MTLCompiler addFunctionKeys:function:driverData:frameworkData:compilerOptions:](self, "addFunctionKeys:function:driverData:frameworkData:compilerOptions:", retstr, a4, v23, a6, v16);
      dispatch_release(v23);
      os_unfair_lock_lock((os_unfair_lock_t)&buffer.var1.var0[8]);
      if (!buffer.var2.var0)
      {
        buffer.var2.var0 = 0;

        buffer.var2.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)objc_msgSend(0, "copy");
      }
      dispatch_group_leave(*(dispatch_group_t *)&buffer.var1.var0[16]);
      os_unfair_lock_unlock((os_unfair_lock_t)&buffer.var1.var0[8]);
      VariantEntry::~VariantEntry((VariantEntry *)&buffer);
    }
  }
  return result;
}

- (void)getProgramObjectForFunction:(id)a3 variantKey:(const VariantKey *)a4 requiredKeys:(const RequiredFunctionKeys *)a5 sourceBinaryArchives:(id)a6
{
  id v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *var1;
  uint64_t v14;
  void *v15;
  id v16;
  id *v17;
  uint64_t v18;
  const RequiredFunctionKeys *v19;
  id v20;
  const void **v21;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v10)
    return 0;
  v11 = v10;
  v12 = *(_QWORD *)v26;
  var1 = a5->var1;
  v23 = *(_QWORD *)v26;
  v24 = v6;
  do
  {
    v14 = 0;
    while (2)
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v6);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
      v16 = a3;
      v17 = (id *)objc_msgSend(v15, "findProgramObjectForFunction:", objc_msgSend(a3, "bitCodeHash"));
      v18 = 0;
      if (objc_msgSend(v15, "supportsAIRNT"))
        v19 = (const RequiredFunctionKeys *)var1;
      else
        v19 = a5;
      while (1)
      {
        v20 = v19->var0[v18];
        if (!v20)
          goto LABEL_21;
        if (!v17)
          goto LABEL_20;
        if ((_BYTE)v18)
          break;
        if (!VariantList<4u>::find<VariantKey>((uint64_t)v17, (uint64_t)a4))
          goto LABEL_20;
LABEL_21:
        if (++v18 == 8)
        {
          if (!v17)
            return (void *)objc_msgSend(v15, "programObjectForFunction:", objc_msgSend(v16, "bitCodeHash"));
          return v17;
        }
      }
      if (v18 == 6)
      {
        v21 = VariantList<4u>::find<VariantKey>((uint64_t)v17, (uint64_t)a4);
        if (v21 && v21[9])
          goto LABEL_21;
      }
      else if (v18 == 2 && objc_msgSend(v17[54], "objectForKey:", &stru_1E0FE5DC8))
      {
        goto LABEL_21;
      }
LABEL_20:
      if (objc_msgSend(v15, "getBinaryDataForKey:reflectionType:", v20, 1))
        goto LABEL_21;
      ++v14;
      a3 = v16;
      v12 = v23;
      v6 = v24;
      var1 = a5->var1;
      if (v14 != v11)
        continue;
      break;
    }
    v11 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    v17 = 0;
  }
  while (v11);
  return v17;
}

- (void)getProgramObject:(id)a3 destinationArchive:(id)a4 sourceBinaryArchives:(id)a5 variantKey:(const VariantKey *)a6 requiredKeys:(const RequiredFunctionKeys *)a7 failOnMiss:(BOOL)a8
{
  void *result;

  if (a4)
    return (void *)objc_msgSend(a4, "programObjectForFunction:", objc_msgSend(a3, "bitCodeHash", a3, a4, a5, a6, a7, a8));
  if (a5)
  {
    result = -[MTLCompiler getProgramObjectForFunction:variantKey:requiredKeys:sourceBinaryArchives:](self, "getProgramObjectForFunction:variantKey:requiredKeys:sourceBinaryArchives:", a3, a6, a7, a5);
    if (result)
      return result;
  }
  else
  {
    result = 0;
  }
  if (!a8)
    return (void *)objc_msgSend(a3, "programObject");
  return result;
}

- (id)createMeshStageAndLinkPipelineWithFragment:(void *)a3 fragmentVariant:(id)a4 objectFunction:(id)a5 serializedObjectDescriptor:(id)a6 meshFunction:(id)a7 serializedMeshDescriptor:(id)a8 descriptor:(id)a9 airDescriptor:(id)a10 destinationArchive:(id)a11 options:(unint64_t)a12 reflection:(id *)a13 compileStatistics:(id)a14 fragmentCompileTimeData:(id)a15 pipelineArchiverId:(id)a16 error:(id *)a17 completionHandler:(id)a18
{
  unint64_t v25;
  void *v26;
  int v27;
  id *v28;
  id v29;
  unsigned int v30;
  void *v31;
  _QWORD v33[19];
  int v34;
  int v35;
  char v36;
  _QWORD v37[16];
  int v38;
  int v39;
  char v40;
  _QWORD v41[16];
  _QWORD v42[8];
  _QWORD v43[5];
  void *v44;
  _QWORD v45[3];
  const void *v46;
  size_t size_ptr;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  uint64_t v53;

  v25 = a12;
  v26 = a10;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3052000000;
  v51 = __Block_byref_object_copy__10;
  v52 = __Block_byref_object_dispose__10;
  v53 = 0;
  v46 = 0;
  size_ptr = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3052000000;
  v43[3] = __Block_byref_object_copy__10;
  v43[4] = __Block_byref_object_dispose__10;
  v44 = 0;
  if (a10)
    v26 = dispatch_data_create_map((dispatch_data_t)a10, &v46, &size_ptr);
  v44 = v26;
  v27 = MTLGetCompilerOptions(self->_device, a12, self->_compilerFlags, 0, 0);
  if (a6)
    dispatch_retain((dispatch_object_t)a6);
  if (a8)
    dispatch_retain((dispatch_object_t)a8);
  v28 = a17;
  v29 = a11;
  v30 = (a12 >> 2) & 1;
  if (a15)
  {
    dispatch_retain((dispatch_object_t)a15);
    v29 = a11;
    v28 = a17;
    v25 = a12;
    LOBYTE(v30) = (a12 & 4) != 0;
  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke;
  v42[3] = &unk_1E0FE4540;
  v42[4] = a6;
  v42[5] = a8;
  v42[6] = a15;
  v42[7] = v43;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_2;
  v41[3] = &unk_1E0FE4568;
  v41[4] = v29;
  v41[5] = a4;
  v41[6] = self;
  v41[7] = a9;
  v41[12] = a3;
  v41[13] = v25;
  v41[8] = a14;
  v41[9] = a15;
  v41[10] = a18;
  v41[11] = &v48;
  v41[14] = a13;
  v41[15] = v28;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_3;
  v37[3] = &unk_1E0FE4658;
  v37[4] = self;
  v37[5] = a9;
  v37[6] = a6;
  v37[7] = a5;
  v38 = a12 & 0x11240000;
  v39 = v27;
  v40 = v30;
  v37[10] = v42;
  v37[11] = a18;
  v37[14] = v25;
  v37[15] = v28;
  v37[8] = v29;
  v37[9] = a14;
  v37[12] = v41;
  v37[13] = v45;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_9;
  v33[3] = &unk_1E0FE46A8;
  v33[4] = self;
  v33[5] = a9;
  v33[16] = v45;
  v33[17] = v25;
  v33[6] = a4;
  v33[7] = a8;
  v34 = a12 & 0x11240000;
  v35 = v27;
  v33[8] = a7;
  v33[9] = v29;
  v36 = v30;
  v33[12] = v42;
  v33[13] = a18;
  v33[18] = v28;
  v33[10] = a14;
  v33[11] = a5;
  v33[14] = v37;
  v33[15] = v41;
  __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_9((uint64_t)v33);
  v31 = (void *)v49[5];
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v48, 8);
  return v31;
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;

  v2 = a1[4];
  if (v2)
    dispatch_release(v2);
  v3 = a1[5];
  if (v3)
    dispatch_release(v3);
  v4 = a1[6];
  if (v4)
    dispatch_release(v4);
  v5 = *(NSObject **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v5)
    dispatch_release(v5);
}

void *__302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_2(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  void *v10;

  if (!*((_QWORD *)result + 4))
  {
    v10 = result;
    result = newRenderPipeline(*((_QWORD *)result + 12), *((void **)result + 5), a2, a3, a8, a9, a10, a5, a6, a7, *(void **)(*((_QWORD *)result + 6) + 8), 0, *((void **)v10 + 7), *((_QWORD *)v10 + 13), *(_QWORD *)(*((_QWORD *)result + 6) + 48), *((MTLRenderPipelineReflectionInternal ***)v10 + 14), *((NSMutableDictionary **)v10 + 8), *((_QWORD *)v10 + 9), a4,
               *((_QWORD *)v10 + 10),
               *((_QWORD **)v10 + 15));
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v10 + 11) + 8) + 40) = result;
  }
  return result;
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, NSObject *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  MTLCompileFunctionRequestData *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  _QWORD v34[6];
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[7];
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  _QWORD v52[16];
  int v53;
  _QWORD block[16];
  int v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  _QWORD v69[6];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;

  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3052000000;
  v69[3] = __Block_byref_object_copy__10;
  v69[4] = __Block_byref_object_dispose__10;
  v69[5] = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v60 = 0;
  v59 = 0;
  v58 = 0;
  v7 = objc_msgSend(*(id *)(a1 + 32), "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "objectFunction"), 8, a3, &v60, &v59, &v58);
  v57 = 0;
  v8 = objc_msgSend(a3, "inputInfoAndSize:", &v57);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(NSObject **)(v9 + 24);
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_4;
  block[3] = &unk_1E0FE4590;
  block[12] = v60;
  block[13] = v8;
  v13 = *(_QWORD *)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 48);
  block[5] = v9;
  v55 = *(_DWORD *)(a1 + 132);
  block[6] = v13;
  block[7] = v10;
  block[14] = v57;
  block[15] = 0;
  block[11] = v7;
  block[10] = &v70;
  v14 = *(_QWORD *)(a1 + 64);
  block[8] = a3;
  block[9] = v14;
  v56 = *(_BYTE *)(a1 + 136);
  dispatch_sync(v11, block);
  v15 = v71[3];
  if (v15)
  {
    v16 = *(NSObject **)(v15 + 440);
    v52[0] = v12;
    v52[1] = 3221225472;
    v52[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_5;
    v52[3] = &unk_1E0FE45B8;
    v52[12] = v60;
    v52[13] = v8;
    v52[8] = &v70;
    v52[9] = &v65;
    v17 = *(_QWORD *)(a1 + 112);
    v52[14] = v57;
    v52[15] = v17;
    v18 = *(_QWORD *)(a1 + 72);
    v19 = *(_QWORD *)(a1 + 40);
    v52[4] = *(_QWORD *)(a1 + 48);
    v52[5] = v18;
    v52[6] = v19;
    v52[7] = &v74;
    v52[10] = &v61;
    v52[11] = v7;
    v53 = *(_DWORD *)(a1 + 132);
    dispatch_sync(v16, v52);
    if (*((_BYTE *)v66 + 24))
    {
      v20 = VariantEntry::newSerializedKeyWithAdditionalData((VariantEntry *)v75[3], v59, v60);
      v21 = v57;
      if ((*(_BYTE *)(a1 + 133) & 2) != 0)
        v22 = mach_absolute_time();
      else
        v22 = 0;
      v26 = (MTLCompileFunctionRequestData *)objc_opt_new();
      -[MTLCompileFunctionRequestData setSync:](v26, "setSync:", *(_QWORD *)(a1 + 88) == 0);
      -[MTLCompileFunctionRequestData setFunction:](v26, "setFunction:", *(_QWORD *)(a1 + 56));
      -[MTLCompileFunctionRequestData setPipelineOptions:](v26, "setPipelineOptions:", *(_QWORD *)(a1 + 112));
      -[MTLCompileFunctionRequestData setFrameworkData:](v26, "setFrameworkData:", *(_QWORD *)(a1 + 48));
      -[MTLCompileFunctionRequestData setDriverKeyData:](v26, "setDriverKeyData:", v20);
      -[MTLCompileFunctionRequestData setDestinationBinaryArchive:](v26, "setDestinationBinaryArchive:", *(_QWORD *)(a1 + 64));
      -[MTLCompileFunctionRequestData setBinaryArchives:](v26, "setBinaryArchives:", objc_msgSend(*(id *)(a1 + 40), "binaryArchives"));
      -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v26, "setGpuCompilerSPIOptions:", objc_msgSend(*(id *)(a1 + 40), "gpuCompilerSPIOptions"));
      -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v26, "setMaxAccelerationStructureTraversalDepth:", objc_msgSend(*(id *)(a1 + 40), "maxAccelerationStructureTraversalDepth"));
      -[MTLCompileFunctionRequestData setAirScript:](v26, "setAirScript:", 0);
      setLinkedFunctionsForRequest(v26, (MTLLinkedFunctions *)objc_msgSend(*(id *)(a1 + 40), "objectLinkedFunctions"));
      objc_msgSend(*(id *)(a1 + 32), "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v26, 0, objc_msgSend(*(id *)(a1 + 40), "driverCompilerOptions"), a3);
      v43[0] = v12;
      v43[1] = 3221225472;
      v43[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_6;
      v43[3] = &unk_1E0FE45E0;
      v51 = *(_DWORD *)(a1 + 132);
      v27 = *(_QWORD *)(a1 + 72);
      v28 = *(_QWORD *)(a1 + 40);
      v44 = *(id *)(a1 + 32);
      v45 = v27;
      v46 = v28;
      v47 = &v70;
      v48 = v69;
      v49 = &v74;
      v50 = v22;
      objc_msgSend(v44, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v26, 1, v21, 0, v43);

      dispatch_release(v20);
    }
    else if (*((_BYTE *)v62 + 24))
    {
      dispatch_group_enter(*(dispatch_group_t *)(v75[3] + 40));
      v23 = *(_QWORD *)(a1 + 56);
      v24 = *(_QWORD *)(a1 + 112);
      v42[0] = v12;
      v42[1] = 3221225472;
      v42[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_7;
      v42[3] = &unk_1E0FE4608;
      v25 = *(void **)(a1 + 32);
      v42[4] = *(_QWORD *)(a1 + 40);
      v42[5] = &v70;
      v42[6] = &v74;
      objc_msgSend(v25, "reflectionWithFunction:options:completionHandler:", v23, v24, v42);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "freeObjectFunctionDriverData:objectFunctionDriverDataSize:", v59, v58);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "freeObjectFunctionKey:objectKeySize:", v7, v60);
    if (a4)
      dispatch_retain(a4);
    v29 = v75[3];
    v30 = *(_QWORD *)(a1 + 88);
    v31 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serialQueue");
    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_8;
    v34[3] = &unk_1E0FE4630;
    v35 = *(_OWORD *)(a1 + 80);
    v32 = *(_QWORD *)(a1 + 120);
    v36 = *(_QWORD *)(a1 + 96);
    v37 = &v74;
    v38 = &v70;
    v39 = v69;
    v40 = v32;
    v41 = a2;
    v34[4] = a3;
    v34[5] = a4;
    VariantEntry::waitOrNotify(v29, v30 != 0, v31, v34);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "freeObjectFunctionDriverData:objectFunctionDriverDataSize:", v59, v58);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "freeObjectFunctionKey:objectKeySize:", v7, v60);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    reportErrorMessage((id)1, CFSTR("MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive."), *(_QWORD *)(a1 + 88), *(_QWORD **)(a1 + 120));
  }
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v69, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  RequiredFunctionKeys v14;
  _QWORD v15[4];
  dispatch_object_t v16;
  const void *v17;
  size_t v18;

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 112);
  v6 = *(NSObject **)(a1 + 32);
  v15[0] = v2;
  v15[1] = v4;
  v15[2] = v3;
  v15[3] = v5;
  if (v6)
  {
    v6 = dispatch_data_create_map(v6, &v17, &v18);
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
    v17 = 0;
    v18 = 0;
  }
  v16 = v6;
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(unsigned int *)(a1 + 128);
  v11 = objc_msgSend(*(id *)(a1 + 56), "driverCompilerOptions");
  v12 = *(_QWORD *)(a1 + 120);
  v13 = objc_msgSend(*(id *)(a1 + 56), "binaryArchives");
  if (v8)
    objc_msgSend(v8, "requiredKeysForFunction:variantKey:frameworkData:compilerOptions:driverCompilerOptions:airScript:archives:compiledNextStageVariant:", v9, v15, v7, v10, v11, v12, v13, *(_QWORD *)(a1 + 64));
  else
    memset(&v14, 0, sizeof(v14));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), v15, &v14, *(unsigned __int8 *)(a1 + 132));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v14);
  if (v16)
    dispatch_release(v16);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[4];
  dispatch_object_t object;
  const void *v20;
  size_t v21;

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 112);
  v6 = *(NSObject **)(a1 + 32);
  v18[0] = v2;
  v18[1] = v4;
  v18[2] = v3;
  v18[3] = v5;
  if (v6)
  {
    v6 = dispatch_data_create_map(v6, &v20, &v21);
  }
  else
  {
    v20 = 0;
    v21 = 0;
  }
  object = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = VariantList<4u>::find<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24), (uint64_t)v18);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = VariantList<4u>::newVariantEntry<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24), (uint64_t)v18);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  if ((*(_BYTE *)(a1 + 122) & 0x40) != 0)
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v8 = *(void **)(a1 + 40);
    v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectFunction"), "name");
    v10 = MTLPipelinePerformanceKeyObjectShader[0];
    v11 = (id)objc_msgSend(v8, "objectForKey:", MTLPipelinePerformanceKeyObjectShader[0]);
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v8, "setObject:forKey:", v11, v10);

    }
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 == 0);
    objc_msgSend(v11, "setObject:forKey:", v12, MTLCompileTimeStatisticsKeyCachedFunction[0]);
    if (v9)
      objc_msgSend(v11, "setObject:forKey:", v9, MTLCompileTimeStatisticsKeyFunctionName[0]);
  }
  if ((*(_BYTE *)(a1 + 128) & 1) != 0)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "gpuCompilerSPIOptions"), "description");
    if (v15)
      v16 = (const __CFString *)v15;
    else
      v16 = &stru_1E0FE5DC8;
    v13 = objc_msgSend(*(id *)(v14 + 432), "objectForKey:", v16) == 0;
  }
  else
  {
    v13 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (!*(_QWORD *)(v17 + 424))
      *(_QWORD *)(v17 + 424) = dispatch_queue_create("reflection Queue", 0);
  }
  if (object)
    dispatch_release(object);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  __CFString **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD block[7];

  if ((*(_BYTE *)(a1 + 89) & 2) != 0)
    v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - *(_QWORD *)(a1 + 80)));
  else
    v4 = 0;
  if (*(_QWORD *)a2)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newObjectVariantWithCompilerOutput:pipelineStatisticsOutput:", *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 72));
    if ((*(_BYTE *)(a1 + 89) & 0x10) != 0)
    {
      v18 = v5;
      objc_msgSend(v5, "setDebugInstrumentationData:", *(_QWORD *)(a2 + 104));
      v5 = v18;
    }
  }
  v19 = v5;
  v6 = *(_DWORD *)(a1 + 88);
  if ((v6 & 0x200) != 0)
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(a2 + 88);
    v9 = MTLPipelinePerformanceKeyObjectShader[0];
    v10 = (id)objc_msgSend(v7, "objectForKey:", MTLPipelinePerformanceKeyObjectShader[0], v5);
    if (v10)
    {
      if (v8)
      {
LABEL_11:
        _MTLAddCompilerServiceCompileTimeStats(v10, v8);
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
        v12 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_14:
        objc_msgSend(v10, "setObject:forKey:", v11, *v12);
        v6 = *(_DWORD *)(a1 + 88);
        goto LABEL_15;
      }
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "setObject:forKey:", v10, v9);

      if (v8)
        goto LABEL_11;
    }
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_14;
  }
LABEL_15:
  if ((v6 & 1) != 0)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v14 = *(_QWORD *)(a2 + 40);
    v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "gpuCompilerSPIOptions"), "description");
    if (v14)
    {
      v16 = *(NSObject **)(v13 + 424);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E0FE2C68;
      block[5] = v14;
      block[6] = v13;
      block[4] = v15;
      dispatch_sync(v16, block);
    }
  }
  v17 = *(_QWORD *)(a2 + 80);
  if (v17)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v17;
    dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  VariantEntry::insertVariant(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v19, *(_QWORD *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));

}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[7];

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "gpuCompilerSPIOptions"), "description");
  if (a3)
  {
    v10 = *(NSObject **)(v8 + 424);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E0FE2C68;
    block[5] = a3;
    block[6] = v8;
    block[4] = v9;
    dispatch_sync(v10, block);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v11 + 32));
  if (!*(_QWORD *)(v11 + 56))
  {
    *(_QWORD *)(v11 + 56) = a2;

    *(_QWORD *)(v11 + 64) = objc_msgSend(a4, "copy");
  }
  dispatch_group_leave(*(dispatch_group_t *)(v11 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 32));
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) + 48))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    reportErrorMessage(*(id *)(v2 + 56), *(const __CFString **)(v2 + 64), *(_QWORD *)(a1 + 56), *(_QWORD **)(a1 + 96));
  }
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v3)
    dispatch_release(v3);
  v4 = *(NSObject **)(a1 + 40);
  if (v4)
    dispatch_release(v4);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  MTLCompileFunctionRequestData *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  __int128 v27;
  _QWORD v28[4];
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD v36[7];
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  _QWORD v46[16];
  int v47;
  _QWORD block[7];
  __int128 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  char v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  _QWORD v71[6];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;

  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3052000000;
  v71[3] = __Block_byref_object_copy__10;
  v71[4] = __Block_byref_object_dispose__10;
  v71[5] = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v62 = 0;
  v61 = 0;
  v60 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 152), *(_QWORD *)(a1 + 136), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "meshFunction"), 7, *(_QWORD *)(a1 + 48), &v62, &v61, &v60);
  v59 = 0;
  v3 = objc_msgSend(*(id *)(a1 + 48), "inputInfoAndSize:", &v59);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_10;
  block[3] = &unk_1E0FE4590;
  v53 = v62;
  v54 = v3;
  v55 = v59;
  v7 = *(_QWORD *)(a1 + 64);
  block[4] = *(_QWORD *)(a1 + 56);
  block[5] = v4;
  block[6] = v7;
  v57 = *(_DWORD *)(a1 + 156);
  v56 = 0;
  v49 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 72);
  v51 = &v72;
  v52 = v2;
  v50 = v8;
  v58 = *(_BYTE *)(a1 + 160);
  dispatch_sync(v5, block);
  v9 = v73[3];
  if (v9)
  {
    v10 = *(NSObject **)(v9 + 440);
    v46[0] = v6;
    v46[1] = 3221225472;
    v46[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_11;
    v46[3] = &unk_1E0FE45B8;
    v46[12] = v62;
    v46[13] = v3;
    v11 = *(_QWORD *)(a1 + 56);
    v46[8] = &v72;
    v46[9] = &v67;
    v12 = *(_QWORD *)(a1 + 136);
    v46[14] = v59;
    v46[15] = v12;
    v13 = *(_QWORD *)(a1 + 80);
    v46[4] = v11;
    v46[5] = v13;
    v46[6] = *(_QWORD *)(a1 + 40);
    v46[7] = &v76;
    v46[10] = &v63;
    v46[11] = v2;
    v47 = *(_DWORD *)(a1 + 156);
    dispatch_sync(v10, v46);
    if (*((_BYTE *)v68 + 24))
    {
      v14 = VariantEntry::newSerializedKeyWithAdditionalData((VariantEntry *)v77[3], v61, v60);
      v15 = v59;
      if ((*(_BYTE *)(a1 + 157) & 2) != 0)
        v16 = mach_absolute_time();
      else
        v16 = 0;
      v20 = (MTLCompileFunctionRequestData *)objc_opt_new();
      -[MTLCompileFunctionRequestData setSync:](v20, "setSync:", *(_QWORD *)(a1 + 104) == 0);
      -[MTLCompileFunctionRequestData setFunction:](v20, "setFunction:", *(_QWORD *)(a1 + 64));
      -[MTLCompileFunctionRequestData setPipelineOptions:](v20, "setPipelineOptions:", *(_QWORD *)(a1 + 136));
      -[MTLCompileFunctionRequestData setFrameworkData:](v20, "setFrameworkData:", *(_QWORD *)(a1 + 56));
      -[MTLCompileFunctionRequestData setDriverKeyData:](v20, "setDriverKeyData:", v14);
      -[MTLCompileFunctionRequestData setDestinationBinaryArchive:](v20, "setDestinationBinaryArchive:", *(_QWORD *)(a1 + 72));
      -[MTLCompileFunctionRequestData setBinaryArchives:](v20, "setBinaryArchives:", objc_msgSend(*(id *)(a1 + 40), "binaryArchives"));
      -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v20, "setGpuCompilerSPIOptions:", objc_msgSend(*(id *)(a1 + 40), "gpuCompilerSPIOptions"));
      -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v20, "setMaxAccelerationStructureTraversalDepth:", objc_msgSend(*(id *)(a1 + 40), "maxAccelerationStructureTraversalDepth"));
      setLinkedFunctionsForRequest(v20, (MTLLinkedFunctions *)objc_msgSend(*(id *)(a1 + 40), "meshLinkedFunctions"));
      objc_msgSend(*(id *)(a1 + 32), "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v20, 0, objc_msgSend(*(id *)(a1 + 40), "driverCompilerOptions"), *(_QWORD *)(a1 + 48));
      v37[0] = v6;
      v37[1] = 3221225472;
      v37[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_12;
      v37[3] = &unk_1E0FE45E0;
      v45 = *(_DWORD *)(a1 + 156);
      v21 = *(_QWORD *)(a1 + 80);
      v22 = *(_QWORD *)(a1 + 40);
      v38 = *(id *)(a1 + 32);
      v39 = v21;
      v40 = v22;
      v41 = &v72;
      v42 = v71;
      v43 = &v76;
      v44 = v16;
      objc_msgSend(v38, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v20, 1, v15, 0, v37);

      dispatch_release(v14);
    }
    else if (*((_BYTE *)v64 + 24))
    {
      dispatch_group_enter(*(dispatch_group_t *)(v77[3] + 40));
      v17 = *(_QWORD *)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 136);
      v36[0] = v6;
      v36[1] = 3221225472;
      v36[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_13;
      v36[3] = &unk_1E0FE4608;
      v19 = *(void **)(a1 + 32);
      v36[4] = *(_QWORD *)(a1 + 40);
      v36[5] = &v72;
      v36[6] = &v76;
      objc_msgSend(v19, "reflectionWithFunction:options:completionHandler:", v17, v18, v36);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "freeMeshFunctionDriverData:meshFunctionDriverDataSize:", v61, v60);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "freeMeshFunctionKey:meshKeySize:", v2, v62);
    v23 = v77[3];
    v24 = *(_QWORD *)(a1 + 104);
    v25 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serialQueue");
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_14;
    v28[3] = &unk_1E0FE4680;
    v26 = *(_QWORD *)(a1 + 144);
    v33 = &v72;
    v34 = v71;
    v35 = v26;
    v27 = *(_OWORD *)(a1 + 104);
    v29 = *(_OWORD *)(a1 + 88);
    v30 = v27;
    v31 = *(_QWORD *)(a1 + 120);
    v32 = &v76;
    VariantEntry::waitOrNotify(v23, v24 != 0, v25, v28);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "freeMeshFunctionDriverData:meshFunctionDriverDataSize:", v61, v60);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "freeMeshFunctionKey:meshKeySize:", v2, v62);
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    reportErrorMessage((id)1, CFSTR("MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive."), *(_QWORD *)(a1 + 104), *(_QWORD **)(a1 + 144));
  }
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  RequiredFunctionKeys v14;
  _QWORD v15[4];
  dispatch_object_t v16;
  const void *v17;
  size_t v18;

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 112);
  v6 = *(NSObject **)(a1 + 32);
  v15[0] = v2;
  v15[1] = v4;
  v15[2] = v3;
  v15[3] = v5;
  if (v6)
  {
    v6 = dispatch_data_create_map(v6, &v17, &v18);
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
    v17 = 0;
    v18 = 0;
  }
  v16 = v6;
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(unsigned int *)(a1 + 128);
  v11 = objc_msgSend(*(id *)(a1 + 56), "driverCompilerOptions");
  v12 = *(_QWORD *)(a1 + 120);
  v13 = objc_msgSend(*(id *)(a1 + 56), "binaryArchives");
  if (v8)
    objc_msgSend(v8, "requiredKeysForFunction:variantKey:frameworkData:compilerOptions:driverCompilerOptions:airScript:archives:compiledNextStageVariant:", v9, v15, v7, v10, v11, v12, v13, *(_QWORD *)(a1 + 64));
  else
    memset(&v14, 0, sizeof(v14));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), v15, &v14, *(unsigned __int8 *)(a1 + 132));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v14);
  if (v16)
    dispatch_release(v16);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[4];
  dispatch_object_t object;
  const void *v20;
  size_t v21;

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 112);
  v6 = *(NSObject **)(a1 + 32);
  v18[0] = v2;
  v18[1] = v4;
  v18[2] = v3;
  v18[3] = v5;
  if (v6)
  {
    v6 = dispatch_data_create_map(v6, &v20, &v21);
  }
  else
  {
    v20 = 0;
    v21 = 0;
  }
  object = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = VariantList<4u>::find<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24), (uint64_t)v18);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = VariantList<4u>::newVariantEntry<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 24), (uint64_t)v18);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  if ((*(_BYTE *)(a1 + 122) & 0x40) != 0)
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v8 = *(void **)(a1 + 40);
    v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "meshFunction"), "name");
    v10 = MTLPipelinePerformanceKeyMeshShader[0];
    v11 = (id)objc_msgSend(v8, "objectForKey:", MTLPipelinePerformanceKeyMeshShader[0]);
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v8, "setObject:forKey:", v11, v10);

    }
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 == 0);
    objc_msgSend(v11, "setObject:forKey:", v12, MTLCompileTimeStatisticsKeyCachedFunction[0]);
    if (v9)
      objc_msgSend(v11, "setObject:forKey:", v9, MTLCompileTimeStatisticsKeyFunctionName[0]);
  }
  if ((*(_BYTE *)(a1 + 128) & 1) != 0)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "gpuCompilerSPIOptions"), "description");
    if (v15)
      v16 = (const __CFString *)v15;
    else
      v16 = &stru_1E0FE5DC8;
    v13 = objc_msgSend(*(id *)(v14 + 432), "objectForKey:", v16) == 0;
  }
  else
  {
    v13 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (!*(_QWORD *)(v17 + 424))
      *(_QWORD *)(v17 + 424) = dispatch_queue_create("reflection Queue", 0);
  }
  if (object)
    dispatch_release(object);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_12(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  __CFString **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD block[7];

  if ((*(_BYTE *)(a1 + 89) & 2) != 0)
    v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - *(_QWORD *)(a1 + 80)));
  else
    v4 = 0;
  if (*(_QWORD *)a2)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newMeshVariantWithCompilerOutput:pipelineStatisticsOutput:", *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 72));
    if ((*(_BYTE *)(a1 + 89) & 0x10) != 0)
    {
      v18 = v5;
      objc_msgSend(v5, "setDebugInstrumentationData:", *(_QWORD *)(a2 + 104));
      v5 = v18;
    }
  }
  v19 = v5;
  v6 = *(_DWORD *)(a1 + 88);
  if ((v6 & 0x200) != 0)
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(a2 + 88);
    v9 = MTLPipelinePerformanceKeyMeshShader[0];
    v10 = (id)objc_msgSend(v7, "objectForKey:", MTLPipelinePerformanceKeyMeshShader[0], v5);
    if (v10)
    {
      if (v8)
      {
LABEL_11:
        _MTLAddCompilerServiceCompileTimeStats(v10, v8);
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
        v12 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_14:
        objc_msgSend(v10, "setObject:forKey:", v11, *v12);
        v6 = *(_DWORD *)(a1 + 88);
        goto LABEL_15;
      }
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "setObject:forKey:", v10, v9);

      if (v8)
        goto LABEL_11;
    }
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_14;
  }
LABEL_15:
  if ((v6 & 1) != 0)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v14 = *(_QWORD *)(a2 + 40);
    v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "gpuCompilerSPIOptions"), "description");
    if (v14)
    {
      v16 = *(NSObject **)(v13 + 424);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E0FE2C68;
      block[5] = v14;
      block[6] = v13;
      block[4] = v15;
      dispatch_sync(v16, block);
    }
  }
  v17 = *(_QWORD *)(a2 + 80);
  if (v17)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v17;
    dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  VariantEntry::insertVariant(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v19, *(_QWORD *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));

}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[7];

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "gpuCompilerSPIOptions"), "description");
  if (a3)
  {
    v10 = *(NSObject **)(v8 + 424);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E0FE2C68;
    block[5] = a3;
    block[6] = v8;
    block[4] = v9;
    dispatch_sync(v10, block);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v11 + 32));
  if (!*(_QWORD *)(v11 + 56))
  {
    *(_QWORD *)(v11 + 56) = a2;

    *(_QWORD *)(v11 + 64) = objc_msgSend(a4, "copy");
  }
  dispatch_group_leave(*(dispatch_group_t *)(v11 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 32));
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) + 48))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    reportErrorMessage(*(id *)(v2 + 56), *(const __CFString **)(v2 + 64), *(_QWORD *)(a1 + 48), *(_QWORD **)(a1 + 96));
  }
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v3)
    dispatch_release(v3);
}

- (id)createVertexStageAndLinkPipelineWithFragment:(void *)a3 fragmentVariant:(id)a4 vertexFunction:(id)a5 serializedVertexDescriptor:(id)a6 descriptor:(id)a7 airDescriptor:(id)a8 destinationArchive:(id)a9 options:(unint64_t)a10 reflection:(id *)a11 compileStatistics:(id)a12 fragmentCompileTimeData:(id)a13 pipelineArchiverId:(id)a14 error:(id *)a15 completionHandler:(id)a16
{
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *compilerQueue;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  MTLCompileFunctionRequestData *v33;
  uint64_t v34;
  OS_dispatch_queue *v35;
  uint64_t v37;
  uint64_t v38;
  NSObject *object;
  void *v40;
  id v41;
  NSObject *v43;
  _QWORD v44[20];
  _QWORD v45[6];
  _QWORD v46[11];
  _QWORD v47[18];
  _QWORD block[17];
  BOOL v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  size_t size_ptr;
  void *buffer_ptr;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  int v75;
  _QWORD v76[6];
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  uint64_t v82;

  v77 = 0;
  v78 = &v77;
  v79 = 0x3052000000;
  v80 = __Block_byref_object_copy__10;
  v81 = __Block_byref_object_dispose__10;
  v82 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3052000000;
  v76[3] = __Block_byref_object_copy__10;
  v76[4] = __Block_byref_object_dispose__10;
  v76[5] = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v75 = MTLGetCompilerOptions(self->_device, a10, self->_compilerFlags, 0, 0);
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  buffer_ptr = 0;
  size_ptr = 0;
  v43 = dispatch_data_create_map((dispatch_data_t)a8, (const void **)&buffer_ptr, &size_ptr);
  v53 = 0;
  v52 = 0;
  v51 = 0;
  v22 = -[MTLCompiler getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:](self, "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:", a7, a10 & 0x11240000, a10, buffer_ptr, objc_msgSend(a7, "vertexFunction"), 1, a4, &v53, &v52, &v51);
  v50 = 0;
  v23 = objc_msgSend(a4, "inputInfoAndSize:", &v50);
  v24 = MEMORY[0x1E0C809B0];
  compilerQueue = self->_compilerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke;
  block[3] = &unk_1E0FE46D0;
  block[12] = v22;
  block[13] = v53;
  block[14] = v23;
  block[15] = v50;
  block[4] = a6;
  block[5] = self;
  v41 = a5;
  block[6] = a5;
  block[7] = a7;
  block[16] = buffer_ptr;
  block[10] = &v72;
  block[11] = &v56;
  block[8] = a4;
  block[9] = a9;
  v49 = (a10 & 4) != 0;
  dispatch_sync(compilerQueue, block);
  v26 = v57[3];
  if (v26)
  {
    v27 = *(NSObject **)(v26 + 440);
    v47[0] = v24;
    v47[1] = 3221225472;
    v47[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_2;
    v47[3] = &unk_1E0FE46F8;
    v47[14] = v53;
    v47[15] = v23;
    v47[8] = &v68;
    v47[9] = &v56;
    v28 = a6;
    v47[4] = a6;
    v47[5] = a9;
    v47[16] = v50;
    v47[17] = a10;
    v47[6] = a12;
    v47[7] = a7;
    v47[10] = &v64;
    v47[11] = &v60;
    v40 = v22;
    v47[13] = v22;
    v47[12] = &v72;
    dispatch_sync(v27, v47);
    if (*((_BYTE *)v65 + 24))
    {
      object = VariantEntry::newSerializedKeyWithAdditionalData((VariantEntry *)v69[3], v52, v51);
      v29 = v43;
      v38 = v50;
      v30 = v28;
      v31 = MEMORY[0x1E0C809B0];
      if ((*((_BYTE *)v73 + 25) & 2) != 0)
        v37 = mach_absolute_time();
      else
        v37 = 0;
      v33 = (MTLCompileFunctionRequestData *)objc_opt_new();
      -[MTLCompileFunctionRequestData setSync:](v33, "setSync:", a16 == 0);
      -[MTLCompileFunctionRequestData setFunction:](v33, "setFunction:", v41);
      -[MTLCompileFunctionRequestData setPipelineOptions:](v33, "setPipelineOptions:", a10);
      -[MTLCompileFunctionRequestData setFrameworkData:](v33, "setFrameworkData:", v30);
      -[MTLCompileFunctionRequestData setDriverKeyData:](v33, "setDriverKeyData:", object);
      -[MTLCompileFunctionRequestData setDestinationBinaryArchive:](v33, "setDestinationBinaryArchive:", a9);
      -[MTLCompileFunctionRequestData setBinaryArchives:](v33, "setBinaryArchives:", objc_msgSend(a7, "binaryArchives"));
      -[MTLCompileFunctionRequestData setArchiverId:](v33, "setArchiverId:", a14);
      -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v33, "setGpuCompilerSPIOptions:", objc_msgSend(a7, "gpuCompilerSPIOptions"));
      -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v33, "setMaxAccelerationStructureTraversalDepth:", objc_msgSend(a7, "maxAccelerationStructureTraversalDepth"));
      setLinkedFunctionsForRequest(v33, (MTLLinkedFunctions *)objc_msgSend(a7, "vertexLinkedFunctions"));
      -[MTLCompileFunctionRequestData setAirScript:](v33, "setAirScript:", v43);
      -[MTLCompiler initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:](self, "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v33, buffer_ptr, objc_msgSend(a7, "driverCompilerOptions"), a4);
      v46[0] = v31;
      v46[1] = 3221225472;
      v46[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_3;
      v46[3] = &unk_1E0FE4720;
      v46[4] = self;
      v46[5] = a12;
      v46[6] = &v72;
      v46[7] = &v56;
      v46[8] = v76;
      v46[9] = &v68;
      v46[10] = v37;
      -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v33, 1, v38, 0, v46);

      dispatch_release(object);
    }
    else
    {
      v30 = a6;
      v29 = v43;
      v31 = MEMORY[0x1E0C809B0];
      if (*((_BYTE *)v61 + 24))
      {
        dispatch_group_enter(*(dispatch_group_t *)(v69[3] + 40));
        v45[0] = v31;
        v45[1] = 3221225472;
        v45[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_4;
        v45[3] = &unk_1E0FE4748;
        v45[4] = &v56;
        v45[5] = &v68;
        -[MTLCompiler reflectionWithFunction:options:completionHandler:](self, "reflectionWithFunction:options:completionHandler:", v41, a10, v45);
      }
    }
    -[_MTLDevice freeVertexFunctionDriverData:vertexFunctionDriverDataSize:](self->_device, "freeVertexFunctionDriverData:vertexFunctionDriverDataSize:", v52, v51);
    -[_MTLDevice freeVertexFunctionKey:vertexKeySize:](self->_device, "freeVertexFunctionKey:vertexKeySize:", v40, v53);
    dispatch_retain(v30);
    v34 = v69[3];
    v35 = -[_MTLDevice serialQueue](self->_device, "serialQueue");
    v44[0] = v31;
    v44[1] = 3221225472;
    v44[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_5;
    v44[3] = &unk_1E0FE4770;
    v44[4] = a9;
    v44[5] = a4;
    v44[12] = &v68;
    v44[13] = &v77;
    v44[6] = self;
    v44[7] = v30;
    v44[16] = a15;
    v44[17] = a10;
    v44[8] = a7;
    v44[9] = a12;
    v44[14] = &v56;
    v44[15] = v76;
    v44[18] = a11;
    v44[19] = a3;
    v44[10] = a13;
    v44[11] = a16;
    VariantEntry::waitOrNotify(v34, a16 != 0, (dispatch_queue_t)v35, v44);
    dispatch_release(v29);
    v32 = (void *)v78[5];
  }
  else
  {
    -[_MTLDevice freeVertexFunctionDriverData:vertexFunctionDriverDataSize:](self->_device, "freeVertexFunctionDriverData:vertexFunctionDriverDataSize:", v52, v51);
    -[_MTLDevice freeVertexFunctionKey:vertexKeySize:](self->_device, "freeVertexFunctionKey:vertexKeySize:", v22, v53);
    reportErrorMessage((id)1, CFSTR("MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive."), (uint64_t)a16, a15);
    dispatch_release(v43);
    v32 = 0;
  }
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(v76, 8);
  _Block_object_dispose(&v77, 8);
  return v32;
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  RequiredFunctionKeys v14;
  _QWORD v15[4];
  dispatch_object_t v16;
  const void *v17;
  size_t v18;

  v2 = *(_QWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(_QWORD *)(a1 + 120);
  v6 = *(NSObject **)(a1 + 32);
  v15[0] = v2;
  v15[1] = v4;
  v15[2] = v3;
  v15[3] = v5;
  if (v6)
  {
    v6 = dispatch_data_create_map(v6, &v17, &v18);
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
    v17 = 0;
    v18 = 0;
  }
  v16 = v6;
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v11 = objc_msgSend(*(id *)(a1 + 56), "driverCompilerOptions");
  v12 = *(_QWORD *)(a1 + 128);
  v13 = objc_msgSend(*(id *)(a1 + 56), "binaryArchives");
  if (v8)
    objc_msgSend(v8, "requiredKeysForFunction:variantKey:frameworkData:compilerOptions:driverCompilerOptions:airScript:archives:compiledNextStageVariant:", v9, v15, v7, v10, v11, v12, v13, *(_QWORD *)(a1 + 64));
  else
    memset(&v14, 0, sizeof(v14));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), v15, &v14, *(unsigned __int8 *)(a1 + 136));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v14);
  if (v16)
    dispatch_release(v16);
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _QWORD v15[4];
  dispatch_object_t object;
  const void *v17;
  size_t v18;

  v2 = *(_QWORD *)(a1 + 104);
  v3 = *(_QWORD *)(a1 + 112);
  v4 = *(_QWORD *)(a1 + 120);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(NSObject **)(a1 + 32);
  v15[0] = v2;
  v15[1] = v4;
  v15[2] = v3;
  v15[3] = v5;
  if (v6)
  {
    v6 = dispatch_data_create_map(v6, &v17, &v18);
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  object = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = VariantList<4u>::find<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 24), (uint64_t)v15);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = VariantList<4u>::newVariantEntry<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 24), (uint64_t)v15);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(_QWORD *)(a1 + 40))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  if ((*(_BYTE *)(a1 + 138) & 0x40) != 0)
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v8 = *(void **)(a1 + 48);
    v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "vertexFunction"), "name");
    v10 = MTLPipelinePerformanceKeyVertexShader[0];
    v11 = (id)objc_msgSend(v8, "objectForKey:", MTLPipelinePerformanceKeyVertexShader[0]);
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v8, "setObject:forKey:", v11, v10);

    }
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 == 0);
    objc_msgSend(v11, "setObject:forKey:", v12, MTLCompileTimeStatisticsKeyCachedFunction[0]);
    if (v9)
      objc_msgSend(v11, "setObject:forKey:", v9, MTLCompileTimeStatisticsKeyFunctionName[0]);
  }
  v13 = (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) & 1) != 0
     && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) + 432), "objectForKey:", &stru_1E0FE5DC8) == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (!*(_QWORD *)(v14 + 424))
      *(_QWORD *)(v14 + 424) = dispatch_queue_create("reflection Queue", 0);
  }
  if (object)
    dispatch_release(object);
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  id v10;
  uint64_t v11;
  __CFString **v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD block[7];

  if ((*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 25) & 2) != 0)
    v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - a1[10]));
  else
    v4 = 0;
  if (*(_QWORD *)a2)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(a1[4] + 8), "newVertexVariantWithCompilerOutput:pipelineStatisticsOutput:", *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 72));
    if ((*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 25) & 0x10) != 0)
    {
      v17 = v5;
      objc_msgSend(v5, "setDebugInstrumentationData:", *(_QWORD *)(a2 + 104));
      v5 = v17;
    }
  }
  v18 = v5;
  v6 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if ((v6 & 0x200) != 0)
  {
    v7 = (void *)a1[5];
    v8 = *(NSObject **)(a2 + 88);
    v9 = MTLPipelinePerformanceKeyVertexShader[0];
    v10 = (id)objc_msgSend(v7, "objectForKey:", MTLPipelinePerformanceKeyVertexShader[0], v5);
    if (v10)
    {
      if (v8)
      {
LABEL_11:
        _MTLAddCompilerServiceCompileTimeStats(v10, v8);
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
        v12 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_14:
        objc_msgSend(v10, "setObject:forKey:", v11, *v12);
        v6 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        goto LABEL_15;
      }
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "setObject:forKey:", v10, v9);

      if (v8)
        goto LABEL_11;
    }
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_14;
  }
LABEL_15:
  if ((v6 & 1) != 0)
  {
    v13 = *(_QWORD *)(a2 + 40);
    if (v13)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
      v15 = *(NSObject **)(v14 + 424);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E0FE2C68;
      block[5] = v13;
      block[6] = v14;
      block[4] = 0;
      dispatch_sync(v15, block);
    }
  }
  v16 = *(_QWORD *)(a2 + 80);
  if (v16)
  {
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = v16;
    dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(a1[8] + 8) + 40));
  }
  VariantEntry::insertVariant(*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24), v18, *(_QWORD *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));

}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[7];

  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v8 = *(NSObject **)(v7 + 424);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E0FE2C68;
    block[5] = a3;
    block[6] = v7;
    block[4] = 0;
    dispatch_sync(v8, block);
  }
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  if (!*(_QWORD *)(v9 + 56))
  {
    *(_QWORD *)(v9 + 56) = a2;

    *(_QWORD *)(v9 + 64) = objc_msgSend(a4, "copy");
  }
  dispatch_group_leave(*(dispatch_group_t *)(v9 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  v3 = *(void **)(v2 + 48);
  if (v3)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      v4 = *(void **)(a1 + 40);
      if (v4)
        v5 = newRenderPipeline(*(_QWORD *)(a1 + 152), v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24), v3, 0, 0, 0, 0, 0, 0, *(void **)(*(_QWORD *)(a1 + 48) + 8), *(NSObject **)(a1 + 56), *(void **)(a1 + 64), *(_QWORD *)(a1 + 136), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(MTLRenderPipelineReflectionInternal ***)(a1 + 144), *(NSMutableDictionary **)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40),
               *(_QWORD *)(a1 + 88),
               *(_QWORD **)(a1 + 128));
      else
        v5 = newRenderPipeline(0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24), v3, 0, 0, 0, 0, 0, 0, *(void **)(*(_QWORD *)(a1 + 48) + 8), *(NSObject **)(a1 + 56), *(void **)(a1 + 64), *(_QWORD *)(a1 + 136), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(MTLRenderPipelineReflectionInternal ***)(a1 + 144), *(NSMutableDictionary **)(a1 + 72), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40),
               *(_QWORD *)(a1 + 88),
               *(_QWORD **)(a1 + 128));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40) = v5;
    }
  }
  else
  {
    reportErrorMessage(*(id *)(v2 + 56), *(const __CFString **)(v2 + 64), *(_QWORD *)(a1 + 88), *(_QWORD **)(a1 + 128));
  }
  v6 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
  if (v6)
    dispatch_release(v6);
  v7 = *(NSObject **)(a1 + 80);
  if (v7)
    dispatch_release(v7);
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7
{
  return -[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:](self, "newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:", a3, a4, a5, 0, a6, a7);
}

- (void)addFunctionKeys:(RequiredFunctionKeys *)a3 function:(id)a4 driverData:(id)a5 frameworkData:(id)a6 compilerOptions:(int)a7
{
  __int16 v7;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  CC_SHA256_CTX v15;
  id v16;

  v7 = a7;
  FunctionHashFactory::FunctionHashFactory(&v15, a4, objc_msgSend(a4, "functionData"), a7 & 0xFFFFBFFF, 0, 0, 0);
  if ((v7 & 2) == 0)
    a3->var0[0] = FunctionHashFactory::createHash((uint64_t)&v15, 0, (dispatch_data_t)a5, a6);
  if ((v7 & 1) != 0)
  {
    if ((v7 & 0x1000) != 0)
      v12 = a5;
    else
      v12 = 0;
    if ((v7 & 0x1000) != 0)
      v13 = a6;
    else
      v13 = 0;
    a3->var0[2] = FunctionHashFactory::createHash((uint64_t)&v15, 2, v12, v13);
  }
  if ((v7 & 0x100) != 0)
    a3->var0[3] = (id)FunctionHashFactory::createHash((uint64_t)&v15, 3, 0, 0, 0, 0);
  if ((v7 & 0x1000) != 0)
    a3->var0[6] = FunctionHashFactory::createHash((uint64_t)&v15, 6, (dispatch_data_t)a5, a6);
  v14 = objc_msgSend(a4, "functionType");
  if ((v7 & 4) != 0 && v14 == 2)
    a3->var0[1] = FunctionHashFactory::createHash((uint64_t)&v15, 1, (dispatch_data_t)a5, a6);

}

- (id)newRenderPipelineStateWithDescriptorInternal:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 destinationBinaryArchive:(id)a6 error:(id *)a7 completionHandler:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  char v29;
  char v30;
  BOOL v31;
  unint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *compilerQueue;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  MTLCompileFunctionRequestData *v46;
  id *v47;
  NSObject *v48;
  uint64_t v49;
  OS_dispatch_queue *v50;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  NSObject *data;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  NSObject *object;
  NSObject *v65;
  NSDictionary *v66;
  NSObject *v67;
  _QWORD v68[24];
  _QWORD v69[6];
  _QWORD v70[12];
  _QWORD v71[6];
  _QWORD v72[6];
  _QWORD v73[14];
  _QWORD block[13];
  BOOL v75;
  _QWORD v76[10];
  dispatch_object_t v77;
  const void *v78;
  size_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  uint64_t v102;
  size_t size_ptr;
  void *buffer_ptr;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;

  if ((a4 & 0x400000) != 0)
  {
    if (initTimebaseInfo(void)::onceToken == -1)
    {
      if (a8)
        goto LABEL_4;
LABEL_114:
      v15 = mach_absolute_time();
      if (!a7)
        goto LABEL_6;
      goto LABEL_5;
    }
    dispatch_once(&initTimebaseInfo(void)::onceToken, &__block_literal_global_1135);
    if (!a8)
      goto LABEL_114;
  }
LABEL_4:
  v15 = 0;
  if (a7)
LABEL_5:
    *a7 = 0;
LABEL_6:
  if (!self->_device)
  {
    MTLReportFailure(0, "-[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 17727, (uint64_t)CFSTR("device cannot be null."), (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, v52);
    if (!self->_device)
      return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
      goto LABEL_9;
  }
  else
  {
    MTLReportFailure(1uLL, "-[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 17730, (uint64_t)CFSTR("device is not a MTLDevice."), v16, v17, v18, v19, v52);
    if (a3)
      goto LABEL_9;
  }
  MTLReportFailure(0, "-[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 17740, (uint64_t)CFSTR("descriptor cannot be null."), v16, v17, v18, v19, v52);
LABEL_9:
  v109 = 0;
  if ((objc_msgSend(a3, "validateWithDevice:error:", self->_device, &v109) & 1) != 0)
  {
    v58 = v15;
    v20 = objc_msgSend(a3, "fragmentFunction");
    v62 = (void *)objc_msgSend(a3, "vertexFunction");
    v21 = objc_msgSend(a3, "newPipelineScript");
    v63 = objc_msgSend(a3, "objectFunction");
    v60 = objc_msgSend(a3, "meshFunction");
    if (v60)
    {
      v59 = a5;
      v22 = a6;
      v76[0] = 0;
      v67 = objc_msgSend(a3, "newSerializedMeshDataWithFlags:options:error:", self->_compilerFlags, a4, v76);
      if (v67 && v63)
      {
        v65 = objc_msgSend(a3, "newSerializedObjectDataWithFlags:options:error:", self->_compilerFlags, a4, v76);
        if (!v65)
          goto LABEL_30;
      }
      else
      {
        if (!v67)
        {
LABEL_30:
          if (a8)
          {
            (*((void (**)(id, _QWORD, _QWORD, _QWORD))a8 + 2))(a8, 0, 0, v76[0]);
            v28 = v67;
          }
          else
          {
            v28 = v67;
            if (a7)
              *a7 = (id)v76[0];
          }
          if (v21)
            dispatch_release(v21);
          if (!v28)
            return 0;
          v48 = v28;
          goto LABEL_106;
        }
        v65 = 0;
      }
      object = 0;
      if (a8)
        goto LABEL_24;
      goto LABEL_25;
    }
    v76[0] = 0;
    object = objc_msgSend(a3, "newSerializedVertexDataWithFlags:options:error:", self->_compilerFlags, a4, v76);
    if (object)
    {
      v59 = a5;
      if (v62)
      {
        v22 = a6;
        v65 = 0;
        v67 = 0;
        if (a8)
LABEL_24:
          a3 = (id)objc_msgSend(a3, "copy");
LABEL_25:
        if ((a4 & 0x400000) != 0)
          v66 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        else
          v66 = 0;
        v105 = 0;
        v106 = &v105;
        v107 = 0x2020000000;
        v108 = 0;
        size_ptr = 0;
        buffer_ptr = 0;
        if (v21)
          v61 = dispatch_data_create_map(v21, (const void **)&buffer_ptr, &size_ptr);
        else
          v61 = 0;
        v97 = 0;
        v98 = &v97;
        v99 = 0x3052000000;
        v100 = __Block_byref_object_copy__10;
        v101 = __Block_byref_object_dispose__10;
        v102 = 0;
        v29 = objc_msgSend(a3, "isRasterizationEnabled");
        if (v20)
          v30 = v29;
        else
          v30 = 0;
        if ((v30 & 1) != 0)
        {
          v93 = 0;
          v94 = &v93;
          v95 = 0x2020000000;
          v96 = 0;
          v89 = 0;
          v90 = &v89;
          v91 = 0x2020000000;
          v92 = 0;
          if (objc_msgSend(v62, "renderTargetArrayIndexType"))
            v31 = 1;
          else
            v31 = (a4 & 0x200000) == 0;
          if (v31)
            v32 = a4;
          else
            v32 = a4 | 0x4000000;
          v85 = 0;
          v86 = &v85;
          v87 = 0x2020000000;
          v88 = 0;
          v88 = MTLGetCompilerOptions(self->_device, v32, self->_compilerFlags, 0, 0);
          data = objc_msgSend(a3, "newSerializedFragmentDataWithFlags:options:", self->_compilerFlags, v32);
          v84 = 0;
          v33 = -[MTLCompiler getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:](self, "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:", a3, a4 & 0x11240000, v32, buffer_ptr, objc_msgSend(a3, "fragmentFunction"), 2, 0, &v84);
          v80 = 0;
          v81 = &v80;
          v82 = 0x2020000000;
          v83 = 0;
          v76[0] = 0;
          v76[1] = v76;
          v76[2] = 0x6812000000;
          v76[3] = __Block_byref_object_copy__1142;
          v76[4] = __Block_byref_object_dispose__1143;
          v56 = v33;
          v76[6] = v33;
          v76[8] = v84;
          v76[7] = 0;
          v76[9] = 0;
          if (data)
          {
            v34 = dispatch_data_create_map(data, &v78, &v79);
          }
          else
          {
            v34 = 0;
            v78 = 0;
            v79 = 0;
          }
          v77 = v34;
          compilerQueue = self->_compilerQueue;
          v41 = MEMORY[0x1E0C809B0];
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke;
          block[3] = &unk_1E0FE47B8;
          block[4] = self;
          block[5] = v20;
          block[6] = data;
          block[7] = a3;
          block[12] = buffer_ptr;
          block[10] = &v85;
          block[11] = &v105;
          block[9] = v76;
          block[8] = v22;
          v75 = (v32 & 4) != 0;
          dispatch_sync(compilerQueue, block);
          v42 = v106[3];
          v55 = v42;
          if (v42)
          {
            v43 = *(NSObject **)(v42 + 440);
            v73[0] = v41;
            v73[1] = 3221225472;
            v73[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_2;
            v73[3] = &unk_1E0FE47E0;
            v73[8] = &v105;
            v73[9] = v76;
            v54 = v22;
            v73[4] = v22;
            v73[5] = v66;
            v73[7] = &v89;
            v73[6] = a3;
            v73[10] = &v93;
            v73[11] = &v80;
            v73[13] = v32;
            v73[12] = &v85;
            dispatch_sync(v43, v73);
            v72[0] = 0;
            v72[1] = v72;
            v72[2] = 0x3052000000;
            v72[3] = __Block_byref_object_copy__10;
            v72[4] = __Block_byref_object_dispose__10;
            v72[5] = 0;
            v71[0] = 0;
            v71[1] = v71;
            v71[2] = 0x3052000000;
            v71[3] = __Block_byref_object_copy__10;
            v71[4] = __Block_byref_object_dispose__10;
            v71[5] = 0;
            if (*((_BYTE *)v94 + 24))
            {
              v44 = dispatch_data_create(*(const void **)v90[3], *(_QWORD *)(v90[3] + 16) + *(_QWORD *)(v90[3] + 8), 0, 0);
              v45 = 0;
              if ((*((_BYTE *)v86 + 25) & 2) != 0)
                v45 = mach_absolute_time();
              v53 = v45;
              v46 = (MTLCompileFunctionRequestData *)objc_opt_new();
              -[MTLCompileFunctionRequestData setSync:](v46, "setSync:", a8 == 0);
              -[MTLCompileFunctionRequestData setFunction:](v46, "setFunction:", v20);
              -[MTLCompileFunctionRequestData setPipelineOptions:](v46, "setPipelineOptions:", v32);
              -[MTLCompileFunctionRequestData setFrameworkData:](v46, "setFrameworkData:", data);
              -[MTLCompileFunctionRequestData setDriverKeyData:](v46, "setDriverKeyData:", v44);
              -[MTLCompileFunctionRequestData setDestinationBinaryArchive:](v46, "setDestinationBinaryArchive:", v54);
              -[MTLCompileFunctionRequestData setBinaryArchives:](v46, "setBinaryArchives:", objc_msgSend(a3, "binaryArchives"));
              -[MTLCompileFunctionRequestData setArchiverId:](v46, "setArchiverId:", 0);
              -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v46, "setGpuCompilerSPIOptions:", objc_msgSend(a3, "gpuCompilerSPIOptions"));
              -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v46, "setMaxAccelerationStructureTraversalDepth:", objc_msgSend(a3, "maxAccelerationStructureTraversalDepth"));
              -[MTLCompileFunctionRequestData setAirScript:](v46, "setAirScript:", v61);
              setLinkedFunctionsForRequest(v46, (MTLLinkedFunctions *)objc_msgSend(a3, "fragmentLinkedFunctions"));
              -[MTLCompiler initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:](self, "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v46, buffer_ptr, objc_msgSend(a3, "driverCompilerOptions"), 0);
              v70[0] = v41;
              v70[1] = 3221225472;
              v70[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_3;
              v70[3] = &unk_1E0FE4808;
              v70[6] = &v85;
              v70[7] = v71;
              v70[4] = self;
              v70[5] = v66;
              v70[8] = &v105;
              v70[9] = v72;
              v70[11] = v53;
              v70[10] = &v89;
              -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v46, 1, 0, 0, v70);

              dispatch_release(v44);
              v39 = v61;
              v47 = v59;
            }
            else
            {
              v47 = v59;
              v39 = v61;
              if (*((_BYTE *)v81 + 24))
              {
                dispatch_group_enter(*(dispatch_group_t *)(v90[3] + 40));
                v69[0] = v41;
                v69[1] = 3221225472;
                v69[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_4;
                v69[3] = &unk_1E0FE4748;
                v69[4] = &v105;
                v69[5] = &v89;
                -[MTLCompiler reflectionWithFunction:options:completionHandler:](self, "reflectionWithFunction:options:completionHandler:", v20, v32, v69);
              }
            }
            dispatch_release(data);
            -[_MTLDevice freeFragmentFunctionKey:fragmentKeySize:](self->_device, "freeFragmentFunctionKey:fragmentKeySize:", v56, v84);
            if (object)
              dispatch_retain(object);
            if (v65)
              dispatch_retain(v65);
            if (v67)
              dispatch_retain(v67);
            v49 = v90[3];
            v50 = -[_MTLDevice concurrentQueue](self->_device, "concurrentQueue");
            v68[0] = v41;
            v68[1] = 3221225472;
            v68[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_5;
            v68[3] = &unk_1E0FE4830;
            v68[16] = &v89;
            v68[17] = &v97;
            v68[4] = v60;
            v68[5] = self;
            v68[6] = v63;
            v68[7] = v65;
            v68[8] = v67;
            v68[9] = a3;
            v68[10] = v39;
            v68[11] = v54;
            v68[22] = v32;
            v68[23] = v47;
            v68[18] = &v105;
            v68[19] = v72;
            v68[20] = v71;
            v68[21] = a7;
            v68[12] = v66;
            v68[13] = v62;
            v68[14] = object;
            v68[15] = a8;
            VariantEntry::waitOrNotify(v49, a8 != 0, (dispatch_queue_t)v50, v68);
            _Block_object_dispose(v71, 8);
            _Block_object_dispose(v72, 8);
            v36 = v67;
            v38 = object;
            v37 = v65;
          }
          else
          {
            -[_MTLDevice freeFragmentFunctionKey:fragmentKeySize:](self->_device, "freeFragmentFunctionKey:fragmentKeySize:", v56, v84);
            v36 = v67;
            v38 = object;
            v37 = v65;
            v39 = v61;
            if (data)
              dispatch_release(data);
            if (object)
              dispatch_release(object);
            if (a8)

            reportErrorMessage((id)1, CFSTR("MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive."), (uint64_t)a8, a7);
            dispatch_release(v61);
            dispatch_release(v21);
          }
          _Block_object_dispose(v76, 8);
          if (v77)
            dispatch_release(v77);
          _Block_object_dispose(&v80, 8);
          _Block_object_dispose(&v85, 8);
          _Block_object_dispose(&v89, 8);
          _Block_object_dispose(&v93, 8);
          if (!v55)
          {
            v23 = 0;
            goto LABEL_100;
          }
        }
        else
        {
          if (v60)
            v35 = -[MTLCompiler createMeshStageAndLinkPipelineWithFragment:fragmentVariant:objectFunction:serializedObjectDescriptor:meshFunction:serializedMeshDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:](self, "createMeshStageAndLinkPipelineWithFragment:fragmentVariant:objectFunction:serializedObjectDescriptor:meshFunction:serializedMeshDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:", 0, 0, v63, v65, v60, v67, a3, v61, v22, a4, v59, v66, 0, 0, a7,
                    a8);
          else
            v35 = -[MTLCompiler createVertexStageAndLinkPipelineWithFragment:fragmentVariant:vertexFunction:serializedVertexDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:](self, "createVertexStageAndLinkPipelineWithFragment:fragmentVariant:vertexFunction:serializedVertexDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:", 0, 0, v62, object, a3, v61, v22, a4, v59, v66, 0, 0, a7, a8);
          v98[5] = (uint64_t)v35;
          v36 = v67;
          v38 = object;
          v37 = v65;
          v39 = v61;
        }
        if (v38)
          dispatch_release(v38);
        if (v37)
          dispatch_release(v37);
        if (v36)
          dispatch_release(v36);
        if (v39)
          dispatch_release(v39);
        if (v21)
          dispatch_release(v21);
        if (a8)
        {

          if (!v66)
            goto LABEL_99;
        }
        else
        {
          if (!v66)
          {
LABEL_99:
            v23 = (void *)v98[5];
LABEL_100:
            _Block_object_dispose(&v97, 8);
            _Block_object_dispose(&v105, 8);
            return v23;
          }
          -[NSDictionary setObject:forKey:](v66, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - v58))), MTLCompileTimeStatisticsKeyPipelineTotal[0]);
        }
        _MTLAddCompilePipelinePerformanceStatistics(v66, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesRender);
        goto LABEL_99;
      }
      MTLReportFailure(0, "-[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 17844, (uint64_t)CFSTR("Vertex function cannot be nil."), v24, v25, v26, v27, v52);
      if (!v21)
        return 0;
    }
    else if (a8)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))a8 + 2))(a8, 0, 0, v76[0]);
      if (!v21)
        return 0;
    }
    else
    {
      if (a7)
        *a7 = (id)v76[0];
      if (!v21)
        return 0;
    }
    v48 = v21;
LABEL_106:
    dispatch_release(v48);
    return 0;
  }
  if (!a7)
    return 0;
  v23 = 0;
  *a7 = v109;
  return v23;
}

void __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  RequiredFunctionKeys v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v5 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = objc_msgSend(*(id *)(a1 + 56), "driverCompilerOptions");
  v8 = *(_QWORD *)(a1 + 96);
  v9 = objc_msgSend(*(id *)(a1 + 56), "binaryArchives");
  if (v2)
    objc_msgSend(v2, "requiredKeysForFunction:variantKey:frameworkData:compilerOptions:driverCompilerOptions:airScript:archives:compiledNextStageVariant:", v3, v4 + 48, v6, v5, v7, v8, v9, 0);
  else
    memset(&v10, 0, sizeof(v10));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48, &v10, *(unsigned __int8 *)(a1 + 104));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v10);
}

void *__128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_2(uint64_t a1)
{
  void *result;
  int v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  result = VariantList<4u>::find<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    result = VariantList<4u>::newVariantEntry<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(_QWORD *)(a1 + 32))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  if ((*(_BYTE *)(a1 + 106) & 0x40) != 0)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "fragmentFunction"), "name");
    v6 = MTLPipelinePerformanceKeyFragmentShader[0];
    v7 = (id)objc_msgSend(v4, "objectForKey:", MTLPipelinePerformanceKeyFragmentShader[0]);
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v4, "setObject:forKey:", v7, v6);

    }
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3 == 0);
    result = (void *)objc_msgSend(v7, "setObject:forKey:", v8, MTLCompileTimeStatisticsKeyCachedFunction[0]);
    if (v5)
      result = (void *)objc_msgSend(v7, "setObject:forKey:", v5, MTLCompileTimeStatisticsKeyFunctionName[0]);
  }
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) & 1) != 0)
  {
    result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + 432), "objectForKey:", &stru_1E0FE5DC8);
    v9 = result == 0;
  }
  else
  {
    v9 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v9;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (!*(_QWORD *)(v10 + 424))
    {
      result = dispatch_queue_create("reflection Queue", 0);
      *(_QWORD *)(v10 + 424) = result;
    }
  }
  return result;
}

void __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  id v15;
  uint64_t v16;
  __CFString **v17;
  void *v18;
  _QWORD *v19;
  NSObject *v20;
  uint64_t v21;
  size_t v22;
  void *buffer_ptr[7];

  if ((*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 25) & 2) != 0)
    v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - a1[11]));
  else
    v4 = 0;
  v5 = *(_QWORD *)a2;
  v6 = *(void **)(a2 + 8);
  if (*(_QWORD *)a2)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(*(id *)(a1[4] + 8), "newFragmentVariantWithCompilerOutput:pipelineStatisticsOutput:", *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 72));
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = *(_QWORD *)(a2 + 112);
    v8 = *(NSObject **)(*(_QWORD *)(a1[7] + 8) + 40);
    if (v8)
      dispatch_retain(v8);
    v9 = *(NSObject **)(a2 + 56);
    if (v9)
    {
      v22 = 0;
      buffer_ptr[0] = 0;
      v10 = dispatch_data_create_map(v9, (const void **)buffer_ptr, &v22);
      if (v22)
        objc_msgSend(v7, "setInputInfo:size:", buffer_ptr[0]);
      dispatch_release(v10);
    }
    if ((*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 25) & 0x10) != 0)
      objc_msgSend(v7, "setDebugInstrumentationData:", *(_QWORD *)(a2 + 104));
  }
  v11 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if ((v11 & 0x200) != 0)
  {
    v12 = (void *)a1[5];
    v13 = *(NSObject **)(a2 + 88);
    v14 = MTLPipelinePerformanceKeyFragmentShader[0];
    v15 = (id)objc_msgSend(v12, "objectForKey:", MTLPipelinePerformanceKeyFragmentShader[0]);
    if (v15)
    {
      if (v13)
      {
LABEL_17:
        _MTLAddCompilerServiceCompileTimeStats(v15, v13);
        v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
        v17 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_20:
        objc_msgSend(v15, "setObject:forKey:", v16, *v17);
        v11 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        goto LABEL_21;
      }
    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v12, "setObject:forKey:", v15, v14);

      if (v13)
        goto LABEL_17;
    }
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v17 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_20;
  }
LABEL_21:
  if ((v11 & 1) != 0)
  {
    v18 = *(void **)(a2 + 40);
    if (v18)
    {
      v19 = *(_QWORD **)(*(_QWORD *)(a1[8] + 8) + 24);
      v20 = v19[53];
      buffer_ptr[0] = (void *)MEMORY[0x1E0C809B0];
      buffer_ptr[1] = (void *)3221225472;
      buffer_ptr[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      buffer_ptr[3] = &unk_1E0FE2C68;
      buffer_ptr[5] = v18;
      buffer_ptr[6] = v19;
      buffer_ptr[4] = 0;
      dispatch_sync(v20, buffer_ptr);
    }
  }
  v21 = *(_QWORD *)(a2 + 80);
  if (v21)
  {
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40) = v21;
    dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(a1[9] + 8) + 40));
  }
  VariantEntry::insertVariant(*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24), v7, v5, v6, *(NSObject **)(a2 + 104));

}

void __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[7];

  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v8 = *(NSObject **)(v7 + 424);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E0FE2C68;
    block[5] = a3;
    block[6] = v7;
    block[4] = 0;
    dispatch_sync(v8, block);
  }
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  if (!*(_QWORD *)(v9 + 56))
  {
    *(_QWORD *)(v9 + 56) = a2;

    *(_QWORD *)(v9 + 64) = objc_msgSend(a4, "copy");
  }
  dispatch_group_leave(*(dispatch_group_t *)(v9 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
}

void __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[16] + 8) + 24);
  if (*(_QWORD *)(v2 + 48))
  {
    v4 = a1[4];
    v3 = (void *)a1[5];
    v5 = *(_QWORD *)(*(_QWORD *)(a1[18] + 8) + 24);
    if (v4)
      v6 = objc_msgSend(v3, "createMeshStageAndLinkPipelineWithFragment:fragmentVariant:objectFunction:serializedObjectDescriptor:meshFunction:serializedMeshDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:", v5, a1[9], a1[10], a1[11], a1[22], a1[23], a1[12], *(_QWORD *)(*(_QWORD *)(a1[19] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[20] + 8) + 40), a1[21], a1[15]);
    else
      v6 = objc_msgSend(v3, "createVertexStageAndLinkPipelineWithFragment:fragmentVariant:vertexFunction:serializedVertexDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:", v5, a1[11], a1[22], a1[23], a1[12], *(_QWORD *)(*(_QWORD *)(a1[19] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[20] + 8) + 40), a1[21], a1[15]);
    *(_QWORD *)(*(_QWORD *)(a1[17] + 8) + 40) = v6;
  }
  else
  {
    reportErrorMessage(*(id *)(v2 + 56), *(const __CFString **)(v2 + 64), a1[15], (_QWORD *)a1[21]);
  }
  v7 = *(NSObject **)(*(_QWORD *)(a1[20] + 8) + 40);
  if (v7)
    dispatch_release(v7);
  v8 = a1[14];
  if (v8)
    dispatch_release(v8);
  v9 = a1[7];
  if (v9)
    dispatch_release(v9);
  v10 = a1[8];
  if (v10)
    dispatch_release(v10);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7
{
  uint64_t v13;

  if (objc_msgSend(a3, "pipelineLibrary"))
    v13 = objc_msgSend((id)objc_msgSend(a3, "pipelineLibrary"), "pipelineCache");
  else
    v13 = 0;
  return -[MTLCompiler newComputePipelineStateWithDescriptorInternal:options:pipelineCache:destinationBinaryArchive:reflection:error:completionHandler:](self, "newComputePipelineStateWithDescriptorInternal:options:pipelineCache:destinationBinaryArchive:reflection:error:completionHandler:", a3, a4, v13, 0, a5, a6, a7);
}

- (VariantEntry)computeVariantEntryWithDescriptor:(id)a3 airDescriptor:(id)a4 options:(unint64_t)a5 serializedComputeDataDescriptor:(id)a6 asyncCompile:(BOOL)a7 pipelineCache:(id)a8 destinationBinaryArchive:(id)a9 computeProgram:(MTLProgramObject *)a10 kernelDriverCompileTimeData:(id *)a11 compileTimeStatistics:(id)a12
{
  _BOOL4 v13;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *compilerQueue;
  uint64_t v24;
  VariantEntry *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  _BOOL4 v36;
  void *v37;
  _QWORD v38[6];
  _QWORD v39[11];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  uint64_t v45;
  _QWORD v46[14];
  _QWORD block[13];
  BOOL v48;
  _QWORD v49[10];
  dispatch_object_t object;
  const void *v51;
  size_t v52;
  uint64_t v53;
  size_t size_ptr;
  void *buffer_ptr;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;

  v13 = a7;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v59 = MTLGetCompilerOptions(self->_device, a5, self->_compilerFlags, 1uLL, 0);
  v19 = objc_msgSend(a3, "computeFunction");
  buffer_ptr = 0;
  size_ptr = 0;
  v20 = dispatch_data_create_map((dispatch_data_t)a4, (const void **)&buffer_ptr, &size_ptr);
  v53 = 0;
  v21 = -[_MTLDevice computeFunctionKeyWithComputePipelineDescriptor:options:keySize:](self->_device, "computeFunctionKeyWithComputePipelineDescriptor:options:keySize:", a3, a5, &v53);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x6812000000;
  v49[3] = __Block_byref_object_copy__1142;
  v49[4] = __Block_byref_object_dispose__1143;
  v49[6] = v21;
  v37 = v21;
  v49[7] = 0;
  v49[8] = v53;
  v49[9] = 0;
  v36 = v13;
  if (a6)
  {
    v22 = dispatch_data_create_map((dispatch_data_t)a6, &v51, &v52);
  }
  else
  {
    v22 = 0;
    v51 = 0;
    v52 = 0;
  }
  object = v22;
  compilerQueue = self->_compilerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke;
  block[3] = &unk_1E0FE47B8;
  block[4] = self;
  block[5] = v19;
  block[6] = a6;
  block[7] = a3;
  block[9] = v49;
  block[10] = &v56;
  block[11] = &v68;
  block[12] = buffer_ptr;
  block[8] = a9;
  v48 = (a5 & 4) != 0;
  dispatch_sync(compilerQueue, block);
  v24 = v69[3];
  if ((a5 & 4) == 0 || v24)
  {
    v26 = *(NSObject **)(v24 + 440);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_2;
    v46[3] = &unk_1E0FE47E0;
    v46[8] = &v68;
    v46[9] = v49;
    v46[4] = a9;
    v46[5] = a12;
    v46[6] = a3;
    v46[7] = &v72;
    v46[10] = &v60;
    v46[11] = &v64;
    v46[12] = &v56;
    v46[13] = a5;
    dispatch_sync(v26, v46);
    v40 = 0;
    v41 = &v40;
    v42 = 0x3052000000;
    v43 = __Block_byref_object_copy__10;
    v44 = __Block_byref_object_dispose__10;
    v45 = 0;
    if (a9 || (v27 = 0, *((_BYTE *)v61 + 24)))
      v27 = dispatch_data_create(*(const void **)v73[3], *(_QWORD *)(v73[3] + 16) + *(_QWORD *)(v73[3] + 8), 0, 0);
    v28 = (void *)objc_opt_new();
    objc_msgSend(v28, "setSync:", !v36);
    objc_msgSend(v28, "setFunction:", v19);
    objc_msgSend(v28, "setPipelineOptions:", a5);
    objc_msgSend(v28, "setFrameworkData:", a6);
    objc_msgSend(v28, "setDriverKeyData:", v27);
    objc_msgSend(v28, "setPipelineCache:", a8);
    if (objc_msgSend(a3, "linkedFunctions"))
      v29 = objc_msgSend((id)objc_msgSend(a3, "linkedFunctions"), "functions");
    else
      v29 = 0;
    objc_msgSend(v28, "setVisibleFunctions:", v29, a12);
    objc_msgSend(v28, "setDestinationBinaryArchive:", a9);
    objc_msgSend(v28, "setBinaryArchives:", objc_msgSend(a3, "binaryArchives"));
    if (objc_msgSend(a3, "linkedFunctions"))
      v30 = objc_msgSend((id)objc_msgSend(a3, "linkedFunctions"), "privateFunctions");
    else
      v30 = 0;
    objc_msgSend(v28, "setPrivateVisibleFunctions:", v30);
    objc_msgSend(v28, "setGpuCompilerSPIOptions:", objc_msgSend(a3, "gpuCompilerSPIOptions"));
    objc_msgSend(v28, "setMaxAccelerationStructureTraversalDepth:", objc_msgSend(a3, "maxAccelerationStructureTraversalDepth"));
    objc_msgSend(v28, "setAirScript:", v20);
    if (objc_msgSend(v28, "visibleFunctions"))
      v31 = objc_msgSend((id)objc_msgSend(v28, "visibleFunctions"), "arrayByAddingObjectsFromArray:", objc_msgSend(a3, "functionPointers"));
    else
      v31 = objc_msgSend(a3, "functionPointers");
    objc_msgSend(v28, "setVisibleFunctions:", v31);
    -[MTLCompiler initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:](self, "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v28, buffer_ptr, objc_msgSend(a3, "driverCompilerOptions"), 0);
    if (*((_BYTE *)v61 + 24))
    {
      if ((*((_BYTE *)v57 + 25) & 2) != 0)
        v32 = mach_absolute_time();
      else
        v32 = 0;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_3;
      v39[3] = &unk_1E0FE4858;
      v39[6] = &v56;
      v39[7] = &v68;
      v39[4] = self;
      v39[5] = v35;
      v39[8] = &v72;
      v39[9] = &v40;
      v39[10] = v32;
      -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v28, 1, 0, 0, v39);
    }
    else if (*((_BYTE *)v65 + 24))
    {
      dispatch_group_enter(*(dispatch_group_t *)(v73[3] + 40));
      v33 = objc_msgSend(a3, "binaryArchives");
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_4;
      v38[3] = &unk_1E0FE4748;
      v38[4] = &v68;
      v38[5] = &v72;
      -[MTLCompiler reflectionWithFunction:options:sync:binaryArchives:completionHandler:](self, "reflectionWithFunction:options:sync:binaryArchives:completionHandler:", v19, a5, 0, v33, v38);
    }

    if (v27)
      dispatch_release(v27);
    dispatch_release(v20);
    -[_MTLDevice freeComputeFunctionKey:keySize:](self->_device, "freeComputeFunctionKey:keySize:", v37, v53);
    *a11 = (id)v41[5];
    *a10 = (MTLProgramObject *)v69[3];
    v25 = (VariantEntry *)v73[3];
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    -[_MTLDevice freeComputeFunctionKey:keySize:](self->_device, "freeComputeFunctionKey:keySize:", v37, v53);
    dispatch_release(v20);
    v25 = 0;
  }
  _Block_object_dispose(v49, 8);
  if (object)
    dispatch_release(object);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  return v25;
}

void __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  RequiredFunctionKeys v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v5 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = objc_msgSend(*(id *)(a1 + 56), "driverCompilerOptions");
  v8 = *(_QWORD *)(a1 + 96);
  v9 = objc_msgSend(*(id *)(a1 + 56), "binaryArchives");
  if (v2)
    objc_msgSend(v2, "requiredKeysForFunction:variantKey:frameworkData:compilerOptions:driverCompilerOptions:airScript:archives:compiledNextStageVariant:", v3, v4 + 48, v6, v5, v7, v8, v9, 0);
  else
    memset(&v10, 0, sizeof(v10));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48, &v10, *(unsigned __int8 *)(a1 + 104));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v10);
}

void *__220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_2(uint64_t a1)
{
  void *result;
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  result = VariantList<4u>::find<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    result = VariantList<4u>::newVariantEntry<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(_QWORD *)(a1 + 32))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  if ((*(_BYTE *)(a1 + 106) & 0x40) != 0)
  {
    v3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 0;
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "computeFunction"), "name");
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    result = (void *)objc_msgSend(v4, "setObject:forKey:", v6, MTLCompileTimeStatisticsKeyCachedFunction[0]);
    if (v5)
      result = (void *)objc_msgSend(v4, "setObject:forKey:", v5, MTLCompileTimeStatisticsKeyFunctionName[0]);
  }
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) & 1) != 0)
  {
    result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + 432), "objectForKey:", &stru_1E0FE5DC8);
    v7 = result == 0;
  }
  else
  {
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v7;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (!*(_QWORD *)(v8 + 424))
    {
      result = dispatch_queue_create("reflection Queue", 0);
      *(_QWORD *)(v8 + 424) = result;
    }
  }
  return result;
}

void __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __CFString **v12;
  uint64_t v13;
  _QWORD block[7];

  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 25) & 2) != 0)
    v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - *(_QWORD *)(a1 + 80)));
  else
    v4 = 0;
  if (*(_QWORD *)a2)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newComputeVariantWithCompilerOutput:pipelineStatisticsOutput:", *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 72));
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 1) != 0)
  {
    v6 = *(_QWORD *)(a2 + 40);
    if (v6)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v8 = *(NSObject **)(v7 + 424);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E0FE2C68;
      block[5] = v6;
      block[6] = v7;
      block[4] = 0;
      dispatch_sync(v8, block);
    }
  }
  VariantEntry::insertVariant(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v5, *(_QWORD *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));

  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 25) & 2) != 0)
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(NSObject **)(a2 + 88);
    if (v10)
    {
      _MTLAddCompilerServiceCompileTimeStats(*(void **)(a1 + 40), v10);
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
      v12 = MTLCompileTimeStatisticsKeyMTLCompilerService;
    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v12 = MTLCompileTimeStatisticsKeyCachedFunction;
    }
    objc_msgSend(v9, "setObject:forKey:", v11, *v12);
  }
  v13 = *(_QWORD *)(a2 + 80);
  if (v13)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v13;
    dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  }
}

void __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[7];

  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v8 = *(NSObject **)(v7 + 424);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E0FE2C68;
    block[5] = a3;
    block[6] = v7;
    block[4] = 0;
    dispatch_sync(v8, block);
  }
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  if (!*(_QWORD *)(v9 + 56))
  {
    *(_QWORD *)(v9 + 56) = a2;

    *(_QWORD *)(v9 + 64) = objc_msgSend(a4, "copy");
  }
  dispatch_group_leave(*(dispatch_group_t *)(v9 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
}

- (id)pipelineStateWithVariant:(VariantEntry *)a3 descriptor:(id)a4 options:(unint64_t)a5 computeProgram:(void *)a6 kernelDriverCompileTimeData:(id)a7 serializedComputeDataDescriptor:(id)a8 compileTimeStatistics:(id)a9 reflection:(id *)a10 error:(id *)a11 completionHandler:(id)a12
{
  int v18;
  OS_dispatch_queue *v19;
  void *v20;
  _QWORD block[16];
  int v24;
  BOOL v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = 0;
  v18 = MTLGetCompilerOptions(self->_device, a5, self->_compilerFlags, 1uLL, 0);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3052000000;
  v26[3] = __Block_byref_object_copy__10;
  v26[4] = __Block_byref_object_dispose__10;
  v26[5] = a7;
  v19 = -[_MTLDevice serialQueue](self->_device, "serialQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __191__MTLCompiler_pipelineStateWithVariant_descriptor_options_computeProgram_kernelDriverCompileTimeData_serializedComputeDataDescriptor_compileTimeStatistics_reflection_error_completionHandler___block_invoke;
  block[3] = &unk_1E0FE4880;
  block[8] = a12;
  block[9] = &v27;
  block[4] = self;
  block[5] = a4;
  block[12] = a11;
  block[13] = a5;
  v24 = v18;
  block[10] = v26;
  block[11] = a3;
  block[6] = a8;
  block[7] = a9;
  v25 = a12 != 0;
  block[14] = a6;
  block[15] = a10;
  VariantEntry::waitOrNotify((uint64_t)a3, a12 != 0, (dispatch_queue_t)v19, block);
  v20 = (void *)v28[5];
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  return v20;
}

void __191__MTLCompiler_pipelineStateWithVariant_descriptor_options_computeProgram_kernelDriverCompileTimeData_serializedComputeDataDescriptor_compileTimeStatistics_reflection_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  MTLComputePipelineReflection *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  unint64_t j;
  MTLDebugInstrumentationData *v19;
  MTLComputePipelineReflection *v20;
  unsigned int v21;
  unint64_t v22;
  const __CFString *v23;
  void *v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28[18];

  v28[16] = *(void **)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(v2 + 48);
  if (!v3)
  {
    reportErrorMessage(*(id *)(v2 + 56), *(const __CFString **)(v2 + 64), *(_QWORD *)(a1 + 64), *(_QWORD **)(a1 + 96));
    return;
  }
  v23 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newComputePipelineWithDescriptor:variant:errorMessage:", *(_QWORD *)(a1 + 40), v3, &v23);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    reportErrorMessage((id)2, v23, *(_QWORD *)(a1 + 64), *(_QWORD **)(a1 + 96));
    return;
  }
  if (!*(_QWORD *)(a1 + 104))
  {
    if (!*(_BYTE *)(a1 + 132))
      return;
    v6 = 0;
    goto LABEL_34;
  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pipelineFlagsWithComputeVariant:", v3);
  if ((*(_BYTE *)(a1 + 128) & 1) != 0)
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 112) + 432), "objectForKey:", &stru_1E0FE5DC8);
  else
    v5 = 0;
  v6 = -[MTLComputePipelineReflection initWithSerializedData:serializedStageInputDescriptor:device:options:flags:]([MTLComputePipelineReflection alloc], "initWithSerializedData:serializedStageInputDescriptor:device:options:flags:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 104), v4);
  v7 = *(_QWORD *)(a1 + 104);
  if ((v7 & 0x440000) != 0)
  {
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pipelinePerformanceStatisticsWithComputeVariant:compileTimeOutput:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    v9 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v9)
    {
      dispatch_release(v9);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = 0;
    }
    if ((*(_BYTE *)(a1 + 106) & 0x40) != 0)
    {
      v10 = *(void **)(a1 + 56);
      if ((objc_msgSend((id)objc_msgSend(v10, "objectForKey:", MTLCompileTimeStatisticsKeyCachedFunction[0]), "BOOLValue") & 1) == 0)
      {
        v11 = (void *)objc_msgSend(v8, "objectForKey:", MTLPipelinePerformanceKeyCompileTimeStatistics[0]);
        *(_OWORD *)v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v24, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v10, "setObject:forKey:", objc_msgSend(v11, "objectForKey:", *((_QWORD *)v24[1] + i)), *((_QWORD *)v24[1] + i));
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v24, v28, 16);
          }
          while (v13);
        }
      }
    }
    -[MTLComputePipelineReflection setPerformanceStatistics:](v6, "setPerformanceStatistics:", v8);
    v7 = *(_QWORD *)(a1 + 104);
  }
  if ((v7 & 0x200000) != 0)
  {
    v28[0] = 0;
    v24[0] = 0;
    v22 = 0;
    v21 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:stride:forComputeVariant:", v28, v24, &v22, &v21, v3);
    if (v22)
    {
      -[MTLComputePipelineReflection setConstantSamplerDescriptorsFromBitmasks:stride:count:](v6, "setConstantSamplerDescriptorsFromBitmasks:stride:count:", v28[0], v21);
      v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v17 = (void *)objc_msgSend(v16, "initWithCapacity:", v22);
      if (v22)
      {
        for (j = 0; j < v22; ++j)
          objc_msgSend(v17, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v24[0] + j)), j);
      }
      -[MTLComputePipelineReflection setConstantSamplerUniqueIdentifiers:](v6, "setConstantSamplerUniqueIdentifiers:", v17);

    }
    free(v28[0]);
    free(v24[0]);
    v7 = *(_QWORD *)(a1 + 104);
  }
  if ((v7 & 0x1000000) != 0)
  {
    v19 = -[MTLDebugInstrumentationData initWithData:]([MTLDebugInstrumentationData alloc], "initWithData:", *(_QWORD *)(*(_QWORD *)(a1 + 88) + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDebugInstrumentationData:", v19);

  }
  if (*(_BYTE *)(a1 + 132))
  {
LABEL_34:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = 0;
LABEL_35:

    return;
  }
  if (v6)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      v20 = v6;
      **(_QWORD **)(a1 + 120) = v6;
      return;
    }
    goto LABEL_35;
  }
}

- (id)newComputePipelineStateWithDescriptorInternal:(id)a3 options:(unint64_t)a4 pipelineCache:(id)a5 destinationBinaryArchive:(id)a6 reflection:(id *)a7 error:(id *)a8 completionHandler:(id)a9
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSDictionary *v20;
  uint64_t v21;
  NSObject *v22;
  VariantEntry *v23;
  uint64_t v24;
  OS_dispatch_queue *v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD block[7];
  uint64_t v32;
  uint64_t v33;
  void *v34;

  if (_MTLCompilePerformanceStatisticsEnabled())
    v19 = a4 | 0x400000;
  else
    v19 = a4;
  if ((v19 & 0x400000) != 0)
  {
    if (initTimebaseInfo(void)::onceToken != -1)
      dispatch_once(&initTimebaseInfo(void)::onceToken, &__block_literal_global_1135);
    v20 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    _MTLAddCompilePipelinePerformanceStatistics(v20, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesCompute);
    if (!a9)
    {
      v21 = mach_absolute_time();
      if (a3)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else
  {
    v20 = 0;
  }
  v21 = 0;
  if (a3)
    goto LABEL_10;
LABEL_24:
  MTLReportFailure(0, "-[MTLCompiler newComputePipelineStateWithDescriptorInternal:options:pipelineCache:destinationBinaryArchive:reflection:error:completionHandler:]", 18729, (uint64_t)CFSTR("descriptor cannot be null."), v15, v16, v17, v18, v28);
LABEL_10:
  v34 = 0;
  if ((objc_msgSend(a3, "validateWithDevice:error:", self->_device, &v34) & 1) != 0)
  {
    if (a8)
      *a8 = 0;
    v29 = v21;
    if (a9)
      a3 = (id)objc_msgSend(a3, "copy");
    v22 = objc_msgSend(a3, "newSerializedComputeDataWithFlags:options:", self->_compilerFlags, v19);
    v33 = 0;
    v32 = 0;
    v30 = objc_msgSend(a3, "newPipelineScript");
    v23 = -[MTLCompiler computeVariantEntryWithDescriptor:airDescriptor:options:serializedComputeDataDescriptor:asyncCompile:pipelineCache:destinationBinaryArchive:computeProgram:kernelDriverCompileTimeData:compileTimeStatistics:](self, "computeVariantEntryWithDescriptor:airDescriptor:options:serializedComputeDataDescriptor:asyncCompile:pipelineCache:destinationBinaryArchive:computeProgram:kernelDriverCompileTimeData:compileTimeStatistics:", a3, a6, &v32, &v33, v20);
    if (v23)
    {
      v24 = (uint64_t)v23;
      if (!a6)
      {
        v26 = -[MTLCompiler pipelineStateWithVariant:descriptor:options:computeProgram:kernelDriverCompileTimeData:serializedComputeDataDescriptor:compileTimeStatistics:reflection:error:completionHandler:](self, "pipelineStateWithVariant:descriptor:options:computeProgram:kernelDriverCompileTimeData:serializedComputeDataDescriptor:compileTimeStatistics:reflection:error:completionHandler:", v23, a3, v19, v32, v33, v22, v20, a7, a8, a9);
LABEL_28:
        if (v22)
          dispatch_release(v22);
        if (a9)
        {

          if (!v20)
            goto LABEL_36;
        }
        else
        {
          if (!v20)
          {
LABEL_36:
            dispatch_release(v30);
            return v26;
          }
          -[NSDictionary setObject:forKey:](v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - v29))), MTLCompileTimeStatisticsKeyPipelineTotal[0]);
        }
        _MTLAddCompilePipelinePerformanceStatistics(v20, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesCompute);

        goto LABEL_36;
      }
      v25 = -[_MTLDevice serialQueue](self->_device, "serialQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __143__MTLCompiler_newComputePipelineStateWithDescriptorInternal_options_pipelineCache_destinationBinaryArchive_reflection_error_completionHandler___block_invoke;
      block[3] = &unk_1E0FE4300;
      block[4] = a9;
      block[5] = v24;
      block[6] = a8;
      VariantEntry::waitOrNotify(v24, a9 != 0, (dispatch_queue_t)v25, block);
    }
    else
    {
      reportErrorMessage((id)1, CFSTR("MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive."), (uint64_t)a9, a8);
    }
    v26 = 0;
    goto LABEL_28;
  }
  if (a8)
    *a8 = v34;
  if (v20)

  return 0;
}

_QWORD *__143__MTLCompiler_newComputePipelineStateWithDescriptorInternal_options_pipelineCache_destinationBinaryArchive_reflection_error_completionHandler___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[5];
  if (!*(_QWORD *)(v1 + 48))
    return reportErrorMessage(*(id *)(v1 + 56), *(const __CFString **)(v1 + 64), result[4], (_QWORD *)result[6]);
  return result;
}

- (VariantEntry)tileVariantEntryWithDescriptor:(id)a3 airDescriptor:(id)a4 options:(unint64_t)a5 serializedTileDataDescriptor:(id)a6 asyncCompile:(BOOL)a7 destinationBinaryArchive:(id)a8 tileProgram:(MTLProgramObject *)a9 kernelDriverCompileTimeData:(id *)a10 compileTimeStatistics:(id)a11
{
  _BOOL4 v12;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *compilerQueue;
  uint64_t v23;
  VariantEntry *v24;
  NSObject *v25;
  NSObject *v26;
  MTLCompileFunctionRequestData *v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[6];
  _QWORD v35[12];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;
  _QWORD v42[15];
  _QWORD block[13];
  BOOL v44;
  _QWORD v45[10];
  dispatch_object_t object;
  const void *v47;
  size_t v48;
  uint64_t v49;
  size_t size_ptr;
  void *buffer_ptr;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;

  v12 = a7;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v55 = MTLGetCompilerOptions(self->_device, a5, self->_compilerFlags, 0, 0);
  v18 = (void *)objc_msgSend(a3, "tileFunction");
  v32 = objc_msgSend(v18, "functionType");
  buffer_ptr = 0;
  size_ptr = 0;
  v19 = dispatch_data_create_map((dispatch_data_t)a4, (const void **)&buffer_ptr, &size_ptr);
  v49 = 0;
  v20 = -[_MTLDevice tileFunctionKeyWithTilePipelineDescriptor:options:keySize:](self->_device, "tileFunctionKeyWithTilePipelineDescriptor:options:keySize:", a3, a5, &v49);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x6812000000;
  v45[3] = __Block_byref_object_copy__1142;
  v45[4] = __Block_byref_object_dispose__1143;
  v45[6] = v20;
  v33 = v20;
  v45[8] = v49;
  v45[7] = 0;
  v45[9] = 0;
  if (a6)
  {
    v21 = dispatch_data_create_map((dispatch_data_t)a6, &v47, &v48);
  }
  else
  {
    v21 = 0;
    v47 = 0;
    v48 = 0;
  }
  object = v21;
  compilerQueue = self->_compilerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke;
  block[3] = &unk_1E0FE47B8;
  block[4] = self;
  block[5] = v18;
  v31 = v18;
  block[6] = a6;
  block[7] = a3;
  block[9] = v45;
  block[10] = &v52;
  block[11] = &v64;
  block[12] = buffer_ptr;
  block[8] = a8;
  v44 = (a5 & 4) != 0;
  dispatch_sync(compilerQueue, block);
  v23 = v65[3];
  if ((a5 & 4) == 0 || v23)
  {
    v25 = *(NSObject **)(v23 + 440);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_2;
    v42[3] = &unk_1E0FE48A8;
    v42[8] = &v64;
    v42[9] = v45;
    v42[4] = a8;
    v42[5] = a11;
    v42[13] = a5;
    v42[14] = v32;
    v42[6] = a3;
    v42[7] = &v68;
    v42[10] = &v56;
    v42[11] = &v60;
    v42[12] = &v52;
    dispatch_sync(v25, v42);
    v36 = 0;
    v37 = &v36;
    v38 = 0x3052000000;
    v39 = __Block_byref_object_copy__10;
    v40 = __Block_byref_object_dispose__10;
    v41 = 0;
    if (a8 || (v26 = 0, *((_BYTE *)v57 + 24)))
      v26 = dispatch_data_create(*(const void **)v69[3], *(_QWORD *)(v69[3] + 16) + *(_QWORD *)(v69[3] + 8), 0, 0);
    v27 = (MTLCompileFunctionRequestData *)objc_opt_new();
    -[MTLCompileFunctionRequestData setSync:](v27, "setSync:", !v12);
    -[MTLCompileFunctionRequestData setFunction:](v27, "setFunction:", v31);
    -[MTLCompileFunctionRequestData setPipelineOptions:](v27, "setPipelineOptions:", a5);
    -[MTLCompileFunctionRequestData setFrameworkData:](v27, "setFrameworkData:", a6);
    -[MTLCompileFunctionRequestData setDriverKeyData:](v27, "setDriverKeyData:", v26);
    -[MTLCompileFunctionRequestData setDestinationBinaryArchive:](v27, "setDestinationBinaryArchive:", a8);
    -[MTLCompileFunctionRequestData setBinaryArchives:](v27, "setBinaryArchives:", objc_msgSend(a3, "binaryArchives"));
    -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v27, "setGpuCompilerSPIOptions:", objc_msgSend(a3, "gpuCompilerSPIOptions"));
    -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v27, "setMaxAccelerationStructureTraversalDepth:", objc_msgSend(a3, "maxAccelerationStructureTraversalDepth"));
    -[MTLCompileFunctionRequestData setAirScript:](v27, "setAirScript:", v19);
    setLinkedFunctionsForRequest(v27, (MTLLinkedFunctions *)objc_msgSend(a3, "linkedFunctions"));
    -[MTLCompiler initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:](self, "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v27, buffer_ptr, 0, 0);
    if (*((_BYTE *)v57 + 24))
    {
      if ((*((_BYTE *)v53 + 25) & 2) != 0)
        v28 = mach_absolute_time();
      else
        v28 = 0;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_3;
      v35[3] = &unk_1E0FE48D0;
      v35[10] = v28;
      v35[11] = v32;
      v35[6] = &v52;
      v35[7] = &v64;
      v35[4] = self;
      v35[5] = a11;
      v35[8] = &v68;
      v35[9] = &v36;
      -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v27, 1, 0, 0, v35, a11);
    }
    else if (*((_BYTE *)v61 + 24))
    {
      dispatch_group_enter(*(dispatch_group_t *)(v69[3] + 40));
      v29 = objc_msgSend(a3, "binaryArchives");
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_4;
      v34[3] = &unk_1E0FE4748;
      v34[4] = &v64;
      v34[5] = &v68;
      -[MTLCompiler reflectionWithFunction:options:sync:binaryArchives:completionHandler:](self, "reflectionWithFunction:options:sync:binaryArchives:completionHandler:", v31, a5, 0, v29, v34);
    }

    if (v26)
      dispatch_release(v26);
    dispatch_release(v19);
    -[_MTLDevice freeTileFunctionKey:keySize:](self->_device, "freeTileFunctionKey:keySize:", v33, v49);
    *a10 = (id)v37[5];
    *a9 = (MTLProgramObject *)v65[3];
    v24 = (VariantEntry *)v69[3];
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    -[_MTLDevice freeTileFunctionKey:keySize:](self->_device, "freeTileFunctionKey:keySize:", v33, v49);
    dispatch_release(v19);
    v24 = 0;
  }
  _Block_object_dispose(v45, 8);
  if (object)
    dispatch_release(object);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  return v24;
}

void __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  RequiredFunctionKeys v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v5 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = objc_msgSend(*(id *)(a1 + 56), "binaryArchives");
  if (v2)
    objc_msgSend(v2, "requiredKeysForFunction:variantKey:frameworkData:compilerOptions:driverCompilerOptions:airScript:archives:compiledNextStageVariant:", v3, v4 + 48, v7, v5, 0, v6, v8, 0);
  else
    memset(&v9, 0, sizeof(v9));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48, &v9, *(unsigned __int8 *)(a1 + 104));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v9);
}

void *__197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_2(uint64_t a1)
{
  void *result;
  unint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  __CFString **v7;
  __CFString *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  result = VariantList<4u>::find<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    result = VariantList<4u>::newVariantEntry<VariantKey>(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(_QWORD *)(a1 + 32))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  if ((*(_BYTE *)(a1 + 106) & 0x40) != 0)
  {
    v3 = *(_QWORD *)(a1 + 112);
    v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v5 = *(void **)(a1 + 40);
    v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "tileFunction"), "name");
    if (v3 <= 8 && ((1 << v3) & 0x186) != 0)
    {
      v7 = MTLPipelinePerformanceKeyVertexShader;
      if (v3 != 1)
        v7 = MTLPipelinePerformanceKeyFragmentShader;
      if (v3 == 8)
        v7 = MTLPipelinePerformanceKeyObjectShader;
      if (v3 == 7)
        v7 = MTLPipelinePerformanceKeyMeshShader;
      v8 = *v7;
      v9 = (id)objc_msgSend(v5, "objectForKey:", *v7);
      if (!v9)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v5, "setObject:forKey:", v9, v8);

      }
    }
    else
    {
      v9 = v5;
    }
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 == 0);
    result = (void *)objc_msgSend(v9, "setObject:forKey:", v10, MTLCompileTimeStatisticsKeyCachedFunction[0]);
    if (v6)
      result = (void *)objc_msgSend(v9, "setObject:forKey:", v6, MTLCompileTimeStatisticsKeyFunctionName[0]);
  }
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) & 1) != 0)
  {
    result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + 432), "objectForKey:", &stru_1E0FE5DC8);
    v11 = result == 0;
  }
  else
  {
    v11 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v11;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (!*(_QWORD *)(v12 + 424))
    {
      result = dispatch_queue_create("reflection Queue", 0);
      *(_QWORD *)(v12 + 424) = result;
    }
  }
  return result;
}

void __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  __CFString **v12;
  __CFString **v13;
  __CFString *v14;
  id v15;
  uint64_t v16;
  __CFString **v17;
  uint64_t v18;
  _QWORD block[7];

  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 25) & 2) != 0)
    v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - *(_QWORD *)(a1 + 80)));
  else
    v4 = 0;
  if (*(_QWORD *)a2)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newTileVariantWithCompilerOutput:pipelineStatisticsOutput:functionType:", *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 72), *(_QWORD *)(a1 + 88));
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 1) != 0)
  {
    v6 = *(_QWORD *)(a2 + 40);
    if (v6)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v8 = *(NSObject **)(v7 + 424);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E0FE2C68;
      block[5] = v6;
      block[6] = v7;
      block[4] = 0;
      dispatch_sync(v8, block);
    }
  }
  VariantEntry::insertVariant(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v5, *(_QWORD *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));

  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 25) & 2) != 0)
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(NSObject **)(a2 + 88);
    v11 = *(_QWORD *)(a1 + 88);
    if (v11 <= 8 && ((1 << v11) & 0x186) != 0)
    {
      v12 = MTLPipelinePerformanceKeyVertexShader;
      if (v11 != 1)
        v12 = MTLPipelinePerformanceKeyFragmentShader;
      if (v11 == 8)
        v12 = MTLPipelinePerformanceKeyObjectShader;
      if (v11 == 7)
        v13 = MTLPipelinePerformanceKeyMeshShader;
      else
        v13 = v12;
      v14 = *v13;
      v15 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *v13);
      if (!v15)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v9, "setObject:forKey:", v15, v14);

      }
      if (v10)
        goto LABEL_23;
    }
    else
    {
      v15 = *(id *)(a1 + 40);
      if (v10)
      {
LABEL_23:
        _MTLAddCompilerServiceCompileTimeStats(v15, v10);
        v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
        v17 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_26:
        objc_msgSend(v15, "setObject:forKey:", v16, *v17);
        goto LABEL_27;
      }
    }
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v17 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_26;
  }
LABEL_27:
  v18 = *(_QWORD *)(a2 + 80);
  if (v18)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v18;
    dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  }
}

void __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[7];

  if (a3)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v8 = *(NSObject **)(v7 + 424);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E0FE2C68;
    block[5] = a3;
    block[6] = v7;
    block[4] = 0;
    dispatch_sync(v8, block);
  }
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  if (!*(_QWORD *)(v9 + 56))
  {
    *(_QWORD *)(v9 + 56) = a2;

    *(_QWORD *)(v9 + 64) = objc_msgSend(a4, "copy");
  }
  dispatch_group_leave(*(dispatch_group_t *)(v9 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
}

- (id)renderPipelineStateWithTileVariant:(VariantEntry *)a3 descriptor:(id)a4 options:(unint64_t)a5 tileProgram:(void *)a6 kernelDriverCompileTimeData:(id)a7 serializedTileDataDescriptor:(id)a8 compileTimeStatistics:(id)a9 reflection:(id *)a10 error:(id *)a11 completionHandler:(id)a12
{
  int v18;
  uint64_t v19;
  OS_dispatch_queue *v20;
  void *v21;
  _QWORD v23[16];
  int v24;
  BOOL v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = 0;
  v18 = MTLGetCompilerOptions(self->_device, a5, self->_compilerFlags, 0, 0);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3052000000;
  v26[3] = __Block_byref_object_copy__10;
  v26[4] = __Block_byref_object_dispose__10;
  v26[5] = a7;
  v19 = objc_msgSend((id)objc_msgSend(a4, "tileFunction"), "functionType");
  v20 = -[_MTLDevice serialQueue](self->_device, "serialQueue");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __195__MTLCompiler_renderPipelineStateWithTileVariant_descriptor_options_tileProgram_kernelDriverCompileTimeData_serializedTileDataDescriptor_compileTimeStatistics_reflection_error_completionHandler___block_invoke;
  v23[3] = &unk_1E0FE48F8;
  v23[10] = a3;
  v23[11] = a11;
  v23[4] = self;
  v23[5] = a4;
  v24 = v18;
  v23[12] = a5;
  v23[13] = a6;
  v23[8] = &v27;
  v23[9] = v26;
  v23[6] = a9;
  v23[7] = a12;
  v25 = a12 != 0;
  v23[14] = v19;
  v23[15] = a10;
  VariantEntry::waitOrNotify((uint64_t)a3, a12 != 0, (dispatch_queue_t)v20, v23);
  v21 = (void *)v28[5];
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  return v21;
}

void __195__MTLCompiler_renderPipelineStateWithTileVariant_descriptor_options_tileProgram_kernelDriverCompileTimeData_serializedTileDataDescriptor_compileTimeStatistics_reflection_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  MTLRenderPipelineReflectionInternal *v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  NSObject *v9;
  id v10;
  void *v11;
  unint64_t i;
  MTLDebugInstrumentationData *v13;
  MTLRenderPipelineReflectionInternal *v14;
  unsigned int v15;
  unint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(v2 + 48);
  if (!v3)
  {
    reportErrorMessage(*(id *)(v2 + 56), *(const __CFString **)(v2 + 64), *(_QWORD *)(a1 + 56), *(_QWORD **)(a1 + 88));
    return;
  }
  v19 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newRenderPipelineWithTileDescriptor:tileVariant:errorMessage:", *(_QWORD *)(a1 + 40), v3, &v19);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    reportErrorMessage((id)2, v19, *(_QWORD *)(a1 + 56), *(_QWORD **)(a1 + 88));
    return;
  }
  if (!*(_QWORD *)(a1 + 96))
  {
    if (!*(_BYTE *)(a1 + 132))
      return;
    v6 = 0;
    goto LABEL_27;
  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pipelineFlagsWithTileVariant:", v3);
  if ((*(_BYTE *)(a1 + 128) & 1) != 0)
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 104) + 432), "objectForKey:", &stru_1E0FE5DC8);
  else
    v5 = 0;
  v6 = -[MTLRenderPipelineReflectionInternal initWithTileData:functionType:device:options:flags:]([MTLRenderPipelineReflectionInternal alloc], "initWithTileData:functionType:device:options:flags:", v5, *(_QWORD *)(a1 + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 96), v4);
  v7 = *(_QWORD *)(a1 + 96);
  if ((v7 & 0x440000) != 0)
  {
    v8 = (NSMutableDictionary *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pipelinePerformanceStatisticsWithTileVariant:compileTimeOutput:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v9 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v9)
    {
      dispatch_release(v9);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = 0;
    }
    if ((*(_BYTE *)(a1 + 98) & 0x40) != 0)
      addDriverCompilerPerformanceData(*(NSMutableDictionary **)(a1 + 48), v8, *(MTLFunctionType *)(a1 + 112));
    -[MTLRenderPipelineReflectionInternal setPerformanceStatistics:](v6, "setPerformanceStatistics:", v8);
    v7 = *(_QWORD *)(a1 + 96);
  }
  if ((v7 & 0x200000) != 0)
  {
    v17 = 0;
    v18 = 0;
    v16 = 0;
    v15 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:stride:forTileVariant:", &v18, &v17, &v16, &v15, v3);
    if (v16)
    {
      -[MTLRenderPipelineReflectionInternal setConstantSamplerDescriptorsFromBitmasks:stride:count:](v6, "setConstantSamplerDescriptorsFromBitmasks:stride:count:", v18, v15);
      v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v11 = (void *)objc_msgSend(v10, "initWithCapacity:", v16);
      if (v16)
      {
        for (i = 0; i < v16; ++i)
          objc_msgSend(v11, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v17 + i)), i);
      }
      -[MTLRenderPipelineReflectionInternal setConstantSamplerUniqueIdentifiers:](v6, "setConstantSamplerUniqueIdentifiers:", v11);

    }
    free(v18);
    free(v17);
    v7 = *(_QWORD *)(a1 + 96);
  }
  if ((v7 & 0x1000000) != 0)
  {
    v13 = -[MTLDebugInstrumentationData initWithData:]([MTLDebugInstrumentationData alloc], "initWithData:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setTileDebugInstrumentationData:", v13);

  }
  if (*(_BYTE *)(a1 + 132))
  {
LABEL_27:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = 0;
LABEL_28:

    return;
  }
  if (v6)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      v14 = v6;
      **(_QWORD **)(a1 + 120) = v6;
      return;
    }
    goto LABEL_28;
  }
}

- (id)newRenderPipelineStateWithTileDescriptorInternal:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 destinationBinaryArchive:(id)a6 error:(id *)a7 completionHandler:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSDictionary *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  VariantEntry *v24;
  uint64_t v25;
  OS_dispatch_queue *v26;
  id v27;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  _QWORD block[7];
  uint64_t v33;
  uint64_t v34;
  void *v35;

  if (_MTLCompilePerformanceStatisticsEnabled())
    v19 = a4 | 0x400000;
  else
    v19 = a4;
  if ((v19 & 0x400000) != 0)
  {
    if (initTimebaseInfo(void)::onceToken != -1)
      dispatch_once(&initTimebaseInfo(void)::onceToken, &__block_literal_global_1135);
    v20 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    _MTLAddCompilePipelinePerformanceStatistics(v20, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesRender);
    if (!a8)
    {
      v21 = mach_absolute_time();
      if (a3)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else
  {
    v20 = 0;
  }
  v21 = 0;
  if (a3)
    goto LABEL_10;
LABEL_24:
  MTLReportFailure(0, "-[MTLCompiler newRenderPipelineStateWithTileDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 19226, (uint64_t)CFSTR("descriptor cannot be null."), v15, v16, v17, v18, v29);
LABEL_10:
  v35 = 0;
  if ((objc_msgSend(a3, "validateWithDevice:error:", self->_device, &v35) & 1) != 0)
  {
    if (a7)
      *a7 = 0;
    v30 = a5;
    v31 = v21;
    if (a8)
      a3 = (id)objc_msgSend(a3, "copy");
    v22 = objc_msgSend(a3, "newSerializedTileDataWithFlags:options:error:", self->_compilerFlags, v19, a7);
    v34 = 0;
    v33 = 0;
    v23 = objc_msgSend(a3, "newPipelineScript");
    v24 = -[MTLCompiler tileVariantEntryWithDescriptor:airDescriptor:options:serializedTileDataDescriptor:asyncCompile:destinationBinaryArchive:tileProgram:kernelDriverCompileTimeData:compileTimeStatistics:](self, "tileVariantEntryWithDescriptor:airDescriptor:options:serializedTileDataDescriptor:asyncCompile:destinationBinaryArchive:tileProgram:kernelDriverCompileTimeData:compileTimeStatistics:", a3, v23, v19, v22, a8 != 0, a6, &v33, &v34, v20);
    if (v24)
    {
      v25 = (uint64_t)v24;
      if (!a6)
      {
        v27 = -[MTLCompiler renderPipelineStateWithTileVariant:descriptor:options:tileProgram:kernelDriverCompileTimeData:serializedTileDataDescriptor:compileTimeStatistics:reflection:error:completionHandler:](self, "renderPipelineStateWithTileVariant:descriptor:options:tileProgram:kernelDriverCompileTimeData:serializedTileDataDescriptor:compileTimeStatistics:reflection:error:completionHandler:", v24, a3, v19, v33, v34, v22, v20, v30, a7, a8);
        if (!v22)
        {
LABEL_28:
          if (a8)
          {

            if (!v20)
              goto LABEL_34;
          }
          else
          {
            if (!v20)
            {
LABEL_34:
              dispatch_release(v23);
              return v27;
            }
            -[NSDictionary setObject:forKey:](v20, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - v31))), MTLCompileTimeStatisticsKeyPipelineTotal[0]);
          }
          _MTLAddCompilePipelinePerformanceStatistics(v20, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesRender);

          goto LABEL_34;
        }
LABEL_27:
        dispatch_release(v22);
        goto LABEL_28;
      }
      v26 = -[_MTLDevice serialQueue](self->_device, "serialQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __132__MTLCompiler_newRenderPipelineStateWithTileDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke;
      block[3] = &unk_1E0FE4300;
      block[4] = a8;
      block[5] = v25;
      block[6] = a7;
      VariantEntry::waitOrNotify(v25, a8 != 0, (dispatch_queue_t)v26, block);
    }
    else
    {
      reportErrorMessage((id)1, CFSTR("MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive."), (uint64_t)a8, a7);
    }
    v27 = 0;
    if (!v22)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (a7)
    *a7 = v35;
  if (v20)

  return 0;
}

_QWORD *__132__MTLCompiler_newRenderPipelineStateWithTileDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[5];
  if (!*(_QWORD *)(v1 + 48))
    return reportErrorMessage(*(id *)(v1 + 56), *(const __CFString **)(v1 + 64), result[4], (_QWORD *)result[6]);
  return result;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7
{
  return -[MTLCompiler newRenderPipelineStateWithTileDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:](self, "newRenderPipelineStateWithTileDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:", a3, a4, a5, 0, a6, a7);
}

- (void)allowLibrariesFromOtherPlatforms
{
  self->_compilerFlags |= 0x80uLL;
}

- (NSString)pluginPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)compilerQueue
{
  return self->_compilerQueue;
}

- (MTLCompilerConnectionManager)compilerConnectionManager
{
  return self->_compilerConnectionManager;
}

- (unsigned)compilerId
{
  return self->_compilerId;
}

- (void).cxx_destruct
{
  std::shared_ptr<MultiLevelAirntBinaryCache>::~shared_ptr[abi:ne180100]((uint64_t)&self->_shaderCache);
}

- (void)generateMachOWithID:binaryEntries:machOSpecializedData:machOType:Path:platform:bitcodeList:completionHandler:
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (char *)v1[1];
      do
      {
        v8 = *((_QWORD *)v6 - 11);
        v6 -= 88;
        v7 = v8;
        if (v8)
          dispatch_release(v7);
        v9 = *((_QWORD *)v4 - 10);
        if (v9)
          dispatch_release(v9);
        v10 = *((_QWORD *)v4 - 9);
        if (v10)
          dispatch_release(v10);
        v11 = *((_QWORD *)v4 - 8);
        if (v11)
          dispatch_release(v11);
        v12 = (void *)*((_QWORD *)v4 - 7);
        if (v12)
        {
          *((_QWORD *)v4 - 6) = v12;
          operator delete(v12);
        }
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

@end
