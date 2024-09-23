@implementation MLCInferenceGraph

+ (MLCInferenceGraph)graphWithGraphObjects:(NSArray *)graphObjects
{
  NSArray *v4;
  void *v5;

  v4 = graphObjects;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraphObjects:", v4);

  return (MLCInferenceGraph *)v5;
}

- (MLCInferenceGraph)initWithGraphObjects:(id)a3
{
  MLCInferenceGraph *v3;
  MLCInferenceGraph *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLCInferenceGraph;
  v3 = -[MLCGraph initWithGraphObjects:](&v7, sel_initWithGraphObjects_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_inferenceNodeInit = 0;
    -[MLCGraph graphLayerList](v3, "graphLayerList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_inferenceNodeIndexInGraphLayerList = objc_msgSend(v5, "count");

  }
  return v4;
}

- (id)splitWithSource:(id)a3 splitCount:(unint64_t)a4 dimension:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  +[MLCSplitLayer layerWithSplitCount:dimension:](MLCSplitLayer, "layerWithSplitCount:dimension:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph nodeWithMultiOutputLayer:source:forTraining:](self, "nodeWithMultiOutputLayer:source:forTraining:", v9, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)splitWithSource:(id)a3 splitSectionLengths:(id)a4 dimension:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  +[MLCSplitLayer layerWithSplitSectionLengths:dimension:](MLCSplitLayer, "layerWithSplitSectionLengths:dimension:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph nodeWithMultiOutputLayer:source:forTraining:](self, "nodeWithMultiOutputLayer:source:forTraining:", v9, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)concatenateWithSources:(id)a3 dimension:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCInferenceGraph concatenateWithSources:dimension:].cold.1(a2);
    goto LABEL_14;
  }
  if (a4 - 4 < 0xFFFFFFFFFFFFFFFDLL)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCInferenceGraph concatenateWithSources:dimension:].cold.2(a2);
LABEL_14:

    v12 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      if (++v9 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_11;
    }
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MLCInferenceGraph concatenateWithSources:dimension:].cold.3(a2);
    goto LABEL_14;
  }
LABEL_11:
  +[MLCConcatenationLayer layerWithDimension:](MLCConcatenationLayer, "layerWithDimension:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCInferenceGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v12;
}

- (id)reshapeWithShape:(id)a3 source:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[MLCReshapeLayer layerWithShape:](MLCReshapeLayer, "layerWithShape:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCInferenceGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)transposeWithDimensions:(id)a3 source:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[MLCTransposeLayer layerWithDimensions:](MLCTransposeLayer, "layerWithDimensions:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCInferenceGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)nodeWithLayer:(id)a3 source:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCInferenceGraph nodeWithLayer:sources:](self, "nodeWithLayer:sources:", v8, v9, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)nodeWithLayer:(id)a3 sources:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[MLCGraph nodeWithLayer:sources:forTraining:](self, "nodeWithLayer:sources:forTraining:", v6, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setCompileForInferenceOnly:", 1);
    if (!-[MLCInferenceGraph inferenceNodeInit](self, "inferenceNodeInit"))
    {
      -[MLCInferenceGraph setInferenceNodeInit:](self, "setInferenceNodeInit:", 1);
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCInferenceGraph setInferenceNodeIndexInGraphLayerList:](self, "setInferenceNodeIndexInGraphLayerList:", objc_msgSend(v8, "count") - 1);

    }
  }

  return v7;
}

- (BOOL)recompileWithOptions:(unint64_t)a3
{
  char v3;
  unint64_t v6;
  _BOOL8 v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  os_signpost_id_t spid;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  if ((-[MLCGraph compilerOptions](self, "compilerOptions") & 1) != 0
    || (-[MLCGraph compilerOptions](self, "compilerOptions") & 2) != 0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v6 = -[MLCGraph compilerOptions](self, "compilerOptions");
    v7 = (v6 >> 2) & 1;
    if ((v6 & 4) != 0)
    {
      if ((v3 & 4) != 0)
      {
        +[MLCLog execution](MLCLog, "execution");
        v10 = objc_claimAutoreleasedReturnValue();
        v8 = os_signpost_id_generate(v10);

      }
      else
      {
        v8 = 0;
      }
      +[MLCLog execution](MLCLog, "execution");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = v8 - 1;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecompileInferenceGraph", (const char *)&unk_1D4ABD322, buf, 2u);
      }
      spid = v8;

      -[MLCGraph device](self, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "computeEngine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCGraph graphLayerList](self, "graphLayerList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fuseLayersForInferenceGraph:startAtLayerIndex:", v16, -[MLCInferenceGraph inferenceNodeIndexInGraphLayerList](self, "inferenceNodeIndexInGraphLayerList"));

      -[MLCGraph graphLayerList](self, "graphLayerList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v19 = 0;
        v20 = 0;
        while (1)
        {
          -[MLCGraph graphLayerList](self, "graphLayerList");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v22, "skipLayer") & 1) == 0)
          {
            objc_msgSend(v22, "fusedLayers");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v23, "count"))
              goto LABEL_19;
            v24 = objc_msgSend(v22, "compileForInferenceOnly");

            if (v24)
              break;
          }
LABEL_20:

          ++v19;
          -[MLCGraph graphLayerList](self, "graphLayerList");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          if (v19 >= v29)
            goto LABEL_23;
        }
        ++v20;
        objc_msgSend(v22, "device");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceTensors");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "resultTensors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "compileForDevice:sourceTensors:resultTensor:", v23, v25, v27);

LABEL_19:
        goto LABEL_20;
      }
      v20 = 0;
LABEL_23:
      +[MLCLog execution](MLCLog, "execution");
      v30 = objc_claimAutoreleasedReturnValue();
      v9 = v30;
      if (v13 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 134349056;
        v34 = v20;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v9, OS_SIGNPOST_INTERVAL_END, spid, "RecompileInferenceGraph", "%{public,name=LayersRecompiled}lu", buf, 0xCu);
      }
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph recompileWithOptions:].cold.1(a2);
    }

  }
  return v7;
}

- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device
{
  return -[MLCInferenceGraph compileWithOptions:device:inputTensors:inputTensorsData:](self, "compileWithOptions:device:inputTensors:inputTensorsData:", options, device, 0, 0);
}

