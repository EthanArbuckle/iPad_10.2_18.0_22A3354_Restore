@implementation _MLCGPULSTM

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11
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
  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:descriptor:inputWeights:hiddenWeights:peepholeWeights:biasTerms:gateActivations:outputResultActivation:inferenceOnly:", v25, v24, v23, v22, v21, v20, v19, v18, v28);

  return v26;
}

- (_MLCGPULSTM)initWithDevice:(id)a3 descriptor:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 peepholeWeights:(id)a7 biasTerms:(id)a8 gateActivations:(id)a9 outputResultActivation:(id)a10 inferenceOnly:(BOOL)a11
{
  id v17;
  void *v18;
  _MLCGPULSTM *v19;
  _MLCGPULSTM *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
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
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  int v82;
  int v83;
  void *v84;
  double v85;
  int v86;
  int v87;
  void *v88;
  double v89;
  int v90;
  int v91;
  void *v92;
  double v93;
  void *v94;
  void *v95;
  uint64_t v96;
  __int128 v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t i;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  unint64_t v117;
  void *v118;
  void *v119;
  float v120;
  unint64_t v121;
  id v122;
  float v123;
  double v124;
  void *v125;
  void *v126;
  id v127;
  float v128;
  double v129;
  void *v130;
  void *v131;
  unint64_t v132;
  uint64_t v133;
  int v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  BOOL v174;
  BOOL v175;
  BOOL v176;
  NSObject *v177;
  void *v178;
  unint64_t v179;
  void *v180;
  _MLCGPULSTM *v181;
  void *v182;
  __int128 v184;
  id v186;
  void *v187;
  _MLCGPULSTM *v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  void *v194;
  void *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  int v202;
  uint64_t v203;
  unint64_t v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  uint64_t v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  uint64_t v237;
  void *v238;
  void *v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  uint64_t v243;
  void *v244;
  void *v245;
  uint64_t v246;
  int64x2_t v247;
  void *v248;
  unint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  uint64_t v253;
  void *v254;
  void *v255;
  objc_super v256;
  objc_super v257;
  _BYTE buf[24];
  uint64_t v259;

  v259 = *MEMORY[0x1E0C80C00];
  v191 = a3;
  v17 = a4;
  v193 = a5;
  v190 = a6;
  v189 = a7;
  v205 = a8;
  v192 = a9;
  v186 = a10;
  v257.receiver = self;
  v257.super_class = (Class)_MLCGPULSTM;
  v18 = v17;
  v19 = -[_MLCGPULSTM init](&v257, sel_init);
  v20 = v19;
  if (!v19)
    goto LABEL_88;
  v188 = v19;
  v187 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v203 = objc_msgSend(v17, "inputSize");
  v218 = objc_msgSend(v17, "hiddenSize");
  v204 = objc_msgSend(v17, "layerCount");
  v202 = objc_msgSend(v17, "isBidirectional");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v204 << v202);
  v197 = v17;
  v198 = v21;
  v249 = v204 << v202;
  if (v204 << v202)
  {
    v22 = 0;
    v23 = 3;
    do
    {
      if (v204 == v22)
        v24 = v202;
      else
        v24 = 0;
      if (!v22)
        v24 = 1;
      if (v24)
        v25 = v203;
      else
        v25 = v218;
      objc_msgSend(MEMORY[0x1E0CC6ED0], "createLSTMDescriptorWithInputFeatureChannels:outputFeatureChannels:", v25, v218);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:atIndexedSubscript:", v26, v22);

      objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setUseFloat32Weights:", 1);

      +[MLCConvolutionDescriptor descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:](MLCConvolutionDescriptor, "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 1, 1, v25, v218);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCConvolutionDescriptor descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:](MLCConvolutionDescriptor, "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", 1, 1, v218, v218);
      v246 = v23;
      v241 = objc_claimAutoreleasedReturnValue();
      v229 = v22;
      if (v205)
      {
        v28 = 4 * v22;
        objc_msgSend(v205, "objectAtIndexedSubscript:", v23 - 3);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (4 * v22) | 1;
        objc_msgSend(v205, "objectAtIndexedSubscript:", v23 - 2);
        v31 = objc_claimAutoreleasedReturnValue();
        v243 = v28 | 2;
        objc_msgSend(v205, "objectAtIndexedSubscript:", v23 - 1);
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        v231 = v28 | 3;
        v32 = (void *)v29;
        objc_msgSend(v205, "objectAtIndexedSubscript:", v23);
        v237 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v237 = 0;
        v250 = 0;
        v31 = 0;
        v32 = 0;
        v30 = v23 - 2;
        v243 = v23 - 1;
        v231 = v23;
      }
      v223 = v23 - 3;
      objc_msgSend(v193, "objectAtIndexedSubscript:", v23 - 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v227 = v32;
      +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:neuronDescriptor:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:neuronDescriptor:", v254, v32, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v225 = v30;
      objc_msgSend(v193, "objectAtIndexedSubscript:", v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v239 = (void *)v31;
      +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:neuronDescriptor:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:neuronDescriptor:", v254, v31, v36, v37);
      v38 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v193, "objectAtIndexedSubscript:", v243);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "objectAtIndexedSubscript:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:neuronDescriptor:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:neuronDescriptor:", v254, v250, v39, v40);
      v252 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v193, "objectAtIndexedSubscript:", v231);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "objectAtIndexedSubscript:", 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:neuronDescriptor:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:neuronDescriptor:", v254, v237, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (void *)v237;
      v233 = (void *)v38;
      v235 = (void *)v35;
      if (!v35)
      {
        v45 = (void *)v241;
LABEL_37:
        v46 = v239;
        v47 = v246;
        v48 = 1;
        goto LABEL_33;
      }
      v45 = (void *)v241;
      if (!v38)
        goto LABEL_37;
      v46 = v239;
      v47 = v246;
      v48 = 1;
      if (!v252 || !v43)
        goto LABEL_33;
      v216 = v43;
      objc_msgSend(v190, "objectAtIndexedSubscript:", v223);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v241, 0, v49);
      v50 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v190, "objectAtIndexedSubscript:", v30);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v241, 0, v51);
      v52 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v190, "objectAtIndexedSubscript:", v243);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v241, 0, v53);
      v221 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)v50;
      objc_msgSend(v190, "objectAtIndexedSubscript:", v231);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v241, 0, v55);
      v219 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 1;
      if (!v50)
      {
        v47 = v246;
        v43 = v216;
        v56 = (void *)v52;
        goto LABEL_32;
      }
      v56 = (void *)v52;
      if (!v52)
      {
        v47 = v246;
        v43 = v216;
        goto LABEL_32;
      }
      v47 = v246;
      v43 = v216;
      if (!v221 || !v219)
        goto LABEL_32;
      if (v189)
      {
        v213 = (void *)v52;
        objc_msgSend(v189, "objectAtIndexedSubscript:", v223);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v254, 0, v57);
        v58 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v189, "objectAtIndexedSubscript:", v225);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v254, 0, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v189, "objectAtIndexedSubscript:", v243);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v254, 0, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = (void *)v58;
        objc_msgSend(v189, "objectAtIndexedSubscript:", v231);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLCGPUWeightsConvolution weightWithDescriptor:biasTerms:weights:](_MLCGPUWeightsConvolution, "weightWithDescriptor:biasTerms:weights:", v254, 0, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = 1;
        if (!v63)
        {
          v47 = v246;
          v56 = v213;
          goto LABEL_31;
        }
        v66 = v198;
        if (!v60)
        {
          v47 = v246;
          v56 = v213;
          goto LABEL_31;
        }
        v47 = v246;
        v56 = v213;
        if (!v62 || !v65)
          goto LABEL_31;
      }
      else
      {
        v65 = 0;
        v62 = 0;
        v60 = 0;
        v63 = 0;
        v66 = v198;
      }
      v244 = v65;
      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setInputGateInputWeights:", v235);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setInputGateRecurrentWeights:", v54);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setInputGateMemoryWeights:", v63);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setForgetGateInputWeights:", v233);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setForgetGateRecurrentWeights:", v56);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setForgetGateMemoryWeights:", v60);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setCellGateInputWeights:", v252);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setCellGateRecurrentWeights:", v221);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setCellGateMemoryWeights:", v62);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setOutputGateInputWeights:", v216);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setOutputGateRecurrentWeights:", v219);

      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setOutputGateMemoryWeights:", v65);

      v79 = +[_MLCGPUNeuron mpsNeurontypeFrom:](_MLCGPUNeuron, "mpsNeurontypeFrom:", objc_msgSend(v186, "activationType"));
      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v80 = v56;
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setCellToOutputNeuronType:", v79);

      v56 = v80;
      objc_msgSend(v186, "a");
      v83 = v82;
      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v85) = v83;
      objc_msgSend(v84, "setCellToOutputNeuronParamA:", v85);

      objc_msgSend(v186, "b");
      v87 = v86;
      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v89) = v87;
      objc_msgSend(v88, "setCellToOutputNeuronParamB:", v89);

      objc_msgSend(v186, "c");
      v91 = v90;
      objc_msgSend(v66, "objectAtIndexedSubscript:", v229);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v93) = v91;
      objc_msgSend(v92, "setCellToOutputNeuronParamC:", v93);

      v65 = v244;
      v48 = 0;
