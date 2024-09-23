@implementation ADNetworkProvider

+ (id)providerForNetwork:(id)a3 requestedLayouts:(id)a4 espressoEngine:(unint64_t)a5
{
  id v7;
  id v8;
  ADNetworkProvider *v9;

  v7 = a3;
  v8 = a4;
  v9 = -[ADNetworkProvider initWithNetwork:requestedLayouts:espressoEngine:]([ADNetworkProvider alloc], "initWithNetwork:requestedLayouts:espressoEngine:", v7, v8, a5);

  return v9;
}

- (id)descriptorForBufferOfType:(id)a3 isInput:(BOOL)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  -[ADNetworkProvider bufferNameForType:isInput:](self, "bufferNameForType:isInput:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADNetworkProvider descriptorForBuffer:isInput:pixelFormat:](self, "descriptorForBuffer:isInput:pixelFormat:", v8, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)descriptorForBuffer:(id)a3 isInput:(BOOL)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BE05FC0];
    if (v6)
      -[ADNetworkProvider supportedSizesForInput:expectedPixelFormat:](self, "supportedSizesForInput:expectedPixelFormat:", v8, v5);
    else
      -[ADNetworkProvider supportedSizesForOutput:expectedPixelFormat:](self, "supportedSizesForOutput:expectedPixelFormat:", v8, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptorForSupportedSizes:pixelFormat:", v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE05FA8], "descriptorWithName:imageDescriptor:isInput:", v8, v12, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bufferNameForType:(id)a3 isInput:(BOOL)a4
{
  uint64_t v4;

  v4 = 32;
  if (a4)
    v4 = 24;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)supportedSizesForInput:(id)a3 expectedPixelFormat:(unsigned int)a4
{
  +[ADNetworkProvider supportedSizesForSizesDict:key:expectedPixelFormat:](ADNetworkProvider, "supportedSizesForSizesDict:key:expectedPixelFormat:", self->_sizesForInput, a3, *(_QWORD *)&a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)supportedSizesForOutput:(id)a3 expectedPixelFormat:(unsigned int)a4
{
  +[ADNetworkProvider supportedSizesForSizesDict:key:expectedPixelFormat:](ADNetworkProvider, "supportedSizesForSizesDict:key:expectedPixelFormat:", self->_sizesForOutput, a3, *(_QWORD *)&a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)layoutNamesDict
{
  return (NSDictionary *)-[ADNetworkProvider generateLayoutNamesDictForFunction:](self, "generateLayoutNamesDictForFunction:", 0);
}

- (ADNetworkProvider)initWithNetwork:(id)a3 requestedLayouts:(id)a4 espressoEngine:(unint64_t)a5
{
  unsigned int v8;
  unsigned int v9;
  ADNetworkProvider *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *inputBufferMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *outputBufferMap;
  ADNetworkProvider *v15;
  void *v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  ADNetworkProvider *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *sizesForInput;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSMutableDictionary *sizesForOutput;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  char v46;
  __CFString **v47;
  char v48;
  char v49;
  char v50;
  char v51;
  int v52;
  __CFString *v53;
  void *v54;
  void *v55;
  NSString *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSURL *url;
  NSURL *v61;
  ADNetworkProvider *v62;
  double v63;
  double v64;
  int v65;
  double v66;
  uint64_t v67;
  NSDictionary *layoutNamesDict;
  id v69;
  ADNetworkProvider *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  void *v80;
  ADConfidenceLevelRanges *confidenceLevelRanges;
  void *v82;
  void *v83;
  _BOOL4 v84;
  void *v85;
  float v86;
  float v87;
  void *v88;
  float v89;
  float v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  NSObject *v97;
  const char *v98;
  double v100;
  uint64_t v101;
  ADConfidenceLevelRanges *v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  NSString *v118;
  unsigned int v119;
  NSString *v120;
  double v121;
  NSString *v122;
  NSString *v123;
  id v124;
  double v125;
  id obj;
  id obja;
  void *v128;
  ADNetworkProvider *v129;
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
  objc_super v146;
  uint8_t buf[4];
  double v148;
  __int16 v149;
  double v150;
  __int16 v151;
  double v152;
  __int16 v153;
  double v154;
  __int16 v155;
  double v156;
  __int16 v157;
  double v158;
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x24BDAC8D0];
  v125 = COERCE_DOUBLE(a3);
  v124 = a4;
  v8 = objc_msgSend(MEMORY[0x24BE086D8], "hasANE");
  if (a5 - 3 < 2)
    v9 = v8;
  else
    v9 = 0;
  if (!ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v148 = v125;
      v149 = 1024;
      LODWORD(v150) = v9;
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "creating network provider for %@. precompiled model allowed: %d", buf, 0x12u);
      if (v125 == 0.0)
        goto LABEL_7;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
LABEL_11:
    if (v125 == 0.0)
      goto LABEL_7;
    goto LABEL_12;
  }
  *(_DWORD *)buf = 138412546;
  v148 = v125;
  v149 = 1024;
  LODWORD(v150) = v9;
  _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "creating network provider for %@. precompiled model allowed: %d", buf, 0x12u);
  if (v125 == 0.0)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "unable to initialize network provider: nil network name", buf, 2u);
    }
    v10 = 0;
    goto LABEL_123;
  }