- (BOOL)compileWithOptions:(MLCGraphCompilationOptions)options device:(MLCDevice *)device inputTensors:(NSDictionary *)inputTensors inputTensorsData:(NSDictionary *)inputTensorsData
{
  MLCDevice *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  NSObject *v13;
  BOOL v14;
  MLCDevice *v15;
  uint64_t v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDictionary *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  MLCInferenceGraph *v72;
  unint64_t v73;
  void *v74;
  unint64_t v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  unint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  char v99;
  MLCDevice *v100;
  NSObject *p_super;
  NSObject *v102;
  char isKindOfClass;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  char v109;
  void *v110;
  uint64_t v111;
  unint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  unint64_t v116;
  void *v117;
  unint64_t v118;
  void *v119;
  char v120;
  void *v121;
  char v122;
  void *v123;
  char v124;
  void *v125;
  void *v126;
  void *v127;
  char v128;
  void *v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  NSObject *v133;
  NSObject *v134;
  NSObject *v135;
  NSObject *v136;
  NSObject *v137;
  NSObject *v138;
  NSObject *v139;
  NSObject *v140;
  void *v142;
  void *v143;
  void *v144;
  SEL aSelector;
  const char *aSelectora;
  MLCGraphCompilationOptions v147;
  os_signpost_id_t spid;
  unint64_t v149;
  NSDictionary *v150;
  MLCDevice *v151;
  NSDictionary *v152;
  NSObject *v153;
  MLCDevice *v154;
  void *v155;
  MLCInferenceGraph *v157;
  uint64_t v158;
  uint64_t v159;
  MLCInferenceGraph *v160;
  uint64_t v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  void *v178;
  _BYTE v179[128];
  _BYTE v180[128];
  uint8_t v181[128];
  uint8_t buf[4];
  void *v183;
  __int16 v184;
  MLCGraphCompilationOptions v185;
  __int16 v186;
  void *v187;
  uint64_t v188;

  v188 = *MEMORY[0x1E0C80C00];
  v10 = device;
  v11 = inputTensors;
  v12 = inputTensorsData;
  v157 = self;
  if (-[MLCGraph readyForExecution](self, "readyForExecution"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.2(a2);
    v14 = 1;
    goto LABEL_140;
  }
  if (!v11 || v12)
  {
    v15 = v10;
    v16 = (uint64_t)v15;
    if (-[MLCDevice type](v15, "type") == MLCDeviceTypeANE)
    {
      +[MLCDevice cpuDevice](MLCDevice, "cpuDevice");
      v16 = objc_claimAutoreleasedReturnValue();

    }
    v153 = v16;
    -[MLCGraph setCompilerOptions:](self, "setCompilerOptions:", options);
    +[MLCLog execution](MLCLog, "execution");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);

    +[MLCLog execution](MLCLog, "execution");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    spid = v18;
    v149 = v18 - 1;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v183 = v22;
      v184 = 2050;
      v185 = options;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CompileWithOptions", "%{public,name=Device}@ %{public,name=Options}llu", buf, 0x16u);

    }
    aSelector = a2;

    -[MLCGraph graphLayerList](self, "graphLayerList");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "device");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      -[MLCInferenceGraph setInferenceNodeIndexInGraphLayerList:](v157, "setInferenceNodeIndexInGraphLayerList:", 0);
    if (v11 && v12)
    {
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v26 = v12;
      v27 = -[NSDictionary countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v162, v179, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v163;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v163 != v29)
              objc_enumerationMutation(v26);
            -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * i), aSelector);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setComputeFlags:", objc_msgSend(v31, "computeFlags") | 2);

          }
          v28 = -[NSDictionary countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v162, v179, 16);
        }
        while (v28);
      }

      -[MLCGraph bindAndWriteData:forInputs:toDevice:synchronous:](v157, "bindAndWriteData:forInputs:toDevice:synchronous:", v26, v11, v15, 1);
    }
    -[MLCGraph graphLayerList](v157, "graphLayerList", aSelector);
    v32 = objc_claimAutoreleasedReturnValue();
    +[MLCDeviceGraph deviceGraphWithLayers:device:](MLCDeviceGraph, "deviceGraphWithLayers:device:", v32, v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v178, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLCDevice computeEngine](v15, "computeEngine");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = objc_opt_respondsToSelector();

    if ((v32 & 1) != 0)
    {
      -[MLCDevice computeEngine](v15, "computeEngine");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:", v157, -[MLCInferenceGraph inferenceNodeIndexInGraphLayerList](v157, "inferenceNodeIndexInGraphLayerList"), v15, v153);
      v37 = objc_claimAutoreleasedReturnValue();

      v155 = (void *)v37;
    }
    else
    {
      v155 = v34;
    }
    v38 = -[MLCInferenceGraph inferenceNodeIndexInGraphLayerList](v157, "inferenceNodeIndexInGraphLayerList");
    -[MLCGraph graphLayerList](v157, "graphLayerList");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v38 < v40)
    {
      do
      {
        -[MLCGraph graphLayerList](v157, "graphLayerList");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndexedSubscript:", v38);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v42, "skipLayer") & 1) == 0)
        {
          objc_msgSend(v42, "setCompileForInferenceOnly:", 1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[MLCGraph linkRelatedTensorsForConcatLayer:device:](v157, "linkRelatedTensorsForConcatLayer:device:", v42, v15);
        }

        ++v38;
        -[MLCGraph graphLayerList](v157, "graphLayerList");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");

      }
      while (v38 < v44);
    }
    v154 = v15;
    v151 = v10;
    v152 = v12;
    v150 = v11;
    v147 = (2 * (options & 1)) | options;
    if ((v147 & 6) == 0)
    {
      v45 = -[MLCInferenceGraph inferenceNodeIndexInGraphLayerList](v157, "inferenceNodeIndexInGraphLayerList");
      v160 = v157;
      v46 = v155;
      if (objc_msgSend(v46, "count") == 1)
        v47 = v45;
      else
        v47 = 0;
      v48 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v174 = 0u;
      v175 = 0u;
      v176 = 0u;
      v177 = 0u;
      v49 = v46;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v174, buf, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v175;
        v158 = *(_QWORD *)v175;
        v159 = v47;
        do
        {
          v53 = 0;
          v161 = v51;
          do
          {
            if (*(_QWORD *)v175 != v52)
              objc_enumerationMutation(v49);
            v54 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v53);
            if ((unint64_t)objc_msgSend(v49, "count") >= 2)
            {
              v55 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v54, "graphLayerList");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setWithArray:", v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              v172 = 0u;
              v173 = 0u;
              v170 = 0u;
              v171 = 0u;
              -[MLCGraph graphLayerList](v160, "graphLayerList");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v170, v181, 16);
              if (v59)
              {
                v60 = v59;
                v61 = *(_QWORD *)v171;
                do
                {
                  for (j = 0; j != v60; ++j)
                  {
                    if (*(_QWORD *)v171 != v61)
                      objc_enumerationMutation(v58);
                    v63 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * j);
                    if ((objc_msgSend(v63, "skipLayer") & 1) == 0
                      && (objc_msgSend(v57, "containsObject:", v63) & 1) == 0)
                    {
                      objc_msgSend(v48, "addObject:", v63);
                      objc_msgSend(v63, "setSkipLayer:", 1);
                    }
                  }
                  v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v170, v181, 16);
                }
                while (v60);
              }

              v52 = v158;
              v47 = v159;
              v51 = v161;
            }
            objc_msgSend(v54, "device");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "computeEngine");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "graphLayerList");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "fuseLayersForInferenceGraph:startAtLayerIndex:", v66, v47);

            if ((unint64_t)objc_msgSend(v49, "count") >= 2)
            {
              v168 = 0u;
              v169 = 0u;
              v166 = 0u;
              v167 = 0u;
              v67 = v48;
              v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v166, v180, 16);
              if (v68)
              {
                v69 = v68;
                v70 = *(_QWORD *)v167;
                do
                {
                  for (k = 0; k != v69; ++k)
                  {
                    if (*(_QWORD *)v167 != v70)
                      objc_enumerationMutation(v67);
                    objc_msgSend(*(id *)(*((_QWORD *)&v166 + 1) + 8 * k), "setSkipLayer:", 0);
                  }
                  v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v166, v180, 16);
                }
                while (v69);
              }

              objc_msgSend(v67, "removeAllObjects");
            }
            ++v53;
          }
          while (v53 != v51);
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v174, buf, 16);
        }
        while (v51);
      }

    }
    v72 = v157;
    v73 = -[MLCInferenceGraph inferenceNodeIndexInGraphLayerList](v157, "inferenceNodeIndexInGraphLayerList");
    -[MLCGraph graphLayerList](v157, "graphLayerList");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "count");

    v76 = v155;
    if (v73 < v75)
    {
      do
      {
        -[MLCGraph graphLayerList](v72, "graphLayerList");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectAtIndexedSubscript:", v73);
        v78 = objc_claimAutoreleasedReturnValue();

        if ((options & 1) != 0)
          -[NSObject setIsDebuggingEnabled:](v78, "setIsDebuggingEnabled:", 1);
        if ((-[NSObject skipLayer](v78, "skipLayer") & 1) != 0)
          goto LABEL_99;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v73);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph lstmLayerIndexList](v157, "lstmLayerIndexList");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCGraph lstmLayerIndexList](v157, "lstmLayerIndexList");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:atIndexedSubscript:", v79, objc_msgSend(v81, "count"));

        }
        if (-[MLCDevice type](v154, "type"))
        {
          -[NSObject deviceOps](v78, "deviceOps");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "count");

          if (!v83)
          {
            -[NSObject resultTensors](v78, "resultTensors");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = objc_msgSend(v84, "count");

            if (v85)
            {
              v86 = 0;
              do
              {
                -[NSObject resultTensors](v78, "resultTensors");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "objectAtIndexedSubscript:", v86);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "deviceMemory");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = objc_msgSend(v89, "count");

                if (v90)
                {
                  -[NSObject resultTensors](v78, "resultTensors");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "objectAtIndexedSubscript:", v86);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "deviceMemory");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "removeAllObjects");

                }
                ++v86;
                -[NSObject resultTensors](v78, "resultTensors");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                v95 = objc_msgSend(v94, "count");

              }
              while (v86 < v95);
            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v133 = objc_claimAutoreleasedReturnValue();
          v13 = v153;
          v76 = v155;
          if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
            -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.5(aSelectora);

          +[MLCLog execution](MLCLog, "execution");
          v134 = objc_claimAutoreleasedReturnValue();
          v135 = v134;
          v11 = v150;
          v10 = v151;
          if (v149 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
          {
            *(_WORD *)buf = 0;
            goto LABEL_128;
          }
LABEL_129:

          goto LABEL_130;
        }
        -[NSObject deviceOps](v78, "deviceOps");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "count");

        v76 = v155;
        if (v97)
        {
          -[NSObject device](v78, "device");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v98, "isEqual:", v154);

          if ((v99 & 1) == 0)
          {
            +[MLCLog framework](MLCLog, "framework");
            v136 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
              -[MLCInferenceGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.5();

            +[MLCLog execution](MLCLog, "execution");
            v137 = objc_claimAutoreleasedReturnValue();
            v135 = v137;
            v11 = v150;
            v10 = v151;
            v13 = v153;
            if (v149 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
            {
              *(_WORD *)buf = 0;
LABEL_128:
              _os_signpost_emit_with_name_impl(&dword_1D4999000, v135, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", (const char *)&unk_1D4ABD322, buf, 2u);
            }
            goto LABEL_129;
          }
          -[NSObject setDevice:](v78, "setDevice:", v154);
        }
        v100 = v154;
        if (v154)
        {
          p_super = &v100->super;
          if (-[MLCDevice type](v100, "type") == MLCDeviceTypeANE)
          {
            v102 = v153;

            p_super = v102;
          }
          if (!v97)
          {
LABEL_91:
            -[NSObject setCompileForInferenceOnly:](v78, "setCompileForInferenceOnly:", 1);
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            -[NSObject sourceTensors](v78, "sourceTensors");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject resultTensors](v78, "resultTensors");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v105;
            if ((isKindOfClass & 1) != 0)
            {
              v107 = -[NSObject compileForDevice:sourceTensors:resultTensors:](v78, "compileForDevice:sourceTensors:resultTensors:", p_super, v104, v105);

              if (!v107)
                goto LABEL_131;
            }
            else
            {
              objc_msgSend(v105, "objectAtIndexedSubscript:", 0);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = -[NSObject compileForDevice:sourceTensors:resultTensor:](v78, "compileForDevice:sourceTensors:resultTensor:", p_super, v104, v108);

              if ((v109 & 1) == 0)
              {
LABEL_131:
                +[MLCLog framework](MLCLog, "framework");
                v138 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
                  -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.6();

                +[MLCLog execution](MLCLog, "execution");
                v139 = objc_claimAutoreleasedReturnValue();
                v140 = v139;
                v11 = v150;
                v10 = v151;
                v76 = v155;
                if (v149 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v139))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1D4999000, v140, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", (const char *)&unk_1D4ABD322, buf, 2u);
                }

                goto LABEL_137;
              }
            }
            -[NSObject resultTensors](v78, "resultTensors");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = objc_msgSend(v110, "count");

            if (v111)
            {
              v112 = 0;
              do
              {
                -[NSObject resultTensors](v78, "resultTensors");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "objectAtIndexedSubscript:", v112);
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "setDevice:", p_super);

                ++v112;
                -[NSObject resultTensors](v78, "resultTensors");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                v116 = objc_msgSend(v115, "count");

              }
              while (v112 < v116);
            }
          }
        }
        else
        {
          p_super = 0;
          if (!v97)
            goto LABEL_91;
        }

        v76 = v155;
