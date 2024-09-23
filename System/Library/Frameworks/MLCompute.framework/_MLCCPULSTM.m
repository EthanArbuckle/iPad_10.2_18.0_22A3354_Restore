@implementation _MLCCPULSTM

- (_MLCCPULSTM)initWithDevice:(id)a3 lstmDescriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11
{
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  char v45;
  size_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  size_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  int v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  size_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  int v101;
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
  _MLCCPULSTM *v114;
  uint64_t v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  void *v131;
  id v132;
  id v133;
  id v134;
  id v135;
  void *v136;
  uint64_t v137;
  void *v138;
  objc_super v139;
  _OWORD v140[11];
  _OWORD v141[11];
  _QWORD v142[5];
  int v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  _QWORD v154[2];
  _QWORD v155[3];
  int v156;
  int v157;
  _QWORD v158[88];
  _OWORD v159[8];
  uint64_t v160;
  uint64_t v161;
  _QWORD v162[88];
  _OWORD v163[8];
  uint64_t v164;
  uint64_t v165;
  _QWORD v166[88];
  _OWORD v167[8];
  uint64_t v168;
  uint64_t v169;
  _QWORD v170[88];
  _OWORD v171[8];
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  _QWORD v176[3];

  v11 = MEMORY[0x1E0C80A78](self);
  v13 = v12;
  v121 = v14;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v117 = (void *)v11;
  v176[1] = *MEMORY[0x1E0C80C00];
  v118 = v21;
  v22 = v20;
  v23 = v18;
  v24 = v16;
  v25 = v13;
  v26 = a9;
  v27 = a10;
  v28 = (void *)MEMORY[0x1E0C9AA60];
  v122 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  bzero(v155, 0x13A0uLL);
  bzero(v142, 0x13B0uLL);
  v29 = (void *)objc_msgSend(v28, "mutableCopy");
  v30 = (void *)objc_msgSend(v28, "mutableCopy");
  v31 = v22;
  v129 = v23;
  v128 = v25;
  v133 = v30;
  v135 = v29;
  v127 = v24;
  v134 = v26;
  v132 = v27;
  v154[0] = objc_msgSend(v31, "inputSize");
  v154[1] = objc_msgSend(v31, "hiddenSize");
  v137 = objc_msgSend(v31, "hiddenSize");
  v32 = objc_msgSend(v31, "layerCount");
  v33 = objc_msgSend(v31, "isBidirectional");
  if (v33)
  {
    v157 = 1;
    v34 = 2;
  }
  else
  {
    v34 = 1;
  }
  v130 = v34;
  objc_msgSend(v31, "dropout");
  v156 = v35;
  v155[1] = objc_msgSend(v31, "layerCount");
  objc_msgSend(v134, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  setBNNSActivation((uint64_t)&v161, v36);

  objc_msgSend(v134, "objectAtIndexedSubscript:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  setBNNSActivation((uint64_t)&v165, v37);

  objc_msgSend(v134, "objectAtIndexedSubscript:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  setBNNSActivation((uint64_t)&v169, v38);

  objc_msgSend(v134, "objectAtIndexedSubscript:", 3);
  v136 = v31;
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  setBNNSActivation((uint64_t)&v173, v39);
  setBNNSActivation((uint64_t)&v174, v132);

  setBNNSLSTMGateDesc((uint64_t)v158, v136);
  setBNNSLSTMGateDesc((uint64_t)v162, v136);
  setBNNSLSTMGateDesc((uint64_t)v166, v136);
  setBNNSLSTMGateDesc((uint64_t)v170, v136);
  addInputWeightPointersToGate((uint64_t)v158, v129, v33, v32, 0, v133, 1);
  addInputWeightPointersToGate((uint64_t)v162, v129, v33, v32, 1, v133, 1);
  addInputWeightPointersToGate((uint64_t)v166, v129, v33, v32, 2, v133, 1);
  addInputWeightPointersToGate((uint64_t)v170, v129, v33, v32, 3, v133, 1);
  if (v32 >= 2)
  {
    addInputWeightPointersToGate((uint64_t)v158, v129, v33, v32, 0, v133, 0);
    addInputWeightPointersToGate((uint64_t)v162, v129, v33, v32, 1, v133, 0);
    addInputWeightPointersToGate((uint64_t)v166, v129, v33, v32, 2, v133, 0);
    addInputWeightPointersToGate((uint64_t)v170, v129, v33, v32, 3, v133, 0);
  }
  createParameterPointersForGate(v127, 0, v32, v33, v133);
  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v158[61] = objc_msgSend(v40, "bytes");

  createParameterPointersForGate(v127, 1, v32, v33, v133);
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v162[61] = objc_msgSend(v41, "bytes");

  createParameterPointersForGate(v127, 2, v32, v33, v133);
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v166[61] = objc_msgSend(v42, "bytes");

  createParameterPointersForGate(v127, 3, v32, v33, v133);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_retainAutorelease(v43);
  v170[61] = objc_msgSend(v44, "bytes");

  if (v128)
  {
    if (v32 == 1)
      v45 = v33;
    else
      v45 = 1;
    if ((v45 & 1) != 0)
    {
      v46 = 4 * v137 * v32 * v130;
      createBiDirectionalAndStackedGateWeightData(v46, v128, objc_msgSend(v136, "isBidirectional"), v32, 0, v137, v135);
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v160 = objc_msgSend(v47, "bytes");

      createBiDirectionalAndStackedGateWeightData(v46, v128, objc_msgSend(v136, "isBidirectional"), v32, 1, v137, v135);
      v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v164 = objc_msgSend(v48, "bytes");

      createBiDirectionalAndStackedGateWeightData(v46, v128, objc_msgSend(v136, "isBidirectional"), v32, 2, v137, v135);
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v168 = objc_msgSend(v49, "bytes");

      createBiDirectionalAndStackedGateWeightData(v46, v128, objc_msgSend(v136, "isBidirectional"), v32, 3, v137, v135);
      v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v172 = objc_msgSend(v50, "bytes");
    }
    else
    {
      objc_msgSend(v128, "objectAtIndexedSubscript:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "data");
      v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v160 = objc_msgSend(v52, "bytes");

      objc_msgSend(v128, "objectAtIndexedSubscript:", 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "data");
      v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v164 = objc_msgSend(v54, "bytes");

      objc_msgSend(v128, "objectAtIndexedSubscript:", 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "data");
      v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v168 = objc_msgSend(v56, "bytes");

      objc_msgSend(v128, "objectAtIndexedSubscript:", 3);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "data");
      v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v172 = objc_msgSend(v57, "bytes");

    }
  }

  if (a11)
    v156 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v154, 5040);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v141, 0, sizeof(v141));
  memset(v140, 0, sizeof(v140));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v141, 176);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v140, 176);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = MEMORY[0x1D82638C4](v154);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_valloc(v58, 0xA5F35CCAuLL), v58, 1);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v136, "inputSize");
  v60 = objc_msgSend(v136, "hiddenSize");
  v61 = objc_msgSend(v136, "layerCount");
  v62 = objc_msgSend(v136, "isBidirectional");
  v63 = objc_msgSend(v136, "usesBiases");
  v64 = 8;
  if (v63)
    v64 = 12;
  if (v121)
    v64 += 4;
  if (v61 > 1)
    v64 += 4;
  v116 = v64;
  v65 = (void *)MEMORY[0x1E0C9AA60];
  v123 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v138 = (void *)objc_msgSend(v65, "mutableCopy");
  v131 = (void *)objc_msgSend(v65, "mutableCopy");
  v119 = (void *)objc_msgSend(v65, "mutableCopy");
  v66 = 3;
  v67 = objc_msgSend(v136, "isBidirectional");
  v68 = 0;
  v69 = (v61 << v62) * v60;
  do
  {
    v70 = (void *)objc_msgSend(v65, "mutableCopy");
    buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:atIndexedSubscript:", v71, 0);

    buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:atIndexedSubscript:", v72, 1);

    buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:atIndexedSubscript:", v73, 2);

    buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setObject:atIndexedSubscript:", v74, 3);

    if (v61 >= 2)
    {
      buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:atIndexedSubscript:", v75, 4);

      buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:atIndexedSubscript:", v76, 5);

      buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:atIndexedSubscript:", v77, 6);

      buildBNNSDescInputWeightMomentumForOneGate(v59, v60, v61, v67, 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:atIndexedSubscript:", v78, 7);

    }
    objc_msgSend(v138, "setObject:atIndexedSubscript:", v70, v68);

    ++v68;
  }
  while (v68 != 3);
  v79 = 0;
  v80 = (void *)MEMORY[0x1E0C9AA60];
  do
  {
    v81 = (void *)objc_msgSend(v80, "mutableCopy");
    buildBNNSDescHiddenWeightMomentumForOneGate(v60, v61, v67);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:atIndexedSubscript:", v82, 0);

    buildBNNSDescHiddenWeightMomentumForOneGate(v60, v61, v67);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:atIndexedSubscript:", v83, 1);

    buildBNNSDescHiddenWeightMomentumForOneGate(v60, v61, v67);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:atIndexedSubscript:", v84, 2);

    buildBNNSDescHiddenWeightMomentumForOneGate(v60, v61, v67);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:atIndexedSubscript:", v85, 3);

    objc_msgSend(v131, "setObject:atIndexedSubscript:", v81, v79);
    ++v79;
  }
  while (v79 != 3);
  v86 = v119;
  if (objc_msgSend(v136, "usesBiases"))
  {
    v87 = 3;
    do
    {
      createNewBNNSNDArrayForLSTM(v69, v159);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setObject:atIndexedSubscript:", v88, v87 - 3);

      createNewBNNSNDArrayForLSTM(v69, v163);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setObject:atIndexedSubscript:", v89, v87 - 2);

      createNewBNNSNDArrayForLSTM(v69, v167);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setObject:atIndexedSubscript:", v90, v87 - 1);

      createNewBNNSNDArrayForLSTM(v69, v171);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setObject:atIndexedSubscript:", v91, v87);

      v87 += 4;
      --v66;
    }
    while (v66);
  }
  v176[0] = v125;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = v124;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v175, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCRNNCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCRNNCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 17, v126, v92, v93, 0, 0, v123, v119);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = v131;
  v96 = v136;
  if (v94)
  {
    objc_msgSend(v122, "addObject:", v94);
    objc_msgSend(v94, "setBatchFirst:", objc_msgSend(v136, "batchFirst"));
    objc_msgSend(v94, "setHasBias:", objc_msgSend(v136, "usesBiases"));
    objc_msgSend(v94, "setHasPeephole:", v121 != 0);
    v97 = v136;
    v98 = v134;
    v99 = v132;
    v100 = objc_msgSend(v97, "layerCount");
    v142[0] = objc_msgSend(v97, "inputSize");
    v142[1] = objc_msgSend(v97, "hiddenSize");
    v142[3] = v100;
    if (objc_msgSend(v97, "isBidirectional"))
      v144 = 1;
    objc_msgSend(v97, "dropout");
    v143 = v101;
    objc_msgSend(v98, "objectAtIndexedSubscript:", 0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    setBNNSActivation((uint64_t)&v146, v102);

    objc_msgSend(v98, "objectAtIndexedSubscript:", 1);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    setBNNSActivation((uint64_t)&v148, v103);

    objc_msgSend(v98, "objectAtIndexedSubscript:", 2);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    setBNNSActivation((uint64_t)&v150, v104);

    objc_msgSend(v98, "objectAtIndexedSubscript:", 3);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    setBNNSActivation((uint64_t)&v152, v105);
    setBNNSActivation((uint64_t)&v153, v99);

    setBNNSLSTMGateDesc((uint64_t)&v145, v97);
    setBNNSLSTMGateDesc((uint64_t)&v147, v97);
    setBNNSLSTMGateDesc((uint64_t)&v149, v97);
    setBNNSLSTMGateDesc((uint64_t)&v151, v97);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v142, 5040);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setLstmDeltaParams:", v106);
    objc_msgSend(v94, "setTrainingCache:", v120);
    objc_msgSend(v94, "setCombinedGateWeightsAndBias:", v135);
    objc_msgSend(v94, "setParameterPointers:", v133);
    objc_msgSend(v94, "setReturnsSequences:", objc_msgSend(v97, "returnsSequences"));
    objc_msgSend(v94, "setNumLayers:", objc_msgSend(v97, "layerCount"));
    objc_msgSend(v94, "setBiDirectional:", objc_msgSend(v97, "isBidirectional"));
    objc_msgSend(v94, "setInputSize:", objc_msgSend(v97, "inputSize"));
    objc_msgSend(v94, "setHiddenSize:", objc_msgSend(v97, "hiddenSize"));
    objc_msgSend(v94, "setNumParametersForSingleLSTM:", v116);
    v107 = (void *)MEMORY[0x1E0C9AA60];
    v108 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v94, "setCombinedInputsBuffer:", v108);

    v109 = (void *)objc_msgSend(v107, "mutableCopy");
    objc_msgSend(v94, "setCombinedOutputsBuffer:", v109);

    objc_msgSend(v94, "setInputWeightsMomentumDescData:", v138);
    v95 = v131;
    objc_msgSend(v94, "setHiddenWeightsMomentumDescData:", v131);
    if (!a11)
    {
      v110 = (void *)MEMORY[0x1E0C9AA60];
      v111 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v94, "setInputWeightsDeltaPointers:", v111);

      v112 = (void *)objc_msgSend(v110, "mutableCopy");
      objc_msgSend(v94, "setHiddenWeightsDeltaPointers:", v112);

    }
    v96 = v136;
    v86 = v119;
  }
  v113 = (void *)objc_msgSend(v122, "copy");
  v139.receiver = v117;
  v139.super_class = (Class)_MLCCPULSTM;
  v114 = -[_MLCCPULayer initWithDevice:deviceOps:](&v139, sel_initWithDevice_deviceOps_, v118, v113);

  return v114;
}