LABEL_31:

      v46 = v239;
      v45 = (void *)v241;
      v44 = (void *)v237;
LABEL_32:

LABEL_33:
      v18 = v197;
      v21 = v198;
      if (v48)
        goto LABEL_86;
      v22 = v229 + 1;
      v23 = v47 + 4;
    }
    while (v249 != v229 + 1);
  }
  v94 = v191;
  objc_msgSend(v191, "deviceList");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "count");

  if (!v96)
  {
LABEL_87:
    v182 = (void *)objc_msgSend(v187, "copy");
    v20 = v188;
    v256.receiver = v188;
    v256.super_class = (Class)_MLCGPULSTM;
    -[_MLCGPULayer setDeviceOps:](&v256, sel_setDeviceOps_, v182);

LABEL_88:
    v181 = v20;
    goto LABEL_89;
  }
  v98 = 0;
  v253 = 4 * v218;
  v201 = 4 * v218 * v218;
  v99 = (void *)MEMORY[0x1E0C9AA60];
  *(_QWORD *)&v97 = 138412546;
  v184 = v97;
  while (1)
  {
    v200 = (void *)objc_msgSend(v99, "mutableCopy", v184);
    objc_msgSend(v94, "deviceList");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = v98;
    objc_msgSend(v100, "objectAtIndexedSubscript:", v98);
    v255 = (void *)objc_claimAutoreleasedReturnValue();

    v209 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v249);
    v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v249);
    v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v249);
    v208 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v249);
    v207 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v249);
    v206 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v249);
    if (v249)
    {
      for (i = 0; i != v249; ++i)
      {
        v104 = (void *)objc_msgSend(v99, "mutableCopy");
        objc_msgSend(v209, "setObject:atIndexedSubscript:", v104, i);

        v105 = (void *)objc_msgSend(v99, "mutableCopy");
        objc_msgSend(v101, "setObject:atIndexedSubscript:", v105, i);

        v106 = (void *)objc_msgSend(v99, "mutableCopy");
        objc_msgSend(v102, "setObject:atIndexedSubscript:", v106, i);

        v107 = (void *)objc_msgSend(v99, "mutableCopy");
        objc_msgSend(v208, "setObject:atIndexedSubscript:", v107, i);

        v108 = (void *)objc_msgSend(v99, "mutableCopy");
        objc_msgSend(v207, "setObject:atIndexedSubscript:", v108, i);

        v109 = (void *)objc_msgSend(v99, "mutableCopy");
        objc_msgSend(v206, "setObject:atIndexedSubscript:", v109, i);

        v110 = objc_alloc(MEMORY[0x1E0CC7228]);
        objc_msgSend(v21, "objectAtIndexedSubscript:", i);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "objectAtIndexedSubscript:", i);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = (void *)objc_msgSend(v110, "initWithDevice:rnnDescriptor:trainableWeights:", v255, v111, v112);

        if (v113)
        {
          objc_msgSend(v101, "objectAtIndexedSubscript:", i);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "createWeightGradientMatrices:dataType:", v114, 268435488);

          objc_msgSend(v102, "objectAtIndexedSubscript:", i);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "createWeightGradientMatrices:dataType:", v115, 268435488);

          objc_msgSend(v200, "addObject:", v113);
        }

      }
    }
    v194 = v102;
    v199 = (void *)objc_msgSend(v200, "copy");
    +[MLCRNNGPUDeviceOps deviceOpsWithForwardKernel:gradientKernel:](MLCRNNGPUDeviceOps, "deviceOpsWithForwardKernel:gradientKernel:");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = v101;
    objc_msgSend(v251, "setRnnTrainableWeightGradients:", v101);
    objc_msgSend(v94, "deviceList");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v116, "count");

    if (v117 > 1)
    {
      +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:](MLCMultiGPUDeviceOps, "multiGPUDeviceOpsWithGPUDeviceOps:", v251);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "setLstmMultiGPUChildOps:", v118);

      objc_msgSend(v251, "lstmMultiGPUChildOps");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      GPU_AllocateResourceForMultiGPUTraining(v94, v119, MEMORY[0x1E0C9AA60], v196);

    }
    if (!a11)
    {
      objc_msgSend(v18, "dropout");
      if (v120 > 0.0 && v204 >= 2)
      {
        objc_msgSend(v18, "dropout");
        objc_msgSend(v251, "setLstmDropout:");
        v121 = v204 - 1;
        do
        {
          v122 = objc_alloc(MEMORY[0x1E0CC6CF0]);
          objc_msgSend(v18, "dropout");
          v247 = vdupq_n_s64(1uLL);
          *(float *)&v124 = 1.0 - v123;
          *(int64x2_t *)buf = v247;
          *(_QWORD *)&buf[16] = 1;
          v125 = (void *)objc_msgSend(v122, "initWithDevice:keepProbability:seed:maskStrideInPixels:", v255, 0, buf, v124);
          objc_msgSend(v251, "lstmDropoutForwardKernel");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "addObject:", v125);

          v127 = objc_alloc(MEMORY[0x1E0CC6CF8]);
          objc_msgSend(v18, "dropout");
          *(float *)&v129 = 1.0 - v128;
          *(int64x2_t *)buf = v247;
          *(_QWORD *)&buf[16] = 1;
          v130 = (void *)objc_msgSend(v127, "initWithDevice:keepProbability:seed:maskStrideInPixels:", v255, 0, buf, v129);
          objc_msgSend(v251, "lstmDropoutGradientKernel");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "addObject:", v130);

          --v121;
        }
        while (v121);
      }
    }
    v132 = 0x1E0CC6000uLL;
    if (v249)
    {
      v133 = 0;
      do
      {
        if (v204 == v133)
          v134 = v202;
        else
          v134 = 0;
        v240 = v133;
        if (!v133)
          v134 = 1;
        if (v134)
          v135 = v203;
        else
          v135 = v218;
        objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v218, v135, 4 * v135, 268435488);
        v136 = objc_claimAutoreleasedReturnValue();
        v137 = v253 * v135;
        v138 = objc_msgSend(v255, "newBufferWithLength:options:", v137, 0);
        v139 = objc_msgSend(v255, "newBufferWithLength:options:", v137, 0);
        v140 = objc_msgSend(v255, "newBufferWithLength:options:", v137, 0);
        v141 = objc_msgSend(v255, "newBufferWithLength:options:", v137, 0);
        v245 = (void *)v138;
        v142 = objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v138, v136);
        v242 = (void *)v139;
        v143 = objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v139, v136);
        v236 = (void *)v140;
        v144 = objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v140, v136);
        v238 = (void *)v141;
        v248 = (void *)v136;
        v145 = objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v141, v136);
        objc_msgSend(v251, "rnnExportedInputWeightGradientMatrices");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v224 = (void *)v142;
        objc_msgSend(v146, "addObject:", v142);

        objc_msgSend(v251, "rnnExportedInputWeightGradientMatrices");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v234 = (void *)v143;
        objc_msgSend(v147, "addObject:", v143);

        objc_msgSend(v251, "rnnExportedInputWeightGradientMatrices");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v232 = (void *)v144;
        objc_msgSend(v148, "addObject:", v144);

        objc_msgSend(v251, "rnnExportedInputWeightGradientMatrices");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v230 = (void *)v145;
        objc_msgSend(v149, "addObject:", v145);

        objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v218, v218, v253, 268435488);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = (void *)objc_msgSend(v255, "newBufferWithLength:options:", v201, 0);
        v152 = objc_msgSend(v255, "newBufferWithLength:options:", v201, 0);
        v153 = objc_msgSend(v255, "newBufferWithLength:options:", v201, 0);
        v154 = (void *)objc_msgSend(v255, "newBufferWithLength:options:", v201, 0);
        v155 = objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v151, v150);
        v228 = (void *)v152;
        v156 = (void *)objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v152, v150);
        v226 = (void *)v153;
        v157 = (void *)objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v153, v150);
        v158 = objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v154, v150);
        objc_msgSend(v251, "rnnExportedHiddenWeightGradientMatrices");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v222 = (void *)v155;
        objc_msgSend(v159, "addObject:", v155);

        objc_msgSend(v251, "rnnExportedHiddenWeightGradientMatrices");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "addObject:", v156);

        objc_msgSend(v251, "rnnExportedHiddenWeightGradientMatrices");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "addObject:", v157);

        objc_msgSend(v251, "rnnExportedHiddenWeightGradientMatrices");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v220 = (void *)v158;
        objc_msgSend(v162, "addObject:", v158);

        if (v205)
        {
          objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, v218, v253, 268435488);
          v215 = v154;
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          v212 = (void *)objc_msgSend(v255, "newBufferWithLength:options:", v253, 0);
          v211 = (void *)objc_msgSend(v255, "newBufferWithLength:options:", v253, 0);
          v210 = (void *)objc_msgSend(v255, "newBufferWithLength:options:", v253, 0);
          v214 = v156;
          v164 = (void *)objc_msgSend(v255, "newBufferWithLength:options:", v253, 0);
          v165 = (void *)objc_msgSend(objc_alloc(*(Class *)(v132 + 3800)), "initWithBuffer:descriptor:", v212, v163);
          v217 = v151;
          v166 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v211, v163);
          v167 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v210, v163);
          v168 = v157;
          v169 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v164, v163);
          objc_msgSend(v251, "rnnExportedBiasGradientMatrices");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "addObject:", v165);

          objc_msgSend(v251, "rnnExportedBiasGradientMatrices");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "addObject:", v166);

          objc_msgSend(v251, "rnnExportedBiasGradientMatrices");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "addObject:", v167);

          objc_msgSend(v251, "rnnExportedBiasGradientMatrices");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "addObject:", v169);

          v157 = v168;
          v132 = 0x1E0CC6000;
          v151 = v217;

          v156 = v214;
          v154 = v215;
        }

        v133 = v240 + 1;
      }
      while (v249 != v240 + 1);
    }
    objc_msgSend(v251, "setRnnTrainableWeights:", v209);
    objc_msgSend(v251, "setRnnMomentumMatrices:", v194);
    objc_msgSend(v251, "setRnnVelocityMatrices:", v208);
    objc_msgSend(v251, "setRnnCenterWeightMatrices:", v207);
    objc_msgSend(v251, "setRnnTrainableStates:", v206);
    v174 = !v199 || v200 == 0;
    v175 = v174 || v251 == 0;
    v176 = !v175;
    if (v175)
    {
      +[MLCLog framework](MLCLog, "framework");
      v177 = objc_claimAutoreleasedReturnValue();
      v18 = v197;
      v21 = v198;
      if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v184;
        *(_QWORD *)&buf[4] = v180;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v255;
        _os_log_error_impl(&dword_1D4999000, v177, OS_LOG_TYPE_ERROR, "%@: Unable to create gpuOps for LSTM layer for device %@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v251, "setLayer:", v188);
      objc_msgSend(v187, "addObject:", v251);
      v18 = v197;
      objc_msgSend(v251, "setIsBidirectional:", objc_msgSend(v197, "isBidirectional"));
      objc_msgSend(v251, "setBatchFirst:", objc_msgSend(v197, "batchFirst"));
      objc_msgSend(v251, "setReturnsSequences:", objc_msgSend(v197, "returnsSequences"));
      objc_msgSend(v251, "setHiddenSize:", objc_msgSend(v197, "hiddenSize"));
      objc_msgSend(v251, "setInputSize:", objc_msgSend(v197, "inputSize"));
      objc_msgSend(v251, "setNumLayers:", objc_msgSend(v197, "layerCount"));
      objc_msgSend(v251, "setSourceOfForwardNeededForGradient:", 1);
      objc_msgSend(v251, "setResultOfForwardNeededForGradient:", 0);
      v21 = v198;
    }

    if (!v176)
      break;
    v98 = v196 + 1;
    v94 = v191;
    objc_msgSend(v191, "deviceList");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend(v178, "count");

    v99 = (void *)MEMORY[0x1E0C9AA60];
    if (v196 + 1 >= v179)
      goto LABEL_87;
  }