LABEL_99:

        ++v73;
        v72 = v157;
        -[MLCGraph graphLayerList](v157, "graphLayerList");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v117, "count");

      }
      while (v73 < v118);
    }
    -[MLCDevice computeEngine](v154, "computeEngine");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_opt_respondsToSelector();

    if ((v120 & 1) != 0
      && (-[MLCDevice computeEngine](v154, "computeEngine"),
          v121 = (void *)objc_claimAutoreleasedReturnValue(),
          v122 = objc_msgSend(v121, "postProcessCompiledGraph:compilerOptions:", v72, v147),
          v121,
          (v122 & 1) == 0))
    {
      +[MLCLog framework](MLCLog, "framework");
      v131 = objc_claimAutoreleasedReturnValue();
      v11 = v150;
      v10 = v151;
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelectora);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCDevice computeEngine](v154, "computeEngine");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "description");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v183 = v142;
        v184 = 2112;
        v185 = (MLCGraphCompilationOptions)v72;
        v186 = 2112;
        v187 = v144;
        _os_log_error_impl(&dword_1D4999000, v131, OS_LOG_TYPE_ERROR, "%@: failed to post process the compiled graph=%@ on device=%@", buf, 0x20u);

        v76 = v155;
      }

      +[MLCLog execution](MLCLog, "execution");
      v132 = objc_claimAutoreleasedReturnValue();
      v78 = v132;
      if (v149 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v13 = v153;
        if (os_signpost_enabled(v132))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D4999000, v78, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", (const char *)&unk_1D4ABD322, buf, 2u);
        }
LABEL_130:
        v14 = 0;
        goto LABEL_139;
      }
LABEL_137:
      v14 = 0;
    }
    else
    {
      -[MLCGraph setReadyForExecution:](v72, "setReadyForExecution:", 1);
      -[MLCGraph setDevice:](v72, "setDevice:", v154);
      -[MLCGraph setAllocateDeviceMemoryForTensorsInGraph:](v72, "setAllocateDeviceMemoryForTensorsInGraph:", -[MLCDevice type](v154, "type") != MLCDeviceTypeANE);
      -[MLCDevice computeEngine](v154, "computeEngine");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_opt_respondsToSelector();

      v11 = v150;
      v10 = v151;
      if ((v124 & 1) != 0)
      {
        -[MLCDevice computeEngine](v154, "computeEngine");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph graphLayerList](v72, "graphLayerList");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "allocateDeviceHeapForGraph:forInference:", v126, 1);

      }
      if ((-[MLCGraph compilerOptions](v72, "compilerOptions") & 4) != 0
        || !-[MLCGraph staticBatchSizeInGraph](v72, "staticBatchSizeInGraph"))
      {
        -[MLCDevice computeEngine](v154, "computeEngine");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = objc_opt_respondsToSelector();

        if ((v128 & 1) != 0)
        {
          -[MLCDevice computeEngine](v154, "computeEngine");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "selectDevicesWithBatchSize:", 1);

        }
      }
      +[MLCLog execution](MLCLog, "execution");
      v130 = objc_claimAutoreleasedReturnValue();
      v78 = v130;
      if (v149 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v13 = v153;
        if (os_signpost_enabled(v130))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D4999000, v78, OS_SIGNPOST_INTERVAL_END, spid, "CompileWithOptions", (const char *)&unk_1D4ABD322, buf, 2u);
        }
        v14 = 1;
        goto LABEL_139;
      }
      v14 = 1;
    }
    v13 = v153;
LABEL_139:

    v12 = v152;
    goto LABEL_140;
  }
  +[MLCLog framework](MLCLog, "framework");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[MLCTrainingGraph compileWithOptions:device:inputTensors:inputTensorsData:].cold.3(a2);
  v14 = 0;
LABEL_140:

  return v14;
}

- (NSUInteger)deviceMemorySize
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[MLCGraph graphLayerList](self, "graphLayerList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 += objc_msgSend(v8, "deviceMemorySizeForForward");

    ++v5;
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

  }
  while (v5 < v10);
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)MLCInferenceGraph;
  -[MLCGraph description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { rootLayer=%@ : %@}"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)addInputs:(NSDictionary *)inputs
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLCInferenceGraph;
  return -[MLCGraph addInputs:lossLabels:lossLabelWeights:](&v4, sel_addInputs_lossLabels_lossLabelWeights_, inputs, 0, 0);
}

- (BOOL)addInputs:(id)a3 lossLabels:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLCInferenceGraph;
  return -[MLCGraph addInputs:lossLabels:lossLabelWeights:](&v5, sel_addInputs_lossLabels_lossLabelWeights_, a3, a4, 0);
}

- (BOOL)addInputs:(NSDictionary *)inputs lossLabels:(NSDictionary *)lossLabels lossLabelWeights:(NSDictionary *)lossLabelWeights
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLCInferenceGraph;
  return -[MLCGraph addInputs:lossLabels:lossLabelWeights:](&v6, sel_addInputs_lossLabels_lossLabelWeights_, inputs, lossLabels, lossLabelWeights);
}

- (BOOL)addOutputs:(NSDictionary *)outputs
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLCInferenceGraph;
  return -[MLCGraph addOutputs:](&v4, sel_addOutputs_, outputs);
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return -[MLCInferenceGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:](self, "executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:", inputsData, 0, 0, 0, batchSize, options, completionHandler);
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return -[MLCInferenceGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:](self, "executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:", inputsData, 0, 0, outputsData, batchSize, options, completionHandler);
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  return -[MLCInferenceGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:](self, "executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:", inputsData, lossLabelsData, lossLabelWeightsData, 0, batchSize, options, completionHandler);
}

