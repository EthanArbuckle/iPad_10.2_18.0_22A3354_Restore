@implementation _MLCGPUConvolution

- (_MLCGPUConvolution)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v13;
  id v14;
  _MLCGPUConvolution *v15;
  _MLCGPUConvolution *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unint64_t v85;
  void *v86;
  id *v87;
  uint64_t v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  void *v102;
  BOOL v103;
  unint64_t v104;
  int v105;
  unint64_t v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  unint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  unint64_t v119;
  void *v120;
  void *v121;
  unint64_t v122;
  void *v123;
  void *v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  _MLCGPUConvolution *v129;
  NSObject *v131;
  uint64_t v132;
  _MLCGPUConvolution *v133;
  uint64_t v134;
  void *v135;
  unint64_t v136;
  uint64_t v137;
  id v138;
  void *v139;
  _BOOL4 v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  BOOL v146;
  unint64_t v147;
  void *v148;
  uint64_t v149;
  id v150;
  id v151;
  id v152;
  objc_super v153;
  objc_super v154;
  objc_super v155;
  void *v156;
  _QWORD v157[2];
  uint8_t v158[4];
  uint64_t v159;
  _QWORD v160[2];
  id v161;
  _QWORD v162[4];
  void *v163;
  _QWORD v164[4];
  _QWORD v165[4];
  _QWORD v166[3];

  v166[1] = *MEMORY[0x1E0C80C00];
  v152 = a3;
  v151 = a4;
  v150 = a5;
  v13 = a6;
  v14 = a7;
  v155.receiver = self;
  v155.super_class = (Class)_MLCGPUConvolution;
  v15 = -[_MLCGPUConvolution init](&v155, sel_init);
  v16 = v15;
  if (!v15)
  {
LABEL_90:
    v129 = v16;
    goto LABEL_91;
  }
  v133 = v15;
  v139 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v17 = 0x1E0C99000;
  v138 = v14;
  v146 = +[MLCPlatformInfo gpuUseMPSGraphConvolution](MLCPlatformInfo, "gpuUseMPSGraphConvolution");
  if (v146)
  {
    v134 = 0;
    v135 = 0;
    v140 = 1;
LABEL_25:
    objc_msgSend(v152, "deviceList");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v37)
    {
      v38 = 0;
      do
      {
        if (v146)
        {
          v39 = objc_opt_new();
          v144 = objc_opt_new();
          +[MLCConvolutionGPUDeviceOps deviceOpsWithForwardMPSGraph:gradientMPSGraph:](MLCConvolutionGPUDeviceOps, "deviceOpsWithForwardMPSGraph:gradientMPSGraph:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setIsMPSGraph:", 1);
          v41 = objc_msgSend(v13, "paddingPolicy");
          if (v41)
            v42 = v41 == 1;
          else
            v42 = 2;
          v148 = (void *)v39;
          v141 = v42;
          if (objc_msgSend(v13, "isConvolutionTranspose"))
            v43 = objc_msgSend(v13, "outputFeatureChannelCount");
          else
            v43 = objc_msgSend(v13, "inputFeatureChannelCount");
          v48 = v43;
          v49 = objc_msgSend(v13, "groupCount");
          if (objc_msgSend(v13, "isConvolutionTranspose"))
            v50 = objc_msgSend(v13, "inputFeatureChannelCount");
          else
            v50 = objc_msgSend(v13, "outputFeatureChannelCount");
          v59 = v50;
          v147 = v38;
          if (objc_msgSend(v13, "usesDepthwiseConvolution"))
          {
            objc_msgSend(MEMORY[0x1E0CC7610], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", objc_msgSend(v13, "strideInX"), objc_msgSend(v13, "strideInY"), objc_msgSend(v13, "dilationRateInX"), objc_msgSend(v13, "dilationRateInY"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInY"), objc_msgSend(v13, "paddingSizeInY"), v141, 0, 3);
            v143 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CC7610], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", objc_msgSend(v13, "strideInX"), objc_msgSend(v13, "strideInY"), objc_msgSend(v13, "dilationRateInX"), objc_msgSend(v13, "dilationRateInY"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInY"), objc_msgSend(v13, "paddingSizeInY"), v141, 1, 3);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "kernelHeight"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v165[0] = v61;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "kernelWidth"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v165[1] = v62;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "inputFeatureChannelCount"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v165[2] = v63;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "outputFeatureChannelCount")/ (unint64_t)objc_msgSend(v13, "inputFeatureChannelCount"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v165[3] = v64;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 4);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "descriptor");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "placeholderWithShape:dataType:name:", v65, GPU_GetDataType(objc_msgSend(v66, "dataType")), 0);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "setDepthWiseConvolution:", 1);
          }
          else
          {
            v136 = v48 / v49;
            objc_msgSend(MEMORY[0x1E0CC7608], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", objc_msgSend(v13, "strideInX"), objc_msgSend(v13, "strideInY"), objc_msgSend(v13, "dilationRateInX"), objc_msgSend(v13, "dilationRateInY"), objc_msgSend(v13, "groupCount"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInY"), objc_msgSend(v13, "paddingSizeInY"), v141, 0, 3);
            v143 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CC7608], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", objc_msgSend(v13, "strideInX"), objc_msgSend(v13, "strideInY"), objc_msgSend(v13, "dilationRateInX"), objc_msgSend(v13, "dilationRateInY"), objc_msgSend(v13, "groupCount"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInY"), objc_msgSend(v13, "paddingSizeInY"), v141, 1, 3);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setConvolutionTranspose:", objc_msgSend(v13, "isConvolutionTranspose"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "kernelHeight"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v164[0] = v68;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "kernelWidth"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v164[1] = v69;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v136);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v164[2] = v70;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v59);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v164[3] = v71;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 4);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "descriptor");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "placeholderWithShape:dataType:name:", v72, GPU_GetDataType(objc_msgSend(v73, "dataType")), 0);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v40, "descriptorsForMPSGraph");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)v143;
          objc_msgSend(v74, "setObject:atIndexedSubscript:");

          objc_msgSend(v40, "descriptorsForMPSGraph");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setObject:atIndexedSubscript:", v60, 1);

          if (v138)
          {
            objc_msgSend(v40, "descriptorsForMPSGraph");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setObject:atIndexedSubscript:", v138, 2);

          }
          v163 = v67;
          v17 = 0x1E0C99000uLL;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v163, 1);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = (void *)objc_msgSend(v77, "mutableCopy");
          objc_msgSend(v40, "setMpsGraphTensors:", v78);

          if (v150)
          {
            objc_msgSend(v40, "setBiasChannelCount:", objc_msgSend(v13, "outputFeatureChannelCount"));
            v162[0] = &unk_1E9843F18;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v40, "biasChannelCount"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v162[1] = v79;
            v162[2] = &unk_1E9843F18;
            v162[3] = &unk_1E9843F18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 4);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "descriptor");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "placeholderWithShape:dataType:name:", v80, GPU_GetDataType(objc_msgSend(v81, "dataType")), 0);
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "mpsGraphTensors");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "addObject:", v82);

            objc_msgSend(v40, "setHasBias:", 1);
            v17 = 0x1E0C99000;
          }
          else
          {
            objc_msgSend(v40, "setHasBias:", 0);
          }
          v38 = v147;
          v58 = (void *)v144;

          v46 = v148;
        }
        else
        {
          objc_msgSend(v152, "deviceList");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectAtIndexedSubscript:", v38);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v140)
          {
            if (objc_msgSend(v13, "isConvolutionTranspose"))
            {
              v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6CC8]), "initWithDevice:weights:", v45, v135);
              v47 = (objc_class *)MEMORY[0x1E0CC6CD0];
            }
            else
            {
              v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6CA8]), "initWithDevice:weights:", v45, v135);
              v47 = (objc_class *)MEMORY[0x1E0CC6CB8];
            }
            v58 = (void *)objc_msgSend([v47 alloc], "initWithDevice:weights:", v45, v135);
          }
          else
          {
            objc_msgSend(v151, "childLayers");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectAtIndexedSubscript:", v134);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "deviceOps");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "objectAtIndexedSubscript:", v38);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "isConvolutionTranspose");
            objc_msgSend(v54, "forwardKernel");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "gradientKernel");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)objc_msgSend(v55, "copy");
            v57 = objc_msgSend(v56, "copy");

            v58 = (void *)v57;
          }
          v40 = 0;
          if (v46 && v58)
          {
            +[MLCGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:", v46, v58);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }

        if (!v40)
          goto LABEL_88;
        objc_msgSend(v152, "deviceList");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "count");

        if (v85 >= 2)
        {
          if (v150)
          {
            v160[0] = v151;
            v160[1] = v150;
            v86 = *(void **)(v17 + 3360);
            v87 = (id *)v160;
            v88 = 2;
          }
          else
          {
            v161 = v151;
            v86 = *(void **)(v17 + 3360);
            v87 = &v161;
            v88 = 1;
          }
          objc_msgSend(v86, "arrayWithObjects:count:", v87, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v40, "isMPSGraph");
          +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v40);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (v90)
          {
            objc_msgSend(v40, "setConvolutionMultiGPUChildOps:", v91);
            GPU_AllocateResourceForMultiGPUTraining(v152, v91, v89, v38);

          }
          else
          {

            GPU_AllocateResourceForMultiGPUTraining(v152, v91, v89, v38);
            v40 = v91;
          }

        }
        objc_msgSend(v40, "setLayer:", objc_opt_class());
        objc_msgSend(v40, "setSourceOfForwardNeededForGradient:", 1);
        objc_msgSend(v40, "setResultOfForwardNeededForGradient:", 0);
        if (!objc_msgSend(v40, "isMPSGraph"))
        {
          if (objc_msgSend(v13, "isConvolutionTranspose"))
            objc_msgSend(v40, "setLayer:", objc_opt_class());
          goto LABEL_87;
        }
        if (v38)
        {
          if (!v150)
            goto LABEL_86;
        }
        else
        {
          if (objc_msgSend(v152, "needToAllocateDeviceMemoryForTensor:", v151))
            objc_msgSend(v152, "allocateDeviceMemoryForTensor:", v151);
          objc_msgSend(v151, "deviceMemory");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "objectAtIndexedSubscript:", 0);
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          v94 = objc_msgSend(v13, "isConvolutionTranspose");
          objc_msgSend(v151, "data");
          v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v149 = objc_msgSend(v95, "bytes");
          v96 = objc_retainAutorelease(v93);
          v97 = objc_msgSend(v96, "contents");
          v98 = objc_msgSend(v13, "kernelWidth");
          v99 = objc_msgSend(v13, "kernelHeight");
          v100 = objc_msgSend(v13, "inputFeatureChannelCount");
          if (v94)
          {
            v101 = objc_msgSend(v13, "outputFeatureChannelCount");
            v145 = v101 / objc_msgSend(v13, "groupCount");
            objc_msgSend(v151, "descriptor");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v132) = objc_msgSend(v102, "dataType");
            v103 = +[MLCDataHelper convertSourceOIHW:toResultHWOI:width:height:inputFeatureChannelCount:outputFeatureChannelCount:dataType:](MLCDataHelper, "convertSourceOIHW:toResultHWOI:width:height:inputFeatureChannelCount:outputFeatureChannelCount:dataType:", v149, v97, v98, v99, v100, v145, v132);

          }
          else
          {
            v137 = v99;
            v142 = v95;
            v104 = objc_msgSend(v13, "groupCount");
            v105 = objc_msgSend(v13, "usesDepthwiseConvolution");
            v106 = objc_msgSend(v13, "outputFeatureChannelCount");
            if (v105)
              v106 /= (unint64_t)objc_msgSend(v13, "inputFeatureChannelCount");
            objc_msgSend(v151, "descriptor");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v132) = objc_msgSend(v107, "dataType");
            v103 = +[MLCDataHelper convertSourceOIHW:toResultHWIO:width:height:inputFeatureChannelCount:outputFeatureChannelCount:dataType:](MLCDataHelper, "convertSourceOIHW:toResultHWIO:width:height:inputFeatureChannelCount:outputFeatureChannelCount:dataType:", v149, v97, v98, v137, v100 / v104, v106, v132);

          }
          v17 = 0x1E0C99000uLL;
          v38 = 0;
          if (!v103)
          {
            +[MLCLog framework](MLCLog, "framework");
            v108 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
              -[_MLCGPUConvolution initWithDevice:weights:biasTerms:descriptor:neuronDescriptor:].cold.1(v158, &v159, v108);

          }
          +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, objc_msgSend(v96, "length"), v96);

          if (!v150)
          {
LABEL_86:
            objc_msgSend(v151, "deviceMemory");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "objectAtIndexedSubscript:", v38);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = v117;
            objc_msgSend(*(id *)(v17 + 3360), "arrayWithObjects:count:", &v156, 1);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = v38;
            v120 = (void *)objc_msgSend(v118, "copy");
            objc_msgSend(v40, "setExportableState:", v120);

            v38 = v119;
            goto LABEL_87;
          }
          if (objc_msgSend(v152, "needToAllocateDeviceMemoryForTensor:", v150))
            objc_msgSend(v152, "allocateDeviceMemoryForTensor:", v150);
          objc_msgSend(v152, "broadcastTensor:", v150);
        }
        objc_msgSend(v151, "deviceMemory");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "objectAtIndexedSubscript:", v38);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v157[0] = v110;
        objc_msgSend(v150, "deviceMemory");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "objectAtIndexedSubscript:", v38);
        v112 = v38;
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v157[1] = v113;
        objc_msgSend(*(id *)(v17 + 3360), "arrayWithObjects:count:", v157, 2);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = (void *)objc_msgSend(v114, "copy");
        objc_msgSend(v40, "setExportableState:", v115);

        v17 = 0x1E0C99000;
        v38 = v112;