LABEL_86:

  v181 = 0;
  v20 = v188;
LABEL_89:

  return v181;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
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
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  unint64_t v104;
  id v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  unint64_t v128;

  v106 = a1;
  v9 = a3;
  v108 = a4;
  v10 = a5;
  v107 = a6;
  objc_msgSend(v9, "deviceList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    v119 = v10;
    v120 = v9;
    do
    {
      objc_msgSend(v108, "objectAtIndexedSubscript:", v13, v106);
      v128 = v13;
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v127, "batchFirst"))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "descriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shape");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        v18 = 3;
        if (v17 != 4)
          v18 = 1;
        v125 = v18;
        v19 = 1;
        if (v17 != 4)
          v19 = 2;
        v121 = 0;
        v123 = v19;
      }
      else
      {
        v123 = 2;
        v125 = 0;
        v121 = 1;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "descriptor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "shape");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "objectAtIndexedSubscript:", v121);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v109, "unsignedIntegerValue");
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "descriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shape");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v123);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "unsignedIntegerValue");
      v26 = v10;
      v27 = v25;
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "descriptor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "shape");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v125);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 4 * v20 * v27 * objc_msgSend(v31, "unsignedIntegerValue");

      objc_msgSend(v120, "deviceList");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", v128);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(v34, "newBufferWithLength:options:", v32, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

      objc_msgSend(v120, "deviceList");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", v128);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v36, "newBufferWithLength:options:", v32, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

      objc_msgSend(v107, "descriptor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "shape");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "objectAtIndexedSubscript:", v121);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "unsignedIntegerValue");
      objc_msgSend(v107, "descriptor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "shape");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", v123);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "unsignedIntegerValue");
      objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "descriptor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "shape");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", v125);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 4 * v38 * v42 * objc_msgSend(v46, "unsignedIntegerValue");

      v48 = (void *)v118;
      v49 = v128;

      v9 = v120;
      objc_msgSend(v120, "deviceList");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectAtIndexedSubscript:", v128);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(v51, "newBufferWithLength:options:", v47, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

      objc_msgSend(v120, "deviceList");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectAtIndexedSubscript:", v128);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions");
      v56 = v47;
      v57 = (void *)v116;
      v58 = (void *)objc_msgSend(v54, "newBufferWithLength:options:", v56, v55);

      v59 = v127;
      objc_msgSend(v127, "rnnBuffers");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addObject:", v118);

      objc_msgSend(v127, "rnnBuffers");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v52);

      objc_msgSend(v127, "rnnBuffers");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "addObject:", v58);

      objc_msgSend(v127, "rnnBuffers");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addObject:", v116);

      if (objc_msgSend(v127, "isBidirectional"))
      {
        v114 = v58;
        objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "descriptor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "shape");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectAtIndexedSubscript:", v121);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "unsignedIntegerValue");

        objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "descriptor");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "shape");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", v123);
        v124 = v52;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "unsignedIntegerValue");

        objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "descriptor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "shape");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectAtIndexedSubscript:", v125);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "unsignedIntegerValue");

        objc_msgSend(v120, "deviceList");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "objectAtIndexedSubscript:", v128);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v78 * v73;
        v82 = 4 * v78 * v73;
        v83 = objc_msgSend(v80, "newBufferWithLength:options:", v82 * v68, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

        objc_msgSend(v127, "rnnBuffers");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = (void *)v83;
        objc_msgSend(v84, "addObject:", v83);

        objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v68, v78 * v73, v82, 268435488);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v83, v122);
        objc_msgSend(v120, "deviceList");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectAtIndexedSubscript:", v128);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (void *)objc_msgSend(v86, "newBufferWithLength:options:", v82 * v68, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));

        objc_msgSend(v127, "rnnBuffers");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addObject:", v87);

        v89 = v68;
        objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v68, v81, v82, 268435488);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6ED8]), "initWithBuffer:descriptor:", v87, v90);
        objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v89, v81, v82, 268435488);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_alloc(MEMORY[0x1E0CC6ED8]);
        objc_msgSend(v127, "rnnBuffers");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "objectAtIndexedSubscript:", 3);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = (void *)objc_msgSend(v93, "initWithBuffer:descriptor:", v95, v92);

        v97 = objc_alloc(MEMORY[0x1E0CC6F48]);
        objc_msgSend(v120, "deviceList");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "objectAtIndexedSubscript:", v128);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v81;
        v49 = v128;
        v101 = (void *)objc_msgSend(v97, "initWithDevice:count:rows:columns:transpose:", v99, 2, v89, v100, 0);
        objc_msgSend(v127, "setBiDirectionalSumKernel:", v101);

        v58 = v114;
        v59 = v127;

        v9 = v120;
        objc_msgSend(v127, "setForwardTimeGradientResult:", v111);
        objc_msgSend(v127, "setReverseTimeGradientResult:", v91);
        objc_msgSend(v127, "setBiDirectionalGradientResult:", v96);

        v48 = (void *)v118;
        v57 = (void *)v116;

        v52 = v124;
      }
      v102 = (void *)objc_opt_new();
      objc_msgSend(v59, "setLayer:", v102);

      v13 = v49 + 1;
      objc_msgSend(v9, "deviceList");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v103, "count");

      v10 = v119;
    }
    while (v13 < v104);
  }

  return 1;
}