- (BOOL)executeWithInputsData:(NSDictionary *)inputsData lossLabelsData:(NSDictionary *)lossLabelsData lossLabelWeightsData:(NSDictionary *)lossLabelWeightsData outputsData:(NSDictionary *)outputsData batchSize:(NSUInteger)batchSize options:(MLCExecutionOptions)options completionHandler:(MLCGraphCompletionHandler)completionHandler
{
  NSDictionary *v15;
  NSDictionary *v16;
  MLCExecutionOptions v17;
  NSDictionary *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  void (**v21)(MLCGraphCompletionHandler, _QWORD, void *, double);
  CFAbsoluteTime Current;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  const __CFString *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  BOOL v38;
  void *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t i;
  void *v46;
  void *v47;
  int v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  NSDictionary *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  unsigned int v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  unint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  BOOL v85;
  void *v86;
  void *v87;
  BOOL v88;
  NSObject *v89;
  NSObject *v90;
  unint64_t v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  _BOOL4 v95;
  void *v96;
  os_signpost_id_t v97;
  unint64_t v98;
  void *v99;
  unint64_t v100;
  void *v101;
  void *v102;
  NSObject *v103;
  NSObject *v104;
  objc_class *v105;
  id v106;
  uint64_t v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  unint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t k;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  char v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t m;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  char v142;
  void *v143;
  void *v144;
  char v145;
  void *v146;
  void *v147;
  NSObject *v148;
  NSObject *v149;
  objc_class *v150;
  id v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  int v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  unint64_t v161;
  unint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  unint64_t v166;
  void *v167;
  unint64_t v168;
  unint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  unint64_t v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  NSObject *v181;
  NSObject *v182;
  void *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  BOOL v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  unint64_t v207;
  void *v208;
  NSObject *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  id v217;
  void *v218;
  void *v219;
  void *v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  id v224;
  void *v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  unint64_t v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  char isKindOfClass;
  NSObject *v246;
  NSObject *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  MLCInferenceGraph *v255;
  MLCExecutionOptions v256;
  void *v257;
  void *v258;
  void *v259;
  uint64_t v260;
  NSObject *v261;
  void *v262;
  uint64_t v263;
  void *v264;
  void *v265;
  NSObject *v266;
  NSObject *v267;
  NSObject *v268;
  NSObject *v269;
  NSObject *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  NSObject *v276;
  void *v277;
  void *v278;
  uint64_t v279;
  NSObject *v280;
  void *v281;
  uint64_t v282;
  NSObject *v283;
  NSObject *v284;
  id v285;
  void *v286;
  void *v287;
  uint64_t v288;
  void *v289;
  void *v290;
  uint64_t v291;
  NSObject *v292;
  void *v293;
  uint64_t v294;
  NSObject *v295;
  void *v296;
  void *v297;
  void *v298;
  uint64_t v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  int v304;
  void *v305;
  NSDictionary *v306;
  NSObject *v307;
  unint64_t v308;
  os_signpost_id_t v309;
  int v310;
  unint64_t v311;
  const char *aSelector;
  NSDictionary *v313;
  void (**v314)(MLCGraphCompletionHandler, _QWORD, void *, double);
  void *v315;
  NSDictionary *v316;
  void *v317;
  void *v318;
  id v319;
  id v320;
  id v321;
  id v322;
  MLCExecutionOptions v323;
  void *v324;
  void *v325;
  os_signpost_id_t spid;
  NSDictionary *v327;
  id obj;
  void *v329;
  unint64_t v330;
  MLCInferenceGraph *v331;
  void *v332;
  id v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  _QWORD v347[2];
  uint8_t v348[128];
  _BYTE buf[24];
  void *v350;
  __int16 v351;
  void *v352;
  _BYTE v353[128];
  _BYTE v354[128];
  uint64_t v355;

  v355 = *MEMORY[0x1E0C80C00];
  v15 = inputsData;
  v16 = lossLabelsData;
  v17 = options;
  v18 = v16;
  v19 = lossLabelWeightsData;
  v20 = outputsData;
  v21 = completionHandler;
  Current = 0.0;
  if ((v17 & 4) != 0)
    Current = CFAbsoluteTimeGetCurrent();
  if (!v21 && (v17 & 2) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MLCInferenceGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.10(a2);

  }
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    -[MLCGraph allInputs](self, "allInputs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      +[MLCLog framework](MLCLog, "framework");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.2(a2);

      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("No inputs compiled in graph");
      goto LABEL_35;
    }
    -[MLCGraph allLossLabels](self, "allLossLabels");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27 && v18 && !-[NSDictionary isEqualToDictionary:](v18, "isEqualToDictionary:", MEMORY[0x1E0C9AA70]))
    {
      +[MLCLog framework](MLCLog, "framework");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.10(a2);

      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("No loss labels compiled in graph");
      goto LABEL_35;
    }
    -[MLCGraph allLossLabelWeights](self, "allLossLabelWeights");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28 && v19 && !-[NSDictionary isEqualToDictionary:](v19, "isEqualToDictionary:", MEMORY[0x1E0C9AA70]))
    {
      +[MLCLog framework](MLCLog, "framework");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.9(a2);

      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("No loss label weights compiled in graph");
      goto LABEL_35;
    }
    if (!-[MLCGraph readyForExecution](self, "readyForExecution"))
    {
      +[MLCLog framework](MLCLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.4(a2);

      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("graph not ready for execution");
      goto LABEL_35;
    }
    v29 = -[MLCGraph staticBatchSizeInGraph](self, "staticBatchSizeInGraph");
    if (batchSize && !v29)
    {
      +[MLCLog framework](MLCLog, "framework");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.3(a2);

      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("batchSize provided must be 0 since batch size changes in graph. we will use batch size specified with tensors for layers in graph");
      goto LABEL_35;
    }
    if (v20 && !-[MLCGraph checkPageAlignmentAndSizeForOutputs:](self, "checkPageAlignmentAndSizeForOutputs:", v20))
    {
      +[MLCLog framework](MLCLog, "framework");
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeForwardWithBatchSize:options:outputsData:completionHandler:].cold.2(a2);

      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("Outputs buffers must be page aligned and a multiple of page size");
      goto LABEL_35;
    }
    v323 = v17;
    aSelector = a2;
    v314 = v21;
    v327 = v20;
    v316 = v19;
    -[MLCGraph updateLSTMLayersForVariableSequenceLengthInGraph:withInputData:](self, "updateLSTMLayersForVariableSequenceLengthInGraph:withInputData:", self, v15);
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");

    -[MLCGraph graphLayerList](self, "graphLayerList");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    v44 = 0;
    if (v43)
    {
      for (i = 0; i != v43; ++i)
      {
        -[MLCGraph graphLayerList](self, "graphLayerList");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", i);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "skipLayer");

        if (v44 <= i)
          v49 = i;
        else
          v49 = v44;
        if (v41 >= i)
          v50 = i;
        else
          v50 = v41;
        if (!v48)
        {
          v41 = v50;
          v44 = v49;
        }
      }
    }
    -[MLCGraph graphLayerList](self, "graphLayerList");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectAtIndexedSubscript:", v44);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "resultTensors");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectAtIndexedSubscript:", 0);
    v332 = (void *)objc_claimAutoreleasedReturnValue();

    v324 = v52;
    v331 = self;
    v313 = v18;
    if (v327)
    {
      v345 = 0u;
      v346 = 0u;
      v343 = 0u;
      v344 = 0u;
      v54 = v327;
      v55 = -[NSDictionary countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v343, v354, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v344;
        while (2)
        {
          for (j = 0; j != v56; ++j)
          {
            if (*(_QWORD *)v344 != v57)
              objc_enumerationMutation(v54);
            v59 = *(_QWORD *)(*((_QWORD *)&v343 + 1) + 8 * j);
            -[MLCGraph allOutputs](v331, "allOutputs");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectForKeyedSubscript:", v59);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            if (v61 == v332)
            {
              -[NSDictionary objectForKeyedSubscript:](v54, "objectForKeyedSubscript:", v59);
              v315 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v324, "resultTensors");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
              v325 = (void *)objc_claimAutoreleasedReturnValue();
              v310 = 1;
              v18 = v313;
              self = v331;
              goto LABEL_69;
            }

          }
          v56 = -[NSDictionary countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v343, v354, 16);
          self = v331;
          if (v56)
            continue;
          break;
        }
      }

      v18 = v313;
      v52 = v324;
    }
    objc_msgSend(v332, "descriptor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = malloc_type_malloc(objc_msgSend(v62, "tensorAllocationSizeInBytes"), 0x7B9C2814uLL);

    objc_msgSend(v332, "descriptor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v63, objc_msgSend(v64, "tensorAllocationSizeInBytes"), 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v332, "descriptor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v66, v65);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setComputeFlags:", 1);
    objc_msgSend(v52, "device");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v325 = v67;
    objc_msgSend(v67, "setDevice:", v68);

    objc_msgSend(v52, "device");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v67) = objc_msgSend(v69, "type");

    if ((_DWORD)v67 == 3)
    {
      objc_msgSend(v52, "device");
      v329 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v329, "computeEngine");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "resultTensors");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectAtIndexedSubscript:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "shareDeviceMemoryWithResultTensor:sourceTensor:", v325, v72);

    }
    v315 = 0;
    v310 = 0;