LABEL_87:
        objc_msgSend(v139, "addObject:", v40);

LABEL_88:
        ++v38;
        objc_msgSend(v152, "deviceList");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v121, "count");

      }
      while (v38 < v122);
    }
    v123 = (void *)objc_msgSend(v139, "copy");
    v154.receiver = v133;
    v154.super_class = (Class)_MLCGPUConvolution;
    -[_MLCGPULayer setDeviceOps:](&v154, sel_setDeviceOps_, v123);

    v153.receiver = v133;
    v153.super_class = (Class)_MLCGPUConvolution;
    -[_MLCGPULayer deviceOps](&v153, sel_deviceOps);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v13, "paddingPolicy");
    v126 = objc_msgSend(v13, "paddingSizeInX");
    v127 = objc_msgSend(v13, "paddingSizeInY");
    v128 = v125;
    v16 = v133;
    GPU_SetPaddingPolicyForLayer(v152, v124, v128, v126, v127);

    v14 = v138;
    goto LABEL_90;
  }
  objc_msgSend(v151, "childLayers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = 0;
    while (1)
    {
      objc_msgSend(v151, "childLayers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "deviceOps");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v20;
      v25 = objc_msgSend(v23, "count");

      v140 = v25 == 0;
      if (v25)
        break;
      objc_msgSend(v151, "childLayers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      v20 = v24 + 1;
      if (v24 + 1 >= v27)
      {
        v134 = 0;
        goto LABEL_11;
      }
    }
    v134 = v24;
LABEL_11:
    v14 = v138;
    v17 = 0x1E0C99000uLL;
  }
  else
  {
    v134 = 0;
    v140 = 1;
  }
  v166[0] = v151;
  objc_msgSend(*(id *)(v17 + 3360), "arrayWithObjects:count:", v166, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");

  if (v150)
    objc_msgSend(v29, "addObject:", v150);
  GPU_GetDataSourceFromTensors(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    objc_msgSend(v30, "neuronDesc");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 != 0;

    v34 = (v138 != 0) ^ v33;
    v14 = v138;
    if ((v34 & 1) == 0)
    {
      v135 = v31;
LABEL_24:

      goto LABEL_25;
    }
  }
  else if (!v140)
  {
    v135 = 0;
    goto LABEL_24;
  }
  if (v14)
    +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:neuronDescriptor:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:neuronDescriptor:", v13, v150, v151, v14);
  else
    +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v13, v150, v151);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v135 = v35;
    GPU_AssociateDataSourceToTensors(v35, v29);
    goto LABEL_24;
  }
  +[MLCLog framework](MLCLog, "framework");
  v131 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    -[_MLCGPUConvolution initWithDevice:weights:biasTerms:descriptor:neuronDescriptor:].cold.2(a2, v131);

  v129 = 0;
  v16 = v133;
LABEL_91:

  return v129;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 weights:(id)a5 bias:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  void *v70;
  void *v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v62 = a4;
  v10 = a5;
  v11 = a6;
  v63 = v9;
  objc_msgSend(v9, "deviceList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    while (1)
    {
      objc_msgSend(v62, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "optimizerDeviceData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "momentumVectors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "optimizerDeviceData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "velocityVectors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "optimizerDeviceData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "centerWeightVectors");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      objc_msgSend(v10, "optimizerData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");

      if (!v52)
        goto LABEL_14;
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMomentumVectors:", v54);

      objc_msgSend(v10, "optimizerData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "count");

      if (v56 < 2)
        goto LABEL_14;
      objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVelocityVectors:", v58);

      objc_msgSend(v10, "optimizerData");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "count");

      if (v60 < 3)
        goto LABEL_14;
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCenterWeightVectors:", v30);
LABEL_13:

LABEL_14:
      ++v14;
      objc_msgSend(v63, "deviceList");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");

      if (v14 >= v50)
        goto LABEL_20;
    }
    v64 = v24;
    v65 = v21;
    v66 = v18;
    objc_msgSend(v11, "optimizerDeviceData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "momentumVectors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "optimizerDeviceData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "velocityVectors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "optimizerDeviceData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerWeightVectors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "optimizerData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v34, "count"))
      goto LABEL_11;
    objc_msgSend(v11, "optimizerData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
    {
      objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v37;
      objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMomentumVectors:", v39);

      objc_msgSend(v10, "optimizerData");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v34, "count") < 2)
        goto LABEL_11;
      objc_msgSend(v11, "optimizerData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (v41 < 2)
        goto LABEL_12;
      objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v42;
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVelocityVectors:", v44);

      objc_msgSend(v10, "optimizerData");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v34, "count") < 3)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v11, "optimizerData");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count");

      if (v46 >= 3)
      {
        objc_msgSend(v64, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = v34;
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v47;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCenterWeightVectors:", v48);

        goto LABEL_11;
      }
    }