LABEL_12:
  v119 = v9;
  v11 = (NSMutableDictionary *)objc_opt_new();
  inputBufferMap = self->_inputBufferMap;
  self->_inputBufferMap = v11;

  v13 = (NSMutableDictionary *)objc_opt_new();
  outputBufferMap = self->_outputBufferMap;
  self->_outputBufferMap = v13;

  v146.receiver = self;
  v146.super_class = (Class)ADNetworkProvider;
  v15 = -[ADNetworkProvider init](&v146, sel_init);
  if (!v15)
    goto LABEL_122;
  v129 = v15;
  +[ADNetworkProvider getDefaultPathForNetwork:allowPrecompiledModel:](ADNetworkProvider, "getDefaultPathForNetwork:allowPrecompiledModel:", *(_QWORD *)&v125, v9);
  v122 = (NSString *)objc_claimAutoreleasedReturnValue();
  +[ADNetworkProvider getAlternativePathForNetwork:](ADNetworkProvider, "getAlternativePathForNetwork:", *(_QWORD *)&v125);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByResolvingSymlinksInPath](v122, "stringByResolvingSymlinksInPath");
  v17 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  objc_msgSend(v16, "stringByResolvingSymlinksInPath");
  v121 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v148 = v17;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "found default network path: %@", buf, 0xCu);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v148 = v17;
    _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "found default network path: %@", buf, 0xCu);
  }
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
LABEL_17:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v148 = v121;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "found alternative network path: %@", buf, 0xCu);
    }
    goto LABEL_22;
  }
LABEL_20:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v148 = v121;
    _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "found alternative network path: %@", buf, 0xCu);
  }
LABEL_22:
  v18 = *(id *)&v17;
  v19 = v18;
  v123 = (NSString *)v18;
  if (v121 != 0.0)
  {
    *(double *)&v120 = COERCE_DOUBLE(*(id *)&v121);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "--- WARNING: Using alternative network path, which is not inside AppleDepth framework ---", buf, 2u);
    }
    v20 = v125;
    v21 = v129;
LABEL_27:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v148 = *(double *)&v120;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "found network path: %@", buf, 0xCu);
    }
    findNetworkSupportingFile(CFSTR("compilation_arguments.plist"), v120, *(NSString **)&v121, v123);
    v118 = (NSString *)objc_claimAutoreleasedReturnValue();
    findNetworkSupportingFile(CFSTR("model.json"), v120, *(NSString **)&v121, v123);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:");
    v22 = objc_claimAutoreleasedReturnValue();
    v117 = (void *)v22;
    if (!v22)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v148 = v20;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "could not find json file for requested model %{public}@", buf, 0xCu);
      }
      v65 = 1;
LABEL_120:

      v15 = v129;
      if (v65)
      {
        v10 = 0;
        self = v129;
        goto LABEL_123;
      }