LABEL_69:

    v74 = v323;
    if ((v323 & 4) != 0)
    {
      *(CFAbsoluteTime *)buf = Current;
      *(_QWORD *)&buf[16] = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 24);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCLog execution](MLCLog, "execution");
      v75 = objc_claimAutoreleasedReturnValue();
      spid = os_signpost_id_generate(v75);

    }
    else
    {
      v318 = 0;
      spid = 0;
    }
    if ((v323 & 1) != 0)
    {
      v91 = spid - 1;
LABEL_86:
      +[MLCLog execution](MLCLog, "execution");
      v92 = objc_claimAutoreleasedReturnValue();
      v93 = v92;
      v308 = v91;
      if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v93, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ExecuteForward", (const char *)&unk_1D4ABD322, buf, 2u);
      }

      -[MLCGraph device](self, "device");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "type") == 0;

      v96 = 0;
      v97 = spid;
      if ((v95 & (v74 >> 4)) == 0)
        v97 = 0;
      v309 = v97;
      v98 = 0x1E981F000uLL;
      if (v41 < v44 + 1)
      {
        v99 = 0;
        v100 = v97 - 1;
        v330 = v44;
        v306 = v15;
        v311 = v97 - 1;
        while (1)
        {
          -[MLCGraph graphLayerList](self, "graphLayerList");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "objectAtIndexedSubscript:", v41);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v98 + 2064), "execution");
          v103 = objc_claimAutoreleasedReturnValue();
          v104 = v103;
          if (v100 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
          {
            v105 = (objc_class *)objc_opt_class();
            NSStringFromClass(v105);
            v106 = (id)objc_claimAutoreleasedReturnValue();
            v107 = objc_msgSend(v102, "layerID");
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v106;
            *(_WORD *)&buf[12] = 2050;
            *(_QWORD *)&buf[14] = v107;
            _os_signpost_emit_with_name_impl(&dword_1D4999000, v104, OS_SIGNPOST_INTERVAL_BEGIN, v309, "ExecuteForward -- PerLayer", "%{public,name=MLCLayerType}@ %{public,name=LayerID}lu", buf, 0x16u);

          }
          if (objc_msgSend(v102, "skipLayer"))
          {
            v98 = 0x1E981F000uLL;
            +[MLCLog execution](MLCLog, "execution");
            v108 = objc_claimAutoreleasedReturnValue();
            v109 = v108;
            if (v311 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v108))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1D4999000, v109, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
            }
            goto LABEL_193;
          }
          if (v41 == v44)
          {
            v307 = v325;
          }
          else
          {
            objc_msgSend(v102, "resultTensors");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "objectAtIndexedSubscript:", 0);
            v307 = objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v102, "device");
          v317 = (void *)objc_claimAutoreleasedReturnValue();

          v111 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          objc_msgSend(v102, "sourceTensors");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = objc_msgSend(v112, "count");

          if (v113)
          {
            v114 = 0;
            do
            {
              objc_msgSend(v102, "sourceTensors");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "objectAtIndexedSubscript:", v114);
              v116 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v111, "setObject:atIndexedSubscript:", v116, v114);
              ++v114;
              objc_msgSend(v102, "sourceTensors");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = objc_msgSend(v117, "count");

            }
            while (v114 < v118);
          }
          v341 = 0u;
          v342 = 0u;
          v339 = 0u;
          v340 = 0u;
          obj = v111;
          v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v339, v353, 16);
          if (v119)
          {
            v120 = v119;
            v121 = *(_QWORD *)v340;
            while (2)
            {
              for (k = 0; k != v120; ++k)
              {
                if (*(_QWORD *)v340 != v121)
                  objc_enumerationMutation(obj);
                v123 = *(void **)(*((_QWORD *)&v339 + 1) + 8 * k);
                objc_msgSend(v123, "device");
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "device");
                v125 = (void *)objc_claimAutoreleasedReturnValue();

                if (v124 != v125)
                {
                  objc_msgSend(v102, "device");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v126, "computeEngine");
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "device");
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  v129 = objc_msgSend(v127, "transferTensor:fromDevice:", v123, v128);

                  if ((v129 & 1) == 0)
                  {
                    v334 = v102;
                    +[MLCLog framework](MLCLog, "framework");
                    v268 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
                    {
                      NSStringFromSelector(aSelector);
                      v296 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v123, "device");
                      v297 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v102, "device");
                      v298 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413058;
                      *(_QWORD *)&buf[4] = v296;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v123;
                      *(_WORD *)&buf[22] = 2112;
                      v350 = v297;
                      v351 = 2112;
                      v352 = v298;
                      _os_log_error_impl(&dword_1D4999000, v268, OS_LOG_TYPE_ERROR, "%@: Unable to transfer data of a tensor = %@ from device = %@ to device = %@", buf, 0x2Au);

                    }
                    +[MLCLog execution](MLCLog, "execution");
                    v269 = objc_claimAutoreleasedReturnValue();
                    v270 = v269;
                    v15 = v306;
                    v18 = v313;
                    v19 = v316;
                    if (v311 > 0xFFFFFFFFFFFFFFFDLL)
                    {
                      v272 = obj;
                      v273 = obj;
                      v21 = v314;
                      v252 = v324;
                      v264 = v325;
                      v271 = v307;
                    }
                    else
                    {
                      v21 = v314;
                      v252 = v324;
                      v264 = v325;
                      v271 = v307;
                      v272 = obj;
                      if (os_signpost_enabled(v269))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1D4999000, v270, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
                      }
                      v273 = obj;
                    }