+ (void)setOptimizerDataForMomentumMatrices:(id)a3 velocityMatrices:(id)a4 centerWeightMatrices:(id)a5 momentumArray:(id)a6 velocityArray:(id)a7 centerWeightArray:(id)a8 accumulatorIndex:(unint64_t)a9 matrixId:(unint64_t)a10 weight:(id)a11 device:(id)a12 deviceOps:(id)a13 deviceNumber:(unint64_t)a14 lstmNumber:(unint64_t)a15 isRecurrent:(BOOL)a16
{
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[4];

  v75 = a3;
  v74 = a4;
  v21 = a5;
  v76 = a6;
  v73 = a7;
  v72 = a8;
  v22 = a11;
  v23 = a13;
  objc_msgSend(a12, "gpuCommandBufferList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", a14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectAtIndexedSubscript:", a14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "gradientKernel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hiddenSize");
  v28 = objc_msgSend(v26, "inputSize");
  if (a16 || (v29 = v28, a15 % objc_msgSend(v26, "numLayers")))
  {
    v30 = a14;
    v29 = objc_msgSend(v26, "hiddenSize");
  }
  else
  {
    v30 = a14;
  }
  objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v27, v29, 4 * v29, 268435488);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "optimizerData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    v68 = v26;
    v69 = v21;
    objc_msgSend(v22, "optimizerDeviceData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "momentumVectors");
    v36 = v22;
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = objc_alloc(MEMORY[0x1E0CC6ED8]);
    objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "data");
    v71 = v25;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v38, "initWithBuffer:descriptor:", v40, v31);

    v25 = v71;
    objc_msgSend(v77, "objectAtIndexedSubscript:", a15);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v80, 0, 24);
    objc_msgSend(v42, "encodeCopyWeightsToCommandBuffer:weights:matrixId:matrix:copyFromWeightsToMatrix:matrixOffset:", v71, v75, a10, v41, 0, v80);

    objc_msgSend(v76, "setObject:atIndexedSubscript:", v41, a9);
    v70 = v36;
    objc_msgSend(v36, "optimizerData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");

    if (v44 >= 2)
    {
      v67 = v37;
      objc_msgSend(v36, "optimizerDeviceData");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v30;
      objc_msgSend(v45, "objectAtIndexedSubscript:", v30);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "velocityVectors");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = objc_alloc(MEMORY[0x1E0CC6ED8]);
      v66 = v47;
      objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "data");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v48, "initWithBuffer:descriptor:", v50, v31);

      if (!objc_msgSend(v74, "count"))
      {
        objc_msgSend(v77, "objectAtIndexedSubscript:", a15);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "createWeightGradientMatrices:dataType:", v74, 268435488);

      }
      objc_msgSend(v77, "objectAtIndexedSubscript:", a15);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v79, 0, sizeof(v79));
      objc_msgSend(v53, "encodeCopyWeightsToCommandBuffer:weights:matrixId:matrix:copyFromWeightsToMatrix:matrixOffset:", v71, v74, a10, v51, 0, v79);

      objc_msgSend(v73, "setObject:atIndexedSubscript:", v51, a9);
      objc_msgSend(v36, "optimizerData");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

      if (v55 >= 3)
      {
        objc_msgSend(v36, "optimizerDeviceData");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectAtIndexedSubscript:", v65);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "centerWeightVectors");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = objc_alloc(MEMORY[0x1E0CC6ED8]);
        objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "data");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v59, "initWithBuffer:descriptor:", v61, v31);

        if (!objc_msgSend(v69, "count"))
        {
          objc_msgSend(v77, "objectAtIndexedSubscript:", a15);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "createWeightGradientMatrices:dataType:", v69, 268435488);

        }
        objc_msgSend(v77, "objectAtIndexedSubscript:", a15);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        memset(v78, 0, sizeof(v78));
        objc_msgSend(v64, "encodeCopyWeightsToCommandBuffer:weights:matrixId:matrix:copyFromWeightsToMatrix:matrixOffset:", v71, v69, a10, v62, 0, v78);

        objc_msgSend(v72, "setObject:atIndexedSubscript:", v62, a9);
      }

      v25 = v71;
      v37 = v67;
    }

    v26 = v68;
    v21 = v69;
    v22 = v70;
  }

}