LABEL_12:

    v21 = v65;
    v18 = v66;
    v24 = v64;
    goto LABEL_13;
  }
LABEL_20:

  return 1;
}

+ (void)setGradientComputeWeightsAndBiasOnly:(id)a3 deviceOps:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;

  v13 = a3;
  v5 = a4;
  objc_msgSend(v13, "deviceList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setComputeWeightsAndBiasOnly:", 1);
      if ((objc_msgSend(v9, "isMPSGraph") & 1) == 0)
      {
        objc_msgSend(v9, "gradientKernel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setGradientOption:", 2);

      }
      ++v8;
      objc_msgSend(v13, "deviceList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v8 < v12);
  }

}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  unint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  int v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  unint64_t v226;
  id v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  unint64_t v245;
  void *v246;
  void *v247;
  id v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  unsigned int DataType;
  void *v265;
  id v266;
  id v267;
  void *v268;
  _QWORD v269[3];
  _QWORD v270[3];
  _QWORD v271[3];
  _QWORD v272[4];
  _QWORD v273[4];
  _QWORD v274[4];
  _QWORD v275[4];
  _QWORD v276[4];
  _QWORD v277[4];
  _QWORD v278[4];
  _QWORD v279[4];
  _QWORD v280[4];
  _QWORD v281[4];
  _QWORD v282[4];
  _QWORD v283[4];
  _QWORD v284[4];
  _QWORD v285[6];

  v285[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v267 = a5;
  v266 = a6;
  v257 = v9;
  objc_msgSend(v9, "deviceList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    v228 = v10;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v13, v228);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isMPSGraph") & 1) != 0)
      {
        v244 = v14;
        objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v268, "forwardMPSGraph");
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v268, "gradientMPSGraph");
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "descriptor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        DataType = GPU_GetDataType(objc_msgSend(v16, "dataType"));

        objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "descriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "shape");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        v245 = v13;
        switch(v20)
        {
          case 1:
            v285[0] = &unk_1E9843F18;
            v285[1] = &unk_1E9843F18;
            v285[2] = &unk_1E9843F18;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "descriptor");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "shape");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v285[3] = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v285, 4);
            v263 = (void *)objc_claimAutoreleasedReturnValue();

            v284[0] = &unk_1E9843F18;
            v284[1] = &unk_1E9843F18;
            v284[2] = &unk_1E9843F18;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "descriptor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "shape");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v284[3] = v28;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v284, 4);
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          case 2:
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "descriptor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "shape");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v283[0] = v43;
            v283[1] = &unk_1E9843F18;
            v283[2] = &unk_1E9843F18;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "descriptor");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "shape");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v283[3] = v47;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v283, 4);
            v263 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "descriptor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "shape");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v282[0] = v28;
            v282[1] = &unk_1E9843F18;
            v282[2] = &unk_1E9843F18;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "descriptor");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "shape");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "objectAtIndexedSubscript:", 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v282[3] = v51;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v282, 4);
            v254 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v245;