LABEL_285:

                    v38 = 0;
                    v20 = v327;
                    goto LABEL_286;
                  }
                  objc_msgSend(v102, "device");
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "setDevice:", v130);

                  v44 = v330;
                }
              }
              v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v339, v353, 16);
              if (v120)
                continue;
              break;
            }
          }

          v337 = 0u;
          v338 = 0u;
          v335 = 0u;
          v336 = 0u;
          objc_msgSend(v102, "resultTensors");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v335, v348, 16);
          if (v132)
          {
            v133 = v132;
            v134 = *(_QWORD *)v336;
            v319 = v131;
            while (2)
            {
              for (m = 0; m != v133; ++m)
              {
                if (*(_QWORD *)v336 != v134)
                  objc_enumerationMutation(v319);
                v136 = *(void **)(*((_QWORD *)&v335 + 1) + 8 * m);
                objc_msgSend(v136, "device");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "device");
                v138 = v102;
                v139 = (void *)objc_claimAutoreleasedReturnValue();

                if (v137 != v139)
                {
                  objc_msgSend(v138, "device");
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v140, "computeEngine");
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  v142 = objc_msgSend(v141, "updateDeviceMemoryForTensor:", v136);

                  if ((v142 & 1) == 0)
                  {
                    v334 = v138;
                    +[MLCLog execution](MLCLog, "execution");
                    v276 = objc_claimAutoreleasedReturnValue();
                    v270 = v276;
                    if (v311 > 0xFFFFFFFFFFFFFFFDLL)
                    {
                      v15 = v306;
                      v271 = v307;
                      v18 = v313;
                      v21 = v314;
                      v19 = v316;
                      v252 = v324;
                      v264 = v325;
                      v272 = obj;
                    }
                    else
                    {
                      v15 = v306;
                      v271 = v307;
                      v18 = v313;
                      v21 = v314;
                      v19 = v316;
                      v252 = v324;
                      v264 = v325;
                      v272 = obj;
                      if (os_signpost_enabled(v276))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1D4999000, v270, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
                      }
                    }
                    v273 = v319;
                    goto LABEL_285;
                  }
                }
                objc_msgSend(v138, "device");
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v136, "setDevice:", v143);

                v102 = v138;
              }
              v131 = v319;
              v133 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v335, v348, 16);
              if (v133)
                continue;
              break;
            }
          }

          objc_msgSend(v102, "setBatchSize:", batchSize);
          objc_msgSend(v317, "computeEngine");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = objc_opt_respondsToSelector();

          if ((v145 & 1) != 0)
          {
            objc_msgSend(v317, "computeEngine");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "deviceOps");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "dispatchForwardLayer:", v147);

            +[MLCLog execution](MLCLog, "execution");
            v148 = objc_claimAutoreleasedReturnValue();
            v149 = v148;
            v15 = v306;
            v18 = v313;
            self = v331;
            if (v311 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v148))
            {
              v150 = (objc_class *)objc_opt_class();
              NSStringFromClass(v150);
              v151 = (id)objc_claimAutoreleasedReturnValue();
              v152 = objc_msgSend(v102, "layerID");
              objc_msgSend(v102, "label");
              v153 = v102;
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v151;
              *(_WORD *)&buf[12] = 2050;
              *(_QWORD *)&buf[14] = v152;
              *(_WORD *)&buf[22] = 2114;
              v350 = v154;
              _os_signpost_emit_with_name_impl(&dword_1D4999000, v149, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", "%{public,name=MLCLayerType}@ (%{public,name=LayerID}lu, \"%{public,name=MLCLayerName}@\")", buf, 0x20u);

              v102 = v153;
              v44 = v330;

            }
            goto LABEL_190;
          }
          objc_opt_class();
          v15 = v306;
          v18 = v313;
          self = v331;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (-[MLCGraph allocateDeviceMemoryForTensorsInGraph](v331, "allocateDeviceMemoryForTensorsInGraph"))
            {
              if (objc_msgSend(v102, "compileForInferenceOnly"))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  -[MLCGraph allocateDeviceMemoryForTensor:device:](v331, "allocateDeviceMemoryForTensor:device:", v307, v317);
                  objc_msgSend(v102, "resultTensors");
                  v160 = (void *)objc_claimAutoreleasedReturnValue();
                  v161 = objc_msgSend(v160, "count");

                  if (v161 >= 2)
                  {
                    v162 = 1;
                    do
                    {
                      objc_msgSend(v102, "resultTensors");
                      v163 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v163, "objectAtIndexedSubscript:", v162);
                      v164 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MLCGraph allocateDeviceMemoryForTensor:device:](v331, "allocateDeviceMemoryForTensor:device:", v164, v317);

                      ++v162;
                      objc_msgSend(v102, "resultTensors");
                      v165 = (void *)objc_claimAutoreleasedReturnValue();
                      v166 = objc_msgSend(v165, "count");

                    }
                    while (v162 < v166);
                  }
                }
              }
              -[MLCGraph updateDeviceMemoryReadCountForTensor:](v331, "updateDeviceMemoryReadCountForTensor:", v307);
              objc_msgSend(v102, "resultTensors");
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              v168 = objc_msgSend(v167, "count");

              if (v168 >= 2)
              {
                v169 = 1;
                do
                {
                  objc_msgSend(v102, "resultTensors");
                  v170 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v170, "objectAtIndexedSubscript:", v169);
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MLCGraph updateDeviceMemoryReadCountForTensor:](v331, "updateDeviceMemoryReadCountForTensor:", v171);

                  ++v169;
                  objc_msgSend(v102, "resultTensors");
                  v172 = (void *)objc_claimAutoreleasedReturnValue();
                  v173 = objc_msgSend(v172, "count");

                }
                while (v169 < v173);
              }
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v317, "computeEngine");
              v320 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              v176 = 0;
              v304 = objc_msgSend(v102, "binaryOperation");
              if (v304)
              {
                objc_msgSend(obj, "objectAtIndexedSubscript:", 1);
                v176 = objc_claimAutoreleasedReturnValue();
                v303 = (void *)v176;
              }
              if (objc_msgSend(obj, "count") == 3)
              {
                objc_msgSend(obj, "objectAtIndexedSubscript:", 2);
                v302 = v175;
                v177 = v174;
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v299) = 0;
                v179 = v320;
                objc_msgSend(v320, "dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:", v177, v302, v176, v178, v307, 0, v299);

                v174 = v177;
                v175 = v302;
              }
              else
              {
                LOBYTE(v299) = 0;
                v179 = v320;
                objc_msgSend(v320, "dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:", v174, v175, v176, 0, v307, 0, v299);
              }
              if (v304)

              goto LABEL_181;
            }
            objc_opt_class();
            v183 = obj;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v321 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
              objc_msgSend(v321, "setObject:atIndexedSubscript:", v307, 0);
              objc_msgSend(v102, "sourceTensors");
              v184 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v184, "count") == 3)
              {

                goto LABEL_166;
              }
              objc_msgSend(v102, "sourceTensors");
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              v186 = objc_msgSend(v185, "count");

              v187 = v186 == 4;
              v183 = obj;
              if (v187)
              {
LABEL_166:
                objc_msgSend(v102, "sourceTensors");
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v188, "objectAtIndexedSubscript:", 1);
                v189 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v183, "setObject:atIndexedSubscript:", v189, 1);

                objc_msgSend(v102, "sourceTensors");
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v190, "objectAtIndexedSubscript:", 2);
                v191 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v183, "setObject:atIndexedSubscript:", v191, 2);

              }
              objc_msgSend(v102, "resultTensors");
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              v193 = objc_msgSend(v192, "count");

              if (v193 == 3)
              {
                objc_msgSend(v102, "resultTensors");
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v194, "objectAtIndexedSubscript:", 1);
                v195 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v321, "setObject:atIndexedSubscript:", v195, 1);

                objc_msgSend(v102, "resultTensors");
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v196, "objectAtIndexedSubscript:", 2);
                v197 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v321, "setObject:atIndexedSubscript:", v197, 2);

              }
              objc_msgSend(v317, "computeEngine");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v174, "dispatchRNNForwardLayer:sourceTensors:resultTensors:", v198, obj, v321);

              v179 = v321;
LABEL_181:

LABEL_182:
              if ((objc_msgSend(v102, "isDebuggingEnabled") & 1) == 0
                && -[MLCGraph allocateDeviceMemoryForTensorsInGraph](self, "allocateDeviceMemoryForTensorsInGraph")
                && objc_msgSend(obj, "count"))
              {
                v207 = 0;
                do
                {
                  objc_msgSend(obj, "objectAtIndexedSubscript:", v207);
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MLCGraph freeDeviceMemoryForTensorIfSafe:device:](self, "freeDeviceMemoryForTensorIfSafe:device:", v208, v317);

                  ++v207;
                }
                while (v207 < objc_msgSend(obj, "count"));
              }
              +[MLCLog execution](MLCLog, "execution");
              v209 = objc_claimAutoreleasedReturnValue();
              v149 = v209;
              if (v311 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v99 = v317;
                v109 = v307;
                if (os_signpost_enabled(v209))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1D4999000, v149, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
                }
                goto LABEL_191;
              }
LABEL_190:
              v99 = v317;
              v109 = v307;
              goto LABEL_191;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v317, "computeEngine");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "dispatchForwardMHALayer:sourceTensors:resultTensor:resultStateIsTemporary:forTraining:", v174, obj, v307, 0, 0);
              goto LABEL_181;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v317, "computeEngine");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "dispatchForwardMatMulLayer:sourceTensors:resultTensor:", v174, obj, v307);
LABEL_180:
              v15 = v306;
              v18 = v313;
              v44 = v330;
              self = v331;
              goto LABEL_181;
            }
            objc_opt_class();
            v199 = v102;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v317, "computeEngine");
              v200 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v201 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v200, "dispatchForwardSliceLayer:sourceTensor:resultTensor:forTraining:", v201, v202, v307, 0);
LABEL_174:

              v179 = v200;
              v174 = (void *)v201;
              goto LABEL_180;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v317, "computeEngine");
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v204 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
              v205 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "resultTensors");
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v203, "dispatchForwardSplitLayer:sourceTensor:resultTensors:", v204, v205, v206);
LABEL_179:

              v179 = v203;
              v174 = (void *)v204;
              goto LABEL_180;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v317, "computeEngine");
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v204 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "weights");
              v205 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v203, "dispatchForwardEmbeddingLayer:weight:sourceTensor:resultTensor:", v204, v205, v206, v307);
              goto LABEL_179;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v317, "computeEngine");
              v210 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v210, "dispatchForwardReshapeLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:", v211, v212, v307, 1, 0);

              -[NSObject sharedMemoryTensor](v307, "sharedMemoryTensor");
              v213 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v213)
              {
                v15 = v306;
                v18 = v313;
                v44 = v330;
                self = v331;
                v102 = v199;
                goto LABEL_182;
              }
              -[NSObject sharedMemoryTensor](v307, "sharedMemoryTensor");
              v322 = (id)objc_claimAutoreleasedReturnValue();
              -[NSObject childLayers](v307, "childLayers");
              v305 = (void *)objc_claimAutoreleasedReturnValue();
              v214 = objc_msgSend(v305, "count");
              if (v214)
              {
                -[NSObject childLayers](v307, "childLayers");
                v301 = (void *)objc_claimAutoreleasedReturnValue();
                v215 = objc_msgSend(v301, "count");
              }
              else
              {
                v215 = 1;
              }
              objc_msgSend(v322, "setReadCount:", objc_msgSend(v322, "readCount") + v215);
              if (v214)