+ (id)layerWithDevice:(id)a3 lstmDescriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 ouputResultActivation:(id)a10 inferenceOnly:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v28;

  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  LOBYTE(v28) = a11;
  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:lstmDescriptor:inputWeights:hiddenWeights:peepholeWeights:biasTerms:gateActivations:outputResultActivation:inferenceOnly:", v25, v24, v23, v22, v21, v20, v19, v18, v28);

  return v26;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v7;
  void *v8;
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v28;

  v7 = a5;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "params");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (uint64_t *)objc_msgSend(v9, "bytes");
  objc_msgSend(v8, "lstmDeltaParams");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (uint64_t *)objc_msgSend(v11, "bytes");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v8, "batchFirst") ^ 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  if (objc_msgSend(v8, "batchFirst") && objc_msgSend(v15, "count") == 4)
  {
    v28 = v9;
    v18 = v12;
    v19 = 1;
    v20 = 3;
LABEL_11:
    objc_msgSend(v15, "objectAtIndexedSubscript:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v15, "objectAtIndexedSubscript:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v23, "unsignedIntegerValue");

    v12 = v18;
    v9 = v28;
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "batchFirst") && objc_msgSend(v15, "count") == 3)
  {
    v28 = v9;
    v18 = v12;
    v19 = 2;
    v20 = 1;
    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "batchFirst") & 1) == 0)
  {
    v20 = 0;
    if (objc_msgSend(v15, "count") != 3)
    {
      v21 = 0;
      goto LABEL_13;
    }
    v28 = v9;
    v18 = v12;
    v19 = 2;
    goto LABEL_11;
  }
  v20 = 0;
  v21 = 0;