LABEL_11:

            goto LABEL_16;
          case 3:
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v259, "descriptor");
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v255, "shape");
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v249, "objectAtIndexedSubscript:", 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v281[0] = v52;
            v281[1] = &unk_1E9843F18;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "descriptor");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "shape");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectAtIndexedSubscript:", 2);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v281[2] = v56;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "descriptor");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "shape");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "objectAtIndexedSubscript:", 1);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v281[3] = v60;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v281, 4);
            v263 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "descriptor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "shape");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            v280[0] = v260;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v250, "descriptor");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "shape");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectAtIndexedSubscript:", 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v280[1] = v64;
            v280[2] = &unk_1E9843F18;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "descriptor");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "shape");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "objectAtIndexedSubscript:", 2);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v280[3] = v68;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v280, 4);
            v254 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v245;
            goto LABEL_16;
          case 4:
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "descriptor");
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "shape");
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v256, "objectAtIndexedSubscript:", 0);
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            v279[0] = v251;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v246, "descriptor");
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v242, "shape");
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v240, "objectAtIndexedSubscript:", 2);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v279[1] = v69;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "descriptor");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "shape");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "objectAtIndexedSubscript:", 3);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v279[2] = v73;
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "descriptor");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "shape");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "objectAtIndexedSubscript:", 1);
            v77 = v13;
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v279[3] = v78;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v279, 4);
            v263 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v77;
            v79 = v267;
            goto LABEL_15;
          default:
            objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "descriptor");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "shape");
            v263 = (void *)objc_claimAutoreleasedReturnValue();

            v79 = v267;