LABEL_214:
              v15 = v306;
              v18 = v313;
              v44 = v330;
              self = v331;
              v102 = v199;
              v179 = v322;
              v174 = v305;
              goto LABEL_181;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v317, "computeEngine");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "deviceOps");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "dispatchForwardConcatLayer:sourceTensors:resultTensor:", v174, obj, v307);
              goto LABEL_180;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v216 = v102;
              v217 = v102;
              objc_msgSend(v317, "computeEngine");
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v217, "deviceOps");
              v219 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              v221 = objc_msgSend(v217, "reductionType");
              objc_msgSend(v217, "dimensions");
              v222 = (void *)objc_claimAutoreleasedReturnValue();
              v223 = v221;
              v174 = v218;
              objc_msgSend(v218, "dispatchForwardReduceLayer:sourceTensor:resultTensor:reductionType:reduceDimensions:forTraining:", v219, v220, v307, v223, v222, 0);

              v102 = v216;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v224 = v102;
                objc_msgSend(v317, "computeEngine");
                v305 = (void *)objc_claimAutoreleasedReturnValue();
                v322 = v224;
                objc_msgSend(v224, "deviceOps");
                v225 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
                v226 = (void *)objc_claimAutoreleasedReturnValue();
                v227 = objc_msgSend(obj, "count");
                v228 = 0;
                if (v227 == 2)
                {
                  objc_msgSend(obj, "objectAtIndexedSubscript:", 1);
                  v228 = objc_claimAutoreleasedReturnValue();
                  v300 = (void *)v228;
                }
                objc_msgSend(v305, "dispatchForwardCompareLayer:sourceTensor:secondaryTensor:resultTensor:compareOp:forTraining:", v225, v226, v228, v307, objc_msgSend(v322, "operation"), 0);
                if (v227 == 2)

                goto LABEL_214;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v229 = v102;
                v217 = v102;
                objc_msgSend(v217, "lossLabels");
                v230 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v230, "descriptor");
                v231 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v231, "stride");
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v232, "objectAtIndexedSubscript:", 0);
                v233 = (void *)objc_claimAutoreleasedReturnValue();
                v234 = (unint64_t)objc_msgSend(v233, "unsignedIntegerValue") >> 2;

                objc_msgSend(v317, "computeEngine");
                v235 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v217, "deviceOps");
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v217, "lossLabels");
                v236 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v217, "weights");
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                LOWORD(v299) = 0;
                objc_msgSend(v235, "dispatchForwardLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultStateIsTemporary:forTraining:", v219, v220, v236, v234, v237, v307, v299);

                v102 = v229;
                v174 = v235;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v317, "computeEngine");
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "deviceOps");
                  v201 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
                  v202 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v200, "dispatchForwardFullyConnectedLayer:sourceTensor:resultTensor:forTraining:", v201, v202, v307, 0);
                  goto LABEL_174;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v317, "computeEngine");
                    v179 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v102, "deviceOps");
                    v174 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v179, "dispatchForwardScatterLayer:sourceTensors:resultTensor:forTraining:", v174, obj, v307, 0);
                    goto LABEL_180;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v317, "computeEngine");
                    v179 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v102, "deviceOps");
                    v174 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v179, "dispatchForwardGatherLayer:sourceTensors:resultTensor:forTraining:", v174, obj, v307, 0);
                    goto LABEL_180;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v102, "fusedLayers");
                    v242 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v242, "count"))
                    {
                      objc_msgSend(v102, "fusedLayers");
                      v243 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v243, "objectAtIndexedSubscript:", 0);
                      v244 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      isKindOfClass = objc_opt_isKindOfClass();

                      if ((isKindOfClass & 1) != 0)
                      {
                        objc_msgSend(v317, "computeEngine");
                        v179 = (void *)objc_claimAutoreleasedReturnValue();
                        v102 = v199;
                        objc_msgSend(v199, "deviceOps");
                        v174 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v179, "dispatchForwardFusedArithmeticLayerNormalizationLayer:sourceTensors:resultTensor:forTraining:", v174, obj, v307, 0);
                        goto LABEL_180;
                      }
                    }
                    else
                    {

                    }
                  }
                  objc_msgSend(v317, "computeEngine");
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  v102 = v199;
                  objc_msgSend(v199, "deviceOps");
                  v201 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
                  v202 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v200, "dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:", v201, v202, v307, 0, 0);
                  goto LABEL_174;
                }
                objc_msgSend(v317, "computeEngine");
                v217 = (id)objc_claimAutoreleasedReturnValue();
                v238 = v102;
                objc_msgSend(v102, "deviceOps");
                v239 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(obj, "objectAtIndexedSubscript:", 1);
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                v347[0] = v220;
                objc_msgSend(obj, "objectAtIndexedSubscript:", 2);
                v240 = (void *)objc_claimAutoreleasedReturnValue();
                v347[1] = v240;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v347, 2);
                v241 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v217, "dispatchForwardSelectLayer:conditionTensor:sourceTensors:resultTensor:forTraining:", v239, v219, v241, v307, 0);

                v102 = v238;
                v174 = (void *)v239;
              }
            }

            v179 = v217;
            goto LABEL_180;
          }
          objc_msgSend(v317, "computeEngine");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = objc_msgSend(v155, "needToAllocateDeviceMemoryForTensor:");

          if (v156)
            break;
          -[NSObject sharedMemoryTensor](v307, "sharedMemoryTensor");
          v180 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v180)
          {
            objc_msgSend(v317, "computeEngine");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "deviceOps");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "dispatchForwardConcatLayer:sourceTensors:resultTensor:", v158, obj, v307);
            goto LABEL_148;
          }
LABEL_149:
          v98 = 0x1E981F000uLL;
          +[MLCLog execution](MLCLog, "execution");
          v181 = objc_claimAutoreleasedReturnValue();
          v182 = v181;
          if (v311 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v181))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D4999000, v182, OS_SIGNPOST_INTERVAL_END, v309, "ExecuteForward -- PerLayer", (const char *)&unk_1D4ABD322, buf, 2u);
          }

          v99 = v317;
          if (-[MLCGraph allocateDeviceMemoryForTensorsInGraph](v331, "allocateDeviceMemoryForTensorsInGraph"))
          {
            v109 = v307;
            -[MLCGraph updateDeviceMemoryReadCountForTensor:](v331, "updateDeviceMemoryReadCountForTensor:", v307);
            objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
            v149 = objc_claimAutoreleasedReturnValue();
            -[MLCGraph freeDeviceMemoryForTensorIfSafe:device:](v331, "freeDeviceMemoryForTensorIfSafe:device:", v149, v317);
LABEL_191:

            v98 = 0x1E981F000;
            goto LABEL_192;
          }
          v109 = v307;
LABEL_192:

LABEL_193:
          v96 = v99;
          v187 = v41++ == v44;
          v100 = v309 - 1;
          if (v187)
            goto LABEL_232;
        }
        objc_msgSend(v317, "computeEngine");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "sourceTensors");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "objectAtIndexedSubscript:", 0);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "shareDeviceMemoryWithResultTensor:sourceTensor:", v307, v159);

LABEL_148:
        goto LABEL_149;
      }
LABEL_232:
      v317 = v96;
      objc_msgSend(*(id *)(v98 + 2064), "execution");
      v246 = objc_claimAutoreleasedReturnValue();
      v247 = v246;
      if (v308 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v246))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D4999000, v247, OS_SIGNPOST_INTERVAL_END, spid, "ExecuteForward", (const char *)&unk_1D4ABD322, buf, 2u);
      }

      objc_msgSend(v325, "device");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "computeEngine");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "synchronizeTensor:", v325);

      objc_msgSend(v325, "device");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "computeEngine");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = v324;
      objc_msgSend(v324, "resultTensors");
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "objectAtIndexedSubscript:", 0);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "shareDeviceMemoryWithResultTensor:sourceTensor:", v254, v325);

      v19 = v316;
      v20 = v327;
      if (v310)
      {
        v255 = v331;
        -[MLCGraph dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:](v331, "dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:", v327, 0, 0, batchSize);
        v21 = v314;
        v256 = v323;
        if (v314)
        {
          objc_msgSend(v325, "descriptor");
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v257, v315);
          v334 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v334 = 0;
        }
      }
      else
      {
        objc_msgSend(v324, "resultTensors");
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v274, "objectAtIndexedSubscript:", 0);
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCGraph dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:](v331, "dispatchReadsForMultipleTensorOutputs:finalTensorInGraph:finalResultTensor:batchSize:", v327, v275, v325, batchSize);

        v21 = v314;
        v256 = v323;
        if (v314)
          v334 = v325;
        else
          v334 = 0;
        v255 = v331;
      }
      if ((v256 & 2) != 0)
      {
        if ((executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler__warnedAlready_0 & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v284 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v284, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(aSelector);
            v285 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v285;
            _os_log_impl(&dword_1D4999000, v284, OS_LOG_TYPE_INFO, "%@: Synchronous Execution requested", buf, 0xCu);

          }
          executeWithInputsData_lossLabelsData_lossLabelWeightsData_outputsData_batchSize_options_completionHandler__warnedAlready_0 = 1;
          v21 = v314;
        }
        -[MLCGraph device](v255, "device");
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v286, "computeEngine");
        v287 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v287, "commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:", v21, (v323 >> 2) & 1, v318, v334);
      }
      else
      {
        v288 = (v256 >> 2) & 1;
        -[MLCGraph device](v255, "device");
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v286, "computeEngine");
        v287 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v287, "commitWithCompletionHandler:enableProfiling:graphExecutionTime:graphResultTensor:", v21, v288, v318, v334);
      }

      -[MLCGraph setAllocateDeviceMemoryForTensorsInGraph:](v255, "setAllocateDeviceMemoryForTensorsInGraph:", 0);
      -[MLCGraph freeResourceList](v255, "freeResourceList");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v271, "removeAllObjects");
      v38 = 1;
      v264 = v325;