LABEL_13:
  if (CPU_BuildBNNSLSTMInputAndOutput(v10, v17, v20, v21, v8)
    && CPU_BuildBNNSLSTMInputAndOutput(v12, v17, v20, v21, v8))
  {
    objc_opt_class();
    v24 = (void *)objc_opt_new();
    objc_msgSend(v8, "setLayer:", v24);

    objc_msgSend(v8, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFilter:", 0);

    v26 = 1;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForInputWeights:(id)a5 dataForHiddenWeights:(id)a6 dataForPeepholeWeights:(id)a7 dataForBias:(id)a8
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  size_t v19;
  char v20;
  uint64_t i;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  size_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  size_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v73;
  size_t v74;
  uint64_t v75;
  size_t size;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  id v87;
  id v88;

  v87 = a5;
  v88 = a6;
  v11 = a8;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "inferenceOnly") & 1) == 0)
  {
    objc_msgSend(v87, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "optimizerData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    objc_msgSend(v12, "setNumAccumulatorsPerParameter:", v15);
    v16 = objc_msgSend(v12, "numLayers");
    v17 = objc_msgSend(v12, "biDirectional");
    if (v15)
    {
      v73 = v11;
      v18 = 0;
      if (v17)
        v19 = 16;
      else
        v19 = 8;
      v85 = 4 * v16;
      v86 = v16;
      v83 = v16 - 1;
      v75 = v15;
      size = 8 * ((v16 - 1) << v17);
      v20 = v17;
      v74 = v19;
      do
      {
        v82 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        for (i = 0; i != 4; ++i)
        {
          v22 = malloc_type_malloc(v19, 0x80040B8603338uLL);
          objc_msgSend(v87, "objectAtIndexedSubscript:", i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "optimizerData");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *v22 = objc_msgSend(v25, "bytes");

          if (objc_msgSend(v12, "biDirectional"))
          {
            objc_msgSend(v87, "objectAtIndexedSubscript:", v85 + i);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "optimizerData");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndexedSubscript:", v18);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = objc_msgSend(v28, "bytes");

          }
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v22, v19, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "addObject:", v29);
          objc_msgSend(v12, "inputWeightsMomentumDescData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v18);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectAtIndexedSubscript:", i);
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v33 = objc_msgSend(v32, "bytes");

          v34 = objc_retainAutorelease(v29);
          *(_QWORD *)(v33 + 136) = objc_msgSend(v34, "bytes");

        }
        v35 = size;
        if (v86 >= 2)
        {
          v80 = 0;
          v36 = 4;
          do
          {
            v37 = malloc_type_malloc(v35, 0x80040B8603338uLL);
            v38 = 0;
            v78 = v36;
            v39 = v36;
            do
            {
              objc_msgSend(v87, "objectAtIndexedSubscript:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "optimizerData");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectAtIndexedSubscript:", v18);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v37[v38 << v20] = objc_msgSend(v42, "bytes");

              if (objc_msgSend(v12, "biDirectional"))
              {
                objc_msgSend(v87, "objectAtIndexedSubscript:", v85 + v39);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "optimizerData");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "objectAtIndexedSubscript:", v18);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v37[(v38 << v20) + 1] = objc_msgSend(v45, "bytes");

              }
              v39 += 4;
              ++v38;
            }
            while (v83 != v38);
            v35 = size;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v37, size, 0);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v80;
            objc_msgSend(v82, "setObject:atIndexedSubscript:", v77, v80 + 4);
            objc_msgSend(v12, "inputWeightsMomentumDescData");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", v18);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectAtIndexedSubscript:", v80 + 4);
            v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v50 = objc_msgSend(v49, "bytes");

            *(_QWORD *)(v50 + 136) = v37;
            v36 = v78 + 1;
            ++v80;
          }
          while (v46 != 3);
        }
        objc_msgSend(v12, "bnnsInputWeightsMomentumPointers");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:atIndexedSubscript:", v82, v18);

        ++v18;
        v19 = v74;
      }
      while (v18 != v75);
      v52 = 0;
      v53 = v86;
      v54 = 8 * (v86 << v20);
      do
      {
        v79 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v84 = 0;
        do
        {
          v55 = malloc_type_malloc(v54, 0x80040B8603338uLL);
          if (v53)
          {
            v56 = 0;
            v57 = v84;
            do
            {
              objc_msgSend(v88, "objectAtIndexedSubscript:", v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "optimizerData");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectAtIndexedSubscript:", v52);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v55[v56 << v20] = objc_msgSend(v60, "bytes");

              if (objc_msgSend(v12, "biDirectional"))
              {
                objc_msgSend(v88, "objectAtIndexedSubscript:", v85 + v57);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "optimizerData");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "objectAtIndexedSubscript:", v52);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v55[(v56 << v20) + 1] = objc_msgSend(v63, "bytes");

              }
              ++v56;
              v57 += 4;
              v53 = v86;
            }
            while (v86 != v56);
          }
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v55, 8 * (v86 << v20), 0);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v84;
          objc_msgSend(v79, "setObject:atIndexedSubscript:", v81, v84);
          objc_msgSend(v12, "hiddenWeightsMomentumDescData");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "objectAtIndexedSubscript:", v52);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectAtIndexedSubscript:", v84);
          v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v68 = objc_msgSend(v67, "bytes");

          *(_QWORD *)(v68 + 136) = v55;
          v54 = 8 * (v86 << v20);

          ++v84;
        }
        while (v64 != 3);
        objc_msgSend(v12, "bnnsHiddenWeightsMomentumPointers");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:atIndexedSubscript:", v79, v52);

        ++v52;
      }
      while (v52 != v75);
      v11 = v73;
      if (v73)
      {
        v70 = 0;
        v71 = 3;
        do
        {
          setBiasOptimizerData(v12, v73, 0, v71 - 3, v70);
          setBiasOptimizerData(v12, v73, 1, v71 - 2, v70);
          setBiasOptimizerData(v12, v73, 2, v71 - 1, v70);
          setBiasOptimizerData(v12, v73, 3, v71, v70++);
          v71 += 4;
        }
        while (v75 != v70);
      }
    }
  }

  return 1;
}

@end