LABEL_15:
            objc_msgSend(v79, "objectAtIndexedSubscript:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "descriptor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "shape");
            v254 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

            objc_msgSend(v266, "descriptor");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "shape");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v83, "count");

            switch(v84)
            {
              case 1:
                v278[0] = &unk_1E9843F18;
                v278[1] = &unk_1E9843F18;
                v278[2] = &unk_1E9843F18;
                objc_msgSend(v266, "descriptor");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "shape");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v278[3] = v87;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v278, 4);
                v262 = (void *)objc_claimAutoreleasedReturnValue();

                v277[0] = &unk_1E9843F18;
                v277[1] = &unk_1E9843F18;
                v277[2] = &unk_1E9843F18;
                objc_msgSend(v266, "descriptor");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "shape");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "objectAtIndexedSubscript:", 0);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v277[3] = v90;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v277, 4);
                v241 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_21;
              case 2:
                objc_msgSend(v266, "descriptor");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "shape");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "objectAtIndexedSubscript:", 0);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v276[0] = v93;
                v276[1] = &unk_1E9843F18;
                v276[2] = &unk_1E9843F18;
                objc_msgSend(v266, "descriptor");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "shape");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "objectAtIndexedSubscript:", 1);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                v276[3] = v96;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v276, 4);
                v262 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v266, "descriptor");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "shape");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "objectAtIndexedSubscript:", 0);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v275[0] = v90;
                v275[1] = &unk_1E9843F18;
                v275[2] = &unk_1E9843F18;
                objc_msgSend(v266, "descriptor");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "shape");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "objectAtIndexedSubscript:", 1);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v275[3] = v99;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v275, 4);
                v241 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_20;
              case 3:
                objc_msgSend(v266, "descriptor");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "shape");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "objectAtIndexedSubscript:", 0);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v274[0] = v102;
                v274[1] = &unk_1E9843F18;
                objc_msgSend(v266, "descriptor");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "shape");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "objectAtIndexedSubscript:", 2);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v274[2] = v105;
                objc_msgSend(v266, "descriptor");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "shape");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "objectAtIndexedSubscript:", 1);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v274[3] = v108;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v274, 4);
                v262 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v266, "descriptor");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "shape");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "objectAtIndexedSubscript:", 0);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v273[0] = v90;
                objc_msgSend(v266, "descriptor");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "shape");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "objectAtIndexedSubscript:", 1);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v273[1] = v110;
                v273[2] = &unk_1E9843F18;
                objc_msgSend(v266, "descriptor");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "shape");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "objectAtIndexedSubscript:", 2);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                v273[3] = v113;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v273, 4);
                v241 = (void *)objc_claimAutoreleasedReturnValue();

                v13 = v245;