LABEL_286:

      v37 = v317;
      goto LABEL_38;
    }
    +[MLCLog execution](MLCLog, "execution");
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = v76;
    v78 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4999000, v77, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BindData", (const char *)&unk_1D4ABD322, buf, 2u);
    }
    v79 = (v323 >> 1) & 1;

    -[MLCGraph allInputs](self, "allInputs");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCGraph device](self, "device");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = -[MLCGraph bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:](self, "bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:", v15, v80, v81, batchSize, v79, 0);

    if (v82)
    {
      if (v18
        && (-[MLCGraph allLossLabels](self, "allLossLabels"),
            v83 = (void *)objc_claimAutoreleasedReturnValue(),
            -[MLCGraph device](self, "device"),
            v84 = (void *)objc_claimAutoreleasedReturnValue(),
            v85 = -[MLCGraph bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:](self, "bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:", v18, v83, v84, batchSize, v79, 0), v84, v83, !v85))
      {
        v277 = (void *)MEMORY[0x1E0CB3940];
        -[MLCGraph allLossLabels](self, "allLossLabels");
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v277, "stringWithFormat:", CFSTR("loss label name missing from loss labels specified at compile time allLossLabels=%@"), v278);
        v279 = objc_claimAutoreleasedReturnValue();

        +[MLCLog framework](MLCLog, "framework");
        v280 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();

        NSStringFromSelector(aSelector);
        v281 = (void *)objc_claimAutoreleasedReturnValue();
        v334 = (id)v279;
        +[MLCErrors invalidInputErrorForMethod:description:](MLCErrors, "invalidInputErrorForMethod:description:", v281, v279);
        v282 = objc_claimAutoreleasedReturnValue();

        v19 = v316;
        v20 = v327;
        v21 = v314;
        v264 = v325;
        if (v314)
          v314[2](v314, 0, (void *)v282, 0.0);
        v265 = (void *)v282;
        +[MLCLog execution](MLCLog, "execution");
        v283 = objc_claimAutoreleasedReturnValue();
        v267 = v283;
        if (v78 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v283))
          goto LABEL_282;
      }
      else
      {
        if (!v316
          || (-[MLCGraph allLossLabelWeights](self, "allLossLabelWeights"),
              v86 = (void *)objc_claimAutoreleasedReturnValue(),
              -[MLCGraph device](self, "device"),
              v87 = (void *)objc_claimAutoreleasedReturnValue(),
              v88 = -[MLCGraph bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:](self, "bindAndWriteData:forInputs:toDevice:batchSize:synchronous:skipWrite:", v316, v86, v87, batchSize, v79, 0), v87, v86, v88))
        {
          +[MLCLog execution](MLCLog, "execution");
          v89 = objc_claimAutoreleasedReturnValue();
          v90 = v89;
          v91 = spid - 1;
          if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D4999000, v90, OS_SIGNPOST_INTERVAL_END, spid, "BindData", (const char *)&unk_1D4ABD322, buf, 2u);
          }

          v74 = v323;
          goto LABEL_86;
        }
        v289 = (void *)MEMORY[0x1E0CB3940];
        -[MLCGraph allLossLabelWeights](self, "allLossLabelWeights");
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v289, "stringWithFormat:", CFSTR("loss label weight name missing from loss label weights specified at compile time allLossLabelWeights=%@"), v290);
        v291 = objc_claimAutoreleasedReturnValue();

        +[MLCLog framework](MLCLog, "framework");
        v292 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
          -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();

        NSStringFromSelector(aSelector);
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        v334 = (id)v291;
        +[MLCErrors invalidInputErrorForMethod:description:](MLCErrors, "invalidInputErrorForMethod:description:", v293, v291);
        v294 = objc_claimAutoreleasedReturnValue();

        v19 = v316;
        v20 = v327;
        v21 = v314;
        v264 = v325;
        if (v314)
          v314[2](v314, 0, (void *)v294, 0.0);
        v265 = (void *)v294;
        +[MLCLog execution](MLCLog, "execution");
        v295 = objc_claimAutoreleasedReturnValue();
        v267 = v295;
        if (v78 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v295))
        {
LABEL_282:

          v317 = 0;
          v38 = 0;
          v252 = v324;
          v271 = v265;
          goto LABEL_286;
        }
      }
    }
    else
    {
      v258 = (void *)MEMORY[0x1E0CB3940];
      -[MLCGraph allInputs](self, "allInputs");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "stringWithFormat:", CFSTR("input name missing from inputs specified at compile time allInputs=%@"), v259);
      v260 = objc_claimAutoreleasedReturnValue();

      +[MLCLog framework](MLCLog, "framework");
      v261 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR))
        -[MLCTrainingGraph executeWithInputsData:lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:].cold.3();

      NSStringFromSelector(aSelector);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      v334 = (id)v260;
      +[MLCErrors invalidInputErrorForMethod:description:](MLCErrors, "invalidInputErrorForMethod:description:", v262, v260);
      v263 = objc_claimAutoreleasedReturnValue();

      v19 = v316;
      v20 = v327;
      v21 = v314;
      v264 = v325;
      if (v314)
        v314[2](v314, 0, (void *)v263, 0.0);
      v265 = (void *)v263;
      +[MLCLog execution](MLCLog, "execution");
      v266 = objc_claimAutoreleasedReturnValue();
      v267 = v266;
      if (v78 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v266))
        goto LABEL_282;
    }
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v334;
    _os_signpost_emit_with_name_impl(&dword_1D4999000, v267, OS_SIGNPOST_INTERVAL_END, spid, "BindData", "%{public,name=Error}@", buf, 0xCu);
    goto LABEL_282;
  }
  NSStringFromSelector(a2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = CFSTR("Empty graph");
LABEL_35:
  +[MLCErrors invalidStateErrorForMethod:description:](MLCErrors, "invalidStateErrorForMethod:description:", v31, v32);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    v21[2](v21, 0, v37, 0.0);
  v38 = 0;
LABEL_38:

  return v38;
}

- (BOOL)linkWithGraphs:(NSArray *)graphs
{
  return 1;
}

- (id)resultTensorsForLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MLCInferenceGraph;
  -[MLCGraph resultTensorsForLayer:graphLayerList:](&v8, sel_resultTensorsForLayer_graphLayerList_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sourceTensorsForLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[MLCGraph graphLayerList](self, "graphLayerList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MLCInferenceGraph;
  -[MLCGraph sourceTensorsForLayer:graphLayerList:](&v8, sel_sourceTensorsForLayer_graphLayerList_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)inferenceNodeInit
{
  return self->_inferenceNodeInit;
}

- (void)setInferenceNodeInit:(unint64_t)a3
{
  self->_inferenceNodeInit = a3;
}

- (unint64_t)inferenceNodeIndexInGraphLayerList
{
  return self->_inferenceNodeIndexInGraphLayerList;
}

- (void)setInferenceNodeIndexInGraphLayerList:(unint64_t)a3
{
  self->_inferenceNodeIndexInGraphLayerList = a3;
}

- (void)concatenateWithSources:(const char *)a1 dimension:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Number of sources must be > 0", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)concatenateWithSources:(const char *)a1 dimension:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: dimension must be a value between 1 and 4", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)concatenateWithSources:(const char *)a1 dimension:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: source tensor is nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileWithOptions:device:inputTensors:inputTensorsData:.cold.5()
{
  NSObject *v0;
  void *v1;
  SEL v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  OUTLINED_FUNCTION_9_0();
  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v1;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_1D4999000, v0, OS_LOG_TYPE_ERROR, "%@: Compiling a layer (%@) in graph that has already been compiled with another device(%@)", (uint8_t *)&v5, 0x20u);

}

- (void)executeWithInputsData:(const char *)a1 lossLabelsData:lossLabelWeightsData:outputsData:batchSize:options:completionHandler:.cold.10(const char *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