LABEL_122:
      self = v15;
      v10 = self;
      goto LABEL_123;
    }
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v22, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v23;
    if (!v23)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "could not read network metadata ", buf, 2u);
      }
      v65 = 1;
      goto LABEL_119;
    }
    objc_storeStrong((id *)&v21->_networkMetadata, v23);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    sizesForInput = v129->_sizesForInput;
    v129->_sizesForInput = (NSMutableDictionary *)v24;

    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("inputs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v162, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v143;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v143 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
          objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("inputs"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("DType"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v129->_inputBufferMap, "setObject:forKeyedSubscript:", v30, v33);
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Shape"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[ADNetworkProvider updateSizeForItem:fromShape:forLayout:target:](ADNetworkProvider, "updateSizeForItem:fromShape:forLayout:target:", v30, v34, 255, v129->_sizesForInput);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v162, 16);
      }
      while (v27);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v35 = objc_claimAutoreleasedReturnValue();
    sizesForOutput = v129->_sizesForOutput;
    v129->_sizesForOutput = (NSMutableDictionary *)v35;

    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("outputs"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "allKeys");
    obja = (id)objc_claimAutoreleasedReturnValue();

    v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v138, v161, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v139;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v139 != v39)
            objc_enumerationMutation(obja);
          v41 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j);
          objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("outputs"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("DType"));
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (v44)
          {
            v46 = -[__CFString isEqualToString:](v44, "isEqualToString:", kADEspressoBufferIDAleatoricUncertainty);
            v47 = kADEspressoBufferIDConfidence;
            if ((v46 & 1) != 0)
              goto LABEL_52;
            v48 = -[__CFString isEqualToString:](v45, "isEqualToString:", kADEspressoBufferIDSTDUncertainty);
            v47 = kADEspressoBufferIDConfidence;
            if ((v48 & 1) != 0)
              goto LABEL_52;
            v49 = -[__CFString isEqualToString:](v45, "isEqualToString:", kADEspressoBufferIDLogarithmicVariance);
            v47 = kADEspressoBufferIDConfidence;
            if ((v49 & 1) != 0
              || (v50 = -[__CFString isEqualToString:](v45, "isEqualToString:", kADEspressoBufferIDAuxiliaryAleatoricUncertainty), v47 = kADEspressoBufferIDAuxiliaryConfidence, (v50 & 1) != 0)|| (v51 = -[__CFString isEqualToString:](v45, "isEqualToString:", kADEspressoBufferIDAuxiliaryLogarithmicVariance), v47 = kADEspressoBufferIDAuxiliaryConfidence, (v51 & 1) != 0)|| (v52 = -[__CFString isEqualToString:](v45, "isEqualToString:", kADEspressoBufferIDAuxiliarySTDUncertainty), v47 = kADEspressoBufferIDAuxiliaryConfidence, v52))
            {
LABEL_52:
              v53 = *v47;

              v45 = v53;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v129->_outputBufferMap, "setObject:forKeyedSubscript:", v41, v45);
          }
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Shape"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          +[ADNetworkProvider updateSizeForItem:fromShape:forLayout:target:](ADNetworkProvider, "updateSizeForItem:fromShape:forLayout:target:", v41, v54, 255, v129->_sizesForOutput);

        }
        v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v138, v161, 16);
      }
      while (v38);
    }

    +[ADNetworkProvider getConfigFolderForNetwork:](ADNetworkProvider, "getConfigFolderForNetwork:", *(_QWORD *)&v125);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringByAppendingString:", CFSTR("__precompiled"));
    v56 = (NSString *)objc_claimAutoreleasedReturnValue();

    v57 = (void *)MEMORY[0x24BDBCF48];
    bundleE5mlIfNeeded(v120, v56, v118, v119);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "URLWithString:", v58);
    v59 = objc_claimAutoreleasedReturnValue();
    url = v129->_url;
    v129->_url = (NSURL *)v59;

    v61 = v129->_url;
    if (!v61)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "could not compile network as requested", buf, 2u);
      }