LABEL_20:

LABEL_21:
                goto LABEL_25;
              case 4:
                objc_msgSend(v266, "descriptor");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "shape");
                v252 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v252, "objectAtIndexedSubscript:", 0);
                v247 = (void *)objc_claimAutoreleasedReturnValue();
                v272[0] = v247;
                objc_msgSend(v266, "descriptor");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "shape");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "objectAtIndexedSubscript:", 2);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                v272[1] = v117;
                objc_msgSend(v266, "descriptor");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v118, "shape");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "objectAtIndexedSubscript:", 3);
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v272[2] = v120;
                objc_msgSend(v266, "descriptor");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "shape");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "objectAtIndexedSubscript:", 1);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v272[3] = v123;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v272, 4);
                v262 = (void *)objc_claimAutoreleasedReturnValue();

                v13 = v245;
                v124 = v266;
                goto LABEL_24;
              default:
                objc_msgSend(v266, "descriptor");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v125, "shape");
                v262 = (void *)objc_claimAutoreleasedReturnValue();

                v124 = v266;
LABEL_24:
                objc_msgSend(v124, "descriptor");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "shape");
                v241 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

                objc_msgSend(v257, "deviceList");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "objectAtIndexedSubscript:", v13);
                v127 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v128, "descriptor");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "shape");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                v131 = objc_msgSend(v130, "count");

                objc_msgSend(v257, "gpuLibrary");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v132, "objectAtIndexedSubscript:", v13);
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                v134 = v133;
                if (v131 == 3)
                {
                  v135 = objc_msgSend(v133, "newFunctionWithName:", CFSTR("transpose_three_dims"));

                  v136 = (void *)objc_msgSend(&unk_1E98449A8, "copy");
                  objc_msgSend(v263, "objectAtIndexedSubscript:", 0);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  v271[0] = v137;
                  objc_msgSend(v263, "objectAtIndexedSubscript:", 2);
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  v271[1] = v138;
                  objc_msgSend(v263, "objectAtIndexedSubscript:", 3);
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  v271[2] = v139;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v271, 3);
                  v140 = (id)objc_claimAutoreleasedReturnValue();

                  v253 = (void *)objc_msgSend(&unk_1E98449C0, "copy");
                  objc_msgSend(v262, "objectAtIndexedSubscript:", 0);
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  v270[0] = v141;
                  objc_msgSend(v262, "objectAtIndexedSubscript:", 2);
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  v270[1] = v142;
                  objc_msgSend(v262, "objectAtIndexedSubscript:", 3);
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  v270[2] = v143;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v270, 3);
                  v248 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v135 = objc_msgSend(v133, "newFunctionWithName:", CFSTR("transpose_four_dims"));

                  v136 = (void *)objc_msgSend(&unk_1E98449D8, "copy");
                  v140 = v263;
                  v253 = (void *)objc_msgSend(&unk_1E98449F0, "copy");
                  v248 = v262;
                }
                v237 = (void *)v135;
                v239 = v127;
                v234 = (void *)objc_msgSend(v127, "newComputePipelineStateWithFunction:error:", v135, 0);
                +[MLCGPUDeviceOps deviceOpsWithForwardKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:");
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                v236 = v136;
                v145 = (void *)objc_msgSend(v136, "mutableCopy");
                objc_msgSend(v144, "setTransposeShape:", v145);

                objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v146, "descriptor");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v140, objc_msgSend(v147, "dataType"));
                v148 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v149, "descriptor");
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                v235 = v140;
                +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v140, objc_msgSend(v150, "dataType"));
                v151 = objc_claimAutoreleasedReturnValue();

                v152 = (void *)objc_msgSend(v253, "mutableCopy");
                objc_msgSend(v144, "setTransposeGradientShape:", v152);

                objc_msgSend(v266, "descriptor");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v248, objc_msgSend(v153, "dataType"));
                v154 = objc_claimAutoreleasedReturnValue();

                v231 = (void *)v151;
                v232 = (void *)v148;
                v269[0] = v148;
                v269[1] = v154;
                v269[2] = v151;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v269, 3);
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                v156 = (void *)objc_msgSend(v155, "copy");
                v157 = v268;
                objc_msgSend(v268, "setTransposedTensors:", v156);

                v233 = v144;
                objc_msgSend(v268, "setTransposeDeviceOps:", v144);
                objc_msgSend(v258, "placeholderWithShape:dataType:name:", v254, DataType, 0);
                v158 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v268, "mpsGraphTensors");
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v159, "objectAtIndexedSubscript:", 0);
                v160 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v268, "descriptorsForMPSGraph");
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "objectAtIndexedSubscript:", 0);
                v162 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v268, "descriptorsForMPSGraph");
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v163, "objectAtIndexedSubscript:", 1);
                v164 = objc_claimAutoreleasedReturnValue();

                v230 = (void *)v154;
                v243 = (void *)v162;
                if (objc_msgSend(v268, "depthWiseConvolution"))
                {
                  v165 = (void *)v160;
                  objc_msgSend(v258, "depthwiseConvolution2DWithSourceTensor:weightsTensor:descriptor:name:", v158, v160, v162, 0);
                  v166 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v165 = (void *)v160;
                  if (objc_msgSend(v268, "convolutionTranspose"))
                    objc_msgSend(v258, "convolutionTranspose2DWithSourceTensor:weightsTensor:outputShape:descriptor:name:", v158, v160, v241, v162, 0);
                  else
                    objc_msgSend(v258, "convolution2DWithSourceTensor:weightsTensor:descriptor:name:", v158, v160, v162, 0);
                  v166 = objc_claimAutoreleasedReturnValue();
                }
                v167 = (void *)v166;
                v168 = (void *)v164;
                objc_msgSend(v268, "mpsGraphTensors");
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                v229 = (void *)v158;
                objc_msgSend(v169, "addObject:", v158);

                v170 = objc_msgSend(v268, "hasBias");
                objc_msgSend(v268, "mpsGraphTensors");
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                v172 = v171;
                if (v170)
                {
                  objc_msgSend(v171, "objectAtIndexedSubscript:", 1);
                  v173 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v258, "additionWithPrimaryTensor:secondaryTensor:name:", v167, v173, 0);
                  v174 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v268, "mpsGraphTensors");
                  v175 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v175, "addObject:", v174);

                  v172 = (void *)v173;
                }
                else
                {
                  objc_msgSend(v171, "addObject:", v167);
                }
                v176 = v265;
                v177 = v165;

                objc_msgSend(v268, "descriptorsForMPSGraph");
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                v179 = objc_msgSend(v178, "count");

                if (v179 >= 3)
                {
                  objc_msgSend(v268, "descriptorsForMPSGraph");
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v180, "objectAtIndexedSubscript:", 2);
                  v181 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v268, "mpsGraphTensors");
                  v182 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v268, "mpsGraphTensors");
                  v183 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v182, "objectAtIndexedSubscript:", objc_msgSend(v183, "count") - 1);
                  v184 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v181, "activationType") == 1)
                  {
                    objc_msgSend(v258, "reLUWithTensor:name:", v184, 0);
                    v185 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else if (objc_msgSend(v181, "activationType") == 3)
                  {
                    objc_msgSend(v258, "sigmoidWithTensor:name:", v184, 0);
                    v185 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v185 = v184;
                  }
                  v204 = v185;
                  objc_msgSend(v268, "mpsGraphTensors");
                  v205 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v268, "mpsGraphTensors");
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v205, "setObject:atIndexedSubscript:", v204, objc_msgSend(v206, "count") - 1);

                  v157 = v268;
                  v176 = v265;
                }
                objc_msgSend(v176, "placeholderWithShape:dataType:name:", v262, DataType, 0);
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v165, "shape");
                v208 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v176, "placeholderWithShape:dataType:name:", v208, DataType, 0);
                v209 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v157, "depthWiseConvolution"))
                {
                  v210 = v263;
                  objc_msgSend(v176, "depthwiseConvolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShape:descriptor:name:", v207, v209, v263, v168, 0);
                  v211 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v210 = v263;
                  if (objc_msgSend(v157, "convolutionTranspose"))
                    objc_msgSend(v176, "convolutionTranspose2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShape:forwardConvolutionDescriptor:name:", v207, v209, v263, v168, 0);
                  else
                    objc_msgSend(v176, "convolution2DDataGradientWithIncomingGradientTensor:weightsTensor:outputShape:forwardConvolutionDescriptor:name:", v207, v209, v263, v168, 0);
                  v211 = objc_claimAutoreleasedReturnValue();
                }
                v212 = (void *)v211;
                objc_msgSend(v176, "placeholderWithShape:dataType:name:", v210, DataType, 0);
                v213 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v157, "depthWiseConvolution"))
                {
                  objc_msgSend(v177, "shape");
                  v214 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v176, "depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShape:descriptor:name:", v207, v213, v214, v168, 0);
                  v215 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v216 = objc_msgSend(v157, "convolutionTranspose");
                  objc_msgSend(v177, "shape");
                  v214 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v216)
                    objc_msgSend(v265, "convolutionTranspose2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShape:forwardConvolutionDescriptor:name:", v207, v213, v214, v168, 0);
                  else
                    objc_msgSend(v265, "convolution2DWeightsGradientWithIncomingGradientTensor:sourceTensor:outputShape:forwardConvolutionDescriptor:name:", v207, v213, v214, v168, 0);
                  v215 = objc_claimAutoreleasedReturnValue();
                }
                v217 = (void *)v215;

                objc_msgSend(v157, "mpsGraphTensors");
                v218 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v218, "addObject:", v207);

                objc_msgSend(v268, "mpsGraphTensors");
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v219, "addObject:", v209);

                objc_msgSend(v268, "mpsGraphTensors");
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v220, "addObject:", v212);

                objc_msgSend(v268, "mpsGraphTensors");
                v221 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v221, "addObject:", v213);

                objc_msgSend(v268, "mpsGraphTensors");
                v222 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v222, "addObject:", v217);

                v29 = v268;
                if (objc_msgSend(v268, "hasBias"))
                {
                  objc_msgSend(v265, "reductionSumWithTensor:axes:name:", v207, &unk_1E9844A08, 0);
                  v223 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v268, "mpsGraphTensors");
                  v224 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v224, "addObject:", v223);

                  v29 = v268;
                }

                v13 = v245;
                break;
            }
            break;
        }
        goto LABEL_65;
      }
      objc_msgSend(v14, "forwardKernel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_66;
      objc_msgSend(v29, "padding");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_66;
      v244 = v14;
      objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "descriptor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "shape");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35 == 4)
        break;
      objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "descriptor");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "shape");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = objc_msgSend(v188, "count");

      if (v189 == 3)
      {
        v36 = v29;
        v37 = v13;
        v39 = 0;
        v38 = 2;
        goto LABEL_44;
      }