+ (void)setBiasOptimizerDataForMomentumMatrices:(id)a3 velocityMatrices:(id)a4 centerWeightMatrices:(id)a5 momentumArray:(id)a6 velocityArray:(id)a7 centerWeightArray:(id)a8 accumulatorIndex:(unint64_t)a9 matrixId:(unint64_t)a10 bias:(id)a11 device:(id)a12 deviceOps:(id)a13 deviceNumber:(unint64_t)a14 lstmNumber:(unint64_t)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[4];

  v20 = a3;
  v21 = a4;
  v68 = a5;
  v22 = a6;
  v69 = a7;
  v67 = a8;
  v23 = a11;
  v24 = a13;
  objc_msgSend(a12, "gpuCommandBufferList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", a14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "objectAtIndexedSubscript:", a14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "gradientKernel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v27;
  v29 = objc_msgSend(v27, "hiddenSize");
  objc_msgSend(MEMORY[0x1E0CC6F00], "matrixDescriptorWithRows:columns:rowBytes:dataType:", 1, v29, 4 * v29, 268435488);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "optimizerData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    v64 = v21;
    v62 = v20;
    v65 = v22;
    objc_msgSend(v23, "optimizerDeviceData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", a14);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "momentumVectors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_alloc(MEMORY[0x1E0CC6ED8]);
    v61 = v35;
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "data");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v36, "initWithBuffer:descriptor:", v38, v30);

    v63 = v28;
    objc_msgSend(v28, "objectAtIndexedSubscript:", a15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v72, 0, 24);
    objc_msgSend(v40, "encodeCopyWeightsToCommandBuffer:weights:matrixId:matrix:copyFromWeightsToMatrix:matrixOffset:", v26, v20, a10, v39, 0, v72);

    objc_msgSend(v22, "setObject:atIndexedSubscript:", v39, a9);
    objc_msgSend(v23, "optimizerData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v42 >= 2)
    {
      objc_msgSend(v23, "optimizerDeviceData");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndexedSubscript:", a14);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "velocityVectors");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_alloc(MEMORY[0x1E0CC6ED8]);
      objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "data");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v46, "initWithBuffer:descriptor:", v48, v30);

      objc_msgSend(v63, "objectAtIndexedSubscript:", a15);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v71, 0, sizeof(v71));
      objc_msgSend(v50, "encodeCopyWeightsToCommandBuffer:weights:matrixId:matrix:copyFromWeightsToMatrix:matrixOffset:", v26, v64, a10, v49, 0, v71);

      objc_msgSend(v69, "setObject:atIndexedSubscript:", v49, a9);
      objc_msgSend(v23, "optimizerData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");

      if (v52 >= 3)
      {
        objc_msgSend(v23, "optimizerDeviceData");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectAtIndexedSubscript:", a14);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "centerWeightVectors");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = objc_alloc(MEMORY[0x1E0CC6ED8]);
        objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "data");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (void *)objc_msgSend(v56, "initWithBuffer:descriptor:", v58, v30);

        objc_msgSend(v63, "objectAtIndexedSubscript:", a15);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        memset(v70, 0, sizeof(v70));
        objc_msgSend(v60, "encodeCopyWeightsToCommandBuffer:weights:matrixId:matrix:copyFromWeightsToMatrix:matrixOffset:", v26, v68, a10, v59, 0, v70);

        objc_msgSend(v67, "setObject:atIndexedSubscript:", v59, a9);
      }

      v20 = v62;
    }

    v21 = v64;
    v22 = v65;
    v28 = v63;
  }

}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 biasTerms:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "deviceList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = 0;
    v74 = v13;
    v75 = v12;
    v72 = a1;
    v64 = v15;
    v65 = v14;
    v62 = v16;
    do
    {
      v78 = v19;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "gradientKernel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v21, "count");
      v22 = objc_msgSend(v14, "count");
      v23 = objc_msgSend(v15, "count") + v22;
      v60 = v21;
      if (v16)
        v23 += objc_msgSend(v16, "count");
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v23);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v23);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        v25 = 0;
        v26 = 0;
        v66 = 0;
        v73 = v20;
        v79 = v24;
        do
        {
          v80 = v25;
          for (i = 0; i != 4; ++i)
          {
            objc_msgSend(v20, "rnnMomentumMatrices");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectAtIndexedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "rnnVelocityMatrices");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectAtIndexedSubscript:", v26);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "rnnCenterWeightMatrices");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndexedSubscript:", v26);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1E9844B28, "objectAtIndexedSubscript:", i);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "unsignedIntegerValue");
            objc_msgSend(v65, "objectAtIndexedSubscript:", v80 + i);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v59) = 0;
            objc_msgSend(v72, "setOptimizerDataForMomentumMatrices:velocityMatrices:centerWeightMatrices:momentumArray:velocityArray:centerWeightArray:accumulatorIndex:matrixId:weight:device:deviceOps:deviceNumber:lstmNumber:isRecurrent:", v28, v30, v32, v79, v77, v76, v66 + i, v34, v35, v75, v74, v78, v26, v59);

            v20 = v73;
          }
          for (j = 0; j != 4; ++j)
          {
            objc_msgSend(v20, "rnnMomentumMatrices");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "objectAtIndexedSubscript:", v26);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "rnnVelocityMatrices");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectAtIndexedSubscript:", v26);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "rnnCenterWeightMatrices");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndexedSubscript:", v26);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1E9844B40, "objectAtIndexedSubscript:", j);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "unsignedIntegerValue");
            objc_msgSend(v64, "objectAtIndexedSubscript:", v80 + j);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v59) = 1;
            objc_msgSend(v72, "setOptimizerDataForMomentumMatrices:velocityMatrices:centerWeightMatrices:momentumArray:velocityArray:centerWeightArray:accumulatorIndex:matrixId:weight:device:deviceOps:deviceNumber:lstmNumber:isRecurrent:", v67, v38, v40, v79, v77, v76, v66 + 4 + j, v42, v43, v75, v74, v78, v26, v59);

            v20 = v73;
          }
          v44 = v66 + 8;
          v16 = v62;
          v63 = v26;
          if (v62)
          {
            for (k = 0; k != 4; ++k)
            {
              objc_msgSend(v20, "rnnMomentumMatrices");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "objectAtIndexedSubscript:", v63);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "rnnVelocityMatrices");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectAtIndexedSubscript:", v63);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "rnnCenterWeightMatrices");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "objectAtIndexedSubscript:", v63);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(&unk_1E9844B58, "objectAtIndexedSubscript:", k);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "unsignedIntegerValue");
              objc_msgSend(v16, "objectAtIndexedSubscript:", v80 + k);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v79;
              objc_msgSend(v72, "setBiasOptimizerDataForMomentumMatrices:velocityMatrices:centerWeightMatrices:momentumArray:velocityArray:centerWeightArray:accumulatorIndex:matrixId:bias:device:deviceOps:deviceNumber:lstmNumber:", v68, v47, v49, v79, v77, v76, v44, v51, v52, v75, v74, v78, v63);

              v16 = v62;
              v20 = v73;

              ++v44;
            }
          }
          else
          {
            v24 = v79;
          }
          v66 = v44;
          v26 = v63 + 1;
          v25 = v80 + 4;
        }
        while (v63 + 1 != v61);
      }
      v53 = (void *)objc_msgSend(v24, "copy");
      objc_msgSend(v20, "setMomentumVectors:", v53);

      v54 = (void *)objc_msgSend(v77, "copy");
      objc_msgSend(v20, "setVelocityVectors:", v54);

      v55 = (void *)objc_msgSend(v76, "copy");
      objc_msgSend(v20, "setCenterWeightVectors:", v55);

      v19 = v78 + 1;
      v12 = v75;
      objc_msgSend(v75, "deviceList");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "count");

      v13 = v74;
      v15 = v64;
      v14 = v65;
    }
    while (v78 + 1 < v57);
  }

  return 1;
}

@end