LABEL_113:
      v65 = 1;
      goto LABEL_118;
    }
    v62 = v129;
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_61;
      -[NSURL absoluteString](v61, "absoluteString");
      v63 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412290;
      v148 = v63;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "chosen network path: %@", buf, 0xCu);

    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        goto LABEL_75;
      -[NSURL absoluteString](v61, "absoluteString");
      v114 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412290;
      v148 = v114;
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "chosen network path: %@", buf, 0xCu);

    }
    v62 = v129;
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
LABEL_61:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v64 = *(double *)&v62->_inputBufferMap;
        *(_DWORD *)buf = 138412290;
        v148 = v64;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "network input map: %@", buf, 0xCu);
      }
      goto LABEL_77;
    }
LABEL_75:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v100 = *(double *)&v62->_inputBufferMap;
      *(_DWORD *)buf = 138412290;
      v148 = v100;
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "network input map: %@", buf, 0xCu);
    }
LABEL_77:
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v66 = *(double *)&v62->_outputBufferMap;
        *(_DWORD *)buf = 138412290;
        v148 = v66;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "network output map: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v115 = *(double *)&v62->_outputBufferMap;
      *(_DWORD *)buf = 138412290;
      v148 = v115;
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "network output map: %@", buf, 0xCu);
    }
    v67 = objc_opt_new();
    layoutNamesDict = v62->_layoutNamesDict;
    v62->_layoutNamesDict = (NSDictionary *)v67;

    if (v124)
    {
      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      v69 = v124;
      v70 = v129;
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v134, v160, 16);
      if (v71)
      {
        v72 = *(_QWORD *)v135;
        while (2)
        {
          for (k = 0; k != v71; ++k)
          {
            if (*(_QWORD *)v135 != v72)
              objc_enumerationMutation(v69);
            v74 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * k);
            objc_msgSend(v69, "objectForKeyedSubscript:", v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v74) = -[ADNetworkProvider processConfig:inDictionary:forLayout:](v70, "processConfig:inDictionary:forLayout:", v75, v128, objc_msgSend(v74, "integerValue"));

            if ((v74 & 1) == 0)
            {

              goto LABEL_113;
            }
            v70 = v129;
          }
          v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v134, v160, 16);
          if (v71)
            continue;
          break;
        }
      }
    }
    else
    {
      v132 = 0u;
      v133 = 0u;
      v130 = 0u;
      v131 = 0u;
      objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("configurations"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "allKeys");
      v69 = (id)objc_claimAutoreleasedReturnValue();

      v77 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v130, v159, 16);
      if (v77)
      {
        v78 = *(_QWORD *)v131;
        while (2)
        {
          for (m = 0; m != v77; ++m)
          {
            if (*(_QWORD *)v131 != v78)
              objc_enumerationMutation(v69);
            if (!-[ADNetworkProvider processConfig:inDictionary:forLayout:](v129, "processConfig:inDictionary:forLayout:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * m), v128, 254))
            {

              goto LABEL_113;
            }
          }
          v77 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v130, v159, 16);
          if (v77)
            continue;
          break;
        }
      }
    }

    objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("confidence_thresholds_for_bucketing"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v65 = 0;
      confidenceLevelRanges = v129->_confidenceLevelRanges;
      v129->_confidenceLevelRanges = 0;
LABEL_117:

LABEL_118:
LABEL_119:

      goto LABEL_120;
    }
    confidenceLevelRanges = v80;
    -[ADConfidenceLevelRanges objectForKeyedSubscript:](confidenceLevelRanges, "objectForKeyedSubscript:", CFSTR("low"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v82
      || (-[ADConfidenceLevelRanges objectForKeyedSubscript:](confidenceLevelRanges, "objectForKeyedSubscript:", CFSTR("high")), v83 = (void *)objc_claimAutoreleasedReturnValue(), v84 = v83 == 0, v83, v82, v84))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
LABEL_116:
        v65 = 1;
        goto LABEL_117;
      }
      *(_WORD *)buf = 0;
      v97 = MEMORY[0x24BDACB70];
      v98 = "network provides confidence threshold suggestion but no high/low thresholds found";
    }
    else
    {
      -[ADConfidenceLevelRanges objectForKeyedSubscript:](confidenceLevelRanges, "objectForKeyedSubscript:", CFSTR("low"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "floatValue");
      v87 = v86;

      -[ADConfidenceLevelRanges objectForKeyedSubscript:](confidenceLevelRanges, "objectForKeyedSubscript:", CFSTR("high"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "floatValue");
      v90 = v89;

      if (v87 < 0.0 || v90 < 0.0)
      {
        LODWORD(v91) = 2139095040;
        LODWORD(v96) = -8388608;
        *(float *)&v92 = v90;
        *(float *)&v93 = v90;
        *(float *)&v94 = v87;
        *(float *)&v95 = v87;
        +[ADConfidenceLevelRanges rangesForUnits:lowLevel:mediumLevel:highLevel:](ADConfidenceLevelRanges, "rangesForUnits:lowLevel:mediumLevel:highLevel:", 3, v91, v92, v93, v94, v95, v96);
        v101 = objc_claimAutoreleasedReturnValue();
        v102 = v129->_confidenceLevelRanges;
        v129->_confidenceLevelRanges = (ADConfidenceLevelRanges *)v101;

        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          -[ADConfidenceLevelRanges lowLevel](v129->_confidenceLevelRanges, "lowLevel");
          v104 = v103;
          -[ADConfidenceLevelRanges lowLevel](v129->_confidenceLevelRanges, "lowLevel");
          v106 = v105;
          -[ADConfidenceLevelRanges mediumLevel](v129->_confidenceLevelRanges, "mediumLevel");
          v108 = v107;
          -[ADConfidenceLevelRanges mediumLevel](v129->_confidenceLevelRanges, "mediumLevel");
          v110 = v109;
          -[ADConfidenceLevelRanges highLevel](v129->_confidenceLevelRanges, "highLevel");
          v112 = v111;
          -[ADConfidenceLevelRanges highLevel](v129->_confidenceLevelRanges, "highLevel");
          *(_DWORD *)buf = 134219264;
          v148 = v104;
          v149 = 2048;
          v150 = v106;
          v151 = 2048;
          v152 = v108;
          v153 = 2048;
          v154 = v110;
          v155 = 2048;
          v156 = v112;
          v157 = 2048;
          v158 = v113;
          _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "network confidence threshold ranges: (%.3f,%.3f), (%.3f,%.3f), (%.3f,%.3f)", buf, 0x3Eu);
        }
        v65 = 0;
        goto LABEL_117;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_116;
      *(_WORD *)buf = 0;
      v97 = MEMORY[0x24BDACB70];
      v98 = "unable to support confidence threshold for non aleatoric uncertainty models";
    }
    _os_log_error_impl(&dword_20B62B000, v97, OS_LOG_TYPE_ERROR, v98, buf, 2u);
    goto LABEL_116;
  }
  v120 = (NSString *)v18;
  v20 = v125;
  v21 = v129;
  if (v18)
    goto LABEL_27;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v148 = v125;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "could not find network files for requested model:%{public}@", buf, 0xCu);
  }
  v10 = 0;
  self = v129;