LABEL_47:
      +[_MLCGPUConvolutionTransposePadding convolutionTransposeZeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:](_MLCGPUConvolutionTransposePadding, "convolutionTransposeZeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setPadding:");
LABEL_65:

      v10 = v228;
      v14 = v244;
LABEL_66:

      ++v13;
      objc_msgSend(v257, "deviceList");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      v226 = objc_msgSend(v225, "count");

      if (v13 >= v226)
        goto LABEL_67;
    }
    v36 = v29;
    v37 = v13;
    v38 = 3;
    v39 = 2;
LABEL_44:
    objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "descriptor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "shape");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "objectAtIndexedSubscript:", v38);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "floatValue");
    objc_msgSend(v36, "strideInPixelsX");
    objc_msgSend(v36, "dilationRateX");
    objc_msgSend(v36, "kernelWidth");

    objc_msgSend(v266, "descriptor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "shape");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "objectAtIndexedSubscript:", v38);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "floatValue");

    if (v35 == 4)
    {
      objc_msgSend(v267, "objectAtIndexedSubscript:", 0);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v197, "descriptor");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "shape");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "objectAtIndexedSubscript:", v39);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "floatValue");
      objc_msgSend(v36, "strideInPixelsY");
      objc_msgSend(v36, "dilationRateY");
      objc_msgSend(v36, "kernelHeight");

      objc_msgSend(v266, "descriptor");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "shape");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "objectAtIndexedSubscript:", v39);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "floatValue");

    }
    v13 = v37;
    v29 = v36;
    goto LABEL_47;
  }
LABEL_67:

  return 1;
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:weights:biasTerms:descriptor:neuronDescriptor:", v16, v15, v14, v13, v12);

  return v17;
}

- (void)initWithDevice:(NSObject *)a3 weights:biasTerms:descriptor:neuronDescriptor:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[_MLCGPUConvolution initWithDevice:weights:biasTerms:descriptor:neuronDescriptor:]";
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a3, (uint64_t)a3, "%s: failed to convert weight layout for a convolution layer", a1);
}

- (void)initWithDevice:(const char *)a1 weights:(NSObject *)a2 biasTerms:descriptor:neuronDescriptor:.cold.2(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a2, v4, "%@: mpsWeightsConvolution creation failed", (uint8_t *)&v5);

}

@end