LABEL_123:

  return v10;
}

+ (BOOL)getAndVerifySizesFromConfig:(id)a3 inDictionary:(id)a4 forKey:(id)a5 sizes:(id)a6 layout:(unint64_t *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  uint64_t v43;
  void *v44;
  void *v45;
  id obj;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v47 = a6;
  v44 = v12;
  v45 = v11;
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v16;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  v43 = v17;
  if (v17)
  {
    v18 = 0;
    v19 = *(_QWORD *)v49;
    v20 = v17;
    while (1)
    {
      if (*(_QWORD *)v49 != v19)
        objc_enumerationMutation(obj);
      v21 = **((_QWORD **)&v48 + 1);
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Shape"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "objectAtIndexedSubscript:", 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatValue");
      v27 = v26;
      objc_msgSend(v24, "objectAtIndexedSubscript:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v30 = v29;

      v31 = *a7;
      if (*a7 == 254)
        v31 = objc_msgSend(MEMORY[0x24BE05FF0], "layoutForSize:", v27, v30);
      if ((v18 & 1) != 0)
      {
        if (v31 != *a7)
          goto LABEL_20;
      }
      else
      {
        *a7 = v31;
      }
      +[ADNetworkProvider updateSizeForItem:fromShape:forLayout:target:](ADNetworkProvider, "updateSizeForItem:fromShape:forLayout:target:", v21, v24);

      if (v20 >= 2)
        break;
LABEL_18:
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      v18 = 1;
      if (!v20)
        goto LABEL_24;
    }
    v32 = 1;
    while (1)
    {
      if (*(_QWORD *)v49 != v19)
        objc_enumerationMutation(obj);
      v33 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v32);
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Shape"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "objectAtIndexedSubscript:", 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      v38 = v37;
      objc_msgSend(v24, "objectAtIndexedSubscript:", 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v41 = v40;

      if (*a7 == 254 && objc_msgSend(MEMORY[0x24BE05FF0], "layoutForSize:", v38, v41) != *a7)
        break;
      +[ADNetworkProvider updateSizeForItem:fromShape:forLayout:target:](ADNetworkProvider, "updateSizeForItem:fromShape:forLayout:target:", v33, v24);

      if (v20 == ++v32)
        goto LABEL_18;
    }
LABEL_20:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v53 = v13;
      v54 = 2112;
      v55 = v45;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Network %{public}@ dimensions are not the same layout for configuration: %@", buf, 0x16u);
    }

    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
LABEL_24:

  return (v43 != 0) & v18;
}

+ (id)supportedSizesForSizesDict:(id)a3 key:(id)a4 expectedPixelFormat:(unsigned int)a5
{
  PixelBufferUtils *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  double v23;
  unint64_t j;
  void *v25;
  float v26;
  float v27;
  void *v28;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v5 = *(PixelBufferUtils **)&a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v31 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v30, "objectForKeyedSubscript:", v31);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntValue");

        v17 = 1.0;
        if (objc_msgSend(v13, "count") != 1)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "floatValue");
          v17 = v19;

        }
        objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v22 = v21;

        v23 = v17;
        if (PixelBufferUtils::componentsPerPixelForPixelFormat(v5, 0) == 1
          && (unint64_t)PixelBufferUtils::planeCountForPixelFormat(v5) <= 1
          && (unint64_t)objc_msgSend(v13, "count") >= 3)
        {
          for (j = 0; j < objc_msgSend(v13, "count") - 2; ++j)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", j);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "floatValue");
            v27 = v26;

            v23 = v23 * v27;
          }
        }
        objc_msgSend(MEMORY[0x24BE05FC8], "createWithSize:andLayout:", v16, v22, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v28);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }

  return v7;
}

+ (void)updateSizeForItem:(id)a3 fromShape:(id)a4 forLayout:(unint64_t)a5 target:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v9);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v16);

}

- (BOOL)processConfig:(id)a3 inDictionary:(id)a4 forLayout:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  NSDictionary *layoutNamesDict;
  void *v12;
  void *v13;
  id v14;
  NSDictionary *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSDictionary *v20;
  void *v21;
  unint64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v22 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("configurations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "network does not have a configuration called %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "network supports layout for: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "network supports layout for: %@", buf, 0xCu);
  }
  if (!+[ADNetworkProvider getAndVerifySizesFromConfig:inDictionary:forKey:sizes:layout:](ADNetworkProvider, "getAndVerifySizesFromConfig:inDictionary:forKey:sizes:layout:", v8, v9, CFSTR("inputs"), self->_sizesForInput, &v22)|| !+[ADNetworkProvider getAndVerifySizesFromConfig:inDictionary:forKey:sizes:layout:](ADNetworkProvider, "getAndVerifySizesFromConfig:inDictionary:forKey:sizes:layout:", v8, v9, CFSTR("outputs"), self->_sizesForOutput, &v22))
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  layoutNamesDict = self->_layoutNamesDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](layoutNamesDict, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(layoutNamesDict) = v13 == 0;

  if ((layoutNamesDict & 1) != 0)
  {
    v20 = self->_layoutNamesDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v8, v21);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BE05FF0], "layoutAsString:", v22);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = self->_layoutNamesDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v14;
    v25 = 2114;
    v26 = v8;
    v27 = 2114;
    v28 = v17;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "multiple configurations defined for layout %{public}@ (found %{public}@, but only %{public}@ will be used)", buf, 0x20u);

  }
  v18 = 1;
LABEL_15:

  return v18;
}

+ (id)getConfigFolderForNetwork:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ADDeviceConfiguration stringForKey:](ADDeviceConfiguration, "stringForKey:", kADDeviceConfigurationKeyModelConfigurationFolder);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getAlternativePathForNetwork:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  +[ADNetworkProvider getConfigFolderForNetwork:](ADNetworkProvider, "getConfigFolderForNetwork:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v3;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "looking for configuration folder at: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "looking for configuration folder at: %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "fileExistsAtPath:", v3) & 1) != 0)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "configuration folder found", buf, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "configuration folder found", buf, 2u);
      }
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", v3, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v4 = 0;
        v7 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v16 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_msgSend(v3, "stringByAppendingPathComponent:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "pathExtension");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v11, "isEqualToString:", CFSTR("net")) & 1) != 0
              || (objc_msgSend(v11, "isEqualToString:", CFSTR("bundle")) & 1) != 0
              || objc_msgSend(v11, "isEqualToString:", CFSTR("mil")))
            {
              if (v4)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "model selection ambiguous: found multiple models in configuration folder", buf, 2u);
                }

                goto LABEL_34;
              }
              v4 = v10;
            }

          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v6)
            continue;
          break;
        }

        if (v4)
          goto LABEL_35;
      }
      else
      {

      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "could not find required model file in configuration folder", buf, 2u);
      }
    }
LABEL_34:
    v4 = 0;
LABEL_35:

    goto LABEL_36;
  }
  v4 = 0;
LABEL_36:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceLevelRanges, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_layoutNamesDict, 0);
  objc_storeStrong((id *)&self->_networkMetadata, 0);
  objc_storeStrong((id *)&self->_outputBufferMap, 0);
  objc_storeStrong((id *)&self->_inputBufferMap, 0);
  objc_storeStrong((id *)&self->_sizesForOutput, 0);
  objc_storeStrong((id *)&self->_sizesForInput, 0);
}

- (id)metadataForKey:(id)a3
{
  id v4;
  NSDictionary *networkMetadata;
  void *v6;

  v4 = a3;
  networkMetadata = self->_networkMetadata;
  if (networkMetadata)
  {
    -[NSDictionary objectForKeyedSubscript:](networkMetadata, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)providerForNetwork:(id)a3
{
  +[ADNetworkProvider providerForNetwork:requestedLayouts:](ADNetworkProvider, "providerForNetwork:requestedLayouts:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)providerForNetwork:(id)a3 requestedLayouts:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
    v7 = 4;
  else
    v7 = 0;
  +[ADNetworkProvider providerForNetwork:requestedLayouts:espressoEngine:](ADNetworkProvider, "providerForNetwork:requestedLayouts:espressoEngine:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getDefaultPathForNetwork:(id)a3 allowPrecompiledModel:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  __int128 *p_buf;
  NSString *v12;
  void *v13;
  id v14;
  int v15;
  size_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  void **p_p;
  uint64_t v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *__p;
  size_t __n;
  unsigned __int8 v31;
  __int128 buf;
  unsigned __int8 v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v5 = (NSString *)a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (!v4)
    {
      v10 = 0;
      v12 = 0;
      v14 = 0;
      goto LABEL_39;
    }
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "resourcePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/MLModels"), v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    ADCommonUtils::runtimePlatformANEProductString(&buf);
    if ((v33 & 0x80u) == 0)
      p_buf = &buf;
    else
      p_buf = (__int128 *)buf;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%s"), v5, p_buf);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    findModel(v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v13;
      v15 = 1;
LABEL_35:
      if (((char)v33 & 0x80000000) == 0)
      {
        if (!v15)
          goto LABEL_39;
LABEL_45:

        goto LABEL_46;
      }
      operator delete((void *)buf);
      if (v15)
        goto LABEL_45;
LABEL_39:
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "resourcePath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@/MLModels/NonPrecompiled"), v25);
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();

      findModel(v26, v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v14 = v27;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v5;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not find model for \"%{public}@\", (uint8_t *)&buf, 0xCu);
        }
        v14 = 0;
      }
      v10 = v26;
      goto LABEL_45;
    }
    ADCommonUtils::runtimePlatformANEVersionString(&__p);
    if ((v31 & 0x80u) == 0)
      v16 = v31;
    else
      v16 = __n;
    v17 = v33;
    if ((v33 & 0x80u) != 0)
      v17 = *((_QWORD *)&buf + 1);
    if (v16 != v17)
      goto LABEL_27;
    if ((v33 & 0x80u) == 0)
      v18 = (unsigned __int8 *)&buf;
    else
      v18 = (unsigned __int8 *)buf;
    if ((v31 & 0x80) != 0)
    {
      v21 = __p;
      if (memcmp(__p, v18, __n))
      {
LABEL_30:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%s"), v5, v21);
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();

        findModel(v10, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v14 = v23;
          v15 = 1;
        }
        else
        {
          v15 = 0;
          v14 = 0;
        }
        v12 = v22;
        if (((char)v31 & 0x80000000) == 0)
          goto LABEL_35;
LABEL_34:
        operator delete(__p);
        goto LABEL_35;
      }
    }
    else if (v31)
    {
      p_p = &__p;
      v20 = v31;
      while (*(unsigned __int8 *)p_p == *v18)
      {
        p_p = (void **)((char *)p_p + 1);
        ++v18;
        if (!--v20)
          goto LABEL_48;
      }
LABEL_27:
      if ((v31 & 0x80u) == 0)
        v21 = &__p;
      else
        v21 = __p;
      goto LABEL_30;
    }
LABEL_48:
    v15 = 0;
    v14 = 0;
    if (((char)v31 & 0x80000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed getting AppleDepth bundle", (uint8_t *)&buf, 2u);
  }
  v14 = 0;
LABEL_46:

  return v14;
}

- (id)generateLayoutNamesDictForFunction:(id)a3
{
  void *v4;
  int v5;
  NSDictionary *v6;
  NSDictionary *layoutNamesDict;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  -[NSURL absoluteString](self->_url, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR(".net"));

  if (v5)
  {
    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Using functions/heads for v1 networks is not supported", buf, 2u);
      }
      v6 = 0;
    }
    else
    {
      v6 = self->_layoutNamesDict;
    }
  }
  else
  {
    v6 = (NSDictionary *)objc_opt_new();
    layoutNamesDict = self->_layoutNamesDict;
    if (v17)
    {
      if (-[NSDictionary count](layoutNamesDict, "count"))
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[NSDictionary allKeys](self->_layoutNamesDict, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v19 != v10)
                objc_enumerationMutation(v8);
              v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              -[NSDictionary objectForKeyedSubscript:](self->_layoutNamesDict, "objectForKeyedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("_%@"), v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v14, v12);

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          }
          while (v9);
        }

      }
      else
      {
        -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v17, &unk_24C434EA8);
      }
    }
    else
    {
      v15 = (NSDictionary *)-[NSDictionary mutableCopy](layoutNamesDict, "mutableCopy");

      v6 = v15;
      -[NSDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", CFSTR("main"), &unk_24C434EA8);
    }
  }

  return v6;
}

- (id)bufferNameForInputType:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_inputBufferMap, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bufferNameForOutputType:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputBufferMap, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)layoutNamesDictForFunction:(id)a3
{
  -[ADNetworkProvider generateLayoutNamesDictForFunction:](self, "generateLayoutNamesDictForFunction:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ADConfidenceLevelRanges)confidenceLevelRanges
{
  return self->_confidenceLevelRanges;
}

+ (id)providerForNetwork:(id)a3 espressoEngine:(unint64_t)a4
{
  +[ADNetworkProvider providerForNetwork:requestedLayouts:espressoEngine:](ADNetworkProvider, "providerForNetwork:requestedLayouts:espressoEngine:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
